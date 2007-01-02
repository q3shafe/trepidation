code
proc UI_DisplayOptionsMenu_Event 8 8
file "../ui_display.c"
line 54
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:DISPLAY OPTIONS MENU
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
;23:#define ID_BRIGHTNESS		14
;24:#define ID_SCREENSIZE		15
;25:#define ID_BACK				16
;26:
;27:
;28:typedef struct {
;29:	menuframework_s	menu;
;30:
;31:	menutext_s		banner;
;32:	menubitmap_s	framel;
;33:	menubitmap_s	framer;
;34:
;35:	menutext_s		graphics;
;36:	menutext_s		display;
;37:	menutext_s		sound;
;38:	menutext_s		network;
;39:
;40:	menuslider_s	brightness;
;41:	menuslider_s	screensize;
;42:
;43:	menubitmap_s	back;
;44:} displayOptionsInfo_t;
;45:
;46:static displayOptionsInfo_t	displayOptionsInfo;
;47:
;48:
;49:/*
;50:=================
;51:UI_DisplayOptionsMenu_Event
;52:=================
;53:*/
;54:static void UI_DisplayOptionsMenu_Event( void* ptr, int event ) {
line 55
;55:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $71
line 56
;56:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 59
;57:	}
;58:
;59:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $89-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $89
address $76
address $74
address $78
address $79
address $80
address $84
address $88
code
LABELV $76
line 61
;60:	case ID_GRAPHICS:
;61:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 62
;62:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 63
;63:		break;
ADDRGP4 $74
JUMPV
line 66
;64:
;65:	case ID_DISPLAY:
;66:		break;
LABELV $78
line 69
;67:
;68:	case ID_SOUND:
;69:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 70
;70:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 71
;71:		break;
ADDRGP4 $74
JUMPV
LABELV $79
line 74
;72:
;73:	case ID_NETWORK:
;74:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 75
;75:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 76
;76:		break;
ADDRGP4 $74
JUMPV
LABELV $80
line 79
;77:
;78:	case ID_BRIGHTNESS:
;79:		trap_Cvar_SetValue( "r_gamma", displayOptionsInfo.brightness.curvalue / 10.0f );
ADDRGP4 $81
ARGP4
ADDRGP4 displayOptionsInfo+824+68
INDIRF4
CNSTF4 1092616192
DIVF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 80
;80:		break;
ADDRGP4 $74
JUMPV
LABELV $84
line 83
;81:	
;82:	case ID_SCREENSIZE:
;83:		trap_Cvar_SetValue( "cg_viewsize", displayOptionsInfo.screensize.curvalue * 10 );
ADDRGP4 $85
ARGP4
CNSTF4 1092616192
ADDRGP4 displayOptionsInfo+900+68
INDIRF4
MULF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 84
;84:		break;
ADDRGP4 $74
JUMPV
LABELV $88
line 87
;85:
;86:	case ID_BACK:
;87:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 88
;88:		break;
LABELV $73
LABELV $74
line 90
;89:	}
;90:}
LABELV $70
endproc UI_DisplayOptionsMenu_Event 8 8
proc UI_DisplayOptionsMenu_Init 12 12
line 98
;91:
;92:
;93:/*
;94:===============
;95:UI_DisplayOptionsMenu_Init
;96:===============
;97:*/
;98:static void UI_DisplayOptionsMenu_Init( void ) {
line 101
;99:	int		y;
;100:
;101:	memset( &displayOptionsInfo, 0, sizeof(displayOptionsInfo) );
ADDRGP4 displayOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1064
ARGI4
ADDRGP4 memset
CALLP4
pop
line 103
;102:
;103:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 104
;104:	displayOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 displayOptionsInfo+276
CNSTI4 1
ASGNI4
line 105
;105:	displayOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 displayOptionsInfo+280
CNSTI4 1
ASGNI4
line 107
;106:
;107:	displayOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 displayOptionsInfo+288
CNSTI4 10
ASGNI4
line 108
;108:	displayOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 displayOptionsInfo+288+44
CNSTU4 8
ASGNU4
line 109
;109:	displayOptionsInfo.banner.generic.x			= 320;
ADDRGP4 displayOptionsInfo+288+12
CNSTI4 320
ASGNI4
line 110
;110:	displayOptionsInfo.banner.generic.y			= 16;
ADDRGP4 displayOptionsInfo+288+16
CNSTI4 16
ASGNI4
line 111
;111:	displayOptionsInfo.banner.string			= "SYSTEM SETUP";
ADDRGP4 displayOptionsInfo+288+60
ADDRGP4 $103
ASGNP4
line 112
;112:	displayOptionsInfo.banner.color				= color_white;
ADDRGP4 displayOptionsInfo+288+68
ADDRGP4 color_white
ASGNP4
line 113
;113:	displayOptionsInfo.banner.style				= UI_CENTER;
ADDRGP4 displayOptionsInfo+288+64
CNSTI4 1
ASGNI4
line 115
;114:
;115:	displayOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+360
CNSTI4 6
ASGNI4
line 116
;116:	displayOptionsInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 displayOptionsInfo+360+4
ADDRGP4 $111
ASGNP4
line 117
;117:	displayOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 displayOptionsInfo+360+44
CNSTU4 16384
ASGNU4
line 118
;118:	displayOptionsInfo.framel.generic.x			= 0;  
ADDRGP4 displayOptionsInfo+360+12
CNSTI4 0
ASGNI4
line 119
;119:	displayOptionsInfo.framel.generic.y			= 78;
ADDRGP4 displayOptionsInfo+360+16
CNSTI4 78
ASGNI4
line 120
;120:	displayOptionsInfo.framel.width				= 256;
ADDRGP4 displayOptionsInfo+360+76
CNSTI4 256
ASGNI4
line 121
;121:	displayOptionsInfo.framel.height			= 329;
ADDRGP4 displayOptionsInfo+360+80
CNSTI4 329
ASGNI4
line 123
;122:
;123:	displayOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+448
CNSTI4 6
ASGNI4
line 124
;124:	displayOptionsInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 displayOptionsInfo+448+4
ADDRGP4 $125
ASGNP4
line 125
;125:	displayOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 displayOptionsInfo+448+44
CNSTU4 16384
ASGNU4
line 126
;126:	displayOptionsInfo.framer.generic.x			= 376;
ADDRGP4 displayOptionsInfo+448+12
CNSTI4 376
ASGNI4
line 127
;127:	displayOptionsInfo.framer.generic.y			= 76;
ADDRGP4 displayOptionsInfo+448+16
CNSTI4 76
ASGNI4
line 128
;128:	displayOptionsInfo.framer.width				= 256;
ADDRGP4 displayOptionsInfo+448+76
CNSTI4 256
ASGNI4
line 129
;129:	displayOptionsInfo.framer.height			= 334;
ADDRGP4 displayOptionsInfo+448+80
CNSTI4 334
ASGNI4
line 131
;130:
;131:	displayOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+536
CNSTI4 9
ASGNI4
line 132
;132:	displayOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+536+44
CNSTU4 272
ASGNU4
line 133
;133:	displayOptionsInfo.graphics.generic.id			= ID_GRAPHICS;
ADDRGP4 displayOptionsInfo+536+8
CNSTI4 10
ASGNI4
line 134
;134:	displayOptionsInfo.graphics.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+536+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 135
;135:	displayOptionsInfo.graphics.generic.x			= 216;
ADDRGP4 displayOptionsInfo+536+12
CNSTI4 216
ASGNI4
line 136
;136:	displayOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+536+16
CNSTI4 186
ASGNI4
line 137
;137:	displayOptionsInfo.graphics.string				= "GRAPHICS";
ADDRGP4 displayOptionsInfo+536+60
ADDRGP4 $149
ASGNP4
line 138
;138:	displayOptionsInfo.graphics.style				= UI_RIGHT;
ADDRGP4 displayOptionsInfo+536+64
CNSTI4 2
ASGNI4
line 139
;139:	displayOptionsInfo.graphics.color				= color_red;
ADDRGP4 displayOptionsInfo+536+68
ADDRGP4 color_red
ASGNP4
line 141
;140:
;141:	displayOptionsInfo.display.generic.type			= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+608
CNSTI4 9
ASGNI4
line 142
;142:	displayOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY;
ADDRGP4 displayOptionsInfo+608+44
CNSTU4 16
ASGNU4
line 143
;143:	displayOptionsInfo.display.generic.id			= ID_DISPLAY;
ADDRGP4 displayOptionsInfo+608+8
CNSTI4 11
ASGNI4
line 144
;144:	displayOptionsInfo.display.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+608+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 145
;145:	displayOptionsInfo.display.generic.x			= 216;
ADDRGP4 displayOptionsInfo+608+12
CNSTI4 216
ASGNI4
line 146
;146:	displayOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+608+16
CNSTI4 213
ASGNI4
line 147
;147:	displayOptionsInfo.display.string				= "DISPLAY";
ADDRGP4 displayOptionsInfo+608+60
ADDRGP4 $167
ASGNP4
line 148
;148:	displayOptionsInfo.display.style				= UI_RIGHT;
ADDRGP4 displayOptionsInfo+608+64
CNSTI4 2
ASGNI4
line 149
;149:	displayOptionsInfo.display.color				= color_red;
ADDRGP4 displayOptionsInfo+608+68
ADDRGP4 color_red
ASGNP4
line 151
;150:
;151:	displayOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+680
CNSTI4 9
ASGNI4
line 152
;152:	displayOptionsInfo.sound.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+680+44
CNSTU4 272
ASGNU4
line 153
;153:	displayOptionsInfo.sound.generic.id				= ID_SOUND;
ADDRGP4 displayOptionsInfo+680+8
CNSTI4 12
ASGNI4
line 154
;154:	displayOptionsInfo.sound.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+680+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 155
;155:	displayOptionsInfo.sound.generic.x				= 216;
ADDRGP4 displayOptionsInfo+680+12
CNSTI4 216
ASGNI4
line 156
;156:	displayOptionsInfo.sound.generic.y				= 240;
ADDRGP4 displayOptionsInfo+680+16
CNSTI4 240
ASGNI4
line 157
;157:	displayOptionsInfo.sound.string					= "SOUND";
ADDRGP4 displayOptionsInfo+680+60
ADDRGP4 $185
ASGNP4
line 158
;158:	displayOptionsInfo.sound.style					= UI_RIGHT;
ADDRGP4 displayOptionsInfo+680+64
CNSTI4 2
ASGNI4
line 159
;159:	displayOptionsInfo.sound.color					= color_red;
ADDRGP4 displayOptionsInfo+680+68
ADDRGP4 color_red
ASGNP4
line 161
;160:
;161:	displayOptionsInfo.network.generic.type			= MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+752
CNSTI4 9
ASGNI4
line 162
;162:	displayOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+752+44
CNSTU4 272
ASGNU4
line 163
;163:	displayOptionsInfo.network.generic.id			= ID_NETWORK;
ADDRGP4 displayOptionsInfo+752+8
CNSTI4 13
ASGNI4
line 164
;164:	displayOptionsInfo.network.generic.callback		= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+752+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 165
;165:	displayOptionsInfo.network.generic.x			= 216;
ADDRGP4 displayOptionsInfo+752+12
CNSTI4 216
ASGNI4
line 166
;166:	displayOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+752+16
CNSTI4 267
ASGNI4
line 167
;167:	displayOptionsInfo.network.string				= "NETWORK";
ADDRGP4 displayOptionsInfo+752+60
ADDRGP4 $203
ASGNP4
line 168
;168:	displayOptionsInfo.network.style				= UI_RIGHT;
ADDRGP4 displayOptionsInfo+752+64
CNSTI4 2
ASGNI4
line 169
;169:	displayOptionsInfo.network.color				= color_red;
ADDRGP4 displayOptionsInfo+752+68
ADDRGP4 color_red
ASGNP4
line 171
;170:
;171:	y = 240 - 1 * (BIGCHAR_HEIGHT+2);
ADDRLP4 0
CNSTI4 222
ASGNI4
line 172
;172:	displayOptionsInfo.brightness.generic.type		= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+824
CNSTI4 1
ASGNI4
line 173
;173:	displayOptionsInfo.brightness.generic.name		= "Brightness:";
ADDRGP4 displayOptionsInfo+824+4
ADDRGP4 $211
ASGNP4
line 174
;174:	displayOptionsInfo.brightness.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+824+44
CNSTU4 258
ASGNU4
line 175
;175:	displayOptionsInfo.brightness.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+824+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 176
;176:	displayOptionsInfo.brightness.generic.id		= ID_BRIGHTNESS;
ADDRGP4 displayOptionsInfo+824+8
CNSTI4 14
ASGNI4
line 177
;177:	displayOptionsInfo.brightness.generic.x			= 400;
ADDRGP4 displayOptionsInfo+824+12
CNSTI4 400
ASGNI4
line 178
;178:	displayOptionsInfo.brightness.generic.y			= y;
ADDRGP4 displayOptionsInfo+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 179
;179:	displayOptionsInfo.brightness.minvalue			= 5;
ADDRGP4 displayOptionsInfo+824+60
CNSTF4 1084227584
ASGNF4
line 180
;180:	displayOptionsInfo.brightness.maxvalue			= 20;
ADDRGP4 displayOptionsInfo+824+64
CNSTF4 1101004800
ASGNF4
line 181
;181:	if( !uis.glconfig.deviceSupportsGamma ) {
ADDRGP4 uis+56+11292
INDIRI4
CNSTI4 0
NEI4 $226
line 182
;182:		displayOptionsInfo.brightness.generic.flags |= QMF_GRAYED;
ADDRLP4 4
ADDRGP4 displayOptionsInfo+824+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 183
;183:	}
LABELV $226
line 185
;184:
;185:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 186
;186:	displayOptionsInfo.screensize.generic.type		= MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+900
CNSTI4 1
ASGNI4
line 187
;187:	displayOptionsInfo.screensize.generic.name		= "Screen Size:";
ADDRGP4 displayOptionsInfo+900+4
ADDRGP4 $235
ASGNP4
line 188
;188:	displayOptionsInfo.screensize.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+900+44
CNSTU4 258
ASGNU4
line 189
;189:	displayOptionsInfo.screensize.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+900+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 190
;190:	displayOptionsInfo.screensize.generic.id		= ID_SCREENSIZE;
ADDRGP4 displayOptionsInfo+900+8
CNSTI4 15
ASGNI4
line 191
;191:	displayOptionsInfo.screensize.generic.x			= 400;
ADDRGP4 displayOptionsInfo+900+12
CNSTI4 400
ASGNI4
line 192
;192:	displayOptionsInfo.screensize.generic.y			= y;
ADDRGP4 displayOptionsInfo+900+16
ADDRLP4 0
INDIRI4
ASGNI4
line 193
;193:	displayOptionsInfo.screensize.minvalue			= 3;
ADDRGP4 displayOptionsInfo+900+60
CNSTF4 1077936128
ASGNF4
line 194
;194:    displayOptionsInfo.screensize.maxvalue			= 10;
ADDRGP4 displayOptionsInfo+900+64
CNSTF4 1092616192
ASGNF4
line 196
;195:
;196:	displayOptionsInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+976
CNSTI4 6
ASGNI4
line 197
;197:	displayOptionsInfo.back.generic.name		= ART_BACK0;
ADDRGP4 displayOptionsInfo+976+4
ADDRGP4 $253
ASGNP4
line 198
;198:	displayOptionsInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+976+44
CNSTU4 260
ASGNU4
line 199
;199:	displayOptionsInfo.back.generic.callback	= UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+976+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 200
;200:	displayOptionsInfo.back.generic.id			= ID_BACK;
ADDRGP4 displayOptionsInfo+976+8
CNSTI4 16
ASGNI4
line 201
;201:	displayOptionsInfo.back.generic.x			= 0;
ADDRGP4 displayOptionsInfo+976+12
CNSTI4 0
ASGNI4
line 202
;202:	displayOptionsInfo.back.generic.y			= 480-64;
ADDRGP4 displayOptionsInfo+976+16
CNSTI4 416
ASGNI4
line 203
;203:	displayOptionsInfo.back.width				= 128;
ADDRGP4 displayOptionsInfo+976+76
CNSTI4 128
ASGNI4
line 204
;204:	displayOptionsInfo.back.height				= 64;
ADDRGP4 displayOptionsInfo+976+80
CNSTI4 64
ASGNI4
line 205
;205:	displayOptionsInfo.back.focuspic			= ART_BACK1;
ADDRGP4 displayOptionsInfo+976+60
ADDRGP4 $270
ASGNP4
line 207
;206:
;207:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.banner );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 208
;208:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.framel );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 209
;209:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.framer );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 210
;210:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.graphics );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 211
;211:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.display );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 212
;212:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.sound );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 213
;213:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.network );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 214
;214:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.brightness );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 215
;215:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.screensize );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+900
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 216
;216:	Menu_AddItem( &displayOptionsInfo.menu, ( void * ) &displayOptionsInfo.back );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+976
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 218
;217:
;218:	displayOptionsInfo.brightness.curvalue  = trap_Cvar_VariableValue("r_gamma") * 10;
ADDRGP4 $81
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+824+68
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 219
;219:	displayOptionsInfo.screensize.curvalue  = trap_Cvar_VariableValue( "cg_viewsize")/10;
ADDRGP4 $85
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+900+68
ADDRLP4 8
INDIRF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 220
;220:}
LABELV $91
endproc UI_DisplayOptionsMenu_Init 12 12
export UI_DisplayOptionsMenu_Cache
proc UI_DisplayOptionsMenu_Cache 0 4
line 228
;221:
;222:
;223:/*
;224:===============
;225:UI_DisplayOptionsMenu_Cache
;226:===============
;227:*/
;228:void UI_DisplayOptionsMenu_Cache( void ) {
line 229
;229:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $111
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 230
;230:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $125
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 231
;231:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $253
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 232
;232:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $270
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 233
;233:}
LABELV $285
endproc UI_DisplayOptionsMenu_Cache 0 4
export UI_DisplayOptionsMenu
proc UI_DisplayOptionsMenu 0 8
line 241
;234:
;235:
;236:/*
;237:===============
;238:UI_DisplayOptionsMenu
;239:===============
;240:*/
;241:void UI_DisplayOptionsMenu( void ) {
line 242
;242:	UI_DisplayOptionsMenu_Init();
ADDRGP4 UI_DisplayOptionsMenu_Init
CALLV
pop
line 243
;243:	UI_PushMenu( &displayOptionsInfo.menu );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 244
;244:	Menu_SetCursorToItem( &displayOptionsInfo.menu, &displayOptionsInfo.display );
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+608
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 245
;245:}
LABELV $286
endproc UI_DisplayOptionsMenu 0 8
bss
align 4
LABELV displayOptionsInfo
skip 1064
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
LABELV $270
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
LABELV $253
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
LABELV $235
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $211
byte 1 66
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $203
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $185
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $167
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $149
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
LABELV $125
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
LABELV $111
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
LABELV $103
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
LABELV $85
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 114
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 0
