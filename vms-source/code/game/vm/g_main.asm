data
align 4
LABELV gameCvarTable
address g_cheats
address $56
address $57
byte 4 0
byte 4 0
byte 4 0
skip 4
byte 4 0
address $58
address $59
byte 4 68
byte 4 0
byte 4 0
skip 4
byte 4 0
address $60
address $61
byte 4 64
byte 4 0
byte 4 0
skip 4
address g_restarted
address $62
address $63
byte 4 64
byte 4 0
byte 4 0
skip 4
byte 4 0
address $64
address $57
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_gametype
address $65
address $63
byte 4 38
byte 4 0
byte 4 0
skip 4
address g_maxclients
address $66
address $67
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_maxGameClients
address $68
address $63
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_dmflags
address $69
address $63
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_fraglimit
address $70
address $71
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_timelimit
address $72
address $63
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_capturelimit
address $73
address $67
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_synchronousClients
address $74
address $63
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_friendlyFire
address $75
address $63
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_teamAutoJoin
address $76
address $63
byte 4 1
skip 12
address g_teamForceBalance
address $77
address $63
byte 4 1
skip 12
address g_warmup
address $78
address $71
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_doWarmup
address $79
address $63
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_log
address $80
address $81
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_logSync
address $82
address $63
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_password
address $83
address $57
byte 4 2
byte 4 0
byte 4 0
skip 4
address g_banIPs
address $84
address $57
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_filterBan
address $85
address $86
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_needpass
address $87
address $63
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_dedicated
address $88
address $63
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_speed
address $89
address $90
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_gravity
address $91
address $92
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_knockback
address $93
address $94
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_quadfactor
address $95
address $96
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponRespawn
address $97
address $98
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponTeamRespawn
address $99
address $100
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_forcerespawn
address $101
address $71
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_inactivity
address $102
address $63
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_debugMove
address $103
address $63
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugDamage
address $104
address $63
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugAlloc
address $105
address $63
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_motd
address $106
address $57
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_blood
address $107
address $86
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDist
address $108
address $109
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDrop
address $110
address $111
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_allowVote
address $112
address $86
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_listEntity
address $113
address $63
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_smoothClients
address $114
address $86
byte 4 0
byte 4 0
byte 4 0
skip 4
address pmove_fixed
address $115
address $63
byte 4 8
byte 4 0
byte 4 0
skip 4
address pmove_msec
address $116
address $67
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_delagHitscan
address $117
address $86
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_unlaggedVersion
address $118
address $119
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_truePing
address $120
address $86
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_lightningDamage
address $121
address $67
byte 4 0
byte 4 0
byte 4 1
skip 4
address sv_fps
address $122
address $71
byte 4 9
byte 4 0
byte 4 0
skip 4
address g_rankings
address $123
address $63
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_instagib
address $124
address $63
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_MultiJump
address $125
address $63
byte 4 5
byte 4 0
byte 4 1
skip 4
align 4
LABELV gameCvarTableSize
byte 4 53
export vmMain
code
proc vmMain 16 12
file "../g_main.c"
line 209
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:level_locals_t	level;
;7:
;8:typedef struct {
;9:	vmCvar_t	*vmCvar;
;10:	char		*cvarName;
;11:	char		*defaultString;
;12:	int			cvarFlags;
;13:	int			modificationCount;  // for tracking changes
;14:	qboolean	trackChange;	    // track this variable, and announce if changed
;15:  qboolean teamShader;        // track and if changed, update shader state
;16:} cvarTable_t;
;17:
;18:gentity_t		g_entities[MAX_GENTITIES];
;19:gclient_t		g_clients[MAX_CLIENTS];
;20:
;21:vmCvar_t	g_gametype;
;22:vmCvar_t	g_dmflags;
;23:vmCvar_t	g_fraglimit;
;24:vmCvar_t	g_timelimit;
;25:vmCvar_t	g_capturelimit;
;26:vmCvar_t	g_friendlyFire;
;27:vmCvar_t	g_password;
;28:vmCvar_t	g_needpass;
;29:vmCvar_t	g_maxclients;
;30:vmCvar_t	g_maxGameClients;
;31:vmCvar_t	g_dedicated;
;32:vmCvar_t	g_speed;
;33:vmCvar_t	g_gravity;
;34:vmCvar_t	g_cheats;
;35:vmCvar_t	g_knockback;
;36:vmCvar_t	g_quadfactor;
;37:vmCvar_t	g_forcerespawn;
;38:vmCvar_t	g_inactivity;
;39:vmCvar_t	g_debugMove;
;40:vmCvar_t	g_debugDamage;
;41:vmCvar_t	g_debugAlloc;
;42:vmCvar_t	g_weaponRespawn;
;43:vmCvar_t	g_weaponTeamRespawn;
;44:vmCvar_t	g_motd;
;45:vmCvar_t	g_synchronousClients;
;46:vmCvar_t	g_warmup;
;47:vmCvar_t	g_doWarmup;
;48:vmCvar_t	g_restarted;
;49:vmCvar_t	g_log;
;50:vmCvar_t	g_logSync;
;51:vmCvar_t	g_blood;
;52:vmCvar_t	g_podiumDist;
;53:vmCvar_t	g_podiumDrop;
;54:vmCvar_t	g_allowVote;
;55:vmCvar_t	g_teamAutoJoin;
;56:vmCvar_t	g_teamForceBalance;
;57:vmCvar_t	g_banIPs;
;58:vmCvar_t	g_filterBan;
;59:vmCvar_t	g_smoothClients;
;60:vmCvar_t	pmove_fixed;
;61:vmCvar_t	pmove_msec;
;62:vmCvar_t	g_rankings;
;63:vmCvar_t	g_listEntity;
;64:#ifdef MISSIONPACK
;65:vmCvar_t	g_obeliskHealth;
;66:vmCvar_t	g_obeliskRegenPeriod;
;67:vmCvar_t	g_obeliskRegenAmount;
;68:vmCvar_t	g_obeliskRespawnDelay;
;69:vmCvar_t	g_cubeTimeout;
;70:vmCvar_t	g_redteam;
;71:vmCvar_t	g_blueteam;
;72:vmCvar_t	g_singlePlayer;
;73:vmCvar_t	g_enableDust;
;74:vmCvar_t	g_enableBreath;
;75:vmCvar_t	g_proxMineTimeout;
;76:#endif
;77://unlagged - server options
;78:vmCvar_t	g_delagHitscan;
;79:vmCvar_t	g_unlaggedVersion;
;80:vmCvar_t	g_truePing;
;81:vmCvar_t	g_lightningDamage;
;82:vmCvar_t	sv_fps;
;83://unlagged - server options
;84:
;85://Shafe - Trep
;86:vmCvar_t	g_instagib;
;87:vmCvar_t	g_MultiJump;
;88://vmCvar_t	g_CTFGrapple; // Decided not to make this an option
;89:
;90:// bk001129 - made static to avoid aliasing
;91:static cvarTable_t		gameCvarTable[] = {
;92:	// don't override the cheat state set by the system
;93:	{ &g_cheats, "sv_cheats", "", 0, 0, qfalse },
;94:
;95:	// noset vars
;96:	{ NULL, "gamename", GAMEVERSION , CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;97:	{ NULL, "gamedate", __DATE__ , CVAR_ROM, 0, qfalse  },
;98:	{ &g_restarted, "g_restarted", "0", CVAR_ROM, 0, qfalse  },
;99:	{ NULL, "sv_mapname", "", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;100:
;101:	// latched vars
;102:	{ &g_gametype, "g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;103:
;104:	{ &g_maxclients, "sv_maxclients", "8", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;105:	{ &g_maxGameClients, "g_maxGameClients", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;106:
;107:	// change anytime vars
;108:	{ &g_dmflags, "dmflags", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;109:	{ &g_fraglimit, "fraglimit", "20", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;110:	{ &g_timelimit, "timelimit", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;111:	{ &g_capturelimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;112:
;113:	{ &g_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO, 0, qfalse  },
;114:
;115:	{ &g_friendlyFire, "g_friendlyFire", "0", CVAR_ARCHIVE, 0, qtrue  },
;116:
;117:	{ &g_teamAutoJoin, "g_teamAutoJoin", "0", CVAR_ARCHIVE  },
;118:	{ &g_teamForceBalance, "g_teamForceBalance", "0", CVAR_ARCHIVE  },
;119:
;120:	{ &g_warmup, "g_warmup", "20", CVAR_ARCHIVE, 0, qtrue  },
;121:	{ &g_doWarmup, "g_doWarmup", "0", 0, 0, qtrue  },
;122:	{ &g_log, "g_log", "games.log", CVAR_ARCHIVE, 0, qfalse  },
;123:	{ &g_logSync, "g_logSync", "0", CVAR_ARCHIVE, 0, qfalse  },
;124:
;125:	{ &g_password, "g_password", "", CVAR_USERINFO, 0, qfalse  },
;126:
;127:	{ &g_banIPs, "g_banIPs", "", CVAR_ARCHIVE, 0, qfalse  },
;128:	{ &g_filterBan, "g_filterBan", "1", CVAR_ARCHIVE, 0, qfalse  },
;129:
;130:	{ &g_needpass, "g_needpass", "0", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse },
;131:
;132:	{ &g_dedicated, "dedicated", "0", 0, 0, qfalse  },
;133:
;134:	{ &g_speed, "g_speed", "320", 0, 0, qtrue  },
;135:	{ &g_gravity, "g_gravity", "800", 0, 0, qtrue  },
;136:	{ &g_knockback, "g_knockback", "1000", 0, 0, qtrue  },
;137:	{ &g_quadfactor, "g_quadfactor", "3", 0, 0, qtrue  },
;138:	{ &g_weaponRespawn, "g_weaponrespawn", "5", 0, 0, qtrue  },
;139:	{ &g_weaponTeamRespawn, "g_weaponTeamRespawn", "30", 0, 0, qtrue },
;140:	{ &g_forcerespawn, "g_forcerespawn", "20", 0, 0, qtrue },
;141:	{ &g_inactivity, "g_inactivity", "0", 0, 0, qtrue },
;142:	{ &g_debugMove, "g_debugMove", "0", 0, 0, qfalse },
;143:	{ &g_debugDamage, "g_debugDamage", "0", 0, 0, qfalse },
;144:	{ &g_debugAlloc, "g_debugAlloc", "0", 0, 0, qfalse },
;145:	{ &g_motd, "g_motd", "", 0, 0, qfalse },
;146:	{ &g_blood, "com_blood", "1", 0, 0, qfalse },
;147:
;148:	{ &g_podiumDist, "g_podiumDist", "80", 0, 0, qfalse },
;149:	{ &g_podiumDrop, "g_podiumDrop", "70", 0, 0, qfalse },
;150:
;151:	{ &g_allowVote, "g_allowVote", "1", CVAR_ARCHIVE, 0, qfalse },
;152:	{ &g_listEntity, "g_listEntity", "0", 0, 0, qfalse },
;153:
;154:#ifdef MISSIONPACK
;155:	{ &g_obeliskHealth, "g_obeliskHealth", "2500", 0, 0, qfalse },
;156:	{ &g_obeliskRegenPeriod, "g_obeliskRegenPeriod", "1", 0, 0, qfalse },
;157:	{ &g_obeliskRegenAmount, "g_obeliskRegenAmount", "15", 0, 0, qfalse },
;158:	{ &g_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO, 0, qfalse },
;159:
;160:	{ &g_cubeTimeout, "g_cubeTimeout", "30", 0, 0, qfalse },
;161:	{ &g_redteam, "g_redteam", "Stroggs", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue },
;162:	{ &g_blueteam, "g_blueteam", "Pagans", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue  },
;163:	{ &g_singlePlayer, "ui_singlePlayerActive", "", 0, 0, qfalse, qfalse  },
;164:
;165:	{ &g_enableDust, "g_enableDust", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
;166:	{ &g_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
;167:	{ &g_proxMineTimeout, "g_proxMineTimeout", "20000", 0, 0, qfalse },
;168:#endif
;169:	{ &g_smoothClients, "g_smoothClients", "1", 0, 0, qfalse},
;170:	{ &pmove_fixed, "pmove_fixed", "0", CVAR_SYSTEMINFO, 0, qfalse},
;171:	{ &pmove_msec, "pmove_msec", "8", CVAR_SYSTEMINFO, 0, qfalse},
;172:
;173://unlagged - server options
;174:	{ &g_delagHitscan, "g_delagHitscan", "1", CVAR_ARCHIVE | CVAR_SERVERINFO, 0, qtrue },
;175:	{ &g_unlaggedVersion, "g_unlaggedVersion", "2.0", CVAR_ROM | CVAR_SERVERINFO, 0, qfalse },
;176:	{ &g_truePing, "g_truePing", "1", CVAR_ARCHIVE, 0, qtrue },
;177:	{ &g_lightningDamage, "g_lightningDamage", "8", 0, 0, qtrue },
;178:	// it's CVAR_SYSTEMINFO so the client's sv_fps will be automagically set to its value
;179:	{ &sv_fps, "sv_fps", "20", CVAR_SYSTEMINFO | CVAR_ARCHIVE, 0, qfalse },
;180://unlagged - server options
;181:
;182:	{ &g_rankings, "g_rankings", "0", 0, 0, qfalse},
;183:// Shafe - Trep - Cvars
;184:	{ &g_instagib, "g_instagib", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;185:	{ &g_MultiJump, "g_MultiJump", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue }
;186:
;187:
;188:	
;189:};
;190:
;191:// bk001129 - made static to avoid aliasing
;192:static int gameCvarTableSize = sizeof( gameCvarTable ) / sizeof( gameCvarTable[0] );
;193:
;194:
;195:void G_InitGame( int levelTime, int randomSeed, int restart );
;196:void G_RunFrame( int levelTime );
;197:void G_ShutdownGame( int restart );
;198:void CheckExitRules( void );
;199:
;200:
;201:/*
;202:================
;203:vmMain
;204:
;205:This is the only way control passes into the module.
;206:This must be the very first function compiled into the .q3vm file
;207:================
;208:*/
;209:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 210
;210:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $127
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $127
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $140
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $140
address $129
address $130
address $131
address $135
address $133
address $134
address $136
address $132
address $137
address $138
address $139
code
LABELV $129
line 212
;211:	case GAME_INIT:
;212:		G_InitGame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_InitGame
CALLV
pop
line 213
;213:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $130
line 215
;214:	case GAME_SHUTDOWN:
;215:		G_ShutdownGame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ShutdownGame
CALLV
pop
line 216
;216:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $131
line 218
;217:	case GAME_CLIENT_CONNECT:
;218:		return (int)ClientConnect( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CVUI4 4
RETI4
ADDRGP4 $126
JUMPV
LABELV $132
line 220
;219:	case GAME_CLIENT_THINK:
;220:		ClientThink( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 221
;221:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $133
line 223
;222:	case GAME_CLIENT_USERINFO_CHANGED:
;223:		ClientUserinfoChanged( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 224
;224:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $134
line 226
;225:	case GAME_CLIENT_DISCONNECT:
;226:		ClientDisconnect( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 227
;227:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $135
line 229
;228:	case GAME_CLIENT_BEGIN:
;229:		ClientBegin( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 230
;230:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $136
line 232
;231:	case GAME_CLIENT_COMMAND:
;232:		ClientCommand( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientCommand
CALLV
pop
line 233
;233:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $137
line 235
;234:	case GAME_RUN_FRAME:
;235:		G_RunFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_RunFrame
CALLV
pop
line 236
;236:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $126
JUMPV
LABELV $138
line 238
;237:	case GAME_CONSOLE_COMMAND:
;238:		return ConsoleCommand();
ADDRLP4 8
ADDRGP4 ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $126
JUMPV
LABELV $139
line 240
;239:	case BOTAI_START_FRAME:
;240:		return BotAIStartFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotAIStartFrame
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $126
JUMPV
LABELV $127
line 243
;241:	}
;242:
;243:	return -1;
CNSTI4 -1
RETI4
LABELV $126
endproc vmMain 16 12
export G_Printf
proc G_Printf 1028 12
line 247
;244:}
;245:
;246:
;247:void QDECL G_Printf( const char *fmt, ... ) {
line 251
;248:	va_list		argptr;
;249:	char		text[1024];
;250:
;251:	va_start (argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 252
;252:	vsprintf (text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 253
;253:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 255
;254:
;255:	trap_Printf( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 256
;256:}
LABELV $141
endproc G_Printf 1028 12
export G_Error
proc G_Error 1028 12
line 258
;257:
;258:void QDECL G_Error( const char *fmt, ... ) {
line 262
;259:	va_list		argptr;
;260:	char		text[1024];
;261:
;262:	va_start (argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 263
;263:	vsprintf (text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 264
;264:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 266
;265:
;266:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 267
;267:}
LABELV $143
endproc G_Error 1028 12
export G_FindTeams
proc G_FindTeams 48 12
line 280
;268:
;269:/*
;270:================
;271:G_FindTeams
;272:
;273:Chain together all entities with a matching team field.
;274:Entity teams are used for item groups and multi-entity mover groups.
;275:
;276:All but the first will have the FL_TEAMSLAVE flag set and teammaster field set
;277:All but the last will have the teamchain field set to the next one
;278:================
;279:*/
;280:void G_FindTeams( void ) {
line 285
;281:	gentity_t	*e, *e2;
;282:	int		i, j;
;283:	int		c, c2;
;284:
;285:	c = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 286
;286:	c2 = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 287
;287:	for ( i=1, e=g_entities+i ; i < level.num_entities ; i++,e++ ){
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
CNSTI4 824
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $149
JUMPV
LABELV $146
line 288
;288:		if (!e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $151
line 289
;289:			continue;
ADDRGP4 $147
JUMPV
LABELV $151
line 290
;290:		if (!e->team)
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 291
;291:			continue;
ADDRGP4 $147
JUMPV
LABELV $153
line 292
;292:		if (e->flags & FL_TEAMSLAVE)
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $155
line 293
;293:			continue;
ADDRGP4 $147
JUMPV
LABELV $155
line 294
;294:		e->teammaster = e;
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 295
;295:		c++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 296
;296:		c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:		for (j=i+1, e2=e+1 ; j < level.num_entities ; j++,e2++)
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
ADDRGP4 $160
JUMPV
LABELV $157
line 298
;298:		{
line 299
;299:			if (!e2->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $162
line 300
;300:				continue;
ADDRGP4 $158
JUMPV
LABELV $162
line 301
;301:			if (!e2->team)
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
line 302
;302:				continue;
ADDRGP4 $158
JUMPV
LABELV $164
line 303
;303:			if (e2->flags & FL_TEAMSLAVE)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $166
line 304
;304:				continue;
ADDRGP4 $158
JUMPV
LABELV $166
line 305
;305:			if (!strcmp(e->team, e2->team))
ADDRLP4 28
CNSTI4 656
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $168
line 306
;306:			{
line 307
;307:				c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 308
;308:				e2->teamchain = e->teamchain;
ADDRLP4 36
CNSTI4 776
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 309
;309:				e->teamchain = e2;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 310
;310:				e2->teammaster = e;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 311
;311:				e2->flags |= FL_TEAMSLAVE;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 314
;312:
;313:				// make sure that targets only point at the master
;314:				if ( e2->targetname ) {
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
line 315
;315:					e->targetname = e2->targetname;
ADDRLP4 44
CNSTI4 652
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 316
;316:					e2->targetname = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
CNSTP4 0
ASGNP4
line 317
;317:				}
LABELV $170
line 318
;318:			}
LABELV $168
line 319
;319:		}
LABELV $158
line 297
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $160
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $157
line 320
;320:	}
LABELV $147
line 287
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $149
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $146
line 322
;321:
;322:	G_Printf ("%i teams with %i entities\n", c, c2);
ADDRGP4 $172
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 323
;323:}
LABELV $145
endproc G_FindTeams 48 12
export G_RemapTeamShaders
proc G_RemapTeamShaders 0 0
line 325
;324:
;325:void G_RemapTeamShaders() {
line 337
;326:#ifdef MISSIONPACK
;327:	char string[1024];
;328:	float f = level.time * 0.001;
;329:	Com_sprintf( string, sizeof(string), "team_icon/%s_red", g_redteam.string );
;330:	AddRemap("textures/ctf2/redteam01", string, f); 
;331:	AddRemap("textures/ctf2/redteam02", string, f); 
;332:	Com_sprintf( string, sizeof(string), "team_icon/%s_blue", g_blueteam.string );
;333:	AddRemap("textures/ctf2/blueteam01", string, f); 
;334:	AddRemap("textures/ctf2/blueteam02", string, f); 
;335:	trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
;336:#endif
;337:}
LABELV $173
endproc G_RemapTeamShaders 0 0
export G_RegisterCvars
proc G_RegisterCvars 20 16
line 345
;338:
;339:
;340:/*
;341:=================
;342:G_RegisterCvars
;343:=================
;344:*/
;345:void G_RegisterCvars( void ) {
line 348
;346:	int			i;
;347:	cvarTable_t	*cv;
;348:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 350
;349:
;350:	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $175
line 351
;351:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 353
;352:			cv->defaultString, cv->cvarFlags );
;353:		if ( cv->vmCvar )
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
line 354
;354:			cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
LABELV $179
line 356
;355:
;356:		if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $181
line 357
;357:			remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 358
;358:		}
LABELV $181
line 359
;359:	}
LABELV $176
line 350
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $178
ADDRLP4 4
INDIRI4
ADDRGP4 gameCvarTableSize
INDIRI4
LTI4 $175
line 361
;360:
;361:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $183
line 362
;362:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 363
;363:	}
LABELV $183
line 366
;364:
;365:	// check some things
;366:	if ( g_gametype.integer < 0 || g_gametype.integer >= GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $189
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 10
LTI4 $185
LABELV $189
line 367
;367:		G_Printf( "g_gametype %i is out of range, defaulting to 0\n", g_gametype.integer );
ADDRGP4 $190
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 368
;368:		trap_Cvar_Set( "g_gametype", "0" );
ADDRGP4 $65
ARGP4
ADDRGP4 $63
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 369
;369:	}
LABELV $185
line 371
;370:
;371:	level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 372
;372:}
LABELV $174
endproc G_RegisterCvars 20 16
export G_UpdateCvars
proc G_UpdateCvars 28 12
line 379
;373:
;374:/*
;375:=================
;376:G_UpdateCvars
;377:=================
;378:*/
;379:void G_UpdateCvars( void ) {
line 382
;380:	int			i;
;381:	cvarTable_t	*cv;
;382:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 384
;383:
;384:	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $198
JUMPV
LABELV $195
line 385
;385:		if ( cv->vmCvar ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
line 386
;386:			trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 388
;387:
;388:			if ( cv->modificationCount != cv->vmCvar->modificationCount ) {
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
EQI4 $201
line 389
;389:				cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 391
;390:
;391:				if ( cv->trackChange ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $203
line 392
;392:					trap_SendServerCommand( -1, va("print \"Server: %s changed to %s\n\"", 
ADDRGP4 $205
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 394
;393:						cv->cvarName, cv->vmCvar->string ) );
;394:				}
LABELV $203
line 396
;395:
;396:				if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $206
line 397
;397:					remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 398
;398:				}
LABELV $206
line 399
;399:			}
LABELV $201
line 400
;400:		}
LABELV $199
line 401
;401:	}
LABELV $196
line 384
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $198
ADDRLP4 4
INDIRI4
ADDRGP4 gameCvarTableSize
INDIRI4
LTI4 $195
line 403
;402:
;403:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $208
line 404
;404:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 405
;405:	}
LABELV $208
line 406
;406:}
LABELV $194
endproc G_UpdateCvars 28 12
export G_InitGame
proc G_InitGame 1032 20
line 414
;407:
;408:/*
;409:============
;410:G_InitGame
;411:
;412:============
;413:*/
;414:void G_InitGame( int levelTime, int randomSeed, int restart ) {
line 417
;415:	int					i;
;416:
;417:	G_Printf ("------- Game Initialization -------\n");
ADDRGP4 $211
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 418
;418:	G_Printf ("gamename: %s\n", GAMEVERSION);
ADDRGP4 $212
ARGP4
ADDRGP4 $59
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 419
;419:	G_Printf ("gamedate: %s\n", __DATE__);
ADDRGP4 $213
ARGP4
ADDRGP4 $61
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 421
;420:
;421:	srand( randomSeed );
ADDRFP4 4
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 srand
CALLV
pop
line 423
;422:
;423:	G_RegisterCvars();
ADDRGP4 G_RegisterCvars
CALLV
pop
line 425
;424:
;425:	G_ProcessIPBans();
ADDRGP4 G_ProcessIPBans
CALLV
pop
line 427
;426:
;427:	G_InitMemory();
ADDRGP4 G_InitMemory
CALLV
pop
line 430
;428:
;429:	// set some level globals
;430:	memset( &level, 0, sizeof( level ) );
ADDRGP4 level
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9220
ARGI4
ADDRGP4 memset
CALLP4
pop
line 431
;431:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 432
;432:	level.startTime = levelTime;
ADDRGP4 level+40
ADDRFP4 0
INDIRI4
ASGNI4
line 434
;433:
;434:	level.snd_fry = G_SoundIndex("sound/player/fry.wav");	// FIXME standing in lava / slime
ADDRGP4 $217
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 level+352
ADDRLP4 4
INDIRI4
ASGNI4
line 436
;435:
;436:	if ( g_gametype.integer != GT_SINGLE_PLAYER && g_log.string[0] ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $218
ADDRGP4 g_log+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $218
line 437
;437:		if ( g_logSync.integer ) {
ADDRGP4 g_logSync+12
INDIRI4
CNSTI4 0
EQI4 $222
line 438
;438:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND_SYNC );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 439
;439:		} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 440
;440:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 441
;441:		}
LABELV $223
line 442
;442:		if ( !level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $229
line 443
;443:			G_Printf( "WARNING: Couldn't open logfile: %s\n", g_log.string );
ADDRGP4 $232
ARGP4
ADDRGP4 g_log+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 444
;444:		} else {
ADDRGP4 $219
JUMPV
LABELV $229
line 447
;445:			char	serverinfo[MAX_INFO_STRING];
;446:
;447:			trap_GetServerinfo( serverinfo, sizeof( serverinfo ) );
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 449
;448:
;449:			G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $234
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 450
;450:			G_LogPrintf("InitGame: %s\n", serverinfo );
ADDRGP4 $235
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 451
;451:		}
line 452
;452:	} else {
ADDRGP4 $219
JUMPV
LABELV $218
line 453
;453:		G_Printf( "Not logging to disk.\n" );
ADDRGP4 $236
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 454
;454:	}
LABELV $219
line 456
;455:
;456:	G_InitWorldSession();
ADDRGP4 G_InitWorldSession
CALLV
pop
line 459
;457:
;458:	// initialize all entities for this game
;459:	memset( g_entities, 0, MAX_GENTITIES * sizeof(g_entities[0]) );
ADDRGP4 g_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 843776
ARGI4
ADDRGP4 memset
CALLP4
pop
line 460
;460:	level.gentities = g_entities;
ADDRGP4 level+4
ADDRGP4 g_entities
ASGNP4
line 463
;461:
;462:	// initialize all clients for this game
;463:	level.maxclients = g_maxclients.integer;
ADDRGP4 level+24
ADDRGP4 g_maxclients+12
INDIRI4
ASGNI4
line 464
;464:	memset( g_clients, 0, MAX_CLIENTS * sizeof(g_clients[0]) );
ADDRGP4 g_clients
ARGP4
CNSTI4 0
ARGI4
CNSTI4 214272
ARGI4
ADDRGP4 memset
CALLP4
pop
line 465
;465:	level.clients = g_clients;
ADDRGP4 level
ADDRGP4 g_clients
ASGNP4
line 468
;466:
;467:	// set client fields on player ents
;468:	for ( i=0 ; i<level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $240
line 469
;469:		g_entities[i].client = level.clients + i;
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 470
;470:	}
LABELV $241
line 468
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $243
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $240
line 475
;471:
;472:	// always leave room for the max number of clients,
;473:	// even if they aren't all used, so numbers inside that
;474:	// range are NEVER anything but clients
;475:	level.num_entities = MAX_CLIENTS;
ADDRGP4 level+12
CNSTI4 64
ASGNI4
line 478
;476:
;477:	// let the server system know where the entites are
;478:	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 824
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 3348
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 482
;479:		&level.clients[0].ps, sizeof( level.clients[0] ) );
;480:
;481:	// reserve some spots for dead player bodies
;482:	InitBodyQue();
ADDRGP4 InitBodyQue
CALLV
pop
line 484
;483:
;484:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 487
;485:
;486:	// parse the key/value pairs and spawn gentities
;487:	G_SpawnEntitiesFromString();
ADDRGP4 G_SpawnEntitiesFromString
CALLV
pop
line 490
;488:
;489:	// general initialization
;490:	G_FindTeams();
ADDRGP4 G_FindTeams
CALLV
pop
line 493
;491:
;492:	// make sure we have flags for CTF, etc
;493:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $249
line 494
;494:		G_CheckTeamItems();
ADDRGP4 G_CheckTeamItems
CALLV
pop
line 495
;495:	}
LABELV $249
line 497
;496:
;497:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 499
;498:
;499:	G_Printf ("-----------------------------------\n");
ADDRGP4 $252
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 501
;500:
;501:	if( g_gametype.integer == GT_SINGLE_PLAYER || trap_Cvar_VariableIntegerValue( "com_buildScript" ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $257
ADDRGP4 $256
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $253
LABELV $257
line 502
;502:		G_ModelIndex( SP_PODIUM_MODEL );
ADDRGP4 $258
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 503
;503:		G_SoundIndex( "sound/player/gurp1.wav" );
ADDRGP4 $259
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 504
;504:		G_SoundIndex( "sound/player/gurp2.wav" );
ADDRGP4 $260
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 505
;505:	}
LABELV $253
line 507
;506:
;507:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $263
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $261
line 508
;508:		BotAISetup( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAISetup
CALLI4
pop
line 509
;509:		BotAILoadMap( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAILoadMap
CALLI4
pop
line 510
;510:		G_InitBots( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitBots
CALLV
pop
line 511
;511:	}
LABELV $261
line 513
;512:
;513:	G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 515
;514:
;515:}
LABELV $210
endproc G_InitGame 1032 20
export G_ShutdownGame
proc G_ShutdownGame 4 4
line 524
;516:
;517:
;518:
;519:/*
;520:=================
;521:G_ShutdownGame
;522:=================
;523:*/
;524:void G_ShutdownGame( int restart ) {
line 525
;525:	G_Printf ("==== ShutdownGame ====\n");
ADDRGP4 $265
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 527
;526:
;527:	if ( level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
EQI4 $266
line 528
;528:		G_LogPrintf("ShutdownGame:\n" );
ADDRGP4 $269
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 529
;529:		G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $234
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 530
;530:		trap_FS_FCloseFile( level.logFile );
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 531
;531:	}
LABELV $266
line 534
;532:
;533:	// write all the client session data so we can get it back
;534:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 536
;535:
;536:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $263
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $271
line 537
;537:		BotAIShutdown( restart );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdown
CALLI4
pop
line 538
;538:	}
LABELV $271
line 539
;539:}
LABELV $264
endproc G_ShutdownGame 4 4
export Com_Error
proc Com_Error 1028 12
line 548
;540:
;541:
;542:
;543://===================================================================
;544:
;545:#ifndef GAME_HARD_LINKED
;546:// this is only here so the functions in q_shared.c and bg_*.c can link
;547:
;548:void QDECL Com_Error ( int level, const char *error, ... ) {
line 552
;549:	va_list		argptr;
;550:	char		text[1024];
;551:
;552:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 553
;553:	vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 554
;554:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 556
;555:
;556:	G_Error( "%s", text);
ADDRGP4 $275
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 557
;557:}
LABELV $273
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 559
;558:
;559:void QDECL Com_Printf( const char *msg, ... ) {
line 563
;560:	va_list		argptr;
;561:	char		text[1024];
;562:
;563:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 564
;564:	vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 565
;565:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 567
;566:
;567:	G_Printf ("%s", text);
ADDRGP4 $275
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 568
;568:}
LABELV $276
endproc Com_Printf 1028 12
export AddTournamentPlayer
proc AddTournamentPlayer 24 8
line 588
;569:
;570:#endif
;571:
;572:/*
;573:========================================================================
;574:
;575:PLAYER COUNTING / SCORE SORTING
;576:
;577:========================================================================
;578:*/
;579:
;580:/*
;581:=============
;582:AddTournamentPlayer
;583:
;584:If there are less than two tournament players, put a
;585:spectator in the game and restart
;586:=============
;587:*/
;588:void AddTournamentPlayer( void ) {
line 593
;589:	int			i;
;590:	gclient_t	*client;
;591:	gclient_t	*nextInLine;
;592:
;593:	if ( level.numPlayingClients >= 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
LTI4 $279
line 594
;594:		return;
ADDRGP4 $278
JUMPV
LABELV $279
line 598
;595:	}
;596:
;597:	// never change during intermission
;598:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $282
line 599
;599:		return;
ADDRGP4 $278
JUMPV
LABELV $282
line 602
;600:	}
;601:
;602:	nextInLine = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 604
;603:
;604:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 605
;605:		client = &level.clients[i];
ADDRLP4 0
CNSTI4 3348
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 606
;606:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $290
line 607
;607:			continue;
ADDRGP4 $286
JUMPV
LABELV $290
line 609
;608:		}
;609:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 3
EQI4 $292
line 610
;610:			continue;
ADDRGP4 $286
JUMPV
LABELV $292
line 613
;611:		}
;612:		// never select the dedicated follow or scoreboard clients
;613:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD || 
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 3
EQI4 $296
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
GEI4 $294
LABELV $296
line 614
;614:			client->sess.spectatorClient < 0  ) {
line 615
;615:			continue;
ADDRGP4 $286
JUMPV
LABELV $294
line 618
;616:		}
;617:
;618:		if ( !nextInLine || client->sess.spectatorTime < nextInLine->sess.spectatorTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $299
ADDRLP4 20
CNSTI4 2452
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
GEI4 $297
LABELV $299
line 619
;619:			nextInLine = client;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 620
;620:		}
LABELV $297
line 621
;621:	}
LABELV $286
line 604
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $288
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $285
line 623
;622:
;623:	if ( !nextInLine ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $300
line 624
;624:		return;
ADDRGP4 $278
JUMPV
LABELV $300
line 627
;625:	}
;626:
;627:	level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 630
;628:
;629:	// set them to free-for-all team
;630:	SetTeam( &g_entities[ nextInLine - level.clients ], "f" );
CNSTI4 824
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3348
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $303
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 631
;631:}
LABELV $278
endproc AddTournamentPlayer 24 8
export RemoveTournamentLoser
proc RemoveTournamentLoser 4 8
line 640
;632:
;633:/*
;634:=======================
;635:RemoveTournamentLoser
;636:
;637:Make the loser a spectator at the back of the line
;638:=======================
;639:*/
;640:void RemoveTournamentLoser( void ) {
line 643
;641:	int			clientNum;
;642:
;643:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $305
line 644
;644:		return;
ADDRGP4 $304
JUMPV
LABELV $305
line 647
;645:	}
;646:
;647:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+88+4
INDIRI4
ASGNI4
line 649
;648:
;649:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $310
line 650
;650:		return;
ADDRGP4 $304
JUMPV
LABELV $310
line 654
;651:	}
;652:
;653:	// make them a spectator
;654:	SetTeam( &g_entities[ clientNum ], "s" );
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 655
;655:}
LABELV $304
endproc RemoveTournamentLoser 4 8
export RemoveTournamentWinner
proc RemoveTournamentWinner 4 8
line 662
;656:
;657:/*
;658:=======================
;659:RemoveTournamentWinner
;660:=======================
;661:*/
;662:void RemoveTournamentWinner( void ) {
line 665
;663:	int			clientNum;
;664:
;665:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $314
line 666
;666:		return;
ADDRGP4 $313
JUMPV
LABELV $314
line 669
;667:	}
;668:
;669:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
ASGNI4
line 671
;670:
;671:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $318
line 672
;672:		return;
ADDRGP4 $313
JUMPV
LABELV $318
line 676
;673:	}
;674:
;675:	// make them a spectator
;676:	SetTeam( &g_entities[ clientNum ], "s" );
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 677
;677:}
LABELV $313
endproc RemoveTournamentWinner 4 8
export AdjustTournamentScores
proc AdjustTournamentScores 8 4
line 684
;678:
;679:/*
;680:=======================
;681:AdjustTournamentScores
;682:=======================
;683:*/
;684:void AdjustTournamentScores( void ) {
line 687
;685:	int			clientNum;
;686:
;687:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
ASGNI4
line 688
;688:	if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $322
line 689
;689:		level.clients[ clientNum ].sess.wins++;
ADDRLP4 4
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2464
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 690
;690:		ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 691
;691:	}
LABELV $322
line 693
;692:
;693:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+88+4
INDIRI4
ASGNI4
line 694
;694:	if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $326
line 695
;695:		level.clients[ clientNum ].sess.losses++;
ADDRLP4 4
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 696
;696:		ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 697
;697:	}
LABELV $326
line 699
;698:
;699:}
LABELV $320
endproc AdjustTournamentScores 8 4
export SortRanks
proc SortRanks 32 0
line 707
;700:
;701:/*
;702:=============
;703:SortRanks
;704:
;705:=============
;706:*/
;707:int QDECL SortRanks( const void *a, const void *b ) {
line 710
;708:	gclient_t	*ca, *cb;
;709:
;710:	ca = &level.clients[*(int *)a];
ADDRLP4 0
CNSTI4 3348
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 711
;711:	cb = &level.clients[*(int *)b];
ADDRLP4 4
CNSTI4 3348
ADDRFP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 714
;712:
;713:	// sort special clients last
;714:	if ( ca->sess.spectatorState == SPECTATOR_SCOREBOARD || ca->sess.spectatorClient < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 3
EQI4 $331
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
GEI4 $329
LABELV $331
line 715
;715:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $329
line 717
;716:	}
;717:	if ( cb->sess.spectatorState == SPECTATOR_SCOREBOARD || cb->sess.spectatorClient < 0  ) {
ADDRLP4 4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 3
EQI4 $334
ADDRLP4 4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
GEI4 $332
LABELV $334
line 718
;718:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $328
JUMPV
LABELV $332
line 722
;719:	}
;720:
;721:	// then connecting clients
;722:	if ( ca->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $335
line 723
;723:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $335
line 725
;724:	}
;725:	if ( cb->pers.connected == CON_CONNECTING ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $337
line 726
;726:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $328
JUMPV
LABELV $337
line 731
;727:	}
;728:
;729:
;730:	// then spectators
;731:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR && cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 16
CNSTI4 2448
ASGNI4
ADDRLP4 20
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $339
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $339
line 732
;732:		if ( ca->sess.spectatorTime < cb->sess.spectatorTime ) {
ADDRLP4 24
CNSTI4 2452
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
GEI4 $341
line 733
;733:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $328
JUMPV
LABELV $341
line 735
;734:		}
;735:		if ( ca->sess.spectatorTime > cb->sess.spectatorTime ) {
ADDRLP4 28
CNSTI4 2452
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
LEI4 $343
line 736
;736:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $343
line 738
;737:		}
;738:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $339
line 740
;739:	}
;740:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 3
NEI4 $345
line 741
;741:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $345
line 743
;742:	}
;743:	if ( cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 3
NEI4 $347
line 744
;744:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $328
JUMPV
LABELV $347
line 748
;745:	}
;746:
;747:	// then sort by score
;748:	if ( ca->ps.persistant[PERS_SCORE]
ADDRLP4 24
CNSTI4 248
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
LEI4 $349
line 749
;749:		> cb->ps.persistant[PERS_SCORE] ) {
line 750
;750:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $328
JUMPV
LABELV $349
line 752
;751:	}
;752:	if ( ca->ps.persistant[PERS_SCORE]
ADDRLP4 28
CNSTI4 248
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
GEI4 $351
line 753
;753:		< cb->ps.persistant[PERS_SCORE] ) {
line 754
;754:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $328
JUMPV
LABELV $351
line 756
;755:	}
;756:	return 0;
CNSTI4 0
RETI4
LABELV $328
endproc SortRanks 32 0
export CalculateRanks
proc CalculateRanks 44 16
line 768
;757:}
;758:
;759:/*
;760:============
;761:CalculateRanks
;762:
;763:Recalculates the score ranks of all players
;764:This will be called on every client connect, begin, disconnect, death,
;765:and team change.
;766:============
;767:*/
;768:void CalculateRanks( void ) {
line 775
;769:	int		i;
;770:	int		rank;
;771:	int		score;
;772:	int		newScore;
;773:	gclient_t	*cl;
;774:
;775:	level.follow1 = -1;
ADDRGP4 level+344
CNSTI4 -1
ASGNI4
line 776
;776:	level.follow2 = -1;
ADDRGP4 level+348
CNSTI4 -1
ASGNI4
line 777
;777:	level.numConnectedClients = 0;
ADDRGP4 level+76
CNSTI4 0
ASGNI4
line 778
;778:	level.numNonSpectatorClients = 0;
ADDRGP4 level+80
CNSTI4 0
ASGNI4
line 779
;779:	level.numPlayingClients = 0;
ADDRGP4 level+84
CNSTI4 0
ASGNI4
line 780
;780:	level.numVotingClients = 0;		// don't count bots
ADDRGP4 level+2424
CNSTI4 0
ASGNI4
line 781
;781:	for ( i = 0; i < TEAM_NUM_TEAMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $360
line 782
;782:		level.numteamVotingClients[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4500
ADDP4
CNSTI4 0
ASGNI4
line 783
;783:	}
LABELV $361
line 781
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $360
line 784
;784:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $365
line 785
;785:		if ( level.clients[i].pers.connected != CON_DISCONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 786
;786:			level.sortedClients[level.numConnectedClients] = i;
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 787
;787:			level.numConnectedClients++;
ADDRLP4 20
ADDRGP4 level+76
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 789
;788:
;789:			if ( level.clients[i].sess.sessionTeam != TEAM_SPECTATOR ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 3
EQI4 $375
line 790
;790:				level.numNonSpectatorClients++;
ADDRLP4 24
ADDRGP4 level+80
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 793
;791:			
;792:				// decide if this should be auto-followed
;793:				if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $378
line 794
;794:					level.numPlayingClients++;
ADDRLP4 28
ADDRGP4 level+84
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 795
;795:					if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $381
line 796
;796:						level.numVotingClients++;
ADDRLP4 32
ADDRGP4 level+2424
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 797
;797:						if ( level.clients[i].sess.sessionTeam == TEAM_RED )
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 1
NEI4 $386
line 798
;798:							level.numteamVotingClients[0]++;
ADDRLP4 36
ADDRGP4 level+4500
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $387
JUMPV
LABELV $386
line 799
;799:						else if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $389
line 800
;800:							level.numteamVotingClients[1]++;
ADDRLP4 40
ADDRGP4 level+4500+4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $389
LABELV $387
line 801
;801:					}
LABELV $381
line 802
;802:					if ( level.follow1 == -1 ) {
ADDRGP4 level+344
INDIRI4
CNSTI4 -1
NEI4 $393
line 803
;803:						level.follow1 = i;
ADDRGP4 level+344
ADDRLP4 0
INDIRI4
ASGNI4
line 804
;804:					} else if ( level.follow2 == -1 ) {
ADDRGP4 $394
JUMPV
LABELV $393
ADDRGP4 level+348
INDIRI4
CNSTI4 -1
NEI4 $397
line 805
;805:						level.follow2 = i;
ADDRGP4 level+348
ADDRLP4 0
INDIRI4
ASGNI4
line 806
;806:					}
LABELV $397
LABELV $394
line 807
;807:				}
LABELV $378
line 808
;808:			}
LABELV $375
line 809
;809:		}
LABELV $370
line 810
;810:	}
LABELV $366
line 784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $368
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $365
line 812
;811:
;812:	qsort( level.sortedClients, level.numConnectedClients, 
ADDRGP4 level+88
ARGP4
ADDRGP4 level+76
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortRanks
ARGP4
ADDRGP4 qsort
CALLV
pop
line 816
;813:		sizeof(level.sortedClients[0]), SortRanks );
;814:
;815:	// set the rank value for all clients that are connected and not spectators
;816:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $404
line 818
;817:		// in team games, rank is just the order of the teams, 0=red, 1=blue, 2=tied
;818:		for ( i = 0;  i < level.numConnectedClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $407
line 819
;819:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
CNSTI4 3348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 820
;820:			if ( level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $413
line 821
;821:				cl->ps.persistant[PERS_RANK] = 2;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 822
;822:			} else if ( level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE] ) {
ADDRGP4 $414
JUMPV
LABELV $413
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $419
line 823
;823:				cl->ps.persistant[PERS_RANK] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 824
;824:			} else {
ADDRGP4 $420
JUMPV
LABELV $419
line 825
;825:				cl->ps.persistant[PERS_RANK] = 1;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 826
;826:			}
LABELV $420
LABELV $414
line 827
;827:		}
LABELV $408
line 818
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $410
ADDRLP4 0
INDIRI4
ADDRGP4 level+76
INDIRI4
LTI4 $407
line 828
;828:	} else {	
ADDRGP4 $405
JUMPV
LABELV $404
line 829
;829:		rank = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 830
;830:		score = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 831
;831:		for ( i = 0;  i < level.numPlayingClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $428
JUMPV
LABELV $425
line 832
;832:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
CNSTI4 3348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 833
;833:			newScore = cl->ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 834
;834:			if ( i == 0 || newScore != score ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $433
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $431
LABELV $433
line 835
;835:				rank = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 837
;836:				// assume we aren't tied until the next client is checked
;837:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank;
CNSTI4 3348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 838
;838:			} else {
ADDRGP4 $432
JUMPV
LABELV $431
line 840
;839:				// we are tied with the previous client
;840:				level.clients[ level.sortedClients[i-1] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 3348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88-4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 841
;841:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 3348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 842
;842:			}
LABELV $432
line 843
;843:			score = newScore;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
line 844
;844:			if ( g_gametype.integer == GT_SINGLE_PLAYER && level.numPlayingClients == 1 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $438
ADDRGP4 level+84
INDIRI4
CNSTI4 1
NEI4 $438
line 845
;845:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 3348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 846
;846:			}
LABELV $438
line 847
;847:		}
LABELV $426
line 831
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $428
ADDRLP4 0
INDIRI4
ADDRGP4 level+84
INDIRI4
LTI4 $425
line 848
;848:	}
LABELV $405
line 851
;849:
;850:	// set the CS_SCORES1/2 configstrings, which will be visible to everyone
;851:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $443
line 852
;852:		trap_SetConfigstring( CS_SCORES1, va("%i", level.teamScores[TEAM_RED] ) );
ADDRGP4 $446
ARGP4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 853
;853:		trap_SetConfigstring( CS_SCORES2, va("%i", level.teamScores[TEAM_BLUE] ) );
ADDRGP4 $446
ARGP4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 854
;854:	} else {
ADDRGP4 $444
JUMPV
LABELV $443
line 855
;855:		if ( level.numConnectedClients == 0 ) {
ADDRGP4 level+76
INDIRI4
CNSTI4 0
NEI4 $451
line 856
;856:			trap_SetConfigstring( CS_SCORES1, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $446
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 857
;857:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $446
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 858
;858:		} else if ( level.numConnectedClients == 1 ) {
ADDRGP4 $452
JUMPV
LABELV $451
ADDRGP4 level+76
INDIRI4
CNSTI4 1
NEI4 $454
line 859
;859:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $446
ARGP4
CNSTI4 3348
ADDRGP4 level+88
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 860
;860:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $446
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 861
;861:		} else {
ADDRGP4 $455
JUMPV
LABELV $454
line 862
;862:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $446
ARGP4
CNSTI4 3348
ADDRGP4 level+88
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 863
;863:			trap_SetConfigstring( CS_SCORES2, va("%i", level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $446
ARGP4
CNSTI4 3348
ADDRGP4 level+88+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 864
;864:		}
LABELV $455
LABELV $452
line 865
;865:	}
LABELV $444
line 868
;866:
;867:	// see if it is time to end the level
;868:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 871
;869:
;870:	// if we are at the intermission, send the new info to everyone
;871:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $461
line 872
;872:		SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 873
;873:	}
LABELV $461
line 874
;874:}
LABELV $353
endproc CalculateRanks 44 16
export SendScoreboardMessageToAllClients
proc SendScoreboardMessageToAllClients 4 4
line 893
;875:
;876:
;877:/*
;878:========================================================================
;879:
;880:MAP CHANGING
;881:
;882:========================================================================
;883:*/
;884:
;885:/*
;886:========================
;887:SendScoreboardMessageToAllClients
;888:
;889:Do this at BeginIntermission time and whenever ranks are recalculated
;890:due to enters/exits/forced team changes
;891:========================
;892:*/
;893:void SendScoreboardMessageToAllClients( void ) {
line 896
;894:	int		i;
;895:
;896:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $468
JUMPV
LABELV $465
line 897
;897:		if ( level.clients[ i ].pers.connected == CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $470
line 898
;898:			DeathmatchScoreboardMessage( g_entities + i );
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 899
;899:		}
LABELV $470
line 900
;900:	}
LABELV $466
line 896
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $468
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $465
line 901
;901:}
LABELV $464
endproc SendScoreboardMessageToAllClients 4 4
export MoveClientToIntermission
proc MoveClientToIntermission 0 12
line 911
;902:
;903:/*
;904:========================
;905:MoveClientToIntermission
;906:
;907:When the intermission starts, this will be called for all players.
;908:If a new client connects, this will be called after the spawn function.
;909:========================
;910:*/
;911:void MoveClientToIntermission( gentity_t *ent ) {
line 913
;912:	// take out of follow mode if needed
;913:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 2
NEI4 $473
line 914
;914:		StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 915
;915:	}
LABELV $473
line 919
;916:
;917:
;918:	// move to the spot
;919:	VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+9148
INDIRB
ASGNB 12
line 920
;920:	VectorCopy( level.intermission_origin, ent->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+9148
INDIRB
ASGNB 12
line 921
;921:	VectorCopy (level.intermission_angle, ent->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 level+9160
INDIRB
ASGNB 12
line 922
;922:	ent->client->ps.pm_type = PM_INTERMISSION;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 925
;923:
;924:	// clean up powerup info
;925:	memset( ent->client->ps.powerups, 0, sizeof(ent->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 927
;926:
;927:	ent->client->ps.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 0
ASGNI4
line 928
;928:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 929
;929:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 930
;930:	ent->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 931
;931:	ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 932
;932:	ent->s.event = 0;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 933
;933:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 934
;934:}
LABELV $472
endproc MoveClientToIntermission 0 12
export FindIntermissionPoint
proc FindIntermissionPoint 32 12
line 943
;935:
;936:/*
;937:==================
;938:FindIntermissionPoint
;939:
;940:This is also used for spectator spawns
;941:==================
;942:*/
;943:void FindIntermissionPoint( void ) {
line 948
;944:	gentity_t	*ent, *target;
;945:	vec3_t		dir;
;946:
;947:	// find the intermission spot
;948:	ent = G_Find (NULL, FOFS(classname), "info_player_intermission");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $479
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 949
;949:	if ( !ent ) {	// the map creator forgot to put in an intermission point...
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $480
line 950
;950:		SelectSpawnPoint ( vec3_origin, level.intermission_origin, level.intermission_angle );
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 level+9148
ARGP4
ADDRGP4 level+9160
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 951
;951:	} else {
ADDRGP4 $481
JUMPV
LABELV $480
line 952
;952:		VectorCopy (ent->s.origin, level.intermission_origin);
ADDRGP4 level+9148
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 953
;953:		VectorCopy (ent->s.angles, level.intermission_angle);
ADDRGP4 level+9160
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 955
;954:		// if it has a target, look towards it
;955:		if ( ent->target ) {
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $486
line 956
;956:			target = G_PickTarget( ent->target );
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 957
;957:			if ( target ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $488
line 958
;958:				VectorSubtract( target->s.origin, level.intermission_origin, dir );
ADDRLP4 28
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 level+9148
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 level+9148+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 level+9148+8
INDIRF4
SUBF4
ASGNF4
line 959
;959:				vectoangles( dir, level.intermission_angle );
ADDRLP4 8
ARGP4
ADDRGP4 level+9160
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 960
;960:			}
LABELV $488
line 961
;961:		}
LABELV $486
line 962
;962:	}
LABELV $481
line 964
;963:
;964:}
LABELV $478
endproc FindIntermissionPoint 32 12
export BeginIntermission
proc BeginIntermission 8 4
line 971
;965:
;966:/*
;967:==================
;968:BeginIntermission
;969:==================
;970:*/
;971:void BeginIntermission( void ) {
line 975
;972:	int			i;
;973:	gentity_t	*client;
;974:
;975:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $499
line 976
;976:		return;		// already active
ADDRGP4 $498
JUMPV
LABELV $499
line 980
;977:	}
;978:
;979:	// if in tournement mode, change the wins / losses
;980:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $502
line 981
;981:		AdjustTournamentScores();
ADDRGP4 AdjustTournamentScores
CALLV
pop
line 982
;982:	}
LABELV $502
line 984
;983:
;984:	level.intermissiontime = level.time;
ADDRGP4 level+9132
ADDRGP4 level+32
INDIRI4
ASGNI4
line 985
;985:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 994
;986:
;987:#ifdef MISSIONPACK
;988:	if (g_singlePlayer.integer) {
;989:		trap_Cvar_Set("ui_singlePlayerActive", "0");
;990:		UpdateTournamentInfo();
;991:	}
;992:#else
;993:	// if single player game
;994:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $507
line 995
;995:		UpdateTournamentInfo();
ADDRGP4 UpdateTournamentInfo
CALLV
pop
line 996
;996:		SpawnModelsOnVictoryPads();
ADDRGP4 SpawnModelsOnVictoryPads
CALLV
pop
line 997
;997:	}
LABELV $507
line 1001
;998:#endif
;999:
;1000:	// move all clients to the intermission point
;1001:	for (i=0 ; i< level.maxclients ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $513
JUMPV
LABELV $510
line 1002
;1002:		client = g_entities + i;
ADDRLP4 0
CNSTI4 824
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1003
;1003:		if (!client->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $515
line 1004
;1004:			continue;
ADDRGP4 $511
JUMPV
LABELV $515
line 1006
;1005:		// respawn if dead
;1006:		if (client->health <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $517
line 1007
;1007:			respawn(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1008
;1008:		}
LABELV $517
line 1009
;1009:		MoveClientToIntermission( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1010
;1010:	}
LABELV $511
line 1001
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $513
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $510
line 1013
;1011:
;1012:	// send the current scoring to all clients
;1013:	SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 1015
;1014:
;1015:}
LABELV $498
endproc BeginIntermission 8 4
export ExitLevel
proc ExitLevel 8 8
line 1027
;1016:
;1017:
;1018:/*
;1019:=============
;1020:ExitLevel
;1021:
;1022:When the intermission has been exited, the server is either killed
;1023:or moved to a new level based on the "nextmap" cvar 
;1024:
;1025:=============
;1026:*/
;1027:void ExitLevel (void) {
line 1032
;1028:	int		i;
;1029:	gclient_t *cl;
;1030:
;1031:	//bot interbreeding
;1032:	BotInterbreedEndMatch();
ADDRGP4 BotInterbreedEndMatch
CALLV
pop
line 1036
;1033:
;1034:	// if we are running a tournement map, kick the loser to spectator status,
;1035:	// which will automatically grab the next spectator and restart
;1036:	if ( g_gametype.integer == GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $520
line 1037
;1037:		if ( !level.restarted ) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $519
line 1038
;1038:			RemoveTournamentLoser();
ADDRGP4 RemoveTournamentLoser
CALLV
pop
line 1039
;1039:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $526
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1040
;1040:			level.restarted = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 1041
;1041:			level.changemap = NULL;
ADDRGP4 level+9136
CNSTP4 0
ASGNP4
line 1042
;1042:			level.intermissiontime = 0;
ADDRGP4 level+9132
CNSTI4 0
ASGNI4
line 1043
;1043:		}
line 1044
;1044:		return;	
ADDRGP4 $519
JUMPV
LABELV $520
line 1048
;1045:	}
;1046:
;1047:
;1048:	trap_SendConsoleCommand( EXEC_APPEND, "vstr nextmap\n" );
CNSTI4 2
ARGI4
ADDRGP4 $530
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1049
;1049:	level.changemap = NULL;
ADDRGP4 level+9136
CNSTP4 0
ASGNP4
line 1050
;1050:	level.intermissiontime = 0;
ADDRGP4 level+9132
CNSTI4 0
ASGNI4
line 1053
;1051:
;1052:	// reset all the scores so we don't enter the intermission again
;1053:	level.teamScores[TEAM_RED] = 0;
ADDRGP4 level+44+4
CNSTI4 0
ASGNI4
line 1054
;1054:	level.teamScores[TEAM_BLUE] = 0;
ADDRGP4 level+44+8
CNSTI4 0
ASGNI4
line 1055
;1055:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $537
line 1056
;1056:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1057
;1057:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $542
line 1058
;1058:			continue;
ADDRGP4 $538
JUMPV
LABELV $542
line 1060
;1059:		}
;1060:		cl->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1061
;1061:	}
LABELV $538
line 1055
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $540
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $537
line 1064
;1062:
;1063:	// we need to do this here before chaning to CON_CONNECTING
;1064:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 1068
;1065:
;1066:	// change all client states to connecting, so the early players into the
;1067:	// next level will know the others aren't done reconnecting
;1068:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $547
JUMPV
LABELV $544
line 1069
;1069:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $549
line 1070
;1070:			level.clients[i].pers.connected = CON_CONNECTING;
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1071
;1071:		}
LABELV $549
line 1072
;1072:	}
LABELV $545
line 1068
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $547
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $544
line 1074
;1073:
;1074:}
LABELV $519
endproc ExitLevel 8 8
export G_LogPrintf
proc G_LogPrintf 1044 24
line 1083
;1075:
;1076:/*
;1077:=================
;1078:G_LogPrintf
;1079:
;1080:Print to the logfile with a time stamp if it is open
;1081:=================
;1082:*/
;1083:void QDECL G_LogPrintf( const char *fmt, ... ) {
line 1088
;1084:	va_list		argptr;
;1085:	char		string[1024];
;1086:	int			min, tens, sec;
;1087:
;1088:	sec = level.time / 1000;
ADDRLP4 0
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 1090
;1089:
;1090:	min = sec / 60;
ADDRLP4 1032
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1091
;1091:	sec -= min * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 1032
INDIRI4
MULI4
SUBI4
ASGNI4
line 1092
;1092:	tens = sec / 10;
ADDRLP4 1036
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1093
;1093:	sec -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 1036
INDIRI4
MULI4
SUBI4
ASGNI4
line 1095
;1094:
;1095:	Com_sprintf( string, sizeof(string), "%3i:%i%i ", min, tens, sec );
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $553
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1097
;1096:
;1097:	va_start( argptr, fmt );
ADDRLP4 1028
ADDRFP4 0+4
ASGNP4
line 1098
;1098:	vsprintf( string +7 , fmt,argptr );
ADDRLP4 4+7
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 1099
;1099:	va_end( argptr );
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 1101
;1100:
;1101:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $556
line 1102
;1102:		G_Printf( "%s", string + 7 );
ADDRGP4 $275
ARGP4
ADDRLP4 4+7
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1103
;1103:	}
LABELV $556
line 1105
;1104:
;1105:	if ( !level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $560
line 1106
;1106:		return;
ADDRGP4 $551
JUMPV
LABELV $560
line 1109
;1107:	}
;1108:
;1109:	trap_FS_Write( string, strlen( string ), level.logFile );
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1110
;1110:}
LABELV $551
endproc G_LogPrintf 1044 24
export LogExit
proc LogExit 24 20
line 1119
;1111:
;1112:/*
;1113:================
;1114:LogExit
;1115:
;1116:Append information about this game to the log file
;1117:================
;1118:*/
;1119:void LogExit( const char *string ) {
line 1125
;1120:	int				i, numSorted;
;1121:	gclient_t		*cl;
;1122:#ifdef MISSIONPACK // bk001205
;1123:	qboolean won = qtrue;
;1124:#endif
;1125:	G_LogPrintf( "Exit: %s\n", string );
ADDRGP4 $565
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1127
;1126:
;1127:	level.intermissionQueued = level.time;
ADDRGP4 level+9128
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1131
;1128:
;1129:	// this will keep the clients from playing any voice sounds
;1130:	// that will get cut off when the queued intermission starts
;1131:	trap_SetConfigstring( CS_INTERMISSION, "1" );
CNSTI4 22
ARGI4
ADDRGP4 $86
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1134
;1132:
;1133:	// don't send more than 32 scores (FIXME?)
;1134:	numSorted = level.numConnectedClients;
ADDRLP4 8
ADDRGP4 level+76
INDIRI4
ASGNI4
line 1135
;1135:	if ( numSorted > 32 ) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $569
line 1136
;1136:		numSorted = 32;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 1137
;1137:	}
LABELV $569
line 1139
;1138:
;1139:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $571
line 1140
;1140:		G_LogPrintf( "red:%i  blue:%i\n",
ADDRGP4 $574
ARGP4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1142
;1141:			level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE] );
;1142:	}
LABELV $571
line 1144
;1143:
;1144:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $582
JUMPV
LABELV $579
line 1147
;1145:		int		ping;
;1146:
;1147:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3348
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1149
;1148:
;1149:		if ( cl->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 3
NEI4 $584
line 1150
;1150:			continue;
ADDRGP4 $580
JUMPV
LABELV $584
line 1152
;1151:		}
;1152:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $586
line 1153
;1153:			continue;
ADDRGP4 $580
JUMPV
LABELV $586
line 1156
;1154:		}
;1155:
;1156:		ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $589
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $590
JUMPV
LABELV $589
ADDRLP4 16
CNSTI4 999
ASGNI4
LABELV $590
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1158
;1157:
;1158:		G_LogPrintf( "score: %i  ping: %i  client: %i %s\n", cl->ps.persistant[PERS_SCORE], ping, level.sortedClients[i],	cl->pers.netname );
ADDRGP4 $591
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1167
;1159:#ifdef MISSIONPACK
;1160:		if (g_singlePlayer.integer && g_gametype.integer == GT_TOURNAMENT) {
;1161:			if (g_entities[cl - level.clients].r.svFlags & SVF_BOT && cl->ps.persistant[PERS_RANK] == 0) {
;1162:				won = qfalse;
;1163:			}
;1164:		}
;1165:#endif
;1166:
;1167:	}
LABELV $580
line 1144
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $582
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $579
line 1179
;1168:
;1169:#ifdef MISSIONPACK
;1170:	if (g_singlePlayer.integer) {
;1171:		if (g_gametype.integer >= GT_CTF) {
;1172:			won = level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE];
;1173:		}
;1174:		trap_SendConsoleCommand( EXEC_APPEND, (won) ? "spWin\n" : "spLose\n" );
;1175:	}
;1176:#endif
;1177:
;1178:
;1179:}
LABELV $564
endproc LogExit 24 20
export CheckIntermissionExit
proc CheckIntermissionExit 20 0
line 1192
;1180:
;1181:
;1182:/*
;1183:=================
;1184:CheckIntermissionExit
;1185:
;1186:The level will stay at the intermission for a minimum of 5 seconds
;1187:If all players wish to continue, the level will then exit.
;1188:If one or more players have not acknowledged the continue, the game will
;1189:wait 10 seconds before going on.
;1190:=================
;1191:*/
;1192:void CheckIntermissionExit( void ) {
line 1198
;1193:	int			ready, notReady;
;1194:	int			i;
;1195:	gclient_t	*cl;
;1196:	int			readyMask;
;1197:
;1198:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $594
line 1199
;1199:		return;
ADDRGP4 $593
JUMPV
LABELV $594
line 1203
;1200:	}
;1201:
;1202:	// see which players are ready
;1203:	ready = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1204
;1204:	notReady = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1205
;1205:	readyMask = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1206
;1206:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $600
JUMPV
LABELV $597
line 1207
;1207:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3348
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1208
;1208:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $602
line 1209
;1209:			continue;
ADDRGP4 $598
JUMPV
LABELV $602
line 1211
;1210:		}
;1211:		if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
CNSTI4 824
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $604
line 1212
;1212:			continue;
ADDRGP4 $598
JUMPV
LABELV $604
line 1215
;1213:		}
;1214:
;1215:		if ( cl->readyToExit ) {
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $608
line 1216
;1216:			ready++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1217
;1217:			if ( i < 16 ) {
ADDRLP4 4
INDIRI4
CNSTI4 16
GEI4 $609
line 1218
;1218:				readyMask |= 1 << i;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1219
;1219:			}
line 1220
;1220:		} else {
ADDRGP4 $609
JUMPV
LABELV $608
line 1221
;1221:			notReady++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1222
;1222:		}
LABELV $609
line 1223
;1223:	}
LABELV $598
line 1206
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $600
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $597
line 1227
;1224:
;1225:	// copy the readyMask to each player's stats so
;1226:	// it can be displayed on the scoreboard
;1227:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $612
line 1228
;1228:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3348
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1229
;1229:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $617
line 1230
;1230:			continue;
ADDRGP4 $613
JUMPV
LABELV $617
line 1232
;1231:		}
;1232:		cl->ps.stats[STAT_CLIENTS_READY] = readyMask;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1233
;1233:	}
LABELV $613
line 1227
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $615
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $612
line 1236
;1234:
;1235:	// never exit in less than five seconds
;1236:	if ( level.time < level.intermissiontime + 5000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9132
INDIRI4
CNSTI4 5000
ADDI4
GEI4 $619
line 1237
;1237:		return;
ADDRGP4 $593
JUMPV
LABELV $619
line 1241
;1238:	}
;1239:
;1240:	// if nobody wants to go, clear timer
;1241:	if ( !ready ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $623
line 1242
;1242:		level.readyToExit = qfalse;
ADDRGP4 level+9140
CNSTI4 0
ASGNI4
line 1243
;1243:		return;
ADDRGP4 $593
JUMPV
LABELV $623
line 1247
;1244:	}
;1245:
;1246:	// if everyone wants to go, go now
;1247:	if ( !notReady ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $626
line 1248
;1248:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1249
;1249:		return;
ADDRGP4 $593
JUMPV
LABELV $626
line 1253
;1250:	}
;1251:
;1252:	// the first person to ready starts the ten second timeout
;1253:	if ( !level.readyToExit ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
NEI4 $628
line 1254
;1254:		level.readyToExit = qtrue;
ADDRGP4 level+9140
CNSTI4 1
ASGNI4
line 1255
;1255:		level.exitTime = level.time;
ADDRGP4 level+9144
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1256
;1256:	}
LABELV $628
line 1260
;1257:
;1258:	// if we have waited ten seconds since at least one player
;1259:	// wanted to exit, go ahead
;1260:	if ( level.time < level.exitTime + 10000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9144
INDIRI4
CNSTI4 10000
ADDI4
GEI4 $634
line 1261
;1261:		return;
ADDRGP4 $593
JUMPV
LABELV $634
line 1264
;1262:	}
;1263:
;1264:	ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1265
;1265:}
LABELV $593
endproc CheckIntermissionExit 20 0
export ScoreIsTied
proc ScoreIsTied 12 0
line 1272
;1266:
;1267:/*
;1268:=============
;1269:ScoreIsTied
;1270:=============
;1271:*/
;1272:qboolean ScoreIsTied( void ) {
line 1275
;1273:	int		a, b;
;1274:
;1275:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $639
line 1276
;1276:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $638
JUMPV
LABELV $639
line 1279
;1277:	}
;1278:	
;1279:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $642
line 1280
;1280:		return level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE];
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $650
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $651
JUMPV
LABELV $650
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $651
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $638
JUMPV
LABELV $642
line 1283
;1281:	}
;1282:
;1283:	a = level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE];
ADDRLP4 0
CNSTI4 3348
ADDRGP4 level+88
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1284
;1284:	b = level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE];
ADDRLP4 4
CNSTI4 3348
ADDRGP4 level+88+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1286
;1285:
;1286:	return a == b;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $656
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $657
JUMPV
LABELV $656
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $657
ADDRLP4 8
INDIRI4
RETI4
LABELV $638
endproc ScoreIsTied 12 0
export CheckExitRules
proc CheckExitRules 20 8
line 1298
;1287:}
;1288:
;1289:/*
;1290:=================
;1291:CheckExitRules
;1292:
;1293:There will be a delay between the time the exit is qualified for
;1294:and the time everyone is moved to the intermission spot, so you
;1295:can see the last frag.
;1296:=================
;1297:*/
;1298:void CheckExitRules( void ) {
line 1303
;1299: 	int			i;
;1300:	gclient_t	*cl;
;1301:	// if at the intermission, wait for all non-bots to
;1302:	// signal ready, then go to next level
;1303:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $659
line 1304
;1304:		CheckIntermissionExit ();
ADDRGP4 CheckIntermissionExit
CALLV
pop
line 1305
;1305:		return;
ADDRGP4 $658
JUMPV
LABELV $659
line 1308
;1306:	}
;1307:
;1308:	if ( level.intermissionQueued ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $662
line 1316
;1309:#ifdef MISSIONPACK
;1310:		int time = (g_singlePlayer.integer) ? SP_INTERMISSION_DELAY_TIME : INTERMISSION_DELAY_TIME;
;1311:		if ( level.time - level.intermissionQueued >= time ) {
;1312:			level.intermissionQueued = 0;
;1313:			BeginIntermission();
;1314:		}
;1315:#else
;1316:		if ( level.time - level.intermissionQueued >= INTERMISSION_DELAY_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9128
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $658
line 1317
;1317:			level.intermissionQueued = 0;
ADDRGP4 level+9128
CNSTI4 0
ASGNI4
line 1318
;1318:			BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 1319
;1319:		}
line 1321
;1320:#endif
;1321:		return;
ADDRGP4 $658
JUMPV
LABELV $662
line 1325
;1322:	}
;1323:
;1324:	// check for sudden death
;1325:	if ( ScoreIsTied() ) {
ADDRLP4 8
ADDRGP4 ScoreIsTied
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $670
line 1327
;1326:		// always wait for sudden death
;1327:		return;
ADDRGP4 $658
JUMPV
LABELV $670
line 1330
;1328:	}
;1329:
;1330:	if ( g_timelimit.integer && !level.warmupTime ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_timelimit+12
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $672
ADDRGP4 level+16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $672
line 1331
;1331:		if ( level.time - level.startTime >= g_timelimit.integer*60000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 60000
ADDRGP4 g_timelimit+12
INDIRI4
MULI4
LTI4 $676
line 1332
;1332:			trap_SendServerCommand( -1, "print \"Timelimit hit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $681
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1333
;1333:			LogExit( "Timelimit hit." );
ADDRGP4 $682
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1334
;1334:			return;
ADDRGP4 $658
JUMPV
LABELV $676
line 1336
;1335:		}
;1336:	}
LABELV $672
line 1338
;1337:
;1338:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $683
line 1339
;1339:		return;
ADDRGP4 $658
JUMPV
LABELV $683
line 1342
;1340:	}
;1341:
;1342:	if ( g_gametype.integer < GT_CTF && g_fraglimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
GEI4 $686
ADDRGP4 g_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $686
line 1343
;1343:		if ( level.teamScores[TEAM_RED] >= g_fraglimit.integer ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $690
line 1344
;1344:			trap_SendServerCommand( -1, "print \"Red hit the fraglimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $695
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1345
;1345:			LogExit( "Fraglimit hit." );
ADDRGP4 $696
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1346
;1346:			return;
ADDRGP4 $658
JUMPV
LABELV $690
line 1349
;1347:		}
;1348:
;1349:		if ( level.teamScores[TEAM_BLUE] >= g_fraglimit.integer ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $697
line 1350
;1350:			trap_SendServerCommand( -1, "print \"Blue hit the fraglimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $702
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1351
;1351:			LogExit( "Fraglimit hit." );
ADDRGP4 $696
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1352
;1352:			return;
ADDRGP4 $658
JUMPV
LABELV $697
line 1355
;1353:		}
;1354:
;1355:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $706
JUMPV
LABELV $703
line 1356
;1356:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 3348
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1357
;1357:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $708
line 1358
;1358:				continue;
ADDRGP4 $704
JUMPV
LABELV $708
line 1360
;1359:			}
;1360:			if ( cl->sess.sessionTeam != TEAM_FREE ) {
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $710
line 1361
;1361:				continue;
ADDRGP4 $704
JUMPV
LABELV $710
line 1364
;1362:			}
;1363:
;1364:			if ( cl->ps.persistant[PERS_SCORE] >= g_fraglimit.integer ) {
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $712
line 1365
;1365:				LogExit( "Fraglimit hit." );
ADDRGP4 $696
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1366
;1366:				trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " hit the fraglimit.\n\"",
ADDRGP4 $715
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1368
;1367:					cl->pers.netname ) );
;1368:				return;
ADDRGP4 $658
JUMPV
LABELV $712
line 1370
;1369:			}
;1370:		}
LABELV $704
line 1355
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $706
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $703
line 1371
;1371:	}
LABELV $686
line 1373
;1372:
;1373:	if ( g_gametype.integer >= GT_CTF && g_capturelimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $716
ADDRGP4 g_capturelimit+12
INDIRI4
CNSTI4 0
EQI4 $716
line 1375
;1374:
;1375:		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $720
line 1376
;1376:			trap_SendServerCommand( -1, "print \"Red hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $725
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1377
;1377:			LogExit( "Capturelimit hit." );
ADDRGP4 $726
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1378
;1378:			return;
ADDRGP4 $658
JUMPV
LABELV $720
line 1381
;1379:		}
;1380:
;1381:		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $727
line 1382
;1382:			trap_SendServerCommand( -1, "print \"Blue hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $732
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1383
;1383:			LogExit( "Capturelimit hit." );
ADDRGP4 $726
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1384
;1384:			return;
LABELV $727
line 1386
;1385:		}
;1386:	}
LABELV $716
line 1387
;1387:}
LABELV $658
endproc CheckExitRules 20 8
export CheckTournament
proc CheckTournament 32 8
line 1407
;1388:
;1389:
;1390:
;1391:/*
;1392:========================================================================
;1393:
;1394:FUNCTIONS CALLED EVERY FRAME
;1395:
;1396:========================================================================
;1397:*/
;1398:
;1399:
;1400:/*
;1401:=============
;1402:CheckTournament
;1403:
;1404:Once a frame, check for changes in tournement player state
;1405:=============
;1406:*/
;1407:void CheckTournament( void ) {
line 1410
;1408:	// check because we run 3 game frames before calling Connect and/or ClientBegin
;1409:	// for clients on a map_restart
;1410:	if ( level.numPlayingClients == 0 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 0
NEI4 $734
line 1411
;1411:		return;
ADDRGP4 $733
JUMPV
LABELV $734
line 1414
;1412:	}
;1413:
;1414:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $737
line 1417
;1415:
;1416:		// pull in a spectator if needed
;1417:		if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $740
line 1418
;1418:			AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1419
;1419:		}
LABELV $740
line 1422
;1420:
;1421:		// if we don't have two players, go back to "waiting for players"
;1422:		if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $743
line 1423
;1423:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $733
line 1424
;1424:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1425
;1425:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $446
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1426
;1426:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $751
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1427
;1427:			}
line 1428
;1428:			return;
ADDRGP4 $733
JUMPV
LABELV $743
line 1431
;1429:		}
;1430:
;1431:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $752
line 1432
;1432:			return;
ADDRGP4 $733
JUMPV
LABELV $752
line 1436
;1433:		}
;1434:
;1435:		// if the warmup is changed at the console, restart it
;1436:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+356
INDIRI4
EQI4 $755
line 1437
;1437:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1438
;1438:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1439
;1439:		}
LABELV $755
line 1442
;1440:
;1441:		// if all players have arrived, start the countdown
;1442:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $762
line 1443
;1443:			if ( level.numPlayingClients == 2 ) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
NEI4 $733
line 1445
;1444:				// fudge by -1 to account for extra delays
;1445:				level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1446
;1446:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $446
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1447
;1447:			}
line 1448
;1448:			return;
ADDRGP4 $733
JUMPV
LABELV $762
line 1452
;1449:		}
;1450:
;1451:		// if the warmup time has counted down, restart
;1452:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $738
line 1453
;1453:			level.warmupTime += 10000;
ADDRLP4 0
ADDRGP4 level+16
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1454
;1454:			trap_Cvar_Set( "g_restarted", "1" );
ADDRGP4 $62
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1455
;1455:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $526
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1456
;1456:			level.restarted = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 1457
;1457:			return;
ADDRGP4 $733
JUMPV
line 1459
;1458:		}
;1459:	} else if ( g_gametype.integer != GT_SINGLE_PLAYER && level.warmupTime != 0 ) {
LABELV $737
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $778
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $778
line 1461
;1460:		int		counts[TEAM_NUM_TEAMS];
;1461:		qboolean	notEnough = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1463
;1462:
;1463:		if ( g_gametype.integer > GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LEI4 $782
line 1464
;1464:			counts[TEAM_BLUE] = TeamCount( -1, TEAM_BLUE );
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 20
INDIRI4
ASGNI4
line 1465
;1465:			counts[TEAM_RED] = TeamCount( -1, TEAM_RED );
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 24
INDIRI4
ASGNI4
line 1467
;1466:
;1467:			if (counts[TEAM_RED] < 1 || counts[TEAM_BLUE] < 1) {
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 4+4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $791
ADDRLP4 4+8
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $783
LABELV $791
line 1468
;1468:				notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1469
;1469:			}
line 1470
;1470:		} else if ( level.numPlayingClients < 2 ) {
ADDRGP4 $783
JUMPV
LABELV $782
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $792
line 1471
;1471:			notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1472
;1472:		}
LABELV $792
LABELV $783
line 1474
;1473:
;1474:		if ( notEnough ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $795
line 1475
;1475:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $733
line 1476
;1476:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1477
;1477:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $446
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1478
;1478:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $751
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1479
;1479:			}
line 1480
;1480:			return; // still waiting for team members
ADDRGP4 $733
JUMPV
LABELV $795
line 1483
;1481:		}
;1482:
;1483:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $802
line 1484
;1484:			return;
ADDRGP4 $733
JUMPV
LABELV $802
line 1488
;1485:		}
;1486:
;1487:		// if the warmup is changed at the console, restart it
;1488:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+356
INDIRI4
EQI4 $805
line 1489
;1489:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1490
;1490:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1491
;1491:		}
LABELV $805
line 1494
;1492:
;1493:		// if all players have arrived, start the countdown
;1494:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $812
line 1496
;1495:			// fudge by -1 to account for extra delays
;1496:			level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
ADDRLP4 20
CNSTI4 1000
ASGNI4
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
MULI4
ADDRLP4 20
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1497
;1497:			trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $446
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1498
;1498:			return;
ADDRGP4 $733
JUMPV
LABELV $812
line 1502
;1499:		}
;1500:
;1501:		// if the warmup time has counted down, restart
;1502:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $819
line 1503
;1503:			level.warmupTime += 10000;
ADDRLP4 20
ADDRGP4 level+16
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1504
;1504:			trap_Cvar_Set( "g_restarted", "1" );
ADDRGP4 $62
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1505
;1505:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $526
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1506
;1506:			level.restarted = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 1507
;1507:			return;
LABELV $819
line 1509
;1508:		}
;1509:	}
LABELV $778
LABELV $738
line 1510
;1510:}
LABELV $733
endproc CheckTournament 32 8
export CheckVote
proc CheckVote 4 8
line 1518
;1511:
;1512:
;1513:/*
;1514:==================
;1515:CheckVote
;1516:==================
;1517:*/
;1518:void CheckVote( void ) {
line 1519
;1519:	if ( level.voteExecuteTime && level.voteExecuteTime < level.time ) {
ADDRGP4 level+2412
INDIRI4
CNSTI4 0
EQI4 $826
ADDRGP4 level+2412
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $826
line 1520
;1520:		level.voteExecuteTime = 0;
ADDRGP4 level+2412
CNSTI4 0
ASGNI4
line 1521
;1521:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $832
ARGP4
ADDRGP4 level+360
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1522
;1522:	}
LABELV $826
line 1523
;1523:	if ( !level.voteTime ) {
ADDRGP4 level+2408
INDIRI4
CNSTI4 0
NEI4 $834
line 1524
;1524:		return;
ADDRGP4 $825
JUMPV
LABELV $834
line 1526
;1525:	}
;1526:	if ( level.time - level.voteTime >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+2408
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $837
line 1527
;1527:		trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $841
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1528
;1528:	} else {
ADDRGP4 $838
JUMPV
LABELV $837
line 1529
;1529:		if ( level.voteYes > level.numVotingClients/2 ) {
ADDRGP4 level+2416
INDIRI4
ADDRGP4 level+2424
INDIRI4
CNSTI4 2
DIVI4
LEI4 $842
line 1531
;1530:			// execute the command, then remove the vote
;1531:			trap_SendServerCommand( -1, "print \"Vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $846
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1532
;1532:			level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+2412
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1533
;1533:		} else if ( level.voteNo >= level.numVotingClients/2 ) {
ADDRGP4 $843
JUMPV
LABELV $842
ADDRGP4 level+2420
INDIRI4
ADDRGP4 level+2424
INDIRI4
CNSTI4 2
DIVI4
LTI4 $825
line 1535
;1534:			// same behavior as a timeout
;1535:			trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $841
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1536
;1536:		} else {
line 1538
;1537:			// still waiting for a majority
;1538:			return;
LABELV $850
LABELV $843
line 1540
;1539:		}
;1540:	}
LABELV $838
line 1541
;1541:	level.voteTime = 0;
ADDRGP4 level+2408
CNSTI4 0
ASGNI4
line 1542
;1542:	trap_SetConfigstring( CS_VOTE_TIME, "" );
CNSTI4 8
ARGI4
ADDRGP4 $57
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1544
;1543:
;1544:}
LABELV $825
endproc CheckVote 4 8
export PrintTeam
proc PrintTeam 4 8
line 1551
;1545:
;1546:/*
;1547:==================
;1548:PrintTeam
;1549:==================
;1550:*/
;1551:void PrintTeam(int team, char *message) {
line 1554
;1552:	int i;
;1553:
;1554:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $858
JUMPV
LABELV $855
line 1555
;1555:		if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $860
line 1556
;1556:			continue;
ADDRGP4 $856
JUMPV
LABELV $860
line 1557
;1557:		trap_SendServerCommand( i, message );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1558
;1558:	}
LABELV $856
line 1554
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $858
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $855
line 1559
;1559:}
LABELV $854
endproc PrintTeam 4 8
export SetLeader
proc SetLeader 8 8
line 1566
;1560:
;1561:/*
;1562:==================
;1563:SetLeader
;1564:==================
;1565:*/
;1566:void SetLeader(int team, int client) {
line 1569
;1567:	int i;
;1568:
;1569:	if ( level.clients[client].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3348
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $863
line 1570
;1570:		PrintTeam(team, va("print \"%s is not connected\n\"", level.clients[client].pers.netname) );
ADDRGP4 $865
ARGP4
CNSTI4 3348
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1571
;1571:		return;
ADDRGP4 $862
JUMPV
LABELV $863
line 1573
;1572:	}
;1573:	if (level.clients[client].sess.sessionTeam != team) {
CNSTI4 3348
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $866
line 1574
;1574:		PrintTeam(team, va("print \"%s is not on the team anymore\n\"", level.clients[client].pers.netname) );
ADDRGP4 $868
ARGP4
CNSTI4 3348
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1575
;1575:		return;
ADDRGP4 $862
JUMPV
LABELV $866
line 1577
;1576:	}
;1577:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $872
JUMPV
LABELV $869
line 1578
;1578:		if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $874
line 1579
;1579:			continue;
ADDRGP4 $870
JUMPV
LABELV $874
line 1580
;1580:		if (level.clients[i].sess.teamLeader) {
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $876
line 1581
;1581:			level.clients[i].sess.teamLeader = qfalse;
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
line 1582
;1582:			ClientUserinfoChanged(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1583
;1583:		}
LABELV $876
line 1584
;1584:	}
LABELV $870
line 1577
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $872
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $869
line 1585
;1585:	level.clients[client].sess.teamLeader = qtrue;
CNSTI4 3348
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2472
ADDP4
CNSTI4 1
ASGNI4
line 1586
;1586:	ClientUserinfoChanged( client );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1587
;1587:	PrintTeam(team, va("print \"%s is the new team leader\n\"", level.clients[client].pers.netname) );
ADDRGP4 $878
ARGP4
CNSTI4 3348
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1588
;1588:}
LABELV $862
endproc SetLeader 8 8
export CheckTeamLeader
proc CheckTeamLeader 4 0
line 1595
;1589:
;1590:/*
;1591:==================
;1592:CheckTeamLeader
;1593:==================
;1594:*/
;1595:void CheckTeamLeader( int team ) {
line 1598
;1596:	int i;
;1597:
;1598:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $883
JUMPV
LABELV $880
line 1599
;1599:		if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $885
line 1600
;1600:			continue;
ADDRGP4 $881
JUMPV
LABELV $885
line 1601
;1601:		if (level.clients[i].sess.teamLeader)
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $887
line 1602
;1602:			break;
ADDRGP4 $882
JUMPV
LABELV $887
line 1603
;1603:	}
LABELV $881
line 1598
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $883
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $880
LABELV $882
line 1604
;1604:	if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $889
line 1605
;1605:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $895
JUMPV
LABELV $892
line 1606
;1606:			if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $897
line 1607
;1607:				continue;
ADDRGP4 $893
JUMPV
LABELV $897
line 1608
;1608:			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $899
line 1609
;1609:				level.clients[i].sess.teamLeader = qtrue;
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2472
ADDP4
CNSTI4 1
ASGNI4
line 1610
;1610:				break;
ADDRGP4 $894
JUMPV
LABELV $899
line 1612
;1611:			}
;1612:		}
LABELV $893
line 1605
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $895
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $892
LABELV $894
line 1613
;1613:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $906
JUMPV
LABELV $903
line 1614
;1614:			if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2448
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $908
line 1615
;1615:				continue;
ADDRGP4 $904
JUMPV
LABELV $908
line 1616
;1616:			level.clients[i].sess.teamLeader = qtrue;
CNSTI4 3348
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2472
ADDP4
CNSTI4 1
ASGNI4
line 1617
;1617:			break;
ADDRGP4 $905
JUMPV
LABELV $904
line 1613
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $906
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $903
LABELV $905
line 1619
;1618:		}
;1619:	}
LABELV $889
line 1620
;1620:}
LABELV $879
endproc CheckTeamLeader 4 0
export CheckTeamVote
proc CheckTeamVote 20 12
line 1627
;1621:
;1622:/*
;1623:==================
;1624:CheckTeamVote
;1625:==================
;1626:*/
;1627:void CheckTeamVote( int team ) {
line 1630
;1628:	int cs_offset;
;1629:
;1630:	if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $911
line 1631
;1631:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $912
JUMPV
LABELV $911
line 1632
;1632:	else if ( team == TEAM_BLUE )
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $910
line 1633
;1633:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1635
;1634:	else
;1635:		return;
LABELV $914
LABELV $912
line 1637
;1636:
;1637:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
INDIRI4
CNSTI4 0
NEI4 $915
line 1638
;1638:		return;
ADDRGP4 $910
JUMPV
LABELV $915
line 1640
;1639:	}
;1640:	if ( level.time - level.teamVoteTime[cs_offset] >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $918
line 1641
;1641:		trap_SendServerCommand( -1, "print \"Team vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $922
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1642
;1642:	} else {
ADDRGP4 $919
JUMPV
LABELV $918
line 1643
;1643:		if ( level.teamVoteYes[cs_offset] > level.numteamVotingClients[cs_offset]/2 ) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+4484
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+4500
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
LEI4 $923
line 1645
;1644:			// execute the command, then remove the vote
;1645:			trap_SendServerCommand( -1, "print \"Team vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $927
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1647
;1646:			//
;1647:			if ( !Q_strncmp( "leader", level.teamVoteString[cs_offset], 6) ) {
ADDRGP4 $930
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2428
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 12
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $928
line 1649
;1648:				//set the team leader
;1649:				SetLeader(team, atoi(level.teamVoteString[cs_offset] + 7));
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2428+7
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1650
;1650:			}
ADDRGP4 $924
JUMPV
LABELV $928
line 1651
;1651:			else {
line 1652
;1652:				trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.teamVoteString[cs_offset] ) );
ADDRGP4 $832
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2428
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1653
;1653:			}
line 1654
;1654:		} else if ( level.teamVoteNo[cs_offset] >= level.numteamVotingClients[cs_offset]/2 ) {
ADDRGP4 $924
JUMPV
LABELV $923
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+4492
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+4500
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
LTI4 $910
line 1656
;1655:			// same behavior as a timeout
;1656:			trap_SendServerCommand( -1, "print \"Team vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $922
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1657
;1657:		} else {
line 1659
;1658:			// still waiting for a majority
;1659:			return;
LABELV $936
LABELV $924
line 1661
;1660:		}
;1661:	}
LABELV $919
line 1662
;1662:	level.teamVoteTime[cs_offset] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4476
ADDP4
CNSTI4 0
ASGNI4
line 1663
;1663:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, "" );
ADDRLP4 0
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRGP4 $57
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1665
;1664:
;1665:}
LABELV $910
endproc CheckTeamVote 20 12
data
align 4
LABELV $941
byte 4 -1
export CheckCvars
code
proc CheckCvars 4 8
line 1673
;1666:
;1667:
;1668:/*
;1669:==================
;1670:CheckCvars
;1671:==================
;1672:*/
;1673:void CheckCvars( void ) {
line 1676
;1674:	static int lastMod = -1;
;1675:
;1676:	if ( g_password.modificationCount != lastMod ) {
ADDRGP4 g_password+4
INDIRI4
ADDRGP4 $941
INDIRI4
EQI4 $942
line 1677
;1677:		lastMod = g_password.modificationCount;
ADDRGP4 $941
ADDRGP4 g_password+4
INDIRI4
ASGNI4
line 1678
;1678:		if ( *g_password.string && Q_stricmp( g_password.string, "none" ) ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $946
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $950
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $946
line 1679
;1679:			trap_Cvar_Set( "g_needpass", "1" );
ADDRGP4 $87
ARGP4
ADDRGP4 $86
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1680
;1680:		} else {
ADDRGP4 $947
JUMPV
LABELV $946
line 1681
;1681:			trap_Cvar_Set( "g_needpass", "0" );
ADDRGP4 $87
ARGP4
ADDRGP4 $63
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1682
;1682:		}
LABELV $947
line 1683
;1683:	}
LABELV $942
line 1684
;1684:}
LABELV $940
endproc CheckCvars 4 8
export G_RunThink
proc G_RunThink 8 4
line 1693
;1685:
;1686:/*
;1687:=============
;1688:G_RunThink
;1689:
;1690:Runs thinking code for this frame if necessary
;1691:=============
;1692:*/
;1693:void G_RunThink (gentity_t *ent) {
line 1696
;1694:	float	thinktime;
;1695:
;1696:	thinktime = ent->nextthink;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1697
;1697:	if (thinktime <= 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $952
line 1698
;1698:		return;
ADDRGP4 $951
JUMPV
LABELV $952
line 1700
;1699:	}
;1700:	if (thinktime > level.time) {
ADDRLP4 0
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $954
line 1701
;1701:		return;
ADDRGP4 $951
JUMPV
LABELV $954
line 1704
;1702:	}
;1703:	
;1704:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 1705
;1705:	if (!ent->think) {
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $957
line 1706
;1706:		G_Error ( "NULL ent->think");
ADDRGP4 $959
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1707
;1707:	}
LABELV $957
line 1708
;1708:	ent->think (ent);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRP4
CALLV
pop
line 1709
;1709:}
LABELV $951
endproc G_RunThink 8 4
export G_RunFrame
proc G_RunFrame 44 12
line 1718
;1710:
;1711:/*
;1712:================
;1713:G_RunFrame
;1714:
;1715:Advances the non-player objects in the world
;1716:================
;1717:*/
;1718:void G_RunFrame( int levelTime ) {
line 1725
;1719:	int			i;
;1720:	gentity_t	*ent;
;1721:	int			msec;
;1722:int start, end;
;1723:
;1724:	// if we are waiting for the level to restart, do nothing
;1725:	if ( level.restarted ) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $961
line 1726
;1726:		return;
ADDRGP4 $960
JUMPV
LABELV $961
line 1729
;1727:	}
;1728:
;1729:	level.framenum++;
ADDRLP4 20
ADDRGP4 level+28
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1730
;1730:	level.previousTime = level.time;
ADDRGP4 level+36
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1731
;1731:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 1732
;1732:	msec = level.time - level.previousTime;
ADDRLP4 16
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 1735
;1733:
;1734:	// get any cvar changes
;1735:	G_UpdateCvars();
ADDRGP4 G_UpdateCvars
CALLV
pop
line 1740
;1736:
;1737:	//
;1738:	// go through all allocated objects
;1739:	//
;1740:	start = trap_Milliseconds();
ADDRLP4 24
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1741
;1741:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1742
;1742:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $973
JUMPV
LABELV $970
line 1743
;1743:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $975
line 1744
;1744:			continue;
ADDRGP4 $971
JUMPV
LABELV $975
line 1748
;1745:		}
;1746:
;1747:		// clear events that are too old
;1748:		if ( level.time - ent->eventTime > EVENT_VALID_MSEC ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $977
line 1749
;1749:			if ( ent->s.event ) {
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $980
line 1750
;1750:				ent->s.event = 0;	// &= EV_EVENT_BITS;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 1751
;1751:				if ( ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $982
line 1752
;1752:					ent->client->ps.externalEvent = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 1756
;1753:					// predicted events should never be set to zero
;1754:					//ent->client->ps.events[0] = 0;
;1755:					//ent->client->ps.events[1] = 0;
;1756:				}
LABELV $982
line 1757
;1757:			}
LABELV $980
line 1758
;1758:			if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $984
line 1760
;1759:				// tempEntities or dropped items completely go away after their event
;1760:				G_FreeEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1761
;1761:				continue;
ADDRGP4 $971
JUMPV
LABELV $984
line 1762
;1762:			} else if ( ent->unlinkAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $986
line 1764
;1763:				// items that will respawn will hide themselves after their pickup event
;1764:				ent->unlinkAfterEvent = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1765
;1765:				trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1766
;1766:			}
LABELV $986
line 1767
;1767:		}
LABELV $977
line 1770
;1768:
;1769:		// temporary entities don't think
;1770:		if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $988
line 1771
;1771:			continue;
ADDRGP4 $971
JUMPV
LABELV $988
line 1774
;1772:		}
;1773:
;1774:		if ( !ent->r.linked && ent->neverFree ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $990
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $990
line 1775
;1775:			continue;
ADDRGP4 $971
JUMPV
LABELV $990
line 1788
;1776:		}
;1777:
;1778://unlagged - backward reconciliation #2
;1779:		// we'll run missiles separately to save CPU in backward reconciliation
;1780:/*
;1781:		if ( ent->s.eType == ET_MISSILE ) {
;1782:			G_RunMissile( ent );
;1783:			continue;
;1784:		}
;1785:*/
;1786://unlagged - backward reconciliation #2
;1787:
;1788:		if ( ent->s.eType == ET_ITEM || ent->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $994
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $992
LABELV $994
line 1789
;1789:			G_RunItem( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunItem
CALLV
pop
line 1790
;1790:			continue;
ADDRGP4 $971
JUMPV
LABELV $992
line 1793
;1791:		}
;1792:
;1793:		if ( ent->s.eType == ET_MOVER ) {
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $995
line 1794
;1794:			G_RunMover( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMover
CALLV
pop
line 1795
;1795:			continue;
ADDRGP4 $971
JUMPV
LABELV $995
line 1798
;1796:		}
;1797:
;1798:		if ( i < MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $997
line 1799
;1799:			G_RunClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunClient
CALLV
pop
line 1800
;1800:			continue;
ADDRGP4 $971
JUMPV
LABELV $997
line 1803
;1801:		}
;1802:
;1803:		G_RunThink( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1804
;1804:	}
LABELV $971
line 1742
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $973
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $970
line 1810
;1805:
;1806://unlagged - backward reconciliation #2
;1807:	// NOW run the missiles, with all players backward-reconciled
;1808:	// to the positions they were in exactly 50ms ago, at the end
;1809:	// of the last server frame
;1810:	G_TimeShiftAllClients( level.previousTime, NULL );
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 1812
;1811:
;1812:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1813
;1813:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1003
JUMPV
LABELV $1000
line 1814
;1814:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1005
line 1815
;1815:			continue;
ADDRGP4 $1001
JUMPV
LABELV $1005
line 1819
;1816:		}
;1817:
;1818:		// temporary entities don't think
;1819:		if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1007
line 1820
;1820:			continue;
ADDRGP4 $1001
JUMPV
LABELV $1007
line 1823
;1821:		}
;1822:
;1823:		if ( ent->s.eType == ET_MISSILE ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1009
line 1824
;1824:			G_RunMissile( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
line 1825
;1825:		}
LABELV $1009
line 1826
;1826:	}
LABELV $1001
line 1813
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $1003
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1000
line 1828
;1827:
;1828:	G_UnTimeShiftAllClients( NULL );
CNSTP4 0
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 1831
;1829://unlagged - backward reconciliation #2
;1830:
;1831:end = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1833
;1832:
;1833:start = trap_Milliseconds();
ADDRLP4 32
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 1835
;1834:	// perform final fixups on the players
;1835:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1836
;1836:	for (i=0 ; i < level.maxclients ; i++, ent++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1014
JUMPV
LABELV $1011
line 1837
;1837:		if ( ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1016
line 1838
;1838:			ClientEndFrame( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1839
;1839:		}
LABELV $1016
line 1840
;1840:	}
LABELV $1012
line 1836
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
ASGNP4
LABELV $1014
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1011
line 1841
;1841:end = trap_Milliseconds();
ADDRLP4 36
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1844
;1842:
;1843:	// see if it is time to do a tournement restart
;1844:	CheckTournament();
ADDRGP4 CheckTournament
CALLV
pop
line 1847
;1845:
;1846:	// Shafe - Trep - Radar Functions
;1847:	CheckPlayerPostions();
ADDRGP4 CheckPlayerPostions
CALLV
pop
line 1850
;1848:	
;1849:	// see if it is time to end the level
;1850:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 1853
;1851:
;1852:	// update to team status?
;1853:	CheckTeamStatus();
ADDRGP4 CheckTeamStatus
CALLV
pop
line 1856
;1854:
;1855:	// cancel vote if timed out
;1856:	CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 1859
;1857:
;1858:	// check team votes
;1859:	CheckTeamVote( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 1860
;1860:	CheckTeamVote( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 1863
;1861:
;1862:	// for tracking changes
;1863:	CheckCvars();
ADDRGP4 CheckCvars
CALLV
pop
line 1865
;1864:
;1865:	if (g_listEntity.integer) {
ADDRGP4 g_listEntity+12
INDIRI4
CNSTI4 0
EQI4 $1018
line 1866
;1866:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1021
line 1867
;1867:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $1025
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 824
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1868
;1868:		}
LABELV $1022
line 1866
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1021
line 1869
;1869:		trap_Cvar_Set("g_listEntity", "0");
ADDRGP4 $113
ARGP4
ADDRGP4 $63
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1870
;1870:	}
LABELV $1018
line 1876
;1871:
;1872://unlagged - backward reconciliation #4
;1873:	// record the time at the end of this frame - it should be about
;1874:	// the time the next frame begins - when the server starts
;1875:	// accepting commands from connected clients
;1876:	level.frameStartTime = trap_Milliseconds();
ADDRLP4 40
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 level+9216
ADDRLP4 40
INDIRI4
ASGNI4
line 1878
;1877://unlagged - backward reconciliation #4
;1878:}
LABELV $960
endproc G_RunFrame 44 12
export CheckPlayerPostions
proc CheckPlayerPostions 1112 16
line 1884
;1879:
;1880:// Shafe - Trep - Radar
;1881:playerpos_t		g_playerOrigins[MAX_CLIENTS]; //global storage for player positions
;1882:
;1883:void CheckPlayerPostions(void)
;1884:{
line 1891
;1885:        int i, valid_count;
;1886:        gentity_t *ent;  // *loc, *ent; loc - unreferenced shafe - trep
;1887:        char cmd[16*MAX_CLIENTS + MAX_CLIENTS]; // make sure our command string is
;1888:                                              // large enough for all the data
;1889:
;1890:        // do we need to update the positions yet?
;1891:		if (!level.lastPlayerLocationTime) { level.lastPlayerLocationTime = 25000; }
ADDRGP4 level+64
INDIRI4
CNSTI4 0
NEI4 $1029
ADDRGP4 level+64
CNSTI4 25000
ASGNI4
LABELV $1029
line 1893
;1892:
;1893:        if (level.time - level.lastPlayerLocationTime > PLAYER_LOCATION_UPDATE_TIME) 
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+64
INDIRI4
SUBI4
CNSTI4 10000
LEI4 $1033
line 1894
;1894:        {
line 1896
;1895:            //store the current time so we know when to update next
;1896:            level.lastPlayerLocationTime = level.time;
ADDRGP4 level+64
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1899
;1897:
;1898:            //for each possible client
;1899:            valid_count = 0;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 1901
;1900:
;1901:            for (i = 0; i < g_maxclients.integer; i++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1042
JUMPV
LABELV $1039
line 1902
;1902:            {
line 1904
;1903:                //get a pointer to the entity
;1904:                ent = g_entities + i;
ADDRLP4 4
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1907
;1905:
;1906:                //see if we have a valid entry
;1907:                if (!ent->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1044
line 1908
;1908:                {
line 1910
;1909:                    //mark as an invalid entry
;1910:                    g_playerOrigins[i].valid = kENTRY_INVALID;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins
ADDP4
CNSTI4 1
ASGNI4
line 1911
;1911:                }
LABELV $1044
line 1913
;1912:
;1913:                if(!ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1046
line 1914
;1914:                {
line 1915
;1915:                    g_playerOrigins[i].valid = kENTRY_INVALID;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins
ADDP4
CNSTI4 1
ASGNI4
line 1916
;1916:                }
ADDRGP4 $1047
JUMPV
LABELV $1046
line 1917
;1917:                else if(ent->health <= 0)
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1048
line 1918
;1918:                {
line 1919
;1919:                     g_playerOrigins[i].valid = kENTRY_INVALID;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins
ADDP4
CNSTI4 1
ASGNI4
line 1920
;1920:                }
ADDRGP4 $1049
JUMPV
LABELV $1048
line 1922
;1921:                else
;1922:                {
line 1924
;1923:                    //get and store the client position
;1924:                    VectorCopy( ent->client->ps.origin, g_playerOrigins[i].pos);
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins+4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1927
;1925:
;1926:                    //mark as valid entry
;1927:                    g_playerOrigins[i].valid = kENTRY_VALID;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins
ADDP4
CNSTI4 2
ASGNI4
line 1930
;1928:
;1929:                    //increase the valid counter
;1930:                    valid_count++;
ADDRLP4 1096
ADDRLP4 1096
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1931
;1931:                }
LABELV $1049
LABELV $1047
line 1932
;1932:             } 
LABELV $1040
line 1901
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1042
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $1039
line 1933
;1933:          }
LABELV $1033
line 1936
;1934:
;1935:        //build the command string to send
;1936:        Com_sprintf(cmd, sizeof(cmd), "playerpos %i ", valid_count);
ADDRLP4 8
ARGP4
CNSTI4 1088
ARGI4
ADDRGP4 $1051
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1937
;1937:        for(i=0; i<g_maxclients.integer; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1055
JUMPV
LABELV $1052
line 1938
;1938:        {
line 1940
;1939:            //if weve got a valid entry then add the position to the command string
;1940:            if(g_playerOrigins[i].valid == kENTRY_VALID)
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1057
line 1941
;1941:            {
line 1942
;1942:                strcat(cmd, va(" %f,", g_playerOrigins[i].pos[0]));
ADDRGP4 $1059
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1943
;1943:                strcat(cmd, va("%f,", g_playerOrigins[i].pos[1]));
ADDRGP4 $1061
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins+4+4
ADDP4
INDIRF4
ARGF4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1944
;1944:                strcat(cmd, va("%f", g_playerOrigins[i].pos[2]));
ADDRGP4 $1064
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_playerOrigins+4+8
ADDP4
INDIRF4
ARGF4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1945
;1945:            }
LABELV $1057
line 1946
;1946:        }
LABELV $1053
line 1937
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1055
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $1052
line 1956
;1947:    
;1948:        //finally broadcast the command
;1949:		// 
;1950:		// Hey XcyTng!  Why doesnt this work???? 
;1951:		// Enable it and the game freezes when loading a map... 
;1952:		// Driving me insane VVVVVVV
;1953:
;1954:        //G_SendCommandToClient(NULL, cmd);
;1955:		 
;1956:}
LABELV $1028
endproc CheckPlayerPostions 1112 16
bss
export g_playerOrigins
align 4
LABELV g_playerOrigins
skip 1024
export g_listEntity
align 4
LABELV g_listEntity
skip 272
export g_podiumDrop
align 4
LABELV g_podiumDrop
skip 272
export g_podiumDist
align 4
LABELV g_podiumDist
skip 272
export g_logSync
align 4
LABELV g_logSync
skip 272
export g_log
align 4
LABELV g_log
skip 272
export g_clients
align 4
LABELV g_clients
skip 214272
import G_SendCommandToClient
import visible
import findradius
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
export g_MultiJump
align 4
LABELV g_MultiJump
skip 272
export g_instagib
align 4
LABELV g_instagib
skip 272
export sv_fps
align 4
LABELV sv_fps
skip 272
export g_lightningDamage
align 4
LABELV g_lightningDamage
skip 272
export g_truePing
align 4
LABELV g_truePing
skip 272
export g_unlaggedVersion
align 4
LABELV g_unlaggedVersion
skip 272
export g_delagHitscan
align 4
LABELV g_delagHitscan
skip 272
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
export g_rankings
align 4
LABELV g_rankings
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export g_smoothClients
align 4
LABELV g_smoothClients
skip 272
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
export g_filterBan
align 4
LABELV g_filterBan
skip 272
export g_banIPs
align 4
LABELV g_banIPs
skip 272
export g_teamForceBalance
align 4
LABELV g_teamForceBalance
skip 272
export g_teamAutoJoin
align 4
LABELV g_teamAutoJoin
skip 272
export g_allowVote
align 4
LABELV g_allowVote
skip 272
export g_blood
align 4
LABELV g_blood
skip 272
export g_doWarmup
align 4
LABELV g_doWarmup
skip 272
export g_warmup
align 4
LABELV g_warmup
skip 272
export g_motd
align 4
LABELV g_motd
skip 272
export g_synchronousClients
align 4
LABELV g_synchronousClients
skip 272
export g_weaponTeamRespawn
align 4
LABELV g_weaponTeamRespawn
skip 272
export g_weaponRespawn
align 4
LABELV g_weaponRespawn
skip 272
export g_debugDamage
align 4
LABELV g_debugDamage
skip 272
export g_debugAlloc
align 4
LABELV g_debugAlloc
skip 272
export g_debugMove
align 4
LABELV g_debugMove
skip 272
export g_inactivity
align 4
LABELV g_inactivity
skip 272
export g_forcerespawn
align 4
LABELV g_forcerespawn
skip 272
export g_quadfactor
align 4
LABELV g_quadfactor
skip 272
export g_knockback
align 4
LABELV g_knockback
skip 272
export g_speed
align 4
LABELV g_speed
skip 272
export g_gravity
align 4
LABELV g_gravity
skip 272
export g_needpass
align 4
LABELV g_needpass
skip 272
export g_password
align 4
LABELV g_password
skip 272
export g_friendlyFire
align 4
LABELV g_friendlyFire
skip 272
export g_capturelimit
align 4
LABELV g_capturelimit
skip 272
export g_timelimit
align 4
LABELV g_timelimit
skip 272
export g_fraglimit
align 4
LABELV g_fraglimit
skip 272
export g_dmflags
align 4
LABELV g_dmflags
skip 272
export g_restarted
align 4
LABELV g_restarted
skip 272
export g_maxGameClients
align 4
LABELV g_maxGameClients
skip 272
export g_maxclients
align 4
LABELV g_maxclients
skip 272
export g_cheats
align 4
LABELV g_cheats
skip 272
export g_dedicated
align 4
LABELV g_dedicated
skip 272
export g_gametype
align 4
LABELV g_gametype
skip 272
export g_entities
align 4
LABELV g_entities
skip 843776
export level
align 4
LABELV level
skip 9220
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_DropFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import DeathmatchScoreboardMessage
import G_SetStats
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_pdgrenade
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import G_ExplodeMissile
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import Max_Ammo
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import SnapVectorTowards
import tonextint
import init_tonextint
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $1064
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $1061
byte 1 37
byte 1 102
byte 1 44
byte 1 0
align 1
LABELV $1059
byte 1 32
byte 1 37
byte 1 102
byte 1 44
byte 1 0
align 1
LABELV $1051
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $1025
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $959
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 45
byte 1 62
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $950
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $930
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $927
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $922
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $878
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $868
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $865
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $846
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $841
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $832
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $751
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $732
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $726
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $725
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $715
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $702
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $696
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $695
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $682
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $681
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $591
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 114
byte 1 101
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $565
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $553
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $530
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $526
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $479
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $446
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $312
byte 1 115
byte 1 0
align 1
LABELV $303
byte 1 102
byte 1 0
align 1
LABELV $275
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $269
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $265
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 32
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $263
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $259
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $258
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $256
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $252
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $236
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $235
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $234
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $232
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $217
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 114
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $213
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $212
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $211
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $205
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $190
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $172
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $125
byte 1 103
byte 1 95
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $124
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 105
byte 1 98
byte 1 0
align 1
LABELV $123
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 103
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $119
byte 1 50
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $118
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $117
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 72
byte 1 105
byte 1 116
byte 1 115
byte 1 99
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $116
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $115
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $114
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $113
byte 1 103
byte 1 95
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $112
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $111
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $110
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $109
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $108
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $106
byte 1 103
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $105
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $101
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $100
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $99
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $98
byte 1 53
byte 1 0
align 1
LABELV $97
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $96
byte 1 51
byte 1 0
align 1
LABELV $95
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $94
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $93
byte 1 103
byte 1 95
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $92
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $91
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $90
byte 1 51
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $89
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $88
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $87
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $86
byte 1 49
byte 1 0
align 1
LABELV $85
byte 1 103
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $84
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $83
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $82
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $81
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $80
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $79
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $78
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $77
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 66
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $74
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $73
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $72
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $71
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $70
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 100
byte 1 109
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $68
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $67
byte 1 56
byte 1 0
align 1
LABELV $66
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $65
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $64
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $63
byte 1 48
byte 1 0
align 1
LABELV $62
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $61
byte 1 74
byte 1 117
byte 1 110
byte 1 32
byte 1 50
byte 1 57
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 54
byte 1 0
align 1
LABELV $60
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $59
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $58
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $57
byte 1 0
align 1
LABELV $56
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
