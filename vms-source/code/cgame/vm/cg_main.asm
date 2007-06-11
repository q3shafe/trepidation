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
address cg_GameMode
address $195
address $88
byte 4 7
address cg_BlueMC
address $196
address $88
byte 4 7
address cg_RedMC
address $197
address $88
byte 4 7
address cg_delag
address $198
address $90
byte 4 3
address cg_debugDelag
address $199
address $88
byte 4 514
address cg_drawBBox
address $200
address $88
byte 4 512
address cg_cmdTimeNudge
address $201
address $88
byte 4 3
address sv_fps
address $202
address $203
byte 4 0
address cg_projectileNudge
address $204
address $88
byte 4 1
address cg_optimizePrediction
address $205
address $90
byte 4 1
address cl_timeNudge
address $206
address $88
byte 4 1
address cg_latentSnaps
address $207
address $88
byte 4 514
address cg_latentCmds
address $208
address $88
byte 4 514
address cg_plOut
address $209
address $88
byte 4 514
address cg_trueLightning
address $210
address $211
byte 4 1
align 4
LABELV cvarTableSize
byte 4 103
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 355
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
;197:vmCvar_t	cg_GameMode;
;198:vmCvar_t		cg_BlueMC;
;199:vmCvar_t		cg_RedMC;
;200:
;201:
;202:typedef struct {
;203:	vmCvar_t	*vmCvar;
;204:	char		*cvarName;
;205:	char		*defaultString;
;206:	int			cvarFlags;
;207:} cvarTable_t;
;208:
;209:static cvarTable_t cvarTable[] = { // bk001129
;210:	{ &cg_ignore, "cg_ignore", "0", 0 },	// used for debugging
;211:	{ &cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE },
;212:	{ &cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE },
;213:	{ &cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE },
;214:	{ &cg_fov, "cg_fov", "90", CVAR_ARCHIVE },
;215:	{ &cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE },
;216:	{ &cg_stereoSeparation, "cg_stereoSeparation", "0.4", CVAR_ARCHIVE  },
;217:	{ &cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE  },
;218:	{ &cg_gibs, "cg_gibs", "1", CVAR_ARCHIVE  },
;219:	{ &cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE  },
;220:	{ &cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE  },
;221:	{ &cg_drawTimer, "cg_drawTimer", "1", CVAR_ARCHIVE  },
;222:	{ &cg_drawFPS, "cg_drawFPS", "1", CVAR_ARCHIVE  },
;223:	{ &cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE  },
;224:	{ &cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE  },
;225:	{ &cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE  },
;226:	{ &cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE  },
;227:	{ &cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE  },
;228:	{ &cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;229:	{ &cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;230:	{ &cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE },
;231:	{ &cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE },
;232:	{ &cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE },
;233:	{ &cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE },
;234:	{ &cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE },
;235:	{ &cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;236:	{ &cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE },
;237:	{ &cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE },
;238:	{ &cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE },
;239:	{ &cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE  },
;240:	{ &cg_gun_x, "cg_gunX", "0", CVAR_CHEAT },
;241:	{ &cg_gun_y, "cg_gunY", "0", CVAR_CHEAT },
;242:	{ &cg_gun_z, "cg_gunZ", "0", CVAR_CHEAT },
;243:	{ &cg_centertime, "cg_centertime", "3", CVAR_CHEAT },
;244:	{ &cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;245:	{ &cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE },
;246:	{ &cg_bobup , "cg_bobup", "0.005", CVAR_ARCHIVE },
;247:	{ &cg_bobpitch, "cg_bobpitch", "0.002", CVAR_ARCHIVE },
;248:	{ &cg_bobroll, "cg_bobroll", "0.002", CVAR_ARCHIVE },
;249:	{ &cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT },
;250:	{ &cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT },
;251:	{ &cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT },
;252:	{ &cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT },
;253:	{ &cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT },
;254:	{ &cg_errorDecay, "cg_errordecay", "100", 0 },
;255:	{ &cg_nopredict, "cg_nopredict", "0", 0 },
;256:	{ &cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT },
;257:	{ &cg_showmiss, "cg_showmiss", "0", 0 },
;258:	{ &cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT },
;259:	{ &cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT },
;260:	{ &cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT },
;261:	{ &cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT },
;262:	{ &cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT },
;263:	{ &cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT },
;264:	{ &cg_thirdPerson, "cg_thirdPerson", "0", 0 },
;265:	{ &cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE  },
;266:	{ &cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE  },
;267:	{ &cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE  },
;268:	{ &cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE },
;269:
;270:	////////////////////////////
;271:
;272:#ifdef MISSIONPACK
;273:	{ &cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE },
;274:#else
;275:	{ &cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE },
;276:#endif
;277:	{ &cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE },
;278:	{ &cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO },
;279:	{ &cg_stats, "cg_stats", "0", 0 },
;280:	{ &cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE },
;281:	{ &cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE },
;282:	{ &cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE },
;283:	{ &cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE },
;284:	// the following variables are created in other parts of the system,
;285:	// but we also reference them here
;286:	{ &cg_buildScript, "com_buildScript", "0", 0 },	// force loading of all possible data amd error on failures
;287:	{ &cg_paused, "cl_paused", "0", CVAR_ROM },
;288:	{ &cg_blood, "com_blood", "1", CVAR_ARCHIVE },
;289:	{ &cg_synchronousClients, "g_synchronousClients", "0", 0 },	// communicated by systeminfo
;290:
;291:#ifdef MISSIONPACK
;292:	{ &cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;293:	{ &cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;294:	{ &cg_currentSelectedPlayer, "cg_currentSelectedPlayer", "0", CVAR_ARCHIVE},
;295:	{ &cg_currentSelectedPlayerName, "cg_currentSelectedPlayerName", "", CVAR_ARCHIVE},
;296:	{ &cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;297:	{ &cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;298:	{ &cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;299:	{ &cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;300:	{ &cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;301:	{ &cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;302:	{ &cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;303:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;304:#endif
;305:	{ &cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE}, // Shafe - Trep
;306:	{ &cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;307:	{ &cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;308:	{ &cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;309:	{ &cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;310:	{ &cg_timescale, "timescale", "1", 0},
;311:	{ &cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;312://unlagged - smooth clients #2
;313:// this is done server-side now
;314://	{ &cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;315://unlagged - smooth clients #2
;316:	{ &cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;317:
;318:	{ &pmove_fixed, "pmove_fixed", "0", 0},
;319:	{ &pmove_msec, "pmove_msec", "8", 0},
;320:	{ &cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;321:	{ &cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;322:	{ &cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;323:	{ &cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;324:	{ &cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;325:	{ &cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;326:	{ &cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;327:	{ &cg_GameMode, "g_GameMode", "0" , CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;328:	{ &cg_BlueMC, "g_BlueMC", "0" , CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;329:	{ &cg_RedMC, "g_RedMC", "0" , CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO },
;330://unlagged - client options
;331:	{ &cg_delag, "cg_delag", "1", CVAR_ARCHIVE | CVAR_USERINFO },
;332:	{ &cg_debugDelag, "cg_debugDelag", "0", CVAR_USERINFO | CVAR_CHEAT },
;333:	{ &cg_drawBBox, "cg_drawBBox", "0", CVAR_CHEAT },
;334:	{ &cg_cmdTimeNudge, "cg_cmdTimeNudge", "0", CVAR_ARCHIVE | CVAR_USERINFO },
;335:	// this will be automagically copied from the server
;336:	{ &sv_fps, "sv_fps", "20", 0 },
;337:	{ &cg_projectileNudge, "cg_projectileNudge", "0", CVAR_ARCHIVE },
;338:	{ &cg_optimizePrediction, "cg_optimizePrediction", "1", CVAR_ARCHIVE },
;339:	{ &cl_timeNudge, "cl_timeNudge", "0", CVAR_ARCHIVE },
;340:	{ &cg_latentSnaps, "cg_latentSnaps", "0", CVAR_USERINFO | CVAR_CHEAT },
;341:	{ &cg_latentCmds, "cg_latentCmds", "0", CVAR_USERINFO | CVAR_CHEAT },
;342:	{ &cg_plOut, "cg_plOut", "0", CVAR_USERINFO | CVAR_CHEAT },
;343://unlagged - client options
;344:	{ &cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE}
;345://	{ &cg_pmove_fixed, "cg_pmove_fixed", "0", CVAR_USERINFO | CVAR_ARCHIVE }
;346:};
;347:
;348:static int  cvarTableSize = sizeof( cvarTable ) / sizeof( cvarTable[0] );
;349:
;350:/*
;351:=================
;352:CG_RegisterCvars
;353:=================
;354:*/
;355:void CG_RegisterCvars( void ) {
line 360
;356:	int			i;
;357:	cvarTable_t	*cv;
;358:	char		var[MAX_TOKEN_CHARS];
;359:
;360:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $216
JUMPV
LABELV $213
line 361
;361:		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
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
line 363
;362:			cv->defaultString, cv->cvarFlags );
;363:	}
LABELV $214
line 360
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
LABELV $216
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $213
line 366
;364:
;365:	// see if we are also running the server on this machine
;366:	trap_Cvar_VariableStringBuffer( "sv_running", var, sizeof( var ) );
ADDRGP4 $217
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 367
;367:	cgs.localServer = atoi( var );
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
line 369
;368:
;369:	forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 371
;370:
;371:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $220
ARGP4
ADDRGP4 $221
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 372
;372:	trap_Cvar_Register(NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $222
ARGP4
ADDRGP4 $221
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 373
;373:	trap_Cvar_Register(NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $223
ARGP4
ADDRGP4 $221
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 374
;374:	trap_Cvar_Register(NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
CNSTP4 0
ARGP4
ADDRGP4 $224
ARGP4
ADDRGP4 $221
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 375
;375:}
LABELV $212
endproc CG_RegisterCvars 1036 16
proc CG_ForceModelChange 12 4
line 382
;376:
;377:/*																																			
;378:===================
;379:CG_ForceModelChange
;380:===================
;381:*/
;382:static void CG_ForceModelChange( void ) {
line 385
;383:	int		i;
;384:
;385:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $226
line 388
;386:		const char		*clientInfo;
;387:
;388:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
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
line 389
;389:		if ( !clientInfo[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
line 390
;390:			continue;
ADDRGP4 $227
JUMPV
LABELV $230
line 392
;391:		}
;392:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 393
;393:	}
LABELV $227
line 385
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $226
line 394
;394:}
LABELV $225
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 12 16
line 401
;395:
;396:/*
;397:=================
;398:CG_UpdateCvars
;399:=================
;400:*/
;401:void CG_UpdateCvars( void ) {
line 405
;402:	int			i;
;403:	cvarTable_t	*cv;
;404:
;405:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $236
JUMPV
LABELV $233
line 410
;406://unlagged - client options
;407:		// clamp the value between 0 and 999
;408:		// negative values would suck - people could conceivably shoot other
;409:		// players *long* after they had left the area, on purpose
;410:		if ( cv->vmCvar == &cg_cmdTimeNudge ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_cmdTimeNudge
CVPU4 4
NEU4 $237
line 411
;411:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 999 );
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
line 412
;412:		}
ADDRGP4 $238
JUMPV
LABELV $237
line 417
;413:		// cl_timenudge less than -50 or greater than 50 doesn't actually
;414:		// do anything more than -50 or 50 (actually the numbers are probably
;415:		// closer to -30 and 30, but 50 is nice and round-ish)
;416:		// might as well not feed the myth, eh?
;417:		else if ( cv->vmCvar == &cl_timeNudge ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cl_timeNudge
CVPU4 4
NEU4 $239
line 418
;418:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, -50, 50 );
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
line 419
;419:		}
ADDRGP4 $240
JUMPV
LABELV $239
line 421
;420:		// don't let this go too high - no point
;421:		else if ( cv->vmCvar == &cg_latentSnaps ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_latentSnaps
CVPU4 4
NEU4 $241
line 422
;422:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 10 );
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
line 423
;423:		}
ADDRGP4 $242
JUMPV
LABELV $241
line 425
;424:		// don't let this get too large
;425:		else if ( cv->vmCvar == &cg_latentCmds ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_latentCmds
CVPU4 4
NEU4 $243
line 426
;426:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, MAX_LATENT_CMDS - 1 );
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
line 427
;427:		}
ADDRGP4 $244
JUMPV
LABELV $243
line 429
;428:		// no more than 100% packet loss
;429:		else if ( cv->vmCvar == &cg_plOut ) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
ADDRGP4 cg_plOut
CVPU4 4
NEU4 $245
line 430
;430:			CG_Cvar_ClampInt( cv->cvarName, cv->vmCvar, 0, 100 );
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
line 431
;431:		}
LABELV $245
LABELV $244
LABELV $242
LABELV $240
LABELV $238
line 433
;432://unlagged - client options
;433:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 434
;434:	}
LABELV $234
line 405
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
LABELV $236
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $233
line 440
;435:
;436:	// check for modications here
;437:
;438:	// If team overlay is on, ask for updates from the server.  If its off,
;439:	// let the server know so we don't receive it
;440:	if ( drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount ) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $247
line 441
;441:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 443
;442:
;443:		if ( cg_drawTeamOverlay.integer > 0 ) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
LEI4 $251
line 444
;444:			trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $164
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 445
;445:		} else {
ADDRGP4 $252
JUMPV
LABELV $251
line 446
;446:			trap_Cvar_Set( "teamoverlay", "0" );
ADDRGP4 $164
ARGP4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 447
;447:		}
LABELV $252
line 449
;448:		// FIXME E3 HACK
;449:		trap_Cvar_Set( "teamoverlay", "1" );
ADDRGP4 $164
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 450
;450:	}
LABELV $247
line 453
;451:
;452:	// if force model changed
;453:	if ( forceModelModificationCount != cg_forceModel.modificationCount ) {
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
EQI4 $254
line 454
;454:		forceModelModificationCount = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 455
;455:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 456
;456:	}
LABELV $254
line 457
;457:}
LABELV $232
endproc CG_UpdateCvars 12 16
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 459
;458:
;459:int CG_CrosshairPlayer( void ) {
line 460
;460:	if ( cg.time > ( cg.crosshairClientTime + 1000 ) ) {
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+126472
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $259
line 461
;461:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $258
JUMPV
LABELV $259
line 463
;462:	}
;463:	return cg.crosshairClientNum;
ADDRGP4 cg+126468
INDIRI4
RETI4
LABELV $258
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 466
;464:}
;465:
;466:int CG_LastAttacker( void ) {
line 467
;467:	if ( !cg.attackerTime ) {
ADDRGP4 cg+126484
INDIRI4
CNSTI4 0
NEI4 $265
line 468
;468:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $264
JUMPV
LABELV $265
line 470
;469:	}
;470:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $264
endproc CG_LastAttacker 0 0
export CG_Printf
proc CG_Printf 1028 12
line 473
;471:}
;472:
;473:void QDECL CG_Printf( const char *msg, ... ) {
line 477
;474:	va_list		argptr;
;475:	char		text[1024];
;476:
;477:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 478
;478:	vsprintf (text, msg, argptr);
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
line 479
;479:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 481
;480:
;481:	trap_Print( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 482
;482:}
LABELV $269
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 484
;483:
;484:void QDECL CG_Error( const char *msg, ... ) {
line 488
;485:	va_list		argptr;
;486:	char		text[1024];
;487:
;488:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 489
;489:	vsprintf (text, msg, argptr);
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
line 490
;490:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 492
;491:
;492:	trap_Error( text );
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 493
;493:}
LABELV $271
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 498
;494:
;495:#ifndef CGAME_HARD_LINKED
;496:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;497:
;498:void QDECL Com_Error( int level, const char *error, ... ) {
line 502
;499:	va_list		argptr;
;500:	char		text[1024];
;501:
;502:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 503
;503:	vsprintf (text, error, argptr);
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
line 504
;504:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 506
;505:
;506:	CG_Error( "%s", text);
ADDRGP4 $275
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 507
;507:}
LABELV $273
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 509
;508:
;509:void QDECL Com_Printf( const char *msg, ... ) {
line 513
;510:	va_list		argptr;
;511:	char		text[1024];
;512:
;513:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 514
;514:	vsprintf (text, msg, argptr);
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
line 515
;515:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 517
;516:
;517:	CG_Printf ("%s", text);
ADDRGP4 $275
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 518
;518:}
LABELV $276
endproc Com_Printf 1028 12
bss
align 1
LABELV $279
skip 1024
export CG_Argv
code
proc CG_Argv 0 12
line 527
;519:
;520:#endif
;521:
;522:/*
;523:================
;524:CG_Argv
;525:================
;526:*/
;527:const char *CG_Argv( int arg ) {
line 530
;528:	static char	buffer[MAX_STRING_CHARS];
;529:
;530:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $279
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 532
;531:
;532:	return buffer;
ADDRGP4 $279
RETP4
LABELV $278
endproc CG_Argv 0 12
proc CG_RegisterItemSounds 100 12
line 545
;533:}
;534:
;535:
;536://========================================================================
;537:
;538:/*
;539:=================
;540:CG_RegisterItemSounds
;541:
;542:The server says this item is used on this level
;543:=================
;544:*/
;545:static void CG_RegisterItemSounds( int itemNum ) {
line 551
;546:	gitem_t			*item;
;547:	char			data[MAX_QPATH];
;548:	char			*s, *start;
;549:	int				len;
;550:
;551:	item = &bg_itemlist[ itemNum ];
ADDRLP4 76
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 553
;552:
;553:	if( item->pickup_sound ) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $281
line 554
;554:		trap_S_RegisterSound( item->pickup_sound, qfalse );
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
line 555
;555:	}
LABELV $281
line 558
;556:
;557:	// parse the space seperated precache string for other media
;558:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 559
;559:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $285
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $287
LABELV $285
line 560
;560:		return;
ADDRGP4 $280
JUMPV
LABELV $286
line 562
;561:
;562:	while (*s) {
line 563
;563:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $290
JUMPV
LABELV $289
line 564
;564:		while (*s && *s != ' ') {
line 565
;565:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 566
;566:		}
LABELV $290
line 564
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $292
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $289
LABELV $292
line 568
;567:
;568:		len = s-start;
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
line 569
;569:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $295
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $293
LABELV $295
line 570
;570:			CG_Error( "PrecacheItem: %s has bad precache string", 
ADDRGP4 $296
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 572
;571:				item->classname);
;572:			return;
ADDRGP4 $280
JUMPV
LABELV $293
line 574
;573:		}
;574:		memcpy (data, start, len);
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
line 575
;575:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 576
;576:		if ( *s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $297
line 577
;577:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 578
;578:		}
LABELV $297
line 580
;579:
;580:		if ( !strcmp(data+len-3, "wav" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $299
line 581
;581:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 582
;582:		}
LABELV $299
line 585
;583:
;584:		// Ogg Support
;585:		if ( !strcmp(data+len-3, "ogg" )) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $306
ARGP4
ADDRLP4 96
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $303
line 586
;586:			trap_S_RegisterSound( data, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 587
;587:		}
LABELV $303
line 588
;588:	}
LABELV $287
line 562
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $286
line 589
;589:}
LABELV $280
endproc CG_RegisterItemSounds 100 12
proc CG_RegisterSounds 588 16
line 599
;590:
;591:
;592:/*
;593:=================
;594:CG_RegisterSounds
;595:
;596:called during a precache command
;597:=================
;598:*/
;599:static void CG_RegisterSounds( void ) {
line 610
;600:	int		i;
;601:	char	items[MAX_ITEMS+1];
;602:	char	name[MAX_QPATH];
;603:	const char	*soundName;
;604:
;605:	// voice commands
;606:#ifdef MISSIONPACK
;607:	CG_LoadVoiceChats();
;608:#endif
;609:
;610:	cgs.media.oneMinuteSound = trap_S_RegisterSound( "sound/feedback/1_minute.ogg", qtrue );
ADDRGP4 $310
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+828
ADDRLP4 332
INDIRI4
ASGNI4
line 611
;611:	cgs.media.fiveMinuteSound = trap_S_RegisterSound( "sound/feedback/5_minute.ogg", qtrue );
ADDRGP4 $313
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+832
ADDRLP4 336
INDIRI4
ASGNI4
line 612
;612:	cgs.media.suddenDeathSound = trap_S_RegisterSound( "sound/feedback/sudden_death.ogg", qtrue );
ADDRGP4 $316
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+836
ADDRLP4 340
INDIRI4
ASGNI4
line 613
;613:	cgs.media.oneFragSound = trap_S_RegisterSound( "sound/feedback/1_frag.ogg", qtrue );
ADDRGP4 $319
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+848
ADDRLP4 344
INDIRI4
ASGNI4
line 614
;614:	cgs.media.twoFragSound = trap_S_RegisterSound( "sound/feedback/2_frags.ogg", qtrue );
ADDRGP4 $322
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+844
ADDRLP4 348
INDIRI4
ASGNI4
line 615
;615:	cgs.media.threeFragSound = trap_S_RegisterSound( "sound/feedback/3_frags.ogg", qtrue );
ADDRGP4 $325
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+840
ADDRLP4 352
INDIRI4
ASGNI4
line 616
;616:	cgs.media.count3Sound = trap_S_RegisterSound( "sound/feedback/three.ogg", qtrue );
ADDRGP4 $328
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1040
ADDRLP4 356
INDIRI4
ASGNI4
line 617
;617:	cgs.media.count2Sound = trap_S_RegisterSound( "sound/feedback/two.ogg", qtrue );
ADDRGP4 $331
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1044
ADDRLP4 360
INDIRI4
ASGNI4
line 618
;618:	cgs.media.count1Sound = trap_S_RegisterSound( "sound/feedback/one.ogg", qtrue );
ADDRGP4 $334
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1048
ADDRLP4 364
INDIRI4
ASGNI4
line 619
;619:	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.ogg", qtrue );
ADDRGP4 $337
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1052
ADDRLP4 368
INDIRI4
ASGNI4
line 620
;620:	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.ogg", qtrue );
ADDRGP4 $340
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1056
ADDRLP4 372
INDIRI4
ASGNI4
line 621
;621:	cgs.media.zoomStart = trap_S_RegisterSound( "sound/world/electro.ogg", qtrue );
ADDRGP4 $343
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1060
ADDRLP4 376
INDIRI4
ASGNI4
line 622
;622:	cgs.media.zoomEnd = trap_S_RegisterSound( "sound/world/electro.ogg", qtrue );
ADDRGP4 $343
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1064
ADDRLP4 380
INDIRI4
ASGNI4
line 630
;623:	
;624:
;625:
;626:#ifdef MISSIONPACK
;627:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound( "sound/feedback/prepare_team.ogg", qtrue );
;628:#endif
;629:
;630:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $350
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $346
LABELV $350
line 632
;631:
;632:		cgs.media.captureAwardSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.ogg", qtrue );
ADDRGP4 $353
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+952
ADDRLP4 384
INDIRI4
ASGNI4
line 633
;633:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/feedback/redleads.ogg", qtrue );
ADDRGP4 $356
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+964
ADDRLP4 388
INDIRI4
ASGNI4
line 634
;634:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/feedback/blueleads.ogg", qtrue );
ADDRGP4 $359
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+968
ADDRLP4 392
INDIRI4
ASGNI4
line 635
;635:		cgs.media.teamsTiedSound = trap_S_RegisterSound( "sound/feedback/teamstied.ogg", qtrue );
ADDRGP4 $362
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+972
ADDRLP4 396
INDIRI4
ASGNI4
line 636
;636:		cgs.media.hitTeamSound = trap_S_RegisterSound( "sound/feedback/hit_teammate.ogg", qtrue );
ADDRGP4 $365
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+864
ADDRLP4 400
INDIRI4
ASGNI4
line 638
;637:
;638:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_red_scores.ogg", qtrue );
ADDRGP4 $368
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+956
ADDRLP4 404
INDIRI4
ASGNI4
line 639
;639:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_scores.ogg", qtrue );
ADDRGP4 $371
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+960
ADDRLP4 408
INDIRI4
ASGNI4
line 641
;640:
;641:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.ogg", qtrue );
ADDRGP4 $353
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+976
ADDRLP4 412
INDIRI4
ASGNI4
line 642
;642:		cgs.media.captureOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_opponent.ogg", qtrue );
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+980
ADDRLP4 416
INDIRI4
ASGNI4
line 644
;643:
;644:		cgs.media.returnYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_yourteam.ogg", qtrue );
ADDRGP4 $379
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+984
ADDRLP4 420
INDIRI4
ASGNI4
line 645
;645:		cgs.media.returnOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.ogg", qtrue );
ADDRGP4 $382
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+988
ADDRLP4 424
INDIRI4
ASGNI4
line 647
;646:
;647:		cgs.media.takenYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_yourteam.ogg", qtrue );
ADDRGP4 $385
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+992
ADDRLP4 428
INDIRI4
ASGNI4
line 648
;648:		cgs.media.takenOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_opponent.ogg", qtrue );
ADDRGP4 $388
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+996
ADDRLP4 432
INDIRI4
ASGNI4
line 650
;649:
;650:		if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $393
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $389
LABELV $393
line 651
;651:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_red_returned.ogg", qtrue );
ADDRGP4 $396
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1000
ADDRLP4 436
INDIRI4
ASGNI4
line 652
;652:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_returned.ogg", qtrue );
ADDRGP4 $399
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1004
ADDRLP4 440
INDIRI4
ASGNI4
line 653
;653:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_flag.ogg", qtrue );
ADDRGP4 $402
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1012
ADDRLP4 444
INDIRI4
ASGNI4
line 654
;654:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_flag.ogg", qtrue );
ADDRGP4 $405
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1020
ADDRLP4 448
INDIRI4
ASGNI4
line 655
;655:		}
LABELV $389
line 674
;656:
;657:#ifdef MISSIONPACK
;658:		if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;659:			// FIXME: get a replacement for this sound ?
;660:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.ogg", qtrue );
;661:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.ogg", qtrue );
;662:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.ogg", qtrue );
;663:		}
;664:
;665:		if ( cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cg_buildScript.integer ) {
;666:			cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.ogg", qtrue );
;667:			cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.ogg", qtrue);
;668:		}
;669:
;670:		if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;671:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound( "sound/teamplay/voc_base_attack.ogg", qtrue );
;672:		}
;673:#else
;674:		cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.ogg", qtrue );
ADDRGP4 $408
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1028
ADDRLP4 436
INDIRI4
ASGNI4
line 675
;675:		cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.ogg", qtrue);
ADDRGP4 $411
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1036
ADDRLP4 440
INDIRI4
ASGNI4
line 676
;676:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.ogg", qtrue );
ADDRGP4 $382
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1008
ADDRLP4 444
INDIRI4
ASGNI4
line 677
;677:		cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.ogg", qtrue );
ADDRGP4 $416
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1024
ADDRLP4 448
INDIRI4
ASGNI4
line 678
;678:		cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.ogg", qtrue );
ADDRGP4 $419
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1016
ADDRLP4 452
INDIRI4
ASGNI4
line 680
;679:#endif
;680:	}
LABELV $346
line 682
;681:
;682:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $422
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+604
ADDRLP4 384
INDIRI4
ASGNI4
line 683
;683:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $425
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+608
ADDRLP4 388
INDIRI4
ASGNI4
line 684
;684:	cgs.media.wearOffSound = trap_S_RegisterSound( "sound/items/wearoff.ogg", qfalse );
ADDRGP4 $428
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+616
ADDRLP4 392
INDIRI4
ASGNI4
line 685
;685:	cgs.media.useNothingSound = trap_S_RegisterSound( "sound/items/use_nothing.ogg", qfalse );
ADDRGP4 $431
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+612
ADDRLP4 396
INDIRI4
ASGNI4
line 686
;686:	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $434
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+772
ADDRLP4 400
INDIRI4
ASGNI4
line 687
;687:	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $437
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+776
ADDRLP4 404
INDIRI4
ASGNI4
line 688
;688:	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $440
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+780
ADDRLP4 408
INDIRI4
ASGNI4
line 689
;689:	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $443
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+784
ADDRLP4 412
INDIRI4
ASGNI4
line 690
;690:	cgs.media.glassSound = trap_S_RegisterSound( "sound/world/glassbreak.ogg", qfalse );
ADDRGP4 $446
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+788
ADDRLP4 416
INDIRI4
ASGNI4
line 691
;691:	cgs.media.errorSound = trap_S_RegisterSound( "sound/misc/error.ogg", qfalse );
ADDRGP4 $449
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+792
ADDRLP4 420
INDIRI4
ASGNI4
line 710
;692:
;693:#ifdef MISSIONPACK
;694:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.ogg", qfalse );
;695:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.ogg", qfalse );
;696:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.ogg", qfalse );
;697:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.ogg", qfalse );
;698:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.ogg", qfalse );
;699:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.ogg", qfalse );
;700:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.ogg", qfalse );
;701:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.ogg", qfalse );
;702:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.ogg", qfalse );
;703:
;704:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.ogg", qfalse);
;705:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.ogg", qfalse);
;706:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.ogg", qfalse);
;707:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.ogg", qfalse);
;708:#endif
;709:
;710:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.ogg", qfalse );
ADDRGP4 $452
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+796
ADDRLP4 424
INDIRI4
ASGNI4
line 711
;711:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.ogg", qfalse );
ADDRGP4 $455
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+800
ADDRLP4 428
INDIRI4
ASGNI4
line 712
;712:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.ogg", qfalse );
ADDRGP4 $458
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+808
ADDRLP4 432
INDIRI4
ASGNI4
line 714
;713:
;714:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $461
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+804
ADDRLP4 436
INDIRI4
ASGNI4
line 716
;715:
;716:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $464
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+812
ADDRLP4 440
INDIRI4
ASGNI4
line 717
;717:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $467
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+816
ADDRLP4 444
INDIRI4
ASGNI4
line 719
;718:
;719:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.ogg", qfalse );
ADDRGP4 $470
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+852
ADDRLP4 448
INDIRI4
ASGNI4
line 725
;720:#ifdef MISSIONPACK
;721:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.ogg", qfalse );
;722:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.ogg", qfalse );
;723:#endif
;724:
;725:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.ogg", qtrue );
ADDRGP4 $473
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+868
ADDRLP4 452
INDIRI4
ASGNI4
line 726
;726:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.ogg", qtrue );
ADDRGP4 $476
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+872
ADDRLP4 456
INDIRI4
ASGNI4
line 727
;727:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.ogg", qtrue );
ADDRGP4 $479
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+876
ADDRLP4 460
INDIRI4
ASGNI4
line 728
;728:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.ogg", qtrue );
ADDRGP4 $482
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+880
ADDRLP4 464
INDIRI4
ASGNI4
line 729
;729:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.ogg", qtrue );
ADDRGP4 $485
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+884
ADDRLP4 468
INDIRI4
ASGNI4
line 730
;730:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.ogg", qtrue );
ADDRGP4 $488
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+888
ADDRLP4 472
INDIRI4
ASGNI4
line 737
;731:#ifdef MISSIONPACK
;732:	cgs.media.firstImpressiveSound = trap_S_RegisterSound( "sound/feedback/first_impressive.ogg", qtrue );
;733:	cgs.media.firstExcellentSound = trap_S_RegisterSound( "sound/feedback/first_excellent.ogg", qtrue );
;734:	cgs.media.firstHumiliationSound = trap_S_RegisterSound( "sound/feedback/first_gauntlet.ogg", qtrue );
;735:#endif
;736:
;737:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.ogg", qtrue);
ADDRGP4 $491
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+904
ADDRLP4 476
INDIRI4
ASGNI4
line 738
;738:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.ogg", qtrue);
ADDRGP4 $494
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+908
ADDRLP4 480
INDIRI4
ASGNI4
line 739
;739:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.ogg", qtrue);
ADDRGP4 $497
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+912
ADDRLP4 484
INDIRI4
ASGNI4
line 747
;740:
;741:#ifdef MISSIONPACK
;742:	cgs.media.voteNow = trap_S_RegisterSound( "sound/feedback/vote_now.ogg", qtrue);
;743:	cgs.media.votePassed = trap_S_RegisterSound( "sound/feedback/vote_passed.ogg", qtrue);
;744:	cgs.media.voteFailed = trap_S_RegisterSound( "sound/feedback/vote_failed.ogg", qtrue);
;745:#endif
;746:
;747:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.ogg", qfalse);
ADDRGP4 $500
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+928
ADDRLP4 488
INDIRI4
ASGNI4
line 748
;748:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $503
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+932
ADDRLP4 492
INDIRI4
ASGNI4
line 749
;749:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $506
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+936
ADDRLP4 496
INDIRI4
ASGNI4
line 751
;750:
;751:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.ogg", qfalse );
ADDRGP4 $509
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+824
ADDRLP4 500
INDIRI4
ASGNI4
line 753
;752:
;753:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $510
line 754
;754:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
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
line 755
;755:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+154388+620
ADDP4
ADDRLP4 504
INDIRI4
ASGNI4
line 757
;756:
;757:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $517
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 758
;758:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+154388+620+16
ADDP4
ADDRLP4 508
INDIRI4
ASGNI4
line 760
;759:
;760:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $521
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 761
;761:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+154388+620+32
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 763
;762:
;763:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $525
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 764
;764:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
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
ADDRGP4 cgs+154388+620+48
ADDP4
ADDRLP4 516
INDIRI4
ASGNI4
line 766
;765:
;766:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 767
;767:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+620+64
ADDP4
ADDRLP4 520
INDIRI4
ASGNI4
line 769
;768:
;769:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $533
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 770
;770:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+620+96
ADDP4
ADDRLP4 524
INDIRI4
ASGNI4
line 772
;771:
;772:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $537
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 773
;773:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+620+80
ADDP4
ADDRLP4 528
INDIRI4
ASGNI4
line 774
;774:	}
LABELV $511
line 753
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $510
line 777
;775:
;776:	// only register the items that the server says we need
;777:	strcpy( items, CG_ConfigString( CS_ITEMS ) );
CNSTI4 27
ARGI4
ADDRLP4 504
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 779
;778:
;779:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $544
JUMPV
LABELV $541
line 781
;780://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;781:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 783
;782://		}
;783:	}
LABELV $542
line 779
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $544
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $541
line 785
;784:
;785:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $545
line 786
;786:		soundName = CG_ConfigString( CS_SOUNDS+i );
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 508
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 508
INDIRP4
ASGNP4
line 787
;787:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $549
line 788
;788:			break;
ADDRGP4 $547
JUMPV
LABELV $549
line 790
;789:		}
;790:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $551
line 791
;791:			continue;	// custom sound
ADDRGP4 $546
JUMPV
LABELV $551
line 793
;792:		}
;793:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
ADDRLP4 68
INDIRP4
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
ADDRGP4 cgs+35848
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 794
;794:	}
LABELV $546
line 785
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $545
LABELV $547
line 797
;795:
;796:	// FIXME: only needed with item
;797:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.ogg", qfalse );
ADDRGP4 $556
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+940
ADDRLP4 508
INDIRI4
ASGNI4
line 798
;798:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.ogg", qfalse);
ADDRGP4 $559
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+944
ADDRLP4 512
INDIRI4
ASGNI4
line 799
;799:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.ogg", qfalse);
ADDRGP4 $562
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+600
ADDRLP4 516
INDIRI4
ASGNI4
line 800
;800:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $565
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+744
ADDRLP4 520
INDIRI4
ASGNI4
line 801
;801:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $568
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+748
ADDRLP4 524
INDIRI4
ASGNI4
line 802
;802:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $571
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+752
ADDRLP4 528
INDIRI4
ASGNI4
line 803
;803:	cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
ADDRGP4 $574
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 532
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+756
ADDRLP4 532
INDIRI4
ASGNI4
line 804
;804:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $577
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 536
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+760
ADDRLP4 536
INDIRI4
ASGNI4
line 805
;805:	cgs.media.sfx_devexp = trap_S_RegisterSound ("sound/weapons/bfg/devhit.wav", qfalse);
ADDRGP4 $580
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+764
ADDRLP4 540
INDIRI4
ASGNI4
line 806
;806:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $583
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+768
ADDRLP4 544
INDIRI4
ASGNI4
line 807
;807:	cgs.media.flameBallShader = trap_R_RegisterShader( "sprites/flameball" );
ADDRGP4 $586
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+516
ADDRLP4 548
INDIRI4
ASGNI4
line 808
;808:	cgs.media.bfgBallShader = trap_R_RegisterShader( "sprites/bfgball" );
ADDRGP4 $589
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+524
ADDRLP4 552
INDIRI4
ASGNI4
line 809
;809:	cgs.media.turretFireShader = trap_R_RegisterShader( "sprites/turretfire" );
ADDRGP4 $592
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+528
ADDRLP4 556
INDIRI4
ASGNI4
line 833
;810:	
;811:#ifdef MISSIONPACK
;812:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
;813:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
;814:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
;815:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
;816:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
;817:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
;818:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
;819:	cgs.media.weaponHoverSound = trap_S_RegisterSound( "sound/weapons/weapon_hover.wav", qfalse );
;820:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.ogg", qfalse );
;821:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.ogg", qfalse );
;822:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.ogg", qfalse );
;823:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.ogg", qfalse );
;824:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.ogg", qfalse );
;825:	cgs.media.youSuckSound = trap_S_RegisterSound( "sound/misc/yousuck.ogg", qfalse );
;826:
;827:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;828:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;829:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;830:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;831:#endif
;832:
;833:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.ogg", qfalse);
ADDRGP4 $595
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 560
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1080
ADDRLP4 560
INDIRI4
ASGNI4
line 834
;834:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.ogg", qfalse);
ADDRGP4 $598
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 564
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1084
ADDRLP4 564
INDIRI4
ASGNI4
line 835
;835:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.ogg", qfalse );
ADDRGP4 $601
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 568
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1088
ADDRLP4 568
INDIRI4
ASGNI4
line 836
;836:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $604
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 572
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1092
ADDRLP4 572
INDIRI4
ASGNI4
line 837
;837:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $607
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 576
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1096
ADDRLP4 576
INDIRI4
ASGNI4
line 839
;838:
;839:	cgs.media.hplb1aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb1a.wav", qfalse);
ADDRGP4 $610
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 580
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1132
ADDRLP4 580
INDIRI4
ASGNI4
line 840
;840:	cgs.media.hplb2aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb2a.wav", qfalse);
ADDRGP4 $613
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 584
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1136
ADDRLP4 584
INDIRI4
ASGNI4
line 871
;841:
;842:
;843:#ifdef MISSIONPACK
;844:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse );
;845:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse );
;846:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse );
;847:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse );
;848:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse );
;849:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse );
;850:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse );
;851:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse );
;852:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse );
;853:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse );
;854:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse );
;855:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse );
;856:
;857:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse );
;858:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse );
;859:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse );
;860:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse );
;861:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse );
;862:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse );
;863:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse );
;864:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse );
;865:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse );
;866:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse );
;867:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse );
;868:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse );
;869:#endif
;870:
;871:}
LABELV $307
endproc CG_RegisterSounds 588 16
data
align 4
LABELV $615
address $616
address $617
address $618
address $619
address $620
address $621
address $622
address $623
address $624
address $625
address $626
code
proc CG_RegisterGraphics 660 16
line 884
;872:
;873:
;874://===================================================================================
;875:
;876:
;877:/*
;878:=================
;879:CG_RegisterGraphics
;880:
;881:This function may execute for a couple of minutes with a slow disk.
;882:=================
;883:*/
;884:static void CG_RegisterGraphics( void ) {
line 902
;885:	int			i;
;886:	char		items[MAX_ITEMS+1];
;887:	static char		*sb_nums[11] = {
;888:		"gfx/2d/numbers/zero_32b",
;889:		"gfx/2d/numbers/one_32b",
;890:		"gfx/2d/numbers/two_32b",
;891:		"gfx/2d/numbers/three_32b",
;892:		"gfx/2d/numbers/four_32b",
;893:		"gfx/2d/numbers/five_32b",
;894:		"gfx/2d/numbers/six_32b",
;895:		"gfx/2d/numbers/seven_32b",
;896:		"gfx/2d/numbers/eight_32b",
;897:		"gfx/2d/numbers/nine_32b",
;898:		"gfx/2d/numbers/minus_32b",
;899:	};
;900:
;901:	// clear any references to old media
;902:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+111104
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 903
;903:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 905
;904:
;905:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 907
;906:
;907:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 910
;908:
;909:	// precache status bar pics
;910:	CG_LoadingString( "game media" );
ADDRGP4 $631
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 912
;911:
;912:	for ( i=0 ; i<11 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $632
line 913
;913:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 $615
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 cgs+154388+324
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 914
;914:	}
LABELV $633
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $632
line 916
;915:
;916:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $640
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372
ADDRLP4 264
INDIRI4
ASGNI4
line 917
;917:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $644
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+4
ADDRLP4 268
INDIRI4
ASGNI4
line 918
;918:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $648
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+8
ADDRLP4 272
INDIRI4
ASGNI4
line 919
;919:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $652
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+12
ADDRLP4 276
INDIRI4
ASGNI4
line 920
;920:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $656
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+16
ADDRLP4 280
INDIRI4
ASGNI4
line 922
;921:
;922:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $659
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+228
ADDRLP4 284
INDIRI4
ASGNI4
line 924
;923:
;924:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $662
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+132
ADDRLP4 288
INDIRI4
ASGNI4
line 926
;925:
;926:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $665
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+544
ADDRLP4 292
INDIRI4
ASGNI4
line 927
;927:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $668
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+548
ADDRLP4 296
INDIRI4
ASGNI4
line 928
;928:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $671
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+552
ADDRLP4 300
INDIRI4
ASGNI4
line 929
;929:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $674
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+560
ADDRLP4 304
INDIRI4
ASGNI4
line 930
;930:	cgs.media.scoreboardTrep = trap_R_RegisterShaderNoMip( "menu/tab/scoreboard.tga" ); // Shafe
ADDRGP4 $677
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+556
ADDRLP4 308
INDIRI4
ASGNI4
line 933
;931:
;932:	// Trepidation hud
;933:	cgs.media.HudLeft = trap_R_RegisterShaderNoMip( "gfx/2d/hud/hud_left.tga" );
ADDRGP4 $680
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+564
ADDRLP4 312
INDIRI4
ASGNI4
line 934
;934:	cgs.media.HudRight = trap_R_RegisterShaderNoMip( "gfx/2d/hud/hud_right.tga" );
ADDRGP4 $683
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+568
ADDRLP4 316
INDIRI4
ASGNI4
line 936
;935:
;936:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $686
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+288
ADDRLP4 320
INDIRI4
ASGNI4
line 937
;937:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $689
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+292
ADDRLP4 324
INDIRI4
ASGNI4
line 940
;938:
;939:	// Zoom Overlay
;940:	cgs.media.ZoomOverlay = trap_R_RegisterShaderNoMip( "gfx/2d/scope.tga" );
ADDRGP4 $692
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+572
ADDRLP4 328
INDIRI4
ASGNI4
line 943
;941:
;942:	// Shafe - Singularity Cannon Shaders
;943:	cgs.media.smokePuffShader2 = trap_R_RegisterShader( "smokePuff2" );
ADDRGP4 $695
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+296
ADDRLP4 332
INDIRI4
ASGNI4
line 944
;944:	cgs.media.smokePuffRageProShader2 = trap_R_RegisterShader( "smokePuffRagePro2" );
ADDRGP4 $698
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+300
ADDRLP4 336
INDIRI4
ASGNI4
line 947
;945:	// End Shafe
;946:
;947:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $701
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+304
ADDRLP4 340
INDIRI4
ASGNI4
line 954
;948:
;949:
;950:#ifdef MISSIONPACK
;951:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
;952:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
;953:#endif
;954:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $704
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+308
ADDRLP4 344
INDIRI4
ASGNI4
line 955
;955:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $707
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+316
ADDRLP4 348
INDIRI4
ASGNI4
line 956
;956:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $710
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+276
ADDRLP4 352
INDIRI4
ASGNI4
line 957
;957:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $713
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+220
ADDRLP4 356
INDIRI4
ASGNI4
line 959
;958:
;959:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $716
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+312
ADDRLP4 360
INDIRI4
ASGNI4
line 960
;960:	cgs.media.sgTrailShader = trap_R_RegisterShader( "sgTrail" );
ADDRGP4 $719
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+320
ADDRLP4 364
INDIRI4
ASGNI4
line 962
;961:
;962:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $722
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+232
ADDRLP4 368
INDIRI4
ASGNI4
line 963
;963:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $725
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+224
ADDRLP4 372
INDIRI4
ASGNI4
line 965
;964:
;965:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $726
line 966
;966:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $732
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 380
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+154388+236
ADDP4
ADDRLP4 384
INDIRI4
ASGNI4
line 967
;967:	}
LABELV $727
line 965
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $726
line 969
;968:
;969:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $735
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+280
ADDRLP4 376
INDIRI4
ASGNI4
line 970
;970:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $738
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+284
ADDRLP4 380
INDIRI4
ASGNI4
line 973
;971:
;972:	// powerup shaders
;973:	cgs.media.buildShader = trap_R_RegisterShader("powerups/build" );
ADDRGP4 $741
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+424
ADDRLP4 384
INDIRI4
ASGNI4
line 974
;974:	cgs.media.reditemShader = trap_R_RegisterShader("powerups/reditem" );
ADDRGP4 $744
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+428
ADDRLP4 388
INDIRI4
ASGNI4
line 975
;975:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $747
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+416
ADDRLP4 392
INDIRI4
ASGNI4
line 976
;976:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $750
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+432
ADDRLP4 396
INDIRI4
ASGNI4
line 977
;977:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $753
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+444
ADDRLP4 400
INDIRI4
ASGNI4
line 978
;978:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $756
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+448
ADDRLP4 404
INDIRI4
ASGNI4
line 979
;979:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $759
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+436
ADDRLP4 408
INDIRI4
ASGNI4
line 980
;980:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $762
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+440
ADDRLP4 412
INDIRI4
ASGNI4
line 981
;981:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $765
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+452
ADDRLP4 416
INDIRI4
ASGNI4
line 984
;982:	
;983:	// -Vincent
;984:	cgs.media.immobilizedShader	= trap_R_RegisterShader("powerups/immobilized" );
ADDRGP4 $768
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+464
ADDRLP4 420
INDIRI4
ASGNI4
line 985
;985:	cgs.media.immobilizedWepShader = trap_R_RegisterShader("powerups/immobilizedWeapon" );
ADDRGP4 $771
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+468
ADDRLP4 424
INDIRI4
ASGNI4
line 990
;986:
;987:#ifdef MISSIONPACK
;988:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;989:#else
;990:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $776
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $772
LABELV $776
line 992
;991:#endif
;992:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $779
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+20
ADDRLP4 428
INDIRI4
ASGNI4
line 993
;993:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $782
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+24
ADDRLP4 432
INDIRI4
ASGNI4
line 994
;994:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $785
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+28
ADDRLP4 436
INDIRI4
ASGNI4
line 995
;995:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $788
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+32
ADDRLP4 440
INDIRI4
ASGNI4
line 996
;996:	}
LABELV $772
line 1001
;997:
;998:#ifdef MISSIONPACK
;999:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1000:#else
;1001:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $793
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $789
LABELV $793
line 1003
;1002:#endif
;1003:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $796
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+36
ADDRLP4 428
INDIRI4
ASGNI4
line 1004
;1004:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $799
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+40
ADDRLP4 432
INDIRI4
ASGNI4
line 1005
;1005:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $802
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+48
ADDRLP4 436
INDIRI4
ASGNI4
line 1006
;1006:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $806
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+48+4
ADDRLP4 440
INDIRI4
ASGNI4
line 1007
;1007:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $810
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+48+8
ADDRLP4 444
INDIRI4
ASGNI4
line 1008
;1008:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $813
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+60
ADDRLP4 448
INDIRI4
ASGNI4
line 1009
;1009:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $817
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+60+4
ADDRLP4 452
INDIRI4
ASGNI4
line 1010
;1010:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $821
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+60+8
ADDRLP4 456
INDIRI4
ASGNI4
line 1023
;1011:#ifdef MISSIONPACK
;1012:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
;1013:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
;1014:
;1015:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
;1016:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
;1017:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
;1018:
;1019:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
;1020:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
;1021:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
;1022:#endif
;1023:	}
LABELV $789
line 1052
;1024:
;1025:#ifdef MISSIONPACK
;1026:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;1027:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
;1028:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
;1029:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
;1030:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
;1031:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
;1032:	}
;1033:
;1034:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;1035:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
;1036:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
;1037:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
;1038:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
;1039:	}
;1040:
;1041:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1042:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
;1043:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
;1044:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
;1045:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
;1046:	}
;1047:
;1048:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
;1049:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
;1050:#endif
;1051:
;1052:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $826
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $822
LABELV $826
line 1053
;1053:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
ADDRGP4 $829
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+212
ADDRLP4 428
INDIRI4
ASGNI4
line 1054
;1054:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $832
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+420
ADDRLP4 432
INDIRI4
ASGNI4
line 1055
;1055:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $835
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+128
ADDRLP4 436
INDIRI4
ASGNI4
line 1059
;1056:#ifdef MISSIONPACK
;1057:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
;1058:#endif
;1059:	}
LABELV $822
line 1061
;1060:
;1061:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $838
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+120
ADDRLP4 428
INDIRI4
ASGNI4
line 1062
;1062:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $841
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+124
ADDRLP4 432
INDIRI4
ASGNI4
line 1064
;1063:
;1064:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $844
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+192
ADDRLP4 436
INDIRI4
ASGNI4
line 1065
;1065:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $847
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+196
ADDRLP4 440
INDIRI4
ASGNI4
line 1067
;1066:
;1067:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $850
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+136
ADDRLP4 444
INDIRI4
ASGNI4
line 1068
;1068:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $853
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+140
ADDRLP4 448
INDIRI4
ASGNI4
line 1069
;1069:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $856
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+144
ADDRLP4 452
INDIRI4
ASGNI4
line 1070
;1070:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $859
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+148
ADDRLP4 456
INDIRI4
ASGNI4
line 1071
;1071:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $862
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+152
ADDRLP4 460
INDIRI4
ASGNI4
line 1072
;1072:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $865
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+156
ADDRLP4 464
INDIRI4
ASGNI4
line 1073
;1073:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $868
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+160
ADDRLP4 468
INDIRI4
ASGNI4
line 1074
;1074:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $871
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+164
ADDRLP4 472
INDIRI4
ASGNI4
line 1075
;1075:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $874
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+168
ADDRLP4 476
INDIRI4
ASGNI4
line 1076
;1076:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $877
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+172
ADDRLP4 480
INDIRI4
ASGNI4
line 1079
;1077:	
;1078:	// Shafe - Need To Make Models For These
;1079:	cgs.media.glass01 = trap_R_RegisterModel( "models/breakables/glass01.md3" );
ADDRGP4 $880
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+176
ADDRLP4 484
INDIRI4
ASGNI4
line 1080
;1080: 	cgs.media.glass02 = trap_R_RegisterModel( "models/breakables/glass02.md3" );
ADDRGP4 $883
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+180
ADDRLP4 488
INDIRI4
ASGNI4
line 1081
;1081: 	cgs.media.glass03 = trap_R_RegisterModel( "models/breakables/glass03.md3" );
ADDRGP4 $886
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+184
ADDRLP4 492
INDIRI4
ASGNI4
line 1084
;1082:
;1083:
;1084:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $847
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+188
ADDRLP4 496
INDIRI4
ASGNI4
line 1086
;1085:
;1086:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $891
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+216
ADDRLP4 500
INDIRI4
ASGNI4
line 1088
;1087:
;1088:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $894
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+512
ADDRLP4 504
INDIRI4
ASGNI4
line 1090
;1089:
;1090:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $897
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+472
ADDRLP4 508
INDIRI4
ASGNI4
line 1091
;1091:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $900
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+476
ADDRLP4 512
INDIRI4
ASGNI4
line 1092
;1092:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $903
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+480
ADDRLP4 516
INDIRI4
ASGNI4
line 1096
;1093:#ifdef MISSIONPACK
;1094:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/powerups/pop.md3" );
;1095:#else
;1096:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
ADDRGP4 $906
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+532
ADDRLP4 520
INDIRI4
ASGNI4
line 1097
;1097:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
ADDRGP4 $909
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+536
ADDRLP4 524
INDIRI4
ASGNI4
line 1115
;1098:#endif
;1099:#ifdef MISSIONPACK
;1100:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
;1101:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
;1102:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
;1103:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
;1104:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
;1105:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
;1106:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
;1107:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
;1108:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
;1109:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
;1110:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
;1111:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
;1112:
;1113:#endif
;1114:
;1115:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
ADDRGP4 $912
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+540
ADDRLP4 528
INDIRI4
ASGNI4
line 1116
;1116:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $915
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+576
ADDRLP4 532
INDIRI4
ASGNI4
line 1117
;1117:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $918
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+580
ADDRLP4 536
INDIRI4
ASGNI4
line 1118
;1118:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $921
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+584
ADDRLP4 540
INDIRI4
ASGNI4
line 1119
;1119:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $924
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+588
ADDRLP4 544
INDIRI4
ASGNI4
line 1120
;1120:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $927
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+592
ADDRLP4 548
INDIRI4
ASGNI4
line 1121
;1121:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $930
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+596
ADDRLP4 552
INDIRI4
ASGNI4
line 1124
;1122:
;1123:
;1124:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1125
;1125:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1128
;1126:
;1127:	// only register the items that the server says we need
;1128:	strcpy( items, CG_ConfigString( CS_ITEMS) );
CNSTI4 27
ARGI4
ADDRLP4 556
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 556
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1130
;1129:
;1130:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $934
JUMPV
LABELV $931
line 1131
;1131:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $938
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $935
LABELV $938
line 1132
;1132:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1133
;1133:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1134
;1134:		}
LABELV $935
line 1135
;1135:	}
LABELV $932
line 1130
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $934
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $931
line 1138
;1136:
;1137:	// wall marks
;1138:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $941
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+400
ADDRLP4 560
INDIRI4
ASGNI4
line 1139
;1139:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $944
ARGP4
ADDRLP4 564
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+404
ADDRLP4 564
INDIRI4
ASGNI4
line 1140
;1140:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $947
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+408
ADDRLP4 568
INDIRI4
ASGNI4
line 1141
;1141:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $950
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+412
ADDRLP4 572
INDIRI4
ASGNI4
line 1142
;1142:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $953
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+368
ADDRLP4 576
INDIRI4
ASGNI4
line 1143
;1143:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $956
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+392
ADDRLP4 580
INDIRI4
ASGNI4
line 1144
;1144:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $959
ARGP4
ADDRLP4 584
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+396
ADDRLP4 584
INDIRI4
ASGNI4
line 1147
;1145:
;1146:	// Shafe - Trep - Radar
;1147:	cgs.media.scannerShader = trap_R_RegisterShader("Scanner");
ADDRGP4 $962
ARGP4
ADDRLP4 588
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1116
ADDRLP4 588
INDIRI4
ASGNI4
line 1148
;1148:    cgs.media.scannerBlipShader = trap_R_RegisterShader("ScannerBlip");
ADDRGP4 $965
ARGP4
ADDRLP4 592
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1120
ADDRLP4 592
INDIRI4
ASGNI4
line 1149
;1149:    cgs.media.scannerBlipUpShader = trap_R_RegisterShader("ScannerBlipUp");
ADDRGP4 $968
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1124
ADDRLP4 596
INDIRI4
ASGNI4
line 1150
;1150:    cgs.media.scannerBlipDownShader = trap_R_RegisterShader("ScannerBlipDown");
ADDRGP4 $971
ARGP4
ADDRLP4 600
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1128
ADDRLP4 600
INDIRI4
ASGNI4
line 1154
;1151:	// Shafe - Trep - End Radar
;1152:
;1153:	// register the inline models
;1154:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 604
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36872
ADDRLP4 604
INDIRI4
ASGNI4
line 1155
;1155:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $976
JUMPV
LABELV $973
line 1160
;1156:		char	name[10];
;1157:		vec3_t			mins, maxs;
;1158:		int				j;
;1159:
;1160:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 636
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $978
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1161
;1161:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
ADDRLP4 636
ARGP4
ADDRLP4 648
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
ADDRLP4 648
INDIRI4
ASGNI4
line 1162
;1162:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
INDIRI4
ARGI4
ADDRLP4 612
ARGP4
ADDRLP4 624
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1163
;1163:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 608
CNSTI4 0
ASGNI4
LABELV $981
line 1164
;1164:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
ADDRLP4 652
ADDRLP4 608
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 656
ADDRLP4 652
INDIRI4
ADDRLP4 612
ADDP4
INDIRF4
ASGNF4
ADDRLP4 652
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+37900
ADDP4
ADDP4
ADDRLP4 656
INDIRF4
CNSTF4 1056964608
ADDRLP4 652
INDIRI4
ADDRLP4 624
ADDP4
INDIRF4
ADDRLP4 656
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 1165
;1165:		}
LABELV $982
line 1163
ADDRLP4 608
ADDRLP4 608
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 608
INDIRI4
CNSTI4 3
LTI4 $981
line 1166
;1166:	}
LABELV $974
line 1155
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $976
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36872
INDIRI4
LTI4 $973
line 1169
;1167:
;1168:	// register all the server specified models
;1169:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $986
line 1172
;1170:		const char		*modelName;
;1171:
;1172:		modelName = CG_ConfigString( CS_MODELS+i );
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 612
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 608
ADDRLP4 612
INDIRP4
ASGNP4
line 1173
;1173:		if ( !modelName[0] ) {
ADDRLP4 608
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $990
line 1174
;1174:			break;
ADDRGP4 $988
JUMPV
LABELV $990
line 1176
;1175:		}
;1176:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
ADDRLP4 608
INDIRP4
ARGP4
ADDRLP4 616
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
ADDRLP4 616
INDIRI4
ASGNI4
line 1177
;1177:	}
LABELV $987
line 1169
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $986
LABELV $988
line 1205
;1178:
;1179:#ifdef MISSIONPACK
;1180:	// new stuff
;1181:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
;1182:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
;1183:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
;1184:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
;1185:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
;1186:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
;1187:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
;1188:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
;1189:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
;1190:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
;1191:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
;1192:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
;1193:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
;1194:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
;1195:
;1196:	trap_R_RegisterModel( "models/players/james/lower.md3" );
;1197:	trap_R_RegisterModel( "models/players/james/upper.md3" );
;1198:	trap_R_RegisterModel( "models/players/heads/james/james.md3" );
;1199:
;1200:	trap_R_RegisterModel( "models/players/janet/lower.md3" );
;1201:	trap_R_RegisterModel( "models/players/janet/upper.md3" );
;1202:	trap_R_RegisterModel( "models/players/heads/janet/janet.md3" );
;1203:
;1204:#endif
;1205:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1218
;1206:/*
;1207:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1208:	{
;1209:		{
;1210:			int rval;
;1211:
;1212:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1213:			if (!rval)
;1214:				break;
;1215:		}
;1216:	}
;1217:*/
;1218:}
LABELV $614
endproc CG_RegisterGraphics 660 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1228
;1219:
;1220:
;1221:
;1222:/*																																			
;1223:=======================
;1224:CG_BuildSpectatorString
;1225:
;1226:=======================
;1227:*/
;1228:void CG_BuildSpectatorString() {
line 1230
;1229:	int i;
;1230:	cg.spectatorList[0] = 0;
ADDRGP4 cg+116432
CNSTI1 0
ASGNI1
line 1231
;1231:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $995
line 1232
;1232:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
ADDRLP4 4
CNSTI4 1740
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
EQI4 $999
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $999
line 1233
;1233:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $1006
ARGP4
CNSTI4 1740
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
ADDRGP4 cg+116432
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1234
;1234:		}
LABELV $999
line 1235
;1235:	}
LABELV $996
line 1231
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $995
line 1236
;1236:	i = strlen(cg.spectatorList);
ADDRGP4 cg+116432
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1237
;1237:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+117456
INDIRI4
EQI4 $1010
line 1238
;1238:		cg.spectatorLen = i;
ADDRGP4 cg+117456
ADDRLP4 0
INDIRI4
ASGNI4
line 1239
;1239:		cg.spectatorWidth = -1;
ADDRGP4 cg+117460
CNSTF4 3212836864
ASGNF4
line 1240
;1240:	}
LABELV $1010
line 1241
;1241:}
LABELV $993
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1249
;1242:
;1243:
;1244:/*																																			
;1245:===================
;1246:CG_RegisterClients
;1247:===================
;1248:*/
;1249:static void CG_RegisterClients( void ) {
line 1252
;1250:	int		i;
;1251:
;1252:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1253
;1253:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1255
;1254:
;1255:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1018
line 1258
;1256:		const char		*clientInfo;
;1257:
;1258:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1022
line 1259
;1259:			continue;
ADDRGP4 $1019
JUMPV
LABELV $1022
line 1262
;1260:		}
;1261:
;1262:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
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
line 1263
;1263:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1025
line 1264
;1264:			continue;
ADDRGP4 $1019
JUMPV
LABELV $1025
line 1266
;1265:		}
;1266:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1267
;1267:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1268
;1268:	}
LABELV $1019
line 1255
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1018
line 1269
;1269:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1270
;1270:}
LABELV $1015
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1279
;1271:
;1272://===========================================================================
;1273:
;1274:/*
;1275:=================
;1276:CG_ConfigString
;1277:=================
;1278:*/
;1279:const char *CG_ConfigString( int index ) {
line 1280
;1280:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1030
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1028
LABELV $1030
line 1281
;1281:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $1031
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1282
;1282:	}
LABELV $1028
line 1283
;1283:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
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
LABELV $1027
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1294
;1284:}
;1285:
;1286://==================================================================
;1287:
;1288:/*
;1289:======================
;1290:CG_StartMusic
;1291:
;1292:======================
;1293:*/
;1294:void CG_StartMusic( void ) {
line 1299
;1295:	char	*s;
;1296:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1297:
;1298:	// start the background music
;1299:	s = (char *)CG_ConfigString( CS_MUSIC );
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
line 1300
;1300:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
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
line 1301
;1301:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
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
line 1303
;1302:
;1303:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1304
;1304:}
LABELV $1033
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 44 12
line 1970
;1305:#ifdef MISSIONPACK
;1306:char *CG_GetMenuBuffer(const char *filename) {
;1307:	int	len;
;1308:	fileHandle_t	f;
;1309:	static char buf[MAX_MENUFILE];
;1310:
;1311:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;1312:	if ( !f ) {
;1313:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
;1314:		return NULL;
;1315:	}
;1316:	if ( len >= MAX_MENUFILE ) {
;1317:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
;1318:		trap_FS_FCloseFile( f );
;1319:		return NULL;
;1320:	}
;1321:
;1322:	trap_FS_Read( buf, len, f );
;1323:	buf[len] = 0;
;1324:	trap_FS_FCloseFile( f );
;1325:
;1326:	return buf;
;1327:}
;1328:
;1329://
;1330:// ==============================
;1331:// new hud stuff ( mission pack )
;1332:// ==============================
;1333://
;1334:qboolean CG_Asset_Parse(int handle) {
;1335:	pc_token_t token;
;1336:	const char *tempStr;
;1337:
;1338:	if (!trap_PC_ReadToken(handle, &token))
;1339:		return qfalse;
;1340:	if (Q_stricmp(token.string, "{") != 0) {
;1341:		return qfalse;
;1342:	}
;1343:    
;1344:	while ( 1 ) {
;1345:		if (!trap_PC_ReadToken(handle, &token))
;1346:			return qfalse;
;1347:
;1348:		if (Q_stricmp(token.string, "}") == 0) {
;1349:			return qtrue;
;1350:		}
;1351:
;1352:		// font
;1353:		if (Q_stricmp(token.string, "font") == 0) {
;1354:			int pointSize;
;1355:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1356:				return qfalse;
;1357:			}
;1358:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1359:			continue;
;1360:		}
;1361:
;1362:		// smallFont
;1363:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1364:			int pointSize;
;1365:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1366:				return qfalse;
;1367:			}
;1368:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1369:			continue;
;1370:		}
;1371:
;1372:		// font
;1373:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1374:			int pointSize;
;1375:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1376:				return qfalse;
;1377:			}
;1378:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1379:			continue;
;1380:		}
;1381:
;1382:		// gradientbar
;1383:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1384:			if (!PC_String_Parse(handle, &tempStr)) {
;1385:				return qfalse;
;1386:			}
;1387:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1388:			continue;
;1389:		}
;1390:
;1391:		// enterMenuSound
;1392:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1393:			if (!PC_String_Parse(handle, &tempStr)) {
;1394:				return qfalse;
;1395:			}
;1396:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
;1397:			continue;
;1398:		}
;1399:
;1400:		// exitMenuSound
;1401:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1402:			if (!PC_String_Parse(handle, &tempStr)) {
;1403:				return qfalse;
;1404:			}
;1405:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
;1406:			continue;
;1407:		}
;1408:
;1409:		// itemFocusSound
;1410:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1411:			if (!PC_String_Parse(handle, &tempStr)) {
;1412:				return qfalse;
;1413:			}
;1414:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
;1415:			continue;
;1416:		}
;1417:
;1418:		// menuBuzzSound
;1419:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1420:			if (!PC_String_Parse(handle, &tempStr)) {
;1421:				return qfalse;
;1422:			}
;1423:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
;1424:			continue;
;1425:		}
;1426:
;1427:		if (Q_stricmp(token.string, "cursor") == 0) {
;1428:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1429:				return qfalse;
;1430:			}
;1431:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
;1432:			continue;
;1433:		}
;1434:
;1435:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1436:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1437:				return qfalse;
;1438:			}
;1439:			continue;
;1440:		}
;1441:
;1442:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1443:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1444:				return qfalse;
;1445:			}
;1446:			continue;
;1447:		}
;1448:
;1449:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1450:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1451:				return qfalse;
;1452:			}
;1453:			continue;
;1454:		}
;1455:
;1456:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1457:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1458:				return qfalse;
;1459:			}
;1460:			continue;
;1461:		}
;1462:
;1463:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1464:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1465:				return qfalse;
;1466:			}
;1467:			continue;
;1468:		}
;1469:
;1470:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1471:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1472:				return qfalse;
;1473:			}
;1474:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1475:			continue;
;1476:		}
;1477:	}
;1478:	return qfalse; // bk001204 - why not?
;1479:}
;1480:
;1481:void CG_ParseMenu(const char *menuFile) {
;1482:	pc_token_t token;
;1483:	int handle;
;1484:
;1485:	handle = trap_PC_LoadSource(menuFile);
;1486:	if (!handle)
;1487:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1488:	if (!handle)
;1489:		return;
;1490:
;1491:	while ( 1 ) {
;1492:		if (!trap_PC_ReadToken( handle, &token )) {
;1493:			break;
;1494:		}
;1495:
;1496:		//if ( Q_stricmp( token, "{" ) ) {
;1497:		//	Com_Printf( "Missing { in menu file\n" );
;1498:		//	break;
;1499:		//}
;1500:
;1501:		//if ( menuCount == MAX_MENUS ) {
;1502:		//	Com_Printf( "Too many menus!\n" );
;1503:		//	break;
;1504:		//}
;1505:
;1506:		if ( token.string[0] == '}' ) {
;1507:			break;
;1508:		}
;1509:
;1510:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1511:			if (CG_Asset_Parse(handle)) {
;1512:				continue;
;1513:			} else {
;1514:				break;
;1515:			}
;1516:		}
;1517:
;1518:
;1519:		if (Q_stricmp(token.string, "menudef") == 0) {
;1520:			// start a new menu
;1521:			Menu_New(handle);
;1522:		}
;1523:	}
;1524:	trap_PC_FreeSource(handle);
;1525:}
;1526:
;1527:qboolean CG_Load_Menu(char **p) {
;1528:	char *token;
;1529:
;1530:	token = COM_ParseExt(p, qtrue);
;1531:
;1532:	if (token[0] != '{') {
;1533:		return qfalse;
;1534:	}
;1535:
;1536:	while ( 1 ) {
;1537:
;1538:		token = COM_ParseExt(p, qtrue);
;1539:    
;1540:		if (Q_stricmp(token, "}") == 0) {
;1541:			return qtrue;
;1542:		}
;1543:
;1544:		if ( !token || token[0] == 0 ) {
;1545:			return qfalse;
;1546:		}
;1547:
;1548:		CG_ParseMenu(token); 
;1549:	}
;1550:	return qfalse;
;1551:}
;1552:
;1553:
;1554:
;1555:void CG_LoadMenus(const char *menuFile) {
;1556:	char	*token;
;1557:	char *p;
;1558:	int	len, start;
;1559:	fileHandle_t	f;
;1560:	static char buf[MAX_MENUDEFFILE];
;1561:
;1562:	start = trap_Milliseconds();
;1563:
;1564:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
;1565:	if ( !f ) {
;1566:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
;1567:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
;1568:		if (!f) {
;1569:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
;1570:		}
;1571:	}
;1572:
;1573:	if ( len >= MAX_MENUDEFFILE ) {
;1574:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
;1575:		trap_FS_FCloseFile( f );
;1576:		return;
;1577:	}
;1578:
;1579:	trap_FS_Read( buf, len, f );
;1580:	buf[len] = 0;
;1581:	trap_FS_FCloseFile( f );
;1582:	
;1583:	COM_Compress(buf);
;1584:
;1585:	Menu_Reset();
;1586:
;1587:	p = buf;
;1588:
;1589:	while ( 1 ) {
;1590:		token = COM_ParseExt( &p, qtrue );
;1591:		if( !token || token[0] == 0 || token[0] == '}') {
;1592:			break;
;1593:		}
;1594:
;1595:		//if ( Q_stricmp( token, "{" ) ) {
;1596:		//	Com_Printf( "Missing { in menu file\n" );
;1597:		//	break;
;1598:		//}
;1599:
;1600:		//if ( menuCount == MAX_MENUS ) {
;1601:		//	Com_Printf( "Too many menus!\n" );
;1602:		//	break;
;1603:		//}
;1604:
;1605:		if ( Q_stricmp( token, "}" ) == 0 ) {
;1606:			break;
;1607:		}
;1608:
;1609:		if (Q_stricmp(token, "loadmenu") == 0) {
;1610:			if (CG_Load_Menu(&p)) {
;1611:				continue;
;1612:			} else {
;1613:				break;
;1614:			}
;1615:		}
;1616:	}
;1617:
;1618:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1619:
;1620:}
;1621:
;1622:
;1623:
;1624:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
;1625:	return qfalse;
;1626:}
;1627:
;1628:
;1629:static int CG_FeederCount(float feederID) {
;1630:	int i, count;
;1631:	count = 0;
;1632:	if (feederID == FEEDER_REDTEAM_LIST) {
;1633:		for (i = 0; i < cg.numScores; i++) {
;1634:			if (cg.scores[i].team == TEAM_RED) {
;1635:				count++;
;1636:			}
;1637:		}
;1638:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1639:		for (i = 0; i < cg.numScores; i++) {
;1640:			if (cg.scores[i].team == TEAM_BLUE) {
;1641:				count++;
;1642:			}
;1643:		}
;1644:	} else if (feederID == FEEDER_SCOREBOARD) {
;1645:		return cg.numScores;
;1646:	}
;1647:	return count;
;1648:}
;1649:
;1650:
;1651:void CG_SetScoreSelection(void *p) {
;1652:	menuDef_t *menu = (menuDef_t*)p;
;1653:	playerState_t *ps = &cg.snap->ps;
;1654:	int i, red, blue;
;1655:	red = blue = 0;
;1656:	for (i = 0; i < cg.numScores; i++) {
;1657:		if (cg.scores[i].team == TEAM_RED) {
;1658:			red++;
;1659:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1660:			blue++;
;1661:		}
;1662:		if (ps->clientNum == cg.scores[i].client) {
;1663:			cg.selectedScore = i;
;1664:		}
;1665:	}
;1666:
;1667:	if (menu == NULL) {
;1668:		// just interested in setting the selected score
;1669:		return;
;1670:	}
;1671:
;1672:	if ( cgs.gametype >= GT_TEAM ) {
;1673:		int feeder = FEEDER_REDTEAM_LIST;
;1674:		i = red;
;1675:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1676:			feeder = FEEDER_BLUETEAM_LIST;
;1677:			i = blue;
;1678:		}
;1679:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1680:	} else {
;1681:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1682:	}
;1683:}
;1684:
;1685:// FIXME: might need to cache this info
;1686:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
;1687:	int i, count;
;1688:	if ( cgs.gametype >= GT_TEAM ) {
;1689:		count = 0;
;1690:		for (i = 0; i < cg.numScores; i++) {
;1691:			if (cg.scores[i].team == team) {
;1692:				if (count == index) {
;1693:					*scoreIndex = i;
;1694:					return &cgs.clientinfo[cg.scores[i].client];
;1695:				}
;1696:				count++;
;1697:			}
;1698:		}
;1699:	}
;1700:	*scoreIndex = index;
;1701:	return &cgs.clientinfo[ cg.scores[index].client ];
;1702:}
;1703:
;1704:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
;1705:	gitem_t *item;
;1706:	int scoreIndex = 0;
;1707:	clientInfo_t *info = NULL;
;1708:	int team = -1;
;1709:	score_t *sp = NULL;
;1710:
;1711:	*handle = -1;
;1712:
;1713:	if (feederID == FEEDER_REDTEAM_LIST) {
;1714:		team = TEAM_RED;
;1715:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1716:		team = TEAM_BLUE;
;1717:	}
;1718:
;1719:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1720:	sp = &cg.scores[scoreIndex];
;1721:
;1722:	if (info && info->infoValid) {
;1723:		switch (column) {
;1724:			case 0:
;1725:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;1726:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1727:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1728:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
;1729:					item = BG_FindItemForPowerup( PW_REDFLAG );
;1730:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1731:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
;1732:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1733:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1734:				} else {
;1735:					if ( info->botSkill > 0 && info->botSkill <= 5 ) {
;1736:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
;1737:					} else if ( info->handicap < 100 ) {
;1738:					return va("%i", info->handicap );
;1739:					}
;1740:				}
;1741:			break;
;1742:			case 1:
;1743:				if (team == -1) {
;1744:					return "";
;1745:				} else {
;1746:					*handle = CG_StatusHandle(info->teamTask);
;1747:				}
;1748:		  break;
;1749:			case 2:
;1750:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
;1751:					return "Ready";
;1752:				}
;1753:				if (team == -1) {
;1754:					if (cgs.gametype == GT_TOURNAMENT) {
;1755:						return va("%i/%i", info->wins, info->losses);
;1756:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
;1757:						return "Spectator";
;1758:					} else {
;1759:						return "";
;1760:					}
;1761:				} else {
;1762:					if (info->teamLeader) {
;1763:						return "Leader";
;1764:					}
;1765:				}
;1766:			break;
;1767:			case 3:
;1768:				return info->name;
;1769:			break;
;1770:			case 4:
;1771:				return va("%i", info->score);
;1772:			break;
;1773:			case 5:
;1774:				return va("%4i", sp->time);
;1775:			break;
;1776:			case 6:
;1777:				if ( sp->ping == -1 ) {
;1778:					return "connecting";
;1779:				} 
;1780:				return va("%4i", sp->ping);
;1781:			break;
;1782:		}
;1783:	}
;1784:
;1785:	return "";
;1786:}
;1787:
;1788:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1789:	return 0;
;1790:}
;1791:
;1792:static void CG_FeederSelection(float feederID, int index) {
;1793:	if ( cgs.gametype >= GT_TEAM ) {
;1794:		int i, count;
;1795:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1796:		count = 0;
;1797:		for (i = 0; i < cg.numScores; i++) {
;1798:			if (cg.scores[i].team == team) {
;1799:				if (index == count) {
;1800:					cg.selectedScore = i;
;1801:				}
;1802:				count++;
;1803:			}
;1804:		}
;1805:	} else {
;1806:		cg.selectedScore = index;
;1807:	}
;1808:}
;1809:#endif
;1810:
;1811:#ifdef MISSIONPACK // bk001204 - only needed there
;1812:static float CG_Cvar_Get(const char *cvar) {
;1813:	char buff[128];
;1814:	memset(buff, 0, sizeof(buff));
;1815:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
;1816:	return atof(buff);
;1817:}
;1818:#endif
;1819:
;1820:#ifdef MISSIONPACK
;1821:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
;1822:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1823:}
;1824:
;1825:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1826:	switch (ownerDraw) {
;1827:	  case CG_GAME_TYPE:
;1828:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1829:	  case CG_GAME_STATUS:
;1830:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1831:			break;
;1832:	  case CG_KILLER:
;1833:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1834:			break;
;1835:	  case CG_RED_NAME:
;1836:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1837:			break;
;1838:	  case CG_BLUE_NAME:
;1839:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1840:			break;
;1841:
;1842:
;1843:	}
;1844:	return 0;
;1845:}
;1846:
;1847:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
;1848:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1849:}
;1850:
;1851:static void CG_StopCinematic(int handle) {
;1852:  trap_CIN_StopCinematic(handle);
;1853:}
;1854:
;1855:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1856:  trap_CIN_SetExtents(handle, x, y, w, h);
;1857:  trap_CIN_DrawCinematic(handle);
;1858:}
;1859:
;1860:static void CG_RunCinematicFrame(int handle) {
;1861:  trap_CIN_RunCinematic(handle);
;1862:}
;1863:
;1864:/*
;1865:=================
;1866:CG_LoadHudMenu();
;1867:
;1868:=================
;1869:*/
;1870:void CG_LoadHudMenu() {
;1871:	char buff[1024];
;1872:	const char *hudSet;
;1873:
;1874:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1875:	cgDC.setColor = &trap_R_SetColor;
;1876:	cgDC.drawHandlePic = &CG_DrawPic;
;1877:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
;1878:	cgDC.drawText = &CG_Text_Paint;
;1879:	cgDC.textWidth = &CG_Text_Width;
;1880:	cgDC.textHeight = &CG_Text_Height;
;1881:	cgDC.registerModel = &trap_R_RegisterModel;
;1882:	cgDC.modelBounds = &trap_R_ModelBounds;
;1883:	cgDC.fillRect = &CG_FillRect;
;1884:	cgDC.drawRect = &CG_DrawRect;   
;1885:	cgDC.drawSides = &CG_DrawSides;
;1886:	cgDC.drawTopBottom = &CG_DrawTopBottom;
;1887:	cgDC.clearScene = &trap_R_ClearScene;
;1888:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;1889:	cgDC.renderScene = &trap_R_RenderScene;
;1890:	cgDC.registerFont = &trap_R_RegisterFont;
;1891:	cgDC.ownerDrawItem = &CG_OwnerDraw;
;1892:	cgDC.getValue = &CG_GetValue;
;1893:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
;1894:	cgDC.runScript = &CG_RunMenuScript;
;1895:	cgDC.getTeamColor = &CG_GetTeamColor;
;1896:	cgDC.setCVar = trap_Cvar_Set;
;1897:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
;1898:	cgDC.getCVarValue = CG_Cvar_Get;
;1899:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
;1900:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;1901:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;1902:	cgDC.startLocalSound = &trap_S_StartLocalSound;
;1903:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;1904:	cgDC.feederCount = &CG_FeederCount;
;1905:	cgDC.feederItemImage = &CG_FeederItemImage;
;1906:	cgDC.feederItemText = &CG_FeederItemText;
;1907:	cgDC.feederSelection = &CG_FeederSelection;
;1908:	//cgDC.setBinding = &trap_Key_SetBinding;
;1909:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;1910:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;1911:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;1912:	cgDC.Error = &Com_Error; 
;1913:	cgDC.Print = &Com_Printf; 
;1914:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;1915:	//cgDC.Pause = &CG_Pause;
;1916:	cgDC.registerSound = &trap_S_RegisterSound;
;1917:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;1918:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
;1919:	cgDC.playCinematic = &CG_PlayCinematic;
;1920:	cgDC.stopCinematic = &CG_StopCinematic;
;1921:	cgDC.drawCinematic = &CG_DrawCinematic;
;1922:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
;1923:	
;1924:	Init_Display(&cgDC);
;1925:
;1926:	Menu_Reset();
;1927:	
;1928:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;1929:	hudSet = buff;
;1930:	if (hudSet[0] == '\0') {
;1931:		hudSet = "ui/hud.txt";
;1932:	}
;1933:
;1934:	CG_LoadMenus(hudSet);
;1935:}
;1936:
;1937:void CG_AssetCache() {
;1938:	//if (Assets.textFont == NULL) {
;1939:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;1940:	//}
;1941:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;1942:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;1943:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
;1944:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
;1945:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
;1946:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
;1947:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
;1948:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
;1949:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
;1950:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
;1951:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
;1952:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
;1953:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
;1954:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
;1955:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
;1956:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
;1957:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
;1958:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
;1959:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
;1960:}
;1961:#endif
;1962:/*
;1963:=================
;1964:CG_Init
;1965:
;1966:Called after every level change or subsystem restart
;1967:Will perform callbacks to make the loading info screen update.
;1968:=================
;1969:*/
;1970:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 1974
;1971:	const char	*s;
;1972:
;1973:	// clear everything
;1974:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 155548
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1975
;1975:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 157976
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1976
;1976:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 757760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1977
;1977:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1978
;1978:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1980
;1979:
;1980:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1982
;1981:
;1982:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31448
ADDRFP4 0
INDIRI4
ASGNI4
line 1983
;1983:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31444
ADDRFP4 4
INDIRI4
ASGNI4
line 1986
;1984:
;1985:	// load a few needed things before we do any screen updates
;1986:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $1039
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388
ADDRLP4 4
INDIRI4
ASGNI4
line 1987
;1987:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $1042
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+16
ADDRLP4 8
INDIRI4
ASGNI4
line 1988
;1988:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $1045
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+4
ADDRLP4 12
INDIRI4
ASGNI4
line 1989
;1989:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $1048
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+8
ADDRLP4 16
INDIRI4
ASGNI4
line 1990
;1990:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $1051
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+12
ADDRLP4 20
INDIRI4
ASGNI4
line 1992
;1991:
;1992:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1994
;1993:
;1994:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1996
;1995:
;1996:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+111004
CNSTI4 2
ASGNI4
line 1998
;1997:
;1998:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
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
line 1999
;1999:	cgs.flagStatus = -1;
ADDRGP4 cgs+34816
CNSTI4 -1
ASGNI4
line 2003
;2000:	// old servers
;2001:
;2002:	// get the rendering configuration from the client system
;2003:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 2004
;2004:	cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+31432
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 2005
;2005:	cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+31436
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 2008
;2006:
;2007:	// get the gamestate from the client system
;2008:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 2011
;2009:
;2010:	// check version
;2011:	s = CG_ConfigString( CS_GAME_VERSION );
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
line 2012
;2012:	if ( strcmp( s, GAME_VERSION ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1065
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1063
line 2013
;2013:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1066
ARGP4
ADDRGP4 $1065
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2014
;2014:	}
LABELV $1063
line 2016
;2015:
;2016:	s = CG_ConfigString( CS_LEVEL_START_TIME );
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
line 2017
;2017:	cgs.levelStartTime = atoi( s );
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
line 2019
;2018:
;2019:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 2022
;2020:
;2021:	// load the new map
;2022:	CG_LoadingString( "collision map" );
ADDRGP4 $1068
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2024
;2023:
;2024:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2030
;2025:
;2026:#ifdef MISSIONPACK
;2027:	String_Init();
;2028:#endif
;2029:
;2030:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2032
;2031:
;2032:	CG_LoadingString( "sounds" );
ADDRGP4 $1071
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2034
;2033:
;2034:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2036
;2035:
;2036:	CG_LoadingString( "graphics" );
ADDRGP4 $1072
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2038
;2037:
;2038:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2040
;2039:
;2040:	CG_LoadingString( "clients" );
ADDRGP4 $1073
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2042
;2041:
;2042:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2050
;2043:
;2044:// Shafe - Trep Open TA Stuff Up
;2045:#ifdef MISSIONPACK
;2046:	CG_AssetCache();
;2047:	CG_LoadHudMenu();      // load new hud stuff
;2048:#endif
;2049:
;2050:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2052
;2051:
;2052:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2054
;2053:
;2054:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2057
;2055:
;2056:	// remove the last loading update
;2057:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+111504
CNSTI1 0
ASGNI1
line 2060
;2058:
;2059:	// Make sure we have update values (scores)
;2060:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 2062
;2061:
;2062:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2064
;2063:
;2064:	CG_LoadingString( "" );
ADDRGP4 $1076
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2071
;2065:
;2066:
;2067:#ifdef MISSIONPACK
;2068:	CG_InitTeamChat();
;2069:#endif
;2070:
;2071:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2073
;2072:
;2073:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2074
;2074:}
LABELV $1034
endproc CG_Init 44 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2083
;2075:
;2076:/*
;2077:=================
;2078:CG_Shutdown
;2079:
;2080:Called before every level change or subsystem restart
;2081:=================
;2082:*/
;2083:void CG_Shutdown( void ) {
line 2086
;2084:	// some mods may need to do cleanup work here,
;2085:	// like closing files or archiving session data
;2086:}
LABELV $1077
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2100
;2087:
;2088:
;2089:/*
;2090:==================
;2091:CG_EventHandling
;2092:==================
;2093: type 0 - no event handling
;2094:      1 - team menu
;2095:      2 - hud editor
;2096:
;2097:*/
;2098:
;2099:#ifndef MISSIONPACK
;2100:void CG_EventHandling(int type) {
line 2101
;2101:}
LABELV $1078
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 0 0
line 2105
;2102:
;2103:
;2104:
;2105:void CG_KeyEvent(int key, qboolean down) {
line 2106
;2106:}
LABELV $1079
endproc CG_KeyEvent 0 0
export CG_MouseEvent
proc CG_MouseEvent 0 0
line 2108
;2107:
;2108:void CG_MouseEvent(int x, int y) {
line 2109
;2109:}
LABELV $1080
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
import CG_PlayerSprites
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
import CG_ShotgunTrail
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
import CG_ResetZoom
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
export cg_RedMC
align 4
LABELV cg_RedMC
skip 272
export cg_BlueMC
align 4
LABELV cg_BlueMC
skip 272
export cg_GameMode
align 4
LABELV cg_GameMode
skip 272
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
skip 757760
export cg
align 4
LABELV cg
skip 157976
export cgs
align 4
LABELV cgs
skip 155548
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
import irandom
import flrandom
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
LABELV $1076
byte 1 0
align 1
LABELV $1073
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1072
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
LABELV $1071
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1068
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
LABELV $1066
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
LABELV $1065
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
LABELV $1051
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
LABELV $1048
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
LABELV $1045
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
LABELV $1042
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1039
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
LABELV $1031
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
LABELV $1006
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $978
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $971
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
LABELV $968
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
LABELV $965
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
LABELV $962
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $959
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
LABELV $956
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $953
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
LABELV $950
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
LABELV $947
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
LABELV $944
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
LABELV $941
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
LABELV $930
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
LABELV $927
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
LABELV $924
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
LABELV $921
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
LABELV $918
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
LABELV $915
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
LABELV $912
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
LABELV $909
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
LABELV $906
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
LABELV $903
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
LABELV $900
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
LABELV $897
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
LABELV $894
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
LABELV $891
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
LABELV $886
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
LABELV $883
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
LABELV $880
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
LABELV $877
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
LABELV $874
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
LABELV $871
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
LABELV $868
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
LABELV $865
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
LABELV $862
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
LABELV $859
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
LABELV $856
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
LABELV $853
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
LABELV $850
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
LABELV $847
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
LABELV $844
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
LABELV $841
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
LABELV $838
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
LABELV $835
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
LABELV $832
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
LABELV $829
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
LABELV $821
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
LABELV $817
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
LABELV $813
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
LABELV $810
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
LABELV $806
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
LABELV $802
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
LABELV $799
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
LABELV $796
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
LABELV $788
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
LABELV $785
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
LABELV $782
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
LABELV $779
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
LABELV $771
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
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $768
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
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $765
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
LABELV $762
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
LABELV $759
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
LABELV $756
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
LABELV $753
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
LABELV $750
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
LABELV $747
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
LABELV $744
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
byte 1 100
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $741
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
LABELV $738
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
LABELV $735
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
LABELV $732
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
LABELV $725
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
LABELV $722
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
LABELV $719
byte 1 115
byte 1 103
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $716
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
LABELV $713
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
LABELV $710
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
LABELV $707
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
LABELV $704
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
LABELV $701
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
LABELV $698
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
LABELV $695
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
LABELV $692
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 112
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $689
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
LABELV $686
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
LABELV $683
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
LABELV $680
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
LABELV $677
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
LABELV $674
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
LABELV $671
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
LABELV $668
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
LABELV $665
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
LABELV $662
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
LABELV $659
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
LABELV $656
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
LABELV $652
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
LABELV $648
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
LABELV $644
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
LABELV $640
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
LABELV $631
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
LABELV $626
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
LABELV $625
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
LABELV $624
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
LABELV $623
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
LABELV $622
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
LABELV $621
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
LABELV $620
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
LABELV $619
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
LABELV $618
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
LABELV $617
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
LABELV $616
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
LABELV $613
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
LABELV $610
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
LABELV $607
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
LABELV $604
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
LABELV $601
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $598
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $595
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $592
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $589
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 102
byte 1 103
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $586
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
LABELV $577
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
LABELV $574
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
LABELV $571
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
LABELV $562
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $559
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $556
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $537
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
LABELV $533
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
LABELV $529
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
LABELV $525
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
LABELV $521
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
LABELV $517
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
LABELV $509
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
byte 1 111
byte 1 103
byte 1 103
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
LABELV $500
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $497
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $494
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $491
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $488
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $485
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 111
byte 1 103
byte 1 103
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $467
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
LABELV $464
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
LABELV $461
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
LABELV $458
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $455
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $452
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $449
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 46
byte 1 111
byte 1 103
byte 1 103
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $443
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
LABELV $440
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
LABELV $437
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
LABELV $434
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
LABELV $431
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $428
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $425
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
LABELV $422
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
LABELV $419
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $416
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $411
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $408
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $405
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $402
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $399
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $388
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $385
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $382
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $379
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
byte 1 111
byte 1 103
byte 1 103
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $371
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $368
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $365
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $362
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $359
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $356
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $353
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $343
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
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $340
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $337
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $334
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $331
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $328
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $325
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $322
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $319
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $316
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $313
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $310
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
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $306
byte 1 111
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $302
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $296
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
LABELV $275
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $224
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
LABELV $223
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
LABELV $222
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
LABELV $221
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $220
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $217
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
LABELV $211
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $210
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
LABELV $209
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
LABELV $208
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
LABELV $207
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
LABELV $206
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
LABELV $205
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
LABELV $204
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
LABELV $203
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $202
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $201
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
LABELV $200
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
LABELV $199
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
LABELV $198
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
LABELV $197
byte 1 103
byte 1 95
byte 1 82
byte 1 101
byte 1 100
byte 1 77
byte 1 67
byte 1 0
align 1
LABELV $196
byte 1 103
byte 1 95
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 77
byte 1 67
byte 1 0
align 1
LABELV $195
byte 1 103
byte 1 95
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
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
