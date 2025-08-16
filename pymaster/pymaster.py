#!/usr/bin/env python3
"""
Modern Quake 3 Master Server Implementation
Supports the original Q3 protocol with modern Python practices
"""

import asyncio
import json
import logging
import struct
import time
from dataclasses import dataclass, asdict
from typing import Dict, List, Optional, Set
from datetime import datetime, timedelta
import argparse

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

@dataclass
class GameServer:
    """Represents a registered game server"""
    address: str
    port: int
    last_heartbeat: float
    game_name: str = "QuakeArena-1"
    protocol: int = 68
    max_clients: int = 8
    current_clients: int = 0
    map_name: str = ""
    game_type: str = ""
    hostname: str = ""
    
    def is_expired(self, timeout: int = 300) -> bool:
        """Check if server has expired (no heartbeat for timeout seconds)"""
        return time.time() - self.last_heartbeat > timeout
    
    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        data = asdict(self)
        data['last_seen'] = datetime.fromtimestamp(self.last_heartbeat).isoformat()
        return data

class QuakeMasterServer:
    """Modern Quake 3 Master Server"""
    
    def __init__(self, host: str = "0.0.0.0", port: int = 27950):
        self.host = host
        self.port = port
        self.servers: Dict[str, GameServer] = {}
        self.transport = None
        self.cleanup_task = None
        
    def get_server_key(self, address: str, port: int) -> str:
        """Generate unique key for server identification"""
        return f"{address}:{port}"
    
    def register_server(self, address: str, port: int, game_name: str = "QuakeArena-1"):
        """Register or update a game server"""
        server_key = self.get_server_key(address, port)
        
        if server_key in self.servers:
            # Update existing server
            self.servers[server_key].last_heartbeat = time.time()
            logger.info(f"Updated server: {server_key}")
        else:
            # Register new server
            server = GameServer(
                address=address,
                port=port,
                last_heartbeat=time.time(),
                game_name=game_name
            )
            self.servers[server_key] = server
            logger.info(f"Registered new server: {server_key}")
    
    def remove_server(self, address: str, port: int):
        """Remove a server from the list"""
        server_key = self.get_server_key(address, port)
        if server_key in self.servers:
            del self.servers[server_key]
            logger.info(f"Removed server: {server_key}")
    
    def get_active_servers(self) -> List[GameServer]:
        """Get list of active (non-expired) servers"""
        return [server for server in self.servers.values() if not server.is_expired()]
    
    def cleanup_expired_servers(self):
        """Remove expired servers"""
        expired_keys = [
            key for key, server in self.servers.items() 
            if server.is_expired()
        ]
        
        for key in expired_keys:
            logger.info(f"Removing expired server: {key}")
            del self.servers[key]
    
    def parse_heartbeat(self, data: bytes) -> Optional[tuple]:
        """Parse heartbeat packet"""
        try:
            # Remove the 4-byte header (0xffffffff)
            if len(data) < 4:
                return None
            
            message = data[4:].decode('utf-8', errors='ignore').strip()
            
            if message.startswith('heartbeat'):
                parts = message.split()
                game_name = parts[1] if len(parts) > 1 else "QuakeArena-1"
                return ('heartbeat', game_name)
            
            return None
        except Exception as e:
            logger.warning(f"Error parsing heartbeat: {e}")
            return None
    
    def parse_getservers(self, data: bytes) -> Optional[tuple]:
        """Parse getservers request"""
        try:
            if len(data) < 4:
                return None
            
            message = data[4:].decode('utf-8', errors='ignore').strip()
            
            if message.startswith('getservers'):
                parts = message.split()
                protocol = int(parts[1]) if len(parts) > 1 else 68
                return ('getservers', protocol)
            
            return None
        except Exception as e:
            logger.warning(f"Error parsing getservers: {e}")
            return None
    
    def build_server_response(self, protocol: int = 68) -> bytes:
        """Build getserversResponse packet"""
        # Response header
        response = b'\xff\xff\xff\xff'
        response += b'getserversResponse'
        
        # Add server addresses
        active_servers = self.get_active_servers()
        for server in active_servers:
            # Pack IP address (4 bytes) and port (2 bytes)
            try:
                ip_parts = server.address.split('.')
                if len(ip_parts) == 4:
                    ip_bytes = bytes([int(part) for part in ip_parts])
                    port_bytes = struct.pack('>H', server.port)  # Big-endian port
                    response += b'\\' + ip_bytes + port_bytes
            except Exception as e:
                logger.warning(f"Error packing server {server.address}:{server.port}: {e}")
        
        # End of transmission marker
        response += b'\\EOT\x00\x00\x00'
        
        return response
    
    def datagram_received(self, data: bytes, addr: tuple):
        """Handle incoming UDP packets"""
        try:
            client_ip, client_port = addr
            
            # Parse heartbeat
            heartbeat = self.parse_heartbeat(data)
            if heartbeat:
                _, game_name = heartbeat
                # For heartbeats, use the client's IP but typically servers
                # would specify their game port (different from client port)
                # For simplicity, we'll use the source port
                self.register_server(client_ip, client_port, game_name)
                return
            
            # Parse getservers request
            getservers = self.parse_getservers(data)
            if getservers:
                _, protocol = getservers
                response = self.build_server_response(protocol)
                self.transport.sendto(response, addr)
                logger.info(f"Sent server list to {client_ip}:{client_port} ({len(self.get_active_servers())} servers)")
                return
            
            # Log unknown packets for debugging
            logger.debug(f"Unknown packet from {addr}: {data[:50]}...")
            
        except Exception as e:
            logger.error(f"Error handling packet from {addr}: {e}")
    
    def connection_made(self, transport):
        """Called when UDP socket is ready"""
        self.transport = transport
        logger.info(f"Master server listening on {self.host}:{self.port}")
    
    def error_received(self, exc):
        """Handle transport errors"""
        logger.error(f"Transport error: {exc}")
    
    async def cleanup_loop(self):
        """Periodic cleanup of expired servers"""
        while True:
            try:
                await asyncio.sleep(60)  # Cleanup every minute
                self.cleanup_expired_servers()
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in cleanup loop: {e}")
    
    async def start_server(self):
        """Start the master server"""
        loop = asyncio.get_running_loop()
        
        # Create UDP endpoint
        transport, protocol = await loop.create_datagram_endpoint(
            lambda: self,
            local_addr=(self.host, self.port)
        )
        
        # Start cleanup task
        self.cleanup_task = asyncio.create_task(self.cleanup_loop())
        
        logger.info("Master server started successfully")
        return transport, protocol
    
    async def stop_server(self):
        """Stop the master server"""
        if self.cleanup_task:
            self.cleanup_task.cancel()
        if self.transport:
            self.transport.close()
        logger.info("Master server stopped")

