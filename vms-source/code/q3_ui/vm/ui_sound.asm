data
align 4
LABELV quality_items
address $69
address $70
byte 4 0
code
proc UI_SoundOptionsMenu_Event 12 8
file "../ui_sound.c"
line 62
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:SOUND OPTIONS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_FRAMEL			"menu/art/frame2_l"
;15:#define ART_FRAMER			"menu/art/frame1_r"
;16:#define ART_BACK0			"menu/art/back_0"
;17:#define ART_BACK1			"menu/art/back_1"
;18:
;19:#define ID_GRAPHICS			10
;20:#define ID_DISPLAY			11
;21:#define ID_SOUND			12
;22:#define ID_NETWORK			13
;23:#define ID_EFFECTSVOLUME	14
;24:#define ID_MUSICVOLUME		15
;25:#define ID_QUALITY			16
;26:#define ID_A3D				17  // We're using the A3D Code for OpenAL
;27:#define ID_BACK				18
;28:
;29:
;30:static const char *quality_items[] = {
;31:	"Low", "High", 0
;32:};
;33:
;34:typedef struct {
;35:	menuframework_s		menu;
;36:
;37:	menutext_s			banner;
;38:	menubitmap_s		framel;
;39:	menubitmap_s		framer;
;40:
;41:	menutext_s			graphics;
;42:	menutext_s			display;
;43:	menutext_s			sound;
;44:	menutext_s			network;
;45:
;46:	menuslider_s		sfxvolume;
;47:	menuslider_s		musicvolume;
;48:	menulist_s			quality;
;49:	menuradiobutton_s	a3d;
;50:
;51:	menubitmap_s		back;
;52:} soundOptionsInfo_t;
;53:
;54:static soundOptionsInfo_t	soundOptionsInfo;
;55:
;56:
;57:/*
;58:=================
;59:UI_SoundOptionsMenu_Event
;60:=================
;61:*/
;62:static void UI_SoundOptionsMenu_Event( void* ptr, int event ) {
line 63
;63:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $73
line 64
;64:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 67
;65:	}
;66:
;67:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $75
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $75
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $109-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $109
address $78
address $79
address $76
address $81
address $82
address $86
address $90
address $98
address $108
code
LABELV $78
line 69
;68:	case ID_GRAPHICS:
;69:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 70
;70:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 71
;71:		break;
ADDRGP4 $76
JUMPV
LABELV $79
line 74
;72:
;73:	case ID_DISPLAY:
;74:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 75
;75:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 76
;76:		break;
ADDRGP4 $76
JUMPV
line 79
;77:
;78:	case ID_SOUND:
;79:		break;
LABELV $81
line 82
;80:
;81:	case ID_NETWORK:
;82:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 83
;83:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 84
;84:		break;
ADDRGP4 $76
JUMPV
LABELV $82
line 87
;85:
;86:	case ID_EFFECTSVOLUME:
;87:		trap_Cvar_SetValue( "s_volume", soundOptionsInfo.sfxvolume.curvalue / 10 );
ADDRGP4 $83
ARGP4
ADDRGP4 soundOptionsInfo+824+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 88
;88:		break;
ADDRGP4 $76
JUMPV
LABELV $86
line 91
;89:
;90:	case ID_MUSICVOLUME:
;91:		trap_Cvar_SetValue( "s_musicvolume", soundOptionsInfo.musicvolume.curvalue / 10 );
ADDRGP4 $87
ARGP4
ADDRGP4 soundOptionsInfo+900+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 92
;92:		break;
ADDRGP4 $76
JUMPV
LABELV $90
line 95
;93:
;94:	case ID_QUALITY:
;95:		if( soundOptionsInfo.quality.curvalue ) {
ADDRGP4 soundOptionsInfo+976+64
INDIRI4
CNSTI4 0
EQI4 $91
line 96
;96:			trap_Cvar_SetValue( "s_khz", 22 );
ADDRGP4 $95
ARGP4
CNSTF4 1102053376
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 97
;97:			trap_Cvar_SetValue( "s_compression", 0 );
ADDRGP4 $96
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 98
;98:		}
ADDRGP4 $92
JUMPV
LABELV $91
line 99
;99:		else {
line 100
;100:			trap_Cvar_SetValue( "s_khz", 11 );
ADDRGP4 $95
ARGP4
CNSTF4 1093664768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 101
;101:			trap_Cvar_SetValue( "s_compression", 1 );
ADDRGP4 $96
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 102
;102:		}
LABELV $92
line 103
;103:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 104
;104:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $97
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 105
;105:		break;
ADDRGP4 $76
JUMPV
LABELV $98
line 108
;106:
;107:	case ID_A3D:
;108:		if( soundOptionsInfo.a3d.curvalue ) {
ADDRGP4 soundOptionsInfo+1072+60
INDIRI4
CNSTI4 0
EQI4 $99
line 109
;109:			trap_Cmd_ExecuteText( EXEC_NOW, "s_useOpenAL 1\n" );
CNSTI4 0
ARGI4
ADDRGP4 $103
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 110
;110:		}
ADDRGP4 $100
JUMPV
LABELV $99
line 111
;111:		else {
line 112
;112:			trap_Cmd_ExecuteText( EXEC_NOW, "s_useOpenAL 0\n" );
CNSTI4 0
ARGI4
ADDRGP4 $104
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 113
;113:		}
LABELV $100
line 114
;114:		soundOptionsInfo.a3d.curvalue = (int)trap_Cvar_VariableValue( "s_useOpenAL" );
ADDRGP4 $107
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1072+60
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 115
;115:		break;
ADDRGP4 $76
JUMPV
LABELV $108
line 118
;116:
;117:	case ID_BACK:
;118:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 119
;119:		break;
LABELV $75
LABELV $76
line 121
;120:	}
;121:}
LABELV $72
endproc UI_SoundOptionsMenu_Event 12 8
proc UI_SoundOptionsMenu_Init 24 12
line 129
;122:
;123:
;124:/*
;125:===============
;126:UI_SoundOptionsMenu_Init
;127:===============
;128:*/
;129:static void UI_SoundOptionsMenu_Init( void ) {
line 132
;130:	int				y;
;131:
;132:	memset( &soundOptionsInfo, 0, sizeof(soundOptionsInfo) );
ADDRGP4 soundOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1224
ARGI4
ADDRGP4 memset
CALLP4
pop
line 134
;133:
;134:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 135
;135:	soundOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 soundOptionsInfo+276
CNSTI4 1
ASGNI4
line 136
;136:	soundOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 soundOptionsInfo+280
CNSTI4 1
ASGNI4
line 138
;137:
;138:	soundOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 soundOptionsInfo+288
CNSTI4 10
ASGNI4
line 139
;139:	soundOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 soundOptionsInfo+288+44
CNSTU4 8
ASGNU4
line 140
;140:	soundOptionsInfo.banner.generic.x			= 320;
ADDRGP4 soundOptionsInfo+288+12
CNSTI4 320
ASGNI4
line 141
;141:	soundOptionsInfo.banner.generic.y			= 16;
ADDRGP4 soundOptionsInfo+288+16
CNSTI4 16
ASGNI4
line 142
;142:	soundOptionsInfo.banner.string				= "SYSTEM SETUP";
ADDRGP4 soundOptionsInfo+288+60
ADDRGP4 $123
ASGNP4
line 143
;143:	soundOptionsInfo.banner.color				= color_white;
ADDRGP4 soundOptionsInfo+288+68
ADDRGP4 color_white
ASGNP4
line 144
;144:	soundOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 soundOptionsInfo+288+64
CNSTI4 1
ASGNI4
line 146
;145:
;146:	soundOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+360
CNSTI4 6
ASGNI4
line 147
;147:	soundOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 soundOptionsInfo+360+4
ADDRGP4 $131
ASGNP4
line 148
;148:	soundOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+360+44
CNSTU4 16384
ASGNU4
line 149
;149:	soundOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 soundOptionsInfo+360+12
CNSTI4 0
ASGNI4
line 150
;150:	soundOptionsInfo.framel.generic.y			= 78;
ADDRGP4 soundOptionsInfo+360+16
CNSTI4 78
ASGNI4
line 151
;151:	soundOptionsInfo.framel.width				= 256;
ADDRGP4 soundOptionsInfo+360+76
CNSTI4 256
ASGNI4
line 152
;152:	soundOptionsInfo.framel.height				= 329;
ADDRGP4 soundOptionsInfo+360+80
CNSTI4 329
ASGNI4
line 154
;153:
;154:	soundOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+448
CNSTI4 6
ASGNI4
line 155
;155:	soundOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 soundOptionsInfo+448+4
ADDRGP4 $145
ASGNP4
line 156
;156:	soundOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+448+44
CNSTU4 16384
ASGNU4
line 157
;157:	soundOptionsInfo.framer.generic.x			= 376;
ADDRGP4 soundOptionsInfo+448+12
CNSTI4 376
ASGNI4
line 158
;158:	soundOptionsInfo.framer.generic.y			= 76;
ADDRGP4 soundOptionsInfo+448+16
CNSTI4 76
ASGNI4
line 159
;159:	soundOptionsInfo.framer.width				= 256;
ADDRGP4 soundOptionsInfo+448+76
CNSTI4 256
ASGNI4
line 160
;160:	soundOptionsInfo.framer.height				= 334;
ADDRGP4 soundOptionsInfo+448+80
CNSTI4 334
ASGNI4
line 162
;161:
;162:	soundOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+536
CNSTI4 9
ASGNI4
line 163
;163:	soundOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+536+44
CNSTU4 272
ASGNU4
line 164
;164:	soundOptionsInfo.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 soundOptionsInfo+536+8
CNSTI4 10
ASGNI4
line 165
;165:	soundOptionsInfo.graphics.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+536+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 166
;166:	soundOptionsInfo.graphics.generic.x			= 216;
ADDRGP4 soundOptionsInfo+536+12
CNSTI4 216
ASGNI4
line 167
;167:	soundOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+536+16
CNSTI4 186
ASGNI4
line 168
;168:	soundOptionsInfo.graphics.string			= "GRAPHICS";
ADDRGP4 soundOptionsInfo+536+60
ADDRGP4 $169
ASGNP4
line 169
;169:	soundOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+536+64
CNSTI4 2
ASGNI4
line 170
;170:	soundOptionsInfo.graphics.color				= color_red;
ADDRGP4 soundOptionsInfo+536+68
ADDRGP4 color_red
ASGNP4
line 172
;171:
;172:	soundOptionsInfo.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+608
CNSTI4 9
ASGNI4
line 173
;173:	soundOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+608+44
CNSTU4 272
ASGNU4
line 174
;174:	soundOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 soundOptionsInfo+608+8
CNSTI4 11
ASGNI4
line 175
;175:	soundOptionsInfo.display.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+608+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 176
;176:	soundOptionsInfo.display.generic.x			= 216;
ADDRGP4 soundOptionsInfo+608+12
CNSTI4 216
ASGNI4
line 177
;177:	soundOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+608+16
CNSTI4 213
ASGNI4
line 178
;178:	soundOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 soundOptionsInfo+608+60
ADDRGP4 $187
ASGNP4
line 179
;179:	soundOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+608+64
CNSTI4 2
ASGNI4
line 180
;180:	soundOptionsInfo.display.color				= color_red;
ADDRGP4 soundOptionsInfo+608+68
ADDRGP4 color_red
ASGNP4
line 182
;181:
;182:	soundOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+680
CNSTI4 9
ASGNI4
line 183
;183:	soundOptionsInfo.sound.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 soundOptionsInfo+680+44
CNSTU4 16
ASGNU4
line 184
;184:	soundOptionsInfo.sound.generic.id			= ID_SOUND;
ADDRGP4 soundOptionsInfo+680+8
CNSTI4 12
ASGNI4
line 185
;185:	soundOptionsInfo.sound.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+680+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 186
;186:	soundOptionsInfo.sound.generic.x			= 216;
ADDRGP4 soundOptionsInfo+680+12
CNSTI4 216
ASGNI4
line 187
;187:	soundOptionsInfo.sound.generic.y			= 240;
ADDRGP4 soundOptionsInfo+680+16
CNSTI4 240
ASGNI4
line 188
;188:	soundOptionsInfo.sound.string				= "SOUND";
ADDRGP4 soundOptionsInfo+680+60
ADDRGP4 $205
ASGNP4
line 189
;189:	soundOptionsInfo.sound.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+680+64
CNSTI4 2
ASGNI4
line 190
;190:	soundOptionsInfo.sound.color				= color_red;
ADDRGP4 soundOptionsInfo+680+68
ADDRGP4 color_red
ASGNP4
line 192
;191:
;192:	soundOptionsInfo.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+752
CNSTI4 9
ASGNI4
line 193
;193:	soundOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+752+44
CNSTU4 272
ASGNU4
line 194
;194:	soundOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 soundOptionsInfo+752+8
CNSTI4 13
ASGNI4
line 195
;195:	soundOptionsInfo.network.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+752+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 196
;196:	soundOptionsInfo.network.generic.x			= 216;
ADDRGP4 soundOptionsInfo+752+12
CNSTI4 216
ASGNI4
line 197
;197:	soundOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+752+16
CNSTI4 267
ASGNI4
line 198
;198:	soundOptionsInfo.network.string				= "NETWORK";
ADDRGP4 soundOptionsInfo+752+60
ADDRGP4 $223
ASGNP4
line 199
;199:	soundOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 soundOptionsInfo+752+64
CNSTI4 2
ASGNI4
line 200
;200:	soundOptionsInfo.network.color				= color_red;
ADDRGP4 soundOptionsInfo+752+68
ADDRGP4 color_red
ASGNP4
line 202
;201:
;202:	y = 240 - 1.5 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 213
ASGNI4
line 203
;203:	soundOptionsInfo.sfxvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+824
CNSTI4 1
ASGNI4
line 204
;204:	soundOptionsInfo.sfxvolume.generic.name		= "Effects Volume:";
ADDRGP4 soundOptionsInfo+824+4
ADDRGP4 $231
ASGNP4
line 205
;205:	soundOptionsInfo.sfxvolume.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+824+44
CNSTU4 258
ASGNU4
line 206
;206:	soundOptionsInfo.sfxvolume.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+824+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 207
;207:	soundOptionsInfo.sfxvolume.generic.id		= ID_EFFECTSVOLUME;
ADDRGP4 soundOptionsInfo+824+8
CNSTI4 14
ASGNI4
line 208
;208:	soundOptionsInfo.sfxvolume.generic.x		= 400;
ADDRGP4 soundOptionsInfo+824+12
CNSTI4 400
ASGNI4
line 209
;209:	soundOptionsInfo.sfxvolume.generic.y		= y;
ADDRGP4 soundOptionsInfo+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 210
;210:	soundOptionsInfo.sfxvolume.minvalue			= 0;
ADDRGP4 soundOptionsInfo+824+60
CNSTF4 0
ASGNF4
line 211
;211:	soundOptionsInfo.sfxvolume.maxvalue			= 10;
ADDRGP4 soundOptionsInfo+824+64
CNSTF4 1092616192
ASGNF4
line 213
;212:
;213:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 214
;214:	soundOptionsInfo.musicvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+900
CNSTI4 1
ASGNI4
line 215
;215:	soundOptionsInfo.musicvolume.generic.name		= "Music Volume:";
ADDRGP4 soundOptionsInfo+900+4
ADDRGP4 $249
ASGNP4
line 216
;216:	soundOptionsInfo.musicvolume.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+900+44
CNSTU4 258
ASGNU4
line 217
;217:	soundOptionsInfo.musicvolume.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+900+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 218
;218:	soundOptionsInfo.musicvolume.generic.id			= ID_MUSICVOLUME;
ADDRGP4 soundOptionsInfo+900+8
CNSTI4 15
ASGNI4
line 219
;219:	soundOptionsInfo.musicvolume.generic.x			= 400;
ADDRGP4 soundOptionsInfo+900+12
CNSTI4 400
ASGNI4
line 220
;220:	soundOptionsInfo.musicvolume.generic.y			= y;
ADDRGP4 soundOptionsInfo+900+16
ADDRLP4 0
INDIRI4
ASGNI4
line 221
;221:	soundOptionsInfo.musicvolume.minvalue			= 0;
ADDRGP4 soundOptionsInfo+900+60
CNSTF4 0
ASGNF4
line 222
;222:	soundOptionsInfo.musicvolume.maxvalue			= 10;
ADDRGP4 soundOptionsInfo+900+64
CNSTF4 1092616192
ASGNF4
line 224
;223:
;224:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 225
;225:	soundOptionsInfo.quality.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 soundOptionsInfo+976
CNSTI4 3
ASGNI4
line 226
;226:	soundOptionsInfo.quality.generic.name		= "Sound Quality:";
ADDRGP4 soundOptionsInfo+976+4
ADDRGP4 $267
ASGNP4
line 227
;227:	soundOptionsInfo.quality.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+976+44
CNSTU4 258
ASGNU4
line 228
;228:	soundOptionsInfo.quality.generic.callback	= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+976+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 229
;229:	soundOptionsInfo.quality.generic.id			= ID_QUALITY;
ADDRGP4 soundOptionsInfo+976+8
CNSTI4 16
ASGNI4
line 230
;230:	soundOptionsInfo.quality.generic.x			= 400;
ADDRGP4 soundOptionsInfo+976+12
CNSTI4 400
ASGNI4
line 231
;231:	soundOptionsInfo.quality.generic.y			= y;
ADDRGP4 soundOptionsInfo+976+16
ADDRLP4 0
INDIRI4
ASGNI4
line 232
;232:	soundOptionsInfo.quality.itemnames			= quality_items;
ADDRGP4 soundOptionsInfo+976+76
ADDRGP4 quality_items
ASGNP4
line 234
;233:
;234:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 235
;235:	soundOptionsInfo.a3d.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 soundOptionsInfo+1072
CNSTI4 5
ASGNI4
line 236
;236:	soundOptionsInfo.a3d.generic.name			= "OPENAL:";
ADDRGP4 soundOptionsInfo+1072+4
ADDRGP4 $283
ASGNP4
line 237
;237:	soundOptionsInfo.a3d.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1072+44
CNSTU4 258
ASGNU4
line 238
;238:	soundOptionsInfo.a3d.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1072+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 239
;239:	soundOptionsInfo.a3d.generic.id				= ID_A3D;
ADDRGP4 soundOptionsInfo+1072+8
CNSTI4 17
ASGNI4
line 240
;240:	soundOptionsInfo.a3d.generic.x				= 400;
ADDRGP4 soundOptionsInfo+1072+12
CNSTI4 400
ASGNI4
line 241
;241:	soundOptionsInfo.a3d.generic.y				= y;
ADDRGP4 soundOptionsInfo+1072+16
ADDRLP4 0
INDIRI4
ASGNI4
line 243
;242:
;243:	soundOptionsInfo.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+1136
CNSTI4 6
ASGNI4
line 244
;244:	soundOptionsInfo.back.generic.name			= ART_BACK0;
ADDRGP4 soundOptionsInfo+1136+4
ADDRGP4 $297
ASGNP4
line 245
;245:	soundOptionsInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+1136+44
CNSTU4 260
ASGNU4
line 246
;246:	soundOptionsInfo.back.generic.callback		= UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1136+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 247
;247:	soundOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 soundOptionsInfo+1136+8
CNSTI4 18
ASGNI4
line 248
;248:	soundOptionsInfo.back.generic.x				= 0;
ADDRGP4 soundOptionsInfo+1136+12
CNSTI4 0
ASGNI4
line 249
;249:	soundOptionsInfo.back.generic.y				= 480-64;
ADDRGP4 soundOptionsInfo+1136+16
CNSTI4 416
ASGNI4
line 250
;250:	soundOptionsInfo.back.width					= 128;
ADDRGP4 soundOptionsInfo+1136+76
CNSTI4 128
ASGNI4
line 251
;251:	soundOptionsInfo.back.height				= 64;
ADDRGP4 soundOptionsInfo+1136+80
CNSTI4 64
ASGNI4
line 252
;252:	soundOptionsInfo.back.focuspic				= ART_BACK1;
ADDRGP4 soundOptionsInfo+1136+60
ADDRGP4 $314
ASGNP4
line 254
;253:
;254:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.banner );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 255
;255:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.framel );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 256
;256:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.framer );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 257
;257:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.graphics );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 258
;258:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.display );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 259
;259:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sound );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 260
;260:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.network );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 261
;261:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.sfxvolume );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 262
;262:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.musicvolume );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+900
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 263
;263:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.quality );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+976
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 264
;264:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.a3d );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1072
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 265
;265:	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.back );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1136
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 267
;266:
;267:	soundOptionsInfo.sfxvolume.curvalue = trap_Cvar_VariableValue( "s_volume" ) * 10;
ADDRGP4 $83
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+824+68
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 268
;268:	soundOptionsInfo.musicvolume.curvalue = trap_Cvar_VariableValue( "s_musicvolume" ) * 10;
ADDRGP4 $87
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+900+68
CNSTF4 1092616192
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 269
;269:	soundOptionsInfo.quality.curvalue = !trap_Cvar_VariableValue( "s_compression" );
ADDRGP4 $96
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $334
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $335
JUMPV
LABELV $334
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $335
ADDRGP4 soundOptionsInfo+976+64
ADDRLP4 12
INDIRI4
ASGNI4
line 270
;270:	soundOptionsInfo.a3d.curvalue = (int)trap_Cvar_VariableValue( "s_useOpenAL" );
ADDRGP4 $107
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+1072+60
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 271
;271:}
LABELV $111
endproc UI_SoundOptionsMenu_Init 24 12
export UI_SoundOptionsMenu_Cache
proc UI_SoundOptionsMenu_Cache 0 4
line 279
;272:
;273:
;274:/*
;275:===============
;276:UI_SoundOptionsMenu_Cache
;277:===============
;278:*/
;279:void UI_SoundOptionsMenu_Cache( void ) {
line 280
;280:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $131
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 281
;281:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $145
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 282
;282:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $297
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 283
;283:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $314
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 284
;284:}
LABELV $338
endproc UI_SoundOptionsMenu_Cache 0 4
export UI_SoundOptionsMenu
proc UI_SoundOptionsMenu 0 8
line 292
;285:
;286:
;287:/*
;288:===============
;289:UI_SoundOptionsMenu
;290:===============
;291:*/
;292:void UI_SoundOptionsMenu( void ) {
line 293
;293:	UI_SoundOptionsMenu_Init();
ADDRGP4 UI_SoundOptionsMenu_Init
CALLV
pop
line 294
;294:	UI_PushMenu( &soundOptionsInfo.menu );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 295
;295:	Menu_SetCursorToItem( &soundOptionsInfo.menu, &soundOptionsInfo.sound );
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+680
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 296
;296:}
LABELV $339
endproc UI_SoundOptionsMenu 0 8
bss
align 4
LABELV soundOptionsInfo
skip 1224
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
LABELV $314
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
LABELV $297
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
byte 1 48
byte 1 0
align 1
LABELV $283
byte 1 79
byte 1 80
byte 1 69
byte 1 78
byte 1 65
byte 1 76
byte 1 58
byte 1 0
align 1
LABELV $267
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $249
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $231
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $223
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $205
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $187
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $169
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $145
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
LABELV $131
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
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $123
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $107
byte 1 115
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $104
byte 1 115
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 65
byte 1 76
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $103
byte 1 115
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 65
byte 1 76
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $97
byte 1 115
byte 1 110
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
LABELV $96
byte 1 115
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 95
byte 1 107
byte 1 104
byte 1 122
byte 1 0
align 1
LABELV $87
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $83
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $70
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $69
byte 1 76
byte 1 111
byte 1 119
byte 1 0
