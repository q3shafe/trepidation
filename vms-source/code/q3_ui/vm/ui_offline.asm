code
proc Offline_ResetDefaults_Action 0 8
file "../ui_offline.c"
line 62
;1:// Copyright (C) 2011 Team Trepidation
;2://
;3:/*
;4:=======================================================================
;5:
;6:OFFLINE PLAY MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define OFFLINE_MENU_VERTICAL_SPACING		34
;16:
;17:#define ART_BACK0		"menu/art/back_2"
;18:#define ART_BACK1		"menu/art/back_1"	
;19://#define ART_FRAMEL		"menu/art/frame2_l"
;20:#define ART_FRAMEL		"menu/art/frame1_r"
;21:#define ART_FRAMER		"menu/art/xxxxframe1_r"
;22:
;23:#define ID_TUTORIALS			10
;24:#define ID_TREPIDATION			11
;25:#define ID_FFA					12
;26:#define ID_CTF					13
;27:#define ID_ARSENAL				14
;28:#define ID_SURVIVAL				15
;29:#define ID_FREEZETAG			16
;30:#define ID_SAVE					17
;31:#define ID_DEFAULTS				18
;32:#define ID_BACK					19
;33:
;34:
;35:typedef struct {
;36:	menuframework_s	menu;
;37:
;38:	menutext_s		banner;
;39:	menubitmap_s	framel;
;40:	menubitmap_s	framer;
;41:	menutext_s		tutorials;
;42:	menutext_s		trepidation;
;43:	menutext_s		ffa;
;44:	menutext_s		ctf;
;45:	menutext_s		arsenal;
;46:	menutext_s		survival;
;47:	menutext_s		freezetag;
;48:	//	menutext_s		load;
;49://	menutext_s		save;
;50:	menutext_s		defaults;
;51:	menubitmap_s	back;
;52:} offlineMenuInfo_t;
;53:
;54:static offlineMenuInfo_t	offlineMenuInfo;
;55:
;56:
;57:/*
;58:=================
;59:Offline_ResetDefaults_Action
;60:=================
;61:*/
;62:static void Offline_ResetDefaults_Action( qboolean result ) {
line 63
;63:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $71
line 64
;64:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 66
;65:	}
;66:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 67
;67:	trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $74
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 68
;68:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 69
;69:}
LABELV $70
endproc Offline_ResetDefaults_Action 0 8
proc Offline_ResetDefaults_Draw 0 20
line 77
;70:
;71:
;72:/*
;73:=================
;74:Offline_ResetDefaults_Draw
;75:=================
;76:*/
;77:static void Offline_ResetDefaults_Draw( void ) {
line 78
;78:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset *ALL*", UI_CENTER|UI_SMALLFONT, color_yellow );
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
line 79
;79:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "options to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
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
line 80
;80:}
LABELV $76
endproc Offline_ResetDefaults_Draw 0 20
proc UI_OfflineMenu_Event 8 12
line 88
;81:
;82:
;83:/*
;84:===============
;85:UI_OfflineMenu_Event
;86:===============
;87:*/
;88:static void UI_OfflineMenu_Event( void *ptr, int event ) {
line 89
;89:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 90
;90:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 93
;91:	}
;92:
;93:	switch( ((menucommon_s*)ptr)->id ) {
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
ADDRGP4 $95-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $95
address $85
address $86
address $87
address $88
address $89
address $90
address $91
address $82
address $92
address $94
code
LABELV $85
line 95
;94:	case ID_TUTORIALS:
;95:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 96
;96:		break;
ADDRGP4 $83
JUMPV
LABELV $86
line 99
;97:
;98:	case ID_TREPIDATION:
;99:		UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 100
;100:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 103
;101:
;102:	case ID_FFA:
;103:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 104
;104:		break;
ADDRGP4 $83
JUMPV
LABELV $88
line 107
;105:
;106:	case ID_CTF:
;107:		UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 108
;108:		break;
ADDRGP4 $83
JUMPV
LABELV $89
line 111
;109:
;110:	case ID_ARSENAL:
;111:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 112
;112:		break;
ADDRGP4 $83
JUMPV
LABELV $90
line 115
;113:
;114:	case ID_SURVIVAL:
;115:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 116
;116:		break;
ADDRGP4 $83
JUMPV
LABELV $91
line 119
;117:
;118:	case ID_FREEZETAG:
;119:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 120
;120:		break;
ADDRGP4 $83
JUMPV
LABELV $92
line 132
;121:
;122:
;123://	case ID_LOAD:
;124://		UI_LoadConfigMenu();
;125://		break;
;126:
;127://	case ID_SAVE:
;128://		UI_SaveConfigMenu();
;129://		break;
;130:
;131:	case ID_DEFAULTS:
;132:		UI_ConfirmMenu( "SET TO DEFAULTS?", Offline_ResetDefaults_Draw, Offline_ResetDefaults_Action );
ADDRGP4 $93
ARGP4
ADDRGP4 Offline_ResetDefaults_Draw
ARGP4
ADDRGP4 Offline_ResetDefaults_Action
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 133
;133:		break;
ADDRGP4 $83
JUMPV
LABELV $94
line 136
;134:
;135:	case ID_BACK:
;136:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 137
;137:		break;
LABELV $82
LABELV $83
line 139
;138:	}
;139:}
LABELV $79
endproc UI_OfflineMenu_Event 8 12
proc UI_OfflineMenu_Init 16 12
line 147
;140:
;141:
;142:/*
;143:===============
;144:UI_OfflineMenu_Init
;145:===============
;146:*/
;147:static void UI_OfflineMenu_Init( void ) {
line 149
;148:	int				y;
;149:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 151
;150:
;151:	UI_OfflineMenu_Cache();
ADDRGP4 UI_OfflineMenu_Cache
CALLV
pop
line 153
;152:
;153:	memset( &offlineMenuInfo, 0, sizeof(offlineMenuInfo) );
ADDRGP4 offlineMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1200
ARGI4
ADDRGP4 memset
CALLP4
pop
line 154
;154:	offlineMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 offlineMenuInfo+276
CNSTI4 1
ASGNI4
line 155
;155:	offlineMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 offlineMenuInfo+280
CNSTI4 1
ASGNI4
line 157
;156:
;157:	offlineMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 offlineMenuInfo+288
CNSTI4 10
ASGNI4
line 158
;158:	offlineMenuInfo.banner.generic.x					= 320;
ADDRGP4 offlineMenuInfo+288+12
CNSTI4 320
ASGNI4
line 159
;159:	offlineMenuInfo.banner.generic.y					= 16;
ADDRGP4 offlineMenuInfo+288+16
CNSTI4 16
ASGNI4
line 160
;160:	offlineMenuInfo.banner.string						= "PLAY OFFLINE";
ADDRGP4 offlineMenuInfo+288+60
ADDRGP4 $107
ASGNP4
line 161
;161:	offlineMenuInfo.banner.color						= color_white;
ADDRGP4 offlineMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 162
;162:	offlineMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+288+64
CNSTI4 1
ASGNI4
line 164
;163:
;164:	offlineMenuInfo.framel.generic.type				= MTYPE_BITMAP;
ADDRGP4 offlineMenuInfo+360
CNSTI4 6
ASGNI4
line 165
;165:	offlineMenuInfo.framel.generic.name				= ART_FRAMEL;
ADDRGP4 offlineMenuInfo+360+4
ADDRGP4 $115
ASGNP4
line 166
;166:	offlineMenuInfo.framel.generic.flags				= QMF_INACTIVE;
ADDRGP4 offlineMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 167
;167:	offlineMenuInfo.framel.generic.x					= 0;  
ADDRGP4 offlineMenuInfo+360+12
CNSTI4 0
ASGNI4
line 168
;168:	offlineMenuInfo.framel.generic.y					= 0;
ADDRGP4 offlineMenuInfo+360+16
CNSTI4 0
ASGNI4
line 169
;169:	offlineMenuInfo.framel.width  					= 800;
ADDRGP4 offlineMenuInfo+360+76
CNSTI4 800
ASGNI4
line 170
;170:	offlineMenuInfo.framel.height  					= 600;
ADDRGP4 offlineMenuInfo+360+80
CNSTI4 600
ASGNI4
line 172
;171:
;172:	offlineMenuInfo.framer.generic.type				= MTYPE_BITMAP;
ADDRGP4 offlineMenuInfo+448
CNSTI4 6
ASGNI4
line 173
;173:	offlineMenuInfo.framer.generic.name				= ART_FRAMER;
ADDRGP4 offlineMenuInfo+448+4
ADDRGP4 $129
ASGNP4
line 174
;174:	offlineMenuInfo.framer.generic.flags				= QMF_INACTIVE;
ADDRGP4 offlineMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 175
;175:	offlineMenuInfo.framer.generic.x					= 376;
ADDRGP4 offlineMenuInfo+448+12
CNSTI4 376
ASGNI4
line 176
;176:	offlineMenuInfo.framer.generic.y					= 76;
ADDRGP4 offlineMenuInfo+448+16
CNSTI4 76
ASGNI4
line 177
;177:	offlineMenuInfo.framer.width  					= 256;
ADDRGP4 offlineMenuInfo+448+76
CNSTI4 256
ASGNI4
line 178
;178:	offlineMenuInfo.framer.height  					= 334;
ADDRGP4 offlineMenuInfo+448+80
CNSTI4 334
ASGNI4
line 180
;179:
;180:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 181
;181:	offlineMenuInfo.tutorials.generic.type			= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+536
CNSTI4 9
ASGNI4
line 182
;182:	offlineMenuInfo.tutorials.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+536+44
CNSTU4 264
ASGNU4
line 183
;183:	offlineMenuInfo.tutorials.generic.x				= 320;
ADDRGP4 offlineMenuInfo+536+12
CNSTI4 320
ASGNI4
line 184
;184:	offlineMenuInfo.tutorials.generic.y				= y;
ADDRGP4 offlineMenuInfo+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 185
;185:	offlineMenuInfo.tutorials.generic.id			= ID_TUTORIALS;
ADDRGP4 offlineMenuInfo+536+8
CNSTI4 10
ASGNI4
line 186
;186:	offlineMenuInfo.tutorials.generic.callback		= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+536+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 187
;187:	offlineMenuInfo.tutorials.string				= "TUTORIALS";
ADDRGP4 offlineMenuInfo+536+60
ADDRGP4 $153
ASGNP4
line 188
;188:	offlineMenuInfo.tutorials.color					= color_red;
ADDRGP4 offlineMenuInfo+536+68
ADDRGP4 color_red
ASGNP4
line 189
;189:	offlineMenuInfo.tutorials.style					= style;
ADDRGP4 offlineMenuInfo+536+64
ADDRLP4 4
INDIRI4
ASGNI4
line 191
;190:
;191:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 192
;192:	offlineMenuInfo.trepidation.generic.type		= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+608
CNSTI4 9
ASGNI4
line 193
;193:	offlineMenuInfo.trepidation.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+608+44
CNSTU4 264
ASGNU4
line 194
;194:	offlineMenuInfo.trepidation.generic.x			= 320;
ADDRGP4 offlineMenuInfo+608+12
CNSTI4 320
ASGNI4
line 195
;195:	offlineMenuInfo.trepidation.generic.y			= y;
ADDRGP4 offlineMenuInfo+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 196
;196:	offlineMenuInfo.trepidation.generic.id			= ID_TREPIDATION;
ADDRGP4 offlineMenuInfo+608+8
CNSTI4 11
ASGNI4
line 197
;197:	offlineMenuInfo.trepidation.generic.callback	= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+608+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 198
;198:	offlineMenuInfo.trepidation.string				= "TREPIDATION";
ADDRGP4 offlineMenuInfo+608+60
ADDRGP4 $171
ASGNP4
line 199
;199:	offlineMenuInfo.trepidation.color				= color_red;
ADDRGP4 offlineMenuInfo+608+68
ADDRGP4 color_red
ASGNP4
line 200
;200:	offlineMenuInfo.trepidation.style				= style;
ADDRGP4 offlineMenuInfo+608+64
ADDRLP4 4
INDIRI4
ASGNI4
line 202
;201:
;202:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 203
;203:	offlineMenuInfo.ffa.generic.type			= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+680
CNSTI4 9
ASGNI4
line 204
;204:	offlineMenuInfo.ffa.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+680+44
CNSTU4 264
ASGNU4
line 205
;205:	offlineMenuInfo.ffa.generic.x				= 320;
ADDRGP4 offlineMenuInfo+680+12
CNSTI4 320
ASGNI4
line 206
;206:	offlineMenuInfo.ffa.generic.y				= y;
ADDRGP4 offlineMenuInfo+680+16
ADDRLP4 0
INDIRI4
ASGNI4
line 207
;207:	offlineMenuInfo.ffa.generic.id			= ID_FFA;
ADDRGP4 offlineMenuInfo+680+8
CNSTI4 12
ASGNI4
line 208
;208:	offlineMenuInfo.ffa.generic.callback		= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+680+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 209
;209:	offlineMenuInfo.ffa.string				= "FREE FOR ALL";
ADDRGP4 offlineMenuInfo+680+60
ADDRGP4 $189
ASGNP4
line 210
;210:	offlineMenuInfo.ffa.color					= color_red;
ADDRGP4 offlineMenuInfo+680+68
ADDRGP4 color_red
ASGNP4
line 211
;211:	offlineMenuInfo.ffa.style					= style;
ADDRGP4 offlineMenuInfo+680+64
ADDRLP4 4
INDIRI4
ASGNI4
line 213
;212:
;213:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 214
;214:	offlineMenuInfo.ctf.generic.type					= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+752
CNSTI4 9
ASGNI4
line 215
;215:	offlineMenuInfo.ctf.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+752+44
CNSTU4 264
ASGNU4
line 216
;216:	offlineMenuInfo.ctf.generic.x					= 320;
ADDRGP4 offlineMenuInfo+752+12
CNSTI4 320
ASGNI4
line 217
;217:	offlineMenuInfo.ctf.generic.y					= y;
ADDRGP4 offlineMenuInfo+752+16
ADDRLP4 0
INDIRI4
ASGNI4
line 218
;218:	offlineMenuInfo.ctf.generic.id					= ID_CTF;
ADDRGP4 offlineMenuInfo+752+8
CNSTI4 13
ASGNI4
line 219
;219:	offlineMenuInfo.ctf.generic.callback				= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+752+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 220
;220:	offlineMenuInfo.ctf.string						= "CAPTURE THE FLAG";
ADDRGP4 offlineMenuInfo+752+60
ADDRGP4 $207
ASGNP4
line 221
;221:	offlineMenuInfo.ctf.color						= color_red;
ADDRGP4 offlineMenuInfo+752+68
ADDRGP4 color_red
ASGNP4
line 222
;222:	offlineMenuInfo.ctf.style						= style;
ADDRGP4 offlineMenuInfo+752+64
ADDRLP4 4
INDIRI4
ASGNI4
line 224
;223:
;224:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 225
;225:	offlineMenuInfo.arsenal.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+824
CNSTI4 9
ASGNI4
line 226
;226:	offlineMenuInfo.arsenal.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+824+44
CNSTU4 264
ASGNU4
line 227
;227:	offlineMenuInfo.arsenal.generic.x					= 320;
ADDRGP4 offlineMenuInfo+824+12
CNSTI4 320
ASGNI4
line 228
;228:	offlineMenuInfo.arsenal.generic.y					= y;
ADDRGP4 offlineMenuInfo+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 229
;229:	offlineMenuInfo.arsenal.generic.id					= ID_ARSENAL;
ADDRGP4 offlineMenuInfo+824+8
CNSTI4 14
ASGNI4
line 230
;230:	offlineMenuInfo.arsenal.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+824+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 231
;231:	offlineMenuInfo.arsenal.string						= "ARSENAL";
ADDRGP4 offlineMenuInfo+824+60
ADDRGP4 $225
ASGNP4
line 232
;232:	offlineMenuInfo.arsenal.color						= color_red;
ADDRGP4 offlineMenuInfo+824+68
ADDRGP4 color_red
ASGNP4
line 233
;233:	offlineMenuInfo.arsenal.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+824+64
CNSTI4 1
ASGNI4
line 235
;234:
;235:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 236
;236:	offlineMenuInfo.survival.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+896
CNSTI4 9
ASGNI4
line 237
;237:	offlineMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+896+44
CNSTU4 264
ASGNU4
line 238
;238:	offlineMenuInfo.survival.generic.x					= 320;
ADDRGP4 offlineMenuInfo+896+12
CNSTI4 320
ASGNI4
line 239
;239:	offlineMenuInfo.survival.generic.y					= y;
ADDRGP4 offlineMenuInfo+896+16
ADDRLP4 0
INDIRI4
ASGNI4
line 240
;240:	offlineMenuInfo.survival.generic.id					= ID_SURVIVAL;
ADDRGP4 offlineMenuInfo+896+8
CNSTI4 15
ASGNI4
line 241
;241:	offlineMenuInfo.survival.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+896+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 242
;242:	offlineMenuInfo.survival.string						= "SURVIVAL";
ADDRGP4 offlineMenuInfo+896+60
ADDRGP4 $243
ASGNP4
line 243
;243:	offlineMenuInfo.survival.color						= color_red;
ADDRGP4 offlineMenuInfo+896+68
ADDRGP4 color_red
ASGNP4
line 244
;244:	offlineMenuInfo.survival.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+896+64
CNSTI4 1
ASGNI4
line 246
;245:
;246:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 247
;247:	offlineMenuInfo.survival.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+896
CNSTI4 9
ASGNI4
line 248
;248:	offlineMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+896+44
CNSTU4 264
ASGNU4
line 249
;249:	offlineMenuInfo.survival.generic.x					= 320;
ADDRGP4 offlineMenuInfo+896+12
CNSTI4 320
ASGNI4
line 250
;250:	offlineMenuInfo.survival.generic.y					= y;
ADDRGP4 offlineMenuInfo+896+16
ADDRLP4 0
INDIRI4
ASGNI4
line 251
;251:	offlineMenuInfo.survival.generic.id					= ID_FREEZETAG;
ADDRGP4 offlineMenuInfo+896+8
CNSTI4 16
ASGNI4
line 252
;252:	offlineMenuInfo.survival.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+896+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 253
;253:	offlineMenuInfo.survival.string						= "SURVIVAL";
ADDRGP4 offlineMenuInfo+896+60
ADDRGP4 $243
ASGNP4
line 254
;254:	offlineMenuInfo.survival.color						= color_red;
ADDRGP4 offlineMenuInfo+896+68
ADDRGP4 color_red
ASGNP4
line 255
;255:	offlineMenuInfo.survival.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+896+64
CNSTI4 1
ASGNI4
line 257
;256:
;257:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $267
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $265
line 282
;258:#if 0
;259:		y += OFFLINE_MENU_VERTICAL_SPACING;
;260:		offlineMenuInfo.load.generic.type					= MTYPE_PTEXT;
;261:		offlineMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;262:		offlineMenuInfo.load.generic.x					= 320;
;263:		offlineMenuInfo.load.generic.y					= y;
;264:		offlineMenuInfo.load.generic.id					= ID_LOAD;
;265:		offlineMenuInfo.load.generic.callback				= UI_OfflineMenu_Event; 
;266:		offlineMenuInfo.load.string						= "LOAD";
;267:		offlineMenuInfo.load.color						= color_red;
;268:		offlineMenuInfo.load.style						= UI_CENTER;
;269:
;270:		y += OFFLINE_MENU_VERTICAL_SPACING;
;271:		offlineMenuInfo.save.generic.type					= MTYPE_PTEXT;
;272:		offlineMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;273:		offlineMenuInfo.save.generic.x					= 320;
;274:		offlineMenuInfo.save.generic.y					= y;
;275:		offlineMenuInfo.save.generic.id					= ID_SAVE;
;276:		offlineMenuInfo.save.generic.callback				= UI_OfflineMenu_Event; 
;277:		offlineMenuInfo.save.string						= "SAVE";
;278:		offlineMenuInfo.save.color						= color_red;
;279:		offlineMenuInfo.save.style						= UI_CENTER;
;280:#endif
;281:
;282:		y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 283
;283:		offlineMenuInfo.defaults.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+1040
CNSTI4 9
ASGNI4
line 284
;284:		offlineMenuInfo.defaults.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+1040+44
CNSTU4 264
ASGNU4
line 285
;285:		offlineMenuInfo.defaults.generic.x				= 320;
ADDRGP4 offlineMenuInfo+1040+12
CNSTI4 320
ASGNI4
line 286
;286:		offlineMenuInfo.defaults.generic.y				= y;
ADDRGP4 offlineMenuInfo+1040+16
ADDRLP4 0
INDIRI4
ASGNI4
line 287
;287:		offlineMenuInfo.defaults.generic.id				= ID_DEFAULTS;
ADDRGP4 offlineMenuInfo+1040+8
CNSTI4 18
ASGNI4
line 288
;288:		offlineMenuInfo.defaults.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+1040+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 289
;289:		offlineMenuInfo.defaults.string					= "DEFAULTS";
ADDRGP4 offlineMenuInfo+1040+60
ADDRGP4 $281
ASGNP4
line 290
;290:		offlineMenuInfo.defaults.color					= color_red;
ADDRGP4 offlineMenuInfo+1040+68
ADDRGP4 color_red
ASGNP4
line 291
;291:		offlineMenuInfo.defaults.style					= style;
ADDRGP4 offlineMenuInfo+1040+64
ADDRLP4 4
INDIRI4
ASGNI4
line 292
;292:	}
LABELV $265
line 294
;293:
;294:	offlineMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 offlineMenuInfo+1112
CNSTI4 6
ASGNI4
line 295
;295:	offlineMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 offlineMenuInfo+1112+4
ADDRGP4 $289
ASGNP4
line 296
;296:	offlineMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+1112+44
CNSTU4 260
ASGNU4
line 297
;297:	offlineMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 offlineMenuInfo+1112+8
CNSTI4 19
ASGNI4
line 298
;298:	offlineMenuInfo.back.generic.callback				= UI_OfflineMenu_Event;
ADDRGP4 offlineMenuInfo+1112+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 299
;299:	offlineMenuInfo.back.generic.x					= 0;
ADDRGP4 offlineMenuInfo+1112+12
CNSTI4 0
ASGNI4
line 300
;300:	offlineMenuInfo.back.generic.y					= 480-64;
ADDRGP4 offlineMenuInfo+1112+16
CNSTI4 416
ASGNI4
line 301
;301:	offlineMenuInfo.back.width						= 128;
ADDRGP4 offlineMenuInfo+1112+76
CNSTI4 128
ASGNI4
line 302
;302:	offlineMenuInfo.back.height						= 64;
ADDRGP4 offlineMenuInfo+1112+80
CNSTI4 64
ASGNI4
line 303
;303:	offlineMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 offlineMenuInfo+1112+60
ADDRGP4 $306
ASGNP4
line 306
;304:
;305:	
;306:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.framel );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 307
;307:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.framer );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 308
;308:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.banner );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 309
;309:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.tutorials );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 310
;310:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.trepidation );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 311
;311:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.ffa );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 312
;312:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.ctf );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 313
;313:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.arsenal );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 314
;314:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.survival );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 315
;315:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.freezetag);
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 319
;316://	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.cdkey );
;317://	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.load );
;318://	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.save );
;319:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $267
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $317
line 320
;320:		Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.defaults );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+1040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 321
;321:	}
LABELV $317
line 322
;322:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.back );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+1112
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 323
;323:}
LABELV $97
endproc UI_OfflineMenu_Init 16 12
export UI_OfflineMenu_Cache
proc UI_OfflineMenu_Cache 0 4
line 331
;324:
;325:
;326:/*
;327:=================
;328:UI_OfflineMenu_Cache
;329:=================
;330:*/
;331:void UI_OfflineMenu_Cache( void ) {
line 332
;332:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $289
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 333
;333:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $306
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 334
;334:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $115
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 335
;335:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $129
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 336
;336:}
LABELV $321
endproc UI_OfflineMenu_Cache 0 4
export UI_OfflineMenu
proc UI_OfflineMenu 0 4
line 344
;337:
;338:
;339:/*
;340:===============
;341:UI_OfflineMenu
;342:===============
;343:*/
;344:void UI_OfflineMenu( void ) {
line 345
;345:	UI_OfflineMenu_Init();
ADDRGP4 UI_OfflineMenu_Init
CALLV
pop
line 346
;346:	UI_PushMenu( &offlineMenuInfo.menu );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 347
;347:}
LABELV $322
endproc UI_OfflineMenu 0 4
bss
align 4
LABELV offlineMenuInfo
skip 1200
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
LABELV $306
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
LABELV $289
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
LABELV $281
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
LABELV $267
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
LABELV $243
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
LABELV $225
byte 1 65
byte 1 82
byte 1 83
byte 1 69
byte 1 78
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $207
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
LABELV $189
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
LABELV $171
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
LABELV $153
byte 1 84
byte 1 85
byte 1 84
byte 1 79
byte 1 82
byte 1 73
byte 1 65
byte 1 76
byte 1 83
byte 1 0
align 1
LABELV $129
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
LABELV $115
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
LABELV $107
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
byte 1 0
align 1
LABELV $93
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
