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
proc CG_RegisterItemSounds 96 12
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
line 583
;583:	}
LABELV $287
line 562
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $286
line 584
;584:}
LABELV $280
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 588 16
line 594
;585:
;586:
;587:/*
;588:=================
;589:CG_RegisterSounds
;590:
;591:called during a precache command
;592:=================
;593:*/
;594:static void CG_RegisterSounds( void ) {
line 605
;595:	int		i;
;596:	char	items[MAX_ITEMS+1];
;597:	char	name[MAX_QPATH];
;598:	const char	*soundName;
;599:
;600:	// voice commands
;601:#ifdef MISSIONPACK
;602:	CG_LoadVoiceChats();
;603:#endif
;604:
;605:	cgs.media.oneMinuteSound = trap_S_RegisterSound( "sound/feedback/1_minute.wav", qtrue );
ADDRGP4 $306
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
line 606
;606:	cgs.media.fiveMinuteSound = trap_S_RegisterSound( "sound/feedback/5_minute.wav", qtrue );
ADDRGP4 $309
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
line 607
;607:	cgs.media.suddenDeathSound = trap_S_RegisterSound( "sound/feedback/sudden_death.wav", qtrue );
ADDRGP4 $312
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
line 608
;608:	cgs.media.oneFragSound = trap_S_RegisterSound( "sound/feedback/1_frag.wav", qtrue );
ADDRGP4 $315
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
line 609
;609:	cgs.media.twoFragSound = trap_S_RegisterSound( "sound/feedback/2_frags.wav", qtrue );
ADDRGP4 $318
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
line 610
;610:	cgs.media.threeFragSound = trap_S_RegisterSound( "sound/feedback/3_frags.wav", qtrue );
ADDRGP4 $321
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
line 611
;611:	cgs.media.count3Sound = trap_S_RegisterSound( "sound/feedback/three.wav", qtrue );
ADDRGP4 $324
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
line 612
;612:	cgs.media.count2Sound = trap_S_RegisterSound( "sound/feedback/two.wav", qtrue );
ADDRGP4 $327
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
line 613
;613:	cgs.media.count1Sound = trap_S_RegisterSound( "sound/feedback/one.wav", qtrue );
ADDRGP4 $330
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
line 614
;614:	cgs.media.countFightSound = trap_S_RegisterSound( "sound/feedback/fight.wav", qtrue );
ADDRGP4 $333
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
line 615
;615:	cgs.media.countPrepareSound = trap_S_RegisterSound( "sound/feedback/prepare.wav", qtrue );
ADDRGP4 $336
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
line 616
;616:	cgs.media.zoomStart = trap_S_RegisterSound( "sound/world/electro.wav", qtrue );
ADDRGP4 $339
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
line 617
;617:	cgs.media.zoomEnd = trap_S_RegisterSound( "sound/world/electro.wav", qtrue );
ADDRGP4 $339
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
line 625
;618:	
;619:
;620:
;621:#ifdef MISSIONPACK
;622:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound( "sound/feedback/prepare_team.wav", qtrue );
;623:#endif
;624:
;625:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $346
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $342
LABELV $346
line 627
;626:
;627:		cgs.media.captureAwardSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $349
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
line 628
;628:		cgs.media.redLeadsSound = trap_S_RegisterSound( "sound/feedback/redleads.wav", qtrue );
ADDRGP4 $352
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
line 629
;629:		cgs.media.blueLeadsSound = trap_S_RegisterSound( "sound/feedback/blueleads.wav", qtrue );
ADDRGP4 $355
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
line 630
;630:		cgs.media.teamsTiedSound = trap_S_RegisterSound( "sound/feedback/teamstied.wav", qtrue );
ADDRGP4 $358
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
line 631
;631:		cgs.media.hitTeamSound = trap_S_RegisterSound( "sound/feedback/hit_teammate.wav", qtrue );
ADDRGP4 $361
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
line 633
;632:
;633:		cgs.media.redScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_red_scores.wav", qtrue );
ADDRGP4 $364
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
line 634
;634:		cgs.media.blueScoredSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_scores.wav", qtrue );
ADDRGP4 $367
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
line 636
;635:
;636:		cgs.media.captureYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_yourteam.wav", qtrue );
ADDRGP4 $349
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
line 637
;637:		cgs.media.captureOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagcapture_opponent.wav", qtrue );
ADDRGP4 $372
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
line 639
;638:
;639:		cgs.media.returnYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_yourteam.wav", qtrue );
ADDRGP4 $375
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
line 640
;640:		cgs.media.returnOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $378
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
line 642
;641:
;642:		cgs.media.takenYourTeamSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_yourteam.wav", qtrue );
ADDRGP4 $381
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
line 643
;643:		cgs.media.takenOpponentSound = trap_S_RegisterSound( "sound/teamplay/flagtaken_opponent.wav", qtrue );
ADDRGP4 $384
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
line 645
;644:
;645:		if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $389
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $385
LABELV $389
line 646
;646:			cgs.media.redFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_red_returned.wav", qtrue );
ADDRGP4 $392
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
line 647
;647:			cgs.media.blueFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/voc_blue_returned.wav", qtrue );
ADDRGP4 $395
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
line 648
;648:			cgs.media.enemyTookYourFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_flag.wav", qtrue );
ADDRGP4 $398
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
line 649
;649:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_flag.wav", qtrue );
ADDRGP4 $401
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
line 650
;650:		}
LABELV $385
line 669
;651:
;652:#ifdef MISSIONPACK
;653:		if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;654:			// FIXME: get a replacement for this sound ?
;655:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
;656:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
;657:			cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
;658:		}
;659:
;660:		if ( cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cg_buildScript.integer ) {
;661:			cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
;662:			cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
;663:		}
;664:
;665:		if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;666:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound( "sound/teamplay/voc_base_attack.wav", qtrue );
;667:		}
;668:#else
;669:		cgs.media.youHaveFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_you_flag.wav", qtrue );
ADDRGP4 $404
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
line 670
;670:		cgs.media.holyShitSound = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $407
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
line 671
;671:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound( "sound/teamplay/flagreturn_opponent.wav", qtrue );
ADDRGP4 $378
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
line 672
;672:		cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_team_1flag.wav", qtrue );
ADDRGP4 $412
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
line 673
;673:		cgs.media.enemyTookTheFlagSound = trap_S_RegisterSound( "sound/teamplay/voc_enemy_1flag.wav", qtrue );
ADDRGP4 $415
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
line 675
;674:#endif
;675:	}
LABELV $342
line 677
;676:
;677:	cgs.media.tracerSound = trap_S_RegisterSound( "sound/weapons/machinegun/buletby1.wav", qfalse );
ADDRGP4 $418
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
line 678
;678:	cgs.media.selectSound = trap_S_RegisterSound( "sound/weapons/change.wav", qfalse );
ADDRGP4 $421
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
line 679
;679:	cgs.media.wearOffSound = trap_S_RegisterSound( "sound/items/wearoff.wav", qfalse );
ADDRGP4 $424
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
line 680
;680:	cgs.media.useNothingSound = trap_S_RegisterSound( "sound/items/use_nothing.wav", qfalse );
ADDRGP4 $427
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
line 681
;681:	cgs.media.gibSound = trap_S_RegisterSound( "sound/player/gibsplt1.wav", qfalse );
ADDRGP4 $430
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
line 682
;682:	cgs.media.gibBounce1Sound = trap_S_RegisterSound( "sound/player/gibimp1.wav", qfalse );
ADDRGP4 $433
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
line 683
;683:	cgs.media.gibBounce2Sound = trap_S_RegisterSound( "sound/player/gibimp2.wav", qfalse );
ADDRGP4 $436
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
line 684
;684:	cgs.media.gibBounce3Sound = trap_S_RegisterSound( "sound/player/gibimp3.wav", qfalse );
ADDRGP4 $439
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
line 685
;685:	cgs.media.glassSound = trap_S_RegisterSound( "sound/world/glassbreak.wav", qfalse );
ADDRGP4 $442
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
line 686
;686:	cgs.media.errorSound = trap_S_RegisterSound( "sound/misc/error.wav", qfalse );
ADDRGP4 $445
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
line 705
;687:
;688:#ifdef MISSIONPACK
;689:	cgs.media.useInvulnerabilitySound = trap_S_RegisterSound( "sound/items/invul_activate.wav", qfalse );
;690:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound( "sound/items/invul_impact_01.wav", qfalse );
;691:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound( "sound/items/invul_impact_02.wav", qfalse );
;692:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound( "sound/items/invul_impact_03.wav", qfalse );
;693:	cgs.media.invulnerabilityJuicedSound = trap_S_RegisterSound( "sound/items/invul_juiced.wav", qfalse );
;694:	cgs.media.obeliskHitSound1 = trap_S_RegisterSound( "sound/items/obelisk_hit_01.wav", qfalse );
;695:	cgs.media.obeliskHitSound2 = trap_S_RegisterSound( "sound/items/obelisk_hit_02.wav", qfalse );
;696:	cgs.media.obeliskHitSound3 = trap_S_RegisterSound( "sound/items/obelisk_hit_03.wav", qfalse );
;697:	cgs.media.obeliskRespawnSound = trap_S_RegisterSound( "sound/items/obelisk_respawn.wav", qfalse );
;698:
;699:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
;700:	cgs.media.doublerSound = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
;701:	cgs.media.guardSound = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
;702:	cgs.media.scoutSound = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
;703:#endif
;704:
;705:	cgs.media.teleInSound = trap_S_RegisterSound( "sound/world/telein.wav", qfalse );
ADDRGP4 $448
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
line 706
;706:	cgs.media.teleOutSound = trap_S_RegisterSound( "sound/world/teleout.wav", qfalse );
ADDRGP4 $451
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
line 707
;707:	cgs.media.respawnSound = trap_S_RegisterSound( "sound/items/respawn1.wav", qfalse );
ADDRGP4 $454
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
line 709
;708:
;709:	cgs.media.noAmmoSound = trap_S_RegisterSound( "sound/weapons/noammo.wav", qfalse );
ADDRGP4 $457
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
line 711
;710:
;711:	cgs.media.talkSound = trap_S_RegisterSound( "sound/player/talk.wav", qfalse );
ADDRGP4 $460
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
line 712
;712:	cgs.media.landSound = trap_S_RegisterSound( "sound/player/land1.wav", qfalse);
ADDRGP4 $463
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
line 714
;713:
;714:	cgs.media.hitSound = trap_S_RegisterSound( "sound/feedback/hit.wav", qfalse );
ADDRGP4 $466
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
line 720
;715:#ifdef MISSIONPACK
;716:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound( "sound/feedback/hithi.wav", qfalse );
;717:	cgs.media.hitSoundLowArmor = trap_S_RegisterSound( "sound/feedback/hitlo.wav", qfalse );
;718:#endif
;719:
;720:	cgs.media.impressiveSound = trap_S_RegisterSound( "sound/feedback/impressive.wav", qtrue );
ADDRGP4 $469
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
line 721
;721:	cgs.media.excellentSound = trap_S_RegisterSound( "sound/feedback/excellent.wav", qtrue );
ADDRGP4 $472
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
line 722
;722:	cgs.media.deniedSound = trap_S_RegisterSound( "sound/feedback/denied.wav", qtrue );
ADDRGP4 $475
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
line 723
;723:	cgs.media.humiliationSound = trap_S_RegisterSound( "sound/feedback/humiliation.wav", qtrue );
ADDRGP4 $478
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
line 724
;724:	cgs.media.assistSound = trap_S_RegisterSound( "sound/feedback/assist.wav", qtrue );
ADDRGP4 $481
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
line 725
;725:	cgs.media.defendSound = trap_S_RegisterSound( "sound/feedback/defense.wav", qtrue );
ADDRGP4 $484
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
line 732
;726:#ifdef MISSIONPACK
;727:	cgs.media.firstImpressiveSound = trap_S_RegisterSound( "sound/feedback/first_impressive.wav", qtrue );
;728:	cgs.media.firstExcellentSound = trap_S_RegisterSound( "sound/feedback/first_excellent.wav", qtrue );
;729:	cgs.media.firstHumiliationSound = trap_S_RegisterSound( "sound/feedback/first_gauntlet.wav", qtrue );
;730:#endif
;731:
;732:	cgs.media.takenLeadSound = trap_S_RegisterSound( "sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $487
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
line 733
;733:	cgs.media.tiedLeadSound = trap_S_RegisterSound( "sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $490
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
line 734
;734:	cgs.media.lostLeadSound = trap_S_RegisterSound( "sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $493
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
line 742
;735:
;736:#ifdef MISSIONPACK
;737:	cgs.media.voteNow = trap_S_RegisterSound( "sound/feedback/vote_now.wav", qtrue);
;738:	cgs.media.votePassed = trap_S_RegisterSound( "sound/feedback/vote_passed.wav", qtrue);
;739:	cgs.media.voteFailed = trap_S_RegisterSound( "sound/feedback/vote_failed.wav", qtrue);
;740:#endif
;741:
;742:	cgs.media.watrInSound = trap_S_RegisterSound( "sound/player/watr_in.wav", qfalse);
ADDRGP4 $496
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
line 743
;743:	cgs.media.watrOutSound = trap_S_RegisterSound( "sound/player/watr_out.wav", qfalse);
ADDRGP4 $499
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
line 744
;744:	cgs.media.watrUnSound = trap_S_RegisterSound( "sound/player/watr_un.wav", qfalse);
ADDRGP4 $502
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
line 746
;745:
;746:	cgs.media.jumpPadSound = trap_S_RegisterSound ("sound/world/jumppad.wav", qfalse );
ADDRGP4 $505
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
line 748
;747:
;748:	for (i=0 ; i<4 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $506
line 749
;749:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/step%i.wav", i+1);
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
line 750
;750:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound (name, qfalse);
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
line 752
;751:
;752:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/boot%i.wav", i+1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $513
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 753
;753:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound (name, qfalse);
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
line 755
;754:
;755:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i+1);
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
line 756
;756:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound (name, qfalse);
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
line 758
;757:
;758:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/mech%i.wav", i+1);
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
line 759
;759:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound (name, qfalse);
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
line 761
;760:
;761:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/energy%i.wav", i+1);
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
line 762
;762:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound (name, qfalse);
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
line 764
;763:
;764:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/splash%i.wav", i+1);
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
line 765
;765:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound (name, qfalse);
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
line 767
;766:
;767:		Com_sprintf (name, sizeof(name), "sound/player/footsteps/clank%i.wav", i+1);
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
line 768
;768:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound (name, qfalse);
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
line 769
;769:	}
LABELV $507
line 748
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $506
line 772
;770:
;771:	// only register the items that the server says we need
;772:	strcpy( items, CG_ConfigString( CS_ITEMS ) );
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
line 774
;773:
;774:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $537
line 776
;775://		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;776:			CG_RegisterItemSounds( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 778
;777://		}
;778:	}
LABELV $538
line 774
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $540
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $537
line 780
;779:
;780:	for ( i = 1 ; i < MAX_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $541
line 781
;781:		soundName = CG_ConfigString( CS_SOUNDS+i );
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
line 782
;782:		if ( !soundName[0] ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $545
line 783
;783:			break;
ADDRGP4 $543
JUMPV
LABELV $545
line 785
;784:		}
;785:		if ( soundName[0] == '*' ) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $547
line 786
;786:			continue;	// custom sound
ADDRGP4 $542
JUMPV
LABELV $547
line 788
;787:		}
;788:		cgs.gameSounds[i] = trap_S_RegisterSound( soundName, qfalse );
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
line 789
;789:	}
LABELV $542
line 780
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $541
LABELV $543
line 792
;790:
;791:	// FIXME: only needed with item
;792:	cgs.media.flightSound = trap_S_RegisterSound( "sound/items/flight.wav", qfalse );
ADDRGP4 $552
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
line 793
;793:	cgs.media.medkitSound = trap_S_RegisterSound ("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $555
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
line 794
;794:	cgs.media.quadSound = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $558
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
line 795
;795:	cgs.media.sfx_ric1 = trap_S_RegisterSound ("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $561
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
line 796
;796:	cgs.media.sfx_ric2 = trap_S_RegisterSound ("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $564
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
line 797
;797:	cgs.media.sfx_ric3 = trap_S_RegisterSound ("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $567
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
line 798
;798:	cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
ADDRGP4 $570
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
line 799
;799:	cgs.media.sfx_rockexp = trap_S_RegisterSound ("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $573
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
line 800
;800:	cgs.media.sfx_devexp = trap_S_RegisterSound ("sound/weapons/bfg/devhit.wav", qfalse);
ADDRGP4 $576
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
line 801
;801:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound ("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $579
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
line 802
;802:	cgs.media.flameBallShader = trap_R_RegisterShader( "sprites/flameball" );
ADDRGP4 $582
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+516
ADDRLP4 548
INDIRI4
ASGNI4
line 803
;803:	cgs.media.bfgBallShader = trap_R_RegisterShader( "sprites/bfgball" );
ADDRGP4 $585
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+524
ADDRLP4 552
INDIRI4
ASGNI4
line 804
;804:	cgs.media.turretFireShader = trap_R_RegisterShader( "sprites/turretfire" );
ADDRGP4 $588
ARGP4
ADDRLP4 556
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+528
ADDRLP4 556
INDIRI4
ASGNI4
line 828
;805:	
;806:#ifdef MISSIONPACK
;807:	cgs.media.sfx_proxexp = trap_S_RegisterSound( "sound/weapons/proxmine/wstbexpl.wav" , qfalse);
;808:	cgs.media.sfx_nghit = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpd.wav" , qfalse);
;809:	cgs.media.sfx_nghitflesh = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpl.wav" , qfalse);
;810:	cgs.media.sfx_nghitmetal = trap_S_RegisterSound( "sound/weapons/nailgun/wnalimpm.wav", qfalse );
;811:	cgs.media.sfx_chghit = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpd.wav", qfalse );
;812:	cgs.media.sfx_chghitflesh = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpl.wav", qfalse );
;813:	cgs.media.sfx_chghitmetal = trap_S_RegisterSound( "sound/weapons/vulcan/wvulimpm.wav", qfalse );
;814:	cgs.media.weaponHoverSound = trap_S_RegisterSound( "sound/weapons/weapon_hover.wav", qfalse );
;815:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound( "sound/items/kam_explode.wav", qfalse );
;816:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound( "sound/items/kam_implode.wav", qfalse );
;817:	cgs.media.kamikazeFarSound = trap_S_RegisterSound( "sound/items/kam_explode_far.wav", qfalse );
;818:	cgs.media.winnerSound = trap_S_RegisterSound( "sound/feedback/voc_youwin.wav", qfalse );
;819:	cgs.media.loserSound = trap_S_RegisterSound( "sound/feedback/voc_youlose.wav", qfalse );
;820:	cgs.media.youSuckSound = trap_S_RegisterSound( "sound/misc/yousuck.wav", qfalse );
;821:
;822:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;823:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;824:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;825:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;826:#endif
;827:
;828:	cgs.media.regenSound = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $591
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
line 829
;829:	cgs.media.protectSound = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $594
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
line 830
;830:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse );
ADDRGP4 $597
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
line 831
;831:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $600
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
line 832
;832:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $603
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
line 834
;833:
;834:	cgs.media.hplb1aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb1a.wav", qfalse);
ADDRGP4 $606
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
line 835
;835:	cgs.media.hplb2aSound = trap_S_RegisterSound("sound/weapons/plasma/hplb2a.wav", qfalse);
ADDRGP4 $609
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
line 866
;836:
;837:
;838:#ifdef MISSIONPACK
;839:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse );
;840:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse );
;841:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse );
;842:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse );
;843:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse );
;844:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse );
;845:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse );
;846:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse );
;847:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse );
;848:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse );
;849:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse );
;850:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse );
;851:
;852:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse );
;853:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse );
;854:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse );
;855:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse );
;856:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse );
;857:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse );
;858:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse );
;859:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse );
;860:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse );
;861:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse );
;862:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse );
;863:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse );
;864:#endif
;865:
;866:}
LABELV $303
endproc CG_RegisterSounds 588 16
data
align 4
LABELV $611
address $612
address $613
address $614
address $615
address $616
address $617
address $618
address $619
address $620
address $621
address $622
code
proc CG_RegisterGraphics 660 16
line 879
;867:
;868:
;869://===================================================================================
;870:
;871:
;872:/*
;873:=================
;874:CG_RegisterGraphics
;875:
;876:This function may execute for a couple of minutes with a slow disk.
;877:=================
;878:*/
;879:static void CG_RegisterGraphics( void ) {
line 897
;880:	int			i;
;881:	char		items[MAX_ITEMS+1];
;882:	static char		*sb_nums[11] = {
;883:		"gfx/2d/numbers/zero_32b",
;884:		"gfx/2d/numbers/one_32b",
;885:		"gfx/2d/numbers/two_32b",
;886:		"gfx/2d/numbers/three_32b",
;887:		"gfx/2d/numbers/four_32b",
;888:		"gfx/2d/numbers/five_32b",
;889:		"gfx/2d/numbers/six_32b",
;890:		"gfx/2d/numbers/seven_32b",
;891:		"gfx/2d/numbers/eight_32b",
;892:		"gfx/2d/numbers/nine_32b",
;893:		"gfx/2d/numbers/minus_32b",
;894:	};
;895:
;896:	// clear any references to old media
;897:	memset( &cg.refdef, 0, sizeof( cg.refdef ) );
ADDRGP4 cg+111104
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 898
;898:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 900
;899:
;900:	CG_LoadingString( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 902
;901:
;902:	trap_R_LoadWorldMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 905
;903:
;904:	// precache status bar pics
;905:	CG_LoadingString( "game media" );
ADDRGP4 $627
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 907
;906:
;907:	for ( i=0 ; i<11 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $628
line 908
;908:		cgs.media.numberShaders[i] = trap_R_RegisterShader( sb_nums[i] );
ADDRLP4 264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRGP4 $611
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
line 909
;909:	}
LABELV $629
line 907
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $628
line 911
;910:
;911:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader( "menu/art/skill1.tga" );
ADDRGP4 $636
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372
ADDRLP4 264
INDIRI4
ASGNI4
line 912
;912:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader( "menu/art/skill2.tga" );
ADDRGP4 $640
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+4
ADDRLP4 268
INDIRI4
ASGNI4
line 913
;913:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader( "menu/art/skill3.tga" );
ADDRGP4 $644
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+8
ADDRLP4 272
INDIRI4
ASGNI4
line 914
;914:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader( "menu/art/skill4.tga" );
ADDRGP4 $648
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+12
ADDRLP4 276
INDIRI4
ASGNI4
line 915
;915:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader( "menu/art/skill5.tga" );
ADDRGP4 $652
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+372+16
ADDRLP4 280
INDIRI4
ASGNI4
line 917
;916:
;917:	cgs.media.viewBloodShader = trap_R_RegisterShader( "viewBloodBlend" );
ADDRGP4 $655
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+228
ADDRLP4 284
INDIRI4
ASGNI4
line 919
;918:
;919:	cgs.media.deferShader = trap_R_RegisterShaderNoMip( "gfx/2d/defer.tga" );
ADDRGP4 $658
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+132
ADDRLP4 288
INDIRI4
ASGNI4
line 921
;920:
;921:	cgs.media.scoreboardName = trap_R_RegisterShaderNoMip( "menu/tab/name.tga" );
ADDRGP4 $661
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+544
ADDRLP4 292
INDIRI4
ASGNI4
line 922
;922:	cgs.media.scoreboardPing = trap_R_RegisterShaderNoMip( "menu/tab/ping.tga" );
ADDRGP4 $664
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+548
ADDRLP4 296
INDIRI4
ASGNI4
line 923
;923:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip( "menu/tab/score.tga" );
ADDRGP4 $667
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+552
ADDRLP4 300
INDIRI4
ASGNI4
line 924
;924:	cgs.media.scoreboardTime = trap_R_RegisterShaderNoMip( "menu/tab/time.tga" );
ADDRGP4 $670
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+560
ADDRLP4 304
INDIRI4
ASGNI4
line 925
;925:	cgs.media.scoreboardTrep = trap_R_RegisterShaderNoMip( "menu/tab/scoreboard.tga" ); // Shafe
ADDRGP4 $673
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+556
ADDRLP4 308
INDIRI4
ASGNI4
line 928
;926:
;927:	// Trepidation hud
;928:	cgs.media.HudLeft = trap_R_RegisterShaderNoMip( "gfx/2d/hud/hud_left.tga" );
ADDRGP4 $676
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+564
ADDRLP4 312
INDIRI4
ASGNI4
line 929
;929:	cgs.media.HudRight = trap_R_RegisterShaderNoMip( "gfx/2d/hud/hud_right.tga" );
ADDRGP4 $679
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+568
ADDRLP4 316
INDIRI4
ASGNI4
line 931
;930:
;931:	cgs.media.smokePuffShader = trap_R_RegisterShader( "smokePuff" );
ADDRGP4 $682
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+288
ADDRLP4 320
INDIRI4
ASGNI4
line 932
;932:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader( "smokePuffRagePro" );
ADDRGP4 $685
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+292
ADDRLP4 324
INDIRI4
ASGNI4
line 935
;933:
;934:	// Zoom Overlay
;935:	cgs.media.ZoomOverlay = trap_R_RegisterShaderNoMip( "gfx/2d/scope.tga" );
ADDRGP4 $688
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+572
ADDRLP4 328
INDIRI4
ASGNI4
line 938
;936:
;937:	// Shafe - Singularity Cannon Shaders
;938:	cgs.media.smokePuffShader2 = trap_R_RegisterShader( "smokePuff2" );
ADDRGP4 $691
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+296
ADDRLP4 332
INDIRI4
ASGNI4
line 939
;939:	cgs.media.smokePuffRageProShader2 = trap_R_RegisterShader( "smokePuffRagePro2" );
ADDRGP4 $694
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+300
ADDRLP4 336
INDIRI4
ASGNI4
line 942
;940:	// End Shafe
;941:
;942:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader( "shotgunSmokePuff" );
ADDRGP4 $697
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+304
ADDRLP4 340
INDIRI4
ASGNI4
line 949
;943:
;944:
;945:#ifdef MISSIONPACK
;946:	cgs.media.nailPuffShader = trap_R_RegisterShader( "nailtrail" );
;947:	cgs.media.blueProxMine = trap_R_RegisterModel( "models/weaphits/proxmineb.md3" );
;948:#endif
;949:	cgs.media.plasmaBallShader = trap_R_RegisterShader( "sprites/plasma1" );
ADDRGP4 $700
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+308
ADDRLP4 344
INDIRI4
ASGNI4
line 950
;950:	cgs.media.bloodTrailShader = trap_R_RegisterShader( "bloodTrail" );
ADDRGP4 $703
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+316
ADDRLP4 348
INDIRI4
ASGNI4
line 951
;951:	cgs.media.lagometerShader = trap_R_RegisterShader("lagometer" );
ADDRGP4 $706
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+276
ADDRLP4 352
INDIRI4
ASGNI4
line 952
;952:	cgs.media.connectionShader = trap_R_RegisterShader( "disconnected" );
ADDRGP4 $709
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+220
ADDRLP4 356
INDIRI4
ASGNI4
line 954
;953:
;954:	cgs.media.waterBubbleShader = trap_R_RegisterShader( "waterBubble" );
ADDRGP4 $712
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+312
ADDRLP4 360
INDIRI4
ASGNI4
line 955
;955:	cgs.media.sgTrailShader = trap_R_RegisterShader( "sgTrail" );
ADDRGP4 $715
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+320
ADDRLP4 364
INDIRI4
ASGNI4
line 957
;956:
;957:	cgs.media.tracerShader = trap_R_RegisterShader( "gfx/misc/tracer" );
ADDRGP4 $718
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+232
ADDRLP4 368
INDIRI4
ASGNI4
line 958
;958:	cgs.media.selectShader = trap_R_RegisterShader( "gfx/2d/select" );
ADDRGP4 $721
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+224
ADDRLP4 372
INDIRI4
ASGNI4
line 960
;959:
;960:	for ( i = 0 ; i < NUM_CROSSHAIRS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $722
line 961
;961:		cgs.media.crosshairShader[i] = trap_R_RegisterShader( va("gfx/2d/crosshair%c", 'a'+i) );
ADDRGP4 $728
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
line 962
;962:	}
LABELV $723
line 960
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $722
line 964
;963:
;964:	cgs.media.backTileShader = trap_R_RegisterShader( "gfx/2d/backtile" );
ADDRGP4 $731
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+280
ADDRLP4 376
INDIRI4
ASGNI4
line 965
;965:	cgs.media.noammoShader = trap_R_RegisterShader( "icons/noammo" );
ADDRGP4 $734
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+284
ADDRLP4 380
INDIRI4
ASGNI4
line 968
;966:
;967:	// powerup shaders
;968:	cgs.media.buildShader = trap_R_RegisterShader("powerups/build" );
ADDRGP4 $737
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+424
ADDRLP4 384
INDIRI4
ASGNI4
line 969
;969:	cgs.media.reditemShader = trap_R_RegisterShader("powerups/reditem" );
ADDRGP4 $740
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+428
ADDRLP4 388
INDIRI4
ASGNI4
line 970
;970:	cgs.media.quadShader = trap_R_RegisterShader("powerups/quad" );
ADDRGP4 $743
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+416
ADDRLP4 392
INDIRI4
ASGNI4
line 971
;971:	cgs.media.quadWeaponShader = trap_R_RegisterShader("powerups/quadWeapon" );
ADDRGP4 $746
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+432
ADDRLP4 396
INDIRI4
ASGNI4
line 972
;972:	cgs.media.battleSuitShader = trap_R_RegisterShader("powerups/battleSuit" );
ADDRGP4 $749
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+444
ADDRLP4 400
INDIRI4
ASGNI4
line 973
;973:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon" );
ADDRGP4 $752
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+448
ADDRLP4 404
INDIRI4
ASGNI4
line 974
;974:	cgs.media.invisShader = trap_R_RegisterShader("powerups/invisibility" );
ADDRGP4 $755
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+436
ADDRLP4 408
INDIRI4
ASGNI4
line 975
;975:	cgs.media.regenShader = trap_R_RegisterShader("powerups/regen" );
ADDRGP4 $758
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+440
ADDRLP4 412
INDIRI4
ASGNI4
line 976
;976:	cgs.media.hastePuffShader = trap_R_RegisterShader("hasteSmokePuff" );
ADDRGP4 $761
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+452
ADDRLP4 416
INDIRI4
ASGNI4
line 979
;977:	
;978:	// -Vincent
;979:	cgs.media.immobilizedShader	= trap_R_RegisterShader("powerups/immobilized" );
ADDRGP4 $764
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+464
ADDRLP4 420
INDIRI4
ASGNI4
line 980
;980:	cgs.media.immobilizedWepShader = trap_R_RegisterShader("powerups/immobilizedWeapon" );
ADDRGP4 $767
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+468
ADDRLP4 424
INDIRI4
ASGNI4
line 985
;981:
;982:#ifdef MISSIONPACK
;983:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;984:#else
;985:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $772
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $768
LABELV $772
line 987
;986:#endif
;987:		cgs.media.redCubeModel = trap_R_RegisterModel( "models/powerups/orb/r_orb.md3" );
ADDRGP4 $775
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+20
ADDRLP4 428
INDIRI4
ASGNI4
line 988
;988:		cgs.media.blueCubeModel = trap_R_RegisterModel( "models/powerups/orb/b_orb.md3" );
ADDRGP4 $778
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+24
ADDRLP4 432
INDIRI4
ASGNI4
line 989
;989:		cgs.media.redCubeIcon = trap_R_RegisterShader( "icons/skull_red" );
ADDRGP4 $781
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+28
ADDRLP4 436
INDIRI4
ASGNI4
line 990
;990:		cgs.media.blueCubeIcon = trap_R_RegisterShader( "icons/skull_blue" );
ADDRGP4 $784
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+32
ADDRLP4 440
INDIRI4
ASGNI4
line 991
;991:	}
LABELV $768
line 996
;992:
;993:#ifdef MISSIONPACK
;994:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;995:#else
;996:	if ( cgs.gametype == GT_CTF || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $789
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $785
LABELV $789
line 998
;997:#endif
;998:		cgs.media.redFlagModel = trap_R_RegisterModel( "models/flags/r_flag.md3" );
ADDRGP4 $792
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+36
ADDRLP4 428
INDIRI4
ASGNI4
line 999
;999:		cgs.media.blueFlagModel = trap_R_RegisterModel( "models/flags/b_flag.md3" );
ADDRGP4 $795
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+40
ADDRLP4 432
INDIRI4
ASGNI4
line 1000
;1000:		cgs.media.redFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_red1" );
ADDRGP4 $798
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+48
ADDRLP4 436
INDIRI4
ASGNI4
line 1001
;1001:		cgs.media.redFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
ADDRGP4 $802
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+48+4
ADDRLP4 440
INDIRI4
ASGNI4
line 1002
;1002:		cgs.media.redFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_red3" );
ADDRGP4 $806
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+48+8
ADDRLP4 444
INDIRI4
ASGNI4
line 1003
;1003:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_blu1" );
ADDRGP4 $809
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+60
ADDRLP4 448
INDIRI4
ASGNI4
line 1004
;1004:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
ADDRGP4 $813
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+60+4
ADDRLP4 452
INDIRI4
ASGNI4
line 1005
;1005:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu3" );
ADDRGP4 $817
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+60+8
ADDRLP4 456
INDIRI4
ASGNI4
line 1018
;1006:#ifdef MISSIONPACK
;1007:		cgs.media.flagPoleModel = trap_R_RegisterModel( "models/flag2/flagpole.md3" );
;1008:		cgs.media.flagFlapModel = trap_R_RegisterModel( "models/flag2/flagflap3.md3" );
;1009:
;1010:		cgs.media.redFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/red.skin" );
;1011:		cgs.media.blueFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/blue.skin" );
;1012:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin( "models/flag2/white.skin" );
;1013:
;1014:		cgs.media.redFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/red_base.md3" );
;1015:		cgs.media.blueFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/blue_base.md3" );
;1016:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel( "models/mapobjects/flagbase/ntrl_base.md3" );
;1017:#endif
;1018:	}
LABELV $785
line 1047
;1019:
;1020:#ifdef MISSIONPACK
;1021:	if ( cgs.gametype == GT_1FCTF || cg_buildScript.integer ) {
;1022:		cgs.media.neutralFlagModel = trap_R_RegisterModel( "models/flags/n_flag.md3" );
;1023:		cgs.media.flagShader[0] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral1" );
;1024:		cgs.media.flagShader[1] = trap_R_RegisterShaderNoMip( "icons/iconf_red2" );
;1025:		cgs.media.flagShader[2] = trap_R_RegisterShaderNoMip( "icons/iconf_blu2" );
;1026:		cgs.media.flagShader[3] = trap_R_RegisterShaderNoMip( "icons/iconf_neutral3" );
;1027:	}
;1028:
;1029:	if ( cgs.gametype == GT_OBELISK || cg_buildScript.integer ) {
;1030:		cgs.media.overloadBaseModel = trap_R_RegisterModel( "models/powerups/overload_base.md3" );
;1031:		cgs.media.overloadTargetModel = trap_R_RegisterModel( "models/powerups/overload_target.md3" );
;1032:		cgs.media.overloadLightsModel = trap_R_RegisterModel( "models/powerups/overload_lights.md3" );
;1033:		cgs.media.overloadEnergyModel = trap_R_RegisterModel( "models/powerups/overload_energy.md3" );
;1034:	}
;1035:
;1036:	if ( cgs.gametype == GT_HARVESTER || cg_buildScript.integer ) {
;1037:		cgs.media.harvesterModel = trap_R_RegisterModel( "models/powerups/harvester/harvester.md3" );
;1038:		cgs.media.harvesterRedSkin = trap_R_RegisterSkin( "models/powerups/harvester/red.skin" );
;1039:		cgs.media.harvesterBlueSkin = trap_R_RegisterSkin( "models/powerups/harvester/blue.skin" );
;1040:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel( "models/powerups/obelisk/obelisk.md3" );
;1041:	}
;1042:
;1043:	cgs.media.redKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikred" );
;1044:	cgs.media.dustPuffShader = trap_R_RegisterShader("hasteSmokePuff" );
;1045:#endif
;1046:
;1047:	if ( cgs.gametype >= GT_TEAM || cg_buildScript.integer ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $822
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $818
LABELV $822
line 1048
;1048:		cgs.media.friendShader = trap_R_RegisterShader( "sprites/foe" );
ADDRGP4 $825
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+212
ADDRLP4 428
INDIRI4
ASGNI4
line 1049
;1049:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag" );
ADDRGP4 $828
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+420
ADDRLP4 432
INDIRI4
ASGNI4
line 1050
;1050:		cgs.media.teamStatusBar = trap_R_RegisterShader( "gfx/2d/colorbar.tga" );
ADDRGP4 $831
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+128
ADDRLP4 436
INDIRI4
ASGNI4
line 1054
;1051:#ifdef MISSIONPACK
;1052:		cgs.media.blueKamikazeShader = trap_R_RegisterShader( "models/weaphits/kamikblu" );
;1053:#endif
;1054:	}
LABELV $818
line 1056
;1055:
;1056:	cgs.media.armorModel = trap_R_RegisterModel( "models/powerups/armor/armor_yel.md3" );
ADDRGP4 $834
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+120
ADDRLP4 428
INDIRI4
ASGNI4
line 1057
;1057:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip( "icons/iconr_yellow" );
ADDRGP4 $837
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+124
ADDRLP4 432
INDIRI4
ASGNI4
line 1059
;1058:
;1059:	cgs.media.machinegunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/m_shell.md3" );
ADDRGP4 $840
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+192
ADDRLP4 436
INDIRI4
ASGNI4
line 1060
;1060:	cgs.media.shotgunBrassModel = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $843
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+196
ADDRLP4 440
INDIRI4
ASGNI4
line 1062
;1061:
;1062:	cgs.media.gibAbdomen = trap_R_RegisterModel( "models/gibs/abdomen.md3" );
ADDRGP4 $846
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+136
ADDRLP4 444
INDIRI4
ASGNI4
line 1063
;1063:	cgs.media.gibArm = trap_R_RegisterModel( "models/gibs/arm.md3" );
ADDRGP4 $849
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+140
ADDRLP4 448
INDIRI4
ASGNI4
line 1064
;1064:	cgs.media.gibChest = trap_R_RegisterModel( "models/gibs/chest.md3" );
ADDRGP4 $852
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+144
ADDRLP4 452
INDIRI4
ASGNI4
line 1065
;1065:	cgs.media.gibFist = trap_R_RegisterModel( "models/gibs/fist.md3" );
ADDRGP4 $855
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+148
ADDRLP4 456
INDIRI4
ASGNI4
line 1066
;1066:	cgs.media.gibFoot = trap_R_RegisterModel( "models/gibs/foot.md3" );
ADDRGP4 $858
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+152
ADDRLP4 460
INDIRI4
ASGNI4
line 1067
;1067:	cgs.media.gibForearm = trap_R_RegisterModel( "models/gibs/forearm.md3" );
ADDRGP4 $861
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+156
ADDRLP4 464
INDIRI4
ASGNI4
line 1068
;1068:	cgs.media.gibIntestine = trap_R_RegisterModel( "models/gibs/intestine.md3" );
ADDRGP4 $864
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+160
ADDRLP4 468
INDIRI4
ASGNI4
line 1069
;1069:	cgs.media.gibLeg = trap_R_RegisterModel( "models/gibs/leg.md3" );
ADDRGP4 $867
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+164
ADDRLP4 472
INDIRI4
ASGNI4
line 1070
;1070:	cgs.media.gibSkull = trap_R_RegisterModel( "models/gibs/skull.md3" );
ADDRGP4 $870
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+168
ADDRLP4 476
INDIRI4
ASGNI4
line 1071
;1071:	cgs.media.gibBrain = trap_R_RegisterModel( "models/gibs/brain.md3" );
ADDRGP4 $873
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+172
ADDRLP4 480
INDIRI4
ASGNI4
line 1074
;1072:	
;1073:	// Shafe - Need To Make Models For These
;1074:	cgs.media.glass01 = trap_R_RegisterModel( "models/breakables/glass01.md3" );
ADDRGP4 $876
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+176
ADDRLP4 484
INDIRI4
ASGNI4
line 1075
;1075: 	cgs.media.glass02 = trap_R_RegisterModel( "models/breakables/glass02.md3" );
ADDRGP4 $879
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+180
ADDRLP4 488
INDIRI4
ASGNI4
line 1076
;1076: 	cgs.media.glass03 = trap_R_RegisterModel( "models/breakables/glass03.md3" );
ADDRGP4 $882
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+184
ADDRLP4 492
INDIRI4
ASGNI4
line 1079
;1077:
;1078:
;1079:	cgs.media.smoke2 = trap_R_RegisterModel( "models/weapons2/shells/s_shell.md3" );
ADDRGP4 $843
ARGP4
ADDRLP4 496
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+188
ADDRLP4 496
INDIRI4
ASGNI4
line 1081
;1080:
;1081:	cgs.media.balloonShader = trap_R_RegisterShader( "sprites/balloon3" );
ADDRGP4 $887
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+216
ADDRLP4 500
INDIRI4
ASGNI4
line 1083
;1082:
;1083:	cgs.media.bloodExplosionShader = trap_R_RegisterShader( "bloodExplosion" );
ADDRGP4 $890
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+512
ADDRLP4 504
INDIRI4
ASGNI4
line 1085
;1084:
;1085:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $893
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+472
ADDRLP4 508
INDIRI4
ASGNI4
line 1086
;1086:	cgs.media.ringFlashModel = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $896
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+476
ADDRLP4 512
INDIRI4
ASGNI4
line 1087
;1087:	cgs.media.dishFlashModel = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $899
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+480
ADDRLP4 516
INDIRI4
ASGNI4
line 1091
;1088:#ifdef MISSIONPACK
;1089:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/powerups/pop.md3" );
;1090:#else
;1091:	cgs.media.teleportEffectModel = trap_R_RegisterModel( "models/misc/telep.md3" );
ADDRGP4 $902
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+532
ADDRLP4 520
INDIRI4
ASGNI4
line 1092
;1092:	cgs.media.teleportEffectShader = trap_R_RegisterShader( "teleportEffect" );
ADDRGP4 $905
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+536
ADDRLP4 524
INDIRI4
ASGNI4
line 1110
;1093:#endif
;1094:#ifdef MISSIONPACK
;1095:	cgs.media.kamikazeEffectModel = trap_R_RegisterModel( "models/weaphits/kamboom2.md3" );
;1096:	cgs.media.kamikazeShockWave = trap_R_RegisterModel( "models/weaphits/kamwave.md3" );
;1097:	cgs.media.kamikazeHeadModel = trap_R_RegisterModel( "models/powerups/kamikazi.md3" );
;1098:	cgs.media.kamikazeHeadTrail = trap_R_RegisterModel( "models/powerups/trailtest.md3" );
;1099:	cgs.media.guardPowerupModel = trap_R_RegisterModel( "models/powerups/guard_player.md3" );
;1100:	cgs.media.scoutPowerupModel = trap_R_RegisterModel( "models/powerups/scout_player.md3" );
;1101:	cgs.media.doublerPowerupModel = trap_R_RegisterModel( "models/powerups/doubler_player.md3" );
;1102:	cgs.media.ammoRegenPowerupModel = trap_R_RegisterModel( "models/powerups/ammo_player.md3" );
;1103:	cgs.media.invulnerabilityImpactModel = trap_R_RegisterModel( "models/powerups/shield/impact.md3" );
;1104:	cgs.media.invulnerabilityJuicedModel = trap_R_RegisterModel( "models/powerups/shield/juicer.md3" );
;1105:	cgs.media.medkitUsageModel = trap_R_RegisterModel( "models/powerups/regen.md3" );
;1106:	cgs.media.heartShader = trap_R_RegisterShaderNoMip( "ui/assets/statusbar/selectedhealth.tga" );
;1107:
;1108:#endif
;1109:
;1110:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel( "models/powerups/shield/shield.md3" );
ADDRGP4 $908
ARGP4
ADDRLP4 528
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+154388+540
ADDRLP4 528
INDIRI4
ASGNI4
line 1111
;1111:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip( "medal_impressive" );
ADDRGP4 $911
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+576
ADDRLP4 532
INDIRI4
ASGNI4
line 1112
;1112:	cgs.media.medalExcellent = trap_R_RegisterShaderNoMip( "medal_excellent" );
ADDRGP4 $914
ARGP4
ADDRLP4 536
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+580
ADDRLP4 536
INDIRI4
ASGNI4
line 1113
;1113:	cgs.media.medalGauntlet = trap_R_RegisterShaderNoMip( "medal_gauntlet" );
ADDRGP4 $917
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+584
ADDRLP4 540
INDIRI4
ASGNI4
line 1114
;1114:	cgs.media.medalDefend = trap_R_RegisterShaderNoMip( "medal_defend" );
ADDRGP4 $920
ARGP4
ADDRLP4 544
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+588
ADDRLP4 544
INDIRI4
ASGNI4
line 1115
;1115:	cgs.media.medalAssist = trap_R_RegisterShaderNoMip( "medal_assist" );
ADDRGP4 $923
ARGP4
ADDRLP4 548
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+592
ADDRLP4 548
INDIRI4
ASGNI4
line 1116
;1116:	cgs.media.medalCapture = trap_R_RegisterShaderNoMip( "medal_capture" );
ADDRGP4 $926
ARGP4
ADDRLP4 552
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+596
ADDRLP4 552
INDIRI4
ASGNI4
line 1119
;1117:
;1118:
;1119:	memset( cg_items, 0, sizeof( cg_items ) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1120
;1120:	memset( cg_weapons, 0, sizeof( cg_weapons ) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1123
;1121:
;1122:	// only register the items that the server says we need
;1123:	strcpy( items, CG_ConfigString( CS_ITEMS) );
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
line 1125
;1124:
;1125:	for ( i = 1 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $930
JUMPV
LABELV $927
line 1126
;1126:		if ( items[ i ] == '1' || cg_buildScript.integer ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $934
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $931
LABELV $934
line 1127
;1127:			CG_LoadingItem( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1128
;1128:			CG_RegisterItemVisuals( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1129
;1129:		}
LABELV $931
line 1130
;1130:	}
LABELV $928
line 1125
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $930
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $927
line 1133
;1131:
;1132:	// wall marks
;1133:	cgs.media.bulletMarkShader = trap_R_RegisterShader( "gfx/damage/bullet_mrk" );
ADDRGP4 $937
ARGP4
ADDRLP4 560
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+400
ADDRLP4 560
INDIRI4
ASGNI4
line 1134
;1134:	cgs.media.burnMarkShader = trap_R_RegisterShader( "gfx/damage/burn_med_mrk" );
ADDRGP4 $940
ARGP4
ADDRLP4 564
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+404
ADDRLP4 564
INDIRI4
ASGNI4
line 1135
;1135:	cgs.media.holeMarkShader = trap_R_RegisterShader( "gfx/damage/hole_lg_mrk" );
ADDRGP4 $943
ARGP4
ADDRLP4 568
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+408
ADDRLP4 568
INDIRI4
ASGNI4
line 1136
;1136:	cgs.media.energyMarkShader = trap_R_RegisterShader( "gfx/damage/plasma_mrk" );
ADDRGP4 $946
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+412
ADDRLP4 572
INDIRI4
ASGNI4
line 1137
;1137:	cgs.media.shadowMarkShader = trap_R_RegisterShader( "markShadow" );
ADDRGP4 $949
ARGP4
ADDRLP4 576
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+368
ADDRLP4 576
INDIRI4
ASGNI4
line 1138
;1138:	cgs.media.wakeMarkShader = trap_R_RegisterShader( "wake" );
ADDRGP4 $952
ARGP4
ADDRLP4 580
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+392
ADDRLP4 580
INDIRI4
ASGNI4
line 1139
;1139:	cgs.media.bloodMarkShader = trap_R_RegisterShader( "bloodMark" );
ADDRGP4 $955
ARGP4
ADDRLP4 584
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+396
ADDRLP4 584
INDIRI4
ASGNI4
line 1142
;1140:
;1141:	// Shafe - Trep - Radar
;1142:	cgs.media.scannerShader = trap_R_RegisterShader("Scanner");
ADDRGP4 $958
ARGP4
ADDRLP4 588
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1116
ADDRLP4 588
INDIRI4
ASGNI4
line 1143
;1143:    cgs.media.scannerBlipShader = trap_R_RegisterShader("ScannerBlip");
ADDRGP4 $961
ARGP4
ADDRLP4 592
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1120
ADDRLP4 592
INDIRI4
ASGNI4
line 1144
;1144:    cgs.media.scannerBlipUpShader = trap_R_RegisterShader("ScannerBlipUp");
ADDRGP4 $964
ARGP4
ADDRLP4 596
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1124
ADDRLP4 596
INDIRI4
ASGNI4
line 1145
;1145:    cgs.media.scannerBlipDownShader = trap_R_RegisterShader("ScannerBlipDown");
ADDRGP4 $967
ARGP4
ADDRLP4 600
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+1128
ADDRLP4 600
INDIRI4
ASGNI4
line 1149
;1146:	// Shafe - Trep - End Radar
;1147:
;1148:	// register the inline models
;1149:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 604
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36872
ADDRLP4 604
INDIRI4
ASGNI4
line 1150
;1150:	for ( i = 1 ; i < cgs.numInlineModels ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $972
JUMPV
LABELV $969
line 1155
;1151:		char	name[10];
;1152:		vec3_t			mins, maxs;
;1153:		int				j;
;1154:
;1155:		Com_sprintf( name, sizeof(name), "*%i", i );
ADDRLP4 636
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $974
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1156
;1156:		cgs.inlineDrawModel[i] = trap_R_RegisterModel( name );
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
line 1157
;1157:		trap_R_ModelBounds( cgs.inlineDrawModel[i], mins, maxs );
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
line 1158
;1158:		for ( j = 0 ; j < 3 ; j++ ) {
ADDRLP4 608
CNSTI4 0
ASGNI4
LABELV $977
line 1159
;1159:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * ( maxs[j] - mins[j] );
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
line 1160
;1160:		}
LABELV $978
line 1158
ADDRLP4 608
ADDRLP4 608
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 608
INDIRI4
CNSTI4 3
LTI4 $977
line 1161
;1161:	}
LABELV $970
line 1150
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $972
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36872
INDIRI4
LTI4 $969
line 1164
;1162:
;1163:	// register all the server specified models
;1164:	for (i=1 ; i<MAX_MODELS ; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $982
line 1167
;1165:		const char		*modelName;
;1166:
;1167:		modelName = CG_ConfigString( CS_MODELS+i );
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
line 1168
;1168:		if ( !modelName[0] ) {
ADDRLP4 608
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $986
line 1169
;1169:			break;
ADDRGP4 $984
JUMPV
LABELV $986
line 1171
;1170:		}
;1171:		cgs.gameModels[i] = trap_R_RegisterModel( modelName );
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
line 1172
;1172:	}
LABELV $983
line 1164
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $982
LABELV $984
line 1200
;1173:
;1174:#ifdef MISSIONPACK
;1175:	// new stuff
;1176:	cgs.media.patrolShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
;1177:	cgs.media.assaultShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
;1178:	cgs.media.campShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
;1179:	cgs.media.followShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
;1180:	cgs.media.defendShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
;1181:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
;1182:	cgs.media.retrieveShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
;1183:	cgs.media.escortShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
;1184:	cgs.media.cursor = trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
;1185:	cgs.media.sizeCursor = trap_R_RegisterShaderNoMip( "ui/assets/sizecursor.tga" );
;1186:	cgs.media.selectCursor = trap_R_RegisterShaderNoMip( "ui/assets/selectcursor.tga" );
;1187:	cgs.media.flagShaders[0] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
;1188:	cgs.media.flagShaders[1] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
;1189:	cgs.media.flagShaders[2] = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
;1190:
;1191:	trap_R_RegisterModel( "models/players/james/lower.md3" );
;1192:	trap_R_RegisterModel( "models/players/james/upper.md3" );
;1193:	trap_R_RegisterModel( "models/players/heads/james/james.md3" );
;1194:
;1195:	trap_R_RegisterModel( "models/players/janet/lower.md3" );
;1196:	trap_R_RegisterModel( "models/players/janet/upper.md3" );
;1197:	trap_R_RegisterModel( "models/players/heads/janet/janet.md3" );
;1198:
;1199:#endif
;1200:	CG_ClearParticles ();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1213
;1201:/*
;1202:	for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1203:	{
;1204:		{
;1205:			int rval;
;1206:
;1207:			rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1208:			if (!rval)
;1209:				break;
;1210:		}
;1211:	}
;1212:*/
;1213:}
LABELV $610
endproc CG_RegisterGraphics 660 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1223
;1214:
;1215:
;1216:
;1217:/*																																			
;1218:=======================
;1219:CG_BuildSpectatorString
;1220:
;1221:=======================
;1222:*/
;1223:void CG_BuildSpectatorString() {
line 1225
;1224:	int i;
;1225:	cg.spectatorList[0] = 0;
ADDRGP4 cg+116432
CNSTI1 0
ASGNI1
line 1226
;1226:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $991
line 1227
;1227:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR ) {
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
EQI4 $995
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 3
NEI4 $995
line 1228
;1228:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $1002
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
line 1229
;1229:		}
LABELV $995
line 1230
;1230:	}
LABELV $992
line 1226
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $991
line 1231
;1231:	i = strlen(cg.spectatorList);
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
line 1232
;1232:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+117456
INDIRI4
EQI4 $1006
line 1233
;1233:		cg.spectatorLen = i;
ADDRGP4 cg+117456
ADDRLP4 0
INDIRI4
ASGNI4
line 1234
;1234:		cg.spectatorWidth = -1;
ADDRGP4 cg+117460
CNSTF4 3212836864
ASGNF4
line 1235
;1235:	}
LABELV $1006
line 1236
;1236:}
LABELV $989
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1244
;1237:
;1238:
;1239:/*																																			
;1240:===================
;1241:CG_RegisterClients
;1242:===================
;1243:*/
;1244:static void CG_RegisterClients( void ) {
line 1247
;1245:	int		i;
;1246:
;1247:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1248
;1248:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1250
;1249:
;1250:	for (i=0 ; i<MAX_CLIENTS ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1014
line 1253
;1251:		const char		*clientInfo;
;1252:
;1253:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1018
line 1254
;1254:			continue;
ADDRGP4 $1015
JUMPV
LABELV $1018
line 1257
;1255:		}
;1256:
;1257:		clientInfo = CG_ConfigString( CS_PLAYERS+i );
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
line 1258
;1258:		if ( !clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1021
line 1259
;1259:			continue;
ADDRGP4 $1015
JUMPV
LABELV $1021
line 1261
;1260:		}
;1261:		CG_LoadingClient( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1262
;1262:		CG_NewClientInfo( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1263
;1263:	}
LABELV $1015
line 1250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1014
line 1264
;1264:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1265
;1265:}
LABELV $1011
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1274
;1266:
;1267://===========================================================================
;1268:
;1269:/*
;1270:=================
;1271:CG_ConfigString
;1272:=================
;1273:*/
;1274:const char *CG_ConfigString( int index ) {
line 1275
;1275:	if ( index < 0 || index >= MAX_CONFIGSTRINGS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1026
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1024
LABELV $1026
line 1276
;1276:		CG_Error( "CG_ConfigString: bad index: %i", index );
ADDRGP4 $1027
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1277
;1277:	}
LABELV $1024
line 1278
;1278:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[ index ];
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
LABELV $1023
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1289
;1279:}
;1280:
;1281://==================================================================
;1282:
;1283:/*
;1284:======================
;1285:CG_StartMusic
;1286:
;1287:======================
;1288:*/
;1289:void CG_StartMusic( void ) {
line 1294
;1290:	char	*s;
;1291:	char	parm1[MAX_QPATH], parm2[MAX_QPATH];
;1292:
;1293:	// start the background music
;1294:	s = (char *)CG_ConfigString( CS_MUSIC );
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
line 1295
;1295:	Q_strncpyz( parm1, COM_Parse( &s ), sizeof( parm1 ) );
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
line 1296
;1296:	Q_strncpyz( parm2, COM_Parse( &s ), sizeof( parm2 ) );
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
line 1298
;1297:
;1298:	trap_S_StartBackgroundTrack( parm1, parm2 );
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1299
;1299:}
LABELV $1029
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 44 12
line 1965
;1300:#ifdef MISSIONPACK
;1301:char *CG_GetMenuBuffer(const char *filename) {
;1302:	int	len;
;1303:	fileHandle_t	f;
;1304:	static char buf[MAX_MENUFILE];
;1305:
;1306:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;1307:	if ( !f ) {
;1308:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
;1309:		return NULL;
;1310:	}
;1311:	if ( len >= MAX_MENUFILE ) {
;1312:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
;1313:		trap_FS_FCloseFile( f );
;1314:		return NULL;
;1315:	}
;1316:
;1317:	trap_FS_Read( buf, len, f );
;1318:	buf[len] = 0;
;1319:	trap_FS_FCloseFile( f );
;1320:
;1321:	return buf;
;1322:}
;1323:
;1324://
;1325:// ==============================
;1326:// new hud stuff ( mission pack )
;1327:// ==============================
;1328://
;1329:qboolean CG_Asset_Parse(int handle) {
;1330:	pc_token_t token;
;1331:	const char *tempStr;
;1332:
;1333:	if (!trap_PC_ReadToken(handle, &token))
;1334:		return qfalse;
;1335:	if (Q_stricmp(token.string, "{") != 0) {
;1336:		return qfalse;
;1337:	}
;1338:    
;1339:	while ( 1 ) {
;1340:		if (!trap_PC_ReadToken(handle, &token))
;1341:			return qfalse;
;1342:
;1343:		if (Q_stricmp(token.string, "}") == 0) {
;1344:			return qtrue;
;1345:		}
;1346:
;1347:		// font
;1348:		if (Q_stricmp(token.string, "font") == 0) {
;1349:			int pointSize;
;1350:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1351:				return qfalse;
;1352:			}
;1353:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1354:			continue;
;1355:		}
;1356:
;1357:		// smallFont
;1358:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1359:			int pointSize;
;1360:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1361:				return qfalse;
;1362:			}
;1363:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1364:			continue;
;1365:		}
;1366:
;1367:		// font
;1368:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1369:			int pointSize;
;1370:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1371:				return qfalse;
;1372:			}
;1373:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1374:			continue;
;1375:		}
;1376:
;1377:		// gradientbar
;1378:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1379:			if (!PC_String_Parse(handle, &tempStr)) {
;1380:				return qfalse;
;1381:			}
;1382:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1383:			continue;
;1384:		}
;1385:
;1386:		// enterMenuSound
;1387:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1388:			if (!PC_String_Parse(handle, &tempStr)) {
;1389:				return qfalse;
;1390:			}
;1391:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
;1392:			continue;
;1393:		}
;1394:
;1395:		// exitMenuSound
;1396:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1397:			if (!PC_String_Parse(handle, &tempStr)) {
;1398:				return qfalse;
;1399:			}
;1400:			cgDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
;1401:			continue;
;1402:		}
;1403:
;1404:		// itemFocusSound
;1405:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1406:			if (!PC_String_Parse(handle, &tempStr)) {
;1407:				return qfalse;
;1408:			}
;1409:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
;1410:			continue;
;1411:		}
;1412:
;1413:		// menuBuzzSound
;1414:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1415:			if (!PC_String_Parse(handle, &tempStr)) {
;1416:				return qfalse;
;1417:			}
;1418:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
;1419:			continue;
;1420:		}
;1421:
;1422:		if (Q_stricmp(token.string, "cursor") == 0) {
;1423:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1424:				return qfalse;
;1425:			}
;1426:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip( cgDC.Assets.cursorStr);
;1427:			continue;
;1428:		}
;1429:
;1430:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1431:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1432:				return qfalse;
;1433:			}
;1434:			continue;
;1435:		}
;1436:
;1437:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1438:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1439:				return qfalse;
;1440:			}
;1441:			continue;
;1442:		}
;1443:
;1444:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1445:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1446:				return qfalse;
;1447:			}
;1448:			continue;
;1449:		}
;1450:
;1451:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1452:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1453:				return qfalse;
;1454:			}
;1455:			continue;
;1456:		}
;1457:
;1458:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1459:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1460:				return qfalse;
;1461:			}
;1462:			continue;
;1463:		}
;1464:
;1465:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1466:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1467:				return qfalse;
;1468:			}
;1469:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1470:			continue;
;1471:		}
;1472:	}
;1473:	return qfalse; // bk001204 - why not?
;1474:}
;1475:
;1476:void CG_ParseMenu(const char *menuFile) {
;1477:	pc_token_t token;
;1478:	int handle;
;1479:
;1480:	handle = trap_PC_LoadSource(menuFile);
;1481:	if (!handle)
;1482:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1483:	if (!handle)
;1484:		return;
;1485:
;1486:	while ( 1 ) {
;1487:		if (!trap_PC_ReadToken( handle, &token )) {
;1488:			break;
;1489:		}
;1490:
;1491:		//if ( Q_stricmp( token, "{" ) ) {
;1492:		//	Com_Printf( "Missing { in menu file\n" );
;1493:		//	break;
;1494:		//}
;1495:
;1496:		//if ( menuCount == MAX_MENUS ) {
;1497:		//	Com_Printf( "Too many menus!\n" );
;1498:		//	break;
;1499:		//}
;1500:
;1501:		if ( token.string[0] == '}' ) {
;1502:			break;
;1503:		}
;1504:
;1505:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1506:			if (CG_Asset_Parse(handle)) {
;1507:				continue;
;1508:			} else {
;1509:				break;
;1510:			}
;1511:		}
;1512:
;1513:
;1514:		if (Q_stricmp(token.string, "menudef") == 0) {
;1515:			// start a new menu
;1516:			Menu_New(handle);
;1517:		}
;1518:	}
;1519:	trap_PC_FreeSource(handle);
;1520:}
;1521:
;1522:qboolean CG_Load_Menu(char **p) {
;1523:	char *token;
;1524:
;1525:	token = COM_ParseExt(p, qtrue);
;1526:
;1527:	if (token[0] != '{') {
;1528:		return qfalse;
;1529:	}
;1530:
;1531:	while ( 1 ) {
;1532:
;1533:		token = COM_ParseExt(p, qtrue);
;1534:    
;1535:		if (Q_stricmp(token, "}") == 0) {
;1536:			return qtrue;
;1537:		}
;1538:
;1539:		if ( !token || token[0] == 0 ) {
;1540:			return qfalse;
;1541:		}
;1542:
;1543:		CG_ParseMenu(token); 
;1544:	}
;1545:	return qfalse;
;1546:}
;1547:
;1548:
;1549:
;1550:void CG_LoadMenus(const char *menuFile) {
;1551:	char	*token;
;1552:	char *p;
;1553:	int	len, start;
;1554:	fileHandle_t	f;
;1555:	static char buf[MAX_MENUDEFFILE];
;1556:
;1557:	start = trap_Milliseconds();
;1558:
;1559:	len = trap_FS_FOpenFile( menuFile, &f, FS_READ );
;1560:	if ( !f ) {
;1561:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
;1562:		len = trap_FS_FOpenFile( "ui/hud.txt", &f, FS_READ );
;1563:		if (!f) {
;1564:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile ) );
;1565:		}
;1566:	}
;1567:
;1568:	if ( len >= MAX_MENUDEFFILE ) {
;1569:		trap_Error( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE ) );
;1570:		trap_FS_FCloseFile( f );
;1571:		return;
;1572:	}
;1573:
;1574:	trap_FS_Read( buf, len, f );
;1575:	buf[len] = 0;
;1576:	trap_FS_FCloseFile( f );
;1577:	
;1578:	COM_Compress(buf);
;1579:
;1580:	Menu_Reset();
;1581:
;1582:	p = buf;
;1583:
;1584:	while ( 1 ) {
;1585:		token = COM_ParseExt( &p, qtrue );
;1586:		if( !token || token[0] == 0 || token[0] == '}') {
;1587:			break;
;1588:		}
;1589:
;1590:		//if ( Q_stricmp( token, "{" ) ) {
;1591:		//	Com_Printf( "Missing { in menu file\n" );
;1592:		//	break;
;1593:		//}
;1594:
;1595:		//if ( menuCount == MAX_MENUS ) {
;1596:		//	Com_Printf( "Too many menus!\n" );
;1597:		//	break;
;1598:		//}
;1599:
;1600:		if ( Q_stricmp( token, "}" ) == 0 ) {
;1601:			break;
;1602:		}
;1603:
;1604:		if (Q_stricmp(token, "loadmenu") == 0) {
;1605:			if (CG_Load_Menu(&p)) {
;1606:				continue;
;1607:			} else {
;1608:				break;
;1609:			}
;1610:		}
;1611:	}
;1612:
;1613:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1614:
;1615:}
;1616:
;1617:
;1618:
;1619:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
;1620:	return qfalse;
;1621:}
;1622:
;1623:
;1624:static int CG_FeederCount(float feederID) {
;1625:	int i, count;
;1626:	count = 0;
;1627:	if (feederID == FEEDER_REDTEAM_LIST) {
;1628:		for (i = 0; i < cg.numScores; i++) {
;1629:			if (cg.scores[i].team == TEAM_RED) {
;1630:				count++;
;1631:			}
;1632:		}
;1633:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1634:		for (i = 0; i < cg.numScores; i++) {
;1635:			if (cg.scores[i].team == TEAM_BLUE) {
;1636:				count++;
;1637:			}
;1638:		}
;1639:	} else if (feederID == FEEDER_SCOREBOARD) {
;1640:		return cg.numScores;
;1641:	}
;1642:	return count;
;1643:}
;1644:
;1645:
;1646:void CG_SetScoreSelection(void *p) {
;1647:	menuDef_t *menu = (menuDef_t*)p;
;1648:	playerState_t *ps = &cg.snap->ps;
;1649:	int i, red, blue;
;1650:	red = blue = 0;
;1651:	for (i = 0; i < cg.numScores; i++) {
;1652:		if (cg.scores[i].team == TEAM_RED) {
;1653:			red++;
;1654:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1655:			blue++;
;1656:		}
;1657:		if (ps->clientNum == cg.scores[i].client) {
;1658:			cg.selectedScore = i;
;1659:		}
;1660:	}
;1661:
;1662:	if (menu == NULL) {
;1663:		// just interested in setting the selected score
;1664:		return;
;1665:	}
;1666:
;1667:	if ( cgs.gametype >= GT_TEAM ) {
;1668:		int feeder = FEEDER_REDTEAM_LIST;
;1669:		i = red;
;1670:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1671:			feeder = FEEDER_BLUETEAM_LIST;
;1672:			i = blue;
;1673:		}
;1674:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1675:	} else {
;1676:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1677:	}
;1678:}
;1679:
;1680:// FIXME: might need to cache this info
;1681:static clientInfo_t * CG_InfoFromScoreIndex(int index, int team, int *scoreIndex) {
;1682:	int i, count;
;1683:	if ( cgs.gametype >= GT_TEAM ) {
;1684:		count = 0;
;1685:		for (i = 0; i < cg.numScores; i++) {
;1686:			if (cg.scores[i].team == team) {
;1687:				if (count == index) {
;1688:					*scoreIndex = i;
;1689:					return &cgs.clientinfo[cg.scores[i].client];
;1690:				}
;1691:				count++;
;1692:			}
;1693:		}
;1694:	}
;1695:	*scoreIndex = index;
;1696:	return &cgs.clientinfo[ cg.scores[index].client ];
;1697:}
;1698:
;1699:static const char *CG_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
;1700:	gitem_t *item;
;1701:	int scoreIndex = 0;
;1702:	clientInfo_t *info = NULL;
;1703:	int team = -1;
;1704:	score_t *sp = NULL;
;1705:
;1706:	*handle = -1;
;1707:
;1708:	if (feederID == FEEDER_REDTEAM_LIST) {
;1709:		team = TEAM_RED;
;1710:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1711:		team = TEAM_BLUE;
;1712:	}
;1713:
;1714:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1715:	sp = &cg.scores[scoreIndex];
;1716:
;1717:	if (info && info->infoValid) {
;1718:		switch (column) {
;1719:			case 0:
;1720:				if ( info->powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;1721:					item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
;1722:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1723:				} else if ( info->powerups & ( 1 << PW_REDFLAG ) ) {
;1724:					item = BG_FindItemForPowerup( PW_REDFLAG );
;1725:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1726:				} else if ( info->powerups & ( 1 << PW_BLUEFLAG ) ) {
;1727:					item = BG_FindItemForPowerup( PW_BLUEFLAG );
;1728:					*handle = cg_items[ ITEM_INDEX(item) ].icon;
;1729:				} else {
;1730:					if ( info->botSkill > 0 && info->botSkill <= 5 ) {
;1731:						*handle = cgs.media.botSkillShaders[ info->botSkill - 1 ];
;1732:					} else if ( info->handicap < 100 ) {
;1733:					return va("%i", info->handicap );
;1734:					}
;1735:				}
;1736:			break;
;1737:			case 1:
;1738:				if (team == -1) {
;1739:					return "";
;1740:				} else {
;1741:					*handle = CG_StatusHandle(info->teamTask);
;1742:				}
;1743:		  break;
;1744:			case 2:
;1745:				if ( cg.snap->ps.stats[ STAT_CLIENTS_READY ] & ( 1 << sp->client ) ) {
;1746:					return "Ready";
;1747:				}
;1748:				if (team == -1) {
;1749:					if (cgs.gametype == GT_TOURNAMENT) {
;1750:						return va("%i/%i", info->wins, info->losses);
;1751:					} else if (info->infoValid && info->team == TEAM_SPECTATOR ) {
;1752:						return "Spectator";
;1753:					} else {
;1754:						return "";
;1755:					}
;1756:				} else {
;1757:					if (info->teamLeader) {
;1758:						return "Leader";
;1759:					}
;1760:				}
;1761:			break;
;1762:			case 3:
;1763:				return info->name;
;1764:			break;
;1765:			case 4:
;1766:				return va("%i", info->score);
;1767:			break;
;1768:			case 5:
;1769:				return va("%4i", sp->time);
;1770:			break;
;1771:			case 6:
;1772:				if ( sp->ping == -1 ) {
;1773:					return "connecting";
;1774:				} 
;1775:				return va("%4i", sp->ping);
;1776:			break;
;1777:		}
;1778:	}
;1779:
;1780:	return "";
;1781:}
;1782:
;1783:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1784:	return 0;
;1785:}
;1786:
;1787:static void CG_FeederSelection(float feederID, int index) {
;1788:	if ( cgs.gametype >= GT_TEAM ) {
;1789:		int i, count;
;1790:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1791:		count = 0;
;1792:		for (i = 0; i < cg.numScores; i++) {
;1793:			if (cg.scores[i].team == team) {
;1794:				if (index == count) {
;1795:					cg.selectedScore = i;
;1796:				}
;1797:				count++;
;1798:			}
;1799:		}
;1800:	} else {
;1801:		cg.selectedScore = index;
;1802:	}
;1803:}
;1804:#endif
;1805:
;1806:#ifdef MISSIONPACK // bk001204 - only needed there
;1807:static float CG_Cvar_Get(const char *cvar) {
;1808:	char buff[128];
;1809:	memset(buff, 0, sizeof(buff));
;1810:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
;1811:	return atof(buff);
;1812:}
;1813:#endif
;1814:
;1815:#ifdef MISSIONPACK
;1816:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
;1817:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1818:}
;1819:
;1820:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1821:	switch (ownerDraw) {
;1822:	  case CG_GAME_TYPE:
;1823:			return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1824:	  case CG_GAME_STATUS:
;1825:			return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1826:			break;
;1827:	  case CG_KILLER:
;1828:			return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1829:			break;
;1830:	  case CG_RED_NAME:
;1831:			return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1832:			break;
;1833:	  case CG_BLUE_NAME:
;1834:			return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1835:			break;
;1836:
;1837:
;1838:	}
;1839:	return 0;
;1840:}
;1841:
;1842:static int CG_PlayCinematic(const char *name, float x, float y, float w, float h) {
;1843:  return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1844:}
;1845:
;1846:static void CG_StopCinematic(int handle) {
;1847:  trap_CIN_StopCinematic(handle);
;1848:}
;1849:
;1850:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1851:  trap_CIN_SetExtents(handle, x, y, w, h);
;1852:  trap_CIN_DrawCinematic(handle);
;1853:}
;1854:
;1855:static void CG_RunCinematicFrame(int handle) {
;1856:  trap_CIN_RunCinematic(handle);
;1857:}
;1858:
;1859:/*
;1860:=================
;1861:CG_LoadHudMenu();
;1862:
;1863:=================
;1864:*/
;1865:void CG_LoadHudMenu() {
;1866:	char buff[1024];
;1867:	const char *hudSet;
;1868:
;1869:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1870:	cgDC.setColor = &trap_R_SetColor;
;1871:	cgDC.drawHandlePic = &CG_DrawPic;
;1872:	cgDC.drawStretchPic = &trap_R_DrawStretchPic;
;1873:	cgDC.drawText = &CG_Text_Paint;
;1874:	cgDC.textWidth = &CG_Text_Width;
;1875:	cgDC.textHeight = &CG_Text_Height;
;1876:	cgDC.registerModel = &trap_R_RegisterModel;
;1877:	cgDC.modelBounds = &trap_R_ModelBounds;
;1878:	cgDC.fillRect = &CG_FillRect;
;1879:	cgDC.drawRect = &CG_DrawRect;   
;1880:	cgDC.drawSides = &CG_DrawSides;
;1881:	cgDC.drawTopBottom = &CG_DrawTopBottom;
;1882:	cgDC.clearScene = &trap_R_ClearScene;
;1883:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;1884:	cgDC.renderScene = &trap_R_RenderScene;
;1885:	cgDC.registerFont = &trap_R_RegisterFont;
;1886:	cgDC.ownerDrawItem = &CG_OwnerDraw;
;1887:	cgDC.getValue = &CG_GetValue;
;1888:	cgDC.ownerDrawVisible = &CG_OwnerDrawVisible;
;1889:	cgDC.runScript = &CG_RunMenuScript;
;1890:	cgDC.getTeamColor = &CG_GetTeamColor;
;1891:	cgDC.setCVar = trap_Cvar_Set;
;1892:	cgDC.getCVarString = trap_Cvar_VariableStringBuffer;
;1893:	cgDC.getCVarValue = CG_Cvar_Get;
;1894:	cgDC.drawTextWithCursor = &CG_Text_PaintWithCursor;
;1895:	//cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;1896:	//cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;1897:	cgDC.startLocalSound = &trap_S_StartLocalSound;
;1898:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;1899:	cgDC.feederCount = &CG_FeederCount;
;1900:	cgDC.feederItemImage = &CG_FeederItemImage;
;1901:	cgDC.feederItemText = &CG_FeederItemText;
;1902:	cgDC.feederSelection = &CG_FeederSelection;
;1903:	//cgDC.setBinding = &trap_Key_SetBinding;
;1904:	//cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;1905:	//cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;1906:	//cgDC.executeText = &trap_Cmd_ExecuteText;
;1907:	cgDC.Error = &Com_Error; 
;1908:	cgDC.Print = &Com_Printf; 
;1909:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;1910:	//cgDC.Pause = &CG_Pause;
;1911:	cgDC.registerSound = &trap_S_RegisterSound;
;1912:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;1913:	cgDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
;1914:	cgDC.playCinematic = &CG_PlayCinematic;
;1915:	cgDC.stopCinematic = &CG_StopCinematic;
;1916:	cgDC.drawCinematic = &CG_DrawCinematic;
;1917:	cgDC.runCinematicFrame = &CG_RunCinematicFrame;
;1918:	
;1919:	Init_Display(&cgDC);
;1920:
;1921:	Menu_Reset();
;1922:	
;1923:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;1924:	hudSet = buff;
;1925:	if (hudSet[0] == '\0') {
;1926:		hudSet = "ui/hud.txt";
;1927:	}
;1928:
;1929:	CG_LoadMenus(hudSet);
;1930:}
;1931:
;1932:void CG_AssetCache() {
;1933:	//if (Assets.textFont == NULL) {
;1934:	//  trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;1935:	//}
;1936:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;1937:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;1938:	cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
;1939:	cgDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
;1940:	cgDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
;1941:	cgDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
;1942:	cgDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
;1943:	cgDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
;1944:	cgDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
;1945:	cgDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
;1946:	cgDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
;1947:	cgDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
;1948:	cgDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
;1949:	cgDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
;1950:	cgDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
;1951:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
;1952:	cgDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
;1953:	cgDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
;1954:	cgDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
;1955:}
;1956:#endif
;1957:/*
;1958:=================
;1959:CG_Init
;1960:
;1961:Called after every level change or subsystem restart
;1962:Will perform callbacks to make the loading info screen update.
;1963:=================
;1964:*/
;1965:void CG_Init( int serverMessageNum, int serverCommandSequence, int clientNum ) {
line 1969
;1966:	const char	*s;
;1967:
;1968:	// clear everything
;1969:	memset( &cgs, 0, sizeof( cgs ) );
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 155548
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1970
;1970:	memset( &cg, 0, sizeof( cg ) );
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 157976
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1971
;1971:	memset( cg_entities, 0, sizeof(cg_entities) );
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 757760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1972
;1972:	memset( cg_weapons, 0, sizeof(cg_weapons) );
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1973
;1973:	memset( cg_items, 0, sizeof(cg_items) );
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6144
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1975
;1974:
;1975:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1977
;1976:
;1977:	cgs.processedSnapshotNum = serverMessageNum;
ADDRGP4 cgs+31448
ADDRFP4 0
INDIRI4
ASGNI4
line 1978
;1978:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31444
ADDRFP4 4
INDIRI4
ASGNI4
line 1981
;1979:
;1980:	// load a few needed things before we do any screen updates
;1981:	cgs.media.charsetShader		= trap_R_RegisterShader( "gfx/2d/bigchars" );
ADDRGP4 $1035
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388
ADDRLP4 4
INDIRI4
ASGNI4
line 1982
;1982:	cgs.media.whiteShader		= trap_R_RegisterShader( "white" );
ADDRGP4 $1038
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+154388+16
ADDRLP4 8
INDIRI4
ASGNI4
line 1983
;1983:	cgs.media.charsetProp		= trap_R_RegisterShaderNoMip( "menu/art/font1_prop.tga" );
ADDRGP4 $1041
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+4
ADDRLP4 12
INDIRI4
ASGNI4
line 1984
;1984:	cgs.media.charsetPropGlow	= trap_R_RegisterShaderNoMip( "menu/art/font1_prop_glo.tga" );
ADDRGP4 $1044
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+8
ADDRLP4 16
INDIRI4
ASGNI4
line 1985
;1985:	cgs.media.charsetPropB		= trap_R_RegisterShaderNoMip( "menu/art/font2_prop.tga" );
ADDRGP4 $1047
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+154388+12
ADDRLP4 20
INDIRI4
ASGNI4
line 1987
;1986:
;1987:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1989
;1988:
;1989:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1991
;1990:
;1991:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+111004
CNSTI4 2
ASGNI4
line 1993
;1992:
;1993:	cgs.redflag = cgs.blueflag = -1; // For compatibily, default to unset for
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
line 1994
;1994:	cgs.flagStatus = -1;
ADDRGP4 cgs+34816
CNSTI4 -1
ASGNI4
line 1998
;1995:	// old servers
;1996:
;1997:	// get the rendering configuration from the client system
;1998:	trap_GetGlconfig( &cgs.glconfig );
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1999
;1999:	cgs.screenXScale = cgs.glconfig.vidWidth / 640.0;
ADDRGP4 cgs+31432
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1142947840
DIVF4
ASGNF4
line 2000
;2000:	cgs.screenYScale = cgs.glconfig.vidHeight / 480.0;
ADDRGP4 cgs+31436
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1139802112
DIVF4
ASGNF4
line 2003
;2001:
;2002:	// get the gamestate from the client system
;2003:	trap_GetGameState( &cgs.gameState );
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 2006
;2004:
;2005:	// check version
;2006:	s = CG_ConfigString( CS_GAME_VERSION );
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
line 2007
;2007:	if ( strcmp( s, GAME_VERSION ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1061
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1059
line 2008
;2008:		CG_Error( "Client/Server game mismatch: %s/%s", GAME_VERSION, s );
ADDRGP4 $1062
ARGP4
ADDRGP4 $1061
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2009
;2009:	}
LABELV $1059
line 2011
;2010:
;2011:	s = CG_ConfigString( CS_LEVEL_START_TIME );
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
line 2012
;2012:	cgs.levelStartTime = atoi( s );
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
line 2014
;2013:
;2014:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 2017
;2015:
;2016:	// load the new map
;2017:	CG_LoadingString( "collision map" );
ADDRGP4 $1064
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2019
;2018:
;2019:	trap_CM_LoadMap( cgs.mapname );
ADDRGP4 cgs+31484
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2025
;2020:
;2021:#ifdef MISSIONPACK
;2022:	String_Init();
;2023:#endif
;2024:
;2025:	cg.loading = qtrue;		// force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2027
;2026:
;2027:	CG_LoadingString( "sounds" );
ADDRGP4 $1067
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2029
;2028:
;2029:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2031
;2030:
;2031:	CG_LoadingString( "graphics" );
ADDRGP4 $1068
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2033
;2032:
;2033:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2035
;2034:
;2035:	CG_LoadingString( "clients" );
ADDRGP4 $1069
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2037
;2036:
;2037:	CG_RegisterClients();		// if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2045
;2038:
;2039:// Shafe - Trep Open TA Stuff Up
;2040:#ifdef MISSIONPACK
;2041:	CG_AssetCache();
;2042:	CG_LoadHudMenu();      // load new hud stuff
;2043:#endif
;2044:
;2045:	cg.loading = qfalse;	// future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2047
;2046:
;2047:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2049
;2048:
;2049:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2052
;2050:
;2051:	// remove the last loading update
;2052:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+111504
CNSTI1 0
ASGNI1
line 2055
;2053:
;2054:	// Make sure we have update values (scores)
;2055:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 2057
;2056:
;2057:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2059
;2058:
;2059:	CG_LoadingString( "" );
ADDRGP4 $1072
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2066
;2060:
;2061:
;2062:#ifdef MISSIONPACK
;2063:	CG_InitTeamChat();
;2064:#endif
;2065:
;2066:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2068
;2067:
;2068:	trap_S_ClearLoopingSounds( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2069
;2069:}
LABELV $1030
endproc CG_Init 44 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2078
;2070:
;2071:/*
;2072:=================
;2073:CG_Shutdown
;2074:
;2075:Called before every level change or subsystem restart
;2076:=================
;2077:*/
;2078:void CG_Shutdown( void ) {
line 2081
;2079:	// some mods may need to do cleanup work here,
;2080:	// like closing files or archiving session data
;2081:}
LABELV $1073
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2095
;2082:
;2083:
;2084:/*
;2085:==================
;2086:CG_EventHandling
;2087:==================
;2088: type 0 - no event handling
;2089:      1 - team menu
;2090:      2 - hud editor
;2091:
;2092:*/
;2093:
;2094:#ifndef MISSIONPACK
;2095:void CG_EventHandling(int type) {
line 2096
;2096:}
LABELV $1074
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 0 0
line 2100
;2097:
;2098:
;2099:
;2100:void CG_KeyEvent(int key, qboolean down) {
line 2101
;2101:}
LABELV $1075
endproc CG_KeyEvent 0 0
export CG_MouseEvent
proc CG_MouseEvent 0 0
line 2103
;2102:
;2103:void CG_MouseEvent(int x, int y) {
line 2104
;2104:}
LABELV $1076
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
LABELV $1072
byte 1 0
align 1
LABELV $1069
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1068
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
LABELV $1067
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1064
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
LABELV $1062
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
LABELV $1061
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
LABELV $1047
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
LABELV $1044
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
LABELV $1041
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
LABELV $1038
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1035
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
LABELV $1027
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
LABELV $1002
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $974
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $967
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
LABELV $964
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
LABELV $961
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
LABELV $958
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $955
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
LABELV $952
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $949
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
LABELV $946
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
LABELV $943
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
LABELV $940
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
LABELV $937
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
LABELV $926
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
LABELV $923
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
LABELV $920
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
LABELV $917
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
LABELV $914
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
LABELV $911
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
LABELV $908
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
LABELV $905
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
LABELV $902
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
LABELV $899
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
LABELV $896
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
LABELV $893
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
LABELV $890
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
LABELV $887
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
LABELV $882
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
LABELV $879
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
LABELV $876
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
LABELV $873
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
LABELV $870
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
LABELV $867
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
LABELV $864
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
LABELV $861
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
LABELV $858
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
LABELV $855
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
LABELV $852
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
LABELV $849
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
LABELV $846
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
LABELV $837
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
LABELV $834
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
LABELV $831
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
LABELV $828
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
LABELV $825
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
byte 1 51
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
byte 1 50
byte 1 0
align 1
LABELV $809
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
byte 1 51
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
byte 1 50
byte 1 0
align 1
LABELV $798
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
LABELV $795
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
LABELV $792
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
LABELV $784
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
LABELV $781
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
LABELV $778
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
LABELV $775
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
LABELV $767
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
LABELV $764
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
LABELV $761
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
LABELV $758
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
LABELV $755
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
LABELV $752
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
LABELV $749
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
LABELV $746
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
LABELV $743
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
LABELV $740
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
LABELV $737
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
LABELV $734
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
LABELV $731
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
LABELV $728
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
LABELV $721
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
LABELV $718
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
LABELV $715
byte 1 115
byte 1 103
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $712
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
LABELV $709
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
LABELV $706
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
LABELV $703
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
LABELV $700
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
LABELV $697
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
LABELV $694
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
LABELV $691
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
LABELV $688
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
LABELV $685
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
LABELV $682
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
LABELV $679
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
LABELV $676
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
LABELV $673
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
LABELV $670
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
LABELV $667
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
LABELV $664
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
LABELV $661
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
LABELV $658
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
LABELV $655
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
byte 1 53
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
byte 1 52
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
byte 1 51
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
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $636
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
LABELV $627
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
byte 1 115
byte 1 105
byte 1 120
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
LABELV $615
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
LABELV $614
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
LABELV $613
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
LABELV $612
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
LABELV $609
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
LABELV $606
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
LABELV $603
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
LABELV $600
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
LABELV $597
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
LABELV $594
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
LABELV $591
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
LABELV $588
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
LABELV $585
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
LABELV $582
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
LABELV $579
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
LABELV $576
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
LABELV $573
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
LABELV $570
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
LABELV $567
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
LABELV $564
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
LABELV $561
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
LABELV $558
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
LABELV $555
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
LABELV $552
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
LABELV $513
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
LABELV $505
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
LABELV $493
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
LABELV $490
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
LABELV $487
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
LABELV $484
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
LABELV $481
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
LABELV $478
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
LABELV $475
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
LABELV $472
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
LABELV $469
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
LABELV $466
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
LABELV $463
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
LABELV $460
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
LABELV $457
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
LABELV $454
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
LABELV $451
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
LABELV $448
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
LABELV $445
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
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $442
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
LABELV $439
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
LABELV $436
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
LABELV $433
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
LABELV $430
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
LABELV $427
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
LABELV $424
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
LABELV $421
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
LABELV $418
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
LABELV $415
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
LABELV $412
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
LABELV $407
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
LABELV $401
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
LABELV $398
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
LABELV $395
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
LABELV $392
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
LABELV $381
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
LABELV $378
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
LABELV $375
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
LABELV $372
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
LABELV $361
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
LABELV $358
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
LABELV $355
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
LABELV $352
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
LABELV $349
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
LABELV $339
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
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $336
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
byte 1 111
byte 1 110
byte 1 101
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
byte 1 116
byte 1 119
byte 1 111
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