class MasterServerProtocol(asyncio.DatagramProtocol):
    """Protocol handler for the master server"""
    
    def __init__(self, master_server: QuakeMasterServer):
        self.master_server = master_server
    
    def connection_made(self, transport):
        self.master_server.connection_made(transport)
    
    def datagram_received(self, data, addr):
        self.master_server.datagram_received(data, addr)
    
    def error_received(self, exc):
        self.master_server.error_received(exc)

# Web API for server monitoring (optional)
class WebAPI:
    """Simple HTTP API for monitoring servers"""
    
    def __init__(self, master_server: QuakeMasterServer, port: int = 8080):
        self.master_server = master_server
        self.port = port
    
    async def handle_servers(self, request):
        """Return JSON list of active servers"""
        try:
            from aiohttp import web
            servers = [server.to_dict() for server in self.master_server.get_active_servers()]
            return web.json_response({
                'servers': servers,
                'count': len(servers),
                'timestamp': datetime.now().isoformat()
            })
        except ImportError:
            logger.warning("aiohttp not available, web API disabled")
            return None
    
    async def start_web_api(self):
        """Start the web API (requires aiohttp)"""
        try:
            from aiohttp import web
            app = web.Application()
            app.router.add_get('/servers', self.handle_servers)
            app.router.add_get('/api/servers', self.handle_servers)
            
            runner = web.AppRunner(app)
            await runner.setup()
            site = web.TCPSite(runner, 'localhost', self.port)
            await site.start()
            logger.info(f"Web API started on http://localhost:{self.port}")
            return runner
        except ImportError:
            logger.warning("aiohttp not installed, web API disabled")
            return None

async def main():
    """Main entry point"""
    parser = argparse.ArgumentParser(description='Quake 3 Master Server')
    parser.add_argument('--host', default='0.0.0.0', help='Host to bind to')
    parser.add_argument('--port', type=int, default=27950, help='Port to bind to')
    parser.add_argument('--web-port', type=int, default=8080, help='Web API port')
    parser.add_argument('--debug', action='store_true', help='Enable debug logging')
    
    args = parser.parse_args()
    
    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)
    
    # Create master server
    master_server = QuakeMasterServer(args.host, args.port)
    
    # Create protocol handler
    def create_protocol():
        return MasterServerProtocol(master_server)
    
    try:
        # Start UDP server
        loop = asyncio.get_running_loop()
        transport, protocol = await loop.create_datagram_endpoint(
            create_protocol,
            local_addr=(args.host, args.port)
        )
        
        # Start cleanup task
        cleanup_task = asyncio.create_task(master_server.cleanup_loop())
        
        # Start web API (optional)
        web_api = WebAPI(master_server, args.web_port)
        web_runner = await web_api.start_web_api()
        
        logger.info("Master server running. Press Ctrl+C to stop.")
        
        # Wait for interruption
        await asyncio.Event().wait()
        
    except KeyboardInterrupt:
        logger.info("Shutting down...")
    finally:
        # Cleanup
        if 'cleanup_task' in locals():
            cleanup_task.cancel()
        if 'transport' in locals():
            transport.close()
        if 'web_runner' in locals() and web_runner:
            await web_runner.cleanup()

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\nShutdown complete.")