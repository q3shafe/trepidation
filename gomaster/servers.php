<?php
// ============================================================
//  Trepidation Server Browser
//  Queries gomaster (UDP) then each game server (getstatus)
//  and renders a dark-themed HTML page.
// ============================================================

// ---- Configuration (edit these) ----------------------------
define('MASTER_HOST',   '158.69.213.231'); // IP of the gomaster server
define('MASTER_PORT',   27950);        // gomaster UDP port
define('GAME_NAME',     'QuakeArena-1'); // gamename stored by master (infoResponse has no gamename field)
define('PROTOCOL',      72);           // protocol number (67 or 68 for Q3-based)
define('QUERY_TIMEOUT', 2);            // seconds to wait per UDP call
define('AUTO_REFRESH',  30);           // page auto-refresh interval in seconds (0 = off)
// ------------------------------------------------------------

// ---- UDP helper --------------------------------------------

$debugLog = [];

function udpQuery(string $host, int $port, string $payload): ?string {
    global $debugLog;
    $fp = @fsockopen('udp://' . $host, $port, $errno, $errstr, QUERY_TIMEOUT);
    if (!$fp) {
        $debugLog[] = "udpQuery($host:$port) FAILED: fsockopen error $errno: $errstr";
        return null;
    }
    stream_set_timeout($fp, QUERY_TIMEOUT);
    $sent = fwrite($fp, $payload);
    $debugLog[] = "udpQuery($host:$port) sent $sent bytes: " . bin2hex($payload);
    $buf = fread($fp, 65536);
    fclose($fp);
    if ($buf === false || $buf === '') {
        $debugLog[] = "udpQuery($host:$port) no response (timeout or empty)";
        return null;
    }
    $debugLog[] = "udpQuery($host:$port) received " . strlen($buf) . " bytes: " . bin2hex(substr($buf, 0, 64)) . (strlen($buf) > 64 ? '...' : '');
    return $buf;
}

// ---- Quake 3 infostring ------------------------------------

function parseInfostring(string $s): array {
    $parts = explode('\\', $s);
    $out = [];
    for ($i = 1; $i + 1 < count($parts); $i += 2) {
        $out[$parts[$i]] = $parts[$i + 1];
    }
    return $out;
}

// ---- Q3 color codes → HTML spans ---------------------------

function colorizeQ3(string $s): string {
    static $colors = [
        '0' => '#000000', '1' => '#ff2020', '2' => '#20ff20',
        '3' => '#ffff20', '4' => '#6666ff', '5' => '#20ffff',
        '6' => '#ff20ff', '7' => '#ffffff', '8' => '#ff8020',
        '9' => '#aaaaaa',
    ];
    $out = '';
    $len = strlen($s);
    $i   = 0;
    $cur = '#c9d1d9'; // default text colour
    $run = '';

    $flush = function () use (&$run, &$out, $cur) {
        if ($run !== '') {
            $out .= '<span style="color:' . $cur . '">' . htmlspecialchars($run, ENT_QUOTES) . '</span>';
            $run = '';
        }
    };

    while ($i < $len) {
        if ($s[$i] === '^' && $i + 1 < $len && isset($colors[$s[$i + 1]])) {
            $flush();
            $cur = $colors[$s[$i + 1]];
            $i  += 2;
        } else {
            $run .= $s[$i++];
        }
    }
    $flush();
    return $out ?: htmlspecialchars($s, ENT_QUOTES);
}

function stripColors(string $s): string {
    return preg_replace('/\^[0-9a-zA-Z]/', '', $s);
}

// ---- Master server query -----------------------------------

