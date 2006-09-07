code
proc InGame_RestartAction 0 8
file "../ui_ingame.c"
line 109
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
;98:	int gamemode;
;99:} dynamicmenu_t;
;100:
;101:static dynamicmenu_t s_dynamic;
;102:
;103:
;104:/*
;105:=================
;106:InGame_RestartAction
;107:=================
;108:*/
;109:static void InGame_RestartAction( qboolean result ) {
line 110
;110:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $73
line 111
;111:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 114
;112:	}
;113:
;114:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 115
;115:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 116
;116:}
LABELV $72
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 0
line 124
;117:
;118:
;119:/*
;120:=================
;121:InGame_QuitAction
;122:=================
;123:*/
;124:static void InGame_QuitAction( qboolean result ) {
line 125
;125:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $77
line 126
;126:		return;
ADDRGP4 $76
JUMPV
LABELV $77
line 128
;127:	}
;128:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 129
;129:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 130
;130:}
LABELV $76
endproc InGame_QuitAction 0 0
export InGame_Event
proc InGame_Event 8 12
line 138
;131:
;132:
;133:/*
;134:=================
;135:InGame_Event
;136:=================
;137:*/
;138:void InGame_Event( void *ptr, int notification ) {
line 139
;139:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 140
;140:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 143
;141:	}
;142:
;143:	switch( ((menucommon_s*)ptr)->id ) {
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
line 145
;144:	case ID_TEAM:
;145:		UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 146
;146:		break;
ADDRGP4 $83
JUMPV
LABELV $86
line 149
;147:
;148:	case ID_SETUP:
;149:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 150
;150:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 153
;151:
;152:	case ID_LEAVEARENA:
;153:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 154
;154:		break;
ADDRGP4 $83
JUMPV
LABELV $89
line 157
;155:
;156:	case ID_RESTART:
;157:		UI_ConfirmMenu( "RESTART ARENA?", (voidfunc_f)NULL, InGame_RestartAction );
ADDRGP4 $90
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 158
;158:		break;
ADDRGP4 $83
JUMPV
LABELV $91
line 161
;159:
;160:	case ID_QUIT:
;161:		UI_ConfirmMenu( "EXIT GAME?",  (voidfunc_f)NULL, InGame_QuitAction );
ADDRGP4 $92
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 162
;162:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 165
;163:
;164:	case ID_SERVERINFO:
;165:		UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 166
;166:		break;
ADDRGP4 $83
JUMPV
LABELV $94
line 169
;167:
;168:	case ID_ADDBOTS:
;169:		UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 170
;170:		break;
ADDRGP4 $83
JUMPV
LABELV $95
line 173
;171:
;172:	case ID_REMOVEBOTS:
;173:		UI_RemoveBotsMenu();
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 174
;174:		break;
ADDRGP4 $83
JUMPV
line 178
;175:
;176:	case ID_CALLVOTE:
;177:		//UI_RemoveBotsMenu();
;178:		break;
line 182
;179:
;180:	case ID_CLASS:
;181:		//UI_RemoveBotsMenu();
;182:		break;
LABELV $98
line 185
;183:
;184:	case ID_TEAMORDERS:
;185:		UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 186
;186:		break;
ADDRGP4 $83
JUMPV
LABELV $99
line 189
;187:
;188:	case ID_RESUME:
;189:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 190
;190:		break;
LABELV $82
LABELV $83
line 192
;191:	}
;192:}
LABELV $79
endproc InGame_Event 8 12
export InGame_MenuInit
proc InGame_MenuInit 4148 12
line 200
;193:
;194:
;195:/*
;196:=================
;197:InGame_MenuInit
;198:=================
;199:*/
;200:void InGame_MenuInit( void ) {
line 206
;201:	int		y;
;202:	uiClientState_t	cs;
;203:	char	info[MAX_INFO_STRING];
;204:	int		team;
;205:
;206:	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1240
ARGI4
ADDRGP4 memset
CALLP4
pop
line 208
;207:
;208:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 210
;209:
;210:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+276
CNSTI4 1
ASGNI4
line 211
;211:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+280
CNSTI4 0
ASGNI4
line 213
;212:
;213:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+288
CNSTI4 6
ASGNI4
line 214
;214:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+288+44
CNSTU4 16384
ASGNU4
line 215
;215:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+288+4
ADDRGP4 $110
ASGNP4
line 216
;216:	s_ingame.frame.generic.x			= 320-233;//142;
ADDRGP4 s_ingame+288+12
CNSTI4 87
ASGNI4
line 217
;217:	s_ingame.frame.generic.y			= 240-166;//118;
ADDRGP4 s_ingame+288+16
CNSTI4 74
ASGNI4
line 218
;218:	s_ingame.frame.width				= 466;//359;
ADDRGP4 s_ingame+288+76
CNSTI4 466
ASGNI4
line 219
;219:	s_ingame.frame.height				= 332;//256;
ADDRGP4 s_ingame+288+80
CNSTI4 332
ASGNI4
line 222
;220:
;221:	//y = 96;
;222:	y = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 223
;223:	s_ingame.team.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+376
CNSTI4 9
ASGNI4
line 224
;224:	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+376+44
CNSTU4 264
ASGNU4
line 225
;225:	s_ingame.team.generic.x				= 320;
ADDRGP4 s_ingame+376+12
CNSTI4 320
ASGNI4
line 226
;226:	s_ingame.team.generic.y				= y;
ADDRGP4 s_ingame+376+16
ADDRLP4 0
INDIRI4
ASGNI4
line 227
;227:	s_ingame.team.generic.id			= ID_TEAM;
ADDRGP4 s_ingame+376+8
CNSTI4 10
ASGNI4
line 228
;228:	s_ingame.team.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+376+48
ADDRGP4 InGame_Event
ASGNP4
line 229
;229:	s_ingame.team.string				= "JOIN GAME";
ADDRGP4 s_ingame+376+60
ADDRGP4 $132
ASGNP4
line 230
;230:	s_ingame.team.color					= color_red;
ADDRGP4 s_ingame+376+68
ADDRGP4 color_red
ASGNP4
line 231
;231:	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+376+64
CNSTI4 17
ASGNI4
line 233
;232:
;233:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 234
;234:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 235
;235:	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+736
CNSTI4 9
ASGNI4
line 236
;236:	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+736+44
CNSTU4 264
ASGNU4
line 237
;237:	s_ingame.addbots.generic.x			= 320;
ADDRGP4 s_ingame+736+12
CNSTI4 320
ASGNI4
line 238
;238:	s_ingame.addbots.generic.y			= y;
ADDRGP4 s_ingame+736+16
ADDRLP4 0
INDIRI4
ASGNI4
line 239
;239:	s_ingame.addbots.generic.id			= ID_ADDBOTS;
ADDRGP4 s_ingame+736+8
CNSTI4 11
ASGNI4
line 240
;240:	s_ingame.addbots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+736+48
ADDRGP4 InGame_Event
ASGNP4
line 241
;241:	s_ingame.addbots.string				= "ADD BOTS";
ADDRGP4 s_ingame+736+60
ADDRGP4 $153
ASGNP4
line 242
;242:	s_ingame.addbots.color				= color_red;
ADDRGP4 s_ingame+736+68
ADDRGP4 color_red
ASGNP4
line 243
;243:	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+736+64
CNSTI4 17
ASGNI4
line 244
;244:		if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
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
line 245
;245:			s_ingame.addbots.generic.flags |= QMF_GRAYED;
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
line 246
;246:		}
LABELV $158
line 249
;247:	
;248:
;249:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 250
;250:	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+808
CNSTI4 9
ASGNI4
line 251
;251:	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+808+44
CNSTU4 264
ASGNU4
line 252
;252:	s_ingame.removebots.generic.x			= 320;
ADDRGP4 s_ingame+808+12
CNSTI4 320
ASGNI4
line 253
;253:	s_ingame.removebots.generic.y			= y;
ADDRGP4 s_ingame+808+16
ADDRLP4 0
INDIRI4
ASGNI4
line 254
;254:	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
ADDRGP4 s_ingame+808+8
CNSTI4 12
ASGNI4
line 255
;255:	s_ingame.removebots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+808+48
ADDRGP4 InGame_Event
ASGNP4
line 256
;256:	s_ingame.removebots.string				= "REMOVE BOTS";
ADDRGP4 s_ingame+808+60
ADDRGP4 $179
ASGNP4
line 257
;257:	s_ingame.removebots.color				= color_red;
ADDRGP4 s_ingame+808+68
ADDRGP4 color_red
ASGNP4
line 258
;258:	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+808+64
CNSTI4 17
ASGNI4
line 259
;259:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
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
line 260
;260:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
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
line 261
;261:		}
LABELV $184
line 262
;262:	}
LABELV $137
line 264
;263:
;264:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 265
;265:	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+880
CNSTI4 9
ASGNI4
line 266
;266:	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+880+44
CNSTU4 264
ASGNU4
line 267
;267:	s_ingame.teamorders.generic.x			= 320;
ADDRGP4 s_ingame+880+12
CNSTI4 320
ASGNI4
line 268
;268:	s_ingame.teamorders.generic.y			= y;
ADDRGP4 s_ingame+880+16
ADDRLP4 0
INDIRI4
ASGNI4
line 269
;269:	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
ADDRGP4 s_ingame+880+8
CNSTI4 19
ASGNI4
line 270
;270:	s_ingame.teamorders.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+880+48
ADDRGP4 InGame_Event
ASGNP4
line 271
;271:	s_ingame.teamorders.string				= "TEAM ORDERS";
ADDRGP4 s_ingame+880+60
ADDRGP4 $203
ASGNP4
line 272
;272:	s_ingame.teamorders.color				= color_red;
ADDRGP4 s_ingame+880+68
ADDRGP4 color_red
ASGNP4
line 273
;273:	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+880+64
CNSTI4 17
ASGNI4
line 274
;274:	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) ) {
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
line 275
;275:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
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
line 276
;276:	}
ADDRGP4 $209
JUMPV
LABELV $208
line 277
;277:	else {
line 278
;278:		trap_GetClientState( &cs );
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 279
;279:		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
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
line 280
;280:		team = atoi( Info_ValueForKey( info, "t" ) );
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
line 281
;281:		if( team == TEAM_SPECTATOR ) {
ADDRLP4 4112
INDIRI4
CNSTI4 3
NEI4 $214
line 282
;282:			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
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
line 283
;283:		}
LABELV $214
line 284
;284:	}
LABELV $209
line 287
;285:
;286:
;287:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 288
;288:	s_ingame.callvote.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1096
CNSTI4 9
ASGNI4
line 289
;289:	s_ingame.callvote.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1096+44
CNSTU4 264
ASGNU4
line 290
;290:	s_ingame.callvote.generic.x			= 320;
ADDRGP4 s_ingame+1096+12
CNSTI4 320
ASGNI4
line 291
;291:	s_ingame.callvote.generic.y			= y;
ADDRGP4 s_ingame+1096+16
ADDRLP4 0
INDIRI4
ASGNI4
line 292
;292:	s_ingame.callvote.generic.id			= ID_CALLVOTE;
ADDRGP4 s_ingame+1096+8
CNSTI4 20
ASGNI4
line 293
;293:	s_ingame.callvote.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1096+48
ADDRGP4 InGame_Event
ASGNP4
line 294
;294:	s_ingame.callvote.string				= "CALL VOTE";
ADDRGP4 s_ingame+1096+60
ADDRGP4 $231
ASGNP4
line 295
;295:	s_ingame.callvote.color				= color_red;
ADDRGP4 s_ingame+1096+68
ADDRGP4 color_red
ASGNP4
line 296
;296:	s_ingame.callvote.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1096+64
CNSTI4 17
ASGNI4
line 298
;297:
;298:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 299
;299:	s_ingame.pickclass.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1168
CNSTI4 9
ASGNI4
line 300
;300:	s_ingame.pickclass.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1168+44
CNSTU4 264
ASGNU4
line 301
;301:	s_ingame.pickclass.generic.x			= 320;
ADDRGP4 s_ingame+1168+12
CNSTI4 320
ASGNI4
line 302
;302:	s_ingame.pickclass.generic.y			= y;
ADDRGP4 s_ingame+1168+16
ADDRLP4 0
INDIRI4
ASGNI4
line 303
;303:	s_ingame.pickclass.generic.id			= ID_CLASS;
ADDRGP4 s_ingame+1168+8
CNSTI4 21
ASGNI4
line 304
;304:	s_ingame.pickclass.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1168+48
ADDRGP4 InGame_Event
ASGNP4
line 305
;305:	s_ingame.pickclass.string				= "CHOOSE CLASS";
ADDRGP4 s_ingame+1168+60
ADDRGP4 $249
ASGNP4
line 306
;306:	s_ingame.pickclass.color				= color_red;
ADDRGP4 s_ingame+1168+68
ADDRGP4 color_red
ASGNP4
line 307
;307:	s_ingame.pickclass.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1168+64
CNSTI4 17
ASGNI4
line 310
;308:
;309:
;310:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 311
;311:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+448
CNSTI4 9
ASGNI4
line 312
;312:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+448+44
CNSTU4 264
ASGNU4
line 313
;313:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+448+12
CNSTI4 320
ASGNI4
line 314
;314:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+448+16
ADDRLP4 0
INDIRI4
ASGNI4
line 315
;315:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+448+8
CNSTI4 13
ASGNI4
line 316
;316:	s_ingame.setup.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+448+48
ADDRGP4 InGame_Event
ASGNP4
line 317
;317:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+448+60
ADDRGP4 $267
ASGNP4
line 318
;318:	s_ingame.setup.color				= color_red;
ADDRGP4 s_ingame+448+68
ADDRGP4 color_red
ASGNP4
line 319
;319:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+448+64
CNSTI4 17
ASGNI4
line 321
;320:
;321:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 322
;322:	s_ingame.server.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+520
CNSTI4 9
ASGNI4
line 323
;323:	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+520+44
CNSTU4 264
ASGNU4
line 324
;324:	s_ingame.server.generic.x			= 320;
ADDRGP4 s_ingame+520+12
CNSTI4 320
ASGNI4
line 325
;325:	s_ingame.server.generic.y			= y;
ADDRGP4 s_ingame+520+16
ADDRLP4 0
INDIRI4
ASGNI4
line 326
;326:	s_ingame.server.generic.id			= ID_SERVERINFO;
ADDRGP4 s_ingame+520+8
CNSTI4 14
ASGNI4
line 327
;327:	s_ingame.server.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+520+48
ADDRGP4 InGame_Event
ASGNP4
line 328
;328:	s_ingame.server.string				= "SERVER INFO";
ADDRGP4 s_ingame+520+60
ADDRGP4 $285
ASGNP4
line 329
;329:	s_ingame.server.color				= color_red;
ADDRGP4 s_ingame+520+68
ADDRGP4 color_red
ASGNP4
line 330
;330:	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+520+64
CNSTI4 17
ASGNI4
line 332
;331:
;332:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 333
;333:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 334
;334:	s_ingame.restart.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+664
CNSTI4 9
ASGNI4
line 335
;335:	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+664+44
CNSTU4 264
ASGNU4
line 336
;336:	s_ingame.restart.generic.x			= 320;
ADDRGP4 s_ingame+664+12
CNSTI4 320
ASGNI4
line 337
;337:	s_ingame.restart.generic.y			= y;
ADDRGP4 s_ingame+664+16
ADDRLP4 0
INDIRI4
ASGNI4
line 338
;338:	s_ingame.restart.generic.id			= ID_RESTART;
ADDRGP4 s_ingame+664+8
CNSTI4 16
ASGNI4
line 339
;339:	s_ingame.restart.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+664+48
ADDRGP4 InGame_Event
ASGNP4
line 340
;340:	s_ingame.restart.string				= "RESTART MAP"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+664+60
ADDRGP4 $305
ASGNP4
line 341
;341:	s_ingame.restart.color				= color_red;
ADDRGP4 s_ingame+664+68
ADDRGP4 color_red
ASGNP4
line 342
;342:	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+664+64
CNSTI4 17
ASGNI4
line 343
;343:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 344
;344:		s_ingame.restart.generic.flags |= QMF_GRAYED;
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
line 345
;345:		}
LABELV $310
line 346
;346:	}
LABELV $290
line 347
;347:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 348
;348:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1024
CNSTI4 9
ASGNI4
line 349
;349:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1024+44
CNSTU4 264
ASGNU4
line 350
;350:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+1024+12
CNSTI4 320
ASGNI4
line 351
;351:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+1024+16
ADDRLP4 0
INDIRI4
ASGNI4
line 352
;352:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+1024+8
CNSTI4 18
ASGNI4
line 353
;353:	s_ingame.resume.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1024+48
ADDRGP4 InGame_Event
ASGNP4
line 354
;354:	s_ingame.resume.string					= "RESUME GAME";
ADDRGP4 s_ingame+1024+60
ADDRGP4 $327
ASGNP4
line 355
;355:	s_ingame.resume.color					= color_red;
ADDRGP4 s_ingame+1024+68
ADDRGP4 color_red
ASGNP4
line 356
;356:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1024+64
CNSTI4 17
ASGNI4
line 358
;357:
;358:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 359
;359:	s_ingame.leave.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+592
CNSTI4 9
ASGNI4
line 360
;360:	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+592+44
CNSTU4 264
ASGNU4
line 361
;361:	s_ingame.leave.generic.x			= 320;
ADDRGP4 s_ingame+592+12
CNSTI4 320
ASGNI4
line 362
;362:	s_ingame.leave.generic.y			= y;
ADDRGP4 s_ingame+592+16
ADDRLP4 0
INDIRI4
ASGNI4
line 363
;363:	s_ingame.leave.generic.id			= ID_LEAVEARENA;
ADDRGP4 s_ingame+592+8
CNSTI4 15
ASGNI4
line 364
;364:	s_ingame.leave.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+592+48
ADDRGP4 InGame_Event
ASGNP4
line 365
;365:	s_ingame.leave.string				= "MAIN MENU"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+592+60
ADDRGP4 $345
ASGNP4
line 366
;366:	s_ingame.leave.color				= color_red;
ADDRGP4 s_ingame+592+68
ADDRGP4 color_red
ASGNP4
line 367
;367:	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+592+64
CNSTI4 17
ASGNI4
line 369
;368:
;369:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 370
;370:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+952
CNSTI4 9
ASGNI4
line 371
;371:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+952+44
CNSTU4 264
ASGNU4
line 372
;372:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+952+12
CNSTI4 320
ASGNI4
line 373
;373:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 374
;374:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+952+8
CNSTI4 17
ASGNI4
line 375
;375:	s_ingame.quit.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+952+48
ADDRGP4 InGame_Event
ASGNP4
line 376
;376:	s_ingame.quit.string				= "EXIT TREPIDATION"; // Shafe - Trep - Minor Text Change
ADDRGP4 s_ingame+952+60
ADDRGP4 $363
ASGNP4
line 377
;377:	s_ingame.quit.color					= color_red;
ADDRGP4 s_ingame+952+68
ADDRGP4 color_red
ASGNP4
line 378
;378:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+952+64
CNSTI4 17
ASGNI4
line 380
;379:
;380:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 381
;381:	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 383
;382:
;383:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 384
;384:		Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 385
;385:		Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 386
;386:	}
LABELV $370
line 388
;387:	
;388:	Menu_AddItem( &s_ingame.menu, &s_ingame.callvote );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 389
;389:	Menu_AddItem( &s_ingame.menu, &s_ingame.pickclass );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1168
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 390
;390:	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 391
;391:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 392
;392:	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 394
;393:
;394:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 395
;395:		Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 396
;396:	}
LABELV $379
line 397
;397:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 398
;398:	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 399
;399:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 400
;400:}
LABELV $102
endproc InGame_MenuInit 4148 12
export InGame_Cache
proc InGame_Cache 0 4
line 408
;401:
;402:
;403:/*
;404:=================
;405:InGame_Cache
;406:=================
;407:*/
;408:void InGame_Cache( void ) {
line 409
;409:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $110
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 410
;410:}
LABELV $385
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 418
;411:
;412:
;413:/*
;414:=================
;415:UI_InGameMenu
;416:=================
;417:*/
;418:void UI_InGameMenu( void ) {
line 420
;419:	// force as top level menu
;420:	uis.menusp = 0;  
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 423
;421:
;422:	// set menu cursor to a nice location
;423:	uis.cursorx = 275;
ADDRGP4 uis+8
CNSTI4 275
ASGNI4
line 424
;424:	uis.cursory = 80;
ADDRGP4 uis+12
CNSTI4 80
ASGNI4
line 426
;425:
;426:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 427
;427:	UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 428
;428:}
LABELV $386
endproc UI_InGameMenu 0 4
proc DynamicMenu_SubMenuInit 8 0
line 449
;429:
;430:
;431:
;432:
;433:// Shafe - Trep --- Menu System
;434:// EVERYTHING BELOW IS ADDED BY SHAFE.. INGAME DYNAMIC MENUS  /////////////////////////////////////
;435:// Heh.. Cut and Paste didnt preserve whitespace... bleh.. 
;436:// Fix that later
;437:
;438://
;439:
;440:
;441:
;442:
;443:/*
;444:=================
;445:DynamicMenu_InitSubMenu
;446:=================
;447:*/
;448:static qboolean DynamicMenu_SubMenuInit( void)
;449:{
line 452
;450:int pos;
;451:
;452:if (s_dynamic.depth == MAX_DYNAMICDEPTH)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 6
NEI4 $391
line 453
;453:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $390
JUMPV
LABELV $391
line 455
;454:
;455:if (s_dynamic.depth == 0)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 0
NEI4 $394
line 456
;456:pos = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
line 458
;457:else
;458:pos = s_dynamic.end[s_dynamic.depth - 1];
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
line 460
;459:
;460:if (pos == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $400
line 461
;461:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $390
JUMPV
LABELV $400
line 463
;462:
;463:s_dynamic.depth++;
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
line 464
;464:s_dynamic.active[s_dynamic.depth - 1] = -1;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
CNSTI4 -1
ASGNI4
line 465
;465:s_dynamic.start[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 466
;466:s_dynamic.end[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 468
;467:
;468:return qtrue;
CNSTI4 1
RETI4
LABELV $390
endproc DynamicMenu_SubMenuInit 8 0
proc DynamicMenu_AddItem 24 12
line 479
;469:}
;470:
;471:
;472:/*
;473:=================
;474:DynamicMenu_AddItem
;475:=================
;476:*/
;477:static qboolean DynamicMenu_AddItem( const char* string, 
;478:int id, createHandler crh, eventHandler evh)
;479:{
line 482
;480:int index, depth;
;481:
;482:depth = s_dynamic.depth - 1;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 483
;483:index = s_dynamic.end[depth];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
ASGNI4
line 485
;484:
;485:if (index == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $415
line 486
;486:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $415
line 489
;487:
;488:// can't have submenu and event attached to menu item
;489:if (crh && evh)
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
line 490
;490:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $417
line 492
;491:
;492:if (!string || !string[0])
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
line 493
;493:string = "[no text]";
ADDRFP4 0
ADDRGP4 $422
ASGNP4
LABELV $419
line 495
;494:
;495:s_dynamic.data[index].index = index;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 496
;496:s_dynamic.data[index].id = id;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 497
;497:s_dynamic.data[index].createSubMenu = crh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 498
;498:s_dynamic.data[index].runEvent = evh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 499
;499:Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);
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
line 501
;500:
;501:s_dynamic.end[depth]++;
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
line 503
;502:
;503:return qtrue;
CNSTI4 1
RETI4
LABELV $412
endproc DynamicMenu_AddItem 24 12
proc DynamicMenu_FinishSubMenuInit 68 4
line 513
;504:}
;505:
;506:
;507:/*
;508:=================
;509:DynamicMenu_FinishInitSubMenu
;510:=================
;511:*/
;512:static void DynamicMenu_FinishSubMenuInit( void )
;513:{
line 524
;514:	int depth;
;515:	int width, maxwidth;
;516:	int height, lineheight;
;517:	int posx, posy;
;518:	int i, count, start, active;
;519:	float scale;
;520:	menutext_s*	ptr;
;521:	qboolean	submenu;
;522:
;523:
;524:depth = s_dynamic.depth - 1;
ADDRLP4 40
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 527
;525:
;526:// find the widest item
;527:submenu = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 528
;528:maxwidth = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 529
;529:start = s_dynamic.start[depth];
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944
ADDP4
INDIRI4
ASGNI4
line 530
;530:count = s_dynamic.end[depth] - start;
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
line 531
;531:for ( i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $437
line 532
;532:{
line 533
;533:width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
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
line 534
;534:if (width > maxwidth)
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $442
line 535
;535:maxwidth = width;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $442
line 537
;536:
;537:if (s_dynamic.data[i + start].createSubMenu)
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
line 538
;538:submenu = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $444
line 539
;539:}
LABELV $438
line 531
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
line 541
;540:
;541:scale = UI_ProportionalSizeScale(UI_SMALLFONT);
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
line 542
;542:if (submenu)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $448
line 543
;543:{
line 545
;544:// space and submenu pointer
;545:maxwidth += UI_ProportionalStringWidth(" \r");
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
line 546
;546:}
LABELV $448
line 548
;547:
;548:maxwidth *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 551
;549:
;550:// determine the position of the menu
;551:lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
ADDRLP4 8
CNSTF4 1104674816
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 552
;552:height = count * lineheight;
ADDRLP4 48
ADDRLP4 32
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
line 554
;553:
;554:if (depth == 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $451
line 555
;555:{
line 556
;556:posy = 240 - height/2;
ADDRLP4 16
CNSTI4 240
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 557
;557:posx = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 558
;558:}
ADDRGP4 $452
JUMPV
LABELV $451
line 560
;559:else
;560:{
line 561
;561:active = s_dynamic.active[depth - 1];
ADDRLP4 52
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
INDIRI4
ASGNI4
line 562
;562:posx = s_dynamic.item[active].generic.right;
ADDRLP4 20
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+28
ADDP4
INDIRI4
ASGNI4
line 563
;563:posy = s_dynamic.item[active].generic.top;
ADDRLP4 16
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+24
ADDP4
INDIRI4
ASGNI4
line 565
;564:
;565:if (posy + height > 480 - 64)
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 416
LEI4 $459
line 566
;566:posy = 480 - 64 - height;
ADDRLP4 16
CNSTI4 416
ADDRLP4 48
INDIRI4
SUBI4
ASGNI4
LABELV $459
line 567
;567:}
LABELV $452
line 569
;568:
;569:for (i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $464
JUMPV
LABELV $461
line 570
;570:{
line 571
;571:ptr = &s_dynamic.item[start + i];
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
line 573
;572:
;573:ptr->generic.x = posx + MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 574
;574:ptr->generic.y = posy + i*lineheight + MENUSPACE_Y;
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
line 576
;575:
;576:ptr->generic.left = posx;
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 577
;577:ptr->generic.right = posx + maxwidth + 2*MENUSPACE_X;
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
line 578
;578:ptr->generic.top = posy + i*lineheight;
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
line 579
;579:ptr->generic.bottom = posy + (i+1)*lineheight - 1;
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
line 581
;580:
;581:ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
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
line 582
;582:}
LABELV $462
line 569
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
line 583
;583:}
LABELV $433
endproc DynamicMenu_FinishSubMenuInit 68 4
proc DynamicMenu_OnActiveList 8 0
line 592
;584:
;585: 
;586:/*
;587:=================
;588:DynamicMenu_OnActiveList
;589:=================
;590:*/
;591:static qboolean DynamicMenu_OnActiveList( int index )
;592:{
line 596
;593:int depth;
;594:int i;
;595:
;596:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 598
;597:
;598:for ( i = 0; i < depth ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $468
line 599
;599:if (s_dynamic.active[i] == index)
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
line 600
;600:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $466
JUMPV
LABELV $472
LABELV $469
line 598
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
line 602
;601:
;602:return qfalse;
CNSTI4 0
RETI4
LABELV $466
endproc DynamicMenu_OnActiveList 8 0
proc DynamicMenu_MenuItemDraw 56 20
line 614
;603:}
;604:
;605:
;606:
;607:
;608:/*
;609:=================
;610:DynamicMenu_MenuItemDraw
;611:=================
;612:*/
;613:static void DynamicMenu_MenuItemDraw( void* self )
;614:{
line 624
;615:int	x;
;616:int	y;
;617:
;618:int	w,h;
;619:float *color;
;620:int	style;
;621:menutext_s*	t;
;622:vec4_t	back_color;
;623:
;624:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 628
;625:
;626:
;627:// draw the background;
;628:x = t->generic.left;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 629
;629:y = t->generic.top;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 630
;630:w = t->generic.right - x;
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
line 631
;631:h = t->generic.bottom - y;
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
line 633
;632:
;633:back_color[0] = 1.0;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 634
;634:back_color[1] = 1.0;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 635
;635:back_color[2] = 1.0;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 636
;636:if (DynamicMenu_OnActiveList(t->generic.id))
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
line 637
;637:{
line 638
;638:		back_color[3] = 0.33;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 639
;639:	}
ADDRGP4 $479
JUMPV
LABELV $478
line 641
;640:	else
;641:	{
line 642
;642:		back_color[3] = 0.1;
ADDRLP4 12+12
CNSTF4 1036831949
ASGNF4
line 643
;643:	}
LABELV $479
line 645
;644:
;645:UI_FillRect(x, y, w, h, back_color);
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
line 648
;646:
;647:// draw the text
;648:x = t->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 649
;649:y = t->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 651
;650:
;651:if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $482
line 652
;652:color = text_color_disabled;
ADDRLP4 36
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $483
JUMPV
LABELV $482
line 654
;653:else
;654:color = t->color;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $483
line 656
;655:
;656:style = t->style;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 657
;657:if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $484
line 658
;658:if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
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
line 659
;659:style |= UI_PULSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 660
;660:}
ADDRGP4 $487
JUMPV
LABELV $486
line 661
;661:else {
line 662
;662:style |= UI_INVERSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 663
;663:}
LABELV $487
line 664
;664:}
LABELV $484
line 666
;665:
;666:UI_DrawProportionalString( x, y, t->string, style, color );
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
line 669
;667:
;668:// draw the cursor for submenu if needed
;669:x = t->generic.left + w;
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
line 670
;670:if (s_dynamic.data[ t->generic.id ].createSubMenu)
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
line 671
;671:{
line 672
;672:UI_DrawChar( x, y, 13, style|UI_RIGHT, color);
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
line 673
;673:}
LABELV $488
line 674
;674:}
LABELV $475
endproc DynamicMenu_MenuItemDraw 56 20
proc DynamicMenu_MenuDraw 0 4
line 685
;675:
;676:
;677:
;678:
;679:/*
;680:=================
;681:DynamicMenu_MenuDraw
;682:=================
;683:*/
;684:static void DynamicMenu_MenuDraw( void )
;685:{
line 692
;686://UI_DrawString(0, 0, va("depth:%i", s_dynamic.depth), 
;687://UI_SMALLFONT, color_white);
;688://UI_DrawString(0, 32, va("active: %i %i %i", 
;689://s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ),
;690://UI_SMALLFONT, color_white);
;691:
;692:Menu_Draw(&s_dynamic.menu);
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 693
;693:}
LABELV $492
endproc DynamicMenu_MenuDraw 0 4
proc DynamicMenu_IndexDepth 12 0
line 703
;694:
;695:
;696:
;697:/*
;698:=================
;699:DynamicMenu_IndexDepth
;700:=================
;701:*/
;702:static int DynamicMenu_IndexDepth( int pos )
;703:{
line 707
;704:int i;
;705:int maxdepth, depth;
;706:
;707:maxdepth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 708
;708:depth = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 709
;709:for (i = 0; i < maxdepth; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 710
;710:{
line 711
;711:if (pos < s_dynamic.end[i])
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
line 712
;712:{
line 713
;713:depth = i + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 714
;714:break;
ADDRGP4 $497
JUMPV
LABELV $499
line 716
;715:}
;716:}
LABELV $496
line 709
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
line 718
;717:
;718:return depth;
ADDRLP4 8
INDIRI4
RETI4
LABELV $493
endproc DynamicMenu_IndexDepth 12 0
proc DynamicMenu_SetFocus 24 8
line 729
;719:}
;720:
;721:
;722:
;723:/*
;724:=================
;725:DynamicMenu_SetFocus
;726:=================
;727:*/
;728:static void DynamicMenu_SetFocus( int pos )
;729:{
line 733
;730:int i;
;731:int depth, newdepth;
;732:
;733:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 734
;734:newdepth = DynamicMenu_IndexDepth(pos);
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
line 736
;735:
;736:if (newdepth == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $504
line 737
;737:{
line 738
;738:Com_Printf("SetFocus: index %i outside menu\n", pos);
ADDRGP4 $506
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 739
;739:return;
ADDRGP4 $502
JUMPV
LABELV $504
line 742
;740:}
;741:
;742:s_dynamic.active[ newdepth - 1 ] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 743
;743:s_dynamic.depth = newdepth;
ADDRGP4 s_dynamic+7020
ADDRLP4 8
INDIRI4
ASGNI4
line 746
;744:
;745:// hide any previous submenus
;746:if (newdepth < depth)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $510
line 747
;747:{
line 748
;748:for (i = s_dynamic.start[ newdepth ]; 
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
line 750
;749:i < s_dynamic.end[depth - 1]; i++)
;750:{
line 751
;751:s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
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
line 752
;752:s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
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
line 753
;753:}
LABELV $513
line 749
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
line 754
;754:}
LABELV $510
line 756
;755:
;756:s_dynamic.active[newdepth - 1] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 759
;757:
;758:// show this sub-menu (if needed)
;759:if (s_dynamic.data[pos].createSubMenu)
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
line 760
;760:s_dynamic.data[pos].createSubMenu();
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
line 761
;761:}
LABELV $502
endproc DynamicMenu_SetFocus 24 8
proc DynamicMenu_ClearFocus 0 0
line 770
;762:
;763:
;764:/*
;765:=================
;766:DynamicMenu_ClearFocus
;767:=================
;768:*/
;769:static void DynamicMenu_ClearFocus( int pos )
;770:{
line 771
;771:}
LABELV $531
endproc DynamicMenu_ClearFocus 0 0
proc DynamicMenu_ActivateControl 12 8
line 781
;772:
;773:
;774:
;775:/*
;776:=================
;777:DynamicMenu_ActivateControl
;778:=================
;779:*/
;780:static void DynamicMenu_ActivateControl( int pos )
;781:{
line 785
;782://int i;
;783:int depth;
;784:
;785:depth = DynamicMenu_IndexDepth(pos);
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
line 787
;786:
;787:if (depth == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $533
line 788
;788:{
line 789
;789:Com_Printf("ActivateControl: index %i outside menu\n", pos);
ADDRGP4 $535
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 790
;790:return;
ADDRGP4 $532
JUMPV
LABELV $533
line 794
;791:}
;792:
;793:// not at the deepest level, can't be a command
;794:if (depth < s_dynamic.depth)
ADDRLP4 0
INDIRI4
ADDRGP4 s_dynamic+7020
INDIRI4
GEI4 $536
line 795
;795:return;
ADDRGP4 $532
JUMPV
LABELV $536
line 797
;796:
;797:if (s_dynamic.data[pos].runEvent)
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
line 798
;798:s_dynamic.data[pos].runEvent(pos);
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
line 800
;799:else
;800:Com_Printf("ActivateControl: index %i has no event\n", pos);
ADDRGP4 $545
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $540
line 801
;801:}
LABELV $532
endproc DynamicMenu_ActivateControl 12 8
proc DynamicMenu_MenuEvent 8 4
line 812
;802:
;803:
;804:
;805:
;806:/*
;807:=================
;808:DynamicMenu_MenuEvent
;809:=================
;810:*/
;811:static void DynamicMenu_MenuEvent( void* self, int event )
;812:{
line 815
;813:menutext_s* t;
;814:
;815:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 817
;816:
;817:switch (event)
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
line 818
;818:{
LABELV $549
line 820
;819:case QM_GOTFOCUS:
;820:DynamicMenu_SetFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_SetFocus
CALLV
pop
line 821
;821:break;
ADDRGP4 $548
JUMPV
LABELV $550
line 823
;822:case QM_LOSTFOCUS:
;823:DynamicMenu_ClearFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ClearFocus
CALLV
pop
line 824
;824:break;
ADDRGP4 $548
JUMPV
LABELV $551
line 826
;825:case QM_ACTIVATED:
;826:DynamicMenu_ActivateControl(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ActivateControl
CALLV
pop
line 827
;827:break;
LABELV $547
LABELV $548
line 829
;828:}
;829:}
LABELV $546
endproc DynamicMenu_MenuEvent 8 4
proc DM_BuildItem 0 8
line 837
;830:
;831:
;832:/*
;833:=================
;834:Build
;835:=================
;836:*/
;837:static void DM_BuildItem( int xitem ) {
line 838
;838:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 841
;839:	
;840:	// Basic Turret
;841:	if (xitem == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $553
line 842
;842:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret\n" );
CNSTI4 2
ARGI4
ADDRGP4 $555
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 843
;843:	}
LABELV $553
line 846
;844:
;845:	// Shielded Turret
;846:	if (xitem == 1) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $556
line 847
;847:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret2\n" );
CNSTI4 2
ARGI4
ADDRGP4 $558
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 848
;848:	}
LABELV $556
line 851
;849:
;850:	// Cloaked Turret
;851:	if (xitem == 2) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $559
line 852
;852:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $561
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 853
;853:	}
LABELV $559
line 856
;854:
;855:	// Generator
;856:	if (xitem == 3) {
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $562
line 857
;857:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawngen\n" );
CNSTI4 2
ARGI4
ADDRGP4 $564
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 858
;858:	}
LABELV $562
line 861
;859:
;860:	// Master Controller
;861:	if (xitem == 4) {
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $565
line 862
;862:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnmc\n" );
CNSTI4 2
ARGI4
ADDRGP4 $567
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 863
;863:	}
LABELV $565
line 865
;864:
;865:}
LABELV $552
endproc DM_BuildItem 0 8
proc DynamicMenu_Close 0 0
line 874
;866:
;867:
;868:/*
;869:=================
;870:DynamicMenu_Close
;871:=================
;872:*/
;873:static void DynamicMenu_Close( void )
;874:{
line 875
;875:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 876
;876:}
LABELV $568
endproc DynamicMenu_Close 0 0
proc DM_Close_Event 0 0
line 886
;877: 
;878:
;879:
;880:/*
;881:=================
;882:DM_Close_Event
;883:=================
;884:*/
;885:static void DM_Close_Event( int index )
;886:{
line 887
;887:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 888
;888:}
LABELV $569
endproc DM_Close_Event 0 0
proc DynamicMenu_VoteMenu 0 16
line 900
;889:
;890:
;891:// Shafe - Trep - Here is where the first Dynamic Menu Starts
;892:
;893:/*
;894:=================
;895:// My first Test menu
;896:DynamicMenu_VoteMenu
;897:=================
;898:*/
;899:static void DynamicMenu_VoteMenu( void )
;900:{
line 901
;901:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 904
;902:	// The Menu Items
;903:
;904:	DynamicMenu_AddItem("Kick", 0 , NULL, DM_Close_Event);
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
line 905
;905:	DynamicMenu_AddItem("Next Map", 0 , NULL, DM_Close_Event);
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
line 906
;906:	DynamicMenu_AddItem("Restart Map", 0 , NULL, DM_Close_Event);
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
line 907
;907:	DynamicMenu_AddItem("Balance Teams", 0 , NULL, DM_Close_Event);
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
line 908
;908:	DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
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
line 909
;909:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 910
;910:}
LABELV $570
endproc DynamicMenu_VoteMenu 0 16
proc DynamicMenu_InitPrimaryMenu 0 16
line 922
;911:
;912:
;913:
;914:
;915:// Shafe - Trep - Top Level Menu Last
;916:/*
;917:=================
;918:DynamicMenu_InitPrimaryMenu
;919:=================
;920:*/
;921:static void DynamicMenu_InitPrimaryMenu( void )
;922:{
line 923
;923:DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 925
;924:
;925:DynamicMenu_AddItem("Call Vote", 0, DynamicMenu_VoteMenu, NULL);
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
line 926
;926:DynamicMenu_AddItem("Buy Equipment", 0 , NULL, DM_Close_Event);
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
line 927
;927:DynamicMenu_AddItem("Crap!", 0, NULL, DM_Close_Event);
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
line 928
;928:DynamicMenu_AddItem("Shit And Stuff!", 0, NULL, DM_Close_Event);
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
line 929
;929:DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
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
line 931
;930:
;931:DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 932
;932:}
LABELV $576
endproc DynamicMenu_InitPrimaryMenu 0 16
proc DynamicMenu_BuildMenu 4 16
line 937
;933:
;934:
;935:
;936:static void DynamicMenu_BuildMenu( void )
;937:{
line 940
;938:	int cts;
;939:	
;940:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 955
;941:	
;942:	
;943:	
;944:	/*
;945:	cts = cgs.scores1 + cgs.scores2;
;946:	s_dynamic.gamemode = (int)trap_Cvar_VariableValue("g_GameMode");
;947:		
;948:		/* Rules just for reference from g_cmds
;949:		if ((cts < 3) && (type == 1)) { iserror = 3; }  
;950:		if ((cts < 6) && (type == 2)) { iserror = 3; }  
;951:
;952:		*/
;953:
;954:
;955:	DynamicMenu_AddItem("Turret", 0, NULL, DM_BuildItem);
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
line 956
;956:	DynamicMenu_AddItem("Sheilded Turret", 0 , NULL, DM_BuildItem);
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
line 957
;957:	DynamicMenu_AddItem("Cloaked Turret", 0, NULL, DM_BuildItem);
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
line 960
;958://	if( s_dynamic.gamemode == 3) 
;959://	{
;960:		DynamicMenu_AddItem("Generator", 0, NULL, DM_BuildItem);
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
line 961
;961:		DynamicMenu_AddItem("MC Reactor", 0, NULL, DM_BuildItem);
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
line 963
;962://	}
;963:	DynamicMenu_AddItem("Close", 0, NULL, DM_Close_Event);
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
line 965
;964:
;965:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 966
;966:}
LABELV $581
endproc DynamicMenu_BuildMenu 4 16
proc DynamicMenu_MenuInit 12 8
line 975
;967:
;968:
;969:/*
;970:=================
;971:DynamicMenu_MenuInit
;972:=================
;973:*/
;974:static void DynamicMenu_MenuInit( void )
;975:{
line 978
;976:int i;
;977:
;978:s_dynamic.menu.draw = DynamicMenu_MenuDraw;
ADDRGP4 s_dynamic+268
ADDRGP4 DynamicMenu_MenuDraw
ASGNP4
line 979
;979:s_dynamic.menu.fullscreen = qfalse;
ADDRGP4 s_dynamic+280
CNSTI4 0
ASGNI4
line 980
;980:s_dynamic.menu.wrapAround = qfalse;
ADDRGP4 s_dynamic+276
CNSTI4 0
ASGNI4
line 982
;981:
;982:for (i = 0; i < MAX_MENUITEMS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $592
line 983
;983:{
line 984
;984:s_dynamic.item[i].generic.type = MTYPE_PTEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288
ADDP4
CNSTI4 9
ASGNI4
line 985
;985:s_dynamic.item[i].generic.flags = QMF_INACTIVE
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+44
ADDP4
CNSTU4 53504
ASGNU4
line 987
;986:|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
;987:s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+56
ADDP4
ADDRGP4 DynamicMenu_MenuItemDraw
ASGNP4
line 988
;988:s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+48
ADDP4
ADDRGP4 DynamicMenu_MenuEvent
ASGNP4
line 989
;989:s_dynamic.item[i].generic.id = i;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 990
;990:s_dynamic.item[i].string = s_dynamic.data[i].text;
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
line 991
;991:s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+64
ADDP4
CNSTI4 2064
ASGNI4
line 992
;992:s_dynamic.item[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 994
;993:
;994:Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
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
line 995
;995:}
LABELV $593
line 982
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
line 998
;996:
;997:// start up the menu system
;998:s_dynamic.depth = 0;
ADDRGP4 s_dynamic+7020
CNSTI4 0
ASGNI4
line 1004
;999:
;1000://Uncomment the next line if adding part II as well
;1001://DynamicMenu_InitMapItems();
;1002:
;1003://DynamicMenu_InitPrimaryMenu();
;1004:DynamicMenu_BuildMenu();
ADDRGP4 DynamicMenu_BuildMenu
CALLV
pop
line 1005
;1005:}
LABELV $588
endproc DynamicMenu_MenuInit 12 8
export UI_DynamicMenuCache
proc UI_DynamicMenuCache 0 0
line 1018
;1006:
;1007:
;1008:
;1009:
;1010:
;1011:
;1012:/*
;1013:=================
;1014:UI_DynamicMenuCache
;1015:=================
;1016:*/
;1017:void UI_DynamicMenuCache( void )
;1018:{
line 1019
;1019:}
LABELV $614
endproc UI_DynamicMenuCache 0 0
export UI_DynamicMenu
proc UI_DynamicMenu 4124 12
line 1030
;1020:
;1021:
;1022:
;1023:
;1024:/*
;1025:=================
;1026:UI_DynamicMenu
;1027:=================
;1028:*/
;1029:void UI_DynamicMenu( void )
;1030:{
line 1035
;1031:	uiClientState_t	cs;
;1032:	char			info[MAX_INFO_STRING];
;1033:	int				playerTeam;
;1034:
;1035:trap_GetClientState( &cs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 1036
;1036:trap_GetConfigString( CS_PLAYERS 
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
line 1038
;1037:+ cs.clientNum, info, MAX_INFO_STRING );
;1038:playerTeam = atoi(Info_ValueForKey(info, "t"));
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
line 1045
;1039:
;1040://Uncomment the next two code lines if adding part II 
;1041://as well, or specs can't use the menu either
;1042://if (playerTeam == TEAM_SPECTATOR)
;1043://return;
;1044:
;1045:memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));
ADDRGP4 s_dynamic
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7028
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1047
;1046:
;1047:s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");
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
line 1054
;1048:
;1049://Uncomment the next three lines if adding part II as well
;1050://if (s_dynamic.gametype != GT_TEAM && 
;1051://s_dynamic.gametype != GT_CTF)
;1052://return;
;1053:
;1054:UI_DynamicMenuCache();
ADDRGP4 UI_DynamicMenuCache
CALLV
pop
line 1057
;1055:
;1056:// force as top level menu
;1057:uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1060
;1058:
;1059:// set menu cursor to a nice location
;1060:uis.cursorx = 50;
ADDRGP4 uis+8
CNSTI4 50
ASGNI4
line 1061
;1061:uis.cursory = 240;
ADDRGP4 uis+12
CNSTI4 240
ASGNI4
line 1063
;1062:
;1063:DynamicMenu_MenuInit();
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 1065
;1064:
;1065:UI_PushMenu( &s_dynamic.menu );
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1066
;1066:}
LABELV $615
endproc UI_DynamicMenu 4124 12
export UI_DynamicCommandMenu_f
proc UI_DynamicCommandMenu_f 0 0
line 1076
;1067:
;1068:
;1069:
;1070:/*
;1071:=================
;1072:UI_DynamicCommandMenu_f
;1073:=================
;1074:*/
;1075:void UI_DynamicCommandMenu_f( void )
;1076:{
line 1077
;1077:UI_DynamicMenu();
ADDRGP4 UI_DynamicMenu
CALLV
pop
line 1078
;1078:}
LABELV $621
endproc UI_DynamicCommandMenu_f 0 0
bss
align 4
LABELV s_dynamic
skip 7028
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
