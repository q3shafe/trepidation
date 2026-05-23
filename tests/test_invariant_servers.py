import pytest
from collections import defaultdict
import threading
import time


# Simulated address map registry (mimicking the vulnerable C pattern in Python)
class AddrmapRegistry:
    """Simulates the Sv_InsertAddrmapIntoList behavior with a linked list."""
    
    MAX_ENTRIES = 1000  # Security invariant: must enforce a maximum
    RATE_LIMIT_WINDOW = 1.0  # seconds
    RATE_LIMIT_MAX = 100  # max entries per IP per window
    
    def __init__(self, enforce_limits=True):
        self.entries = []
        self.enforce_limits = enforce_limits
        self.ip_timestamps = defaultdict(list)
        self._lock = threading.Lock()
    
    def insert_addrmap(self, from_addr: str, to_addr: str) -> bool:
        """Insert an address map entry. Returns True if inserted, False if rejected."""
        with self._lock:
            if self.enforce_limits:
                # Check global size limit
                if len(self.entries) >= self.MAX_ENTRIES:
                    return False
                
                # Check per-IP rate limit
                now = time.time()
                self.ip_timestamps[from_addr] = [
                    t for t in self.ip_timestamps[from_addr]
                    if now - t < self.RATE_LIMIT_WINDOW
                ]
                if len(self.ip_timestamps[from_addr]) >= self.RATE_LIMIT_MAX:
                    return False
                
                self.ip_timestamps[from_addr].append(now)
            
            self.entries.append({"from": from_addr, "to": to_addr})
            return True
    
    def size(self) -> int:
        return len(self.entries)


# Adversarial payloads: (from_addr, to_addr, count) tuples
ADVERSARIAL_PAYLOADS = [
    # Single IP flooding with many registrations
    ("192.168.1.1:27960", "10.0.0.1:27960", 5000),
    # Multiple IPs each flooding
    ("1.2.3.4:1234", "5.6.7.8:5678", 2000),
    # Localhost flooding
    ("127.0.0.1:27960", "127.0.0.2:27960", 10000),
    # IPv6-like addresses flooding
    ("::1:27960", "::2:27960", 3000),
    # Broadcast-like address flooding
    ("255.255.255.255:27960", "0.0.0.0:27960", 1500),
    # Malformed/long address strings
    ("A" * 256 + ":27960", "B" * 256 + ":27960", 500),
    # Empty-ish addresses
    (":0", ":0", 2000),
    # Null-byte-like in string
    ("192.168.0.1\x00:27960", "10.0.0.1\x00:27960", 1000),
    # Unicode addresses
    ("192.168.1.1\u202e:27960", "10.0.0.1:27960", 1000),
    # Rapid sequential IPs
    ("10.0.0.1:27960", "10.0.0.2:27960", 4000),
]


@pytest.mark.parametrize("from_addr,to_addr,flood_count", ADVERSARIAL_PAYLOADS)
def test_addrmap_registry_bounded_under_flood(from_addr, to_addr, flood_count):
    """Invariant: The address map registry must never grow beyond a maximum size limit,
    regardless of how many adversarial registration requests are submitted.
    Memory usage must remain bounded even under flood attacks."""
    
    registry = AddrmapRegistry(enforce_limits=True)
    
    # Flood the registry with adversarial inputs
    accepted = 0
    rejected = 0
    for _ in range(flood_count):
        result = registry.insert_addrmap(from_addr, to_addr)
        if result:
            accepted += 1
        else:
            rejected += 1
    
    # INVARIANT 1: Registry size must never exceed the maximum allowed entries
    assert registry.size() <= AddrmapRegistry.MAX_ENTRIES, (
        f"SECURITY VIOLATION: Registry grew to {registry.size()} entries, "
        f"exceeding maximum of {AddrmapRegistry.MAX_ENTRIES}. "
        f"Flood of {flood_count} requests from '{from_addr}' caused unbounded growth."
    )
    
    # INVARIANT 2: At least some requests must have been rejected when flooding
    if flood_count > AddrmapRegistry.MAX_ENTRIES:
        assert rejected > 0, (
            f"SECURITY VIOLATION: No requests were rejected despite {flood_count} "
            f"flood attempts exceeding the limit of {AddrmapRegistry.MAX_ENTRIES}."
        )
    
    # INVARIANT 3: Accepted count must not exceed the maximum
    assert accepted <= AddrmapRegistry.MAX_ENTRIES, (
        f"SECURITY VIOLATION: Accepted {accepted} entries, "
        f"exceeding maximum of {AddrmapRegistry.MAX_ENTRIES}."
    )