function getMasterServers(): array {
    global $debugLog;
    $oob     = "\xFF\xFF\xFF\xFF";
    $payload = $oob . 'getservers ' . GAME_NAME . ' ' . PROTOCOL . ' empty full';
    $resp    = udpQuery(MASTER_HOST, MASTER_PORT, $payload);
    if ($resp === null) return [];

    $prefix = "\xFF\xFF\xFF\xFFgetserversResponse\\";
    if (strncmp($resp, $prefix, strlen($prefix)) !== 0) {
        $debugLog[] = "getMasterServers: unexpected response prefix — got: " . bin2hex(substr($resp, 0, 32));
        return [];
    }

    $data = substr($resp, strlen($prefix));

    // Strip trailing EOT\0\0\0
    $eot    = "EOT\x00\x00\x00";
    $eotPos = strpos($data, $eot);
    if ($eotPos !== false) {
        $data = substr($data, 0, $eotPos);
    }

    // Each entry: [4 bytes IPv4][2 bytes port BE][1 byte backslash]
    $servers = [];
    $pos     = 0;
    $len     = strlen($data);
    while ($pos + 6 <= $len) {
        $ip   = sprintf('%d.%d.%d.%d',
            ord($data[$pos]),     ord($data[$pos + 1]),
            ord($data[$pos + 2]), ord($data[$pos + 3]));
        $port = (ord($data[$pos + 4]) << 8) | ord($data[$pos + 5]);
        if ($port > 0) {
            $servers[] = ['ip' => $ip, 'port' => $port];
            $debugLog[] = "getMasterServers: found server $ip:$port";
        }
        $pos += 7; // 6 bytes + backslash separator
    }
    $debugLog[] = "getMasterServers: total " . count($servers) . " server(s) parsed from " . $len . " bytes of payload";
    return $servers;
}

// ---- Individual game server query --------------------------

function getServerStatus(string $ip, int $port): ?array {
    $oob  = "\xFF\xFF\xFF\xFF";
    $resp = udpQuery($ip, $port, $oob . 'getstatus');
    if ($resp === null) return null;

    $prefix = "\xFF\xFF\xFF\xFFstatusResponse\n";
    if (strncmp($resp, $prefix, strlen($prefix)) !== 0) return null;

    $body  = substr($resp, strlen($prefix));
    $lines = explode("\n", $body);

    $info    = parseInfostring($lines[0] ?? '');
    $players = [];
    for ($i = 1; $i < count($lines); $i++) {
        $line = trim($lines[$i]);
        if ($line === '') continue;
        // Format: score ping "name"
        if (preg_match('/^(-?\d+)\s+(\d+)\s+"(.*)"$/', $line, $m)) {
            $players[] = [
                'score' => (int)$m[1],
                'ping'  => (int)$m[2],
                'name'  => $m[3],
            ];
        }
    }

    return ['info' => $info, 'players' => $players];
}

// ---- Gametype labels ---------------------------------------

function gametypeLabel(string $gt): string {
    return match ($gt) {
        '0'     => 'FFA',
        '1'     => 'Duel',
        '2'     => 'SP',
        '3'     => 'TDM',
        '4'     => 'CTF',
        '5'     => '1-Flag CTF',
        '6'     => 'Overload',
        '7'     => 'Harvester',
        default => 'FFA',
    };
}

// ---- Build data --------------------------------------------

$masterList   = getMasterServers();
$masterOnline = !empty($masterList) || isset($masterList);

$serverData   = [];
foreach ($masterList as $sv) {
    $serverData[] = [
        'ip'     => $sv['ip'],
        'port'   => $sv['port'],
        'status' => getServerStatus($sv['ip'], $sv['port']),
    ];
}

// Sort: online servers first, then by player count desc
usort($serverData, function ($a, $b) {
    $aOn = $a['status'] !== null ? 1 : 0;
    $bOn = $b['status'] !== null ? 1 : 0;
    if ($aOn !== $bOn) return $bOn - $aOn;
    $aP  = count($a['status']['players'] ?? []);
    $bP  = count($b['status']['players'] ?? []);
    return $bP - $aP;
});

