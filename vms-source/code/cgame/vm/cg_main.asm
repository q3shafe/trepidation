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
proc CG_RegisterSounds 568 16
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
ADDRGP4 cgs+153876+796
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
ADDRGP4 cgs+153876+800
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
ADDRGP4 cgs+153876+804
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
ADDRGP4 cgs+153876+816
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
ADDRGP4 cgs+153876+812
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
ADDRGP4 cgs+153876+808
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
ADDRGP4 cgs+153876+1008
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
ADDRGP4 cgs+153876+1012
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
ADDRGP4 cgs+153876+1016
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
ADDRGP4 cgs+153876+1020
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
ADDRGP4 cgs+153876+1024
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
ADDRGP4 cgs+153876+920
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
ADDRGP4 cgs+153876+932
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
ADDRGP4 cgs+153876+936
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
ADDRGP4 cgs+153876+940
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
ADDRGP4 cgs+153876+832
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
ADDRGP4 cgs+153876+924
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
ADDRGP4 cgs+153876+928
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
ADDRGP4 cgs+153876+944
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
ADDRGP4 cgs+153876+948
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
ADDRGP4 cgs+153876+952
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
ADDRGP4 cgs+153876+956
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
ADDRGP4 cgs+153876+960
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
ADDRGP4 cgs+153876+964
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
ADDRGP4 cgs+153876+968
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
ADDRGP4 cgs+153876+972
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
ADDRGP4 cgs+153876+980
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
ADDRGP4 cgs+153876+988
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
ADDRGP4 cgs+153876+996
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
ADDRGP4 cgs+153876+1004
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
ADDRGP4 cgs+153876+976
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
ADDRGP4 cgs+153876+992
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
ADDRGP4 cgs+153876+984
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
ADDRGP4 cgs+153876+576
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
ADDRGP4 cgs+153876+580
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
ADDRGP4 cgs+153876+588
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
ADDRGP4 cgs+153876+584
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
ADDRGP4 cgs+153876+744
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
ADDRGP4 cgs+153876+748
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
ADDRGP4 cgs+153876+752
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
ADDRGP4 cgs+153876+756
ADDRLP4 404
INDIRI4
ASGNI4
line 673
;673:	cgs.media.glassSound = trap_S_RegisterSound( "sound/world/glassbreak.wav", qfalse );
ADDRGP4 $434
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+760
ADDRLP4 408
INDIRI4
ASGNI4
line 692
;674:
;675:#ifdef MISSIONPACK
;676:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.wav", qfalse );
;677:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.wav", qfalse );
;678:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.wav", qfalse );
;679:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.wav", qfalse );
;680:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.wav", qfalse );
;681:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.wav", qfalse );
;682:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.wav", qfalse );
;683:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.wav", qfalse );
;684:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.wav", qfalse );
;685:
;686:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
;687:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
;688:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
;689:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
;690:#endif
;691:
;692:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $437
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+764
ADDRLP4 412
INDIRI4
ASGNI4
line 693
;693:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $440
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+768
ADDRLP4 416
INDIRI4
ASGNI4
line 694
;694:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $443
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+776
ADDRLP4 420
INDIRI4
ASGNI4
line 696
;695:
;696:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $446
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+772
ADDRLP4 424
INDIRI4
ASGNI4
line 698
;697:
;698:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $449
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+780
ADDRLP4 428
INDIRI4
ASGNI4
line 699
;699:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $452
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+784
ADDRLP4 432
INDIRI4
ASGNI4
line 701
;700:
;701:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.wav", qfalse );
ADDRGP4 $455
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+820
ADDRLP4 436
INDIRI4
ASGNI4
line 707
;702:#ifdef MISSIONPACK
;703:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.wav", qfalse );
;704:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.wav", qfalse );
;705:#endif
;706:
;707:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $458
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+836
ADDRLP4 440
INDIRI4
ASGNI4
line 708
;708:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $461
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+840
ADDRLP4 444
INDIRI4
ASGNI4
line 709
;709:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $464
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+844
ADDRLP4 448
INDIRI4
ASGNI4
line 710
;710:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $467
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+848
ADDRLP4 452
INDIRI4
ASGNI4
line 711
;711:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $470
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+852
ADDRLP4 456
INDIRI4
ASGNI4
line 712
;712:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $473
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+856
ADDRLP4 460
INDIRI4
ASGNI4
line 719
;713:#ifdef MISSIONPACK
;714:	cgs.media.firstImpressiveSound = trap_S_RegisterSound( "sound/feedback/first_impressive.wav", qtrue );
;715:	cgs.media.firstExcellentSound = trap_S_RegisterSound( "sound/feedback/first_excellent.wav", qtrue );
;716:	cgs.media.firstHumiliationSound = trap_S_RegisterSound( "sound/feedback/first_gauntlet.wav", qtrue );
;717:#endif
;718:
;719:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $476
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+872
ADDRLP4 464
INDIRI4
ASGNI4
line 720
;720:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $479
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+876
ADDRLP4 468
INDIRI4
ASGNI4
line 721
;721:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $482
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+880
ADDRLP4 472
INDIRI4
ASGNI4
line 729
;722:
;723:#ifdef MISSIONPACK
;724:	cgs.media.voteNow = trap_S_RegisterSound( "sound/feedback/vote_now.wav", qtrue);
;725:	cgs.media.votePassed = trap_S_RegisterSound( "sound/feedback/vote_passed.wav", qtrue);
;726:	cgs.media.voteFailed = trap_S_RegisterSound( "sound/feedback/vote_failed.wav", qtrue);
;727:#endif
;728:
;729:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $485
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+896
ADDRLP4 476
INDIRI4
ASGNI4
line 730
;730:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $488
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+900
ADDRLP4 480
INDIRI4
ASGNI4
line 731
;731:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $491
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+904
ADDRLP4 484
INDIRI4
ASGNI4
line 733
;732:
;733:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $494
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+792
ADDRLP4 488
INDIRI4
ASGNI4
line 735
;734:
;735:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $495
line 736
;736:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
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
line 737
;737:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+153876+592
ADDP4
ADDRLP4 492
INDIRI4
ASGNI4
line 739
;738:
;739:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $502
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 740
;740:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+153876+592+16
ADDP4
ADDRLP4 496
INDIRI4
ASGNI4
line 742
;741:
;742:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $506
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 743
;743:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+153876+592+32
ADDP4
ADDRLP4 500
INDIRI4
ASGNI4
line 745
;744:
;745:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $510
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 746
;746:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+153876+592+48
ADDP4
ADDRLP4 504
INDIRI4
ASGNI4
line 748
;747:
;748:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $514
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 749
;749:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+153876+592+64
ADDP4
ADDRLP4 508
INDIRI4
ASGNI4
line 751
;750:
;751:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $518
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 752
;752:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+153876+592+96
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 754
;753:
;754:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $522
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 755
;755:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+153876+592+80
ADDP4
ADDRLP4 516
INDIRI4
ASGNI4
line 756
;756:	}
LABELV $496
line 735
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $495
line 759
;757:
;758:	// only register the items that the server says we need
;759:	strcpy( items, CG_ConfigString( CS_ITEMS ) );
CNSTI4 27
ARGI4
ADDRLP4 492
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 492
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 761
;760:
;761:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $529
JUMPV
LABELV $526
line 763
;762://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;763:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 765
;764://		}
;765:	}
LABELV $527
line 761
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $529
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $526
line 767
;766:
;767:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $530
line 768
;768:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 496
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 496
INDIRP4
ASGNP4
line 769
;769:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $534
line 770
;770:			break;
ADDRGP4 $532
JUMPV
LABELV $534
line 772
;771:		}
;772:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $536
line 773
;773:			continue;	// custom sound
ADDRGP4 $531
JUMPV
LABELV $536
line 775
;774:		}
;775:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
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
ADDRGP4 cgs+35848
ADDP4
ADDRLP4 500
INDIRI4
ASGNI4
line 776
;776:	}
LABELV $531
line 767
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $530
LABELV $532
line 779
;777:
;778:	// FIXME: only needed with item
;779:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.wav", qfalse );
ADDRGP4 $541
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+908
ADDRLP4 496
INDIRI4
ASGNI4
line 780
;780:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $544
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+912
ADDRLP4 500
INDIRI4
ASGNI4
line 781
;781:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $547
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+572
ADDRLP4 504
INDIRI4
ASGNI4
line 782
;782:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $550
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+716
ADDRLP4 508
INDIRI4
ASGNI4
line 783
;783:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $553
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+720
ADDRLP4 512
INDIRI4
ASGNI4
line 784
;784:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $556
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+724
ADDRLP4 516
INDIRI4
ASGNI4
line 785
;785:	cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
ADDRGP4 $559
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+728
ADDRLP4 520
INDIRI4
ASGNI4
line 786
;786:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $562
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+732
ADDRLP4 524
INDIRI4
ASGNI4
line 787
;787:	cgs.media.sfx_devexp = trap_S_RegisterSound ("sound/weapons/bfg/devhit.wav", qfalse);
ADDRGP4 $565
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+736
ADDRLP4 528
INDIRI4
ASGNI4
line 788
;788:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $568
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 532
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+740
ADDRLP4 532
INDIRI4
ASGNI4
line 789
;789:	cgs.media.flameBallShader = trap_R_RegisterShader( "sprites/flameball" );
ADDRGP4 $571
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+500
ADDRLP4 536
INDIRI4
ASGNI4
line 812
;790:#ifdef MISSIONPACK
;791:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
;792:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
;793:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
;794:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
;795:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
;796:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
;797:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
;798:	cgs.media.weaponHoverSound = trap_S_RegisterSound( "sound/weapons/weapon_hover.wav", qfalse );
;799:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.wav", qfalse );
;800:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.wav", qfalse );
;801:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.wav", qfalse );
;802:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.wav", qfalse );
;803:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.wav", qfalse );
;804:	cgs.media.youSuckSound = trap_S_RegisterSound( "sound/misc/yousuck.wav", qfalse );
;805:
;806:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;807:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;808:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;809:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;810:#endif
;811:
;812:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $574
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1040
ADDRLP4 540
INDIRI4
ASGNI4
line 813
;813:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $577
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1044
ADDRLP4 544
INDIRI4
ASGNI4
line 814
;814:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
ADDRGP4 $580
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 548
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1048
ADDRLP4 548
INDIRI4
ASGNI4
line 815
;815:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $583
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 552
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1052
ADDRLP4 552
INDIRI4
ASGNI4
line 816
;816:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $586
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 556
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1056
ADDRLP4 556
INDIRI4
ASGNI4
line 818
;817:
;818:	cgs.media.hplb1aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb1a.wav", qfalse);
ADDRGP4 $589
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 560
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1092
ADDRLP4 560
INDIRI4
ASGNI4
line 819
;819:	cgs.media.hplb2aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb2a.wav", qfalse);
ADDRGP4 $592
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 564
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1096
ADDRLP4 564
INDIRI4
ASGNI4
line 850
;820:
;821:
;822:#ifdef MISSIONPACK
;823:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse );
;824:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse );
;825:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse );
;826:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse );
;827:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse );
;828:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse );
;829:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse );
;830:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse );
;831:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse );
;832:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse );
;833:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse );
;834:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse );
;835:
;836:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse );
;837:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse );
;838:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse );
;839:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse );
;840:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse );
;841:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse );
;842:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse );
;843:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse );
;844:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse );
;845:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse );
;846:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse );
;847:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse );
;848:#endif
;849:
;850:}
LABELV $300
endproc CG_RegisterSounds 568 16
data
align 4
LABELV $594
address $595
address $596
address $597
address $598
address $599
address $600
address $601
address $602
address $603
address $604
address $605
code
proc CG_RegisterGraphics 640 16
line 863
;851:
;852:
;853://===================================================================================
;854:
;855:
;856:/*
;857:=================
;858:CG_RegisterGraphics
;859:
;860:This function may execute for a couple of minutes with a slow disk.
;861:=================
;862:*/
;863:static void CG_RegisterGraphics( void ) {
line 881
;864:	int			i;
;865:	char		items[MAX_ITEMS+1];
;866:	static char		*sb_nums[11] = {
;867:		"gfx/2d/numbers/zero_32b",
;868:		"gfx/2d/numbers/one_32b",
;869:		"gfx/2d/numbers/two_32b",
;870:		"gfx/2d/numbers/three_32b",
;871:		"gfx/2d/numbers/four_32b",
;872:		"gfx/2d/numbers/five_32b",
;873:		"gfx/2d/numbers/six_32b",
;874:		"gfx/2d/numbers/seven_32b",
;875:		"gfx/2d/numbers/eight_32b",
;876:		"gfx/2d/numbers/nine_32b",
;877:		"gfx/2d/numbers/minus_32b",
;878:	};
;879:
;880:	// clear any references to old media
;881:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+109048
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 882
;882:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 884
;883:
;884:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 886
;885:
;886:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 889
;887:
;888:	// precache status bar pics
;889:	CG_LoadingString( "game media" );
ADDRGP4 $610
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 891
;890:
;891:	for ( i=0 ; i<11 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $611
line 892
;892:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 $594
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 cgs+153876+320
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 893
;893:	}
LABELV $612
line 891
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $611
line 895
;894:
;895:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $619
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+368
ADDRLP4 264
INDIRI4
ASGNI4
line 896
;896:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $623
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+368+4
ADDRLP4 268
INDIRI4
ASGNI4
line 897
;897:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $627
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+368+8
ADDRLP4 272
INDIRI4
ASGNI4
line 898
;898:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $631
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+368+12
ADDRLP4 276
INDIRI4
ASGNI4
line 899
;899:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $635
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+368+16
ADDRLP4 280
INDIRI4
ASGNI4
line 901
;900:
;901:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $638
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+228
ADDRLP4 284
INDIRI4
ASGNI4
line 903
;902:
;903:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $641
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+132
ADDRLP4 288
INDIRI4
ASGNI4
line 905
;904:
;905:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $644
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+520
ADDRLP4 292
INDIRI4
ASGNI4
line 906
;906:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $647
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+524
ADDRLP4 296
INDIRI4
ASGNI4
line 907
;907:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $650
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+528
ADDRLP4 300
INDIRI4
ASGNI4
line 908
;908:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $653
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+536
ADDRLP4 304
INDIRI4
ASGNI4
line 909
;909:	cgs.media.scoreboardTrep = trap_R_RegisterShaderNoMip( "menu/tab/scoreboard.tga" ); // Shafe
ADDRGP4 $656
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+532
ADDRLP4 308
INDIRI4
ASGNI4
line 912
;910:
;911:	// Trepidation hud
;912:	cgs.media.HudLeft = trap_R_RegisterShaderNoMip( "gfx/2d/hud/hud_left.tga" );
ADDRGP4 $659
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+540
ADDRLP4 312
INDIRI4
ASGNI4
line 913
;913:	cgs.media.HudRight = trap_R_RegisterShaderNoMip( "gfx/2d/hud/hud_right.tga" );
ADDRGP4 $662
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+544
ADDRLP4 316
INDIRI4
ASGNI4
line 915
;914:
;915:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $665
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+288
ADDRLP4 320
INDIRI4
ASGNI4
line 916
;916:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $668
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+292
ADDRLP4 324
INDIRI4
ASGNI4
line 919
;917:
;918:	// Shafe - Singularity Cannon Shaders
;919:	cgs.media.smokePuffShader2 = trap_R_RegisterShader( "smokePuff2" );
ADDRGP4 $671
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+296
ADDRLP4 328
INDIRI4
ASGNI4
line 920
;920:	cgs.media.smokePuffRageProShader2 = trap_R_RegisterShader( "smokePuffRagePro2" );
ADDRGP4 $674
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+300
ADDRLP4 332
INDIRI4
ASGNI4
line 923
;921:	// End Shafe
;922:
;923:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $677
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+304
ADDRLP4 336
INDIRI4
ASGNI4
line 930
;924:
;925:
;926:#ifdef MISSIONPACK
;927:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
;928:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
;929:#endif
;930:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $680
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+308
ADDRLP4 340
INDIRI4
ASGNI4
line 931
;931:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $683
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+316
ADDRLP4 344
INDIRI4
ASGNI4
line 932
;932:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $686
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+276
ADDRLP4 348
INDIRI4
ASGNI4
line 933
;933:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $689
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+220
ADDRLP4 352
INDIRI4
ASGNI4
line 935
;934:
;935:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $692
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+312
ADDRLP4 356
INDIRI4
ASGNI4
line 937
;936:
;937:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $695
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+232
ADDRLP4 360
INDIRI4
ASGNI4
line 938
;938:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $698
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+224
ADDRLP4 364
INDIRI4
ASGNI4
line 940
;939:
;940:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $699
line 941
;941:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $705
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 372
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+153876+236
ADDP4
ADDRLP4 376
INDIRI4
ASGNI4
line 942
;942:	}
LABELV $700
line 940
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $699
line 944
;943:
;944:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $708
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+280
ADDRLP4 368
INDIRI4
ASGNI4
line 945
;945:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $711
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+284
ADDRLP4 372
INDIRI4
ASGNI4
line 948
;946:
;947:	// powerup shaders
;948:	cgs.media.buildShader = trap_R_RegisterShader("powerups/build" );
ADDRGP4 $714
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+420
ADDRLP4 376
INDIRI4
ASGNI4
line 949
;949:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $717
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+412
ADDRLP4 380
INDIRI4
ASGNI4
line 950
;950:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $720
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+424
ADDRLP4 384
INDIRI4
ASGNI4
line 951
;951:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $723
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+436
ADDRLP4 388
INDIRI4
ASGNI4
line 952
;952:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $726
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+440
ADDRLP4 392
INDIRI4
ASGNI4
line 953
;953:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $729
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+428
ADDRLP4 396
INDIRI4
ASGNI4
line 954
;954:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $732
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+432
ADDRLP4 400
INDIRI4
ASGNI4
line 955
;955:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $735
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+444
ADDRLP4 404
INDIRI4
ASGNI4
line 960
;956:
;957:#ifdef MISSIONPACK
;958:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;959:#else
;960:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $740
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $736
LABELV $740
line 962
;961:#endif
;962:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $743
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+20
ADDRLP4 408
INDIRI4
ASGNI4
line 963
;963:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $746
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+24
ADDRLP4 412
INDIRI4
ASGNI4
line 964
;964:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $749
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+28
ADDRLP4 416
INDIRI4
ASGNI4
line 965
;965:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $752
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+32
ADDRLP4 420
INDIRI4
ASGNI4
line 966
;966:	}
LABELV $736
line 971
;967:
;968:#ifdef MISSIONPACK
;969:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;970:#else
;971:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $757
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $753
LABELV $757
line 973
;972:#endif
;973:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $760
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+36
ADDRLP4 408
INDIRI4
ASGNI4
line 974
;974:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $763
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+40
ADDRLP4 412
INDIRI4
ASGNI4
line 975
;975:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $766
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+48
ADDRLP4 416
INDIRI4
ASGNI4
line 976
;976:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $770
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+48+4
ADDRLP4 420
INDIRI4
ASGNI4
line 977
;977:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $774
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+48+8
ADDRLP4 424
INDIRI4
ASGNI4
line 978
;978:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $777
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+60
ADDRLP4 428
INDIRI4
ASGNI4
line 979
;979:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $781
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+60+4
ADDRLP4 432
INDIRI4
ASGNI4
line 980
;980:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $785
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+60+8
ADDRLP4 436
INDIRI4
ASGNI4
line 993
;981:#ifdef MISSIONPACK
;982:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
;983:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
;984:
;985:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
;986:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
;987:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
;988:
;989:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
;990:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
;991:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
;992:#endif
;993:	}
LABELV $753
line 1022
;994:
;995:#ifdef MISSIONPACK
;996:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;997:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
;998:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
;999:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
;1000:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
;1001:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
;1002:	}
;1003:
;1004:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;1005:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
;1006:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
;1007:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
;1008:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
;1009:	}
;1010:
;1011:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1012:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
;1013:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
;1014:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
;1015:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
;1016:	}
;1017:
;1018:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
;1019:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
;1020:#endif
;1021:
;1022:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $790
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $786
LABELV $790
line 1023
;1023:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
ADDRGP4 $793
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+212
ADDRLP4 408
INDIRI4
ASGNI4
line 1024
;1024:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $796
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+416
ADDRLP4 412
INDIRI4
ASGNI4
line 1025
;1025:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $799
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+128
ADDRLP4 416
INDIRI4
ASGNI4
line 1029
;1026:#ifdef MISSIONPACK
;1027:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
;1028:#endif
;1029:	}
LABELV $786
line 1031
;1030:
;1031:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $802
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+120
ADDRLP4 408
INDIRI4
ASGNI4
line 1032
;1032:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $805
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+124
ADDRLP4 412
INDIRI4
ASGNI4
line 1034
;1033:
;1034:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $808
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+192
ADDRLP4 416
INDIRI4
ASGNI4
line 1035
;1035:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $811
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+196
ADDRLP4 420
INDIRI4
ASGNI4
line 1037
;1036:
;1037:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $814
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+136
ADDRLP4 424
INDIRI4
ASGNI4
line 1038
;1038:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $817
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+140
ADDRLP4 428
INDIRI4
ASGNI4
line 1039
;1039:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $820
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+144
ADDRLP4 432
INDIRI4
ASGNI4
line 1040
;1040:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $823
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+148
ADDRLP4 436
INDIRI4
ASGNI4
line 1041
;1041:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $826
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+152
ADDRLP4 440
INDIRI4
ASGNI4
line 1042
;1042:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $829
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+156
ADDRLP4 444
INDIRI4
ASGNI4
line 1043
;1043:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $832
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+160
ADDRLP4 448
INDIRI4
ASGNI4
line 1044
;1044:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $835
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+164
ADDRLP4 452
INDIRI4
ASGNI4
line 1045
;1045:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $838
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+168
ADDRLP4 456
INDIRI4
ASGNI4
line 1046
;1046:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $841
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+172
ADDRLP4 460
INDIRI4
ASGNI4
line 1049
;1047:	
;1048:	// Shafe - Need To Make Models For These
;1049:	cgs.media.glass01 = trap_R_RegisterModel( "models/breakables/glass01.md3" );
ADDRGP4 $844
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+176
ADDRLP4 464
INDIRI4
ASGNI4
line 1050
;1050: 	cgs.media.glass02 = trap_R_RegisterModel( "models/breakables/glass02.md3" );
ADDRGP4 $847
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+180
ADDRLP4 468
INDIRI4
ASGNI4
line 1051
;1051: 	cgs.media.glass03 = trap_R_RegisterModel( "models/breakables/glass03.md3" );
ADDRGP4 $850
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+184
ADDRLP4 472
INDIRI4
ASGNI4
line 1054
;1052:
;1053:
;1054:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $811
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+188
ADDRLP4 476
INDIRI4
ASGNI4
line 1056
;1055:
;1056:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $855
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+216
ADDRLP4 480
INDIRI4
ASGNI4
line 1058
;1057:
;1058:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $858
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+496
ADDRLP4 484
INDIRI4
ASGNI4
line 1060
;1059:
;1060:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $861
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+456
ADDRLP4 488
INDIRI4
ASGNI4
line 1061
;1061:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $864
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+460
ADDRLP4 492
INDIRI4
ASGNI4
line 1062
;1062:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $867
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+464
ADDRLP4 496
INDIRI4
ASGNI4
line 1066
;1063:#ifdef MISSIONPACK
;1064:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/powerups/pop.md3" );
;1065:#else
;1066:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
ADDRGP4 $870
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+508
ADDRLP4 500
INDIRI4
ASGNI4
line 1067
;1067:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
ADDRGP4 $873
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+512
ADDRLP4 504
INDIRI4
ASGNI4
line 1085
;1068:#endif
;1069:#ifdef MISSIONPACK
;1070:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
;1071:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
;1072:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
;1073:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
;1074:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
;1075:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
;1076:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
;1077:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
;1078:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
;1079:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
;1080:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
;1081:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
;1082:
;1083:#endif
;1084:
;1085:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
ADDRGP4 $876
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+153876+516
ADDRLP4 508
INDIRI4
ASGNI4
line 1086
;1086:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $879
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+548
ADDRLP4 512
INDIRI4
ASGNI4
line 1087
;1087:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $882
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+552
ADDRLP4 516
INDIRI4
ASGNI4
line 1088
;1088:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $885
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+556
ADDRLP4 520
INDIRI4
ASGNI4
line 1089
;1089:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $888
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+560
ADDRLP4 524
INDIRI4
ASGNI4
line 1090
;1090:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $891
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+564
ADDRLP4 528
INDIRI4
ASGNI4
line 1091
;1091:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $894
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+568
ADDRLP4 532
INDIRI4
ASGNI4
line 1094
;1092:
;1093:
;1094:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1095
;1095:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1098
;1096:
;1097:	// only register the items that the server says we need
;1098:	strcpy( items, CG_ConfigString( CS_ITEMS) );
CNSTI4 27
ARGI4
ADDRLP4 536
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 536
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1100
;1099:
;1100:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $898
JUMPV
LABELV $895
line 1101
;1101:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $902
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $899
LABELV $902
line 1102
;1102:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1103
;1103:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1104
;1104:		}
LABELV $899
line 1105
;1105:	}
LABELV $896
line 1100
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $898
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $895
line 1108
;1106:
;1107:	// wall marks
;1108:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $905
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+396
ADDRLP4 540
INDIRI4
ASGNI4
line 1109
;1109:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $908
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+400
ADDRLP4 544
INDIRI4
ASGNI4
line 1110
;1110:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $911
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+404
ADDRLP4 548
INDIRI4
ASGNI4
line 1111
;1111:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $914
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+408
ADDRLP4 552
INDIRI4
ASGNI4
line 1112
;1112:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $917
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+364
ADDRLP4 556
INDIRI4
ASGNI4
line 1113
;1113:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $920
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+388
ADDRLP4 560
INDIRI4
ASGNI4
line 1114
;1114:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $923
ARGP4
ADDRLP4 564
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+392
ADDRLP4 564
INDIRI4
ASGNI4
line 1117
;1115:
;1116:	// Shafe - Trep - Radar
;1117:	cgs.media.scannerShader = trap_R_RegisterShader("Scanner");
ADDRGP4 $926
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1076
ADDRLP4 568
INDIRI4
ASGNI4
line 1118
;1118:    cgs.media.scannerBlipShader = trap_R_RegisterShader("ScannerBlip");
ADDRGP4 $929
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1080
ADDRLP4 572
INDIRI4
ASGNI4
line 1119
;1119:    cgs.media.scannerBlipUpShader = trap_R_RegisterShader("ScannerBlipUp");
ADDRGP4 $932
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1084
ADDRLP4 576
INDIRI4
ASGNI4
line 1120
;1120:    cgs.media.scannerBlipDownShader = trap_R_RegisterShader("ScannerBlipDown");
ADDRGP4 $935
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+1088
ADDRLP4 580
INDIRI4
ASGNI4
line 1124
;1121:	// Shafe - Trep - End Radar
;1122:
;1123:	// register the inline models
;1124:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 584
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36872
ADDRLP4 584
INDIRI4
ASGNI4
line 1125
;1125:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $940
JUMPV
LABELV $937
line 1130
;1126:		char	name[10];
;1127:		vec3_t			mins, maxs;
;1128:		int				j;
;1129:
;1130:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 616
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $942
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1131
;1131:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 616
ARGP4
ADDRLP4 628
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
ADDRLP4 628
INDIRI4
ASGNI4
line 1132
;1132:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
INDIRI4
ARGI4
ADDRLP4 592
ARGP4
ADDRLP4 604
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1133
;1133:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 588
CNSTI4 0
ASGNI4
LABELV $945
line 1134
;1134:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 632
ADDRLP4 588
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 636
ADDRLP4 632
INDIRI4
ADDRLP4 592
ADDP4
INDIRF4
ASGNF4
ADDRLP4 632
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+37900
ADDP4
ADDP4
ADDRLP4 636
INDIRF4
CNSTF4 1056964608
ADDRLP4 632
INDIRI4
ADDRLP4 604
ADDP4
INDIRF4
ADDRLP4 636
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1135
;1135:		}
LABELV $946
line 1133
ADDRLP4 588
ADDRLP4 588
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 3
LTI4 $945
line 1136
;1136:	}
LABELV $938
line 1125
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $940
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36872
INDIRI4
LTI4 $937
line 1139
;1137:
;1138:	// register all the server specified models
;1139:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $950
line 1142
;1140:		const char		*modelName;
;1141:
;1142:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 592
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 588
ADDRLP4 592
INDIRP4
ASGNP4
line 1143
;1143:		if ( !modelName[0] ) {
ADDRLP4 588
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $954
line 1144
;1144:			break;
ADDRGP4 $952
JUMPV
LABELV $954
line 1146
;1145:		}
;1146:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 588
INDIRP4
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
ADDRLP4 596
INDIRI4
ASGNI4
line 1147
;1147:	}
LABELV $951
line 1139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $950
LABELV $952
line 1175
;1148:
;1149:#ifdef MISSIONPACK
;1150:	// new stuff
;1151:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
;1152:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
;1153:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
;1154:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
;1155:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
;1156:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
;1157:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
;1158:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
;1159:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
;1160:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
;1161:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
;1162:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
;1163:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
;1164:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
;1165:
;1166:	trap_R_RegisterModel( "models/players/james/lower.md3" );
;1167:	trap_R_RegisterModel( "models/players/james/upper.md3" );
;1168:	trap_R_RegisterModel( "models/players/heads/james/james.md3" );
;1169:
;1170:	trap_R_RegisterModel( "models/players/janet/lower.md3" );
;1171:	trap_R_RegisterModel( "models/players/janet/upper.md3" );
;1172:	trap_R_RegisterModel( "models/players/heads/janet/janet.md3" );
;1173:
;1174:#endif
;1175:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1188
;1176:/*
;1177:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1178:	{
;1179:		{
;1180:			int rval;
;1181:
;1182:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1183:			if (!rval)
;1184:				break;
;1185:		}
;1186:	}
;1187:*/
;1188:}
LABELV $593
endproc CG_RegisterGraphics 640 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1198
;1189:
;1190:
;1191:
;1192:/*																																			
;1193:=======================
;1194:CG_BuildSpectatorString
;1195:
;1196:=======================
;1197:*/
;1198:void CG_BuildSpectatorString() {
line 1200
;1199:	int i;
;1200:	cg.spectatorList[0] = 0;
ADDRGP4 cg+114376
CNSTI1 0
ASGNI1
line 1201
;1201:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $959
line 1202
;1202:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 4
CNSTI4 1732
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
EQI4 $963
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $963
line 1203
;1203:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $970
ARGP4
CNSTI4 1732
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
line 1204
;1204:		}
LABELV $963
line 1205
;1205:	}
LABELV $960
line 1201
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $959
line 1206
;1206:	i = strlen(cg.spectatorList);
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
line 1207
;1207:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+115400
INDIRI4
EQI4 $974
line 1208
;1208:		cg.spectatorLen = i;
ADDRGP4 cg+115400
ADDRLP4 0
INDIRI4
ASGNI4
line 1209
;1209:		cg.spectatorWidth = -1;
ADDRGP4 cg+115404
CNSTF4 3212836864
ASGNF4
line 1210
;1210:	}
LABELV $974
line 1211
;1211:}
LABELV $957
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1219
;1212:
;1213:
;1214:/*																																			
;1215:===================
;1216:CG_RegisterClients
;1217:===================
;1218:*/
;1219:static void CG_RegisterClients( void ) {
line 1222
;1220:	int		i;
;1221:
;1222:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1223
;1223:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1225
;1224:
;1225:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $982
line 1228
;1226:		const char		*clientInfo;
;1227:
;1228:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $986
line 1229
;1229:			continue;
ADDRGP4 $983
JUMPV
LABELV $986
line 1232
;1230:		}
;1231:
;1232:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
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
line 1233
;1233:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $989
line 1234
;1234:			continue;
ADDRGP4 $983
JUMPV
LABELV $989
line 1236
;1235:		}
;1236:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1237
;1237:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1238
;1238:	}
LABELV $983
line 1225
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $982
line 1239
;1239:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1240
;1240:}
LABELV $979
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1249
;1241:
;1242://===========================================================================
;1243:
;1244:/*
;1245:=================
;1246:CG_ConfigString
;1247:=================
;1248:*/
;1249:const char *CG_ConfigString( int index ) {
line 1250
;1250:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $994
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $992
LABELV $994
line 1251
;1251:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $995
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1252
;1252:	}
LABELV $992
line 1253
;1253:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
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
LABELV $991
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1264
;1254:}
;1255:
;1256://==================================================================
;1257:
;1258:/*
;1259:======================
;1260:CG_StartMusic
;1261:
;1262:======================
;1263:*/
;1264:void CG_StartMusic( void ) {
line 1269
;1265:	char	*s;
;1266:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1267:
;1268:	// start the background music
;1269:	s = (char *)CG_ConfigString( CS_MUSIC );
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
line 1270
;1270:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
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
line 1271
;1271:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
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
line 1273
;1272:
;1273:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1274
;1274:}
LABELV $997
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 44 12
line 1940
;1275:#ifdef MISSIONPACK
;1276:char *CG_GetMenuBuffer(const char *filename) {
;1277:	int	len;
;1278:	fileHandle_t	f;
;1279:	static char buf[MAX_MENUFILE];
;1280:
;1281:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;1282:	if ( !f ) {
;1283:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
;1284:		return NULL;
;1285:	}
;1286:	if ( len >= MAX_MENUFILE ) {
;1287:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
;1288:		trap_FS_FCloseFile( f );
;1289:		return NULL;
;1290:	}
;1291:
;1292:	trap_FS_Read( buf, len, f );
;1293:	buf[len] = 0;
;1294:	trap_FS_FCloseFile( f );
;1295:
;1296:	return buf;
;1297:}
;1298:
;1299://
;1300:// ==============================
;1301:// new hud stuff ( mission pack )
;1302:// ==============================
;1303://
;1304:qboolean CG_Asset_Parse(int handle) {
;1305:	pc_token_t token;
;1306:	const char *tempStr;
;1307:
;1308:	if (!trap_PC_ReadToken(handle, &token))
;1309:		return qfalse;
;1310:	if (Q_stricmp(token.string, "{") != 0) {
;1311:		return qfalse;
;1312:	}
;1313:    
;1314:	while ( 1 ) {
;1315:		if (!trap_PC_ReadToken(handle, &token))
;1316:			return qfalse;
;1317:
;1318:		if (Q_stricmp(token.string, "}") == 0) {
;1319:			return qtrue;
;1320:		}
;1321:
;1322:		// font
;1323:		if (Q_stricmp(token.string, "font") == 0) {
;1324:			int pointSize;
;1325:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1326:				return qfalse;
;1327:			}
;1328:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1329:			continue;
;1330:		}
;1331:
;1332:		// smallFont
;1333:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1334:			int pointSize;
;1335:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1336:				return qfalse;
;1337:			}
;1338:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1339:			continue;
;1340:		}
;1341:
;1342:		// font
;1343:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1344:			int pointSize;
;1345:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1346:				return qfalse;
;1347:			}
;1348:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1349:			continue;
;1350:		}
;1351:
;1352:		// gradientbar
;1353:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1354:			if (!PC_String_Parse(handle, &tempStr)) {
;1355:				return qfalse;
;1356:			}
;1357:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1358:			continue;
;1359:		}
;1360:
;1361:		// enterMenuSound
;1362:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1363:			if (!PC_String_Parse(handle, &tempStr)) {
;1364:				return qfalse;
;1365:			}
;1366:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
;1367:			continue;
;1368:		}
;1369:
;1370:		// exitMenuSound
;1371:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1372:			if (!PC_String_Parse(handle, &tempStr)) {
;1373:				return qfalse;
;1374:			}
;1375:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
;1376:			continue;
;1377:		}
;1378:
;1379:		// itemFocusSound
;1380:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1381:			if (!PC_String_Parse(handle, &tempStr)) {
;1382:				return qfalse;
;1383:			}
;1384:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
;1385:			continue;
;1386:		}
;1387:
;1388:		// menuBuzzSound
;1389:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1390:			if (!PC_String_Parse(handle, &tempStr)) {
;1391:				return qfalse;
;1392:			}
;1393:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
;1394:			continue;
;1395:		}
;1396:
;1397:		if (Q_stricmp(token.string, "cursor") == 0) {
;1398:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1399:				return qfalse;
;1400:			}
;1401:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
;1402:			continue;
;1403:		}
;1404:
;1405:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1406:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1407:				return qfalse;
;1408:			}
;1409:			continue;
;1410:		}
;1411:
;1412:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1413:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1414:				return qfalse;
;1415:			}
;1416:			continue;
;1417:		}
;1418:
;1419:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1420:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1421:				return qfalse;
;1422:			}
;1423:			continue;
;1424:		}
;1425:
;1426:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1427:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1428:				return qfalse;
;1429:			}
;1430:			continue;
;1431:		}
;1432:
;1433:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1434:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1435:				return qfalse;
;1436:			}
;1437:			continue;
;1438:		}
;1439:
;1440:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1441:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1442:				return qfalse;
;1443:			}
;1444:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1445:			continue;
;1446:		}
;1447:	}
;1448:	return qfalse; // bk001204 - why not?
;1449:}
;1450:
;1451:void CG_ParseMenu(const char *menuFile) {
;1452:	pc_token_t token;
;1453:	int handle;
;1454:
;1455:	handle = trap_PC_LoadSource(menuFile);
;1456:	if (!handle)
;1457:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1458:	if (!handle)
;1459:		return;
;1460:
;1461:	while ( 1 ) {
;1462:		if (!trap_PC_ReadToken( handle, &token )) {
;1463:			break;
;1464:		}
;1465:
;1466:		//if ( Q_stricmp( token, "{" ) ) {
;1467:		//	Com_Printf( "Missing { in menu file\n" );
;1468:		//	break;
;1469:		//}
;1470:
;1471:		//if ( menuCount == MAX_MENUS ) {
;1472:		//	Com_Printf( "Too many menus!\n" );
;1473:		//	break;
;1474:		//}
;1475:
;1476:		if ( token.string[0] == '}' ) {
;1477:			break;
;1478:		}
;1479:
;1480:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1481:			if (CG_Asset_Parse(handle)) {
;1482:				continue;
;1483:			} else {
;1484:				break;
;1485:			}
;1486:		}
;1487:
;1488:
;1489:		if (Q_stricmp(token.string, "menudef") == 0) {
;1490:			// start a new menu
;1491:			Menu_New(handle);
;1492:		}
;1493:	}
;1494:	trap_PC_FreeSource(handle);
;1495:}
;1496:
;1497:qboolean CG_Load_Menu(char **p) {
;1498:	char *token;
;1499:
;1500:	token = COM_ParseExt(p, qtrue);
;1501:
;1502:	if (token[0] != '{') {
;1503:		return qfalse;
;1504:	}
;1505:
;1506:	while ( 1 ) {
;1507:
;1508:		token = COM_ParseExt(p, qtrue);
;1509:    
;1510:		if (Q_stricmp(token, "}") == 0) {
;1511:			return qtrue;
;1512:		}
;1513:
;1514:		if ( !token || token[0] == 0 ) {
;1515:			return qfalse;
;1516:		}
;1517:
;1518:		CG_ParseMenu(token); 
;1519:	}
;1520:	return qfalse;
;1521:}
;1522:
;1523:
;1524:
;1525:void CG_LoadMenus(const char *menuFile) {
;1526:	char	*token;
;1527:	char *p;
;1528:	int	len, start;
;1529:	fileHandle_t	f;
;1530:	static char buf[MAX_MENUDEFFILE];
;1531:
;1532:	start = trap_Milliseconds();
;1533:
;1534:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
;1535:	if ( !f ) {
;1536:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
;1537:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
;1538:		if (!f) {
;1539:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
;1540:		}
;1541:	}
;1542:
;1543:	if ( len >= MAX_MENUDEFFILE ) {
;1544:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
;1545:		trap_FS_FCloseFile( f );
;1546:		return;
;1547:	}
;1548:
;1549:	trap_FS_Read( buf, len, f );
;1550:	buf[len] = 0;
;1551:	trap_FS_FCloseFile( f );
;1552:	
;1553:	COM_Compress(buf);
;1554:
;1555:	Menu_Reset();
;1556:
;1557:	p = buf;
;1558:
;1559:	while ( 1 ) {
;1560:		token = COM_ParseExt( &p, qtrue );
;1561:		if( !token || token[0] == 0 || token[0] == '}') {
;1562:			break;
;1563:		}
;1564:
;1565:		//if ( Q_stricmp( token, "{" ) ) {
;1566:		//	Com_Printf( "Missing { in menu file\n" );
;1567:		//	break;
;1568:		//}
;1569:
;1570:		//if ( menuCount == MAX_MENUS ) {
;1571:		//	Com_Printf( "Too many menus!\n" );
;1572:		//	break;
;1573:		//}
;1574:
;1575:		if ( Q_stricmp( token, "}" ) == 0 ) {
;1576:			break;
;1577:		}
;1578:
;1579:		if (Q_stricmp(token, "loadmenu") == 0) {
;1580:			if (CG_Load_Menu(&p)) {
;1581:				continue;
;1582:			} else {
;1583:				break;
;1584:			}
;1585:		}
;1586:	}
;1587:
;1588:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1589:
;1590:}
;1591:
;1592:
;1593:
;1594:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
;1595:	return qfalse;
;1596:}
;1597:
;1598:
;1599:static int CG_FeederCount(float feederID) {
;1600:	int i, count;
;1601:	count = 0;
;1602:	if (feederID == FEEDER_REDTEAM_LIST) {
;1603:		for (i = 0; i < cg.numScores; i++) {
;1604:			if (cg.scores[i].team == TEAM_RED) {
;1605:				count++;
;1606:			}
;1607:		}
;1608:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1609:		for (i = 0; i < cg.numScores; i++) {
;1610:			if (cg.scores[i].team == TEAM_BLUE) {
;1611:				count++;
;1612:			}
;1613:		}
;1614:	} else if (feederID == FEEDER_SCOREBOARD) {
;1615:		return cg.numScores;
;1616:	}
;1617:	return count;
;1618:}
;1619:
;1620:
;1621:void CG_SetScoreSelection(void *p) {
;1622:	menuDef_t *menu = (menuDef_t*)p;
;1623:	playerState_t *ps = &cg.snap->ps;
;1624:	int i, red, blue;
;1625:	red = blue = 0;
;1626:	for (i = 0; i < cg.numScores; i++) {
;1627:		if (cg.scores[i].team == TEAM_RED) {
;1628:			red++;
;1629:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1630:			blue++;
;1631:		}
;1632:		if (ps->clientNum == cg.scores[i].client) {
;1633:			cg.selectedScore = i;
;1634:		}
;1635:	}
;1636:
;1637:	if (menu == NULL) {
;1638:		// just interested in setting the selected score
;1639:		return;
;1640:	}
;1641:
;1642:	if ( cgs.gametype >= GT_TEAM ) {
;1643:		int feeder = FEEDER_REDTEAM_LIST;
;1644:		i = red;
;1645:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1646:			feeder = FEEDER_BLUETEAM_LIST;
;1647:			i = blue;
;1648:		}
;1649:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1650:	} else {
;1651:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1652:	}
;1653:}
;1654:
;1655:// FIXME: might need to cache this info
;1656:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
;1657:	int i, count;
;1658:	if ( cgs.gametype >= GT_TEAM ) {
;1659:		count = 0;
;1660:		for (i = 0; i < cg.numScores; i++) {
;1661:			if (cg.scores[i].team == team) {
;1662:				if (count == index) {
;1663:					*scoreIndex = i;
;1664:					return &cgs.clientinfo[cg.scores[i].client];
;1665:				}
;1666:				count++;
;1667:			}
;1668:		}
;1669:	}
;1670:	*scoreIndex = index;
;1671:	return &cgs.clientinfo[ cg.scores[index].client ];
;1672:}
;1673:
;1674:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
;1675:	gitem_t *item;
;1676:	int scoreIndex = 0;
;1677:	clientInfo_t *info = NULL;
;1678:	int team = -1;
;1679:	score_t *sp = NULL;
;1680:
;1681:	*handle = -1;
;1682:
;1683:	if (feederID == FEEDER_REDTEAM_LIST) {
;1684:		team = TEAM_RED;
;1685:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1686:		team = TEAM_BLUE;
;1687:	}
;1688:
;1689:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1690:	sp = &cg.scores[scoreIndex];
;1691:
;1692:	if (info && info->infoValid) {
;1693:		switch (column) {
;1694:			case 0:
;1695:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;1696:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1697:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1698:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
;1699:					item = BG_FindItemForPowerup( PW_REDFLAG );
;1700:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1701:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
;1702:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1703:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1704:				} else {
;1705:					if ( info->botSkill > 0 && info->botSkill <= 5 ) {
;1706:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
;1707:					} else if ( info->handicap < 100 ) {
;1708:					return va("%i", info->handicap );
;1709:					}
;1710:				}
;1711:			break;
;1712:			case 1:
;1713:				if (team == -1) {
;1714:					return "";
;1715:				} else {
;1716:					*handle = CG_StatusHandle(info->teamTask);
;1717:				}
;1718:		  break;
;1719:			case 2:
;1720:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
;1721:					return "Ready";
;1722:				}
;1723:				if (team == -1) {
;1724:					if (cgs.gametype == GT_TOURNAMENT) {
;1725:						return va("%i/%i", info->wins, info->losses);
;1726:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
;1727:						return "Spectator";
;1728:					} else {
;1729:						return "";
;1730:					}
;1731:				} else {
;1732:					if (info->teamLeader) {
;1733:						return "Leader";
;1734:					}
;1735:				}
;1736:			break;
;1737:			case 3:
;1738:				return info->name;
;1739:			break;
;1740:			case 4:
;1741:				return va("%i", info->score);
;1742:			break;
;1743:			case 5:
;1744:				return va("%4i", sp->time);
;1745:			break;
;1746:			case 6:
;1747:				if ( sp->ping == -1 ) {
;1748:					return "connecting";
;1749:				} 
;1750:				return va("%4i", sp->ping);
;1751:			break;
;1752:		}
;1753:	}
;1754:
;1755:	return "";
;1756:}
;1757:
;1758:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1759:	return 0;
;1760:}
;1761:
;1762:static void CG_FeederSelection(float feederID, int index) {
;1763:	if ( cgs.gametype >= GT_TEAM ) {
;1764:		int i, count;
;1765:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1766:		count = 0;
;1767:		for (i = 0; i < cg.numScores; i++) {
;1768:			if (cg.scores[i].team == team) {
;1769:				if (index == count) {
;1770:					cg.selectedScore = i;
;1771:				}
;1772:				count++;
;1773:			}
;1774:		}
;1775:	} else {
;1776:		cg.selectedScore = index;
;1777:	}
;1778:}
;1779:#endif
;1780:
;1781:#ifdef MISSIONPACK // bk001204 - only needed there
;1782:static float CG_Cvar_Get(const char *cvar) {
;1783:	char buff[128];
;1784:	memset(buff, 0, sizeof(buff));
;1785:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
;1786:	return atof(buff);
;1787:}
;1788:#endif
;1789:
;1790:#ifdef MISSIONPACK
;1791:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
;1792:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1793:}
;1794:
;1795:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1796:	switch (ownerDraw) {
;1797:	  case CG_GAME_TYPE:
;1798:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1799:	  case CG_GAME_STATUS:
;1800:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1801:			break;
;1802:	  case CG_KILLER:
;1803:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1804:			break;
;1805:	  case CG_RED_NAME:
;1806:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1807:			break;
;1808:	  case CG_BLUE_NAME:
;1809:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1810:			break;
;1811:
;1812:
;1813:	}
;1814:	return 0;
;1815:}
;1816:
;1817:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
;1818:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1819:}
;1820:
;1821:static void CG_StopCinematic(int handle) {
;1822:  trap_CIN_StopCinematic(handle);
;1823:}
;1824:
;1825:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1826:  trap_CIN_SetExtents(handle, x, y, w, h);
;1827:  trap_CIN_DrawCinematic(handle);
;1828:}
;1829:
;1830:static void CG_RunCinematicFrame(int handle) {
;1831:  trap_CIN_RunCinematic(handle);
;1832:}
;1833:
;1834:/*
;1835:=================
;1836:CG_LoadHudMenu();
;1837:
;1838:=================
;1839:*/
;1840:void CG_LoadHudMenu() {
;1841:	char buff[1024];
;1842:	const char *hudSet;
;1843:
;1844:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1845:	cgDC.setColor = &trap_R_SetColor;
;1846:	cgDC.drawHandlePic = &CG_DrawPic;
;1847:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
;1848:	cgDC.drawText = &CG_Text_Paint;
;1849:	cgDC.textWidth = &CG_Text_Width;
;1850:	cgDC.textHeight = &CG_Text_Height;
;1851:	cgDC.registerModel = &trap_R_RegisterModel;
;1852:	cgDC.modelBounds = &trap_R_ModelBounds;
;1853:	cgDC.fillRect = &CG_FillRect;
;1854:	cgDC.drawRect = &CG_DrawRect;   
;1855:	cgDC.drawSides = &CG_DrawSides;
;1856:	cgDC.drawTopBottom = &CG_DrawTopBottom;
;1857:	cgDC.clearScene = &trap_R_ClearScene;
;1858:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;1859:	cgDC.renderScene = &trap_R_RenderScene;
;1860:	cgDC.registerFont = &trap_R_RegisterFont;
;1861:	cgDC.ownerDrawItem = &CG_OwnerDraw;
;1862:	cgDC.getValue = &CG_GetValue;
;1863:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
;1864:	cgDC.runScript = &CG_RunMenuScript;
;1865:	cgDC.getTeamColor = &CG_GetTeamColor;
;1866:	cgDC.setCVar = trap_Cvar_Set;
;1867:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
;1868:	cgDC.getCVarValue = CG_Cvar_Get;
;1869:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
;1870:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;1871:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;1872:	cgDC.startLocalSound = &trap_S_StartLocalSound;
;1873:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;1874:	cgDC.feederCount = &CG_FeederCount;
;1875:	cgDC.feederItemImage = &CG_FeederItemImage;
;1876:	cgDC.feederItemText = &CG_FeederItemText;
;1877:	cgDC.feederSelection = &CG_FeederSelection;
;1878:	//cgDC.setBinding = &trap_Key_SetBinding;
;1879:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;1880:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;1881:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;1882:	cgDC.Error = &Com_Error; 
;1883:	cgDC.Print = &Com_Printf; 
;1884:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;1885:	//cgDC.Pause = &CG_Pause;
;1886:	cgDC.registerSound = &trap_S_RegisterSound;
;1887:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;1888:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
;1889:	cgDC.playCinematic = &CG_PlayCinematic;
;1890:	cgDC.stopCinematic = &CG_StopCinematic;
;1891:	cgDC.drawCinematic = &CG_DrawCinematic;
;1892:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
;1893:	
;1894:	Init_Display(&cgDC);
;1895:
;1896:	Menu_Reset();
;1897:	
;1898:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;1899:	hudSet = buff;
;1900:	if (hudSet[0] == '\0') {
;1901:		hudSet = "ui/hud.txt";
;1902:	}
;1903:
;1904:	CG_LoadMenus(hudSet);
;1905:}
;1906:
;1907:void CG_AssetCache() {
;1908:	//if (Assets.textFont == NULL) {
;1909:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;1910:	//}
;1911:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;1912:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;1913:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
;1914:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
;1915:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
;1916:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
;1917:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
;1918:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
;1919:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
;1920:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
;1921:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
;1922:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
;1923:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
;1924:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
;1925:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
;1926:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
;1927:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
;1928:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
;1929:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
;1930:}
;1931:#endif
;1932:/*
;1933:=================
;1934:CG_Init
;1935:
;1936:Called after every level change or subsystem restart
;1937:Will perform callbacks to make the loading info screen update.
;1938:=================
;1939:*/
;1940:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 1944
;1941:	const char	*s;
;1942:
;1943:	// clear everything
;1944:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 154988
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1945
;1945:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 155920
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1946
;1946:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 749568
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1947
;1947:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1948
;1948:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1950
;1949:
;1950:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1952
;1951:
;1952:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31448
ADDRFP4 0
INDIRI4
ASGNI4
line 1953
;1953:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31444
ADDRFP4 4
INDIRI4
ASGNI4
line 1956
;1954:
;1955:	// load a few needed things before we do any screen updates
;1956:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $1003
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876
ADDRLP4 4
INDIRI4
ASGNI4
line 1957
;1957:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $1006
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+153876+16
ADDRLP4 8
INDIRI4
ASGNI4
line 1958
;1958:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $1009
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+4
ADDRLP4 12
INDIRI4
ASGNI4
line 1959
;1959:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $1012
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+8
ADDRLP4 16
INDIRI4
ASGNI4
line 1960
;1960:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $1015
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+153876+12
ADDRLP4 20
INDIRI4
ASGNI4
line 1962
;1961:
;1962:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1964
;1963:
;1964:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1966
;1965:
;1966:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+108948
CNSTI4 2
ASGNI4
line 1968
;1967:
;1968:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
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
line 1969
;1969:	cgs.flagStatus = -1;
ADDRGP4 cgs+34816
CNSTI4 -1
ASGNI4
line 1973
;1970:	// old servers
;1971:
;1972:	// get the rendering configuration from the client system
;1973:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1974
;1974:	cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+31432
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 1975
;1975:	cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+31436
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 1978
;1976:
;1977:	// get the gamestate from the client system
;1978:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 1981
;1979:
;1980:	// check version
;1981:	s = CG_ConfigString( CS_GAME_VERSION );
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
line 1982
;1982:	if ( strcmp( s, GAME_VERSION ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1029
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1027
line 1983
;1983:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1030
ARGP4
ADDRGP4 $1029
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1984
;1984:	}
LABELV $1027
line 1986
;1985:
;1986:	s = CG_ConfigString( CS_LEVEL_START_TIME );
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
line 1987
;1987:	cgs.levelStartTime = atoi( s );
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
line 1989
;1988:
;1989:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 1992
;1990:
;1991:	// load the new map
;1992:	CG_LoadingString( "collision map" );
ADDRGP4 $1032
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1994
;1993:
;1994:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2000
;1995:
;1996:#ifdef MISSIONPACK
;1997:	String_Init();
;1998:#endif
;1999:
;2000:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2002
;2001:
;2002:	CG_LoadingString( "sounds" );
ADDRGP4 $1035
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2004
;2003:
;2004:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2006
;2005:
;2006:	CG_LoadingString( "graphics" );
ADDRGP4 $1036
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2008
;2007:
;2008:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2010
;2009:
;2010:	CG_LoadingString( "clients" );
ADDRGP4 $1037
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2012
;2011:
;2012:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2020
;2013:
;2014:// Shafe - Trep Open TA Stuff Up
;2015:#ifdef MISSIONPACK
;2016:	CG_AssetCache();
;2017:	CG_LoadHudMenu();      // load new hud stuff
;2018:#endif
;2019:
;2020:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2022
;2021:
;2022:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2024
;2023:
;2024:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2027
;2025:
;2026:	// remove the last loading update
;2027:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+109448
CNSTI1 0
ASGNI1
line 2030
;2028:
;2029:	// Make sure we have update values (scores)
;2030:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 2032
;2031:
;2032:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2034
;2033:
;2034:	CG_LoadingString( "" );
ADDRGP4 $1040
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2041
;2035:
;2036:
;2037:#ifdef MISSIONPACK
;2038:	CG_InitTeamChat();
;2039:#endif
;2040:
;2041:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2043
;2042:
;2043:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2044
;2044:}
LABELV $998
endproc CG_Init 44 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2053
;2045:
;2046:/*
;2047:=================
;2048:CG_Shutdown
;2049:
;2050:Called before every level change or subsystem restart
;2051:=================
;2052:*/
;2053:void CG_Shutdown( void ) {
line 2056
;2054:	// some mods may need to do cleanup work here,
;2055:	// like closing files or archiving session data
;2056:}
LABELV $1041
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2070
;2057:
;2058:
;2059:/*
;2060:==================
;2061:CG_EventHandling
;2062:==================
;2063: type 0 - no event handling
;2064:      1 - team menu
;2065:      2 - hud editor
;2066:
;2067:*/
;2068:
;2069:#ifndef MISSIONPACK
;2070:void CG_EventHandling(int type) {
line 2071
;2071:}
LABELV $1042
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 0 0
line 2075
;2072:
;2073:
;2074:
;2075:void CG_KeyEvent(int key, qboolean down) {
line 2076
;2076:}
LABELV $1043
endproc CG_KeyEvent 0 0
export CG_MouseEvent
proc CG_MouseEvent 0 0
line 2078
;2077:
;2078:void CG_MouseEvent(int x, int y) {
line 2079
;2079:}
LABELV $1044
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
import CG_BreakGlass
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
skip 154988
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
LABELV $1040
byte 1 0
align 1
LABELV $1037
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1036
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
LABELV $1035
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1032
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
LABELV $1030
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
LABELV $1029
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
LABELV $1015
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
LABELV $1012
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
LABELV $1009
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
LABELV $1006
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1003
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
LABELV $995
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
LABELV $970
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $942
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $935
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
LABELV $932
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
LABELV $929
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
LABELV $926
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $923
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
LABELV $920
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $917
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
LABELV $914
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
LABELV $911
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
LABELV $908
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
LABELV $905
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
LABELV $894
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
LABELV $891
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
LABELV $888
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
LABELV $885
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
LABELV $882
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
LABELV $879
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
LABELV $876
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
LABELV $873
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
LABELV $870
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
LABELV $867
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
LABELV $864
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
LABELV $861
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
LABELV $858
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
LABELV $855
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
LABELV $850
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 48
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $847
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $844
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $841
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
LABELV $838
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
LABELV $835
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
LABELV $832
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
LABELV $811
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
LABELV $808
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
LABELV $805
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
LABELV $802
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
LABELV $799
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
LABELV $796
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
LABELV $793
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
LABELV $785
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
LABELV $781
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
LABELV $777
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
LABELV $774
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
LABELV $770
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
LABELV $766
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
LABELV $763
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
LABELV $760
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
LABELV $752
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
LABELV $749
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
LABELV $746
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
LABELV $743
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
LABELV $735
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
LABELV $732
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
LABELV $729
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
LABELV $726
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
LABELV $723
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
byte 1 113
byte 1 117
byte 1 97
byte 1 100
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
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $711
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
LABELV $708
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
LABELV $705
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
LABELV $698
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
LABELV $695
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
LABELV $692
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
LABELV $689
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
LABELV $686
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
LABELV $683
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
LABELV $680
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
LABELV $677
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
LABELV $674
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
LABELV $671
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
LABELV $668
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
byte 1 0
align 1
LABELV $662
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $659
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $656
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
LABELV $641
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
LABELV $638
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
LABELV $635
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
LABELV $631
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
LABELV $627
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
LABELV $623
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
LABELV $619
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
LABELV $610
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
LABELV $605
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
LABELV $604
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
LABELV $603
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
byte 1 115
byte 1 105
byte 1 120
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
byte 1 116
byte 1 119
byte 1 111
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
byte 1 111
byte 1 110
byte 1 101
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
LABELV $592
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
byte 1 49
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
byte 1 49
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
LABELV $571
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
LABELV $568
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
byte 1 50
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
byte 1 49
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
LABELV $522
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
LABELV $518
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
LABELV $514
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
LABELV $510
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
LABELV $506
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
LABELV $502
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
LABELV $494
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
LABELV $491
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
byte 1 111
byte 1 117
byte 1 116
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
byte 1 105
byte 1 110
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
byte 1 104
byte 1 105
byte 1 116
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
LABELV $446
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
LABELV $443
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
LABELV $440
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
byte 1 105
byte 1 110
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
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
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
