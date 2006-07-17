data
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
align 4
LABELV handicap_items
address $70
address $71
address $72
address $73
address $74
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
address $89
byte 4 0
code
proc PlayerSettings_DrawName 96 20
file "../ui_playersettings.c"
line 87
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define ART_FRAMEL			"menu/art/frame2_l"
;6:#define ART_FRAMER			"menu/art/frame1_r"
;7:#define ART_MODEL0			"menu/art/model_0"
;8:#define ART_MODEL1			"menu/art/model_1"
;9:#define ART_BACK0			"menu/art/back_0"
;10:#define ART_BACK1			"menu/art/back_1"
;11:#define ART_FX_BASE			"menu/art/fx_base"
;12:#define ART_FX_BLUE			"menu/art/fx_blue"
;13:#define ART_FX_CYAN			"menu/art/fx_cyan"
;14:#define ART_FX_GREEN		"menu/art/fx_grn"
;15:#define ART_FX_RED			"menu/art/fx_red"
;16:#define ART_FX_TEAL			"menu/art/fx_teal"
;17:#define ART_FX_WHITE		"menu/art/fx_white"
;18:#define ART_FX_YELLOW		"menu/art/fx_yel"
;19:
;20:#define ID_NAME			10
;21:#define ID_HANDICAP		11
;22:#define ID_EFFECTS		12
;23:#define ID_BACK			13
;24:#define ID_MODEL		14
;25:
;26:#define MAX_NAMELENGTH	20
;27:
;28:
;29:typedef struct {
;30:	menuframework_s		menu;
;31:
;32:	menutext_s			banner;
;33:	menubitmap_s		framel;
;34:	menubitmap_s		framer;
;35:	menubitmap_s		player;
;36:
;37:	menufield_s			name;
;38:	menulist_s			handicap;
;39:	menulist_s			effects;
;40:
;41:	menubitmap_s		back;
;42:	menubitmap_s		model;
;43:	menubitmap_s		item_null;
;44:
;45:	qhandle_t			fxBasePic;
;46:	qhandle_t			fxPic[7];
;47:	playerInfo_t		playerinfo;
;48:	int					current_fx;
;49:	char				playerModel[MAX_QPATH];
;50:} playersettings_t;
;51:
;52:static playersettings_t	s_playersettings;
;53:
;54:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;55:static int uitogamecode[] = {4,6,2,3,1,5,7};
;56:
;57:static const char *handicap_items[] = {
;58:	"None",
;59:	"95",
;60:	"90",
;61:	"85",
;62:	"80",
;63:	"75",
;64:	"70",
;65:	"65",
;66:	"60",
;67:	"55",
;68:	"50",
;69:	"45",
;70:	"40",
;71:	"35",
;72:	"30",
;73:	"25",
;74:	"20",
;75:	"15",
;76:	"10",
;77:	"5",
;78:	0
;79:};
;80:
;81:
;82:/*
;83:=================
;84:PlayerSettings_DrawName
;85:=================
;86:*/
;87:static void PlayerSettings_DrawName( void *self ) {
line 98
;88:	menufield_s		*f;
;89:	qboolean		focus;
;90:	int				style;
;91:	char			*txt;
;92:	char			c;
;93:	float			*color;
;94:	int				n;
;95:	int				basex, x, y;
;96:	char			name[32];
;97:
;98:	f = (menufield_s*)self;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
line 99
;99:	basex = f->generic.x;
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 100
;100:	y = f->generic.y;
ADDRLP4 24
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 101
;101:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $92
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $92
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $93
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 103
;102:
;103:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 104
;104:	color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 105
;105:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $94
line 106
;106:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 107
;107:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 108
;108:	}
LABELV $94
line 110
;109:
;110:	UI_DrawProportionalString( basex, y, "Name", style, color );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 113
;111:
;112:	// draw the actual name
;113:	basex += 64;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 114
;114:	y += PROP_HEIGHT;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 115
;115:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
line 116
;116:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 12
ADDRGP4 g_color_table+112
ASGNP4
line 117
;117:	x = basex;
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $98
line 118
;118:	while ( (c = *txt) != 0 ) {
line 119
;119:		if ( !focus && Q_IsColorString( txt ) ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $101
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $101
ADDRLP4 88
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
NEI4 $101
ADDRLP4 92
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $101
ADDRLP4 92
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $101
line 120
;120:			n = ColorIndex( *(txt+1) );
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
ASGNI4
line 121
;121:			if( n == 0 ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $103
line 122
;122:				n = 7;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 123
;123:			}
LABELV $103
line 124
;124:			color = g_color_table[n];
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ASGNP4
line 125
;125:			txt += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 126
;126:			continue;
ADDRGP4 $99
JUMPV
LABELV $101
line 128
;127:		}
;128:		UI_DrawChar( x, y, c, style, color );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 129
;129:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 130
;130:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 131
;131:	}
LABELV $99
line 118
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 80
INDIRI1
ASGNI1
ADDRLP4 80
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $98
line 134
;132:
;133:	// draw cursor if we have focus
;134:	if( focus ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $105
line 135
;135:		if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 84
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $107
line 136
;136:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 137
;137:		} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 138
;138:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 139
;139:		}
LABELV $108
line 141
;140:
;141:		style &= ~UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 142
;142:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 144
;143:
;144:		UI_DrawChar( basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white );
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 145
;145:	}
LABELV $105
line 148
;146:
;147:	// draw at bottom also using proportional font
;148:	Q_strncpyz( name, f->field.buffer, sizeof(name) );
ADDRLP4 40
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 149
;149:	Q_CleanStr( name );
ADDRLP4 40
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 150
;150:	UI_DrawProportionalString( 320, 440, name, UI_CENTER|UI_BIGFONT, text_color_normal );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 151
;151:}
LABELV $90
endproc PlayerSettings_DrawName 96 20
proc PlayerSettings_DrawHandicap 36 20
line 159
;152:
;153:
;154:/*
;155:=================
;156:PlayerSettings_DrawHandicap
;157:=================
;158:*/
;159:static void PlayerSettings_DrawHandicap( void *self ) {
line 165
;160:	menulist_s		*item;
;161:	qboolean		focus;
;162:	int				style;
;163:	float			*color;
;164:
;165:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 166
;166:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $111
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $111
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $112
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 168
;167:
;168:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 169
;169:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 170
;170:	if( focus ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $113
line 171
;171:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 172
;172:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 173
;173:	}
LABELV $113
line 175
;174:
;175:	UI_DrawProportionalString( item->generic.x, item->generic.y, "Handicap", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $115
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 176
;176:	UI_DrawProportionalString( item->generic.x + 64, item->generic.y + PROP_HEIGHT, handicap_items[item->curvalue], style, color );
ADDRLP4 32
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicap_items
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 177
;177:}
LABELV $109
endproc PlayerSettings_DrawHandicap 36 20
proc PlayerSettings_DrawEffects 44 20
line 185
;178:
;179:
;180:/*
;181:=================
;182:PlayerSettings_DrawEffects
;183:=================
;184:*/
;185:static void PlayerSettings_DrawEffects( void *self ) {
line 191
;186:	menulist_s		*item;
;187:	qboolean		focus;
;188:	int				style;
;189:	float			*color;
;190:
;191:	item = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 192
;192:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $118
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $118
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $119
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 194
;193:
;194:	style = UI_LEFT|UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 195
;195:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 196
;196:	if( focus ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $120
line 197
;197:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 198
;198:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 199
;199:	}
LABELV $120
line 201
;200:
;201:	UI_DrawProportionalString( item->generic.x, item->generic.y, "Effects", style, color );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $122
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 203
;202:
;203:	UI_DrawHandlePic( item->generic.x + 64, item->generic.y + PROP_HEIGHT + 8, 128, 8, s_playersettings.fxBasePic );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_playersettings+1412
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 204
;204:	UI_DrawHandlePic( item->generic.x + 64 + item->curvalue * 16 + 8, item->generic.y + PROP_HEIGHT + 6, 16, 12, s_playersettings.fxPic[item->curvalue] );
ADDRLP4 36
CNSTI4 64
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 6
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_playersettings+1416
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 205
;205:}
LABELV $116
endproc PlayerSettings_DrawEffects 44 20
proc PlayerSettings_DrawPlayer 88 28
line 213
;206:
;207:
;208:/*
;209:=================
;210:PlayerSettings_DrawPlayer
;211:=================
;212:*/
;213:static void PlayerSettings_DrawPlayer( void *self ) {
line 218
;214:	menubitmap_s	*b;
;215:	vec3_t			viewangles;
;216:	char			buf[MAX_QPATH];
;217:
;218:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof( buf ) );
ADDRGP4 $126
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 219
;219:	if ( strcmp( buf, s_playersettings.playerModel ) != 0 ) {
ADDRLP4 4
ARGP4
ADDRGP4 s_playersettings+2560
ARGP4
ADDRLP4 80
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $127
line 220
;220:		UI_PlayerInfo_SetModel( &s_playersettings.playerinfo, buf );
ADDRGP4 s_playersettings+1444
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 221
;221:		strcpy( s_playersettings.playerModel, buf );
ADDRGP4 s_playersettings+2560
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 223
;222:
;223:		viewangles[YAW]   = 180 - 30;
ADDRLP4 68+4
CNSTF4 1125515264
ASGNF4
line 224
;224:		viewangles[PITCH] = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 225
;225:		viewangles[ROLL]  = 0;
ADDRLP4 68+8
CNSTF4 0
ASGNF4
line 226
;226:		UI_PlayerInfo_SetInfo( &s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playersettings+1444
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 227
;227:	}
LABELV $127
line 229
;228:
;229:	b = (menubitmap_s*) self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 230
;230:	UI_DrawPlayer( b->generic.x, b->generic.y, b->width, b->height, &s_playersettings.playerinfo, uis.realtime/2 );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 s_playersettings+1444
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 231
;231:}
LABELV $125
endproc PlayerSettings_DrawPlayer 88 28
proc PlayerSettings_SaveChanges 0 8
line 239
;232:
;233:
;234:/*
;235:=================
;236:PlayerSettings_SaveChanges
;237:=================
;238:*/
;239:static void PlayerSettings_SaveChanges( void ) {
line 241
;240:	// name
;241:	trap_Cvar_Set( "name", s_playersettings.name.field.buffer );
ADDRGP4 $138
ARGP4
ADDRGP4 s_playersettings+624+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 244
;242:
;243:	// handicap
;244:	trap_Cvar_SetValue( "handicap", 100 - s_playersettings.handicap.curvalue * 5 );
ADDRGP4 $142
ARGP4
CNSTI4 100
CNSTI4 5
ADDRGP4 s_playersettings+956+64
INDIRI4
MULI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 247
;245:
;246:	// effects color
;247:	trap_Cvar_SetValue( "color1", uitogamecode[s_playersettings.effects.curvalue] );
ADDRGP4 $145
ARGP4
ADDRGP4 s_playersettings+1052+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 248
;248:}
LABELV $137
endproc PlayerSettings_SaveChanges 0 8
proc PlayerSettings_MenuKey 8 8
line 256
;249:
;250:
;251:/*
;252:=================
;253:PlayerSettings_MenuKey
;254:=================
;255:*/
;256:static sfxHandle_t PlayerSettings_MenuKey( int key ) {
line 257
;257:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $151
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $149
LABELV $151
line 258
;258:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 259
;259:	}
LABELV $149
line 260
;260:	return Menu_DefaultKey( &s_playersettings.menu, key );
ADDRGP4 s_playersettings
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $148
endproc PlayerSettings_MenuKey 8 8
proc PlayerSettings_SetMenuItems 44 28
line 269
;261:}
;262:
;263:
;264:/*
;265:=================
;266:PlayerSettings_SetMenuItems
;267:=================
;268:*/
;269:static void PlayerSettings_SetMenuItems( void ) {
line 275
;270:	vec3_t	viewangles;
;271:	int		c;
;272:	int		h;
;273:
;274:	// name
;275:	Q_strncpyz( s_playersettings.name.field.buffer, UI_Cvar_VariableString("name"), sizeof(s_playersettings.name.field.buffer) );
ADDRGP4 $138
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+624+60+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 278
;276:
;277:	// effects color
;278:	c = trap_Cvar_VariableValue( "color1" ) - 1;
ADDRGP4 $145
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 279
;279:	if( c < 0 || c > 6 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $161
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $159
LABELV $161
line 280
;280:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 281
;281:	}
LABELV $159
line 282
;282:	s_playersettings.effects.curvalue = gamecodetoui[c];
ADDRGP4 s_playersettings+1052+64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui
ADDP4
INDIRI4
ASGNI4
line 285
;283:
;284:	// model/skin
;285:	memset( &s_playersettings.playerinfo, 0, sizeof(playerInfo_t) );
ADDRGP4 s_playersettings+1444
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 287
;286:	
;287:	viewangles[YAW]   = 180 - 30;
ADDRLP4 4+4
CNSTF4 1125515264
ASGNF4
line 288
;288:	viewangles[PITCH] = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 289
;289:	viewangles[ROLL]  = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 291
;290:
;291:	UI_PlayerInfo_SetModel( &s_playersettings.playerinfo, UI_Cvar_VariableString( "model" ) );
ADDRGP4 $126
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+1444
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 292
;292:	UI_PlayerInfo_SetInfo( &s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 s_playersettings+1444
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 295
;293:
;294:	// handicap
;295:	h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $142
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 296
;296:	s_playersettings.handicap.curvalue = 20 - h / 5;
ADDRGP4 s_playersettings+956+64
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 297
;297:}
LABELV $152
endproc PlayerSettings_SetMenuItems 44 28
proc PlayerSettings_MenuEvent 12 8
line 305
;298:
;299:
;300:/*
;301:=================
;302:PlayerSettings_MenuEvent
;303:=================
;304:*/
;305:static void PlayerSettings_MenuEvent( void* ptr, int event ) {
line 306
;306:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $172
line 307
;307:		return;
ADDRGP4 $171
JUMPV
LABELV $172
line 310
;308:	}
;309:
;310:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $177
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $182
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $181
ADDRGP4 $174
JUMPV
LABELV $177
line 312
;311:	case ID_HANDICAP:
;312:		trap_Cvar_Set( "handicap", va( "%i", 100 - 25 * s_playersettings.handicap.curvalue ) );
ADDRGP4 $178
ARGP4
CNSTI4 100
CNSTI4 25
ADDRGP4 s_playersettings+956+64
INDIRI4
MULI4
SUBI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $142
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 313
;313:		break;
ADDRGP4 $175
JUMPV
LABELV $181
line 316
;314:
;315:	case ID_MODEL:
;316:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 317
;317:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 318
;318:		break;
ADDRGP4 $175
JUMPV
LABELV $182
line 321
;319:
;320:	case ID_BACK:
;321:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 322
;322:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 323
;323:		break;
LABELV $174
LABELV $175
line 325
;324:	}
;325:}
LABELV $171
endproc PlayerSettings_MenuEvent 12 8
proc PlayerSettings_MenuInit 4 12
line 333
;326:
;327:
;328:/*
;329:=================
;330:PlayerSettings_MenuInit
;331:=================
;332:*/
;333:static void PlayerSettings_MenuInit( void ) {
line 336
;334:	int		y;
;335:
;336:	memset(&s_playersettings,0,sizeof(playersettings_t));
ADDRGP4 s_playersettings
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2624
ARGI4
ADDRGP4 memset
CALLP4
pop
line 338
;337:
;338:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 340
;339:
;340:	s_playersettings.menu.key        = PlayerSettings_MenuKey;
ADDRGP4 s_playersettings+272
ADDRGP4 PlayerSettings_MenuKey
ASGNP4
line 341
;341:	s_playersettings.menu.wrapAround = qtrue;
ADDRGP4 s_playersettings+276
CNSTI4 1
ASGNI4
line 342
;342:	s_playersettings.menu.fullscreen = qtrue;
ADDRGP4 s_playersettings+280
CNSTI4 1
ASGNI4
line 344
;343:
;344:	s_playersettings.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_playersettings+288
CNSTI4 10
ASGNI4
line 345
;345:	s_playersettings.banner.generic.x     = 320;
ADDRGP4 s_playersettings+288+12
CNSTI4 320
ASGNI4
line 346
;346:	s_playersettings.banner.generic.y     = 16;
ADDRGP4 s_playersettings+288+16
CNSTI4 16
ASGNI4
line 347
;347:	s_playersettings.banner.string        = "PLAYER SETTINGS";
ADDRGP4 s_playersettings+288+60
ADDRGP4 $194
ASGNP4
line 348
;348:	s_playersettings.banner.color         = color_white;
ADDRGP4 s_playersettings+288+68
ADDRGP4 color_white
ASGNP4
line 349
;349:	s_playersettings.banner.style         = UI_CENTER;
ADDRGP4 s_playersettings+288+64
CNSTI4 1
ASGNI4
line 351
;350:
;351:	s_playersettings.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+360
CNSTI4 6
ASGNI4
line 352
;352:	s_playersettings.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_playersettings+360+4
ADDRGP4 $202
ASGNP4
line 353
;353:	s_playersettings.framel.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+360+44
CNSTU4 16388
ASGNU4
line 354
;354:	s_playersettings.framel.generic.x     = 0;
ADDRGP4 s_playersettings+360+12
CNSTI4 0
ASGNI4
line 355
;355:	s_playersettings.framel.generic.y     = 0;
ADDRGP4 s_playersettings+360+16
CNSTI4 0
ASGNI4
line 356
;356:	s_playersettings.framel.width         = 800;
ADDRGP4 s_playersettings+360+76
CNSTI4 800
ASGNI4
line 357
;357:	s_playersettings.framel.height        = 600;
ADDRGP4 s_playersettings+360+80
CNSTI4 600
ASGNI4
line 359
;358:
;359:	s_playersettings.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+448
CNSTI4 6
ASGNI4
line 360
;360:	s_playersettings.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_playersettings+448+4
ADDRGP4 $216
ASGNP4
line 361
;361:	s_playersettings.framer.generic.flags = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_playersettings+448+44
CNSTU4 16388
ASGNU4
line 362
;362:	s_playersettings.framer.generic.x     = 376;
ADDRGP4 s_playersettings+448+12
CNSTI4 376
ASGNI4
line 363
;363:	s_playersettings.framer.generic.y     = 76;
ADDRGP4 s_playersettings+448+16
CNSTI4 76
ASGNI4
line 364
;364:	s_playersettings.framer.width         = 256;
ADDRGP4 s_playersettings+448+76
CNSTI4 256
ASGNI4
line 365
;365:	s_playersettings.framer.height        = 334;
ADDRGP4 s_playersettings+448+80
CNSTI4 334
ASGNI4
line 367
;366:
;367:	y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 368
;368:	s_playersettings.name.generic.type			= MTYPE_FIELD;
ADDRGP4 s_playersettings+624
CNSTI4 4
ASGNI4
line 369
;369:	s_playersettings.name.generic.flags			= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+624+44
CNSTU4 32768
ASGNU4
line 370
;370:	s_playersettings.name.generic.ownerdraw		= PlayerSettings_DrawName;
ADDRGP4 s_playersettings+624+56
ADDRGP4 PlayerSettings_DrawName
ASGNP4
line 371
;371:	s_playersettings.name.field.widthInChars	= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+624+60+8
CNSTI4 20
ASGNI4
line 372
;372:	s_playersettings.name.field.maxchars		= MAX_NAMELENGTH;
ADDRGP4 s_playersettings+624+60+268
CNSTI4 20
ASGNI4
line 373
;373:	s_playersettings.name.generic.x				= 192;
ADDRGP4 s_playersettings+624+12
CNSTI4 192
ASGNI4
line 374
;374:	s_playersettings.name.generic.y				= y;
ADDRGP4 s_playersettings+624+16
ADDRLP4 0
INDIRI4
ASGNI4
line 375
;375:	s_playersettings.name.generic.left			= 192 - 8;
ADDRGP4 s_playersettings+624+20
CNSTI4 184
ASGNI4
line 376
;376:	s_playersettings.name.generic.top			= y - 8;
ADDRGP4 s_playersettings+624+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 377
;377:	s_playersettings.name.generic.right			= 192 + 200;
ADDRGP4 s_playersettings+624+28
CNSTI4 392
ASGNI4
line 378
;378:	s_playersettings.name.generic.bottom		= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+624+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 380
;379:
;380:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 381
;381:	s_playersettings.handicap.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+956
CNSTI4 3
ASGNI4
line 382
;382:	s_playersettings.handicap.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+956+44
CNSTU4 32768
ASGNU4
line 383
;383:	s_playersettings.handicap.generic.id		= ID_HANDICAP;
ADDRGP4 s_playersettings+956+8
CNSTI4 11
ASGNI4
line 384
;384:	s_playersettings.handicap.generic.ownerdraw	= PlayerSettings_DrawHandicap;
ADDRGP4 s_playersettings+956+56
ADDRGP4 PlayerSettings_DrawHandicap
ASGNP4
line 385
;385:	s_playersettings.handicap.generic.x			= 192;
ADDRGP4 s_playersettings+956+12
CNSTI4 192
ASGNI4
line 386
;386:	s_playersettings.handicap.generic.y			= y;
ADDRGP4 s_playersettings+956+16
ADDRLP4 0
INDIRI4
ASGNI4
line 387
;387:	s_playersettings.handicap.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+956+20
CNSTI4 184
ASGNI4
line 388
;388:	s_playersettings.handicap.generic.top		= y - 8;
ADDRGP4 s_playersettings+956+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 389
;389:	s_playersettings.handicap.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+956+28
CNSTI4 392
ASGNI4
line 390
;390:	s_playersettings.handicap.generic.bottom	= y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+956+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 391
;391:	s_playersettings.handicap.numitems			= 20;
ADDRGP4 s_playersettings+956+68
CNSTI4 20
ASGNI4
line 393
;392:
;393:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 394
;394:	s_playersettings.effects.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1052
CNSTI4 3
ASGNI4
line 395
;395:	s_playersettings.effects.generic.flags		= QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1052+44
CNSTU4 32768
ASGNU4
line 396
;396:	s_playersettings.effects.generic.id			= ID_EFFECTS;
ADDRGP4 s_playersettings+1052+8
CNSTI4 12
ASGNI4
line 397
;397:	s_playersettings.effects.generic.ownerdraw	= PlayerSettings_DrawEffects;
ADDRGP4 s_playersettings+1052+56
ADDRGP4 PlayerSettings_DrawEffects
ASGNP4
line 398
;398:	s_playersettings.effects.generic.x			= 192;
ADDRGP4 s_playersettings+1052+12
CNSTI4 192
ASGNI4
line 399
;399:	s_playersettings.effects.generic.y			= y;
ADDRGP4 s_playersettings+1052+16
ADDRLP4 0
INDIRI4
ASGNI4
line 400
;400:	s_playersettings.effects.generic.left		= 192 - 8;
ADDRGP4 s_playersettings+1052+20
CNSTI4 184
ASGNI4
line 401
;401:	s_playersettings.effects.generic.top		= y - 8;
ADDRGP4 s_playersettings+1052+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 402
;402:	s_playersettings.effects.generic.right		= 192 + 200;
ADDRGP4 s_playersettings+1052+28
CNSTI4 392
ASGNI4
line 403
;403:	s_playersettings.effects.generic.bottom		= y + 2* PROP_HEIGHT;
ADDRGP4 s_playersettings+1052+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 404
;404:	s_playersettings.effects.numitems			= 7;
ADDRGP4 s_playersettings+1052+68
CNSTI4 7
ASGNI4
line 406
;405:
;406:	s_playersettings.model.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1236
CNSTI4 6
ASGNI4
line 407
;407:	s_playersettings.model.generic.name			= ART_MODEL0;
ADDRGP4 s_playersettings+1236+4
ADDRGP4 $295
ASGNP4
line 408
;408:	s_playersettings.model.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1236+44
CNSTU4 272
ASGNU4
line 409
;409:	s_playersettings.model.generic.id			= ID_MODEL;
ADDRGP4 s_playersettings+1236+8
CNSTI4 14
ASGNI4
line 410
;410:	s_playersettings.model.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1236+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 411
;411:	s_playersettings.model.generic.x			= 640;
ADDRGP4 s_playersettings+1236+12
CNSTI4 640
ASGNI4
line 412
;412:	s_playersettings.model.generic.y			= 480-64;
ADDRGP4 s_playersettings+1236+16
CNSTI4 416
ASGNI4
line 413
;413:	s_playersettings.model.width				= 128;
ADDRGP4 s_playersettings+1236+76
CNSTI4 128
ASGNI4
line 414
;414:	s_playersettings.model.height				= 64;
ADDRGP4 s_playersettings+1236+80
CNSTI4 64
ASGNI4
line 415
;415:	s_playersettings.model.focuspic				= ART_MODEL1;
ADDRGP4 s_playersettings+1236+60
ADDRGP4 $312
ASGNP4
line 417
;416:
;417:	s_playersettings.player.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+536
CNSTI4 6
ASGNI4
line 418
;418:	s_playersettings.player.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_playersettings+536+44
CNSTU4 16384
ASGNU4
line 419
;419:	s_playersettings.player.generic.ownerdraw	= PlayerSettings_DrawPlayer;
ADDRGP4 s_playersettings+536+56
ADDRGP4 PlayerSettings_DrawPlayer
ASGNP4
line 420
;420:	s_playersettings.player.generic.x			= 400;
ADDRGP4 s_playersettings+536+12
CNSTI4 400
ASGNI4
line 421
;421:	s_playersettings.player.generic.y			= -40;
ADDRGP4 s_playersettings+536+16
CNSTI4 -40
ASGNI4
line 422
;422:	s_playersettings.player.width				= 32*10;
ADDRGP4 s_playersettings+536+76
CNSTI4 320
ASGNI4
line 423
;423:	s_playersettings.player.height				= 56*10;
ADDRGP4 s_playersettings+536+80
CNSTI4 560
ASGNI4
line 425
;424:
;425:	s_playersettings.back.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1148
CNSTI4 6
ASGNI4
line 426
;426:	s_playersettings.back.generic.name			= ART_BACK0;
ADDRGP4 s_playersettings+1148+4
ADDRGP4 $329
ASGNP4
line 427
;427:	s_playersettings.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1148+44
CNSTU4 260
ASGNU4
line 428
;428:	s_playersettings.back.generic.id			= ID_BACK;
ADDRGP4 s_playersettings+1148+8
CNSTI4 13
ASGNI4
line 429
;429:	s_playersettings.back.generic.callback		= PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1148+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 430
;430:	s_playersettings.back.generic.x				= 0;
ADDRGP4 s_playersettings+1148+12
CNSTI4 0
ASGNI4
line 431
;431:	s_playersettings.back.generic.y				= 480-64;
ADDRGP4 s_playersettings+1148+16
CNSTI4 416
ASGNI4
line 432
;432:	s_playersettings.back.width					= 128;
ADDRGP4 s_playersettings+1148+76
CNSTI4 128
ASGNI4
line 433
;433:	s_playersettings.back.height				= 64;
ADDRGP4 s_playersettings+1148+80
CNSTI4 64
ASGNI4
line 434
;434:	s_playersettings.back.focuspic				= ART_BACK1;
ADDRGP4 s_playersettings+1148+60
ADDRGP4 $346
ASGNP4
line 436
;435:
;436:	s_playersettings.item_null.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_playersettings+1324
CNSTI4 6
ASGNI4
line 437
;437:	s_playersettings.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_playersettings+1324+44
CNSTU4 1050628
ASGNU4
line 438
;438:	s_playersettings.item_null.generic.x		= 0;
ADDRGP4 s_playersettings+1324+12
CNSTI4 0
ASGNI4
line 439
;439:	s_playersettings.item_null.generic.y		= 0;
ADDRGP4 s_playersettings+1324+16
CNSTI4 0
ASGNI4
line 440
;440:	s_playersettings.item_null.width			= 640;
ADDRGP4 s_playersettings+1324+76
CNSTI4 640
ASGNI4
line 441
;441:	s_playersettings.item_null.height			= 480;
ADDRGP4 s_playersettings+1324+80
CNSTI4 480
ASGNI4
line 443
;442:
;443:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.banner );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 444
;444:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.framel );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 447
;445:	//Menu_AddItem( &s_playersettings.menu, &s_playersettings.framer );
;446:
;447:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.name );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 448
;448:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.handicap );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+956
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 449
;449:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.effects );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1052
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 450
;450:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.model );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1236
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 451
;451:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.back );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1148
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 453
;452:
;453:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.player );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 455
;454:
;455:	Menu_AddItem( &s_playersettings.menu, &s_playersettings.item_null );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1324
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 457
;456:
;457:	PlayerSettings_SetMenuItems();
ADDRGP4 PlayerSettings_SetMenuItems
CALLV
pop
line 458
;458:}
LABELV $183
endproc PlayerSettings_MenuInit 4 12
export PlayerSettings_Cache
proc PlayerSettings_Cache 32 4
line 466
;459:
;460:
;461:/*
;462:=================
;463:PlayerSettings_Cache
;464:=================
;465:*/
;466:void PlayerSettings_Cache( void ) {
line 467
;467:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $202
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 468
;468:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $216
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 469
;469:	trap_R_RegisterShaderNoMip( ART_MODEL0 );
ADDRGP4 $295
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 470
;470:	trap_R_RegisterShaderNoMip( ART_MODEL1 );
ADDRGP4 $312
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 471
;471:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $329
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 472
;472:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $346
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 474
;473:
;474:	s_playersettings.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $369
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1412
ADDRLP4 0
INDIRI4
ASGNI4
line 475
;475:	s_playersettings.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $371
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416
ADDRLP4 4
INDIRI4
ASGNI4
line 476
;476:	s_playersettings.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $374
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416+4
ADDRLP4 8
INDIRI4
ASGNI4
line 477
;477:	s_playersettings.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $377
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416+8
ADDRLP4 12
INDIRI4
ASGNI4
line 478
;478:	s_playersettings.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $380
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416+12
ADDRLP4 16
INDIRI4
ASGNI4
line 479
;479:	s_playersettings.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $383
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416+16
ADDRLP4 20
INDIRI4
ASGNI4
line 480
;480:	s_playersettings.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $386
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416+20
ADDRLP4 24
INDIRI4
ASGNI4
line 481
;481:	s_playersettings.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $389
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1416+24
ADDRLP4 28
INDIRI4
ASGNI4
line 482
;482:}
LABELV $367
endproc PlayerSettings_Cache 32 4
export UI_PlayerSettingsMenu
proc UI_PlayerSettingsMenu 0 4
line 490
;483:
;484:
;485:/*
;486:=================
;487:UI_PlayerSettingsMenu
;488:=================
;489:*/
;490:void UI_PlayerSettingsMenu( void ) {
line 491
;491:	PlayerSettings_MenuInit();
ADDRGP4 PlayerSettings_MenuInit
CALLV
pop
line 492
;492:	UI_PushMenu( &s_playersettings.menu );
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 493
;493:}
LABELV $390
endproc UI_PlayerSettingsMenu 0 4
bss
align 4
LABELV s_playersettings
skip 2624
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
LABELV $389
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $386
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
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $383
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
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $380
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
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $377
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
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $374
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
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $371
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
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $369
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $346
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
LABELV $329
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
LABELV $312
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $295
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $216
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
LABELV $202
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
LABELV $194
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $178
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $142
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $138
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $122
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $96
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $89
byte 1 53
byte 1 0
align 1
LABELV $88
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $86
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $85
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $84
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $83
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $82
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $81
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $80
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $79
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $78
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $77
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $76
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $75
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $74
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $73
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $72
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $71
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $70
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
