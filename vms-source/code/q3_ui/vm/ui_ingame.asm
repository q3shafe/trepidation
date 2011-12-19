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
;15:#define INGAME_FRAME					"menu/art/xaddbotframe"
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
line 214
;212:
;213:	
;214:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+288
CNSTI4 6
ASGNI4
line 215
;215:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+288+44
CNSTU4 16384
ASGNU4
line 216
;216:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+288+4
ADDRGP4 $110
ASGNP4
line 217
;217:	s_ingame.frame.generic.x			= 320-233;//142;
ADDRGP4 s_ingame+288+12
CNSTI4 87
ASGNI4
line 218
;218:	s_ingame.frame.generic.y			= 240-166;//118;
ADDRGP4 s_ingame+288+16
CNSTI4 74
ASGNI4
line 219
;219:	s_ingame.frame.width				= 466;//359;
ADDRGP4 s_ingame+288+76
CNSTI4 466
ASGNI4
line 220
;220:	s_ingame.frame.height				= 332;//256;
ADDRGP4 s_ingame+288+80
CNSTI4 332
ASGNI4
line 223
;221:	
;222:	//y = 96;
;223:	y = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 224
;224:	s_ingame.team.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+376
CNSTI4 9
ASGNI4
line 225
;225:	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+376+44
CNSTU4 264
ASGNU4
line 226
;226:	s_ingame.team.generic.x				= 320;
ADDRGP4 s_ingame+376+12
CNSTI4 320
ASGNI4
line 227
;227:	s_ingame.team.generic.y				= y;
ADDRGP4 s_ingame+376+16
ADDRLP4 0
INDIRI4
ASGNI4
line 228
;228:	s_ingame.team.generic.id			= ID_TEAM;
ADDRGP4 s_ingame+376+8
CNSTI4 10
ASGNI4
line 229
;229:	s_ingame.team.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+376+48
ADDRGP4 InGame_Event
ASGNP4
line 230
;230:	s_ingame.team.string				= "JOIN GAME";
ADDRGP4 s_ingame+376+60
ADDRGP4 $132
ASGNP4
line 231
;231:	s_ingame.team.color					= color_red;
ADDRGP4 s_ingame+376+68
ADDRGP4 color_red
ASGNP4
line 232
;232:	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+376+64
CNSTI4 17
ASGNI4
line 234
;233:
;234:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 235
;235:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 236
;236:	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+736
CNSTI4 9
ASGNI4
line 237
;237:	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+736+44
CNSTU4 264
ASGNU4
line 238
;238:	s_ingame.addbots.generic.x			= 320;
ADDRGP4 s_ingame+736+12
CNSTI4 320
ASGNI4
line 239
;239:	s_ingame.addbots.generic.y			= y;
ADDRGP4 s_ingame+736+16
ADDRLP4 0
INDIRI4
ASGNI4
line 240
;240:	s_ingame.addbots.generic.id			= ID_ADDBOTS;
ADDRGP4 s_ingame+736+8
CNSTI4 11
ASGNI4
line 241
;241:	s_ingame.addbots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+736+48
ADDRGP4 InGame_Event
ASGNP4
line 242
;242:	s_ingame.addbots.string				= "ADD BOTS";
ADDRGP4 s_ingame+736+60
ADDRGP4 $153
ASGNP4
line 243
;243:	s_ingame.addbots.color				= color_red;
ADDRGP4 s_ingame+736+68
ADDRGP4 color_red
ASGNP4
line 244
;244:	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+736+64
CNSTI4 17
ASGNI4
line 245
;245:		if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
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
line 246
;246:			s_ingame.addbots.generic.flags |= QMF_GRAYED;
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
line 247
;247:		}
LABELV $158
line 250
;248:	
;249:
;250:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 251
;251:	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+808
CNSTI4 9
ASGNI4
line 252
;252:	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+808+44
CNSTU4 264
ASGNU4
line 253
;253:	s_ingame.removebots.generic.x			= 320;
ADDRGP4 s_ingame+808+12
CNSTI4 320
ASGNI4
line 254
;254:	s_ingame.removebots.generic.y			= y;
ADDRGP4 s_ingame+808+16
ADDRLP4 0
INDIRI4
ASGNI4
line 255
;255:	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
ADDRGP4 s_ingame+808+8
CNSTI4 12
ASGNI4
line 256
;256:	s_ingame.removebots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+808+48
ADDRGP4 InGame_Event
ASGNP4
line 257
;257:	s_ingame.removebots.string				= "REMOVE BOTS";
ADDRGP4 s_ingame+808+60
ADDRGP4 $179
ASGNP4
line 258
;258:	s_ingame.removebots.color				= color_red;
ADDRGP4 s_ingame+808+68
ADDRGP4 color_red
ASGNP4
line 259
;259:	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+808+64
CNSTI4 17
ASGNI4
line 260
;260:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
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
line 261
;261:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
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
line 262
;262:		}
LABELV $184
line 263
;263:	}
LABELV $137
line 265
;264:
;265:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 266
;266:	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+880
CNSTI4 9
ASGNI4
line 267
;267:	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+880+44
CNSTU4 264
ASGNU4
line 268
;268:	s_ingame.teamorders.generic.x			= 320;
ADDRGP4 s_ingame+880+12
CNSTI4 320
ASGNI4
line 269
;269:	s_ingame.teamorders.generic.y			= y;
ADDRGP4 s_ingame+880+16
ADDRLP4 0
INDIRI4
ASGNI4
line 270
;270:	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
ADDRGP4 s_ingame+880+8
CNSTI4 19
ASGNI4
line 271
;271:	s_ingame.teamorders.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+880+48
ADDRGP4 InGame_Event
ASGNP4
line 272
;272:	s_ingame.teamorders.string				= "TEAM ORDERS";
ADDRGP4 s_ingame+880+60
ADDRGP4 $203
ASGNP4
line 273
;273:	s_ingame.teamorders.color				= color_red;
ADDRGP4 s_ingame+880+68
ADDRGP4 color_red
ASGNP4
line 274
;274:	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+880+64
CNSTI4 17
ASGNI4
line 275
;275:	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) ) {
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
line 276
;276:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
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
line 277
;277:	}
ADDRGP4 $209
JUMPV
LABELV $208
line 278
;278:	else {
line 279
;279:		trap_GetClientState( &cs );
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 280
;280:		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
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
line 281
;281:		team = atoi( Info_ValueForKey( info, "t" ) );
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
line 282
;282:		if( team == TEAM_SPECTATOR ) {
ADDRLP4 4112
INDIRI4
CNSTI4 3
NEI4 $214
line 283
;283:			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
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
line 284
;284:		}
LABELV $214
line 285
;285:	}
LABELV $209
line 288
;286:
;287:
;288:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 289
;289:	s_ingame.callvote.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1096
CNSTI4 9
ASGNI4
line 290
;290:	s_ingame.callvote.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1096+44
CNSTU4 264
ASGNU4
line 291
;291:	s_ingame.callvote.generic.x			= 320;
ADDRGP4 s_ingame+1096+12
CNSTI4 320
ASGNI4
line 292
;292:	s_ingame.callvote.generic.y			= y;
ADDRGP4 s_ingame+1096+16
ADDRLP4 0
INDIRI4
ASGNI4
line 293
;293:	s_ingame.callvote.generic.id			= ID_CALLVOTE;
ADDRGP4 s_ingame+1096+8
CNSTI4 20
ASGNI4
line 294
;294:	s_ingame.callvote.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1096+48
ADDRGP4 InGame_Event
ASGNP4
line 295
;295:	s_ingame.callvote.string				= "CALL VOTE";
ADDRGP4 s_ingame+1096+60
ADDRGP4 $231
ASGNP4
line 296
;296:	s_ingame.callvote.color				= color_red;
ADDRGP4 s_ingame+1096+68
ADDRGP4 color_red
ASGNP4
line 297
;297:	s_ingame.callvote.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1096+64
CNSTI4 17
ASGNI4
line 299
;298:
;299:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 300
;300:	s_ingame.pickclass.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1168
CNSTI4 9
ASGNI4
line 301
;301:	s_ingame.pickclass.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1168+44
CNSTU4 264
ASGNU4
line 302
;302:	s_ingame.pickclass.generic.x			= 320;
ADDRGP4 s_ingame+1168+12
CNSTI4 320
ASGNI4
line 303
;303:	s_ingame.pickclass.generic.y			= y;
ADDRGP4 s_ingame+1168+16
ADDRLP4 0
INDIRI4
ASGNI4
line 304
;304:	s_ingame.pickclass.generic.id			= ID_CLASS;
ADDRGP4 s_ingame+1168+8
CNSTI4 21
ASGNI4
line 305
;305:	s_ingame.pickclass.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1168+48
ADDRGP4 InGame_Event
ASGNP4
line 306
;306:	s_ingame.pickclass.string				= "CHOOSE CLASS";
ADDRGP4 s_ingame+1168+60
ADDRGP4 $249
ASGNP4
line 307
;307:	s_ingame.pickclass.color				= color_red;
ADDRGP4 s_ingame+1168+68
ADDRGP4 color_red
ASGNP4
line 308
;308:	s_ingame.pickclass.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1168+64
CNSTI4 17
ASGNI4
line 311
;309:
;310:
;311:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 312
;312:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+448
CNSTI4 9
ASGNI4
line 313
;313:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+448+44
CNSTU4 264
ASGNU4
line 314
;314:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+448+12
CNSTI4 320
ASGNI4
line 315
;315:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+448+16
ADDRLP4 0
INDIRI4
ASGNI4
line 316
;316:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+448+8
CNSTI4 13
ASGNI4
line 317
;317:	s_ingame.setup.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+448+48
ADDRGP4 InGame_Event
ASGNP4
line 318
;318:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+448+60
ADDRGP4 $267
ASGNP4
line 319
;319:	s_ingame.setup.color				= color_red;
ADDRGP4 s_ingame+448+68
ADDRGP4 color_red
ASGNP4
line 320
;320:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+448+64
CNSTI4 17
ASGNI4
line 322
;321:
;322:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 323
;323:	s_ingame.server.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+520
CNSTI4 9
ASGNI4
line 324
;324:	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+520+44
CNSTU4 264
ASGNU4
line 325
;325:	s_ingame.server.generic.x			= 320;
ADDRGP4 s_ingame+520+12
CNSTI4 320
ASGNI4
line 326
;326:	s_ingame.server.generic.y			= y;
ADDRGP4 s_ingame+520+16
ADDRLP4 0
INDIRI4
ASGNI4
line 327
;327:	s_ingame.server.generic.id			= ID_SERVERINFO;
ADDRGP4 s_ingame+520+8
CNSTI4 14
ASGNI4
line 328
;328:	s_ingame.server.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+520+48
ADDRGP4 InGame_Event
ASGNP4
line 329
;329:	s_ingame.server.string				= "SERVER INFO";
ADDRGP4 s_ingame+520+60
ADDRGP4 $285
ASGNP4
line 330
;330:	s_ingame.server.color				= color_red;
ADDRGP4 s_ingame+520+68
ADDRGP4 color_red
ASGNP4
line 331
;331:	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+520+64
CNSTI4 17
ASGNI4
line 333
;332:
;333:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 334
;334:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 335
;335:	s_ingame.restart.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+664
CNSTI4 9
ASGNI4
line 336
;336:	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+664+44
CNSTU4 264
ASGNU4
line 337
;337:	s_ingame.restart.generic.x			= 320;
ADDRGP4 s_ingame+664+12
CNSTI4 320
ASGNI4
line 338
;338:	s_ingame.restart.generic.y			= y;
ADDRGP4 s_ingame+664+16
ADDRLP4 0
INDIRI4
ASGNI4
line 339
;339:	s_ingame.restart.generic.id			= ID_RESTART;
ADDRGP4 s_ingame+664+8
CNSTI4 16
ASGNI4
line 340
;340:	s_ingame.restart.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+664+48
ADDRGP4 InGame_Event
ASGNP4
line 341
;341:	s_ingame.restart.string				= "RESTART MAP"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+664+60
ADDRGP4 $305
ASGNP4
line 342
;342:	s_ingame.restart.color				= color_red;
ADDRGP4 s_ingame+664+68
ADDRGP4 color_red
ASGNP4
line 343
;343:	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+664+64
CNSTI4 17
ASGNI4
line 344
;344:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 345
;345:		s_ingame.restart.generic.flags |= QMF_GRAYED;
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
line 346
;346:		}
LABELV $310
line 347
;347:	}
LABELV $290
line 348
;348:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 349
;349:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1024
CNSTI4 9
ASGNI4
line 350
;350:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1024+44
CNSTU4 264
ASGNU4
line 351
;351:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+1024+12
CNSTI4 320
ASGNI4
line 352
;352:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+1024+16
ADDRLP4 0
INDIRI4
ASGNI4
line 353
;353:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+1024+8
CNSTI4 18
ASGNI4
line 354
;354:	s_ingame.resume.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1024+48
ADDRGP4 InGame_Event
ASGNP4
line 355
;355:	s_ingame.resume.string					= "RESUME GAME";
ADDRGP4 s_ingame+1024+60
ADDRGP4 $327
ASGNP4
line 356
;356:	s_ingame.resume.color					= color_red;
ADDRGP4 s_ingame+1024+68
ADDRGP4 color_red
ASGNP4
line 357
;357:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1024+64
CNSTI4 17
ASGNI4
line 359
;358:
;359:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 360
;360:	s_ingame.leave.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+592
CNSTI4 9
ASGNI4
line 361
;361:	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+592+44
CNSTU4 264
ASGNU4
line 362
;362:	s_ingame.leave.generic.x			= 320;
ADDRGP4 s_ingame+592+12
CNSTI4 320
ASGNI4
line 363
;363:	s_ingame.leave.generic.y			= y;
ADDRGP4 s_ingame+592+16
ADDRLP4 0
INDIRI4
ASGNI4
line 364
;364:	s_ingame.leave.generic.id			= ID_LEAVEARENA;
ADDRGP4 s_ingame+592+8
CNSTI4 15
ASGNI4
line 365
;365:	s_ingame.leave.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+592+48
ADDRGP4 InGame_Event
ASGNP4
line 366
;366:	s_ingame.leave.string				= "MAIN MENU"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+592+60
ADDRGP4 $345
ASGNP4
line 367
;367:	s_ingame.leave.color				= color_red;
ADDRGP4 s_ingame+592+68
ADDRGP4 color_red
ASGNP4
line 368
;368:	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+592+64
CNSTI4 17
ASGNI4
line 370
;369:
;370:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 371
;371:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+952
CNSTI4 9
ASGNI4
line 372
;372:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+952+44
CNSTU4 264
ASGNU4
line 373
;373:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+952+12
CNSTI4 320
ASGNI4
line 374
;374:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 375
;375:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+952+8
CNSTI4 17
ASGNI4
line 376
;376:	s_ingame.quit.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+952+48
ADDRGP4 InGame_Event
ASGNP4
line 377
;377:	s_ingame.quit.string				= "EXIT TREPIDATION"; // Shafe - Trep - Minor Text Change
ADDRGP4 s_ingame+952+60
ADDRGP4 $363
ASGNP4
line 378
;378:	s_ingame.quit.color					= color_red;
ADDRGP4 s_ingame+952+68
ADDRGP4 color_red
ASGNP4
line 379
;379:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+952+64
CNSTI4 17
ASGNI4
line 381
;380:
;381:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 382
;382:	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 384
;383:
;384:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 385
;385:		Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 386
;386:		Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 387
;387:	}
LABELV $370
line 389
;388:	
;389:	Menu_AddItem( &s_ingame.menu, &s_ingame.callvote );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 390
;390:	Menu_AddItem( &s_ingame.menu, &s_ingame.pickclass );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1168
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 391
;391:	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 392
;392:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 393
;393:	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 395
;394:
;395:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
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
line 396
;396:		Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 397
;397:	}
LABELV $379
line 398
;398:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 399
;399:	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 400
;400:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 401
;401:}
LABELV $102
endproc InGame_MenuInit 4148 12
export InGame_Cache
proc InGame_Cache 0 4
line 409
;402:
;403:
;404:/*
;405:=================
;406:InGame_Cache
;407:=================
;408:*/
;409:void InGame_Cache( void ) {
line 410
;410:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $110
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 411
;411:}
LABELV $385
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 419
;412:
;413:
;414:/*
;415:=================
;416:UI_InGameMenu
;417:=================
;418:*/
;419:void UI_InGameMenu( void ) {
line 421
;420:	// force as top level menu
;421:	uis.menusp = 0;  
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 424
;422:
;423:	// set menu cursor to a nice location
;424:	uis.cursorx = 275;
ADDRGP4 uis+8
CNSTI4 275
ASGNI4
line 425
;425:	uis.cursory = 80;
ADDRGP4 uis+12
CNSTI4 80
ASGNI4
line 427
;426:
;427:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 428
;428:	UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 429
;429:}
LABELV $386
endproc UI_InGameMenu 0 4
proc DynamicMenu_SubMenuInit 8 0
line 450
;430:
;431:
;432:
;433:
;434:// Shafe - Trep --- Menu System
;435:// EVERYTHING BELOW IS ADDED BY SHAFE.. INGAME DYNAMIC MENUS  /////////////////////////////////////
;436:// Heh.. Cut and Paste didnt preserve whitespace... bleh.. 
;437:// Fix that later
;438:
;439://
;440:
;441:
;442:
;443:
;444:/*
;445:=================
;446:DynamicMenu_InitSubMenu
;447:=================
;448:*/
;449:static qboolean DynamicMenu_SubMenuInit( void)
;450:{
line 453
;451:int pos;
;452:
;453:if (s_dynamic.depth == MAX_DYNAMICDEPTH)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 6
NEI4 $391
line 454
;454:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $390
JUMPV
LABELV $391
line 456
;455:
;456:if (s_dynamic.depth == 0)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 0
NEI4 $394
line 457
;457:pos = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
line 459
;458:else
;459:pos = s_dynamic.end[s_dynamic.depth - 1];
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
line 461
;460:
;461:if (pos == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $400
line 462
;462:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $390
JUMPV
LABELV $400
line 464
;463:
;464:s_dynamic.depth++;
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
line 465
;465:s_dynamic.active[s_dynamic.depth - 1] = -1;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
CNSTI4 -1
ASGNI4
line 466
;466:s_dynamic.start[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 467
;467:s_dynamic.end[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 469
;468:
;469:return qtrue;
CNSTI4 1
RETI4
LABELV $390
endproc DynamicMenu_SubMenuInit 8 0
proc DynamicMenu_AddItem 24 12
line 480
;470:}
;471:
;472:
;473:/*
;474:=================
;475:DynamicMenu_AddItem
;476:=================
;477:*/
;478:static qboolean DynamicMenu_AddItem( const char* string, 
;479:int id, createHandler crh, eventHandler evh)
;480:{
line 483
;481:int index, depth;
;482:
;483:depth = s_dynamic.depth - 1;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 484
;484:index = s_dynamic.end[depth];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
ASGNI4
line 486
;485:
;486:if (index == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $415
line 487
;487:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $415
line 490
;488:
;489:// can't have submenu and event attached to menu item
;490:if (crh && evh)
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
line 491
;491:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $412
JUMPV
LABELV $417
line 493
;492:
;493:if (!string || !string[0])
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
line 494
;494:string = "[no text]";
ADDRFP4 0
ADDRGP4 $422
ASGNP4
LABELV $419
line 496
;495:
;496:s_dynamic.data[index].index = index;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 497
;497:s_dynamic.data[index].id = id;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 498
;498:s_dynamic.data[index].createSubMenu = crh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 499
;499:s_dynamic.data[index].runEvent = evh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 500
;500:Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);
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
line 502
;501:
;502:s_dynamic.end[depth]++;
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
line 504
;503:
;504:return qtrue;
CNSTI4 1
RETI4
LABELV $412
endproc DynamicMenu_AddItem 24 12
proc DynamicMenu_FinishSubMenuInit 68 4
line 514
;505:}
;506:
;507:
;508:/*
;509:=================
;510:DynamicMenu_FinishInitSubMenu
;511:=================
;512:*/
;513:static void DynamicMenu_FinishSubMenuInit( void )
;514:{
line 525
;515:	int depth;
;516:	int width, maxwidth;
;517:	int height, lineheight;
;518:	int posx, posy;
;519:	int i, count, start, active;
;520:	float scale;
;521:	menutext_s*	ptr;
;522:	qboolean	submenu;
;523:
;524:
;525:depth = s_dynamic.depth - 1;
ADDRLP4 40
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 528
;526:
;527:// find the widest item
;528:submenu = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 529
;529:maxwidth = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 530
;530:start = s_dynamic.start[depth];
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944
ADDP4
INDIRI4
ASGNI4
line 531
;531:count = s_dynamic.end[depth] - start;
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
line 532
;532:for ( i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $437
line 533
;533:{
line 534
;534:width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
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
line 535
;535:if (width > maxwidth)
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $442
line 536
;536:maxwidth = width;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $442
line 538
;537:
;538:if (s_dynamic.data[i + start].createSubMenu)
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
line 539
;539:submenu = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $444
line 540
;540:}
LABELV $438
line 532
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
line 542
;541:
;542:scale = UI_ProportionalSizeScale(UI_SMALLFONT);
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
line 543
;543:if (submenu)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $448
line 544
;544:{
line 546
;545:// space and submenu pointer
;546:maxwidth += UI_ProportionalStringWidth(" \r");
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
line 547
;547:}
LABELV $448
line 549
;548:
;549:maxwidth *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 552
;550:
;551:// determine the position of the menu
;552:lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
ADDRLP4 8
CNSTF4 1104674816
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 553
;553:height = count * lineheight;
ADDRLP4 48
ADDRLP4 32
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
line 555
;554:
;555:if (depth == 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $451
line 556
;556:{
line 557
;557:posy = 240 - height/2;
ADDRLP4 16
CNSTI4 240
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 558
;558:posx = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 559
;559:}
ADDRGP4 $452
JUMPV
LABELV $451
line 561
;560:else
;561:{
line 562
;562:active = s_dynamic.active[depth - 1];
ADDRLP4 52
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
INDIRI4
ASGNI4
line 563
;563:posx = s_dynamic.item[active].generic.right;
ADDRLP4 20
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+28
ADDP4
INDIRI4
ASGNI4
line 564
;564:posy = s_dynamic.item[active].generic.top;
ADDRLP4 16
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+24
ADDP4
INDIRI4
ASGNI4
line 566
;565:
;566:if (posy + height > 480 - 64)
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 416
LEI4 $459
line 567
;567:posy = 480 - 64 - height;
ADDRLP4 16
CNSTI4 416
ADDRLP4 48
INDIRI4
SUBI4
ASGNI4
LABELV $459
line 568
;568:}
LABELV $452
line 570
;569:
;570:for (i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $464
JUMPV
LABELV $461
line 571
;571:{
line 572
;572:ptr = &s_dynamic.item[start + i];
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
line 574
;573:
;574:ptr->generic.x = posx + MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 575
;575:ptr->generic.y = posy + i*lineheight + MENUSPACE_Y;
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
line 577
;576:
;577:ptr->generic.left = posx;
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 578
;578:ptr->generic.right = posx + maxwidth + 2*MENUSPACE_X;
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
line 579
;579:ptr->generic.top = posy + i*lineheight;
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
line 580
;580:ptr->generic.bottom = posy + (i+1)*lineheight - 1;
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
line 582
;581:
;582:ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
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
line 583
;583:}
LABELV $462
line 570
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
line 584
;584:}
LABELV $433
endproc DynamicMenu_FinishSubMenuInit 68 4
proc DynamicMenu_OnActiveList 8 0
line 593
;585:
;586: 
;587:/*
;588:=================
;589:DynamicMenu_OnActiveList
;590:=================
;591:*/
;592:static qboolean DynamicMenu_OnActiveList( int index )
;593:{
line 597
;594:int depth;
;595:int i;
;596:
;597:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 599
;598:
;599:for ( i = 0; i < depth ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $471
JUMPV
LABELV $468
line 600
;600:if (s_dynamic.active[i] == index)
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
line 601
;601:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $466
JUMPV
LABELV $472
LABELV $469
line 599
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
line 603
;602:
;603:return qfalse;
CNSTI4 0
RETI4
LABELV $466
endproc DynamicMenu_OnActiveList 8 0
proc DynamicMenu_MenuItemDraw 56 20
line 615
;604:}
;605:
;606:
;607:
;608:
;609:/*
;610:=================
;611:DynamicMenu_MenuItemDraw
;612:=================
;613:*/
;614:static void DynamicMenu_MenuItemDraw( void* self )
;615:{
line 625
;616:int	x;
;617:int	y;
;618:
;619:int	w,h;
;620:float *color;
;621:int	style;
;622:menutext_s*	t;
;623:vec4_t	back_color;
;624:
;625:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 629
;626:
;627:
;628:// draw the background;
;629:x = t->generic.left;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 630
;630:y = t->generic.top;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 631
;631:w = t->generic.right - x;
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
line 632
;632:h = t->generic.bottom - y;
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
line 634
;633:
;634:back_color[0] = 1.0;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 635
;635:back_color[1] = 1.0;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 636
;636:back_color[2] = 1.0;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 637
;637:if (DynamicMenu_OnActiveList(t->generic.id))
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
line 638
;638:{
line 639
;639:		back_color[3] = 0.33f;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 640
;640:	}
ADDRGP4 $479
JUMPV
LABELV $478
line 642
;641:	else
;642:	{
line 643
;643:		back_color[3] = 0.1f;
ADDRLP4 12+12
CNSTF4 1036831949
ASGNF4
line 644
;644:	}
LABELV $479
line 646
;645:
;646:UI_FillRect(x, y, w, h, back_color);
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
line 649
;647:
;648:// draw the text
;649:x = t->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 650
;650:y = t->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 652
;651:
;652:if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $482
line 653
;653:color = text_color_disabled;
ADDRLP4 36
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $483
JUMPV
LABELV $482
line 655
;654:else
;655:color = t->color;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $483
line 657
;656:
;657:style = t->style;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 658
;658:if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $484
line 659
;659:if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
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
line 660
;660:style |= UI_PULSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 661
;661:}
ADDRGP4 $487
JUMPV
LABELV $486
line 662
;662:else {
line 663
;663:style |= UI_INVERSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 664
;664:}
LABELV $487
line 665
;665:}
LABELV $484
line 667
;666:
;667:UI_DrawProportionalString( x, y, t->string, style, color );
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
line 670
;668:
;669:// draw the cursor for submenu if needed
;670:x = t->generic.left + w;
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
line 671
;671:if (s_dynamic.data[ t->generic.id ].createSubMenu)
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
line 672
;672:{
line 673
;673:UI_DrawChar( x, y, 13, style|UI_RIGHT, color);
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
line 674
;674:}
LABELV $488
line 675
;675:}
LABELV $475
endproc DynamicMenu_MenuItemDraw 56 20
proc DynamicMenu_MenuDraw 0 4
line 686
;676:
;677:
;678:
;679:
;680:/*
;681:=================
;682:DynamicMenu_MenuDraw
;683:=================
;684:*/
;685:static void DynamicMenu_MenuDraw( void )
;686:{
line 693
;687://UI_DrawString(0, 0, va("depth:%i", s_dynamic.depth), 
;688://UI_SMALLFONT, color_white);
;689://UI_DrawString(0, 32, va("active: %i %i %i", 
;690://s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ),
;691://UI_SMALLFONT, color_white);
;692:
;693:Menu_Draw(&s_dynamic.menu);
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 694
;694:}
LABELV $492
endproc DynamicMenu_MenuDraw 0 4
proc DynamicMenu_IndexDepth 12 0
line 704
;695:
;696:
;697:
;698:/*
;699:=================
;700:DynamicMenu_IndexDepth
;701:=================
;702:*/
;703:static int DynamicMenu_IndexDepth( int pos )
;704:{
line 708
;705:int i;
;706:int maxdepth, depth;
;707:
;708:maxdepth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 709
;709:depth = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 710
;710:for (i = 0; i < maxdepth; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 711
;711:{
line 712
;712:if (pos < s_dynamic.end[i])
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
line 713
;713:{
line 714
;714:depth = i + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 715
;715:break;
ADDRGP4 $497
JUMPV
LABELV $499
line 717
;716:}
;717:}
LABELV $496
line 710
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
line 719
;718:
;719:return depth;
ADDRLP4 8
INDIRI4
RETI4
LABELV $493
endproc DynamicMenu_IndexDepth 12 0
proc DynamicMenu_SetFocus 24 8
line 730
;720:}
;721:
;722:
;723:
;724:/*
;725:=================
;726:DynamicMenu_SetFocus
;727:=================
;728:*/
;729:static void DynamicMenu_SetFocus( int pos )
;730:{
line 734
;731:int i;
;732:int depth, newdepth;
;733:
;734:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 735
;735:newdepth = DynamicMenu_IndexDepth(pos);
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
line 737
;736:
;737:if (newdepth == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $504
line 738
;738:{
line 739
;739:Com_Printf("SetFocus: index %i outside menu\n", pos);
ADDRGP4 $506
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 740
;740:return;
ADDRGP4 $502
JUMPV
LABELV $504
line 743
;741:}
;742:
;743:s_dynamic.active[ newdepth - 1 ] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 744
;744:s_dynamic.depth = newdepth;
ADDRGP4 s_dynamic+7020
ADDRLP4 8
INDIRI4
ASGNI4
line 747
;745:
;746:// hide any previous submenus
;747:if (newdepth < depth)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $510
line 748
;748:{
line 749
;749:for (i = s_dynamic.start[ newdepth ]; 
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
line 751
;750:i < s_dynamic.end[depth - 1]; i++)
;751:{
line 752
;752:s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
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
line 753
;753:s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
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
line 754
;754:}
LABELV $513
line 750
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
line 755
;755:}
LABELV $510
line 757
;756:
;757:s_dynamic.active[newdepth - 1] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 760
;758:
;759:// show this sub-menu (if needed)
;760:if (s_dynamic.data[pos].createSubMenu)
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
line 761
;761:s_dynamic.data[pos].createSubMenu();
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
line 762
;762:}
LABELV $502
endproc DynamicMenu_SetFocus 24 8
proc DynamicMenu_ClearFocus 0 0
line 771
;763:
;764:
;765:/*
;766:=================
;767:DynamicMenu_ClearFocus
;768:=================
;769:*/
;770:static void DynamicMenu_ClearFocus( int pos )
;771:{
line 772
;772:}
LABELV $531
endproc DynamicMenu_ClearFocus 0 0
proc DynamicMenu_ActivateControl 12 8
line 782
;773:
;774:
;775:
;776:/*
;777:=================
;778:DynamicMenu_ActivateControl
;779:=================
;780:*/
;781:static void DynamicMenu_ActivateControl( int pos )
;782:{
line 786
;783://int i;
;784:int depth;
;785:
;786:depth = DynamicMenu_IndexDepth(pos);
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
line 788
;787:
;788:if (depth == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $533
line 789
;789:{
line 790
;790:Com_Printf("ActivateControl: index %i outside menu\n", pos);
ADDRGP4 $535
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 791
;791:return;
ADDRGP4 $532
JUMPV
LABELV $533
line 795
;792:}
;793:
;794:// not at the deepest level, can't be a command
;795:if (depth < s_dynamic.depth)
ADDRLP4 0
INDIRI4
ADDRGP4 s_dynamic+7020
INDIRI4
GEI4 $536
line 796
;796:return;
ADDRGP4 $532
JUMPV
LABELV $536
line 798
;797:
;798:if (s_dynamic.data[pos].runEvent)
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
line 799
;799:s_dynamic.data[pos].runEvent(pos);
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
line 801
;800:else
;801:Com_Printf("ActivateControl: index %i has no event\n", pos);
ADDRGP4 $545
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $540
line 802
;802:}
LABELV $532
endproc DynamicMenu_ActivateControl 12 8
proc DynamicMenu_MenuEvent 8 4
line 813
;803:
;804:
;805:
;806:
;807:/*
;808:=================
;809:DynamicMenu_MenuEvent
;810:=================
;811:*/
;812:static void DynamicMenu_MenuEvent( void* self, int event )
;813:{
line 816
;814:menutext_s* t;
;815:
;816:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 818
;817:
;818:switch (event)
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
line 819
;819:{
LABELV $549
line 821
;820:case QM_GOTFOCUS:
;821:DynamicMenu_SetFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_SetFocus
CALLV
pop
line 822
;822:break;
ADDRGP4 $548
JUMPV
LABELV $550
line 824
;823:case QM_LOSTFOCUS:
;824:DynamicMenu_ClearFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ClearFocus
CALLV
pop
line 825
;825:break;
ADDRGP4 $548
JUMPV
LABELV $551
line 827
;826:case QM_ACTIVATED:
;827:DynamicMenu_ActivateControl(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ActivateControl
CALLV
pop
line 828
;828:break;
LABELV $547
LABELV $548
line 830
;829:}
;830:}
LABELV $546
endproc DynamicMenu_MenuEvent 8 4
proc DM_BuildItem 0 8
line 838
;831:
;832:
;833:/*
;834:=================
;835:Build
;836:=================
;837:*/
;838:static void DM_BuildItem( int xitem ) {
line 839
;839:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 842
;840:	
;841:	// Basic Turret
;842:	if (xitem == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $553
line 843
;843:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret\n" );
CNSTI4 2
ARGI4
ADDRGP4 $555
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 844
;844:	}
LABELV $553
line 847
;845:
;846:	// Shielded Turret
;847:	if (xitem == 1) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $556
line 848
;848:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret2\n" );
CNSTI4 2
ARGI4
ADDRGP4 $558
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 849
;849:	}
LABELV $556
line 852
;850:
;851:	// Cloaked Turret
;852:	if (xitem == 2) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $559
line 853
;853:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $561
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 854
;854:	}
LABELV $559
line 857
;855:
;856:	// Immobilizer
;857:	if (xitem == 3) {
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $562
line 858
;858:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawntd\n" );
CNSTI4 2
ARGI4
ADDRGP4 $564
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 859
;859:	}
LABELV $562
line 862
;860:
;861:	// Generator
;862:	if (xitem == 4) {
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $565
line 863
;863:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawngen\n" );
CNSTI4 2
ARGI4
ADDRGP4 $567
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 864
;864:	}
LABELV $565
line 867
;865:
;866:	// Master Controller
;867:	if (xitem == 5) {
ADDRFP4 0
INDIRI4
CNSTI4 5
NEI4 $568
line 868
;868:		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnmc\n" );
CNSTI4 2
ARGI4
ADDRGP4 $570
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 869
;869:	}
LABELV $568
line 871
;870:
;871:}
LABELV $552
endproc DM_BuildItem 0 8
proc DynamicMenu_Close 0 0
line 880
;872:
;873:
;874:/*
;875:=================
;876:DynamicMenu_Close
;877:=================
;878:*/
;879:static void DynamicMenu_Close( void )
;880:{
line 881
;881:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 882
;882:}
LABELV $571
endproc DynamicMenu_Close 0 0
proc DM_Close_Event 0 0
line 892
;883: 
;884:
;885:
;886:/*
;887:=================
;888:DM_Close_Event
;889:=================
;890:*/
;891:static void DM_Close_Event( int index )
;892:{
line 893
;893:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 894
;894:}
LABELV $572
endproc DM_Close_Event 0 0
proc DynamicMenu_VoteMenu 0 16
line 906
;895:
;896:
;897:// Shafe - Trep - Here is where the first Dynamic Menu Starts
;898:
;899:/*
;900:=================
;901:// My first Test menu
;902:DynamicMenu_VoteMenu
;903:=================
;904:*/
;905:static void DynamicMenu_VoteMenu( void )
;906:{
line 907
;907:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 910
;908:	// The Menu Items
;909:
;910:	DynamicMenu_AddItem("Kick", 0 , NULL, DM_Close_Event);
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
line 911
;911:	DynamicMenu_AddItem("Next Map", 0 , NULL, DM_Close_Event);
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
line 912
;912:	DynamicMenu_AddItem("Restart Map", 0 , NULL, DM_Close_Event);
ADDRGP4 $576
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
line 913
;913:	DynamicMenu_AddItem("Balance Teams", 0 , NULL, DM_Close_Event);
ADDRGP4 $577
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
line 914
;914:	DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
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
line 915
;915:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 916
;916:}
LABELV $573
endproc DynamicMenu_VoteMenu 0 16
proc DynamicMenu_InitPrimaryMenu 0 16
line 928
;917:
;918:
;919:
;920:
;921:// Shafe - Trep - Top Level Menu Last
;922:/*
;923:=================
;924:DynamicMenu_InitPrimaryMenu
;925:=================
;926:*/
;927:static void DynamicMenu_InitPrimaryMenu( void )
;928:{
line 929
;929:DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 931
;930:
;931:DynamicMenu_AddItem("Call Vote", 0, DynamicMenu_VoteMenu, NULL);
ADDRGP4 $580
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
line 932
;932:DynamicMenu_AddItem("Buy Equipment", 0 , NULL, DM_Close_Event);
ADDRGP4 $581
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
line 933
;933:DynamicMenu_AddItem("Crap!", 0, NULL, DM_Close_Event);
ADDRGP4 $582
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
line 934
;934:DynamicMenu_AddItem("Shit And Stuff!", 0, NULL, DM_Close_Event);
ADDRGP4 $583
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
line 935
;935:DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
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
line 937
;936:
;937:DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 938
;938:}
LABELV $579
endproc DynamicMenu_InitPrimaryMenu 0 16
proc DynamicMenu_BuildMenu 0 16
line 943
;939:
;940:
;941:
;942:static void DynamicMenu_BuildMenu( void )
;943:{
line 944
;944:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 958
;945:
;946:	//int	cts;
;947:	//cts = cgs.scores1 + cgs.scores2;
;948:	
;949:	//s_dynamic.gamemode = (int)trap_Cvar_VariableValue("g_GameMode");
;950:	
;951:	
;952:		/* Rules just for reference from g_cmds
;953:		if ((cts < 3) && (type == 1)) { iserror = 3; }  
;954:		if ((cts < 6) && (type == 2)) { iserror = 3; }  
;955:
;956:		*/
;957:	
;958:	DynamicMenu_AddItem("Turret", 0, NULL, DM_BuildItem);
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
line 959
;959:	DynamicMenu_AddItem("Sheilded Turret", 0 , NULL, DM_BuildItem);
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
line 960
;960:	DynamicMenu_AddItem("Cloaked Turret", 0, NULL, DM_BuildItem);
ADDRGP4 $587
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
line 964
;961:
;962://	if( cgs.g_GameMode == 3) 
;963://	{
;964:		DynamicMenu_AddItem("Immobilizer", 0, NULL, DM_BuildItem);
ADDRGP4 $588
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
line 965
;965:		DynamicMenu_AddItem("Generator", 0, NULL, DM_BuildItem);
ADDRGP4 $589
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
line 966
;966:		DynamicMenu_AddItem("Power Core", 0, NULL, DM_BuildItem);
ADDRGP4 $590
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
line 971
;967://	}
;968:	
;969:	//DynamicMenu_AddItem("Close", 0, NULL, DM_Close_Event);
;970:
;971:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 972
;972:}
LABELV $584
endproc DynamicMenu_BuildMenu 0 16
proc DynamicMenu_MenuInit 12 8
line 981
;973:
;974:
;975:/*
;976:=================
;977:DynamicMenu_MenuInit
;978:=================
;979:*/
;980:static void DynamicMenu_MenuInit( void )
;981:{
line 984
;982:int i;
;983:
;984:s_dynamic.menu.draw = DynamicMenu_MenuDraw;
ADDRGP4 s_dynamic+268
ADDRGP4 DynamicMenu_MenuDraw
ASGNP4
line 985
;985:s_dynamic.menu.fullscreen = qfalse;
ADDRGP4 s_dynamic+280
CNSTI4 0
ASGNI4
line 986
;986:s_dynamic.menu.wrapAround = qfalse;
ADDRGP4 s_dynamic+276
CNSTI4 0
ASGNI4
line 988
;987:
;988:for (i = 0; i < MAX_MENUITEMS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $595
line 989
;989:{
line 990
;990:s_dynamic.item[i].generic.type = MTYPE_PTEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288
ADDP4
CNSTI4 9
ASGNI4
line 991
;991:s_dynamic.item[i].generic.flags = QMF_INACTIVE
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+44
ADDP4
CNSTU4 53504
ASGNU4
line 993
;992:|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
;993:s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+56
ADDP4
ADDRGP4 DynamicMenu_MenuItemDraw
ASGNP4
line 994
;994:s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+48
ADDP4
ADDRGP4 DynamicMenu_MenuEvent
ASGNP4
line 995
;995:s_dynamic.item[i].generic.id = i;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 996
;996:s_dynamic.item[i].string = s_dynamic.data[i].text;
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
line 997
;997:s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+64
ADDP4
CNSTI4 2064
ASGNI4
line 998
;998:s_dynamic.item[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 1000
;999:
;1000:Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
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
line 1001
;1001:}
LABELV $596
line 988
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $595
line 1004
;1002:
;1003:// start up the menu system
;1004:s_dynamic.depth = 0;
ADDRGP4 s_dynamic+7020
CNSTI4 0
ASGNI4
line 1010
;1005:
;1006://Uncomment the next line if adding part II as well
;1007://DynamicMenu_InitMapItems();
;1008:
;1009://DynamicMenu_InitPrimaryMenu();
;1010:DynamicMenu_BuildMenu();
ADDRGP4 DynamicMenu_BuildMenu
CALLV
pop
line 1011
;1011:}
LABELV $591
endproc DynamicMenu_MenuInit 12 8
export UI_DynamicMenuCache
proc UI_DynamicMenuCache 0 0
line 1024
;1012:
;1013:
;1014:
;1015:
;1016:
;1017:
;1018:/*
;1019:=================
;1020:UI_DynamicMenuCache
;1021:=================
;1022:*/
;1023:void UI_DynamicMenuCache( void )
;1024:{
line 1025
;1025:}
LABELV $617
endproc UI_DynamicMenuCache 0 0
export UI_DynamicMenu
proc UI_DynamicMenu 4124 12
line 1036
;1026:
;1027:
;1028:
;1029:
;1030:/*
;1031:=================
;1032:UI_DynamicMenu
;1033:=================
;1034:*/
;1035:void UI_DynamicMenu( void )
;1036:{
line 1041
;1037:	uiClientState_t	cs;
;1038:	char			info[MAX_INFO_STRING];
;1039:	int				playerTeam;
;1040:
;1041:trap_GetClientState( &cs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 1042
;1042:trap_GetConfigString( CS_PLAYERS 
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
line 1044
;1043:+ cs.clientNum, info, MAX_INFO_STRING );
;1044:playerTeam = atoi(Info_ValueForKey(info, "t"));
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
line 1051
;1045:
;1046://Uncomment the next two code lines if adding part II 
;1047://as well, or specs can't use the menu either
;1048://if (playerTeam == TEAM_SPECTATOR)
;1049://return;
;1050:
;1051:memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));
ADDRGP4 s_dynamic
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7028
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1053
;1052:
;1053:s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");
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
line 1060
;1054:
;1055://Uncomment the next three lines if adding part II as well
;1056://if (s_dynamic.gametype != GT_TEAM && 
;1057://s_dynamic.gametype != GT_CTF)
;1058://return;
;1059:
;1060:UI_DynamicMenuCache();
ADDRGP4 UI_DynamicMenuCache
CALLV
pop
line 1063
;1061:
;1062:// force as top level menu
;1063:uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1066
;1064:
;1065:// set menu cursor to a nice location
;1066:uis.cursorx = 50;
ADDRGP4 uis+8
CNSTI4 50
ASGNI4
line 1067
;1067:uis.cursory = 240;
ADDRGP4 uis+12
CNSTI4 240
ASGNI4
line 1069
;1068:
;1069:DynamicMenu_MenuInit();
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 1071
;1070:
;1071:UI_PushMenu( &s_dynamic.menu );
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1072
;1072:}
LABELV $618
endproc UI_DynamicMenu 4124 12
export UI_DynamicCommandMenu_f
proc UI_DynamicCommandMenu_f 0 0
line 1082
;1073:
;1074:
;1075:
;1076:/*
;1077:=================
;1078:UI_DynamicCommandMenu_f
;1079:=================
;1080:*/
;1081:void UI_DynamicCommandMenu_f( void )
;1082:{
line 1083
;1083:UI_DynamicMenu();
ADDRGP4 UI_DynamicMenu
CALLV
pop
line 1084
;1084:}
LABELV $624
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
import UI_VoipOptionsMenu
import UI_VoipOptionsMenu_Cache
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
import UI_OfflineMenu
import UI_OfflineMenu_Cache
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicCommandMenu
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
LABELV $590
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 67
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $589
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
LABELV $588
byte 1 73
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $587
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
LABELV $586
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
LABELV $585
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
LABELV $582
byte 1 67
byte 1 114
byte 1 97
byte 1 112
byte 1 33
byte 1 0
align 1
LABELV $581
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
LABELV $580
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
LABELV $578
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $577
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
LABELV $576
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
LABELV $575
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
LABELV $574
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $570
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
LABELV $567
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
LABELV $564
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 100
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
byte 1 120
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
