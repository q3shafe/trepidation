// dpmaster rewritten in Go — a master server for Quake 3, DarkPlaces, and Trepidation.
// Implements the same UDP protocol as the original C dpmaster 2.0.
package main

import (
	"encoding/binary"
	"flag"
	"fmt"
	"log"
	"math/rand"
	"net"
	"os"
	"strconv"
	"strings"
	"sync"
	"time"
)

// ---- protocol constants ----

const (
	defaultPort       = 27950
	maxInputPacket    = 2048
	maxOutputPacket   = 1400
	minPacketSize     = 5
	timeoutHeartbeat  = 2 * time.Second
	timeoutInfoResp   = 15 * time.Minute
	timeoutChallenge  = 2 * time.Second
	challengeMinLen   = 8
	challengeMaxLen   = 11
	maxServersDefault = 1024
	gameNameQ3A       = "QuakeArena-1"
	version           = "1.0"
)

// ---- types ----

type addrMapping struct {
	from *net.UDPAddr
	to   *net.UDPAddr
}

type serverEntry struct {
	addr            *net.UDPAddr
	protocol        uint32
	challenge       string
	challengeExpiry time.Time
	nbClients       uint16
	maxClients      uint16
	expiry          time.Time
	gameName        string
	mapping         *addrMapping
}

type master struct {
	mu         sync.Mutex
	servers    map[string]*serverEntry
	maxServers int
	mappings   []*addrMapping
	conn       *net.UDPConn
	verbosity  int
}

// ---- logging ----

func (m *master) log(level int, format string, args ...interface{}) {
	if level <= m.verbosity {
		log.Printf(format, args...)
	}
}

// ---- helpers ----

// parseInfostring returns the value for key in a Q3/DP infostring: \key\val\key\val...
func parseInfostring(info, key string) string {
	parts := strings.Split(info, "\\")
	// parts[0] is empty (before the leading backslash)
	for i := 1; i+1 < len(parts); i += 2 {
		if parts[i] == key {
			return parts[i+1]
		}
	}
	return ""
}

// buildChallenge returns a random printable ASCII string (avoiding Q3 special chars).
func buildChallenge() string {
	length := challengeMinLen + rand.Intn(challengeMaxLen-challengeMinLen+1)
	b := make([]byte, 0, length)
	for len(b) < length {
		c := byte(33 + rand.Intn(126-33+1))
		if c == '\\' || c == ';' || c == '"' || c == '%' || c == '/' {
			continue
		}
		b = append(b, c)
	}
	return string(b)
}

// ---- server registry ----

func (m *master) findMapping(addr *net.UDPAddr) *addrMapping {
	for _, mp := range m.mappings {
		if mp.from.IP.Equal(addr.IP) && (mp.from.Port == 0 || mp.from.Port == addr.Port) {
			return mp
		}
	}
	return nil
}

// getOrAdd looks up a server by address. If add is true and the server is not found,
// it creates a new entry. Must be called with m.mu held.
func (m *master) getOrAdd(addr *net.UDPAddr, add bool) *serverEntry {
	// Loopback addresses are only allowed when an address mapping covers them.
	if addr.IP.IsLoopback() && m.findMapping(addr) == nil {
		m.log(1, "WARNING: server %s rejected (loopback, no mapping)", addr)
		return nil
	}

	key := addr.String()
	now := time.Now()

	if sv, ok := m.servers[key]; ok {
		if sv.expiry.After(now) {
			return sv
		}
		delete(m.servers, key)
		m.log(1, "%s timed out; %d servers registered", key, len(m.servers))
	}

	if !add {
		return nil
	}
	if len(m.servers) >= m.maxServers {
		m.log(1, "WARNING: server limit (%d) reached, rejecting %s", m.maxServers, addr)
		return nil
	}

	sv := &serverEntry{
		addr:    addr,
		mapping: m.findMapping(addr),
	}
	m.servers[key] = sv
	m.log(1, "New server: %s; %d servers registered", addr, len(m.servers))
	return sv
}

// ---- message handlers ----

func (m *master) handleHeartbeat(addr *net.UDPAddr, gameID string) {
	m.log(2, "%s ---> heartbeat (%s)", addr, gameID)

	m.mu.Lock()
	sv := m.getOrAdd(addr, true)
	if sv == nil {
		m.mu.Unlock()
		return
	}
	// Give a newly registered server a short window to send infoResponse.
	// Once we have maxClients, the infoResponse handler extends the timeout.
	if sv.maxClients == 0 {
		sv.expiry = time.Now().Add(timeoutHeartbeat)
	}
	now := time.Now()
	if sv.challengeExpiry.Before(now) {
		sv.challenge = buildChallenge()
		sv.challengeExpiry = now.Add(timeoutChallenge)
	}
	challenge := sv.challenge
	m.mu.Unlock()

	msg := []byte("\xFF\xFF\xFF\xFFgetinfo " + challenge)
	m.conn.WriteToUDP(msg, addr)
	m.log(2, "%s <--- getinfo challenge=%q", addr, challenge)
}

