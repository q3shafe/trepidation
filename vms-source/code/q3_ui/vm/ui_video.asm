data
align 4
LABELV driverinfo_artlist
address $69
address $70
address $71
address $72
byte 4 0
code
proc DriverInfo_Event 4 0
file "../ui_video.c"
line 52
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:void GraphicsOptions_MenuInit( void );
;6:
;7:/*
;8:=======================================================================
;9:
;10:DRIVER INFORMATION MENU
;11:
;12:=======================================================================
;13:*/
;14:
;15:
;16:#define DRIVERINFO_FRAMEL	"menu/art/frame2_l"
;17:#define DRIVERINFO_FRAMER	"menu/art/frame1_r"
;18:#define DRIVERINFO_BACK0	"menu/art/back_0"
;19:#define DRIVERINFO_BACK1	"menu/art/back_1"
;20:
;21:static char* driverinfo_artlist[] = 
;22:{
;23:	DRIVERINFO_FRAMEL,
;24:	DRIVERINFO_FRAMER,
;25:	DRIVERINFO_BACK0,
;26:	DRIVERINFO_BACK1,
;27:	NULL,
;28:};
;29:
;30:#define ID_DRIVERINFOBACK	100
;31:
;32:typedef struct
;33:{
;34:	menuframework_s	menu;
;35:	menutext_s		banner;
;36:	menubitmap_s	back;
;37:	menubitmap_s	framel;
;38:	menubitmap_s	framer;
;39:	char			stringbuff[1024];
;40:	char*			strings[64];
;41:	int				numstrings;
;42:} driverinfo_t;
;43:
;44:static driverinfo_t	s_driverinfo;
;45:
;46:/*
;47:=================
;48:DriverInfo_Event
;49:=================
;50:*/
;51:static void DriverInfo_Event( void* ptr, int event )
;52:{
line 53
;53:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $75
line 54
;54:		return;
ADDRGP4 $74
JUMPV
LABELV $75
line 56
;55:
;56:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $80
ADDRGP4 $77
JUMPV
line 57
;57:	{
LABELV $80
line 59
;58:		case ID_DRIVERINFOBACK:
;59:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 60
;60:			break;
LABELV $77
LABELV $78
line 62
;61:	}
;62:}
LABELV $74
endproc DriverInfo_Event 4 0
proc DriverInfo_MenuDraw 12 20
line 70
;63:
;64:/*
;65:=================
;66:DriverInfo_MenuDraw
;67:=================
;68:*/
;69:static void DriverInfo_MenuDraw( void )
;70:{
line 74
;71:	int	i;
;72:	int	y;
;73:
;74:	Menu_Draw( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 76
;75:
;76:	UI_DrawString( 320, 80, "VENDOR", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 $82
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 77
;77:	UI_DrawString( 320, 152, "PIXELFORMAT", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 $83
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 78
;78:	UI_DrawString( 320, 192, "EXTENSIONS", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $84
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 80
;79:
;80:	UI_DrawString( 320, 80+16, uis.glconfig.vendor_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRGP4 uis+56+1024
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 81
;81:	UI_DrawString( 320, 96+16, uis.glconfig.version_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 uis+56+2048
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 82
;82:	UI_DrawString( 320, 112+16, uis.glconfig.renderer_string, UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 uis+56
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 83
;83:	UI_DrawString( 320, 152+16, va ("color(%d-bits) Z(%d-bits) stencil(%d-bits)", uis.glconfig.colorBits, uis.glconfig.depthBits, uis.glconfig.stencilBits), UI_CENTER|UI_SMALLFONT, text_color_normal );
ADDRGP4 $90
ARGP4
ADDRGP4 uis+56+11272
INDIRI4
ARGI4
ADDRGP4 uis+56+11276
INDIRI4
ARGI4
ADDRGP4 uis+56+11280
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 168
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 86
;84:
;85:	// double column
;86:	y = 192+16;
ADDRLP4 4
CNSTI4 208
ASGNI4
line 87
;87:	for (i=0; i<s_driverinfo.numstrings/2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 88
;88:		UI_DrawString( 320-4, y, s_driverinfo.strings[i*2], UI_RIGHT|UI_SMALLFONT, text_color_normal );
CNSTI4 316
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 89
;89:		UI_DrawString( 320+4, y, s_driverinfo.strings[i*2+1], UI_LEFT|UI_SMALLFONT, text_color_normal );
CNSTI4 324
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648+4
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 90
;90:		y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 91
;91:	}
LABELV $98
line 87
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 0
INDIRI4
ADDRGP4 s_driverinfo+1904
INDIRI4
CNSTI4 2
DIVI4
LTI4 $97
line 93
;92:
;93:	if (s_driverinfo.numstrings & 1)
ADDRGP4 s_driverinfo+1904
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $105
line 94
;94:		UI_DrawString( 320, y, s_driverinfo.strings[s_driverinfo.numstrings-1], UI_CENTER|UI_SMALLFONT, text_color_normal );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_driverinfo+1904
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648-4
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $105
line 95
;95:}
LABELV $81
endproc DriverInfo_MenuDraw 12 20
export DriverInfo_Cache
proc DriverInfo_Cache 4 4
line 103
;96:
;97:/*
;98:=================
;99:DriverInfo_Cache
;100:=================
;101:*/
;102:void DriverInfo_Cache( void )
;103:{
line 107
;104:	int	i;
;105:
;106:	// touch all our pics
;107:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $112
line 108
;108:	{
line 109
;109:		if (!driverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 110
;110:			break;
ADDRGP4 $114
JUMPV
LABELV $116
line 111
;111:		trap_R_RegisterShaderNoMip(driverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 112
;112:	}
LABELV $113
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $114
line 113
;113:}
LABELV $111
endproc DriverInfo_Cache 4 4
proc UI_DriverInfo_Menu 36 12
line 121
;114:
;115:/*
;116:=================
;117:UI_DriverInfo_Menu
;118:=================
;119:*/
;120:static void UI_DriverInfo_Menu( void )
;121:{
line 127
;122:	char*	eptr;
;123:	int		i;
;124:	int		len;
;125:
;126:	// zero set all our globals
;127:	memset( &s_driverinfo, 0 ,sizeof(driverinfo_t) );
ADDRGP4 s_driverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1908
ARGI4
ADDRGP4 memset
CALLP4
pop
line 129
;128:
;129:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 131
;130:
;131:	s_driverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_driverinfo+280
CNSTI4 1
ASGNI4
line 132
;132:	s_driverinfo.menu.draw       = DriverInfo_MenuDraw;
ADDRGP4 s_driverinfo+268
ADDRGP4 DriverInfo_MenuDraw
ASGNP4
line 134
;133:
;134:	s_driverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_driverinfo+288
CNSTI4 10
ASGNI4
line 135
;135:	s_driverinfo.banner.generic.x	  = 320;
ADDRGP4 s_driverinfo+288+12
CNSTI4 320
ASGNI4
line 136
;136:	s_driverinfo.banner.generic.y	  = 16;
ADDRGP4 s_driverinfo+288+16
CNSTI4 16
ASGNI4
line 137
;137:	s_driverinfo.banner.string		  = "DRIVER INFO";
ADDRGP4 s_driverinfo+288+60
ADDRGP4 $128
ASGNP4
line 138
;138:	s_driverinfo.banner.color	      = color_white;
ADDRGP4 s_driverinfo+288+68
ADDRGP4 color_white
ASGNP4
line 139
;139:	s_driverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_driverinfo+288+64
CNSTI4 1
ASGNI4
line 141
;140:
;141:	s_driverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+448
CNSTI4 6
ASGNI4
line 142
;142:	s_driverinfo.framel.generic.name  = DRIVERINFO_FRAMEL;
ADDRGP4 s_driverinfo+448+4
ADDRGP4 $69
ASGNP4
line 143
;143:	s_driverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+448+44
CNSTU4 16384
ASGNU4
line 144
;144:	s_driverinfo.framel.generic.x	  = 0;
ADDRGP4 s_driverinfo+448+12
CNSTI4 0
ASGNI4
line 145
;145:	s_driverinfo.framel.generic.y	  = 78;
ADDRGP4 s_driverinfo+448+16
CNSTI4 78
ASGNI4
line 146
;146:	s_driverinfo.framel.width  	      = 256;
ADDRGP4 s_driverinfo+448+76
CNSTI4 256
ASGNI4
line 147
;147:	s_driverinfo.framel.height  	  = 329;
ADDRGP4 s_driverinfo+448+80
CNSTI4 329
ASGNI4
line 149
;148:
;149:	s_driverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+536
CNSTI4 6
ASGNI4
line 150
;150:	s_driverinfo.framer.generic.name  = DRIVERINFO_FRAMER;
ADDRGP4 s_driverinfo+536+4
ADDRGP4 $70
ASGNP4
line 151
;151:	s_driverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+536+44
CNSTU4 16384
ASGNU4
line 152
;152:	s_driverinfo.framer.generic.x	  = 376;
ADDRGP4 s_driverinfo+536+12
CNSTI4 376
ASGNI4
line 153
;153:	s_driverinfo.framer.generic.y	  = 76;
ADDRGP4 s_driverinfo+536+16
CNSTI4 76
ASGNI4
line 154
;154:	s_driverinfo.framer.width  	      = 256;
ADDRGP4 s_driverinfo+536+76
CNSTI4 256
ASGNI4
line 155
;155:	s_driverinfo.framer.height  	  = 334;
ADDRGP4 s_driverinfo+536+80
CNSTI4 334
ASGNI4
line 157
;156:
;157:	s_driverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+360
CNSTI4 6
ASGNI4
line 158
;158:	s_driverinfo.back.generic.name     = DRIVERINFO_BACK0;
ADDRGP4 s_driverinfo+360+4
ADDRGP4 $71
ASGNP4
line 159
;159:	s_driverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_driverinfo+360+44
CNSTU4 260
ASGNU4
line 160
;160:	s_driverinfo.back.generic.callback = DriverInfo_Event;
ADDRGP4 s_driverinfo+360+48
ADDRGP4 DriverInfo_Event
ASGNP4
line 161
;161:	s_driverinfo.back.generic.id	   = ID_DRIVERINFOBACK;
ADDRGP4 s_driverinfo+360+8
CNSTI4 100
ASGNI4
line 162
;162:	s_driverinfo.back.generic.x		   = 0;
ADDRGP4 s_driverinfo+360+12
CNSTI4 0
ASGNI4
line 163
;163:	s_driverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_driverinfo+360+16
CNSTI4 416
ASGNI4
line 164
;164:	s_driverinfo.back.width  		   = 128;
ADDRGP4 s_driverinfo+360+76
CNSTI4 128
ASGNI4
line 165
;165:	s_driverinfo.back.height  		   = 64;
ADDRGP4 s_driverinfo+360+80
CNSTI4 64
ASGNI4
line 166
;166:	s_driverinfo.back.focuspic         = DRIVERINFO_BACK1;
ADDRGP4 s_driverinfo+360+60
ADDRGP4 $72
ASGNP4
line 172
;167:
;168:  // TTimo: overflow with particularly long GL extensions (such as the gf3)
;169:  // https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;170:  // NOTE: could have pushed the size of stringbuff, but the list is already out of the screen
;171:  // (no matter what your resolution)
;172:  Q_strncpyz(s_driverinfo.stringbuff, uis.glconfig.extensions_string, 1024);
ADDRGP4 s_driverinfo+624
ARGP4
ADDRGP4 uis+56+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 175
;173:
;174:	// build null terminated extension strings
;175:	eptr = s_driverinfo.stringbuff;
ADDRLP4 0
ADDRGP4 s_driverinfo+624
ASGNP4
ADDRGP4 $183
JUMPV
line 177
;176:	while ( s_driverinfo.numstrings<40 && *eptr )
;177:	{
LABELV $186
line 179
;178:		while ( *eptr && *eptr == ' ' )
;179:			*eptr++ = '\0';
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $187
line 178
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $189
ADDRLP4 16
INDIRI4
CNSTI4 32
EQI4 $186
LABELV $189
line 182
;180:
;181:		// track start of valid string
;182:		if (*eptr && *eptr != ' ')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $195
ADDRLP4 20
INDIRI4
CNSTI4 32
EQI4 $195
line 183
;183:			s_driverinfo.strings[s_driverinfo.numstrings++] = eptr;
ADDRLP4 28
ADDRGP4 s_driverinfo+1904
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $195
JUMPV
LABELV $194
line 186
;184:
;185:		while ( *eptr && *eptr != ' ' )
;186:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $195
line 185
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $197
ADDRLP4 32
INDIRI4
CNSTI4 32
NEI4 $194
LABELV $197
line 187
;187:	}
LABELV $183
line 176
ADDRGP4 s_driverinfo+1904
INDIRI4
CNSTI4 40
GEI4 $198
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
LABELV $198
line 190
;188:
;189:	// safety length strings for display
;190:	for (i=0; i<s_driverinfo.numstrings; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $199
line 191
;191:		len = strlen(s_driverinfo.strings[i]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 192
;192:		if (len > 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $205
line 193
;193:			s_driverinfo.strings[i][len-1] = '>';
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648
ADDP4
INDIRP4
ADDP4
CNSTI1 62
ASGNI1
line 194
;194:			s_driverinfo.strings[i][len]   = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1648
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 195
;195:		}
LABELV $205
line 196
;196:	}
LABELV $200
line 190
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $202
ADDRLP4 4
INDIRI4
ADDRGP4 s_driverinfo+1904
INDIRI4
LTI4 $199
line 198
;197:
;198:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.banner );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 199
;199:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framel );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 200
;200:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.framer );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 201
;201:	Menu_AddItem( &s_driverinfo.menu, &s_driverinfo.back );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 203
;202:
;203:	UI_PushMenu( &s_driverinfo.menu );
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 204
;204:}
LABELV $118
endproc UI_DriverInfo_Menu 36 12
data
align 4
LABELV s_drivers
address $213
address $214
byte 4 0
align 4
LABELV s_ivo_templates
byte 4 4
byte 4 1
byte 4 2
byte 4 0
byte 4 2
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 1
byte 4 3
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 3
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 1
code
proc GraphicsOptions_GetInitialVideo 0 0
line 311
;205:
;206:/*
;207:=======================================================================
;208:
;209:GRAPHICS OPTIONS MENU
;210:
;211:=======================================================================
;212:*/
;213:
;214:#define GRAPHICSOPTIONS_FRAMEL	"menu/art/frame2_l"
;215:#define GRAPHICSOPTIONS_FRAMER	"menu/art/frame1_r"
;216:#define GRAPHICSOPTIONS_BACK0	"menu/art/back_0"
;217:#define GRAPHICSOPTIONS_BACK1	"menu/art/back_1"
;218:#define GRAPHICSOPTIONS_ACCEPT0	"menu/art/accept_0"
;219:#define GRAPHICSOPTIONS_ACCEPT1	"menu/art/accept_1"
;220:
;221:static const char *s_drivers[] =
;222:{
;223:	OPENGL_DRIVER_NAME,
;224:	_3DFX_DRIVER_NAME,
;225:	0
;226:};
;227:
;228:#define ID_BACK2		101
;229:#define ID_FULLSCREEN	102
;230:#define ID_LIST			103
;231:#define ID_MODE			104
;232:#define ID_DRIVERINFO	105
;233:#define ID_GRAPHICS		106
;234:#define ID_DISPLAY		107
;235:#define ID_SOUND		108
;236:#define ID_NETWORK		109
;237:
;238:typedef struct {
;239:	menuframework_s	menu;
;240:
;241:	menutext_s		banner;
;242:	menubitmap_s	framel;
;243:	menubitmap_s	framer;
;244:
;245:	menutext_s		graphics;
;246:	menutext_s		display;
;247:	menutext_s		sound;
;248:	menutext_s		network;
;249:
;250:	menulist_s		list;
;251:	menulist_s		mode;
;252:	menulist_s		driver;
;253:	menuslider_s	tq;
;254:	menulist_s  	fs;
;255:	menulist_s  	lighting;
;256:	menulist_s  	allow_extensions;
;257:	menulist_s  	texturebits;
;258:	menulist_s  	colordepth;
;259:	menulist_s  	geometry;
;260:	menulist_s  	filter;
;261:	menutext_s		driverinfo;
;262:
;263:	menubitmap_s	apply;
;264:	menubitmap_s	back;
;265:} graphicsoptions_t;
;266:
;267:typedef struct
;268:{
;269:	int mode;
;270:	qboolean fullscreen;
;271:	int tq;
;272:	int lighting;
;273:	int colordepth;
;274:	int texturebits;
;275:	int geometry;
;276:	int filter;
;277:	int driver;
;278:	qboolean extensions;
;279:} InitialVideoOptions_s;
;280:
;281:static InitialVideoOptions_s	s_ivo;
;282:static graphicsoptions_t		s_graphicsoptions;	
;283:
;284:static InitialVideoOptions_s s_ivo_templates[] =
;285:{
;286:	{
;287:		4, qtrue, 2, 0, 2, 2, 1, 1, 0, qtrue	// JDC: this was tq 3
;288:	},
;289:	{
;290:		3, qtrue, 2, 0, 0, 0, 1, 0, 0, qtrue
;291:	},
;292:	{
;293:		2, qtrue, 1, 0, 1, 0, 0, 0, 0, qtrue
;294:	},
;295:	{
;296:		2, qtrue, 1, 1, 1, 0, 0, 0, 0, qtrue
;297:	},
;298:	{
;299:		3, qtrue, 1, 0, 0, 0, 1, 0, 0, qtrue
;300:	}
;301:};
;302:
;303:#define NUM_IVO_TEMPLATES ( sizeof( s_ivo_templates ) / sizeof( s_ivo_templates[0] ) )
;304:
;305:/*
;306:=================
;307:GraphicsOptions_GetInitialVideo
;308:=================
;309:*/
;310:static void GraphicsOptions_GetInitialVideo( void )
;311:{
line 312
;312:	s_ivo.colordepth  = s_graphicsoptions.colordepth.curvalue;
ADDRGP4 s_ivo+16
ADDRGP4 s_graphicsoptions+1572+64
INDIRI4
ASGNI4
line 313
;313:	s_ivo.driver      = s_graphicsoptions.driver.curvalue;
ADDRGP4 s_ivo+32
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
ASGNI4
line 314
;314:	s_ivo.mode        = s_graphicsoptions.mode.curvalue;
ADDRGP4 s_ivo
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
ASGNI4
line 315
;315:	s_ivo.fullscreen  = s_graphicsoptions.fs.curvalue;
ADDRGP4 s_ivo+4
ADDRGP4 s_graphicsoptions+1188+64
INDIRI4
ASGNI4
line 316
;316:	s_ivo.extensions  = s_graphicsoptions.allow_extensions.curvalue;
ADDRGP4 s_ivo+36
ADDRGP4 s_graphicsoptions+1380+64
INDIRI4
ASGNI4
line 317
;317:	s_ivo.tq          = s_graphicsoptions.tq.curvalue;
ADDRGP4 s_ivo+8
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
CVFI4 4
ASGNI4
line 318
;318:	s_ivo.lighting    = s_graphicsoptions.lighting.curvalue;
ADDRGP4 s_ivo+12
ADDRGP4 s_graphicsoptions+1284+64
INDIRI4
ASGNI4
line 319
;319:	s_ivo.geometry    = s_graphicsoptions.geometry.curvalue;
ADDRGP4 s_ivo+24
ADDRGP4 s_graphicsoptions+1668+64
INDIRI4
ASGNI4
line 320
;320:	s_ivo.filter      = s_graphicsoptions.filter.curvalue;
ADDRGP4 s_ivo+28
ADDRGP4 s_graphicsoptions+1764+64
INDIRI4
ASGNI4
line 321
;321:	s_ivo.texturebits = s_graphicsoptions.texturebits.curvalue;
ADDRGP4 s_ivo+20
ADDRGP4 s_graphicsoptions+1476+64
INDIRI4
ASGNI4
line 322
;322:}
LABELV $217
endproc GraphicsOptions_GetInitialVideo 0 0
proc GraphicsOptions_CheckConfig 4 0
line 330
;323:
;324:/*
;325:=================
;326:GraphicsOptions_CheckConfig
;327:=================
;328:*/
;329:static void GraphicsOptions_CheckConfig( void )
;330:{
line 333
;331:	int i;
;332:
;333:	for ( i = 0; i < NUM_IVO_TEMPLATES; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $251
JUMPV
LABELV $248
line 334
;334:	{
line 335
;335:		if ( s_ivo_templates[i].colordepth != s_graphicsoptions.colordepth.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+16
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1572+64
INDIRI4
EQI4 $252
line 336
;336:			continue;
ADDRGP4 $249
JUMPV
LABELV $252
line 337
;337:		if ( s_ivo_templates[i].driver != s_graphicsoptions.driver.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+32
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
EQI4 $257
line 338
;338:			continue;
ADDRGP4 $249
JUMPV
LABELV $257
line 339
;339:		if ( s_ivo_templates[i].mode != s_graphicsoptions.mode.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
EQI4 $262
line 340
;340:			continue;
ADDRGP4 $249
JUMPV
LABELV $262
line 341
;341:		if ( s_ivo_templates[i].fullscreen != s_graphicsoptions.fs.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+4
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1188+64
INDIRI4
EQI4 $266
line 342
;342:			continue;
ADDRGP4 $249
JUMPV
LABELV $266
line 343
;343:		if ( s_ivo_templates[i].tq != s_graphicsoptions.tq.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
EQF4 $271
line 344
;344:			continue;
ADDRGP4 $249
JUMPV
LABELV $271
line 345
;345:		if ( s_ivo_templates[i].lighting != s_graphicsoptions.lighting.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+12
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1284+64
INDIRI4
EQI4 $276
line 346
;346:			continue;
ADDRGP4 $249
JUMPV
LABELV $276
line 347
;347:		if ( s_ivo_templates[i].geometry != s_graphicsoptions.geometry.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+24
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1668+64
INDIRI4
EQI4 $281
line 348
;348:			continue;
ADDRGP4 $249
JUMPV
LABELV $281
line 349
;349:		if ( s_ivo_templates[i].filter != s_graphicsoptions.filter.curvalue )
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_ivo_templates+28
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1764+64
INDIRI4
EQI4 $286
line 350
;350:			continue;
ADDRGP4 $249
JUMPV
LABELV $286
line 353
;351://		if ( s_ivo_templates[i].texturebits != s_graphicsoptions.texturebits.curvalue )
;352://			continue;
;353:		s_graphicsoptions.list.curvalue = i;
ADDRGP4 s_graphicsoptions+824+64
ADDRLP4 0
INDIRI4
ASGNI4
line 354
;354:		return;
ADDRGP4 $247
JUMPV
LABELV $249
line 333
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $251
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 5
LTU4 $248
line 356
;355:	}
;356:	s_graphicsoptions.list.curvalue = 4;
ADDRGP4 s_graphicsoptions+824+64
CNSTI4 4
ASGNI4
line 357
;357:}
LABELV $247
endproc GraphicsOptions_CheckConfig 4 0
proc GraphicsOptions_UpdateMenuItems 8 0
line 365
;358:
;359:/*
;360:=================
;361:GraphicsOptions_UpdateMenuItems
;362:=================
;363:*/
;364:static void GraphicsOptions_UpdateMenuItems( void )
;365:{
line 366
;366:	if ( s_graphicsoptions.driver.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
CNSTI4 1
NEI4 $296
line 367
;367:	{
line 368
;368:		s_graphicsoptions.fs.curvalue = 1;
ADDRGP4 s_graphicsoptions+1188+64
CNSTI4 1
ASGNI4
line 369
;369:		s_graphicsoptions.fs.generic.flags |= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1188+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 370
;370:		s_graphicsoptions.colordepth.curvalue = 1;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 1
ASGNI4
line 371
;371:	}
ADDRGP4 $297
JUMPV
LABELV $296
line 373
;372:	else
;373:	{
line 374
;374:		s_graphicsoptions.fs.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1188+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 375
;375:	}
LABELV $297
line 377
;376:
;377:	if ( s_graphicsoptions.fs.curvalue == 0 || s_graphicsoptions.driver.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1188+64
INDIRI4
CNSTI4 0
EQI4 $314
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
CNSTI4 1
NEI4 $308
LABELV $314
line 378
;378:	{
line 379
;379:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 0
ASGNI4
line 380
;380:		s_graphicsoptions.colordepth.generic.flags |= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1572+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 381
;381:	}
ADDRGP4 $309
JUMPV
LABELV $308
line 383
;382:	else
;383:	{
line 384
;384:		s_graphicsoptions.colordepth.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1572+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 385
;385:	}
LABELV $309
line 387
;386:
;387:	if ( s_graphicsoptions.allow_extensions.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1380+64
INDIRI4
CNSTI4 0
NEI4 $321
line 388
;388:	{
line 389
;389:		if ( s_graphicsoptions.texturebits.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1476+64
INDIRI4
CNSTI4 0
NEI4 $325
line 390
;390:		{
line 391
;391:			s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1476+64
CNSTI4 1
ASGNI4
line 392
;392:		}
LABELV $325
line 393
;393:	}
LABELV $321
line 395
;394:
;395:	s_graphicsoptions.apply.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 397
;396:
;397:	if ( s_ivo.mode != s_graphicsoptions.mode.curvalue )
ADDRGP4 s_ivo
INDIRI4
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
EQI4 $333
line 398
;398:	{
line 399
;399:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 400
;400:	}
LABELV $333
line 401
;401:	if ( s_ivo.fullscreen != s_graphicsoptions.fs.curvalue )
ADDRGP4 s_ivo+4
INDIRI4
ADDRGP4 s_graphicsoptions+1188+64
INDIRI4
EQI4 $339
line 402
;402:	{
line 403
;403:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 404
;404:	}
LABELV $339
line 405
;405:	if ( s_ivo.extensions != s_graphicsoptions.allow_extensions.curvalue )
ADDRGP4 s_ivo+36
INDIRI4
ADDRGP4 s_graphicsoptions+1380+64
INDIRI4
EQI4 $346
line 406
;406:	{
line 407
;407:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 408
;408:	}
LABELV $346
line 409
;409:	if ( s_ivo.tq != s_graphicsoptions.tq.curvalue )
ADDRGP4 s_ivo+8
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
EQF4 $353
line 410
;410:	{
line 411
;411:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 412
;412:	}
LABELV $353
line 413
;413:	if ( s_ivo.lighting != s_graphicsoptions.lighting.curvalue )
ADDRGP4 s_ivo+12
INDIRI4
ADDRGP4 s_graphicsoptions+1284+64
INDIRI4
EQI4 $360
line 414
;414:	{
line 415
;415:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 416
;416:	}
LABELV $360
line 417
;417:	if ( s_ivo.colordepth != s_graphicsoptions.colordepth.curvalue )
ADDRGP4 s_ivo+16
INDIRI4
ADDRGP4 s_graphicsoptions+1572+64
INDIRI4
EQI4 $367
line 418
;418:	{
line 419
;419:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 420
;420:	}
LABELV $367
line 421
;421:	if ( s_ivo.driver != s_graphicsoptions.driver.curvalue )
ADDRGP4 s_ivo+32
INDIRI4
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
EQI4 $374
line 422
;422:	{
line 423
;423:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 424
;424:	}
LABELV $374
line 425
;425:	if ( s_ivo.texturebits != s_graphicsoptions.texturebits.curvalue )
ADDRGP4 s_ivo+20
INDIRI4
ADDRGP4 s_graphicsoptions+1476+64
INDIRI4
EQI4 $381
line 426
;426:	{
line 427
;427:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 428
;428:	}
LABELV $381
line 429
;429:	if ( s_ivo.geometry != s_graphicsoptions.geometry.curvalue )
ADDRGP4 s_ivo+24
INDIRI4
ADDRGP4 s_graphicsoptions+1668+64
INDIRI4
EQI4 $388
line 430
;430:	{
line 431
;431:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 432
;432:	}
LABELV $388
line 433
;433:	if ( s_ivo.filter != s_graphicsoptions.filter.curvalue )
ADDRGP4 s_ivo+28
INDIRI4
ADDRGP4 s_graphicsoptions+1764+64
INDIRI4
EQI4 $395
line 434
;434:	{
line 435
;435:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1932+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 436
;436:	}
LABELV $395
line 438
;437:
;438:	GraphicsOptions_CheckConfig();
ADDRGP4 GraphicsOptions_CheckConfig
CALLV
pop
line 439
;439:}	
LABELV $295
endproc GraphicsOptions_UpdateMenuItems 8 0
proc GraphicsOptions_ApplyChanges 8 8
line 447
;440:
;441:/*
;442:=================
;443:GraphicsOptions_ApplyChanges
;444:=================
;445:*/
;446:static void GraphicsOptions_ApplyChanges( void *unused, int notification )
;447:{
line 448
;448:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $403
line 449
;449:		return;
ADDRGP4 $402
JUMPV
LABELV $403
line 451
;450:
;451:	switch ( s_graphicsoptions.texturebits.curvalue  )
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1476+64
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $409
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $411
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $412
ADDRGP4 $405
JUMPV
line 452
;452:	{
LABELV $409
line 454
;453:	case 0:
;454:		trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $410
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 455
;455:		break;
ADDRGP4 $406
JUMPV
LABELV $411
line 457
;456:	case 1:
;457:		trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $410
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 458
;458:		break;
ADDRGP4 $406
JUMPV
LABELV $412
line 460
;459:	case 2:
;460:		trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $410
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 461
;461:		break;
LABELV $405
LABELV $406
line 463
;462:	}
;463:	trap_Cvar_SetValue( "r_picmip", 3 - s_graphicsoptions.tq.curvalue );
ADDRGP4 $413
ARGP4
CNSTF4 1077936128
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
SUBF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 464
;464:	trap_Cvar_SetValue( "r_allowExtensions", s_graphicsoptions.allow_extensions.curvalue );
ADDRGP4 $416
ARGP4
ADDRGP4 s_graphicsoptions+1380+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 465
;465:	trap_Cvar_SetValue( "r_mode", s_graphicsoptions.mode.curvalue );
ADDRGP4 $419
ARGP4
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 466
;466:	trap_Cvar_SetValue( "r_fullscreen", s_graphicsoptions.fs.curvalue );
ADDRGP4 $422
ARGP4
ADDRGP4 s_graphicsoptions+1188+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 467
;467:	trap_Cvar_Set( "r_glDriver", ( char * ) s_drivers[s_graphicsoptions.driver.curvalue] );
ADDRGP4 $425
ARGP4
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_drivers
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 468
;468:	switch ( s_graphicsoptions.colordepth.curvalue )
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1572+64
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $432
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $436
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $437
ADDRGP4 $428
JUMPV
line 469
;469:	{
LABELV $432
line 471
;470:	case 0:
;471:		trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $433
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 472
;472:		trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $434
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 473
;473:		trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $435
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 474
;474:		break;
ADDRGP4 $429
JUMPV
LABELV $436
line 476
;475:	case 1:
;476:		trap_Cvar_SetValue( "r_colorbits", 16 );
ADDRGP4 $433
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 477
;477:		trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $434
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 478
;478:		trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $435
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 479
;479:		break;
ADDRGP4 $429
JUMPV
LABELV $437
line 481
;480:	case 2:
;481:		trap_Cvar_SetValue( "r_colorbits", 32 );
ADDRGP4 $433
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 482
;482:		trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $434
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 483
;483:		break;
LABELV $428
LABELV $429
line 485
;484:	}
;485:	trap_Cvar_SetValue( "r_vertexLight", s_graphicsoptions.lighting.curvalue );
ADDRGP4 $438
ARGP4
ADDRGP4 s_graphicsoptions+1284+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 487
;486:
;487:	if ( s_graphicsoptions.geometry.curvalue == 2 )
ADDRGP4 s_graphicsoptions+1668+64
INDIRI4
CNSTI4 2
NEI4 $441
line 488
;488:	{
line 489
;489:		trap_Cvar_SetValue( "r_lodBias", 0 );
ADDRGP4 $445
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 490
;490:		trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $446
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 491
;491:	}
ADDRGP4 $442
JUMPV
LABELV $441
line 492
;492:	else if ( s_graphicsoptions.geometry.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1668+64
INDIRI4
CNSTI4 1
NEI4 $447
line 493
;493:	{
line 494
;494:		trap_Cvar_SetValue( "r_lodBias", 1 );
ADDRGP4 $445
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 495
;495:		trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $446
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 496
;496:	}
ADDRGP4 $448
JUMPV
LABELV $447
line 498
;497:	else
;498:	{
line 499
;499:		trap_Cvar_SetValue( "r_lodBias", 1 );
ADDRGP4 $445
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 500
;500:		trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $446
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 501
;501:	}
LABELV $448
LABELV $442
line 503
;502:
;503:	if ( s_graphicsoptions.filter.curvalue )
ADDRGP4 s_graphicsoptions+1764+64
INDIRI4
CNSTI4 0
EQI4 $451
line 504
;504:	{
line 505
;505:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $455
ARGP4
ADDRGP4 $456
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 506
;506:	}
ADDRGP4 $452
JUMPV
LABELV $451
line 508
;507:	else
;508:	{
line 509
;509:		trap_Cvar_Set( "r_textureMode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $455
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 510
;510:	}
LABELV $452
line 512
;511:
;512:	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $458
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 513
;513:}
LABELV $402
endproc GraphicsOptions_ApplyChanges 8 8
proc GraphicsOptions_Event 12 0
line 520
;514:
;515:/*
;516:=================
;517:GraphicsOptions_Event
;518:=================
;519:*/
;520:static void GraphicsOptions_Event( void* ptr, int event ) {
line 523
;521:	InitialVideoOptions_s *ivo;
;522:
;523:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $460
line 524
;524:	 	return;
ADDRGP4 $459
JUMPV
LABELV $460
line 527
;525:	}
;526:
;527:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 101
LTI4 $462
ADDRLP4 4
INDIRI4
CNSTI4 109
GTI4 $462
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $507-404
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $507
address $502
address $462
address $482
address $465
address $501
address $463
address $504
address $505
address $506
code
LABELV $465
line 530
;528:	case ID_MODE:
;529:		// clamp 3dfx video modes
;530:		if ( s_graphicsoptions.driver.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
CNSTI4 1
NEI4 $463
line 531
;531:		{
line 532
;532:			if ( s_graphicsoptions.mode.curvalue < 2 )
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
CNSTI4 2
GEI4 $470
line 533
;533:				s_graphicsoptions.mode.curvalue = 2;
ADDRGP4 s_graphicsoptions+920+64
CNSTI4 2
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $470
line 534
;534:			else if ( s_graphicsoptions.mode.curvalue > 6 )
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
CNSTI4 6
LEI4 $463
line 535
;535:				s_graphicsoptions.mode.curvalue = 6;
ADDRGP4 s_graphicsoptions+920+64
CNSTI4 6
ASGNI4
line 536
;536:		}
line 537
;537:		break;
ADDRGP4 $463
JUMPV
LABELV $482
line 540
;538:
;539:	case ID_LIST:
;540:		ivo = &s_ivo_templates[s_graphicsoptions.list.curvalue];
ADDRLP4 0
CNSTI4 40
ADDRGP4 s_graphicsoptions+824+64
INDIRI4
MULI4
ADDRGP4 s_ivo_templates
ADDP4
ASGNP4
line 542
;541:
;542:		s_graphicsoptions.mode.curvalue        = ivo->mode;
ADDRGP4 s_graphicsoptions+920+64
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 543
;543:		s_graphicsoptions.tq.curvalue          = ivo->tq;
ADDRGP4 s_graphicsoptions+1112+68
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 544
;544:		s_graphicsoptions.lighting.curvalue    = ivo->lighting;
ADDRGP4 s_graphicsoptions+1284+64
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 545
;545:		s_graphicsoptions.colordepth.curvalue  = ivo->colordepth;
ADDRGP4 s_graphicsoptions+1572+64
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 546
;546:		s_graphicsoptions.texturebits.curvalue = ivo->texturebits;
ADDRGP4 s_graphicsoptions+1476+64
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 547
;547:		s_graphicsoptions.geometry.curvalue    = ivo->geometry;
ADDRGP4 s_graphicsoptions+1668+64
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 548
;548:		s_graphicsoptions.filter.curvalue      = ivo->filter;
ADDRGP4 s_graphicsoptions+1764+64
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 549
;549:		s_graphicsoptions.fs.curvalue          = ivo->fullscreen;
ADDRGP4 s_graphicsoptions+1188+64
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 550
;550:		break;
ADDRGP4 $463
JUMPV
LABELV $501
line 553
;551:
;552:	case ID_DRIVERINFO:
;553:		UI_DriverInfo_Menu();
ADDRGP4 UI_DriverInfo_Menu
CALLV
pop
line 554
;554:		break;
ADDRGP4 $463
JUMPV
LABELV $502
line 557
;555:
;556:	case ID_BACK2:
;557:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 558
;558:		break;
ADDRGP4 $463
JUMPV
line 561
;559:
;560:	case ID_GRAPHICS:
;561:		break;
LABELV $504
line 564
;562:
;563:	case ID_DISPLAY:
;564:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 565
;565:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 566
;566:		break;
ADDRGP4 $463
JUMPV
LABELV $505
line 569
;567:
;568:	case ID_SOUND:
;569:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 570
;570:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 571
;571:		break;
ADDRGP4 $463
JUMPV
LABELV $506
line 574
;572:
;573:	case ID_NETWORK:
;574:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 575
;575:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 576
;576:		break;
LABELV $462
LABELV $463
line 578
;577:	}
;578:}
LABELV $459
endproc GraphicsOptions_Event 12 0
proc GraphicsOptions_TQEvent 0 0
line 586
;579:
;580:
;581:/*
;582:================
;583:GraphicsOptions_TQEvent
;584:================
;585:*/
;586:static void GraphicsOptions_TQEvent( void *ptr, int event ) {
line 587
;587:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $510
line 588
;588:	 	return;
ADDRGP4 $509
JUMPV
LABELV $510
line 590
;589:	}
;590:	s_graphicsoptions.tq.curvalue = (int)(s_graphicsoptions.tq.curvalue + 0.5);
ADDRGP4 s_graphicsoptions+1112+68
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 591
;591:}
LABELV $509
endproc GraphicsOptions_TQEvent 0 0
export GraphicsOptions_MenuDraw
proc GraphicsOptions_MenuDraw 0 4
line 600
;592:
;593:
;594:/*
;595:================
;596:GraphicsOptions_MenuDraw
;597:================
;598:*/
;599:void GraphicsOptions_MenuDraw (void)
;600:{
line 602
;601://APSFIX - rework this
;602:	GraphicsOptions_UpdateMenuItems();
ADDRGP4 GraphicsOptions_UpdateMenuItems
CALLV
pop
line 604
;603:
;604:	Menu_Draw( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 605
;605:}
LABELV $516
endproc GraphicsOptions_MenuDraw 0 4
proc GraphicsOptions_SetMenuItems 68 8
line 613
;606:
;607:/*
;608:=================
;609:GraphicsOptions_SetMenuItems
;610:=================
;611:*/
;612:static void GraphicsOptions_SetMenuItems( void )
;613:{
line 614
;614:	s_graphicsoptions.mode.curvalue = trap_Cvar_VariableValue( "r_mode" );
ADDRGP4 $419
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+920+64
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 615
;615:	if ( s_graphicsoptions.mode.curvalue < 0 )
ADDRGP4 s_graphicsoptions+920+64
INDIRI4
CNSTI4 0
GEI4 $520
line 616
;616:	{
line 617
;617:		s_graphicsoptions.mode.curvalue = 3;
ADDRGP4 s_graphicsoptions+920+64
CNSTI4 3
ASGNI4
line 618
;618:	}
LABELV $520
line 619
;619:	s_graphicsoptions.fs.curvalue = trap_Cvar_VariableValue("r_fullscreen");
ADDRGP4 $422
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1188+64
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 620
;620:	s_graphicsoptions.allow_extensions.curvalue = trap_Cvar_VariableValue("r_allowExtensions");
ADDRGP4 $416
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1380+64
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 621
;621:	s_graphicsoptions.tq.curvalue = 3-trap_Cvar_VariableValue( "r_picmip");
ADDRGP4 $413
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1112+68
CNSTF4 1077936128
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 622
;622:	if ( s_graphicsoptions.tq.curvalue < 0 )
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
CNSTF4 0
GEF4 $532
line 623
;623:	{
line 624
;624:		s_graphicsoptions.tq.curvalue = 0;
ADDRGP4 s_graphicsoptions+1112+68
CNSTF4 0
ASGNF4
line 625
;625:	}
ADDRGP4 $533
JUMPV
LABELV $532
line 626
;626:	else if ( s_graphicsoptions.tq.curvalue > 3 )
ADDRGP4 s_graphicsoptions+1112+68
INDIRF4
CNSTF4 1077936128
LEF4 $538
line 627
;627:	{
line 628
;628:		s_graphicsoptions.tq.curvalue = 3;
ADDRGP4 s_graphicsoptions+1112+68
CNSTF4 1077936128
ASGNF4
line 629
;629:	}
LABELV $538
LABELV $533
line 631
;630:
;631:	s_graphicsoptions.lighting.curvalue = trap_Cvar_VariableValue( "r_vertexLight" ) != 0;
ADDRGP4 $438
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 0
EQF4 $547
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $548
JUMPV
LABELV $547
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $548
ADDRGP4 s_graphicsoptions+1284+64
ADDRLP4 16
INDIRI4
ASGNI4
line 632
;632:	switch ( ( int ) trap_Cvar_VariableValue( "r_texturebits" ) )
ADDRGP4 $410
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 36
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $555
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
GTI4 $562
LABELV $561
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $552
ADDRGP4 $549
JUMPV
LABELV $562
ADDRLP4 24
INDIRI4
CNSTI4 32
EQI4 $558
ADDRGP4 $549
JUMPV
line 633
;633:	{
LABELV $549
LABELV $552
line 636
;634:	default:
;635:	case 0:
;636:		s_graphicsoptions.texturebits.curvalue = 0;
ADDRGP4 s_graphicsoptions+1476+64
CNSTI4 0
ASGNI4
line 637
;637:		break;
ADDRGP4 $550
JUMPV
LABELV $555
line 639
;638:	case 16:
;639:		s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1476+64
CNSTI4 1
ASGNI4
line 640
;640:		break;
ADDRGP4 $550
JUMPV
LABELV $558
line 642
;641:	case 32:
;642:		s_graphicsoptions.texturebits.curvalue = 2;
ADDRGP4 s_graphicsoptions+1476+64
CNSTI4 2
ASGNI4
line 643
;643:		break;
LABELV $550
line 646
;644:	}
;645:
;646:	if ( !Q_stricmp( UI_Cvar_VariableString( "r_textureMode" ), "GL_LINEAR_MIPMAP_NEAREST" ) )
ADDRGP4 $455
ARGP4
ADDRLP4 40
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 $457
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $563
line 647
;647:	{
line 648
;648:		s_graphicsoptions.filter.curvalue = 0;
ADDRGP4 s_graphicsoptions+1764+64
CNSTI4 0
ASGNI4
line 649
;649:	}
ADDRGP4 $564
JUMPV
LABELV $563
line 651
;650:	else
;651:	{
line 652
;652:		s_graphicsoptions.filter.curvalue = 1;
ADDRGP4 s_graphicsoptions+1764+64
CNSTI4 1
ASGNI4
line 653
;653:	}
LABELV $564
line 655
;654:
;655:	if ( trap_Cvar_VariableValue( "r_lodBias" ) > 0 )
ADDRGP4 $445
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $569
line 656
;656:	{
line 657
;657:		if ( trap_Cvar_VariableValue( "r_subdivisions" ) >= 20 )
ADDRGP4 $446
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1101004800
LTF4 $571
line 658
;658:		{
line 659
;659:			s_graphicsoptions.geometry.curvalue = 0;
ADDRGP4 s_graphicsoptions+1668+64
CNSTI4 0
ASGNI4
line 660
;660:		}
ADDRGP4 $570
JUMPV
LABELV $571
line 662
;661:		else
;662:		{
line 663
;663:			s_graphicsoptions.geometry.curvalue = 1;
ADDRGP4 s_graphicsoptions+1668+64
CNSTI4 1
ASGNI4
line 664
;664:		}
line 665
;665:	}
ADDRGP4 $570
JUMPV
LABELV $569
line 667
;666:	else
;667:	{
line 668
;668:		s_graphicsoptions.geometry.curvalue = 2;
ADDRGP4 s_graphicsoptions+1668+64
CNSTI4 2
ASGNI4
line 669
;669:	}
LABELV $570
line 671
;670:
;671:	switch ( ( int ) trap_Cvar_VariableValue( "r_colorbits" ) )
ADDRGP4 $433
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 64
CNSTI4 16
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $585
ADDRLP4 52
INDIRI4
ADDRLP4 64
INDIRI4
GTI4 $592
LABELV $591
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $582
ADDRGP4 $579
JUMPV
LABELV $592
ADDRLP4 52
INDIRI4
CNSTI4 32
EQI4 $588
ADDRGP4 $579
JUMPV
line 672
;672:	{
LABELV $579
LABELV $582
line 675
;673:	default:
;674:	case 0:
;675:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 0
ASGNI4
line 676
;676:		break;
ADDRGP4 $580
JUMPV
LABELV $585
line 678
;677:	case 16:
;678:		s_graphicsoptions.colordepth.curvalue = 1;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 1
ASGNI4
line 679
;679:		break;
ADDRGP4 $580
JUMPV
LABELV $588
line 681
;680:	case 32:
;681:		s_graphicsoptions.colordepth.curvalue = 2;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 2
ASGNI4
line 682
;682:		break;
LABELV $580
line 685
;683:	}
;684:
;685:	if ( s_graphicsoptions.fs.curvalue == 0 )
ADDRGP4 s_graphicsoptions+1188+64
INDIRI4
CNSTI4 0
NEI4 $593
line 686
;686:	{
line 687
;687:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 0
ASGNI4
line 688
;688:	}
LABELV $593
line 689
;689:	if ( s_graphicsoptions.driver.curvalue == 1 )
ADDRGP4 s_graphicsoptions+1016+64
INDIRI4
CNSTI4 1
NEI4 $599
line 690
;690:	{
line 691
;691:		s_graphicsoptions.colordepth.curvalue = 1;
ADDRGP4 s_graphicsoptions+1572+64
CNSTI4 1
ASGNI4
line 692
;692:	}
LABELV $599
line 693
;693:}
LABELV $517
endproc GraphicsOptions_SetMenuItems 68 8
data
align 4
LABELV $606
address $607
address $608
byte 4 0
align 4
LABELV $609
address $607
address $610
address $611
byte 4 0
align 4
LABELV $612
address $613
address $614
address $615
address $616
address $617
byte 4 0
align 4
LABELV $618
address $619
address $620
byte 4 0
align 4
LABELV $621
address $607
address $610
address $611
byte 4 0
align 4
LABELV $622
address $623
address $624
address $625
address $626
address $627
address $628
address $629
address $630
address $631
address $632
address $633
address $634
byte 4 0
align 4
LABELV $635
address $636
address $637
byte 4 0
align 4
LABELV $638
address $639
address $640
address $641
byte 4 0
align 4
LABELV $642
address $643
address $644
byte 4 0
export GraphicsOptions_MenuInit
code
proc GraphicsOptions_MenuInit 12 12
line 701
;694:
;695:/*
;696:================
;697:GraphicsOptions_MenuInit
;698:================
;699:*/
;700:void GraphicsOptions_MenuInit( void )
;701:{
line 781
;702:	static const char *s_driver_names[] =
;703:	{
;704:		"Default",
;705:		"Voodoo",
;706:		0
;707:	};
;708:
;709:	static const char *tq_names[] =
;710:	{
;711:		"Default",
;712:		"16 bit",
;713:		"32 bit",
;714:		0
;715:	};
;716:
;717:	static const char *s_graphics_options_names[] =
;718:	{
;719:		"High Quality",
;720:		"Normal",
;721:		"Fast",
;722:		"Fastest",
;723:		"Custom",
;724:		0
;725:	};
;726:
;727:	static const char *lighting_names[] =
;728:	{
;729:		"Lightmap",
;730:		"Vertex",
;731:		0
;732:	};
;733:
;734:	static const char *colordepth_names[] =
;735:	{
;736:		"Default",
;737:		"16 bit",
;738:		"32 bit",
;739:		0
;740:	};
;741:
;742:	static const char *resolutions[] = 
;743:	{
;744:		"320x240",
;745:		"400x300",
;746:		"512x384",
;747:		"640x480",
;748:		"800x600",
;749:		"960x720",
;750:		"1024x768",
;751:		"1152x864",
;752:		"1280x1024",
;753:		"1600x1200",
;754:		"2048x1536",
;755:		"856x480 wide screen",
;756:		0
;757:	};
;758:	static const char *filter_names[] =
;759:	{
;760:		"Bilinear",
;761:		"Trilinear",
;762:		0
;763:	};
;764:	static const char *quality_names[] =
;765:	{
;766:		"Low",
;767:		"Medium",
;768:		"High",
;769:		0
;770:	};
;771:	static const char *enabled_names[] =
;772:	{
;773:		"Off",
;774:		"On",
;775:		0
;776:	};
;777:
;778:	int y;
;779:
;780:	// zero set all our globals
;781:	memset( &s_graphicsoptions, 0 ,sizeof(graphicsoptions_t) );
ADDRGP4 s_graphicsoptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 783
;782:
;783:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 785
;784:
;785:	s_graphicsoptions.menu.wrapAround = qtrue;
ADDRGP4 s_graphicsoptions+276
CNSTI4 1
ASGNI4
line 786
;786:	s_graphicsoptions.menu.fullscreen = qtrue;
ADDRGP4 s_graphicsoptions+280
CNSTI4 1
ASGNI4
line 787
;787:	s_graphicsoptions.menu.draw       = GraphicsOptions_MenuDraw;
ADDRGP4 s_graphicsoptions+268
ADDRGP4 GraphicsOptions_MenuDraw
ASGNP4
line 789
;788:
;789:	s_graphicsoptions.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_graphicsoptions+288
CNSTI4 10
ASGNI4
line 790
;790:	s_graphicsoptions.banner.generic.x	   = 320;
ADDRGP4 s_graphicsoptions+288+12
CNSTI4 320
ASGNI4
line 791
;791:	s_graphicsoptions.banner.generic.y	   = 16;
ADDRGP4 s_graphicsoptions+288+16
CNSTI4 16
ASGNI4
line 792
;792:	s_graphicsoptions.banner.string  	   = "SYSTEM SETUP";
ADDRGP4 s_graphicsoptions+288+60
ADDRGP4 $655
ASGNP4
line 793
;793:	s_graphicsoptions.banner.color         = color_white;
ADDRGP4 s_graphicsoptions+288+68
ADDRGP4 color_white
ASGNP4
line 794
;794:	s_graphicsoptions.banner.style         = UI_CENTER;
ADDRGP4 s_graphicsoptions+288+64
CNSTI4 1
ASGNI4
line 796
;795:
;796:	s_graphicsoptions.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+360
CNSTI4 6
ASGNI4
line 797
;797:	s_graphicsoptions.framel.generic.name  = GRAPHICSOPTIONS_FRAMEL;
ADDRGP4 s_graphicsoptions+360+4
ADDRGP4 $69
ASGNP4
line 798
;798:	s_graphicsoptions.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+360+44
CNSTU4 16384
ASGNU4
line 799
;799:	s_graphicsoptions.framel.generic.x	   = 0;
ADDRGP4 s_graphicsoptions+360+12
CNSTI4 0
ASGNI4
line 800
;800:	s_graphicsoptions.framel.generic.y	   = 78;
ADDRGP4 s_graphicsoptions+360+16
CNSTI4 78
ASGNI4
line 801
;801:	s_graphicsoptions.framel.width  	   = 256;
ADDRGP4 s_graphicsoptions+360+76
CNSTI4 256
ASGNI4
line 802
;802:	s_graphicsoptions.framel.height  	   = 329;
ADDRGP4 s_graphicsoptions+360+80
CNSTI4 329
ASGNI4
line 804
;803:
;804:	s_graphicsoptions.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+448
CNSTI4 6
ASGNI4
line 805
;805:	s_graphicsoptions.framer.generic.name  = GRAPHICSOPTIONS_FRAMER;
ADDRGP4 s_graphicsoptions+448+4
ADDRGP4 $70
ASGNP4
line 806
;806:	s_graphicsoptions.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+448+44
CNSTU4 16384
ASGNU4
line 807
;807:	s_graphicsoptions.framer.generic.x	   = 376;
ADDRGP4 s_graphicsoptions+448+12
CNSTI4 376
ASGNI4
line 808
;808:	s_graphicsoptions.framer.generic.y	   = 76;
ADDRGP4 s_graphicsoptions+448+16
CNSTI4 76
ASGNI4
line 809
;809:	s_graphicsoptions.framer.width  	   = 256;
ADDRGP4 s_graphicsoptions+448+76
CNSTI4 256
ASGNI4
line 810
;810:	s_graphicsoptions.framer.height  	   = 334;
ADDRGP4 s_graphicsoptions+448+80
CNSTI4 334
ASGNI4
line 812
;811:
;812:	s_graphicsoptions.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+536
CNSTI4 9
ASGNI4
line 813
;813:	s_graphicsoptions.graphics.generic.flags	= QMF_RIGHT_JUSTIFY;
ADDRGP4 s_graphicsoptions+536+44
CNSTU4 16
ASGNU4
line 814
;814:	s_graphicsoptions.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 s_graphicsoptions+536+8
CNSTI4 106
ASGNI4
line 815
;815:	s_graphicsoptions.graphics.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+536+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 816
;816:	s_graphicsoptions.graphics.generic.x		= 216;
ADDRGP4 s_graphicsoptions+536+12
CNSTI4 216
ASGNI4
line 817
;817:	s_graphicsoptions.graphics.generic.y		= 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+536+16
CNSTI4 186
ASGNI4
line 818
;818:	s_graphicsoptions.graphics.string			= "GRAPHICS";
ADDRGP4 s_graphicsoptions+536+60
ADDRGP4 $699
ASGNP4
line 819
;819:	s_graphicsoptions.graphics.style			= UI_RIGHT;
ADDRGP4 s_graphicsoptions+536+64
CNSTI4 2
ASGNI4
line 820
;820:	s_graphicsoptions.graphics.color			= color_red;
ADDRGP4 s_graphicsoptions+536+68
ADDRGP4 color_red
ASGNP4
line 822
;821:
;822:	s_graphicsoptions.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+608
CNSTI4 9
ASGNI4
line 823
;823:	s_graphicsoptions.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+608+44
CNSTU4 272
ASGNU4
line 824
;824:	s_graphicsoptions.display.generic.id		= ID_DISPLAY;
ADDRGP4 s_graphicsoptions+608+8
CNSTI4 107
ASGNI4
line 825
;825:	s_graphicsoptions.display.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+608+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 826
;826:	s_graphicsoptions.display.generic.x			= 216;
ADDRGP4 s_graphicsoptions+608+12
CNSTI4 216
ASGNI4
line 827
;827:	s_graphicsoptions.display.generic.y			= 240 - PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+608+16
CNSTI4 213
ASGNI4
line 828
;828:	s_graphicsoptions.display.string			= "DISPLAY";
ADDRGP4 s_graphicsoptions+608+60
ADDRGP4 $717
ASGNP4
line 829
;829:	s_graphicsoptions.display.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+608+64
CNSTI4 2
ASGNI4
line 830
;830:	s_graphicsoptions.display.color				= color_red;
ADDRGP4 s_graphicsoptions+608+68
ADDRGP4 color_red
ASGNP4
line 832
;831:
;832:	s_graphicsoptions.sound.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+680
CNSTI4 9
ASGNI4
line 833
;833:	s_graphicsoptions.sound.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+680+44
CNSTU4 272
ASGNU4
line 834
;834:	s_graphicsoptions.sound.generic.id			= ID_SOUND;
ADDRGP4 s_graphicsoptions+680+8
CNSTI4 108
ASGNI4
line 835
;835:	s_graphicsoptions.sound.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+680+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 836
;836:	s_graphicsoptions.sound.generic.x			= 216;
ADDRGP4 s_graphicsoptions+680+12
CNSTI4 216
ASGNI4
line 837
;837:	s_graphicsoptions.sound.generic.y			= 240;
ADDRGP4 s_graphicsoptions+680+16
CNSTI4 240
ASGNI4
line 838
;838:	s_graphicsoptions.sound.string				= "SOUND";
ADDRGP4 s_graphicsoptions+680+60
ADDRGP4 $735
ASGNP4
line 839
;839:	s_graphicsoptions.sound.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+680+64
CNSTI4 2
ASGNI4
line 840
;840:	s_graphicsoptions.sound.color				= color_red;
ADDRGP4 s_graphicsoptions+680+68
ADDRGP4 color_red
ASGNP4
line 842
;841:
;842:	s_graphicsoptions.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+752
CNSTI4 9
ASGNI4
line 843
;843:	s_graphicsoptions.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+752+44
CNSTU4 272
ASGNU4
line 844
;844:	s_graphicsoptions.network.generic.id		= ID_NETWORK;
ADDRGP4 s_graphicsoptions+752+8
CNSTI4 109
ASGNI4
line 845
;845:	s_graphicsoptions.network.generic.callback	= GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+752+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 846
;846:	s_graphicsoptions.network.generic.x			= 216;
ADDRGP4 s_graphicsoptions+752+12
CNSTI4 216
ASGNI4
line 847
;847:	s_graphicsoptions.network.generic.y			= 240 + PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+752+16
CNSTI4 267
ASGNI4
line 848
;848:	s_graphicsoptions.network.string			= "NETWORK";
ADDRGP4 s_graphicsoptions+752+60
ADDRGP4 $753
ASGNP4
line 849
;849:	s_graphicsoptions.network.style				= UI_RIGHT;
ADDRGP4 s_graphicsoptions+752+64
CNSTI4 2
ASGNI4
line 850
;850:	s_graphicsoptions.network.color				= color_red;
ADDRGP4 s_graphicsoptions+752+68
ADDRGP4 color_red
ASGNP4
line 852
;851:
;852:	y = 240 - 6 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 132
ASGNI4
line 853
;853:	s_graphicsoptions.list.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+824
CNSTI4 3
ASGNI4
line 854
;854:	s_graphicsoptions.list.generic.name     = "Graphics Settings:";
ADDRGP4 s_graphicsoptions+824+4
ADDRGP4 $761
ASGNP4
line 855
;855:	s_graphicsoptions.list.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+824+44
CNSTU4 258
ASGNU4
line 856
;856:	s_graphicsoptions.list.generic.x        = 400;
ADDRGP4 s_graphicsoptions+824+12
CNSTI4 400
ASGNI4
line 857
;857:	s_graphicsoptions.list.generic.y        = y;
ADDRGP4 s_graphicsoptions+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 858
;858:	s_graphicsoptions.list.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+824+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 859
;859:	s_graphicsoptions.list.generic.id       = ID_LIST;
ADDRGP4 s_graphicsoptions+824+8
CNSTI4 103
ASGNI4
line 860
;860:	s_graphicsoptions.list.itemnames        = s_graphics_options_names;
ADDRGP4 s_graphicsoptions+824+76
ADDRGP4 $612
ASGNP4
line 861
;861:	y += 2 * ( BIGCHAR_HEIGHT + 2 );
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 36
ADDI4
ASGNI4
line 863
;862:
;863:	s_graphicsoptions.driver.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1016
CNSTI4 3
ASGNI4
line 864
;864:	s_graphicsoptions.driver.generic.name  = "GL Driver:";
ADDRGP4 s_graphicsoptions+1016+4
ADDRGP4 $777
ASGNP4
line 865
;865:	s_graphicsoptions.driver.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1016+44
CNSTU4 258
ASGNU4
line 866
;866:	s_graphicsoptions.driver.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1016+12
CNSTI4 400
ASGNI4
line 867
;867:	s_graphicsoptions.driver.generic.y     = y;
ADDRGP4 s_graphicsoptions+1016+16
ADDRLP4 0
INDIRI4
ASGNI4
line 868
;868:	s_graphicsoptions.driver.itemnames     = s_driver_names;
ADDRGP4 s_graphicsoptions+1016+76
ADDRGP4 $606
ASGNP4
line 869
;869:	s_graphicsoptions.driver.curvalue      = (uis.glconfig.driverType == GLDRV_VOODOO);
ADDRGP4 uis+56+11284
INDIRI4
CNSTI4 2
NEI4 $791
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $792
JUMPV
LABELV $791
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $792
ADDRGP4 s_graphicsoptions+1016+64
ADDRLP4 4
INDIRI4
ASGNI4
line 870
;870:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 873
;871:
;872:	// references/modifies "r_allowExtensions"
;873:	s_graphicsoptions.allow_extensions.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1380
CNSTI4 3
ASGNI4
line 874
;874:	s_graphicsoptions.allow_extensions.generic.name	    = "GL Extensions:";
ADDRGP4 s_graphicsoptions+1380+4
ADDRGP4 $796
ASGNP4
line 875
;875:	s_graphicsoptions.allow_extensions.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1380+44
CNSTU4 258
ASGNU4
line 876
;876:	s_graphicsoptions.allow_extensions.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+1380+12
CNSTI4 400
ASGNI4
line 877
;877:	s_graphicsoptions.allow_extensions.generic.y	    = y;
ADDRGP4 s_graphicsoptions+1380+16
ADDRLP4 0
INDIRI4
ASGNI4
line 878
;878:	s_graphicsoptions.allow_extensions.itemnames        = enabled_names;
ADDRGP4 s_graphicsoptions+1380+76
ADDRGP4 $642
ASGNP4
line 879
;879:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 882
;880:
;881:	// references/modifies "r_mode"
;882:	s_graphicsoptions.mode.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+920
CNSTI4 3
ASGNI4
line 883
;883:	s_graphicsoptions.mode.generic.name     = "Video Mode:";
ADDRGP4 s_graphicsoptions+920+4
ADDRGP4 $808
ASGNP4
line 884
;884:	s_graphicsoptions.mode.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+920+44
CNSTU4 258
ASGNU4
line 885
;885:	s_graphicsoptions.mode.generic.x        = 400;
ADDRGP4 s_graphicsoptions+920+12
CNSTI4 400
ASGNI4
line 886
;886:	s_graphicsoptions.mode.generic.y        = y;
ADDRGP4 s_graphicsoptions+920+16
ADDRLP4 0
INDIRI4
ASGNI4
line 887
;887:	s_graphicsoptions.mode.itemnames        = resolutions;
ADDRGP4 s_graphicsoptions+920+76
ADDRGP4 $622
ASGNP4
line 888
;888:	s_graphicsoptions.mode.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+920+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 889
;889:	s_graphicsoptions.mode.generic.id       = ID_MODE;
ADDRGP4 s_graphicsoptions+920+8
CNSTI4 104
ASGNI4
line 890
;890:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 893
;891:
;892:	// references "r_colorbits"
;893:	s_graphicsoptions.colordepth.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1572
CNSTI4 3
ASGNI4
line 894
;894:	s_graphicsoptions.colordepth.generic.name     = "Color Depth:";
ADDRGP4 s_graphicsoptions+1572+4
ADDRGP4 $824
ASGNP4
line 895
;895:	s_graphicsoptions.colordepth.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1572+44
CNSTU4 258
ASGNU4
line 896
;896:	s_graphicsoptions.colordepth.generic.x        = 400;
ADDRGP4 s_graphicsoptions+1572+12
CNSTI4 400
ASGNI4
line 897
;897:	s_graphicsoptions.colordepth.generic.y        = y;
ADDRGP4 s_graphicsoptions+1572+16
ADDRLP4 0
INDIRI4
ASGNI4
line 898
;898:	s_graphicsoptions.colordepth.itemnames        = colordepth_names;
ADDRGP4 s_graphicsoptions+1572+76
ADDRGP4 $621
ASGNP4
line 899
;899:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 902
;900:
;901:	// references/modifies "r_fullscreen"
;902:	s_graphicsoptions.fs.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1188
CNSTI4 3
ASGNI4
line 903
;903:	s_graphicsoptions.fs.generic.name	  = "Fullscreen:";
ADDRGP4 s_graphicsoptions+1188+4
ADDRGP4 $836
ASGNP4
line 904
;904:	s_graphicsoptions.fs.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1188+44
CNSTU4 258
ASGNU4
line 905
;905:	s_graphicsoptions.fs.generic.x	      = 400;
ADDRGP4 s_graphicsoptions+1188+12
CNSTI4 400
ASGNI4
line 906
;906:	s_graphicsoptions.fs.generic.y	      = y;
ADDRGP4 s_graphicsoptions+1188+16
ADDRLP4 0
INDIRI4
ASGNI4
line 907
;907:	s_graphicsoptions.fs.itemnames	      = enabled_names;
ADDRGP4 s_graphicsoptions+1188+76
ADDRGP4 $642
ASGNP4
line 908
;908:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 911
;909:
;910:	// references/modifies "r_vertexLight"
;911:	s_graphicsoptions.lighting.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1284
CNSTI4 3
ASGNI4
line 912
;912:	s_graphicsoptions.lighting.generic.name	 = "Lighting:";
ADDRGP4 s_graphicsoptions+1284+4
ADDRGP4 $848
ASGNP4
line 913
;913:	s_graphicsoptions.lighting.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1284+44
CNSTU4 258
ASGNU4
line 914
;914:	s_graphicsoptions.lighting.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+1284+12
CNSTI4 400
ASGNI4
line 915
;915:	s_graphicsoptions.lighting.generic.y	 = y;
ADDRGP4 s_graphicsoptions+1284+16
ADDRLP4 0
INDIRI4
ASGNI4
line 916
;916:	s_graphicsoptions.lighting.itemnames     = lighting_names;
ADDRGP4 s_graphicsoptions+1284+76
ADDRGP4 $618
ASGNP4
line 917
;917:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 920
;918:
;919:	// references/modifies "r_lodBias" & "subdivisions"
;920:	s_graphicsoptions.geometry.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1668
CNSTI4 3
ASGNI4
line 921
;921:	s_graphicsoptions.geometry.generic.name	 = "Geometric Detail:";
ADDRGP4 s_graphicsoptions+1668+4
ADDRGP4 $860
ASGNP4
line 922
;922:	s_graphicsoptions.geometry.generic.flags = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1668+44
CNSTU4 258
ASGNU4
line 923
;923:	s_graphicsoptions.geometry.generic.x	 = 400;
ADDRGP4 s_graphicsoptions+1668+12
CNSTI4 400
ASGNI4
line 924
;924:	s_graphicsoptions.geometry.generic.y	 = y;
ADDRGP4 s_graphicsoptions+1668+16
ADDRLP4 0
INDIRI4
ASGNI4
line 925
;925:	s_graphicsoptions.geometry.itemnames     = quality_names;
ADDRGP4 s_graphicsoptions+1668+76
ADDRGP4 $638
ASGNP4
line 926
;926:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 929
;927:
;928:	// references/modifies "r_picmip"
;929:	s_graphicsoptions.tq.generic.type	= MTYPE_SLIDER;
ADDRGP4 s_graphicsoptions+1112
CNSTI4 1
ASGNI4
line 930
;930:	s_graphicsoptions.tq.generic.name	= "Texture Detail:";
ADDRGP4 s_graphicsoptions+1112+4
ADDRGP4 $872
ASGNP4
line 931
;931:	s_graphicsoptions.tq.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1112+44
CNSTU4 258
ASGNU4
line 932
;932:	s_graphicsoptions.tq.generic.x		= 400;
ADDRGP4 s_graphicsoptions+1112+12
CNSTI4 400
ASGNI4
line 933
;933:	s_graphicsoptions.tq.generic.y		= y;
ADDRGP4 s_graphicsoptions+1112+16
ADDRLP4 0
INDIRI4
ASGNI4
line 934
;934:	s_graphicsoptions.tq.minvalue       = 0;
ADDRGP4 s_graphicsoptions+1112+60
CNSTF4 0
ASGNF4
line 935
;935:	s_graphicsoptions.tq.maxvalue       = 3;
ADDRGP4 s_graphicsoptions+1112+64
CNSTF4 1077936128
ASGNF4
line 936
;936:	s_graphicsoptions.tq.generic.callback = GraphicsOptions_TQEvent;
ADDRGP4 s_graphicsoptions+1112+48
ADDRGP4 GraphicsOptions_TQEvent
ASGNP4
line 937
;937:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 940
;938:
;939:	// references/modifies "r_textureBits"
;940:	s_graphicsoptions.texturebits.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1476
CNSTI4 3
ASGNI4
line 941
;941:	s_graphicsoptions.texturebits.generic.name	= "Texture Quality:";
ADDRGP4 s_graphicsoptions+1476+4
ADDRGP4 $888
ASGNP4
line 942
;942:	s_graphicsoptions.texturebits.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1476+44
CNSTU4 258
ASGNU4
line 943
;943:	s_graphicsoptions.texturebits.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+1476+12
CNSTI4 400
ASGNI4
line 944
;944:	s_graphicsoptions.texturebits.generic.y	    = y;
ADDRGP4 s_graphicsoptions+1476+16
ADDRLP4 0
INDIRI4
ASGNI4
line 945
;945:	s_graphicsoptions.texturebits.itemnames     = tq_names;
ADDRGP4 s_graphicsoptions+1476+76
ADDRGP4 $609
ASGNP4
line 946
;946:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 949
;947:
;948:	// references/modifies "r_textureMode"
;949:	s_graphicsoptions.filter.generic.type   = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1764
CNSTI4 3
ASGNI4
line 950
;950:	s_graphicsoptions.filter.generic.name	= "Texture Filter:";
ADDRGP4 s_graphicsoptions+1764+4
ADDRGP4 $900
ASGNP4
line 951
;951:	s_graphicsoptions.filter.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1764+44
CNSTU4 258
ASGNU4
line 952
;952:	s_graphicsoptions.filter.generic.x	    = 400;
ADDRGP4 s_graphicsoptions+1764+12
CNSTI4 400
ASGNI4
line 953
;953:	s_graphicsoptions.filter.generic.y	    = y;
ADDRGP4 s_graphicsoptions+1764+16
ADDRLP4 0
INDIRI4
ASGNI4
line 954
;954:	s_graphicsoptions.filter.itemnames      = filter_names;
ADDRGP4 s_graphicsoptions+1764+76
ADDRGP4 $635
ASGNP4
line 955
;955:	y += 2*BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 957
;956:
;957:	s_graphicsoptions.driverinfo.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1860
CNSTI4 9
ASGNI4
line 958
;958:	s_graphicsoptions.driverinfo.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+1860+44
CNSTU4 264
ASGNU4
line 959
;959:	s_graphicsoptions.driverinfo.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1860+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 960
;960:	s_graphicsoptions.driverinfo.generic.id       = ID_DRIVERINFO;
ADDRGP4 s_graphicsoptions+1860+8
CNSTI4 105
ASGNI4
line 961
;961:	s_graphicsoptions.driverinfo.generic.x        = 320;
ADDRGP4 s_graphicsoptions+1860+12
CNSTI4 320
ASGNI4
line 962
;962:	s_graphicsoptions.driverinfo.generic.y        = y;
ADDRGP4 s_graphicsoptions+1860+16
ADDRLP4 0
INDIRI4
ASGNI4
line 963
;963:	s_graphicsoptions.driverinfo.string           = "Driver Info";
ADDRGP4 s_graphicsoptions+1860+60
ADDRGP4 $922
ASGNP4
line 964
;964:	s_graphicsoptions.driverinfo.style            = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_graphicsoptions+1860+64
CNSTI4 17
ASGNI4
line 965
;965:	s_graphicsoptions.driverinfo.color            = color_red;
ADDRGP4 s_graphicsoptions+1860+68
ADDRGP4 color_red
ASGNP4
line 966
;966:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 968
;967:
;968:	s_graphicsoptions.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+2020
CNSTI4 6
ASGNI4
line 969
;969:	s_graphicsoptions.back.generic.name     = GRAPHICSOPTIONS_BACK0;
ADDRGP4 s_graphicsoptions+2020+4
ADDRGP4 $71
ASGNP4
line 970
;970:	s_graphicsoptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+2020+44
CNSTU4 260
ASGNU4
line 971
;971:	s_graphicsoptions.back.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+2020+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 972
;972:	s_graphicsoptions.back.generic.id	    = ID_BACK2;
ADDRGP4 s_graphicsoptions+2020+8
CNSTI4 101
ASGNI4
line 973
;973:	s_graphicsoptions.back.generic.x		= 0;
ADDRGP4 s_graphicsoptions+2020+12
CNSTI4 0
ASGNI4
line 974
;974:	s_graphicsoptions.back.generic.y		= 480-64;
ADDRGP4 s_graphicsoptions+2020+16
CNSTI4 416
ASGNI4
line 975
;975:	s_graphicsoptions.back.width  		    = 128;
ADDRGP4 s_graphicsoptions+2020+76
CNSTI4 128
ASGNI4
line 976
;976:	s_graphicsoptions.back.height  		    = 64;
ADDRGP4 s_graphicsoptions+2020+80
CNSTI4 64
ASGNI4
line 977
;977:	s_graphicsoptions.back.focuspic         = GRAPHICSOPTIONS_BACK1;
ADDRGP4 s_graphicsoptions+2020+60
ADDRGP4 $72
ASGNP4
line 979
;978:
;979:	s_graphicsoptions.apply.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+1932
CNSTI4 6
ASGNI4
line 980
;980:	s_graphicsoptions.apply.generic.name     = GRAPHICSOPTIONS_ACCEPT0;
ADDRGP4 s_graphicsoptions+1932+4
ADDRGP4 $949
ASGNP4
line 981
;981:	s_graphicsoptions.apply.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_HIDDEN|QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+1932+44
CNSTU4 20752
ASGNU4
line 982
;982:	s_graphicsoptions.apply.generic.callback = GraphicsOptions_ApplyChanges;
ADDRGP4 s_graphicsoptions+1932+48
ADDRGP4 GraphicsOptions_ApplyChanges
ASGNP4
line 983
;983:	s_graphicsoptions.apply.generic.x        = 640;
ADDRGP4 s_graphicsoptions+1932+12
CNSTI4 640
ASGNI4
line 984
;984:	s_graphicsoptions.apply.generic.y        = 480-64;
ADDRGP4 s_graphicsoptions+1932+16
CNSTI4 416
ASGNI4
line 985
;985:	s_graphicsoptions.apply.width  		     = 128;
ADDRGP4 s_graphicsoptions+1932+76
CNSTI4 128
ASGNI4
line 986
;986:	s_graphicsoptions.apply.height  		 = 64;
ADDRGP4 s_graphicsoptions+1932+80
CNSTI4 64
ASGNI4
line 987
;987:	s_graphicsoptions.apply.focuspic         = GRAPHICSOPTIONS_ACCEPT1;
ADDRGP4 s_graphicsoptions+1932+60
ADDRGP4 $964
ASGNP4
line 989
;988:
;989:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.banner );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 990
;990:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framel );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 991
;991:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.framer );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 993
;992:
;993:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 994
;994:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.display );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 995
;995:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.sound );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 996
;996:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.network );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 998
;997:
;998:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.list );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 999
;999:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driver );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1016
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1000
;1000:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.allow_extensions );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1001
;1001:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.mode );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+920
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1002
;1002:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.colordepth );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1572
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1003
;1003:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.fs );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1188
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1004
;1004:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.lighting );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1284
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1005
;1005:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.geometry );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1668
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1006
;1006:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.tq );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1112
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1007
;1007:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.texturebits );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1476
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1008
;1008:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.filter );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1764
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1009
;1009:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.driverinfo );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1860
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1011
;1010:
;1011:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.back );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2020
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1012
;1012:	Menu_AddItem( &s_graphicsoptions.menu, ( void * ) &s_graphicsoptions.apply );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1014
;1013:
;1014:	GraphicsOptions_SetMenuItems();
ADDRGP4 GraphicsOptions_SetMenuItems
CALLV
pop
line 1015
;1015:	GraphicsOptions_GetInitialVideo();
ADDRGP4 GraphicsOptions_GetInitialVideo
CALLV
pop
line 1017
;1016:
;1017:	if ( uis.glconfig.driverType == GLDRV_ICD &&
ADDRGP4 uis+56+11284
INDIRI4
CNSTI4 0
NEI4 $986
ADDRGP4 uis+56+11288
INDIRI4
CNSTI4 1
NEI4 $986
line 1019
;1018:		 uis.glconfig.hardwareType == GLHW_3DFX_2D3D )
;1019:	{
line 1020
;1020:		s_graphicsoptions.driver.generic.flags |= QMF_HIDDEN|QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_graphicsoptions+1016+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1021
;1021:	}
LABELV $986
line 1022
;1022:}
LABELV $605
endproc GraphicsOptions_MenuInit 12 12
export GraphicsOptions_Cache
proc GraphicsOptions_Cache 0 4
line 1030
;1023:
;1024:
;1025:/*
;1026:=================
;1027:GraphicsOptions_Cache
;1028:=================
;1029:*/
;1030:void GraphicsOptions_Cache( void ) {
line 1031
;1031:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMEL );
ADDRGP4 $69
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1032
;1032:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_FRAMER );
ADDRGP4 $70
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1033
;1033:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK0 );
ADDRGP4 $71
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1034
;1034:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_BACK1 );
ADDRGP4 $72
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1035
;1035:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT0 );
ADDRGP4 $949
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1036
;1036:	trap_R_RegisterShaderNoMip( GRAPHICSOPTIONS_ACCEPT1 );
ADDRGP4 $964
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1037
;1037:}
LABELV $994
endproc GraphicsOptions_Cache 0 4
export UI_GraphicsOptionsMenu
proc UI_GraphicsOptionsMenu 0 8
line 1045
;1038:
;1039:
;1040:/*
;1041:=================
;1042:UI_GraphicsOptionsMenu
;1043:=================
;1044:*/
;1045:void UI_GraphicsOptionsMenu( void ) {
line 1046
;1046:	GraphicsOptions_MenuInit();
ADDRGP4 GraphicsOptions_MenuInit
CALLV
pop
line 1047
;1047:	UI_PushMenu( &s_graphicsoptions.menu );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1048
;1048:	Menu_SetCursorToItem( &s_graphicsoptions.menu, &s_graphicsoptions.graphics );
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+536
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 1049
;1049:}
LABELV $995
endproc UI_GraphicsOptionsMenu 0 8
bss
align 4
LABELV s_graphicsoptions
skip 2108
align 4
LABELV s_ivo
skip 40
align 4
LABELV s_driverinfo
skip 1908
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
LABELV $964
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $949
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $922
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $900
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $888
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
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
LABELV $872
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $860
byte 1 71
byte 1 101
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $848
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $836
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $824
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $808
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $796
byte 1 71
byte 1 76
byte 1 32
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $777
byte 1 71
byte 1 76
byte 1 32
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $761
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $753
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $735
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $717
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $699
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
LABELV $655
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
LABELV $644
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $643
byte 1 79
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $641
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $640
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $639
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $637
byte 1 84
byte 1 114
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $636
byte 1 66
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $634
byte 1 56
byte 1 53
byte 1 54
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $633
byte 1 50
byte 1 48
byte 1 52
byte 1 56
byte 1 120
byte 1 49
byte 1 53
byte 1 51
byte 1 54
byte 1 0
align 1
LABELV $632
byte 1 49
byte 1 54
byte 1 48
byte 1 48
byte 1 120
byte 1 49
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $631
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $630
byte 1 49
byte 1 49
byte 1 53
byte 1 50
byte 1 120
byte 1 56
byte 1 54
byte 1 52
byte 1 0
align 1
LABELV $629
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 120
byte 1 55
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $628
byte 1 57
byte 1 54
byte 1 48
byte 1 120
byte 1 55
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $627
byte 1 56
byte 1 48
byte 1 48
byte 1 120
byte 1 54
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $626
byte 1 54
byte 1 52
byte 1 48
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $625
byte 1 53
byte 1 49
byte 1 50
byte 1 120
byte 1 51
byte 1 56
byte 1 52
byte 1 0
align 1
LABELV $624
byte 1 52
byte 1 48
byte 1 48
byte 1 120
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $623
byte 1 51
byte 1 50
byte 1 48
byte 1 120
byte 1 50
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $620
byte 1 86
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $619
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $617
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $616
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $615
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $614
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $613
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $611
byte 1 51
byte 1 50
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $610
byte 1 49
byte 1 54
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $608
byte 1 86
byte 1 111
byte 1 111
byte 1 100
byte 1 111
byte 1 111
byte 1 0
align 1
LABELV $607
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $458
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
LABELV $457
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $456
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $455
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $446
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $445
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 66
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $438
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $435
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $434
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $433
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $425
byte 1 114
byte 1 95
byte 1 103
byte 1 108
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $422
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $419
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $416
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $413
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $410
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $214
byte 1 51
byte 1 100
byte 1 102
byte 1 120
byte 1 118
byte 1 103
byte 1 108
byte 1 0
align 1
LABELV $213
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 103
byte 1 108
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $128
byte 1 68
byte 1 82
byte 1 73
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
LABELV $90
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $84
byte 1 69
byte 1 88
byte 1 84
byte 1 69
byte 1 78
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $83
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $82
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $72
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
LABELV $71
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
LABELV $70
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
LABELV $69
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