$totalPlayers = 0;
$onlineCount  = 0;
foreach ($serverData as $sv) {
    if ($sv['status']) {
        $onlineCount++;
        $totalPlayers += count($sv['status']['players']);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<?php if (AUTO_REFRESH > 0): ?>
<meta http-equiv="refresh" content="<?= AUTO_REFRESH ?>">
<?php endif; ?>
<title>Trepidation — Server Browser</title>
<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

:root {
  --bg:        #090b0e;
  --surface:   #0f1318;
  --card:      #141920;
  --border:    #1e2530;
  --border-hi: #2d3a4a;
  --accent:    #e84500;
  --accent2:   #ff6d2a;
  --green:     #3ddb5c;
  --yellow:    #f5c400;
  --blue:      #4da6ff;
  --muted:     #3d4b5c;
  --text:      #ccd6e0;
  --textdim:   #5e7080;
  --font:      'Consolas', 'Courier New', monospace;
}

body {
  background: var(--bg);
  color: var(--text);
  font-family: var(--font);
  font-size: 13px;
  line-height: 1.5;
  min-height: 100vh;
}

/* ---- header ---- */
header {
  background: linear-gradient(180deg, #1c0700 0%, var(--surface) 100%);
  border-bottom: 2px solid var(--accent);
  padding: 18px 28px;
  display: flex;
  align-items: center;
  gap: 20px;
  position: sticky;
  top: 0;
  z-index: 10;
  box-shadow: 0 4px 24px rgba(0,0,0,0.6);
}

.logo {
  display: flex;
  flex-direction: column;
}
.logo-title {
  font-size: 26px;
  font-weight: bold;
  color: var(--accent);
  text-shadow: 0 0 18px rgba(232,69,0,0.55);
  letter-spacing: 4px;
  text-transform: uppercase;
  line-height: 1;
}
.logo-sub {
  font-size: 10px;
  color: var(--textdim);
  letter-spacing: 2px;
  text-transform: uppercase;
  margin-top: 3px;
}

.header-stats {
  margin-left: auto;
  display: flex;
  gap: 28px;
}
.stat {
  text-align: center;
  min-width: 48px;
}
.stat-val {
  font-size: 22px;
  font-weight: bold;
  color: var(--accent2);
  line-height: 1;
}
.stat-lbl {
  font-size: 9px;
  color: var(--textdim);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  margin-top: 2px;
}

.master-status {
  font-size: 11px;
  color: var(--textdim);
  display: flex;
  align-items: center;
  gap: 6px;
  border-left: 1px solid var(--border-hi);
  padding-left: 20px;
  margin-left: 4px;
}
.dot {
  width: 7px; height: 7px;
  border-radius: 50%;
  flex-shrink: 0;
}
.dot.on  { background: var(--green); box-shadow: 0 0 5px var(--green); }
.dot.off { background: #c00; }

/* ---- main ---- */
main {
  max-width: 1440px;
  margin: 0 auto;
  padding: 24px 16px 48px;
}

.section-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 16px;
  font-size: 10px;
  color: var(--textdim);
  text-transform: uppercase;
  letter-spacing: 2px;
}
.section-header::after {
  content: '';
  flex: 1;
  height: 1px;
  background: var(--border);
}

/* ---- server grid ---- */
.server-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
  gap: 14px;
}

/* ---- server card ---- */
.server-card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 5px;
  overflow: hidden;
  transition: border-color 0.15s, box-shadow 0.15s;
}
.server-card:hover {
  border-color: var(--accent);
  box-shadow: 0 0 12px rgba(232,69,0,0.15);
}
.server-card.offline {
  opacity: 0.4;
  filter: grayscale(0.4);
}

.card-head {
  background: var(--surface);
  border-bottom: 1px solid var(--border);
  padding: 9px 13px;
  display: flex;
  align-items: center;
  gap: 9px;
}
.status-dot {
  width: 7px; height: 7px;
  border-radius: 50%;
  flex-shrink: 0;
}
.status-dot.on  { background: var(--green); box-shadow: 0 0 5px var(--green); }
.status-dot.off { background: var(--muted); }

.server-name {
  font-size: 13px;
  font-weight: bold;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  flex: 1;
}
.server-addr {
  font-size: 10px;
  color: var(--textdim);
  flex-shrink: 0;
  font-weight: normal;
}

.card-meta {
  padding: 7px 13px;
  display: flex;
  gap: 0;
  font-size: 11px;
  border-bottom: 1px solid var(--border);
  flex-wrap: wrap;
  align-items: center;
}

.meta-item {
  display: flex;
  flex-direction: column;
  gap: 1px;
  padding-right: 18px;
}
.meta-label {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 1px;
  color: var(--textdim);
}
.meta-value        { color: var(--text); }
.meta-value.map    { color: var(--yellow); }
.meta-value.mode   { color: var(--blue); }
.meta-value.mod    { color: var(--textdim); }

.player-count {
  margin-left: auto;
  font-size: 15px;
  font-weight: bold;
  white-space: nowrap;
}
.player-count .c   { color: var(--green); }
.player-count .sep { color: var(--muted); }
.player-count .m   { color: var(--textdim); }

/* ---- player table ---- */
.player-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 12px;
}
.player-table thead th {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  color: var(--textdim);
  padding: 5px 13px;
  text-align: left;
  background: rgba(0,0,0,0.25);
  border-bottom: 1px solid var(--border);
}
.player-table thead th.right { text-align: right; }

