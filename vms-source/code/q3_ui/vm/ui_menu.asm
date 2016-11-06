code
proc MainMenu_ExitAction 0 0
file "../ui_menu.c"
line 72
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
;15:
;16:#define ID_SINGLEPLAYER			10
;17:#define ID_MULTIPLAYER			11
;18:#define ID_SETUP				12
;19:#define ID_DEMOS				13
;20:#define ID_CINEMATICS			14
;21:#define ID_TEAMARENA		15
;22:#define ID_MODS					16
;23:#define ID_EXIT					17
;24:#define ART_FRAMER				"menu/art/frame1_r"
;25:#define ART_TREPLOGO			"menu/art/treplogo"
;26:
;27:#define SINGLEPLAYER_MENU_VERTICAL_SPACING		34
;28:
;29:#define ART_BACK0		"menu/art/back_2"
;30:#define ART_BACK1		"menu/art/back_1"	
;31://#define ART_FRAMEL		"menu/art/frame2_l"
;32:#define ART_FRAMEL		"menu/art/frame1_r"
;33:
;34:
;35:
;36:#define MAIN_BANNER_MODEL				"models/mapobjects/banner/banner5.md3"
;37:#define MAIN_MENU_VERTICAL_SPACING		34
;38:
;39:
;40:typedef struct {
;41:	menuframework_s	menu;
;42:
;43:	menutext_s		singleplayer;
;44:	menutext_s		multiplayer;
;45:	menutext_s		setup;
;46:	menutext_s		demos;
;47:	menutext_s		cinematics;
;48:	menutext_s		teamArena;
;49:	menutext_s		mods;
;50:	menutext_s		exit;
;51:	menubitmap_s	framer;
;52:	menubitmap_s	treplogo;
;53:
;54:	qhandle_t		bannerModel;
;55:} mainmenu_t;
;56:
;57:
;58:static mainmenu_t s_main;
;59:
;60:typedef struct {
;61:	menuframework_s menu;	
;62:	char errorMessage[4096];
;63:} errorMessage_t;
;64:
;65:static errorMessage_t s_errorMessage;
;66:
;67:/*
;68:=================
;69:MainMenu_ExitAction
;70:=================
;71:*/
;72:static void MainMenu_ExitAction( qboolean result ) {
line 73
;73:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $72
line 74
;74:		return;
ADDRGP4 $71
JUMPV
LABELV $72
line 76
;75:	}
;76:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 77
;77:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 78
;78:}
LABELV $71
endproc MainMenu_ExitAction 0 0
export Main_MenuEvent
proc Main_MenuEvent 8 12
line 87
;79:
;80:
;81:
;82:/*
;83:=================
;84:Main_MenuEvent
;85:=================
;86:*/
;87:void Main_MenuEvent (void* ptr, int event) {
line 88
;88:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $75
line 89
;89:		return;
ADDRGP4 $74
JUMPV
LABELV $75
line 92
;90:	}
;91:
;92:	switch( ((menucommon_s*)ptr)->id ) {
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
line 97
;93:	case ID_SINGLEPLAYER:
;94:		//UI_SPLevelMenu();
;95:		//UI_OfflineMenu();
;96:
;97:		UI_SinglePlayerMenu();
ADDRGP4 UI_SinglePlayerMenu
CALLI4
pop
line 99
;98:		//UI_StartServerMenu( qfalse );
;99:		break;
ADDRGP4 $78
JUMPV
LABELV $81
line 102
;100:
;101:	case ID_MULTIPLAYER:
;102:		UI_ArenaServersMenu();
ADDRGP4 UI_ArenaServersMenu
CALLV
pop
line 103
;103:		break;
ADDRGP4 $78
JUMPV
LABELV $82
line 106
;104:
;105:	case ID_SETUP:
;106:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 107
;107:		break;
ADDRGP4 $78
JUMPV
LABELV $83
line 110
;108:
;109:	case ID_DEMOS:
;110:		UI_DemosMenu();
ADDRGP4 UI_DemosMenu
CALLV
pop
line 111
;111:		break;
ADDRGP4 $78
JUMPV
LABELV $84
line 114
;112:
;113:	case ID_CINEMATICS:
;114:		UI_CinematicsMenu();
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 115
;115:		break;
ADDRGP4 $78
JUMPV
LABELV $85
line 118
;116:
;117:	case ID_MODS:
;118:		UI_ModsMenu();
ADDRGP4 UI_ModsMenu
CALLV
pop
line 119
;119:		break;
ADDRGP4 $78
JUMPV
LABELV $86
line 122
;120:
;121:	case ID_TEAMARENA:
;122:		trap_Cvar_Set( "fs_game", "missionpack");
ADDRGP4 $87
ARGP4
ADDRGP4 $88
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 123
;123:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $89
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 124
;124:		break;
ADDRGP4 $78
JUMPV
LABELV $90
line 127
;125:
;126:	case ID_EXIT:
;127:		UI_ConfirmMenu( "EXIT GAME?", (voidfunc_f)NULL, MainMenu_ExitAction );
ADDRGP4 $91
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 MainMenu_ExitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 128
;128:		break;
LABELV $77
LABELV $78
line 130
;129:	}
;130:}
LABELV $74
endproc Main_MenuEvent 8 12
export MainMenu_Cache
proc MainMenu_Cache 4 4
line 138
;131:
;132:
;133:/*
;134:===============
;135:MainMenu_Cache
;136:===============
;137:*/
;138:void MainMenu_Cache( void ) {
line 139
;139:	s_main.bannerModel = trap_R_RegisterModel( MAIN_BANNER_MODEL );
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
line 140
;140:}
LABELV $94
endproc MainMenu_Cache 4 4
export ErrorMessage_Key
proc ErrorMessage_Key 0 8
line 143
;141:
;142:sfxHandle_t ErrorMessage_Key(int key)
;143:{
line 144
;144:	trap_Cvar_Set( "com_errorMessage", "" );
ADDRGP4 $98
ARGP4
ADDRGP4 $99
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 145
;145:	UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 146
;146:	return (menu_null_sound);
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
line 156
;147:}
;148:
;149:/*
;150:===============
;151:Main_MenuDraw
;152:TTimo: this function is common to the main menu and errorMessage menu
;153:===============
;154:*/
;155:
;156:static void Main_MenuDraw( void ) {
line 163
;157:	refdef_t		refdef;
;158:	refEntity_t		ent;
;159:	vec3_t			origin;
;160:	vec3_t			angles;
;161:	float			adjust;
;162:	float			x, y, w, h;
;163:	vec4_t			color = {0.5, 0, 0, 1};
ADDRLP4 552
ADDRGP4 $101
INDIRB
ASGNB 16
line 167
;164:
;165:	// setup the refdef
;166:
;167:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 169
;168:
;169:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 171
;170:
;171:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 173
;172:
;173:	x = 0;
ADDRLP4 536
CNSTF4 0
ASGNF4
line 174
;174:	y = 0;
ADDRLP4 540
CNSTF4 0
ASGNF4
line 175
;175:	w = 640;
ADDRLP4 544
CNSTF4 1142947840
ASGNF4
line 176
;176:	h = 120;
ADDRLP4 548
CNSTF4 1123024896
ASGNF4
line 177
;177:	UI_AdjustFrom640( &x, &y, &w, &h );
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
line 178
;178:	refdef.x = x;
ADDRLP4 0
ADDRLP4 536
INDIRF4
CVFI4 4
ASGNI4
line 179
;179:	refdef.y = y;
ADDRLP4 0+4
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
line 180
;180:	refdef.width = w;
ADDRLP4 0+8
ADDRLP4 544
INDIRF4
CVFI4 4
ASGNI4
line 181
;181:	refdef.height = h;
ADDRLP4 0+12
ADDRLP4 548
INDIRF4
CVFI4 4
ASGNI4
line 183
;182:
;183:	adjust = 0; // JDC: Kenneth asked me to stop this 1.0 * sin( (float)uis.realtime / 1000 );
ADDRLP4 520
CNSTF4 0
ASGNF4
line 184
;184:	refdef.fov_x = 60 + adjust;
ADDRLP4 0+16
ADDRLP4 520
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 185
;185:	refdef.fov_y = 19.6875 + adjust;
ADDRLP4 0+20
ADDRLP4 520
INDIRF4
CNSTF4 1100840960
ADDF4
ASGNF4
line 187
;186:
;187:	refdef.time = uis.realtime;
ADDRLP4 0+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 189
;188:
;189:	origin[0] = 300;
ADDRLP4 508
CNSTF4 1133903872
ASGNF4
line 190
;190:	origin[1] = 0;
ADDRLP4 508+4
CNSTF4 0
ASGNF4
line 191
;191:	origin[2] = -32;
ADDRLP4 508+8
CNSTF4 3254779904
ASGNF4
line 193
;192:
;193:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 197
;194:
;195:	// add the model
;196:
;197:	memset( &ent, 0, sizeof(ent) );
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 199
;198:
;199:	adjust = 5.0 * sin( (float)uis.realtime / 5000 );
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
line 200
;200:	VectorSet( angles, 0, 180 + adjust, 0 );
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
line 201
;201:	AnglesToAxis( angles, ent.axis );
ADDRLP4 524
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 202
;202:	ent.hModel = s_main.bannerModel;
ADDRLP4 368+8
ADDRGP4 s_main+1040
INDIRI4
ASGNI4
line 203
;203:	VectorCopy( origin, ent.origin );
ADDRLP4 368+68
ADDRLP4 508
INDIRB
ASGNB 12
line 204
;204:	VectorCopy( origin, ent.lightingOrigin );
ADDRLP4 368+12
ADDRLP4 508
INDIRB
ASGNB 12
line 205
;205:	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
ADDRLP4 368+4
CNSTI4 192
ASGNI4
line 206
;206:	VectorCopy( ent.origin, ent.oldorigin );
ADDRLP4 368+84
ADDRLP4 368+68
INDIRB
ASGNB 12
line 208
;207:
;208:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 210
;209:
;210:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 212
;211:	
;212:	if (strlen(s_errorMessage.errorMessage))
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
line 213
;213:	{
line 214
;214:		UI_DrawProportionalString_AutoWrapped( 320, 192, 600, 20, s_errorMessage.errorMessage, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
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
line 215
;215:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 217
;216:	else
;217:	{
line 219
;218:		// standard menu drawing
;219:		Menu_Draw( &s_main.menu );		
ADDRGP4 s_main
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 220
;220:	}
LABELV $125
line 222
;221:
;222:	if (uis.demoversion) {
ADDRGP4 uis+11440
INDIRI4
CNSTI4 0
EQI4 $128
line 223
;223:		UI_DrawProportionalString( 320, 372, "DEMO      FOR MATURE AUDIENCES      DEMO", UI_CENTER|UI_SMALLFONT, color );
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
line 224
;224:		UI_DrawString( 320, 400, "Tredpidation (c)2016, Team Trepidation", UI_CENTER|UI_SMALLFONT, color );
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
line 225
;225:	} else {
ADDRGP4 $129
JUMPV
LABELV $128
line 226
;226:		UI_DrawString( 320, 450, "Tredpidation (c)2016, Team Trepidation", UI_CENTER|UI_SMALLFONT, color );
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
line 227
;227:	}
LABELV $129
line 228
;228:}
LABELV $100
endproc Main_MenuDraw 576 28
proc UI_TeamArenaExists 2084 16
line 236
;229:
;230:
;231:/*
;232:===============
;233:UI_TeamArenaExists
;234:===============
;235:*/
;236:static qboolean UI_TeamArenaExists( void ) {
line 244
;237:	int		numdirs;
;238:	char	dirlist[2048];
;239:	char	*dirptr;
;240:  char  *descptr;
;241:	int		i;
;242:	int		dirlen;
;243:
;244:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
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
line 245
;245:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 246
;246:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
line 247
;247:		dirlen = strlen( dirptr ) + 1;
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
line 248
;248:    descptr = dirptr + dirlen;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 249
;249:		if (Q_stricmp(dirptr, "missionpack") == 0) {
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
line 250
;250:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $133
JUMPV
LABELV $139
line 252
;251:		}
;252:    dirptr += dirlen + strlen(descptr) + 1;
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
line 253
;253:	}
LABELV $136
line 246
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
line 254
;254:	return qfalse;
CNSTI4 0
RETI4
LABELV $133
endproc UI_TeamArenaExists 2084 16
export UI_MainMenu
proc UI_MainMenu 40 12
line 267
;255:}
;256:
;257:
;258:/*
;259:===============
;260:UI_MainMenu
;261:
;262:The main menu only comes up when not in a game,
;263:so make sure that the attract loop server is down
;264:and that local cinematics are killed
;265:===============
;266:*/
;267:void UI_MainMenu( void ) {
line 269
;268:	int		y;
;269:	qboolean teamArena = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 270
;270:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 272
;271:
;272:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $142
ARGP4
ADDRGP4 $143
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 274
;273:
;274:	if( !uis.demoversion && !ui_cdkeychecked.integer ) {
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
line 277
;275:		char	key[17];
;276:
;277:		trap_GetCDKey( key, sizeof(key) );
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 278
;278:		if( trap_VerifyCDKey( key, NULL ) == qfalse ) {
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
line 281
;279:			//UI_CDKeyMenu();
;280:			//return;
;281:		}
LABELV $148
line 282
;282:	}
LABELV $144
line 284
;283:	
;284:	memset( &s_main, 0 ,sizeof(mainmenu_t) );
ADDRGP4 s_main
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1044
ARGI4
ADDRGP4 memset
CALLP4
pop
line 285
;285:	memset( &s_errorMessage, 0 ,sizeof(errorMessage_t) );
ADDRGP4 s_errorMessage
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4384
ARGI4
ADDRGP4 memset
CALLP4
pop
line 288
;286:
;287:	// com_errorMessage would need that too
;288:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 290
;289:	
;290:	trap_Cvar_VariableStringBuffer( "com_errorMessage", s_errorMessage.errorMessage, sizeof(s_errorMessage.errorMessage) );
ADDRGP4 $98
ARGP4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 291
;291:	if (strlen(s_errorMessage.errorMessage))
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
line 292
;292:	{	
line 293
;293:		s_errorMessage.menu.draw = Main_MenuDraw;
ADDRGP4 s_errorMessage+268
ADDRGP4 Main_MenuDraw
ASGNP4
line 294
;294:		s_errorMessage.menu.key = ErrorMessage_Key;
ADDRGP4 s_errorMessage+272
ADDRGP4 ErrorMessage_Key
ASGNP4
line 295
;295:		s_errorMessage.menu.fullscreen = qtrue;
ADDRGP4 s_errorMessage+280
CNSTI4 1
ASGNI4
line 296
;296:		s_errorMessage.menu.wrapAround = qtrue;
ADDRGP4 s_errorMessage+276
CNSTI4 1
ASGNI4
line 297
;297:		s_errorMessage.menu.showlogo = qfalse;	// Shafe - Trep - Temporarily qfalse
ADDRGP4 s_errorMessage+284
CNSTI4 0
ASGNI4
line 299
;298:
;299:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 300
;300:		uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 301
;301:		UI_PushMenu ( &s_errorMessage.menu );
ADDRGP4 s_errorMessage
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 303
;302:		
;303:		return;
ADDRGP4 $141
JUMPV
LABELV $152
line 307
;304:	}
;305:
;306:
;307:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $161
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 308
;308:	trap_R_RegisterShaderNoMip( ART_TREPLOGO );
ADDRGP4 $162
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 310
;309:
;310:	s_main.menu.draw = Main_MenuDraw;
ADDRGP4 s_main+268
ADDRGP4 Main_MenuDraw
ASGNP4
line 311
;311:	s_main.menu.fullscreen = qtrue;
ADDRGP4 s_main+280
CNSTI4 1
ASGNI4
line 312
;312:	s_main.menu.wrapAround = qtrue;
ADDRGP4 s_main+276
CNSTI4 1
ASGNI4
line 313
;313:	s_main.menu.showlogo = qfalse; // Shafe - Trep - Temporarily qfalse
ADDRGP4 s_main+284
CNSTI4 0
ASGNI4
line 315
;314:
;315:	s_main.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_main+864
CNSTI4 6
ASGNI4
line 316
;316:	s_main.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_main+864+4
ADDRGP4 $161
ASGNP4
line 317
;317:	s_main.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_main+864+44
CNSTU4 16384
ASGNU4
line 318
;318:	s_main.framer.generic.x			= 0;  
ADDRGP4 s_main+864+12
CNSTI4 0
ASGNI4
line 319
;319:	s_main.framer.generic.y			= 0;
ADDRGP4 s_main+864+16
CNSTI4 0
ASGNI4
line 320
;320:	s_main.framer.width				= 800;
ADDRGP4 s_main+864+76
CNSTI4 800
ASGNI4
line 321
;321:	s_main.framer.height			= 600;
ADDRGP4 s_main+864+80
CNSTI4 600
ASGNI4
line 324
;322:
;323:
;324:	s_main.treplogo.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_main+952
CNSTI4 6
ASGNI4
line 325
;325:	s_main.treplogo.generic.name		= ART_TREPLOGO;
ADDRGP4 s_main+952+4
ADDRGP4 $162
ASGNP4
line 326
;326:	s_main.treplogo.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_main+952+44
CNSTU4 16384
ASGNU4
line 327
;327:	s_main.treplogo.generic.x			= 0;  
ADDRGP4 s_main+952+12
CNSTI4 0
ASGNI4
line 328
;328:	s_main.treplogo.generic.y			= 1;
ADDRGP4 s_main+952+16
CNSTI4 1
ASGNI4
line 329
;329:	s_main.treplogo.width				= 225;
ADDRGP4 s_main+952+76
CNSTI4 225
ASGNI4
line 330
;330:	s_main.treplogo.height			= 100;
ADDRGP4 s_main+952+80
CNSTI4 100
ASGNI4
line 333
;331:
;332:
;333:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 334
;334:	s_main.multiplayer.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+360
CNSTI4 9
ASGNI4
line 335
;335:	s_main.multiplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+360+44
CNSTU4 264
ASGNU4
line 336
;336:	s_main.multiplayer.generic.x			= 320;
ADDRGP4 s_main+360+12
CNSTI4 320
ASGNI4
line 337
;337:	s_main.multiplayer.generic.y			= y;
ADDRGP4 s_main+360+16
ADDRLP4 0
INDIRI4
ASGNI4
line 338
;338:	s_main.multiplayer.generic.id			= ID_MULTIPLAYER;
ADDRGP4 s_main+360+8
CNSTI4 11
ASGNI4
line 339
;339:	s_main.multiplayer.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+360+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 340
;340:	s_main.multiplayer.string				= "PLAY TREPIDATION ONLINE"; // Shafe - Trep - Minor Text Change
ADDRGP4 s_main+360+60
ADDRGP4 $206
ASGNP4
line 341
;341:	s_main.multiplayer.color				= color_red;
ADDRGP4 s_main+360+68
ADDRGP4 color_red
ASGNP4
line 342
;342:	s_main.multiplayer.style				= style;
ADDRGP4 s_main+360+64
ADDRLP4 4
INDIRI4
ASGNI4
line 345
;343:
;344:
;345:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 346
;346:	s_main.singleplayer.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_main+288
CNSTI4 9
ASGNI4
line 347
;347:	s_main.singleplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+288+44
CNSTU4 264
ASGNU4
line 348
;348:	s_main.singleplayer.generic.x			= 320;
ADDRGP4 s_main+288+12
CNSTI4 320
ASGNI4
line 349
;349:	s_main.singleplayer.generic.y			= y;
ADDRGP4 s_main+288+16
ADDRLP4 0
INDIRI4
ASGNI4
line 350
;350:	s_main.singleplayer.generic.id			= ID_SINGLEPLAYER;
ADDRGP4 s_main+288+8
CNSTI4 10
ASGNI4
line 351
;351:	s_main.singleplayer.generic.callback	= Main_MenuEvent; 
ADDRGP4 s_main+288+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 352
;352:	s_main.singleplayer.string				= "SINGLE PLAYER";
ADDRGP4 s_main+288+60
ADDRGP4 $224
ASGNP4
line 353
;353:	s_main.singleplayer.color				= color_red;
ADDRGP4 s_main+288+68
ADDRGP4 color_red
ASGNP4
line 354
;354:	s_main.singleplayer.style				= style;
ADDRGP4 s_main+288+64
ADDRLP4 4
INDIRI4
ASGNI4
line 357
;355:	
;356:	
;357:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 358
;358:	s_main.setup.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+432
CNSTI4 9
ASGNI4
line 359
;359:	s_main.setup.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+432+44
CNSTU4 264
ASGNU4
line 360
;360:	s_main.setup.generic.x					= 320;
ADDRGP4 s_main+432+12
CNSTI4 320
ASGNI4
line 361
;361:	s_main.setup.generic.y					= y;
ADDRGP4 s_main+432+16
ADDRLP4 0
INDIRI4
ASGNI4
line 362
;362:	s_main.setup.generic.id					= ID_SETUP;
ADDRGP4 s_main+432+8
CNSTI4 12
ASGNI4
line 363
;363:	s_main.setup.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+432+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 364
;364:	s_main.setup.string						= "SETUP";
ADDRGP4 s_main+432+60
ADDRGP4 $242
ASGNP4
line 365
;365:	s_main.setup.color						= color_red;
ADDRGP4 s_main+432+68
ADDRGP4 color_red
ASGNP4
line 366
;366:	s_main.setup.style						= style;
ADDRGP4 s_main+432+64
ADDRLP4 4
INDIRI4
ASGNI4
line 369
;367:
;368:	
;369:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 370
;370:	s_main.demos.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+504
CNSTI4 9
ASGNI4
line 371
;371:	s_main.demos.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+504+44
CNSTU4 264
ASGNU4
line 372
;372:	s_main.demos.generic.x					= 320;
ADDRGP4 s_main+504+12
CNSTI4 320
ASGNI4
line 373
;373:	s_main.demos.generic.y					= y;
ADDRGP4 s_main+504+16
ADDRLP4 0
INDIRI4
ASGNI4
line 374
;374:	s_main.demos.generic.id					= ID_DEMOS;
ADDRGP4 s_main+504+8
CNSTI4 13
ASGNI4
line 375
;375:	s_main.demos.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+504+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 376
;376:	s_main.demos.string						= "DEMOS";
ADDRGP4 s_main+504+60
ADDRGP4 $260
ASGNP4
line 377
;377:	s_main.demos.color						= color_red;
ADDRGP4 s_main+504+68
ADDRGP4 color_red
ASGNP4
line 378
;378:	s_main.demos.style						= style;
ADDRGP4 s_main+504+64
ADDRLP4 4
INDIRI4
ASGNI4
line 381
;379:
;380:	//y += MAIN_MENU_VERTICAL_SPACING;
;381:	s_main.cinematics.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+576
CNSTI4 9
ASGNI4
line 382
;382:	s_main.cinematics.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+576+44
CNSTU4 264
ASGNU4
line 383
;383:	s_main.cinematics.generic.x				= 320;
ADDRGP4 s_main+576+12
CNSTI4 320
ASGNI4
line 384
;384:	s_main.cinematics.generic.y				= y;
ADDRGP4 s_main+576+16
ADDRLP4 0
INDIRI4
ASGNI4
line 385
;385:	s_main.cinematics.generic.id			= ID_CINEMATICS;
ADDRGP4 s_main+576+8
CNSTI4 14
ASGNI4
line 386
;386:	s_main.cinematics.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+576+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 387
;387:	s_main.cinematics.string				= "CINEMATICS";
ADDRGP4 s_main+576+60
ADDRGP4 $278
ASGNP4
line 388
;388:	s_main.cinematics.color					= color_red;
ADDRGP4 s_main+576+68
ADDRGP4 color_red
ASGNP4
line 389
;389:	s_main.cinematics.style					= style;
ADDRGP4 s_main+576+64
ADDRLP4 4
INDIRI4
ASGNI4
line 392
;390:	
;391:
;392:	if (UI_TeamArenaExists()) {
ADDRLP4 20
ADDRGP4 UI_TeamArenaExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $283
line 393
;393:		teamArena = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 394
;394:		y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 395
;395:		s_main.teamArena.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+648
CNSTI4 9
ASGNI4
line 396
;396:		s_main.teamArena.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+648+44
CNSTU4 264
ASGNU4
line 397
;397:		s_main.teamArena.generic.x				= 320;
ADDRGP4 s_main+648+12
CNSTI4 320
ASGNI4
line 398
;398:		s_main.teamArena.generic.y				= y;
ADDRGP4 s_main+648+16
ADDRLP4 0
INDIRI4
ASGNI4
line 399
;399:		s_main.teamArena.generic.id				= ID_TEAMARENA;
ADDRGP4 s_main+648+8
CNSTI4 15
ASGNI4
line 400
;400:		s_main.teamArena.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+648+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 401
;401:		s_main.teamArena.string					= "TEAM ARENA";
ADDRGP4 s_main+648+60
ADDRGP4 $298
ASGNP4
line 402
;402:		s_main.teamArena.color					= color_red;
ADDRGP4 s_main+648+68
ADDRGP4 color_red
ASGNP4
line 403
;403:		s_main.teamArena.style					= style;
ADDRGP4 s_main+648+64
ADDRLP4 4
INDIRI4
ASGNI4
line 404
;404:	}
LABELV $283
line 407
;405:
;406:	//y += MAIN_MENU_VERTICAL_SPACING;
;407:	s_main.mods.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+720
CNSTI4 9
ASGNI4
line 408
;408:	s_main.mods.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+720+44
CNSTU4 264
ASGNU4
line 409
;409:	s_main.mods.generic.x				= 320;
ADDRGP4 s_main+720+12
CNSTI4 320
ASGNI4
line 410
;410:	s_main.mods.generic.y				= y;
ADDRGP4 s_main+720+16
ADDRLP4 0
INDIRI4
ASGNI4
line 411
;411:	s_main.mods.generic.id				= ID_MODS;
ADDRGP4 s_main+720+8
CNSTI4 16
ASGNI4
line 412
;412:	s_main.mods.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+720+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 413
;413:	s_main.mods.string					= "MODS";
ADDRGP4 s_main+720+60
ADDRGP4 $316
ASGNP4
line 414
;414:	s_main.mods.color					= color_red;
ADDRGP4 s_main+720+68
ADDRGP4 color_red
ASGNP4
line 415
;415:	s_main.mods.style					= style;
ADDRGP4 s_main+720+64
ADDRLP4 4
INDIRI4
ASGNI4
line 417
;416:
;417:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 418
;418:	s_main.exit.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+792
CNSTI4 9
ASGNI4
line 419
;419:	s_main.exit.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+792+44
CNSTU4 264
ASGNU4
line 420
;420:	s_main.exit.generic.x					= 320;
ADDRGP4 s_main+792+12
CNSTI4 320
ASGNI4
line 421
;421:	s_main.exit.generic.y					= y;
ADDRGP4 s_main+792+16
ADDRLP4 0
INDIRI4
ASGNI4
line 422
;422:	s_main.exit.generic.id					= ID_EXIT;
ADDRGP4 s_main+792+8
CNSTI4 17
ASGNI4
line 423
;423:	s_main.exit.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+792+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 424
;424:	s_main.exit.string						= "EXIT";
ADDRGP4 s_main+792+60
ADDRGP4 $334
ASGNP4
line 425
;425:	s_main.exit.color						= color_red;
ADDRGP4 s_main+792+68
ADDRGP4 color_red
ASGNP4
line 426
;426:	s_main.exit.style						= style;
ADDRGP4 s_main+792+64
ADDRLP4 4
INDIRI4
ASGNI4
line 428
;427:
;428:	Menu_AddItem( &s_main.menu, ( void * ) &s_main.framer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+864
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 429
;429:	Menu_AddItem( &s_main.menu, ( void * ) &s_main.treplogo );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 431
;430:	
;431:	Menu_AddItem( &s_main.menu,	&s_main.multiplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 432
;432:	Menu_AddItem( &s_main.menu,	&s_main.singleplayer );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 433
;433:	Menu_AddItem( &s_main.menu,	&s_main.setup );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+432
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 434
;434:	Menu_AddItem( &s_main.menu,	&s_main.demos );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 436
;435:	//Menu_AddItem( &s_main.menu,	&s_main.cinematics );
;436:	if (teamArena) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $345
line 437
;437:		Menu_AddItem( &s_main.menu,	&s_main.teamArena );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 438
;438:	}
LABELV $345
line 440
;439:	//Menu_AddItem( &s_main.menu,	&s_main.mods );
;440:	Menu_AddItem( &s_main.menu,	&s_main.exit ); 
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+792
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 443
;441:	
;442:
;443:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 444
;444:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 445
;445:	trap_Cmd_ExecuteText( EXEC_APPEND, "music sound/music/credits\n" );
CNSTI4 2
ARGI4
ADDRGP4 $350
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 446
;446:	UI_PushMenu ( &s_main.menu );
ADDRGP4 s_main
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 448
;447:		
;448:}
LABELV $141
endproc UI_MainMenu 40 12
proc Setup_RunFFA 0 8
line 495
;449:
;450:
;451:
;452://
;453://
;454://
;455:
;456:
;457:#define ID_CREATEMATCH			20
;458:#define ID_ALPHA				21
;459:#define ID_FREEFORALL			22
;460:#define ID_CTF					23
;461:#define ID_ARSENAL				24
;462:#define ID_SURVIVAL				25
;463:#define ID_TREPIDATION			26
;464:#define ID_FREEZETAG			27
;465:#define ID_ONE4ALL				28
;466:#define ID_BACK					29
;467:
;468:
;469:typedef struct {
;470:	menuframework_s	menu;
;471:
;472:	menutext_s		banner;
;473:	menubitmap_s	framel;
;474:	menubitmap_s	framer;
;475:	menutext_s		creatematch;
;476:	menutext_s		alpha;
;477:	menutext_s		freeforall;
;478:	menutext_s		ctf;
;479:	menutext_s		arsenal;
;480:	menutext_s		survival;
;481:	menutext_s		trepidation;
;482:	menutext_s		freezetag;
;483:	menubitmap_s	back;
;484:} singleplayerMenuInfo_t;
;485:
;486:static singleplayerMenuInfo_t	singleplayerMenuInfo;
;487:
;488:
;489:
;490:/*
;491:=================
;492:RUN FFA CFG SP
;493:=================
;494:*/
;495:static void Setup_RunFFA( qboolean result ) {
line 497
;496:	
;497:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/ffa.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $353
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 498
;498:}
LABELV $352
endproc Setup_RunFFA 0 8
proc Setup_RunCTF 0 8
line 504
;499:/*
;500:=================
;501:RUN CTF CFG SP
;502:=================
;503:*/
;504:static void Setup_RunCTF( qboolean result ) {
line 506
;505:	
;506:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/ctf.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $355
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 507
;507:}
LABELV $354
endproc Setup_RunCTF 0 8
proc Setup_RunArsenal 0 8
line 514
;508:
;509:/*
;510:=================
;511:RUN ARSENAL CFG SP
;512:=================
;513:*/
;514:static void Setup_RunArsenal( qboolean result ) {
line 516
;515:	
;516:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/arsenal.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $357
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 517
;517:}
LABELV $356
endproc Setup_RunArsenal 0 8
proc Setup_RunSurvival 0 8
line 524
;518:
;519:/*
;520:=================
;521:RUN SURVIVAL CFG SP
;522:=================
;523:*/
;524:static void Setup_RunSurvival( qboolean result ) {
line 526
;525:	
;526:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/survival.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $359
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 527
;527:}
LABELV $358
endproc Setup_RunSurvival 0 8
proc Setup_RunTrepidation 0 8
line 534
;528:
;529:/*
;530:=================
;531:RUN TREPIDATION CFG SP
;532:=================
;533:*/
;534:static void Setup_RunTrepidation( qboolean result ) {
line 536
;535:
;536:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/trepidation.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $361
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 537
;537:}
LABELV $360
endproc Setup_RunTrepidation 0 8
proc Setup_RunFreeze 0 8
line 546
;538:
;539:
;540:
;541:/*
;542:=================
;543:RUN FREEZE CFG SP
;544:=================
;545:*/
;546:static void Setup_RunFreeze( qboolean result ) {
line 548
;547:	
;548:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/freezetag.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $363
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 549
;549:}
LABELV $362
endproc Setup_RunFreeze 0 8
proc UI_SinglePlayerMenu_Event 8 20
line 560
;550:
;551:
;552:
;553:
;554:
;555:/*
;556:===============
;557:UI_SinglePlayerMenu_Event
;558:===============
;559:*/
;560:static void UI_SinglePlayerMenu_Event( void *ptr, int event ) {
line 561
;561:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $365
line 562
;562:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 565
;563:	}
;564:
;565:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 20
LTI4 $367
ADDRLP4 0
INDIRI4
CNSTI4 29
GTI4 $367
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $380-80
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $380
address $370
address $371
address $373
address $374
address $375
address $376
address $377
address $378
address $367
address $379
code
LABELV $370
line 567
;566:	case ID_CREATEMATCH:
;567:		UI_StartServerMenu( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 568
;568:		break;
ADDRGP4 $368
JUMPV
LABELV $371
line 571
;569:
;570:	case ID_ALPHA:
;571:		UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "CAMPAIGN NOT AVAILABLE (COMING SOON)", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $372
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 572
;572:		break;
ADDRGP4 $368
JUMPV
LABELV $373
line 575
;573:
;574:	case ID_FREEFORALL:
;575:		Setup_RunFFA(0);
CNSTI4 0
ARGI4
ADDRGP4 Setup_RunFFA
CALLV
pop
line 576
;576:		break;
ADDRGP4 $368
JUMPV
LABELV $374
line 579
;577:
;578:	case ID_CTF:
;579:		Setup_RunCTF(0);
CNSTI4 0
ARGI4
ADDRGP4 Setup_RunCTF
CALLV
pop
line 580
;580:		break;
ADDRGP4 $368
JUMPV
LABELV $375
line 583
;581:
;582:	case ID_ARSENAL:
;583:		Setup_RunArsenal(0);
CNSTI4 0
ARGI4
ADDRGP4 Setup_RunArsenal
CALLV
pop
line 584
;584:		break;
ADDRGP4 $368
JUMPV
LABELV $376
line 587
;585:
;586:	case ID_SURVIVAL:
;587:		Setup_RunSurvival(0);
CNSTI4 0
ARGI4
ADDRGP4 Setup_RunSurvival
CALLV
pop
line 588
;588:		break;
ADDRGP4 $368
JUMPV
LABELV $377
line 591
;589:
;590:	case ID_TREPIDATION:
;591:		Setup_RunTrepidation(0);
CNSTI4 0
ARGI4
ADDRGP4 Setup_RunTrepidation
CALLV
pop
line 592
;592:		break;
ADDRGP4 $368
JUMPV
LABELV $378
line 595
;593:
;594:	case ID_FREEZETAG:
;595:		Setup_RunFreeze(0);
CNSTI4 0
ARGI4
ADDRGP4 Setup_RunFreeze
CALLV
pop
line 596
;596:		break;
ADDRGP4 $368
JUMPV
LABELV $379
line 599
;597:
;598:	case ID_BACK:
;599:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 600
;600:		break;
LABELV $367
LABELV $368
line 602
;601:	}
;602:}
LABELV $364
endproc UI_SinglePlayerMenu_Event 8 20
proc UI_SinglePlayerMenu_Init 12 12
line 610
;603:
;604:
;605:/*
;606:===============
;607:UI_SinglePlayerMenu_Init
;608:===============
;609:*/
;610:static void UI_SinglePlayerMenu_Init( void ) {
line 612
;611:	int				y;
;612:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 615
;613:	
;614:	
;615:	UI_SinglePlayerMenu_Cache();
ADDRGP4 UI_SinglePlayerMenu_Cache
CALLI4
pop
line 617
;616:
;617:	memset( &singleplayerMenuInfo, 0, sizeof(singleplayerMenuInfo) );
ADDRGP4 singleplayerMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1200
ARGI4
ADDRGP4 memset
CALLP4
pop
line 618
;618:	singleplayerMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 singleplayerMenuInfo+276
CNSTI4 1
ASGNI4
line 619
;619:	singleplayerMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 singleplayerMenuInfo+280
CNSTI4 1
ASGNI4
line 621
;620:
;621:	singleplayerMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 singleplayerMenuInfo+288
CNSTI4 10
ASGNI4
line 622
;622:	singleplayerMenuInfo.banner.generic.x					= 320;
ADDRGP4 singleplayerMenuInfo+288+12
CNSTI4 320
ASGNI4
line 623
;623:	singleplayerMenuInfo.banner.generic.y					= 16;
ADDRGP4 singleplayerMenuInfo+288+16
CNSTI4 16
ASGNI4
line 624
;624:	singleplayerMenuInfo.banner.string						= "SINGLE PLAYER";
ADDRGP4 singleplayerMenuInfo+288+60
ADDRGP4 $224
ASGNP4
line 625
;625:	singleplayerMenuInfo.banner.color						= color_white;
ADDRGP4 singleplayerMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 626
;626:	singleplayerMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 singleplayerMenuInfo+288+64
CNSTI4 1
ASGNI4
line 629
;627:
;628:
;629:	singleplayerMenuInfo.framel.generic.type				= MTYPE_BITMAP;
ADDRGP4 singleplayerMenuInfo+360
CNSTI4 6
ASGNI4
line 630
;630:	singleplayerMenuInfo.framel.generic.name				= ART_FRAMEL;
ADDRGP4 singleplayerMenuInfo+360+4
ADDRGP4 $161
ASGNP4
line 631
;631:	singleplayerMenuInfo.framel.generic.flags				= QMF_INACTIVE;
ADDRGP4 singleplayerMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 632
;632:	singleplayerMenuInfo.framel.generic.x					= 0;  
ADDRGP4 singleplayerMenuInfo+360+12
CNSTI4 0
ASGNI4
line 633
;633:	singleplayerMenuInfo.framel.generic.y					= 0;
ADDRGP4 singleplayerMenuInfo+360+16
CNSTI4 0
ASGNI4
line 634
;634:	singleplayerMenuInfo.framel.width  					= 800;
ADDRGP4 singleplayerMenuInfo+360+76
CNSTI4 800
ASGNI4
line 635
;635:	singleplayerMenuInfo.framel.height  					= 600;
ADDRGP4 singleplayerMenuInfo+360+80
CNSTI4 600
ASGNI4
line 637
;636:
;637:	singleplayerMenuInfo.framer.generic.type				= MTYPE_BITMAP;
ADDRGP4 singleplayerMenuInfo+448
CNSTI4 6
ASGNI4
line 638
;638:	singleplayerMenuInfo.framer.generic.name				= ART_FRAMER;
ADDRGP4 singleplayerMenuInfo+448+4
ADDRGP4 $161
ASGNP4
line 639
;639:	singleplayerMenuInfo.framer.generic.flags				= QMF_INACTIVE;
ADDRGP4 singleplayerMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 640
;640:	singleplayerMenuInfo.framer.generic.x					= 0;
ADDRGP4 singleplayerMenuInfo+448+12
CNSTI4 0
ASGNI4
line 641
;641:	singleplayerMenuInfo.framer.generic.y					= 0;
ADDRGP4 singleplayerMenuInfo+448+16
CNSTI4 0
ASGNI4
line 642
;642:	singleplayerMenuInfo.framer.width  					= 800;
ADDRGP4 singleplayerMenuInfo+448+76
CNSTI4 800
ASGNI4
line 643
;643:	singleplayerMenuInfo.framer.height  					= 600;
ADDRGP4 singleplayerMenuInfo+448+80
CNSTI4 600
ASGNI4
line 645
;644:
;645:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 646
;646:	singleplayerMenuInfo.creatematch.generic.type			= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+536
CNSTI4 9
ASGNI4
line 647
;647:	singleplayerMenuInfo.creatematch.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+536+44
CNSTU4 264
ASGNU4
line 648
;648:	singleplayerMenuInfo.creatematch.generic.x				= 320;
ADDRGP4 singleplayerMenuInfo+536+12
CNSTI4 320
ASGNI4
line 649
;649:	singleplayerMenuInfo.creatematch.generic.y				= y;
ADDRGP4 singleplayerMenuInfo+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 650
;650:	singleplayerMenuInfo.creatematch.generic.id				= ID_CREATEMATCH;
ADDRGP4 singleplayerMenuInfo+536+8
CNSTI4 20
ASGNI4
line 651
;651:	singleplayerMenuInfo.creatematch.generic.callback		= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+536+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 652
;652:	singleplayerMenuInfo.creatematch.string				= "CREATE MATCH";
ADDRGP4 singleplayerMenuInfo+536+60
ADDRGP4 $435
ASGNP4
line 653
;653:	singleplayerMenuInfo.creatematch.color					= color_red;
ADDRGP4 singleplayerMenuInfo+536+68
ADDRGP4 color_red
ASGNP4
line 654
;654:	singleplayerMenuInfo.creatematch.style					= style;
ADDRGP4 singleplayerMenuInfo+536+64
ADDRLP4 4
INDIRI4
ASGNI4
line 656
;655:
;656:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 657
;657:	singleplayerMenuInfo.alpha.generic.type				= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+608
CNSTI4 9
ASGNI4
line 658
;658:	singleplayerMenuInfo.alpha.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+608+44
CNSTU4 264
ASGNU4
line 659
;659:	singleplayerMenuInfo.alpha.generic.x					= 320;
ADDRGP4 singleplayerMenuInfo+608+12
CNSTI4 320
ASGNI4
line 660
;660:	singleplayerMenuInfo.alpha.generic.y					= y;
ADDRGP4 singleplayerMenuInfo+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 661
;661:	singleplayerMenuInfo.alpha.generic.id					= ID_ALPHA;
ADDRGP4 singleplayerMenuInfo+608+8
CNSTI4 21
ASGNI4
line 662
;662:	singleplayerMenuInfo.alpha.generic.callback			= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+608+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 663
;663:	singleplayerMenuInfo.alpha.string						= "ALPHA CAMPAIGN";
ADDRGP4 singleplayerMenuInfo+608+60
ADDRGP4 $453
ASGNP4
line 664
;664:	singleplayerMenuInfo.alpha.color						= color_white;
ADDRGP4 singleplayerMenuInfo+608+68
ADDRGP4 color_white
ASGNP4
line 665
;665:	singleplayerMenuInfo.alpha.style						= UI_CENTER;
ADDRGP4 singleplayerMenuInfo+608+64
CNSTI4 1
ASGNI4
line 667
;666:
;667:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 668
;668:	singleplayerMenuInfo.freeforall.generic.type		= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+680
CNSTI4 9
ASGNI4
line 669
;669:	singleplayerMenuInfo.freeforall.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+680+44
CNSTU4 264
ASGNU4
line 670
;670:	singleplayerMenuInfo.freeforall.generic.x			= 320;
ADDRGP4 singleplayerMenuInfo+680+12
CNSTI4 320
ASGNI4
line 671
;671:	singleplayerMenuInfo.freeforall.generic.y			= y;
ADDRGP4 singleplayerMenuInfo+680+16
ADDRLP4 0
INDIRI4
ASGNI4
line 672
;672:	singleplayerMenuInfo.freeforall.generic.id			= ID_FREEFORALL;
ADDRGP4 singleplayerMenuInfo+680+8
CNSTI4 22
ASGNI4
line 673
;673:	singleplayerMenuInfo.freeforall.generic.callback		= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+680+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 674
;674:	singleplayerMenuInfo.freeforall.string				= "FREE FOR ALL";
ADDRGP4 singleplayerMenuInfo+680+60
ADDRGP4 $471
ASGNP4
line 675
;675:	singleplayerMenuInfo.freeforall.color				= color_red;
ADDRGP4 singleplayerMenuInfo+680+68
ADDRGP4 color_red
ASGNP4
line 676
;676:	singleplayerMenuInfo.freeforall.style				= style;
ADDRGP4 singleplayerMenuInfo+680+64
ADDRLP4 4
INDIRI4
ASGNI4
line 678
;677:
;678:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 679
;679:	singleplayerMenuInfo.ctf.generic.type			= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+752
CNSTI4 9
ASGNI4
line 680
;680:	singleplayerMenuInfo.ctf.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+752+44
CNSTU4 264
ASGNU4
line 681
;681:	singleplayerMenuInfo.ctf.generic.x				= 320;
ADDRGP4 singleplayerMenuInfo+752+12
CNSTI4 320
ASGNI4
line 682
;682:	singleplayerMenuInfo.ctf.generic.y				= y;
ADDRGP4 singleplayerMenuInfo+752+16
ADDRLP4 0
INDIRI4
ASGNI4
line 683
;683:	singleplayerMenuInfo.ctf.generic.id				= ID_CTF;
ADDRGP4 singleplayerMenuInfo+752+8
CNSTI4 23
ASGNI4
line 684
;684:	singleplayerMenuInfo.ctf.generic.callback		= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+752+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 685
;685:	singleplayerMenuInfo.ctf.string				= "CAPTURE THE FLAG";
ADDRGP4 singleplayerMenuInfo+752+60
ADDRGP4 $489
ASGNP4
line 686
;686:	singleplayerMenuInfo.ctf.color					= color_red;
ADDRGP4 singleplayerMenuInfo+752+68
ADDRGP4 color_red
ASGNP4
line 687
;687:	singleplayerMenuInfo.ctf.style					= style;
ADDRGP4 singleplayerMenuInfo+752+64
ADDRLP4 4
INDIRI4
ASGNI4
line 689
;688:
;689:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 690
;690:	singleplayerMenuInfo.arsenal.generic.type					= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+824
CNSTI4 9
ASGNI4
line 691
;691:	singleplayerMenuInfo.arsenal.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+824+44
CNSTU4 264
ASGNU4
line 692
;692:	singleplayerMenuInfo.arsenal.generic.x					= 320;
ADDRGP4 singleplayerMenuInfo+824+12
CNSTI4 320
ASGNI4
line 693
;693:	singleplayerMenuInfo.arsenal.generic.y					= y;
ADDRGP4 singleplayerMenuInfo+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 694
;694:	singleplayerMenuInfo.arsenal.generic.id					= ID_ARSENAL;
ADDRGP4 singleplayerMenuInfo+824+8
CNSTI4 24
ASGNI4
line 695
;695:	singleplayerMenuInfo.arsenal.generic.callback				= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+824+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 696
;696:	singleplayerMenuInfo.arsenal.string						= "ARSENAL";
ADDRGP4 singleplayerMenuInfo+824+60
ADDRGP4 $507
ASGNP4
line 697
;697:	singleplayerMenuInfo.arsenal.color						= color_red;
ADDRGP4 singleplayerMenuInfo+824+68
ADDRGP4 color_red
ASGNP4
line 698
;698:	singleplayerMenuInfo.arsenal.style						= style;
ADDRGP4 singleplayerMenuInfo+824+64
ADDRLP4 4
INDIRI4
ASGNI4
line 700
;699:
;700:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 701
;701:	singleplayerMenuInfo.survival.generic.type				= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+896
CNSTI4 9
ASGNI4
line 702
;702:	singleplayerMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+896+44
CNSTU4 264
ASGNU4
line 703
;703:	singleplayerMenuInfo.survival.generic.x					= 320;
ADDRGP4 singleplayerMenuInfo+896+12
CNSTI4 320
ASGNI4
line 704
;704:	singleplayerMenuInfo.survival.generic.y					= y;
ADDRGP4 singleplayerMenuInfo+896+16
ADDRLP4 0
INDIRI4
ASGNI4
line 705
;705:	singleplayerMenuInfo.survival.generic.id					= ID_SURVIVAL;
ADDRGP4 singleplayerMenuInfo+896+8
CNSTI4 25
ASGNI4
line 706
;706:	singleplayerMenuInfo.survival.generic.callback			= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+896+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 707
;707:	singleplayerMenuInfo.survival.string						= "SURVIVAL";
ADDRGP4 singleplayerMenuInfo+896+60
ADDRGP4 $525
ASGNP4
line 708
;708:	singleplayerMenuInfo.survival.color						= color_red;
ADDRGP4 singleplayerMenuInfo+896+68
ADDRGP4 color_red
ASGNP4
line 709
;709:	singleplayerMenuInfo.survival.style						= style;
ADDRGP4 singleplayerMenuInfo+896+64
ADDRLP4 4
INDIRI4
ASGNI4
line 711
;710:
;711:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 712
;712:	singleplayerMenuInfo.trepidation.generic.type				= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+968
CNSTI4 9
ASGNI4
line 713
;713:	singleplayerMenuInfo.trepidation.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+968+44
CNSTU4 264
ASGNU4
line 714
;714:	singleplayerMenuInfo.trepidation.generic.x					= 320;
ADDRGP4 singleplayerMenuInfo+968+12
CNSTI4 320
ASGNI4
line 715
;715:	singleplayerMenuInfo.trepidation.generic.y					= y;
ADDRGP4 singleplayerMenuInfo+968+16
ADDRLP4 0
INDIRI4
ASGNI4
line 716
;716:	singleplayerMenuInfo.trepidation.generic.id					= ID_TREPIDATION;
ADDRGP4 singleplayerMenuInfo+968+8
CNSTI4 26
ASGNI4
line 717
;717:	singleplayerMenuInfo.trepidation.generic.callback			= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+968+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 718
;718:	singleplayerMenuInfo.trepidation.string						= "TREPIDATION";
ADDRGP4 singleplayerMenuInfo+968+60
ADDRGP4 $543
ASGNP4
line 719
;719:	singleplayerMenuInfo.trepidation.color						= color_red;
ADDRGP4 singleplayerMenuInfo+968+68
ADDRGP4 color_red
ASGNP4
line 720
;720:	singleplayerMenuInfo.trepidation.style						= style;
ADDRGP4 singleplayerMenuInfo+968+64
ADDRLP4 4
INDIRI4
ASGNI4
line 722
;721:
;722:	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 723
;723:	singleplayerMenuInfo.freezetag.generic.type				= MTYPE_PTEXT;
ADDRGP4 singleplayerMenuInfo+1040
CNSTI4 9
ASGNI4
line 724
;724:	singleplayerMenuInfo.freezetag.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+1040+44
CNSTU4 264
ASGNU4
line 725
;725:	singleplayerMenuInfo.freezetag.generic.x					= 320;
ADDRGP4 singleplayerMenuInfo+1040+12
CNSTI4 320
ASGNI4
line 726
;726:	singleplayerMenuInfo.freezetag.generic.y					= y;
ADDRGP4 singleplayerMenuInfo+1040+16
ADDRLP4 0
INDIRI4
ASGNI4
line 727
;727:	singleplayerMenuInfo.freezetag.generic.id					= ID_FREEZETAG;
ADDRGP4 singleplayerMenuInfo+1040+8
CNSTI4 27
ASGNI4
line 728
;728:	singleplayerMenuInfo.freezetag.generic.callback			= UI_SinglePlayerMenu_Event; 
ADDRGP4 singleplayerMenuInfo+1040+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 729
;729:	singleplayerMenuInfo.freezetag.string						= "FREEZE TAG";
ADDRGP4 singleplayerMenuInfo+1040+60
ADDRGP4 $561
ASGNP4
line 730
;730:	singleplayerMenuInfo.freezetag.color						= color_red;
ADDRGP4 singleplayerMenuInfo+1040+68
ADDRGP4 color_red
ASGNP4
line 731
;731:	singleplayerMenuInfo.freezetag.style						= style;
ADDRGP4 singleplayerMenuInfo+1040+64
ADDRLP4 4
INDIRI4
ASGNI4
line 736
;732:
;733:
;734:	
;735:
;736:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $568
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $566
line 761
;737:#if 0
;738:		y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
;739:		singleplayerMenuInfo.load.generic.type					= MTYPE_PTEXT;
;740:		singleplayerMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;741:		singleplayerMenuInfo.load.generic.x					= 320;
;742:		singleplayerMenuInfo.load.generic.y					= y;
;743:		singleplayerMenuInfo.load.generic.id					= ID_LOAD;
;744:		singleplayerMenuInfo.load.generic.callback				= UI_SinglePlayerMenu_Event; 
;745:		singleplayerMenuInfo.load.string						= "LOAD";
;746:		singleplayerMenuInfo.load.color						= color_red;
;747:		singleplayerMenuInfo.load.style						= UI_CENTER;
;748:
;749:		y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
;750:		singleplayerMenuInfo.save.generic.type					= MTYPE_PTEXT;
;751:		singleplayerMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;752:		singleplayerMenuInfo.save.generic.x					= 320;
;753:		singleplayerMenuInfo.save.generic.y					= y;
;754:		singleplayerMenuInfo.save.generic.id					= ID_SAVE;
;755:		singleplayerMenuInfo.save.generic.callback				= UI_SinglePlayerMenu_Event; 
;756:		singleplayerMenuInfo.save.string						= "SAVE";
;757:		singleplayerMenuInfo.save.color						= color_red;
;758:		singleplayerMenuInfo.save.style						= UI_CENTER;
;759:#endif
;760:
;761:	}
LABELV $566
line 763
;762:
;763:	singleplayerMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 singleplayerMenuInfo+1112
CNSTI4 6
ASGNI4
line 764
;764:	singleplayerMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 singleplayerMenuInfo+1112+4
ADDRGP4 $572
ASGNP4
line 765
;765:	singleplayerMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 singleplayerMenuInfo+1112+44
CNSTU4 260
ASGNU4
line 766
;766:	singleplayerMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 singleplayerMenuInfo+1112+8
CNSTI4 29
ASGNI4
line 767
;767:	singleplayerMenuInfo.back.generic.callback				= UI_SinglePlayerMenu_Event;
ADDRGP4 singleplayerMenuInfo+1112+48
ADDRGP4 UI_SinglePlayerMenu_Event
ASGNP4
line 768
;768:	singleplayerMenuInfo.back.generic.x					= 0;
ADDRGP4 singleplayerMenuInfo+1112+12
CNSTI4 0
ASGNI4
line 769
;769:	singleplayerMenuInfo.back.generic.y					= 480-64;
ADDRGP4 singleplayerMenuInfo+1112+16
CNSTI4 416
ASGNI4
line 770
;770:	singleplayerMenuInfo.back.width						= 128;
ADDRGP4 singleplayerMenuInfo+1112+76
CNSTI4 128
ASGNI4
line 771
;771:	singleplayerMenuInfo.back.height						= 64;
ADDRGP4 singleplayerMenuInfo+1112+80
CNSTI4 64
ASGNI4
line 772
;772:	singleplayerMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 singleplayerMenuInfo+1112+60
ADDRGP4 $589
ASGNP4
line 776
;773:
;774:	
;775:	//Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.framel );
;776:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.framer );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 777
;777:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.banner );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 778
;778:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.creatematch );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 779
;779:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.alpha );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 780
;780:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.freeforall );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 781
;781:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.ctf );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 782
;782:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.arsenal );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 783
;783:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.survival );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 784
;784:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.trepidation );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 785
;785:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.freezetag );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+1040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 787
;786:	
;787:	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.back );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 singleplayerMenuInfo+1112
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 788
;788:}
LABELV $382
endproc UI_SinglePlayerMenu_Init 12 12
export UI_SinglePlayerMenu_Cache
proc UI_SinglePlayerMenu_Cache 0 4
line 796
;789:
;790:
;791:/*
;792:=================
;793:UI_SinglePlayerMenu_Cache
;794:=================
;795:*/
;796:void UI_SinglePlayerMenu_Cache( void ) {
line 797
;797:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $572
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 798
;798:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $589
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 799
;799:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $161
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 800
;800:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $161
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 801
;801:}
LABELV $601
endproc UI_SinglePlayerMenu_Cache 0 4
export UI_SinglePlayerMenu
proc UI_SinglePlayerMenu 0 4
line 809
;802:
;803:
;804:/*
;805:===============
;806:UI_SinglePlayerMenu
;807:===============
;808:*/
;809:void UI_SinglePlayerMenu( void ) {
line 810
;810:	UI_SinglePlayerMenu_Init();
ADDRGP4 UI_SinglePlayerMenu_Init
CALLV
pop
line 811
;811:	UI_PushMenu( &singleplayerMenuInfo.menu );
ADDRGP4 singleplayerMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 812
;812:}
LABELV $602
endproc UI_SinglePlayerMenu 0 4
bss
align 4
LABELV singleplayerMenuInfo
skip 1200
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
import UI_DynamicCommandMenu_f
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
LABELV $589
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $572
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $568
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
LABELV $561
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 90
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $543
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
LABELV $525
byte 1 83
byte 1 85
byte 1 82
byte 1 86
byte 1 73
byte 1 86
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $507
byte 1 65
byte 1 82
byte 1 83
byte 1 69
byte 1 78
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $489
byte 1 67
byte 1 65
byte 1 80
byte 1 84
byte 1 85
byte 1 82
byte 1 69
byte 1 32
byte 1 84
byte 1 72
byte 1 69
byte 1 32
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $471
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 32
byte 1 70
byte 1 79
byte 1 82
byte 1 32
byte 1 65
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $453
byte 1 65
byte 1 76
byte 1 80
byte 1 72
byte 1 65
byte 1 32
byte 1 67
byte 1 65
byte 1 77
byte 1 80
byte 1 65
byte 1 73
byte 1 71
byte 1 78
byte 1 0
align 1
LABELV $435
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 77
byte 1 65
byte 1 84
byte 1 67
byte 1 72
byte 1 0
align 1
LABELV $372
byte 1 67
byte 1 65
byte 1 77
byte 1 80
byte 1 65
byte 1 73
byte 1 71
byte 1 78
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 65
byte 1 86
byte 1 65
byte 1 73
byte 1 76
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 40
byte 1 67
byte 1 79
byte 1 77
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 83
byte 1 79
byte 1 79
byte 1 78
byte 1 41
byte 1 0
align 1
LABELV $363
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 122
byte 1 101
byte 1 116
byte 1 97
byte 1 103
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $361
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
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
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $359
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $357
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $355
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 99
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $353
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 102
byte 1 97
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $350
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 10
byte 1 0
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
byte 1 83
byte 1 73
byte 1 78
byte 1 71
byte 1 76
byte 1 69
byte 1 32
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
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
byte 1 32
byte 1 40
byte 1 99
byte 1 41
byte 1 50
byte 1 48
byte 1 49
byte 1 54
byte 1 44
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
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
