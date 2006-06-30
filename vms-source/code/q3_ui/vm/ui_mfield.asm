export MField_Draw
code
proc MField_Draw 1056 20
file "../ui_mfield.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*
;6:===================
;7:MField_Draw
;8:
;9:Handles horizontal scrolling and cursor blinking
;10:x, y, are in pixels
;11:===================
;12:*/
;13:void MField_Draw( mfield_t *edit, int x, int y, int style, vec4_t color ) {
line 21
;14:	int		len;
;15:	int		charw;
;16:	int		drawLen;
;17:	int		prestep;
;18:	int		cursorChar;
;19:	char	str[MAX_STRING_CHARS];
;20:
;21:	drawLen = edit->widthInChars;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 22
;22:	len     = strlen( edit->buffer ) + 1;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 25
;23:
;24:	// guarantee that cursor will be visible
;25:	if ( len <= drawLen ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $70
line 26
;26:		prestep = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 27
;27:	} else {
ADDRGP4 $71
JUMPV
LABELV $70
line 28
;28:		if ( edit->scroll + drawLen > len ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
LEI4 $72
line 29
;29:			edit->scroll = len - drawLen;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 30
;30:			if ( edit->scroll < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $74
line 31
;31:				edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 32
;32:			}
LABELV $74
line 33
;33:		}
LABELV $72
line 34
;34:		prestep = edit->scroll;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 35
;35:	}
LABELV $71
line 37
;36:
;37:	if ( prestep + drawLen > len ) {
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
LEI4 $76
line 38
;38:		drawLen = len - prestep;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 39
;39:	}
LABELV $76
line 42
;40:
;41:	// extract <drawLen> characters from the field at <prestep>
;42:	if ( drawLen >= MAX_STRING_CHARS ) {
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $78
line 43
;43:		trap_Error( "drawLen >= MAX_STRING_CHARS" );
ADDRGP4 $80
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 44
;44:	}
LABELV $78
line 45
;45:	memcpy( str, edit->buffer + prestep, drawLen );
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 46
;46:	str[ drawLen ] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
line 48
;47:
;48:	UI_DrawString( x, y, str, style, color );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 12
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
line 51
;49:
;50:	// draw the cursor
;51:	if (!(style & UI_PULSE)) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $81
line 52
;52:		return;
ADDRGP4 $69
JUMPV
LABELV $81
line 55
;53:	}
;54:
;55:	if ( trap_Key_GetOverstrikeMode() ) {
ADDRLP4 1048
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $83
line 56
;56:		cursorChar = 11;
ADDRLP4 1040
CNSTI4 11
ASGNI4
line 57
;57:	} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 58
;58:		cursorChar = 10;
ADDRLP4 1040
CNSTI4 10
ASGNI4
line 59
;59:	}
LABELV $84
line 61
;60:
;61:	style &= ~UI_PULSE;
ADDRFP4 12
ADDRFP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 62
;62:	style |= UI_BLINK;
ADDRFP4 12
ADDRFP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 64
;63:
;64:	if (style & UI_SMALLFONT)
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $85
line 65
;65:	{
line 66
;66:		charw =	SMALLCHAR_WIDTH;
ADDRLP4 1036
CNSTI4 8
ASGNI4
line 67
;67:	}
ADDRGP4 $86
JUMPV
LABELV $85
line 68
;68:	else if (style & UI_GIANTFONT)
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $87
line 69
;69:	{
line 70
;70:		charw =	GIANTCHAR_WIDTH;
ADDRLP4 1036
CNSTI4 32
ASGNI4
line 71
;71:	}
ADDRGP4 $88
JUMPV
LABELV $87
line 73
;72:	else
;73:	{
line 74
;74:		charw =	BIGCHAR_WIDTH;
ADDRLP4 1036
CNSTI4 16
ASGNI4
line 75
;75:	}
LABELV $88
LABELV $86
line 77
;76:
;77:	if (style & UI_CENTER)
ADDRFP4 12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $89
line 78
;78:	{
line 79
;79:		len = strlen(str);
ADDRLP4 12
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1052
INDIRI4
ASGNI4
line 80
;80:		x = x - len*charw/2;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 81
;81:	}
ADDRGP4 $90
JUMPV
LABELV $89
line 82
;82:	else if (style & UI_RIGHT)
ADDRFP4 12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $91
line 83
;83:	{
line 84
;84:		len = strlen(str);
ADDRLP4 12
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1052
INDIRI4
ASGNI4
line 85
;85:		x = x - len*charw;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
MULI4
SUBI4
ASGNI4
line 86
;86:	}
LABELV $91
LABELV $90
line 88
;87:	
;88:	UI_DrawChar( x + ( edit->cursor - prestep ) * charw, y, cursorChar, style & ~(UI_CENTER|UI_RIGHT), color );
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ADDRLP4 1036
INDIRI4
MULI4
ADDI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
CNSTI4 -4
BANDI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 89
;89:}
LABELV $69
endproc MField_Draw 1056 20
export MField_Paste
proc MField_Paste 76 8
line 96
;90:
;91:/*
;92:================
;93:MField_Paste
;94:================
;95:*/
;96:void MField_Paste( mfield_t *edit ) {
line 100
;97:	char	pasteBuffer[64];
;98:	int		pasteLen, i;
;99:
;100:	trap_GetClipboardData( pasteBuffer, 64 );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_GetClipboardData
CALLV
pop
line 103
;101:
;102:	// send as if typed, so insert / overstrike works properly
;103:	pasteLen = strlen( pasteBuffer );
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 104
;104:	for ( i = 0 ; i < pasteLen ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $94
line 105
;105:		MField_CharEvent( edit, pasteBuffer[i] );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 MField_CharEvent
CALLV
pop
line 106
;106:	}
LABELV $95
line 104
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $97
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $94
line 107
;107:}
LABELV $93
endproc MField_Paste 76 8
export MField_KeyDownEvent
proc MField_KeyDownEvent 64 12
line 119
;108:
;109:/*
;110:=================
;111:MField_KeyDownEvent
;112:
;113:Performs the basic line editing functions for the console,
;114:in-game talk, and menu fields
;115:
;116:Key events are used for non-printable characters, others are gotten from char events.
;117:=================
;118:*/
;119:void MField_KeyDownEvent( mfield_t *edit, int key ) {
line 123
;120:	int		len;
;121:
;122:	// shift-insert is paste
;123:	if ( ( ( key == K_INS ) || ( key == K_KP_INS ) ) && trap_Key_IsDown( K_SHIFT ) ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 139
EQI4 $101
ADDRLP4 4
INDIRI4
CNSTI4 170
NEI4 $99
LABELV $101
CNSTI4 138
ARGI4
ADDRLP4 8
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $99
line 124
;124:		MField_Paste( edit );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MField_Paste
CALLV
pop
line 125
;125:		return;
ADDRGP4 $98
JUMPV
LABELV $99
line 128
;126:	}
;127:
;128:	len = strlen( edit->buffer );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 130
;129:
;130:	if ( key == K_DEL || key == K_KP_DEL ) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 140
EQI4 $104
ADDRLP4 16
INDIRI4
CNSTI4 171
NEI4 $102
LABELV $104
line 131
;131:		if ( edit->cursor < len ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $98
line 132
;132:			memmove( edit->buffer + edit->cursor, 
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 134
;133:				edit->buffer + edit->cursor + 1, len - edit->cursor );
;134:		}
line 135
;135:		return;
ADDRGP4 $98
JUMPV
LABELV $102
line 138
;136:	}
;137:
;138:	if ( key == K_RIGHTARROW || key == K_KP_RIGHTARROW ) 
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 135
EQI4 $109
ADDRLP4 20
INDIRI4
CNSTI4 165
NEI4 $107
LABELV $109
line 139
;139:	{
line 140
;140:		if ( edit->cursor < len ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $110
line 141
;141:			edit->cursor++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 142
;142:		}
LABELV $110
line 143
;143:		if ( edit->cursor >= edit->scroll + edit->widthInChars && edit->cursor <= len )
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LTI4 $98
ADDRLP4 28
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $98
line 144
;144:		{
line 145
;145:			edit->scroll++;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 146
;146:		}
line 147
;147:		return;
ADDRGP4 $98
JUMPV
LABELV $107
line 150
;148:	}
;149:
;150:	if ( key == K_LEFTARROW || key == K_KP_LEFTARROW ) 
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 134
EQI4 $116
ADDRLP4 24
INDIRI4
CNSTI4 163
NEI4 $114
LABELV $116
line 151
;151:	{
line 152
;152:		if ( edit->cursor > 0 ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
LEI4 $117
line 153
;153:			edit->cursor--;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 154
;154:		}
LABELV $117
line 155
;155:		if ( edit->cursor < edit->scroll )
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $98
line 156
;156:		{
line 157
;157:			edit->scroll--;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 158
;158:		}
line 159
;159:		return;
ADDRGP4 $98
JUMPV
LABELV $114
line 162
;160:	}
;161:
;162:	if ( key == K_HOME || key == K_KP_HOME || ( tolower(key) == 'a' && trap_Key_IsDown( K_CTRL ) ) ) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 143
EQI4 $124
ADDRLP4 28
INDIRI4
CNSTI4 160
EQI4 $124
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 97
NEI4 $121
CNSTI4 137
ARGI4
ADDRLP4 36
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $121
LABELV $124
line 163
;163:		edit->cursor = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 164
;164:		edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 165
;165:		return;
ADDRGP4 $98
JUMPV
LABELV $121
line 168
;166:	}
;167:
;168:	if ( key == K_END || key == K_KP_END || ( tolower(key) == 'e' && trap_Key_IsDown( K_CTRL ) ) ) {
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 144
EQI4 $128
ADDRLP4 40
INDIRI4
CNSTI4 166
EQI4 $128
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 101
NEI4 $125
CNSTI4 137
ARGI4
ADDRLP4 48
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $125
LABELV $128
line 169
;169:		edit->cursor = len;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 170
;170:		edit->scroll = len - edit->widthInChars + 1;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 171
;171:		if (edit->scroll < 0)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $98
line 172
;172:			edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 173
;173:		return;
ADDRGP4 $98
JUMPV
LABELV $125
line 176
;174:	}
;175:
;176:	if ( key == K_INS || key == K_KP_INS ) {
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 139
EQI4 $133
ADDRLP4 52
INDIRI4
CNSTI4 170
NEI4 $131
LABELV $133
line 177
;177:		trap_Key_SetOverstrikeMode( !trap_Key_GetOverstrikeMode() );
ADDRLP4 60
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $135
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $135
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $136
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetOverstrikeMode
CALLV
pop
line 178
;178:		return;
LABELV $131
line 180
;179:	}
;180:}
LABELV $98
endproc MField_KeyDownEvent 64 12
export MField_CharEvent
proc MField_CharEvent 36 12
line 187
;181:
;182:/*
;183:==================
;184:MField_CharEvent
;185:==================
;186:*/
;187:void MField_CharEvent( mfield_t *edit, int ch ) {
line 190
;188:	int		len;
;189:
;190:	if ( ch == 'v' - 'a' + 1 ) {	// ctrl-v is paste
ADDRFP4 4
INDIRI4
CNSTI4 22
NEI4 $138
line 191
;191:		MField_Paste( edit );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MField_Paste
CALLV
pop
line 192
;192:		return;
ADDRGP4 $137
JUMPV
LABELV $138
line 195
;193:	}
;194:
;195:	if ( ch == 'c' - 'a' + 1 ) {	// ctrl-c clears the field
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $140
line 196
;196:		MField_Clear( edit );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MField_Clear
CALLV
pop
line 197
;197:		return;
ADDRGP4 $137
JUMPV
LABELV $140
line 200
;198:	}
;199:
;200:	len = strlen( edit->buffer );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 202
;201:
;202:	if ( ch == 'h' - 'a' + 1 )	{	// ctrl-h is backspace
ADDRFP4 4
INDIRI4
CNSTI4 8
NEI4 $142
line 203
;203:		if ( edit->cursor > 0 ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
LEI4 $137
line 204
;204:			memmove( edit->buffer + edit->cursor - 1, 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 -1
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 206
;205:				edit->buffer + edit->cursor, len + 1 - edit->cursor );
;206:			edit->cursor--;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 207
;207:			if ( edit->cursor < edit->scroll )
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $137
line 208
;208:			{
line 209
;209:				edit->scroll--;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 210
;210:			}
line 211
;211:		}
line 212
;212:		return;
ADDRGP4 $137
JUMPV
LABELV $142
line 215
;213:	}
;214:
;215:	if ( ch == 'a' - 'a' + 1 ) {	// ctrl-a is home
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $148
line 216
;216:		edit->cursor = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 217
;217:		edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 218
;218:		return;
ADDRGP4 $137
JUMPV
LABELV $148
line 221
;219:	}
;220:
;221:	if ( ch == 'e' - 'a' + 1 ) {	// ctrl-e is end
ADDRFP4 4
INDIRI4
CNSTI4 5
NEI4 $150
line 222
;222:		edit->cursor = len;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 223
;223:		edit->scroll = edit->cursor - edit->widthInChars + 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 224
;224:		if (edit->scroll < 0)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $137
line 225
;225:			edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 226
;226:		return;
ADDRGP4 $137
JUMPV
LABELV $150
line 232
;227:	}
;228:
;229:	//
;230:	// ignore any other non printable chars
;231:	//
;232:	if ( ch < 32 ) {
ADDRFP4 4
INDIRI4
CNSTI4 32
GEI4 $154
line 233
;233:		return;
ADDRGP4 $137
JUMPV
LABELV $154
line 236
;234:	}
;235:
;236:	if ( !trap_Key_GetOverstrikeMode() ) {	
ADDRLP4 8
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $156
line 237
;237:		if ((edit->cursor == MAX_EDIT_LINE - 1) || (edit->maxchars && edit->cursor >= edit->maxchars))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 255
EQI4 $160
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $157
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $157
LABELV $160
line 238
;238:			return;
ADDRGP4 $137
JUMPV
line 239
;239:	} else {
LABELV $156
line 241
;240:		// insert mode
;241:		if (( len == MAX_EDIT_LINE - 1 ) || (edit->maxchars && len >= edit->maxchars))
ADDRLP4 0
INDIRI4
CNSTI4 255
EQI4 $163
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $161
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $161
LABELV $163
line 242
;242:			return;
ADDRGP4 $137
JUMPV
LABELV $161
line 243
;243:		memmove( edit->buffer + edit->cursor + 1, edit->buffer + edit->cursor, len + 1 - edit->cursor );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ADDRLP4 24
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 244
;244:	}
LABELV $157
line 246
;245:
;246:	edit->buffer[edit->cursor] = ch;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 247
;247:	if (!edit->maxchars || edit->cursor < edit->maxchars-1)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $166
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
GEI4 $164
LABELV $166
line 248
;248:		edit->cursor++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $164
line 250
;249:
;250:	if ( edit->cursor >= edit->widthInChars )
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $167
line 251
;251:	{
line 252
;252:		edit->scroll++;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 253
;253:	}
LABELV $167
line 255
;254:
;255:	if ( edit->cursor == len + 1) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
NEI4 $169
line 256
;256:		edit->buffer[edit->cursor] = 0;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 257
;257:	}
LABELV $169
line 258
;258:}
LABELV $137
endproc MField_CharEvent 36 12
export MField_Clear
proc MField_Clear 0 0
line 265
;259:
;260:/*
;261:==================
;262:MField_Clear
;263:==================
;264:*/
;265:void MField_Clear( mfield_t *edit ) {
line 266
;266:	edit->buffer[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI1 0
ASGNI1
line 267
;267:	edit->cursor = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 268
;268:	edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 269
;269:}
LABELV $171
endproc MField_Clear 0 0
export MenuField_Init
proc MenuField_Init 32 4
line 276
;270:
;271:/*
;272:==================
;273:MenuField_Init
;274:==================
;275:*/
;276:void MenuField_Init( menufield_s* m ) {
line 281
;277:	int	l;
;278:	int	w;
;279:	int	h;
;280:
;281:	MField_Clear( &m->field );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 MField_Clear
CALLV
pop
line 283
;282:
;283:	if (m->generic.flags & QMF_SMALLFONT)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 2
BANDU4
CNSTU4 0
EQU4 $173
line 284
;284:	{
line 285
;285:		w = SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 286
;286:		h = SMALLCHAR_HEIGHT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 287
;287:	}
ADDRGP4 $174
JUMPV
LABELV $173
line 289
;288:	else
;289:	{
line 290
;290:		w = BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 291
;291:		h = BIGCHAR_HEIGHT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 292
;292:	}	
LABELV $174
line 294
;293:
;294:	if (m->generic.name) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $175
line 295
;295:		l = (strlen( m->generic.name )+1) * w;		
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
line 296
;296:	}
ADDRGP4 $176
JUMPV
LABELV $175
line 297
;297:	else {
line 298
;298:		l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 299
;299:	}
LABELV $176
line 301
;300:
;301:	m->generic.left   = m->generic.x - l;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 302
;302:	m->generic.top    = m->generic.y;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 303
;303:	m->generic.right  = m->generic.x + w + m->field.widthInChars*w;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 304
;304:	m->generic.bottom = m->generic.y + h;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 305
;305:}
LABELV $172
endproc MenuField_Init 32 4
export MenuField_Draw
proc MenuField_Draw 52 20
line 313
;306:
;307:/*
;308:==================
;309:MenuField_Draw
;310:==================
;311:*/
;312:void MenuField_Draw( menufield_s *f )
;313:{
line 322
;314:	int		x;
;315:	int		y;
;316:	int		w;
;317:	int		h;
;318:	int		style;
;319:	qboolean focus;
;320:	float	*color;
;321:
;322:	x =	f->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 323
;323:	y =	f->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 325
;324:
;325:	if (f->generic.flags & QMF_SMALLFONT)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 2
BANDU4
CNSTU4 0
EQU4 $178
line 326
;326:	{
line 327
;327:		w = SMALLCHAR_WIDTH;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 328
;328:		h = SMALLCHAR_HEIGHT;
ADDRLP4 24
CNSTI4 16
ASGNI4
line 329
;329:		style = UI_SMALLFONT;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 330
;330:	}
ADDRGP4 $179
JUMPV
LABELV $178
line 332
;331:	else
;332:	{
line 333
;333:		w = BIGCHAR_WIDTH;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 334
;334:		h = BIGCHAR_HEIGHT;
ADDRLP4 24
CNSTI4 16
ASGNI4
line 335
;335:		style = UI_BIGFONT;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 336
;336:	}	
LABELV $179
line 338
;337:
;338:	if (Menu_ItemAtCursor( f->generic.parent ) == f) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRP4
CVPU4 4
NEU4 $180
line 339
;339:		focus = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 340
;340:		style |= UI_PULSE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 341
;341:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 342
;342:	else {
line 343
;343:		focus = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 344
;344:	}
LABELV $181
line 346
;345:
;346:	if (f->generic.flags & QMF_GRAYED)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $182
line 347
;347:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $183
JUMPV
LABELV $182
line 348
;348:	else if (focus)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $184
line 349
;349:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
ADDRGP4 $185
JUMPV
LABELV $184
line 351
;350:	else
;351:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
LABELV $185
LABELV $183
line 353
;352:
;353:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $186
line 354
;354:	{
line 356
;355:		// draw cursor
;356:		UI_FillRect( f->generic.left, f->generic.top, f->generic.right-f->generic.left+1, f->generic.bottom-f->generic.top+1, listbar_color ); 
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
SUBI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 357
;357:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|style, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4097
BORI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 358
;358:	}
LABELV $186
line 360
;359:
;360:	if ( f->generic.name ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
line 361
;361:		UI_DrawString( x - w, y, f->generic.name, style|UI_RIGHT, color );
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
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
line 362
;362:	}
LABELV $188
line 364
;363:
;364:	MField_Draw( &f->field, x + w, y, style, color );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 MField_Draw
CALLV
pop
line 365
;365:}
LABELV $177
endproc MenuField_Draw 52 20
export MenuField_Key
proc MenuField_Key 44 8
line 373
;366:
;367:/*
;368:==================
;369:MenuField_Key
;370:==================
;371:*/
;372:sfxHandle_t MenuField_Key( menufield_s* m, int* key )
;373:{
line 376
;374:	int keycode;
;375:
;376:	keycode = *key;
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 378
;377:
;378:	switch ( keycode )
ADDRLP4 0
INDIRI4
CNSTI4 132
EQI4 $192
ADDRLP4 8
CNSTI4 133
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $192
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
GTI4 $204
LABELV $203
ADDRLP4 16
CNSTI4 9
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $192
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $191
LABELV $205
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $193
ADDRGP4 $191
JUMPV
LABELV $204
ADDRLP4 0
INDIRI4
CNSTI4 167
EQI4 $192
ADDRLP4 24
CNSTI4 169
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $193
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $207
LABELV $206
ADDRLP4 0
INDIRI4
CNSTI4 161
EQI4 $192
ADDRGP4 $191
JUMPV
LABELV $207
ADDRLP4 0
INDIRI4
CNSTI4 185
LTI4 $191
ADDRLP4 0
INDIRI4
CNSTI4 188
GTI4 $191
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $208-740
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $208
address $193
address $193
address $193
address $193
code
line 379
;379:	{
LABELV $193
line 387
;380:		case K_KP_ENTER:
;381:		case K_ENTER:
;382:		case K_JOY1:
;383:		case K_JOY2:
;384:		case K_JOY3:
;385:		case K_JOY4:
;386:			// have enter go to next cursor point
;387:			*key = K_TAB;
ADDRFP4 4
INDIRP4
CNSTI4 9
ASGNI4
line 388
;388:			break;
ADDRGP4 $192
JUMPV
line 395
;389:
;390:		case K_TAB:
;391:		case K_KP_DOWNARROW:
;392:		case K_DOWNARROW:
;393:		case K_KP_UPARROW:
;394:		case K_UPARROW:
;395:			break;
LABELV $191
line 398
;396:
;397:		default:
;398:			if ( keycode & K_CHAR_FLAG )
ADDRLP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $195
line 399
;399:			{
line 400
;400:				keycode &= ~K_CHAR_FLAG;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 402
;401:
;402:				if ((m->generic.flags & QMF_UPPERCASE) && Q_islower( keycode ))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 524288
BANDU4
CNSTU4 0
EQU4 $197
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 Q_islower
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $197
line 403
;403:					keycode -= 'a' - 'A';
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $197
line 404
;404:				else if ((m->generic.flags & QMF_LOWERCASE) && Q_isupper( keycode ))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 262144
BANDU4
CNSTU4 0
EQU4 $199
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 Q_isupper
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $199
line 405
;405:					keycode -= 'A' - 'a';
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -32
SUBI4
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $199
line 406
;406:				else if ((m->generic.flags & QMF_NUMBERSONLY) && Q_isalpha( keycode ))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 32
BANDU4
CNSTU4 0
EQU4 $201
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Q_isalpha
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $201
line 407
;407:					return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $190
JUMPV
LABELV $201
LABELV $200
LABELV $198
line 409
;408:
;409:				MField_CharEvent( &m->field, keycode);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MField_CharEvent
CALLV
pop
line 410
;410:			}
ADDRGP4 $192
JUMPV
LABELV $195
line 412
;411:			else
;412:				MField_KeyDownEvent( &m->field, keycode );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MField_KeyDownEvent
CALLV
pop
line 413
;413:			break;
LABELV $192
line 416
;414:	}
;415:
;416:	return (0);
CNSTI4 0
RETI4
LABELV $190
endproc MenuField_Key 44 8
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
LABELV $80
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 76
byte 1 101
byte 1 110
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
