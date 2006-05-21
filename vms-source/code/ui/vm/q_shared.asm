export Com_Clamp
code
proc Com_Clamp 0 0
file "../../game/q_shared.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:float Com_Clamp( float min, float max, float value ) {
line 7
;7:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $23
line 8
;8:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $22
JUMPV
LABELV $23
line 10
;9:	}
;10:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $25
line 11
;11:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $22
JUMPV
LABELV $25
line 13
;12:	}
;13:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $22
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 23
;14:}
;15:
;16:
;17:/*
;18:============
;19:COM_SkipPath
;20:============
;21:*/
;22:char *COM_SkipPath (char *pathname)
;23:{
line 26
;24:	char	*last;
;25:	
;26:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $29
JUMPV
LABELV $28
line 28
;27:	while (*pathname)
;28:	{
line 29
;29:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $31
line 30
;30:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $31
line 31
;31:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 32
;32:	}
LABELV $29
line 27
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $28
line 33
;33:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $27
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 0
line 41
;34:}
;35:
;36:/*
;37:============
;38:COM_StripExtension
;39:============
;40:*/
;41:void COM_StripExtension( const char *in, char *out ) {
ADDRGP4 $35
JUMPV
LABELV $34
line 42
;42:	while ( *in && *in != '.' ) {
line 43
;43:		*out++ = *in++;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI1
ASGNI1
line 44
;44:	}
LABELV $35
line 42
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $37
ADDRLP4 0
INDIRI4
CNSTI4 46
NEI4 $34
LABELV $37
line 45
;45:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 46
;46:}
LABELV $33
endproc COM_StripExtension 12 0
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 54
;47:
;48:
;49:/*
;50:==================
;51:COM_DefaultExtension
;52:==================
;53:*/
;54:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 62
;55:	char	oldPath[MAX_QPATH];
;56:	char    *src;
;57:
;58://
;59:// if path doesn't have a .EXT, append extension
;60:// (extension should include the .)
;61://
;62:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $40
JUMPV
LABELV $39
line 64
;63:
;64:	while (*src != '/' && src != path) {
line 65
;65:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $42
line 66
;66:			return;                 // it has an extension
ADDRGP4 $38
JUMPV
LABELV $42
line 68
;67:		}
;68:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 69
;69:	}
LABELV $40
line 64
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $44
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $39
LABELV $44
line 71
;70:
;71:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 72
;72:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $45
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 73
;73:}
LABELV $38
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 105
;74:
;75:/*
;76:============================================================================
;77:
;78:					BYTE ORDER FUNCTIONS
;79:
;80:============================================================================
;81:*/
;82:/*
;83:// can't just use function pointers, or dll linkage can
;84:// mess up when qcommon is included in multiple places
;85:static short	(*_BigShort) (short l);
;86:static short	(*_LittleShort) (short l);
;87:static int		(*_BigLong) (int l);
;88:static int		(*_LittleLong) (int l);
;89:static qint64	(*_BigLong64) (qint64 l);
;90:static qint64	(*_LittleLong64) (qint64 l);
;91:static float	(*_BigFloat) (const float *l);
;92:static float	(*_LittleFloat) (const float *l);
;93:
;94:short	BigShort(short l){return _BigShort(l);}
;95:short	LittleShort(short l) {return _LittleShort(l);}
;96:int		BigLong (int l) {return _BigLong(l);}
;97:int		LittleLong (int l) {return _LittleLong(l);}
;98:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;99:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;100:float	BigFloat (const float *l) {return _BigFloat(l);}
;101:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;102:*/
;103:
;104:short   ShortSwap (short l)
;105:{
line 108
;106:	byte    b1,b2;
;107:
;108:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 109
;109:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 111
;110:
;111:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $46
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 115
;112:}
;113:
;114:short	ShortNoSwap (short l)
;115:{
line 116
;116:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $47
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 120
;117:}
;118:
;119:int    LongSwap (int l)
;120:{
line 123
;121:	byte    b1,b2,b3,b4;
;122:
;123:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 124
;124:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 125
;125:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 126
;126:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 128
;127:
;128:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $48
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 132
;129:}
;130:
;131:int	LongNoSwap (int l)
;132:{
line 133
;133:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $49
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 137
;134:}
;135:
;136:qint64 Long64Swap (qint64 ll)
;137:{
line 140
;138:	qint64	result;
;139:
;140:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 141
;141:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 142
;142:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 143
;143:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 144
;144:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 145
;145:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 146
;146:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 147
;147:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 149
;148:
;149:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $50
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 153
;150:}
;151:
;152:qint64 Long64NoSwap (qint64 ll)
;153:{
line 154
;154:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $59
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 12 4
line 162
;155:}
;156:
;157:typedef union {
;158:    float	f;
;159:    unsigned int i;
;160:} _FloatByteUnion;
;161:
;162:float FloatSwap (const float *f) {
line 166
;163:	const _FloatByteUnion *in;
;164:	_FloatByteUnion out;
;165:
;166:	in = (_FloatByteUnion *)f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 167
;167:	out.i = LongSwap(in->i);
ADDRLP4 0
INDIRP4
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 8
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CVIU4 4
ASGNU4
line 169
;168:
;169:	return out.f;
ADDRLP4 4
INDIRF4
RETF4
LABELV $62
endproc FloatSwap 12 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 173
;170:}
;171:
;172:float FloatNoSwap (const float *f)
;173:{
line 174
;174:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $63
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 227
;175:}
;176:
;177:/*
;178:================
;179:Swap_Init
;180:================
;181:*/
;182:/*
;183:void Swap_Init (void)
;184:{
;185:	byte	swaptest[2] = {1,0};
;186:
;187:// set the byte swapping variables in a portable manner	
;188:	if ( *(short *)swaptest == 1)
;189:	{
;190:		_BigShort = ShortSwap;
;191:		_LittleShort = ShortNoSwap;
;192:		_BigLong = LongSwap;
;193:		_LittleLong = LongNoSwap;
;194:		_BigLong64 = Long64Swap;
;195:		_LittleLong64 = Long64NoSwap;
;196:		_BigFloat = FloatSwap;
;197:		_LittleFloat = FloatNoSwap;
;198:	}
;199:	else
;200:	{
;201:		_BigShort = ShortNoSwap;
;202:		_LittleShort = ShortSwap;
;203:		_BigLong = LongNoSwap;
;204:		_LittleLong = LongSwap;
;205:		_BigLong64 = Long64NoSwap;
;206:		_LittleLong64 = Long64Swap;
;207:		_BigFloat = FloatNoSwap;
;208:		_LittleFloat = FloatSwap;
;209:	}
;210:
;211:}
;212:*/
;213:
;214:/*
;215:============================================================================
;216:
;217:PARSING
;218:
;219:============================================================================
;220:*/
;221:
;222:static	char	com_token[MAX_TOKEN_CHARS];
;223:static	char	com_parsename[MAX_TOKEN_CHARS];
;224:static	int		com_lines;
;225:
;226:void COM_BeginParseSession( const char *name )
;227:{
line 228
;228:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 229
;229:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $65
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 230
;230:}
LABELV $64
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 233
;231:
;232:int COM_GetCurrentParseLine( void )
;233:{
line 234
;234:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $66
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 238
;235:}
;236:
;237:char *COM_Parse( char **data_p )
;238:{
line 239
;239:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $67
endproc COM_Parse 4 8
bss
align 1
LABELV $69
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 243
;240:}
;241:
;242:void COM_ParseError( char *format, ... )
;243:{
line 247
;244:	va_list argptr;
;245:	static char string[4096];
;246:
;247:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 248
;248:	vsprintf (string, format, argptr);
ADDRGP4 $69
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
line 249
;249:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 251
;250:
;251:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $71
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $69
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 252
;252:}
LABELV $68
endproc COM_ParseError 4 16
bss
align 1
LABELV $73
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 255
;253:
;254:void COM_ParseWarning( char *format, ... )
;255:{
line 259
;256:	va_list argptr;
;257:	static char string[4096];
;258:
;259:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 260
;260:	vsprintf (string, format, argptr);
ADDRGP4 $73
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
line 261
;261:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 263
;262:
;263:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $75
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 264
;264:}
LABELV $72
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 278
;265:
;266:/*
;267:==============
;268:COM_Parse
;269:
;270:Parse a token out of a string
;271:Will never return NULL, just empty strings
;272:
;273:If "allowLineBreaks" is qtrue then an empty
;274:string will be returned if the next token is
;275:a newline.
;276:==============
;277:*/
;278:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $78
JUMPV
LABELV $77
line 281
;279:	int c;
;280:
;281:	while( (c = *data) <= ' ') {
line 282
;282:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $80
line 283
;283:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $76
JUMPV
LABELV $80
line 285
;284:		}
;285:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $82
line 286
;286:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 287
;287:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 288
;288:		}
LABELV $82
line 289
;289:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 290
;290:	}
LABELV $78
line 281
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $77
line 292
;291:
;292:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $76
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 295
;293:}
;294:
;295:int COM_Compress( char *data_p ) {
line 298
;296:	char *in, *out;
;297:	int c;
;298:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 300
;299:
;300:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 301
;301:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $85
ADDRGP4 $88
JUMPV
LABELV $87
line 302
;302:		while ((c = *in) != 0) {
line 304
;303:			// skip double slash comments
;304:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $90
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $90
ADDRGP4 $93
JUMPV
LABELV $92
line 305
;305:				while (*in && *in != '\n') {
line 306
;306:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 307
;307:				}
LABELV $93
line 305
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $95
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $92
LABELV $95
line 309
;308:			// skip /* */ comments
;309:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $91
JUMPV
LABELV $90
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $96
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $96
ADDRGP4 $99
JUMPV
LABELV $98
line 311
;310:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;311:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $99
line 310
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $101
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $98
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $98
LABELV $101
line 312
;312:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $97
line 313
;313:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 315
;314:                        // record when we hit a newline
;315:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $97
JUMPV
LABELV $96
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $106
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $104
LABELV $106
line 316
;316:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 317
;317:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 319
;318:                        // record when we hit whitespace
;319:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $105
JUMPV
LABELV $104
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $109
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $107
LABELV $109
line 320
;320:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 321
;321:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 323
;322:                        // an actual token
;323:			} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 325
;324:                            // if we have a pending newline, emit it (and it counts as whitespace)
;325:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $110
line 326
;326:                                *out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 327
;327:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 328
;328:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 329
;329:                            } if (whitespace) {
LABELV $110
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $112
line 330
;330:                                *out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 331
;331:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 332
;332:                            }
LABELV $112
line 335
;333:                            
;334:                            // copy quoted strings unmolested
;335:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $114
line 336
;336:                                    *out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 337
;337:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $117
JUMPV
LABELV $116
line 338
;338:                                    while (1) {
line 339
;339:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 340
;340:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $118
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $118
line 341
;341:                                            *out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 342
;342:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 343
;343:                                        } else {
line 344
;344:                                            break;
LABELV $120
line 346
;345:                                        }
;346:                                    }
LABELV $117
line 338
ADDRGP4 $116
JUMPV
LABELV $118
line 347
;347:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $115
line 348
;348:                                        *out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 349
;349:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 350
;350:                                    }
line 351
;351:                            } else {
ADDRGP4 $115
JUMPV
LABELV $114
line 352
;352:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 353
;353:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 354
;354:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 355
;355:                            }
LABELV $115
line 356
;356:			}
LABELV $108
LABELV $105
LABELV $97
LABELV $91
line 357
;357:		}
LABELV $88
line 302
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $87
line 358
;358:	}
LABELV $85
line 359
;359:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 360
;360:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $84
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 364
;361:}
;362:
;363:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;364:{
line 365
;365:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 366
;366:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 369
;367:	char *data;
;368:
;369:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 370
;370:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 371
;371:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 374
;372:
;373:	// make sure incoming data is valid
;374:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 375
;375:	{
line 376
;376:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 377
;377:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $123
JUMPV
LABELV $126
line 381
;378:	}
;379:
;380:	while ( 1 )
;381:	{
line 383
;382:		// skip whitespace
;383:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 384
;384:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 385
;385:		{
line 386
;386:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 387
;387:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $123
JUMPV
LABELV $129
line 389
;388:		}
;389:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $131
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $131
line 390
;390:		{
line 391
;391:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 392
;392:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $123
JUMPV
LABELV $131
line 395
;393:		}
;394:
;395:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 398
;396:
;397:		// skip double slash comments
;398:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $133
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $133
line 399
;399:		{
line 400
;400:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $136
JUMPV
LABELV $135
line 401
;401:			while (*data && *data != '\n') {
line 402
;402:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 403
;403:			}
LABELV $136
line 401
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $138
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $135
LABELV $138
line 404
;404:		}
ADDRGP4 $134
JUMPV
LABELV $133
line 406
;405:		// skip /* */ comments
;406:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $128
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $128
line 407
;407:		{
line 408
;408:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $142
JUMPV
LABELV $141
line 410
;409:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;410:			{
line 411
;411:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 412
;412:			}
LABELV $142
line 409
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $144
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $141
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $141
LABELV $144
line 413
;413:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $140
line 414
;414:			{
line 415
;415:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 416
;416:			}
line 417
;417:		}
line 419
;418:		else
;419:		{
line 420
;420:			break;
LABELV $140
LABELV $134
line 422
;421:		}
;422:	}
LABELV $127
line 380
ADDRGP4 $126
JUMPV
LABELV $128
line 425
;423:
;424:	// handle quoted strings
;425:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $147
line 426
;426:	{
line 427
;427:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $150
JUMPV
LABELV $149
line 429
;428:		while (1)
;429:		{
line 430
;430:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 431
;431:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $154
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $152
LABELV $154
line 432
;432:			{
line 433
;433:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 434
;434:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 435
;435:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $123
JUMPV
LABELV $152
line 437
;436:			}
;437:			if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $155
line 438
;438:			{
line 439
;439:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 440
;440:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 441
;441:			}
LABELV $155
line 442
;442:		}
LABELV $150
line 428
ADDRGP4 $149
JUMPV
line 443
;443:	}
LABELV $147
LABELV $157
line 447
;444:
;445:	// parse a regular word
;446:	do
;447:	{
line 448
;448:		if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $160
line 449
;449:		{
line 450
;450:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 451
;451:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 452
;452:		}
LABELV $160
line 453
;453:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 454
;454:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 455
;455:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $162
line 456
;456:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $162
line 457
;457:	} while (c>32);
LABELV $158
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $157
line 459
;458:
;459:	if (len == MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
NEI4 $164
line 460
;460:	{
line 462
;461://		Com_Printf ("Token exceeded %i chars, discarded.\n", MAX_TOKEN_CHARS);
;462:		len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 463
;463:	}
LABELV $164
line 464
;464:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 466
;465:
;466:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 467
;467:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $123
endproc COM_ParseExt 36 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 531
;468:}
;469:
;470:
;471:#if 0
;472:// no longer used
;473:/*
;474:===============
;475:COM_ParseInfos
;476:===============
;477:*/
;478:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;479:	char	*token;
;480:	int		count;
;481:	char	key[MAX_TOKEN_CHARS];
;482:
;483:	count = 0;
;484:
;485:	while ( 1 ) {
;486:		token = COM_Parse( &buf );
;487:		if ( !token[0] ) {
;488:			break;
;489:		}
;490:		if ( strcmp( token, "{" ) ) {
;491:			Com_Printf( "Missing { in info file\n" );
;492:			break;
;493:		}
;494:
;495:		if ( count == max ) {
;496:			Com_Printf( "Max infos exceeded\n" );
;497:			break;
;498:		}
;499:
;500:		infos[count][0] = 0;
;501:		while ( 1 ) {
;502:			token = COM_ParseExt( &buf, qtrue );
;503:			if ( !token[0] ) {
;504:				Com_Printf( "Unexpected end of info file\n" );
;505:				break;
;506:			}
;507:			if ( !strcmp( token, "}" ) ) {
;508:				break;
;509:			}
;510:			Q_strncpyz( key, token, sizeof( key ) );
;511:
;512:			token = COM_ParseExt( &buf, qfalse );
;513:			if ( !token[0] ) {
;514:				strcpy( token, "<NULL>" );
;515:			}
;516:			Info_SetValueForKey( infos[count], key, token );
;517:		}
;518:		count++;
;519:	}
;520:
;521:	return count;
;522:}
;523:#endif
;524:
;525:
;526:/*
;527:==================
;528:COM_MatchToken
;529:==================
;530:*/
;531:void COM_MatchToken( char **buf_p, char *match ) {
line 534
;532:	char	*token;
;533:
;534:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 535
;535:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $167
line 536
;536:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $169
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 537
;537:	}
LABELV $167
line 538
;538:}
LABELV $166
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 550
;539:
;540:
;541:/*
;542:=================
;543:SkipBracedSection
;544:
;545:The next token should be an open brace.
;546:Skips until a matching close brace is found.
;547:Internal brace depths are properly skipped.
;548:=================
;549:*/
;550:void SkipBracedSection (char **program) {
line 554
;551:	char			*token;
;552:	int				depth;
;553:
;554:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $171
line 555
;555:	do {
line 556
;556:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 557
;557:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $174
line 558
;558:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $176
line 559
;559:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 560
;560:			}
ADDRGP4 $177
JUMPV
LABELV $176
line 561
;561:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $178
line 562
;562:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 563
;563:			}
LABELV $178
LABELV $177
line 564
;564:		}
LABELV $174
line 565
;565:	} while( depth && *program );
LABELV $172
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $180
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $171
LABELV $180
line 566
;566:}
LABELV $170
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 573
;567:
;568:/*
;569:=================
;570:SkipRestOfLine
;571:=================
;572:*/
;573:void SkipRestOfLine ( char **data ) {
line 577
;574:	char	*p;
;575:	int		c;
;576:
;577:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $183
JUMPV
LABELV $182
line 578
;578:	while ( (c = *p++) != 0 ) {
line 579
;579:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $185
line 580
;580:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 581
;581:			break;
ADDRGP4 $184
JUMPV
LABELV $185
line 583
;582:		}
;583:	}
LABELV $183
line 578
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $182
LABELV $184
line 585
;584:
;585:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 586
;586:}
LABELV $181
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 589
;587:
;588:
;589:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 593
;590:	char	*token;
;591:	int		i;
;592:
;593:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $188
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 595
;594:
;595:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $189
line 596
;596:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 597
;597:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 598
;598:	}
LABELV $190
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $192
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $189
line 600
;599:
;600:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 601
;601:}
LABELV $187
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 603
;602:
;603:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 606
;604:	int		i;
;605:
;606:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $188
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 608
;607:
;608:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $195
line 609
;609:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 610
;610:	}
LABELV $196
line 608
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $198
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $195
line 612
;611:
;612:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 613
;613:}
LABELV $194
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 615
;614:
;615:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 618
;616:	int		i;
;617:
;618:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $188
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 620
;619:
;620:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $200
line 621
;621:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 622
;622:	}
LABELV $201
line 620
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $203
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $200
line 624
;623:
;624:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $193
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 625
;625:}
LABELV $199
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 637
;626:
;627:
;628:/*
;629:============================================================================
;630:
;631:					LIBRARY REPLACEMENT FUNCTIONS
;632:
;633:============================================================================
;634:*/
;635:
;636:int Q_isprint( int c )
;637:{
line 638
;638:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $205
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $205
line 639
;639:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $204
JUMPV
LABELV $205
line 640
;640:	return ( 0 );
CNSTI4 0
RETI4
LABELV $204
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 644
;641:}
;642:
;643:int Q_islower( int c )
;644:{
line 645
;645:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $208
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $208
line 646
;646:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $207
JUMPV
LABELV $208
line 647
;647:	return ( 0 );
CNSTI4 0
RETI4
LABELV $207
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 651
;648:}
;649:
;650:int Q_isupper( int c )
;651:{
line 652
;652:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $211
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $211
line 653
;653:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $210
JUMPV
LABELV $211
line 654
;654:	return ( 0 );
CNSTI4 0
RETI4
LABELV $210
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 658
;655:}
;656:
;657:int Q_isalpha( int c )
;658:{
line 659
;659:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $217
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $216
LABELV $217
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $214
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $214
LABELV $216
line 660
;660:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $213
JUMPV
LABELV $214
line 661
;661:	return ( 0 );
CNSTI4 0
RETI4
LABELV $213
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 665
;662:}
;663:
;664:char* Q_strrchr( const char* string, int c )
;665:{
line 666
;666:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 668
;667:	char *s;
;668:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 670
;669:
;670:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $220
JUMPV
LABELV $219
line 673
;671:
;672:	while (*s)
;673:	{
line 674
;674:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $222
line 675
;675:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $222
line 676
;676:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 677
;677:	}
LABELV $220
line 672
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $219
line 678
;678:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $224
line 679
;679:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $224
line 681
;680:
;681:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $218
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 691
;682:}
;683:
;684:/*
;685:=============
;686:Q_strncpyz
;687: 
;688:Safe strncpy that ensures a trailing zero
;689:=============
;690:*/
;691:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 693
;692:  // bk001129 - also NULL dest
;693:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $227
line 694
;694:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $229
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 695
;695:  }
LABELV $227
line 696
;696:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $230
line 697
;697:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $232
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 698
;698:	}
LABELV $230
line 699
;699:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $233
line 700
;700:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $235
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 701
;701:	}
LABELV $233
line 703
;702:
;703:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 704
;704:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 705
;705:}
LABELV $226
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 707
;706:                 
;707:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 711
;708:	int		c1, c2;
;709:
;710:	// bk001129 - moved in 1.17 fix not in id codebase
;711:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 712
;712:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $239
line 713
;713:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $236
JUMPV
LABELV $239
line 715
;714:           else
;715:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $236
JUMPV
LABELV $237
line 717
;716:        }
;717:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 718
;718:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $236
JUMPV
LABELV $241
LABELV $243
line 722
;719:
;720:
;721:	
;722:	do {
line 723
;723:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 724
;724:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 726
;725:
;726:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $246
line 727
;727:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $236
JUMPV
LABELV $246
line 730
;728:		}
;729:		
;730:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $248
line 731
;731:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $250
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $250
line 732
;732:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 733
;733:			}
LABELV $250
line 734
;734:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $252
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $252
line 735
;735:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 736
;736:			}
LABELV $252
line 737
;737:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $254
line 738
;738:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $257
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $258
JUMPV
LABELV $257
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $258
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $236
JUMPV
LABELV $254
line 740
;739:			}
;740:		}
LABELV $248
line 741
;741:	} while (c1);
LABELV $244
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $243
line 743
;742:	
;743:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $236
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 746
;744:}
;745:
;746:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $260
line 749
;747:	int		c1, c2;
;748:	
;749:	do {
line 750
;750:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 751
;751:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 753
;752:
;753:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $263
line 754
;754:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $259
JUMPV
LABELV $263
line 757
;755:		}
;756:		
;757:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $265
line 758
;758:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $268
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $268
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $269
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $259
JUMPV
LABELV $265
line 760
;759:		}
;760:	} while (c1);
LABELV $261
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $260
line 762
;761:	
;762:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $259
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 765
;763:}
;764:
;765:int Q_stricmp (const char *s1, const char *s2) {
line 766
;766:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $272
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $272
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $273
JUMPV
LABELV $272
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $273
ADDRLP4 0
INDIRI4
RETI4
LABELV $270
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 770
;767:}
;768:
;769:
;770:char *Q_strlwr( char *s1 ) {
line 773
;771:    char	*s;
;772:
;773:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $276
JUMPV
LABELV $275
line 774
;774:	while ( *s ) {
line 775
;775:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 776
;776:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 777
;777:	}
LABELV $276
line 774
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $275
line 778
;778:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $274
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 781
;779:}
;780:
;781:char *Q_strupr( char *s1 ) {
line 784
;782:    char	*s;
;783:
;784:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $280
JUMPV
LABELV $279
line 785
;785:	while ( *s ) {
line 786
;786:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 787
;787:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 788
;788:	}
LABELV $280
line 785
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $279
line 789
;789:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $278
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 794
;790:}
;791:
;792:
;793:// never goes past bounds or leaves without a terminating 0
;794:void Q_strcat( char *dest, int size, const char *src ) {
line 797
;795:	int		l1;
;796:
;797:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 798
;798:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $283
line 799
;799:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $285
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 800
;800:	}
LABELV $283
line 801
;801:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 802
;802:}
LABELV $282
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 20 0
line 805
;803:
;804:
;805:int Q_PrintStrlen( const char *string ) {
line 809
;806:	int			len;
;807:	const char	*p;
;808:
;809:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 810
;810:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $286
JUMPV
LABELV $287
line 813
;811:	}
;812:
;813:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 814
;814:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $290
JUMPV
LABELV $289
line 815
;815:	while( *p ) {
line 816
;816:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $292
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
EQI4 $292
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $292
line 817
;817:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 818
;818:			continue;
ADDRGP4 $290
JUMPV
LABELV $292
line 820
;819:		}
;820:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 821
;821:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 822
;822:	}
LABELV $290
line 815
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $289
line 824
;823:
;824:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $286
endproc Q_PrintStrlen 20 0
export Q_CleanStr
proc Q_CleanStr 32 0
line 828
;825:}
;826:
;827:
;828:char *Q_CleanStr( char *string ) {
line 833
;829:	char*	d;
;830:	char*	s;
;831:	int		c;
;832:
;833:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 834
;834:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $296
JUMPV
LABELV $295
line 835
;835:	while ((c = *s) != 0 ) {
line 836
;836:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $298
ADDRLP4 16
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $298
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $298
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $298
line 837
;837:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 838
;838:		}		
ADDRGP4 $299
JUMPV
LABELV $298
line 839
;839:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $300
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $300
line 840
;840:			*d++ = c;
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 841
;841:		}
LABELV $300
LABELV $299
line 842
;842:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 843
;843:	}
LABELV $296
line 835
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $295
line 844
;844:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 846
;845:
;846:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $294
endproc Q_CleanStr 32 0
export Com_sprintf
proc Com_sprintf 32012 12
line 850
;847:}
;848:
;849:
;850:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 855
;851:	int		len;
;852:	va_list		argptr;
;853:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;854:
;855:	va_start (argptr,fmt);
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 856
;856:	len = vsprintf (bigbuffer,fmt,argptr);
ADDRLP4 8
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32008
INDIRI4
ASGNI4
line 857
;857:	va_end (argptr);
ADDRLP4 4
CNSTP4 0
ASGNP4
line 858
;858:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $304
line 859
;859:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $306
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 860
;860:	}
LABELV $304
line 861
;861:	if (len >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $307
line 862
;862:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $309
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 868
;863:#ifdef	_DEBUG
;864:		__asm {
;865:			int 3;
;866:		}
;867:#endif
;868:	}
LABELV $307
line 869
;869:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 870
;870:}
LABELV $302
endproc Com_sprintf 32012 12
bss
align 1
LABELV $311
skip 64000
data
align 4
LABELV $312
byte 4 0
export va
code
proc va 12 12
line 882
;871:
;872:
;873:/*
;874:============
;875:va
;876:
;877:does a varargs printf into a temp buffer, so I don't need to have
;878:varargs versions of all text functions.
;879:FIXME: make this buffer size safe someday
;880:============
;881:*/
;882:char	* QDECL va( char *format, ... ) {
line 888
;883:	va_list		argptr;
;884:	static char		string[2][32000];	// in case va is called by nested functions
;885:	static int		index = 0;
;886:	char	*buf;
;887:
;888:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $312
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $311
ADDP4
ASGNP4
line 889
;889:	index++;
ADDRLP4 8
ADDRGP4 $312
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 891
;890:
;891:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 892
;892:	vsprintf (buf, format,argptr);
ADDRLP4 4
INDIRP4
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
line 893
;893:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 895
;894:
;895:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $310
endproc va 12 12
bss
align 1
LABELV $315
skip 16384
data
align 4
LABELV $316
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 916
;896:}
;897:
;898:
;899:/*
;900:=====================================================================
;901:
;902:  INFO STRINGS
;903:
;904:=====================================================================
;905:*/
;906:
;907:/*
;908:===============
;909:Info_ValueForKey
;910:
;911:Searches the string for the given
;912:key and returns the associated value, or an empty string.
;913:FIXME: overflow check?
;914:===============
;915:*/
;916:char *Info_ValueForKey( const char *s, const char *key ) {
line 923
;917:	char	pkey[BIG_INFO_KEY];
;918:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;919:											// work without stomping on each other
;920:	static	int	valueindex = 0;
;921:	char	*o;
;922:	
;923:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $319
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $317
LABELV $319
line 924
;924:		return "";
ADDRGP4 $320
RETP4
ADDRGP4 $314
JUMPV
LABELV $317
line 927
;925:	}
;926:
;927:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8200
INDIRI4
CNSTI4 8192
LTI4 $321
line 928
;928:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $323
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 929
;929:	}
LABELV $321
line 931
;930:
;931:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $316
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 932
;932:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $327
line 933
;933:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $327
JUMPV
LABELV $326
line 935
;934:	while (1)
;935:	{
line 936
;936:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $330
JUMPV
LABELV $329
line 938
;937:		while (*s != '\\')
;938:		{
line 939
;939:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $332
line 940
;940:				return "";
ADDRGP4 $320
RETP4
ADDRGP4 $314
JUMPV
LABELV $332
line 941
;941:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 942
;942:		}
LABELV $330
line 937
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $329
line 943
;943:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 944
;944:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 946
;945:
;946:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $316
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $315
ADDP4
ASGNP4
ADDRGP4 $335
JUMPV
LABELV $334
line 949
;947:
;948:		while (*s != '\\' && *s)
;949:		{
line 950
;950:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 951
;951:		}
LABELV $335
line 948
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $337
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $334
LABELV $337
line 952
;952:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 954
;953:
;954:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $338
line 955
;955:			return value[valueindex];
ADDRGP4 $316
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $315
ADDP4
RETP4
ADDRGP4 $314
JUMPV
LABELV $338
line 957
;956:
;957:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $340
line 958
;958:			break;
ADDRGP4 $328
JUMPV
LABELV $340
line 959
;959:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 960
;960:	}
LABELV $327
line 934
ADDRGP4 $326
JUMPV
LABELV $328
line 962
;961:
;962:	return "";
ADDRGP4 $320
RETP4
LABELV $314
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 973
;963:}
;964:
;965:
;966:/*
;967:===================
;968:Info_NextPair
;969:
;970:Used to itterate through all the key/value pairs in an info string
;971:===================
;972:*/
;973:void Info_NextPair( const char **head, char *key, char *value ) {
line 977
;974:	char	*o;
;975:	const char	*s;
;976:
;977:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 979
;978:
;979:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $343
line 980
;980:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 981
;981:	}
LABELV $343
line 982
;982:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 983
;983:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 985
;984:
;985:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $346
JUMPV
LABELV $345
line 986
;986:	while ( *s != '\\' ) {
line 987
;987:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $348
line 988
;988:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 989
;989:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 990
;990:			return;
ADDRGP4 $342
JUMPV
LABELV $348
line 992
;991:		}
;992:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 993
;993:	}
LABELV $346
line 986
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $345
line 994
;994:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 995
;995:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 997
;996:
;997:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $351
JUMPV
LABELV $350
line 998
;998:	while ( *s != '\\' && *s ) {
line 999
;999:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1000
;1000:	}
LABELV $351
line 998
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $353
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $350
LABELV $353
line 1001
;1001:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1003
;1002:
;1003:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1004
;1004:}
LABELV $342
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 8
line 1012
;1005:
;1006:
;1007:/*
;1008:===================
;1009:Info_RemoveKey
;1010:===================
;1011:*/
;1012:void Info_RemoveKey( char *s, const char *key ) {
line 1018
;1013:	char	*start;
;1014:	char	pkey[MAX_INFO_KEY];
;1015:	char	value[MAX_INFO_VALUE];
;1016:	char	*o;
;1017:
;1018:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 1024
LTI4 $355
line 1019
;1019:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $357
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1020
;1020:	}
LABELV $355
line 1022
;1021:
;1022:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
line 1023
;1023:		return;
ADDRGP4 $354
JUMPV
LABELV $360
line 1027
;1024:	}
;1025:
;1026:	while (1)
;1027:	{
line 1028
;1028:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1029
;1029:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $363
line 1030
;1030:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $363
line 1031
;1031:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $366
JUMPV
LABELV $365
line 1033
;1032:		while (*s != '\\')
;1033:		{
line 1034
;1034:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $368
line 1035
;1035:				return;
ADDRGP4 $354
JUMPV
LABELV $368
line 1036
;1036:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1037
;1037:		}
LABELV $366
line 1032
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $365
line 1038
;1038:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1039
;1039:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1041
;1040:
;1041:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $371
JUMPV
LABELV $370
line 1043
;1042:		while (*s != '\\' && *s)
;1043:		{
line 1044
;1044:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $373
line 1045
;1045:				return;
ADDRGP4 $354
JUMPV
LABELV $373
line 1046
;1046:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1047
;1047:		}
LABELV $371
line 1042
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $375
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $370
LABELV $375
line 1048
;1048:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1050
;1049:
;1050:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $376
line 1051
;1051:		{
line 1052
;1052:			strcpy (start, s);	// remove this part
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1053
;1053:			return;
ADDRGP4 $354
JUMPV
LABELV $376
line 1056
;1054:		}
;1055:
;1056:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $378
line 1057
;1057:			return;
ADDRGP4 $354
JUMPV
LABELV $378
line 1058
;1058:	}
LABELV $361
line 1026
ADDRGP4 $360
JUMPV
line 1060
;1059:
;1060:}
LABELV $354
endproc Info_RemoveKey 2076 8
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1067
;1061:
;1062:/*
;1063:===================
;1064:Info_RemoveKey_Big
;1065:===================
;1066:*/
;1067:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1073
;1068:	char	*start;
;1069:	char	pkey[BIG_INFO_KEY];
;1070:	char	value[BIG_INFO_VALUE];
;1071:	char	*o;
;1072:
;1073:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16392
INDIRI4
CNSTI4 8192
LTI4 $381
line 1074
;1074:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $383
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1075
;1075:	}
LABELV $381
line 1077
;1076:
;1077:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
line 1078
;1078:		return;
ADDRGP4 $380
JUMPV
LABELV $386
line 1082
;1079:	}
;1080:
;1081:	while (1)
;1082:	{
line 1083
;1083:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1084
;1084:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $389
line 1085
;1085:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $389
line 1086
;1086:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $392
JUMPV
LABELV $391
line 1088
;1087:		while (*s != '\\')
;1088:		{
line 1089
;1089:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $394
line 1090
;1090:				return;
ADDRGP4 $380
JUMPV
LABELV $394
line 1091
;1091:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1092
;1092:		}
LABELV $392
line 1087
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $391
line 1093
;1093:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1094
;1094:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1096
;1095:
;1096:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $397
JUMPV
LABELV $396
line 1098
;1097:		while (*s != '\\' && *s)
;1098:		{
line 1099
;1099:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $399
line 1100
;1100:				return;
ADDRGP4 $380
JUMPV
LABELV $399
line 1101
;1101:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1102
;1102:		}
LABELV $397
line 1097
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $401
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $396
LABELV $401
line 1103
;1103:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1105
;1104:
;1105:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $402
line 1106
;1106:		{
line 1107
;1107:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1108
;1108:			return;
ADDRGP4 $380
JUMPV
LABELV $402
line 1111
;1109:		}
;1110:
;1111:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $404
line 1112
;1112:			return;
ADDRGP4 $380
JUMPV
LABELV $404
line 1113
;1113:	}
LABELV $387
line 1081
ADDRGP4 $386
JUMPV
line 1115
;1114:
;1115:}
LABELV $380
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1128
;1116:
;1117:
;1118:
;1119:
;1120:/*
;1121:==================
;1122:Info_Validate
;1123:
;1124:Some characters are illegal in info strings because they
;1125:can mess up the server's parsing
;1126:==================
;1127:*/
;1128:qboolean Info_Validate( const char *s ) {
line 1129
;1129:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $407
line 1130
;1130:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $406
JUMPV
LABELV $407
line 1132
;1131:	}
;1132:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
line 1133
;1133:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $406
JUMPV
LABELV $409
line 1135
;1134:	}
;1135:	return qtrue;
CNSTI4 1
RETI4
LABELV $406
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1068 20
line 1145
;1136:}
;1137:
;1138:/*
;1139:==================
;1140:Info_SetValueForKey
;1141:
;1142:Changes or adds a key/value pair
;1143:==================
;1144:*/
;1145:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1148
;1146:	char	newi[MAX_INFO_STRING];
;1147:
;1148:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 1024
LTI4 $412
line 1149
;1149:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $414
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1150
;1150:	}
LABELV $412
line 1152
;1151:
;1152:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1028
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $417
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1032
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $415
LABELV $417
line 1153
;1153:	{
line 1154
;1154:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $418
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1155
;1155:		return;
ADDRGP4 $411
JUMPV
LABELV $415
line 1158
;1156:	}
;1157:
;1158:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $419
LABELV $421
line 1159
;1159:	{
line 1160
;1160:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $422
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1161
;1161:		return;
ADDRGP4 $411
JUMPV
LABELV $419
line 1164
;1162:	}
;1163:
;1164:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1044
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $425
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1048
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $423
LABELV $425
line 1165
;1165:	{
line 1166
;1166:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $426
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1167
;1167:		return;
ADDRGP4 $411
JUMPV
LABELV $423
line 1170
;1168:	}
;1169:
;1170:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1171
;1171:	if (!value || !strlen(value))
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $429
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $427
LABELV $429
line 1172
;1172:		return;
ADDRGP4 $411
JUMPV
LABELV $427
line 1174
;1173:
;1174:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $430
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1176
;1175:
;1176:	if (strlen(newi) + strlen(s) > MAX_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 1064
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $431
line 1177
;1177:	{
line 1178
;1178:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $433
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1179
;1179:		return;
ADDRGP4 $411
JUMPV
LABELV $431
line 1182
;1180:	}
;1181:
;1182:	strcat (newi, s);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1183
;1183:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1184
;1184:}
LABELV $411
endproc Info_SetValueForKey 1068 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8236 20
line 1193
;1185:
;1186:/*
;1187:==================
;1188:Info_SetValueForKey_Big
;1189:
;1190:Changes or adds a key/value pair
;1191:==================
;1192:*/
;1193:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1196
;1194:	char	newi[BIG_INFO_STRING];
;1195:
;1196:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8192
INDIRI4
CNSTI4 8192
LTI4 $435
line 1197
;1197:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $414
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1198
;1198:	}
LABELV $435
line 1200
;1199:
;1200:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8196
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8196
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $439
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $437
LABELV $439
line 1201
;1201:	{
line 1202
;1202:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $418
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1203
;1203:		return;
ADDRGP4 $434
JUMPV
LABELV $437
line 1206
;1204:	}
;1205:
;1206:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $442
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8208
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $440
LABELV $442
line 1207
;1207:	{
line 1208
;1208:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $422
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1209
;1209:		return;
ADDRGP4 $434
JUMPV
LABELV $440
line 1212
;1210:	}
;1211:
;1212:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8212
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8212
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $445
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8216
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8216
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $443
LABELV $445
line 1213
;1213:	{
line 1214
;1214:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $426
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1215
;1215:		return;
ADDRGP4 $434
JUMPV
LABELV $443
line 1218
;1216:	}
;1217:
;1218:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1219
;1219:	if (!value || !strlen(value))
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
ADDRLP4 8220
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8224
INDIRI4
CNSTI4 0
NEI4 $446
LABELV $448
line 1220
;1220:		return;
ADDRGP4 $434
JUMPV
LABELV $446
line 1222
;1221:
;1222:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $430
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1224
;1223:
;1224:	if (strlen(newi) + strlen(s) > BIG_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 8228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8228
INDIRI4
ADDRLP4 8232
INDIRI4
ADDI4
CNSTI4 8192
LEI4 $449
line 1225
;1225:	{
line 1226
;1226:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $451
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1227
;1227:		return;
ADDRGP4 $434
JUMPV
LABELV $449
line 1230
;1228:	}
;1229:
;1230:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1231
;1231:}
LABELV $434
endproc Info_SetValueForKey_Big 8236 20
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 1251
;1232:
;1233:
;1234:
;1235:
;1236://====================================================================
;1237:
;1238:
;1239://unlagged - attack prediction #3
;1240:// moved from g_weapon.c
;1241:/*
;1242:======================
;1243:SnapVectorTowards
;1244:
;1245:Round a vector to integers for more efficient network
;1246:transmission, but make sure that it rounds towards a given point
;1247:rather than blindly truncating.  This prevents it from truncating 
;1248:into a wall.
;1249:======================
;1250:*/
;1251:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 1254
;1252:	int		i;
;1253:
;1254:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $453
line 1255
;1255:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $457
line 1256
;1256:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1257
;1257:		} else {
ADDRGP4 $458
JUMPV
LABELV $457
line 1258
;1258:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 1259
;1259:		}
LABELV $458
line 1260
;1260:	}
LABELV $454
line 1254
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $453
line 1261
;1261:}
LABELV $452
endproc SnapVectorTowards 12 0
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import Com_Printf
import Com_Error
import Info_RemoveKey_big
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
LABELV $451
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $433
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $430
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $426
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $422
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $418
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 92
byte 1 10
byte 1 0
align 1
LABELV $414
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $383
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 95
byte 1 66
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $357
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $323
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $320
byte 1 0
align 1
LABELV $309
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $306
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $285
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $235
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $232
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $229
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $193
byte 1 41
byte 1 0
align 1
LABELV $188
byte 1 40
byte 1 0
align 1
LABELV $169
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $75
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $71
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $65
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $45
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
