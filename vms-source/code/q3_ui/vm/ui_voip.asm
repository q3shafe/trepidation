data
align 4
LABELV xquality_items
address $69
address $70
byte 4 0
code
proc UI_VoipOptionsMenu_Event 12 8
file "../ui_voip.c"
line 64
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:/*
;4:=======================================================================
;5:
;6:VOIP OPTIONS MENU
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
;26:#define ID_ENABLEVOIP		17  
;27:#define ID_BACK				18
;28:#define ID_VOIP				19
;29:
;30:static const char *xquality_items[] = {
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
;45:	menutext_s			voip;
;46:
;47:	menuradiobutton_s	enablevoip;
;48:	menuslider_s		sfxvolume;
;49:	menuslider_s		musicvolume;
;50:	menulist_s			quality;
;51:	
;52:
;53:	menubitmap_s		back;
;54:} voipOptionsInfo_t;
;55:
;56:static voipOptionsInfo_t	voipOptionsInfo;
;57:
;58:
;59:/*
;60:=================
;61:UI_Vpo[OptionsMenu_Event
;62:=================
;63:*/
;64:static void UI_VoipOptionsMenu_Event( void* ptr, int event ) {
line 65
;65:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $73
line 66
;66:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 69
;67:	}
;68:
;69:	switch( ((menucommon_s*)ptr)->id ) {
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
CNSTI4 19
GTI4 $75
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $110-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $110
address $78
address $79
address $76
address $81
address $83
address $87
address $91
address $99
address $109
address $82
code
LABELV $78
line 71
;70:	case ID_GRAPHICS:
;71:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 72
;72:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 73
;73:		break;
ADDRGP4 $76
JUMPV
LABELV $79
line 76
;74:
;75:	case ID_DISPLAY:
;76:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 77
;77:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 78
;78:		break;
ADDRGP4 $76
JUMPV
line 81
;79:
;80:	case ID_SOUND:
;81:		break;
LABELV $81
line 84
;82:
;83:	case ID_NETWORK:
;84:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 85
;85:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 86
;86:		break;
ADDRGP4 $76
JUMPV
LABELV $82
line 89
;87:
;88:	case ID_VOIP:
;89:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 90
;90:		UI_VoipOptionsMenu();
ADDRGP4 UI_VoipOptionsMenu
CALLV
pop
line 91
;91:		break;
ADDRGP4 $76
JUMPV
LABELV $83
line 94
;92:
;93:	case ID_EFFECTSVOLUME:
;94:		trap_Cvar_SetValue( "s_volume", voipOptionsInfo.sfxvolume.curvalue / 10 );
ADDRGP4 $84
ARGP4
ADDRGP4 voipOptionsInfo+960+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 95
;95:		break;
ADDRGP4 $76
JUMPV
LABELV $87
line 98
;96:
;97:	case ID_MUSICVOLUME:
;98:		trap_Cvar_SetValue( "s_musicvolume", voipOptionsInfo.musicvolume.curvalue / 10 );
ADDRGP4 $88
ARGP4
ADDRGP4 voipOptionsInfo+1036+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 99
;99:		break;
ADDRGP4 $76
JUMPV
LABELV $91
line 102
;100:
;101:	case ID_QUALITY:
;102:		if( voipOptionsInfo.quality.curvalue ) {
ADDRGP4 voipOptionsInfo+1112+64
INDIRI4
CNSTI4 0
EQI4 $92
line 103
;103:			trap_Cvar_SetValue( "s_khz", 22 );
ADDRGP4 $96
ARGP4
CNSTF4 1102053376
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 104
;104:			trap_Cvar_SetValue( "s_compression", 0 );
ADDRGP4 $97
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 105
;105:		}
ADDRGP4 $93
JUMPV
LABELV $92
line 106
;106:		else {
line 107
;107:			trap_Cvar_SetValue( "s_khz", 11 );
ADDRGP4 $96
ARGP4
CNSTF4 1093664768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 108
;108:			trap_Cvar_SetValue( "s_compression", 1 );
ADDRGP4 $97
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 109
;109:		}
LABELV $93
line 110
;110:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 111
;111:		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $98
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 112
;112:		break;
ADDRGP4 $76
JUMPV
LABELV $99
line 115
;113:
;114:	case ID_ENABLEVOIP:
;115:		if( voipOptionsInfo.enablevoip.curvalue ) {
ADDRGP4 voipOptionsInfo+896+60
INDIRI4
CNSTI4 0
EQI4 $100
line 116
;116:			trap_Cmd_ExecuteText( EXEC_NOW, "cl_voip 1\n" );
CNSTI4 0
ARGI4
ADDRGP4 $104
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 117
;117:		}
ADDRGP4 $101
JUMPV
LABELV $100
line 118
;118:		else {
line 119
;119:			trap_Cmd_ExecuteText( EXEC_NOW, "cl_voip 0\n" );
CNSTI4 0
ARGI4
ADDRGP4 $105
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 120
;120:		}
LABELV $101
line 121
;121:		voipOptionsInfo.enablevoip.curvalue = (int)trap_Cvar_VariableValue( "cl_voip" );
ADDRGP4 $108
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 voipOptionsInfo+896+60
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 122
;122:		break;
ADDRGP4 $76
JUMPV
LABELV $109
line 125
;123:
;124:	case ID_BACK:
;125:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 126
;126:		break;
LABELV $75
LABELV $76
line 128
;127:	}
;128:}
LABELV $72
endproc UI_VoipOptionsMenu_Event 12 8
proc UI_VoipOptionsMenu_Init 24 12
line 136
;129:
;130:
;131:/*
;132:===============
;133:UI_SoundOptionsMenu_Init
;134:===============
;135:*/
;136:static void UI_VoipOptionsMenu_Init( void ) {
line 139
;137:	int				y;
;138:
;139:	memset( &voipOptionsInfo, 0, sizeof(voipOptionsInfo) );
ADDRGP4 voipOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1296
ARGI4
ADDRGP4 memset
CALLP4
pop
line 141
;140:
;141:	UI_VoipOptionsMenu_Cache();
ADDRGP4 UI_VoipOptionsMenu_Cache
CALLV
pop
line 142
;142:	voipOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 voipOptionsInfo+276
CNSTI4 1
ASGNI4
line 143
;143:	voipOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 voipOptionsInfo+280
CNSTI4 1
ASGNI4
line 145
;144:
;145:	voipOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 voipOptionsInfo+288
CNSTI4 10
ASGNI4
line 146
;146:	voipOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 voipOptionsInfo+288+44
CNSTU4 8
ASGNU4
line 147
;147:	voipOptionsInfo.banner.generic.x			= 320;
ADDRGP4 voipOptionsInfo+288+12
CNSTI4 320
ASGNI4
line 148
;148:	voipOptionsInfo.banner.generic.y			= 16;
ADDRGP4 voipOptionsInfo+288+16
CNSTI4 16
ASGNI4
line 149
;149:	voipOptionsInfo.banner.string				= "SYSTEM SETUP";
ADDRGP4 voipOptionsInfo+288+60
ADDRGP4 $124
ASGNP4
line 150
;150:	voipOptionsInfo.banner.color				= color_white;
ADDRGP4 voipOptionsInfo+288+68
ADDRGP4 color_white
ASGNP4
line 151
;151:	voipOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 voipOptionsInfo+288+64
CNSTI4 1
ASGNI4
line 153
;152:
;153:	voipOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 voipOptionsInfo+360
CNSTI4 6
ASGNI4
line 154
;154:	voipOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 voipOptionsInfo+360+4
ADDRGP4 $132
ASGNP4
line 155
;155:	voipOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 voipOptionsInfo+360+44
CNSTU4 16384
ASGNU4
line 156
;156:	voipOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 voipOptionsInfo+360+12
CNSTI4 0
ASGNI4
line 157
;157:	voipOptionsInfo.framel.generic.y			= 78;
ADDRGP4 voipOptionsInfo+360+16
CNSTI4 78
ASGNI4
line 158
;158:	voipOptionsInfo.framel.width				= 256;
ADDRGP4 voipOptionsInfo+360+76
CNSTI4 256
ASGNI4
line 159
;159:	voipOptionsInfo.framel.height				= 329;
ADDRGP4 voipOptionsInfo+360+80
CNSTI4 329
ASGNI4
line 161
;160:
;161:	voipOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 voipOptionsInfo+448
CNSTI4 6
ASGNI4
line 162
;162:	voipOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 voipOptionsInfo+448+4
ADDRGP4 $146
ASGNP4
line 163
;163:	voipOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 voipOptionsInfo+448+44
CNSTU4 16384
ASGNU4
line 164
;164:	voipOptionsInfo.framer.generic.x			= 376;
ADDRGP4 voipOptionsInfo+448+12
CNSTI4 376
ASGNI4
line 165
;165:	voipOptionsInfo.framer.generic.y			= 76;
ADDRGP4 voipOptionsInfo+448+16
CNSTI4 76
ASGNI4
line 166
;166:	voipOptionsInfo.framer.width				= 256;
ADDRGP4 voipOptionsInfo+448+76
CNSTI4 256
ASGNI4
line 167
;167:	voipOptionsInfo.framer.height				= 334;
ADDRGP4 voipOptionsInfo+448+80
CNSTI4 334
ASGNI4
line 169
;168:
;169:	voipOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 voipOptionsInfo+536
CNSTI4 9
ASGNI4
line 170
;170:	voipOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 voipOptionsInfo+536+44
CNSTU4 272
ASGNU4
line 171
;171:	voipOptionsInfo.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 voipOptionsInfo+536+8
CNSTI4 10
ASGNI4
line 172
;172:	voipOptionsInfo.graphics.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+536+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 173
;173:	voipOptionsInfo.graphics.generic.x			= 216;
ADDRGP4 voipOptionsInfo+536+12
CNSTI4 216
ASGNI4
line 174
;174:	voipOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 voipOptionsInfo+536+16
CNSTI4 186
ASGNI4
line 175
;175:	voipOptionsInfo.graphics.string			= "GRAPHICS";
ADDRGP4 voipOptionsInfo+536+60
ADDRGP4 $170
ASGNP4
line 176
;176:	voipOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 voipOptionsInfo+536+64
CNSTI4 2
ASGNI4
line 177
;177:	voipOptionsInfo.graphics.color				= color_red;
ADDRGP4 voipOptionsInfo+536+68
ADDRGP4 color_red
ASGNP4
line 179
;178:
;179:	voipOptionsInfo.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 voipOptionsInfo+608
CNSTI4 9
ASGNI4
line 180
;180:	voipOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 voipOptionsInfo+608+44
CNSTU4 272
ASGNU4
line 181
;181:	voipOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 voipOptionsInfo+608+8
CNSTI4 11
ASGNI4
line 182
;182:	voipOptionsInfo.display.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+608+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 183
;183:	voipOptionsInfo.display.generic.x			= 216;
ADDRGP4 voipOptionsInfo+608+12
CNSTI4 216
ASGNI4
line 184
;184:	voipOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 voipOptionsInfo+608+16
CNSTI4 213
ASGNI4
line 185
;185:	voipOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 voipOptionsInfo+608+60
ADDRGP4 $188
ASGNP4
line 186
;186:	voipOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 voipOptionsInfo+608+64
CNSTI4 2
ASGNI4
line 187
;187:	voipOptionsInfo.display.color				= color_red;
ADDRGP4 voipOptionsInfo+608+68
ADDRGP4 color_red
ASGNP4
line 189
;188:
;189:	voipOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 voipOptionsInfo+680
CNSTI4 9
ASGNI4
line 190
;190:	voipOptionsInfo.sound.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 voipOptionsInfo+680+44
CNSTU4 16
ASGNU4
line 191
;191:	voipOptionsInfo.sound.generic.id			= ID_SOUND;
ADDRGP4 voipOptionsInfo+680+8
CNSTI4 12
ASGNI4
line 192
;192:	voipOptionsInfo.sound.generic.callback		= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+680+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 193
;193:	voipOptionsInfo.sound.generic.x			= 216;
ADDRGP4 voipOptionsInfo+680+12
CNSTI4 216
ASGNI4
line 194
;194:	voipOptionsInfo.sound.generic.y			= 240;
ADDRGP4 voipOptionsInfo+680+16
CNSTI4 240
ASGNI4
line 195
;195:	voipOptionsInfo.sound.string				= "SOUND";
ADDRGP4 voipOptionsInfo+680+60
ADDRGP4 $206
ASGNP4
line 196
;196:	voipOptionsInfo.sound.style				= UI_RIGHT;
ADDRGP4 voipOptionsInfo+680+64
CNSTI4 2
ASGNI4
line 197
;197:	voipOptionsInfo.sound.color				= color_red;
ADDRGP4 voipOptionsInfo+680+68
ADDRGP4 color_red
ASGNP4
line 199
;198:
;199:	voipOptionsInfo.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 voipOptionsInfo+752
CNSTI4 9
ASGNI4
line 200
;200:	voipOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 voipOptionsInfo+752+44
CNSTU4 272
ASGNU4
line 201
;201:	voipOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 voipOptionsInfo+752+8
CNSTI4 13
ASGNI4
line 202
;202:	voipOptionsInfo.network.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+752+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 203
;203:	voipOptionsInfo.network.generic.x			= 216;
ADDRGP4 voipOptionsInfo+752+12
CNSTI4 216
ASGNI4
line 204
;204:	voipOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 voipOptionsInfo+752+16
CNSTI4 267
ASGNI4
line 205
;205:	voipOptionsInfo.network.string				= "NETWORK";
ADDRGP4 voipOptionsInfo+752+60
ADDRGP4 $224
ASGNP4
line 206
;206:	voipOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 voipOptionsInfo+752+64
CNSTI4 2
ASGNI4
line 207
;207:	voipOptionsInfo.network.color				= color_red;
ADDRGP4 voipOptionsInfo+752+68
ADDRGP4 color_red
ASGNP4
line 209
;208:
;209:	voipOptionsInfo.voip.generic.type		= MTYPE_PTEXT;
ADDRGP4 voipOptionsInfo+824
CNSTI4 9
ASGNI4
line 210
;210:	voipOptionsInfo.voip.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 voipOptionsInfo+824+44
CNSTU4 272
ASGNU4
line 211
;211:	voipOptionsInfo.voip.generic.id			= ID_VOIP;
ADDRGP4 voipOptionsInfo+824+8
CNSTI4 19
ASGNI4
line 212
;212:	voipOptionsInfo.voip.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+824+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 213
;213:	voipOptionsInfo.voip.generic.x			= 216;
ADDRGP4 voipOptionsInfo+824+12
CNSTI4 216
ASGNI4
line 214
;214:	voipOptionsInfo.voip.generic.y			= 240 + PROP_HEIGHT+ PROP_HEIGHT;
ADDRGP4 voipOptionsInfo+824+16
CNSTI4 294
ASGNI4
line 215
;215:	voipOptionsInfo.voip.string				= "VOICE";
ADDRGP4 voipOptionsInfo+824+60
ADDRGP4 $242
ASGNP4
line 216
;216:	voipOptionsInfo.voip.style				= UI_RIGHT;
ADDRGP4 voipOptionsInfo+824+64
CNSTI4 2
ASGNI4
line 217
;217:	voipOptionsInfo.voip.color				= color_red;
ADDRGP4 voipOptionsInfo+824+68
ADDRGP4 color_red
ASGNP4
line 219
;218:
;219:	voipOptionsInfo.voip.generic.type		= MTYPE_PTEXT;
ADDRGP4 voipOptionsInfo+824
CNSTI4 9
ASGNI4
line 220
;220:	voipOptionsInfo.voip.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 voipOptionsInfo+824+44
CNSTU4 272
ASGNU4
line 221
;221:	voipOptionsInfo.voip.generic.id			= ID_VOIP;
ADDRGP4 voipOptionsInfo+824+8
CNSTI4 19
ASGNI4
line 222
;222:	voipOptionsInfo.voip.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+824+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 223
;223:	voipOptionsInfo.voip.generic.x			= 216;
ADDRGP4 voipOptionsInfo+824+12
CNSTI4 216
ASGNI4
line 224
;224:	voipOptionsInfo.voip.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 voipOptionsInfo+824+16
CNSTI4 267
ASGNI4
line 225
;225:	voipOptionsInfo.voip.string				= "VOICE";
ADDRGP4 voipOptionsInfo+824+60
ADDRGP4 $242
ASGNP4
line 226
;226:	voipOptionsInfo.voip.style				= UI_RIGHT;
ADDRGP4 voipOptionsInfo+824+64
CNSTI4 2
ASGNI4
line 227
;227:	voipOptionsInfo.voip.color				= color_red;
ADDRGP4 voipOptionsInfo+824+68
ADDRGP4 color_red
ASGNP4
line 229
;228:
;229:	y = 240 - 1.5 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 213
ASGNI4
line 231
;230:	
;231:	voipOptionsInfo.enablevoip.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 voipOptionsInfo+896
CNSTI4 5
ASGNI4
line 232
;232:	voipOptionsInfo.enablevoip.generic.name			= "ENABLE VOICE/VOIP:";
ADDRGP4 voipOptionsInfo+896+4
ADDRGP4 $267
ASGNP4
line 233
;233:	voipOptionsInfo.enablevoip.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 voipOptionsInfo+896+44
CNSTU4 258
ASGNU4
line 234
;234:	voipOptionsInfo.enablevoip.generic.callback		= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+896+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 235
;235:	voipOptionsInfo.enablevoip.generic.id				= ID_ENABLEVOIP;
ADDRGP4 voipOptionsInfo+896+8
CNSTI4 17
ASGNI4
line 236
;236:	voipOptionsInfo.enablevoip.generic.x				= 400;
ADDRGP4 voipOptionsInfo+896+12
CNSTI4 400
ASGNI4
line 237
;237:	voipOptionsInfo.enablevoip.generic.y				= y;
ADDRGP4 voipOptionsInfo+896+16
ADDRLP4 0
INDIRI4
ASGNI4
line 240
;238:	
;239:	
;240:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 241
;241:	voipOptionsInfo.sfxvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 voipOptionsInfo+960
CNSTI4 1
ASGNI4
line 242
;242:	voipOptionsInfo.sfxvolume.generic.name		= "Effects Volume:";
ADDRGP4 voipOptionsInfo+960+4
ADDRGP4 $281
ASGNP4
line 243
;243:	voipOptionsInfo.sfxvolume.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 voipOptionsInfo+960+44
CNSTU4 258
ASGNU4
line 244
;244:	voipOptionsInfo.sfxvolume.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+960+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 245
;245:	voipOptionsInfo.sfxvolume.generic.id		= ID_EFFECTSVOLUME;
ADDRGP4 voipOptionsInfo+960+8
CNSTI4 14
ASGNI4
line 246
;246:	voipOptionsInfo.sfxvolume.generic.x		= 400;
ADDRGP4 voipOptionsInfo+960+12
CNSTI4 400
ASGNI4
line 247
;247:	voipOptionsInfo.sfxvolume.generic.y		= y;
ADDRGP4 voipOptionsInfo+960+16
ADDRLP4 0
INDIRI4
ASGNI4
line 248
;248:	voipOptionsInfo.sfxvolume.minvalue			= 0;
ADDRGP4 voipOptionsInfo+960+60
CNSTF4 0
ASGNF4
line 249
;249:	voipOptionsInfo.sfxvolume.maxvalue			= 10;
ADDRGP4 voipOptionsInfo+960+64
CNSTF4 1092616192
ASGNF4
line 251
;250:
;251:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 252
;252:	voipOptionsInfo.musicvolume.generic.type		= MTYPE_SLIDER;
ADDRGP4 voipOptionsInfo+1036
CNSTI4 1
ASGNI4
line 253
;253:	voipOptionsInfo.musicvolume.generic.name		= "Music Volume:";
ADDRGP4 voipOptionsInfo+1036+4
ADDRGP4 $299
ASGNP4
line 254
;254:	voipOptionsInfo.musicvolume.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 voipOptionsInfo+1036+44
CNSTU4 258
ASGNU4
line 255
;255:	voipOptionsInfo.musicvolume.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+1036+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 256
;256:	voipOptionsInfo.musicvolume.generic.id			= ID_MUSICVOLUME;
ADDRGP4 voipOptionsInfo+1036+8
CNSTI4 15
ASGNI4
line 257
;257:	voipOptionsInfo.musicvolume.generic.x			= 400;
ADDRGP4 voipOptionsInfo+1036+12
CNSTI4 400
ASGNI4
line 258
;258:	voipOptionsInfo.musicvolume.generic.y			= y;
ADDRGP4 voipOptionsInfo+1036+16
ADDRLP4 0
INDIRI4
ASGNI4
line 259
;259:	voipOptionsInfo.musicvolume.minvalue			= 0;
ADDRGP4 voipOptionsInfo+1036+60
CNSTF4 0
ASGNF4
line 260
;260:	voipOptionsInfo.musicvolume.maxvalue			= 10;
ADDRGP4 voipOptionsInfo+1036+64
CNSTF4 1092616192
ASGNF4
line 262
;261:
;262:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 263
;263:	voipOptionsInfo.quality.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 voipOptionsInfo+1112
CNSTI4 3
ASGNI4
line 264
;264:	voipOptionsInfo.quality.generic.name		= "Sound Quality:";
ADDRGP4 voipOptionsInfo+1112+4
ADDRGP4 $317
ASGNP4
line 265
;265:	voipOptionsInfo.quality.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 voipOptionsInfo+1112+44
CNSTU4 258
ASGNU4
line 266
;266:	voipOptionsInfo.quality.generic.callback	= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+1112+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 267
;267:	voipOptionsInfo.quality.generic.id			= ID_QUALITY;
ADDRGP4 voipOptionsInfo+1112+8
CNSTI4 16
ASGNI4
line 268
;268:	voipOptionsInfo.quality.generic.x			= 400;
ADDRGP4 voipOptionsInfo+1112+12
CNSTI4 400
ASGNI4
line 269
;269:	voipOptionsInfo.quality.generic.y			= y;
ADDRGP4 voipOptionsInfo+1112+16
ADDRLP4 0
INDIRI4
ASGNI4
line 270
;270:	voipOptionsInfo.quality.itemnames			= xquality_items;
ADDRGP4 voipOptionsInfo+1112+76
ADDRGP4 xquality_items
ASGNP4
line 274
;271:
;272:	
;273:
;274:	voipOptionsInfo.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 voipOptionsInfo+1208
CNSTI4 6
ASGNI4
line 275
;275:	voipOptionsInfo.back.generic.name			= ART_BACK0;
ADDRGP4 voipOptionsInfo+1208+4
ADDRGP4 $333
ASGNP4
line 276
;276:	voipOptionsInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 voipOptionsInfo+1208+44
CNSTU4 260
ASGNU4
line 277
;277:	voipOptionsInfo.back.generic.callback		= UI_VoipOptionsMenu_Event;
ADDRGP4 voipOptionsInfo+1208+48
ADDRGP4 UI_VoipOptionsMenu_Event
ASGNP4
line 278
;278:	voipOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 voipOptionsInfo+1208+8
CNSTI4 18
ASGNI4
line 279
;279:	voipOptionsInfo.back.generic.x				= 0;
ADDRGP4 voipOptionsInfo+1208+12
CNSTI4 0
ASGNI4
line 280
;280:	voipOptionsInfo.back.generic.y				= 480-64;
ADDRGP4 voipOptionsInfo+1208+16
CNSTI4 416
ASGNI4
line 281
;281:	voipOptionsInfo.back.width					= 128;
ADDRGP4 voipOptionsInfo+1208+76
CNSTI4 128
ASGNI4
line 282
;282:	voipOptionsInfo.back.height				= 64;
ADDRGP4 voipOptionsInfo+1208+80
CNSTI4 64
ASGNI4
line 283
;283:	voipOptionsInfo.back.focuspic				= ART_BACK1;
ADDRGP4 voipOptionsInfo+1208+60
ADDRGP4 $350
ASGNP4
line 285
;284:
;285:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.banner );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 286
;286:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.framel );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 287
;287:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.framer );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 288
;288:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.graphics );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;289:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.display );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 290
;290:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.sound );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 291
;291:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.network );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;292:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.voip );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 293
;293:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.sfxvolume );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 294
;294:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.musicvolume );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+1036
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 295
;295:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.quality );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+1112
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 296
;296:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.enablevoip );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+896
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 297
;297:	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.back );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+1208
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 299
;298:
;299:	voipOptionsInfo.sfxvolume.curvalue = trap_Cvar_VariableValue( "s_volume" ) * 10;
ADDRGP4 $84
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 voipOptionsInfo+960+68
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 300
;300:	voipOptionsInfo.musicvolume.curvalue = trap_Cvar_VariableValue( "s_musicvolume" ) * 10;
ADDRGP4 $88
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 voipOptionsInfo+1036+68
CNSTF4 1092616192
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 301
;301:	voipOptionsInfo.quality.curvalue = !trap_Cvar_VariableValue( "s_compression" );
ADDRGP4 $97
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $371
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $372
JUMPV
LABELV $371
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $372
ADDRGP4 voipOptionsInfo+1112+64
ADDRLP4 12
INDIRI4
ASGNI4
line 302
;302:	voipOptionsInfo.enablevoip.curvalue = (int)trap_Cvar_VariableValue( "cl_voip" );
ADDRGP4 $108
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 voipOptionsInfo+896+60
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 303
;303:}
LABELV $112
endproc UI_VoipOptionsMenu_Init 24 12
export UI_VoipOptionsMenu_Cache
proc UI_VoipOptionsMenu_Cache 0 4
line 311
;304:
;305:
;306:/*
;307:===============
;308:UI_SoundOptionsMenu_Cache
;309:===============
;310:*/
;311:void UI_VoipOptionsMenu_Cache( void ) {
line 312
;312:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $132
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 313
;313:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $146
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 314
;314:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $333
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 315
;315:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $350
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 316
;316:}
LABELV $375
endproc UI_VoipOptionsMenu_Cache 0 4
export UI_VoipOptionsMenu
proc UI_VoipOptionsMenu 0 8
line 324
;317:
;318:
;319:/*
;320:===============
;321:UI_SoundOptionsMenu
;322:===============
;323:*/
;324:void UI_VoipOptionsMenu( void ) {
line 325
;325:	UI_VoipOptionsMenu_Init();
ADDRGP4 UI_VoipOptionsMenu_Init
CALLV
pop
line 326
;326:	UI_PushMenu( &voipOptionsInfo.menu );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 327
;327:	Menu_SetCursorToItem( &voipOptionsInfo.menu, &voipOptionsInfo.sound );
ADDRGP4 voipOptionsInfo
ARGP4
ADDRGP4 voipOptionsInfo+680
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 328
;328:}
LABELV $376
endproc UI_VoipOptionsMenu 0 8
bss
align 4
LABELV voipOptionsInfo
skip 1296
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
LABELV $350
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
LABELV $333
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
LABELV $317
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
LABELV $299
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
LABELV $281
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
LABELV $267
byte 1 69
byte 1 78
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 86
byte 1 79
byte 1 73
byte 1 67
byte 1 69
byte 1 47
byte 1 86
byte 1 79
byte 1 73
byte 1 80
byte 1 58
byte 1 0
align 1
LABELV $242
byte 1 86
byte 1 79
byte 1 73
byte 1 67
byte 1 69
byte 1 0
align 1
LABELV $224
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $206
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $188
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $170
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
LABELV $146
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
LABELV $132
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
LABELV $124
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
LABELV $108
byte 1 99
byte 1 108
byte 1 95
byte 1 118
byte 1 111
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 108
byte 1 95
byte 1 118
byte 1 111
byte 1 105
byte 1 112
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 108
byte 1 95
byte 1 118
byte 1 111
byte 1 105
byte 1 112
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $98
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
LABELV $97
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
LABELV $96
byte 1 115
byte 1 95
byte 1 107
byte 1 104
byte 1 122
byte 1 0
align 1
LABELV $88
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
LABELV $84
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
