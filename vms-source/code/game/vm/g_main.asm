data
align 4
LABELV gameCvarTable
address g_cheats
address $54
address $55
byte 4 0
byte 4 0
byte 4 0
skip 4
byte 4 0
address $56
address $57
byte 4 68
byte 4 0
byte 4 0
skip 4
byte 4 0
address $58
address $59
byte 4 64
byte 4 0
byte 4 0
skip 4
address g_restarted
address $60
address $61
byte 4 64
byte 4 0
byte 4 0
skip 4
byte 4 0
address $62
address $55
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_gametype
address $63
address $61
byte 4 38
byte 4 0
byte 4 0
skip 4
address g_maxclients
address $64
address $65
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_maxGameClients
address $66
address $61
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_dmflags
address $67
address $61
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_fraglimit
address $68
address $69
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_timelimit
address $70
address $61
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_capturelimit
address $71
address $65
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_synchronousClients
address $72
address $61
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_friendlyFire
address $73
address $61
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_teamAutoJoin
address $74
address $61
byte 4 1
skip 12
address g_teamForceBalance
address $75
address $61
byte 4 1
skip 12
address g_warmup
address $76
address $69
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_doWarmup
address $77
address $61
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_log
address $78
address $79
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_logSync
address $80
address $61
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_password
address $81
address $55
byte 4 2
byte 4 0
byte 4 0
skip 4
address g_banIPs
address $82
address $55
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_filterBan
address $83
address $84
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_needpass
address $85
address $61
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_dedicated
address $86
address $61
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_speed
address $87
address $88
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_gravity
address $89
address $90
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_knockback
address $91
address $92
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_quadfactor
address $93
address $94
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponRespawn
address $95
address $96
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponTeamRespawn
address $97
address $98
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_forcerespawn
address $99
address $69
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_inactivity
address $100
address $61
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_debugMove
address $101
address $61
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugDamage
address $102
address $61
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugAlloc
address $103
address $61
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_motd
address $104
address $55
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_blood
address $105
address $84
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDist
address $106
address $107
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDrop
address $108
address $109
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_allowVote
address $110
address $84
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_listEntity
address $111
address $61
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_smoothClients
address $112
address $84
byte 4 0
byte 4 0
byte 4 0
skip 4
address pmove_fixed
address $113
address $61
byte 4 8
byte 4 0
byte 4 0
skip 4
address pmove_msec
address $114
address $65
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_delagHitscan
address $115
address $84
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_unlaggedVersion
address $116
address $117
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_truePing
address $118
address $84
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_lightningDamage
address $119
address $65
byte 4 0
byte 4 0
byte 4 1
skip 4
address sv_fps
address $120
address $69
byte 4 9
byte 4 0
byte 4 0
skip 4
address g_rankings
address $121
address $61
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_instagib
address $122
address $61
byte 4 37
byte 4 0
byte 4 0
skip 4
align 4
LABELV gameCvarTableSize
byte 4 52
export vmMain
code
proc vmMain 16 12
file "../g_main.c"
line 204
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
;87:
;88:// bk001129 - made static to avoid aliasing
;89:static cvarTable_t		gameCvarTable[] = {
;90:	// don't override the cheat state set by the system
;91:	{ &g_cheats, "sv_cheats", "", 0, 0, qfalse },
;92:
;93:	// noset vars
;94:	{ NULL, "gamename", GAMEVERSION , CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;95:	{ NULL, "gamedate", __DATE__ , CVAR_ROM, 0, qfalse  },
;96:	{ &g_restarted, "g_restarted", "0", CVAR_ROM, 0, qfalse  },
;97:	{ NULL, "sv_mapname", "", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
;98:
;99:	// latched vars
;100:	{ &g_gametype, "g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
;101:
;102:	{ &g_maxclients, "sv_maxclients", "8", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;103:	{ &g_maxGameClients, "g_maxGameClients", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
;104:
;105:	// change anytime vars
;106:	{ &g_dmflags, "dmflags", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
;107:	{ &g_fraglimit, "fraglimit", "20", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;108:	{ &g_timelimit, "timelimit", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;109:	{ &g_capturelimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
;110:
;111:	{ &g_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO, 0, qfalse  },
;112:
;113:	{ &g_friendlyFire, "g_friendlyFire", "0", CVAR_ARCHIVE, 0, qtrue  },
;114:
;115:	{ &g_teamAutoJoin, "g_teamAutoJoin", "0", CVAR_ARCHIVE  },
;116:	{ &g_teamForceBalance, "g_teamForceBalance", "0", CVAR_ARCHIVE  },
;117:
;118:	{ &g_warmup, "g_warmup", "20", CVAR_ARCHIVE, 0, qtrue  },
;119:	{ &g_doWarmup, "g_doWarmup", "0", 0, 0, qtrue  },
;120:	{ &g_log, "g_log", "games.log", CVAR_ARCHIVE, 0, qfalse  },
;121:	{ &g_logSync, "g_logSync", "0", CVAR_ARCHIVE, 0, qfalse  },
;122:
;123:	{ &g_password, "g_password", "", CVAR_USERINFO, 0, qfalse  },
;124:
;125:	{ &g_banIPs, "g_banIPs", "", CVAR_ARCHIVE, 0, qfalse  },
;126:	{ &g_filterBan, "g_filterBan", "1", CVAR_ARCHIVE, 0, qfalse  },
;127:
;128:	{ &g_needpass, "g_needpass", "0", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse },
;129:
;130:	{ &g_dedicated, "dedicated", "0", 0, 0, qfalse  },
;131:
;132:	{ &g_speed, "g_speed", "320", 0, 0, qtrue  },
;133:	{ &g_gravity, "g_gravity", "800", 0, 0, qtrue  },
;134:	{ &g_knockback, "g_knockback", "1000", 0, 0, qtrue  },
;135:	{ &g_quadfactor, "g_quadfactor", "3", 0, 0, qtrue  },
;136:	{ &g_weaponRespawn, "g_weaponrespawn", "5", 0, 0, qtrue  },
;137:	{ &g_weaponTeamRespawn, "g_weaponTeamRespawn", "30", 0, 0, qtrue },
;138:	{ &g_forcerespawn, "g_forcerespawn", "20", 0, 0, qtrue },
;139:	{ &g_inactivity, "g_inactivity", "0", 0, 0, qtrue },
;140:	{ &g_debugMove, "g_debugMove", "0", 0, 0, qfalse },
;141:	{ &g_debugDamage, "g_debugDamage", "0", 0, 0, qfalse },
;142:	{ &g_debugAlloc, "g_debugAlloc", "0", 0, 0, qfalse },
;143:	{ &g_motd, "g_motd", "", 0, 0, qfalse },
;144:	{ &g_blood, "com_blood", "1", 0, 0, qfalse },
;145:
;146:	{ &g_podiumDist, "g_podiumDist", "80", 0, 0, qfalse },
;147:	{ &g_podiumDrop, "g_podiumDrop", "70", 0, 0, qfalse },
;148:
;149:	{ &g_allowVote, "g_allowVote", "1", CVAR_ARCHIVE, 0, qfalse },
;150:	{ &g_listEntity, "g_listEntity", "0", 0, 0, qfalse },
;151:
;152:#ifdef MISSIONPACK
;153:	{ &g_obeliskHealth, "g_obeliskHealth", "2500", 0, 0, qfalse },
;154:	{ &g_obeliskRegenPeriod, "g_obeliskRegenPeriod", "1", 0, 0, qfalse },
;155:	{ &g_obeliskRegenAmount, "g_obeliskRegenAmount", "15", 0, 0, qfalse },
;156:	{ &g_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO, 0, qfalse },
;157:
;158:	{ &g_cubeTimeout, "g_cubeTimeout", "30", 0, 0, qfalse },
;159:	{ &g_redteam, "g_redteam", "Stroggs", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue },
;160:	{ &g_blueteam, "g_blueteam", "Pagans", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue  },
;161:	{ &g_singlePlayer, "ui_singlePlayerActive", "", 0, 0, qfalse, qfalse  },
;162:
;163:	{ &g_enableDust, "g_enableDust", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
;164:	{ &g_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
;165:	{ &g_proxMineTimeout, "g_proxMineTimeout", "20000", 0, 0, qfalse },
;166:#endif
;167:	{ &g_smoothClients, "g_smoothClients", "1", 0, 0, qfalse},
;168:	{ &pmove_fixed, "pmove_fixed", "0", CVAR_SYSTEMINFO, 0, qfalse},
;169:	{ &pmove_msec, "pmove_msec", "8", CVAR_SYSTEMINFO, 0, qfalse},
;170:
;171://unlagged - server options
;172:	{ &g_delagHitscan, "g_delagHitscan", "1", CVAR_ARCHIVE | CVAR_SERVERINFO, 0, qtrue },
;173:	{ &g_unlaggedVersion, "g_unlaggedVersion", "2.0", CVAR_ROM | CVAR_SERVERINFO, 0, qfalse },
;174:	{ &g_truePing, "g_truePing", "1", CVAR_ARCHIVE, 0, qtrue },
;175:	{ &g_lightningDamage, "g_lightningDamage", "8", 0, 0, qtrue },
;176:	// it's CVAR_SYSTEMINFO so the client's sv_fps will be automagically set to its value
;177:	{ &sv_fps, "sv_fps", "20", CVAR_SYSTEMINFO | CVAR_ARCHIVE, 0, qfalse },
;178://unlagged - server options
;179:
;180:	{ &g_rankings, "g_rankings", "0", 0, 0, qfalse},
;181:// Shafe - Trep - Instagib
;182:	{ &g_instagib, "g_instagib", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  }
;183:	
;184:};
;185:
;186:// bk001129 - made static to avoid aliasing
;187:static int gameCvarTableSize = sizeof( gameCvarTable ) / sizeof( gameCvarTable[0] );
;188:
;189:
;190:void G_InitGame( int levelTime, int randomSeed, int restart );
;191:void G_RunFrame( int levelTime );
;192:void G_ShutdownGame( int restart );
;193:void CheckExitRules( void );
;194:
;195:
;196:/*
;197:================
;198:vmMain
;199:
;200:This is the only way control passes into the module.
;201:This must be the very first function compiled into the .q3vm file
;202:================
;203:*/
;204:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 205
;205:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $124
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $124
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $137
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $137
address $126
address $127
address $128
address $132
address $130
address $131
address $133
address $129
address $134
address $135
address $136
code
LABELV $126
line 207
;206:	case GAME_INIT:
;207:		G_InitGame( arg0, arg1, arg2 );
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
line 208
;208:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $127
line 210
;209:	case GAME_SHUTDOWN:
;210:		G_ShutdownGame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ShutdownGame
CALLV
pop
line 211
;211:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $128
line 213
;212:	case GAME_CLIENT_CONNECT:
;213:		return (int)ClientConnect( arg0, arg1, arg2 );
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
ADDRGP4 $123
JUMPV
LABELV $129
line 215
;214:	case GAME_CLIENT_THINK:
;215:		ClientThink( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 216
;216:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $130
line 218
;217:	case GAME_CLIENT_USERINFO_CHANGED:
;218:		ClientUserinfoChanged( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 219
;219:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $131
line 221
;220:	case GAME_CLIENT_DISCONNECT:
;221:		ClientDisconnect( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 222
;222:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $132
line 224
;223:	case GAME_CLIENT_BEGIN:
;224:		ClientBegin( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 225
;225:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $133
line 227
;226:	case GAME_CLIENT_COMMAND:
;227:		ClientCommand( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientCommand
CALLV
pop
line 228
;228:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $134
line 230
;229:	case GAME_RUN_FRAME:
;230:		G_RunFrame( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_RunFrame
CALLV
pop
line 231
;231:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $135
line 233
;232:	case GAME_CONSOLE_COMMAND:
;233:		return ConsoleCommand();
ADDRLP4 8
ADDRGP4 ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $123
JUMPV
LABELV $136
line 235
;234:	case BOTAI_START_FRAME:
;235:		return BotAIStartFrame( arg0 );
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
ADDRGP4 $123
JUMPV
LABELV $124
line 238
;236:	}
;237:
;238:	return -1;
CNSTI4 -1
RETI4
LABELV $123
endproc vmMain 16 12
export G_Printf
proc G_Printf 1028 12
line 242
;239:}
;240:
;241:
;242:void QDECL G_Printf( const char *fmt, ... ) {
line 246
;243:	va_list		argptr;
;244:	char		text[1024];
;245:
;246:	va_start (argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 247
;247:	vsprintf (text, fmt, argptr);
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
line 248
;248:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 250
;249:
;250:	trap_Printf( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 251
;251:}
LABELV $138
endproc G_Printf 1028 12
export G_Error
proc G_Error 1028 12
line 253
;252:
;253:void QDECL G_Error( const char *fmt, ... ) {
line 257
;254:	va_list		argptr;
;255:	char		text[1024];
;256:
;257:	va_start (argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 258
;258:	vsprintf (text, fmt, argptr);
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
line 259
;259:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 261
;260:
;261:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 262
;262:}
LABELV $140
endproc G_Error 1028 12
export G_FindTeams
proc G_FindTeams 48 12
line 275
;263:
;264:/*
;265:================
;266:G_FindTeams
;267:
;268:Chain together all entities with a matching team field.
;269:Entity teams are used for item groups and multi-entity mover groups.
;270:
;271:All but the first will have the FL_TEAMSLAVE flag set and teammaster field set
;272:All but the last will have the teamchain field set to the next one
;273:================
;274:*/
;275:void G_FindTeams( void ) {
line 280
;276:	gentity_t	*e, *e2;
;277:	int		i, j;
;278:	int		c, c2;
;279:
;280:	c = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 281
;281:	c2 = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 282
;282:	for ( i=1, e=g_entities+i ; i < level.num_entities ; i++,e++ ){
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
CNSTI4 808
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $146
JUMPV
LABELV $143
line 283
;283:		if (!e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $148
line 284
;284:			continue;
ADDRGP4 $144
JUMPV
LABELV $148
line 285
;285:		if (!e->team)
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $150
line 286
;286:			continue;
ADDRGP4 $144
JUMPV
LABELV $150
line 287
;287:		if (e->flags & FL_TEAMSLAVE)
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $152
line 288
;288:			continue;
ADDRGP4 $144
JUMPV
LABELV $152
line 289
;289:		e->teammaster = e;
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 290
;290:		c++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 291
;291:		c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 292
;292:		for (j=i+1, e2=e+1 ; j < level.num_entities ; j++,e2++)
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
ADDRGP4 $157
JUMPV
LABELV $154
line 293
;293:		{
line 294
;294:			if (!e2->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $159
line 295
;295:				continue;
ADDRGP4 $155
JUMPV
LABELV $159
line 296
;296:			if (!e2->team)
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $161
line 297
;297:				continue;
ADDRGP4 $155
JUMPV
LABELV $161
line 298
;298:			if (e2->flags & FL_TEAMSLAVE)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $163
line 299
;299:				continue;
ADDRGP4 $155
JUMPV
LABELV $163
line 300
;300:			if (!strcmp(e->team, e2->team))
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
NEI4 $165
line 301
;301:			{
line 302
;302:				c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 303
;303:				e2->teamchain = e->teamchain;
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
line 304
;304:				e->teamchain = e2;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 305
;305:				e2->teammaster = e;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 306
;306:				e2->flags |= FL_TEAMSLAVE;
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
line 309
;307:
;308:				// make sure that targets only point at the master
;309:				if ( e2->targetname ) {
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $167
line 310
;310:					e->targetname = e2->targetname;
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
line 311
;311:					e2->targetname = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
CNSTP4 0
ASGNP4
line 312
;312:				}
LABELV $167
line 313
;313:			}
LABELV $165
line 314
;314:		}
LABELV $155
line 292
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $157
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $154
line 315
;315:	}
LABELV $144
line 282
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $146
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $143
line 317
;316:
;317:	G_Printf ("%i teams with %i entities\n", c, c2);
ADDRGP4 $169
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
line 318
;318:}
LABELV $142
endproc G_FindTeams 48 12
export G_RemapTeamShaders
proc G_RemapTeamShaders 0 0
line 320
;319:
;320:void G_RemapTeamShaders() {
line 332
;321:#ifdef MISSIONPACK
;322:	char string[1024];
;323:	float f = level.time * 0.001;
;324:	Com_sprintf( string, sizeof(string), "team_icon/%s_red", g_redteam.string );
;325:	AddRemap("textures/ctf2/redteam01", string, f); 
;326:	AddRemap("textures/ctf2/redteam02", string, f); 
;327:	Com_sprintf( string, sizeof(string), "team_icon/%s_blue", g_blueteam.string );
;328:	AddRemap("textures/ctf2/blueteam01", string, f); 
;329:	AddRemap("textures/ctf2/blueteam02", string, f); 
;330:	trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
;331:#endif
;332:}
LABELV $170
endproc G_RemapTeamShaders 0 0
export G_RegisterCvars
proc G_RegisterCvars 20 16
line 340
;333:
;334:
;335:/*
;336:=================
;337:G_RegisterCvars
;338:=================
;339:*/
;340:void G_RegisterCvars( void ) {
line 343
;341:	int			i;
;342:	cvarTable_t	*cv;
;343:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 345
;344:
;345:	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $175
JUMPV
LABELV $172
line 346
;346:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
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
line 348
;347:			cv->defaultString, cv->cvarFlags );
;348:		if ( cv->vmCvar )
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
line 349
;349:			cv->modificationCount = cv->vmCvar->modificationCount;
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
LABELV $176
line 351
;350:
;351:		if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $178
line 352
;352:			remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 353
;353:		}
LABELV $178
line 354
;354:	}
LABELV $173
line 345
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
LABELV $175
ADDRLP4 4
INDIRI4
ADDRGP4 gameCvarTableSize
INDIRI4
LTI4 $172
line 356
;355:
;356:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $180
line 357
;357:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 358
;358:	}
LABELV $180
line 361
;359:
;360:	// check some things
;361:	if ( g_gametype.integer < 0 || g_gametype.integer >= GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $186
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
LTI4 $182
LABELV $186
line 362
;362:		G_Printf( "g_gametype %i is out of range, defaulting to 0\n", g_gametype.integer );
ADDRGP4 $187
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 363
;363:		trap_Cvar_Set( "g_gametype", "0" );
ADDRGP4 $63
ARGP4
ADDRGP4 $61
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 364
;364:	}
LABELV $182
line 366
;365:
;366:	level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+352
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 367
;367:}
LABELV $171
endproc G_RegisterCvars 20 16
export G_UpdateCvars
proc G_UpdateCvars 28 12
line 374
;368:
;369:/*
;370:=================
;371:G_UpdateCvars
;372:=================
;373:*/
;374:void G_UpdateCvars( void ) {
line 377
;375:	int			i;
;376:	cvarTable_t	*cv;
;377:	qboolean remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 379
;378:
;379:	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $192
line 380
;380:		if ( cv->vmCvar ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $196
line 381
;381:			trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 383
;382:
;383:			if ( cv->modificationCount != cv->vmCvar->modificationCount ) {
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
EQI4 $198
line 384
;384:				cv->modificationCount = cv->vmCvar->modificationCount;
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
line 386
;385:
;386:				if ( cv->trackChange ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $200
line 387
;387:					trap_SendServerCommand( -1, va("print \"Server: %s changed to %s\n\"", 
ADDRGP4 $202
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
line 389
;388:						cv->cvarName, cv->vmCvar->string ) );
;389:				}
LABELV $200
line 391
;390:
;391:				if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $203
line 392
;392:					remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 393
;393:				}
LABELV $203
line 394
;394:			}
LABELV $198
line 395
;395:		}
LABELV $196
line 396
;396:	}
LABELV $193
line 379
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
LABELV $195
ADDRLP4 4
INDIRI4
ADDRGP4 gameCvarTableSize
INDIRI4
LTI4 $192
line 398
;397:
;398:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $205
line 399
;399:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 400
;400:	}
LABELV $205
line 401
;401:}
LABELV $191
endproc G_UpdateCvars 28 12
export G_InitGame
proc G_InitGame 1032 20
line 409
;402:
;403:/*
;404:============
;405:G_InitGame
;406:
;407:============
;408:*/
;409:void G_InitGame( int levelTime, int randomSeed, int restart ) {
line 412
;410:	int					i;
;411:
;412:	G_Printf ("------- Game Initialization -------\n");
ADDRGP4 $208
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 413
;413:	G_Printf ("gamename: %s\n", GAMEVERSION);
ADDRGP4 $209
ARGP4
ADDRGP4 $57
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 414
;414:	G_Printf ("gamedate: %s\n", __DATE__);
ADDRGP4 $210
ARGP4
ADDRGP4 $59
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 416
;415:
;416:	srand( randomSeed );
ADDRFP4 4
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 srand
CALLV
pop
line 418
;417:
;418:	G_RegisterCvars();
ADDRGP4 G_RegisterCvars
CALLV
pop
line 420
;419:
;420:	G_ProcessIPBans();
ADDRGP4 G_ProcessIPBans
CALLV
pop
line 422
;421:
;422:	G_InitMemory();
ADDRGP4 G_InitMemory
CALLV
pop
line 425
;423:
;424:	// set some level globals
;425:	memset( &level, 0, sizeof( level ) );
ADDRGP4 level
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9216
ARGI4
ADDRGP4 memset
CALLP4
pop
line 426
;426:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 427
;427:	level.startTime = levelTime;
ADDRGP4 level+40
ADDRFP4 0
INDIRI4
ASGNI4
line 429
;428:
;429:	level.snd_fry = G_SoundIndex("sound/player/fry.wav");	// FIXME standing in lava / slime
ADDRGP4 $214
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 level+348
ADDRLP4 4
INDIRI4
ASGNI4
line 431
;430:
;431:	if ( g_gametype.integer != GT_SINGLE_PLAYER && g_log.string[0] ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $215
ADDRGP4 g_log+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $215
line 432
;432:		if ( g_logSync.integer ) {
ADDRGP4 g_logSync+12
INDIRI4
CNSTI4 0
EQI4 $219
line 433
;433:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND_SYNC );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 434
;434:		} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 435
;435:			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND );
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 436
;436:		}
LABELV $220
line 437
;437:		if ( !level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $226
line 438
;438:			G_Printf( "WARNING: Couldn't open logfile: %s\n", g_log.string );
ADDRGP4 $229
ARGP4
ADDRGP4 g_log+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 439
;439:		} else {
ADDRGP4 $216
JUMPV
LABELV $226
line 442
;440:			char	serverinfo[MAX_INFO_STRING];
;441:
;442:			trap_GetServerinfo( serverinfo, sizeof( serverinfo ) );
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 444
;443:
;444:			G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $231
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 445
;445:			G_LogPrintf("InitGame: %s\n", serverinfo );
ADDRGP4 $232
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 446
;446:		}
line 447
;447:	} else {
ADDRGP4 $216
JUMPV
LABELV $215
line 448
;448:		G_Printf( "Not logging to disk.\n" );
ADDRGP4 $233
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 449
;449:	}
LABELV $216
line 451
;450:
;451:	G_InitWorldSession();
ADDRGP4 G_InitWorldSession
CALLV
pop
line 454
;452:
;453:	// initialize all entities for this game
;454:	memset( g_entities, 0, MAX_GENTITIES * sizeof(g_entities[0]) );
ADDRGP4 g_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 827392
ARGI4
ADDRGP4 memset
CALLP4
pop
line 455
;455:	level.gentities = g_entities;
ADDRGP4 level+4
ADDRGP4 g_entities
ASGNP4
line 458
;456:
;457:	// initialize all clients for this game
;458:	level.maxclients = g_maxclients.integer;
ADDRGP4 level+24
ADDRGP4 g_maxclients+12
INDIRI4
ASGNI4
line 459
;459:	memset( g_clients, 0, MAX_CLIENTS * sizeof(g_clients[0]) );
ADDRGP4 g_clients
ARGP4
CNSTI4 0
ARGI4
CNSTI4 213760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 460
;460:	level.clients = g_clients;
ADDRGP4 level
ADDRGP4 g_clients
ASGNP4
line 463
;461:
;462:	// set client fields on player ents
;463:	for ( i=0 ; i<level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 464
;464:		g_entities[i].client = level.clients + i;
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 465
;465:	}
LABELV $238
line 463
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $237
line 470
;466:
;467:	// always leave room for the max number of clients,
;468:	// even if they aren't all used, so numbers inside that
;469:	// range are NEVER anything but clients
;470:	level.num_entities = MAX_CLIENTS;
ADDRGP4 level+12
CNSTI4 64
ASGNI4
line 473
;471:
;472:	// let the server system know where the entites are
;473:	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 808
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 3340
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 477
;474:		&level.clients[0].ps, sizeof( level.clients[0] ) );
;475:
;476:	// reserve some spots for dead player bodies
;477:	InitBodyQue();
ADDRGP4 InitBodyQue
CALLV
pop
line 479
;478:
;479:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 482
;480:
;481:	// parse the key/value pairs and spawn gentities
;482:	G_SpawnEntitiesFromString();
ADDRGP4 G_SpawnEntitiesFromString
CALLV
pop
line 485
;483:
;484:	// general initialization
;485:	G_FindTeams();
ADDRGP4 G_FindTeams
CALLV
pop
line 488
;486:
;487:	// make sure we have flags for CTF, etc
;488:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $246
line 489
;489:		G_CheckTeamItems();
ADDRGP4 G_CheckTeamItems
CALLV
pop
line 490
;490:	}
LABELV $246
line 492
;491:
;492:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 494
;493:
;494:	G_Printf ("-----------------------------------\n");
ADDRGP4 $249
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 496
;495:
;496:	if( g_gametype.integer == GT_SINGLE_PLAYER || trap_Cvar_VariableIntegerValue( "com_buildScript" ) ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $254
ADDRGP4 $253
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $250
LABELV $254
line 497
;497:		G_ModelIndex( SP_PODIUM_MODEL );
ADDRGP4 $255
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 498
;498:		G_SoundIndex( "sound/player/gurp1.wav" );
ADDRGP4 $256
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 499
;499:		G_SoundIndex( "sound/player/gurp2.wav" );
ADDRGP4 $257
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 500
;500:	}
LABELV $250
line 502
;501:
;502:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $260
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $258
line 503
;503:		BotAISetup( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAISetup
CALLI4
pop
line 504
;504:		BotAILoadMap( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAILoadMap
CALLI4
pop
line 505
;505:		G_InitBots( restart );
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitBots
CALLV
pop
line 506
;506:	}
LABELV $258
line 508
;507:
;508:	G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 510
;509:
;510:}
LABELV $207
endproc G_InitGame 1032 20
export G_ShutdownGame
proc G_ShutdownGame 4 4
line 519
;511:
;512:
;513:
;514:/*
;515:=================
;516:G_ShutdownGame
;517:=================
;518:*/
;519:void G_ShutdownGame( int restart ) {
line 520
;520:	G_Printf ("==== ShutdownGame ====\n");
ADDRGP4 $262
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 522
;521:
;522:	if ( level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
EQI4 $263
line 523
;523:		G_LogPrintf("ShutdownGame:\n" );
ADDRGP4 $266
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 524
;524:		G_LogPrintf("------------------------------------------------------------\n" );
ADDRGP4 $231
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 525
;525:		trap_FS_FCloseFile( level.logFile );
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 526
;526:	}
LABELV $263
line 529
;527:
;528:	// write all the client session data so we can get it back
;529:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 531
;530:
;531:	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $260
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $268
line 532
;532:		BotAIShutdown( restart );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdown
CALLI4
pop
line 533
;533:	}
LABELV $268
line 534
;534:}
LABELV $261
endproc G_ShutdownGame 4 4
export Com_Error
proc Com_Error 1028 12
line 543
;535:
;536:
;537:
;538://===================================================================
;539:
;540:#ifndef GAME_HARD_LINKED
;541:// this is only here so the functions in q_shared.c and bg_*.c can link
;542:
;543:void QDECL Com_Error ( int level, const char *error, ... ) {
line 547
;544:	va_list		argptr;
;545:	char		text[1024];
;546:
;547:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 548
;548:	vsprintf (text, error, argptr);
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
line 549
;549:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 551
;550:
;551:	G_Error( "%s", text);
ADDRGP4 $272
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 552
;552:}
LABELV $270
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 554
;553:
;554:void QDECL Com_Printf( const char *msg, ... ) {
line 558
;555:	va_list		argptr;
;556:	char		text[1024];
;557:
;558:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 559
;559:	vsprintf (text, msg, argptr);
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
line 560
;560:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 562
;561:
;562:	G_Printf ("%s", text);
ADDRGP4 $272
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 563
;563:}
LABELV $273
endproc Com_Printf 1028 12
export AddTournamentPlayer
proc AddTournamentPlayer 24 8
line 583
;564:
;565:#endif
;566:
;567:/*
;568:========================================================================
;569:
;570:PLAYER COUNTING / SCORE SORTING
;571:
;572:========================================================================
;573:*/
;574:
;575:/*
;576:=============
;577:AddTournamentPlayer
;578:
;579:If there are less than two tournament players, put a
;580:spectator in the game and restart
;581:=============
;582:*/
;583:void AddTournamentPlayer( void ) {
line 588
;584:	int			i;
;585:	gclient_t	*client;
;586:	gclient_t	*nextInLine;
;587:
;588:	if ( level.numPlayingClients >= 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $276
line 589
;589:		return;
ADDRGP4 $275
JUMPV
LABELV $276
line 593
;590:	}
;591:
;592:	// never change during intermission
;593:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $279
line 594
;594:		return;
ADDRGP4 $275
JUMPV
LABELV $279
line 597
;595:	}
;596:
;597:	nextInLine = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 599
;598:
;599:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $285
JUMPV
LABELV $282
line 600
;600:		client = &level.clients[i];
ADDRLP4 0
CNSTI4 3340
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 601
;601:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $287
line 602
;602:			continue;
ADDRGP4 $283
JUMPV
LABELV $287
line 604
;603:		}
;604:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 3
EQI4 $289
line 605
;605:			continue;
ADDRGP4 $283
JUMPV
LABELV $289
line 608
;606:		}
;607:		// never select the dedicated follow or scoreboard clients
;608:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD || 
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 3
EQI4 $293
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
GEI4 $291
LABELV $293
line 609
;609:			client->sess.spectatorClient < 0  ) {
line 610
;610:			continue;
ADDRGP4 $283
JUMPV
LABELV $291
line 613
;611:		}
;612:
;613:		if ( !nextInLine || client->sess.spectatorTime < nextInLine->sess.spectatorTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $296
ADDRLP4 20
CNSTI4 2448
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
GEI4 $294
LABELV $296
line 614
;614:			nextInLine = client;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 615
;615:		}
LABELV $294
line 616
;616:	}
LABELV $283
line 599
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $285
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $282
line 618
;617:
;618:	if ( !nextInLine ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $297
line 619
;619:		return;
ADDRGP4 $275
JUMPV
LABELV $297
line 622
;620:	}
;621:
;622:	level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 625
;623:
;624:	// set them to free-for-all team
;625:	SetTeam( &g_entities[ nextInLine - level.clients ], "f" );
CNSTI4 808
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3340
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 626
;626:}
LABELV $275
endproc AddTournamentPlayer 24 8
export RemoveTournamentLoser
proc RemoveTournamentLoser 4 8
line 635
;627:
;628:/*
;629:=======================
;630:RemoveTournamentLoser
;631:
;632:Make the loser a spectator at the back of the line
;633:=======================
;634:*/
;635:void RemoveTournamentLoser( void ) {
line 638
;636:	int			clientNum;
;637:
;638:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
EQI4 $302
line 639
;639:		return;
ADDRGP4 $301
JUMPV
LABELV $302
line 642
;640:	}
;641:
;642:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 644
;643:
;644:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3340
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
EQI4 $307
line 645
;645:		return;
ADDRGP4 $301
JUMPV
LABELV $307
line 649
;646:	}
;647:
;648:	// make them a spectator
;649:	SetTeam( &g_entities[ clientNum ], "s" );
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $309
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 650
;650:}
LABELV $301
endproc RemoveTournamentLoser 4 8
export RemoveTournamentWinner
proc RemoveTournamentWinner 4 8
line 657
;651:
;652:/*
;653:=======================
;654:RemoveTournamentWinner
;655:=======================
;656:*/
;657:void RemoveTournamentWinner( void ) {
line 660
;658:	int			clientNum;
;659:
;660:	if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
EQI4 $311
line 661
;661:		return;
ADDRGP4 $310
JUMPV
LABELV $311
line 664
;662:	}
;663:
;664:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+84
INDIRI4
ASGNI4
line 666
;665:
;666:	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
CNSTI4 3340
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
EQI4 $315
line 667
;667:		return;
ADDRGP4 $310
JUMPV
LABELV $315
line 671
;668:	}
;669:
;670:	// make them a spectator
;671:	SetTeam( &g_entities[ clientNum ], "s" );
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $309
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 672
;672:}
LABELV $310
endproc RemoveTournamentWinner 4 8
export AdjustTournamentScores
proc AdjustTournamentScores 8 4
line 679
;673:
;674:/*
;675:=======================
;676:AdjustTournamentScores
;677:=======================
;678:*/
;679:void AdjustTournamentScores( void ) {
line 682
;680:	int			clientNum;
;681:
;682:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+84
INDIRI4
ASGNI4
line 683
;683:	if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
CNSTI4 3340
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
NEI4 $319
line 684
;684:		level.clients[ clientNum ].sess.wins++;
ADDRLP4 4
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2460
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
line 685
;685:		ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 686
;686:	}
LABELV $319
line 688
;687:
;688:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+84+4
INDIRI4
ASGNI4
line 689
;689:	if ( level.clients[ clientNum ].pers.connected == CON_CONNECTED ) {
CNSTI4 3340
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
NEI4 $323
line 690
;690:		level.clients[ clientNum ].sess.losses++;
ADDRLP4 4
CNSTI4 3340
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
line 691
;691:		ClientUserinfoChanged( clientNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 692
;692:	}
LABELV $323
line 694
;693:
;694:}
LABELV $317
endproc AdjustTournamentScores 8 4
export SortRanks
proc SortRanks 32 0
line 702
;695:
;696:/*
;697:=============
;698:SortRanks
;699:
;700:=============
;701:*/
;702:int QDECL SortRanks( const void *a, const void *b ) {
line 705
;703:	gclient_t	*ca, *cb;
;704:
;705:	ca = &level.clients[*(int *)a];
ADDRLP4 0
CNSTI4 3340
ADDRFP4 0
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 706
;706:	cb = &level.clients[*(int *)b];
ADDRLP4 4
CNSTI4 3340
ADDRFP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 709
;707:
;708:	// sort special clients last
;709:	if ( ca->sess.spectatorState == SPECTATOR_SCOREBOARD || ca->sess.spectatorClient < 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 3
EQI4 $328
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
GEI4 $326
LABELV $328
line 710
;710:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $325
JUMPV
LABELV $326
line 712
;711:	}
;712:	if ( cb->sess.spectatorState == SPECTATOR_SCOREBOARD || cb->sess.spectatorClient < 0  ) {
ADDRLP4 4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 3
EQI4 $331
ADDRLP4 4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
GEI4 $329
LABELV $331
line 713
;713:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $329
line 717
;714:	}
;715:
;716:	// then connecting clients
;717:	if ( ca->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $332
line 718
;718:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $325
JUMPV
LABELV $332
line 720
;719:	}
;720:	if ( cb->pers.connected == CON_CONNECTING ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $334
line 721
;721:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $334
line 726
;722:	}
;723:
;724:
;725:	// then spectators
;726:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR && cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 16
CNSTI4 2444
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
NEI4 $336
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $336
line 727
;727:		if ( ca->sess.spectatorTime < cb->sess.spectatorTime ) {
ADDRLP4 24
CNSTI4 2448
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
GEI4 $338
line 728
;728:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $338
line 730
;729:		}
;730:		if ( ca->sess.spectatorTime > cb->sess.spectatorTime ) {
ADDRLP4 28
CNSTI4 2448
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
LEI4 $340
line 731
;731:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $325
JUMPV
LABELV $340
line 733
;732:		}
;733:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $325
JUMPV
LABELV $336
line 735
;734:	}
;735:	if ( ca->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 3
NEI4 $342
line 736
;736:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $325
JUMPV
LABELV $342
line 738
;737:	}
;738:	if ( cb->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 3
NEI4 $344
line 739
;739:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $344
line 743
;740:	}
;741:
;742:	// then sort by score
;743:	if ( ca->ps.persistant[PERS_SCORE]
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
LEI4 $346
line 744
;744:		> cb->ps.persistant[PERS_SCORE] ) {
line 745
;745:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $325
JUMPV
LABELV $346
line 747
;746:	}
;747:	if ( ca->ps.persistant[PERS_SCORE]
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
GEI4 $348
line 748
;748:		< cb->ps.persistant[PERS_SCORE] ) {
line 749
;749:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $325
JUMPV
LABELV $348
line 751
;750:	}
;751:	return 0;
CNSTI4 0
RETI4
LABELV $325
endproc SortRanks 32 0
export CalculateRanks
proc CalculateRanks 44 16
line 763
;752:}
;753:
;754:/*
;755:============
;756:CalculateRanks
;757:
;758:Recalculates the score ranks of all players
;759:This will be called on every client connect, begin, disconnect, death,
;760:and team change.
;761:============
;762:*/
;763:void CalculateRanks( void ) {
line 770
;764:	int		i;
;765:	int		rank;
;766:	int		score;
;767:	int		newScore;
;768:	gclient_t	*cl;
;769:
;770:	level.follow1 = -1;
ADDRGP4 level+340
CNSTI4 -1
ASGNI4
line 771
;771:	level.follow2 = -1;
ADDRGP4 level+344
CNSTI4 -1
ASGNI4
line 772
;772:	level.numConnectedClients = 0;
ADDRGP4 level+72
CNSTI4 0
ASGNI4
line 773
;773:	level.numNonSpectatorClients = 0;
ADDRGP4 level+76
CNSTI4 0
ASGNI4
line 774
;774:	level.numPlayingClients = 0;
ADDRGP4 level+80
CNSTI4 0
ASGNI4
line 775
;775:	level.numVotingClients = 0;		// don't count bots
ADDRGP4 level+2420
CNSTI4 0
ASGNI4
line 776
;776:	for ( i = 0; i < TEAM_NUM_TEAMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $357
line 777
;777:		level.numteamVotingClients[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4496
ADDP4
CNSTI4 0
ASGNI4
line 778
;778:	}
LABELV $358
line 776
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $357
line 779
;779:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $362
line 780
;780:		if ( level.clients[i].pers.connected != CON_DISCONNECTED ) {
CNSTI4 3340
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
EQI4 $367
line 781
;781:			level.sortedClients[level.numConnectedClients] = i;
ADDRGP4 level+72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 782
;782:			level.numConnectedClients++;
ADDRLP4 20
ADDRGP4 level+72
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 784
;783:
;784:			if ( level.clients[i].sess.sessionTeam != TEAM_SPECTATOR ) {
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 3
EQI4 $372
line 785
;785:				level.numNonSpectatorClients++;
ADDRLP4 24
ADDRGP4 level+76
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 788
;786:			
;787:				// decide if this should be auto-followed
;788:				if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 3340
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
NEI4 $375
line 789
;789:					level.numPlayingClients++;
ADDRLP4 28
ADDRGP4 level+80
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 790
;790:					if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $378
line 791
;791:						level.numVotingClients++;
ADDRLP4 32
ADDRGP4 level+2420
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 792
;792:						if ( level.clients[i].sess.sessionTeam == TEAM_RED )
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 1
NEI4 $383
line 793
;793:							level.numteamVotingClients[0]++;
ADDRLP4 36
ADDRGP4 level+4496
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $383
line 794
;794:						else if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 2
NEI4 $386
line 795
;795:							level.numteamVotingClients[1]++;
ADDRLP4 40
ADDRGP4 level+4496+4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $386
LABELV $384
line 796
;796:					}
LABELV $378
line 797
;797:					if ( level.follow1 == -1 ) {
ADDRGP4 level+340
INDIRI4
CNSTI4 -1
NEI4 $390
line 798
;798:						level.follow1 = i;
ADDRGP4 level+340
ADDRLP4 0
INDIRI4
ASGNI4
line 799
;799:					} else if ( level.follow2 == -1 ) {
ADDRGP4 $391
JUMPV
LABELV $390
ADDRGP4 level+344
INDIRI4
CNSTI4 -1
NEI4 $394
line 800
;800:						level.follow2 = i;
ADDRGP4 level+344
ADDRLP4 0
INDIRI4
ASGNI4
line 801
;801:					}
LABELV $394
LABELV $391
line 802
;802:				}
LABELV $375
line 803
;803:			}
LABELV $372
line 804
;804:		}
LABELV $367
line 805
;805:	}
LABELV $363
line 779
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $365
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $362
line 807
;806:
;807:	qsort( level.sortedClients, level.numConnectedClients, 
ADDRGP4 level+84
ARGP4
ADDRGP4 level+72
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortRanks
ARGP4
ADDRGP4 qsort
CALLV
pop
line 811
;808:		sizeof(level.sortedClients[0]), SortRanks );
;809:
;810:	// set the rank value for all clients that are connected and not spectators
;811:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $401
line 813
;812:		// in team games, rank is just the order of the teams, 0=red, 1=blue, 2=tied
;813:		for ( i = 0;  i < level.numConnectedClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $407
JUMPV
LABELV $404
line 814
;814:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
CNSTI4 3340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 815
;815:			if ( level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $410
line 816
;816:				cl->ps.persistant[PERS_RANK] = 2;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 817
;817:			} else if ( level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE] ) {
ADDRGP4 $411
JUMPV
LABELV $410
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $416
line 818
;818:				cl->ps.persistant[PERS_RANK] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 819
;819:			} else {
ADDRGP4 $417
JUMPV
LABELV $416
line 820
;820:				cl->ps.persistant[PERS_RANK] = 1;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 821
;821:			}
LABELV $417
LABELV $411
line 822
;822:		}
LABELV $405
line 813
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $407
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $404
line 823
;823:	} else {	
ADDRGP4 $402
JUMPV
LABELV $401
line 824
;824:		rank = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 825
;825:		score = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 826
;826:		for ( i = 0;  i < level.numPlayingClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $425
JUMPV
LABELV $422
line 827
;827:			cl = &level.clients[ level.sortedClients[i] ];
ADDRLP4 4
CNSTI4 3340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 828
;828:			newScore = cl->ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 829
;829:			if ( i == 0 || newScore != score ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $430
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $428
LABELV $430
line 830
;830:				rank = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 832
;831:				// assume we aren't tied until the next client is checked
;832:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank;
CNSTI4 3340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
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
line 833
;833:			} else {
ADDRGP4 $429
JUMPV
LABELV $428
line 835
;834:				// we are tied with the previous client
;835:				level.clients[ level.sortedClients[i-1] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 3340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84-4
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
line 836
;836:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 3340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
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
line 837
;837:			}
LABELV $429
line 838
;838:			score = newScore;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
line 839
;839:			if ( g_gametype.integer == GT_SINGLE_PLAYER && level.numPlayingClients == 1 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $435
ADDRGP4 level+80
INDIRI4
CNSTI4 1
NEI4 $435
line 840
;840:				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
CNSTI4 3340
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
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
;841:			}
LABELV $435
line 842
;842:		}
LABELV $423
line 826
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $425
ADDRLP4 0
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $422
line 843
;843:	}
LABELV $402
line 846
;844:
;845:	// set the CS_SCORES1/2 configstrings, which will be visible to everyone
;846:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $440
line 847
;847:		trap_SetConfigstring( CS_SCORES1, va("%i", level.teamScores[TEAM_RED] ) );
ADDRGP4 $443
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
line 848
;848:		trap_SetConfigstring( CS_SCORES2, va("%i", level.teamScores[TEAM_BLUE] ) );
ADDRGP4 $443
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
line 849
;849:	} else {
ADDRGP4 $441
JUMPV
LABELV $440
line 850
;850:		if ( level.numConnectedClients == 0 ) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $448
line 851
;851:			trap_SetConfigstring( CS_SCORES1, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $443
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
line 852
;852:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $443
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
line 853
;853:		} else if ( level.numConnectedClients == 1 ) {
ADDRGP4 $449
JUMPV
LABELV $448
ADDRGP4 level+72
INDIRI4
CNSTI4 1
NEI4 $451
line 854
;854:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $443
ARGP4
CNSTI4 3340
ADDRGP4 level+84
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
line 855
;855:			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
ADDRGP4 $443
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
line 856
;856:		} else {
ADDRGP4 $452
JUMPV
LABELV $451
line 857
;857:			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $443
ARGP4
CNSTI4 3340
ADDRGP4 level+84
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
line 858
;858:			trap_SetConfigstring( CS_SCORES2, va("%i", level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] ) );
ADDRGP4 $443
ARGP4
CNSTI4 3340
ADDRGP4 level+84+4
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
line 859
;859:		}
LABELV $452
LABELV $449
line 860
;860:	}
LABELV $441
line 863
;861:
;862:	// see if it is time to end the level
;863:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 866
;864:
;865:	// if we are at the intermission, send the new info to everyone
;866:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $458
line 867
;867:		SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 868
;868:	}
LABELV $458
line 869
;869:}
LABELV $350
endproc CalculateRanks 44 16
export SendScoreboardMessageToAllClients
proc SendScoreboardMessageToAllClients 4 4
line 888
;870:
;871:
;872:/*
;873:========================================================================
;874:
;875:MAP CHANGING
;876:
;877:========================================================================
;878:*/
;879:
;880:/*
;881:========================
;882:SendScoreboardMessageToAllClients
;883:
;884:Do this at BeginIntermission time and whenever ranks are recalculated
;885:due to enters/exits/forced team changes
;886:========================
;887:*/
;888:void SendScoreboardMessageToAllClients( void ) {
line 891
;889:	int		i;
;890:
;891:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $462
line 892
;892:		if ( level.clients[ i ].pers.connected == CON_CONNECTED ) {
CNSTI4 3340
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
NEI4 $467
line 893
;893:			DeathmatchScoreboardMessage( g_entities + i );
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 894
;894:		}
LABELV $467
line 895
;895:	}
LABELV $463
line 891
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $465
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $462
line 896
;896:}
LABELV $461
endproc SendScoreboardMessageToAllClients 4 4
export MoveClientToIntermission
proc MoveClientToIntermission 0 12
line 906
;897:
;898:/*
;899:========================
;900:MoveClientToIntermission
;901:
;902:When the intermission starts, this will be called for all players.
;903:If a new client connects, this will be called after the spawn function.
;904:========================
;905:*/
;906:void MoveClientToIntermission( gentity_t *ent ) {
line 908
;907:	// take out of follow mode if needed
;908:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 2
NEI4 $470
line 909
;909:		StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 910
;910:	}
LABELV $470
line 914
;911:
;912:
;913:	// move to the spot
;914:	VectorCopy( level.intermission_origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+9144
INDIRB
ASGNB 12
line 915
;915:	VectorCopy( level.intermission_origin, ent->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+9144
INDIRB
ASGNB 12
line 916
;916:	VectorCopy (level.intermission_angle, ent->client->ps.viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 level+9156
INDIRB
ASGNB 12
line 917
;917:	ent->client->ps.pm_type = PM_INTERMISSION;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 920
;918:
;919:	// clean up powerup info
;920:	memset( ent->client->ps.powerups, 0, sizeof(ent->client->ps.powerups) );
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
line 922
;921:
;922:	ent->client->ps.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 0
ASGNI4
line 923
;923:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 924
;924:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 925
;925:	ent->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 926
;926:	ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 927
;927:	ent->s.event = 0;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 928
;928:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 929
;929:}
LABELV $469
endproc MoveClientToIntermission 0 12
export FindIntermissionPoint
proc FindIntermissionPoint 32 12
line 938
;930:
;931:/*
;932:==================
;933:FindIntermissionPoint
;934:
;935:This is also used for spectator spawns
;936:==================
;937:*/
;938:void FindIntermissionPoint( void ) {
line 943
;939:	gentity_t	*ent, *target;
;940:	vec3_t		dir;
;941:
;942:	// find the intermission spot
;943:	ent = G_Find (NULL, FOFS(classname), "info_player_intermission");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $476
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 944
;944:	if ( !ent ) {	// the map creator forgot to put in an intermission point...
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $477
line 945
;945:		SelectSpawnPoint ( vec3_origin, level.intermission_origin, level.intermission_angle );
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 level+9144
ARGP4
ADDRGP4 level+9156
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 946
;946:	} else {
ADDRGP4 $478
JUMPV
LABELV $477
line 947
;947:		VectorCopy (ent->s.origin, level.intermission_origin);
ADDRGP4 level+9144
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 948
;948:		VectorCopy (ent->s.angles, level.intermission_angle);
ADDRGP4 level+9156
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 950
;949:		// if it has a target, look towards it
;950:		if ( ent->target ) {
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $483
line 951
;951:			target = G_PickTarget( ent->target );
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
line 952
;952:			if ( target ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
line 953
;953:				VectorSubtract( target->s.origin, level.intermission_origin, dir );
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
ADDRGP4 level+9144
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 level+9144+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 level+9144+8
INDIRF4
SUBF4
ASGNF4
line 954
;954:				vectoangles( dir, level.intermission_angle );
ADDRLP4 8
ARGP4
ADDRGP4 level+9156
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 955
;955:			}
LABELV $485
line 956
;956:		}
LABELV $483
line 957
;957:	}
LABELV $478
line 959
;958:
;959:}
LABELV $475
endproc FindIntermissionPoint 32 12
export BeginIntermission
proc BeginIntermission 8 4
line 966
;960:
;961:/*
;962:==================
;963:BeginIntermission
;964:==================
;965:*/
;966:void BeginIntermission( void ) {
line 970
;967:	int			i;
;968:	gentity_t	*client;
;969:
;970:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $496
line 971
;971:		return;		// already active
ADDRGP4 $495
JUMPV
LABELV $496
line 975
;972:	}
;973:
;974:	// if in tournement mode, change the wins / losses
;975:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $499
line 976
;976:		AdjustTournamentScores();
ADDRGP4 AdjustTournamentScores
CALLV
pop
line 977
;977:	}
LABELV $499
line 979
;978:
;979:	level.intermissiontime = level.time;
ADDRGP4 level+9128
ADDRGP4 level+32
INDIRI4
ASGNI4
line 980
;980:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 989
;981:
;982:#ifdef MISSIONPACK
;983:	if (g_singlePlayer.integer) {
;984:		trap_Cvar_Set("ui_singlePlayerActive", "0");
;985:		UpdateTournamentInfo();
;986:	}
;987:#else
;988:	// if single player game
;989:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $504
line 990
;990:		UpdateTournamentInfo();
ADDRGP4 UpdateTournamentInfo
CALLV
pop
line 991
;991:		SpawnModelsOnVictoryPads();
ADDRGP4 SpawnModelsOnVictoryPads
CALLV
pop
line 992
;992:	}
LABELV $504
line 996
;993:#endif
;994:
;995:	// move all clients to the intermission point
;996:	for (i=0 ; i< level.maxclients ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $510
JUMPV
LABELV $507
line 997
;997:		client = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 998
;998:		if (!client->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $512
line 999
;999:			continue;
ADDRGP4 $508
JUMPV
LABELV $512
line 1001
;1000:		// respawn if dead
;1001:		if (client->health <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $514
line 1002
;1002:			respawn(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1003
;1003:		}
LABELV $514
line 1004
;1004:		MoveClientToIntermission( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1005
;1005:	}
LABELV $508
line 996
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $510
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $507
line 1008
;1006:
;1007:	// send the current scoring to all clients
;1008:	SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 1010
;1009:
;1010:}
LABELV $495
endproc BeginIntermission 8 4
export ExitLevel
proc ExitLevel 8 8
line 1022
;1011:
;1012:
;1013:/*
;1014:=============
;1015:ExitLevel
;1016:
;1017:When the intermission has been exited, the server is either killed
;1018:or moved to a new level based on the "nextmap" cvar 
;1019:
;1020:=============
;1021:*/
;1022:void ExitLevel (void) {
line 1027
;1023:	int		i;
;1024:	gclient_t *cl;
;1025:
;1026:	//bot interbreeding
;1027:	BotInterbreedEndMatch();
ADDRGP4 BotInterbreedEndMatch
CALLV
pop
line 1031
;1028:
;1029:	// if we are running a tournement map, kick the loser to spectator status,
;1030:	// which will automatically grab the next spectator and restart
;1031:	if ( g_gametype.integer == GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $517
line 1032
;1032:		if ( !level.restarted ) {
ADDRGP4 level+68
INDIRI4
CNSTI4 0
NEI4 $516
line 1033
;1033:			RemoveTournamentLoser();
ADDRGP4 RemoveTournamentLoser
CALLV
pop
line 1034
;1034:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $523
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1035
;1035:			level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 1036
;1036:			level.changemap = NULL;
ADDRGP4 level+9132
CNSTP4 0
ASGNP4
line 1037
;1037:			level.intermissiontime = 0;
ADDRGP4 level+9128
CNSTI4 0
ASGNI4
line 1038
;1038:		}
line 1039
;1039:		return;	
ADDRGP4 $516
JUMPV
LABELV $517
line 1043
;1040:	}
;1041:
;1042:
;1043:	trap_SendConsoleCommand( EXEC_APPEND, "vstr nextmap\n" );
CNSTI4 2
ARGI4
ADDRGP4 $527
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1044
;1044:	level.changemap = NULL;
ADDRGP4 level+9132
CNSTP4 0
ASGNP4
line 1045
;1045:	level.intermissiontime = 0;
ADDRGP4 level+9128
CNSTI4 0
ASGNI4
line 1048
;1046:
;1047:	// reset all the scores so we don't enter the intermission again
;1048:	level.teamScores[TEAM_RED] = 0;
ADDRGP4 level+44+4
CNSTI4 0
ASGNI4
line 1049
;1049:	level.teamScores[TEAM_BLUE] = 0;
ADDRGP4 level+44+8
CNSTI4 0
ASGNI4
line 1050
;1050:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $537
JUMPV
LABELV $534
line 1051
;1051:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1052
;1052:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $539
line 1053
;1053:			continue;
ADDRGP4 $535
JUMPV
LABELV $539
line 1055
;1054:		}
;1055:		cl->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1056
;1056:	}
LABELV $535
line 1050
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $537
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $534
line 1059
;1057:
;1058:	// we need to do this here before chaning to CON_CONNECTING
;1059:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 1063
;1060:
;1061:	// change all client states to connecting, so the early players into the
;1062:	// next level will know the others aren't done reconnecting
;1063:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $544
JUMPV
LABELV $541
line 1064
;1064:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 3340
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
NEI4 $546
line 1065
;1065:			level.clients[i].pers.connected = CON_CONNECTING;
CNSTI4 3340
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
line 1066
;1066:		}
LABELV $546
line 1067
;1067:	}
LABELV $542
line 1063
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $544
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $541
line 1069
;1068:
;1069:}
LABELV $516
endproc ExitLevel 8 8
export G_LogPrintf
proc G_LogPrintf 1044 24
line 1078
;1070:
;1071:/*
;1072:=================
;1073:G_LogPrintf
;1074:
;1075:Print to the logfile with a time stamp if it is open
;1076:=================
;1077:*/
;1078:void QDECL G_LogPrintf( const char *fmt, ... ) {
line 1083
;1079:	va_list		argptr;
;1080:	char		string[1024];
;1081:	int			min, tens, sec;
;1082:
;1083:	sec = level.time / 1000;
ADDRLP4 0
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 1085
;1084:
;1085:	min = sec / 60;
ADDRLP4 1032
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1086
;1086:	sec -= min * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 60
ADDRLP4 1032
INDIRI4
MULI4
SUBI4
ASGNI4
line 1087
;1087:	tens = sec / 10;
ADDRLP4 1036
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1088
;1088:	sec -= tens * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDRLP4 1036
INDIRI4
MULI4
SUBI4
ASGNI4
line 1090
;1089:
;1090:	Com_sprintf( string, sizeof(string), "%3i:%i%i ", min, tens, sec );
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $550
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
line 1092
;1091:
;1092:	va_start( argptr, fmt );
ADDRLP4 1028
ADDRFP4 0+4
ASGNP4
line 1093
;1093:	vsprintf( string +7 , fmt,argptr );
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
line 1094
;1094:	va_end( argptr );
ADDRLP4 1028
CNSTP4 0
ASGNP4
line 1096
;1095:
;1096:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $553
line 1097
;1097:		G_Printf( "%s", string + 7 );
ADDRGP4 $272
ARGP4
ADDRLP4 4+7
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1098
;1098:	}
LABELV $553
line 1100
;1099:
;1100:	if ( !level.logFile ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $557
line 1101
;1101:		return;
ADDRGP4 $548
JUMPV
LABELV $557
line 1104
;1102:	}
;1103:
;1104:	trap_FS_Write( string, strlen( string ), level.logFile );
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
line 1105
;1105:}
LABELV $548
endproc G_LogPrintf 1044 24
export LogExit
proc LogExit 24 20
line 1114
;1106:
;1107:/*
;1108:================
;1109:LogExit
;1110:
;1111:Append information about this game to the log file
;1112:================
;1113:*/
;1114:void LogExit( const char *string ) {
line 1120
;1115:	int				i, numSorted;
;1116:	gclient_t		*cl;
;1117:#ifdef MISSIONPACK // bk001205
;1118:	qboolean won = qtrue;
;1119:#endif
;1120:	G_LogPrintf( "Exit: %s\n", string );
ADDRGP4 $562
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1122
;1121:
;1122:	level.intermissionQueued = level.time;
ADDRGP4 level+9124
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1126
;1123:
;1124:	// this will keep the clients from playing any voice sounds
;1125:	// that will get cut off when the queued intermission starts
;1126:	trap_SetConfigstring( CS_INTERMISSION, "1" );
CNSTI4 22
ARGI4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1129
;1127:
;1128:	// don't send more than 32 scores (FIXME?)
;1129:	numSorted = level.numConnectedClients;
ADDRLP4 8
ADDRGP4 level+72
INDIRI4
ASGNI4
line 1130
;1130:	if ( numSorted > 32 ) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $566
line 1131
;1131:		numSorted = 32;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 1132
;1132:	}
LABELV $566
line 1134
;1133:
;1134:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $568
line 1135
;1135:		G_LogPrintf( "red:%i  blue:%i\n",
ADDRGP4 $571
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
line 1137
;1136:			level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE] );
;1137:	}
LABELV $568
line 1139
;1138:
;1139:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $576
line 1142
;1140:		int		ping;
;1141:
;1142:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 3340
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1144
;1143:
;1144:		if ( cl->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 3
NEI4 $581
line 1145
;1145:			continue;
ADDRGP4 $577
JUMPV
LABELV $581
line 1147
;1146:		}
;1147:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $583
line 1148
;1148:			continue;
ADDRGP4 $577
JUMPV
LABELV $583
line 1151
;1149:		}
;1150:
;1151:		ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $586
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $587
JUMPV
LABELV $586
ADDRLP4 16
CNSTI4 999
ASGNI4
LABELV $587
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1153
;1152:
;1153:		G_LogPrintf( "score: %i  ping: %i  client: %i %s\n", cl->ps.persistant[PERS_SCORE], ping, level.sortedClients[i],	cl->pers.netname );
ADDRGP4 $588
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
ADDRGP4 level+84
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
line 1162
;1154:#ifdef MISSIONPACK
;1155:		if (g_singlePlayer.integer && g_gametype.integer == GT_TOURNAMENT) {
;1156:			if (g_entities[cl - level.clients].r.svFlags & SVF_BOT && cl->ps.persistant[PERS_RANK] == 0) {
;1157:				won = qfalse;
;1158:			}
;1159:		}
;1160:#endif
;1161:
;1162:	}
LABELV $577
line 1139
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $579
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $576
line 1174
;1163:
;1164:#ifdef MISSIONPACK
;1165:	if (g_singlePlayer.integer) {
;1166:		if (g_gametype.integer >= GT_CTF) {
;1167:			won = level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE];
;1168:		}
;1169:		trap_SendConsoleCommand( EXEC_APPEND, (won) ? "spWin\n" : "spLose\n" );
;1170:	}
;1171:#endif
;1172:
;1173:
;1174:}
LABELV $561
endproc LogExit 24 20
export CheckIntermissionExit
proc CheckIntermissionExit 20 0
line 1187
;1175:
;1176:
;1177:/*
;1178:=================
;1179:CheckIntermissionExit
;1180:
;1181:The level will stay at the intermission for a minimum of 5 seconds
;1182:If all players wish to continue, the level will then exit.
;1183:If one or more players have not acknowledged the continue, the game will
;1184:wait 10 seconds before going on.
;1185:=================
;1186:*/
;1187:void CheckIntermissionExit( void ) {
line 1193
;1188:	int			ready, notReady;
;1189:	int			i;
;1190:	gclient_t	*cl;
;1191:	int			readyMask;
;1192:
;1193:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $591
line 1194
;1194:		return;
ADDRGP4 $590
JUMPV
LABELV $591
line 1198
;1195:	}
;1196:
;1197:	// see which players are ready
;1198:	ready = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1199
;1199:	notReady = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1200
;1200:	readyMask = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1201
;1201:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $594
line 1202
;1202:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3340
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1203
;1203:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $599
line 1204
;1204:			continue;
ADDRGP4 $595
JUMPV
LABELV $599
line 1206
;1205:		}
;1206:		if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
CNSTI4 808
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
EQI4 $601
line 1207
;1207:			continue;
ADDRGP4 $595
JUMPV
LABELV $601
line 1210
;1208:		}
;1209:
;1210:		if ( cl->readyToExit ) {
ADDRLP4 0
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $605
line 1211
;1211:			ready++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1212
;1212:			if ( i < 16 ) {
ADDRLP4 4
INDIRI4
CNSTI4 16
GEI4 $606
line 1213
;1213:				readyMask |= 1 << i;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1214
;1214:			}
line 1215
;1215:		} else {
ADDRGP4 $606
JUMPV
LABELV $605
line 1216
;1216:			notReady++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1217
;1217:		}
LABELV $606
line 1218
;1218:	}
LABELV $595
line 1201
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $597
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $594
line 1222
;1219:
;1220:	// copy the readyMask to each player's stats so
;1221:	// it can be displayed on the scoreboard
;1222:	for (i=0 ; i< g_maxclients.integer ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $612
JUMPV
LABELV $609
line 1223
;1223:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3340
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1224
;1224:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $614
line 1225
;1225:			continue;
ADDRGP4 $610
JUMPV
LABELV $614
line 1227
;1226:		}
;1227:		cl->ps.stats[STAT_CLIENTS_READY] = readyMask;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1228
;1228:	}
LABELV $610
line 1222
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $612
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $609
line 1231
;1229:
;1230:	// never exit in less than five seconds
;1231:	if ( level.time < level.intermissiontime + 5000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9128
INDIRI4
CNSTI4 5000
ADDI4
GEI4 $616
line 1232
;1232:		return;
ADDRGP4 $590
JUMPV
LABELV $616
line 1236
;1233:	}
;1234:
;1235:	// if nobody wants to go, clear timer
;1236:	if ( !ready ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $620
line 1237
;1237:		level.readyToExit = qfalse;
ADDRGP4 level+9136
CNSTI4 0
ASGNI4
line 1238
;1238:		return;
ADDRGP4 $590
JUMPV
LABELV $620
line 1242
;1239:	}
;1240:
;1241:	// if everyone wants to go, go now
;1242:	if ( !notReady ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $623
line 1243
;1243:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1244
;1244:		return;
ADDRGP4 $590
JUMPV
LABELV $623
line 1248
;1245:	}
;1246:
;1247:	// the first person to ready starts the ten second timeout
;1248:	if ( !level.readyToExit ) {
ADDRGP4 level+9136
INDIRI4
CNSTI4 0
NEI4 $625
line 1249
;1249:		level.readyToExit = qtrue;
ADDRGP4 level+9136
CNSTI4 1
ASGNI4
line 1250
;1250:		level.exitTime = level.time;
ADDRGP4 level+9140
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1251
;1251:	}
LABELV $625
line 1255
;1252:
;1253:	// if we have waited ten seconds since at least one player
;1254:	// wanted to exit, go ahead
;1255:	if ( level.time < level.exitTime + 10000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9140
INDIRI4
CNSTI4 10000
ADDI4
GEI4 $631
line 1256
;1256:		return;
ADDRGP4 $590
JUMPV
LABELV $631
line 1259
;1257:	}
;1258:
;1259:	ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1260
;1260:}
LABELV $590
endproc CheckIntermissionExit 20 0
export ScoreIsTied
proc ScoreIsTied 12 0
line 1267
;1261:
;1262:/*
;1263:=============
;1264:ScoreIsTied
;1265:=============
;1266:*/
;1267:qboolean ScoreIsTied( void ) {
line 1270
;1268:	int		a, b;
;1269:
;1270:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $636
line 1271
;1271:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $635
JUMPV
LABELV $636
line 1274
;1272:	}
;1273:	
;1274:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $639
line 1275
;1275:		return level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE];
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $647
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $648
JUMPV
LABELV $647
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $648
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $635
JUMPV
LABELV $639
line 1278
;1276:	}
;1277:
;1278:	a = level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE];
ADDRLP4 0
CNSTI4 3340
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1279
;1279:	b = level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE];
ADDRLP4 4
CNSTI4 3340
ADDRGP4 level+84+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1281
;1280:
;1281:	return a == b;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $653
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $654
JUMPV
LABELV $653
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $654
ADDRLP4 8
INDIRI4
RETI4
LABELV $635
endproc ScoreIsTied 12 0
export CheckExitRules
proc CheckExitRules 20 8
line 1293
;1282:}
;1283:
;1284:/*
;1285:=================
;1286:CheckExitRules
;1287:
;1288:There will be a delay between the time the exit is qualified for
;1289:and the time everyone is moved to the intermission spot, so you
;1290:can see the last frag.
;1291:=================
;1292:*/
;1293:void CheckExitRules( void ) {
line 1298
;1294: 	int			i;
;1295:	gclient_t	*cl;
;1296:	// if at the intermission, wait for all non-bots to
;1297:	// signal ready, then go to next level
;1298:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $656
line 1299
;1299:		CheckIntermissionExit ();
ADDRGP4 CheckIntermissionExit
CALLV
pop
line 1300
;1300:		return;
ADDRGP4 $655
JUMPV
LABELV $656
line 1303
;1301:	}
;1302:
;1303:	if ( level.intermissionQueued ) {
ADDRGP4 level+9124
INDIRI4
CNSTI4 0
EQI4 $659
line 1311
;1304:#ifdef MISSIONPACK
;1305:		int time = (g_singlePlayer.integer) ? SP_INTERMISSION_DELAY_TIME : INTERMISSION_DELAY_TIME;
;1306:		if ( level.time - level.intermissionQueued >= time ) {
;1307:			level.intermissionQueued = 0;
;1308:			BeginIntermission();
;1309:		}
;1310:#else
;1311:		if ( level.time - level.intermissionQueued >= INTERMISSION_DELAY_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9124
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $655
line 1312
;1312:			level.intermissionQueued = 0;
ADDRGP4 level+9124
CNSTI4 0
ASGNI4
line 1313
;1313:			BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 1314
;1314:		}
line 1316
;1315:#endif
;1316:		return;
ADDRGP4 $655
JUMPV
LABELV $659
line 1320
;1317:	}
;1318:
;1319:	// check for sudden death
;1320:	if ( ScoreIsTied() ) {
ADDRLP4 8
ADDRGP4 ScoreIsTied
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $667
line 1322
;1321:		// always wait for sudden death
;1322:		return;
ADDRGP4 $655
JUMPV
LABELV $667
line 1325
;1323:	}
;1324:
;1325:	if ( g_timelimit.integer && !level.warmupTime ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_timelimit+12
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $669
ADDRGP4 level+16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $669
line 1326
;1326:		if ( level.time - level.startTime >= g_timelimit.integer*60000 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 60000
ADDRGP4 g_timelimit+12
INDIRI4
MULI4
LTI4 $673
line 1327
;1327:			trap_SendServerCommand( -1, "print \"Timelimit hit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $678
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1328
;1328:			LogExit( "Timelimit hit." );
ADDRGP4 $679
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1329
;1329:			return;
ADDRGP4 $655
JUMPV
LABELV $673
line 1331
;1330:		}
;1331:	}
LABELV $669
line 1333
;1332:
;1333:	if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $680
line 1334
;1334:		return;
ADDRGP4 $655
JUMPV
LABELV $680
line 1337
;1335:	}
;1336:
;1337:	if ( g_gametype.integer < GT_CTF && g_fraglimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
GEI4 $683
ADDRGP4 g_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $683
line 1338
;1338:		if ( level.teamScores[TEAM_RED] >= g_fraglimit.integer ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $687
line 1339
;1339:			trap_SendServerCommand( -1, "print \"Red hit the fraglimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $692
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1340
;1340:			LogExit( "Fraglimit hit." );
ADDRGP4 $693
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1341
;1341:			return;
ADDRGP4 $655
JUMPV
LABELV $687
line 1344
;1342:		}
;1343:
;1344:		if ( level.teamScores[TEAM_BLUE] >= g_fraglimit.integer ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $694
line 1345
;1345:			trap_SendServerCommand( -1, "print \"Blue hit the fraglimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $699
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1346
;1346:			LogExit( "Fraglimit hit." );
ADDRGP4 $693
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1347
;1347:			return;
ADDRGP4 $655
JUMPV
LABELV $694
line 1350
;1348:		}
;1349:
;1350:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $700
line 1351
;1351:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 3340
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1352
;1352:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $705
line 1353
;1353:				continue;
ADDRGP4 $701
JUMPV
LABELV $705
line 1355
;1354:			}
;1355:			if ( cl->sess.sessionTeam != TEAM_FREE ) {
ADDRLP4 0
INDIRP4
CNSTI4 2444
ADDP4
INDIRI4
CNSTI4 0
EQI4 $707
line 1356
;1356:				continue;
ADDRGP4 $701
JUMPV
LABELV $707
line 1359
;1357:			}
;1358:
;1359:			if ( cl->ps.persistant[PERS_SCORE] >= g_fraglimit.integer ) {
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $709
line 1360
;1360:				LogExit( "Fraglimit hit." );
ADDRGP4 $693
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1361
;1361:				trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " hit the fraglimit.\n\"",
ADDRGP4 $712
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
line 1363
;1362:					cl->pers.netname ) );
;1363:				return;
ADDRGP4 $655
JUMPV
LABELV $709
line 1365
;1364:			}
;1365:		}
LABELV $701
line 1350
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $703
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $700
line 1366
;1366:	}
LABELV $683
line 1368
;1367:
;1368:	if ( g_gametype.integer >= GT_CTF && g_capturelimit.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $713
ADDRGP4 g_capturelimit+12
INDIRI4
CNSTI4 0
EQI4 $713
line 1370
;1369:
;1370:		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $717
line 1371
;1371:			trap_SendServerCommand( -1, "print \"Red hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $722
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1372
;1372:			LogExit( "Capturelimit hit." );
ADDRGP4 $723
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1373
;1373:			return;
ADDRGP4 $655
JUMPV
LABELV $717
line 1376
;1374:		}
;1375:
;1376:		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $724
line 1377
;1377:			trap_SendServerCommand( -1, "print \"Blue hit the capturelimit.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $729
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1378
;1378:			LogExit( "Capturelimit hit." );
ADDRGP4 $723
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1379
;1379:			return;
LABELV $724
line 1381
;1380:		}
;1381:	}
LABELV $713
line 1382
;1382:}
LABELV $655
endproc CheckExitRules 20 8
export CheckTournament
proc CheckTournament 32 8
line 1402
;1383:
;1384:
;1385:
;1386:/*
;1387:========================================================================
;1388:
;1389:FUNCTIONS CALLED EVERY FRAME
;1390:
;1391:========================================================================
;1392:*/
;1393:
;1394:
;1395:/*
;1396:=============
;1397:CheckTournament
;1398:
;1399:Once a frame, check for changes in tournement player state
;1400:=============
;1401:*/
;1402:void CheckTournament( void ) {
line 1405
;1403:	// check because we run 3 game frames before calling Connect and/or ClientBegin
;1404:	// for clients on a map_restart
;1405:	if ( level.numPlayingClients == 0 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 0
NEI4 $731
line 1406
;1406:		return;
ADDRGP4 $730
JUMPV
LABELV $731
line 1409
;1407:	}
;1408:
;1409:	if ( g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $734
line 1412
;1410:
;1411:		// pull in a spectator if needed
;1412:		if ( level.numPlayingClients < 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $737
line 1413
;1413:			AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1414
;1414:		}
LABELV $737
line 1417
;1415:
;1416:		// if we don't have two players, go back to "waiting for players"
;1417:		if ( level.numPlayingClients != 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
EQI4 $740
line 1418
;1418:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $730
line 1419
;1419:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1420
;1420:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $443
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
line 1421
;1421:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $748
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1422
;1422:			}
line 1423
;1423:			return;
ADDRGP4 $730
JUMPV
LABELV $740
line 1426
;1424:		}
;1425:
;1426:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $749
line 1427
;1427:			return;
ADDRGP4 $730
JUMPV
LABELV $749
line 1431
;1428:		}
;1429:
;1430:		// if the warmup is changed at the console, restart it
;1431:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+352
INDIRI4
EQI4 $752
line 1432
;1432:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+352
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1433
;1433:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1434
;1434:		}
LABELV $752
line 1437
;1435:
;1436:		// if all players have arrived, start the countdown
;1437:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $759
line 1438
;1438:			if ( level.numPlayingClients == 2 ) {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
NEI4 $730
line 1440
;1439:				// fudge by -1 to account for extra delays
;1440:				level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
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
line 1441
;1441:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $443
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
line 1442
;1442:			}
line 1443
;1443:			return;
ADDRGP4 $730
JUMPV
LABELV $759
line 1447
;1444:		}
;1445:
;1446:		// if the warmup time has counted down, restart
;1447:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $735
line 1448
;1448:			level.warmupTime += 10000;
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
line 1449
;1449:			trap_Cvar_Set( "g_restarted", "1" );
ADDRGP4 $60
ARGP4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1450
;1450:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $523
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1451
;1451:			level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 1452
;1452:			return;
ADDRGP4 $730
JUMPV
line 1454
;1453:		}
;1454:	} else if ( g_gametype.integer != GT_SINGLE_PLAYER && level.warmupTime != 0 ) {
LABELV $734
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $775
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $775
line 1456
;1455:		int		counts[TEAM_NUM_TEAMS];
;1456:		qboolean	notEnough = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1458
;1457:
;1458:		if ( g_gametype.integer > GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LEI4 $779
line 1459
;1459:			counts[TEAM_BLUE] = TeamCount( -1, TEAM_BLUE );
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
line 1460
;1460:			counts[TEAM_RED] = TeamCount( -1, TEAM_RED );
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
line 1462
;1461:
;1462:			if (counts[TEAM_RED] < 1 || counts[TEAM_BLUE] < 1) {
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 4+4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $788
ADDRLP4 4+8
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $780
LABELV $788
line 1463
;1463:				notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1464
;1464:			}
line 1465
;1465:		} else if ( level.numPlayingClients < 2 ) {
ADDRGP4 $780
JUMPV
LABELV $779
ADDRGP4 level+80
INDIRI4
CNSTI4 2
GEI4 $789
line 1466
;1466:			notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1467
;1467:		}
LABELV $789
LABELV $780
line 1469
;1468:
;1469:		if ( notEnough ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $792
line 1470
;1470:			if ( level.warmupTime != -1 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $730
line 1471
;1471:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1472
;1472:				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $443
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
line 1473
;1473:				G_LogPrintf( "Warmup:\n" );
ADDRGP4 $748
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1474
;1474:			}
line 1475
;1475:			return; // still waiting for team members
ADDRGP4 $730
JUMPV
LABELV $792
line 1478
;1476:		}
;1477:
;1478:		if ( level.warmupTime == 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $799
line 1479
;1479:			return;
ADDRGP4 $730
JUMPV
LABELV $799
line 1483
;1480:		}
;1481:
;1482:		// if the warmup is changed at the console, restart it
;1483:		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+352
INDIRI4
EQI4 $802
line 1484
;1484:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+352
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1485
;1485:			level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1486
;1486:		}
LABELV $802
line 1489
;1487:
;1488:		// if all players have arrived, start the countdown
;1489:		if ( level.warmupTime < 0 ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $809
line 1491
;1490:			// fudge by -1 to account for extra delays
;1491:			level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
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
line 1492
;1492:			trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $443
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
line 1493
;1493:			return;
ADDRGP4 $730
JUMPV
LABELV $809
line 1497
;1494:		}
;1495:
;1496:		// if the warmup time has counted down, restart
;1497:		if ( level.time > level.warmupTime ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $816
line 1498
;1498:			level.warmupTime += 10000;
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
line 1499
;1499:			trap_Cvar_Set( "g_restarted", "1" );
ADDRGP4 $60
ARGP4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1500
;1500:			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $523
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1501
;1501:			level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 1502
;1502:			return;
LABELV $816
line 1504
;1503:		}
;1504:	}
LABELV $775
LABELV $735
line 1505
;1505:}
LABELV $730
endproc CheckTournament 32 8
export CheckVote
proc CheckVote 4 8
line 1513
;1506:
;1507:
;1508:/*
;1509:==================
;1510:CheckVote
;1511:==================
;1512:*/
;1513:void CheckVote( void ) {
line 1514
;1514:	if ( level.voteExecuteTime && level.voteExecuteTime < level.time ) {
ADDRGP4 level+2408
INDIRI4
CNSTI4 0
EQI4 $823
ADDRGP4 level+2408
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $823
line 1515
;1515:		level.voteExecuteTime = 0;
ADDRGP4 level+2408
CNSTI4 0
ASGNI4
line 1516
;1516:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $829
ARGP4
ADDRGP4 level+356
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
line 1517
;1517:	}
LABELV $823
line 1518
;1518:	if ( !level.voteTime ) {
ADDRGP4 level+2404
INDIRI4
CNSTI4 0
NEI4 $831
line 1519
;1519:		return;
ADDRGP4 $822
JUMPV
LABELV $831
line 1521
;1520:	}
;1521:	if ( level.time - level.voteTime >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+2404
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $834
line 1522
;1522:		trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $838
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1523
;1523:	} else {
ADDRGP4 $835
JUMPV
LABELV $834
line 1524
;1524:		if ( level.voteYes > level.numVotingClients/2 ) {
ADDRGP4 level+2412
INDIRI4
ADDRGP4 level+2420
INDIRI4
CNSTI4 2
DIVI4
LEI4 $839
line 1526
;1525:			// execute the command, then remove the vote
;1526:			trap_SendServerCommand( -1, "print \"Vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $843
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1527
;1527:			level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+2408
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1528
;1528:		} else if ( level.voteNo >= level.numVotingClients/2 ) {
ADDRGP4 $840
JUMPV
LABELV $839
ADDRGP4 level+2416
INDIRI4
ADDRGP4 level+2420
INDIRI4
CNSTI4 2
DIVI4
LTI4 $822
line 1530
;1529:			// same behavior as a timeout
;1530:			trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $838
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1531
;1531:		} else {
line 1533
;1532:			// still waiting for a majority
;1533:			return;
LABELV $847
LABELV $840
line 1535
;1534:		}
;1535:	}
LABELV $835
line 1536
;1536:	level.voteTime = 0;
ADDRGP4 level+2404
CNSTI4 0
ASGNI4
line 1537
;1537:	trap_SetConfigstring( CS_VOTE_TIME, "" );
CNSTI4 8
ARGI4
ADDRGP4 $55
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1539
;1538:
;1539:}
LABELV $822
endproc CheckVote 4 8
export PrintTeam
proc PrintTeam 4 8
line 1546
;1540:
;1541:/*
;1542:==================
;1543:PrintTeam
;1544:==================
;1545:*/
;1546:void PrintTeam(int team, char *message) {
line 1549
;1547:	int i;
;1548:
;1549:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $855
JUMPV
LABELV $852
line 1550
;1550:		if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $857
line 1551
;1551:			continue;
ADDRGP4 $853
JUMPV
LABELV $857
line 1552
;1552:		trap_SendServerCommand( i, message );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1553
;1553:	}
LABELV $853
line 1549
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $855
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $852
line 1554
;1554:}
LABELV $851
endproc PrintTeam 4 8
export SetLeader
proc SetLeader 8 8
line 1561
;1555:
;1556:/*
;1557:==================
;1558:SetLeader
;1559:==================
;1560:*/
;1561:void SetLeader(int team, int client) {
line 1564
;1562:	int i;
;1563:
;1564:	if ( level.clients[client].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3340
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
NEI4 $860
line 1565
;1565:		PrintTeam(team, va("print \"%s is not connected\n\"", level.clients[client].pers.netname) );
ADDRGP4 $862
ARGP4
CNSTI4 3340
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
line 1566
;1566:		return;
ADDRGP4 $859
JUMPV
LABELV $860
line 1568
;1567:	}
;1568:	if (level.clients[client].sess.sessionTeam != team) {
CNSTI4 3340
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $863
line 1569
;1569:		PrintTeam(team, va("print \"%s is not on the team anymore\n\"", level.clients[client].pers.netname) );
ADDRGP4 $865
ARGP4
CNSTI4 3340
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
line 1570
;1570:		return;
ADDRGP4 $859
JUMPV
LABELV $863
line 1572
;1571:	}
;1572:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $869
JUMPV
LABELV $866
line 1573
;1573:		if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $871
line 1574
;1574:			continue;
ADDRGP4 $867
JUMPV
LABELV $871
line 1575
;1575:		if (level.clients[i].sess.teamLeader) {
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $873
line 1576
;1576:			level.clients[i].sess.teamLeader = qfalse;
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
line 1577
;1577:			ClientUserinfoChanged(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1578
;1578:		}
LABELV $873
line 1579
;1579:	}
LABELV $867
line 1572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $869
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $866
line 1580
;1580:	level.clients[client].sess.teamLeader = qtrue;
CNSTI4 3340
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
CNSTI4 1
ASGNI4
line 1581
;1581:	ClientUserinfoChanged( client );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1582
;1582:	PrintTeam(team, va("print \"%s is the new team leader\n\"", level.clients[client].pers.netname) );
ADDRGP4 $875
ARGP4
CNSTI4 3340
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
line 1583
;1583:}
LABELV $859
endproc SetLeader 8 8
export CheckTeamLeader
proc CheckTeamLeader 4 0
line 1590
;1584:
;1585:/*
;1586:==================
;1587:CheckTeamLeader
;1588:==================
;1589:*/
;1590:void CheckTeamLeader( int team ) {
line 1593
;1591:	int i;
;1592:
;1593:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $880
JUMPV
LABELV $877
line 1594
;1594:		if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $882
line 1595
;1595:			continue;
ADDRGP4 $878
JUMPV
LABELV $882
line 1596
;1596:		if (level.clients[i].sess.teamLeader)
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $884
line 1597
;1597:			break;
ADDRGP4 $879
JUMPV
LABELV $884
line 1598
;1598:	}
LABELV $878
line 1593
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $880
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $877
LABELV $879
line 1599
;1599:	if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $886
line 1600
;1600:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $892
JUMPV
LABELV $889
line 1601
;1601:			if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $894
line 1602
;1602:				continue;
ADDRGP4 $890
JUMPV
LABELV $894
line 1603
;1603:			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $896
line 1604
;1604:				level.clients[i].sess.teamLeader = qtrue;
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
CNSTI4 1
ASGNI4
line 1605
;1605:				break;
ADDRGP4 $891
JUMPV
LABELV $896
line 1607
;1606:			}
;1607:		}
LABELV $890
line 1600
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $892
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $889
LABELV $891
line 1608
;1608:		for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $903
JUMPV
LABELV $900
line 1609
;1609:			if (level.clients[i].sess.sessionTeam != team)
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2444
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $905
line 1610
;1610:				continue;
ADDRGP4 $901
JUMPV
LABELV $905
line 1611
;1611:			level.clients[i].sess.teamLeader = qtrue;
CNSTI4 3340
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2468
ADDP4
CNSTI4 1
ASGNI4
line 1612
;1612:			break;
ADDRGP4 $902
JUMPV
LABELV $901
line 1608
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $903
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $900
LABELV $902
line 1614
;1613:		}
;1614:	}
LABELV $886
line 1615
;1615:}
LABELV $876
endproc CheckTeamLeader 4 0
export CheckTeamVote
proc CheckTeamVote 20 12
line 1622
;1616:
;1617:/*
;1618:==================
;1619:CheckTeamVote
;1620:==================
;1621:*/
;1622:void CheckTeamVote( int team ) {
line 1625
;1623:	int cs_offset;
;1624:
;1625:	if ( team == TEAM_RED )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $908
line 1626
;1626:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $909
JUMPV
LABELV $908
line 1627
;1627:	else if ( team == TEAM_BLUE )
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $907
line 1628
;1628:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1630
;1629:	else
;1630:		return;
LABELV $911
LABELV $909
line 1632
;1631:
;1632:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $912
line 1633
;1633:		return;
ADDRGP4 $907
JUMPV
LABELV $912
line 1635
;1634:	}
;1635:	if ( level.time - level.teamVoteTime[cs_offset] >= VOTE_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4472
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $915
line 1636
;1636:		trap_SendServerCommand( -1, "print \"Team vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $919
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1637
;1637:	} else {
ADDRGP4 $916
JUMPV
LABELV $915
line 1638
;1638:		if ( level.teamVoteYes[cs_offset] > level.numteamVotingClients[cs_offset]/2 ) {
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
ADDRGP4 level+4480
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 level+4496
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
LEI4 $920
line 1640
;1639:			// execute the command, then remove the vote
;1640:			trap_SendServerCommand( -1, "print \"Team vote passed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $924
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1642
;1641:			//
;1642:			if ( !Q_strncmp( "leader", level.teamVoteString[cs_offset], 6) ) {
ADDRGP4 $927
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2424
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
NEI4 $925
line 1644
;1643:				//set the team leader
;1644:				SetLeader(team, atoi(level.teamVoteString[cs_offset] + 7));
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2424+7
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
line 1645
;1645:			}
ADDRGP4 $921
JUMPV
LABELV $925
line 1646
;1646:			else {
line 1647
;1647:				trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.teamVoteString[cs_offset] ) );
ADDRGP4 $829
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2424
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
line 1648
;1648:			}
line 1649
;1649:		} else if ( level.teamVoteNo[cs_offset] >= level.numteamVotingClients[cs_offset]/2 ) {
ADDRGP4 $921
JUMPV
LABELV $920
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
ADDRGP4 level+4488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 level+4496
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
LTI4 $907
line 1651
;1650:			// same behavior as a timeout
;1651:			trap_SendServerCommand( -1, "print \"Team vote failed.\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $919
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1652
;1652:		} else {
line 1654
;1653:			// still waiting for a majority
;1654:			return;
LABELV $933
LABELV $921
line 1656
;1655:		}
;1656:	}
LABELV $916
line 1657
;1657:	level.teamVoteTime[cs_offset] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4472
ADDP4
CNSTI4 0
ASGNI4
line 1658
;1658:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, "" );
ADDRLP4 0
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRGP4 $55
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1660
;1659:
;1660:}
LABELV $907
endproc CheckTeamVote 20 12
data
align 4
LABELV $938
byte 4 -1
export CheckCvars
code
proc CheckCvars 4 8
line 1668
;1661:
;1662:
;1663:/*
;1664:==================
;1665:CheckCvars
;1666:==================
;1667:*/
;1668:void CheckCvars( void ) {
line 1671
;1669:	static int lastMod = -1;
;1670:
;1671:	if ( g_password.modificationCount != lastMod ) {
ADDRGP4 g_password+4
INDIRI4
ADDRGP4 $938
INDIRI4
EQI4 $939
line 1672
;1672:		lastMod = g_password.modificationCount;
ADDRGP4 $938
ADDRGP4 g_password+4
INDIRI4
ASGNI4
line 1673
;1673:		if ( *g_password.string && Q_stricmp( g_password.string, "none" ) ) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $943
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $947
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $943
line 1674
;1674:			trap_Cvar_Set( "g_needpass", "1" );
ADDRGP4 $85
ARGP4
ADDRGP4 $84
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1675
;1675:		} else {
ADDRGP4 $944
JUMPV
LABELV $943
line 1676
;1676:			trap_Cvar_Set( "g_needpass", "0" );
ADDRGP4 $85
ARGP4
ADDRGP4 $61
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1677
;1677:		}
LABELV $944
line 1678
;1678:	}
LABELV $939
line 1679
;1679:}
LABELV $937
endproc CheckCvars 4 8
export G_RunThink
proc G_RunThink 8 4
line 1688
;1680:
;1681:/*
;1682:=============
;1683:G_RunThink
;1684:
;1685:Runs thinking code for this frame if necessary
;1686:=============
;1687:*/
;1688:void G_RunThink (gentity_t *ent) {
line 1691
;1689:	float	thinktime;
;1690:
;1691:	thinktime = ent->nextthink;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1692
;1692:	if (thinktime <= 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $949
line 1693
;1693:		return;
ADDRGP4 $948
JUMPV
LABELV $949
line 1695
;1694:	}
;1695:	if (thinktime > level.time) {
ADDRLP4 0
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $951
line 1696
;1696:		return;
ADDRGP4 $948
JUMPV
LABELV $951
line 1699
;1697:	}
;1698:	
;1699:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 1700
;1700:	if (!ent->think) {
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $954
line 1701
;1701:		G_Error ( "NULL ent->think");
ADDRGP4 $956
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1702
;1702:	}
LABELV $954
line 1703
;1703:	ent->think (ent);
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
line 1704
;1704:}
LABELV $948
endproc G_RunThink 8 4
export G_RunFrame
proc G_RunFrame 44 12
line 1713
;1705:
;1706:/*
;1707:================
;1708:G_RunFrame
;1709:
;1710:Advances the non-player objects in the world
;1711:================
;1712:*/
;1713:void G_RunFrame( int levelTime ) {
line 1720
;1714:	int			i;
;1715:	gentity_t	*ent;
;1716:	int			msec;
;1717:int start, end;
;1718:
;1719:	// if we are waiting for the level to restart, do nothing
;1720:	if ( level.restarted ) {
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $958
line 1721
;1721:		return;
ADDRGP4 $957
JUMPV
LABELV $958
line 1724
;1722:	}
;1723:
;1724:	level.framenum++;
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
line 1725
;1725:	level.previousTime = level.time;
ADDRGP4 level+36
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1726
;1726:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 1727
;1727:	msec = level.time - level.previousTime;
ADDRLP4 16
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 1730
;1728:
;1729:	// get any cvar changes
;1730:	G_UpdateCvars();
ADDRGP4 G_UpdateCvars
CALLV
pop
line 1735
;1731:
;1732:	//
;1733:	// go through all allocated objects
;1734:	//
;1735:	start = trap_Milliseconds();
ADDRLP4 24
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1736
;1736:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1737
;1737:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $970
JUMPV
LABELV $967
line 1738
;1738:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $972
line 1739
;1739:			continue;
ADDRGP4 $968
JUMPV
LABELV $972
line 1743
;1740:		}
;1741:
;1742:		// clear events that are too old
;1743:		if ( level.time - ent->eventTime > EVENT_VALID_MSEC ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $974
line 1744
;1744:			if ( ent->s.event ) {
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $977
line 1745
;1745:				ent->s.event = 0;	// &= EV_EVENT_BITS;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 1746
;1746:				if ( ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $979
line 1747
;1747:					ent->client->ps.externalEvent = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 1751
;1748:					// predicted events should never be set to zero
;1749:					//ent->client->ps.events[0] = 0;
;1750:					//ent->client->ps.events[1] = 0;
;1751:				}
LABELV $979
line 1752
;1752:			}
LABELV $977
line 1753
;1753:			if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $981
line 1755
;1754:				// tempEntities or dropped items completely go away after their event
;1755:				G_FreeEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1756
;1756:				continue;
ADDRGP4 $968
JUMPV
LABELV $981
line 1757
;1757:			} else if ( ent->unlinkAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $983
line 1759
;1758:				// items that will respawn will hide themselves after their pickup event
;1759:				ent->unlinkAfterEvent = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1760
;1760:				trap_UnlinkEntity( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1761
;1761:			}
LABELV $983
line 1762
;1762:		}
LABELV $974
line 1765
;1763:
;1764:		// temporary entities don't think
;1765:		if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $985
line 1766
;1766:			continue;
ADDRGP4 $968
JUMPV
LABELV $985
line 1769
;1767:		}
;1768:
;1769:		if ( !ent->r.linked && ent->neverFree ) {
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
NEI4 $987
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $987
line 1770
;1770:			continue;
ADDRGP4 $968
JUMPV
LABELV $987
line 1783
;1771:		}
;1772:
;1773://unlagged - backward reconciliation #2
;1774:		// we'll run missiles separately to save CPU in backward reconciliation
;1775:/*
;1776:		if ( ent->s.eType == ET_MISSILE ) {
;1777:			G_RunMissile( ent );
;1778:			continue;
;1779:		}
;1780:*/
;1781://unlagged - backward reconciliation #2
;1782:
;1783:		if ( ent->s.eType == ET_ITEM || ent->physicsObject ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $991
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $989
LABELV $991
line 1784
;1784:			G_RunItem( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunItem
CALLV
pop
line 1785
;1785:			continue;
ADDRGP4 $968
JUMPV
LABELV $989
line 1788
;1786:		}
;1787:
;1788:		if ( ent->s.eType == ET_MOVER ) {
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
NEI4 $992
line 1789
;1789:			G_RunMover( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMover
CALLV
pop
line 1790
;1790:			continue;
ADDRGP4 $968
JUMPV
LABELV $992
line 1793
;1791:		}
;1792:
;1793:		if ( i < MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $994
line 1794
;1794:			G_RunClient( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunClient
CALLV
pop
line 1795
;1795:			continue;
ADDRGP4 $968
JUMPV
LABELV $994
line 1798
;1796:		}
;1797:
;1798:		G_RunThink( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1799
;1799:	}
LABELV $968
line 1737
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $970
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $967
line 1805
;1800:
;1801://unlagged - backward reconciliation #2
;1802:	// NOW run the missiles, with all players backward-reconciled
;1803:	// to the positions they were in exactly 50ms ago, at the end
;1804:	// of the last server frame
;1805:	G_TimeShiftAllClients( level.previousTime, NULL );
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 1807
;1806:
;1807:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1808
;1808:	for (i=0 ; i<level.num_entities ; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1000
JUMPV
LABELV $997
line 1809
;1809:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1002
line 1810
;1810:			continue;
ADDRGP4 $998
JUMPV
LABELV $1002
line 1814
;1811:		}
;1812:
;1813:		// temporary entities don't think
;1814:		if ( ent->freeAfterEvent ) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1004
line 1815
;1815:			continue;
ADDRGP4 $998
JUMPV
LABELV $1004
line 1818
;1816:		}
;1817:
;1818:		if ( ent->s.eType == ET_MISSILE ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1006
line 1819
;1819:			G_RunMissile( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
line 1820
;1820:		}
LABELV $1006
line 1821
;1821:	}
LABELV $998
line 1808
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $1000
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $997
line 1823
;1822:
;1823:	G_UnTimeShiftAllClients( NULL );
CNSTP4 0
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 1826
;1824://unlagged - backward reconciliation #2
;1825:
;1826:end = trap_Milliseconds();
ADDRLP4 28
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1828
;1827:
;1828:start = trap_Milliseconds();
ADDRLP4 32
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 1830
;1829:	// perform final fixups on the players
;1830:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 1831
;1831:	for (i=0 ; i < level.maxclients ; i++, ent++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1011
JUMPV
LABELV $1008
line 1832
;1832:		if ( ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1013
line 1833
;1833:			ClientEndFrame( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1834
;1834:		}
LABELV $1013
line 1835
;1835:	}
LABELV $1009
line 1831
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $1011
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1008
line 1836
;1836:end = trap_Milliseconds();
ADDRLP4 36
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1839
;1837:
;1838:	// see if it is time to do a tournement restart
;1839:	CheckTournament();
ADDRGP4 CheckTournament
CALLV
pop
line 1842
;1840:
;1841:	// see if it is time to end the level
;1842:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 1845
;1843:
;1844:	// update to team status?
;1845:	CheckTeamStatus();
ADDRGP4 CheckTeamStatus
CALLV
pop
line 1848
;1846:
;1847:	// cancel vote if timed out
;1848:	CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 1851
;1849:
;1850:	// check team votes
;1851:	CheckTeamVote( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 1852
;1852:	CheckTeamVote( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 1855
;1853:
;1854:	// for tracking changes
;1855:	CheckCvars();
ADDRGP4 CheckCvars
CALLV
pop
line 1857
;1856:
;1857:	if (g_listEntity.integer) {
ADDRGP4 g_listEntity+12
INDIRI4
CNSTI4 0
EQI4 $1015
line 1858
;1858:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1018
line 1859
;1859:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $1022
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 808
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
line 1860
;1860:		}
LABELV $1019
line 1858
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1018
line 1861
;1861:		trap_Cvar_Set("g_listEntity", "0");
ADDRGP4 $111
ARGP4
ADDRGP4 $61
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1862
;1862:	}
LABELV $1015
line 1868
;1863:
;1864://unlagged - backward reconciliation #4
;1865:	// record the time at the end of this frame - it should be about
;1866:	// the time the next frame begins - when the server starts
;1867:	// accepting commands from connected clients
;1868:	level.frameStartTime = trap_Milliseconds();
ADDRLP4 40
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 level+9212
ADDRLP4 40
INDIRI4
ASGNI4
line 1870
;1869://unlagged - backward reconciliation #4
;1870:}
LABELV $957
endproc G_RunFrame 44 12
bss
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
skip 213760
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
skip 827392
export level
align 4
LABELV level
skip 9216
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
LABELV $1022
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
LABELV $956
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
LABELV $947
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $927
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $924
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
LABELV $919
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
LABELV $875
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
LABELV $862
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
LABELV $843
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
LABELV $838
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
LABELV $829
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $748
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
LABELV $729
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
LABELV $723
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
LABELV $722
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
LABELV $712
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
LABELV $699
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
LABELV $693
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
LABELV $692
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
LABELV $679
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
LABELV $678
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
LABELV $588
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
LABELV $571
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
LABELV $562
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
LABELV $550
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
LABELV $527
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
LABELV $523
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
LABELV $476
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
LABELV $443
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $309
byte 1 115
byte 1 0
align 1
LABELV $300
byte 1 102
byte 1 0
align 1
LABELV $272
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $266
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
LABELV $262
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
LABELV $260
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
LABELV $257
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
LABELV $256
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
LABELV $255
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
LABELV $253
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
LABELV $249
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
LABELV $233
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
LABELV $232
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
LABELV $231
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
LABELV $229
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
LABELV $214
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
LABELV $210
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
LABELV $209
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
LABELV $208
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
LABELV $202
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
LABELV $187
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
LABELV $169
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
LABELV $122
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
LABELV $121
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
LABELV $120
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $119
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
LABELV $118
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
LABELV $117
byte 1 50
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $116
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
LABELV $115
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
LABELV $114
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
LABELV $113
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
LABELV $112
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
LABELV $111
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
LABELV $110
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
LABELV $109
byte 1 55
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
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $107
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $106
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
LABELV $105
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
LABELV $104
byte 1 103
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
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
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 0
align 1
LABELV $102
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
LABELV $101
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
LABELV $100
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
LABELV $99
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
LABELV $98
byte 1 51
byte 1 48
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
LABELV $96
byte 1 53
byte 1 0
align 1
LABELV $95
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
LABELV $94
byte 1 51
byte 1 0
align 1
LABELV $93
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
LABELV $92
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $91
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
LABELV $90
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $89
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
LABELV $88
byte 1 51
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $86
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
LABELV $85
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
LABELV $84
byte 1 49
byte 1 0
align 1
LABELV $83
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
LABELV $82
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
LABELV $81
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
LABELV $80
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
LABELV $79
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
LABELV $78
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $77
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
LABELV $76
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
LABELV $75
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
LABELV $74
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
LABELV $73
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
LABELV $72
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
LABELV $71
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
LABELV $70
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
LABELV $69
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $68
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
LABELV $67
byte 1 100
byte 1 109
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $66
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
LABELV $65
byte 1 56
byte 1 0
align 1
LABELV $64
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
LABELV $63
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
LABELV $62
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
LABELV $61
byte 1 48
byte 1 0
align 1
LABELV $60
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
LABELV $59
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 50
byte 1 49
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 54
byte 1 0
align 1
LABELV $58
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
LABELV $57
byte 1 116
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
LABELV $56
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
LABELV $55
byte 1 0
align 1
LABELV $54
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
