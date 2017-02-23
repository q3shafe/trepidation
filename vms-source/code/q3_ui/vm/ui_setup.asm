code
proc Setup_ResetDefaults_Action 0 8
file "../ui_setup.c"
line 59
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:/*
;4:=======================================================================
;5:
;6:SETUP MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define SETUP_MENU_VERTICAL_SPACING		34
;16:
;17:#define ART_BACK0		"menu/art/back_2"
;18:#define ART_BACK1		"menu/art/back_1"	
;19://#define ART_FRAMEL		"menu/art/frame2_l"
;20:#define ART_FRAMEL		"menu/art/frame1_r"
;21:#define ART_FRAMER		"menu/art/xxxxframe1_r"
;22:
;23:#define ID_CUSTOMIZEPLAYER		10
;24:#define ID_CUSTOMIZECONTROLS	11
;25:#define ID_SYSTEMCONFIG			12
;26:#define ID_GAME					13
;27:#define ID_CDKEY				14
;28:#define ID_LOAD					15
;29:#define ID_SAVE					16
;30:#define ID_DEFAULTS				17
;31:#define ID_BACK					18
;32:
;33:
;34:typedef struct {
;35:	menuframework_s	menu;
;36:
;37:	menutext_s		banner;
;38:	menubitmap_s	framel;
;39:	menubitmap_s	framer;
;40:	menutext_s		setupplayer;
;41:	menutext_s		setupcontrols;
;42:	menutext_s		setupsystem;
;43:	menutext_s		game;
;44:	menutext_s		cdkey;
;45://	menutext_s		load;
;46://	menutext_s		save;
;47:	menutext_s		defaults;
;48:	menubitmap_s	back;
;49:} setupMenuInfo_t;
;50:
;51:static setupMenuInfo_t	setupMenuInfo;
;52:
;53:
;54:/*
;55:=================
;56:Setup_ResetDefaults_Action
;57:=================
;58:*/
;59:static void Setup_ResetDefaults_Action( qboolean result ) {
line 60
;60:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $71
line 61
;61:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 63
;62:	}
;63:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 64
;64:	trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $74
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 65
;65:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 66
;66:}
LABELV $70
endproc Setup_ResetDefaults_Action 0 8
proc Setup_ResetDefaults_Draw 0 20
line 74
;67:
;68:
;69:/*
;70:=================
;71:Setup_ResetDefaults_Draw
;72:=================
;73:*/
;74:static void Setup_ResetDefaults_Draw( void ) {
line 75
;75:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset *ALL*", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $77
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 76
;76:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "options to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $78
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 77
;77:}
LABELV $76
endproc Setup_ResetDefaults_Draw 0 20
proc UI_SetupMenu_Event 8 12
line 85
;78:
;79:
;80:/*
;81:===============
;82:UI_SetupMenu_Event
;83:===============
;84:*/
;85:static void UI_SetupMenu_Event( void *ptr, int event ) {
line 86
;86:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 87
;87:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 90
;88:	}
;89:
;90:	switch( ((menucommon_s*)ptr)->id ) {
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
CNSTI4 18
GTI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $93-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $93
address $85
address $86
address $87
address $88
address $89
address $82
address $82
address $90
address $92
code
LABELV $85
line 92
;91:	case ID_CUSTOMIZEPLAYER:
;92:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 93
;93:		break;
ADDRGP4 $83
JUMPV
LABELV $86
line 96
;94:
;95:	case ID_CUSTOMIZECONTROLS:
;96:		UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 97
;97:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 100
;98:
;99:	case ID_SYSTEMCONFIG:
;100:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 101
;101:		break;
ADDRGP4 $83
JUMPV
LABELV $88
line 104
;102:
;103:	case ID_GAME:
;104:		UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 105
;105:		break;
ADDRGP4 $83
JUMPV
LABELV $89
line 108
;106:
;107:	case ID_CDKEY:
;108:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 109
;109:		break;
ADDRGP4 $83
JUMPV
LABELV $90
line 120
;110:
;111://	case ID_LOAD:
;112://		UI_LoadConfigMenu();
;113://		break;
;114:
;115://	case ID_SAVE:
;116://		UI_SaveConfigMenu();
;117://		break;
;118:
;119:	case ID_DEFAULTS:
;120:		UI_ConfirmMenu( "SET TO DEFAULTS?", Setup_ResetDefaults_Draw, Setup_ResetDefaults_Action );
ADDRGP4 $91
ARGP4
ADDRGP4 Setup_ResetDefaults_Draw
ARGP4
ADDRGP4 Setup_ResetDefaults_Action
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 121
;121:		break;
ADDRGP4 $83
JUMPV
LABELV $92
line 124
;122:
;123:	case ID_BACK:
;124:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 125
;125:		break;
LABELV $82
LABELV $83
line 127
;126:	}
;127:}
LABELV $79
endproc UI_SetupMenu_Event 8 12
proc UI_SetupMenu_Init 16 12
line 135
;128:
;129:
;130:/*
;131:===============
;132:UI_SetupMenu_Init
;133:===============
;134:*/
;135:static void UI_SetupMenu_Init( void ) {
line 137
;136:	int				y;
;137:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 139
;138:
;139:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 141
;140:
;141:	memset( &setupMenuInfo, 0, sizeof(setupMenuInfo) );
ADDRGP4 setupMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1056
ARGI4
ADDRGP4 memset
CALLP4
pop
line 142
;142:	setupMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 setupMenuInfo+276
CNSTI4 1
ASGNI4
line 143
;143:	setupMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 setupMenuInfo+280
CNSTI4 1
ASGNI4
line 145
;144:
;145:	setupMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 setupMenuInfo+288
CNSTI4 10
ASGNI4
line 146
;146:	setupMenuInfo.banner.generic.x					= 320;
ADDRGP4 setupMenuInfo+288+12
CNSTI4 320
ASGNI4
line 147
;147:	setupMenuInfo.banner.generic.y					= 16;
ADDRGP4 setupMenuInfo+288+16
CNSTI4 16
ASGNI4
line 148
;148:	setupMenuInfo.banner.string						= "SETUP";
ADDRGP4 setupMenuInfo+288+60
ADDRGP4 $105
ASGNP4
line 149
;149:	setupMenuInfo.banner.color						= color_white;
ADDRGP4 setupMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 150
;150:	setupMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+288+64
CNSTI4 1
ASGNI4
line 152
;151:
;152:	setupMenuInfo.framel.generic.type				= MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+360
CNSTI4 6
ASGNI4
line 153
;153:	setupMenuInfo.framel.generic.name				= ART_FRAMEL;
ADDRGP4 setupMenuInfo+360+4
ADDRGP4 $113
ASGNP4
line 154
;154:	setupMenuInfo.framel.generic.flags				= QMF_INACTIVE;
ADDRGP4 setupMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 155
;155:	setupMenuInfo.framel.generic.x					= 0;  
ADDRGP4 setupMenuInfo+360+12
CNSTI4 0
ASGNI4
line 156
;156:	setupMenuInfo.framel.generic.y					= 0;
ADDRGP4 setupMenuInfo+360+16
CNSTI4 0
ASGNI4
line 157
;157:	setupMenuInfo.framel.width  					= 800;
ADDRGP4 setupMenuInfo+360+76
CNSTI4 800
ASGNI4
line 158
;158:	setupMenuInfo.framel.height  					= 600;
ADDRGP4 setupMenuInfo+360+80
CNSTI4 600
ASGNI4
line 160
;159:
;160:	setupMenuInfo.framer.generic.type				= MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+448
CNSTI4 6
ASGNI4
line 161
;161:	setupMenuInfo.framer.generic.name				= ART_FRAMER;
ADDRGP4 setupMenuInfo+448+4
ADDRGP4 $127
ASGNP4
line 162
;162:	setupMenuInfo.framer.generic.flags				= QMF_INACTIVE;
ADDRGP4 setupMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 163
;163:	setupMenuInfo.framer.generic.x					= 376;
ADDRGP4 setupMenuInfo+448+12
CNSTI4 376
ASGNI4
line 164
;164:	setupMenuInfo.framer.generic.y					= 76;
ADDRGP4 setupMenuInfo+448+16
CNSTI4 76
ASGNI4
line 165
;165:	setupMenuInfo.framer.width  					= 256;
ADDRGP4 setupMenuInfo+448+76
CNSTI4 256
ASGNI4
line 166
;166:	setupMenuInfo.framer.height  					= 334;
ADDRGP4 setupMenuInfo+448+80
CNSTI4 334
ASGNI4
line 168
;167:
;168:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 169
;169:	setupMenuInfo.setupplayer.generic.type			= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+536
CNSTI4 9
ASGNI4
line 170
;170:	setupMenuInfo.setupplayer.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+536+44
CNSTU4 264
ASGNU4
line 171
;171:	setupMenuInfo.setupplayer.generic.x				= 320;
ADDRGP4 setupMenuInfo+536+12
CNSTI4 320
ASGNI4
line 172
;172:	setupMenuInfo.setupplayer.generic.y				= y;
ADDRGP4 setupMenuInfo+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 173
;173:	setupMenuInfo.setupplayer.generic.id			= ID_CUSTOMIZEPLAYER;
ADDRGP4 setupMenuInfo+536+8
CNSTI4 10
ASGNI4
line 174
;174:	setupMenuInfo.setupplayer.generic.callback		= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+536+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 175
;175:	setupMenuInfo.setupplayer.string				= "PLAYER";
ADDRGP4 setupMenuInfo+536+60
ADDRGP4 $151
ASGNP4
line 176
;176:	setupMenuInfo.setupplayer.color					= color_red;
ADDRGP4 setupMenuInfo+536+68
ADDRGP4 color_red
ASGNP4
line 177
;177:	setupMenuInfo.setupplayer.style					= style;
ADDRGP4 setupMenuInfo+536+64
ADDRLP4 4
INDIRI4
ASGNI4
line 179
;178:
;179:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 180
;180:	setupMenuInfo.setupcontrols.generic.type		= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+608
CNSTI4 9
ASGNI4
line 181
;181:	setupMenuInfo.setupcontrols.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+608+44
CNSTU4 264
ASGNU4
line 182
;182:	setupMenuInfo.setupcontrols.generic.x			= 320;
ADDRGP4 setupMenuInfo+608+12
CNSTI4 320
ASGNI4
line 183
;183:	setupMenuInfo.setupcontrols.generic.y			= y;
ADDRGP4 setupMenuInfo+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 184
;184:	setupMenuInfo.setupcontrols.generic.id			= ID_CUSTOMIZECONTROLS;
ADDRGP4 setupMenuInfo+608+8
CNSTI4 11
ASGNI4
line 185
;185:	setupMenuInfo.setupcontrols.generic.callback	= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+608+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 186
;186:	setupMenuInfo.setupcontrols.string				= "CONTROLS";
ADDRGP4 setupMenuInfo+608+60
ADDRGP4 $169
ASGNP4
line 187
;187:	setupMenuInfo.setupcontrols.color				= color_red;
ADDRGP4 setupMenuInfo+608+68
ADDRGP4 color_red
ASGNP4
line 188
;188:	setupMenuInfo.setupcontrols.style				= style;
ADDRGP4 setupMenuInfo+608+64
ADDRLP4 4
INDIRI4
ASGNI4
line 190
;189:
;190:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 191
;191:	setupMenuInfo.setupsystem.generic.type			= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+680
CNSTI4 9
ASGNI4
line 192
;192:	setupMenuInfo.setupsystem.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+680+44
CNSTU4 264
ASGNU4
line 193
;193:	setupMenuInfo.setupsystem.generic.x				= 320;
ADDRGP4 setupMenuInfo+680+12
CNSTI4 320
ASGNI4
line 194
;194:	setupMenuInfo.setupsystem.generic.y				= y;
ADDRGP4 setupMenuInfo+680+16
ADDRLP4 0
INDIRI4
ASGNI4
line 195
;195:	setupMenuInfo.setupsystem.generic.id			= ID_SYSTEMCONFIG;
ADDRGP4 setupMenuInfo+680+8
CNSTI4 12
ASGNI4
line 196
;196:	setupMenuInfo.setupsystem.generic.callback		= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+680+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 197
;197:	setupMenuInfo.setupsystem.string				= "SYSTEM";
ADDRGP4 setupMenuInfo+680+60
ADDRGP4 $187
ASGNP4
line 198
;198:	setupMenuInfo.setupsystem.color					= color_red;
ADDRGP4 setupMenuInfo+680+68
ADDRGP4 color_red
ASGNP4
line 199
;199:	setupMenuInfo.setupsystem.style					= style;
ADDRGP4 setupMenuInfo+680+64
ADDRLP4 4
INDIRI4
ASGNI4
line 201
;200:
;201:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 202
;202:	setupMenuInfo.game.generic.type					= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+752
CNSTI4 9
ASGNI4
line 203
;203:	setupMenuInfo.game.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+752+44
CNSTU4 264
ASGNU4
line 204
;204:	setupMenuInfo.game.generic.x					= 320;
ADDRGP4 setupMenuInfo+752+12
CNSTI4 320
ASGNI4
line 205
;205:	setupMenuInfo.game.generic.y					= y;
ADDRGP4 setupMenuInfo+752+16
ADDRLP4 0
INDIRI4
ASGNI4
line 206
;206:	setupMenuInfo.game.generic.id					= ID_GAME;
ADDRGP4 setupMenuInfo+752+8
CNSTI4 13
ASGNI4
line 207
;207:	setupMenuInfo.game.generic.callback				= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+752+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 208
;208:	setupMenuInfo.game.string						= "GAME OPTIONS";
ADDRGP4 setupMenuInfo+752+60
ADDRGP4 $205
ASGNP4
line 209
;209:	setupMenuInfo.game.color						= color_red;
ADDRGP4 setupMenuInfo+752+68
ADDRGP4 color_red
ASGNP4
line 210
;210:	setupMenuInfo.game.style						= style;
ADDRGP4 setupMenuInfo+752+64
ADDRLP4 4
INDIRI4
ASGNI4
line 212
;211:
;212:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 213
;213:	setupMenuInfo.cdkey.generic.type				= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+824
CNSTI4 9
ASGNI4
line 214
;214:	setupMenuInfo.cdkey.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+824+44
CNSTU4 264
ASGNU4
line 215
;215:	setupMenuInfo.cdkey.generic.x					= 320;
ADDRGP4 setupMenuInfo+824+12
CNSTI4 320
ASGNI4
line 216
;216:	setupMenuInfo.cdkey.generic.y					= y;
ADDRGP4 setupMenuInfo+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 217
;217:	setupMenuInfo.cdkey.generic.id					= ID_CDKEY;
ADDRGP4 setupMenuInfo+824+8
CNSTI4 14
ASGNI4
line 218
;218:	setupMenuInfo.cdkey.generic.callback			= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+824+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 219
;219:	setupMenuInfo.cdkey.string						= "CD Key";
ADDRGP4 setupMenuInfo+824+60
ADDRGP4 $223
ASGNP4
line 220
;220:	setupMenuInfo.cdkey.color						= color_red;
ADDRGP4 setupMenuInfo+824+68
ADDRGP4 color_red
ASGNP4
line 221
;221:	setupMenuInfo.cdkey.style						= UI_CENTER;
ADDRGP4 setupMenuInfo+824+64
CNSTI4 1
ASGNI4
line 223
;222:
;223:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $230
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $228
line 248
;224:#if 0
;225:		y += SETUP_MENU_VERTICAL_SPACING;
;226:		setupMenuInfo.load.generic.type					= MTYPE_PTEXT;
;227:		setupMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;228:		setupMenuInfo.load.generic.x					= 320;
;229:		setupMenuInfo.load.generic.y					= y;
;230:		setupMenuInfo.load.generic.id					= ID_LOAD;
;231:		setupMenuInfo.load.generic.callback				= UI_SetupMenu_Event; 
;232:		setupMenuInfo.load.string						= "LOAD";
;233:		setupMenuInfo.load.color						= color_red;
;234:		setupMenuInfo.load.style						= UI_CENTER;
;235:
;236:		y += SETUP_MENU_VERTICAL_SPACING;
;237:		setupMenuInfo.save.generic.type					= MTYPE_PTEXT;
;238:		setupMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;239:		setupMenuInfo.save.generic.x					= 320;
;240:		setupMenuInfo.save.generic.y					= y;
;241:		setupMenuInfo.save.generic.id					= ID_SAVE;
;242:		setupMenuInfo.save.generic.callback				= UI_SetupMenu_Event; 
;243:		setupMenuInfo.save.string						= "SAVE";
;244:		setupMenuInfo.save.color						= color_red;
;245:		setupMenuInfo.save.style						= UI_CENTER;
;246:#endif
;247:
;248:		y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 249
;249:		setupMenuInfo.defaults.generic.type				= MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+896
CNSTI4 9
ASGNI4
line 250
;250:		setupMenuInfo.defaults.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+896+44
CNSTU4 264
ASGNU4
line 251
;251:		setupMenuInfo.defaults.generic.x				= 320;
ADDRGP4 setupMenuInfo+896+12
CNSTI4 320
ASGNI4
line 252
;252:		setupMenuInfo.defaults.generic.y				= y;
ADDRGP4 setupMenuInfo+896+16
ADDRLP4 0
INDIRI4
ASGNI4
line 253
;253:		setupMenuInfo.defaults.generic.id				= ID_DEFAULTS;
ADDRGP4 setupMenuInfo+896+8
CNSTI4 17
ASGNI4
line 254
;254:		setupMenuInfo.defaults.generic.callback			= UI_SetupMenu_Event; 
ADDRGP4 setupMenuInfo+896+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 255
;255:		setupMenuInfo.defaults.string					= "DEFAULTS";
ADDRGP4 setupMenuInfo+896+60
ADDRGP4 $244
ASGNP4
line 256
;256:		setupMenuInfo.defaults.color					= color_red;
ADDRGP4 setupMenuInfo+896+68
ADDRGP4 color_red
ASGNP4
line 257
;257:		setupMenuInfo.defaults.style					= style;
ADDRGP4 setupMenuInfo+896+64
ADDRLP4 4
INDIRI4
ASGNI4
line 258
;258:	}
LABELV $228
line 260
;259:
;260:	setupMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+968
CNSTI4 6
ASGNI4
line 261
;261:	setupMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 setupMenuInfo+968+4
ADDRGP4 $252
ASGNP4
line 262
;262:	setupMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+968+44
CNSTU4 260
ASGNU4
line 263
;263:	setupMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 setupMenuInfo+968+8
CNSTI4 18
ASGNI4
line 264
;264:	setupMenuInfo.back.generic.callback				= UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+968+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 265
;265:	setupMenuInfo.back.generic.x					= 0;
ADDRGP4 setupMenuInfo+968+12
CNSTI4 0
ASGNI4
line 266
;266:	setupMenuInfo.back.generic.y					= 480-64;
ADDRGP4 setupMenuInfo+968+16
CNSTI4 416
ASGNI4
line 267
;267:	setupMenuInfo.back.width						= 128;
ADDRGP4 setupMenuInfo+968+76
CNSTI4 128
ASGNI4
line 268
;268:	setupMenuInfo.back.height						= 64;
ADDRGP4 setupMenuInfo+968+80
CNSTI4 64
ASGNI4
line 269
;269:	setupMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 setupMenuInfo+968+60
ADDRGP4 $269
ASGNP4
line 272
;270:
;271:	
;272:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.framel );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 273
;273:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.framer );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 274
;274:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.banner );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 275
;275:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupplayer );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 276
;276:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupcontrols );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 277
;277:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.setupsystem );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 278
;278:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.game );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 282
;279://	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.cdkey );
;280://	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.load );
;281://	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.save );
;282:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $230
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $277
line 283
;283:		Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.defaults );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 284
;284:	}
LABELV $277
line 285
;285:	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.back );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 286
;286:}
LABELV $95
endproc UI_SetupMenu_Init 16 12
export UI_SetupMenu_Cache
proc UI_SetupMenu_Cache 0 4
line 294
;287:
;288:
;289:/*
;290:=================
;291:UI_SetupMenu_Cache
;292:=================
;293:*/
;294:void UI_SetupMenu_Cache( void ) {
line 295
;295:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $252
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 296
;296:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $269
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 297
;297:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $113
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 298
;298:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $127
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 299
;299:}
LABELV $281
endproc UI_SetupMenu_Cache 0 4
export UI_SetupMenu
proc UI_SetupMenu 0 4
line 307
;300:
;301:
;302:/*
;303:===============
;304:UI_SetupMenu
;305:===============
;306:*/
;307:void UI_SetupMenu( void ) {
line 308
;308:	UI_SetupMenu_Init();
ADDRGP4 UI_SetupMenu_Init
CALLV
pop
line 309
;309:	UI_PushMenu( &setupMenuInfo.menu );
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 310
;310:}
LABELV $282
endproc UI_SetupMenu 0 4
bss
align 4
LABELV setupMenuInfo
skip 1056
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
import BG_FindItemForAmmo
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
LABELV $269
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
LABELV $252
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
LABELV $244
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $230
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
LABELV $223
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $205
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 79
byte 1 80
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $187
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 0
align 1
LABELV $169
byte 1 67
byte 1 79
byte 1 78
byte 1 84
byte 1 82
byte 1 79
byte 1 76
byte 1 83
byte 1 0
align 1
LABELV $151
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $127
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
byte 1 120
byte 1 120
byte 1 120
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
LABELV $113
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
LABELV $105
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $91
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 63
byte 1 0
align 1
LABELV $78
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $77
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 42
byte 1 65
byte 1 76
byte 1 76
byte 1 42
byte 1 0
align 1
LABELV $75
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
byte 1 10
byte 1 0
align 1
LABELV $74
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $73
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