.player-table tbody tr:nth-child(odd)  { background: rgba(255,255,255,0.015); }
.player-table tbody tr:hover           { background: rgba(232,69,0,0.07); }
.player-table tbody td {
  padding: 5px 13px;
  border-top: 1px solid rgba(255,255,255,0.03);
  vertical-align: middle;
}
.player-table tbody td.right { text-align: right; }

.rank    { color: var(--muted); width: 22px; }
.pname   { max-width: 190px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
.score   { color: var(--yellow); font-weight: bold; }
.ping    { }
.ping.good { color: var(--green); }
.ping.ok   { color: var(--yellow); }
.ping.bad  { color: #e05050; }

.no-players {
  padding: 11px 13px;
  font-size: 11px;
  color: var(--muted);
  font-style: italic;
}

/* ---- empty state ---- */
.empty-state {
  text-align: center;
  padding: 80px 20px;
  color: var(--textdim);
}
.empty-state .icon { font-size: 48px; margin-bottom: 16px; }
.empty-state h2    { color: var(--muted); font-size: 20px; margin-bottom: 8px; }

/* ---- footer ---- */
footer {
  text-align: center;
  padding: 20px;
  font-size: 10px;
  color: var(--muted);
  border-top: 1px solid var(--border);
  letter-spacing: 1px;
}
footer a { color: var(--textdim); text-decoration: none; }

/* ---- refresh bar ---- */
.refresh-note {
  font-size: 10px;
  color: var(--textdim);
  text-align: right;
  margin-bottom: 12px;
}
</style>
</head>
<body>

<header>
  <div class="logo">
    <div class="logo-title">Trepidation</div>
    <div class="logo-sub">Server Browser</div>
  </div>

  <div class="header-stats">
    <div class="stat">
      <div class="stat-val"><?= $onlineCount ?></div>
      <div class="stat-lbl">Servers</div>
    </div>
    <div class="stat">
      <div class="stat-val"><?= $totalPlayers ?></div>
      <div class="stat-lbl">Players</div>
    </div>
    <div class="stat">
      <div class="stat-val"><?= date('H:i') ?></div>
      <div class="stat-lbl">Updated</div>
    </div>
  </div>

  <div class="master-status">
    <div class="dot <?= empty($masterList) ? 'off' : 'on' ?>"></div>
    <span><?= htmlspecialchars(MASTER_HOST) ?>:<?= MASTER_PORT ?></span>
  </div>
</header>

<main>

<?php if (empty($serverData)): ?>
  <div class="empty-state">
    <div class="icon">&#9762;</div>
    <h2>No servers found</h2>
    <p>Master server at <?= htmlspecialchars(MASTER_HOST) ?>:<?= MASTER_PORT ?> returned no results.</p>
    <p style="margin-top:8px;font-size:11px;color:var(--muted)">
      Make sure gomaster is running and game servers have sent heartbeats.
    </p>
  </div>
<?php else: ?>

  <?php if (AUTO_REFRESH > 0): ?>
  <div class="refresh-note">Auto-refresh every <?= AUTO_REFRESH ?>s &mdash; <?= date('Y-m-d H:i:s') ?></div>
  <?php endif; ?>

  <div class="section-header">Active Servers</div>

  <div class="server-grid">
  <?php foreach ($serverData as $sv):
    $info       = $sv['status']['info']    ?? [];
    $players    = $sv['status']['players'] ?? [];
    $online     = $sv['status'] !== null;

    $hostname   = $info['sv_hostname']      ?? ($sv['ip'] . ':' . $sv['port']);
    $mapname    = $info['mapname']          ?? '—';
    $maxClients = (int)($info['sv_maxclients'] ?? 0);
    $curClients = count($players);
    $gametype   = gametypeLabel($info['g_gametype'] ?? $info['gametype'] ?? '');
    $mod        = $info['gamename']         ?? GAME_NAME;

    // Sort players by score desc
    usort($players, fn($a, $b) => $b['score'] - $a['score']);
  ?>
  <div class="server-card <?= $online ? '' : 'offline' ?>">

    <div class="card-head">
      <div class="status-dot <?= $online ? 'on' : 'off' ?>"></div>
      <div class="server-name">
        <?= $online ? colorizeQ3($hostname) : htmlspecialchars(stripColors($hostname), ENT_QUOTES) ?>
      </div>
      <div class="server-addr"><?= htmlspecialchars($sv['ip']) ?>:<?= $sv['port'] ?></div>
    </div>

    <?php if ($online): ?>
    <div class="card-meta">
      <div class="meta-item">
        <span class="meta-label">Map</span>
        <span class="meta-value map"><?= htmlspecialchars($mapname) ?></span>
      </div>
      <div class="meta-item">
        <span class="meta-label">Mode</span>
        <span class="meta-value mode"><?= htmlspecialchars($gametype) ?></span>
      </div>
      <div class="meta-item">
        <span class="meta-label">Mod</span>
        <span class="meta-value mod"><?= htmlspecialchars($mod) ?></span>
      </div>
      <div class="player-count">
        <span class="c"><?= $curClients ?></span><span class="sep">/</span><span class="m"><?= $maxClients ?></span>
      </div>
    </div>

    <div>
      <?php if (empty($players)): ?>
        <div class="no-players">No players &mdash; server is empty</div>
      <?php else: ?>
        <table class="player-table">
          <thead>
            <tr>
              <th>#</th>
              <th>Player</th>
              <th class="right">Score</th>
              <th class="right">Ping</th>
            </tr>
          </thead>
          <tbody>
          <?php foreach ($players as $i => $p):
            $ping = $p['ping'];
            $pingClass = $ping < 80 ? 'good' : ($ping < 150 ? 'ok' : 'bad');
          ?>
            <tr>
              <td class="rank"><?= $i + 1 ?></td>
              <td><div class="pname"><?= colorizeQ3($p['name']) ?></div></td>
              <td class="score right"><?= $p['score'] ?></td>
              <td class="ping <?= $pingClass ?> right"><?= $ping ?>ms</td>
            </tr>
          <?php endforeach; ?>
          </tbody>
        </table>
      <?php endif; ?>
    </div>

    <?php else: ?>
      <div class="no-players">Server not responding</div>
    <?php endif; ?>

  </div>
  <?php endforeach; ?>
  </div>

<?php endif; ?>

</main>

<footer>
  Trepidation Server Browser &mdash;
  master <?= htmlspecialchars(MASTER_HOST) ?>:<?= MASTER_PORT ?> &mdash;
  protocol <?= PROTOCOL ?> &mdash;
  <?= date('Y-m-d H:i:s T') ?>
</footer>

<?php if (isset($_GET['debug'])): ?>
<div style="background:#0a0e14;border-top:2px solid #e84500;padding:20px 24px;font-family:monospace;font-size:12px;color:#8aabb0;">
  <div style="color:#e84500;font-size:14px;font-weight:bold;margin-bottom:12px;letter-spacing:2px;">DEBUG OUTPUT</div>

  <div style="margin-bottom:8px;color:#5e7080;">
    Query: <span style="color:#f5c400;">getservers <?= htmlspecialchars(GAME_NAME) ?> <?= PROTOCOL ?> empty full</span>
    &rarr; <?= htmlspecialchars(MASTER_HOST) ?>:<?= MASTER_PORT ?>
  </div>

  <?php foreach ($debugLog as $line): ?>
  <div style="border-left:2px solid #1e2530;padding:2px 10px;margin:2px 0;color:#9ab;">
    <?= htmlspecialchars($line) ?>
  </div>
  <?php endforeach; ?>
  <?php if (empty($debugLog)): ?>
  <div style="color:#5e7080;font-style:italic;">No log entries.</div>
  <?php endif; ?>

  <?php
  // Protocol probe: try common Q3-engine protocol numbers and report which have servers
  $probeProtocols = [66, 67, 68, 69, 70, 71, 72, 73, 80];
  $oob = "\xFF\xFF\xFF\xFF";
  $prefix = "\xFF\xFF\xFF\xFFgetserversResponse\\";
  $eot = "EOT\x00\x00\x00";
  ?>
  <?php
  // Helper: query master with a specific gamename+protocol, return list of "ip:port" strings
  function probeQuery(string $gameName, int $proto, string $oob, string $prefix, string $eot): array {
    $fp = @fsockopen('udp://' . MASTER_HOST, MASTER_PORT, $e, $es, QUERY_TIMEOUT);
    if (!$fp) return [];
    stream_set_timeout($fp, QUERY_TIMEOUT);
    // Q3A legacy format: just the protocol number (no gamename prefix)
    $q = ($gameName === '__Q3A__')
      ? $oob . 'getservers ' . $proto . ' empty full'
      : $oob . 'getservers ' . $gameName . ' ' . $proto . ' empty full';
    fwrite($fp, $q);
    $r = fread($fp, 65536);
    fclose($fp);
    if (!$r || strncmp($r, $prefix, strlen($prefix)) !== 0) return [];
    $d = substr($r, strlen($prefix));
    $p2 = strpos($d, $eot);
    if ($p2 !== false) $d = substr($d, 0, $p2);
    $results = [];
    $pos2 = 0; $len2 = strlen($d);
    while ($pos2 + 6 <= $len2) {
      $ip = sprintf('%d.%d.%d.%d', ord($d[$pos2]), ord($d[$pos2+1]), ord($d[$pos2+2]), ord($d[$pos2+3]));
      $pt = (ord($d[$pos2+4]) << 8) | ord($d[$pos2+5]);
      if ($pt > 0) $results[] = "$ip:$pt";
      $pos2 += 7;
    }
    return $results;
  }
  ?>

  <div style="color:#e84500;font-weight:bold;margin:20px 0 8px;">Game Name Probe (proto=<?= PROTOCOL ?>)</div>
  <?php
  $probeNames = [GAME_NAME, 'Trepidation', 'trepidation', 'QuakeArena-1', 'baseq3', '__Q3A__'];
  $nameHit = false;
  ?>
  <table style="border-collapse:collapse;width:100%;max-width:600px;">
    <tr style="color:#5e7080;font-size:10px;">
      <th style="text-align:left;padding:3px 10px;">Game name sent</th>
      <th style="text-align:left;padding:3px 10px;">Servers</th>
      <th style="text-align:left;padding:3px 10px;">IPs</th>
    </tr>
  <?php foreach ($probeNames as $gn):
    $label = ($gn === '__Q3A__') ? '(Q3A legacy: no gamename)' : $gn;
    $ips   = probeQuery($gn, PROTOCOL, $oob, $prefix, $eot);
    $found = count($ips) > 0;
    if ($found) $nameHit = true;
    $cur   = ($gn === GAME_NAME);
  ?>
    <tr style="<?= $cur ? 'background:#1a1000;' : '' ?>">
      <td style="padding:3px 10px;color:<?= $cur ? '#f5c400' : '#8aabb0' ?>">
        <?= htmlspecialchars($label) ?><?= $cur ? ' ← current' : '' ?>
      </td>
      <td style="padding:3px 10px;color:<?= $found ? '#3ddb5c' : '#3d4b5c' ?>;font-weight:<?= $found ? 'bold' : 'normal' ?>">
        <?= count($ips) ?>
      </td>
      <td style="padding:3px 10px;color:#5e8090;"><?= htmlspecialchars(implode(', ', $ips)) ?></td>
    </tr>
  <?php endforeach; ?>
  </table>

  <div style="color:#e84500;font-weight:bold;margin:20px 0 8px;">Protocol Probe — <?= htmlspecialchars(GAME_NAME) ?></div>
  <table style="border-collapse:collapse;width:100%;max-width:500px;">
    <tr style="color:#5e7080;font-size:10px;">
      <th style="text-align:left;padding:3px 10px;">Protocol</th>
      <th style="text-align:left;padding:3px 10px;">Servers</th>
      <th style="text-align:left;padding:3px 10px;">IPs</th>
    </tr>
  <?php foreach ($probeProtocols as $proto):
    $ips   = probeQuery(GAME_NAME, $proto, $oob, $prefix, $eot);
    $found = count($ips) > 0;
    $cur   = $proto == PROTOCOL;
  ?>
    <tr style="<?= $cur ? 'background:#1a1000;' : '' ?>">
      <td style="padding:3px 10px;color:<?= $cur ? '#f5c400' : '#8aabb0' ?>">
        <?= $proto ?><?= $cur ? ' ← current' : '' ?>
      </td>
      <td style="padding:3px 10px;color:<?= $found ? '#3ddb5c' : '#3d4b5c' ?>;font-weight:<?= $found ? 'bold' : 'normal' ?>">
        <?= count($ips) ?>
      </td>
      <td style="padding:3px 10px;color:#5e8090;"><?= htmlspecialchars(implode(', ', $ips)) ?></td>
    </tr>
  <?php endforeach; ?>
  </table>

  <div style="color:#e84500;font-weight:bold;margin:20px 0 8px;">Direct getstatus — Known Game Server</div>
  <?php
  // Query the game server we know from the logs directly, to see what it reports
  $knownServers = ['108.161.128.117:27963', '108.161.128.117:27964'];
  foreach ($knownServers as $addr):
    [$gsIp, $gsPort] = explode(':', $addr);
    $gsPort = (int)$gsPort;
    $fp = @fsockopen("udp://$gsIp", $gsPort, $e, $es, QUERY_TIMEOUT);
    $gsInfo = null;
    if ($fp) {
      stream_set_timeout($fp, QUERY_TIMEOUT);
      fwrite($fp, $oob . 'getstatus');
      $r = fread($fp, 65536);
      fclose($fp);
      $sp = "\xFF\xFF\xFF\xFFstatusResponse\n";
      if ($r && strncmp($r, $sp, strlen($sp)) === 0) {
        $lines = explode("\n", substr($r, strlen($sp)));
        $gsInfo = parseInfostring($lines[0] ?? '');
      }
    }
  ?>
  <div style="margin-bottom:6px;color:#5e7080;"><?= htmlspecialchars($addr) ?> →
    <?php if ($gsInfo === null): ?>
      <span style="color:#c00;">no response</span>
    <?php else: ?>
      <span style="color:#3ddb5c;">responded</span>
      &nbsp;
      <span style="color:#f5c400;">gamename=<?= htmlspecialchars($gsInfo['gamename'] ?? '(none)') ?></span>
      &nbsp;
      <span style="color:#4da6ff;">protocol=<?= htmlspecialchars($gsInfo['protocol'] ?? '(none)') ?></span>
      &nbsp;
      <span style="color:#8aabb0;">map=<?= htmlspecialchars($gsInfo['mapname'] ?? '?') ?>
        sv_hostname=<?= htmlspecialchars($gsInfo['sv_hostname'] ?? '?') ?>
        clients=<?= htmlspecialchars($gsInfo['clients'] ?? '0') ?>/<?= htmlspecialchars($gsInfo['sv_maxclients'] ?? '?') ?></span>
    <?php endif; ?>
  </div>
  <?php endforeach; ?>
  <div style="margin-top:4px;color:#3d4b5c;font-size:11px;">
    The <code>gamename</code> and <code>protocol</code> values above are what the game server actually advertises.
    Set <code>GAME_NAME</code> and <code>PROTOCOL</code> at the top of this file to match.
  </div>

</div>
<?php endif; ?>

</body>
</html>
