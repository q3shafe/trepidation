export Com_Error
code
proc Com_Error 1032 12
file "../ui_atoms.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/**********************************************************************
;4:	UI_ATOMS.C
;5:
;6:	User interface building blocks and support functions.
;7:**********************************************************************/
;8:#include "ui_local.h"
;9:
;10:extern void UI_DynamicMenu( void );
;11:
;12:uiStatic_t		uis;
;13:qboolean		m_entersound;		// after a frame, so caching won't disrupt the sound
;14:
;15:// these are here so the functions in q_shared.c can link
;16:#ifndef UI_HARD_LINKED
;17:
;18:void QDECL Com_Error( int level, const char *error, ... ) {
line 22
;19:	va_list		argptr;
;20:	char		text[1024];
;21:
;22:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 23
;23:	vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 24
;24:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 26
;25:
;26:	trap_Error( va("%s", text) );
ADDRGP4 $71
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 27
;27:}
LABELV $69
endproc Com_Error 1032 12
export Com_Printf
proc Com_Printf 1032 12
line 29
;28:
;29:void QDECL Com_Printf( const char *msg, ... ) {
line 33
;30:	va_list		argptr;
;31:	char		text[1024];
;32:
;33:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 34
;34:	vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 35
;35:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 37
;36:
;37:	trap_Print( va("%s", text) );
ADDRGP4 $71
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 38
;38:}
LABELV $72
endproc Com_Printf 1032 12
export UI_ClampCvar
proc UI_ClampCvar 0 0
line 48
;39:
;40:#endif
;41:
;42:/*
;43:=================
;44:UI_ClampCvar
;45:=================
;46:*/
;47:float UI_ClampCvar( float min, float max, float value )
;48:{
line 49
;49:	if ( value < min ) return min;
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $75
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $74
JUMPV
LABELV $75
line 50
;50:	if ( value > max ) return max;
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $77
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $74
JUMPV
LABELV $77
line 51
;51:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $74
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 59
;52:}
;53:
;54:/*
;55:=================
;56:UI_StartDemoLoop
;57:=================
;58:*/
;59:void UI_StartDemoLoop( void ) {
line 60
;60:	trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 61
;61:}
LABELV $79
endproc UI_StartDemoLoop 0 8
export UI_PushMenu
proc UI_PushMenu 16 8
line 69
;62:
;63:/*
;64:=================
;65:UI_PushMenu
;66:=================
;67:*/
;68:void UI_PushMenu( menuframework_s *menu )
;69:{
line 74
;70:	int				i;
;71:	menucommon_s*	item;
;72:
;73:	// avoid stacking menus invoked by hotkeys
;74:	for (i=0 ; i<uis.menusp ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 75
;75:	{
line 76
;76:		if (uis.stack[i] == menu)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $87
line 77
;77:		{
line 78
;78:			uis.menusp = i;
ADDRGP4 uis+16
ADDRLP4 0
INDIRI4
ASGNI4
line 79
;79:			break;
ADDRGP4 $84
JUMPV
LABELV $87
line 81
;80:		}
;81:	}
LABELV $83
line 74
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
LTI4 $82
LABELV $84
line 83
;82:
;83:	if (i == uis.menusp)
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
NEI4 $91
line 84
;84:	{
line 85
;85:		if (uis.menusp >= MAX_MENUDEPTH)
ADDRGP4 uis+16
INDIRI4
CNSTI4 8
LTI4 $94
line 86
;86:			trap_Error("UI_PushMenu: menu stack overflow");
ADDRGP4 $97
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $94
line 88
;87:
;88:		uis.stack[uis.menusp++] = menu;
ADDRLP4 12
ADDRGP4 uis+16
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 89
;89:	}
LABELV $91
line 91
;90:
;91:	uis.activemenu = menu;
ADDRGP4 uis+20
ADDRFP4 0
INDIRP4
ASGNP4
line 94
;92:
;93:	// default cursor position
;94:	menu->cursor      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 95
;95:	menu->cursor_prev = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 97
;96:
;97:	m_entersound = qtrue;
ADDRGP4 m_entersound
CNSTI4 1
ASGNI4
line 99
;98:
;99:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 102
;100:
;101:	// force first available item to have focus
;102:	for (i=0; i<menu->nitems; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
line 103
;103:	{
line 104
;104:		item = (menucommon_s *)menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 105
;105:		if (!(item->flags & (QMF_GRAYED|QMF_MOUSEONLY|QMF_INACTIVE)))
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
NEU4 $105
line 106
;106:		{
line 107
;107:			menu->cursor_prev = -1;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 108
;108:			Menu_SetCursor( menu, i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 109
;109:			break;
ADDRGP4 $103
JUMPV
LABELV $105
line 111
;110:		}
;111:	}
LABELV $102
line 102
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $101
LABELV $103
line 113
;112:
;113:	uis.firstdraw = qtrue;
ADDRGP4 uis+11444
CNSTI4 1
ASGNI4
line 114
;114:}
LABELV $81
endproc UI_PushMenu 16 8
export UI_PopMenu
proc UI_PopMenu 4 8
line 122
;115:
;116:/*
;117:=================
;118:UI_PopMenu
;119:=================
;120:*/
;121:void UI_PopMenu (void)
;122:{
line 123
;123:	trap_S_StartLocalSound( menu_out_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_out_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 125
;124:
;125:	uis.menusp--;
ADDRLP4 0
ADDRGP4 uis+16
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 127
;126:
;127:	if (uis.menusp < 0)
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
GEI4 $110
line 128
;128:		trap_Error ("UI_PopMenu: menu stack underflow");
ADDRGP4 $113
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $110
line 130
;129:
;130:	if (uis.menusp) {
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
EQI4 $114
line 131
;131:		uis.activemenu = uis.stack[uis.menusp-1];
ADDRGP4 uis+20
ADDRGP4 uis+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24-4
ADDP4
INDIRP4
ASGNP4
line 132
;132:		uis.firstdraw = qtrue;
ADDRGP4 uis+11444
CNSTI4 1
ASGNI4
line 133
;133:	}
ADDRGP4 $115
JUMPV
LABELV $114
line 134
;134:	else {
line 135
;135:		UI_ForceMenuOff ();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 136
;136:	}
LABELV $115
line 137
;137:}
LABELV $108
endproc UI_PopMenu 4 8
export UI_ForceMenuOff
proc UI_ForceMenuOff 4 8
line 140
;138:
;139:void UI_ForceMenuOff (void)
;140:{
line 141
;141:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 142
;142:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 144
;143:
;144:	trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 145
;145:	trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 146
;146:	trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $125
ARGP4
ADDRGP4 $126
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 147
;147:}
LABELV $122
endproc UI_ForceMenuOff 4 8
export UI_LerpColor
proc UI_LerpColor 12 0
line 155
;148:
;149:/*
;150:=================
;151:UI_LerpColor
;152:=================
;153:*/
;154:void UI_LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
;155:{
line 159
;156:	int i;
;157:
;158:	// lerp and clamp each component
;159:	for (i=0; i<4; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $128
line 160
;160:	{
line 161
;161:		c[i] = a[i] + t*(b[i]-a[i]);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 162
;162:		if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $132
line 163
;163:			c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $133
JUMPV
LABELV $132
line 164
;164:		else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $134
line 165
;165:			c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $134
LABELV $133
line 166
;166:	}
LABELV $129
line 159
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $128
line 167
;167:}
LABELV $127
endproc UI_LerpColor 12 0
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 328
;168:
;169:/*
;170:=================
;171:UI_DrawProportionalString2
;172:=================
;173:*/
;174:static int	propMap[128][3] = {
;175:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;176:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;177:
;178:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;179:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;180:
;181:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;182:{11, 122, 7},	// !
;183:{154, 181, 14},	// "
;184:{55, 122, 17},	// #
;185:{79, 122, 18},	// $
;186:{101, 122, 23},	// %
;187:{153, 122, 18},	// &
;188:{9, 93, 7},		// '
;189:{207, 122, 8},	// (
;190:{230, 122, 9},	// )
;191:{177, 122, 18},	// *
;192:{30, 152, 18},	// +
;193:{85, 181, 7},	// ,
;194:{34, 93, 11},	// -
;195:{110, 181, 6},	// .
;196:{130, 152, 14},	// /
;197:
;198:{22, 64, 17},	// 0
;199:{41, 64, 12},	// 1
;200:{58, 64, 17},	// 2
;201:{78, 64, 18},	// 3
;202:{98, 64, 19},	// 4
;203:{120, 64, 18},	// 5
;204:{141, 64, 18},	// 6
;205:{204, 64, 16},	// 7
;206:{162, 64, 17},	// 8
;207:{182, 64, 18},	// 9
;208:{59, 181, 7},	// :
;209:{35,181, 7},	// ;
;210:{203, 152, 14},	// <
;211:{56, 93, 14},	// =
;212:{228, 152, 14},	// >
;213:{177, 181, 18},	// ?
;214:
;215:{28, 122, 22},	// @
;216:{5, 4, 18},		// A
;217:{27, 4, 18},	// B
;218:{48, 4, 18},	// C
;219:{69, 4, 17},	// D
;220:{90, 4, 13},	// E
;221:{106, 4, 13},	// F
;222:{121, 4, 18},	// G
;223:{143, 4, 17},	// H
;224:{164, 4, 8},	// I
;225:{175, 4, 16},	// J
;226:{195, 4, 18},	// K
;227:{216, 4, 12},	// L
;228:{230, 4, 23},	// M
;229:{6, 34, 18},	// N
;230:{27, 34, 18},	// O
;231:
;232:{48, 34, 18},	// P
;233:{68, 34, 18},	// Q
;234:{90, 34, 17},	// R
;235:{110, 34, 18},	// S
;236:{130, 34, 14},	// T
;237:{146, 34, 18},	// U
;238:{166, 34, 19},	// V
;239:{185, 34, 29},	// W
;240:{215, 34, 18},	// X
;241:{234, 34, 18},	// Y
;242:{5, 64, 14},	// Z
;243:{60, 152, 7},	// [
;244:{106, 151, 13},	// '\'
;245:{83, 152, 7},	// ]
;246:{128, 122, 17},	// ^
;247:{4, 152, 21},	// _
;248:
;249:{134, 181, 5},	// '
;250:{5, 4, 18},		// A
;251:{27, 4, 18},	// B
;252:{48, 4, 18},	// C
;253:{69, 4, 17},	// D
;254:{90, 4, 13},	// E
;255:{106, 4, 13},	// F
;256:{121, 4, 18},	// G
;257:{143, 4, 17},	// H
;258:{164, 4, 8},	// I
;259:{175, 4, 16},	// J
;260:{195, 4, 18},	// K
;261:{216, 4, 12},	// L
;262:{230, 4, 23},	// M
;263:{6, 34, 18},	// N
;264:{27, 34, 18},	// O
;265:
;266:{48, 34, 18},	// P
;267:{68, 34, 18},	// Q
;268:{90, 34, 17},	// R
;269:{110, 34, 18},	// S
;270:{130, 34, 14},	// T
;271:{146, 34, 18},	// U
;272:{166, 34, 19},	// V
;273:{185, 34, 29},	// W
;274:{215, 34, 18},	// X
;275:{234, 34, 18},	// Y
;276:{5, 64, 14},	// Z
;277:{153, 152, 13},	// {
;278:{11, 181, 5},	// |
;279:{180, 152, 13},	// }
;280:{79, 93, 17},	// ~
;281:{0, 0, -1}		// DEL
;282:};
;283:
;284:static int propMapB[26][3] = {
;285:{11, 12, 33},
;286:{49, 12, 31},
;287:{85, 12, 31},
;288:{120, 12, 30},
;289:{156, 12, 21},
;290:{183, 12, 21},
;291:{207, 12, 32},
;292:
;293:{13, 55, 30},
;294:{49, 55, 13},
;295:{66, 55, 29},
;296:{101, 55, 31},
;297:{135, 55, 21},
;298:{158, 55, 40},
;299:{204, 55, 32},
;300:
;301:{12, 97, 31},
;302:{48, 97, 31},
;303:{82, 97, 30},
;304:{118, 97, 30},
;305:{153, 97, 30},
;306:{185, 97, 25},
;307:{213, 97, 30},
;308:
;309:{11, 139, 32},
;310:{42, 139, 51},
;311:{93, 139, 32},
;312:{126, 139, 31},
;313:{158, 139, 25},
;314:};
;315:
;316:#define PROPB_GAP_WIDTH		4
;317:#define PROPB_SPACE_WIDTH	12
;318:#define PROPB_HEIGHT		36
;319:
;320:// bk001205 - code below duplicated in cgame/cg_drawtools.c
;321:// bk001205 - FIXME: does this belong in ui_shared.c?
;322:/*
;323:=================
;324:UI_DrawBannerString
;325:=================
;326:*/
;327:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;328:{
line 341
;329:	const char* s;
;330:	unsigned char	ch; // bk001204 - unsigned
;331:	float	ax;
;332:	float	ay;
;333:	float	aw;
;334:	float	ah;
;335:	float	frow;
;336:	float	fcol;
;337:	float	fwidth;
;338:	float	fheight;
;339:
;340:	// draw the colored text
;341:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 343
;342:	
;343:	ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 344
;344:	ay = y * uis.scale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 346
;345:
;346:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $140
line 348
;347:	while ( *s )
;348:	{
line 349
;349:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 350
;350:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $143
line 351
;351:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* uis.scale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1098907648
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDF4
ASGNF4
line 352
;352:		}
ADDRGP4 $144
JUMPV
LABELV $143
line 353
;353:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $146
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $146
line 354
;354:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 355
;355:			fcol = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 356
;356:			frow = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 357
;357:			fwidth = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 358
;358:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 359
;359:			aw = (float)propMapB[ch][2] * uis.scale;
ADDRLP4 12
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 360
;360:			ah = (float)PROPB_HEIGHT * uis.scale;
ADDRLP4 24
CNSTF4 1108344832
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 361
;361:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, uis.charsetPropB );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 362
;362:			ax += (aw + (float)PROPB_GAP_WIDTH * uis.scale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 363
;363:		}
LABELV $146
LABELV $144
line 364
;364:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 365
;365:	}
LABELV $141
line 347
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $140
line 367
;366:
;367:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 368
;368:}
LABELV $136
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 370
;369:
;370:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 377
;371:	const char *	s;
;372:	int				ch;
;373:	int				width;
;374:	vec4_t			drawcolor;
;375:
;376:	// find the width of the drawn text
;377:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 378
;378:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 379
;379:	while ( *s ) {
line 380
;380:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 381
;381:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $159
line 382
;382:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 383
;383:		}
ADDRGP4 $160
JUMPV
LABELV $159
line 384
;384:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $161
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $161
line 385
;385:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 386
;386:		}
LABELV $161
LABELV $160
line 387
;387:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 388
;388:	}
LABELV $157
line 379
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $156
line 389
;389:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 391
;390:
;391:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $166
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $168
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $169
ADDRGP4 $166
JUMPV
LABELV $168
line 393
;392:		case UI_CENTER:
;393:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 394
;394:			break;
ADDRGP4 $166
JUMPV
LABELV $169
line 397
;395:
;396:		case UI_RIGHT:
;397:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 398
;398:			break;
line 402
;399:
;400:		case UI_LEFT:
;401:		default:
;402:			break;
LABELV $166
line 405
;403:	}
;404:
;405:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $171
line 406
;406:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 407
;407:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 408
;408:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 409
;409:	}
LABELV $171
line 411
;410:
;411:	UI_DrawBannerString2( x, y, str, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 412
;412:}
LABELV $155
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 415
;413:
;414:
;415:int UI_ProportionalStringWidth( const char* str ) {
line 421
;416:	const char *	s;
;417:	int				ch;
;418:	int				charWidth;
;419:	int				width;
;420:
;421:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 422
;422:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $177
line 423
;423:	while ( *s ) {
line 424
;424:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 425
;425:		charWidth = propMap[ch][2];
ADDRLP4 4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 426
;426:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $181
line 427
;427:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 428
;428:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 429
;429:		}
LABELV $181
line 430
;430:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 431
;431:	}
LABELV $178
line 423
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 433
;432:
;433:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 434
;434:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $176
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 438
;435:}
;436:
;437:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;438:{
line 443
;439:	const char* s;
;440:	unsigned char	ch; // bk001204 - unsigned
;441:	float	ax;
;442:	float	ay;
;443:	float	aw = 0; // bk001204 - init
ADDRLP4 8
CNSTF4 0
ASGNF4
line 451
;444:	float	ah;
;445:	float	frow;
;446:	float	fcol;
;447:	float	fwidth;
;448:	float	fheight;
;449:
;450:	// draw the colored text
;451:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 453
;452:	
;453:	ax = x * uis.scale + uis.bias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 454
;454:	ay = y * uis.scale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 456
;455:
;456:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $187
line 458
;457:	while ( *s )
;458:	{
line 459
;459:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 460
;460:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $190
line 461
;461:			aw = (float)PROP_SPACE_WIDTH * uis.scale * sizeScale;
ADDRLP4 8
CNSTF4 1090519040
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 462
;462:		}
ADDRGP4 $191
JUMPV
LABELV $190
line 463
;463:		else if ( propMap[ch][2] != -1 ) {
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $193
line 464
;464:			fcol = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 465
;465:			frow = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 466
;466:			fwidth = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
ASGNF4
line 467
;467:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 468
;468:			aw = (float)propMap[ch][2] * uis.scale * sizeScale;
ADDRLP4 8
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 469
;469:			ah = (float)PROP_HEIGHT * uis.scale * sizeScale;
ADDRLP4 24
CNSTF4 1104674816
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 470
;470:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 471
;471:		}
LABELV $193
LABELV $191
line 473
;472:
;473:		ax += (aw + (float)PROP_GAP_WIDTH * uis.scale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 474
;474:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 475
;475:	}
LABELV $188
line 457
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
line 477
;476:
;477:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 478
;478:}
LABELV $183
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 485
;479:
;480:/*
;481:=================
;482:UI_ProportionalSizeScale
;483:=================
;484:*/
;485:float UI_ProportionalSizeScale( int style ) {
line 486
;486:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $203
line 487
;487:		return PROP_SMALL_SIZE_SCALE;
CNSTF4 1061158912
RETF4
ADDRGP4 $202
JUMPV
LABELV $203
line 490
;488:	}
;489:
;490:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $202
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 499
;491:}
;492:
;493:
;494:/*
;495:=================
;496:UI_DrawProportionalString
;497:=================
;498:*/
;499:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 504
;500:	vec4_t	drawcolor;
;501:	int		width;
;502:	float	sizeScale;
;503:
;504:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 506
;505:
;506:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $209
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $210
ADDRGP4 $207
JUMPV
LABELV $209
line 508
;507:		case UI_CENTER:
;508:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 509
;509:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 510
;510:			break;
ADDRGP4 $207
JUMPV
LABELV $210
line 513
;511:
;512:		case UI_RIGHT:
;513:			width = UI_ProportionalStringWidth( str ) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 514
;514:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 515
;515:			break;
line 519
;516:
;517:		case UI_LEFT:
;518:		default:
;519:			break;
LABELV $207
line 522
;520:	}
;521:
;522:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $212
line 523
;523:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 524
;524:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 525
;525:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, uis.charsetProp );
ADDRLP4 40
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 526
;526:	}
LABELV $212
line 528
;527:
;528:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $218
line 529
;529:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 530
;530:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 531
;531:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 532
;532:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 533
;533:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 534
;534:		return;
ADDRGP4 $205
JUMPV
LABELV $218
line 537
;535:	}
;536:
;537:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $224
line 538
;538:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 539
;539:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 540
;540:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 541
;541:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 542
;542:		UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 544
;543:
;544:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 545
;545:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 546
;546:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 547
;547:		drawcolor[3] = 0.5 + 0.5 * sin( uis.realtime / PULSE_DIVISOR );
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
CNSTF4 1056964608
ADDRLP4 36
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 548
;548:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetPropGlow );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 549
;549:		return;
ADDRGP4 $205
JUMPV
LABELV $224
line 552
;550:	}
;551:
;552:	UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 553
;553:}
LABELV $205
endproc UI_DrawProportionalString 44 24
export UI_DrawProportionalString_AutoWrapped
proc UI_DrawProportionalString_AutoWrapped 1064 20
line 560
;554:
;555:/*
;556:=================
;557:UI_DrawProportionalString_Wrapped
;558:=================
;559:*/
;560:void UI_DrawProportionalString_AutoWrapped( int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color ) {
line 567
;561:	int width;
;562:	char *s1,*s2,*s3;
;563:	char c_bcp;
;564:	char buf[1024];
;565:	float   sizeScale;
;566:
;567:	if (!str || str[0]=='\0')
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $237
LABELV $239
line 568
;568:		return;
ADDRGP4 $236
JUMPV
LABELV $237
line 570
;569:	
;570:	sizeScale = UI_ProportionalSizeScale( style );
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1052
INDIRF4
ASGNF4
line 572
;571:	
;572:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 24
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 573
;573:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 24
ASGNP4
ADDRLP4 4
ADDRLP4 24
ASGNP4
ADDRLP4 12
ADDRLP4 24
ASGNP4
ADDRGP4 $241
JUMPV
LABELV $240
line 575
;574:
;575:	while (1) {
LABELV $243
line 576
;576:		do {
line 577
;577:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 578
;578:		} while (*s3!=' ' && *s3!='\0');
LABELV $244
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $246
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $243
LABELV $246
line 579
;579:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 580
;580:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 581
;581:		width = UI_ProportionalStringWidth(s1) * sizeScale;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 582
;582:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 583
;583:		if (width > xmax) {
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $247
line 584
;584:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $249
line 585
;585:			{
line 587
;586:				// fuck, don't have a clean cut, we'll overflow
;587:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 588
;588:			}
LABELV $249
line 589
;589:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 590
;590:			UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 591
;591:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ASGNI4
line 592
;592:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $251
line 593
;593:      {
line 598
;594:        // that was the last word
;595:        // we could start a new loop, but that wouldn't be much use
;596:        // even if the word is too long, we would overflow it (see above)
;597:        // so just print it now if needed
;598:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 599
;599:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $242
line 600
;600:          UI_DrawProportionalString(x, y, s2, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 601
;601:				break; 
ADDRGP4 $242
JUMPV
LABELV $251
line 603
;602:      }
;603:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 604
;604:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 605
;605:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 606
;606:		}
ADDRGP4 $248
JUMPV
LABELV $247
line 608
;607:		else
;608:		{
line 609
;609:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 610
;610:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $255
line 611
;611:			{
line 612
;612:				UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 613
;613:				break;
ADDRGP4 $242
JUMPV
LABELV $255
line 615
;614:			}
;615:		}
LABELV $248
line 616
;616:	}
LABELV $241
line 575
ADDRGP4 $240
JUMPV
LABELV $242
line 617
;617:}
LABELV $236
endproc UI_DrawProportionalString_AutoWrapped 1064 20
proc UI_DrawString2 76 36
line 625
;618:
;619:/*
;620:=================
;621:UI_DrawString2
;622:=================
;623:*/
;624:static void UI_DrawString2( int x, int y, const char* str, vec4_t color, int charw, int charh )
;625:{
line 628
;626:	const char* s;
;627:	char	ch;
;628:	int forceColor = qfalse; //APSFIXME;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 637
;629:	vec4_t	tempcolor;
;630:	float	ax;
;631:	float	ay;
;632:	float	aw;
;633:	float	ah;
;634:	float	frow;
;635:	float	fcol;
;636:
;637:	if (y < -charh)
ADDRFP4 4
INDIRI4
ADDRFP4 20
INDIRI4
NEGI4
GEI4 $258
line 639
;638:		// offscreen
;639:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 642
;640:
;641:	// draw the colored text
;642:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 644
;643:	
;644:	ax = x * uis.scale + uis.bias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 645
;645:	ay = y * uis.scale;
ADDRLP4 44
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 646
;646:	aw = charw * uis.scale;
ADDRLP4 12
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 647
;647:	ah = charh * uis.scale;
ADDRLP4 48
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 649
;648:
;649:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $266
JUMPV
LABELV $265
line 651
;650:	while ( *s )
;651:	{
line 652
;652:		if ( Q_IsColorString( s ) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $268
ADDRLP4 56
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $268
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $268
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $268
line 653
;653:		{
line 654
;654:			if ( !forceColor )
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $270
line 655
;655:			{
line 656
;656:				memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
ADDRLP4 24
ARGP4
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
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 657
;657:				tempcolor[3] = color[3];
ADDRLP4 24+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 658
;658:				trap_R_SetColor( tempcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 659
;659:			}
LABELV $270
line 660
;660:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 661
;661:			continue;
ADDRGP4 $266
JUMPV
LABELV $268
line 664
;662:		}
;663:
;664:		ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 665
;665:		if (ch != ' ')
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $273
line 666
;666:		{
line 667
;667:			frow = (ch>>4)*0.0625;
ADDRLP4 16
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
MULF4
ASGNF4
line 668
;668:			fcol = (ch&15)*0.0625;
ADDRLP4 20
CNSTF4 1031798784
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
MULF4
ASGNF4
line 669
;669:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 72
CNSTF4 1031798784
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11404
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 670
;670:		}
LABELV $273
line 672
;671:
;672:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 673
;673:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 674
;674:	}
LABELV $266
line 650
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $265
line 676
;675:
;676:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 677
;677:}
LABELV $257
endproc UI_DrawString2 76 36
export UI_DrawString
proc UI_DrawString 84 24
line 685
;678:
;679:/*
;680:=================
;681:UI_DrawString
;682:=================
;683:*/
;684:void UI_DrawString( int x, int y, const char* str, int style, vec4_t color )
;685:{
line 694
;686:	int		len;
;687:	int		charw;
;688:	int		charh;
;689:	vec4_t	newcolor;
;690:	vec4_t	lowlight;
;691:	float	*drawcolor;
;692:	vec4_t	dropcolor;
;693:
;694:	if( !str ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $277
line 695
;695:		return;
ADDRGP4 $276
JUMPV
LABELV $277
line 698
;696:	}
;697:
;698:	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $279
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $279
line 699
;699:		return;
ADDRGP4 $276
JUMPV
LABELV $279
line 701
;700:
;701:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $282
line 702
;702:	{
line 703
;703:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 704
;704:		charh =	SMALLCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 705
;705:	}
ADDRGP4 $283
JUMPV
LABELV $282
line 706
;706:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $284
line 707
;707:	{
line 708
;708:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 709
;709:		charh =	GIANTCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 48
ASGNI4
line 710
;710:	}
ADDRGP4 $285
JUMPV
LABELV $284
line 712
;711:	else
;712:	{
line 713
;713:		charw =	BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 714
;714:		charh =	BIGCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 715
;715:	}
LABELV $285
LABELV $283
line 717
;716:
;717:	if (style & UI_PULSE)
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $286
line 718
;718:	{
line 719
;719:		lowlight[0] = 0.8*color[0]; 
ADDRLP4 8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 720
;720:		lowlight[1] = 0.8*color[1];
ADDRLP4 8+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 721
;721:		lowlight[2] = 0.8*color[2];
ADDRLP4 8+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 722
;722:		lowlight[3] = 0.8*color[3];
ADDRLP4 8+12
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 723
;723:		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 68
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
ARGP4
CNSTF4 1056964608
ADDRLP4 68
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 UI_LerpColor
CALLV
pop
line 724
;724:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 725
;725:	}	
ADDRGP4 $287
JUMPV
LABELV $286
line 727
;726:	else
;727:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $287
line 729
;728:
;729:	switch (style & UI_FORMATMASK)
ADDRLP4 68
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
EQI4 $295
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $296
ADDRGP4 $293
JUMPV
line 730
;730:	{
LABELV $295
line 733
;731:		case UI_CENTER:
;732:			// center justify at x
;733:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 734
;734:			x   = x - len*charw/2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 735
;735:			break;
ADDRGP4 $293
JUMPV
LABELV $296
line 739
;736:
;737:		case UI_RIGHT:
;738:			// right justify at x
;739:			len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 80
INDIRI4
ASGNI4
line 740
;740:			x   = x - len*charw;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
line 741
;741:			break;
line 745
;742:
;743:		default:
;744:			// left justify at x
;745:			break;
LABELV $293
line 748
;746:	}
;747:
;748:	if ( style & UI_DROPSHADOW )
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $297
line 749
;749:	{
line 750
;750:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 28+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 76
INDIRF4
ASGNF4
line 751
;751:		dropcolor[3] = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 752
;752:		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh);
ADDRLP4 80
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 753
;753:	}
LABELV $297
line 755
;754:
;755:	UI_DrawString2(x,y,str,drawcolor,charw,charh);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 756
;756:}
LABELV $276
endproc UI_DrawString 84 24
export UI_DrawChar
proc UI_DrawChar 2 20
line 764
;757:
;758:/*
;759:=================
;760:UI_DrawChar
;761:=================
;762:*/
;763:void UI_DrawChar( int x, int y, int ch, int style, vec4_t color )
;764:{
line 767
;765:	char	buff[2];
;766:
;767:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 768
;768:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 770
;769:
;770:	UI_DrawString( x, y, buff, style, color );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 771
;771:}
LABELV $302
endproc UI_DrawChar 2 20
export UI_IsFullscreen
proc UI_IsFullscreen 4 0
line 773
;772:
;773:qboolean UI_IsFullscreen( void ) {
line 774
;774:	if ( uis.activemenu && ( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $305
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $305
line 775
;775:		return uis.activemenu->fullscreen;
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
RETI4
ADDRGP4 $304
JUMPV
LABELV $305
line 778
;776:	}
;777:
;778:	return qfalse;
CNSTI4 0
RETI4
LABELV $304
endproc UI_IsFullscreen 4 0
proc NeedCDAction 0 8
line 781
;779:}
;780:
;781:static void NeedCDAction( qboolean result ) {
line 782
;782:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $310
line 783
;783:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $312
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 784
;784:	}
LABELV $310
line 785
;785:}
LABELV $309
endproc NeedCDAction 0 8
proc NeedCDKeyAction 0 8
line 787
;786:
;787:static void NeedCDKeyAction( qboolean result ) {
line 788
;788:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $314
line 789
;789:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $312
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 790
;790:	}
LABELV $314
line 791
;791:}
LABELV $313
endproc NeedCDKeyAction 0 8
export UI_SetActiveMenu
proc UI_SetActiveMenu 8 12
line 793
;792:
;793:void UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 796
;794:	// this should be the ONLY way the menu system is brought up
;795:	// enusure minumum menu data is cached
;796:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 798
;797:
;798:	switch ( menu ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $317
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $317
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $330
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $330
address $320
address $321
address $326
address $322
address $324
address $328
address $328
code
LABELV $320
line 800
;799:	case UIMENU_NONE:
;800:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 801
;801:		return;
ADDRGP4 $316
JUMPV
LABELV $321
line 803
;802:	case UIMENU_MAIN:
;803:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 804
;804:		return;
ADDRGP4 $316
JUMPV
LABELV $322
line 806
;805:	case UIMENU_NEED_CD:
;806:		UI_ConfirmMenu( "Insert the CD", (voidfunc_f)NULL, NeedCDAction );
ADDRGP4 $323
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 807
;807:		return;
ADDRGP4 $316
JUMPV
LABELV $324
line 809
;808:	case UIMENU_BAD_CD_KEY:
;809:		UI_ConfirmMenu( "Bad CD Key", (voidfunc_f)NULL, NeedCDKeyAction );
ADDRGP4 $325
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDKeyAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 810
;810:		return;
ADDRGP4 $316
JUMPV
LABELV $326
line 817
;811:	case UIMENU_INGAME:
;812:		/*
;813:		//GRank
;814:		UI_RankingsMenu();
;815:		return;
;816:		*/
;817:		trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $125
ARGP4
ADDRGP4 $327
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 818
;818:		UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 819
;819:		return;
ADDRGP4 $316
JUMPV
LABELV $328
LABELV $317
line 826
;820:		
;821:	// bk001204
;822:	case UIMENU_TEAM:
;823:	case UIMENU_POSTGAME:
;824:	default:
;825:#ifndef NDEBUG
;826:	  Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu );
ADDRGP4 $329
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 828
;827:#endif
;828:	  break;
LABELV $318
line 830
;829:	}
;830:}
LABELV $316
endproc UI_SetActiveMenu 8 12
export UI_KeyEvent
proc UI_KeyEvent 16 8
line 837
;831:
;832:/*
;833:=================
;834:UI_KeyEvent
;835:=================
;836:*/
;837:void UI_KeyEvent( int key, int down ) {
line 840
;838:	sfxHandle_t		s;
;839:
;840:	if (!uis.activemenu) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $332
line 841
;841:		return;
ADDRGP4 $331
JUMPV
LABELV $332
line 844
;842:	}
;843:
;844:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $335
line 845
;845:		return;
ADDRGP4 $331
JUMPV
LABELV $335
line 848
;846:	}
;847:
;848:	if (uis.activemenu->key)
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $337
line 849
;849:		s = uis.activemenu->key( key );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $337
line 851
;850:	else
;851:		s = Menu_DefaultKey( uis.activemenu, key );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $338
line 853
;852:
;853:	if ((s > 0) && (s != menu_null_sound))
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $342
ADDRLP4 0
INDIRI4
ADDRGP4 menu_null_sound
INDIRI4
EQI4 $342
line 854
;854:		trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $342
line 855
;855:}
LABELV $331
endproc UI_KeyEvent 16 8
export UI_MouseEvent
proc UI_MouseEvent 24 8
line 863
;856:
;857:/*
;858:=================
;859:UI_MouseEvent
;860:=================
;861:*/
;862:void UI_MouseEvent( int dx, int dy )
;863:{
line 867
;864:	int				i;
;865:	menucommon_s*	m;
;866:
;867:	if (!uis.activemenu)
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $345
line 868
;868:		return;
ADDRGP4 $344
JUMPV
LABELV $345
line 871
;869:
;870:	// update mouse screen position
;871:	uis.cursorx += dx;
ADDRLP4 8
ADDRGP4 uis+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 872
;872:	if (uis.cursorx < 0)
ADDRGP4 uis+8
INDIRI4
CNSTI4 0
GEI4 $349
line 873
;873:		uis.cursorx = 0;
ADDRGP4 uis+8
CNSTI4 0
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 874
;874:	else if (uis.cursorx > SCREEN_WIDTH)
ADDRGP4 uis+8
INDIRI4
CNSTI4 640
LEI4 $353
line 875
;875:		uis.cursorx = SCREEN_WIDTH;
ADDRGP4 uis+8
CNSTI4 640
ASGNI4
LABELV $353
LABELV $350
line 877
;876:
;877:	uis.cursory += dy;
ADDRLP4 12
ADDRGP4 uis+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 878
;878:	if (uis.cursory < 0)
ADDRGP4 uis+12
INDIRI4
CNSTI4 0
GEI4 $358
line 879
;879:		uis.cursory = 0;
ADDRGP4 uis+12
CNSTI4 0
ASGNI4
ADDRGP4 $359
JUMPV
LABELV $358
line 880
;880:	else if (uis.cursory > SCREEN_HEIGHT)
ADDRGP4 uis+12
INDIRI4
CNSTI4 480
LEI4 $362
line 881
;881:		uis.cursory = SCREEN_HEIGHT;
ADDRGP4 uis+12
CNSTI4 480
ASGNI4
LABELV $362
LABELV $359
line 884
;882:
;883:	// region test the active menu items
;884:	for (i=0; i<uis.activemenu->nitems; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 885
;885:	{
line 886
;886:		m = (menucommon_s*)uis.activemenu->items[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 888
;887:
;888:		if (m->flags & (QMF_GRAYED|QMF_INACTIVE))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $372
line 889
;889:			continue;
ADDRGP4 $367
JUMPV
LABELV $372
line 891
;890:
;891:		if ((uis.cursorx < m->left) ||
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
LTI4 $382
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
GTI4 $382
ADDRGP4 uis+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
LTI4 $382
ADDRGP4 uis+12
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
LEI4 $374
LABELV $382
line 895
;892:			(uis.cursorx > m->right) ||
;893:			(uis.cursory < m->top) ||
;894:			(uis.cursory > m->bottom))
;895:		{
line 897
;896:			// cursor out of item bounds
;897:			continue;
ADDRGP4 $367
JUMPV
LABELV $374
line 901
;898:		}
;899:
;900:		// set focus to item at cursor
;901:		if (uis.activemenu->cursor != i)
ADDRGP4 uis+20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $383
line 902
;902:		{
line 903
;903:			Menu_SetCursor( uis.activemenu, i );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 904
;904:			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294966783
BANDU4
ASGNU4
line 906
;905:
;906:			if ( !(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT ) ) {
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1048576
BANDU4
CNSTU4 0
NEU4 $389
line 907
;907:				trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 908
;908:			}
LABELV $389
line 909
;909:		}
LABELV $383
line 911
;910:
;911:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 512
BORU4
ASGNU4
line 912
;912:		return;
ADDRGP4 $344
JUMPV
LABELV $367
line 884
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $369
ADDRLP4 4
INDIRI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $366
line 915
;913:	}  
;914:
;915:	if (uis.activemenu->nitems > 0) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LEI4 $395
line 917
;916:		// out of any region
;917:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 16
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294966783
BANDU4
ASGNU4
line 918
;918:	}
LABELV $395
line 919
;919:}
LABELV $344
endproc UI_MouseEvent 24 8
bss
align 1
LABELV $401
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 921
;920:
;921:char *UI_Argv( int arg ) {
line 924
;922:	static char	buffer[MAX_STRING_CHARS];
;923:
;924:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $401
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 926
;925:
;926:	return buffer;
ADDRGP4 $401
RETP4
LABELV $400
endproc UI_Argv 0 12
bss
align 1
LABELV $403
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 930
;927:}
;928:
;929:
;930:char *UI_Cvar_VariableString( const char *var_name ) {
line 933
;931:	static char	buffer[MAX_STRING_CHARS];
;932:
;933:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $403
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 935
;934:
;935:	return buffer;
ADDRGP4 $403
RETP4
LABELV $402
endproc UI_Cvar_VariableString 0 12
export UI_Cache_f
proc UI_Cache_f 0 0
line 944
;936:}
;937:
;938:
;939:/*
;940:=================
;941:UI_Cache
;942:=================
;943:*/
;944:void UI_Cache_f( void ) {
line 945
;945:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 946
;946:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 947
;947:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 948
;948:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 949
;949:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 950
;950:	Controls_Cache();
ADDRGP4 Controls_Cache
CALLV
pop
line 951
;951:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 952
;952:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 953
;953:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 954
;954:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 955
;955:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 956
;956:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 957
;957:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 958
;958:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 959
;959:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 960
;960:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 961
;961:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 962
;962:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 963
;963:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 964
;964:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 965
;965:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 966
;966:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 967
;967:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 968
;968:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 969
;969:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 970
;970:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 973
;971://	UI_LoadConfig_Cache();
;972://	UI_SaveConfigMenu_Cache();
;973:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 974
;974:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 975
;975:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 977
;976:
;977:}
LABELV $404
endproc UI_Cache_f 0 0
export UI_ConsoleCommand
proc UI_ConsoleCommand 44 8
line 985
;978:
;979:
;980:/*
;981:=================
;982:UI_ConsoleCommand
;983:=================
;984:*/
;985:qboolean UI_ConsoleCommand( int realTime ) {
line 988
;986:	char	*cmd;
;987:
;988:	cmd = UI_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 991
;989:
;990:	// ensure minimum menu data is available
;991:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 993
;992:
;993:	if ( Q_stricmp (cmd, "levelselect") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $408
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $406
line 994
;994:		UI_SPLevelMenu_f();
ADDRGP4 UI_SPLevelMenu_f
CALLV
pop
line 995
;995:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $406
line 998
;996:	}
;997:
;998:	if ( Q_stricmp (cmd, "postgame") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $409
line 999
;999:		UI_SPPostgameMenu_f();
ADDRGP4 UI_SPPostgameMenu_f
CALLV
pop
line 1000
;1000:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $409
line 1003
;1001:	}
;1002:
;1003:	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $412
line 1004
;1004:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 1005
;1005:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $412
line 1008
;1006:	}
;1007:
;1008:	if ( Q_stricmp (cmd, "ui_cinematics") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $415
line 1009
;1009:		UI_CinematicsMenu_f();
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 1010
;1010:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $415
line 1015
;1011:	}
;1012:
;1013:	
;1014:	// Shafe - Trep  Call Dyanmic Menu (Example)
;1015:	if ( Q_stricmp (cmd, "ui_dynamicmenu") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $420
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $418
line 1016
;1016:		UI_DynamicCommandMenu_f();
ADDRGP4 UI_DynamicCommandMenu_f
CALLI4
pop
line 1017
;1017:	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $418
line 1020
;1018:	}
;1019:
;1020:	if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $423
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $421
line 1021
;1021:		UI_TeamOrdersMenu_f();
ADDRGP4 UI_TeamOrdersMenu_f
CALLV
pop
line 1022
;1022:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $421
line 1025
;1023:	}
;1024:
;1025:	if ( Q_stricmp (cmd, "iamacheater") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $424
line 1026
;1026:		UI_SPUnlock_f();
ADDRGP4 UI_SPUnlock_f
CALLV
pop
line 1027
;1027:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $424
line 1030
;1028:	}
;1029:
;1030:	if ( Q_stricmp (cmd, "iamamonkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $427
line 1031
;1031:		UI_SPUnlockMedals_f();
ADDRGP4 UI_SPUnlockMedals_f
CALLV
pop
line 1032
;1032:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $427
line 1035
;1033:	}
;1034:
;1035:	if ( Q_stricmp (cmd, "ui_cdkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $430
line 1036
;1036:		UI_CDKeyMenu_f();
ADDRGP4 UI_CDKeyMenu_f
CALLV
pop
line 1037
;1037:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $430
line 1040
;1038:	}
;1039:
;1040:	return qfalse;
CNSTI4 0
RETI4
LABELV $405
endproc UI_ConsoleCommand 44 8
export UI_Shutdown
proc UI_Shutdown 0 0
line 1048
;1041:}
;1042:
;1043:/*
;1044:=================
;1045:UI_Shutdown
;1046:=================
;1047:*/
;1048:void UI_Shutdown( void ) {
line 1049
;1049:}
LABELV $433
endproc UI_Shutdown 0 0
export UI_Init
proc UI_Init 0 4
line 1056
;1050:
;1051:/*
;1052:=================
;1053:UI_Init
;1054:=================
;1055:*/
;1056:void UI_Init( void ) {
line 1057
;1057:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 1059
;1058:
;1059:	UI_InitGameinfo();
ADDRGP4 UI_InitGameinfo
CALLV
pop
line 1062
;1060:
;1061:	// cache redundant calulations
;1062:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+56
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1065
;1063:
;1064:	// for 640x480 virtualized screen
;1065:	uis.scale = uis.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uis+11432
CNSTF4 990414985
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1066
;1066:	if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uis+56+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uis+56+11308
INDIRI4
MULI4
LEI4 $439
line 1068
;1067:		// wide screen
;1068:		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uis+11436
CNSTF4 1056964608
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 1069
;1069:	}
ADDRGP4 $440
JUMPV
LABELV $439
line 1070
;1070:	else {
line 1072
;1071:		// no wide screen
;1072:		uis.bias = 0;
ADDRGP4 uis+11436
CNSTF4 0
ASGNF4
line 1073
;1073:	}
LABELV $440
line 1076
;1074:
;1075:	// initialize the menu system
;1076:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1078
;1077:
;1078:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 1079
;1079:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1080
;1080:}
LABELV $434
endproc UI_Init 0 4
export UI_AdjustFrom640
proc UI_AdjustFrom640 16 0
line 1089
;1081:
;1082:/*
;1083:================
;1084:UI_AdjustFrom640
;1085:
;1086:Adjusted for resolution and screen aspect ratio
;1087:================
;1088:*/
;1089:void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 1091
;1090:	// expect valid pointers
;1091:	*x = *x * uis.scale + uis.bias;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRGP4 uis+11436
INDIRF4
ADDF4
ASGNF4
line 1092
;1092:	*y *= uis.scale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 1093
;1093:	*w *= uis.scale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 1094
;1094:	*h *= uis.scale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 1095
;1095:}
LABELV $453
endproc UI_AdjustFrom640 16 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 16 36
line 1097
;1096:
;1097:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 1100
;1098:	qhandle_t	hShader;
;1099:
;1100:	hShader = trap_R_RegisterShaderNoMip( picname );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1101
;1101:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1102
;1102:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1103
;1103:}
LABELV $459
endproc UI_DrawNamedPic 16 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 1105
;1104:
;1105:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 1111
;1106:	float	s0;
;1107:	float	s1;
;1108:	float	t0;
;1109:	float	t1;
;1110:
;1111:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $461
line 1112
;1112:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 1113
;1113:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1114
;1114:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1115
;1115:	}
ADDRGP4 $462
JUMPV
LABELV $461
line 1116
;1116:	else {
line 1117
;1117:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1118
;1118:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1119
;1119:	}
LABELV $462
line 1121
;1120:
;1121:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $463
line 1122
;1122:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 1123
;1123:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 1124
;1124:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1125
;1125:	}
ADDRGP4 $464
JUMPV
LABELV $463
line 1126
;1126:	else {
line 1127
;1127:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1128
;1128:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1129
;1129:	}
LABELV $464
line 1131
;1130:	
;1131:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1132
;1132:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1133
;1133:}
LABELV $460
endproc UI_DrawHandlePic 16 36
export UI_FillRect
proc UI_FillRect 4 36
line 1142
;1134:
;1135:/*
;1136:================
;1137:UI_FillRect
;1138:
;1139:Coordinates are 640*480 virtual values
;1140:=================
;1141:*/
;1142:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 1143
;1143:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1145
;1144:
;1145:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1146
;1146:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1148
;1147:
;1148:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1149
;1149:}
LABELV $465
endproc UI_FillRect 4 36
export UI_DrawRect
proc UI_DrawRect 24 36
line 1158
;1150:
;1151:/*
;1152:================
;1153:UI_DrawRect
;1154:
;1155:Coordinates are 640*480 virtual values
;1156:=================
;1157:*/
;1158:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 1159
;1159:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1161
;1160:
;1161:	UI_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1163
;1162:
;1163:	trap_R_DrawStretchPic( x, y, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1164
;1164:	trap_R_DrawStretchPic( x, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1165
;1165:	trap_R_DrawStretchPic( x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1166
;1166:	trap_R_DrawStretchPic( x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1168
;1167:
;1168:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1169
;1169:}
LABELV $467
endproc UI_DrawRect 24 36
export UI_SetColor
proc UI_SetColor 0 4
line 1171
;1170:
;1171:void UI_SetColor( const float *rgba ) {
line 1172
;1172:	trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1173
;1173:}
LABELV $472
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 1175
;1174:
;1175:void UI_UpdateScreen( void ) {
line 1176
;1176:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 1177
;1177:}
LABELV $473
endproc UI_UpdateScreen 0 0
export UI_Refresh
proc UI_Refresh 20 20
line 1185
;1178:
;1179:/*
;1180:=================
;1181:UI_Refresh
;1182:=================
;1183:*/
;1184:void UI_Refresh( int realtime )
;1185:{
line 1186
;1186:	uis.frametime = realtime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 1187
;1187:	uis.realtime  = realtime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 1189
;1188:
;1189:	if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $477
line 1190
;1190:		return;
ADDRGP4 $474
JUMPV
LABELV $477
line 1193
;1191:	}
;1192:
;1193:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 1195
;1194:
;1195:	if ( uis.activemenu )
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $479
line 1196
;1196:	{
line 1197
;1197:		if (uis.activemenu->fullscreen)
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $482
line 1198
;1198:		{
line 1200
;1199:			// draw the background
;1200:			if( uis.activemenu->showlogo ) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
line 1201
;1201:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackShader );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1202
;1202:			}
ADDRGP4 $486
JUMPV
LABELV $485
line 1203
;1203:			else {
line 1204
;1204:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackNoLogoShader );
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 uis+11400
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1205
;1205:			}
LABELV $486
line 1206
;1206:		}
LABELV $482
line 1208
;1207:
;1208:		if (uis.activemenu->draw)
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $490
line 1209
;1209:			uis.activemenu->draw();
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $491
JUMPV
LABELV $490
line 1211
;1210:		else
;1211:			Menu_Draw( uis.activemenu );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $491
line 1213
;1212:
;1213:		if( uis.firstdraw ) {
ADDRGP4 uis+11444
INDIRI4
CNSTI4 0
EQI4 $495
line 1214
;1214:			UI_MouseEvent( 0, 0 );
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 1215
;1215:			uis.firstdraw = qfalse;
ADDRGP4 uis+11444
CNSTI4 0
ASGNI4
line 1216
;1216:		}
LABELV $495
line 1217
;1217:	}
LABELV $479
line 1220
;1218:
;1219:	// draw cursor
;1220:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 1221
;1221:	UI_DrawHandlePic( uis.cursorx-16, uis.cursory-16, 32, 32, uis.cursor);
ADDRLP4 4
CNSTI4 16
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
CNSTF4 1107296256
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uis+11420
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1224
;1222:
;1223:#ifndef NDEBUG
;1224:	if (uis.debug)
ADDRGP4 uis+11388
INDIRI4
CNSTI4 0
EQI4 $502
line 1225
;1225:	{
line 1227
;1226:		// cursor coordinates
;1227:		UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
ADDRGP4 $505
ARGP4
ADDRGP4 uis+8
INDIRI4
ARGI4
ADDRGP4 uis+12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1228
;1228:	}
LABELV $502
line 1234
;1229:#endif
;1230:
;1231:	// delay playing the enter sound until after the
;1232:	// menu has been drawn, to avoid delay while
;1233:	// caching images
;1234:	if (m_entersound)
ADDRGP4 m_entersound
INDIRI4
CNSTI4 0
EQI4 $508
line 1235
;1235:	{
line 1236
;1236:		trap_S_StartLocalSound( menu_in_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_in_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1237
;1237:		m_entersound = qfalse;
ADDRGP4 m_entersound
CNSTI4 0
ASGNI4
line 1238
;1238:	}
LABELV $508
line 1239
;1239:}
LABELV $474
endproc UI_Refresh 20 20
export UI_DrawTextBox
proc UI_DrawTextBox 24 20
line 1242
;1240:
;1241:void UI_DrawTextBox (int x, int y, int width, int lines)
;1242:{
line 1243
;1243:	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1244
;1244:	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 1245
;1245:}
LABELV $510
endproc UI_DrawTextBox 24 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 1248
;1246:
;1247:qboolean UI_CursorInRect (int x, int y, int width, int height)
;1248:{
line 1249
;1249:	if (uis.cursorx < x ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $520
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $520
ADDRGP4 uis+8
INDIRI4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
GTI4 $520
ADDRGP4 uis+12
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
LEI4 $512
LABELV $520
line 1253
;1250:		uis.cursory < y ||
;1251:		uis.cursorx > x+width ||
;1252:		uis.cursory > y+height)
;1253:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $511
JUMPV
LABELV $512
line 1255
;1254:
;1255:	return qtrue;
CNSTI4 1
RETI4
LABELV $511
endproc UI_CursorInRect 8 0
import UI_DynamicCommandMenu_f
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
bss
export uis
align 4
LABELV uis
skip 11448
export m_entersound
align 4
LABELV m_entersound
skip 4
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
LABELV $505
byte 1 40
byte 1 37
byte 1 100
byte 1 44
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $432
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $429
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 111
byte 1 110
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $426
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $423
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $420
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $417
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $414
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $411
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $408
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $329
byte 1 85
byte 1 73
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 49
byte 1 0
align 1
LABELV $325
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $323
byte 1 73
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 0
align 1
LABELV $312
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $126
byte 1 48
byte 1 0
align 1
LABELV $125
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
LABELV $113
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 111
byte 1 112
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $97
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $80
byte 1 100
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $71
byte 1 37
byte 1 115
byte 1 0
