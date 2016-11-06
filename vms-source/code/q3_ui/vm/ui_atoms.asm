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
byte 4 3
byte 4 0
byte 4 5
byte 4 11
byte 4 0
byte 4 7
byte 4 21
byte 4 0
byte 4 27
byte 4 51
byte 4 0
byte 4 14
byte 4 68
byte 4 0
byte 4 18
byte 4 89
byte 4 0
byte 4 13
byte 4 105
byte 4 0
byte 4 5
byte 4 113
byte 4 0
byte 4 6
byte 4 122
byte 4 0
byte 4 7
byte 4 132
byte 4 0
byte 4 8
byte 4 143
byte 4 0
byte 4 14
byte 4 160
byte 4 0
byte 4 5
byte 4 168
byte 4 0
byte 4 14
byte 4 185
byte 4 0
byte 4 5
byte 4 193
byte 4 0
byte 4 15
byte 4 211
byte 4 0
byte 4 15
byte 4 229
byte 4 0
byte 4 8
byte 4 240
byte 4 0
byte 4 13
byte 4 256
byte 4 0
byte 4 13
byte 4 272
byte 4 0
byte 4 14
byte 4 289
byte 4 0
byte 4 13
byte 4 305
byte 4 0
byte 4 15
byte 4 323
byte 4 0
byte 4 13
byte 4 339
byte 4 0
byte 4 15
byte 4 357
byte 4 0
byte 4 15
byte 4 375
byte 4 0
byte 4 5
byte 4 383
byte 4 0
byte 4 5
byte 4 391
byte 4 0
byte 4 10
byte 4 404
byte 4 0
byte 4 14
byte 4 421
byte 4 0
byte 4 10
byte 4 434
byte 4 0
byte 4 11
byte 4 448
byte 4 0
byte 4 19
byte 4 470
byte 4 0
byte 4 17
byte 4 490
byte 4 0
byte 4 14
byte 4 0
byte 4 34
byte 4 13
byte 4 16
byte 4 34
byte 4 17
byte 4 36
byte 4 34
byte 4 13
byte 4 52
byte 4 34
byte 4 13
byte 4 68
byte 4 34
byte 4 15
byte 4 86
byte 4 34
byte 4 12
byte 4 101
byte 4 34
byte 4 6
byte 4 110
byte 4 34
byte 4 9
byte 4 122
byte 4 34
byte 4 13
byte 4 138
byte 4 34
byte 4 11
byte 4 152
byte 4 34
byte 4 20
byte 4 175
byte 4 34
byte 4 16
byte 4 194
byte 4 34
byte 4 18
byte 4 215
byte 4 34
byte 4 14
byte 4 232
byte 4 34
byte 4 18
byte 4 253
byte 4 34
byte 4 14
byte 4 270
byte 4 34
byte 4 12
byte 4 285
byte 4 34
byte 4 12
byte 4 300
byte 4 34
byte 4 16
byte 4 319
byte 4 34
byte 4 16
byte 4 338
byte 4 34
byte 4 22
byte 4 363
byte 4 34
byte 4 15
byte 4 381
byte 4 34
byte 4 15
byte 4 399
byte 4 34
byte 4 13
byte 4 415
byte 4 34
byte 4 9
byte 4 427
byte 4 34
byte 4 14
byte 4 444
byte 4 34
byte 4 9
byte 4 456
byte 4 34
byte 4 19
byte 4 478
byte 4 34
byte 4 17
byte 4 498
byte 4 34
byte 4 6
byte 4 0
byte 4 68
byte 4 17
byte 4 20
byte 4 68
byte 4 14
byte 4 37
byte 4 68
byte 4 13
byte 4 53
byte 4 68
byte 4 17
byte 4 73
byte 4 68
byte 4 13
byte 4 89
byte 4 68
byte 4 13
byte 4 105
byte 4 68
byte 4 15
byte 4 123
byte 4 68
byte 4 12
byte 4 138
byte 4 68
byte 4 6
byte 4 147
byte 4 68
byte 4 9
byte 4 159
byte 4 68
byte 4 13
byte 4 175
byte 4 68
byte 4 11
byte 4 189
byte 4 68
byte 4 20
byte 4 212
byte 4 68
byte 4 16
byte 4 231
byte 4 68
byte 4 18
byte 4 252
byte 4 68
byte 4 14
byte 4 269
byte 4 68
byte 4 18
byte 4 290
byte 4 68
byte 4 14
byte 4 307
byte 4 68
byte 4 12
byte 4 322
byte 4 68
byte 4 12
byte 4 337
byte 4 68
byte 4 16
byte 4 356
byte 4 68
byte 4 16
byte 4 375
byte 4 68
byte 4 22
byte 4 400
byte 4 68
byte 4 15
byte 4 418
byte 4 68
byte 4 15
byte 4 436
byte 4 68
byte 4 13
byte 4 452
byte 4 68
byte 4 10
byte 4 465
byte 4 68
byte 4 4
byte 4 472
byte 4 68
byte 4 10
byte 4 485
byte 4 68
byte 4 7
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 0
byte 4 0
byte 4 40
byte 4 40
byte 4 0
byte 4 38
byte 4 78
byte 4 0
byte 4 33
byte 4 111
byte 4 0
byte 4 38
byte 4 149
byte 4 0
byte 4 39
byte 4 188
byte 4 0
byte 4 34
byte 4 0
byte 4 48
byte 4 36
byte 4 36
byte 4 48
byte 4 38
byte 4 74
byte 4 48
byte 4 13
byte 4 87
byte 4 48
byte 4 27
byte 4 114
byte 4 48
byte 4 39
byte 4 153
byte 4 48
byte 4 33
byte 4 186
byte 4 48
byte 4 49
byte 4 0
byte 4 96
byte 4 42
byte 4 42
byte 4 96
byte 4 40
byte 4 82
byte 4 96
byte 4 37
byte 4 119
byte 4 96
byte 4 39
byte 4 158
byte 4 96
byte 4 37
byte 4 195
byte 4 96
byte 4 38
byte 4 0
byte 4 144
byte 4 46
byte 4 46
byte 4 144
byte 4 37
byte 4 83
byte 4 144
byte 4 41
byte 4 124
byte 4 144
byte 4 54
byte 4 178
byte 4 144
byte 4 41
byte 4 219
byte 4 144
byte 4 37
byte 4 0
byte 4 192
byte 4 36
code
proc UI_DrawBannerString2 52 36
line 468
;168:
;169:/*
;170:=================
;171:UI_DrawProportionalString2
;172:=================
;173:*/
;174:
;175:
;176:/*
;177:static int	propMap[128][3] = {
;178:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;179:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;180:
;181:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;182:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;183:
;184:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;185:{11, 122, 7},	// !
;186:{154, 181, 14},	// "
;187:{55, 122, 17},	// #
;188:{79, 122, 18},	// $
;189:{101, 122, 23},	// %
;190:{153, 122, 18},	// &
;191:{9, 93, 7},		// '
;192:{207, 122, 8},	// (
;193:{230, 122, 9},	// )
;194:{177, 122, 18},	// *
;195:{30, 152, 18},	// +
;196:{85, 181, 7},	// ,
;197:{34, 93, 11},	// -
;198:{110, 181, 6},	// .
;199:{130, 152, 14},	// /
;200:
;201:{22, 64, 17},	// 0
;202:{41, 64, 12},	// 1
;203:{58, 64, 17},	// 2
;204:{78, 64, 18},	// 3
;205:{98, 64, 19},	// 4
;206:{120, 64, 18},	// 5
;207:{141, 64, 18},	// 6
;208:{204, 64, 16},	// 7
;209:{162, 64, 17},	// 8
;210:{182, 64, 18},	// 9
;211:{59, 181, 7},	// :
;212:{35,181, 7},	// ;
;213:{203, 152, 14},	// <
;214:{56, 93, 14},	// =
;215:{228, 152, 14},	// >
;216:{177, 181, 18},	// ?
;217:
;218:{28, 122, 22},	// @
;219:{5, 4, 18},		// A
;220:{27, 4, 18},	// B
;221:{48, 4, 18},	// C
;222:{69, 4, 17},	// D
;223:{90, 4, 13},	// E
;224:{106, 4, 13},	// F
;225:{121, 4, 18},	// G
;226:{143, 4, 17},	// H
;227:{164, 4, 8},	// I
;228:{175, 4, 16},	// J
;229:{195, 4, 18},	// K
;230:{216, 4, 12},	// L
;231:{230, 4, 23},	// M
;232:{6, 34, 18},	// N
;233:{27, 34, 18},	// O
;234:
;235:{48, 34, 18},	// P
;236:{68, 34, 18},	// Q
;237:{90, 34, 17},	// R
;238:{110, 34, 18},	// S
;239:{130, 34, 14},	// T
;240:{146, 34, 18},	// U
;241:{166, 34, 19},	// V
;242:{185, 34, 29},	// W
;243:{215, 34, 18},	// X
;244:{234, 34, 18},	// Y
;245:{5, 64, 14},	// Z
;246:{60, 152, 7},	// [
;247:{106, 151, 13},	// '\'
;248:{83, 152, 7},	// ]
;249:{128, 122, 17},	// ^
;250:{4, 152, 21},	// _
;251:
;252:{134, 181, 5},	// '
;253:{5, 4, 18},		// A
;254:{27, 4, 18},	// B
;255:{48, 4, 18},	// C
;256:{69, 4, 17},	// D
;257:{90, 4, 13},	// E
;258:{106, 4, 13},	// F
;259:{121, 4, 18},	// G
;260:{143, 4, 17},	// H
;261:{164, 4, 8},	// I
;262:{175, 4, 16},	// J
;263:{195, 4, 18},	// K
;264:{216, 4, 12},	// L
;265:{230, 4, 23},	// M
;266:{6, 34, 18},	// N
;267:{27, 34, 18},	// O
;268:
;269:{48, 34, 18},	// P
;270:{68, 34, 18},	// Q
;271:{90, 34, 17},	// R
;272:{110, 34, 18},	// S
;273:{130, 34, 14},	// T
;274:{146, 34, 18},	// U
;275:{166, 34, 19},	// V
;276:{185, 34, 29},	// W
;277:{215, 34, 18},	// X
;278:{234, 34, 18},	// Y
;279:{5, 64, 14},	// Z
;280:{153, 152, 13},	// {
;281:{11, 181, 5},	// |
;282:{180, 152, 13},	// }
;283:{79, 93, 17},	// ~
;284:{0, 0, -1}		// DEL
;285:};
;286:*/
;287:static int	propMap[128][3] = {
;288:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;289:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;290:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;291:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;292:{0, 0, PROP_SPACE_WIDTH}, 	// SPACE
;293:{3, 0, 5}, 	// !
;294:{11, 0, 7}, 	// "
;295:{21, 0, 27}, 	// #
;296:{51, 0, 14}, 	// $
;297:{68, 0, 18}, 	// %
;298:{89, 0, 13}, 	// &
;299:{105, 0, 5}, 	// '
;300:{113, 0, 6}, 	// (
;301:{122, 0, 7}, 	// )
;302:{132, 0, 8}, 	// *
;303:{143, 0, 14}, 	// +
;304:{160, 0, 5}, 	// ,
;305:{168, 0, 14}, 	// -
;306:{185, 0, 5}, 	// .
;307:{193, 0, 15}, 	// /
;308:{211, 0, 15}, 	// 0
;309:{229, 0, 8}, 	// 1
;310:{240, 0, 13}, 	// 2
;311:{256, 0, 13}, 	// 3
;312:{272, 0, 14}, 	// 4
;313:{289, 0, 13}, 	// 5
;314:{305, 0, 15}, 	// 6
;315:{323, 0, 13}, 	// 7
;316:{339, 0, 15}, 	// 8
;317:{357, 0, 15}, 	// 9
;318:{375, 0, 5}, 	// :
;319:{383, 0, 5}, 	// ;
;320:{391, 0, 10}, 	// <
;321:{404, 0, 14}, 	// =
;322:{421, 0, 10}, 	// >
;323:{434, 0, 11}, 	// ?
;324:{448, 0, 19}, 	// @
;325:{470, 0, 17}, 	// A
;326:{490, 0, 14}, 	// B
;327:{0, 34, 13}, 	// C
;328:{16, 34, 17}, 	// D
;329:{36, 34, 13}, 	// E
;330:{52, 34, 13}, 	// F
;331:{68, 34, 15}, 	// G
;332:{86, 34, 12}, 	// H
;333:{101, 34, 6}, 	// I
;334:{110, 34, 9}, 	// J
;335:{122, 34, 13}, 	// K
;336:{138, 34, 11}, 	// L
;337:{152, 34, 20}, 	// M
;338:{175, 34, 16}, 	// N
;339:{194, 34, 18}, 	// O
;340:{215, 34, 14}, 	// P
;341:{232, 34, 18}, 	// Q
;342:{253, 34, 14}, 	// R
;343:{270, 34, 12}, 	// S
;344:{285, 34, 12}, 	// T
;345:{300, 34, 16}, 	// U
;346:{319, 34, 16}, 	// V
;347:{338, 34, 22}, 	// W
;348:{363, 34, 15}, 	// X
;349:{381, 34, 15}, 	// Y
;350:{399, 34, 13}, 	// Z
;351:{415, 34, 9}, 	// [
;352:{427, 34, 14}, 	// '\'
;353:{444, 34, 9}, 	// ]
;354:{456, 34, 19}, 	// ^
;355:{478, 34, 17}, 	// _
;356:{498, 34, 6}, 	// `
;357:{0, 68, 17}, 	// a
;358:{20, 68, 14}, 	// b
;359:{37, 68, 13}, 	// c
;360:{53, 68, 17}, 	// d
;361:{73, 68, 13}, 	// e
;362:{89, 68, 13}, 	// f
;363:{105, 68, 15}, 	// g
;364:{123, 68, 12}, 	// h
;365:{138, 68, 6}, 	// i
;366:{147, 68, 9}, 	// j
;367:{159, 68, 13}, 	// k
;368:{175, 68, 11}, 	// l
;369:{189, 68, 20}, 	// m
;370:{212, 68, 16}, 	// n
;371:{231, 68, 18}, 	// o
;372:{252, 68, 14}, 	// p
;373:{269, 68, 18}, 	// q
;374:{290, 68, 14}, 	// r
;375:{307, 68, 12}, 	// s
;376:{322, 68, 12}, 	// t
;377:{337, 68, 16}, 	// u
;378:{356, 68, 16}, 	// v
;379:{375, 68, 22}, 	// w
;380:{400, 68, 15}, 	// x
;381:{418, 68, 15}, 	// y
;382:{436, 68, 13}, 	// z
;383:{452, 68, 10}, 	// {
;384:{465, 68, 4}, 	// |
;385:{472, 68, 10}, 	// }
;386:{485, 68, 7}, 	// ~
;387:{0, 0, -1} 	// DEL
;388:};
;389:
;390:static int propMapB[26][3] = {
;391:{0, 0, 40} ,
;392:{40, 0, 38} ,
;393:{78, 0, 33} ,
;394:{111, 0, 38} ,
;395:{149, 0, 39} ,
;396:{188, 0, 34} ,
;397:{0, 48, 36} ,
;398:{36, 48, 38} ,
;399:{74, 48, 13} ,
;400:{87, 48, 27} ,
;401:{114, 48, 39} ,
;402:{153, 48, 33} ,
;403:{186, 48, 49} ,
;404:{0, 96, 42} ,
;405:{42, 96, 40} ,
;406:{82, 96, 37} ,
;407:{119, 96, 39} ,
;408:{158, 96, 37} ,
;409:{195, 96, 38} ,
;410:{0, 144, 46} ,
;411:{46, 144, 37} ,
;412:{83, 144, 41} ,
;413:{124, 144, 54} ,
;414:{178, 144, 41} ,
;415:{219, 144, 37} ,
;416:{0, 192, 36} 
;417:};
;418:
;419:#define PROPB_GAP_WIDTH 	4
;420:#define PROPB_SPACE_WIDTH	15
;421:#define PROPB_HEIGHT		48
;422:
;423:/*
;424:static int propMapB[26][3] = {
;425:{11, 12, 33},
;426:{49, 12, 31},
;427:{85, 12, 31},
;428:{120, 12, 30},
;429:{156, 12, 21},
;430:{183, 12, 21},
;431:{207, 12, 32},
;432:
;433:{13, 55, 30},
;434:{49, 55, 13},
;435:{66, 55, 29},
;436:{101, 55, 31},
;437:{135, 55, 21},
;438:{158, 55, 40},
;439:{204, 55, 32},
;440:
;441:{12, 97, 31},
;442:{48, 97, 31},
;443:{82, 97, 30},
;444:{118, 97, 30},
;445:{153, 97, 30},
;446:{185, 97, 25},
;447:{213, 97, 30},
;448:
;449:{11, 139, 32},
;450:{42, 139, 51},
;451:{93, 139, 32},
;452:{126, 139, 31},
;453:{158, 139, 25},
;454:};
;455:
;456:#define PROPB_GAP_WIDTH		4
;457:#define PROPB_SPACE_WIDTH	12
;458:#define PROPB_HEIGHT		36
;459:/*
;460:// bk001205 - code below duplicated in cgame/cg_drawtools.c
;461:// bk001205 - FIXME: does this belong in ui_shared.c?
;462:/*
;463:=================
;464:UI_DrawBannerString
;465:=================
;466:*/
;467:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;468:{
line 481
;469:	const char* s;
;470:	unsigned char	ch; // bk001204 - unsigned
;471:	float	ax;
;472:	float	ay;
;473:	float	aw;
;474:	float	ah;
;475:	float	frow;
;476:	float	fcol;
;477:	float	fwidth;
;478:	float	fheight;
;479:
;480:	// draw the colored text
;481:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 483
;482:	
;483:	ax = x * uis.scale + uis.bias;
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
line 484
;484:	ay = y * uis.scale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 486
;485:
;486:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $140
line 488
;487:	while ( *s )
;488:	{
line 489
;489:		ch = *s & 127;
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
line 490
;490:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $143
line 491
;491:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* uis.scale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1100480512
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDF4
ASGNF4
line 492
;492:		}
ADDRGP4 $144
JUMPV
LABELV $143
line 493
;493:		else if ( ch >= 'A' && ch <= 'Z' ) {
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
line 494
;494:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 495
;495:			fcol = (float)propMapB[ch][0] / 256.0f;
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
line 496
;496:			frow = (float)propMapB[ch][1] / 256.0f;
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
line 497
;497:			fwidth = (float)propMapB[ch][2] / 256.0f;
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
line 498
;498:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1044381696
ASGNF4
line 499
;499:			aw = (float)propMapB[ch][2] * uis.scale;
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
line 500
;500:			ah = (float)PROPB_HEIGHT * uis.scale;
ADDRLP4 24
CNSTF4 1111490560
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 501
;501:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, uis.charsetPropB );
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
line 502
;502:			ax += (aw + (float)PROPB_GAP_WIDTH * uis.scale);
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
line 503
;503:		}
LABELV $146
LABELV $144
line 504
;504:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 505
;505:	}
LABELV $141
line 487
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $140
line 507
;506:
;507:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 508
;508:}
LABELV $136
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 510
;509:
;510:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 517
;511:	const char *	s;
;512:	int				ch;
;513:	int				width;
;514:	vec4_t			drawcolor;
;515:
;516:	// find the width of the drawn text
;517:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 518
;518:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 519
;519:	while ( *s ) {
line 520
;520:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 521
;521:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $159
line 522
;522:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 523
;523:		}
ADDRGP4 $160
JUMPV
LABELV $159
line 524
;524:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $161
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $161
line 525
;525:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
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
line 526
;526:		}
LABELV $161
LABELV $160
line 527
;527:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 528
;528:	}
LABELV $157
line 519
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $156
line 529
;529:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 531
;530:
;531:	switch( style & UI_FORMATMASK ) {
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
line 533
;532:		case UI_CENTER:
;533:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 534
;534:			break;
ADDRGP4 $166
JUMPV
LABELV $169
line 537
;535:
;536:		case UI_RIGHT:
;537:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 538
;538:			break;
line 542
;539:
;540:		case UI_LEFT:
;541:		default:
;542:			break;
LABELV $166
line 545
;543:	}
;544:
;545:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $171
line 546
;546:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 547
;547:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 548
;548:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
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
line 549
;549:	}
LABELV $171
line 551
;550:
;551:	UI_DrawBannerString2( x, y, str, color );
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
line 552
;552:}
LABELV $155
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 555
;553:
;554:
;555:int UI_ProportionalStringWidth( const char* str ) {
line 561
;556:	const char *	s;
;557:	int				ch;
;558:	int				charWidth;
;559:	int				width;
;560:
;561:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 562
;562:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $177
line 563
;563:	while ( *s ) {
line 564
;564:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 565
;565:		charWidth = propMap[ch][2];
ADDRLP4 4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 566
;566:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $181
line 567
;567:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 568
;568:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 569
;569:		}
LABELV $181
line 570
;570:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 571
;571:	}
LABELV $178
line 563
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 573
;572:
;573:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 574
;574:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $176
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 578
;575:}
;576:
;577:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;578:{
line 583
;579:	const char* s;
;580:	unsigned char	ch; // bk001204 - unsigned
;581:	float	ax;
;582:	float	ay;
;583:	float	aw = 0; // bk001204 - init
ADDRLP4 8
CNSTF4 0
ASGNF4
line 591
;584:	float	ah;
;585:	float	frow;
;586:	float	fcol;
;587:	float	fwidth;
;588:	float	fheight;
;589:
;590:	// draw the colored text
;591:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 593
;592:	
;593:	ax = x * uis.scale + uis.bias;
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
line 594
;594:	ay = y * uis.scale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 596
;595:
;596:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $187
line 598
;597:	while ( *s )
;598:	{
line 599
;599:		ch = *s & 127;
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
line 600
;600:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $190
line 601
;601:			aw = (float)PROP_SPACE_WIDTH * uis.scale * sizeScale;
ADDRLP4 8
CNSTF4 1090519040
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 602
;602:		}
ADDRGP4 $191
JUMPV
LABELV $190
line 603
;603:		else if ( propMap[ch][2] != -1 ) {
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
line 604
;604:fcol = (float)propMap[ch][0] / 512.0f;
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
CNSTF4 1140850688
DIVF4
ASGNF4
line 605
;605:frow = (float)propMap[ch][1] / 256.0f;
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
line 606
;606:fwidth = (float)propMap[ch][2] / 512.0f;
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
CNSTF4 1140850688
DIVF4
ASGNF4
line 607
;607:fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 614
;608:			/*
;609:			fcol = (float)propMap[ch][0] / 256.0f;
;610:			frow = (float)propMap[ch][1] / 256.0f;
;611:			fwidth = (float)propMap[ch][2] / 256.0f;
;612:			fheight = (float)PROP_HEIGHT / 256.0f;
;613:			*/
;614:			aw = (float)propMap[ch][2] * uis.scale * sizeScale;
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
line 615
;615:			ah = (float)PROP_HEIGHT * uis.scale * sizeScale;
ADDRLP4 24
CNSTF4 1104674816
ADDRGP4 uis+11432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 616
;616:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
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
line 617
;617:		}
LABELV $193
LABELV $191
line 619
;618:
;619:		ax += (aw + (float)PROP_GAP_WIDTH * uis.scale * sizeScale);
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
line 620
;620:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 621
;621:	}
LABELV $188
line 597
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
line 623
;622:
;623:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 624
;624:}
LABELV $183
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 631
;625:
;626:/*
;627:=================
;628:UI_ProportionalSizeScale
;629:=================
;630:*/
;631:float UI_ProportionalSizeScale( int style ) {
line 632
;632:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $203
line 633
;633:		return PROP_SMALL_SIZE_SCALE;
CNSTF4 1061158912
RETF4
ADDRGP4 $202
JUMPV
LABELV $203
line 636
;634:	}
;635:
;636:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $202
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 645
;637:}
;638:
;639:
;640:/*
;641:=================
;642:UI_DrawProportionalString
;643:=================
;644:*/
;645:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 650
;646:	vec4_t	drawcolor;
;647:	int		width;
;648:	float	sizeScale;
;649:
;650:	sizeScale = UI_ProportionalSizeScale( style );
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
line 652
;651:
;652:	switch( style & UI_FORMATMASK ) {
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
line 654
;653:		case UI_CENTER:
;654:			width = UI_ProportionalStringWidth( str ) * sizeScale;
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
line 655
;655:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 656
;656:			break;
ADDRGP4 $207
JUMPV
LABELV $210
line 659
;657:
;658:		case UI_RIGHT:
;659:			width = UI_ProportionalStringWidth( str ) * sizeScale;
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
line 660
;660:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 661
;661:			break;
line 665
;662:
;663:		case UI_LEFT:
;664:		default:
;665:			break;
LABELV $207
line 668
;666:	}
;667:
;668:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $212
line 669
;669:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 670
;670:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 671
;671:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, uis.charsetProp );
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
line 672
;672:	}
LABELV $212
line 674
;673:
;674:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $218
line 675
;675:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 676
;676:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 677
;677:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 678
;678:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 679
;679:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetProp );
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
line 680
;680:		return;
ADDRGP4 $205
JUMPV
LABELV $218
line 683
;681:	}
;682:
;683:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $224
line 684
;684:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 685
;685:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 686
;686:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
CNSTF4 1060320051
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 687
;687:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 688
;688:		UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
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
line 690
;689:
;690:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 691
;691:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 692
;692:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 693
;693:		drawcolor[3] = 0.5 + 0.5 * sin( uis.realtime / PULSE_DIVISOR );
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
line 694
;694:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, uis.charsetPropGlow );
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
line 695
;695:		return;
ADDRGP4 $205
JUMPV
LABELV $224
line 698
;696:	}
;697:
;698:	UI_DrawProportionalString2( x, y, str, color, sizeScale, uis.charsetProp );
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
line 699
;699:}
LABELV $205
endproc UI_DrawProportionalString 44 24
export UI_DrawProportionalString_AutoWrapped
proc UI_DrawProportionalString_AutoWrapped 1064 20
line 706
;700:
;701:/*
;702:=================
;703:UI_DrawProportionalString_Wrapped
;704:=================
;705:*/
;706:void UI_DrawProportionalString_AutoWrapped( int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color ) {
line 713
;707:	int width;
;708:	char *s1,*s2,*s3;
;709:	char c_bcp;
;710:	char buf[1024];
;711:	float   sizeScale;
;712:
;713:	if (!str || str[0]=='\0')
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
line 714
;714:		return;
ADDRGP4 $236
JUMPV
LABELV $237
line 716
;715:	
;716:	sizeScale = UI_ProportionalSizeScale( style );
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
line 718
;717:	
;718:	Q_strncpyz(buf, str, sizeof(buf));
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
line 719
;719:	s1 = s2 = s3 = buf;
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
line 721
;720:
;721:	while (1) {
LABELV $243
line 722
;722:		do {
line 723
;723:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 724
;724:		} while (*s3!=' ' && *s3!='\0');
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
line 725
;725:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 726
;726:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 727
;727:		width = UI_ProportionalStringWidth(s1) * sizeScale;
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
line 728
;728:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 729
;729:		if (width > xmax) {
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $247
line 730
;730:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $249
line 731
;731:			{
line 733
;732:				// fuck, don't have a clean cut, we'll overflow
;733:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 734
;734:			}
LABELV $249
line 735
;735:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 736
;736:			UI_DrawProportionalString(x, y, s1, style, color);
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
line 737
;737:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ASGNI4
line 738
;738:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $251
line 739
;739:      {
line 744
;740:        // that was the last word
;741:        // we could start a new loop, but that wouldn't be much use
;742:        // even if the word is too long, we would overflow it (see above)
;743:        // so just print it now if needed
;744:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 745
;745:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $242
line 746
;746:          UI_DrawProportionalString(x, y, s2, style, color);
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
line 747
;747:				break; 
ADDRGP4 $242
JUMPV
LABELV $251
line 749
;748:      }
;749:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 750
;750:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 751
;751:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 752
;752:		}
ADDRGP4 $248
JUMPV
LABELV $247
line 754
;753:		else
;754:		{
line 755
;755:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 756
;756:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $255
line 757
;757:			{
line 758
;758:				UI_DrawProportionalString(x, y, s1, style, color);
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
line 759
;759:				break;
ADDRGP4 $242
JUMPV
LABELV $255
line 761
;760:			}
;761:		}
LABELV $248
line 762
;762:	}
LABELV $241
line 721
ADDRGP4 $240
JUMPV
LABELV $242
line 763
;763:}
LABELV $236
endproc UI_DrawProportionalString_AutoWrapped 1064 20
proc UI_DrawString2 76 36
line 771
;764:
;765:/*
;766:=================
;767:UI_DrawString2
;768:=================
;769:*/
;770:static void UI_DrawString2( int x, int y, const char* str, vec4_t color, int charw, int charh )
;771:{
line 774
;772:	const char* s;
;773:	char	ch;
;774:	int forceColor = qfalse; //APSFIXME;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 783
;775:	vec4_t	tempcolor;
;776:	float	ax;
;777:	float	ay;
;778:	float	aw;
;779:	float	ah;
;780:	float	frow;
;781:	float	fcol;
;782:
;783:	if (y < -charh)
ADDRFP4 4
INDIRI4
ADDRFP4 20
INDIRI4
NEGI4
GEI4 $258
line 785
;784:		// offscreen
;785:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 788
;786:
;787:	// draw the colored text
;788:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 790
;789:	
;790:	ax = x * uis.scale + uis.bias;
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
line 791
;791:	ay = y * uis.scale;
ADDRLP4 44
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 792
;792:	aw = charw * uis.scale;
ADDRLP4 12
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 793
;793:	ah = charh * uis.scale;
ADDRLP4 48
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRGP4 uis+11432
INDIRF4
MULF4
ASGNF4
line 795
;794:
;795:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $266
JUMPV
LABELV $265
line 797
;796:	while ( *s )
;797:	{
line 798
;798:		if ( Q_IsColorString( s ) )
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
line 799
;799:		{
line 800
;800:			if ( !forceColor )
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $270
line 801
;801:			{
line 802
;802:				memcpy( tempcolor, g_color_table[ColorIndex(s[1])], sizeof( tempcolor ) );
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
line 803
;803:				tempcolor[3] = color[3];
ADDRLP4 24+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 804
;804:				trap_R_SetColor( tempcolor );
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 805
;805:			}
LABELV $270
line 806
;806:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 807
;807:			continue;
ADDRGP4 $266
JUMPV
LABELV $268
line 810
;808:		}
;809:
;810:		ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 811
;811:		if (ch != ' ')
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $273
line 812
;812:		{
line 813
;813:			frow = (ch>>4)*0.0625;
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
line 814
;814:			fcol = (ch&15)*0.0625;
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
line 815
;815:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset );
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
line 816
;816:		}
LABELV $273
line 818
;817:
;818:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 819
;819:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 820
;820:	}
LABELV $266
line 796
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $265
line 822
;821:
;822:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 823
;823:}
LABELV $257
endproc UI_DrawString2 76 36
export UI_DrawString
proc UI_DrawString 84 24
line 831
;824:
;825:/*
;826:=================
;827:UI_DrawString
;828:=================
;829:*/
;830:void UI_DrawString( int x, int y, const char* str, int style, vec4_t color )
;831:{
line 840
;832:	int		len;
;833:	int		charw;
;834:	int		charh;
;835:	vec4_t	newcolor;
;836:	vec4_t	lowlight;
;837:	float	*drawcolor;
;838:	vec4_t	dropcolor;
;839:
;840:	if( !str ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $277
line 841
;841:		return;
ADDRGP4 $276
JUMPV
LABELV $277
line 844
;842:	}
;843:
;844:	if ((style & UI_BLINK) && ((uis.realtime/BLINK_DIVISOR) & 1))
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
line 845
;845:		return;
ADDRGP4 $276
JUMPV
LABELV $279
line 847
;846:
;847:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $282
line 848
;848:	{
line 849
;849:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 850
;850:		charh =	SMALLCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 851
;851:	}
ADDRGP4 $283
JUMPV
LABELV $282
line 852
;852:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $284
line 853
;853:	{
line 854
;854:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 855
;855:		charh =	GIANTCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 48
ASGNI4
line 856
;856:	}
ADDRGP4 $285
JUMPV
LABELV $284
line 858
;857:	else
;858:	{
line 859
;859:		charw =	BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 860
;860:		charh =	BIGCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 861
;861:	}
LABELV $285
LABELV $283
line 863
;862:
;863:	if (style & UI_PULSE)
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $286
line 864
;864:	{
line 865
;865:		lowlight[0] = 0.8*color[0]; 
ADDRLP4 8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 866
;866:		lowlight[1] = 0.8*color[1];
ADDRLP4 8+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 867
;867:		lowlight[2] = 0.8*color[2];
ADDRLP4 8+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 868
;868:		lowlight[3] = 0.8*color[3];
ADDRLP4 8+12
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 869
;869:		UI_LerpColor(color,lowlight,newcolor,0.5+0.5*sin(uis.realtime/PULSE_DIVISOR));
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
line 870
;870:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 871
;871:	}	
ADDRGP4 $287
JUMPV
LABELV $286
line 873
;872:	else
;873:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $287
line 875
;874:
;875:	switch (style & UI_FORMATMASK)
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
line 876
;876:	{
LABELV $295
line 879
;877:		case UI_CENTER:
;878:			// center justify at x
;879:			len = strlen(str);
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
line 880
;880:			x   = x - len*charw/2;
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
line 881
;881:			break;
ADDRGP4 $293
JUMPV
LABELV $296
line 885
;882:
;883:		case UI_RIGHT:
;884:			// right justify at x
;885:			len = strlen(str);
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
line 886
;886:			x   = x - len*charw;
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
line 887
;887:			break;
line 891
;888:
;889:		default:
;890:			// left justify at x
;891:			break;
LABELV $293
line 894
;892:	}
;893:
;894:	if ( style & UI_DROPSHADOW )
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $297
line 895
;895:	{
line 896
;896:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
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
line 897
;897:		dropcolor[3] = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 898
;898:		UI_DrawString2(x+2,y+2,str,dropcolor,charw,charh);
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
line 899
;899:	}
LABELV $297
line 901
;900:
;901:	UI_DrawString2(x,y,str,drawcolor,charw,charh);
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
line 902
;902:}
LABELV $276
endproc UI_DrawString 84 24
export UI_DrawChar
proc UI_DrawChar 2 20
line 910
;903:
;904:/*
;905:=================
;906:UI_DrawChar
;907:=================
;908:*/
;909:void UI_DrawChar( int x, int y, int ch, int style, vec4_t color )
;910:{
line 913
;911:	char	buff[2];
;912:
;913:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 914
;914:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 916
;915:
;916:	UI_DrawString( x, y, buff, style, color );
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
line 917
;917:}
LABELV $302
endproc UI_DrawChar 2 20
export UI_IsFullscreen
proc UI_IsFullscreen 4 0
line 919
;918:
;919:qboolean UI_IsFullscreen( void ) {
line 920
;920:	if ( uis.activemenu && ( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
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
line 921
;921:		return uis.activemenu->fullscreen;
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
RETI4
ADDRGP4 $304
JUMPV
LABELV $305
line 924
;922:	}
;923:
;924:	return qfalse;
CNSTI4 0
RETI4
LABELV $304
endproc UI_IsFullscreen 4 0
proc NeedCDAction 0 8
line 927
;925:}
;926:
;927:static void NeedCDAction( qboolean result ) {
line 928
;928:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $310
line 929
;929:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $312
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 930
;930:	}
LABELV $310
line 931
;931:}
LABELV $309
endproc NeedCDAction 0 8
proc NeedCDKeyAction 0 8
line 933
;932:
;933:static void NeedCDKeyAction( qboolean result ) {
line 934
;934:	if ( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $314
line 935
;935:		trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $312
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 936
;936:	}
LABELV $314
line 937
;937:}
LABELV $313
endproc NeedCDKeyAction 0 8
export UI_SetActiveMenu
proc UI_SetActiveMenu 8 12
line 939
;938:
;939:void UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 942
;940:	// this should be the ONLY way the menu system is brought up
;941:	// enusure minumum menu data is cached
;942:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 944
;943:
;944:	switch ( menu ) {
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
line 946
;945:	case UIMENU_NONE:
;946:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 947
;947:		return;
ADDRGP4 $316
JUMPV
LABELV $321
line 949
;948:	case UIMENU_MAIN:
;949:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 950
;950:		return;
ADDRGP4 $316
JUMPV
LABELV $322
line 952
;951:	case UIMENU_NEED_CD:
;952:		UI_ConfirmMenu( "Insert the CD", NULL, NeedCDAction );
ADDRGP4 $323
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 953
;953:		return;
ADDRGP4 $316
JUMPV
LABELV $324
line 955
;954:	case UIMENU_BAD_CD_KEY:
;955:		UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
ADDRGP4 $325
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDKeyAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 956
;956:		return;
ADDRGP4 $316
JUMPV
LABELV $326
line 963
;957:	case UIMENU_INGAME:
;958:		/*
;959:		//GRank
;960:		UI_RankingsMenu();
;961:		return;
;962:		*/
;963:		trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $125
ARGP4
ADDRGP4 $327
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 964
;964:		UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 965
;965:		return;
ADDRGP4 $316
JUMPV
LABELV $328
LABELV $317
line 972
;966:		
;967:	// bk001204
;968:	case UIMENU_TEAM:
;969:	case UIMENU_POSTGAME:
;970:	default:
;971:#ifndef NDEBUG
;972:	  Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu );
ADDRGP4 $329
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 974
;973:#endif
;974:	  break;
LABELV $318
line 976
;975:	}
;976:}
LABELV $316
endproc UI_SetActiveMenu 8 12
export UI_KeyEvent
proc UI_KeyEvent 16 8
line 983
;977:
;978:/*
;979:=================
;980:UI_KeyEvent
;981:=================
;982:*/
;983:void UI_KeyEvent( int key, int down ) {
line 986
;984:	sfxHandle_t		s;
;985:
;986:	if (!uis.activemenu) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $332
line 987
;987:		return;
ADDRGP4 $331
JUMPV
LABELV $332
line 990
;988:	}
;989:
;990:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $335
line 991
;991:		return;
ADDRGP4 $331
JUMPV
LABELV $335
line 994
;992:	}
;993:
;994:	if (uis.activemenu->key)
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $337
line 995
;995:		s = uis.activemenu->key( key );
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
line 997
;996:	else
;997:		s = Menu_DefaultKey( uis.activemenu, key );
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
line 999
;998:
;999:	if ((s > 0) && (s != menu_null_sound))
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $342
ADDRLP4 0
INDIRI4
ADDRGP4 menu_null_sound
INDIRI4
EQI4 $342
line 1000
;1000:		trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $342
line 1001
;1001:}
LABELV $331
endproc UI_KeyEvent 16 8
export UI_MouseEvent
proc UI_MouseEvent 24 8
line 1009
;1002:
;1003:/*
;1004:=================
;1005:UI_MouseEvent
;1006:=================
;1007:*/
;1008:void UI_MouseEvent( int dx, int dy )
;1009:{
line 1013
;1010:	int				i;
;1011:	menucommon_s*	m;
;1012:
;1013:	if (!uis.activemenu)
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $345
line 1014
;1014:		return;
ADDRGP4 $344
JUMPV
LABELV $345
line 1017
;1015:
;1016:	// update mouse screen position
;1017:	uis.cursorx += dx;
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
line 1018
;1018:	if (uis.cursorx < 0)
ADDRGP4 uis+8
INDIRI4
CNSTI4 0
GEI4 $349
line 1019
;1019:		uis.cursorx = 0;
ADDRGP4 uis+8
CNSTI4 0
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 1020
;1020:	else if (uis.cursorx > SCREEN_WIDTH)
ADDRGP4 uis+8
INDIRI4
CNSTI4 640
LEI4 $353
line 1021
;1021:		uis.cursorx = SCREEN_WIDTH;
ADDRGP4 uis+8
CNSTI4 640
ASGNI4
LABELV $353
LABELV $350
line 1023
;1022:
;1023:	uis.cursory += dy;
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
line 1024
;1024:	if (uis.cursory < 0)
ADDRGP4 uis+12
INDIRI4
CNSTI4 0
GEI4 $358
line 1025
;1025:		uis.cursory = 0;
ADDRGP4 uis+12
CNSTI4 0
ASGNI4
ADDRGP4 $359
JUMPV
LABELV $358
line 1026
;1026:	else if (uis.cursory > SCREEN_HEIGHT)
ADDRGP4 uis+12
INDIRI4
CNSTI4 480
LEI4 $362
line 1027
;1027:		uis.cursory = SCREEN_HEIGHT;
ADDRGP4 uis+12
CNSTI4 480
ASGNI4
LABELV $362
LABELV $359
line 1030
;1028:
;1029:	// region test the active menu items
;1030:	for (i=0; i<uis.activemenu->nitems; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 1031
;1031:	{
line 1032
;1032:		m = (menucommon_s*)uis.activemenu->items[i];
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
line 1034
;1033:
;1034:		if (m->flags & (QMF_GRAYED|QMF_INACTIVE))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $372
line 1035
;1035:			continue;
ADDRGP4 $367
JUMPV
LABELV $372
line 1037
;1036:
;1037:		if ((uis.cursorx < m->left) ||
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
line 1041
;1038:			(uis.cursorx > m->right) ||
;1039:			(uis.cursory < m->top) ||
;1040:			(uis.cursory > m->bottom))
;1041:		{
line 1043
;1042:			// cursor out of item bounds
;1043:			continue;
ADDRGP4 $367
JUMPV
LABELV $374
line 1047
;1044:		}
;1045:
;1046:		// set focus to item at cursor
;1047:		if (uis.activemenu->cursor != i)
ADDRGP4 uis+20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $383
line 1048
;1048:		{
line 1049
;1049:			Menu_SetCursor( uis.activemenu, i );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 1050
;1050:			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;
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
line 1052
;1051:
;1052:			if ( !(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT ) ) {
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
line 1053
;1053:				trap_S_StartLocalSound( menu_move_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1054
;1054:			}
LABELV $389
line 1055
;1055:		}
LABELV $383
line 1057
;1056:
;1057:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
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
line 1058
;1058:		return;
ADDRGP4 $344
JUMPV
LABELV $367
line 1030
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
line 1061
;1059:	}  
;1060:
;1061:	if (uis.activemenu->nitems > 0) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LEI4 $395
line 1063
;1062:		// out of any region
;1063:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
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
line 1064
;1064:	}
LABELV $395
line 1065
;1065:}
LABELV $344
endproc UI_MouseEvent 24 8
bss
align 1
LABELV $401
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 1067
;1066:
;1067:char *UI_Argv( int arg ) {
line 1070
;1068:	static char	buffer[MAX_STRING_CHARS];
;1069:
;1070:	trap_Argv( arg, buffer, sizeof( buffer ) );
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
line 1072
;1071:
;1072:	return buffer;
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
line 1076
;1073:}
;1074:
;1075:
;1076:char *UI_Cvar_VariableString( const char *var_name ) {
line 1079
;1077:	static char	buffer[MAX_STRING_CHARS];
;1078:
;1079:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
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
line 1081
;1080:
;1081:	return buffer;
ADDRGP4 $403
RETP4
LABELV $402
endproc UI_Cvar_VariableString 0 12
export UI_Cache_f
proc UI_Cache_f 0 0
line 1090
;1082:}
;1083:
;1084:
;1085:/*
;1086:=================
;1087:UI_Cache
;1088:=================
;1089:*/
;1090:void UI_Cache_f( void ) {
line 1091
;1091:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 1092
;1092:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 1093
;1093:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 1094
;1094:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 1095
;1095:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 1096
;1096:	Controls_Cache();
ADDRGP4 Controls_Cache
CALLV
pop
line 1097
;1097:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 1098
;1098:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 1099
;1099:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 1100
;1100:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 1101
;1101:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 1102
;1102:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1103
;1103:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 1104
;1104:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1105
;1105:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 1106
;1106:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 1107
;1107:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 1108
;1108:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 1109
;1109:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 1110
;1110:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 1111
;1111:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 1112
;1112:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 1113
;1113:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 1114
;1114:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 1115
;1115:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 1116
;1116:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 1118
;1117://	UI_SinglePlayerMenu_Cache();  // fixme shafe
;1118:	UI_OfflineMenu_Cache();
ADDRGP4 UI_OfflineMenu_Cache
CALLV
pop
line 1121
;1119://	UI_LoadConfig_Cache();
;1120://	UI_SaveConfigMenu_Cache();
;1121:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1122
;1122:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 1123
;1123:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 1125
;1124:
;1125:}
LABELV $404
endproc UI_Cache_f 0 0
export UI_ConsoleCommand
proc UI_ConsoleCommand 44 8
line 1133
;1126:
;1127:
;1128:/*
;1129:=================
;1130:UI_ConsoleCommand
;1131:=================
;1132:*/
;1133:qboolean UI_ConsoleCommand( int realTime ) {
line 1136
;1134:	char	*cmd;
;1135:
;1136:	cmd = UI_Argv( 0 );
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
line 1139
;1137:
;1138:	// ensure minimum menu data is available
;1139:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1141
;1140:
;1141:	if ( Q_stricmp (cmd, "levelselect") == 0 ) {
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
line 1142
;1142:		UI_SPLevelMenu_f();
ADDRGP4 UI_SPLevelMenu_f
CALLV
pop
line 1143
;1143:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $406
line 1146
;1144:	}
;1145:
;1146:	if ( Q_stricmp (cmd, "postgame") == 0 ) {
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
line 1147
;1147:		UI_SPPostgameMenu_f();
ADDRGP4 UI_SPPostgameMenu_f
CALLV
pop
line 1148
;1148:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $409
line 1151
;1149:	}
;1150:
;1151:	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
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
line 1152
;1152:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 1153
;1153:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $412
line 1156
;1154:	}
;1155:
;1156:	if ( Q_stricmp (cmd, "ui_cinematics") == 0 ) {
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
line 1157
;1157:		UI_CinematicsMenu_f();
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 1158
;1158:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $415
line 1163
;1159:	}
;1160:
;1161:	
;1162:	// Shafe - Trep  Call Dyanmic Menu (Example)
;1163:	if ( Q_stricmp (cmd, "build_menu") == 0 ) {
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
line 1164
;1164:		UI_DynamicCommandMenu_f();
ADDRGP4 UI_DynamicCommandMenu_f
CALLV
pop
line 1165
;1165:	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $418
line 1168
;1166:	}
;1167:
;1168:	if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
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
line 1169
;1169:		UI_TeamOrdersMenu_f();
ADDRGP4 UI_TeamOrdersMenu_f
CALLV
pop
line 1170
;1170:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $421
line 1173
;1171:	}
;1172:
;1173:	if ( Q_stricmp (cmd, "iamacheater") == 0 ) {
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
line 1174
;1174:		UI_SPUnlock_f();
ADDRGP4 UI_SPUnlock_f
CALLV
pop
line 1175
;1175:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $424
line 1178
;1176:	}
;1177:
;1178:	if ( Q_stricmp (cmd, "iamamonkey") == 0 ) {
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
line 1179
;1179:		UI_SPUnlockMedals_f();
ADDRGP4 UI_SPUnlockMedals_f
CALLV
pop
line 1180
;1180:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $427
line 1183
;1181:	}
;1182:
;1183:	if ( Q_stricmp (cmd, "ui_cdkey") == 0 ) {
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
line 1184
;1184:		UI_CDKeyMenu_f();
ADDRGP4 UI_CDKeyMenu_f
CALLV
pop
line 1185
;1185:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $430
line 1188
;1186:	}
;1187:
;1188:	return qfalse;
CNSTI4 0
RETI4
LABELV $405
endproc UI_ConsoleCommand 44 8
export UI_Shutdown
proc UI_Shutdown 0 0
line 1196
;1189:}
;1190:
;1191:/*
;1192:=================
;1193:UI_Shutdown
;1194:=================
;1195:*/
;1196:void UI_Shutdown( void ) {
line 1197
;1197:}
LABELV $433
endproc UI_Shutdown 0 0
export UI_Init
proc UI_Init 0 4
line 1204
;1198:
;1199:/*
;1200:=================
;1201:UI_Init
;1202:=================
;1203:*/
;1204:void UI_Init( void ) {
line 1205
;1205:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 1207
;1206:
;1207:	UI_InitGameinfo();
ADDRGP4 UI_InitGameinfo
CALLV
pop
line 1210
;1208:
;1209:	// cache redundant calulations
;1210:	trap_GetGlconfig( &uis.glconfig );
ADDRGP4 uis+56
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1213
;1211:
;1212:	// for 640x480 virtualized screen
;1213:	uis.scale = uis.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uis+11432
CNSTF4 990414985
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1214
;1214:	if ( uis.glconfig.vidWidth * 480 > uis.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uis+56+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uis+56+11308
INDIRI4
MULI4
LEI4 $439
line 1216
;1215:		// wide screen
;1216:		uis.bias = 0.5 * ( uis.glconfig.vidWidth - ( uis.glconfig.vidHeight * (640.0/480.0) ) );
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
line 1217
;1217:	}
ADDRGP4 $440
JUMPV
LABELV $439
line 1218
;1218:	else {
line 1220
;1219:		// no wide screen
;1220:		uis.bias = 0;
ADDRGP4 uis+11436
CNSTF4 0
ASGNF4
line 1221
;1221:	}
LABELV $440
line 1224
;1222:
;1223:	// initialize the menu system
;1224:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1226
;1225:
;1226:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 1227
;1227:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1228
;1228:}
LABELV $434
endproc UI_Init 0 4
export UI_AdjustFrom640
proc UI_AdjustFrom640 16 0
line 1237
;1229:
;1230:/*
;1231:================
;1232:UI_AdjustFrom640
;1233:
;1234:Adjusted for resolution and screen aspect ratio
;1235:================
;1236:*/
;1237:void UI_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 1239
;1238:	// expect valid pointers
;1239:	*x = *x * uis.scale + uis.bias;
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
line 1240
;1240:	*y *= uis.scale;
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
line 1241
;1241:	*w *= uis.scale;
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
line 1242
;1242:	*h *= uis.scale;
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
line 1243
;1243:}
LABELV $453
endproc UI_AdjustFrom640 16 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 16 36
line 1245
;1244:
;1245:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 1248
;1246:	qhandle_t	hShader;
;1247:
;1248:	hShader = trap_R_RegisterShaderNoMip( picname );
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
line 1249
;1249:	UI_AdjustFrom640( &x, &y, &width, &height );
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
line 1250
;1250:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
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
line 1251
;1251:}
LABELV $459
endproc UI_DrawNamedPic 16 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 1253
;1252:
;1253:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 1259
;1254:	float	s0;
;1255:	float	s1;
;1256:	float	t0;
;1257:	float	t1;
;1258:
;1259:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $461
line 1260
;1260:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 1261
;1261:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1262
;1262:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1263
;1263:	}
ADDRGP4 $462
JUMPV
LABELV $461
line 1264
;1264:	else {
line 1265
;1265:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1266
;1266:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1267
;1267:	}
LABELV $462
line 1269
;1268:
;1269:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $463
line 1270
;1270:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 1271
;1271:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 1272
;1272:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1273
;1273:	}
ADDRGP4 $464
JUMPV
LABELV $463
line 1274
;1274:	else {
line 1275
;1275:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1276
;1276:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1277
;1277:	}
LABELV $464
line 1279
;1278:	
;1279:	UI_AdjustFrom640( &x, &y, &w, &h );
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
line 1280
;1280:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
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
line 1281
;1281:}
LABELV $460
endproc UI_DrawHandlePic 16 36
export UI_FillRect
proc UI_FillRect 4 36
line 1290
;1282:
;1283:/*
;1284:================
;1285:UI_FillRect
;1286:
;1287:Coordinates are 640*480 virtual values
;1288:=================
;1289:*/
;1290:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 1291
;1291:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1293
;1292:
;1293:	UI_AdjustFrom640( &x, &y, &width, &height );
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
line 1294
;1294:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uis.whiteShader );
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
line 1296
;1295:
;1296:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1297
;1297:}
LABELV $465
endproc UI_FillRect 4 36
export UI_DrawRect
proc UI_DrawRect 24 36
line 1306
;1298:
;1299:/*
;1300:================
;1301:UI_DrawRect
;1302:
;1303:Coordinates are 640*480 virtual values
;1304:=================
;1305:*/
;1306:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 1307
;1307:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1309
;1308:
;1309:	UI_AdjustFrom640( &x, &y, &width, &height );
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
line 1311
;1310:
;1311:	trap_R_DrawStretchPic( x, y, width, 1, 0, 0, 0, 0, uis.whiteShader );
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
line 1312
;1312:	trap_R_DrawStretchPic( x, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
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
line 1313
;1313:	trap_R_DrawStretchPic( x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader );
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
line 1314
;1314:	trap_R_DrawStretchPic( x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader );
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
line 1316
;1315:
;1316:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1317
;1317:}
LABELV $467
endproc UI_DrawRect 24 36
export UI_SetColor
proc UI_SetColor 0 4
line 1319
;1318:
;1319:void UI_SetColor( const float *rgba ) {
line 1320
;1320:	trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1321
;1321:}
LABELV $472
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 1323
;1322:
;1323:void UI_UpdateScreen( void ) {
line 1324
;1324:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 1325
;1325:}
LABELV $473
endproc UI_UpdateScreen 0 0
export UI_Refresh
proc UI_Refresh 20 20
line 1333
;1326:
;1327:/*
;1328:=================
;1329:UI_Refresh
;1330:=================
;1331:*/
;1332:void UI_Refresh( int realtime )
;1333:{
line 1334
;1334:	uis.frametime = realtime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 1335
;1335:	uis.realtime  = realtime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 1337
;1336:
;1337:	if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
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
line 1338
;1338:		return;
ADDRGP4 $474
JUMPV
LABELV $477
line 1341
;1339:	}
;1340:
;1341:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 1343
;1342:
;1343:	if ( uis.activemenu )
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $479
line 1344
;1344:	{
line 1345
;1345:		if (uis.activemenu->fullscreen)
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $482
line 1346
;1346:		{
line 1348
;1347:			// draw the background
;1348:			if( uis.activemenu->showlogo ) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
line 1349
;1349:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackShader );
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
line 1350
;1350:			}
ADDRGP4 $486
JUMPV
LABELV $485
line 1351
;1351:			else {
line 1352
;1352:				UI_DrawHandlePic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackNoLogoShader );
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
line 1353
;1353:			}
LABELV $486
line 1354
;1354:		}
LABELV $482
line 1356
;1355:
;1356:		if (uis.activemenu->draw)
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $490
line 1357
;1357:			uis.activemenu->draw();
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
line 1359
;1358:		else
;1359:			Menu_Draw( uis.activemenu );
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $491
line 1361
;1360:
;1361:		if( uis.firstdraw ) {
ADDRGP4 uis+11444
INDIRI4
CNSTI4 0
EQI4 $495
line 1362
;1362:			UI_MouseEvent( 0, 0 );
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
line 1363
;1363:			uis.firstdraw = qfalse;
ADDRGP4 uis+11444
CNSTI4 0
ASGNI4
line 1364
;1364:		}
LABELV $495
line 1365
;1365:	}
LABELV $479
line 1368
;1366:
;1367:	// draw cursor
;1368:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 1369
;1369:	UI_DrawHandlePic( uis.cursorx-16, uis.cursory-16, 32, 32, uis.cursor);
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
line 1372
;1370:
;1371:#ifndef NDEBUG
;1372:	if (uis.debug)
ADDRGP4 uis+11388
INDIRI4
CNSTI4 0
EQI4 $502
line 1373
;1373:	{
line 1375
;1374:		// cursor coordinates
;1375:		UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
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
line 1376
;1376:	}
LABELV $502
line 1382
;1377:#endif
;1378:
;1379:	// delay playing the enter sound until after the
;1380:	// menu has been drawn, to avoid delay while
;1381:	// caching images
;1382:	if (m_entersound)
ADDRGP4 m_entersound
INDIRI4
CNSTI4 0
EQI4 $508
line 1383
;1383:	{
line 1384
;1384:		trap_S_StartLocalSound( menu_in_sound, CHAN_LOCAL_SOUND );
ADDRGP4 menu_in_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1385
;1385:		m_entersound = qfalse;
ADDRGP4 m_entersound
CNSTI4 0
ASGNI4
line 1386
;1386:	}
LABELV $508
line 1387
;1387:}
LABELV $474
endproc UI_Refresh 20 20
export UI_DrawTextBox
proc UI_DrawTextBox 24 20
line 1390
;1388:
;1389:void UI_DrawTextBox (int x, int y, int width, int lines)
;1390:{
line 1391
;1391:	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
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
line 1392
;1392:	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
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
line 1393
;1393:}
LABELV $510
endproc UI_DrawTextBox 24 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 1396
;1394:
;1395:qboolean UI_CursorInRect (int x, int y, int width, int height)
;1396:{
line 1397
;1397:	if (uis.cursorx < x ||
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
line 1401
;1398:		uis.cursory < y ||
;1399:		uis.cursorx > x+width ||
;1400:		uis.cursory > y+height)
;1401:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $511
JUMPV
LABELV $512
line 1403
;1402:
;1403:	return qtrue;
CNSTI4 1
RETI4
LABELV $511
endproc UI_CursorInRect 8 0
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
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 95
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