func (m *master) handleInfoResponse(addr *net.UDPAddr, body string) {
	m.log(2, "%s ---> infoResponse", addr)

	m.mu.Lock()
	defer m.mu.Unlock()

	sv := m.getOrAdd(addr, false)
	if sv == nil {
		return
	}

	if sv.challengeExpiry.Before(time.Now()) {
		m.log(1, "WARNING: expired challenge from %s", addr)
		return
	}
	if ch := parseInfostring(body, "challenge"); ch != sv.challenge {
		m.log(0, "ERROR: challenge mismatch from %s (got %q, want %q)", addr, ch, sv.challenge)
		return
	}

	prot, _ := strconv.ParseUint(parseInfostring(body, "protocol"), 10, 32)
	maxCli, _ := strconv.ParseUint(parseInfostring(body, "sv_maxclients"), 10, 16)
	if prot == 0 || maxCli == 0 {
		m.log(0, "ERROR: invalid infoResponse from %s (protocol=%d, maxclients=%d)", addr, prot, maxCli)
		return
	}
	sv.protocol = uint32(prot)
	sv.maxClients = uint16(maxCli)

	if cli := parseInfostring(body, "clients"); cli != "" {
		n, _ := strconv.ParseUint(cli, 10, 16)
		sv.nbClients = uint16(n)
	}

	gameName := parseInfostring(body, "gamename")
	if gameName == "" {
		gameName = gameNameQ3A // Q3A doesn't send gamename
	}
	if gameName != sv.gameName {
		if sv.gameName != "" {
			m.log(1, "%s gamename: %q -> %q", addr, sv.gameName, gameName)
		}
		sv.gameName = gameName
	}

	sv.expiry = time.Now().Add(timeoutInfoResp)
}

func (m *master) handleGetServers(addr *net.UDPAddr, body string) {
	// Q3  format: "<protocol> [empty] [full]"         e.g. "67 empty full"
	// DP  format: "<gamename> <protocol> [empty] [full]"   e.g. "DarkPlaces-Quake 3 empty full"
	parts := strings.Fields(body)
	if len(parts) == 0 {
		return
	}

	var gameName, protStr string
	if _, err := strconv.Atoi(parts[0]); err == nil {
		gameName = gameNameQ3A
		protStr = parts[0]
	} else {
		gameName = parts[0]
		if len(parts) > 1 {
			protStr = parts[1]
		}
	}

	protocol, _ := strconv.ParseUint(protStr, 10, 32)
	noEmpty := !strings.Contains(body, "empty")
	noFull := !strings.Contains(body, "full")

	m.log(1, "%s ---> getservers (%s proto=%d)", addr, gameName, protocol)

	// Response format: \xFF\xFF\xFF\xFFgetserversResponse\<6-byte entries>\EOT\0\0\0
	// Split into ≤1400-byte UDP packets as needed.
	header := []byte("\xFF\xFF\xFF\xFFgetserversResponse\\")
	eot := []byte("EOT\x00\x00\x00")
	packet := make([]byte, len(header), maxOutputPacket)
	copy(packet, header)
	count := 0
	now := time.Now()

	flush := func() {
		pkt := append(packet, eot...)
		m.conn.WriteToUDP(pkt, addr)
		m.log(2, "%s <--- getserversResponse (%d servers in this packet)", addr, count)
		count = 0
		packet = make([]byte, len(header), maxOutputPacket)
		copy(packet, header)
	}

	m.mu.Lock()
	defer m.mu.Unlock()

	for key, sv := range m.servers {
		if sv.expiry.Before(now) {
			delete(m.servers, key)
			m.log(1, "%s timed out; %d servers registered", key, len(m.servers))
			continue
		}
		if sv.protocol != uint32(protocol) {
			continue
		}
		if noEmpty && sv.nbClients == 0 {
			continue
		}
		if noFull && sv.nbClients >= sv.maxClients {
			continue
		}
		// Always filter by gamename — Q3 clients get "QuakeArena-1", DP clients
		// get whichever game they requested. Servers without a confirmed
		// infoResponse have protocol==0 and are already rejected above.
		if sv.gameName != gameName {
			continue
		}

		// Flush before the packet overflows (7 bytes per entry + 6 for EOT).
		if len(packet)+7+len(eot) > maxOutputPacket {
			flush()
		}

		ip := sv.addr.IP.To4()
		port := uint16(sv.addr.Port)
		if sv.mapping != nil {
			ip = sv.mapping.to.IP.To4()
			if sv.mapping.to.Port != 0 {
				port = uint16(sv.mapping.to.Port)
			}
		}
		if ip == nil {
			continue // Q3 protocol carries only IPv4
		}

		var entry [7]byte
		copy(entry[:4], ip)
		binary.BigEndian.PutUint16(entry[4:6], port)
		entry[6] = '\\'
		packet = append(packet, entry[:]...)
		count++
	}

	flush()
}

