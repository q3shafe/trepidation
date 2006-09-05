code
proc InGame_RestartAction 0 8
file "../ui_ingame.c"
line 108
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:INGAME MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define INGAME_FRAME					"menu/art/addbotframe"
;16://#define INGAME_FRAME					"menu/art/cut_frame"
;17:#define INGAME_MENU_VERTICAL_SPACING	28
;18:
;19:#define ID_TEAM					10
;20:#define ID_ADDBOTS				11
;21:#define ID_REMOVEBOTS			12
;22:#define ID_SETUP				13
;23:#define ID_SERVERINFO			14
;24:#define ID_LEAVEARENA			15
;25:#define ID_RESTART				16
;26:#define ID_QUIT					17
;27:#define ID_RESUME				18
;28:#define ID_TEAMORDERS			19
;29:#define ID_CALLVOTE				20
;30:#define ID_CLASS				21
;31:
;32:
;33:
;34:typedef struct {
;35:	menuframework_s	menu;
;36:
;37:	menubitmap_s	frame;
;38:	menutext_s		team;
;39:	menutext_s		setup;
;40:	menutext_s		server;
;41:	menutext_s		leave;
;42:	menutext_s		restart;
;43:	menutext_s		addbots;
;44:	menutext_s		removebots;
;45:	menutext_s		teamorders;
;46:	menutext_s		quit;
;47:	menutext_s		resume;
;48:	menutext_s		callvote;
;49:	menutext_s		pickclass;
;50:} ingamemenu_t;
;51:
;52:static ingamemenu_t	s_ingame;
;53:
;54:
;55:
;56:
;57:// Shafe - Dynamic Menu SYstem
;58:/*
;59:===========================
;60:
;61:INGAME DYNAMIC COMMAND MENU
;62:
;63:===========================
;64:*/
;65:
;66:
;67:#define MAX_DYNAMICDEPTH	6
;68:#define MAX_MENUSTRING		16
;69:
;70:#define MENUSPACE_X			4
;71:#define MENUSPACE_Y			1
;72:
;73:
;74:typedef void (*createHandler)(void);
;75:typedef void (*eventHandler)(int index);
;76:
;77:
;78:typedef struct {
;79:	char text[MAX_MENUSTRING];
;80:	int index;
;81:	int id;
;82:	createHandler createSubMenu;
;83:	eventHandler runEvent;
;84:} dynamicitem_t;
;85:
;86:
;87:typedef struct {
;88:	menuframework_s menu;
;89:
;90:	menutext_s item[MAX_MENUITEMS];
;91:	dynamicitem_t data[MAX_MENUITEMS];
;92:
;93:	int start[MAX_DYNAMICDEPTH];
;94:	int end[MAX_DYNAMICDEPTH];// indicates to (last item + 1)
;95:	int active[MAX_DYNAMICDEPTH];
;96:	int gametype;
;97:	int depth;
;98:} dynamicmenu_t;
;99:
;100:static dynamicmenu_t s_dynamic;
;101:
;102:
;103:/*
;104:=================
;105:InGame_RestartAction
;106:=================
;107:*/
;108:static void InGame_RestartAction( qboolean result ) {
line 109
;109:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $73
line 110
;110:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 113
;111:	}
;112:
;113:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 114
;114:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 115
;115:}
LABELV $72
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 0
line 123
;116:
;117:
;118:/*
;119:=================
;120:InGame_QuitAction
;121:=================
;122:*/
;123:static void InGame_QuitAction( qboolean result ) {
line 124
;124:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $77
line 125
;125:		return;
ADDRGP4 $76
JUMPV
LABELV $77
line 127
;126:	}
;127:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 128
;128:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 129
;129:}
LABELV $76
endproc InGame_QuitAction 0 0
export InGame_Event
proc InGame_Event 8 12
line 137
;130:
;131:
;132:/*
;133:=================
;134:InGame_Event
;135:=================
;136:*/
;137:void InGame_Event( void *ptr, int notification ) {
line 138
;138:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 139
;139:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 142
;140:	}
;141:
;142:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 21
GTI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $100-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $100
address $85
address $94
address $95
address $86
address $93
address $87
address $89
address $91
address $99
address $98
address $83
address $83
code
LABELV $85
line 144
;143:	case ID_TEAM:
;144:		UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 145
;145:		break;
ADDRGP4 $83
JUMPV
LABELV $86
line 148
;146:
;147:	case ID_SETUP:
;148:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 149
;149:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 152
;150:
;151:	case ID_LEAVEARENA:
;152:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 153
;153:		break;
ADDRGP4 $83
JUMPV
LABELV $89
line 156
;154:
;155:	case ID_RESTART:
;156:		UI_ConfirmMenu( "RESTART ARENA?", (voidfunc_f)NULL, InGame_RestartAction );
ADDRGP4 $90
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 157
;157:		break;
ADDRGP4 $83
JUMPV
LABELV $91
line 160
;158:
;159:	case ID_QUIT:
;160:		UI_ConfirmMenu( "EXIT GAME?",  (voidfunc_f)NULL, InGame_QuitAction );
ADDRGP4 $92
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 161
;161:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 164
;162:
;163:	case ID_SERVERINFO:
;164:		UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 165
;165:		break;
ADDRGP4 $83
JUMPV
LABELV $94
line 168
;166:
;167:	case ID_ADDBOTS:
;168:		UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 169
;169:		break;
ADDRGP4 $83
JUMPV
LABELV $95
line 172
;170:
;171:	case ID_REMOVEBOTS:
;172:		UI_RemoveBotsMenu();
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 173
;173:		break;
ADDRGP4 $83
JUMPV
line 177
;174:
;175:	case ID_CALLVOTE:
;176:		//UI_RemoveBotsMenu();
;177:		break;
line 181
;178:
;179:	case ID_CLASS:
;180:		//UI_RemoveBotsMenu();
;181:		break;
LABELV $98
line 184
;182:
;183:	case ID_TEAMORDERS:
;184:		UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 185
;185:		break;
ADDRGP4 $83
JUMPV
LABELV $99
line 188
;186:
;187:	case ID_RESUME:
;188:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 189
;189:		break;
LABELV $82
LABELV $83
line 191
;190:	}
;191:}
LABELV $79
endproc InGame_Event 8 12
export InGame_MenuInit
proc InGame_MenuInit 4148 12
line 199
;192:
;193:
;194:/*
;195:=================
;196:InGame_MenuInit
;197:=================
;198:*/
;199:void InGame_MenuInit( void ) {
line 205
;200:	int		y;
;201:	uiClientState_t	cs;
;202:	char	info[MAX_INFO_STRING];
;203:	int		team;
;204:
;205:	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1240
ARGI4
ADDRGP4 memset
CALLP4
pop
line 207
;206:
;207:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 209
;208:
;209:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+276
CNSTI4 1
ASGNI4
line 210
;210:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+280
CNSTI4 0
ASGNI4
line 212
;211:
;212:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+288
CNSTI4 6
ASGNI4
line 213
;213:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+288+44
CNSTU4 16384
ASGNU4
line 214
;214:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+288+4
ADDRGP4 $110
ASGNP4
line 215
;215:	s_ingame.frame.generic.x			= 320-233;//142;
ADDRGP4 s_ingame+288+12
CNSTI4 87
ASGNI4
line 216
;216:	s_ingame.frame.generic.y			= 240-166;//118;
ADDRGP4 s_ingame+288+16
CNSTI4 74
ASGNI4
line 217
;217:	s_ingame.frame.width				= 466;//359;
ADDRGP4 s_ingame+288+76
CNSTI4 466
ASGNI4
line 218
;218:	s_ingame.frame.height				= 332;//256;
ADDRGP4 s_ingame+288+80
CNSTI4 332
ASGNI4
line 221
;219:
;220:	//y = 96;
;221:	y = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 222
;222:	s_ingame.team.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+376
CNSTI4 9
ASGNI4
line 223
;223:	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+376+44
CNSTU4 264
ASGNU4
line 224
;224:	s_ingame.team.generic.x				= 320;
ADDRGP4 s_ingame+376+12
CNSTI4 320
ASGNI4
line 225
;225:	s_ingame.team.generic.y				= y;
ADDRGP4 s_ingame+376+16
ADDRLP4 0
INDIRI4
ASGNI4
line 226
;226:	s_ingame.team.generic.id			= ID_TEAM;
ADDRGP4 s_ingame+376+8
CNSTI4 10
ASGNI4
line 227
;227:	s_ingame.team.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+376+48
ADDRGP4 InGame_Event
ASGNP4
line 228
;228:	s_ingame.team.string				= "JOIN GAME";
ADDRGP4 s_ingame+376+60
ADDRGP4 $132
ASGNP4
line 229
;229:	s_ingame.team.color					= color_red;
ADDRGP4 s_ingame+376+68
ADDRGP4 color_red
ASGNP4
line 230
;230:	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+376+64
CNSTI4 17
ASGNI4
line 232
;231:
;232:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $139
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
NEF4 $137
line 233
;233:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 234
;234:	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+736
CNSTI4 9
ASGNI4
line 235
;235:	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+736+44
CNSTU4 264
ASGNU4
line 236
;236:	s_ingame.addbots.generic.x			= 320;
ADDRGP4 s_ingame+736+12
CNSTI4 320
ASGNI4
line 237
;237:	s_ingame.addbots.generic.y			= y;
ADDRGP4 s_ingame+736+16
ADDRLP4 0
INDIRI4
ASGNI4
line 238
;238:	s_ingame.addbots.generic.id			= ID_ADDBOTS;
ADDRGP4 s_ingame+736+8
CNSTI4 11
ASGNI4
line 239
;239:	s_ingame.addbots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+736+48
ADDRGP4 InGame_Event
ASGNP4
line 240
;240:	s_ingame.addbots.string				= "ADD BOTS";
ADDRGP4 s_ingame+736+60
ADDRGP4 $153
ASGNP4
line 241
;241:	s_ingame.addbots.color				= color_red;
ADDRGP4 s_ingame+736+68
ADDRGP4 color_red
ASGNP4
line 242
;242:	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+736+64
CNSTI4 17
ASGNI4
line 243
;243:		if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
ADDRGP4 $139
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4120
INDIRF4
CNSTF4 0
EQF4 $163
ADDRGP4 $160
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
EQF4 $163
ADDRGP4 $161
ARGP4
ADDRLP4 4128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4128
INDIRF4
CNSTF4 1073741824
NEF4 $158
LABELV $163
line 244
;244:			s_ingame.addbots.generic.flags |= QMF_GRAYED;
ADDRLP4 4132
ADDRGP4 s_ingame+736+44
ASGNP4
ADDRLP4 4132
INDIRP4
ADDRLP4 4132
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 245
;245:		}
LABELV $158
line 248
;246:	
;247:
;248:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 249
;249:	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+808
CNSTI4 9
ASGNI4
line 250
;250:	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+808+44
CNSTU4 264
ASGNU4
line 251
;251:	s_ingame.removebots.generic.x			= 320;
ADDRGP4 s_ingame+808+12
CNSTI4 320
ASGNI4
line 252
;252:	s_ingame.removebots.generic.y			= y;
ADDRGP4 s_ingame+808+16
ADDRLP4 0
INDIRI4
ASGNI4
line 253
;253:	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
ADDRGP4 s_ingame+808+8
CNSTI4 12
ASGNI4
line 254
;254:	s_ingame.removebots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+808+48
ADDRGP4 InGame_Event
ASGNP4
line 255
;255:	s_ingame.removebots.string				= "REMOVE BOTS";
ADDRGP4 s_ingame+808+60
ADDRGP4 $179
ASGNP4
line 256
;256:	s_ingame.removebots.color				= color_red;
ADDRGP4 s_ingame+808+68
ADDRGP4 color_red
ASGNP4
line 257
;257:	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+808+64
CNSTI4 17
ASGNI4
line 258
;258:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
ADDRGP4 $139
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4132
INDIRF4
CNSTF4 0
EQF4 $187
ADDRGP4 $160
ARGP4
ADDRLP4 4136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4136
INDIRF4
CNSTF4 0
EQF4 $187
ADDRGP4 $161
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4140
INDIRF4
CNSTF4 1073741824
NEF4 $184
LABELV $187
line 259
;259:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
ADDRLP4 4144
ADDRGP4 s_ingame+808+44
ASGNP4
ADDRLP4 4144
INDIRP4
ADDRLP4 4144
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 260
;260:		}
LABELV $184
line 261
;261:	}
LABELV $137
line 263
;262:
;263:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 264
;264:	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+880
CNSTI4 9
ASGNI4
line 265
;265:	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+880+44
CNSTU4 264
ASGNU4
line 266
;266:	s_ingame.teamorders.generic.x			= 320;
ADDRGP4 s_ingame+880+12
CNSTI4 320
ASGNI4
line 267
;267:	s_ingame.teamorders.generic.y			= y;
ADDRGP4 s_ingame+880+16
ADDRLP4 0
INDIRI4
ASGNI4
line 268
;268:	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
ADDRGP4 s_ingame+880+8
CNSTI4 19
ASGNI4
line 269
;269:	s_ingame.teamorders.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+880+48
ADDRGP4 InGame_Event
ASGNP4
line 270
;270:	s_ingame.teamorders.string				= "TEAM ORDERS";
ADDRGP4 s_ingame+880+60
ADDRGP4 $203
ASGNP4
line 271
;271:	s_ingame.teamorders.color				= color_red;
ADDRGP4 s_ingame+880+68
ADDRGP4 color_red
ASGNP4
line 272
;272:	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+880+64
CNSTI4 17
ASGNI4
line 273
;273:	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) ) {
ADDRGP4 $161
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4120
INDIRF4
CNSTF4 1077936128
GEF4 $208
line 274
;274:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4124
ADDRGP4 s_ingame+880+44
ASGNP4
ADDRLP4 4124
INDIRP4
ADDRLP4 4124
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 275
;275:	}
ADDRGP4 $209
JUMPV
LABELV $208
line 276
;276:	else {
line 277
;277:		trap_GetClientState( &cs );
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 278
;278:		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 4+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 3088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 279
;279:		team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 3088
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 4124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4124
INDIRP4
ARGP4
ADDRLP4 4128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4112
ADDRLP4 4128
INDIRI4
ASGNI4
line 280
;280:		if( team == TEAM_SPECTATOR ) {
ADDRLP4 4112
INDIRI4
CNSTI4 3
NEI4 $214
line 281
;281:			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4132
ADDRGP4 s_ingame+880+44
ASGNP4
ADDRLP4 4132
INDIRP4
ADDRLP4 4132
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 282
;282:		}
LABELV $214
line 283
;283:	}
LABELV $209
line 286
;284:
;285:
;286:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 287
;287:	s_ingame.callvote.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1096
CNSTI4 9
ASGNI4
line 288
;288:	s_ingame.callvote.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1096+44
CNSTU4 264
ASGNU4
line 289
;289:	s_ingame.callvote.generic.x			= 320;
ADDRGP4 s_ingame+1096+12
CNSTI4 320
ASGNI4
line 290
;290:	s_ingame.callvote.generic.y			= y;
ADDRGP4 s_ingame+1096+16
ADDRLP4 0
INDIRI4
ASGNI4
line 291
;291:	s_ingame.callvote.generic.id			= ID_CALLVOTE;
ADDRGP4 s_ingame+1096+8
CNSTI4 20
ASGNI4
line 292
;292:	s_ingame.callvote.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1096+48
ADDRGP4 InGame_Event
ASGNP4
line 293
;293:	s_ingame.callvote.string				= "CALL VOTE";
ADDRGP4 s_ingame+1096+60
ADDRGP4 $231
ASGNP4
line 294
;294:	s_ingame.callvote.color				= color_red;
ADDRGP4 s_ingame+1096+68
ADDRGP4 color_red
ASGNP4
line 295
;295:	s_ingame.callvote.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1096+64
CNSTI4 17
ASGNI4
line 297
;296:
;297:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 298
;298:	s_ingame.pickclass.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1168
CNSTI4 9
ASGNI4
line 299
;299:	s_ingame.pickclass.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1168+44
CNSTU4 264
ASGNU4
line 300
;300:	s_ingame.pickclass.generic.x			= 320;
ADDRGP4 s_ingame+1168+12
CNSTI4 320
ASGNI4
line 301
;301:	s_ingame.pickclass.generic.y			= y;
ADDRGP4 s_ingame+1168+16
ADDRLP4 0
INDIRI4
ASGNI4
line 302
;302:	s_ingame.pickclass.generic.id			= ID_CLASS;
ADDRGP4 s_ingame+1168+8
CNSTI4 21
ASGNI4
line 303
;303:	s_ingame.pickclass.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1168+48
ADDRGP4 InGame_Event
ASGNP4
line 304
;304:	s_ingame.pickclass.string				= "CHOOSE CLASS";
ADDRGP4 s_ingame+1168+60
ADDRGP4 $249
ASGNP4
line 305
;305:	s_ingame.pickclass.color				= color_red;
ADDRGP4 s_ingame+1168+68
ADDRGP4 color_red
ASGNP4
line 306
;306:	s_ingame.pickclass.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1168+64
CNSTI4 17
ASGNI4
line 309
;307:
;308:
;309:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 310
;310:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+448
CNSTI4 9
ASGNI4
line 311
;311:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+448+44
CNSTU4 264
ASGNU4
line 312
;312:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+448+12
CNSTI4 320
ASGNI4
line 313
;313:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+448+16
ADDRLP4 0
INDIRI4
ASGNI4
line 314
;314:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+448+8
CNSTI4 13
ASGNI4
line 315
;315:	s_ingame.setup.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+448+48
ADDRGP4 InGame_Event
ASGNP4
line 316
;316:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+448+60
ADDRGP4 $267
ASGNP4
line 317
;317:	s_ingame.setup.color				= color_red;
ADDRGP4 s_ingame+448+68
ADDRGP4 color_red
ASGNP4
line 318
;318:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+448+64
CNSTI4 17
ASGNI4
line 320
;319:
;320:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 321
;321:	s_ingame.server.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+520
CNSTI4 9
ASGNI4
line 322
;322:	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+520+44
CNSTU4 264
ASGNU4
line 323
;323:	s_ingame.server.generic.x			= 320;
ADDRGP4 s_ingame+520+12
CNSTI4 320
ASGNI4
line 324
;324:	s_ingame.server.generic.y			= y;
ADDRGP4 s_ingame+520+16
ADDRLP4 0
INDIRI4
ASGNI4
line 325
;325:	s_ingame.server.generic.id			= ID_SERVERINFO;
ADDRGP4 s_ingame+520+8
CNSTI4 14
ASGNI4
line 326
;326:	s_ingame.server.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+520+48
ADDRGP4 InGame_Event
ASGNP4
line 327
;327:	s_ingame.server.string				= "SERVER INFO";
ADDRGP4 s_ingame+520+60
ADDRGP4 $285
ASGNP4
line 328
;328:	s_ingame.server.color				= color_red;
ADDRGP4 s_ingame+520+68
ADDRGP4 color_red
ASGNP4
line 329
;329:	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+520+64
CNSTI4 17
ASGNI4
line 331
;330:
;331:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $139
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 0
NEF4 $290
line 332
;332:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 333
;333:	s_ingame.restart.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+664
CNSTI4 9
ASGNI4
line 334
;334:	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+664+44
CNSTU4 264
ASGNU4
line 335
;335:	s_ingame.restart.generic.x			= 320;
ADDRGP4 s_ingame+664+12
CNSTI4 320
ASGNI4
line 336
;336:	s_ingame.restart.generic.y			= y;
ADDRGP4 s_ingame+664+16
ADDRLP4 0
INDIRI4
ASGNI4
line 337
;337:	s_ingame.restart.generic.id			= ID_RESTART;
ADDRGP4 s_ingame+664+8
CNSTI4 16
ASGNI4
line 338
;338:	s_ingame.restart.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+664+48
ADDRGP4 InGame_Event
ASGNP4
line 339
;339:	s_ingame.restart.string				= "RESTART MAP"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+664+60
ADDRGP4 $305
ASGNP4
line 340
;340:	s_ingame.restart.color				= color_red;
ADDRGP4 s_ingame+664+68
ADDRGP4 color_red
ASGNP4
line 341
;341:	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+664+64
CNSTI4 17
ASGNI4
line 342
;342:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $139
ARGP4
ADDRLP4 4128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4128
INDIRF4
CNSTF4 0
NEF4 $310
line 343
;343:		s_ingame.restart.generic.flags |= QMF_GRAYED;
ADDRLP4 4132
ADDRGP4 s_ingame+664+44
ASGNP4
ADDRLP4 4132
INDIRP4
ADDRLP4 4132
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 344
;344:		}
LABELV $310
line 345
;345:	}
LABELV $290
line 346
;346:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 347
;347:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1024
CNSTI4 9
ASGNI4
line 348
;348:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1024+44
CNSTU4 264
ASGNU4
line 349
;349:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+1024+12
CNSTI4 320
ASGNI4
line 350
;350:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+1024+16
ADDRLP4 0
INDIRI4
ASGNI4
line 351
;351:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+1024+8
CNSTI4 18
ASGNI4
line 352
;352:	s_ingame.resume.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1024+48
ADDRGP4 InGame_Event
ASGNP4
line 353
;353:	s_ingame.resume.string					= "RESUME GAME";
ADDRGP4 s_ingame+1024+60
ADDRGP4 $327
ASGNP4
line 354
;354:	s_ingame.resume.color					= color_red;
ADDRGP4 s_ingame+1024+68
ADDRGP4 color_red
ASGNP4
line 355
;355:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1024+64
CNSTI4 17
ASGNI4
line 357
;356:
;357:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 358
;358:	s_ingame.leave.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+592
CNSTI4 9
ASGNI4
line 359
;359:	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+592+44
CNSTU4 264
ASGNU4
line 360
;360:	s_ingame.leave.generic.x			= 320;
ADDRGP4 s_ingame+592+12
CNSTI4 320
ASGNI4
line 361
;361:	s_ingame.leave.generic.y			= y;
ADDRGP4 s_ingame+592+16
ADDRLP4 0
INDIRI4
ASGNI4
line 362
;362:	s_ingame.leave.generic.id			= ID_LEAVEARENA;
ADDRGP4 s_ingame+592+8
CNSTI4 15
ASGNI4
line 363
;363:	s_ingame.leave.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+592+48
ADDRGP4 InGame_Event
ASGNP4
line 364
;364:	s_ingame.leave.string				= "MAIN MENU"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+592+60
ADDRGP4 $345
ASGNP4
line 365
;365:	s_ingame.leave.color				= color_red;
ADDRGP4 s_ingame+592+68
ADDRGP4 color_red
ASGNP4
line 366
;366:	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+592+64
CNSTI4 17
ASGNI4
line 368
;367:
;368:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 369
;369:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+952
CNSTI4 9
ASGNI4
line 370
;370:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+952+44
CNSTU4 264
ASGNU4
line 371
;371:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+952+12
CNSTI4 320
ASGNI4
line 372
;372:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 373
;373:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+952+8
CNSTI4 17
ASGNI4
line 374
;374:	s_ingame.quit.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+952+48
ADDRGP4 InGame_Event
ASGNP4
line 375
;375:	s_ingame.quit.string				= "EXIT TREPIDATION"; // Shafe - Trep - Minor Text Change
ADDRGP4 s_ingame+952+60
ADDRGP4 $363
ASGNP4
line 376
;376:	s_ingame.quit.color					= color_red;
ADDRGP4 s_ingame+952+68
ADDRGP4 color_red
ASGNP4
line 377
;377:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+952+64
CNSTI4 17
ASGNI4
line 379
;378:
;379:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 380
;380:	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 382
;381:
;382:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $139
ARGP4
ADDRLP4 4128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4128
INDIRF4
CNSTF4 0
NEF4 $370
line 383
;383:		Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 384
;384:		Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 385
;385:	}
LABELV $370
line 387
;386:	
;387:	Menu_AddItem( &s_ingame.menu, &s_ingame.callvote );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 388
;388:	Menu_AddItem( &s_ingame.menu, &s_ingame.pickclass );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1168
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 389
;389:	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 390
;390:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 391
;391:	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 393
;392:
;393:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $139
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4132
INDIRF4
CNSTF4 0
NEF4 $379
line 394
;394:		Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 395
;395:	}
LABELV $379
line 396
;396:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 397
;397:	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 398
;398:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 399
;399:}
LABELV $102
endproc InGame_MenuInit 4148 12
export InGame_Cache
proc InGame_Cache 0 4
line 407
;400:
;401:
;402:/*
;403:=================
;404:InGame_Cache
;405:=================
;406:*/
;407:void InGame_Cache( void ) {
line 408
;408:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $110
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 409
;409:}
LABELV $385
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 417
;410:
;411:
;412:/*
;413:=================
;414:UI_InGameMenu
;415:=================
;416:*/
;417:void UI_InGameMenu( void ) {
line 419
;418:	// force as top level menu
;419:	uis.menusp = 0;  
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 422
;420:
;421:	// set menu cursor to a nice location
;422:	uis.cursorx = 275;
ADDRGP4 uis+8
CNSTI4 275
ASGNI4
line 423
;423:	uis.cursory = 80;
ADDRGP4 uis+12
CNSTI4 80
ASGNI4
line 425
;424:
;425:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 426
;426:	UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 427
;427:}
LABELV $386
endproc UI_InGameMenu 0 4
proc DynamicMenu_SubMenuInit 8 0
line 448
;428:
;429:
;430:
;431:
;432:// Shafe - Trep --- Menu System
;433:// EVERYTHING BELOW IS ADDED BY SHAFE.. INGAME DYNAMIC MENUS  /////////////////////////////////////
;434:// Heh.. Cut and Paste didnt preserve whitespace... bleh.. 
;435:// Fix that later
;436:
;437://
;438:
;439:
;440:
;441:
;442:/*
;443:=================
;444:DynamicMenu_InitSubMenu
;445:=================
;446:*/
;447:static qboolean DynamicMenu_SubMenuInit( void)
;448:{
line 451
;449:int pos;
;450:
;451:if (s_dynamic.depth == MAX_DYNAMICDEPTH)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 6
NEI4 $391
line 452
;452:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $390
JUMPV
LABELV $391
line 454
;453:
;454:if (s_dynamic.depth == 0)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 0
NEI4 $394
line 455
;455:pos = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
line 457
;456:else
;457:pos = s_dynamic.end[s_dynamic.depth - 1];
ADDRLP4 0
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
INDIRI4
ASGNI4
LABELV $395
line 459
;458:
;459:if (pos == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $400
line 460
;460:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $390
JUMPV
LABELV $400
line 462
;461:
;462:s_dynamic.depth++;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 463
;463:s_dynamic.active[s_dynamic.depth - 1] = -1;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
CNSTI4 -1
ASGNI4
line 464
;464:s_dynamic.start[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 465
;465:s_dynamic.end[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 467
;466:
;467:return qtrue;
CNSTI4 1
RETI4
LABELV $390
endproc DynamicMenu_SubMenuInit 8 0
proc DynamicMenu_AddItem 24 12
line 478
;468:}
;469:
;470:
;471:/*
;472:=================
;473:DynamicMenu_AddItem
;474:=================
;475:*/
;476:static qboolean DynamicMenu_AddItem( const char* string, 
;477:int id, createHandler crh, eventHandler evh)
;478:{
line 481
;479:int index, depth;
;480:
;481:depth = s_dynamic.depth - 1;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 482
;482:index = s_dynamic.end[depth];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
ASGNI4
line 484
;483:
;484:if (index == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $415
line 485
;485:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $415
line 488
;486:
;487:// can't have submenu and event attached to menu item
;488:if (crh && evh)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $417
ADDRFP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $417
line 489
;489:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $417
line 491
;490:
;491:if (!string || !string[0])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $419
LABELV $421
line 492
;492:string = "[no text]";
ADDRFP4 0
ADDRGP4 $422
ASGNP4
LABELV $419
line 494
;493:
;494:s_dynamic.data[index].index = index;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 495
;495:s_dynamic.data[index].id = id;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 496
;496:s_dynamic.data[index].createSubMenu = crh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 497
;497:s_dynamic.data[index].runEvent = evh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 498
;498:Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 500
;499:
;500:s_dynamic.end[depth]++;
ADDRLP4 20
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 502
;501:
;502:return qtrue;
CNSTI4 1
RETI4
LABELV $412
endproc DynamicMenu_AddItem 24 12
proc DynamicMenu_FinishSubMenuInit 68 4
line 512
;503:}
;504:
;505:
;506:/*
;507:=================
;508:DynamicMenu_FinishInitSubMenu
;509:=================
;510:*/
;511:static void DynamicMenu_FinishSubMenuInit( void )
;512:{
line 523
;513:	int depth;
;514:	int width, maxwidth;
;515:	int height, lineheight;
;516:	int posx, posy;
;517:	int i, count, start, active;
;518:	float scale;
;519:	menutext_s*	ptr;
;520:	qboolean	submenu;
;521:
;522:
;523:depth = s_dynamic.depth - 1;
ADDRLP4 40
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 526
;524:
;525:// find the widest item
;526:submenu = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 527
;527:maxwidth = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 528
;528:start = s_dynamic.start[depth];
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944
ADDP4
INDIRI4
ASGNI4
line 529
;529:count = s_dynamic.end[depth] - start;
ADDRLP4 32
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 530
;530:for ( i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $437
line 531
;531:{
line 532
;532:width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 533
;533:if (width > maxwidth)
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $442
line 534
;534:maxwidth = width;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $442
line 536
;535:
;536:if (s_dynamic.data[i + start].createSubMenu)
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $444
line 537
;537:submenu = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $444
line 538
;538:}
LABELV $438
line 530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $440
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $437
line 540
;539:
;540:scale = UI_ProportionalSizeScale(UI_SMALLFONT);
CNSTI4 16
ARGI4
ADDRLP4 56
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 56
INDIRF4
ASGNF4
line 541
;541:if (submenu)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $448
line 542
;542:{
line 544
;543:// space and submenu pointer
;544:maxwidth += UI_ProportionalStringWidth(" \r");
ADDRGP4 $450
ARGP4
ADDRLP4 60
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ASGNI4
line 545
;545:}
LABELV $448
line 547
;546:
;547:maxwidth *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 550
;548:
;549:// determine the position of the menu
;550:lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
ADDRLP4 8
CNSTF4 1104674816
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 551
;551:height = count * lineheight;
ADDRLP4 48
ADDRLP4 32
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
line 553
;552:
;553:if (depth == 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $451
line 554
;554:{
line 555
;555:posy = 240 - height/2;
ADDRLP4 16
CNSTI4 240
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 556
;556:posx = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 557
;557:}
ADDRGP4 $452
JUMPV
LABELV $451
line 559
;558:else
;559:{
line 560
;560:active = s_dynamic.active[depth - 1];
ADDRLP4 52
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
INDIRI4
ASGNI4
line 561
;561:posx = s_dynamic.item[active].generic.right;
ADDRLP4 20
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+28
ADDP4
INDIRI4
ASGNI4
line 562
;562:posy = s_dynamic.item[active].generic.top;
ADDRLP4 16
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+24
ADDP4
INDIRI4
ASGNI4
line 564
;563:
;564:if (posy + height > 480 - 64)
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 416
LEI4 $459
line 565
;565:posy = 480 - 64 - height;
ADDRLP4 16
CNSTI4 416
ADDRLP4 48
INDIRI4
SUBI4
ASGNI4
LABELV $459
line 566
;566:}
LABELV $452
line 568
;567:
;568:for (i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $464
JUMPV
LABELV $461
line 569
;569:{
line 570
;570:ptr = &s_dynamic.item[start + i];
ADDRLP4 4
CNSTI4 72
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+288
ADDP4
ASGNP4
line 572
;571:
;572:ptr->generic.x = posx + MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 573
;573:ptr->generic.y = posy + i*lineheight + MENUSPACE_Y;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
CNSTI4 1
ADDI4
ASGNI4
line 575
;574:
;575:ptr->generic.left = posx;
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 576
;576:ptr->generic.right = posx + maxwidth + 2*MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 8
ADDI4
ASGNI4
line 577
;577:ptr->generic.top = posy + i*lineheight;
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 578
;578:ptr->generic.bottom = posy + (i+1)*lineheight - 1;
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ADDRLP4 60
INDIRI4
SUBI4
ASGNI4
line 580
;579:
;580:ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 581
;581:}
LABELV $462
line 568
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $464
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $461
line 582
;582:}
LABELV $433
endproc DynamicMenu_FinishSubMenuInit 68 4
proc DynamicMenu_OnActiveList 8 0
line 591
;583:
;584: 
;585:/*
;586:=================
;587:DynamicMenu_OnActiveList
;588:=================
;589:*/
;590:static qboolean DynamicMenu_OnActiveList( int index )
;591:{
line 595
;592:int depth;
;593:int i;
;594:
;595:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 597
;596:
;597:for ( i = 0; i < depth ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $468
line 598
;598:if (s_dynamic.active[i] == index)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $472
line 599
;599:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $466
JUMPV
LABELV $472
LABELV $469
line 597
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $471
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $468
line 601
;600:
;601:return qfalse;
CNSTI4 0
RETI4
LABELV $466
endproc DynamicMenu_OnActiveList 8 0
proc DynamicMenu_MenuItemDraw 56 20
line 613
;602:}
;603:
;604:
;605:
;606:
;607:/*
;608:=================
;609:DynamicMenu_MenuItemDraw
;610:=================
;611:*/
;612:static void DynamicMenu_MenuItemDraw( void* self )
;613:{
line 623
;614:int	x;
;615:int	y;
;616:
;617:int	w,h;
;618:float *color;
;619:int	style;
;620:menutext_s*	t;
;621:vec4_t	back_color;
;622:
;623:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 627
;624:
;625:
;626:// draw the background;
;627:x = t->generic.left;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 628
;628:y = t->generic.top;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 629
;629:w = t->generic.right - x;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 630
;630:h = t->generic.bottom - y;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 632
;631:
;632:back_color[0] = 1.0;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 633
;633:back_color[1] = 1.0;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 634
;634:back_color[2] = 1.0;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 635
;635:if (DynamicMenu_OnActiveList(t->generic.id))
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 DynamicMenu_OnActiveList
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $478
line 636
;636:{
line 637
;637:		back_color[3] = 0.33;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 638
;638:	}
ADDRGP4 $479
JUMPV
LABELV $478
line 640
;639:	else
;640:	{
line 641
;641:		back_color[3] = 0.1;
ADDRLP4 12+12
CNSTF4 1036831949
ASGNF4
line 642
;642:	}
LABELV $479
line 644
;643:
;644:UI_FillRect(x, y, w, h, back_color);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 647
;645:
;646:// draw the text
;647:x = t->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 648
;648:y = t->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 650
;649:
;650:if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $482
line 651
;651:color = text_color_disabled;
ADDRLP4 36
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $483
JUMPV
LABELV $482
line 653
;652:else
;653:color = t->color;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $483
line 655
;654:
;655:style = t->style;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 656
;656:if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $484
line 657
;657:if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRP4
CVPU4 4
NEU4 $486
line 658
;658:style |= UI_PULSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 659
;659:}
ADDRGP4 $487
JUMPV
LABELV $486
line 660
;660:else {
line 661
;661:style |= UI_INVERSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 662
;662:}
LABELV $487
line 663
;663:}
LABELV $484
line 665
;664:
;665:UI_DrawProportionalString( x, y, t->string, style, color );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 668
;666:
;667:// draw the cursor for submenu if needed
;668:x = t->generic.left + w;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 669
;669:if (s_dynamic.data[ t->generic.id ].createSubMenu)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $488
line 670
;670:{
line 671
;671:UI_DrawChar( x, y, 13, style|UI_RIGHT, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 672
;672:}
LABELV $488
line 673
;673:}
LABELV $475
endproc DynamicMenu_MenuItemDraw 56 20
proc DynamicMenu_MenuDraw 0 4
line 684
;674:
;675:
;676:
;677:
;678:/*
;679:=================
;680:DynamicMenu_MenuDraw
;681:=================
;682:*/
;683:static void DynamicMenu_MenuDraw( void )
;684:{
line 691
;685://UI_DrawString(0, 0, va("depth:%i", s_dynamic.depth), 
;686://UI_SMALLFONT, color_white);
;687://UI_DrawString(0, 32, va("active: %i %i %i", 
;688://s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ),
;689://UI_SMALLFONT, color_white);
;690:
;691:Menu_Draw(&s_dynamic.menu);
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 692
;692:}
LABELV $492
endproc DynamicMenu_MenuDraw 0 4
proc DynamicMenu_IndexDepth 12 0
line 702
;693:
;694:
;695:
;696:/*
;697:=================
;698:DynamicMenu_IndexDepth
;699:=================
;700:*/
;701:static int DynamicMenu_IndexDepth( int pos )
;702:{
line 706
;703:int i;
;704:int maxdepth, depth;
;705:
;706:maxdepth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 707
;707:depth = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 708
;708:for (i = 0; i < maxdepth; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 709
;709:{
line 710
;710:if (pos < s_dynamic.end[i])
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
GEI4 $499
line 711
;711:{
line 712
;712:depth = i + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 713
;713:break;
ADDRGP4 $497
JUMPV
LABELV $499
line 715
;714:}
;715:}
LABELV $496
line 708
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $498
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $495
LABELV $497
line 717
;716:
;717:return depth;
ADDRLP4 8
INDIRI4
RETI4
LABELV $493
endproc DynamicMenu_IndexDepth 12 0
proc DynamicMenu_SetFocus 24 8
line 728
;718:}
;719:
;720:
;721:
;722:/*
;723:=================
;724:DynamicMenu_SetFocus
;725:=================
;726:*/
;727:static void DynamicMenu_SetFocus( int pos )
;728:{
line 732
;729:int i;
;730:int depth, newdepth;
;731:
;732:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 733
;733:newdepth = DynamicMenu_IndexDepth(pos);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 DynamicMenu_IndexDepth
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 735
;734:
;735:if (newdepth == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $504
line 736
;736:{
line 737
;737:Com_Printf("SetFocus: index %i outside menu\n", pos);
ADDRGP4 $506
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 738
;738:return;
ADDRGP4 $502
JUMPV
LABELV $504
line 741
;739:}
;740:
;741:s_dynamic.active[ newdepth - 1 ] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 742
;742:s_dynamic.depth = newdepth;
ADDRGP4 s_dynamic+7020
ADDRLP4 8
INDIRI4
ASGNI4
line 745
;743:
;744:// hide any previous submenus
;745:if (newdepth < depth)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $510
line 746
;746:{
line 747
;747:for (i = s_dynamic.start[ newdepth ]; 
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $512
line 749
;748:i < s_dynamic.end[depth - 1]; i++)
;749:{
line 750
;750:s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 16
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 751
;751:s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 20
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 752
;752:}
LABELV $513
line 748
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $515
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
INDIRI4
LTI4 $512
line 753
;753:}
LABELV $510
line 755
;754:
;755:s_dynamic.active[newdepth - 1] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 758
;756:
;757:// show this sub-menu (if needed)
;758:if (s_dynamic.data[pos].createSubMenu)
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $525
line 759
;759:s_dynamic.data[pos].createSubMenu();
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
INDIRP4
CALLV
pop
LABELV $525
line 760
;760:}
LABELV $502
endproc DynamicMenu_SetFocus 24 8
proc DynamicMenu_ClearFocus 0 0
line 769
;761:
;762:
;763:/*
;764:=================
;765:DynamicMenu_ClearFocus
;766:=================
;767:*/
;768:static void DynamicMenu_ClearFocus( int pos )
;769:{
line 770
;770:}
LABELV $531
endproc DynamicMenu_ClearFocus 0 0
proc DynamicMenu_ActivateControl 12 8
line 780
;771:
;772:
;773:
;774:/*
;775:=================
;776:DynamicMenu_ActivateControl
;777:=================
;778:*/
;779:static void DynamicMenu_ActivateControl( int pos )
;780:{
line 784
;781://int i;
;782:int depth;
;783:
;784:depth = DynamicMenu_IndexDepth(pos);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 DynamicMenu_IndexDepth
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 786
;785:
;786:if (depth == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $533
line 787
;787:{
line 788
;788:Com_Printf("ActivateControl: index %i outside menu\n", pos);
ADDRGP4 $535
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 789
;789:return;
ADDRGP4 $532
JUMPV
LABELV $533
line 793
;790:}
;791:
;792:// not at the deepest level, can't be a command
;793:if (depth < s_dynamic.depth)
ADDRLP4 0
INDIRI4
ADDRGP4 s_dynamic+7020
INDIRI4
GEI4 $536
line 794
;794:return;
ADDRGP4 $532
JUMPV
LABELV $536
line 796
;795:
;796:if (s_dynamic.data[pos].runEvent)
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
line 797
;797:s_dynamic.data[pos].runEvent(pos);
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $540
JUMPV
LABELV $539
line 799
;798:else
;799:Com_Printf("ActivateControl: index %i has no event\n", pos);
ADDRGP4 $545
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $540
line 800
;800:}
LABELV $532
endproc DynamicMenu_ActivateControl 12 8
proc DynamicMenu_MenuEvent 8 4
line 811
;801:
;802:
;803:
;804:
;805:/*
;806:=================
;807:DynamicMenu_MenuEvent
;808:=================
;809:*/
;810:static void DynamicMenu_MenuEvent( void* self, int event )
;811:{
line 814
;812:menutext_s* t;
;813:
;814:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 816
;815:
;816:switch (event)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $549
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $550
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $551
ADDRGP4 $547
JUMPV
line 817
;817:{
LABELV $549
line 819
;818:case QM_GOTFOCUS:
;819:DynamicMenu_SetFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_SetFocus
CALLV
pop
line 820
;820:break;
ADDRGP4 $548
JUMPV
LABELV $550
line 822
;821:case QM_LOSTFOCUS:
;822:DynamicMenu_ClearFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ClearFocus
CALLV
pop
line 823
;823:break;
ADDRGP4 $548
JUMPV
LABELV $551
line 825
;824:case QM_ACTIVATED:
;825:DynamicMenu_ActivateControl(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ActivateControl
CALLV
pop
line 826
;826:break;
LABELV $547
LABELV $548
line 828
;827:}
;828:}
LABELV $546
endproc DynamicMenu_MenuEvent 8 4
proc DM_BuildItem 0 8
line 836
;829:
;830:
;831:/*
;832:=================
;833:Build
;834:=================
;835:*/
;836:static void DM_BuildItem( int xitem ) {
line 837
;837:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 840
;838:	
;839:	// Basic Turret
;840:	if (xitem == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $553
line 841
;841:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret\n" );
CNSTI4 2
ARGI4
ADDRGP4 $555
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 842
;842:	}
LABELV $553
line 845
;843:
;844:	// Shielded Turret
;845:	if (xitem == 1) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $556
line 846
;846:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret2\n" );
CNSTI4 2
ARGI4
ADDRGP4 $558
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 847
;847:	}
LABELV $556
line 850
;848:
;849:	// Cloaked Turret
;850:	if (xitem == 2) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $559
line 851
;851:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $561
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 852
;852:	}
LABELV $559
line 855
;853:
;854:	// Generator
;855:	if (xitem == 3) {
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $562
line 856
;856:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawngen\n" );
CNSTI4 2
ARGI4
ADDRGP4 $564
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 857
;857:	}
LABELV $562
line 860
;858:
;859:	// Master Controller
;860:	if (xitem == 4) {
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $565
line 861
;861:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnmc\n" );
CNSTI4 2
ARGI4
ADDRGP4 $567
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 862
;862:	}
LABELV $565
line 864
;863:
;864:}
LABELV $552
endproc DM_BuildItem 0 8
proc DynamicMenu_Close 0 0
line 873
;865:
;866:
;867:/*
;868:=================
;869:DynamicMenu_Close
;870:=================
;871:*/
;872:static void DynamicMenu_Close( void )
;873:{
line 874
;874:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 875
;875:}
LABELV $568
endproc DynamicMenu_Close 0 0
proc DM_Close_Event 0 0
line 885
;876: 
;877:
;878:
;879:/*
;880:=================
;881:DM_Close_Event
;882:=================
;883:*/
;884:static void DM_Close_Event( int index )
;885:{
line 886
;886:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 887
;887:}
LABELV $569
endproc DM_Close_Event 0 0
proc DynamicMenu_VoteMenu 0 16
line 899
;888:
;889:
;890:// Shafe - Trep - Here is where the first Dynamic Menu Starts
;891:
;892:/*
;893:=================
;894:// My first Test menu
;895:DynamicMenu_VoteMenu
;896:=================
;897:*/
;898:static void DynamicMenu_VoteMenu( void )
;899:{
line 900
;900:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 903
;901:	// The Menu Items
;902:
;903:	DynamicMenu_AddItem("Kick", 0 , NULL, DM_Close_Event);
ADDRGP4 $571
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 904
;904:	DynamicMenu_AddItem("Next Map", 0 , NULL, DM_Close_Event);
ADDRGP4 $572
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 905
;905:	DynamicMenu_AddItem("Restart Map", 0 , NULL, DM_Close_Event);
ADDRGP4 $573
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 906
;906:	DynamicMenu_AddItem("Balance Teams", 0 , NULL, DM_Close_Event);
ADDRGP4 $574
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 907
;907:	DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
ADDRGP4 $575
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 908
;908:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 909
;909:}
LABELV $570
endproc DynamicMenu_VoteMenu 0 16
proc DynamicMenu_InitPrimaryMenu 0 16
line 921
;910:
;911:
;912:
;913:
;914:// Shafe - Trep - Top Level Menu Last
;915:/*
;916:=================
;917:DynamicMenu_InitPrimaryMenu
;918:=================
;919:*/
;920:static void DynamicMenu_InitPrimaryMenu( void )
;921:{
line 922
;922:DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 924
;923:
;924:DynamicMenu_AddItem("Call Vote", 0, DynamicMenu_VoteMenu, NULL);
ADDRGP4 $577
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DynamicMenu_VoteMenu
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 925
;925:DynamicMenu_AddItem("Buy Equipment", 0 , NULL, DM_Close_Event);
ADDRGP4 $578
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 926
;926:DynamicMenu_AddItem("Crap!", 0, NULL, DM_Close_Event);
ADDRGP4 $579
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 927
;927:DynamicMenu_AddItem("Shit And Stuff!", 0, NULL, DM_Close_Event);
ADDRGP4 $580
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 928
;928:DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
ADDRGP4 $575
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 930
;929:
;930:DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 931
;931:}
LABELV $576
endproc DynamicMenu_InitPrimaryMenu 0 16
proc DynamicMenu_BuildMenu 0 16
line 936
;932:
;933:
;934:
;935:static void DynamicMenu_BuildMenu( void )
;936:{
line 937
;937:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 941
;938:
;939:	
;940:
;941:	DynamicMenu_AddItem("Turret", 0, NULL, DM_BuildItem);
ADDRGP4 $582
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BuildItem
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 942
;942:	DynamicMenu_AddItem("Sheilded Turret", 0 , NULL, DM_BuildItem);
ADDRGP4 $583
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BuildItem
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 943
;943:	DynamicMenu_AddItem("Cloaked Turret", 0, NULL, DM_BuildItem);
ADDRGP4 $584
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BuildItem
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 946
;944://	if( !(trap_Cvar_VariableValue( "g_GameMode" ) == 3) ) 
;945://	{
;946:		DynamicMenu_AddItem("Generator", 0, NULL, DM_BuildItem);
ADDRGP4 $585
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BuildItem
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 947
;947:		DynamicMenu_AddItem("MC Reactor", 0, NULL, DM_BuildItem);
ADDRGP4 $586
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_BuildItem
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 949
;948://	}
;949:	DynamicMenu_AddItem("Close", 0, NULL, DM_Close_Event);
ADDRGP4 $587
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 951
;950:
;951:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 952
;952:}
LABELV $581
endproc DynamicMenu_BuildMenu 0 16
proc DynamicMenu_MenuInit 12 8
line 961
;953:
;954:
;955:/*
;956:=================
;957:DynamicMenu_MenuInit
;958:=================
;959:*/
;960:static void DynamicMenu_MenuInit( void )
;961:{
line 964
;962:int i;
;963:
;964:s_dynamic.menu.draw = DynamicMenu_MenuDraw;
ADDRGP4 s_dynamic+268
ADDRGP4 DynamicMenu_MenuDraw
ASGNP4
line 965
;965:s_dynamic.menu.fullscreen = qfalse;
ADDRGP4 s_dynamic+280
CNSTI4 0
ASGNI4
line 966
;966:s_dynamic.menu.wrapAround = qfalse;
ADDRGP4 s_dynamic+276
CNSTI4 0
ASGNI4
line 968
;967:
;968:for (i = 0; i < MAX_MENUITEMS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $592
line 969
;969:{
line 970
;970:s_dynamic.item[i].generic.type = MTYPE_PTEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288
ADDP4
CNSTI4 9
ASGNI4
line 971
;971:s_dynamic.item[i].generic.flags = QMF_INACTIVE
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+44
ADDP4
CNSTU4 53504
ASGNU4
line 973
;972:|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
;973:s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+56
ADDP4
ADDRGP4 DynamicMenu_MenuItemDraw
ASGNP4
line 974
;974:s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+48
ADDP4
ADDRGP4 DynamicMenu_MenuEvent
ASGNP4
line 975
;975:s_dynamic.item[i].generic.id = i;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 976
;976:s_dynamic.item[i].string = s_dynamic.data[i].text;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896
ADDP4
ASGNP4
line 977
;977:s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+64
ADDP4
CNSTI4 2064
ASGNI4
line 978
;978:s_dynamic.item[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 980
;979:
;980:Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
ADDRGP4 s_dynamic
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 981
;981:}
LABELV $593
line 968
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $592
line 984
;982:
;983:// start up the menu system
;984:s_dynamic.depth = 0;
ADDRGP4 s_dynamic+7020
CNSTI4 0
ASGNI4
line 990
;985:
;986://Uncomment the next line if adding part II as well
;987://DynamicMenu_InitMapItems();
;988:
;989://DynamicMenu_InitPrimaryMenu();
;990:DynamicMenu_BuildMenu();
ADDRGP4 DynamicMenu_BuildMenu
CALLV
pop
line 991
;991:}
LABELV $588
endproc DynamicMenu_MenuInit 12 8
export UI_DynamicMenuCache
proc UI_DynamicMenuCache 0 0
line 1004
;992:
;993:
;994:
;995:
;996:
;997:
;998:/*
;999:=================
;1000:UI_DynamicMenuCache
;1001:=================
;1002:*/
;1003:void UI_DynamicMenuCache( void )
;1004:{
line 1005
;1005:}
LABELV $614
endproc UI_DynamicMenuCache 0 0
export UI_DynamicMenu
proc UI_DynamicMenu 4124 12
line 1016
;1006:
;1007:
;1008:
;1009:
;1010:/*
;1011:=================
;1012:UI_DynamicMenu
;1013:=================
;1014:*/
;1015:void UI_DynamicMenu( void )
;1016:{
line 1021
;1017:	uiClientState_t	cs;
;1018:	char			info[MAX_INFO_STRING];
;1019:	int				playerTeam;
;1020:
;1021:trap_GetClientState( &cs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 1022
;1022:trap_GetConfigString( CS_PLAYERS 
ADDRLP4 0+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 3084
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1024
;1023:+ cs.clientNum, info, MAX_INFO_STRING );
;1024:playerTeam = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 3084
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRLP4 4116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4116
INDIRI4
ASGNI4
line 1031
;1025:
;1026://Uncomment the next two code lines if adding part II 
;1027://as well, or specs can't use the menu either
;1028://if (playerTeam == TEAM_SPECTATOR)
;1029://return;
;1030:
;1031:memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));
ADDRGP4 s_dynamic
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1033
;1032:
;1033:s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $161
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_dynamic+7016
ADDRLP4 4120
INDIRF4
CVFI4 4
ASGNI4
line 1040
;1034:
;1035://Uncomment the next three lines if adding part II as well
;1036://if (s_dynamic.gametype != GT_TEAM && 
;1037://s_dynamic.gametype != GT_CTF)
;1038://return;
;1039:
;1040:UI_DynamicMenuCache();
ADDRGP4 UI_DynamicMenuCache
CALLV
pop
line 1043
;1041:
;1042:// force as top level menu
;1043:uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1046
;1044:
;1045:// set menu cursor to a nice location
;1046:uis.cursorx = 50;
ADDRGP4 uis+8
CNSTI4 50
ASGNI4
line 1047
;1047:uis.cursory = 240;
ADDRGP4 uis+12
CNSTI4 240
ASGNI4
line 1049
;1048:
;1049:DynamicMenu_MenuInit();
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 1051
;1050:
;1051:UI_PushMenu( &s_dynamic.menu );
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1052
;1052:}
LABELV $615
endproc UI_DynamicMenu 4124 12
export UI_DynamicCommandMenu_f
proc UI_DynamicCommandMenu_f 0 0
line 1062
;1053:
;1054:
;1055:
;1056:/*
;1057:=================
;1058:UI_DynamicCommandMenu_f
;1059:=================
;1060:*/
;1061:void UI_DynamicCommandMenu_f( void )
;1062:{
line 1063
;1063:UI_DynamicMenu();
ADDRGP4 UI_DynamicMenu
CALLV
pop
line 1064
;1064:}
LABELV $621
endproc UI_DynamicCommandMenu_f 0 0
bss
align 4
LABELV s_dynamic
skip 7024
align 4
LABELV s_ingame
skip 1240
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserMasterNum
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
import Com_Printf
import Com_Error
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
LABELV $587
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $586
byte 1 77
byte 1 67
byte 1 32
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $585
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $584
byte 1 67
byte 1 108
byte 1 111
byte 1 97
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $583
byte 1 83
byte 1 104
byte 1 101
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $582
byte 1 84
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $580
byte 1 83
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 65
byte 1 110
byte 1 100
byte 1 32
byte 1 83
byte 1 116
byte 1 117
byte 1 102
byte 1 102
byte 1 33
byte 1 0
align 1
LABELV $579
byte 1 67
byte 1 114
byte 1 97
byte 1 112
byte 1 33
byte 1 0
align 1
LABELV $578
byte 1 66
byte 1 117
byte 1 121
byte 1 32
byte 1 69
byte 1 113
byte 1 117
byte 1 105
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $577
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $575
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $574
byte 1 66
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $573
byte 1 82
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $572
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $571
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $567
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 109
byte 1 99
byte 1 10
byte 1 0
align 1
LABELV $564
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 103
byte 1 101
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $561
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $558
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $555
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $545
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $535
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $506
byte 1 83
byte 1 101
byte 1 116
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $450
byte 1 32
byte 1 13
byte 1 0
align 1
LABELV $422
byte 1 91
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 93
byte 1 0
align 1
LABELV $363
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 84
byte 1 82
byte 1 69
byte 1 80
byte 1 73
byte 1 68
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $345
byte 1 77
byte 1 65
byte 1 73
byte 1 78
byte 1 32
byte 1 77
byte 1 69
byte 1 78
byte 1 85
byte 1 0
align 1
LABELV $327
byte 1 82
byte 1 69
byte 1 83
byte 1 85
byte 1 77
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $305
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 0
align 1
LABELV $285
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $267
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $249
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 67
byte 1 76
byte 1 65
byte 1 83
byte 1 83
byte 1 0
align 1
LABELV $231
byte 1 67
byte 1 65
byte 1 76
byte 1 76
byte 1 32
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $213
byte 1 116
byte 1 0
align 1
LABELV $203
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $179
byte 1 82
byte 1 69
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $161
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
LABELV $160
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
LABELV $153
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $139
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
LABELV $132
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $110
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $90
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 63
byte 1 0
align 1
LABELV $88
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
byte 1 10
byte 1 0
align 1
LABELV $75
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
