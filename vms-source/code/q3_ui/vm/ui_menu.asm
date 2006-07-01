code
proc MainMenu_ExitAction 0 0
file "../ui_menu.c"
line 63
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MAIN MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ID_SINGLEPLAYER			10
;16:#define ID_MULTIPLAYER			11
;17:#define ID_SETUP				12
;18:#define ID_DEMOS				13
;19:#define ID_CINEMATICS			14
;20:#define ID_TEAMARENA		15
;21:#define ID_MODS					16
;22:#define ID_EXIT					17
;23:#define ART_FRAMER				"menu/art/frame1_r"
;24:#define ART_TREPLOGO			"menu/art/treplogo"
;25:
;26:
;27:#define MAIN_BANNER_MODEL				"models/mapobjects/banner/banner5.md3"
;28:#define MAIN_MENU_VERTICAL_SPACING		34
;29:
;30:
;31:typedef struct {
;32:	menuframework_s	menu;
;33:
;34:	menutext_s		singleplayer;
;35:	menutext_s		multiplayer;
;36:	menutext_s		setup;
;37:	menutext_s		demos;
;38:	menutext_s		cinematics;
;39:	menutext_s		teamArena;
;40:	menutext_s		mods;
;41:	menutext_s		exit;
;42:	menubitmap_s	framer;
;43:	menubitmap_s	treplogo;
;44:
;45:	qhandle_t		bannerModel;
;46:} mainmenu_t;
;47:
;48:
;49:static mainmenu_t s_main;
;50:
;51:typedef struct {
;52:	menuframework_s menu;	
;53:	char errorMessage[4096];
;54:} errorMessage_t;
;55:
;56:static errorMessage_t s_errorMessage;
;57:
;58:/*
;59:=================
;60:MainMenu_ExitAction
;61:=================
;62:*/
;63:static void MainMenu_ExitAction( qboolean result ) {
line 64
;64:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $72
line 65
;65:		return;
ADDRGP4 $71
JUMPV
LABELV $72
line 67
;66:	}
;67:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 68
;68:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 69
;69:}
LABELV $71
endproc MainMenu_ExitAction 0 0
export Main_MenuEvent
proc Main_MenuEvent 8 12
line 78
;70:
;71:
;72:
;73:/*
;74:=================
;75:Main_MenuEvent
;76:=================
;77:*/
;78:void Main_MenuEvent (void* ptr, int event) {
line 79
;79:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $75
line 80
;80:		return;
ADDRGP4 $74
JUMPV
LABELV $75
line 83
;81:	}
;82:
;83:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $77
ADDRLP4 0
INDIRI4
CNSTI4 17
GTI4 $77
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $92-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $92
address $80
address $81
address $82
address $83
address $84
address $86
address $85
address $90
code
LABELV $80
line 85
;84:	case ID_SINGLEPLAYER:
;85:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 86
;86:		break;
ADDRGP4 $78
JUMPV
LABELV $81
line 89
;87:
;88:	case ID_MULTIPLAYER:
;89:		UI_ArenaServersMenu();
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
line 90
;90:		break;
ADDRGP4 $78
JUMPV
LABELV $82
line 93
;91:
;92:	case ID_SETUP:
;93:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 94
;94:		break;
ADDRGP4 $78
JUMPV
LABELV $83
line 97
;95:
;96:	case ID_DEMOS:
;97:		UI_DemosMenu();
ADDRGP4 UI_DemosMenu
CALLV
pop
line 98
;98:		break;
ADDRGP4 $78
JUMPV
LABELV $84
line 101
;99:
;100:	case ID_CINEMATICS:
;101:		UI_CinematicsMenu();
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 102
;102:		break;
ADDRGP4 $78
JUMPV
LABELV $85
line 105
;103:
;104:	case ID_MODS:
;105:		UI_ModsMenu();
ADDRGP4 UI_ModsMenu
CALLV
pop
line 106
;106:		break;
ADDRGP4 $78
JUMPV
LABELV $86
line 109
;107:
;108:	case ID_TEAMARENA:
;109:		trap_Cvar_Set( "fs_game", "missionpack");
ADDRGP4 $87
ARGP4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 110
;110:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $89
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 111
;111:		break;
ADDRGP4 $78
JUMPV
LABELV $90
line 114
;112:
;113:	case ID_EXIT:
;114:		UI_ConfirmMenu( "EXIT GAME?", NULL, MainMenu_ExitAction );
ADDRGP4 $91
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 MainMenu_ExitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 115
;115:		break;
LABELV $77
LABELV $78
line 117
;116:	}
;117:}
LABELV $74
endproc Main_MenuEvent 8 12
export MainMenu_Cache
proc MainMenu_Cache 4 4
line 125
;118:
;119:
;120:/*
;121:===============
;122:MainMenu_Cache
;123:===============
;124:*/
;125:void MainMenu_Cache( void ) {
line 126
;126:	s_main.bannerModel = trap_R_RegisterModel( MAIN_BANNER_MODEL );
ADDRGP4 $96
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 s_main+1040
ADDRLP4 0
INDIRI4
ASGNI4
line 127
;127:}
LABELV $94
endproc MainMenu_Cache 4 4
export ErrorMessage_Key
proc ErrorMessage_Key 0 8
line 130
;128:
;129:sfxHandle_t ErrorMessage_Key(int key)
;130:{
line 131
;131:	trap_Cvar_Set( "com_errorMessage", "" );
ADDRGP4 $98
ARGP4
ADDRGP4 $99
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 132
;132:	UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 133
;133:	return (menu_null_sound);
ADDRGP4 menu_null_sound
INDIRI4
RETI4
LABELV $97
endproc ErrorMessage_Key 0 8
lit
align 4
LABELV $101
byte 4 1056964608
byte 4 0
byte 4 0
byte 4 1065353216
code
proc Main_MenuDraw 576 28
line 143
;134:}
;135:
;136:/*
;137:===============
;138:Main_MenuDraw
;139:TTimo: this function is common to the main menu and errorMessage menu
;140:===============
;141:*/
;142:
;143:static void Main_MenuDraw( void ) {
line 150
;144:	refdef_t		refdef;
;145:	refEntity_t		ent;
;146:	vec3_t			origin;
;147:	vec3_t			angles;
;148:	float			adjust;
;149:	float			x, y, w, h;
;150:	vec4_t			color = {0.5, 0, 0, 1};
ADDRLP4 552
ADDRGP4 $101
INDIRB
ASGNB 16
line 154
;151:
;152:	// setup the refdef
;153:
;154:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 156
;155:
;156:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 158
;157:
;158:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 160
;159:
;160:	x = 0;
ADDRLP4 536
CNSTF4 0
ASGNF4
line 161
;161:	y = 0;
ADDRLP4 540
CNSTF4 0
ASGNF4
line 162
;162:	w = 640;
ADDRLP4 544
CNSTF4 1142947840
ASGNF4
line 163
;163:	h = 120;
ADDRLP4 548
CNSTF4 1123024896
ASGNF4
line 164
;164:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 536
ARGP4
ADDRLP4 540
ARGP4
ADDRLP4 544
ARGP4
ADDRLP4 548
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 165
;165:	refdef.x = x;
ADDRLP4 0
ADDRLP4 536
INDIRF4
CVFI4 4
ASGNI4
line 166
;166:	refdef.y = y;
ADDRLP4 0+4
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
line 167
;167:	refdef.width = w;
ADDRLP4 0+8
ADDRLP4 544
INDIRF4
CVFI4 4
ASGNI4
line 168
;168:	refdef.height = h;
ADDRLP4 0+12
ADDRLP4 548
INDIRF4
CVFI4 4
ASGNI4
line 170
;169:
;170:	adjust = 0; // JDC: Kenneth asked me to stop this 1.0 * sin( (float)uis.realtime / 1000 );
ADDRLP4 520
CNSTF4 0
ASGNF4
line 171
;171:	refdef.fov_x = 60 + adjust;
ADDRLP4 0+16
ADDRLP4 520
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 172
;172:	refdef.fov_y = 19.6875 + adjust;
ADDRLP4 0+20
ADDRLP4 520
INDIRF4
CNSTF4 1100840960
ADDF4
ASGNF4
line 174
;173:
;174:	refdef.time = uis.realtime;
ADDRLP4 0+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 176
;175:
;176:	origin[0] = 300;
ADDRLP4 508
CNSTF4 1133903872
ASGNF4
line 177
;177:	origin[1] = 0;
ADDRLP4 508+4
CNSTF4 0
ASGNF4
line 178
;178:	origin[2] = -32;
ADDRLP4 508+8
CNSTF4 3254779904
ASGNF4
line 180
;179:
;180:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 184
;181:
;182:	// add the model
;183:
;184:	memset( &ent, 0, sizeof(ent) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 186
;185:
;186:	adjust = 5.0 * sin( (float)uis.realtime / 5000 );
ADDRGP4 uis+4
INDIRI4
CVIF4 4
CNSTF4 1167867904
DIVF4
ARGF4
ADDRLP4 568
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 520
CNSTF4 1084227584
ADDRLP4 568
INDIRF4
MULF4
ASGNF4
line 187
;187:	VectorSet( angles, 0, 180 + adjust, 0 );
ADDRLP4 524
CNSTF4 0
ASGNF4
ADDRLP4 524+4
ADDRLP4 520
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
ADDRLP4 524+8
CNSTF4 0
ASGNF4
line 188
;188:	AnglesToAxis( angles, ent.axis );
ADDRLP4 524
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 189
;189:	ent.hModel = s_main.bannerModel;
ADDRLP4 368+8
ADDRGP4 s_main+1040
INDIRI4
ASGNI4
line 190
;190:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRLP4 508
INDIRB
ASGNB 12
line 191
;191:	VectorCopy( origin, ent.lightingOrigin );
ADDRLP4 368+12
ADDRLP4 508
INDIRB
ASGNB 12
line 192
;192:	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 368+4
CNSTI4 192
ASGNI4
line 193
;193:	VectorCopy( ent.origin, ent.oldorigin );
ADDRLP4 368+84
ADDRLP4 368+68
INDIRB
ASGNB 12
line 195
;194:
;195:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 197
;196:
;197:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 199
;198:	
;199:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+288
ARGP4
ADDRLP4 572
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
EQI4 $124
line 200
;200:	{
line 201
;201:		UI_DrawProportionalString_AutoWrapped( 320, 192, 600, 20, s_errorMessage.errorMessage, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 600
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 menu_text_color
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 202
;202:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 204
;203:	else
;204:	{
line 206
;205:		// standard menu drawing
;206:		Menu_Draw( &s_main.menu );		
ADDRGP4 s_main
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 207
;207:	}
LABELV $125
line 209
;208:
;209:	if (uis.demoversion) {
ADDRGP4 uis+11440
INDIRI4
CNSTI4 0
EQI4 $128
line 210
;210:		UI_DrawProportionalString( 320, 372, "DEMO      FOR MATURE AUDIENCES      DEMO", UI_CENTER|UI_SMALLFONT, color );
CNSTI4 320
ARGI4
CNSTI4 372
ARGI4
ADDRGP4 $131
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 211
;211:		UI_DrawString( 320, 400, "Tredpidation(c)2006, GPLed by The Trepidation Project", UI_CENTER|UI_SMALLFONT, color );
CNSTI4 320
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 $132
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 212
;212:	} else {
ADDRGP4 $129
JUMPV
LABELV $128
line 213
;213:		UI_DrawString( 320, 450, "Tredpidation(c)2006, GPLed by The Trepidation Project", UI_CENTER|UI_SMALLFONT, color );
CNSTI4 320
ARGI4
CNSTI4 450
ARGI4
ADDRGP4 $132
ARGP4
CNSTI4 17
ARGI4
ADDRLP4 552
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 214
;214:	}
LABELV $129
line 215
;215:}
LABELV $100
endproc Main_MenuDraw 576 28
proc UI_TeamArenaExists 2084 16
line 223
;216:
;217:
;218:/*
;219:===============
;220:UI_TeamArenaExists
;221:===============
;222:*/
;223:static qboolean UI_TeamArenaExists( void ) {
line 231
;224:	int		numdirs;
;225:	char	dirlist[2048];
;226:	char	*dirptr;
;227:  char  *descptr;
;228:	int		i;
;229:	int		dirlen;
;230:
;231:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $134
ARGP4
ADDRGP4 $99
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 232
;232:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 233
;233:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
line 234
;234:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 235
;235:    descptr = dirptr + dirlen;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 236
;236:		if (Q_stricmp(dirptr, "missionpack") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $139
line 237
;237:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $139
line 239
;238:		}
;239:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 240
;240:	}
LABELV $136
line 233
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $138
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $135
line 241
;241:	return qfalse;
CNSTI4 0
RETI4
LABELV $133
endproc UI_TeamArenaExists 2084 16
export UI_MainMenu
proc UI_MainMenu 40 12
line 254
;242:}
;243:
;244:
;245:/*
;246:===============
;247:UI_MainMenu
;248:
;249:The main menu only comes up when not in a game,
;250:so make sure that the attract loop server is down
;251:and that local cinematics are killed
;252:===============
;253:*/
;254:void UI_MainMenu( void ) {
line 256
;255:	int		y;
;256:	qboolean teamArena = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 257
;257:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 259
;258:
;259:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $142
ARGP4
ADDRGP4 $143
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 261
;260:
;261:	if( !uis.demoversion && !ui_cdkeychecked.integer ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 uis+11440
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $144
ADDRGP4 ui_cdkeychecked+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $144
line 264
;262:		char	key[17];
;263:
;264:		trap_GetCDKey( key, sizeof(key) );
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 265
;265:		if( trap_VerifyCDKey( key, NULL ) == qfalse ) {
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 36
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $148
line 268
;266:			//UI_CDKeyMenu();
;267:			//return;
;268:		}
LABELV $148
line 269
;269:	}
LABELV $144
line 271
;270:	
;271:	memset( &s_main, 0 ,sizeof(mainmenu_t) );
ADDRGP4 s_main
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1044
ARGI4
ADDRGP4 memset
CALLP4
pop
line 272
;272:	memset( &s_errorMessage, 0 ,sizeof(errorMessage_t) );
ADDRGP4 s_errorMessage
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4384
ARGI4
ADDRGP4 memset
CALLP4
pop
line 275
;273:
;274:	// com_errorMessage would need that too
;275:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 277
;276:	
;277:	trap_Cvar_VariableStringBuffer( "com_errorMessage", s_errorMessage.errorMessage, sizeof(s_errorMessage.errorMessage) );
ADDRGP4 $98
ARGP4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 278
;278:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+288
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $152
line 279
;279:	{	
line 280
;280:		s_errorMessage.menu.draw = Main_MenuDraw;
ADDRGP4 s_errorMessage+268
ADDRGP4 Main_MenuDraw
ASGNP4
line 281
;281:		s_errorMessage.menu.key = ErrorMessage_Key;
ADDRGP4 s_errorMessage+272
ADDRGP4 ErrorMessage_Key
ASGNP4
line 282
;282:		s_errorMessage.menu.fullscreen = qtrue;
ADDRGP4 s_errorMessage+280
CNSTI4 1
ASGNI4
line 283
;283:		s_errorMessage.menu.wrapAround = qtrue;
ADDRGP4 s_errorMessage+276
CNSTI4 1
ASGNI4
line 284
;284:		s_errorMessage.menu.showlogo = qfalse;	// Shafe - Trep - Temporarily qfalse
ADDRGP4 s_errorMessage+284
CNSTI4 0
ASGNI4
line 286
;285:
;286:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 287
;287:		uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 288
;288:		UI_PushMenu ( &s_errorMessage.menu );
ADDRGP4 s_errorMessage
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 290
;289:		
;290:		return;
ADDRGP4 $141
JUMPV
LABELV $152
line 294
;291:	}
;292:
;293:
;294:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $161
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 295
;295:	trap_R_RegisterShaderNoMip( ART_TREPLOGO );
ADDRGP4 $162
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 297
;296:
;297:	s_main.menu.draw = Main_MenuDraw;
ADDRGP4 s_main+268
ADDRGP4 Main_MenuDraw
ASGNP4
line 298
;298:	s_main.menu.fullscreen = qtrue;
ADDRGP4 s_main+280
CNSTI4 1
ASGNI4
line 299
;299:	s_main.menu.wrapAround = qtrue;
ADDRGP4 s_main+276
CNSTI4 1
ASGNI4
line 300
;300:	s_main.menu.showlogo = qfalse; // Shafe - Trep - Temporarily qfalse
ADDRGP4 s_main+284
CNSTI4 0
ASGNI4
line 302
;301:
;302:	s_main.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_main+864
CNSTI4 6
ASGNI4
line 303
;303:	s_main.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_main+864+4
ADDRGP4 $161
ASGNP4
line 304
;304:	s_main.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_main+864+44
CNSTU4 16384
ASGNU4
line 305
;305:	s_main.framer.generic.x			= 0;  
ADDRGP4 s_main+864+12
CNSTI4 0
ASGNI4
line 306
;306:	s_main.framer.generic.y			= 0;
ADDRGP4 s_main+864+16
CNSTI4 0
ASGNI4
line 307
;307:	s_main.framer.width				= 800;
ADDRGP4 s_main+864+76
CNSTI4 800
ASGNI4
line 308
;308:	s_main.framer.height			= 600;
ADDRGP4 s_main+864+80
CNSTI4 600
ASGNI4
line 311
;309:
;310:
;311:	s_main.treplogo.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_main+952
CNSTI4 6
ASGNI4
line 312
;312:	s_main.treplogo.generic.name		= ART_TREPLOGO;
ADDRGP4 s_main+952+4
ADDRGP4 $162
ASGNP4
line 313
;313:	s_main.treplogo.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_main+952+44
CNSTU4 16384
ASGNU4
line 314
;314:	s_main.treplogo.generic.x			= 0;  
ADDRGP4 s_main+952+12
CNSTI4 0
ASGNI4
line 315
;315:	s_main.treplogo.generic.y			= 1;
ADDRGP4 s_main+952+16
CNSTI4 1
ASGNI4
line 316
;316:	s_main.treplogo.width				= 225;
ADDRGP4 s_main+952+76
CNSTI4 225
ASGNI4
line 317
;317:	s_main.treplogo.height			= 100;
ADDRGP4 s_main+952+80
CNSTI4 100
ASGNI4
line 320
;318:
;319:
;320:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 321
;321:	s_main.multiplayer.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+360
CNSTI4 9
ASGNI4
line 322
;322:	s_main.multiplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+360+44
CNSTU4 264
ASGNU4
line 323
;323:	s_main.multiplayer.generic.x			= 320;
ADDRGP4 s_main+360+12
CNSTI4 320
ASGNI4
line 324
;324:	s_main.multiplayer.generic.y			= y;
ADDRGP4 s_main+360+16
ADDRLP4 0
INDIRI4
ASGNI4
line 325
;325:	s_main.multiplayer.generic.id			= ID_MULTIPLAYER;
ADDRGP4 s_main+360+8
CNSTI4 11
ASGNI4
line 326
;326:	s_main.multiplayer.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+360+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 327
;327:	s_main.multiplayer.string				= "PLAY TREPIDATION ONLINE"; // Shafe - Trep - Minor Text Change
ADDRGP4 s_main+360+60
ADDRGP4 $206
ASGNP4
line 328
;328:	s_main.multiplayer.color				= color_red;
ADDRGP4 s_main+360+68
ADDRGP4 color_red
ASGNP4
line 329
;329:	s_main.multiplayer.style				= style;
ADDRGP4 s_main+360+64
ADDRLP4 4
INDIRI4
ASGNI4
line 332
;330:
;331:
;332:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 333
;333:	s_main.singleplayer.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+288
CNSTI4 9
ASGNI4
line 334
;334:	s_main.singleplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+288+44
CNSTU4 264
ASGNU4
line 335
;335:	s_main.singleplayer.generic.x			= 320;
ADDRGP4 s_main+288+12
CNSTI4 320
ASGNI4
line 336
;336:	s_main.singleplayer.generic.y			= y;
ADDRGP4 s_main+288+16
ADDRLP4 0
INDIRI4
ASGNI4
line 337
;337:	s_main.singleplayer.generic.id			= ID_SINGLEPLAYER;
ADDRGP4 s_main+288+8
CNSTI4 10
ASGNI4
line 338
;338:	s_main.singleplayer.generic.callback	= Main_MenuEvent; 
ADDRGP4 s_main+288+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 339
;339:	s_main.singleplayer.string				= "PLAY OFFLINE ";
ADDRGP4 s_main+288+60
ADDRGP4 $224
ASGNP4
line 340
;340:	s_main.singleplayer.color				= color_red;
ADDRGP4 s_main+288+68
ADDRGP4 color_red
ASGNP4
line 341
;341:	s_main.singleplayer.style				= style;
ADDRGP4 s_main+288+64
ADDRLP4 4
INDIRI4
ASGNI4
line 344
;342:	
;343:	
;344:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 345
;345:	s_main.setup.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+432
CNSTI4 9
ASGNI4
line 346
;346:	s_main.setup.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+432+44
CNSTU4 264
ASGNU4
line 347
;347:	s_main.setup.generic.x					= 320;
ADDRGP4 s_main+432+12
CNSTI4 320
ASGNI4
line 348
;348:	s_main.setup.generic.y					= y;
ADDRGP4 s_main+432+16
ADDRLP4 0
INDIRI4
ASGNI4
line 349
;349:	s_main.setup.generic.id					= ID_SETUP;
ADDRGP4 s_main+432+8
CNSTI4 12
ASGNI4
line 350
;350:	s_main.setup.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+432+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 351
;351:	s_main.setup.string						= "SETUP";
ADDRGP4 s_main+432+60
ADDRGP4 $242
ASGNP4
line 352
;352:	s_main.setup.color						= color_red;
ADDRGP4 s_main+432+68
ADDRGP4 color_red
ASGNP4
line 353
;353:	s_main.setup.style						= style;
ADDRGP4 s_main+432+64
ADDRLP4 4
INDIRI4
ASGNI4
line 356
;354:
;355:	
;356:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 357
;357:	s_main.demos.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+504
CNSTI4 9
ASGNI4
line 358
;358:	s_main.demos.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+504+44
CNSTU4 264
ASGNU4
line 359
;359:	s_main.demos.generic.x					= 320;
ADDRGP4 s_main+504+12
CNSTI4 320
ASGNI4
line 360
;360:	s_main.demos.generic.y					= y;
ADDRGP4 s_main+504+16
ADDRLP4 0
INDIRI4
ASGNI4
line 361
;361:	s_main.demos.generic.id					= ID_DEMOS;
ADDRGP4 s_main+504+8
CNSTI4 13
ASGNI4
line 362
;362:	s_main.demos.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+504+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 363
;363:	s_main.demos.string						= "DEMOS";
ADDRGP4 s_main+504+60
ADDRGP4 $260
ASGNP4
line 364
;364:	s_main.demos.color						= color_red;
ADDRGP4 s_main+504+68
ADDRGP4 color_red
ASGNP4
line 365
;365:	s_main.demos.style						= style;
ADDRGP4 s_main+504+64
ADDRLP4 4
INDIRI4
ASGNI4
line 368
;366:
;367:	//y += MAIN_MENU_VERTICAL_SPACING;
;368:	s_main.cinematics.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+576
CNSTI4 9
ASGNI4
line 369
;369:	s_main.cinematics.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+576+44
CNSTU4 264
ASGNU4
line 370
;370:	s_main.cinematics.generic.x				= 320;
ADDRGP4 s_main+576+12
CNSTI4 320
ASGNI4
line 371
;371:	s_main.cinematics.generic.y				= y;
ADDRGP4 s_main+576+16
ADDRLP4 0
INDIRI4
ASGNI4
line 372
;372:	s_main.cinematics.generic.id			= ID_CINEMATICS;
ADDRGP4 s_main+576+8
CNSTI4 14
ASGNI4
line 373
;373:	s_main.cinematics.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+576+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 374
;374:	s_main.cinematics.string				= "CINEMATICS";
ADDRGP4 s_main+576+60
ADDRGP4 $278
ASGNP4
line 375
;375:	s_main.cinematics.color					= color_red;
ADDRGP4 s_main+576+68
ADDRGP4 color_red
ASGNP4
line 376
;376:	s_main.cinematics.style					= style;
ADDRGP4 s_main+576+64
ADDRLP4 4
INDIRI4
ASGNI4
line 379
;377:	
;378:
;379:	if (UI_TeamArenaExists()) {
ADDRLP4 20
ADDRGP4 UI_TeamArenaExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $283
line 380
;380:		teamArena = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 381
;381:		y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 382
;382:		s_main.teamArena.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+648
CNSTI4 9
ASGNI4
line 383
;383:		s_main.teamArena.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+648+44
CNSTU4 264
ASGNU4
line 384
;384:		s_main.teamArena.generic.x				= 320;
ADDRGP4 s_main+648+12
CNSTI4 320
ASGNI4
line 385
;385:		s_main.teamArena.generic.y				= y;
ADDRGP4 s_main+648+16
ADDRLP4 0
INDIRI4
ASGNI4
line 386
;386:		s_main.teamArena.generic.id				= ID_TEAMARENA;
ADDRGP4 s_main+648+8
CNSTI4 15
ASGNI4
line 387
;387:		s_main.teamArena.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+648+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 388
;388:		s_main.teamArena.string					= "TEAM ARENA";
ADDRGP4 s_main+648+60
ADDRGP4 $298
ASGNP4
line 389
;389:		s_main.teamArena.color					= color_red;
ADDRGP4 s_main+648+68
ADDRGP4 color_red
ASGNP4
line 390
;390:		s_main.teamArena.style					= style;
ADDRGP4 s_main+648+64
ADDRLP4 4
INDIRI4
ASGNI4
line 391
;391:	}
LABELV $283
line 394
;392:
;393:	//y += MAIN_MENU_VERTICAL_SPACING;
;394:	s_main.mods.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+720
CNSTI4 9
ASGNI4
line 395
;395:	s_main.mods.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+720+44
CNSTU4 264
ASGNU4
line 396
;396:	s_main.mods.generic.x				= 320;
ADDRGP4 s_main+720+12
CNSTI4 320
ASGNI4
line 397
;397:	s_main.mods.generic.y				= y;
ADDRGP4 s_main+720+16
ADDRLP4 0
INDIRI4
ASGNI4
line 398
;398:	s_main.mods.generic.id				= ID_MODS;
ADDRGP4 s_main+720+8
CNSTI4 16
ASGNI4
line 399
;399:	s_main.mods.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+720+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 400
;400:	s_main.mods.string					= "MODS";
ADDRGP4 s_main+720+60
ADDRGP4 $316
ASGNP4
line 401
;401:	s_main.mods.color					= color_red;
ADDRGP4 s_main+720+68
ADDRGP4 color_red
ASGNP4
line 402
;402:	s_main.mods.style					= style;
ADDRGP4 s_main+720+64
ADDRLP4 4
INDIRI4
ASGNI4
line 404
;403:
;404:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 405
;405:	s_main.exit.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+792
CNSTI4 9
ASGNI4
line 406
;406:	s_main.exit.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+792+44
CNSTU4 264
ASGNU4
line 407
;407:	s_main.exit.generic.x					= 320;
ADDRGP4 s_main+792+12
CNSTI4 320
ASGNI4
line 408
;408:	s_main.exit.generic.y					= y;
ADDRGP4 s_main+792+16
ADDRLP4 0
INDIRI4
ASGNI4
line 409
;409:	s_main.exit.generic.id					= ID_EXIT;
ADDRGP4 s_main+792+8
CNSTI4 17
ASGNI4
line 410
;410:	s_main.exit.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+792+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 411
;411:	s_main.exit.string						= "EXIT";
ADDRGP4 s_main+792+60
ADDRGP4 $334
ASGNP4
line 412
;412:	s_main.exit.color						= color_red;
ADDRGP4 s_main+792+68
ADDRGP4 color_red
ASGNP4
line 413
;413:	s_main.exit.style						= style;
ADDRGP4 s_main+792+64
ADDRLP4 4
INDIRI4
ASGNI4
line 415
;414:
;415:	Menu_AddItem( &s_main.menu, ( void * ) &s_main.framer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+864
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 416
;416:	Menu_AddItem( &s_main.menu, ( void * ) &s_main.treplogo );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 418
;417:	
;418:	Menu_AddItem( &s_main.menu,	&s_main.multiplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 419
;419:	Menu_AddItem( &s_main.menu,	&s_main.singleplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 420
;420:	Menu_AddItem( &s_main.menu,	&s_main.setup );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+432
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 421
;421:	Menu_AddItem( &s_main.menu,	&s_main.demos );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 423
;422:	//Menu_AddItem( &s_main.menu,	&s_main.cinematics );
;423:	if (teamArena) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $345
line 424
;424:		Menu_AddItem( &s_main.menu,	&s_main.teamArena );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 425
;425:	}
LABELV $345
line 427
;426:	//Menu_AddItem( &s_main.menu,	&s_main.mods );
;427:	Menu_AddItem( &s_main.menu,	&s_main.exit ); 
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 430
;428:	
;429:
;430:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 431
;431:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 432
;432:	UI_PushMenu ( &s_main.menu );
ADDRGP4 s_main
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 434
;433:		
;434:}
LABELV $141
endproc UI_MainMenu 40 12
bss
align 4
LABELV s_errorMessage
skip 4384
align 4
LABELV s_main
skip 1044
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
import UI_DynamicMenu
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
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
LABELV $334
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $316
byte 1 77
byte 1 79
byte 1 68
byte 1 83
byte 1 0
align 1
LABELV $298
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $278
byte 1 67
byte 1 73
byte 1 78
byte 1 69
byte 1 77
byte 1 65
byte 1 84
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $260
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 83
byte 1 0
align 1
LABELV $242
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $224
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 32
byte 1 0
align 1
LABELV $206
byte 1 80
byte 1 76
byte 1 65
byte 1 89
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
byte 1 32
byte 1 79
byte 1 78
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $162
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 116
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $161
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $143
byte 1 49
byte 1 0
align 1
LABELV $142
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $134
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $132
byte 1 84
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 40
byte 1 99
byte 1 41
byte 1 50
byte 1 48
byte 1 48
byte 1 54
byte 1 44
byte 1 32
byte 1 71
byte 1 80
byte 1 76
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
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
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 70
byte 1 79
byte 1 82
byte 1 32
byte 1 77
byte 1 65
byte 1 84
byte 1 85
byte 1 82
byte 1 69
byte 1 32
byte 1 65
byte 1 85
byte 1 68
byte 1 73
byte 1 69
byte 1 78
byte 1 67
byte 1 69
byte 1 83
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 68
byte 1 69
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $99
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $96
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
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 53
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $91
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
LABELV $89
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $88
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $87
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
