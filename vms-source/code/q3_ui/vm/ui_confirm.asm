code
proc ConfirmMenu_Event 4 4
file "../ui_confirm.c"
line 45
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CONFIRMATION MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ART_CONFIRM_FRAME	"menu/art/cut_frame"
;16:
;17:#define ID_CONFIRM_NO		10
;18:#define ID_CONFIRM_YES		11
;19:
;20:
;21:typedef struct {
;22:	menuframework_s menu;
;23:
;24:	menutext_s		no;
;25:	menutext_s		yes;
;26:
;27:	int				slashX;
;28:	const char *	question;
;29:	void			(*draw)( void );
;30:	void			(*action)( qboolean result );
;31:	
;32:	int style;
;33:	const char **lines;
;34:} confirmMenu_t;
;35:
;36:
;37:static confirmMenu_t	s_confirm;
;38:
;39:
;40:/*
;41:=================
;42:ConfirmMenu_Event
;43:=================
;44:*/
;45:static void ConfirmMenu_Event( void* ptr, int event ) {
line 48
;46:	qboolean	result;
;47:
;48:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $69
line 49
;49:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 52
;50:	}
;51:
;52:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 54
;53:
;54:	if( ((menucommon_s*)ptr)->id == ID_CONFIRM_NO ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 10
NEI4 $71
line 55
;55:		result = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 56
;56:	}
ADDRGP4 $72
JUMPV
LABELV $71
line 57
;57:	else {
line 58
;58:		result = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 59
;59:	}
LABELV $72
line 61
;60:
;61:	if( s_confirm.action ) {
ADDRGP4 s_confirm+444
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $73
line 62
;62:		s_confirm.action( result );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 s_confirm+444
INDIRP4
CALLV
pop
line 63
;63:	}
LABELV $73
line 64
;64:}
LABELV $68
endproc ConfirmMenu_Event 4 4
proc ConfirmMenu_Key 32 8
line 72
;65:
;66:
;67:/*
;68:=================
;69:ConfirmMenu_Key
;70:=================
;71:*/
;72:static sfxHandle_t ConfirmMenu_Key( int key ) {
line 73
;73:	switch ( key ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 110
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $81
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $86
LABELV $85
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 78
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $81
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $78
LABELV $87
ADDRFP4 0
INDIRI4
CNSTI4 89
EQI4 $83
ADDRGP4 $78
JUMPV
LABELV $86
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 134
EQI4 $80
ADDRLP4 20
CNSTI4 135
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $80
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $89
LABELV $88
ADDRFP4 0
INDIRI4
CNSTI4 121
EQI4 $83
ADDRGP4 $78
JUMPV
LABELV $89
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 163
EQI4 $80
ADDRLP4 24
INDIRI4
CNSTI4 165
EQI4 $80
ADDRGP4 $78
JUMPV
LABELV $80
line 78
;74:	case K_KP_LEFTARROW:
;75:	case K_LEFTARROW:
;76:	case K_KP_RIGHTARROW:
;77:	case K_RIGHTARROW:
;78:		key = K_TAB;
ADDRFP4 0
CNSTI4 9
ASGNI4
line 79
;79:		break;
ADDRGP4 $79
JUMPV
LABELV $81
line 83
;80:
;81:	case 'n':
;82:	case 'N':
;83:		ConfirmMenu_Event( &s_confirm.no, QM_ACTIVATED );
ADDRGP4 s_confirm+288
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 ConfirmMenu_Event
CALLV
pop
line 84
;84:		break;
ADDRGP4 $79
JUMPV
LABELV $83
line 88
;85:
;86:	case 'y':
;87:	case 'Y':
;88:		ConfirmMenu_Event( &s_confirm.yes, QM_ACTIVATED );
ADDRGP4 s_confirm+360
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 ConfirmMenu_Event
CALLV
pop
line 89
;89:		break;
LABELV $78
LABELV $79
line 92
;90:	}
;91:
;92:	return Menu_DefaultKey( &s_confirm.menu, key );
ADDRGP4 s_confirm
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $77
endproc ConfirmMenu_Key 32 8
proc MessageMenu_Draw 8 20
line 101
;93:}
;94:
;95:
;96:/*
;97:=================
;98:MessaheMenu_Draw
;99:=================
;100:*/
;101:static void MessageMenu_Draw( void ) {
line 104
;102:	int i,y;
;103:	
;104:	UI_DrawNamedPic( 142, 118, 359, 256, ART_CONFIRM_FRAME );
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $91
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 106
;105:	
;106:	y = 188;
ADDRLP4 4
CNSTI4 188
ASGNI4
line 107
;107:	for(i=0; s_confirm.lines[i]; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 108
;108:	{
line 109
;109:		UI_DrawProportionalString( 320, y, s_confirm.lines[i], s_confirm.style, color_red );
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_confirm+452
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_confirm+448
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 110
;110:		y += 18;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 111
;111:	}
LABELV $93
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_confirm+452
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $92
line 113
;112:
;113:	Menu_Draw( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 115
;114:
;115:	if( s_confirm.draw ) {
ADDRGP4 s_confirm+440
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
line 116
;116:		s_confirm.draw();
ADDRGP4 s_confirm+440
INDIRP4
CALLV
pop
line 117
;117:	}
LABELV $99
line 118
;118:}
LABELV $90
endproc MessageMenu_Draw 8 20
proc ConfirmMenu_Draw 0 20
line 125
;119:
;120:/*
;121:=================
;122:ConfirmMenu_Draw
;123:=================
;124:*/
;125:static void ConfirmMenu_Draw( void ) {
line 126
;126:	UI_DrawNamedPic( 142, 118, 359, 256, ART_CONFIRM_FRAME );
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $91
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 127
;127:	UI_DrawProportionalString( 320, 204, s_confirm.question, s_confirm.style, color_red );
CNSTI4 320
ARGI4
CNSTI4 204
ARGI4
ADDRGP4 s_confirm+436
INDIRP4
ARGP4
ADDRGP4 s_confirm+448
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 128
;128:	UI_DrawProportionalString( s_confirm.slashX, 265, "/", UI_LEFT|UI_INVERSE, color_red );
ADDRGP4 s_confirm+432
INDIRI4
ARGI4
CNSTI4 265
ARGI4
ADDRGP4 $107
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 130
;129:
;130:	Menu_Draw( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 132
;131:
;132:	if( s_confirm.draw ) {
ADDRGP4 s_confirm+440
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $108
line 133
;133:		s_confirm.draw();
ADDRGP4 s_confirm+440
INDIRP4
CALLV
pop
line 134
;134:	}
LABELV $108
line 135
;135:}
LABELV $103
endproc ConfirmMenu_Draw 0 20
export ConfirmMenu_Cache
proc ConfirmMenu_Cache 0 4
line 143
;136:
;137:
;138:/*
;139:=================
;140:ConfirmMenu_Cache
;141:=================
;142:*/
;143:void ConfirmMenu_Cache( void ) {
line 144
;144:	trap_R_RegisterShaderNoMip( ART_CONFIRM_FRAME );
ADDRGP4 $91
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 145
;145:}
LABELV $112
endproc ConfirmMenu_Cache 0 4
export UI_ConfirmMenu_Style
proc UI_ConfirmMenu_Style 3120 12
line 153
;146:
;147:
;148:/*
;149:=================
;150:UI_ConfirmMenu_Stlye
;151:=================
;152:*/
;153:void UI_ConfirmMenu_Style( const char *question, int style, void (*draw)( void ), void (*action)( qboolean result ) ) {
line 159
;154:	uiClientState_t	cstate;
;155:	int	n1, n2, n3;
;156:	int	l1, l2, l3;
;157:
;158:	// zero set all our globals
;159:	memset( &s_confirm, 0, sizeof(s_confirm) );
ADDRGP4 s_confirm
ARGP4
CNSTI4 0
ARGI4
CNSTI4 456
ARGI4
ADDRGP4 memset
CALLP4
pop
line 161
;160:
;161:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 163
;162:
;163:	n1 = UI_ProportionalStringWidth( "YES/NO" );
ADDRGP4 $114
ARGP4
ADDRLP4 3108
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3092
ADDRLP4 3108
INDIRI4
ASGNI4
line 164
;164:	n2 = UI_ProportionalStringWidth( "YES" ) + PROP_GAP_WIDTH;
ADDRGP4 $115
ARGP4
ADDRLP4 3112
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3096
ADDRLP4 3112
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 165
;165:	n3 = UI_ProportionalStringWidth( "/" )  + PROP_GAP_WIDTH;
ADDRGP4 $107
ARGP4
ADDRLP4 3116
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3100
ADDRLP4 3116
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 166
;166:	l1 = 320 - ( n1 / 2 );
ADDRLP4 0
CNSTI4 320
ADDRLP4 3092
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 167
;167:	l2 = l1 + n2;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 3096
INDIRI4
ADDI4
ASGNI4
line 168
;168:	l3 = l2 + n3;
ADDRLP4 3104
ADDRLP4 4
INDIRI4
ADDRLP4 3100
INDIRI4
ADDI4
ASGNI4
line 169
;169:	s_confirm.slashX = l2;
ADDRGP4 s_confirm+432
ADDRLP4 4
INDIRI4
ASGNI4
line 171
;170:
;171:	s_confirm.question = question;
ADDRGP4 s_confirm+436
ADDRFP4 0
INDIRP4
ASGNP4
line 172
;172:	s_confirm.draw = draw;
ADDRGP4 s_confirm+440
ADDRFP4 8
INDIRP4
ASGNP4
line 173
;173:	s_confirm.action = action;
ADDRGP4 s_confirm+444
ADDRFP4 12
INDIRP4
ASGNP4
line 174
;174:	s_confirm.style = style;
ADDRGP4 s_confirm+448
ADDRFP4 4
INDIRI4
ASGNI4
line 176
;175:
;176:	s_confirm.menu.draw       = ConfirmMenu_Draw;
ADDRGP4 s_confirm+268
ADDRGP4 ConfirmMenu_Draw
ASGNP4
line 177
;177:	s_confirm.menu.key        = ConfirmMenu_Key;
ADDRGP4 s_confirm+272
ADDRGP4 ConfirmMenu_Key
ASGNP4
line 178
;178:	s_confirm.menu.wrapAround = qtrue;
ADDRGP4 s_confirm+276
CNSTI4 1
ASGNI4
line 180
;179:
;180:	trap_GetClientState( &cstate );
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 181
;181:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $124
line 182
;182:		s_confirm.menu.fullscreen = qfalse;
ADDRGP4 s_confirm+280
CNSTI4 0
ASGNI4
line 183
;183:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 184
;184:	else {
line 185
;185:		s_confirm.menu.fullscreen = qtrue;
ADDRGP4 s_confirm+280
CNSTI4 1
ASGNI4
line 186
;186:	}
LABELV $125
line 188
;187:
;188:	s_confirm.yes.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_confirm+360
CNSTI4 9
ASGNI4
line 189
;189:	s_confirm.yes.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_confirm+360+44
CNSTU4 260
ASGNU4
line 190
;190:	s_confirm.yes.generic.callback	= ConfirmMenu_Event;
ADDRGP4 s_confirm+360+48
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 191
;191:	s_confirm.yes.generic.id		= ID_CONFIRM_YES;
ADDRGP4 s_confirm+360+8
CNSTI4 11
ASGNI4
line 192
;192:	s_confirm.yes.generic.x			= l1;
ADDRGP4 s_confirm+360+12
ADDRLP4 0
INDIRI4
ASGNI4
line 193
;193:	s_confirm.yes.generic.y			= 264;
ADDRGP4 s_confirm+360+16
CNSTI4 264
ASGNI4
line 194
;194:	s_confirm.yes.string			= "YES";
ADDRGP4 s_confirm+360+60
ADDRGP4 $115
ASGNP4
line 195
;195:	s_confirm.yes.color				= color_red;
ADDRGP4 s_confirm+360+68
ADDRGP4 color_red
ASGNP4
line 196
;196:	s_confirm.yes.style				= UI_LEFT;
ADDRGP4 s_confirm+360+64
CNSTI4 0
ASGNI4
line 198
;197:
;198:	s_confirm.no.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_confirm+288
CNSTI4 9
ASGNI4
line 199
;199:	s_confirm.no.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_confirm+288+44
CNSTU4 260
ASGNU4
line 200
;200:	s_confirm.no.generic.callback	= ConfirmMenu_Event;
ADDRGP4 s_confirm+288+48
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 201
;201:	s_confirm.no.generic.id			= ID_CONFIRM_NO;
ADDRGP4 s_confirm+288+8
CNSTI4 10
ASGNI4
line 202
;202:	s_confirm.no.generic.x		    = l3;
ADDRGP4 s_confirm+288+12
ADDRLP4 3104
INDIRI4
ASGNI4
line 203
;203:	s_confirm.no.generic.y		    = 264;
ADDRGP4 s_confirm+288+16
CNSTI4 264
ASGNI4
line 204
;204:	s_confirm.no.string				= "NO";
ADDRGP4 s_confirm+288+60
ADDRGP4 $158
ASGNP4
line 205
;205:	s_confirm.no.color			    = color_red;
ADDRGP4 s_confirm+288+68
ADDRGP4 color_red
ASGNP4
line 206
;206:	s_confirm.no.style			    = UI_LEFT;
ADDRGP4 s_confirm+288+64
CNSTI4 0
ASGNI4
line 208
;207:
;208:	Menu_AddItem( &s_confirm.menu,	&s_confirm.yes );             
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 209
;209:	Menu_AddItem( &s_confirm.menu,	&s_confirm.no );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 211
;210:
;211:	UI_PushMenu( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 213
;212:
;213:	Menu_SetCursorToItem( &s_confirm.menu, &s_confirm.no );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+288
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 214
;214:}
LABELV $113
endproc UI_ConfirmMenu_Style 3120 12
export UI_ConfirmMenu
proc UI_ConfirmMenu 0 16
line 221
;215:
;216:/*
;217:=================
;218:UI_ConfirmMenu
;219:=================
;220:*/
;221:void UI_ConfirmMenu( const char *question, void (*draw)( void ), void (*action)( qboolean result ) ) {
line 222
;222:	UI_ConfirmMenu_Style(question, UI_CENTER|UI_INVERSE, draw, action);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8193
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 223
;223:}
LABELV $166
endproc UI_ConfirmMenu 0 16
export UI_Message
proc UI_Message 3096 12
line 231
;224:
;225:/*
;226:=================
;227:UI_Message
;228:hacked over from Confirm stuff
;229:=================
;230:*/
;231:void UI_Message( const char **lines ) {
line 236
;232:	uiClientState_t	cstate;
;233:	int n1, l1;
;234:	
;235:	// zero set all our globals
;236:	memset( &s_confirm, 0, sizeof(s_confirm) );
ADDRGP4 s_confirm
ARGP4
CNSTI4 0
ARGI4
CNSTI4 456
ARGI4
ADDRGP4 memset
CALLP4
pop
line 238
;237:
;238:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 240
;239:
;240:	n1 = UI_ProportionalStringWidth( "OK" );
ADDRGP4 $168
ARGP4
ADDRLP4 3092
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3084
ADDRLP4 3092
INDIRI4
ASGNI4
line 241
;241:	l1 = 320 - ( n1 / 2 );
ADDRLP4 3088
CNSTI4 320
ADDRLP4 3084
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 243
;242:	
;243:	s_confirm.lines = lines;
ADDRGP4 s_confirm+452
ADDRFP4 0
INDIRP4
ASGNP4
line 244
;244:	s_confirm.style = UI_CENTER|UI_INVERSE|UI_SMALLFONT;
ADDRGP4 s_confirm+448
CNSTI4 8209
ASGNI4
line 246
;245:
;246:	s_confirm.menu.draw       = MessageMenu_Draw;
ADDRGP4 s_confirm+268
ADDRGP4 MessageMenu_Draw
ASGNP4
line 247
;247:	s_confirm.menu.key        = ConfirmMenu_Key;
ADDRGP4 s_confirm+272
ADDRGP4 ConfirmMenu_Key
ASGNP4
line 248
;248:	s_confirm.menu.wrapAround = qtrue;
ADDRGP4 s_confirm+276
CNSTI4 1
ASGNI4
line 250
;249:	
;250:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 251
;251:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $174
line 252
;252:		s_confirm.menu.fullscreen = qfalse;
ADDRGP4 s_confirm+280
CNSTI4 0
ASGNI4
line 253
;253:	}
ADDRGP4 $175
JUMPV
LABELV $174
line 254
;254:	else {
line 255
;255:		s_confirm.menu.fullscreen = qtrue;
ADDRGP4 s_confirm+280
CNSTI4 1
ASGNI4
line 256
;256:	}
LABELV $175
line 258
;257:
;258:	s_confirm.yes.generic.type		= MTYPE_PTEXT;      
ADDRGP4 s_confirm+360
CNSTI4 9
ASGNI4
line 259
;259:	s_confirm.yes.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS; 
ADDRGP4 s_confirm+360+44
CNSTU4 260
ASGNU4
line 260
;260:	s_confirm.yes.generic.callback	= ConfirmMenu_Event;
ADDRGP4 s_confirm+360+48
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 261
;261:	s_confirm.yes.generic.id		= ID_CONFIRM_YES;
ADDRGP4 s_confirm+360+8
CNSTI4 11
ASGNI4
line 262
;262:	s_confirm.yes.generic.x			= l1;
ADDRGP4 s_confirm+360+12
ADDRLP4 3088
INDIRI4
ASGNI4
line 263
;263:	s_confirm.yes.generic.y			= 280;
ADDRGP4 s_confirm+360+16
CNSTI4 280
ASGNI4
line 264
;264:	s_confirm.yes.string			= "OK";
ADDRGP4 s_confirm+360+60
ADDRGP4 $168
ASGNP4
line 265
;265:	s_confirm.yes.color				= color_red;
ADDRGP4 s_confirm+360+68
ADDRGP4 color_red
ASGNP4
line 266
;266:	s_confirm.yes.style				= UI_LEFT;
ADDRGP4 s_confirm+360+64
CNSTI4 0
ASGNI4
line 268
;267:
;268:	Menu_AddItem( &s_confirm.menu,	&s_confirm.yes );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 270
;269:	
;270:	UI_PushMenu( &s_confirm.menu );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 272
;271:
;272:	Menu_SetCursorToItem( &s_confirm.menu, &s_confirm.yes );
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+360
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 273
;273:}
LABELV $167
endproc UI_Message 3096 12
bss
align 4
LABELV s_confirm
skip 456
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
LABELV $168
byte 1 79
byte 1 75
byte 1 0
align 1
LABELV $158
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $115
byte 1 89
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $114
byte 1 89
byte 1 69
byte 1 83
byte 1 47
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $107
byte 1 47
byte 1 0
align 1
LABELV $91
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