// dispatch parses a raw UDP packet and calls the appropriate handler.
func (m *master) dispatch(data []byte, addr *net.UDPAddr) {
	if len(data) < minPacketSize {
		m.log(1, "WARNING: packet too small from %s (%d bytes)", addr, len(data))
		return
	}
	if data[0] != 0xFF || data[1] != 0xFF || data[2] != 0xFF || data[3] != 0xFF {
		m.log(1, "WARNING: bad header from %s", addr)
		return
	}
	if addr.Port == 0 {
		m.log(1, "WARNING: source port 0 from %s", addr)
		return
	}

	// Strip the 4-byte OOB header.
	msg := string(data[4:])

	switch {
	case strings.HasPrefix(msg, "heartbeat"):
		rest := msg[len("heartbeat"):]
		if len(rest) > 0 && rest[0] == ' ' {
			rest = rest[1:]
		}
		m.handleHeartbeat(addr, strings.TrimSpace(rest))

	case strings.HasPrefix(msg, "infoResponse\n"):
		m.handleInfoResponse(addr, msg[len("infoResponse\n"):])

	case strings.HasPrefix(msg, "getservers "):
		m.handleGetServers(addr, msg[len("getservers "):])

	default:
		m.log(2, "unknown message from %s: %q", addr, msg)
	}
}

// cleanup periodically removes timed-out server entries.
func (m *master) cleanup() {
	ticker := time.NewTicker(time.Minute)
	defer ticker.Stop()
	for range ticker.C {
		now := time.Now()
		m.mu.Lock()
		for key, sv := range m.servers {
			if sv.expiry.Before(now) {
				delete(m.servers, key)
				m.log(1, "%s expired (cleanup); %d servers registered", key, len(m.servers))
			}
		}
		m.mu.Unlock()
	}
}

// ---- main ----

func main() {
	port := flag.Int("p", defaultPort, "UDP port to listen on")
	listenAddr := flag.String("l", "", "local address to listen on (default: all interfaces)")
	maxServers := flag.Int("n", maxServersDefault, "maximum number of registered servers")
	verbose := flag.Int("v", 1, "verbosity (0=errors, 1=normal, 2=debug)")

	var mappingArgs []string
	flag.Func("m", "address mapping `from=to` (may be repeated; port optional)", func(s string) error {
		mappingArgs = append(mappingArgs, s)
		return nil
	})

	flag.Usage = func() {
		fmt.Fprintf(os.Stderr,
			"gomaster v%s — Quake 3 / DarkPlaces / Trepidation master server\n"+
				"Usage: gomaster [options]\n\nOptions:\n", version)
		flag.PrintDefaults()
	}
	flag.Parse()

	m := &master{
		servers:    make(map[string]*serverEntry),
		maxServers: *maxServers,
		verbosity:  *verbose,
	}

	for _, mapStr := range mappingArgs {
		parts := strings.SplitN(mapStr, "=", 2)
		if len(parts) != 2 {
			fmt.Fprintf(os.Stderr, "invalid mapping %q (expected from=to)\n", mapStr)
			os.Exit(1)
		}
		from, err := net.ResolveUDPAddr("udp4", parts[0])
		if err != nil {
			fmt.Fprintf(os.Stderr, "cannot resolve mapping from %q: %v\n", parts[0], err)
			os.Exit(1)
		}
		to, err := net.ResolveUDPAddr("udp4", parts[1])
		if err != nil {
			fmt.Fprintf(os.Stderr, "cannot resolve mapping to %q: %v\n", parts[1], err)
			os.Exit(1)
		}
		m.mappings = append(m.mappings, &addrMapping{from: from, to: to})
		m.log(1, "mapping: %s -> %s", from, to)
	}

	bindStr := fmt.Sprintf("%s:%d", *listenAddr, *port)
	udpAddr, err := net.ResolveUDPAddr("udp4", bindStr)
	if err != nil {
		log.Fatalf("resolve bind addr: %v", err)
	}
	conn, err := net.ListenUDP("udp4", udpAddr)
	if err != nil {
		log.Fatalf("bind %s: %v", bindStr, err)
	}
	defer conn.Close()
	m.conn = conn

	log.Printf("gomaster v%s listening on UDP %s | max servers: %d", version, bindStr, *maxServers)

	go m.cleanup()

	buf := make([]byte, maxInputPacket+1)
	for {
		n, remoteAddr, err := conn.ReadFromUDP(buf)
		if err != nil {
			m.log(1, "WARNING: ReadFromUDP: %v", err)
			continue
		}
		m.dispatch(buf[:n], remoteAddr)
	}
}
