code
proc Offline_ResetDefaults_Action 0 8
file "../ui_offline.c"
line 60
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
;40:	menutext_s		tutorials;
;41:	menutext_s		trepidation;
;42:	menutext_s		ffa;
;43:	menutext_s		ctf;
;44:	menutext_s		arsenal;
;45:	menutext_s		survival;
;46://	menutext_s		load;
;47://	menutext_s		save;
;48:	menutext_s		defaults;
;49:	menubitmap_s	back;
;50:} offlineMenuInfo_t;
;51:
;52:static offlineMenuInfo_t	offlineMenuInfo;
;53:
;54:
;55:/*
;56:=================
;57:Offline_ResetDefaults_Action
;58:=================
;59:*/
;60:static void Offline_ResetDefaults_Action( qboolean result ) {
line 61
;61:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $71
line 62
;62:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 64
;63:	}
;64:	trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 65
;65:	trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $74
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 66
;66:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 67
;67:}
LABELV $70
endproc Offline_ResetDefaults_Action 0 8
proc Offline_ResetDefaults_Draw 0 20
line 75
;68:
;69:
;70:/*
;71:=================
;72:Offline_ResetDefaults_Draw
;73:=================
;74:*/
;75:static void Offline_ResetDefaults_Draw( void ) {
line 76
;76:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset *ALL*", UI_CENTER|UI_SMALLFONT, color_yellow );
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
line 77
;77:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "options to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
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
line 78
;78:}
LABELV $76
endproc Offline_ResetDefaults_Draw 0 20
proc UI_OfflineMenu_Event 8 12
line 86
;79:
;80:
;81:/*
;82:===============
;83:UI_OfflineMenu_Event
;84:===============
;85:*/
;86:static void UI_OfflineMenu_Event( void *ptr, int event ) {
line 87
;87:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 88
;88:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 91
;89:	}
;90:
;91:	switch( ((menucommon_s*)ptr)->id ) {
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
ADDRGP4 $94-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $94
address $85
address $86
address $87
address $88
address $89
address $90
address $82
address $91
address $93
code
LABELV $85
line 93
;92:	case ID_TUTORIALS:
;93:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 94
;94:		break;
ADDRGP4 $83
JUMPV
LABELV $86
line 97
;95:
;96:	case ID_TREPIDATION:
;97:		UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 98
;98:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 101
;99:
;100:	case ID_FFA:
;101:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 102
;102:		break;
ADDRGP4 $83
JUMPV
LABELV $88
line 105
;103:
;104:	case ID_CTF:
;105:		UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 106
;106:		break;
ADDRGP4 $83
JUMPV
LABELV $89
line 109
;107:
;108:	case ID_ARSENAL:
;109:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 110
;110:		break;
ADDRGP4 $83
JUMPV
LABELV $90
line 113
;111:
;112:	case ID_SURVIVAL:
;113:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 114
;114:		break;
ADDRGP4 $83
JUMPV
LABELV $91
line 126
;115:
;116:
;117://	case ID_LOAD:
;118://		UI_LoadConfigMenu();
;119://		break;
;120:
;121://	case ID_SAVE:
;122://		UI_SaveConfigMenu();
;123://		break;
;124:
;125:	case ID_DEFAULTS:
;126:		UI_ConfirmMenu( "SET TO DEFAULTS?", Offline_ResetDefaults_Draw, Offline_ResetDefaults_Action );
ADDRGP4 $92
ARGP4
ADDRGP4 Offline_ResetDefaults_Draw
ARGP4
ADDRGP4 Offline_ResetDefaults_Action
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 127
;127:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 130
;128:
;129:	case ID_BACK:
;130:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 131
;131:		break;
LABELV $82
LABELV $83
line 133
;132:	}
;133:}
LABELV $79
endproc UI_OfflineMenu_Event 8 12
proc UI_OfflineMenu_Init 16 12
line 141
;134:
;135:
;136:/*
;137:===============
;138:UI_OfflineMenu_Init
;139:===============
;140:*/
;141:static void UI_OfflineMenu_Init( void ) {
line 143
;142:	int				y;
;143:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 145
;144:
;145:	UI_OfflineMenu_Cache();
ADDRGP4 UI_OfflineMenu_Cache
CALLV
pop
line 147
;146:
;147:	memset( &offlineMenuInfo, 0, sizeof(offlineMenuInfo) );
ADDRGP4 offlineMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1128
ARGI4
ADDRGP4 memset
CALLP4
pop
line 148
;148:	offlineMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 offlineMenuInfo+276
CNSTI4 1
ASGNI4
line 149
;149:	offlineMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 offlineMenuInfo+280
CNSTI4 1
ASGNI4
line 151
;150:
;151:	offlineMenuInfo.banner.generic.type				= MTYPE_BTEXT;
ADDRGP4 offlineMenuInfo+288
CNSTI4 10
ASGNI4
line 152
;152:	offlineMenuInfo.banner.generic.x					= 320;
ADDRGP4 offlineMenuInfo+288+12
CNSTI4 320
ASGNI4
line 153
;153:	offlineMenuInfo.banner.generic.y					= 16;
ADDRGP4 offlineMenuInfo+288+16
CNSTI4 16
ASGNI4
line 154
;154:	offlineMenuInfo.banner.string						= "PLAY OFFLINE";
ADDRGP4 offlineMenuInfo+288+60
ADDRGP4 $106
ASGNP4
line 155
;155:	offlineMenuInfo.banner.color						= color_white;
ADDRGP4 offlineMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 156
;156:	offlineMenuInfo.banner.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+288+64
CNSTI4 1
ASGNI4
line 158
;157:
;158:	offlineMenuInfo.framel.generic.type				= MTYPE_BITMAP;
ADDRGP4 offlineMenuInfo+360
CNSTI4 6
ASGNI4
line 159
;159:	offlineMenuInfo.framel.generic.name				= ART_FRAMEL;
ADDRGP4 offlineMenuInfo+360+4
ADDRGP4 $114
ASGNP4
line 160
;160:	offlineMenuInfo.framel.generic.flags				= QMF_INACTIVE;
ADDRGP4 offlineMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 161
;161:	offlineMenuInfo.framel.generic.x					= 0;  
ADDRGP4 offlineMenuInfo+360+12
CNSTI4 0
ASGNI4
line 162
;162:	offlineMenuInfo.framel.generic.y					= 0;
ADDRGP4 offlineMenuInfo+360+16
CNSTI4 0
ASGNI4
line 163
;163:	offlineMenuInfo.framel.width  					= 800;
ADDRGP4 offlineMenuInfo+360+76
CNSTI4 800
ASGNI4
line 164
;164:	offlineMenuInfo.framel.height  					= 600;
ADDRGP4 offlineMenuInfo+360+80
CNSTI4 600
ASGNI4
line 166
;165:
;166:	offlineMenuInfo.framer.generic.type				= MTYPE_BITMAP;
ADDRGP4 offlineMenuInfo+448
CNSTI4 6
ASGNI4
line 167
;167:	offlineMenuInfo.framer.generic.name				= ART_FRAMER;
ADDRGP4 offlineMenuInfo+448+4
ADDRGP4 $128
ASGNP4
line 168
;168:	offlineMenuInfo.framer.generic.flags				= QMF_INACTIVE;
ADDRGP4 offlineMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 169
;169:	offlineMenuInfo.framer.generic.x					= 376;
ADDRGP4 offlineMenuInfo+448+12
CNSTI4 376
ASGNI4
line 170
;170:	offlineMenuInfo.framer.generic.y					= 76;
ADDRGP4 offlineMenuInfo+448+16
CNSTI4 76
ASGNI4
line 171
;171:	offlineMenuInfo.framer.width  					= 256;
ADDRGP4 offlineMenuInfo+448+76
CNSTI4 256
ASGNI4
line 172
;172:	offlineMenuInfo.framer.height  					= 334;
ADDRGP4 offlineMenuInfo+448+80
CNSTI4 334
ASGNI4
line 174
;173:
;174:	y = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 175
;175:	offlineMenuInfo.tutorials.generic.type			= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+536
CNSTI4 9
ASGNI4
line 176
;176:	offlineMenuInfo.tutorials.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+536+44
CNSTU4 264
ASGNU4
line 177
;177:	offlineMenuInfo.tutorials.generic.x				= 320;
ADDRGP4 offlineMenuInfo+536+12
CNSTI4 320
ASGNI4
line 178
;178:	offlineMenuInfo.tutorials.generic.y				= y;
ADDRGP4 offlineMenuInfo+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 179
;179:	offlineMenuInfo.tutorials.generic.id			= ID_TUTORIALS;
ADDRGP4 offlineMenuInfo+536+8
CNSTI4 10
ASGNI4
line 180
;180:	offlineMenuInfo.tutorials.generic.callback		= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+536+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 181
;181:	offlineMenuInfo.tutorials.string				= "TUTORIALS";
ADDRGP4 offlineMenuInfo+536+60
ADDRGP4 $152
ASGNP4
line 182
;182:	offlineMenuInfo.tutorials.color					= color_red;
ADDRGP4 offlineMenuInfo+536+68
ADDRGP4 color_red
ASGNP4
line 183
;183:	offlineMenuInfo.tutorials.style					= style;
ADDRGP4 offlineMenuInfo+536+64
ADDRLP4 4
INDIRI4
ASGNI4
line 185
;184:
;185:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 186
;186:	offlineMenuInfo.trepidation.generic.type		= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+608
CNSTI4 9
ASGNI4
line 187
;187:	offlineMenuInfo.trepidation.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+608+44
CNSTU4 264
ASGNU4
line 188
;188:	offlineMenuInfo.trepidation.generic.x			= 320;
ADDRGP4 offlineMenuInfo+608+12
CNSTI4 320
ASGNI4
line 189
;189:	offlineMenuInfo.trepidation.generic.y			= y;
ADDRGP4 offlineMenuInfo+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 190
;190:	offlineMenuInfo.trepidation.generic.id			= ID_TREPIDATION;
ADDRGP4 offlineMenuInfo+608+8
CNSTI4 11
ASGNI4
line 191
;191:	offlineMenuInfo.trepidation.generic.callback	= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+608+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 192
;192:	offlineMenuInfo.trepidation.string				= "TREPIDATION";
ADDRGP4 offlineMenuInfo+608+60
ADDRGP4 $170
ASGNP4
line 193
;193:	offlineMenuInfo.trepidation.color				= color_red;
ADDRGP4 offlineMenuInfo+608+68
ADDRGP4 color_red
ASGNP4
line 194
;194:	offlineMenuInfo.trepidation.style				= style;
ADDRGP4 offlineMenuInfo+608+64
ADDRLP4 4
INDIRI4
ASGNI4
line 196
;195:
;196:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 197
;197:	offlineMenuInfo.ffa.generic.type			= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+680
CNSTI4 9
ASGNI4
line 198
;198:	offlineMenuInfo.ffa.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+680+44
CNSTU4 264
ASGNU4
line 199
;199:	offlineMenuInfo.ffa.generic.x				= 320;
ADDRGP4 offlineMenuInfo+680+12
CNSTI4 320
ASGNI4
line 200
;200:	offlineMenuInfo.ffa.generic.y				= y;
ADDRGP4 offlineMenuInfo+680+16
ADDRLP4 0
INDIRI4
ASGNI4
line 201
;201:	offlineMenuInfo.ffa.generic.id			= ID_FFA;
ADDRGP4 offlineMenuInfo+680+8
CNSTI4 12
ASGNI4
line 202
;202:	offlineMenuInfo.ffa.generic.callback		= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+680+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 203
;203:	offlineMenuInfo.ffa.string				= "FREE FOR ALL";
ADDRGP4 offlineMenuInfo+680+60
ADDRGP4 $188
ASGNP4
line 204
;204:	offlineMenuInfo.ffa.color					= color_red;
ADDRGP4 offlineMenuInfo+680+68
ADDRGP4 color_red
ASGNP4
line 205
;205:	offlineMenuInfo.ffa.style					= style;
ADDRGP4 offlineMenuInfo+680+64
ADDRLP4 4
INDIRI4
ASGNI4
line 207
;206:
;207:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 208
;208:	offlineMenuInfo.ctf.generic.type					= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+752
CNSTI4 9
ASGNI4
line 209
;209:	offlineMenuInfo.ctf.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+752+44
CNSTU4 264
ASGNU4
line 210
;210:	offlineMenuInfo.ctf.generic.x					= 320;
ADDRGP4 offlineMenuInfo+752+12
CNSTI4 320
ASGNI4
line 211
;211:	offlineMenuInfo.ctf.generic.y					= y;
ADDRGP4 offlineMenuInfo+752+16
ADDRLP4 0
INDIRI4
ASGNI4
line 212
;212:	offlineMenuInfo.ctf.generic.id					= ID_CTF;
ADDRGP4 offlineMenuInfo+752+8
CNSTI4 13
ASGNI4
line 213
;213:	offlineMenuInfo.ctf.generic.callback				= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+752+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 214
;214:	offlineMenuInfo.ctf.string						= "CAPTURE THE FLAG";
ADDRGP4 offlineMenuInfo+752+60
ADDRGP4 $206
ASGNP4
line 215
;215:	offlineMenuInfo.ctf.color						= color_red;
ADDRGP4 offlineMenuInfo+752+68
ADDRGP4 color_red
ASGNP4
line 216
;216:	offlineMenuInfo.ctf.style						= style;
ADDRGP4 offlineMenuInfo+752+64
ADDRLP4 4
INDIRI4
ASGNI4
line 218
;217:
;218:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 219
;219:	offlineMenuInfo.arsenal.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+824
CNSTI4 9
ASGNI4
line 220
;220:	offlineMenuInfo.arsenal.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+824+44
CNSTU4 264
ASGNU4
line 221
;221:	offlineMenuInfo.arsenal.generic.x					= 320;
ADDRGP4 offlineMenuInfo+824+12
CNSTI4 320
ASGNI4
line 222
;222:	offlineMenuInfo.arsenal.generic.y					= y;
ADDRGP4 offlineMenuInfo+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 223
;223:	offlineMenuInfo.arsenal.generic.id					= ID_ARSENAL;
ADDRGP4 offlineMenuInfo+824+8
CNSTI4 14
ASGNI4
line 224
;224:	offlineMenuInfo.arsenal.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+824+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 225
;225:	offlineMenuInfo.arsenal.string						= "ARSENAL";
ADDRGP4 offlineMenuInfo+824+60
ADDRGP4 $224
ASGNP4
line 226
;226:	offlineMenuInfo.arsenal.color						= color_red;
ADDRGP4 offlineMenuInfo+824+68
ADDRGP4 color_red
ASGNP4
line 227
;227:	offlineMenuInfo.arsenal.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+824+64
CNSTI4 1
ASGNI4
line 229
;228:
;229:	y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 230
;230:	offlineMenuInfo.survival.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+896
CNSTI4 9
ASGNI4
line 231
;231:	offlineMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+896+44
CNSTU4 264
ASGNU4
line 232
;232:	offlineMenuInfo.survival.generic.x					= 320;
ADDRGP4 offlineMenuInfo+896+12
CNSTI4 320
ASGNI4
line 233
;233:	offlineMenuInfo.survival.generic.y					= y;
ADDRGP4 offlineMenuInfo+896+16
ADDRLP4 0
INDIRI4
ASGNI4
line 234
;234:	offlineMenuInfo.survival.generic.id					= ID_SURVIVAL;
ADDRGP4 offlineMenuInfo+896+8
CNSTI4 15
ASGNI4
line 235
;235:	offlineMenuInfo.survival.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+896+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 236
;236:	offlineMenuInfo.survival.string						= "SURVIVAL";
ADDRGP4 offlineMenuInfo+896+60
ADDRGP4 $242
ASGNP4
line 237
;237:	offlineMenuInfo.survival.color						= color_red;
ADDRGP4 offlineMenuInfo+896+68
ADDRGP4 color_red
ASGNP4
line 238
;238:	offlineMenuInfo.survival.style						= UI_CENTER;
ADDRGP4 offlineMenuInfo+896+64
CNSTI4 1
ASGNI4
line 240
;239:
;240:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $249
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $247
line 265
;241:#if 0
;242:		y += OFFLINE_MENU_VERTICAL_SPACING;
;243:		offlineMenuInfo.load.generic.type					= MTYPE_PTEXT;
;244:		offlineMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;245:		offlineMenuInfo.load.generic.x					= 320;
;246:		offlineMenuInfo.load.generic.y					= y;
;247:		offlineMenuInfo.load.generic.id					= ID_LOAD;
;248:		offlineMenuInfo.load.generic.callback				= UI_OfflineMenu_Event; 
;249:		offlineMenuInfo.load.string						= "LOAD";
;250:		offlineMenuInfo.load.color						= color_red;
;251:		offlineMenuInfo.load.style						= UI_CENTER;
;252:
;253:		y += OFFLINE_MENU_VERTICAL_SPACING;
;254:		offlineMenuInfo.save.generic.type					= MTYPE_PTEXT;
;255:		offlineMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;256:		offlineMenuInfo.save.generic.x					= 320;
;257:		offlineMenuInfo.save.generic.y					= y;
;258:		offlineMenuInfo.save.generic.id					= ID_SAVE;
;259:		offlineMenuInfo.save.generic.callback				= UI_OfflineMenu_Event; 
;260:		offlineMenuInfo.save.string						= "SAVE";
;261:		offlineMenuInfo.save.color						= color_red;
;262:		offlineMenuInfo.save.style						= UI_CENTER;
;263:#endif
;264:
;265:		y += OFFLINE_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 266
;266:		offlineMenuInfo.defaults.generic.type				= MTYPE_PTEXT;
ADDRGP4 offlineMenuInfo+968
CNSTI4 9
ASGNI4
line 267
;267:		offlineMenuInfo.defaults.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+968+44
CNSTU4 264
ASGNU4
line 268
;268:		offlineMenuInfo.defaults.generic.x				= 320;
ADDRGP4 offlineMenuInfo+968+12
CNSTI4 320
ASGNI4
line 269
;269:		offlineMenuInfo.defaults.generic.y				= y;
ADDRGP4 offlineMenuInfo+968+16
ADDRLP4 0
INDIRI4
ASGNI4
line 270
;270:		offlineMenuInfo.defaults.generic.id				= ID_DEFAULTS;
ADDRGP4 offlineMenuInfo+968+8
CNSTI4 17
ASGNI4
line 271
;271:		offlineMenuInfo.defaults.generic.callback			= UI_OfflineMenu_Event; 
ADDRGP4 offlineMenuInfo+968+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 272
;272:		offlineMenuInfo.defaults.string					= "DEFAULTS";
ADDRGP4 offlineMenuInfo+968+60
ADDRGP4 $263
ASGNP4
line 273
;273:		offlineMenuInfo.defaults.color					= color_red;
ADDRGP4 offlineMenuInfo+968+68
ADDRGP4 color_red
ASGNP4
line 274
;274:		offlineMenuInfo.defaults.style					= style;
ADDRGP4 offlineMenuInfo+968+64
ADDRLP4 4
INDIRI4
ASGNI4
line 275
;275:	}
LABELV $247
line 277
;276:
;277:	offlineMenuInfo.back.generic.type					= MTYPE_BITMAP;
ADDRGP4 offlineMenuInfo+1040
CNSTI4 6
ASGNI4
line 278
;278:	offlineMenuInfo.back.generic.name					= ART_BACK0;
ADDRGP4 offlineMenuInfo+1040+4
ADDRGP4 $271
ASGNP4
line 279
;279:	offlineMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 offlineMenuInfo+1040+44
CNSTU4 260
ASGNU4
line 280
;280:	offlineMenuInfo.back.generic.id					= ID_BACK;
ADDRGP4 offlineMenuInfo+1040+8
CNSTI4 18
ASGNI4
line 281
;281:	offlineMenuInfo.back.generic.callback				= UI_OfflineMenu_Event;
ADDRGP4 offlineMenuInfo+1040+48
ADDRGP4 UI_OfflineMenu_Event
ASGNP4
line 282
;282:	offlineMenuInfo.back.generic.x					= 0;
ADDRGP4 offlineMenuInfo+1040+12
CNSTI4 0
ASGNI4
line 283
;283:	offlineMenuInfo.back.generic.y					= 480-64;
ADDRGP4 offlineMenuInfo+1040+16
CNSTI4 416
ASGNI4
line 284
;284:	offlineMenuInfo.back.width						= 128;
ADDRGP4 offlineMenuInfo+1040+76
CNSTI4 128
ASGNI4
line 285
;285:	offlineMenuInfo.back.height						= 64;
ADDRGP4 offlineMenuInfo+1040+80
CNSTI4 64
ASGNI4
line 286
;286:	offlineMenuInfo.back.focuspic						= ART_BACK1;
ADDRGP4 offlineMenuInfo+1040+60
ADDRGP4 $288
ASGNP4
line 289
;287:
;288:	
;289:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.framel );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 290
;290:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.framer );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 291
;291:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.banner );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;292:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.tutorials );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 293
;293:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.trepidation );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 294
;294:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.ffa );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 295
;295:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.ctf );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 296
;296:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.arsenal );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 297
;297:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.survival );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 301
;298://	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.cdkey );
;299://	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.load );
;300://	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.save );
;301:	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
ADDRGP4 $249
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 0
NEF4 $298
line 302
;302:		Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.defaults );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 303
;303:	}
LABELV $298
line 304
;304:	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.back );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 offlineMenuInfo+1040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 305
;305:}
LABELV $96
endproc UI_OfflineMenu_Init 16 12
export UI_OfflineMenu_Cache
proc UI_OfflineMenu_Cache 0 4
line 313
;306:
;307:
;308:/*
;309:=================
;310:UI_OfflineMenu_Cache
;311:=================
;312:*/
;313:void UI_OfflineMenu_Cache( void ) {
line 314
;314:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $271
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 315
;315:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $288
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 316
;316:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $114
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 317
;317:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $128
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 318
;318:}
LABELV $302
endproc UI_OfflineMenu_Cache 0 4
export UI_OfflineMenu
proc UI_OfflineMenu 0 4
line 326
;319:
;320:
;321:/*
;322:===============
;323:UI_OfflineMenu
;324:===============
;325:*/
;326:void UI_OfflineMenu( void ) {
line 327
;327:	UI_OfflineMenu_Init();
ADDRGP4 UI_OfflineMenu_Init
CALLV
pop
line 328
;328:	UI_PushMenu( &offlineMenuInfo.menu );
ADDRGP4 offlineMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 329
;329:}
LABELV $303
endproc UI_OfflineMenu 0 4
bss
align 4
LABELV offlineMenuInfo
skip 1128
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
LABELV $288
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
LABELV $271
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
LABELV $263
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
LABELV $249
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
LABELV $242
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
LABELV $224
byte 1 65
byte 1 82
byte 1 83
byte 1 69
byte 1 78
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $206
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
LABELV $188
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
LABELV $170
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
LABELV $152
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
LABELV $128
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
LABELV $114
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
LABELV $106
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
LABELV $92
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
