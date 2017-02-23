data
align 4
LABELV teamoverlay_names
address $70
address $71
address $72
address $73
byte 4 0
code
proc Preferences_SetMenuItems 92 12
file "../ui_preferences.c"
line 74
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:/*
;4:=======================================================================
;5:
;6:GAME OPTIONS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ART_FRAMEL				"menu/art/frame2_l"
;16:#define ART_FRAMER				"menu/art/frame1_r"
;17:#define ART_BACK0				"menu/art/back_0"
;18:#define ART_BACK1				"menu/art/back_1"
;19:
;20:#define PREFERENCES_X_POS		360
;21:
;22:#define ID_CROSSHAIR			127
;23:#define ID_SIMPLEITEMS			128
;24:#define ID_HIGHQUALITYSKY		129
;25:#define ID_EJECTINGBRASS		130
;26:#define ID_WALLMARKS			131
;27:#define ID_DYNAMICLIGHTS		132
;28:#define ID_IDENTIFYTARGET		133
;29:#define ID_SYNCEVERYFRAME		134
;30:#define ID_FORCEMODEL			135
;31:#define ID_DRAWTEAMOVERLAY		136
;32:#define ID_ALLOWDOWNLOAD			137
;33:#define ID_ALLOWVOIP			138
;34:#define ID_BACK					139
;35:
;36:#define	NUM_CROSSHAIRS			10
;37:
;38:
;39:typedef struct {
;40:	menuframework_s		menu;
;41:
;42:	menutext_s			banner;
;43:	menubitmap_s		framel;
;44:	menubitmap_s		framer;
;45:
;46:	menulist_s			crosshair;
;47:	menuradiobutton_s	simpleitems;
;48:	menuradiobutton_s	brass;
;49:	menuradiobutton_s	wallmarks;
;50:	menuradiobutton_s	dynamiclights;
;51:	menuradiobutton_s	identifytarget;
;52:	menuradiobutton_s	highqualitysky;
;53:	menuradiobutton_s	synceveryframe;
;54:	menuradiobutton_s	forcemodel;
;55:	menulist_s			drawteamoverlay;
;56:	menuradiobutton_s	allowdownload;
;57:	menuradiobutton_s	allowvoip;
;58:	menubitmap_s		back;
;59:
;60:	qhandle_t			crosshairShader[NUM_CROSSHAIRS];
;61:} preferences_t;
;62:
;63:static preferences_t s_preferences;
;64:
;65:static const char *teamoverlay_names[] =
;66:{
;67:	"off",
;68:	"upper right",
;69:	"lower right",
;70:	"lower left",
;71:	0
;72:};
;73:
;74:static void Preferences_SetMenuItems( void ) {
line 75
;75:	s_preferences.crosshair.curvalue		= (int)trap_Cvar_VariableValue( "cg_drawCrosshair" ) % NUM_CROSSHAIRS;
ADDRGP4 $77
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+536+64
ADDRLP4 0
INDIRF4
CVFI4 4
CNSTI4 10
MODI4
ASGNI4
line 76
;76:	s_preferences.simpleitems.curvalue		= trap_Cvar_VariableValue( "cg_simpleItems" ) != 0;
ADDRGP4 $80
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $82
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $82
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $83
ADDRGP4 s_preferences+632+60
ADDRLP4 4
INDIRI4
ASGNI4
line 77
;77:	s_preferences.brass.curvalue			= trap_Cvar_VariableValue( "cg_brassTime" ) != 0;
ADDRGP4 $86
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $88
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $88
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $89
ADDRGP4 s_preferences+696+60
ADDRLP4 12
INDIRI4
ASGNI4
line 78
;78:	s_preferences.wallmarks.curvalue		= trap_Cvar_VariableValue( "cg_marks" ) != 0;
ADDRGP4 $92
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $94
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $94
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $95
ADDRGP4 s_preferences+760+60
ADDRLP4 20
INDIRI4
ASGNI4
line 79
;79:	s_preferences.identifytarget.curvalue	= trap_Cvar_VariableValue( "cg_drawCrosshairNames" ) != 0;
ADDRGP4 $98
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 0
EQF4 $100
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $100
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $101
ADDRGP4 s_preferences+888+60
ADDRLP4 28
INDIRI4
ASGNI4
line 80
;80:	s_preferences.dynamiclights.curvalue	= trap_Cvar_VariableValue( "r_dynamiclight" ) != 0;
ADDRGP4 $104
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
EQF4 $106
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $106
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $107
ADDRGP4 s_preferences+824+60
ADDRLP4 36
INDIRI4
ASGNI4
line 81
;81:	s_preferences.highqualitysky.curvalue	= trap_Cvar_VariableValue ( "r_fastsky" ) == 0;
ADDRGP4 $110
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
INDIRF4
CNSTF4 0
NEF4 $112
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $112
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $113
ADDRGP4 s_preferences+952+60
ADDRLP4 44
INDIRI4
ASGNI4
line 82
;82:	s_preferences.synceveryframe.curvalue	= trap_Cvar_VariableValue( "r_finish" ) != 0;
ADDRGP4 $116
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $118
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $118
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $119
ADDRGP4 s_preferences+1016+60
ADDRLP4 52
INDIRI4
ASGNI4
line 83
;83:	s_preferences.forcemodel.curvalue		= trap_Cvar_VariableValue( "cg_forcemodel" ) != 0;
ADDRGP4 $122
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 64
INDIRF4
CNSTF4 0
EQF4 $124
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $125
ADDRGP4 s_preferences+1080+60
ADDRLP4 60
INDIRI4
ASGNI4
line 84
;84:	s_preferences.drawteamoverlay.curvalue	= Com_Clamp( 0, 3, trap_Cvar_VariableValue( "cg_drawTeamOverlay" ) );
ADDRGP4 $128
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_preferences+1144+64
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 85
;85:	s_preferences.allowdownload.curvalue	= trap_Cvar_VariableValue( "cl_allowDownload" ) != 0;
ADDRGP4 $131
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
INDIRF4
CNSTF4 0
EQF4 $133
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $133
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $134
ADDRGP4 s_preferences+1240+60
ADDRLP4 76
INDIRI4
ASGNI4
line 86
;86:	s_preferences.allowvoip.curvalue	= trap_Cvar_VariableValue( "cl_voip" ) != 0;
ADDRGP4 $137
ARGP4
ADDRLP4 88
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 88
INDIRF4
CNSTF4 0
EQF4 $139
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 84
CNSTI4 0
ASGNI4
LABELV $140
ADDRGP4 s_preferences+1304+60
ADDRLP4 84
INDIRI4
ASGNI4
line 87
;87:}
LABELV $74
endproc Preferences_SetMenuItems 92 12
proc Preferences_Event 16 8
line 90
;88:
;89:
;90:static void Preferences_Event( void* ptr, int notification ) {
line 91
;91:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $142
line 92
;92:		return;
ADDRGP4 $141
JUMPV
LABELV $142
line 95
;93:	}
;94:
;95:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 127
LTI4 $144
ADDRLP4 0
INDIRI4
CNSTI4 139
GTI4 $144
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $203-508
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $203
address $147
address $158
address $161
address $167
address $172
address $175
address $178
address $181
address $184
address $187
address $190
address $196
address $202
code
LABELV $147
line 97
;96:	case ID_CROSSHAIR:
;97:		s_preferences.crosshair.curvalue++;
ADDRLP4 8
ADDRGP4 s_preferences+536+64
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 98
;98:		if( s_preferences.crosshair.curvalue == NUM_CROSSHAIRS ) {
ADDRGP4 s_preferences+536+64
INDIRI4
CNSTI4 10
NEI4 $150
line 99
;99:			s_preferences.crosshair.curvalue = 0;
ADDRGP4 s_preferences+536+64
CNSTI4 0
ASGNI4
line 100
;100:		}
LABELV $150
line 101
;101:		trap_Cvar_SetValue( "cg_drawCrosshair", s_preferences.crosshair.curvalue );
ADDRGP4 $77
ARGP4
ADDRGP4 s_preferences+536+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 102
;102:		break;
ADDRGP4 $145
JUMPV
LABELV $158
line 105
;103:
;104:	case ID_SIMPLEITEMS:
;105:		trap_Cvar_SetValue( "cg_simpleItems", s_preferences.simpleitems.curvalue );
ADDRGP4 $80
ARGP4
ADDRGP4 s_preferences+632+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 106
;106:		break;
ADDRGP4 $145
JUMPV
LABELV $161
line 109
;107:
;108:	case ID_HIGHQUALITYSKY:
;109:		trap_Cvar_SetValue( "r_fastsky", !s_preferences.highqualitysky.curvalue );
ADDRGP4 $110
ARGP4
ADDRGP4 s_preferences+952+60
INDIRI4
CNSTI4 0
NEI4 $165
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $166
JUMPV
LABELV $165
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $166
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 110
;110:		break;
ADDRGP4 $145
JUMPV
LABELV $167
line 113
;111:
;112:	case ID_EJECTINGBRASS:
;113:		if ( s_preferences.brass.curvalue )
ADDRGP4 s_preferences+696+60
INDIRI4
CNSTI4 0
EQI4 $168
line 114
;114:			trap_Cvar_Reset( "cg_brassTime" );
ADDRGP4 $86
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
ADDRGP4 $145
JUMPV
LABELV $168
line 116
;115:		else
;116:			trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $86
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 117
;117:		break;
ADDRGP4 $145
JUMPV
LABELV $172
line 120
;118:
;119:	case ID_WALLMARKS:
;120:		trap_Cvar_SetValue( "cg_marks", s_preferences.wallmarks.curvalue );
ADDRGP4 $92
ARGP4
ADDRGP4 s_preferences+760+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 121
;121:		break;
ADDRGP4 $145
JUMPV
LABELV $175
line 124
;122:
;123:	case ID_DYNAMICLIGHTS:
;124:		trap_Cvar_SetValue( "r_dynamiclight", s_preferences.dynamiclights.curvalue );
ADDRGP4 $104
ARGP4
ADDRGP4 s_preferences+824+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 125
;125:		break;		
ADDRGP4 $145
JUMPV
LABELV $178
line 128
;126:
;127:	case ID_IDENTIFYTARGET:
;128:		trap_Cvar_SetValue( "cg_drawCrosshairNames", s_preferences.identifytarget.curvalue );
ADDRGP4 $98
ARGP4
ADDRGP4 s_preferences+888+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 129
;129:		break;
ADDRGP4 $145
JUMPV
LABELV $181
line 132
;130:
;131:	case ID_SYNCEVERYFRAME:
;132:		trap_Cvar_SetValue( "r_finish", s_preferences.synceveryframe.curvalue );
ADDRGP4 $116
ARGP4
ADDRGP4 s_preferences+1016+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 133
;133:		break;
ADDRGP4 $145
JUMPV
LABELV $184
line 136
;134:
;135:	case ID_FORCEMODEL:
;136:		trap_Cvar_SetValue( "cg_forcemodel", s_preferences.forcemodel.curvalue );
ADDRGP4 $122
ARGP4
ADDRGP4 s_preferences+1080+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 137
;137:		break;
ADDRGP4 $145
JUMPV
LABELV $187
line 140
;138:
;139:	case ID_DRAWTEAMOVERLAY:
;140:		trap_Cvar_SetValue( "cg_drawTeamOverlay", s_preferences.drawteamoverlay.curvalue );
ADDRGP4 $128
ARGP4
ADDRGP4 s_preferences+1144+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 141
;141:		break;
ADDRGP4 $145
JUMPV
LABELV $190
line 144
;142:
;143:	case ID_ALLOWDOWNLOAD:
;144:		trap_Cvar_SetValue( "cl_allowDownload", s_preferences.allowdownload.curvalue );
ADDRGP4 $131
ARGP4
ADDRGP4 s_preferences+1240+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 145
;145:		trap_Cvar_SetValue( "sv_allowDownload", s_preferences.allowdownload.curvalue );
ADDRGP4 $193
ARGP4
ADDRGP4 s_preferences+1240+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 146
;146:		break;
ADDRGP4 $145
JUMPV
LABELV $196
line 149
;147:
;148:	case ID_ALLOWVOIP:
;149:		trap_Cvar_SetValue( "cl_voip", s_preferences.allowvoip.curvalue );
ADDRGP4 $137
ARGP4
ADDRGP4 s_preferences+1304+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 150
;150:		trap_Cvar_SetValue( "sv_voip", s_preferences.allowvoip.curvalue );
ADDRGP4 $199
ARGP4
ADDRGP4 s_preferences+1304+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 151
;151:		break;
ADDRGP4 $145
JUMPV
LABELV $202
line 154
;152:
;153:	case ID_BACK:
;154:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 155
;155:		break;
LABELV $144
LABELV $145
line 157
;156:	}
;157:}
LABELV $141
endproc Preferences_Event 16 8
proc Crosshair_Draw 48 20
line 165
;158:
;159:
;160:/*
;161:=================
;162:Crosshair_Draw
;163:=================
;164:*/
;165:static void Crosshair_Draw( void *self ) {
line 172
;166:	menulist_s	*s;
;167:	float		*color;
;168:	int			x, y;
;169:	int			style;
;170:	qboolean	focus;
;171:
;172:	s = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 173
;173:	x = s->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 174
;174:	y =	s->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 176
;175:
;176:	style = UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 177
;177:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
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
NEI4 $207
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $208
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 179
;178:
;179:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $209
line 180
;180:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $210
JUMPV
LABELV $209
line 181
;181:	else if ( focus )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $211
line 182
;182:	{
line 183
;183:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 184
;184:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 185
;185:	}
ADDRGP4 $212
JUMPV
LABELV $211
line 186
;186:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $213
line 187
;187:	{
line 188
;188:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 189
;189:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 190
;190:	}
ADDRGP4 $214
JUMPV
LABELV $213
line 192
;191:	else
;192:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
LABELV $214
LABELV $212
LABELV $210
line 194
;193:
;194:	if ( focus )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $215
line 195
;195:	{
line 197
;196:		// draw cursor
;197:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 198
;198:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 199
;199:	}
LABELV $215
line 201
;200:
;201:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 4
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 202
;202:	if( !s->curvalue ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
line 203
;203:		return;
ADDRGP4 $205
JUMPV
LABELV $217
line 205
;204:	}
;205:	UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y - 4, 24, 24, s_preferences.crosshairShader[s->curvalue] );
ADDRLP4 4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTF4 1103101952
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+1456
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 206
;206:}
LABELV $205
endproc Crosshair_Draw 48 20
proc Preferences_MenuInit 8 12
line 209
;207:
;208:
;209:static void Preferences_MenuInit( void ) {
line 212
;210:	int				y;
;211:
;212:	memset( &s_preferences, 0 ,sizeof(preferences_t) );
ADDRGP4 s_preferences
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1496
ARGI4
ADDRGP4 memset
CALLP4
pop
line 214
;213:
;214:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 216
;215:
;216:	s_preferences.menu.wrapAround = qtrue;
ADDRGP4 s_preferences+276
CNSTI4 1
ASGNI4
line 217
;217:	s_preferences.menu.fullscreen = qtrue;
ADDRGP4 s_preferences+280
CNSTI4 1
ASGNI4
line 219
;218:
;219:	s_preferences.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_preferences+288
CNSTI4 10
ASGNI4
line 220
;220:	s_preferences.banner.generic.x	   = 320;
ADDRGP4 s_preferences+288+12
CNSTI4 320
ASGNI4
line 221
;221:	s_preferences.banner.generic.y	   = 16;
ADDRGP4 s_preferences+288+16
CNSTI4 16
ASGNI4
line 222
;222:	s_preferences.banner.string		   = "GAME OPTIONS";
ADDRGP4 s_preferences+288+60
ADDRGP4 $230
ASGNP4
line 223
;223:	s_preferences.banner.color         = color_white;
ADDRGP4 s_preferences+288+68
ADDRGP4 color_white
ASGNP4
line 224
;224:	s_preferences.banner.style         = UI_CENTER;
ADDRGP4 s_preferences+288+64
CNSTI4 1
ASGNI4
line 226
;225:
;226:	s_preferences.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_preferences+360
CNSTI4 6
ASGNI4
line 227
;227:	s_preferences.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_preferences+360+4
ADDRGP4 $238
ASGNP4
line 228
;228:	s_preferences.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_preferences+360+44
CNSTU4 16384
ASGNU4
line 229
;229:	s_preferences.framel.generic.x	   = 0;
ADDRGP4 s_preferences+360+12
CNSTI4 0
ASGNI4
line 230
;230:	s_preferences.framel.generic.y	   = 78;
ADDRGP4 s_preferences+360+16
CNSTI4 78
ASGNI4
line 231
;231:	s_preferences.framel.width  	   = 256;
ADDRGP4 s_preferences+360+76
CNSTI4 256
ASGNI4
line 232
;232:	s_preferences.framel.height  	   = 329;
ADDRGP4 s_preferences+360+80
CNSTI4 329
ASGNI4
line 234
;233:
;234:	s_preferences.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_preferences+448
CNSTI4 6
ASGNI4
line 235
;235:	s_preferences.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_preferences+448+4
ADDRGP4 $252
ASGNP4
line 236
;236:	s_preferences.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_preferences+448+44
CNSTU4 16384
ASGNU4
line 237
;237:	s_preferences.framer.generic.x	   = 0;
ADDRGP4 s_preferences+448+12
CNSTI4 0
ASGNI4
line 238
;238:	s_preferences.framer.generic.y	   = 0;
ADDRGP4 s_preferences+448+16
CNSTI4 0
ASGNI4
line 239
;239:	s_preferences.framer.width  	   = 1024;
ADDRGP4 s_preferences+448+76
CNSTI4 1024
ASGNI4
line 240
;240:	s_preferences.framer.height  	   = 768;
ADDRGP4 s_preferences+448+80
CNSTI4 768
ASGNI4
line 242
;241:
;242:	y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 243
;243:	s_preferences.crosshair.generic.type		= MTYPE_TEXT;
ADDRGP4 s_preferences+536
CNSTI4 7
ASGNI4
line 244
;244:	s_preferences.crosshair.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+536+44
CNSTU4 98562
ASGNU4
line 245
;245:	s_preferences.crosshair.generic.x			= PREFERENCES_X_POS;
ADDRGP4 s_preferences+536+12
CNSTI4 360
ASGNI4
line 246
;246:	s_preferences.crosshair.generic.y			= y;
ADDRGP4 s_preferences+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 247
;247:	s_preferences.crosshair.generic.name		= "Crosshair:";
ADDRGP4 s_preferences+536+4
ADDRGP4 $272
ASGNP4
line 248
;248:	s_preferences.crosshair.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+536+48
ADDRGP4 Preferences_Event
ASGNP4
line 249
;249:	s_preferences.crosshair.generic.ownerdraw	= Crosshair_Draw;
ADDRGP4 s_preferences+536+56
ADDRGP4 Crosshair_Draw
ASGNP4
line 250
;250:	s_preferences.crosshair.generic.id			= ID_CROSSHAIR;
ADDRGP4 s_preferences+536+8
CNSTI4 127
ASGNI4
line 251
;251:	s_preferences.crosshair.generic.top			= y - 4;
ADDRGP4 s_preferences+536+24
ADDRLP4 0
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 252
;252:	s_preferences.crosshair.generic.bottom		= y + 20;
ADDRGP4 s_preferences+536+32
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 253
;253:	s_preferences.crosshair.generic.left		= PREFERENCES_X_POS - ( ( strlen(s_preferences.crosshair.generic.name) + 1 ) * SMALLCHAR_WIDTH );
ADDRGP4 s_preferences+536+4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_preferences+536+20
CNSTI4 360
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
ADDI4
SUBI4
ASGNI4
line 254
;254:	s_preferences.crosshair.generic.right		= PREFERENCES_X_POS + 48;
ADDRGP4 s_preferences+536+28
CNSTI4 408
ASGNI4
line 256
;255:
;256:	y += BIGCHAR_HEIGHT+2+4;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 22
ADDI4
ASGNI4
line 257
;257:	s_preferences.simpleitems.generic.type        = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+632
CNSTI4 5
ASGNI4
line 258
;258:	s_preferences.simpleitems.generic.name	      = "Simple Items:";
ADDRGP4 s_preferences+632+4
ADDRGP4 $292
ASGNP4
line 259
;259:	s_preferences.simpleitems.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+632+44
CNSTU4 258
ASGNU4
line 260
;260:	s_preferences.simpleitems.generic.callback    = Preferences_Event;
ADDRGP4 s_preferences+632+48
ADDRGP4 Preferences_Event
ASGNP4
line 261
;261:	s_preferences.simpleitems.generic.id          = ID_SIMPLEITEMS;
ADDRGP4 s_preferences+632+8
CNSTI4 128
ASGNI4
line 262
;262:	s_preferences.simpleitems.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+632+12
CNSTI4 360
ASGNI4
line 263
;263:	s_preferences.simpleitems.generic.y	          = y;
ADDRGP4 s_preferences+632+16
ADDRLP4 0
INDIRI4
ASGNI4
line 265
;264:
;265:	y += BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 266
;266:	s_preferences.wallmarks.generic.type          = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+760
CNSTI4 5
ASGNI4
line 267
;267:	s_preferences.wallmarks.generic.name	      = "Marks on Walls:";
ADDRGP4 s_preferences+760+4
ADDRGP4 $306
ASGNP4
line 268
;268:	s_preferences.wallmarks.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+760+44
CNSTU4 258
ASGNU4
line 269
;269:	s_preferences.wallmarks.generic.callback      = Preferences_Event;
ADDRGP4 s_preferences+760+48
ADDRGP4 Preferences_Event
ASGNP4
line 270
;270:	s_preferences.wallmarks.generic.id            = ID_WALLMARKS;
ADDRGP4 s_preferences+760+8
CNSTI4 131
ASGNI4
line 271
;271:	s_preferences.wallmarks.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+760+12
CNSTI4 360
ASGNI4
line 272
;272:	s_preferences.wallmarks.generic.y	          = y;
ADDRGP4 s_preferences+760+16
ADDRLP4 0
INDIRI4
ASGNI4
line 274
;273:
;274:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 275
;275:	s_preferences.brass.generic.type              = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+696
CNSTI4 5
ASGNI4
line 276
;276:	s_preferences.brass.generic.name	          = "Ejecting Brass:";
ADDRGP4 s_preferences+696+4
ADDRGP4 $320
ASGNP4
line 277
;277:	s_preferences.brass.generic.flags	          = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+696+44
CNSTU4 258
ASGNU4
line 278
;278:	s_preferences.brass.generic.callback          = Preferences_Event;
ADDRGP4 s_preferences+696+48
ADDRGP4 Preferences_Event
ASGNP4
line 279
;279:	s_preferences.brass.generic.id                = ID_EJECTINGBRASS;
ADDRGP4 s_preferences+696+8
CNSTI4 130
ASGNI4
line 280
;280:	s_preferences.brass.generic.x	              = PREFERENCES_X_POS;
ADDRGP4 s_preferences+696+12
CNSTI4 360
ASGNI4
line 281
;281:	s_preferences.brass.generic.y	              = y;
ADDRGP4 s_preferences+696+16
ADDRLP4 0
INDIRI4
ASGNI4
line 283
;282:
;283:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 284
;284:	s_preferences.dynamiclights.generic.type      = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+824
CNSTI4 5
ASGNI4
line 285
;285:	s_preferences.dynamiclights.generic.name	  = "Dynamic Lights:";
ADDRGP4 s_preferences+824+4
ADDRGP4 $334
ASGNP4
line 286
;286:	s_preferences.dynamiclights.generic.flags     = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+824+44
CNSTU4 258
ASGNU4
line 287
;287:	s_preferences.dynamiclights.generic.callback  = Preferences_Event;
ADDRGP4 s_preferences+824+48
ADDRGP4 Preferences_Event
ASGNP4
line 288
;288:	s_preferences.dynamiclights.generic.id        = ID_DYNAMICLIGHTS;
ADDRGP4 s_preferences+824+8
CNSTI4 132
ASGNI4
line 289
;289:	s_preferences.dynamiclights.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+824+12
CNSTI4 360
ASGNI4
line 290
;290:	s_preferences.dynamiclights.generic.y	      = y;
ADDRGP4 s_preferences+824+16
ADDRLP4 0
INDIRI4
ASGNI4
line 292
;291:
;292:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 293
;293:	s_preferences.identifytarget.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+888
CNSTI4 5
ASGNI4
line 294
;294:	s_preferences.identifytarget.generic.name	  = "Identify Target:";
ADDRGP4 s_preferences+888+4
ADDRGP4 $348
ASGNP4
line 295
;295:	s_preferences.identifytarget.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+888+44
CNSTU4 258
ASGNU4
line 296
;296:	s_preferences.identifytarget.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+888+48
ADDRGP4 Preferences_Event
ASGNP4
line 297
;297:	s_preferences.identifytarget.generic.id       = ID_IDENTIFYTARGET;
ADDRGP4 s_preferences+888+8
CNSTI4 133
ASGNI4
line 298
;298:	s_preferences.identifytarget.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+888+12
CNSTI4 360
ASGNI4
line 299
;299:	s_preferences.identifytarget.generic.y	      = y;
ADDRGP4 s_preferences+888+16
ADDRLP4 0
INDIRI4
ASGNI4
line 301
;300:
;301:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 302
;302:	s_preferences.highqualitysky.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+952
CNSTI4 5
ASGNI4
line 303
;303:	s_preferences.highqualitysky.generic.name	  = "High Quality Sky:";
ADDRGP4 s_preferences+952+4
ADDRGP4 $362
ASGNP4
line 304
;304:	s_preferences.highqualitysky.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+952+44
CNSTU4 258
ASGNU4
line 305
;305:	s_preferences.highqualitysky.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+952+48
ADDRGP4 Preferences_Event
ASGNP4
line 306
;306:	s_preferences.highqualitysky.generic.id       = ID_HIGHQUALITYSKY;
ADDRGP4 s_preferences+952+8
CNSTI4 129
ASGNI4
line 307
;307:	s_preferences.highqualitysky.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+952+12
CNSTI4 360
ASGNI4
line 308
;308:	s_preferences.highqualitysky.generic.y	      = y;
ADDRGP4 s_preferences+952+16
ADDRLP4 0
INDIRI4
ASGNI4
line 310
;309:
;310:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 311
;311:	s_preferences.synceveryframe.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1016
CNSTI4 5
ASGNI4
line 312
;312:	s_preferences.synceveryframe.generic.name	  = "Sync Every Frame:";
ADDRGP4 s_preferences+1016+4
ADDRGP4 $376
ASGNP4
line 313
;313:	s_preferences.synceveryframe.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1016+44
CNSTU4 258
ASGNU4
line 314
;314:	s_preferences.synceveryframe.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1016+48
ADDRGP4 Preferences_Event
ASGNP4
line 315
;315:	s_preferences.synceveryframe.generic.id       = ID_SYNCEVERYFRAME;
ADDRGP4 s_preferences+1016+8
CNSTI4 134
ASGNI4
line 316
;316:	s_preferences.synceveryframe.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1016+12
CNSTI4 360
ASGNI4
line 317
;317:	s_preferences.synceveryframe.generic.y	      = y;
ADDRGP4 s_preferences+1016+16
ADDRLP4 0
INDIRI4
ASGNI4
line 319
;318:
;319:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 320
;320:	s_preferences.forcemodel.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1080
CNSTI4 5
ASGNI4
line 321
;321:	s_preferences.forcemodel.generic.name	  = "Force Player Models:";
ADDRGP4 s_preferences+1080+4
ADDRGP4 $390
ASGNP4
line 322
;322:	s_preferences.forcemodel.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1080+44
CNSTU4 258
ASGNU4
line 323
;323:	s_preferences.forcemodel.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1080+48
ADDRGP4 Preferences_Event
ASGNP4
line 324
;324:	s_preferences.forcemodel.generic.id       = ID_FORCEMODEL;
ADDRGP4 s_preferences+1080+8
CNSTI4 135
ASGNI4
line 325
;325:	s_preferences.forcemodel.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1080+12
CNSTI4 360
ASGNI4
line 326
;326:	s_preferences.forcemodel.generic.y	      = y;
ADDRGP4 s_preferences+1080+16
ADDRLP4 0
INDIRI4
ASGNI4
line 328
;327:
;328:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 329
;329:	s_preferences.drawteamoverlay.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_preferences+1144
CNSTI4 3
ASGNI4
line 330
;330:	s_preferences.drawteamoverlay.generic.name	   = "Draw Team Overlay:";
ADDRGP4 s_preferences+1144+4
ADDRGP4 $404
ASGNP4
line 331
;331:	s_preferences.drawteamoverlay.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1144+44
CNSTU4 258
ASGNU4
line 332
;332:	s_preferences.drawteamoverlay.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1144+48
ADDRGP4 Preferences_Event
ASGNP4
line 333
;333:	s_preferences.drawteamoverlay.generic.id       = ID_DRAWTEAMOVERLAY;
ADDRGP4 s_preferences+1144+8
CNSTI4 136
ASGNI4
line 334
;334:	s_preferences.drawteamoverlay.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1144+12
CNSTI4 360
ASGNI4
line 335
;335:	s_preferences.drawteamoverlay.generic.y	       = y;
ADDRGP4 s_preferences+1144+16
ADDRLP4 0
INDIRI4
ASGNI4
line 336
;336:	s_preferences.drawteamoverlay.itemnames			= teamoverlay_names;
ADDRGP4 s_preferences+1144+76
ADDRGP4 teamoverlay_names
ASGNP4
line 338
;337:
;338:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 339
;339:	s_preferences.allowdownload.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1240
CNSTI4 5
ASGNI4
line 340
;340:	s_preferences.allowdownload.generic.name	   = "Automatic Downloading:";
ADDRGP4 s_preferences+1240+4
ADDRGP4 $420
ASGNP4
line 341
;341:	s_preferences.allowdownload.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1240+44
CNSTU4 258
ASGNU4
line 342
;342:	s_preferences.allowdownload.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1240+48
ADDRGP4 Preferences_Event
ASGNP4
line 343
;343:	s_preferences.allowdownload.generic.id       = ID_ALLOWDOWNLOAD;
ADDRGP4 s_preferences+1240+8
CNSTI4 137
ASGNI4
line 344
;344:	s_preferences.allowdownload.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1240+12
CNSTI4 360
ASGNI4
line 345
;345:	s_preferences.allowdownload.generic.y	       = y;
ADDRGP4 s_preferences+1240+16
ADDRLP4 0
INDIRI4
ASGNI4
line 347
;346:
;347:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 348
;348:	s_preferences.allowvoip.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+1304
CNSTI4 5
ASGNI4
line 349
;349:	s_preferences.allowvoip.generic.name	   = "Enable Voice/Voip:";
ADDRGP4 s_preferences+1304+4
ADDRGP4 $434
ASGNP4
line 350
;350:	s_preferences.allowvoip.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+1304+44
CNSTU4 258
ASGNU4
line 351
;351:	s_preferences.allowvoip.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1304+48
ADDRGP4 Preferences_Event
ASGNP4
line 352
;352:	s_preferences.allowvoip.generic.id       = ID_ALLOWVOIP;
ADDRGP4 s_preferences+1304+8
CNSTI4 138
ASGNI4
line 353
;353:	s_preferences.allowvoip.generic.x	       = PREFERENCES_X_POS;
ADDRGP4 s_preferences+1304+12
CNSTI4 360
ASGNI4
line 354
;354:	s_preferences.allowvoip.generic.y	       = y;
ADDRGP4 s_preferences+1304+16
ADDRLP4 0
INDIRI4
ASGNI4
line 356
;355:
;356:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 357
;357:	s_preferences.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_preferences+1368
CNSTI4 6
ASGNI4
line 358
;358:	s_preferences.back.generic.name     = ART_BACK0;
ADDRGP4 s_preferences+1368+4
ADDRGP4 $448
ASGNP4
line 359
;359:	s_preferences.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+1368+44
CNSTU4 260
ASGNU4
line 360
;360:	s_preferences.back.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+1368+48
ADDRGP4 Preferences_Event
ASGNP4
line 361
;361:	s_preferences.back.generic.id	    = ID_BACK;
ADDRGP4 s_preferences+1368+8
CNSTI4 139
ASGNI4
line 362
;362:	s_preferences.back.generic.x		= 0;
ADDRGP4 s_preferences+1368+12
CNSTI4 0
ASGNI4
line 363
;363:	s_preferences.back.generic.y		= 480-64;
ADDRGP4 s_preferences+1368+16
CNSTI4 416
ASGNI4
line 364
;364:	s_preferences.back.width  		    = 128;
ADDRGP4 s_preferences+1368+76
CNSTI4 128
ASGNI4
line 365
;365:	s_preferences.back.height  		    = 64;
ADDRGP4 s_preferences+1368+80
CNSTI4 64
ASGNI4
line 366
;366:	s_preferences.back.focuspic         = ART_BACK1;
ADDRGP4 s_preferences+1368+60
ADDRGP4 $465
ASGNP4
line 370
;367:
;368:	
;369:	//Menu_AddItem( &s_preferences.menu, &s_preferences.framel );
;370:	Menu_AddItem( &s_preferences.menu, &s_preferences.framer );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 371
;371:	Menu_AddItem( &s_preferences.menu, &s_preferences.banner );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 373
;372:
;373:	Menu_AddItem( &s_preferences.menu, &s_preferences.crosshair );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 374
;374:	Menu_AddItem( &s_preferences.menu, &s_preferences.simpleitems );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 375
;375:	Menu_AddItem( &s_preferences.menu, &s_preferences.wallmarks );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 376
;376:	Menu_AddItem( &s_preferences.menu, &s_preferences.brass );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+696
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 377
;377:	Menu_AddItem( &s_preferences.menu, &s_preferences.dynamiclights );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 378
;378:	Menu_AddItem( &s_preferences.menu, &s_preferences.identifytarget );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+888
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 379
;379:	Menu_AddItem( &s_preferences.menu, &s_preferences.highqualitysky );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 380
;380:	Menu_AddItem( &s_preferences.menu, &s_preferences.synceveryframe );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1016
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 381
;381:	Menu_AddItem( &s_preferences.menu, &s_preferences.forcemodel );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1080
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 382
;382:	Menu_AddItem( &s_preferences.menu, &s_preferences.drawteamoverlay );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1144
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 383
;383:	Menu_AddItem( &s_preferences.menu, &s_preferences.allowdownload );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1240
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 384
;384:	Menu_AddItem( &s_preferences.menu, &s_preferences.allowvoip );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1304
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 386
;385:
;386:	Menu_AddItem( &s_preferences.menu, &s_preferences.back );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+1368
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 388
;387:
;388:	Preferences_SetMenuItems();
ADDRGP4 Preferences_SetMenuItems
CALLV
pop
line 389
;389:}
LABELV $220
endproc Preferences_MenuInit 8 12
export Preferences_Cache
proc Preferences_Cache 16 8
line 397
;390:
;391:
;392:/*
;393:===============
;394:Preferences_Cache
;395:===============
;396:*/
;397:void Preferences_Cache( void ) {
line 400
;398:	int		n;
;399:
;400:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $238
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 401
;401:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $252
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 402
;402:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $448
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 403
;403:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $465
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 404
;404:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $482
line 405
;405:		s_preferences.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $487
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+1456
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 406
;406:	}
LABELV $483
line 404
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $482
line 407
;407:}
LABELV $481
endproc Preferences_Cache 16 8
export UI_PreferencesMenu
proc UI_PreferencesMenu 0 4
line 415
;408:
;409:
;410:/*
;411:===============
;412:UI_PreferencesMenu
;413:===============
;414:*/
;415:void UI_PreferencesMenu( void ) {
line 416
;416:	Preferences_MenuInit();
ADDRGP4 Preferences_MenuInit
CALLV
pop
line 417
;417:	UI_PushMenu( &s_preferences.menu );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 418
;418:}
LABELV $488
endproc UI_PreferencesMenu 0 4
bss
align 4
LABELV s_preferences
skip 1496
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
LABELV $487
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $465
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
LABELV $448
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
LABELV $434
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 86
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 47
byte 1 86
byte 1 111
byte 1 105
byte 1 112
byte 1 58
byte 1 0
align 1
LABELV $420
byte 1 65
byte 1 117
byte 1 116
byte 1 111
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $404
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $390
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $376
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $362
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
byte 1 32
byte 1 83
byte 1 107
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $348
byte 1 73
byte 1 100
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $334
byte 1 68
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $320
byte 1 69
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 66
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $306
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 87
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $292
byte 1 83
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $272
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 58
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
LABELV $238
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
LABELV $230
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
LABELV $199
byte 1 115
byte 1 118
byte 1 95
byte 1 118
byte 1 111
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $193
byte 1 115
byte 1 118
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 108
byte 1 95
byte 1 118
byte 1 111
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 108
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $116
byte 1 114
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $110
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 115
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $104
byte 1 114
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $86
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $77
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $73
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $72
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $71
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $70
byte 1 111
byte 1 102
byte 1 102
byte 1 0
