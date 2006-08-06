export CG_AdjustFrom640
code
proc CG_AdjustFrom640 16 0
file "../cg_drawtools.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;4:#include "cg_local.h"
;5:
;6:/*
;7:================
;8:CG_AdjustFrom640
;9:
;10:Adjusted for resolution and screen aspect ratio
;11:================
;12:*/
;13:void CG_AdjustFrom640( float *x, float *y, float *w, float *h ) {
line 21
;14:#if 0
;15:	// adjust for wide screens
;16:	if ( cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640 ) {
;17:		*x += 0.5 * ( cgs.glconfig.vidWidth - ( cgs.glconfig.vidHeight * 640 / 480 ) );
;18:	}
;19:#endif
;20:	// scale for screen sizes
;21:	*x *= cgs.screenXScale;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 22
;22:	*y *= cgs.screenYScale;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 23
;23:	*w *= cgs.screenXScale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 24
;24:	*h *= cgs.screenYScale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 25
;25:}
LABELV $72
endproc CG_AdjustFrom640 16 0
export CG_FillRect
proc CG_FillRect 4 36
line 34
;26:
;27:/*
;28:================
;29:CG_FillRect
;30:
;31:Coordinates are 640*480 virtual values
;32:=================
;33:*/
;34:void CG_FillRect( float x, float y, float width, float height, const float *color ) {
line 35
;35:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 37
;36:
;37:	CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 38
;38:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader );
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
ADDRGP4 cgs+152852+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 40
;39:
;40:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 41
;41:}
LABELV $77
endproc CG_FillRect 4 36
export CG_DrawSides
proc CG_DrawSides 12 36
line 50
;42:
;43:/*
;44:================
;45:CG_DrawSides
;46:
;47:Coords are virtual 640x480
;48:================
;49:*/
;50:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 51
;51:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 52
;52:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 53
;53:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
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
ADDRGP4 cgs+152852+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 54
;54:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
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
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+152852+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 55
;55:}
LABELV $80
endproc CG_DrawSides 12 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 12 36
line 57
;56:
;57:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 58
;58:	CG_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 59
;59:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 60
;60:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
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
ADDRGP4 cgs+152852+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 61
;61:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
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
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 cgs+152852+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 62
;62:}
LABELV $86
endproc CG_DrawTopBottom 12 36
export CG_DrawRect
proc CG_DrawRect 0 20
line 70
;63:/*
;64:================
;65:UI_DrawRect
;66:
;67:Coordinates are 640*480 virtual values
;68:=================
;69:*/
;70:void CG_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 71
;71:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 73
;72:
;73:  CG_DrawTopBottom(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 74
;74:  CG_DrawSides(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 76
;75:
;76:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 77
;77:}
LABELV $92
endproc CG_DrawRect 0 20
export CG_DrawPic
proc CG_DrawPic 8 36
line 88
;78:
;79:
;80:
;81:/*
;82:================
;83:CG_DrawPic
;84:
;85:Coordinates are 640*480 virtual values
;86:=================
;87:*/
;88:void CG_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
line 89
;89:	CG_AdjustFrom640( &x, &y, &width, &height );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 90
;90:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
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
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 91
;91:}
LABELV $93
endproc CG_DrawPic 8 36
export CG_DrawChar
proc CG_DrawChar 48 36
line 102
;92:
;93:
;94:
;95:/*
;96:===============
;97:CG_DrawChar
;98:
;99:Coordinates and size in 640*480 virtual screen size
;100:===============
;101:*/
;102:void CG_DrawChar( int x, int y, int width, int height, int ch ) {
line 108
;103:	int row, col;
;104:	float frow, fcol;
;105:	float size;
;106:	float	ax, ay, aw, ah;
;107:
;108:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 110
;109:
;110:	if ( ch == ' ' ) {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $95
line 111
;111:		return;
ADDRGP4 $94
JUMPV
LABELV $95
line 114
;112:	}
;113:
;114:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 115
;115:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 116
;116:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 117
;117:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 118
;118:	CG_AdjustFrom640( &ax, &ay, &aw, &ah );
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 120
;119:
;120:	row = ch>>4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 121
;121:	col = ch&15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 123
;122:
;123:	frow = row*0.0625;
ADDRLP4 0
CNSTF4 1031798784
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 124
;124:	fcol = col*0.0625;
ADDRLP4 4
CNSTF4 1031798784
ADDRLP4 32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 125
;125:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 127
;126:
;127:	trap_R_DrawStretchPic( ax, ay, aw, ah,
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+152852
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 131
;128:					   fcol, frow, 
;129:					   fcol + size, frow + size, 
;130:					   cgs.media.charsetShader );
;131:}
LABELV $94
endproc CG_DrawChar 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 48 20
line 145
;132:
;133:
;134:/*
;135:==================
;136:CG_DrawStringExt
;137:
;138:Draws a multi-colored string with a drop shadow, optionally forcing
;139:to a fixed color.
;140:
;141:Coordinates are at 640 by 480 virtual resolution
;142:==================
;143:*/
;144:void CG_DrawStringExt( int x, int y, const char *string, const float *setColor, 
;145:		qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars ) {
line 151
;146:	vec4_t		color;
;147:	const char	*s;
;148:	int			xx;
;149:	int			cnt;
;150:
;151:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $99
line 152
;152:		maxChars = 32767; // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $99
line 155
;153:
;154:	// draw the drop shadow
;155:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $101
line 156
;156:		color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 157
;157:		color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 158
;158:		trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 159
;159:		s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 160
;160:		xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 161
;161:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $106
line 162
;162:		while ( *s && cnt < maxChars) {
line 163
;163:			if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $109
ADDRLP4 36
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $109
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $109
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $109
line 164
;164:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 165
;165:				continue;
ADDRGP4 $107
JUMPV
LABELV $109
line 167
;166:			}
;167:			CG_DrawChar( xx + 2, y + 2, charWidth, charHeight, *s );
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 168
;168:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 169
;169:			xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 170
;170:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 171
;171:		}
LABELV $107
line 162
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $111
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $106
LABELV $111
line 172
;172:	}
LABELV $101
line 175
;173:
;174:	// draw the colored text
;175:	s = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 176
;176:	xx = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 177
;177:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 178
;178:	trap_R_SetColor( setColor );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $113
JUMPV
LABELV $112
line 179
;179:	while ( *s && cnt < maxChars) {
line 180
;180:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $115
ADDRLP4 32
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $115
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $115
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $115
line 181
;181:			if ( !forceColor ) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $117
line 182
;182:				memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
ADDRLP4 12
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
line 183
;183:				color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 184
;184:				trap_R_SetColor( color );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 185
;185:			}
LABELV $117
line 186
;186:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 187
;187:			continue;
ADDRGP4 $113
JUMPV
LABELV $115
line 189
;188:		}
;189:		CG_DrawChar( xx, y, charWidth, charHeight, *s );
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 190
;190:		xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 191
;191:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 192
;192:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 193
;193:	}
LABELV $113
line 179
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $120
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $112
LABELV $120
line 194
;194:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 195
;195:}
LABELV $98
endproc CG_DrawStringExt 48 20
export CG_DrawBigString
proc CG_DrawBigString 28 36
line 197
;196:
;197:void CG_DrawBigString( int x, int y, const char *s, float alpha ) {
line 200
;198:	float	color[4];
;199:
;200:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 201
;201:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 202
;202:	CG_DrawStringExt( x, y, s, color, qfalse, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
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
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 203
;203:}
LABELV $121
endproc CG_DrawBigString 28 36
export CG_DrawBigStringColor
proc CG_DrawBigStringColor 8 36
line 205
;204:
;205:void CG_DrawBigStringColor( int x, int y, const char *s, vec4_t color ) {
line 206
;206:	CG_DrawStringExt( x, y, s, color, qtrue, qtrue, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
CNSTI4 16
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 207
;207:}
LABELV $125
endproc CG_DrawBigStringColor 8 36
export CG_DrawSmallString
proc CG_DrawSmallString 24 36
line 209
;208:
;209:void CG_DrawSmallString( int x, int y, const char *s, float alpha ) {
line 212
;210:	float	color[4];
;211:
;212:	color[0] = color[1] = color[2] = 1.0;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 213
;213:	color[3] = alpha;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 214
;214:	CG_DrawStringExt( x, y, s, color, qfalse, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
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
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 215
;215:}
LABELV $126
endproc CG_DrawSmallString 24 36
export CG_DrawSmallStringColor
proc CG_DrawSmallStringColor 4 36
line 217
;216:
;217:void CG_DrawSmallStringColor( int x, int y, const char *s, vec4_t color ) {
line 218
;218:	CG_DrawStringExt( x, y, s, color, qtrue, qfalse, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0 );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawStringExt
CALLV
pop
line 219
;219:}
LABELV $130
endproc CG_DrawSmallStringColor 4 36
export CG_DrawStrlen
proc CG_DrawStrlen 20 0
line 228
;220:
;221:/*
;222:=================
;223:CG_DrawStrlen
;224:
;225:Returns character count, skiping color escape codes
;226:=================
;227:*/
;228:int CG_DrawStrlen( const char *str ) {
line 229
;229:	const char *s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 230
;230:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $132
line 232
;231:
;232:	while ( *s ) {
line 233
;233:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $135
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $135
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $135
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $135
line 234
;234:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 235
;235:		} else {
ADDRGP4 $136
JUMPV
LABELV $135
line 236
;236:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 237
;237:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 238
;238:		}
LABELV $136
line 239
;239:	}
LABELV $133
line 232
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $132
line 241
;240:
;241:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $131
endproc CG_DrawStrlen 20 0
proc CG_TileClearBox 16 36
line 252
;242:}
;243:
;244:/*
;245:=============
;246:CG_TileClearBox
;247:
;248:This repeats a 64*64 tile graphic to fill the screen around a sized down
;249:refresh window.
;250:=============
;251:*/
;252:static void CG_TileClearBox( int x, int y, int w, int h, qhandle_t hShader ) {
line 255
;253:	float	s1, t1, s2, t2;
;254:
;255:	s1 = x/64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 256
;256:	t1 = y/64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 257
;257:	s2 = (x+w)/64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 258
;258:	t2 = (y+h)/64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1115684864
DIVF4
ASGNF4
line 259
;259:	trap_R_DrawStretchPic( x, y, w, h, s1, t1, s2, t2, hShader );
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
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
line 260
;260:}
LABELV $137
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 48 20
line 271
;261:
;262:
;263:
;264:/*
;265:==============
;266:CG_TileClear
;267:
;268:Clear around a sized down screen
;269:==============
;270:*/
;271:void CG_TileClear( void ) {
line 275
;272:	int		top, bottom, left, right;
;273:	int		w, h;
;274:
;275:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+20100+11304
INDIRI4
ASGNI4
line 276
;276:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+20100+11308
INDIRI4
ASGNI4
line 278
;277:
;278:	if ( cg.refdef.x == 0 && cg.refdef.y == 0 && 
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+109048
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $143
ADDRGP4 cg+109048+4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $143
ADDRGP4 cg+109048+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $143
ADDRGP4 cg+109048+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $143
line 279
;279:		cg.refdef.width == w && cg.refdef.height == h ) {
line 280
;280:		return;		// full screen rendering
ADDRGP4 $138
JUMPV
LABELV $143
line 283
;281:	}
;282:
;283:	top = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+109048+4
INDIRI4
ASGNI4
line 284
;284:	bottom = top + cg.refdef.height-1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109048+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 285
;285:	left = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+109048
INDIRI4
ASGNI4
line 286
;286:	right = left + cg.refdef.width-1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+109048+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 289
;287:
;288:	// clear above view screen
;289:	CG_TileClearBox( 0, 0, w, top, cgs.media.backTileShader );
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+152852+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 292
;290:
;291:	// clear below view screen
;292:	CG_TileClearBox( 0, bottom, w, h - bottom, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+152852+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 295
;293:
;294:	// clear left of view screen
;295:	CG_TileClearBox( 0, top, left, bottom - top + 1, cgs.media.backTileShader );
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+152852+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 298
;296:
;297:	// clear right of view screen
;298:	CG_TileClearBox( right, top, w - right, bottom - top + 1, cgs.media.backTileShader );
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+152852+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 299
;299:}
LABELV $138
endproc CG_TileClear 48 20
bss
align 4
LABELV $168
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 308
;300:
;301:
;302:
;303:/*
;304:================
;305:CG_FadeColor
;306:================
;307:*/
;308:float *CG_FadeColor( int startMsec, int totalMsec ) {
line 312
;309:	static vec4_t		color;
;310:	int			t;
;311:
;312:	if ( startMsec == 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $169
line 313
;313:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $167
JUMPV
LABELV $169
line 316
;314:	}
;315:
;316:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 318
;317:
;318:	if ( t >= totalMsec ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $172
line 319
;319:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $167
JUMPV
LABELV $172
line 323
;320:	}
;321:
;322:	// fade out
;323:	if ( totalMsec - t < FADE_TIME ) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $174
line 324
;324:		color[3] = ( totalMsec - t ) * 1.0/FADE_TIME;
ADDRGP4 $168+12
CNSTF4 1065353216
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 325
;325:	} else {
ADDRGP4 $175
JUMPV
LABELV $174
line 326
;326:		color[3] = 1.0;
ADDRGP4 $168+12
CNSTF4 1065353216
ASGNF4
line 327
;327:	}
LABELV $175
line 328
;328:	color[0] = color[1] = color[2] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $168+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $168+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $168
ADDRLP4 4
INDIRF4
ASGNF4
line 330
;329:
;330:	return color;
ADDRGP4 $168
RETP4
LABELV $167
endproc CG_FadeColor 8 0
data
align 4
LABELV $181
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
align 4
LABELV $182
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $183
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $184
byte 4 1060320051
byte 4 1060320051
byte 4 1060320051
byte 4 1065353216
export CG_TeamColor
code
proc CG_TeamColor 4 0
line 339
;331:}
;332:
;333:
;334:/*
;335:================
;336:CG_TeamColor
;337:================
;338:*/
;339:float *CG_TeamColor( int team ) {
line 345
;340:	static vec4_t	red = {1, 0.2f, 0.2f, 1};
;341:	static vec4_t	blue = {0.2f, 0.2f, 1, 1};
;342:	static vec4_t	other = {1, 1, 1, 1};
;343:	static vec4_t	spectator = {0.7f, 0.7f, 0.7f, 1};
;344:
;345:	switch ( team ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $187
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $188
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $189
ADDRGP4 $185
JUMPV
LABELV $187
line 347
;346:	case TEAM_RED:
;347:		return red;
ADDRGP4 $181
RETP4
ADDRGP4 $180
JUMPV
LABELV $188
line 349
;348:	case TEAM_BLUE:
;349:		return blue;
ADDRGP4 $182
RETP4
ADDRGP4 $180
JUMPV
LABELV $189
line 351
;350:	case TEAM_SPECTATOR:
;351:		return spectator;
ADDRGP4 $184
RETP4
ADDRGP4 $180
JUMPV
LABELV $185
line 353
;352:	default:
;353:		return other;
ADDRGP4 $183
RETP4
LABELV $180
endproc CG_TeamColor 4 0
export CG_GetColorForHealth
proc CG_GetColorForHealth 16 0
line 364
;354:	}
;355:}
;356:
;357:
;358:
;359:/*
;360:=================
;361:CG_GetColorForHealth
;362:=================
;363:*/
;364:void CG_GetColorForHealth( int health, int armor, vec4_t hcolor ) {
line 370
;365:	int		count;
;366:	int		max;
;367:
;368:	// calculate the total points of damage that can
;369:	// be sustained at the current health / armor level
;370:	if ( health <= 0 ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $191
line 371
;371:		VectorClear( hcolor );	// black
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 372
;372:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 373
;373:		return;
ADDRGP4 $190
JUMPV
LABELV $191
line 375
;374:	}
;375:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 376
;376:	max = health * ARMOR_PROTECTION / ( 1.0 - ARMOR_PROTECTION );
ADDRLP4 4
CNSTF4 1059648963
ADDRFP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 1051595899
DIVF4
CVFI4 4
ASGNI4
line 377
;377:	if ( max < count ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $193
line 378
;378:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 379
;379:	}
LABELV $193
line 380
;380:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 383
;381:
;382:	// set the color based on health
;383:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 384
;384:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 385
;385:	if ( health >= 100 ) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $195
line 386
;386:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 387
;387:	} else if ( health < 66 ) {
ADDRGP4 $196
JUMPV
LABELV $195
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $197
line 388
;388:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 389
;389:	} else {
ADDRGP4 $198
JUMPV
LABELV $197
line 390
;390:		hcolor[2] = ( health - 66 ) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1107558400
DIVF4
ASGNF4
line 391
;391:	}
LABELV $198
LABELV $196
line 393
;392:
;393:	if ( health > 60 ) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $199
line 394
;394:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 395
;395:	} else if ( health < 30 ) {
ADDRGP4 $200
JUMPV
LABELV $199
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $201
line 396
;396:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 397
;397:	} else {
ADDRGP4 $202
JUMPV
LABELV $201
line 398
;398:		hcolor[1] = ( health - 30 ) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1106247680
DIVF4
ASGNF4
line 399
;399:	}
LABELV $202
LABELV $200
line 400
;400:}
LABELV $190
endproc CG_GetColorForHealth 16 0
export CG_ColorForHealth
proc CG_ColorForHealth 0 12
line 407
;401:
;402:/*
;403:=================
;404:CG_ColorForHealth
;405:=================
;406:*/
;407:void CG_ColorForHealth( vec4_t hcolor ) {
line 409
;408:
;409:	CG_GetColorForHealth( cg.snap->ps.stats[STAT_HEALTH], 
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 411
;410:		cg.snap->ps.stats[STAT_ARMOR], hcolor );
;411:}
LABELV $203
endproc CG_ColorForHealth 0 12
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
line 577
;412:
;413:
;414:
;415:
;416:// bk001205 - code below duplicated in q3_ui/ui-atoms.c
;417:// bk001205 - FIXME: does this belong in ui_shared.c?
;418:// bk001205 - FIXME: HARD_LINKED flags not visible here
;419:#ifndef Q3_STATIC // bk001205 - q_shared defines not visible here 
;420:/*
;421:=================
;422:UI_DrawProportionalString2
;423:=================
;424:*/
;425:static int	propMap[128][3] = {
;426:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;427:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;428:
;429:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;430:{0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1}, {0, 0, -1},
;431:
;432:{0, 0, PROP_SPACE_WIDTH},		// SPACE
;433:{11, 122, 7},	// !
;434:{154, 181, 14},	// "
;435:{55, 122, 17},	// #
;436:{79, 122, 18},	// $
;437:{101, 122, 23},	// %
;438:{153, 122, 18},	// &
;439:{9, 93, 7},		// '
;440:{207, 122, 8},	// (
;441:{230, 122, 9},	// )
;442:{177, 122, 18},	// *
;443:{30, 152, 18},	// +
;444:{85, 181, 7},	// ,
;445:{34, 93, 11},	// -
;446:{110, 181, 6},	// .
;447:{130, 152, 14},	// /
;448:
;449:{22, 64, 17},	// 0
;450:{41, 64, 12},	// 1
;451:{58, 64, 17},	// 2
;452:{78, 64, 18},	// 3
;453:{98, 64, 19},	// 4
;454:{120, 64, 18},	// 5
;455:{141, 64, 18},	// 6
;456:{204, 64, 16},	// 7
;457:{162, 64, 17},	// 8
;458:{182, 64, 18},	// 9
;459:{59, 181, 7},	// :
;460:{35,181, 7},	// ;
;461:{203, 152, 14},	// <
;462:{56, 93, 14},	// =
;463:{228, 152, 14},	// >
;464:{177, 181, 18},	// ?
;465:
;466:{28, 122, 22},	// @
;467:{5, 4, 18},		// A
;468:{27, 4, 18},	// B
;469:{48, 4, 18},	// C
;470:{69, 4, 17},	// D
;471:{90, 4, 13},	// E
;472:{106, 4, 13},	// F
;473:{121, 4, 18},	// G
;474:{143, 4, 17},	// H
;475:{164, 4, 8},	// I
;476:{175, 4, 16},	// J
;477:{195, 4, 18},	// K
;478:{216, 4, 12},	// L
;479:{230, 4, 23},	// M
;480:{6, 34, 18},	// N
;481:{27, 34, 18},	// O
;482:
;483:{48, 34, 18},	// P
;484:{68, 34, 18},	// Q
;485:{90, 34, 17},	// R
;486:{110, 34, 18},	// S
;487:{130, 34, 14},	// T
;488:{146, 34, 18},	// U
;489:{166, 34, 19},	// V
;490:{185, 34, 29},	// W
;491:{215, 34, 18},	// X
;492:{234, 34, 18},	// Y
;493:{5, 64, 14},	// Z
;494:{60, 152, 7},	// [
;495:{106, 151, 13},	// '\'
;496:{83, 152, 7},	// ]
;497:{128, 122, 17},	// ^
;498:{4, 152, 21},	// _
;499:
;500:{134, 181, 5},	// '
;501:{5, 4, 18},		// A
;502:{27, 4, 18},	// B
;503:{48, 4, 18},	// C
;504:{69, 4, 17},	// D
;505:{90, 4, 13},	// E
;506:{106, 4, 13},	// F
;507:{121, 4, 18},	// G
;508:{143, 4, 17},	// H
;509:{164, 4, 8},	// I
;510:{175, 4, 16},	// J
;511:{195, 4, 18},	// K
;512:{216, 4, 12},	// L
;513:{230, 4, 23},	// M
;514:{6, 34, 18},	// N
;515:{27, 34, 18},	// O
;516:
;517:{48, 34, 18},	// P
;518:{68, 34, 18},	// Q
;519:{90, 34, 17},	// R
;520:{110, 34, 18},	// S
;521:{130, 34, 14},	// T
;522:{146, 34, 18},	// U
;523:{166, 34, 19},	// V
;524:{185, 34, 29},	// W
;525:{215, 34, 18},	// X
;526:{234, 34, 18},	// Y
;527:{5, 64, 14},	// Z
;528:{153, 152, 13},	// {
;529:{11, 181, 5},	// |
;530:{180, 152, 13},	// }
;531:{79, 93, 17},	// ~
;532:{0, 0, -1}		// DEL
;533:};
;534:
;535:static int propMapB[26][3] = {
;536:{11, 12, 33},
;537:{49, 12, 31},
;538:{85, 12, 31},
;539:{120, 12, 30},
;540:{156, 12, 21},
;541:{183, 12, 21},
;542:{207, 12, 32},
;543:
;544:{13, 55, 30},
;545:{49, 55, 13},
;546:{66, 55, 29},
;547:{101, 55, 31},
;548:{135, 55, 21},
;549:{158, 55, 40},
;550:{204, 55, 32},
;551:
;552:{12, 97, 31},
;553:{48, 97, 31},
;554:{82, 97, 30},
;555:{118, 97, 30},
;556:{153, 97, 30},
;557:{185, 97, 25},
;558:{213, 97, 30},
;559:
;560:{11, 139, 32},
;561:{42, 139, 51},
;562:{93, 139, 32},
;563:{126, 139, 31},
;564:{158, 139, 25},
;565:};
;566:
;567:#define PROPB_GAP_WIDTH		4
;568:#define PROPB_SPACE_WIDTH	12
;569:#define PROPB_HEIGHT		36
;570:
;571:/*
;572:=================
;573:UI_DrawBannerString
;574:=================
;575:*/
;576:static void UI_DrawBannerString2( int x, int y, const char* str, vec4_t color )
;577:{
line 590
;578:	const char* s;
;579:	unsigned char	ch; // bk001204 : array subscript
;580:	float	ax;
;581:	float	ay;
;582:	float	aw;
;583:	float	ah;
;584:	float	frow;
;585:	float	fcol;
;586:	float	fwidth;
;587:	float	fheight;
;588:
;589:	// draw the colored text
;590:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 592
;591:	
;592:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31440
INDIRF4
ADDF4
ASGNF4
line 593
;593:	ay = y * cgs.screenXScale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 595
;594:
;595:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $211
JUMPV
LABELV $210
line 597
;596:	while ( *s )
;597:	{
line 598
;598:		ch = *s & 127;
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
line 599
;599:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $213
line 600
;600:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH)* cgs.screenXScale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1098907648
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDF4
ASGNF4
line 601
;601:		}
ADDRGP4 $214
JUMPV
LABELV $213
line 602
;602:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $216
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $216
line 603
;603:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 604
;604:			fcol = (float)propMapB[ch][0] / 256.0f;
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
line 605
;605:			frow = (float)propMapB[ch][1] / 256.0f;
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
line 606
;606:			fwidth = (float)propMapB[ch][2] / 256.0f;
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
line 607
;607:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 608
;608:			aw = (float)propMapB[ch][2] * cgs.screenXScale;
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
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 609
;609:			ah = (float)PROPB_HEIGHT * cgs.screenXScale;
ADDRLP4 24
CNSTF4 1108344832
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 610
;610:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, cgs.media.charsetPropB );
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
ADDRGP4 cgs+152852+12
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 611
;611:			ax += (aw + (float)PROPB_GAP_WIDTH * cgs.screenXScale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 612
;612:		}
LABELV $216
LABELV $214
line 613
;613:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 614
;614:	}
LABELV $211
line 596
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $210
line 616
;615:
;616:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 617
;617:}
LABELV $206
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 44 16
line 619
;618:
;619:void UI_DrawBannerString( int x, int y, const char* str, int style, vec4_t color ) {
line 626
;620:	const char *	s;
;621:	int				ch;
;622:	int				width;
;623:	vec4_t			drawcolor;
;624:
;625:	// find the width of the drawn text
;626:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 627
;627:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $228
JUMPV
LABELV $227
line 628
;628:	while ( *s ) {
line 629
;629:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 630
;630:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $230
line 631
;631:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 632
;632:		}
ADDRGP4 $231
JUMPV
LABELV $230
line 633
;633:		else if ( ch >= 'A' && ch <= 'Z' ) {
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $232
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $232
line 634
;634:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
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
line 635
;635:		}
LABELV $232
LABELV $231
line 636
;636:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 637
;637:	}
LABELV $228
line 628
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $227
line 638
;638:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 640
;639:
;640:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $237
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $239
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $240
ADDRGP4 $237
JUMPV
LABELV $239
line 642
;641:		case UI_CENTER:
;642:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 643
;643:			break;
ADDRGP4 $237
JUMPV
LABELV $240
line 646
;644:
;645:		case UI_RIGHT:
;646:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 647
;647:			break;
line 651
;648:
;649:		case UI_LEFT:
;650:		default:
;651:			break;
LABELV $237
line 654
;652:	}
;653:
;654:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $242
line 655
;655:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 656
;656:		drawcolor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 657
;657:		UI_DrawBannerString2( x+2, y+2, str, drawcolor );
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
line 658
;658:	}
LABELV $242
line 660
;659:
;660:	UI_DrawBannerString2( x, y, str, color );
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
line 661
;661:}
LABELV $226
endproc UI_DrawBannerString 44 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 664
;662:
;663:
;664:int UI_ProportionalStringWidth( const char* str ) {
line 670
;665:	const char *	s;
;666:	int				ch;
;667:	int				charWidth;
;668:	int				width;
;669:
;670:	s = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 671
;671:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $249
JUMPV
LABELV $248
line 672
;672:	while ( *s ) {
line 673
;673:		ch = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 674
;674:		charWidth = propMap[ch][2];
ADDRLP4 4
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 675
;675:		if ( charWidth != -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $252
line 676
;676:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 677
;677:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 678
;678:		}
LABELV $252
line 679
;679:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 680
;680:	}
LABELV $249
line 672
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $248
line 682
;681:
;682:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 683
;683:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $247
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 687
;684:}
;685:
;686:static void UI_DrawProportionalString2( int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset )
;687:{
line 700
;688:	const char* s;
;689:	unsigned char	ch; // bk001204 - unsigned
;690:	float	ax;
;691:	float	ay;
;692:	float	aw;
;693:	float	ah;
;694:	float	frow;
;695:	float	fcol;
;696:	float	fwidth;
;697:	float	fheight;
;698:
;699:	// draw the colored text
;700:	trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 702
;701:	
;702:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31440
INDIRF4
ADDF4
ASGNF4
line 703
;703:	ay = y * cgs.screenXScale;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 705
;704:
;705:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $259
JUMPV
LABELV $258
line 707
;706:	while ( *s )
;707:	{
line 708
;708:		ch = *s & 127;
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
line 709
;709:		if ( ch == ' ' ) {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $261
line 710
;710:			aw = (float)PROP_SPACE_WIDTH * cgs.screenXScale * sizeScale;
ADDRLP4 8
CNSTF4 1090519040
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 711
;711:		} else if ( propMap[ch][2] != -1 ) {
ADDRGP4 $262
JUMPV
LABELV $261
CNSTI4 12
ADDRLP4 0
INDIRU1
CVUI4 1
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $264
line 712
;712:			fcol = (float)propMap[ch][0] / 256.0f;
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
line 713
;713:			frow = (float)propMap[ch][1] / 256.0f;
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
line 714
;714:			fwidth = (float)propMap[ch][2] / 256.0f;
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
line 715
;715:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 716
;716:			aw = (float)propMap[ch][2] * cgs.screenXScale * sizeScale;
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
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 717
;717:			ah = (float)PROP_HEIGHT * cgs.screenXScale * sizeScale;
ADDRLP4 24
CNSTF4 1104674816
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 718
;718:			trap_R_DrawStretchPic( ax, ay, aw, ah, fcol, frow, fcol+fwidth, frow+fheight, charset );
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
line 719
;719:		} else {
ADDRGP4 $265
JUMPV
LABELV $264
line 720
;720:			aw = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 721
;721:		}
LABELV $265
LABELV $262
line 723
;722:
;723:		ax += (aw + (float)PROP_GAP_WIDTH * cgs.screenXScale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 724
;724:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 725
;725:	}
LABELV $259
line 706
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $258
line 727
;726:
;727:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 728
;728:}
LABELV $254
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 735
;729:
;730:/*
;731:=================
;732:UI_ProportionalSizeScale
;733:=================
;734:*/
;735:float UI_ProportionalSizeScale( int style ) {
line 736
;736:	if(  style & UI_SMALLFONT ) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $274
line 737
;737:		return 0.75;
CNSTF4 1061158912
RETF4
ADDRGP4 $273
JUMPV
LABELV $274
line 740
;738:	}
;739:
;740:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $273
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 749
;741:}
;742:
;743:
;744:/*
;745:=================
;746:UI_DrawProportionalString
;747:=================
;748:*/
;749:void UI_DrawProportionalString( int x, int y, const char* str, int style, vec4_t color ) {
line 754
;750:	vec4_t	drawcolor;
;751:	int		width;
;752:	float	sizeScale;
;753:
;754:	sizeScale = UI_ProportionalSizeScale( style );
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
line 756
;755:
;756:	switch( style & UI_FORMATMASK ) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $278
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $280
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $281
ADDRGP4 $278
JUMPV
LABELV $280
line 758
;757:		case UI_CENTER:
;758:			width = UI_ProportionalStringWidth( str ) * sizeScale;
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
line 759
;759:			x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 760
;760:			break;
ADDRGP4 $278
JUMPV
LABELV $281
line 763
;761:
;762:		case UI_RIGHT:
;763:			width = UI_ProportionalStringWidth( str ) * sizeScale;
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
line 764
;764:			x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 765
;765:			break;
line 769
;766:
;767:		case UI_LEFT:
;768:		default:
;769:			break;
LABELV $278
line 772
;770:	}
;771:
;772:	if ( style & UI_DROPSHADOW ) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $283
line 773
;773:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 774
;774:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 775
;775:		UI_DrawProportionalString2( x+2, y+2, str, drawcolor, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+152852+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 776
;776:	}
LABELV $283
line 778
;777:
;778:	if ( style & UI_INVERSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $290
line 779
;779:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 780
;780:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 781
;781:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 782
;782:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 783
;783:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+152852+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 784
;784:		return;
ADDRGP4 $276
JUMPV
LABELV $290
line 787
;785:	}
;786:
;787:	if ( style & UI_PULSE ) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $297
line 788
;788:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 789
;789:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 790
;790:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 791
;791:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 792
;792:		UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+152852+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 794
;793:
;794:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 795
;795:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 796
;796:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 797
;797:		drawcolor[3] = 0.5 + 0.5 * sin( cg.time / PULSE_DIVISOR );
ADDRGP4 cg+107604
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
line 798
;798:		UI_DrawProportionalString2( x, y, str, drawcolor, sizeScale, cgs.media.charsetPropGlow );
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
ADDRGP4 cgs+152852+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 799
;799:		return;
ADDRGP4 $276
JUMPV
LABELV $297
line 802
;800:	}
;801:
;802:	UI_DrawProportionalString2( x, y, str, color, sizeScale, cgs.media.charsetProp );
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
ADDRGP4 cgs+152852+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 803
;803:}
LABELV $276
endproc UI_DrawProportionalString 44 24
import CG_DrawScanner
import CG_ScannerOff_f
import CG_ScannerOn_f
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayerHeadshot
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon2
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawString
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_AddBoundingBox
import CG_PredictWeaponEffects
import cg_playerOrigins
import cg_plOut
import cg_latentCmds
import cg_latentSnaps
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_drawBBox
import cg_debugDelag
import cg_delag
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
