data
export forceModelModificationCount
align 4
LABELV forceModelModificationCount
byte 4 -1
export vmMain
code
proc vmMain 16 12
file "../cg_main.c"
line 26
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_main.c -- initialization and primary entry point for cgame
;4:#include "cg_local.h"
;5:
;6:#ifdef MISSIONPACK
;7:#include "../ui/ui_shared.h"
;8:// display context for new ui stuff
;9:displayContextDef_t cgDC;
;10:#endif
;11:
;12:int forceModelModificationCount = -1;
;13:
;14:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum );
;15:void CG_Shutdown( void );
;16:
;17:
;18:/*
;19:================
;20:vmMain
;21:
;22:This is the only way control passes into the module.
;23:This must be the very first function compiled into the .q3vm file
;24:================
;25:*/
;26:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 28
;27:
;28:	switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $85
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $85
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
code
LABELV $75
line 30
;29:	case CG_INIT:
;30:		CG_Init( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 31
;31:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $76
line 33
;32:	case CG_SHUTDOWN:
;33:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 34
;34:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $77
line 36
;35:	case CG_CONSOLE_COMMAND:
;36:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $78
line 38
;37:	case CG_DRAW_ACTIVE_FRAME:
;38:		CG_DrawActiveFrame( arg0, arg1, arg2 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 39
;39:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $79
line 41
;40:	case CG_CROSSHAIR_PLAYER:
;41:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $80
line 43
;42:	case CG_LAST_ATTACKER:
;43:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $81
line 45
;44:	case CG_KEY_EVENT:
;45:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 46
;46:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $82
line 52
;47:	case CG_MOUSE_EVENT:
;48:#ifdef MISSIONPACK
;49:		cgDC.cursorx = cgs.cursorX;
;50:		cgDC.cursory = cgs.cursorY;
;51:#endif
;52:		CG_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 53
;53:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $83
line 55
;54:	case CG_EVENT_HANDLING:
;55:		CG_EventHandling(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 56
;56:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $73
line 58
;57:	default:
;58:		CG_Error( "vmMain: unknown command %i", command );
ADDRGP4 $84
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 59
;59:		break;
LABELV $74
line 61
;60:	}
;61:	return -1;
CNSTI4 -1
RETI4
LABELV $72
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address cg_ignore
address $87
address $88
byte 4 0
address cg_autoswitch
address $89
address $90
byte 4 1
address cg_drawGun
address $91
address $90
byte 4 1
address cg_zoomFov
address $92
address $93
byte 4 1
address cg_fov
address $94
address $95
byte 4 1
address cg_viewsize
address $96
address $97
byte 4 1
address cg_stereoSeparation
address $98
address $99
byte 4 1
address cg_shadows
address $100
address $90
byte 4 1
address cg_gibs
address $101
address $90
byte 4 1
address cg_draw2D
address $102
address $90
byte 4 1
address cg_drawStatus
address $103
address $90
byte 4 1
address cg_drawTimer
address $104
address $90
byte 4 1
address cg_drawFPS
address $105
address $90
byte 4 1
address cg_drawSnapshot
address $106
address $88
byte 4 1
address cg_draw3dIcons
address $107
address $90
byte 4 1
address cg_drawIcons
address $108
address $90
byte 4 1
address cg_drawAmmoWarning
address $109
address $90
byte 4 1
address cg_drawAttacker
address $110
address $90
byte 4 1
address cg_drawCrosshair
address $111
address $112
byte 4 1
address cg_drawCrosshairNames
address $113
address $90
byte 4 1
address cg_drawRewards
address $114
address $90
byte 4 1
address cg_crosshairSize
address $115
address $116
byte 4 1
address cg_crosshairHealth
address $117
address $90
byte 4 1
address cg_crosshairX
address $118
address $88
byte 4 1
address cg_crosshairY
address $119
address $88
byte 4 1
address cg_brassTime
address $120
address $121
byte 4 1
address cg_simpleItems
address $122
address $88
byte 4 1
address cg_addMarks
address $123
address $90
byte 4 1
address cg_lagometer
address $124
address $90
byte 4 1
address cg_railTrailTime
address $125
address $126
byte 4 1
address cg_gun_x
address $127
address $88
byte 4 512
address cg_gun_y
address $128
address $88
byte 4 512
address cg_gun_z
address $129
address $88
byte 4 512
address cg_centertime
address $130
address $131
byte 4 512
address cg_runpitch
address $132
address $133
byte 4 1
address cg_runroll
address $134
address $135
byte 4 1
address cg_bobup
address $136
address $135
byte 4 1
address cg_bobpitch
address $137
address $133
byte 4 1
address cg_bobroll
address $138
address $133
byte 4 1
address cg_swingSpeed
address $139
address $140
byte 4 512
address cg_animSpeed
address $141
address $90
byte 4 512
address cg_debugAnim
address $142
address $88
byte 4 512
address cg_debugPosition
address $143
address $88
byte 4 512
address cg_debugEvents
address $144
address $88
byte 4 512
address cg_errorDecay
address $145
address $97
byte 4 0
address cg_nopredict
address $146
address $88
byte 4 0
address cg_noPlayerAnims
address $147
address $88
byte 4 512
address cg_showmiss
address $148
address $88
byte 4 0
address cg_footsteps
address $149
address $90
byte 4 512
address cg_tracerChance
address $150
address $99
byte 4 512
address cg_tracerWidth
address $151
address $90
byte 4 512
address cg_tracerLength
address $152
address $97
byte 4 512
address cg_thirdPersonRange
address $153
address $154
byte 4 512
address cg_thirdPersonAngle
address $155
address $88
byte 4 512
address cg_thirdPerson
address $156
address $88
byte 4 0
address cg_teamChatTime
address $157
address $158
byte 4 1
address cg_teamChatHeight
address $159
address $88
byte 4 1
address cg_forceModel
address $160
address $88
byte 4 1
address cg_predictItems
address $161
address $90
byte 4 1
address cg_deferPlayers
address $162
address $90
byte 4 1
address cg_drawTeamOverlay
address $163
address $88
byte 4 1
address cg_teamOverlayUserinfo
address $164
address $88
byte 4 66
address cg_stats
address $165
address $88
byte 4 0
address cg_drawFriend
address $166
address $90
byte 4 1
address cg_teamChatsOnly
address $167
address $88
byte 4 1
address cg_noVoiceChats
address $168
address $88
byte 4 1
address cg_noVoiceText
address $169
address $88
byte 4 1
address cg_buildScript
address $170
address $88
byte 4 0
address cg_paused
address $171
address $88
byte 4 64
address cg_blood
address $172
address $90
byte 4 1
address cg_synchronousClients
address $173
address $88
byte 4 0
address cg_hudFiles
address $174
address $175
byte 4 1
address cg_cameraOrbit
address $176
address $88
byte 4 512
address cg_cameraOrbitDelay
address $177
address $178
byte 4 1
address cg_timescaleFadeEnd
address $179
address $90
byte 4 0
address cg_timescaleFadeSpeed
address $180
address $88
byte 4 0
address cg_timescale
address $181
address $90
byte 4 0
address cg_scorePlum
address $182
address $90
byte 4 3
address cg_cameraMode
address $183
address $88
byte 4 512
address pmove_fixed
address $184
address $88
byte 4 0
address pmove_msec
address $185
address $186
byte 4 0
address cg_noTaunt
address $187
address $88
byte 4 1
address cg_noProjectileTrail
address $188
address $88
byte 4 1
address cg_smallFont
address $189
address $190
byte 4 1
address cg_bigFont
address $191
address $99
byte 4 1
address cg_oldRail
address $192
address $90
byte 4 1
address cg_oldRocket
address $193
address $90
byte 4 1
address cg_oldPlasma
address $194
address $90
byte 4 1
address cg_delag
address $195
address $90
byte 4 3
address cg_debugDelag
address $196
address $88
byte 4 514
address cg_drawBBox
address $197
address $88
byte 4 512
address cg_cmdTimeNudge
address $198
address $88
byte 4 3
address sv_fps
address $199
address $200
byte 4 0
address cg_projectileNudge
address $201
address $88
byte 4 1
address cg_optimizePrediction
address $202
address $90
byte 4 1
address cl_timeNudge
address $203
address $88
byte 4 1
address cg_latentSnaps
address $204
address $88
byte 4 514
address cg_latentCmds
address $205
address $88
byte 4 514
address cg_plOut
address $206
address $88
byte 4 514
address cg_trueLightning
address $207
address $208
byte 4 1
align 4
LABELV cvarTableSize
byte 4 100
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 348
;62:}
;63:
;64:
;65:cg_t				cg;
;66:cgs_t				cgs;
;67:centity_t			cg_entities[MAX_GENTITIES];
;68:weaponInfo_t		cg_weapons[MAX_WEAPONS];
;69:itemInfo_t			cg_items[MAX_ITEMS];
;70:
;71:
;72:vmCvar_t	cg_railTrailTime;
;73:vmCvar_t	cg_centertime;
;74:vmCvar_t	cg_runpitch;
;75:vmCvar_t	cg_runroll;
;76:vmCvar_t	cg_bobup;
;77:vmCvar_t	cg_bobpitch;
;78:vmCvar_t	cg_bobroll;
;79:vmCvar_t	cg_swingSpeed;
;80:vmCvar_t	cg_shadows;
;81:vmCvar_t	cg_gibs;
;82:vmCvar_t	cg_drawTimer;
;83:vmCvar_t	cg_drawFPS;
;84:vmCvar_t	cg_drawSnapshot;
;85:vmCvar_t	cg_draw3dIcons;
;86:vmCvar_t	cg_drawIcons;
;87:vmCvar_t	cg_drawAmmoWarning;
;88:vmCvar_t	cg_drawCrosshair;
;89:vmCvar_t	cg_drawCrosshairNames;
;90:vmCvar_t	cg_drawRewards;
;91:vmCvar_t	cg_crosshairSize;
;92:vmCvar_t	cg_crosshairX;
;93:vmCvar_t	cg_crosshairY;
;94:vmCvar_t	cg_crosshairHealth;
;95:vmCvar_t	cg_draw2D;
;96:vmCvar_t	cg_drawStatus;
;97:vmCvar_t	cg_animSpeed;
;98:vmCvar_t	cg_debugAnim;
;99:vmCvar_t	cg_debugPosition;
;100:vmCvar_t	cg_debugEvents;
;101:vmCvar_t	cg_errorDecay;
;102:vmCvar_t	cg_nopredict;
;103:vmCvar_t	cg_noPlayerAnims;
;104:vmCvar_t	cg_showmiss;
;105:vmCvar_t	cg_footsteps;
;106:vmCvar_t	cg_addMarks;
;107:vmCvar_t	cg_brassTime;
;108:vmCvar_t	cg_viewsize;
;109:vmCvar_t	cg_drawGun;
;110:vmCvar_t	cg_gun_frame;
;111:vmCvar_t	cg_gun_x;
;112:vmCvar_t	cg_gun_y;
;113:vmCvar_t	cg_gun_z;
;114:vmCvar_t	cg_tracerChance;
;115:vmCvar_t	cg_tracerWidth;
;116:vmCvar_t	cg_tracerLength;
;117:vmCvar_t	cg_autoswitch;
;118:vmCvar_t	cg_ignore;
;119:vmCvar_t	cg_simpleItems;
;120:vmCvar_t	cg_fov;
;121:vmCvar_t	cg_zoomFov;
;122:vmCvar_t	cg_thirdPerson;
;123:vmCvar_t	cg_thirdPersonRange;
;124:vmCvar_t	cg_thirdPersonAngle;
;125:vmCvar_t	cg_stereoSeparation;
;126:vmCvar_t	cg_lagometer;
;127:vmCvar_t	cg_drawAttacker;
;128:vmCvar_t	cg_synchronousClients;
;129:vmCvar_t 	cg_teamChatTime;
;130:vmCvar_t 	cg_teamChatHeight;
;131:vmCvar_t 	cg_stats;
;132:vmCvar_t 	cg_buildScript;
;133:vmCvar_t 	cg_forceModel;
;134:vmCvar_t	cg_paused;
;135:vmCvar_t	cg_blood;
;136:vmCvar_t	cg_predictItems;
;137:vmCvar_t	cg_deferPlayers;
;138:vmCvar_t	cg_drawTeamOverlay;
;139:vmCvar_t	cg_teamOverlayUserinfo;
;140:vmCvar_t	cg_drawFriend;
;141:vmCvar_t	cg_teamChatsOnly;
;142:vmCvar_t	cg_noVoiceChats;
;143:vmCvar_t	cg_noVoiceText;
;144:vmCvar_t	cg_hudFiles;
;145:vmCvar_t 	cg_scorePlum;
;146:
;147:
;148://unlagged - smooth clients #2
;149:// this is done server-side now
;150://vmCvar_t 	cg_smoothClients;
;151://unlagged - smooth clients #2
;152:vmCvar_t	pmove_fixed;
;153://vmCvar_t	cg_pmove_fixed;
;154:vmCvar_t	pmove_msec;
;155:vmCvar_t	cg_pmove_msec;
;156:vmCvar_t	cg_cameraMode;
;157:vmCvar_t	cg_cameraOrbit;
;158:vmCvar_t	cg_cameraOrbitDelay;
;159:vmCvar_t	cg_timescaleFadeEnd;
;160:vmCvar_t	cg_timescaleFadeSpeed;
;161:vmCvar_t	cg_timescale;
;162:vmCvar_t	cg_smallFont;
;163:vmCvar_t	cg_bigFont;
;164:vmCvar_t	cg_noTaunt;
;165:vmCvar_t	cg_noProjectileTrail;
;166:vmCvar_t	cg_oldRail;
;167:vmCvar_t	cg_oldRocket;
;168:vmCvar_t	cg_oldPlasma;
;169:vmCvar_t	cg_trueLightning;
;170:
;171:#ifdef MISSIONPACK
;172:vmCvar_t 	cg_redTeamName;
;173:vmCvar_t 	cg_blueTeamName;
;174:vmCvar_t	cg_currentSelectedPlayer;
;175:vmCvar_t	cg_currentSelectedPlayerName;
;176:vmCvar_t	cg_singlePlayer;
;177:vmCvar_t	cg_enableDust;
;178:vmCvar_t	cg_enableBreath;
;179:vmCvar_t	cg_singlePlayerActive;
;180:vmCvar_t	cg_recordSPDemo;
;181:vmCvar_t	cg_recordSPDemoName;
;182:vmCvar_t	cg_obeliskRespawnDelay;
;183:#endif
;184://unlagged - client options
;185:vmCvar_t	cg_delag;
;186:vmCvar_t	cg_debugDelag;
;187:vmCvar_t	cg_drawBBox;
;188:vmCvar_t	cg_cmdTimeNudge;
;189:vmCvar_t	sv_fps;
;190:vmCvar_t	cg_projectileNudge;
;191:vmCvar_t	cg_optimizePrediction;
;192:vmCvar_t	cl_timeNudge;
;193:vmCvar_t	cg_latentSnaps;
;194:vmCvar_t	cg_latentCmds;
;195:vmCvar_t	cg_plOut;
;196://unlagged - client options
;197:
;198:typedef struct {
;199:	vmCvar_t	*vmCvar;
;200:	char		*cvarName;
;201:	char		*defaultString;
;202:	int			cvarFlags;
;203:} cvarTable_t;
;204:
;205:static cvarTable_t cvarTable[] = { // bk001129
;206:	{ &cg_ignore, "cg_ignore", "0", 0 },	// used for debugging
;207:	{ &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;208:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;209:	{ &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;210:	{ &cg_fov, "cg_fov", "90", CVAR_ARCHIVE },
;211:	{ &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;212:	{ &cg_stereoSeparation, "cg_stereoSeparation", "0.4", CVAR_ARCHIVE  },
;213:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE  },
;214:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE  },
;215:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE  },
;216:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE  },
;217:	{ &cg_drawTimer, "cg_drawTimer", "1", CVAR_ARCHIVE  },
;218:	{ &cg_drawFPS, "cg_drawFPS", "1", CVAR_ARCHIVE  },
;219:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;220:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE  },
;221:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE  },
;222:	{ &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE  },
;223:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE  },
;224:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;225:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;226:	{ &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;227:	{ &cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE },
;228:	{ &cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE },
;229:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;230:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;231:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;232:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;233:	{ &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;234:	{ &cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE },
;235:	{ &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE  },
;236:	{ &cg_gun_x, "cg_gunX", "0", CVAR_CHEAT },
;237:	{ &cg_gun_y, "cg_gunY", "0", CVAR_CHEAT },
;238:	{ &cg_gun_z, "cg_gunZ", "0", CVAR_CHEAT },
;239:	{ &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;240:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;241:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;242:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;243:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;244:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;245:	{ &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT },
;246:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;247:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;248:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;249:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;250:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;251:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;252:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;253:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;254:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;255:	{ &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;256:	{ &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;257:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;258:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT },
;259:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT },
;260:	{ &cg_thirdPerson, "cg_thirdPerson", "0", 0 },
;261:	{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;262:	{ &cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE  },
;263:	{ &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE  },
;264:	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;265:
;266:	////////////////////////////
;267:
;268:#ifdef MISSIONPACK
;269:	{ &cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE },
;270:#else
;271:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;272:#endif
;273:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;274:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;275:	{ &cg_stats, "cg_stats", "0", 0 },
;276:	{ &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;277:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;278:	{ &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;279:	{ &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;280:	// the following variables are created in other parts of the system,
;281:	// but we also reference them here
;282:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;283:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;284:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;285:	{ &cg_synchronousClients, "g_synchronousClients", "0", 0 },	// communicated by systeminfo
;286:
;287:#ifdef MISSIONPACK
;288:	{ &cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;289:	{ &cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;290:	{ &cg_currentSelectedPlayer, "cg_currentSelectedPlayer", "0", CVAR_ARCHIVE},
;291:	{ &cg_currentSelectedPlayerName, "cg_currentSelectedPlayerName", "", CVAR_ARCHIVE},
;292:	{ &cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;293:	{ &cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;294:	{ &cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;295:	{ &cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;296:	{ &cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;297:	{ &cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;298:	{ &cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;299:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;300:#endif
;301:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE}, // Shafe - Trep
;302:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;303:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;304:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;305:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;306:	{ &cg_timescale, "timescale", "1", 0},
;307:	{ &cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;308://unlagged - smooth clients #2
;309:// this is done server-side now
;310://	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;311://unlagged - smooth clients #2
;312:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;313:
;314:	{ &pmove_fixed, "pmove_fixed", "0", 0},
;315:	{ &pmove_msec, "pmove_msec", "8", 0},
;316:	{ &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;317:	{ &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;318:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;319:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;320:	{ &cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;321:	{ &cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;322:	{ &cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;323://unlagged - client options
;324:	{ &cg_delag, "cg_delag", "1", CVAR_ARCHIVE | CVAR_USERINFO },
;325:	{ &cg_debugDelag, "cg_debugDelag", "0", CVAR_USERINFO | CVAR_CHEAT },
;326:	{ &cg_drawBBox, "cg_drawBBox", "0", CVAR_CHEAT },
;327:	{ &cg_cmdTimeNudge, "cg_cmdTimeNudge", "0", CVAR_ARCHIVE | CVAR_USERINFO },
;328:	// this will be automagically copied from the server
;329:	{ &sv_fps, "sv_fps", "20", 0 },
;330:	{ &cg_projectileNudge, "cg_projectileNudge", "0", CVAR_ARCHIVE },
;331:	{ &cg_optimizePrediction, "cg_optimizePrediction", "1", CVAR_ARCHIVE },
;332:	{ &cl_timeNudge, "cl_timeNudge", "0", CVAR_ARCHIVE },
;333:	{ &cg_latentSnaps, "cg_latentSnaps", "0", CVAR_USERINFO | CVAR_CHEAT },
;334:	{ &cg_latentCmds, "cg_latentCmds", "0", CVAR_USERINFO | CVAR_CHEAT },
;335:	{ &cg_plOut, "cg_plOut", "0", CVAR_USERINFO | CVAR_CHEAT },
;336://unlagged - client options
;337:	{ &cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE}
;338://	{ &cg_pmove_fixed, "cg_pmove_fixed", "0", CVAR_USERINFO | CVAR_ARCHIVE }
;339:};
;340:
;341:static int  cvarTableSize = sizeof( cvarTable ) / sizeof( cvarTable[0] );
;342:
;343:/*
;344:=================
;345:CG_RegisterCvars
;346:=================
;347:*/
;348:void CG_RegisterCvars( void ) {
line 353
;349:	int			i;
;350:	cvarTable_t	*cv;
;351:	char		var[MAX_TOKEN_CHARS];
;352:
;353:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $213
JUMPV
LABELV $210
line 354
;354:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
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
line 356
;355:			cv->defaultString, cv->cvarFlags );
;356:	}
LABELV $211
line 353
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $213
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $210
line 359
;357:
;358:	// see if we are also running the server on this machine
;359:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $214
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 360
;360:	cgs.localServer = atoi( var );
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31452
ADDRLP4 1032
INDIRI4
ASGNI4
line 362
;361:
;362:	forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 364
;363:
;364:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $217
ARGP4
ADDRGP4 $218
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 365
;365:	trap_Cvar_Register(NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $219
ARGP4
ADDRGP4 $218
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 366
;366:	trap_Cvar_Register(NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $220
ARGP4
ADDRGP4 $218
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 367
;367:	trap_Cvar_Register(NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $221
ARGP4
ADDRGP4 $218
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 368
;368:}
LABELV $209
endproc CG_RegisterCvars 1036 16
proc CG_ForceModelChange 12 4
line 375
;369:
;370:/*																																			
;371:===================
;372:CG_ForceModelChange
;373:===================
;374:*/
;375:static void CG_ForceModelChange( void ) {
line 378
;376:	int		i;
;377:
;378:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $223
line 381
;379:		const char		*clientInfo;
;380:
;381:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 382
;382:		if ( !clientInfo[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $227
line 383
;383:			continue;
ADDRGP4 $224
JUMPV
LABELV $227
line 385
;384:		}
;385:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 386
;386:	}
LABELV $224
line 378
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $223
line 387
;387:}
LABELV $222
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 12 16
line 394
;388:
;389:/*
;390:=================
;391:CG_UpdateCvars
;392:=================
;393:*/
;394:void CG_UpdateCvars( void ) {
line 398
;395:	int			i;
;396:	cvarTable_t	*cv;
;397:
;398:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $233
JUMPV
LABELV $230
line 403
;399://unlagged - client options
;400:		// clamp the value between 0 and 999
;401:		// negative values would suck - people could conceivably shoot other
;402:		// players *long* after they had left the area, on purpose
;403:		if ( cv->vmCvar == &cg_cmdTimeNudge ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_cmdTimeNudge
CVPU4 4
NEU4 $234
line 404
;404:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 999 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 999
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 405
;405:		}
ADDRGP4 $235
JUMPV
LABELV $234
line 410
;406:		// cl_timenudge less than -50 or greater than 50 doesn't actually
;407:		// do anything more than -50 or 50 (actually the numbers are probably
;408:		// closer to -30 and 30, but 50 is nice and round-ish)
;409:		// might as well not feed the myth, eh?
;410:		else if ( cv->vmCvar == &cl_timeNudge ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cl_timeNudge
CVPU4 4
NEU4 $236
line 411
;411:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, -50, 50 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 -50
ARGI4
CNSTI4 50
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 412
;412:		}
ADDRGP4 $237
JUMPV
LABELV $236
line 414
;413:		// don't let this go too high - no point
;414:		else if ( cv->vmCvar == &cg_latentSnaps ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_latentSnaps
CVPU4 4
NEU4 $238
line 415
;415:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 10 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 416
;416:		}
ADDRGP4 $239
JUMPV
LABELV $238
line 418
;417:		// don't let this get too large
;418:		else if ( cv->vmCvar == &cg_latentCmds ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_latentCmds
CVPU4 4
NEU4 $240
line 419
;419:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, MAX_LATENT_CMDS - 1 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 63
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 420
;420:		}
ADDRGP4 $241
JUMPV
LABELV $240
line 422
;421:		// no more than 100% packet loss
;422:		else if ( cv->vmCvar == &cg_plOut ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_plOut
CVPU4 4
NEU4 $242
line 423
;423:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 100 );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 CG_Cvar_ClampInt
CALLI4
pop
line 424
;424:		}
LABELV $242
LABELV $241
LABELV $239
LABELV $237
LABELV $235
line 426
;425://unlagged - client options
;426:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 427
;427:	}
LABELV $231
line 398
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $233
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $230
line 433
;428:
;429:	// check for modications here
;430:
;431:	// If team overlay is on, ask for updates from the server.  If its off,
;432:	// let the server know so we don't receive it
;433:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $244
line 434
;434:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 436
;435:
;436:		if ( cg_drawTeamOverlay.integer > 0 ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
LEI4 $248
line 437
;437:			trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $164
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 438
;438:		} else {
ADDRGP4 $249
JUMPV
LABELV $248
line 439
;439:			trap_Cvar_Set( "teamoverlay", "0" );
ADDRGP4 $164
ARGP4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 440
;440:		}
LABELV $249
line 442
;441:		// FIXME E3 HACK
;442:		trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $164
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 443
;443:	}
LABELV $244
line 446
;444:
;445:	// if force model changed
;446:	if ( forceModelModificationCount != cg_forceModel.modificationCount ) {
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
EQI4 $251
line 447
;447:		forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 448
;448:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 449
;449:	}
LABELV $251
line 450
;450:}
LABELV $229
endproc CG_UpdateCvars 12 16
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 452
;451:
;452:int CG_CrosshairPlayer( void ) {
line 453
;453:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+124416
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $256
line 454
;454:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $255
JUMPV
LABELV $256
line 456
;455:	}
;456:	return cg.crosshairClientNum;
ADDRGP4 cg+124412
INDIRI4
RETI4
LABELV $255
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 459
;457:}
;458:
;459:int CG_LastAttacker( void ) {
line 460
;460:	if ( !cg.attackerTime ) {
ADDRGP4 cg+124428
INDIRI4
CNSTI4 0
NEI4 $262
line 461
;461:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $261
JUMPV
LABELV $262
line 463
;462:	}
;463:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $261
endproc CG_LastAttacker 0 0
export CG_Printf
proc CG_Printf 1028 12
line 466
;464:}
;465:
;466:void QDECL CG_Printf( const char *msg, ... ) {
line 470
;467:	va_list		argptr;
;468:	char		text[1024];
;469:
;470:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 471
;471:	vsprintf (text, msg, argptr);
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
line 472
;472:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 474
;473:
;474:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 475
;475:}
LABELV $266
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 477
;476:
;477:void QDECL CG_Error( const char *msg, ... ) {
line 481
;478:	va_list		argptr;
;479:	char		text[1024];
;480:
;481:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 482
;482:	vsprintf (text, msg, argptr);
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
line 483
;483:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 485
;484:
;485:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 486
;486:}
LABELV $268
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 491
;487:
;488:#ifndef CGAME_HARD_LINKED
;489:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;490:
;491:void QDECL Com_Error( int level, const char *error, ... ) {
line 495
;492:	va_list		argptr;
;493:	char		text[1024];
;494:
;495:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 496
;496:	vsprintf (text, error, argptr);
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
line 497
;497:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 499
;498:
;499:	CG_Error( "%s", text);
ADDRGP4 $272
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 500
;500:}
LABELV $270
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 502
;501:
;502:void QDECL Com_Printf( const char *msg, ... ) {
line 506
;503:	va_list		argptr;
;504:	char		text[1024];
;505:
;506:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 507
;507:	vsprintf (text, msg, argptr);
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
line 508
;508:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 510
;509:
;510:	CG_Printf ("%s", text);
ADDRGP4 $272
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 511
;511:}
LABELV $273
endproc Com_Printf 1028 12
bss
align 1
LABELV $276
skip 1024
export CG_Argv
code
proc CG_Argv 0 12
line 520
;512:
;513:#endif
;514:
;515:/*
;516:================
;517:CG_Argv
;518:================
;519:*/
;520:const char *CG_Argv( int arg ) {
line 523
;521:	static char	buffer[MAX_STRING_CHARS];
;522:
;523:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $276
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 525
;524:
;525:	return buffer;
ADDRGP4 $276
RETP4
LABELV $275
endproc CG_Argv 0 12
proc CG_RegisterItemSounds 96 12
line 538
;526:}
;527:
;528:
;529://========================================================================
;530:
;531:/*
;532:=================
;533:CG_RegisterItemSounds
;534:
;535:The server says this item is used on this level
;536:=================
;537:*/
;538:static void CG_RegisterItemSounds( int itemNum ) {
line 544
;539:	gitem_t			*item;
;540:	char			data[MAX_QPATH];
;541:	char			*s, *start;
;542:	int				len;
;543:
;544:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 546
;545:
;546:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
line 547
;547:		trap_S_RegisterSound( item->pickup_sound, qfalse );
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 548
;548:	}
LABELV $278
line 551
;549:
;550:	// parse the space seperated precache string for other media
;551:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 552
;552:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $282
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $284
LABELV $282
line 553
;553:		return;
ADDRGP4 $277
JUMPV
LABELV $283
line 555
;554:
;555:	while (*s) {
line 556
;556:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $287
JUMPV
LABELV $286
line 557
;557:		while (*s && *s != ' ') {
line 558
;558:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 559
;559:		}
LABELV $287
line 557
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $289
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $286
LABELV $289
line 561
;560:
;561:		len = s-start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 562
;562:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $292
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $290
LABELV $292
line 563
;563:			CG_Error( "PrecacheItem: %s has bad precache string", 
ADDRGP4 $293
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 565
;564:				item->classname);
;565:			return;
ADDRGP4 $277
JUMPV
LABELV $290
line 567
;566:		}
;567:		memcpy (data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 568
;568:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 569
;569:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $294
line 570
;570:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 571
;571:		}
LABELV $294
line 573
;572:
;573:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $296
line 574
;574:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 575
;575:		}
LABELV $296
line 576
;576:	}
LABELV $284
line 555
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $283
line 577
;577:}
LABELV $277
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 564 16
line 587
;578:
;579:
;580:/*
;581:=================
;582:CG_RegisterSounds
;583:
;584:called during a precache command
;585:=================
;586:*/
;587:static void CG_RegisterSounds( void ) {
line 598
;588:	int		i;
;589:	char	items[MAX_ITEMS+1];
;590:	char	name[MAX_QPATH];
;591:	const char	*soundName;
;592:
;593:	// voice commands
;594:#ifdef MISSIONPACK
;595:	CG_LoadVoiceChats();
;596:#endif
;597:
;598:	cgs.media.oneMinuteSound = trap_S_RegisterSound( "sound/feedback/1_minute.wav", qtrue );
ADDRGP4 $303
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+768
ADDRLP4 332
INDIRI4
ASGNI4
line 599
;599:	cgs.media.fiveMinuteSound = trap_S_RegisterSound( "sound/feedback/5_minute.wav", qtrue );
ADDRGP4 $306
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+772
ADDRLP4 336
INDIRI4
ASGNI4
line 600
;600:	cgs.media.suddenDeathSound = trap_S_RegisterSound( "sound/feedback/sudden_death.wav", qtrue );
ADDRGP4 $309
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+776
ADDRLP4 340
INDIRI4
ASGNI4
line 601
;601:	cgs.media.oneFragSound = trap_S_RegisterSound( "sound/feedback/1_frag.wav", qtrue );
ADDRGP4 $312
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+788
ADDRLP4 344
INDIRI4
ASGNI4
line 602
;602:	cgs.media.twoFragSound = trap_S_RegisterSound( "sound/feedback/2_frags.wav", qtrue );
ADDRGP4 $315
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+784
ADDRLP4 348
INDIRI4
ASGNI4
line 603
;603:	cgs.media.threeFragSound = trap_S_RegisterSound( "sound/feedback/3_frags.wav", qtrue );
ADDRGP4 $318
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+780
ADDRLP4 352
INDIRI4
ASGNI4
line 604
;604:	cgs.media.count3Sound = trap_S_RegisterSound( "sound/feedback/three.wav", qtrue );
ADDRGP4 $321
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+980
ADDRLP4 356
INDIRI4
ASGNI4
line 605
;605:	cgs.media.count2Sound = trap_S_RegisterSound( "sound/feedback/two.wav", qtrue );
ADDRGP4 $324
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+984
ADDRLP4 360
INDIRI4
ASGNI4
line 606
;606:	cgs.media.count1Sound = trap_S_RegisterSound( "sound/feedback/one.wav", qtrue );
ADDRGP4 $327
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+988
ADDRLP4 364
INDIRI4
ASGNI4
line 607
;607:	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.wav", qtrue );
ADDRGP4 $330
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+992
ADDRLP4 368
INDIRI4
ASGNI4
line 608
;608:	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.wav", qtrue );
ADDRGP4 $333
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+996
ADDRLP4 372
INDIRI4
ASGNI4
line 613
;609:#ifdef MISSIONPACK
;610:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound( "sound/feedback/prepare_team.wav", qtrue );
;611:#endif
;612:
;613:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $338
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $334
LABELV $338
line 615
;614:
;615:		cgs.media.captureAwardSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $341
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+892
ADDRLP4 376
INDIRI4
ASGNI4
line 616
;616:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/feedback/redleads.wav", qtrue );
ADDRGP4 $344
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+904
ADDRLP4 380
INDIRI4
ASGNI4
line 617
;617:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/feedback/blueleads.wav", qtrue );
ADDRGP4 $347
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+908
ADDRLP4 384
INDIRI4
ASGNI4
line 618
;618:		cgs.media.teamsTiedSound = trap_S_RegisterSound( "sound/feedback/teamstied.wav", qtrue );
ADDRGP4 $350
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+912
ADDRLP4 388
INDIRI4
ASGNI4
line 619
;619:		cgs.media.hitTeamSound = trap_S_RegisterSound( "sound/feedback/hit_teammate.wav", qtrue );
ADDRGP4 $353
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+804
ADDRLP4 392
INDIRI4
ASGNI4
line 621
;620:
;621:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_red_scores.wav", qtrue );
ADDRGP4 $356
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+896
ADDRLP4 396
INDIRI4
ASGNI4
line 622
;622:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_scores.wav", qtrue );
ADDRGP4 $359
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+900
ADDRLP4 400
INDIRI4
ASGNI4
line 624
;623:
;624:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $341
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+916
ADDRLP4 404
INDIRI4
ASGNI4
line 625
;625:		cgs.media.captureOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_opponent.wav", qtrue );
ADDRGP4 $364
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+920
ADDRLP4 408
INDIRI4
ASGNI4
line 627
;626:
;627:		cgs.media.returnYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_yourteam.wav", qtrue );
ADDRGP4 $367
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+924
ADDRLP4 412
INDIRI4
ASGNI4
line 628
;628:		cgs.media.returnOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $370
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+928
ADDRLP4 416
INDIRI4
ASGNI4
line 630
;629:
;630:		cgs.media.takenYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_yourteam.wav", qtrue );
ADDRGP4 $373
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+932
ADDRLP4 420
INDIRI4
ASGNI4
line 631
;631:		cgs.media.takenOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_opponent.wav", qtrue );
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+936
ADDRLP4 424
INDIRI4
ASGNI4
line 633
;632:
;633:		if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $381
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $377
LABELV $381
line 634
;634:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_red_returned.wav", qtrue );
ADDRGP4 $384
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+940
ADDRLP4 428
INDIRI4
ASGNI4
line 635
;635:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_returned.wav", qtrue );
ADDRGP4 $387
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+944
ADDRLP4 432
INDIRI4
ASGNI4
line 636
;636:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_flag.wav", qtrue );
ADDRGP4 $390
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+952
ADDRLP4 436
INDIRI4
ASGNI4
line 637
;637:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_flag.wav", qtrue );
ADDRGP4 $393
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+960
ADDRLP4 440
INDIRI4
ASGNI4
line 638
;638:		}
LABELV $377
line 657
;639:
;640:#ifdef MISSIONPACK
;641:		if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;642:			// FIXME: get a replacement for this sound ?
;643:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
;644:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
;645:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
;646:		}
;647:
;648:		if ( cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cg_buildScript.integer ) {
;649:			cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
;650:			cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
;651:		}
;652:
;653:		if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;654:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound( "sound/teamplay/voc_base_attack.wav", qtrue );
;655:		}
;656:#else
;657:		cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
ADDRGP4 $396
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+968
ADDRLP4 428
INDIRI4
ASGNI4
line 658
;658:		cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $399
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+976
ADDRLP4 432
INDIRI4
ASGNI4
line 659
;659:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $370
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+948
ADDRLP4 436
INDIRI4
ASGNI4
line 660
;660:		cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
ADDRGP4 $404
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+964
ADDRLP4 440
INDIRI4
ASGNI4
line 661
;661:		cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
ADDRGP4 $407
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+956
ADDRLP4 444
INDIRI4
ASGNI4
line 663
;662:#endif
;663:	}
LABELV $334
line 665
;664:
;665:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $410
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+552
ADDRLP4 376
INDIRI4
ASGNI4
line 666
;666:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $413
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+556
ADDRLP4 380
INDIRI4
ASGNI4
line 667
;667:	cgs.media.wearOffSound = trap_S_RegisterSound( "sound/items/wearoff.wav", qfalse );
ADDRGP4 $416
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+564
ADDRLP4 384
INDIRI4
ASGNI4
line 668
;668:	cgs.media.useNothingSound = trap_S_RegisterSound( "sound/items/use_nothing.wav", qfalse );
ADDRGP4 $419
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+560
ADDRLP4 388
INDIRI4
ASGNI4
line 669
;669:	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $422
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+720
ADDRLP4 392
INDIRI4
ASGNI4
line 670
;670:	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $425
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+724
ADDRLP4 396
INDIRI4
ASGNI4
line 671
;671:	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $428
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+728
ADDRLP4 400
INDIRI4
ASGNI4
line 672
;672:	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $431
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+732
ADDRLP4 404
INDIRI4
ASGNI4
line 691
;673:
;674:#ifdef MISSIONPACK
;675:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.wav", qfalse );
;676:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.wav", qfalse );
;677:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.wav", qfalse );
;678:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.wav", qfalse );
;679:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.wav", qfalse );
;680:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.wav", qfalse );
;681:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.wav", qfalse );
;682:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.wav", qfalse );
;683:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.wav", qfalse );
;684:
;685:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
;686:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
;687:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
;688:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
;689:#endif
;690:
;691:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $434
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+736
ADDRLP4 408
INDIRI4
ASGNI4
line 692
;692:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $437
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+740
ADDRLP4 412
INDIRI4
ASGNI4
line 693
;693:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $440
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+748
ADDRLP4 416
INDIRI4
ASGNI4
line 695
;694:
;695:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $443
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+744
ADDRLP4 420
INDIRI4
ASGNI4
line 697
;696:
;697:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $446
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+752
ADDRLP4 424
INDIRI4
ASGNI4
line 698
;698:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $449
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+756
ADDRLP4 428
INDIRI4
ASGNI4
line 700
;699:
;700:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.wav", qfalse );
ADDRGP4 $452
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+792
ADDRLP4 432
INDIRI4
ASGNI4
line 706
;701:#ifdef MISSIONPACK
;702:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.wav", qfalse );
;703:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.wav", qfalse );
;704:#endif
;705:
;706:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $455
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+808
ADDRLP4 436
INDIRI4
ASGNI4
line 707
;707:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $458
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+812
ADDRLP4 440
INDIRI4
ASGNI4
line 708
;708:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $461
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+816
ADDRLP4 444
INDIRI4
ASGNI4
line 709
;709:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $464
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+820
ADDRLP4 448
INDIRI4
ASGNI4
line 710
;710:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $467
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+824
ADDRLP4 452
INDIRI4
ASGNI4
line 711
;711:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $470
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+828
ADDRLP4 456
INDIRI4
ASGNI4
line 718
;712:#ifdef MISSIONPACK
;713:	cgs.media.firstImpressiveSound = trap_S_RegisterSound( "sound/feedback/first_impressive.wav", qtrue );
;714:	cgs.media.firstExcellentSound = trap_S_RegisterSound( "sound/feedback/first_excellent.wav", qtrue );
;715:	cgs.media.firstHumiliationSound = trap_S_RegisterSound( "sound/feedback/first_gauntlet.wav", qtrue );
;716:#endif
;717:
;718:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $473
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+844
ADDRLP4 460
INDIRI4
ASGNI4
line 719
;719:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $476
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+848
ADDRLP4 464
INDIRI4
ASGNI4
line 720
;720:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $479
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+852
ADDRLP4 468
INDIRI4
ASGNI4
line 728
;721:
;722:#ifdef MISSIONPACK
;723:	cgs.media.voteNow = trap_S_RegisterSound( "sound/feedback/vote_now.wav", qtrue);
;724:	cgs.media.votePassed = trap_S_RegisterSound( "sound/feedback/vote_passed.wav", qtrue);
;725:	cgs.media.voteFailed = trap_S_RegisterSound( "sound/feedback/vote_failed.wav", qtrue);
;726:#endif
;727:
;728:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $482
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+868
ADDRLP4 472
INDIRI4
ASGNI4
line 729
;729:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $485
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+872
ADDRLP4 476
INDIRI4
ASGNI4
line 730
;730:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $488
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+876
ADDRLP4 480
INDIRI4
ASGNI4
line 732
;731:
;732:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $491
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+764
ADDRLP4 484
INDIRI4
ASGNI4
line 734
;733:
;734:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $492
line 735
;735:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $496
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 736
;736:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568
ADDP4
ADDRLP4 488
INDIRI4
ASGNI4
line 738
;737:
;738:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $499
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 739
;739:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568+16
ADDP4
ADDRLP4 492
INDIRI4
ASGNI4
line 741
;740:
;741:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $503
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 742
;742:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568+32
ADDP4
ADDRLP4 496
INDIRI4
ASGNI4
line 744
;743:
;744:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $507
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 745
;745:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568+48
ADDP4
ADDRLP4 500
INDIRI4
ASGNI4
line 747
;746:
;747:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $511
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 748
;748:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568+64
ADDP4
ADDRLP4 504
INDIRI4
ASGNI4
line 750
;749:
;750:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $515
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 751
;751:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568+96
ADDP4
ADDRLP4 508
INDIRI4
ASGNI4
line 753
;752:
;753:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $519
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 754
;754:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+568+80
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 755
;755:	}
LABELV $493
line 734
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $492
line 758
;756:
;757:	// only register the items that the server says we need
;758:	strcpy( items, CG_ConfigString( CS_ITEMS ) );
CNSTI4 27
ARGI4
ADDRLP4 488
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 488
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 760
;759:
;760:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $526
JUMPV
LABELV $523
line 762
;761://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;762:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 764
;763://		}
;764:	}
LABELV $524
line 760
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $526
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $523
line 766
;765:
;766:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $527
line 767
;767:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 492
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 492
INDIRP4
ASGNP4
line 768
;768:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $531
line 769
;769:			break;
ADDRGP4 $529
JUMPV
LABELV $531
line 771
;770:		}
;771:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $533
line 772
;772:			continue;	// custom sound
ADDRGP4 $528
JUMPV
LABELV $533
line 774
;773:		}
;774:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
ADDRLP4 496
INDIRI4
ASGNI4
line 775
;775:	}
LABELV $528
line 766
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $527
LABELV $529
line 778
;776:
;777:	// FIXME: only needed with item
;778:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.wav", qfalse );
ADDRGP4 $538
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+880
ADDRLP4 492
INDIRI4
ASGNI4
line 779
;779:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $541
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+884
ADDRLP4 496
INDIRI4
ASGNI4
line 780
;780:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $544
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+548
ADDRLP4 500
INDIRI4
ASGNI4
line 781
;781:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $547
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+692
ADDRLP4 504
INDIRI4
ASGNI4
line 782
;782:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $550
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+696
ADDRLP4 508
INDIRI4
ASGNI4
line 783
;783:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $553
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+700
ADDRLP4 512
INDIRI4
ASGNI4
line 784
;784:	cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
ADDRGP4 $556
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+704
ADDRLP4 516
INDIRI4
ASGNI4
line 785
;785:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $559
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+708
ADDRLP4 520
INDIRI4
ASGNI4
line 786
;786:	cgs.media.sfx_devexp = trap_S_RegisterSound ("sound/weapons/bfg/devhit.wav", qfalse);
ADDRGP4 $562
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+712
ADDRLP4 524
INDIRI4
ASGNI4
line 787
;787:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $565
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+716
ADDRLP4 528
INDIRI4
ASGNI4
line 788
;788:	cgs.media.flameBallShader = trap_R_RegisterShader( "sprites/flameball" );
ADDRGP4 $568
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+484
ADDRLP4 532
INDIRI4
ASGNI4
line 811
;789:#ifdef MISSIONPACK
;790:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
;791:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
;792:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
;793:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
;794:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
;795:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
;796:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
;797:	cgs.media.weaponHoverSound = trap_S_RegisterSound( "sound/weapons/weapon_hover.wav", qfalse );
;798:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.wav", qfalse );
;799:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.wav", qfalse );
;800:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.wav", qfalse );
;801:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.wav", qfalse );
;802:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.wav", qfalse );
;803:	cgs.media.youSuckSound = trap_S_RegisterSound( "sound/misc/yousuck.wav", qfalse );
;804:
;805:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;806:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;807:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;808:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;809:#endif
;810:
;811:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $571
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 536
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1012
ADDRLP4 536
INDIRI4
ASGNI4
line 812
;812:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $574
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1016
ADDRLP4 540
INDIRI4
ASGNI4
line 813
;813:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
ADDRGP4 $577
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1020
ADDRLP4 544
INDIRI4
ASGNI4
line 814
;814:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $580
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 548
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1024
ADDRLP4 548
INDIRI4
ASGNI4
line 815
;815:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $583
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 552
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1028
ADDRLP4 552
INDIRI4
ASGNI4
line 817
;816:
;817:	cgs.media.hplb1aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb1a.wav", qfalse);
ADDRGP4 $586
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 556
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1064
ADDRLP4 556
INDIRI4
ASGNI4
line 818
;818:	cgs.media.hplb2aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb2a.wav", qfalse);
ADDRGP4 $589
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 560
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1068
ADDRLP4 560
INDIRI4
ASGNI4
line 849
;819:
;820:
;821:#ifdef MISSIONPACK
;822:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse );
;823:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse );
;824:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse );
;825:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse );
;826:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse );
;827:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse );
;828:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse );
;829:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse );
;830:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse );
;831:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse );
;832:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse );
;833:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse );
;834:
;835:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse );
;836:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse );
;837:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse );
;838:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse );
;839:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse );
;840:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse );
;841:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse );
;842:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse );
;843:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse );
;844:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse );
;845:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse );
;846:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse );
;847:#endif
;848:
;849:}
LABELV $300
endproc CG_RegisterSounds 564 16
data
align 4
LABELV $591
address $592
address $593
address $594
address $595
address $596
address $597
address $598
address $599
address $600
address $601
address $602
code
proc CG_RegisterGraphics 616 16
line 862
;850:
;851:
;852://===================================================================================
;853:
;854:
;855:/*
;856:=================
;857:CG_RegisterGraphics
;858:
;859:This function may execute for a couple of minutes with a slow disk.
;860:=================
;861:*/
;862:static void CG_RegisterGraphics( void ) {
line 880
;863:	int			i;
;864:	char		items[MAX_ITEMS+1];
;865:	static char		*sb_nums[11] = {
;866:		"gfx/2d/numbers/zero_32b",
;867:		"gfx/2d/numbers/one_32b",
;868:		"gfx/2d/numbers/two_32b",
;869:		"gfx/2d/numbers/three_32b",
;870:		"gfx/2d/numbers/four_32b",
;871:		"gfx/2d/numbers/five_32b",
;872:		"gfx/2d/numbers/six_32b",
;873:		"gfx/2d/numbers/seven_32b",
;874:		"gfx/2d/numbers/eight_32b",
;875:		"gfx/2d/numbers/nine_32b",
;876:		"gfx/2d/numbers/minus_32b",
;877:	};
;878:
;879:	// clear any references to old media
;880:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109048
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 881
;881:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 883
;882:
;883:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 885
;884:
;885:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 888
;886:
;887:	// precache status bar pics
;888:	CG_LoadingString( "game media" );
ADDRGP4 $607
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 890
;889:
;890:	for ( i=0 ; i<11 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $608
line 891
;891:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 $591
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 cgs+152852+308
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 892
;892:	}
LABELV $609
line 890
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $608
line 894
;893:
;894:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $616
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+356
ADDRLP4 264
INDIRI4
ASGNI4
line 895
;895:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $620
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+356+4
ADDRLP4 268
INDIRI4
ASGNI4
line 896
;896:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $624
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+356+8
ADDRLP4 272
INDIRI4
ASGNI4
line 897
;897:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $628
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+356+12
ADDRLP4 276
INDIRI4
ASGNI4
line 898
;898:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $632
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+356+16
ADDRLP4 280
INDIRI4
ASGNI4
line 900
;899:
;900:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $635
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+216
ADDRLP4 284
INDIRI4
ASGNI4
line 902
;901:
;902:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $638
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+132
ADDRLP4 288
INDIRI4
ASGNI4
line 904
;903:
;904:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $641
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+504
ADDRLP4 292
INDIRI4
ASGNI4
line 905
;905:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $644
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+508
ADDRLP4 296
INDIRI4
ASGNI4
line 906
;906:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $647
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+512
ADDRLP4 300
INDIRI4
ASGNI4
line 907
;907:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $650
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+520
ADDRLP4 304
INDIRI4
ASGNI4
line 908
;908:	cgs.media.scoreboardTrep = trap_R_RegisterShaderNoMip( "menu/tab/scoreboard.tga" ); // Shafe
ADDRGP4 $653
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+516
ADDRLP4 308
INDIRI4
ASGNI4
line 910
;909:
;910:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $656
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+276
ADDRLP4 312
INDIRI4
ASGNI4
line 911
;911:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $659
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+280
ADDRLP4 316
INDIRI4
ASGNI4
line 914
;912:
;913:	// Shafe - Singularity Cannon Shaders
;914:	cgs.media.smokePuffShader2 = trap_R_RegisterShader( "smokePuff2" );
ADDRGP4 $662
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+284
ADDRLP4 320
INDIRI4
ASGNI4
line 915
;915:	cgs.media.smokePuffRageProShader2 = trap_R_RegisterShader( "smokePuffRagePro2" );
ADDRGP4 $665
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+288
ADDRLP4 324
INDIRI4
ASGNI4
line 918
;916:	// End Shafe
;917:
;918:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $668
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+292
ADDRLP4 328
INDIRI4
ASGNI4
line 925
;919:
;920:
;921:#ifdef MISSIONPACK
;922:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
;923:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
;924:#endif
;925:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $671
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+296
ADDRLP4 332
INDIRI4
ASGNI4
line 926
;926:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $674
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+304
ADDRLP4 336
INDIRI4
ASGNI4
line 927
;927:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $677
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+264
ADDRLP4 340
INDIRI4
ASGNI4
line 928
;928:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $680
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+208
ADDRLP4 344
INDIRI4
ASGNI4
line 930
;929:
;930:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $683
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+300
ADDRLP4 348
INDIRI4
ASGNI4
line 932
;931:
;932:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $686
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+220
ADDRLP4 352
INDIRI4
ASGNI4
line 933
;933:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $689
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+212
ADDRLP4 356
INDIRI4
ASGNI4
line 935
;934:
;935:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $690
line 936
;936:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $696
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152852+224
ADDP4
ADDRLP4 368
INDIRI4
ASGNI4
line 937
;937:	}
LABELV $691
line 935
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $690
line 939
;938:
;939:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $699
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+268
ADDRLP4 360
INDIRI4
ASGNI4
line 940
;940:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $702
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+272
ADDRLP4 364
INDIRI4
ASGNI4
line 943
;941:
;942:	// powerup shaders
;943:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $705
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+400
ADDRLP4 368
INDIRI4
ASGNI4
line 944
;944:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $708
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+408
ADDRLP4 372
INDIRI4
ASGNI4
line 945
;945:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $711
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+420
ADDRLP4 376
INDIRI4
ASGNI4
line 946
;946:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $714
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+424
ADDRLP4 380
INDIRI4
ASGNI4
line 947
;947:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $717
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+412
ADDRLP4 384
INDIRI4
ASGNI4
line 948
;948:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $720
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+416
ADDRLP4 388
INDIRI4
ASGNI4
line 949
;949:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $723
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+428
ADDRLP4 392
INDIRI4
ASGNI4
line 954
;950:
;951:#ifdef MISSIONPACK
;952:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;953:#else
;954:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $728
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $724
LABELV $728
line 956
;955:#endif
;956:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $731
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+20
ADDRLP4 396
INDIRI4
ASGNI4
line 957
;957:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $734
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+24
ADDRLP4 400
INDIRI4
ASGNI4
line 958
;958:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $737
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+28
ADDRLP4 404
INDIRI4
ASGNI4
line 959
;959:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $740
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+32
ADDRLP4 408
INDIRI4
ASGNI4
line 960
;960:	}
LABELV $724
line 965
;961:
;962:#ifdef MISSIONPACK
;963:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;964:#else
;965:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $745
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $741
LABELV $745
line 967
;966:#endif
;967:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $748
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+36
ADDRLP4 396
INDIRI4
ASGNI4
line 968
;968:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $751
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+40
ADDRLP4 400
INDIRI4
ASGNI4
line 969
;969:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $754
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+48
ADDRLP4 404
INDIRI4
ASGNI4
line 970
;970:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $758
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+48+4
ADDRLP4 408
INDIRI4
ASGNI4
line 971
;971:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $762
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+48+8
ADDRLP4 412
INDIRI4
ASGNI4
line 972
;972:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $765
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+60
ADDRLP4 416
INDIRI4
ASGNI4
line 973
;973:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $769
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+60+4
ADDRLP4 420
INDIRI4
ASGNI4
line 974
;974:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $773
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+60+8
ADDRLP4 424
INDIRI4
ASGNI4
line 987
;975:#ifdef MISSIONPACK
;976:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
;977:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
;978:
;979:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
;980:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
;981:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
;982:
;983:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
;984:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
;985:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
;986:#endif
;987:	}
LABELV $741
line 1016
;988:
;989:#ifdef MISSIONPACK
;990:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;991:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
;992:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
;993:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
;994:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
;995:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
;996:	}
;997:
;998:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;999:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
;1000:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
;1001:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
;1002:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
;1003:	}
;1004:
;1005:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1006:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
;1007:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
;1008:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
;1009:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
;1010:	}
;1011:
;1012:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
;1013:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
;1014:#endif
;1015:
;1016:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $778
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $774
LABELV $778
line 1017
;1017:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
ADDRGP4 $781
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+200
ADDRLP4 396
INDIRI4
ASGNI4
line 1018
;1018:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $784
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+404
ADDRLP4 400
INDIRI4
ASGNI4
line 1019
;1019:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $787
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+128
ADDRLP4 404
INDIRI4
ASGNI4
line 1023
;1020:#ifdef MISSIONPACK
;1021:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
;1022:#endif
;1023:	}
LABELV $774
line 1025
;1024:
;1025:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $790
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+120
ADDRLP4 396
INDIRI4
ASGNI4
line 1026
;1026:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $793
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+124
ADDRLP4 400
INDIRI4
ASGNI4
line 1028
;1027:
;1028:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $796
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+180
ADDRLP4 404
INDIRI4
ASGNI4
line 1029
;1029:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $799
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+184
ADDRLP4 408
INDIRI4
ASGNI4
line 1031
;1030:
;1031:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $802
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+136
ADDRLP4 412
INDIRI4
ASGNI4
line 1032
;1032:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $805
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+140
ADDRLP4 416
INDIRI4
ASGNI4
line 1033
;1033:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $808
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+144
ADDRLP4 420
INDIRI4
ASGNI4
line 1034
;1034:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $811
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+148
ADDRLP4 424
INDIRI4
ASGNI4
line 1035
;1035:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $814
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+152
ADDRLP4 428
INDIRI4
ASGNI4
line 1036
;1036:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $817
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+156
ADDRLP4 432
INDIRI4
ASGNI4
line 1037
;1037:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $820
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+160
ADDRLP4 436
INDIRI4
ASGNI4
line 1038
;1038:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $823
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+164
ADDRLP4 440
INDIRI4
ASGNI4
line 1039
;1039:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $826
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+168
ADDRLP4 444
INDIRI4
ASGNI4
line 1040
;1040:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $829
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+172
ADDRLP4 448
INDIRI4
ASGNI4
line 1042
;1041:
;1042:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $799
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+176
ADDRLP4 452
INDIRI4
ASGNI4
line 1044
;1043:
;1044:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $834
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+204
ADDRLP4 456
INDIRI4
ASGNI4
line 1046
;1045:
;1046:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $837
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+480
ADDRLP4 460
INDIRI4
ASGNI4
line 1048
;1047:
;1048:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $840
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+440
ADDRLP4 464
INDIRI4
ASGNI4
line 1049
;1049:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $843
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+444
ADDRLP4 468
INDIRI4
ASGNI4
line 1050
;1050:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $846
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+448
ADDRLP4 472
INDIRI4
ASGNI4
line 1054
;1051:#ifdef MISSIONPACK
;1052:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/powerups/pop.md3" );
;1053:#else
;1054:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
ADDRGP4 $849
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+492
ADDRLP4 476
INDIRI4
ASGNI4
line 1055
;1055:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
ADDRGP4 $852
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+496
ADDRLP4 480
INDIRI4
ASGNI4
line 1073
;1056:#endif
;1057:#ifdef MISSIONPACK
;1058:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
;1059:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
;1060:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
;1061:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
;1062:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
;1063:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
;1064:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
;1065:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
;1066:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
;1067:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
;1068:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
;1069:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
;1070:
;1071:#endif
;1072:
;1073:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
ADDRGP4 $855
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+152852+500
ADDRLP4 484
INDIRI4
ASGNI4
line 1074
;1074:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $858
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+524
ADDRLP4 488
INDIRI4
ASGNI4
line 1075
;1075:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $861
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+528
ADDRLP4 492
INDIRI4
ASGNI4
line 1076
;1076:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $864
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+532
ADDRLP4 496
INDIRI4
ASGNI4
line 1077
;1077:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $867
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+536
ADDRLP4 500
INDIRI4
ASGNI4
line 1078
;1078:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $870
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+540
ADDRLP4 504
INDIRI4
ASGNI4
line 1079
;1079:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $873
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+544
ADDRLP4 508
INDIRI4
ASGNI4
line 1082
;1080:
;1081:
;1082:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1083
;1083:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1086
;1084:
;1085:	// only register the items that the server says we need
;1086:	strcpy( items, CG_ConfigString( CS_ITEMS) );
CNSTI4 27
ARGI4
ADDRLP4 512
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 512
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1088
;1087:
;1088:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $874
line 1089
;1089:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $881
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $878
LABELV $881
line 1090
;1090:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1091
;1091:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1092
;1092:		}
LABELV $878
line 1093
;1093:	}
LABELV $875
line 1088
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $877
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $874
line 1096
;1094:
;1095:	// wall marks
;1096:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $884
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+384
ADDRLP4 516
INDIRI4
ASGNI4
line 1097
;1097:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $887
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+388
ADDRLP4 520
INDIRI4
ASGNI4
line 1098
;1098:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $890
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+392
ADDRLP4 524
INDIRI4
ASGNI4
line 1099
;1099:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $893
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+396
ADDRLP4 528
INDIRI4
ASGNI4
line 1100
;1100:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $896
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+352
ADDRLP4 532
INDIRI4
ASGNI4
line 1101
;1101:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $899
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+376
ADDRLP4 536
INDIRI4
ASGNI4
line 1102
;1102:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $902
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+380
ADDRLP4 540
INDIRI4
ASGNI4
line 1105
;1103:
;1104:	// Shafe - Trep - Radar
;1105:	cgs.media.scannerShader = trap_R_RegisterShader("Scanner");
ADDRGP4 $905
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1048
ADDRLP4 544
INDIRI4
ASGNI4
line 1106
;1106:    cgs.media.scannerBlipShader = trap_R_RegisterShader("ScannerBlip");
ADDRGP4 $908
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1052
ADDRLP4 548
INDIRI4
ASGNI4
line 1107
;1107:    cgs.media.scannerBlipUpShader = trap_R_RegisterShader("ScannerBlipUp");
ADDRGP4 $911
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1056
ADDRLP4 552
INDIRI4
ASGNI4
line 1108
;1108:    cgs.media.scannerBlipDownShader = trap_R_RegisterShader("ScannerBlipDown");
ADDRGP4 $914
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+1060
ADDRLP4 556
INDIRI4
ASGNI4
line 1112
;1109:	// Shafe - Trep - End Radar
;1110:
;1111:	// register the inline models
;1112:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 560
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36872
ADDRLP4 560
INDIRI4
ASGNI4
line 1113
;1113:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $919
JUMPV
LABELV $916
line 1118
;1114:		char	name[10];
;1115:		vec3_t			mins, maxs;
;1116:		int				j;
;1117:
;1118:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 592
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $921
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1119
;1119:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 592
ARGP4
ADDRLP4 604
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
ADDRLP4 604
INDIRI4
ASGNI4
line 1120
;1120:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
INDIRI4
ARGI4
ADDRLP4 568
ARGP4
ADDRLP4 580
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1121
;1121:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 564
CNSTI4 0
ASGNI4
LABELV $924
line 1122
;1122:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 608
ADDRLP4 564
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 612
ADDRLP4 608
INDIRI4
ADDRLP4 568
ADDP4
INDIRF4
ASGNF4
ADDRLP4 608
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+37900
ADDP4
ADDP4
ADDRLP4 612
INDIRF4
CNSTF4 1056964608
ADDRLP4 608
INDIRI4
ADDRLP4 580
ADDP4
INDIRF4
ADDRLP4 612
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1123
;1123:		}
LABELV $925
line 1121
ADDRLP4 564
ADDRLP4 564
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 564
INDIRI4
CNSTI4 3
LTI4 $924
line 1124
;1124:	}
LABELV $917
line 1113
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $919
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36872
INDIRI4
LTI4 $916
line 1127
;1125:
;1126:	// register all the server specified models
;1127:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $929
line 1130
;1128:		const char		*modelName;
;1129:
;1130:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 568
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 564
ADDRLP4 568
INDIRP4
ASGNP4
line 1131
;1131:		if ( !modelName[0] ) {
ADDRLP4 564
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $933
line 1132
;1132:			break;
ADDRGP4 $931
JUMPV
LABELV $933
line 1134
;1133:		}
;1134:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 564
INDIRP4
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
ADDRLP4 572
INDIRI4
ASGNI4
line 1135
;1135:	}
LABELV $930
line 1127
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $929
LABELV $931
line 1163
;1136:
;1137:#ifdef MISSIONPACK
;1138:	// new stuff
;1139:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
;1140:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
;1141:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
;1142:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
;1143:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
;1144:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
;1145:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
;1146:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
;1147:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
;1148:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
;1149:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
;1150:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
;1151:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
;1152:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
;1153:
;1154:	trap_R_RegisterModel( "models/players/james/lower.md3" );
;1155:	trap_R_RegisterModel( "models/players/james/upper.md3" );
;1156:	trap_R_RegisterModel( "models/players/heads/james/james.md3" );
;1157:
;1158:	trap_R_RegisterModel( "models/players/janet/lower.md3" );
;1159:	trap_R_RegisterModel( "models/players/janet/upper.md3" );
;1160:	trap_R_RegisterModel( "models/players/heads/janet/janet.md3" );
;1161:
;1162:#endif
;1163:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1176
;1164:/*
;1165:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1166:	{
;1167:		{
;1168:			int rval;
;1169:
;1170:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1171:			if (!rval)
;1172:				break;
;1173:		}
;1174:	}
;1175:*/
;1176:}
LABELV $590
endproc CG_RegisterGraphics 616 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1186
;1177:
;1178:
;1179:
;1180:/*																																			
;1181:=======================
;1182:CG_BuildSpectatorString
;1183:
;1184:=======================
;1185:*/
;1186:void CG_BuildSpectatorString() {
line 1188
;1187:	int i;
;1188:	cg.spectatorList[0] = 0;
ADDRGP4 cg+114376
CNSTI1 0
ASGNI1
line 1189
;1189:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $938
line 1190
;1190:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 4
CNSTI4 1716
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $942
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $942
line 1191
;1191:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $949
ARGP4
CNSTI4 1716
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+114376
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1192
;1192:		}
LABELV $942
line 1193
;1193:	}
LABELV $939
line 1189
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $938
line 1194
;1194:	i = strlen(cg.spectatorList);
ADDRGP4 cg+114376
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1195
;1195:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+115400
INDIRI4
EQI4 $953
line 1196
;1196:		cg.spectatorLen = i;
ADDRGP4 cg+115400
ADDRLP4 0
INDIRI4
ASGNI4
line 1197
;1197:		cg.spectatorWidth = -1;
ADDRGP4 cg+115404
CNSTF4 3212836864
ASGNF4
line 1198
;1198:	}
LABELV $953
line 1199
;1199:}
LABELV $936
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1207
;1200:
;1201:
;1202:/*																																			
;1203:===================
;1204:CG_RegisterClients
;1205:===================
;1206:*/
;1207:static void CG_RegisterClients( void ) {
line 1210
;1208:	int		i;
;1209:
;1210:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1211
;1211:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1213
;1212:
;1213:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $961
line 1216
;1214:		const char		*clientInfo;
;1215:
;1216:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $965
line 1217
;1217:			continue;
ADDRGP4 $962
JUMPV
LABELV $965
line 1220
;1218:		}
;1219:
;1220:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1221
;1221:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $968
line 1222
;1222:			continue;
ADDRGP4 $962
JUMPV
LABELV $968
line 1224
;1223:		}
;1224:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1225
;1225:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1226
;1226:	}
LABELV $962
line 1213
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $961
line 1227
;1227:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1228
;1228:}
LABELV $958
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1237
;1229:
;1230://===========================================================================
;1231:
;1232:/*
;1233:=================
;1234:CG_ConfigString
;1235:=================
;1236:*/
;1237:const char *CG_ConfigString( int index ) {
line 1238
;1238:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $973
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $971
LABELV $973
line 1239
;1239:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $974
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1240
;1240:	}
LABELV $971
line 1241
;1241:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $970
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1252
;1242:}
;1243:
;1244://==================================================================
;1245:
;1246:/*
;1247:======================
;1248:CG_StartMusic
;1249:
;1250:======================
;1251:*/
;1252:void CG_StartMusic( void ) {
line 1257
;1253:	char	*s;
;1254:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1255:
;1256:	// start the background music
;1257:	s = (char *)CG_ConfigString( CS_MUSIC );
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1258
;1258:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1259
;1259:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1261
;1260:
;1261:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1262
;1262:}
LABELV $976
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 44 12
line 1928
;1263:#ifdef MISSIONPACK
;1264:char *CG_GetMenuBuffer(const char *filename) {
;1265:	int	len;
;1266:	fileHandle_t	f;
;1267:	static char buf[MAX_MENUFILE];
;1268:
;1269:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;1270:	if ( !f ) {
;1271:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
;1272:		return NULL;
;1273:	}
;1274:	if ( len >= MAX_MENUFILE ) {
;1275:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
;1276:		trap_FS_FCloseFile( f );
;1277:		return NULL;
;1278:	}
;1279:
;1280:	trap_FS_Read( buf, len, f );
;1281:	buf[len] = 0;
;1282:	trap_FS_FCloseFile( f );
;1283:
;1284:	return buf;
;1285:}
;1286:
;1287://
;1288:// ==============================
;1289:// new hud stuff ( mission pack )
;1290:// ==============================
;1291://
;1292:qboolean CG_Asset_Parse(int handle) {
;1293:	pc_token_t token;
;1294:	const char *tempStr;
;1295:
;1296:	if (!trap_PC_ReadToken(handle, &token))
;1297:		return qfalse;
;1298:	if (Q_stricmp(token.string, "{") != 0) {
;1299:		return qfalse;
;1300:	}
;1301:    
;1302:	while ( 1 ) {
;1303:		if (!trap_PC_ReadToken(handle, &token))
;1304:			return qfalse;
;1305:
;1306:		if (Q_stricmp(token.string, "}") == 0) {
;1307:			return qtrue;
;1308:		}
;1309:
;1310:		// font
;1311:		if (Q_stricmp(token.string, "font") == 0) {
;1312:			int pointSize;
;1313:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1314:				return qfalse;
;1315:			}
;1316:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1317:			continue;
;1318:		}
;1319:
;1320:		// smallFont
;1321:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1322:			int pointSize;
;1323:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1324:				return qfalse;
;1325:			}
;1326:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1327:			continue;
;1328:		}
;1329:
;1330:		// font
;1331:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1332:			int pointSize;
;1333:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1334:				return qfalse;
;1335:			}
;1336:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1337:			continue;
;1338:		}
;1339:
;1340:		// gradientbar
;1341:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1342:			if (!PC_String_Parse(handle, &tempStr)) {
;1343:				return qfalse;
;1344:			}
;1345:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1346:			continue;
;1347:		}
;1348:
;1349:		// enterMenuSound
;1350:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1351:			if (!PC_String_Parse(handle, &tempStr)) {
;1352:				return qfalse;
;1353:			}
;1354:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
;1355:			continue;
;1356:		}
;1357:
;1358:		// exitMenuSound
;1359:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1360:			if (!PC_String_Parse(handle, &tempStr)) {
;1361:				return qfalse;
;1362:			}
;1363:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
;1364:			continue;
;1365:		}
;1366:
;1367:		// itemFocusSound
;1368:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1369:			if (!PC_String_Parse(handle, &tempStr)) {
;1370:				return qfalse;
;1371:			}
;1372:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
;1373:			continue;
;1374:		}
;1375:
;1376:		// menuBuzzSound
;1377:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1378:			if (!PC_String_Parse(handle, &tempStr)) {
;1379:				return qfalse;
;1380:			}
;1381:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
;1382:			continue;
;1383:		}
;1384:
;1385:		if (Q_stricmp(token.string, "cursor") == 0) {
;1386:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1387:				return qfalse;
;1388:			}
;1389:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
;1390:			continue;
;1391:		}
;1392:
;1393:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1394:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1395:				return qfalse;
;1396:			}
;1397:			continue;
;1398:		}
;1399:
;1400:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1401:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1402:				return qfalse;
;1403:			}
;1404:			continue;
;1405:		}
;1406:
;1407:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1408:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1409:				return qfalse;
;1410:			}
;1411:			continue;
;1412:		}
;1413:
;1414:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1415:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1416:				return qfalse;
;1417:			}
;1418:			continue;
;1419:		}
;1420:
;1421:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1422:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1423:				return qfalse;
;1424:			}
;1425:			continue;
;1426:		}
;1427:
;1428:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1429:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1430:				return qfalse;
;1431:			}
;1432:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1433:			continue;
;1434:		}
;1435:	}
;1436:	return qfalse; // bk001204 - why not?
;1437:}
;1438:
;1439:void CG_ParseMenu(const char *menuFile) {
;1440:	pc_token_t token;
;1441:	int handle;
;1442:
;1443:	handle = trap_PC_LoadSource(menuFile);
;1444:	if (!handle)
;1445:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1446:	if (!handle)
;1447:		return;
;1448:
;1449:	while ( 1 ) {
;1450:		if (!trap_PC_ReadToken( handle, &token )) {
;1451:			break;
;1452:		}
;1453:
;1454:		//if ( Q_stricmp( token, "{" ) ) {
;1455:		//	Com_Printf( "Missing { in menu file\n" );
;1456:		//	break;
;1457:		//}
;1458:
;1459:		//if ( menuCount == MAX_MENUS ) {
;1460:		//	Com_Printf( "Too many menus!\n" );
;1461:		//	break;
;1462:		//}
;1463:
;1464:		if ( token.string[0] == '}' ) {
;1465:			break;
;1466:		}
;1467:
;1468:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1469:			if (CG_Asset_Parse(handle)) {
;1470:				continue;
;1471:			} else {
;1472:				break;
;1473:			}
;1474:		}
;1475:
;1476:
;1477:		if (Q_stricmp(token.string, "menudef") == 0) {
;1478:			// start a new menu
;1479:			Menu_New(handle);
;1480:		}
;1481:	}
;1482:	trap_PC_FreeSource(handle);
;1483:}
;1484:
;1485:qboolean CG_Load_Menu(char **p) {
;1486:	char *token;
;1487:
;1488:	token = COM_ParseExt(p, qtrue);
;1489:
;1490:	if (token[0] != '{') {
;1491:		return qfalse;
;1492:	}
;1493:
;1494:	while ( 1 ) {
;1495:
;1496:		token = COM_ParseExt(p, qtrue);
;1497:    
;1498:		if (Q_stricmp(token, "}") == 0) {
;1499:			return qtrue;
;1500:		}
;1501:
;1502:		if ( !token || token[0] == 0 ) {
;1503:			return qfalse;
;1504:		}
;1505:
;1506:		CG_ParseMenu(token); 
;1507:	}
;1508:	return qfalse;
;1509:}
;1510:
;1511:
;1512:
;1513:void CG_LoadMenus(const char *menuFile) {
;1514:	char	*token;
;1515:	char *p;
;1516:	int	len, start;
;1517:	fileHandle_t	f;
;1518:	static char buf[MAX_MENUDEFFILE];
;1519:
;1520:	start = trap_Milliseconds();
;1521:
;1522:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
;1523:	if ( !f ) {
;1524:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
;1525:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
;1526:		if (!f) {
;1527:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
;1528:		}
;1529:	}
;1530:
;1531:	if ( len >= MAX_MENUDEFFILE ) {
;1532:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
;1533:		trap_FS_FCloseFile( f );
;1534:		return;
;1535:	}
;1536:
;1537:	trap_FS_Read( buf, len, f );
;1538:	buf[len] = 0;
;1539:	trap_FS_FCloseFile( f );
;1540:	
;1541:	COM_Compress(buf);
;1542:
;1543:	Menu_Reset();
;1544:
;1545:	p = buf;
;1546:
;1547:	while ( 1 ) {
;1548:		token = COM_ParseExt( &p, qtrue );
;1549:		if( !token || token[0] == 0 || token[0] == '}') {
;1550:			break;
;1551:		}
;1552:
;1553:		//if ( Q_stricmp( token, "{" ) ) {
;1554:		//	Com_Printf( "Missing { in menu file\n" );
;1555:		//	break;
;1556:		//}
;1557:
;1558:		//if ( menuCount == MAX_MENUS ) {
;1559:		//	Com_Printf( "Too many menus!\n" );
;1560:		//	break;
;1561:		//}
;1562:
;1563:		if ( Q_stricmp( token, "}" ) == 0 ) {
;1564:			break;
;1565:		}
;1566:
;1567:		if (Q_stricmp(token, "loadmenu") == 0) {
;1568:			if (CG_Load_Menu(&p)) {
;1569:				continue;
;1570:			} else {
;1571:				break;
;1572:			}
;1573:		}
;1574:	}
;1575:
;1576:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1577:
;1578:}
;1579:
;1580:
;1581:
;1582:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
;1583:	return qfalse;
;1584:}
;1585:
;1586:
;1587:static int CG_FeederCount(float feederID) {
;1588:	int i, count;
;1589:	count = 0;
;1590:	if (feederID == FEEDER_REDTEAM_LIST) {
;1591:		for (i = 0; i < cg.numScores; i++) {
;1592:			if (cg.scores[i].team == TEAM_RED) {
;1593:				count++;
;1594:			}
;1595:		}
;1596:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1597:		for (i = 0; i < cg.numScores; i++) {
;1598:			if (cg.scores[i].team == TEAM_BLUE) {
;1599:				count++;
;1600:			}
;1601:		}
;1602:	} else if (feederID == FEEDER_SCOREBOARD) {
;1603:		return cg.numScores;
;1604:	}
;1605:	return count;
;1606:}
;1607:
;1608:
;1609:void CG_SetScoreSelection(void *p) {
;1610:	menuDef_t *menu = (menuDef_t*)p;
;1611:	playerState_t *ps = &cg.snap->ps;
;1612:	int i, red, blue;
;1613:	red = blue = 0;
;1614:	for (i = 0; i < cg.numScores; i++) {
;1615:		if (cg.scores[i].team == TEAM_RED) {
;1616:			red++;
;1617:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1618:			blue++;
;1619:		}
;1620:		if (ps->clientNum == cg.scores[i].client) {
;1621:			cg.selectedScore = i;
;1622:		}
;1623:	}
;1624:
;1625:	if (menu == NULL) {
;1626:		// just interested in setting the selected score
;1627:		return;
;1628:	}
;1629:
;1630:	if ( cgs.gametype >= GT_TEAM ) {
;1631:		int feeder = FEEDER_REDTEAM_LIST;
;1632:		i = red;
;1633:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1634:			feeder = FEEDER_BLUETEAM_LIST;
;1635:			i = blue;
;1636:		}
;1637:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1638:	} else {
;1639:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1640:	}
;1641:}
;1642:
;1643:// FIXME: might need to cache this info
;1644:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
;1645:	int i, count;
;1646:	if ( cgs.gametype >= GT_TEAM ) {
;1647:		count = 0;
;1648:		for (i = 0; i < cg.numScores; i++) {
;1649:			if (cg.scores[i].team == team) {
;1650:				if (count == index) {
;1651:					*scoreIndex = i;
;1652:					return &cgs.clientinfo[cg.scores[i].client];
;1653:				}
;1654:				count++;
;1655:			}
;1656:		}
;1657:	}
;1658:	*scoreIndex = index;
;1659:	return &cgs.clientinfo[ cg.scores[index].client ];
;1660:}
;1661:
;1662:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
;1663:	gitem_t *item;
;1664:	int scoreIndex = 0;
;1665:	clientInfo_t *info = NULL;
;1666:	int team = -1;
;1667:	score_t *sp = NULL;
;1668:
;1669:	*handle = -1;
;1670:
;1671:	if (feederID == FEEDER_REDTEAM_LIST) {
;1672:		team = TEAM_RED;
;1673:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1674:		team = TEAM_BLUE;
;1675:	}
;1676:
;1677:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1678:	sp = &cg.scores[scoreIndex];
;1679:
;1680:	if (info && info->infoValid) {
;1681:		switch (column) {
;1682:			case 0:
;1683:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;1684:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1685:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1686:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
;1687:					item = BG_FindItemForPowerup( PW_REDFLAG );
;1688:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1689:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
;1690:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1691:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1692:				} else {
;1693:					if ( info->botSkill > 0 && info->botSkill <= 5 ) {
;1694:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
;1695:					} else if ( info->handicap < 100 ) {
;1696:					return va("%i", info->handicap );
;1697:					}
;1698:				}
;1699:			break;
;1700:			case 1:
;1701:				if (team == -1) {
;1702:					return "";
;1703:				} else {
;1704:					*handle = CG_StatusHandle(info->teamTask);
;1705:				}
;1706:		  break;
;1707:			case 2:
;1708:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
;1709:					return "Ready";
;1710:				}
;1711:				if (team == -1) {
;1712:					if (cgs.gametype == GT_TOURNAMENT) {
;1713:						return va("%i/%i", info->wins, info->losses);
;1714:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
;1715:						return "Spectator";
;1716:					} else {
;1717:						return "";
;1718:					}
;1719:				} else {
;1720:					if (info->teamLeader) {
;1721:						return "Leader";
;1722:					}
;1723:				}
;1724:			break;
;1725:			case 3:
;1726:				return info->name;
;1727:			break;
;1728:			case 4:
;1729:				return va("%i", info->score);
;1730:			break;
;1731:			case 5:
;1732:				return va("%4i", sp->time);
;1733:			break;
;1734:			case 6:
;1735:				if ( sp->ping == -1 ) {
;1736:					return "connecting";
;1737:				} 
;1738:				return va("%4i", sp->ping);
;1739:			break;
;1740:		}
;1741:	}
;1742:
;1743:	return "";
;1744:}
;1745:
;1746:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1747:	return 0;
;1748:}
;1749:
;1750:static void CG_FeederSelection(float feederID, int index) {
;1751:	if ( cgs.gametype >= GT_TEAM ) {
;1752:		int i, count;
;1753:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1754:		count = 0;
;1755:		for (i = 0; i < cg.numScores; i++) {
;1756:			if (cg.scores[i].team == team) {
;1757:				if (index == count) {
;1758:					cg.selectedScore = i;
;1759:				}
;1760:				count++;
;1761:			}
;1762:		}
;1763:	} else {
;1764:		cg.selectedScore = index;
;1765:	}
;1766:}
;1767:#endif
;1768:
;1769:#ifdef MISSIONPACK // bk001204 - only needed there
;1770:static float CG_Cvar_Get(const char *cvar) {
;1771:	char buff[128];
;1772:	memset(buff, 0, sizeof(buff));
;1773:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
;1774:	return atof(buff);
;1775:}
;1776:#endif
;1777:
;1778:#ifdef MISSIONPACK
;1779:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
;1780:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1781:}
;1782:
;1783:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1784:	switch (ownerDraw) {
;1785:	  case CG_GAME_TYPE:
;1786:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1787:	  case CG_GAME_STATUS:
;1788:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1789:			break;
;1790:	  case CG_KILLER:
;1791:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1792:			break;
;1793:	  case CG_RED_NAME:
;1794:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1795:			break;
;1796:	  case CG_BLUE_NAME:
;1797:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1798:			break;
;1799:
;1800:
;1801:	}
;1802:	return 0;
;1803:}
;1804:
;1805:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
;1806:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1807:}
;1808:
;1809:static void CG_StopCinematic(int handle) {
;1810:  trap_CIN_StopCinematic(handle);
;1811:}
;1812:
;1813:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1814:  trap_CIN_SetExtents(handle, x, y, w, h);
;1815:  trap_CIN_DrawCinematic(handle);
;1816:}
;1817:
;1818:static void CG_RunCinematicFrame(int handle) {
;1819:  trap_CIN_RunCinematic(handle);
;1820:}
;1821:
;1822:/*
;1823:=================
;1824:CG_LoadHudMenu();
;1825:
;1826:=================
;1827:*/
;1828:void CG_LoadHudMenu() {
;1829:	char buff[1024];
;1830:	const char *hudSet;
;1831:
;1832:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1833:	cgDC.setColor = &trap_R_SetColor;
;1834:	cgDC.drawHandlePic = &CG_DrawPic;
;1835:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
;1836:	cgDC.drawText = &CG_Text_Paint;
;1837:	cgDC.textWidth = &CG_Text_Width;
;1838:	cgDC.textHeight = &CG_Text_Height;
;1839:	cgDC.registerModel = &trap_R_RegisterModel;
;1840:	cgDC.modelBounds = &trap_R_ModelBounds;
;1841:	cgDC.fillRect = &CG_FillRect;
;1842:	cgDC.drawRect = &CG_DrawRect;   
;1843:	cgDC.drawSides = &CG_DrawSides;
;1844:	cgDC.drawTopBottom = &CG_DrawTopBottom;
;1845:	cgDC.clearScene = &trap_R_ClearScene;
;1846:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;1847:	cgDC.renderScene = &trap_R_RenderScene;
;1848:	cgDC.registerFont = &trap_R_RegisterFont;
;1849:	cgDC.ownerDrawItem = &CG_OwnerDraw;
;1850:	cgDC.getValue = &CG_GetValue;
;1851:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
;1852:	cgDC.runScript = &CG_RunMenuScript;
;1853:	cgDC.getTeamColor = &CG_GetTeamColor;
;1854:	cgDC.setCVar = trap_Cvar_Set;
;1855:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
;1856:	cgDC.getCVarValue = CG_Cvar_Get;
;1857:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
;1858:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;1859:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;1860:	cgDC.startLocalSound = &trap_S_StartLocalSound;
;1861:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;1862:	cgDC.feederCount = &CG_FeederCount;
;1863:	cgDC.feederItemImage = &CG_FeederItemImage;
;1864:	cgDC.feederItemText = &CG_FeederItemText;
;1865:	cgDC.feederSelection = &CG_FeederSelection;
;1866:	//cgDC.setBinding = &trap_Key_SetBinding;
;1867:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;1868:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;1869:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;1870:	cgDC.Error = &Com_Error; 
;1871:	cgDC.Print = &Com_Printf; 
;1872:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;1873:	//cgDC.Pause = &CG_Pause;
;1874:	cgDC.registerSound = &trap_S_RegisterSound;
;1875:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;1876:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
;1877:	cgDC.playCinematic = &CG_PlayCinematic;
;1878:	cgDC.stopCinematic = &CG_StopCinematic;
;1879:	cgDC.drawCinematic = &CG_DrawCinematic;
;1880:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
;1881:	
;1882:	Init_Display(&cgDC);
;1883:
;1884:	Menu_Reset();
;1885:	
;1886:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;1887:	hudSet = buff;
;1888:	if (hudSet[0] == '\0') {
;1889:		hudSet = "ui/hud.txt";
;1890:	}
;1891:
;1892:	CG_LoadMenus(hudSet);
;1893:}
;1894:
;1895:void CG_AssetCache() {
;1896:	//if (Assets.textFont == NULL) {
;1897:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;1898:	//}
;1899:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;1900:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;1901:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
;1902:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
;1903:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
;1904:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
;1905:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
;1906:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
;1907:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
;1908:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
;1909:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
;1910:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
;1911:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
;1912:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
;1913:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
;1914:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
;1915:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
;1916:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
;1917:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
;1918:}
;1919:#endif
;1920:/*
;1921:=================
;1922:CG_Init
;1923:
;1924:Called after every level change or subsystem restart
;1925:Will perform callbacks to make the loading info screen update.
;1926:=================
;1927:*/
;1928:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 1932
;1929:	const char	*s;
;1930:
;1931:	// clear everything
;1932:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 153936
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1933
;1933:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 155920
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1934
;1934:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 749568
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1935
;1935:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1936
;1936:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1938
;1937:
;1938:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1940
;1939:
;1940:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31448
ADDRFP4 0
INDIRI4
ASGNI4
line 1941
;1941:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31444
ADDRFP4 4
INDIRI4
ASGNI4
line 1944
;1942:
;1943:	// load a few needed things before we do any screen updates
;1944:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $982
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852
ADDRLP4 4
INDIRI4
ASGNI4
line 1945
;1945:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $985
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+152852+16
ADDRLP4 8
INDIRI4
ASGNI4
line 1946
;1946:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $988
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+4
ADDRLP4 12
INDIRI4
ASGNI4
line 1947
;1947:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $991
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+8
ADDRLP4 16
INDIRI4
ASGNI4
line 1948
;1948:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $994
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+152852+12
ADDRLP4 20
INDIRI4
ASGNI4
line 1950
;1949:
;1950:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1952
;1951:
;1952:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1954
;1953:
;1954:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+108948
CNSTI4 2
ASGNI4
line 1956
;1955:
;1956:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
ADDRLP4 24
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+34812
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 cgs+34808
ADDRLP4 24
INDIRI4
ASGNI4
line 1957
;1957:	cgs.flagStatus = -1;
ADDRGP4 cgs+34816
CNSTI4 -1
ASGNI4
line 1961
;1958:	// old servers
;1959:
;1960:	// get the rendering configuration from the client system
;1961:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1962
;1962:	cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+31432
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 1963
;1963:	cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+31436
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 1966
;1964:
;1965:	// get the gamestate from the client system
;1966:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 1969
;1967:
;1968:	// check version
;1969:	s = CG_ConfigString( CS_GAME_VERSION );
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1970
;1970:	if ( strcmp( s, GAME_VERSION ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1008
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1006
line 1971
;1971:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1009
ARGP4
ADDRGP4 $1008
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1972
;1972:	}
LABELV $1006
line 1974
;1973:
;1974:	s = CG_ConfigString( CS_LEVEL_START_TIME );
CNSTI4 21
ARGI4
ADDRLP4 36
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 1975
;1975:	cgs.levelStartTime = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+34796
ADDRLP4 40
INDIRI4
ASGNI4
line 1977
;1976:
;1977:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 1980
;1978:
;1979:	// load the new map
;1980:	CG_LoadingString( "collision map" );
ADDRGP4 $1011
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1982
;1981:
;1982:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 1988
;1983:
;1984:#ifdef MISSIONPACK
;1985:	String_Init();
;1986:#endif
;1987:
;1988:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 1990
;1989:
;1990:	CG_LoadingString( "sounds" );
ADDRGP4 $1014
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1992
;1991:
;1992:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 1994
;1993:
;1994:	CG_LoadingString( "graphics" );
ADDRGP4 $1015
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1996
;1995:
;1996:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 1998
;1997:
;1998:	CG_LoadingString( "clients" );
ADDRGP4 $1016
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2000
;1999:
;2000:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2008
;2001:
;2002:// Shafe - Trep Open TA Stuff Up
;2003:#ifdef MISSIONPACK
;2004:	CG_AssetCache();
;2005:	CG_LoadHudMenu();      // load new hud stuff
;2006:#endif
;2007:
;2008:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2010
;2009:
;2010:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2012
;2011:
;2012:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2015
;2013:
;2014:	// remove the last loading update
;2015:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+109448
CNSTI1 0
ASGNI1
line 2018
;2016:
;2017:	// Make sure we have update values (scores)
;2018:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 2020
;2019:
;2020:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2022
;2021:
;2022:	CG_LoadingString( "" );
ADDRGP4 $1019
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2029
;2023:
;2024:
;2025:#ifdef MISSIONPACK
;2026:	CG_InitTeamChat();
;2027:#endif
;2028:
;2029:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2031
;2030:
;2031:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2032
;2032:}
LABELV $977
endproc CG_Init 44 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2041
;2033:
;2034:/*
;2035:=================
;2036:CG_Shutdown
;2037:
;2038:Called before every level change or subsystem restart
;2039:=================
;2040:*/
;2041:void CG_Shutdown( void ) {
line 2044
;2042:	// some mods may need to do cleanup work here,
;2043:	// like closing files or archiving session data
;2044:}
LABELV $1020
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2058
;2045:
;2046:
;2047:/*
;2048:==================
;2049:CG_EventHandling
;2050:==================
;2051: type 0 - no event handling
;2052:      1 - team menu
;2053:      2 - hud editor
;2054:
;2055:*/
;2056:
;2057:#ifndef MISSIONPACK
;2058:void CG_EventHandling(int type) {
line 2059
;2059:}
LABELV $1021
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 0 0
line 2063
;2060:
;2061:
;2062:
;2063:void CG_KeyEvent(int key, qboolean down) {
line 2064
;2064:}
LABELV $1022
endproc CG_KeyEvent 0 0
export CG_MouseEvent
proc CG_MouseEvent 0 0
line 2066
;2065:
;2066:void CG_MouseEvent(int x, int y) {
line 2067
;2067:}
LABELV $1023
endproc CG_MouseEvent 0 0
bss
export cg_pmove_msec
align 4
LABELV cg_pmove_msec
skip 272
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
import CG_DrawScanner
import CG_ScannerOff_f
import CG_ScannerOn_f
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayerHeadshot
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon2
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_LoadMenus
import CG_Cvar_ClampInt
import CG_AddBoundingBox
import CG_PredictWeaponEffects
import cg_playerOrigins
export cg_plOut
align 4
LABELV cg_plOut
skip 272
export cg_latentCmds
align 4
LABELV cg_latentCmds
skip 272
export cg_latentSnaps
align 4
LABELV cg_latentSnaps
skip 272
export cl_timeNudge
align 4
LABELV cl_timeNudge
skip 272
export cg_optimizePrediction
align 4
LABELV cg_optimizePrediction
skip 272
export cg_projectileNudge
align 4
LABELV cg_projectileNudge
skip 272
export sv_fps
align 4
LABELV sv_fps
skip 272
export cg_cmdTimeNudge
align 4
LABELV cg_cmdTimeNudge
skip 272
export cg_drawBBox
align 4
LABELV cg_drawBBox
skip 272
export cg_debugDelag
align 4
LABELV cg_debugDelag
skip 272
export cg_delag
align 4
LABELV cg_delag
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_noVoiceText
align 4
LABELV cg_noVoiceText
skip 272
export cg_noVoiceChats
align 4
LABELV cg_noVoiceChats
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_forceModel
align 4
LABELV cg_forceModel
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_synchronousClients
align 4
LABELV cg_synchronousClients
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_stereoSeparation
align 4
LABELV cg_stereoSeparation
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairHealth
align 4
LABELV cg_crosshairHealth
skip 272
export cg_crosshairSize
align 4
LABELV cg_crosshairSize
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 6144
export cg_weapons
align 4
LABELV cg_weapons
skip 2176
export cg_entities
align 4
LABELV cg_entities
skip 749568
export cg
align 4
LABELV cg
skip 155920
export cgs
align 4
LABELV cgs
skip 153936
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
LABELV $1019
byte 1 0
align 1
LABELV $1016
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1015
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $1014
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1011
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1009
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1008
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 113
byte 1 51
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $994
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $991
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $988
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $985
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $982
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $974
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $949
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $921
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $914
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 66
byte 1 108
byte 1 105
byte 1 112
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $911
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 66
byte 1 108
byte 1 105
byte 1 112
byte 1 85
byte 1 112
byte 1 0
align 1
LABELV $908
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 66
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $905
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $902
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $899
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $896
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $893
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $890
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $887
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $884
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $873
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $870
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $867
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $864
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $861
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $858
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $855
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $852
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $849
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $846
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $843
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $840
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $837
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $834
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $829
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $826
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $823
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $820
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $817
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $814
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $811
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $808
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $805
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $802
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 98
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $799
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $796
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $793
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $790
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $787
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $784
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $781
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 101
byte 1 0
align 1
LABELV $773
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 51
byte 1 0
align 1
LABELV $769
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $765
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $762
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $758
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $754
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $751
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $748
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $740
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $737
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $734
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $731
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $723
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $720
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $717
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $714
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $711
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $708
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $705
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $702
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $699
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $696
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $689
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $686
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $683
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $680
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $677
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $674
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $671
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $668
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $665
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 50
byte 1 0
align 1
LABELV $662
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 50
byte 1 0
align 1
LABELV $659
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $656
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $653
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $650
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $647
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $644
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $641
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $638
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $635
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $632
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 53
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $628
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 52
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $624
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $620
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $616
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $607
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $602
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $601
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $600
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $599
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $598
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $597
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $596
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $595
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $594
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $593
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $592
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $589
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 104
byte 1 112
byte 1 108
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $586
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 104
byte 1 112
byte 1 108
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $583
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $580
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $577
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $574
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $571
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $568
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $565
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $562
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 98
byte 1 102
byte 1 103
byte 1 47
byte 1 100
byte 1 101
byte 1 118
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $559
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $556
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 102
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $553
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $550
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $547
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $544
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $541
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $538
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $519
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $515
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $511
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $507
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $503
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $499
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $496
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
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $491
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $488
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $485
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $482
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
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $479
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $476
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $473
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $470
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $467
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $464
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 105
byte 1 108
byte 1 105
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $461
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $458
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $455
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $452
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $449
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
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $446
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
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $443
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $440
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $437
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $434
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $431
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $428
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $425
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
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $422
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
byte 1 105
byte 1 98
byte 1 115
byte 1 112
byte 1 108
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $419
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $416
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $413
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $410
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $407
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $404
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $399
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 121
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $393
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $390
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $387
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $384
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $373
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $370
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $367
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $364
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $359
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $356
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $353
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $350
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $347
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $344
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $341
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $333
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $330
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $327
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $324
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $321
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $318
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 51
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $315
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 50
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $312
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $309
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $306
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 53
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $303
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $299
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $293
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $272
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $221
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $220
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $219
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $218
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $217
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $214
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $208
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $207
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $206
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 79
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 109
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 108
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $202
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $201
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $200
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $199
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 66
byte 1 66
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $194
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $192
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $191
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $190
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $189
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $188
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $187
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $186
byte 1 56
byte 1 0
align 1
LABELV $185
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
LABELV $184
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
LABELV $183
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $181
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $179
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $178
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $177
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $176
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $175
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $173
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
LABELV $172
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
LABELV $171
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $170
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
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $167
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $166
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $164
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $163
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $161
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $158
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $157
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $153
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $140
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $135
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $134
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $133
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $132
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $131
byte 1 51
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $126
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $113
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $112
byte 1 52
byte 1 0
align 1
LABELV $111
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $103
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $99
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 111
byte 1 83
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $97
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $96
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $94
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $93
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 0
align 1
LABELV $89
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $88
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