@pytest.mark.parametrize("num_ips,requests_per_ip", [
    (100, 200),
    (500, 50),
    (10, 1000),
    (1000, 10),
    (50, 500),
])
def test_addrmap_registry_bounded_under_distributed_flood(num_ips, requests_per_ip):
    """Invariant: Even distributed flood attacks from many IPs must not cause
    unbounded memory growth in the address map registry."""
    
    registry = AddrmapRegistry(enforce_limits=True)
    
    total_requests = num_ips * requests_per_ip
    accepted = 0
    
    for i in range(num_ips):
        from_addr = f"10.{(i // 256) % 256}.{i % 256}.1:27960"
        to_addr = f"192.168.{i % 256}.1:27960"
        for _ in range(requests_per_ip):
            if registry.insert_addrmap(from_addr, to_addr):
                accepted += 1
    
    # INVARIANT: Total size must remain bounded regardless of distributed attack
    assert registry.size() <= AddrmapRegistry.MAX_ENTRIES, (
        f"SECURITY VIOLATION: Distributed flood from {num_ips} IPs "
        f"({requests_per_ip} requests each, {total_requests} total) "
        f"caused registry to grow to {registry.size()} entries, "
        f"exceeding maximum of {AddrmapRegistry.MAX_ENTRIES}."
    )
    
    assert accepted <= AddrmapRegistry.MAX_ENTRIES, (
        f"SECURITY VIOLATION: Accepted {accepted} entries from distributed flood, "
        f"exceeding maximum of {AddrmapRegistry.MAX_ENTRIES}."
    )


def test_addrmap_registry_concurrent_flood():
    """Invariant: Concurrent flood attacks from multiple threads must not
    cause the registry to exceed its size limit due to race conditions."""
    
    registry = AddrmapRegistry(enforce_limits=True)
    num_threads = 20
    requests_per_thread = 500
    
    def flood_worker(thread_id):
        from_addr = f"10.0.{thread_id}.1:27960"
        to_addr = f"192.168.{thread_id}.1:27960"
        for _ in range(requests_per_thread):
            registry.insert_addrmap(from_addr, to_addr)
    
    threads = [
        threading.Thread(target=flood_worker, args=(i,))
        for i in range(num_threads)
    ]
    
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    
    # INVARIANT: Concurrent access must not bypass size limits
    assert registry.size() <= AddrmapRegistry.MAX_ENTRIES, (
        f"SECURITY VIOLATION: Concurrent flood from {num_threads} threads "
        f"caused registry to grow to {registry.size()} entries, "
        f"exceeding maximum of {AddrmapRegistry.MAX_ENTRIES}. "
        f"Possible race condition in size enforcement."
    )


@pytest.mark.parametrize("from_addr,to_addr,flood_count", ADVERSARIAL_PAYLOADS)
def test_addrmap_rate_limiting_enforced(from_addr, to_addr, flood_count):
    """Invariant: Per-IP rate limiting must be enforced to prevent a single
    source from monopolizing the registry."""
    
    registry = AddrmapRegistry(enforce_limits=True)
    
    # Flood from a single IP
    accepted_from_single_ip = 0
    for _ in range(min(flood_count, 500)):  # Cap to keep test fast
        if registry.insert_addrmap(from_addr, to_addr):
            accepted_from_single_ip += 1
    
    # INVARIANT: A single IP must not be able to fill the entire registry
    # (rate limiting should kick in well before MAX_ENTRIES)
    assert accepted_from_single_ip <= AddrmapRegistry.RATE_LIMIT_MAX, (
        f"SECURITY VIOLATION: Single IP '{from_addr}' was able to insert "
        f"{accepted_from_single_ip} entries, exceeding rate limit of "
        f"{AddrmapRegistry.RATE_LIMIT_MAX} per window."
    )
    
    # INVARIANT: Registry size must still be bounded
    assert registry.size() <= AddrmapRegistry.MAX_ENTRIES, (
        f"SECURITY VIOLATION: Registry size {registry.size()} exceeds maximum "
        f"{AddrmapRegistry.MAX_ENTRIES} after single-IP flood."
    )