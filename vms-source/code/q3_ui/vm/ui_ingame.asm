code
proc InGame_RestartAction 0 8
file "../ui_ingame.c"
line 103
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
;29:
;30:
;31:typedef struct {
;32:	menuframework_s	menu;
;33:
;34:	menubitmap_s	frame;
;35:	menutext_s		team;
;36:	menutext_s		setup;
;37:	menutext_s		server;
;38:	menutext_s		leave;
;39:	menutext_s		restart;
;40:	menutext_s		addbots;
;41:	menutext_s		removebots;
;42:	menutext_s		teamorders;
;43:	menutext_s		quit;
;44:	menutext_s		resume;
;45:} ingamemenu_t;
;46:
;47:static ingamemenu_t	s_ingame;
;48:
;49:
;50:
;51:
;52:// Shafe - Dynamic Menu SYstem
;53:/*
;54:===========================
;55:
;56:INGAME DYNAMIC COMMAND MENU
;57:
;58:===========================
;59:*/
;60:
;61:
;62:#define MAX_DYNAMICDEPTH	6
;63:#define MAX_MENUSTRING		16
;64:
;65:#define MENUSPACE_X			4
;66:#define MENUSPACE_Y			1
;67:
;68:
;69:typedef void (*createHandler)(void);
;70:typedef void (*eventHandler)(int index);
;71:
;72:
;73:typedef struct {
;74:	char text[MAX_MENUSTRING];
;75:	int index;
;76:	int id;
;77:	createHandler createSubMenu;
;78:	eventHandler runEvent;
;79:} dynamicitem_t;
;80:
;81:
;82:typedef struct {
;83:	menuframework_s menu;
;84:
;85:	menutext_s item[MAX_MENUITEMS];
;86:	dynamicitem_t data[MAX_MENUITEMS];
;87:
;88:	int start[MAX_DYNAMICDEPTH];
;89:	int end[MAX_DYNAMICDEPTH];// indicates to (last item + 1)
;90:	int active[MAX_DYNAMICDEPTH];
;91:	int gametype;
;92:	int depth;
;93:} dynamicmenu_t;
;94:
;95:static dynamicmenu_t s_dynamic;
;96:
;97:
;98:/*
;99:=================
;100:InGame_RestartAction
;101:=================
;102:*/
;103:static void InGame_RestartAction( qboolean result ) {
line 104
;104:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $73
line 105
;105:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 108
;106:	}
;107:
;108:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 109
;109:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 110
;110:}
LABELV $72
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 0
line 118
;111:
;112:
;113:/*
;114:=================
;115:InGame_QuitAction
;116:=================
;117:*/
;118:static void InGame_QuitAction( qboolean result ) {
line 119
;119:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $77
line 120
;120:		return;
ADDRGP4 $76
JUMPV
LABELV $77
line 122
;121:	}
;122:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 123
;123:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 124
;124:}
LABELV $76
endproc InGame_QuitAction 0 0
export InGame_Event
proc InGame_Event 8 12
line 132
;125:
;126:
;127:/*
;128:=================
;129:InGame_Event
;130:=================
;131:*/
;132:void InGame_Event( void *ptr, int notification ) {
line 133
;133:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 134
;134:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 137
;135:	}
;136:
;137:	switch( ((menucommon_s*)ptr)->id ) {
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
CNSTI4 19
GTI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $98-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $98
address $85
address $94
address $95
address $86
address $93
address $87
address $89
address $91
address $97
address $96
code
LABELV $85
line 139
;138:	case ID_TEAM:
;139:		UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 140
;140:		break;
ADDRGP4 $83
JUMPV
LABELV $86
line 143
;141:
;142:	case ID_SETUP:
;143:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 144
;144:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 147
;145:
;146:	case ID_LEAVEARENA:
;147:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 148
;148:		break;
ADDRGP4 $83
JUMPV
LABELV $89
line 151
;149:
;150:	case ID_RESTART:
;151:		UI_ConfirmMenu( "RESTART ARENA?", (voidfunc_f)NULL, InGame_RestartAction );
ADDRGP4 $90
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 152
;152:		break;
ADDRGP4 $83
JUMPV
LABELV $91
line 155
;153:
;154:	case ID_QUIT:
;155:		UI_ConfirmMenu( "EXIT GAME?",  (voidfunc_f)NULL, InGame_QuitAction );
ADDRGP4 $92
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 156
;156:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 159
;157:
;158:	case ID_SERVERINFO:
;159:		UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 160
;160:		break;
ADDRGP4 $83
JUMPV
LABELV $94
line 163
;161:
;162:	case ID_ADDBOTS:
;163:		UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 164
;164:		break;
ADDRGP4 $83
JUMPV
LABELV $95
line 167
;165:
;166:	case ID_REMOVEBOTS:
;167:		UI_RemoveBotsMenu();
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 168
;168:		break;
ADDRGP4 $83
JUMPV
LABELV $96
line 171
;169:
;170:	case ID_TEAMORDERS:
;171:		UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 172
;172:		break;
ADDRGP4 $83
JUMPV
LABELV $97
line 175
;173:
;174:	case ID_RESUME:
;175:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 176
;176:		break;
LABELV $82
LABELV $83
line 178
;177:	}
;178:}
LABELV $79
endproc InGame_Event 8 12
export InGame_MenuInit
proc InGame_MenuInit 4156 12
line 186
;179:
;180:
;181:/*
;182:=================
;183:InGame_MenuInit
;184:=================
;185:*/
;186:void InGame_MenuInit( void ) {
line 192
;187:	int		y;
;188:	uiClientState_t	cs;
;189:	char	info[MAX_INFO_STRING];
;190:	int		team;
;191:
;192:	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 194
;193:
;194:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 196
;195:
;196:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+276
CNSTI4 1
ASGNI4
line 197
;197:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+280
CNSTI4 0
ASGNI4
line 199
;198:
;199:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+288
CNSTI4 6
ASGNI4
line 200
;200:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+288+44
CNSTU4 16384
ASGNU4
line 201
;201:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+288+4
ADDRGP4 $108
ASGNP4
line 202
;202:	s_ingame.frame.generic.x			= 320-233;//142;
ADDRGP4 s_ingame+288+12
CNSTI4 87
ASGNI4
line 203
;203:	s_ingame.frame.generic.y			= 240-166;//118;
ADDRGP4 s_ingame+288+16
CNSTI4 74
ASGNI4
line 204
;204:	s_ingame.frame.width				= 466;//359;
ADDRGP4 s_ingame+288+76
CNSTI4 466
ASGNI4
line 205
;205:	s_ingame.frame.height				= 332;//256;
ADDRGP4 s_ingame+288+80
CNSTI4 332
ASGNI4
line 208
;206:
;207:	//y = 96;
;208:	y = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 209
;209:	s_ingame.team.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+376
CNSTI4 9
ASGNI4
line 210
;210:	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+376+44
CNSTU4 264
ASGNU4
line 211
;211:	s_ingame.team.generic.x				= 320;
ADDRGP4 s_ingame+376+12
CNSTI4 320
ASGNI4
line 212
;212:	s_ingame.team.generic.y				= y;
ADDRGP4 s_ingame+376+16
ADDRLP4 0
INDIRI4
ASGNI4
line 213
;213:	s_ingame.team.generic.id			= ID_TEAM;
ADDRGP4 s_ingame+376+8
CNSTI4 10
ASGNI4
line 214
;214:	s_ingame.team.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+376+48
ADDRGP4 InGame_Event
ASGNP4
line 215
;215:	s_ingame.team.string				= "START";
ADDRGP4 s_ingame+376+60
ADDRGP4 $130
ASGNP4
line 216
;216:	s_ingame.team.color					= color_red;
ADDRGP4 s_ingame+376+68
ADDRGP4 color_red
ASGNP4
line 217
;217:	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+376+64
CNSTI4 17
ASGNI4
line 219
;218:
;219:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 220
;220:	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+736
CNSTI4 9
ASGNI4
line 221
;221:	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+736+44
CNSTU4 264
ASGNU4
line 222
;222:	s_ingame.addbots.generic.x			= 320;
ADDRGP4 s_ingame+736+12
CNSTI4 320
ASGNI4
line 223
;223:	s_ingame.addbots.generic.y			= y;
ADDRGP4 s_ingame+736+16
ADDRLP4 0
INDIRI4
ASGNI4
line 224
;224:	s_ingame.addbots.generic.id			= ID_ADDBOTS;
ADDRGP4 s_ingame+736+8
CNSTI4 11
ASGNI4
line 225
;225:	s_ingame.addbots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+736+48
ADDRGP4 InGame_Event
ASGNP4
line 226
;226:	s_ingame.addbots.string				= "ADD BOTS";
ADDRGP4 s_ingame+736+60
ADDRGP4 $148
ASGNP4
line 227
;227:	s_ingame.addbots.color				= color_red;
ADDRGP4 s_ingame+736+68
ADDRGP4 color_red
ASGNP4
line 228
;228:	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+736+64
CNSTI4 17
ASGNI4
line 229
;229:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
ADDRGP4 $155
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
EQF4 $159
ADDRGP4 $156
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4120
INDIRF4
CNSTF4 0
EQF4 $159
ADDRGP4 $157
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 1073741824
NEF4 $153
LABELV $159
line 230
;230:		s_ingame.addbots.generic.flags |= QMF_GRAYED;
ADDRLP4 4128
ADDRGP4 s_ingame+736+44
ASGNP4
ADDRLP4 4128
INDIRP4
ADDRLP4 4128
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 231
;231:	}
LABELV $153
line 233
;232:
;233:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 234
;234:	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+808
CNSTI4 9
ASGNI4
line 235
;235:	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+808+44
CNSTU4 264
ASGNU4
line 236
;236:	s_ingame.removebots.generic.x			= 320;
ADDRGP4 s_ingame+808+12
CNSTI4 320
ASGNI4
line 237
;237:	s_ingame.removebots.generic.y			= y;
ADDRGP4 s_ingame+808+16
ADDRLP4 0
INDIRI4
ASGNI4
line 238
;238:	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
ADDRGP4 s_ingame+808+8
CNSTI4 12
ASGNI4
line 239
;239:	s_ingame.removebots.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+808+48
ADDRGP4 InGame_Event
ASGNP4
line 240
;240:	s_ingame.removebots.string				= "REMOVE BOTS";
ADDRGP4 s_ingame+808+60
ADDRGP4 $175
ASGNP4
line 241
;241:	s_ingame.removebots.color				= color_red;
ADDRGP4 s_ingame+808+68
ADDRGP4 color_red
ASGNP4
line 242
;242:	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+808+64
CNSTI4 17
ASGNI4
line 243
;243:	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
ADDRGP4 $155
ARGP4
ADDRLP4 4128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4128
INDIRF4
CNSTF4 0
EQF4 $183
ADDRGP4 $156
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4132
INDIRF4
CNSTF4 0
EQF4 $183
ADDRGP4 $157
ARGP4
ADDRLP4 4136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4136
INDIRF4
CNSTF4 1073741824
NEF4 $180
LABELV $183
line 244
;244:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
ADDRLP4 4140
ADDRGP4 s_ingame+808+44
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 4140
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 245
;245:	}
LABELV $180
line 247
;246:
;247:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 248
;248:	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+880
CNSTI4 9
ASGNI4
line 249
;249:	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+880+44
CNSTU4 264
ASGNU4
line 250
;250:	s_ingame.teamorders.generic.x			= 320;
ADDRGP4 s_ingame+880+12
CNSTI4 320
ASGNI4
line 251
;251:	s_ingame.teamorders.generic.y			= y;
ADDRGP4 s_ingame+880+16
ADDRLP4 0
INDIRI4
ASGNI4
line 252
;252:	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
ADDRGP4 s_ingame+880+8
CNSTI4 19
ASGNI4
line 253
;253:	s_ingame.teamorders.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+880+48
ADDRGP4 InGame_Event
ASGNP4
line 254
;254:	s_ingame.teamorders.string				= "TEAM ORDERS";
ADDRGP4 s_ingame+880+60
ADDRGP4 $199
ASGNP4
line 255
;255:	s_ingame.teamorders.color				= color_red;
ADDRGP4 s_ingame+880+68
ADDRGP4 color_red
ASGNP4
line 256
;256:	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+880+64
CNSTI4 17
ASGNI4
line 257
;257:	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) ) {
ADDRGP4 $157
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4140
INDIRF4
CNSTF4 1077936128
GEF4 $204
line 258
;258:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4144
ADDRGP4 s_ingame+880+44
ASGNP4
ADDRLP4 4144
INDIRP4
ADDRLP4 4144
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 259
;259:	}
ADDRGP4 $205
JUMPV
LABELV $204
line 260
;260:	else {
line 261
;261:		trap_GetClientState( &cs );
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 262
;262:		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
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
line 263
;263:		team = atoi( Info_ValueForKey( info, "t" ) );
ADDRLP4 3088
ARGP4
ADDRGP4 $209
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4112
ADDRLP4 4148
INDIRI4
ASGNI4
line 264
;264:		if( team == TEAM_SPECTATOR ) {
ADDRLP4 4112
INDIRI4
CNSTI4 3
NEI4 $210
line 265
;265:			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4152
ADDRGP4 s_ingame+880+44
ASGNP4
ADDRLP4 4152
INDIRP4
ADDRLP4 4152
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 266
;266:		}
LABELV $210
line 267
;267:	}
LABELV $205
line 269
;268:
;269:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 270
;270:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+448
CNSTI4 9
ASGNI4
line 271
;271:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+448+44
CNSTU4 264
ASGNU4
line 272
;272:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+448+12
CNSTI4 320
ASGNI4
line 273
;273:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+448+16
ADDRLP4 0
INDIRI4
ASGNI4
line 274
;274:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+448+8
CNSTI4 13
ASGNI4
line 275
;275:	s_ingame.setup.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+448+48
ADDRGP4 InGame_Event
ASGNP4
line 276
;276:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+448+60
ADDRGP4 $227
ASGNP4
line 277
;277:	s_ingame.setup.color				= color_red;
ADDRGP4 s_ingame+448+68
ADDRGP4 color_red
ASGNP4
line 278
;278:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+448+64
CNSTI4 17
ASGNI4
line 280
;279:
;280:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 281
;281:	s_ingame.server.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+520
CNSTI4 9
ASGNI4
line 282
;282:	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+520+44
CNSTU4 264
ASGNU4
line 283
;283:	s_ingame.server.generic.x			= 320;
ADDRGP4 s_ingame+520+12
CNSTI4 320
ASGNI4
line 284
;284:	s_ingame.server.generic.y			= y;
ADDRGP4 s_ingame+520+16
ADDRLP4 0
INDIRI4
ASGNI4
line 285
;285:	s_ingame.server.generic.id			= ID_SERVERINFO;
ADDRGP4 s_ingame+520+8
CNSTI4 14
ASGNI4
line 286
;286:	s_ingame.server.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+520+48
ADDRGP4 InGame_Event
ASGNP4
line 287
;287:	s_ingame.server.string				= "SERVER INFO";
ADDRGP4 s_ingame+520+60
ADDRGP4 $245
ASGNP4
line 288
;288:	s_ingame.server.color				= color_red;
ADDRGP4 s_ingame+520+68
ADDRGP4 color_red
ASGNP4
line 289
;289:	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+520+64
CNSTI4 17
ASGNI4
line 291
;290:
;291:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 292
;292:	s_ingame.restart.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+664
CNSTI4 9
ASGNI4
line 293
;293:	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+664+44
CNSTU4 264
ASGNU4
line 294
;294:	s_ingame.restart.generic.x			= 320;
ADDRGP4 s_ingame+664+12
CNSTI4 320
ASGNI4
line 295
;295:	s_ingame.restart.generic.y			= y;
ADDRGP4 s_ingame+664+16
ADDRLP4 0
INDIRI4
ASGNI4
line 296
;296:	s_ingame.restart.generic.id			= ID_RESTART;
ADDRGP4 s_ingame+664+8
CNSTI4 16
ASGNI4
line 297
;297:	s_ingame.restart.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+664+48
ADDRGP4 InGame_Event
ASGNP4
line 298
;298:	s_ingame.restart.string				= "RESTART MAP"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+664+60
ADDRGP4 $263
ASGNP4
line 299
;299:	s_ingame.restart.color				= color_red;
ADDRGP4 s_ingame+664+68
ADDRGP4 color_red
ASGNP4
line 300
;300:	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+664+64
CNSTI4 17
ASGNI4
line 301
;301:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $155
ARGP4
ADDRLP4 4144
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4144
INDIRF4
CNSTF4 0
NEF4 $268
line 302
;302:		s_ingame.restart.generic.flags |= QMF_GRAYED;
ADDRLP4 4148
ADDRGP4 s_ingame+664+44
ASGNP4
ADDRLP4 4148
INDIRP4
ADDRLP4 4148
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 303
;303:	}
LABELV $268
line 305
;304:
;305:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 306
;306:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+1024
CNSTI4 9
ASGNI4
line 307
;307:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1024+44
CNSTU4 264
ASGNU4
line 308
;308:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+1024+12
CNSTI4 320
ASGNI4
line 309
;309:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+1024+16
ADDRLP4 0
INDIRI4
ASGNI4
line 310
;310:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+1024+8
CNSTI4 18
ASGNI4
line 311
;311:	s_ingame.resume.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+1024+48
ADDRGP4 InGame_Event
ASGNP4
line 312
;312:	s_ingame.resume.string					= "RESUME GAME";
ADDRGP4 s_ingame+1024+60
ADDRGP4 $285
ASGNP4
line 313
;313:	s_ingame.resume.color					= color_red;
ADDRGP4 s_ingame+1024+68
ADDRGP4 color_red
ASGNP4
line 314
;314:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+1024+64
CNSTI4 17
ASGNI4
line 316
;315:
;316:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 317
;317:	s_ingame.leave.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+592
CNSTI4 9
ASGNI4
line 318
;318:	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+592+44
CNSTU4 264
ASGNU4
line 319
;319:	s_ingame.leave.generic.x			= 320;
ADDRGP4 s_ingame+592+12
CNSTI4 320
ASGNI4
line 320
;320:	s_ingame.leave.generic.y			= y;
ADDRGP4 s_ingame+592+16
ADDRLP4 0
INDIRI4
ASGNI4
line 321
;321:	s_ingame.leave.generic.id			= ID_LEAVEARENA;
ADDRGP4 s_ingame+592+8
CNSTI4 15
ASGNI4
line 322
;322:	s_ingame.leave.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+592+48
ADDRGP4 InGame_Event
ASGNP4
line 323
;323:	s_ingame.leave.string				= "MAIN MENU"; // Shafe - Trep Minor Text Change
ADDRGP4 s_ingame+592+60
ADDRGP4 $303
ASGNP4
line 324
;324:	s_ingame.leave.color				= color_red;
ADDRGP4 s_ingame+592+68
ADDRGP4 color_red
ASGNP4
line 325
;325:	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+592+64
CNSTI4 17
ASGNI4
line 327
;326:
;327:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 328
;328:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+952
CNSTI4 9
ASGNI4
line 329
;329:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+952+44
CNSTU4 264
ASGNU4
line 330
;330:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+952+12
CNSTI4 320
ASGNI4
line 331
;331:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 332
;332:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+952+8
CNSTI4 17
ASGNI4
line 333
;333:	s_ingame.quit.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+952+48
ADDRGP4 InGame_Event
ASGNP4
line 334
;334:	s_ingame.quit.string				= "EXIT TREPIDATION"; // Shafe - Trep - Minor Text Change
ADDRGP4 s_ingame+952+60
ADDRGP4 $321
ASGNP4
line 335
;335:	s_ingame.quit.color					= color_red;
ADDRGP4 s_ingame+952+68
ADDRGP4 color_red
ASGNP4
line 336
;336:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+952+64
CNSTI4 17
ASGNI4
line 338
;337:
;338:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 339
;339:	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 340
;340:	Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+736
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 341
;341:	Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 342
;342:	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+880
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 343
;343:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 344
;344:	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 345
;345:	Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 346
;346:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 347
;347:	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 348
;348:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 349
;349:}
LABELV $100
endproc InGame_MenuInit 4156 12
export InGame_Cache
proc InGame_Cache 0 4
line 357
;350:
;351:
;352:/*
;353:=================
;354:InGame_Cache
;355:=================
;356:*/
;357:void InGame_Cache( void ) {
line 358
;358:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $108
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 359
;359:}
LABELV $337
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 367
;360:
;361:
;362:/*
;363:=================
;364:UI_InGameMenu
;365:=================
;366:*/
;367:void UI_InGameMenu( void ) {
line 369
;368:	// force as top level menu
;369:	uis.menusp = 0;  
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 372
;370:
;371:	// set menu cursor to a nice location
;372:	uis.cursorx = 319;
ADDRGP4 uis+8
CNSTI4 319
ASGNI4
line 373
;373:	uis.cursory = 80;
ADDRGP4 uis+12
CNSTI4 80
ASGNI4
line 375
;374:
;375:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 376
;376:	UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 377
;377:}
LABELV $338
endproc UI_InGameMenu 0 4
proc DynamicMenu_SubMenuInit 8 0
line 397
;378:
;379:
;380:
;381:// Shafe - Trep --- Menu System
;382:// EVERYTHING BELOW IS ADDED BY SHAFE.. INGAME DYNAMIC MENUS  /////////////////////////////////////
;383:// Heh.. Cut and Paste didnt preserve whitespace... bleh.. 
;384:// Fix that later
;385:
;386://
;387:
;388:
;389:
;390:
;391:/*
;392:=================
;393:DynamicMenu_InitSubMenu
;394:=================
;395:*/
;396:static qboolean DynamicMenu_SubMenuInit( void)
;397:{
line 400
;398:int pos;
;399:
;400:if (s_dynamic.depth == MAX_DYNAMICDEPTH)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 6
NEI4 $343
line 401
;401:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $342
JUMPV
LABELV $343
line 403
;402:
;403:if (s_dynamic.depth == 0)
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 0
NEI4 $346
line 404
;404:pos = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $346
line 406
;405:else
;406:pos = s_dynamic.end[s_dynamic.depth - 1];
ADDRLP4 0
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
INDIRI4
ASGNI4
LABELV $347
line 408
;407:
;408:if (pos == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $352
line 409
;409:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $342
JUMPV
LABELV $352
line 411
;410:
;411:s_dynamic.depth++;
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
line 412
;412:s_dynamic.active[s_dynamic.depth - 1] = -1;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
CNSTI4 -1
ASGNI4
line 413
;413:s_dynamic.start[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 414
;414:s_dynamic.end[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 416
;415:
;416:return qtrue;
CNSTI4 1
RETI4
LABELV $342
endproc DynamicMenu_SubMenuInit 8 0
proc DynamicMenu_AddItem 24 12
line 427
;417:}
;418:
;419:
;420:/*
;421:=================
;422:DynamicMenu_AddItem
;423:=================
;424:*/
;425:static qboolean DynamicMenu_AddItem( const char* string, 
;426:int id, createHandler crh, eventHandler evh)
;427:{
line 430
;428:int index, depth;
;429:
;430:depth = s_dynamic.depth - 1;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 431
;431:index = s_dynamic.end[depth];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
ASGNI4
line 433
;432:
;433:if (index == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $367
line 434
;434:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $367
line 437
;435:
;436:// can't have submenu and event attached to menu item
;437:if (crh && evh)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $369
ADDRFP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $369
line 438
;438:return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $364
JUMPV
LABELV $369
line 440
;439:
;440:if (!string || !string[0])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $373
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $371
LABELV $373
line 441
;441:string = "[no text]";
ADDRFP4 0
ADDRGP4 $374
ASGNP4
LABELV $371
line 443
;442:
;443:s_dynamic.data[index].index = index;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 444
;444:s_dynamic.data[index].id = id;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 445
;445:s_dynamic.data[index].createSubMenu = crh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 446
;446:s_dynamic.data[index].runEvent = evh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 447
;447:Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);
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
line 449
;448:
;449:s_dynamic.end[depth]++;
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
line 451
;450:
;451:return qtrue;
CNSTI4 1
RETI4
LABELV $364
endproc DynamicMenu_AddItem 24 12
proc DynamicMenu_FinishSubMenuInit 68 4
line 461
;452:}
;453:
;454:
;455:/*
;456:=================
;457:DynamicMenu_FinishInitSubMenu
;458:=================
;459:*/
;460:static void DynamicMenu_FinishSubMenuInit( void )
;461:{
line 472
;462:	int depth;
;463:	int width, maxwidth;
;464:	int height, lineheight;
;465:	int posx, posy;
;466:	int i, count, start, active;
;467:	float scale;
;468:	menutext_s*	ptr;
;469:	qboolean	submenu;
;470:
;471:
;472:depth = s_dynamic.depth - 1;
ADDRLP4 40
ADDRGP4 s_dynamic+7020
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 475
;473:
;474:// find the widest item
;475:submenu = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 476
;476:maxwidth = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 477
;477:start = s_dynamic.start[depth];
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944
ADDP4
INDIRI4
ASGNI4
line 478
;478:count = s_dynamic.end[depth] - start;
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
line 479
;479:for ( i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 480
;480:{
line 481
;481:width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
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
line 482
;482:if (width > maxwidth)
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $394
line 483
;483:maxwidth = width;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $394
line 485
;484:
;485:if (s_dynamic.data[i + start].createSubMenu)
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
EQU4 $396
line 486
;486:submenu = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $396
line 487
;487:}
LABELV $390
line 479
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $389
line 489
;488:
;489:scale = UI_ProportionalSizeScale(UI_SMALLFONT);
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
line 490
;490:if (submenu)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $400
line 491
;491:{
line 493
;492:// space and submenu pointer
;493:maxwidth += UI_ProportionalStringWidth(" \r");
ADDRGP4 $402
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
line 494
;494:}
LABELV $400
line 496
;495:
;496:maxwidth *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 499
;497:
;498:// determine the position of the menu
;499:lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
ADDRLP4 8
CNSTF4 1104674816
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 500
;500:height = count * lineheight;
ADDRLP4 48
ADDRLP4 32
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
line 502
;501:
;502:if (depth == 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $403
line 503
;503:{
line 504
;504:posy = 240 - height/2;
ADDRLP4 16
CNSTI4 240
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 505
;505:posx = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 506
;506:}
ADDRGP4 $404
JUMPV
LABELV $403
line 508
;507:else
;508:{
line 509
;509:active = s_dynamic.active[depth - 1];
ADDRLP4 52
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
INDIRI4
ASGNI4
line 510
;510:posx = s_dynamic.item[active].generic.right;
ADDRLP4 20
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+28
ADDP4
INDIRI4
ASGNI4
line 511
;511:posy = s_dynamic.item[active].generic.top;
ADDRLP4 16
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+24
ADDP4
INDIRI4
ASGNI4
line 513
;512:
;513:if (posy + height > 480 - 64)
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 416
LEI4 $411
line 514
;514:posy = 480 - 64 - height;
ADDRLP4 16
CNSTI4 416
ADDRLP4 48
INDIRI4
SUBI4
ASGNI4
LABELV $411
line 515
;515:}
LABELV $404
line 517
;516:
;517:for (i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $413
line 518
;518:{
line 519
;519:ptr = &s_dynamic.item[start + i];
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
line 521
;520:
;521:ptr->generic.x = posx + MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 522
;522:ptr->generic.y = posy + i*lineheight + MENUSPACE_Y;
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
line 524
;523:
;524:ptr->generic.left = posx;
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 525
;525:ptr->generic.right = posx + maxwidth + 2*MENUSPACE_X;
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
line 526
;526:ptr->generic.top = posy + i*lineheight;
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
line 527
;527:ptr->generic.bottom = posy + (i+1)*lineheight - 1;
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
line 529
;528:
;529:ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
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
line 530
;530:}
LABELV $414
line 517
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $416
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $413
line 531
;531:}
LABELV $385
endproc DynamicMenu_FinishSubMenuInit 68 4
proc DynamicMenu_OnActiveList 8 0
line 540
;532:
;533: 
;534:/*
;535:=================
;536:DynamicMenu_OnActiveList
;537:=================
;538:*/
;539:static qboolean DynamicMenu_OnActiveList( int index )
;540:{
line 544
;541:int depth;
;542:int i;
;543:
;544:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 546
;545:
;546:for ( i = 0; i < depth ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $423
JUMPV
LABELV $420
line 547
;547:if (s_dynamic.active[i] == index)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $424
line 548
;548:return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $418
JUMPV
LABELV $424
LABELV $421
line 546
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $423
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $420
line 550
;549:
;550:return qfalse;
CNSTI4 0
RETI4
LABELV $418
endproc DynamicMenu_OnActiveList 8 0
proc DynamicMenu_MenuItemDraw 56 20
line 562
;551:}
;552:
;553:
;554:
;555:
;556:/*
;557:=================
;558:DynamicMenu_MenuItemDraw
;559:=================
;560:*/
;561:static void DynamicMenu_MenuItemDraw( void* self )
;562:{
line 572
;563:int	x;
;564:int	y;
;565:
;566:int	w,h;
;567:float *color;
;568:int	style;
;569:menutext_s*	t;
;570:vec4_t	back_color;
;571:
;572:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 576
;573:
;574:
;575:// draw the background;
;576:x = t->generic.left;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 577
;577:y = t->generic.top;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 578
;578:w = t->generic.right - x;
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
line 579
;579:h = t->generic.bottom - y;
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
line 581
;580:
;581:back_color[0] = 1.0;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 582
;582:back_color[1] = 1.0;
ADDRLP4 12+4
CNSTF4 1065353216
ASGNF4
line 583
;583:back_color[2] = 1.0;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 584
;584:if (DynamicMenu_OnActiveList(t->generic.id))
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
EQI4 $430
line 585
;585:{
line 586
;586:		back_color[3] = 0.33;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 587
;587:	}
ADDRGP4 $431
JUMPV
LABELV $430
line 589
;588:	else
;589:	{
line 590
;590:		back_color[3] = 0.1;
ADDRLP4 12+12
CNSTF4 1036831949
ASGNF4
line 591
;591:	}
LABELV $431
line 593
;592:
;593:UI_FillRect(x, y, w, h, back_color);
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
line 596
;594:
;595:// draw the text
;596:x = t->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 597
;597:y = t->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 599
;598:
;599:if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $434
line 600
;600:color = text_color_disabled;
ADDRLP4 36
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $435
JUMPV
LABELV $434
line 602
;601:else
;602:color = t->color;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $435
line 604
;603:
;604:style = t->style;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 605
;605:if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $436
line 606
;606:if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
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
NEU4 $438
line 607
;607:style |= UI_PULSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 608
;608:}
ADDRGP4 $439
JUMPV
LABELV $438
line 609
;609:else {
line 610
;610:style |= UI_INVERSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 611
;611:}
LABELV $439
line 612
;612:}
LABELV $436
line 614
;613:
;614:UI_DrawProportionalString( x, y, t->string, style, color );
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
line 617
;615:
;616:// draw the cursor for submenu if needed
;617:x = t->generic.left + w;
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
line 618
;618:if (s_dynamic.data[ t->generic.id ].createSubMenu)
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
EQU4 $440
line 619
;619:{
line 620
;620:UI_DrawChar( x, y, 13, style|UI_RIGHT, color);
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
line 621
;621:}
LABELV $440
line 622
;622:}
LABELV $427
endproc DynamicMenu_MenuItemDraw 56 20
proc DynamicMenu_MenuDraw 0 4
line 633
;623:
;624:
;625:
;626:
;627:/*
;628:=================
;629:DynamicMenu_MenuDraw
;630:=================
;631:*/
;632:static void DynamicMenu_MenuDraw( void )
;633:{
line 640
;634://UI_DrawString(0, 0, va("depth:%i", s_dynamic.depth), 
;635://UI_SMALLFONT, color_white);
;636://UI_DrawString(0, 32, va("active: %i %i %i", 
;637://s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ),
;638://UI_SMALLFONT, color_white);
;639:
;640:Menu_Draw(&s_dynamic.menu);
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 641
;641:}
LABELV $444
endproc DynamicMenu_MenuDraw 0 4
proc DynamicMenu_IndexDepth 12 0
line 651
;642:
;643:
;644:
;645:/*
;646:=================
;647:DynamicMenu_IndexDepth
;648:=================
;649:*/
;650:static int DynamicMenu_IndexDepth( int pos )
;651:{
line 655
;652:int i;
;653:int maxdepth, depth;
;654:
;655:maxdepth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 656
;656:depth = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 657
;657:for (i = 0; i < maxdepth; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $450
JUMPV
LABELV $447
line 658
;658:{
line 659
;659:if (pos < s_dynamic.end[i])
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968
ADDP4
INDIRI4
GEI4 $451
line 660
;660:{
line 661
;661:depth = i + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 662
;662:break;
ADDRGP4 $449
JUMPV
LABELV $451
line 664
;663:}
;664:}
LABELV $448
line 657
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $450
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $447
LABELV $449
line 666
;665:
;666:return depth;
ADDRLP4 8
INDIRI4
RETI4
LABELV $445
endproc DynamicMenu_IndexDepth 12 0
proc DynamicMenu_SetFocus 24 8
line 677
;667:}
;668:
;669:
;670:
;671:/*
;672:=================
;673:DynamicMenu_SetFocus
;674:=================
;675:*/
;676:static void DynamicMenu_SetFocus( int pos )
;677:{
line 681
;678:int i;
;679:int depth, newdepth;
;680:
;681:depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7020
INDIRI4
ASGNI4
line 682
;682:newdepth = DynamicMenu_IndexDepth(pos);
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
line 684
;683:
;684:if (newdepth == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $456
line 685
;685:{
line 686
;686:Com_Printf("SetFocus: index %i outside menu\n", pos);
ADDRGP4 $458
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 687
;687:return;
ADDRGP4 $454
JUMPV
LABELV $456
line 690
;688:}
;689:
;690:s_dynamic.active[ newdepth - 1 ] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 691
;691:s_dynamic.depth = newdepth;
ADDRGP4 s_dynamic+7020
ADDRLP4 8
INDIRI4
ASGNI4
line 694
;692:
;693:// hide any previous submenus
;694:if (newdepth < depth)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $462
line 695
;695:{
line 696
;696:for (i = s_dynamic.start[ newdepth ]; 
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6944
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $464
line 698
;697:i < s_dynamic.end[depth - 1]; i++)
;698:{
line 699
;699:s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
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
line 700
;700:s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
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
line 701
;701:}
LABELV $465
line 697
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $467
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6968-4
ADDP4
INDIRI4
LTI4 $464
line 702
;702:}
LABELV $462
line 704
;703:
;704:s_dynamic.active[newdepth - 1] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+6992-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 707
;705:
;706:// show this sub-menu (if needed)
;707:if (s_dynamic.data[pos].createSubMenu)
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $477
line 708
;708:s_dynamic.data[pos].createSubMenu();
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+24
ADDP4
INDIRP4
CALLV
pop
LABELV $477
line 709
;709:}
LABELV $454
endproc DynamicMenu_SetFocus 24 8
proc DynamicMenu_ClearFocus 0 0
line 718
;710:
;711:
;712:/*
;713:=================
;714:DynamicMenu_ClearFocus
;715:=================
;716:*/
;717:static void DynamicMenu_ClearFocus( int pos )
;718:{
line 719
;719:}
LABELV $483
endproc DynamicMenu_ClearFocus 0 0
proc DynamicMenu_ActivateControl 12 8
line 729
;720:
;721:
;722:
;723:/*
;724:=================
;725:DynamicMenu_ActivateControl
;726:=================
;727:*/
;728:static void DynamicMenu_ActivateControl( int pos )
;729:{
line 733
;730://int i;
;731:int depth;
;732:
;733:depth = DynamicMenu_IndexDepth(pos);
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
line 735
;734:
;735:if (depth == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $485
line 736
;736:{
line 737
;737:Com_Printf("ActivateControl: index %i outside menu\n", pos);
ADDRGP4 $487
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 738
;738:return;
ADDRGP4 $484
JUMPV
LABELV $485
line 742
;739:}
;740:
;741:// not at the deepest level, can't be a command
;742:if (depth < s_dynamic.depth)
ADDRLP4 0
INDIRI4
ADDRGP4 s_dynamic+7020
INDIRI4
GEI4 $488
line 743
;743:return;
ADDRGP4 $484
JUMPV
LABELV $488
line 745
;744:
;745:if (s_dynamic.data[pos].runEvent)
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4896+28
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $491
line 746
;746:s_dynamic.data[pos].runEvent(pos);
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
ADDRGP4 $492
JUMPV
LABELV $491
line 748
;747:else
;748:Com_Printf("ActivateControl: index %i has no event\n", pos);
ADDRGP4 $497
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $492
line 749
;749:}
LABELV $484
endproc DynamicMenu_ActivateControl 12 8
proc DynamicMenu_MenuEvent 8 4
line 760
;750:
;751:
;752:
;753:
;754:/*
;755:=================
;756:DynamicMenu_MenuEvent
;757:=================
;758:*/
;759:static void DynamicMenu_MenuEvent( void* self, int event )
;760:{
line 763
;761:menutext_s* t;
;762:
;763:t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 765
;764:
;765:switch (event)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $501
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $502
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $503
ADDRGP4 $499
JUMPV
line 766
;766:{
LABELV $501
line 768
;767:case QM_GOTFOCUS:
;768:DynamicMenu_SetFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_SetFocus
CALLV
pop
line 769
;769:break;
ADDRGP4 $500
JUMPV
LABELV $502
line 771
;770:case QM_LOSTFOCUS:
;771:DynamicMenu_ClearFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ClearFocus
CALLV
pop
line 772
;772:break;
ADDRGP4 $500
JUMPV
LABELV $503
line 774
;773:case QM_ACTIVATED:
;774:DynamicMenu_ActivateControl(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ActivateControl
CALLV
pop
line 775
;775:break;
LABELV $499
LABELV $500
line 777
;776:}
;777:}
LABELV $498
endproc DynamicMenu_MenuEvent 8 4
proc DynamicMenu_Close 0 0
line 789
;778:
;779:
;780:
;781:
;782:
;783:/*
;784:=================
;785:DynamicMenu_Close
;786:=================
;787:*/
;788:static void DynamicMenu_Close( void )
;789:{
line 790
;790:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 791
;791:}
LABELV $504
endproc DynamicMenu_Close 0 0
proc DM_Close_Event 0 0
line 801
;792: 
;793:
;794:
;795:/*
;796:=================
;797:DM_Close_Event
;798:=================
;799:*/
;800:static void DM_Close_Event( int index )
;801:{
line 802
;802:UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 803
;803:}
LABELV $505
endproc DM_Close_Event 0 0
proc DynamicMenu_VoteMenu 0 16
line 815
;804:
;805:
;806:// Shafe - Trep - Here is where the first Dynamic Menu Starts
;807:
;808:/*
;809:=================
;810:// My first Test menu
;811:DynamicMenu_VoteMenu
;812:=================
;813:*/
;814:static void DynamicMenu_VoteMenu( void )
;815:{
line 816
;816:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 818
;817:	// The Menu Items
;818:	DynamicMenu_AddItem("Kick", 0 , NULL, DM_Close_Event);
ADDRGP4 $507
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
line 819
;819:	DynamicMenu_AddItem("Next Map", 0 , NULL, DM_Close_Event);
ADDRGP4 $508
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
line 820
;820:	DynamicMenu_AddItem("Restart Map", 0 , NULL, DM_Close_Event);
ADDRGP4 $509
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
line 821
;821:	DynamicMenu_AddItem("Balance Teams", 0 , NULL, DM_Close_Event);
ADDRGP4 $510
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
line 822
;822:	DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
ADDRGP4 $511
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
line 823
;823:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 824
;824:}
LABELV $506
endproc DynamicMenu_VoteMenu 0 16
proc DynamicMenu_InitPrimaryMenu 0 16
line 836
;825:
;826:
;827:
;828:
;829:// Shafe - Trep - Top Level Menu Last
;830:/*
;831:=================
;832:DynamicMenu_InitPrimaryMenu
;833:=================
;834:*/
;835:static void DynamicMenu_InitPrimaryMenu( void )
;836:{
line 837
;837:DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 839
;838:
;839:DynamicMenu_AddItem("Call Vote", 0, DynamicMenu_VoteMenu, NULL);
ADDRGP4 $513
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
line 840
;840:DynamicMenu_AddItem("Buy Equipment", 0 , NULL, DM_Close_Event);
ADDRGP4 $514
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
line 841
;841:DynamicMenu_AddItem("Crap!", 0, NULL, DM_Close_Event);
ADDRGP4 $515
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
line 842
;842:DynamicMenu_AddItem("Shit And Stuff!", 0, NULL, DM_Close_Event);
ADDRGP4 $516
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
line 843
;843:DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
ADDRGP4 $511
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
line 845
;844:
;845:DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 846
;846:}
LABELV $512
endproc DynamicMenu_InitPrimaryMenu 0 16
proc DynamicMenu_MenuInit 12 8
line 857
;847:
;848:
;849:
;850:
;851:/*
;852:=================
;853:DynamicMenu_MenuInit
;854:=================
;855:*/
;856:static void DynamicMenu_MenuInit( void )
;857:{
line 860
;858:int i;
;859:
;860:s_dynamic.menu.draw = DynamicMenu_MenuDraw;
ADDRGP4 s_dynamic+268
ADDRGP4 DynamicMenu_MenuDraw
ASGNP4
line 861
;861:s_dynamic.menu.fullscreen = qfalse;
ADDRGP4 s_dynamic+280
CNSTI4 0
ASGNI4
line 862
;862:s_dynamic.menu.wrapAround = qfalse;
ADDRGP4 s_dynamic+276
CNSTI4 0
ASGNI4
line 864
;863:
;864:for (i = 0; i < MAX_MENUITEMS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $521
line 865
;865:{
line 866
;866:s_dynamic.item[i].generic.type = MTYPE_PTEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288
ADDP4
CNSTI4 9
ASGNI4
line 867
;867:s_dynamic.item[i].generic.flags = QMF_INACTIVE
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+44
ADDP4
CNSTU4 53504
ASGNU4
line 869
;868:|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
;869:s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+56
ADDP4
ADDRGP4 DynamicMenu_MenuItemDraw
ASGNP4
line 870
;870:s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+48
ADDP4
ADDRGP4 DynamicMenu_MenuEvent
ASGNP4
line 871
;871:s_dynamic.item[i].generic.id = i;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 872
;872:s_dynamic.item[i].string = s_dynamic.data[i].text;
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
line 873
;873:s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+64
ADDP4
CNSTI4 2064
ASGNI4
line 874
;874:s_dynamic.item[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+288+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 876
;875:
;876:Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
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
line 877
;877:}
LABELV $522
line 864
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $521
line 880
;878:
;879:// start up the menu system
;880:s_dynamic.depth = 0;
ADDRGP4 s_dynamic+7020
CNSTI4 0
ASGNI4
line 885
;881:
;882://Uncomment the next line if adding part II as well
;883://DynamicMenu_InitMapItems();
;884:
;885:DynamicMenu_InitPrimaryMenu();
ADDRGP4 DynamicMenu_InitPrimaryMenu
CALLV
pop
line 886
;886:}
LABELV $517
endproc DynamicMenu_MenuInit 12 8
export UI_DynamicMenuCache
proc UI_DynamicMenuCache 0 0
line 899
;887:
;888:
;889:
;890:
;891:
;892:
;893:/*
;894:=================
;895:UI_DynamicMenuCache
;896:=================
;897:*/
;898:void UI_DynamicMenuCache( void )
;899:{
line 900
;900:}
LABELV $543
endproc UI_DynamicMenuCache 0 0
export UI_DynamicMenu
proc UI_DynamicMenu 4124 12
line 911
;901:
;902:
;903:
;904:
;905:/*
;906:=================
;907:UI_DynamicMenu
;908:=================
;909:*/
;910:void UI_DynamicMenu( void )
;911:{
line 916
;912:	uiClientState_t	cs;
;913:	char			info[MAX_INFO_STRING];
;914:	int				playerTeam;
;915:
;916:trap_GetClientState( &cs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 917
;917:trap_GetConfigString( CS_PLAYERS 
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
line 919
;918:+ cs.clientNum, info, MAX_INFO_STRING );
;919:playerTeam = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 3084
ARGP4
ADDRGP4 $209
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
line 926
;920:
;921://Uncomment the next two code lines if adding part II 
;922://as well, or specs can't use the menu either
;923://if (playerTeam == TEAM_SPECTATOR)
;924://return;
;925:
;926:memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));
ADDRGP4 s_dynamic
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 928
;927:
;928:s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $157
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
line 935
;929:
;930://Uncomment the next three lines if adding part II as well
;931://if (s_dynamic.gametype != GT_TEAM && 
;932://s_dynamic.gametype != GT_CTF)
;933://return;
;934:
;935:UI_DynamicMenuCache();
ADDRGP4 UI_DynamicMenuCache
CALLV
pop
line 938
;936:
;937:// force as top level menu
;938:uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 941
;939:
;940:// set menu cursor to a nice location
;941:uis.cursorx = 50;
ADDRGP4 uis+8
CNSTI4 50
ASGNI4
line 942
;942:uis.cursory = 240;
ADDRGP4 uis+12
CNSTI4 240
ASGNI4
line 944
;943:
;944:DynamicMenu_MenuInit();
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 946
;945:
;946:UI_PushMenu( &s_dynamic.menu );
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 947
;947:}
LABELV $544
endproc UI_DynamicMenu 4124 12
export UI_DynamicCommandMenu_f
proc UI_DynamicCommandMenu_f 0 0
line 957
;948:
;949:
;950:
;951:/*
;952:=================
;953:UI_DynamicCommandMenu_f
;954:=================
;955:*/
;956:void UI_DynamicCommandMenu_f( void )
;957:{
line 958
;958:UI_DynamicMenu();
ADDRGP4 UI_DynamicMenu
CALLV
pop
line 959
;959:}
LABELV $550
endproc UI_DynamicCommandMenu_f 0 0
bss
align 4
LABELV s_dynamic
skip 7024
align 4
LABELV s_ingame
skip 1096
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
LABELV $516
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
LABELV $515
byte 1 67
byte 1 114
byte 1 97
byte 1 112
byte 1 33
byte 1 0
align 1
LABELV $514
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
LABELV $513
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
LABELV $511
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $510
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
LABELV $509
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
LABELV $508
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
LABELV $507
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $497
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
LABELV $487
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
LABELV $458
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
LABELV $402
byte 1 32
byte 1 13
byte 1 0
align 1
LABELV $374
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
LABELV $321
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
LABELV $303
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
LABELV $285
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
LABELV $263
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
LABELV $245
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
LABELV $227
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $209
byte 1 116
byte 1 0
align 1
LABELV $199
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
LABELV $175
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
LABELV $157
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
LABELV $156
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
LABELV $155
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
LABELV $148
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
LABELV $130
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $108
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
