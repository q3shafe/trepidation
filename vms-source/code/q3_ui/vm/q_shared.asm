export Com_Clamp
code
proc Com_Clamp 0 0
file "../../game/q_shared.c"
line 9
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation - Team Trepidation - Team Trepidation - Team Trepidation
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:
;7:
;8:
;9:float Com_Clamp( float min, float max, float value ) {
line 10
;10:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $25
line 11
;11:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $24
JUMPV
LABELV $25
line 13
;12:	}
;13:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $27
line 14
;14:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $24
JUMPV
LABELV $27
line 16
;15:	}
;16:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $24
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 30
;17:}
;18:
;19:
;20:
;21:extern	int		altAmmoUsage[32];
;22:extern	int		Max_Ammo[32];
;23:
;24:/*
;25:============
;26:COM_SkipPath
;27:============
;28:*/
;29:char *COM_SkipPath (char *pathname)
;30:{
line 33
;31:	char	*last;
;32:	
;33:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $31
JUMPV
LABELV $30
line 35
;34:	while (*pathname)
;35:	{
line 36
;36:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $33
line 37
;37:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $33
line 38
;38:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 39
;39:	}
LABELV $31
line 34
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $30
line 40
;40:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $29
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 0
line 48
;41:}
;42:
;43:/*
;44:============
;45:COM_StripExtension
;46:============
;47:*/
;48:void COM_StripExtension( const char *in, char *out ) {
ADDRGP4 $37
JUMPV
LABELV $36
line 49
;49:	while ( *in && *in != '.' ) {
line 50
;50:		*out++ = *in++;
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
line 51
;51:	}
LABELV $37
line 49
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $39
ADDRLP4 0
INDIRI4
CNSTI4 46
NEI4 $36
LABELV $39
line 52
;52:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 53
;53:}
LABELV $35
endproc COM_StripExtension 12 0
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 61
;54:
;55:
;56:/*
;57:==================
;58:COM_DefaultExtension
;59:==================
;60:*/
;61:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 69
;62:	char	oldPath[MAX_QPATH];
;63:	char    *src;
;64:
;65://
;66:// if path doesn't have a .EXT, append extension
;67:// (extension should include the .)
;68://
;69:	src = path + strlen(path) - 1;
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
ADDRGP4 $42
JUMPV
LABELV $41
line 71
;70:
;71:	while (*src != '/' && src != path) {
line 72
;72:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $44
line 73
;73:			return;                 // it has an extension
ADDRGP4 $40
JUMPV
LABELV $44
line 75
;74:		}
;75:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 76
;76:	}
LABELV $42
line 71
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $46
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $41
LABELV $46
line 78
;77:
;78:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
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
line 79
;79:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $47
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 80
;80:}
LABELV $40
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 112
;81:
;82:/*
;83:============================================================================
;84:
;85:					BYTE ORDER FUNCTIONS
;86:
;87:============================================================================
;88:*/
;89:/*
;90:// can't just use function pointers, or dll linkage can
;91:// mess up when qcommon is included in multiple places
;92:static short	(*_BigShort) (short l);
;93:static short	(*_LittleShort) (short l);
;94:static int		(*_BigLong) (int l);
;95:static int		(*_LittleLong) (int l);
;96:static qint64	(*_BigLong64) (qint64 l);
;97:static qint64	(*_LittleLong64) (qint64 l);
;98:static float	(*_BigFloat) (const float *l);
;99:static float	(*_LittleFloat) (const float *l);
;100:
;101:short	BigShort(short l){return _BigShort(l);}
;102:short	LittleShort(short l) {return _LittleShort(l);}
;103:int		BigLong (int l) {return _BigLong(l);}
;104:int		LittleLong (int l) {return _LittleLong(l);}
;105:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;106:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;107:float	BigFloat (const float *l) {return _BigFloat(l);}
;108:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;109:*/
;110:
;111:short   ShortSwap (short l)
;112:{
line 115
;113:	byte    b1,b2;
;114:
;115:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 116
;116:	b2 = (l>>8)&255;
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
line 118
;117:
;118:	return (b1<<8) + b2;
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
LABELV $48
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 122
;119:}
;120:
;121:short	ShortNoSwap (short l)
;122:{
line 123
;123:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $49
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 127
;124:}
;125:
;126:int    LongSwap (int l)
;127:{
line 130
;128:	byte    b1,b2,b3,b4;
;129:
;130:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 131
;131:	b2 = (l>>8)&255;
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
line 132
;132:	b3 = (l>>16)&255;
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
line 133
;133:	b4 = (l>>24)&255;
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
line 135
;134:
;135:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
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
LABELV $50
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 139
;136:}
;137:
;138:int	LongNoSwap (int l)
;139:{
line 140
;140:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $51
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 144
;141:}
;142:
;143:qint64 Long64Swap (qint64 ll)
;144:{
line 147
;145:	qint64	result;
;146:
;147:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 148
;148:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 149
;149:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 150
;150:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 151
;151:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 152
;152:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 153
;153:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 154
;154:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 156
;155:
;156:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $52
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 160
;157:}
;158:
;159:qint64 Long64NoSwap (qint64 ll)
;160:{
line 161
;161:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $61
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 12 4
line 169
;162:}
;163:
;164:typedef union {
;165:    float	f;
;166:    unsigned int i;
;167:} _FloatByteUnion;
;168:
;169:float FloatSwap (const float *f) {
line 173
;170:	const _FloatByteUnion *in;
;171:	_FloatByteUnion out;
;172:
;173:	in = (_FloatByteUnion *)f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 174
;174:	out.i = LongSwap(in->i);
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
line 176
;175:
;176:	return out.f;
ADDRLP4 4
INDIRF4
RETF4
LABELV $64
endproc FloatSwap 12 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 180
;177:}
;178:
;179:float FloatNoSwap (const float *f)
;180:{
line 181
;181:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $65
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 234
;182:}
;183:
;184:/*
;185:================
;186:Swap_Init
;187:================
;188:*/
;189:/*
;190:void Swap_Init (void)
;191:{
;192:	byte	swaptest[2] = {1,0};
;193:
;194:// set the byte swapping variables in a portable manner	
;195:	if ( *(short *)swaptest == 1)
;196:	{
;197:		_BigShort = ShortSwap;
;198:		_LittleShort = ShortNoSwap;
;199:		_BigLong = LongSwap;
;200:		_LittleLong = LongNoSwap;
;201:		_BigLong64 = Long64Swap;
;202:		_LittleLong64 = Long64NoSwap;
;203:		_BigFloat = FloatSwap;
;204:		_LittleFloat = FloatNoSwap;
;205:	}
;206:	else
;207:	{
;208:		_BigShort = ShortNoSwap;
;209:		_LittleShort = ShortSwap;
;210:		_BigLong = LongNoSwap;
;211:		_LittleLong = LongSwap;
;212:		_BigLong64 = Long64NoSwap;
;213:		_LittleLong64 = Long64Swap;
;214:		_BigFloat = FloatNoSwap;
;215:		_LittleFloat = FloatSwap;
;216:	}
;217:
;218:}
;219:*/
;220:
;221:/*
;222:============================================================================
;223:
;224:PARSING
;225:
;226:============================================================================
;227:*/
;228:
;229:static	char	com_token[MAX_TOKEN_CHARS];
;230:static	char	com_parsename[MAX_TOKEN_CHARS];
;231:static	int		com_lines;
;232:
;233:void COM_BeginParseSession( const char *name )
;234:{
line 235
;235:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 236
;236:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $67
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 237
;237:}
LABELV $66
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 240
;238:
;239:int COM_GetCurrentParseLine( void )
;240:{
line 241
;241:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $68
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 245
;242:}
;243:
;244:char *COM_Parse( char **data_p )
;245:{
line 246
;246:	return COM_ParseExt( data_p, qtrue );
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
LABELV $69
endproc COM_Parse 4 8
bss
align 1
LABELV $71
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 250
;247:}
;248:
;249:void COM_ParseError( char *format, ... )
;250:{
line 254
;251:	va_list argptr;
;252:	static char string[4096];
;253:
;254:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 255
;255:	vsprintf (string, format, argptr);
ADDRGP4 $71
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
line 256
;256:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 258
;257:
;258:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $73
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $71
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 259
;259:}
LABELV $70
endproc COM_ParseError 4 16
bss
align 1
LABELV $75
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 262
;260:
;261:void COM_ParseWarning( char *format, ... )
;262:{
line 266
;263:	va_list argptr;
;264:	static char string[4096];
;265:
;266:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 267
;267:	vsprintf (string, format, argptr);
ADDRGP4 $75
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
line 268
;268:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 270
;269:
;270:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $77
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $75
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 271
;271:}
LABELV $74
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 285
;272:
;273:/*
;274:==============
;275:COM_Parse
;276:
;277:Parse a token out of a string
;278:Will never return NULL, just empty strings
;279:
;280:If "allowLineBreaks" is qtrue then an empty
;281:string will be returned if the next token is
;282:a newline.
;283:==============
;284:*/
;285:static char *SkipWhitespace( char *data, qboolean *hasNewLines ) {
ADDRGP4 $80
JUMPV
LABELV $79
line 288
;286:	int c;
;287:
;288:	while( (c = *data) <= ' ') {
line 289
;289:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $82
line 290
;290:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $78
JUMPV
LABELV $82
line 292
;291:		}
;292:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $84
line 293
;293:			com_lines++;
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
line 294
;294:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 295
;295:		}
LABELV $84
line 296
;296:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 297
;297:	}
LABELV $80
line 288
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
LEI4 $79
line 299
;298:
;299:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $78
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 302
;300:}
;301:
;302:int COM_Compress( char *data_p ) {
line 305
;303:	char *in, *out;
;304:	int c;
;305:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 307
;306:
;307:	in = out = data_p;
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
line 308
;308:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $87
ADDRGP4 $90
JUMPV
LABELV $89
line 309
;309:		while ((c = *in) != 0) {
line 311
;310:			// skip double slash comments
;311:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $92
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $92
ADDRGP4 $95
JUMPV
LABELV $94
line 312
;312:				while (*in && *in != '\n') {
line 313
;313:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 314
;314:				}
LABELV $95
line 312
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $97
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $94
LABELV $97
line 316
;315:			// skip /* */ comments
;316:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $93
JUMPV
LABELV $92
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $98
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $98
ADDRGP4 $101
JUMPV
LABELV $100
line 318
;317:				while ( *in && ( *in != '*' || in[1] != '/' ) ) 
;318:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $101
line 317
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $103
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $100
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $100
LABELV $103
line 319
;319:				if ( *in ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $99
line 320
;320:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 322
;321:                        // record when we hit a newline
;322:                        } else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $108
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $106
LABELV $108
line 323
;323:                            newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 324
;324:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 326
;325:                        // record when we hit whitespace
;326:                        } else if ( c == ' ' || c == '\t') {
ADDRGP4 $107
JUMPV
LABELV $106
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $111
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $109
LABELV $111
line 327
;327:                            whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 328
;328:                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 330
;329:                        // an actual token
;330:			} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 332
;331:                            // if we have a pending newline, emit it (and it counts as whitespace)
;332:                            if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $112
line 333
;333:                                *out++ = '\n';
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
line 334
;334:                                newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 335
;335:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 336
;336:                            } if (whitespace) {
LABELV $112
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $114
line 337
;337:                                *out++ = ' ';
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
line 338
;338:                                whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 339
;339:                            }
LABELV $114
line 342
;340:                            
;341:                            // copy quoted strings unmolested
;342:                            if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $116
line 343
;343:                                    *out++ = c;
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
line 344
;344:                                    in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $119
JUMPV
LABELV $118
line 345
;345:                                    while (1) {
line 346
;346:                                        c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 347
;347:                                        if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $120
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $120
line 348
;348:                                            *out++ = c;
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
line 349
;349:                                            in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 350
;350:                                        } else {
line 351
;351:                                            break;
LABELV $122
line 353
;352:                                        }
;353:                                    }
LABELV $119
line 345
ADDRGP4 $118
JUMPV
LABELV $120
line 354
;354:                                    if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $117
line 355
;355:                                        *out++ = c;
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
line 356
;356:                                        in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 357
;357:                                    }
line 358
;358:                            } else {
ADDRGP4 $117
JUMPV
LABELV $116
line 359
;359:                                *out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 360
;360:                                out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 361
;361:                                in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 362
;362:                            }
LABELV $117
line 363
;363:			}
LABELV $110
LABELV $107
LABELV $99
LABELV $93
line 364
;364:		}
LABELV $90
line 309
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
NEI4 $89
line 365
;365:	}
LABELV $87
line 366
;366:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 367
;367:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $86
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 371
;368:}
;369:
;370:char *COM_ParseExt( char **data_p, qboolean allowLineBreaks )
;371:{
line 372
;372:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 373
;373:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 376
;374:	char *data;
;375:
;376:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 377
;377:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 378
;378:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 381
;379:
;380:	// make sure incoming data is valid
;381:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 382
;382:	{
line 383
;383:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 384
;384:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $125
JUMPV
LABELV $128
line 388
;385:	}
;386:
;387:	while ( 1 )
;388:	{
line 390
;389:		// skip whitespace
;390:		data = SkipWhitespace( data, &hasNewLines );
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
line 391
;391:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $131
line 392
;392:		{
line 393
;393:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 394
;394:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $125
JUMPV
LABELV $131
line 396
;395:		}
;396:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $133
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $133
line 397
;397:		{
line 398
;398:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 399
;399:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $125
JUMPV
LABELV $133
line 402
;400:		}
;401:
;402:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 405
;403:
;404:		// skip double slash comments
;405:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $135
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $135
line 406
;406:		{
line 407
;407:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $138
JUMPV
LABELV $137
line 408
;408:			while (*data && *data != '\n') {
line 409
;409:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 410
;410:			}
LABELV $138
line 408
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $140
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $137
LABELV $140
line 411
;411:		}
ADDRGP4 $136
JUMPV
LABELV $135
line 413
;412:		// skip /* */ comments
;413:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $130
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $130
line 414
;414:		{
line 415
;415:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $143
line 417
;416:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;417:			{
line 418
;418:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 419
;419:			}
LABELV $144
line 416
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $146
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $143
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $143
LABELV $146
line 420
;420:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $142
line 421
;421:			{
line 422
;422:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 423
;423:			}
line 424
;424:		}
line 426
;425:		else
;426:		{
line 427
;427:			break;
LABELV $142
LABELV $136
line 429
;428:		}
;429:	}
LABELV $129
line 387
ADDRGP4 $128
JUMPV
LABELV $130
line 432
;430:
;431:	// handle quoted strings
;432:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $149
line 433
;433:	{
line 434
;434:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $151
line 436
;435:		while (1)
;436:		{
line 437
;437:			c = *data++;
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
line 438
;438:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $156
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $154
LABELV $156
line 439
;439:			{
line 440
;440:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 441
;441:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 442
;442:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $125
JUMPV
LABELV $154
line 444
;443:			}
;444:			if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $157
line 445
;445:			{
line 446
;446:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 447
;447:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 448
;448:			}
LABELV $157
line 449
;449:		}
LABELV $152
line 435
ADDRGP4 $151
JUMPV
line 450
;450:	}
LABELV $149
LABELV $159
line 454
;451:
;452:	// parse a regular word
;453:	do
;454:	{
line 455
;455:		if (len < MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $162
line 456
;456:		{
line 457
;457:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 458
;458:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 459
;459:		}
LABELV $162
line 460
;460:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 461
;461:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 462
;462:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $164
line 463
;463:			com_lines++;
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
LABELV $164
line 464
;464:	} while (c>32);
LABELV $160
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $159
line 466
;465:
;466:	if (len == MAX_TOKEN_CHARS)
ADDRLP4 8
INDIRI4
CNSTI4 1024
NEI4 $166
line 467
;467:	{
line 469
;468://		Com_Printf ("Token exceeded %i chars, discarded.\n", MAX_TOKEN_CHARS);
;469:		len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 470
;470:	}
LABELV $166
line 471
;471:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 473
;472:
;473:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 474
;474:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $125
endproc COM_ParseExt 36 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 538
;475:}
;476:
;477:
;478:#if 0
;479:// no longer used
;480:/*
;481:===============
;482:COM_ParseInfos
;483:===============
;484:*/
;485:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;486:	char	*token;
;487:	int		count;
;488:	char	key[MAX_TOKEN_CHARS];
;489:
;490:	count = 0;
;491:
;492:	while ( 1 ) {
;493:		token = COM_Parse( &buf );
;494:		if ( !token[0] ) {
;495:			break;
;496:		}
;497:		if ( strcmp( token, "{" ) ) {
;498:			Com_Printf( "Missing { in info file\n" );
;499:			break;
;500:		}
;501:
;502:		if ( count == max ) {
;503:			Com_Printf( "Max infos exceeded\n" );
;504:			break;
;505:		}
;506:
;507:		infos[count][0] = 0;
;508:		while ( 1 ) {
;509:			token = COM_ParseExt( &buf, qtrue );
;510:			if ( !token[0] ) {
;511:				Com_Printf( "Unexpected end of info file\n" );
;512:				break;
;513:			}
;514:			if ( !strcmp( token, "}" ) ) {
;515:				break;
;516:			}
;517:			Q_strncpyz( key, token, sizeof( key ) );
;518:
;519:			token = COM_ParseExt( &buf, qfalse );
;520:			if ( !token[0] ) {
;521:				strcpy( token, "<NULL>" );
;522:			}
;523:			Info_SetValueForKey( infos[count], key, token );
;524:		}
;525:		count++;
;526:	}
;527:
;528:	return count;
;529:}
;530:#endif
;531:
;532:
;533:/*
;534:==================
;535:COM_MatchToken
;536:==================
;537:*/
;538:void COM_MatchToken( char **buf_p, char *match ) {
line 541
;539:	char	*token;
;540:
;541:	token = COM_Parse( buf_p );
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
line 542
;542:	if ( strcmp( token, match ) ) {
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
EQI4 $169
line 543
;543:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $171
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
line 544
;544:	}
LABELV $169
line 545
;545:}
LABELV $168
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 557
;546:
;547:
;548:/*
;549:=================
;550:SkipBracedSection
;551:
;552:The next token should be an open brace.
;553:Skips until a matching close brace is found.
;554:Internal brace depths are properly skipped.
;555:=================
;556:*/
;557:void SkipBracedSection (char **program) {
line 561
;558:	char			*token;
;559:	int				depth;
;560:
;561:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $173
line 562
;562:	do {
line 563
;563:		token = COM_ParseExt( program, qtrue );
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
line 564
;564:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $176
line 565
;565:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $178
line 566
;566:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 567
;567:			}
ADDRGP4 $179
JUMPV
LABELV $178
line 568
;568:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $180
line 569
;569:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 570
;570:			}
LABELV $180
LABELV $179
line 571
;571:		}
LABELV $176
line 572
;572:	} while( depth && *program );
LABELV $174
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $182
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
LABELV $182
line 573
;573:}
LABELV $172
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 16 0
line 580
;574:
;575:/*
;576:=================
;577:SkipRestOfLine
;578:=================
;579:*/
;580:void SkipRestOfLine ( char **data ) {
line 584
;581:	char	*p;
;582:	int		c;
;583:
;584:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $185
JUMPV
LABELV $184
line 585
;585:	while ( (c = *p++) != 0 ) {
line 586
;586:		if ( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $187
line 587
;587:			com_lines++;
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
line 588
;588:			break;
ADDRGP4 $186
JUMPV
LABELV $187
line 590
;589:		}
;590:	}
LABELV $185
line 585
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
NEI4 $184
LABELV $186
line 592
;591:
;592:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 593
;593:}
LABELV $183
endproc SkipRestOfLine 16 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 596
;594:
;595:
;596:void Parse1DMatrix (char **buf_p, int x, float *m) {
line 600
;597:	char	*token;
;598:	int		i;
;599:
;600:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 602
;601:
;602:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $194
JUMPV
LABELV $191
line 603
;603:		token = COM_Parse(buf_p);
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
line 604
;604:		m[i] = atof(token);
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
line 605
;605:	}
LABELV $192
line 602
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $194
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $191
line 607
;606:
;607:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 608
;608:}
LABELV $189
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 610
;609:
;610:void Parse2DMatrix (char **buf_p, int y, int x, float *m) {
line 613
;611:	int		i;
;612:
;613:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 615
;614:
;615:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 616
;616:		Parse1DMatrix (buf_p, x, m + i * x);
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
line 617
;617:	}
LABELV $198
line 615
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $197
line 619
;618:
;619:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 620
;620:}
LABELV $196
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 622
;621:
;622:void Parse3DMatrix (char **buf_p, int z, int y, int x, float *m) {
line 625
;623:	int		i;
;624:
;625:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $190
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 627
;626:
;627:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 628
;628:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
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
line 629
;629:	}
LABELV $203
line 627
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $202
line 631
;630:
;631:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $195
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 632
;632:}
LABELV $201
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 644
;633:
;634:
;635:/*
;636:============================================================================
;637:
;638:					LIBRARY REPLACEMENT FUNCTIONS
;639:
;640:============================================================================
;641:*/
;642:
;643:int Q_isprint( int c )
;644:{
line 645
;645:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $207
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $207
line 646
;646:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $207
line 647
;647:	return ( 0 );
CNSTI4 0
RETI4
LABELV $206
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 651
;648:}
;649:
;650:int Q_islower( int c )
;651:{
line 652
;652:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $210
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $210
line 653
;653:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $209
JUMPV
LABELV $210
line 654
;654:	return ( 0 );
CNSTI4 0
RETI4
LABELV $209
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 658
;655:}
;656:
;657:int Q_isupper( int c )
;658:{
line 659
;659:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $213
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $213
line 660
;660:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $212
JUMPV
LABELV $213
line 661
;661:	return ( 0 );
CNSTI4 0
RETI4
LABELV $212
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 665
;662:}
;663:
;664:int Q_isalpha( int c )
;665:{
line 666
;666:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $219
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $218
LABELV $219
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $216
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $216
LABELV $218
line 667
;667:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $215
JUMPV
LABELV $216
line 668
;668:	return ( 0 );
CNSTI4 0
RETI4
LABELV $215
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 672
;669:}
;670:
;671:char* Q_strrchr( const char* string, int c )
;672:{
line 673
;673:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 675
;674:	char *s;
;675:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 677
;676:
;677:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $222
JUMPV
LABELV $221
line 680
;678:
;679:	while (*s)
;680:	{
line 681
;681:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $224
line 682
;682:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $224
line 683
;683:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 684
;684:	}
LABELV $222
line 679
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $221
line 685
;685:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $226
line 686
;686:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $226
line 688
;687:
;688:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $220
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 698
;689:}
;690:
;691:/*
;692:=============
;693:Q_strncpyz
;694: 
;695:Safe strncpy that ensures a trailing zero
;696:=============
;697:*/
;698:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 700
;699:  // bk001129 - also NULL dest
;700:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $229
line 701
;701:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $231
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 702
;702:  }
LABELV $229
line 703
;703:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $232
line 704
;704:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $234
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 705
;705:	}
LABELV $232
line 706
;706:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $235
line 707
;707:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $237
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 708
;708:	}
LABELV $235
line 710
;709:
;710:	strncpy( dest, src, destsize-1 );
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
line 711
;711:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 712
;712:}
LABELV $228
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 714
;713:                 
;714:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 718
;715:	int		c1, c2;
;716:
;717:	// bk001129 - moved in 1.17 fix not in id codebase
;718:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $239
line 719
;719:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $241
line 720
;720:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $238
JUMPV
LABELV $241
line 722
;721:           else
;722:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $238
JUMPV
LABELV $239
line 724
;723:        }
;724:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $243
line 725
;725:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $238
JUMPV
LABELV $243
LABELV $245
line 729
;726:
;727:
;728:	
;729:	do {
line 730
;730:		c1 = *s1++;
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
line 731
;731:		c2 = *s2++;
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
line 733
;732:
;733:		if (!n--) {
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
NEI4 $248
line 734
;734:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $238
JUMPV
LABELV $248
line 737
;735:		}
;736:		
;737:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $250
line 738
;738:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $252
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $252
line 739
;739:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 740
;740:			}
LABELV $252
line 741
;741:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $254
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $254
line 742
;742:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 743
;743:			}
LABELV $254
line 744
;744:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $256
line 745
;745:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $259
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $260
JUMPV
LABELV $259
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $260
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $238
JUMPV
LABELV $256
line 747
;746:			}
;747:		}
LABELV $250
line 748
;748:	} while (c1);
LABELV $246
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $245
line 750
;749:	
;750:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $238
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 753
;751:}
;752:
;753:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $262
line 756
;754:	int		c1, c2;
;755:	
;756:	do {
line 757
;757:		c1 = *s1++;
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
line 758
;758:		c2 = *s2++;
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
line 760
;759:
;760:		if (!n--) {
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
NEI4 $265
line 761
;761:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $261
JUMPV
LABELV $265
line 764
;762:		}
;763:		
;764:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $267
line 765
;765:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $270
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $271
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $261
JUMPV
LABELV $267
line 767
;766:		}
;767:	} while (c1);
LABELV $263
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $262
line 769
;768:	
;769:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $261
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 772
;770:}
;771:
;772:int Q_stricmp (const char *s1, const char *s2) {
line 773
;773:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $274
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $274
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
ADDRGP4 $275
JUMPV
LABELV $274
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $275
ADDRLP4 0
INDIRI4
RETI4
LABELV $272
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 777
;774:}
;775:
;776:
;777:char *Q_strlwr( char *s1 ) {
line 780
;778:    char	*s;
;779:
;780:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $278
JUMPV
LABELV $277
line 781
;781:	while ( *s ) {
line 782
;782:		*s = tolower(*s);
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
line 783
;783:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 784
;784:	}
LABELV $278
line 781
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $277
line 785
;785:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $276
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 788
;786:}
;787:
;788:char *Q_strupr( char *s1 ) {
line 791
;789:    char	*s;
;790:
;791:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $282
JUMPV
LABELV $281
line 792
;792:	while ( *s ) {
line 793
;793:		*s = toupper(*s);
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
line 794
;794:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 795
;795:	}
LABELV $282
line 792
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $281
line 796
;796:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $280
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 801
;797:}
;798:
;799:
;800:// never goes past bounds or leaves without a terminating 0
;801:void Q_strcat( char *dest, int size, const char *src ) {
line 804
;802:	int		l1;
;803:
;804:	l1 = strlen( dest );
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
line 805
;805:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $285
line 806
;806:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $287
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 807
;807:	}
LABELV $285
line 808
;808:	Q_strncpyz( dest + l1, src, size - l1 );
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
line 809
;809:}
LABELV $284
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 20 0
line 812
;810:
;811:
;812:int Q_PrintStrlen( const char *string ) {
line 816
;813:	int			len;
;814:	const char	*p;
;815:
;816:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $289
line 817
;817:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $289
line 820
;818:	}
;819:
;820:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 821
;821:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $292
JUMPV
LABELV $291
line 822
;822:	while( *p ) {
line 823
;823:		if( Q_IsColorString( p ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $294
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $294
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
EQI4 $294
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $294
line 824
;824:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 825
;825:			continue;
ADDRGP4 $292
JUMPV
LABELV $294
line 827
;826:		}
;827:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 828
;828:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 829
;829:	}
LABELV $292
line 822
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $291
line 831
;830:
;831:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $288
endproc Q_PrintStrlen 20 0
export Q_CleanStr
proc Q_CleanStr 32 0
line 835
;832:}
;833:
;834:
;835:char *Q_CleanStr( char *string ) {
line 840
;836:	char*	d;
;837:	char*	s;
;838:	int		c;
;839:
;840:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 841
;841:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $298
JUMPV
LABELV $297
line 842
;842:	while ((c = *s) != 0 ) {
line 843
;843:		if ( Q_IsColorString( s ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
ADDRLP4 16
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $300
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
EQI4 $300
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $300
line 844
;844:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 845
;845:		}		
ADDRGP4 $301
JUMPV
LABELV $300
line 846
;846:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $302
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $302
line 847
;847:			*d++ = c;
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
line 848
;848:		}
LABELV $302
LABELV $301
line 849
;849:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 850
;850:	}
LABELV $298
line 842
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
NEI4 $297
line 851
;851:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 853
;852:
;853:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $296
endproc Q_CleanStr 32 0
export Com_sprintf
proc Com_sprintf 32012 12
line 857
;854:}
;855:
;856:
;857:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 862
;858:	int		len;
;859:	va_list		argptr;
;860:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;861:
;862:	va_start (argptr,fmt);
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 863
;863:	len = vsprintf (bigbuffer,fmt,argptr);
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
line 864
;864:	va_end (argptr);
ADDRLP4 4
CNSTP4 0
ASGNP4
line 865
;865:	if ( len >= sizeof( bigbuffer ) ) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32000
LTU4 $306
line 866
;866:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $308
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 867
;867:	}
LABELV $306
line 868
;868:	if (len >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $309
line 869
;869:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $311
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
line 875
;870:#ifdef	_DEBUG
;871:		__asm {
;872:			int 3;
;873:		}
;874:#endif
;875:	}
LABELV $309
line 876
;876:	Q_strncpyz (dest, bigbuffer, size );
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
line 877
;877:}
LABELV $304
endproc Com_sprintf 32012 12
bss
align 1
LABELV $313
skip 64000
data
align 4
LABELV $314
byte 4 0
export va
code
proc va 12 12
line 889
;878:
;879:
;880:/*
;881:============
;882:va
;883:
;884:does a varargs printf into a temp buffer, so I don't need to have
;885:varargs versions of all text functions.
;886:FIXME: make this buffer size safe someday
;887:============
;888:*/
;889:char	* QDECL va( char *format, ... ) {
line 895
;890:	va_list		argptr;
;891:	static char		string[2][32000];	// in case va is called by nested functions
;892:	static int		index = 0;
;893:	char	*buf;
;894:
;895:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $314
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $313
ADDP4
ASGNP4
line 896
;896:	index++;
ADDRLP4 8
ADDRGP4 $314
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 898
;897:
;898:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 899
;899:	vsprintf (buf, format,argptr);
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
line 900
;900:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 902
;901:
;902:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $312
endproc va 12 12
bss
align 1
LABELV $317
skip 16384
data
align 4
LABELV $318
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 923
;903:}
;904:
;905:
;906:/*
;907:=====================================================================
;908:
;909:  INFO STRINGS
;910:
;911:=====================================================================
;912:*/
;913:
;914:/*
;915:===============
;916:Info_ValueForKey
;917:
;918:Searches the string for the given
;919:key and returns the associated value, or an empty string.
;920:FIXME: overflow check?
;921:===============
;922:*/
;923:char *Info_ValueForKey( const char *s, const char *key ) {
line 930
;924:	char	pkey[BIG_INFO_KEY];
;925:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;926:											// work without stomping on each other
;927:	static	int	valueindex = 0;
;928:	char	*o;
;929:	
;930:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $321
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $319
LABELV $321
line 931
;931:		return "";
ADDRGP4 $322
RETP4
ADDRGP4 $316
JUMPV
LABELV $319
line 934
;932:	}
;933:
;934:	if ( strlen( s ) >= BIG_INFO_STRING ) {
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
LTI4 $323
line 935
;935:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $325
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 936
;936:	}
LABELV $323
line 938
;937:
;938:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $318
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 939
;939:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $329
line 940
;940:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $329
JUMPV
LABELV $328
line 942
;941:	while (1)
;942:	{
line 943
;943:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $332
JUMPV
LABELV $331
line 945
;944:		while (*s != '\\')
;945:		{
line 946
;946:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $334
line 947
;947:				return "";
ADDRGP4 $322
RETP4
ADDRGP4 $316
JUMPV
LABELV $334
line 948
;948:			*o++ = *s++;
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
line 949
;949:		}
LABELV $332
line 944
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $331
line 950
;950:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 951
;951:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 953
;952:
;953:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $318
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $317
ADDP4
ASGNP4
ADDRGP4 $337
JUMPV
LABELV $336
line 956
;954:
;955:		while (*s != '\\' && *s)
;956:		{
line 957
;957:			*o++ = *s++;
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
line 958
;958:		}
LABELV $337
line 955
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $339
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $336
LABELV $339
line 959
;959:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 961
;960:
;961:		if (!Q_stricmp (key, pkey) )
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
NEI4 $340
line 962
;962:			return value[valueindex];
ADDRGP4 $318
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $317
ADDP4
RETP4
ADDRGP4 $316
JUMPV
LABELV $340
line 964
;963:
;964:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $342
line 965
;965:			break;
ADDRGP4 $330
JUMPV
LABELV $342
line 966
;966:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 967
;967:	}
LABELV $329
line 941
ADDRGP4 $328
JUMPV
LABELV $330
line 969
;968:
;969:	return "";
ADDRGP4 $322
RETP4
LABELV $316
endproc Info_ValueForKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 980
;970:}
;971:
;972:
;973:/*
;974:===================
;975:Info_NextPair
;976:
;977:Used to itterate through all the key/value pairs in an info string
;978:===================
;979:*/
;980:void Info_NextPair( const char **head, char *key, char *value ) {
line 984
;981:	char	*o;
;982:	const char	*s;
;983:
;984:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 986
;985:
;986:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $345
line 987
;987:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 988
;988:	}
LABELV $345
line 989
;989:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 990
;990:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 992
;991:
;992:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $348
JUMPV
LABELV $347
line 993
;993:	while ( *s != '\\' ) {
line 994
;994:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $350
line 995
;995:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 996
;996:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 997
;997:			return;
ADDRGP4 $344
JUMPV
LABELV $350
line 999
;998:		}
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
LABELV $348
line 993
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $347
line 1001
;1001:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1002
;1002:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1004
;1003:
;1004:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $353
JUMPV
LABELV $352
line 1005
;1005:	while ( *s != '\\' && *s ) {
line 1006
;1006:		*o++ = *s++;
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
line 1007
;1007:	}
LABELV $353
line 1005
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $355
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $352
LABELV $355
line 1008
;1008:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1010
;1009:
;1010:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1011
;1011:}
LABELV $344
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 8
line 1019
;1012:
;1013:
;1014:/*
;1015:===================
;1016:Info_RemoveKey
;1017:===================
;1018:*/
;1019:void Info_RemoveKey( char *s, const char *key ) {
line 1025
;1020:	char	*start;
;1021:	char	pkey[MAX_INFO_KEY];
;1022:	char	value[MAX_INFO_VALUE];
;1023:	char	*o;
;1024:
;1025:	if ( strlen( s ) >= MAX_INFO_STRING ) {
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
LTI4 $357
line 1026
;1026:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $359
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1027
;1027:	}
LABELV $357
line 1029
;1028:
;1029:	if (strchr (key, '\\')) {
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
EQU4 $363
line 1030
;1030:		return;
ADDRGP4 $356
JUMPV
LABELV $362
line 1034
;1031:	}
;1032:
;1033:	while (1)
;1034:	{
line 1035
;1035:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1036
;1036:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $365
line 1037
;1037:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $365
line 1038
;1038:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $368
JUMPV
LABELV $367
line 1040
;1039:		while (*s != '\\')
;1040:		{
line 1041
;1041:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $370
line 1042
;1042:				return;
ADDRGP4 $356
JUMPV
LABELV $370
line 1043
;1043:			*o++ = *s++;
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
line 1044
;1044:		}
LABELV $368
line 1039
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $367
line 1045
;1045:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1046
;1046:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1048
;1047:
;1048:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $373
JUMPV
LABELV $372
line 1050
;1049:		while (*s != '\\' && *s)
;1050:		{
line 1051
;1051:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 1052
;1052:				return;
ADDRGP4 $356
JUMPV
LABELV $375
line 1053
;1053:			*o++ = *s++;
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
line 1054
;1054:		}
LABELV $373
line 1049
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $377
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $372
LABELV $377
line 1055
;1055:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1057
;1056:
;1057:		if (!strcmp (key, pkey) )
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
NEI4 $378
line 1058
;1058:		{
line 1059
;1059:			strcpy (start, s);	// remove this part
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1060
;1060:			return;
ADDRGP4 $356
JUMPV
LABELV $378
line 1063
;1061:		}
;1062:
;1063:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $380
line 1064
;1064:			return;
ADDRGP4 $356
JUMPV
LABELV $380
line 1065
;1065:	}
LABELV $363
line 1033
ADDRGP4 $362
JUMPV
line 1067
;1066:
;1067:}
LABELV $356
endproc Info_RemoveKey 2076 8
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 8
line 1074
;1068:
;1069:/*
;1070:===================
;1071:Info_RemoveKey_Big
;1072:===================
;1073:*/
;1074:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1080
;1075:	char	*start;
;1076:	char	pkey[BIG_INFO_KEY];
;1077:	char	value[BIG_INFO_VALUE];
;1078:	char	*o;
;1079:
;1080:	if ( strlen( s ) >= BIG_INFO_STRING ) {
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
LTI4 $383
line 1081
;1081:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $385
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1082
;1082:	}
LABELV $383
line 1084
;1083:
;1084:	if (strchr (key, '\\')) {
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
EQU4 $389
line 1085
;1085:		return;
ADDRGP4 $382
JUMPV
LABELV $388
line 1089
;1086:	}
;1087:
;1088:	while (1)
;1089:	{
line 1090
;1090:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1091
;1091:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $391
line 1092
;1092:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $391
line 1093
;1093:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $394
JUMPV
LABELV $393
line 1095
;1094:		while (*s != '\\')
;1095:		{
line 1096
;1096:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $396
line 1097
;1097:				return;
ADDRGP4 $382
JUMPV
LABELV $396
line 1098
;1098:			*o++ = *s++;
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
line 1099
;1099:		}
LABELV $394
line 1094
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $393
line 1100
;1100:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1101
;1101:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1103
;1102:
;1103:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $399
JUMPV
LABELV $398
line 1105
;1104:		while (*s != '\\' && *s)
;1105:		{
line 1106
;1106:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $401
line 1107
;1107:				return;
ADDRGP4 $382
JUMPV
LABELV $401
line 1108
;1108:			*o++ = *s++;
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
line 1109
;1109:		}
LABELV $399
line 1104
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $403
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $398
LABELV $403
line 1110
;1110:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1112
;1111:
;1112:		if (!strcmp (key, pkey) )
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
NEI4 $404
line 1113
;1113:		{
line 1114
;1114:			strcpy (start, s);	// remove this part
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1115
;1115:			return;
ADDRGP4 $382
JUMPV
LABELV $404
line 1118
;1116:		}
;1117:
;1118:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $406
line 1119
;1119:			return;
ADDRGP4 $382
JUMPV
LABELV $406
line 1120
;1120:	}
LABELV $389
line 1088
ADDRGP4 $388
JUMPV
line 1122
;1121:
;1122:}
LABELV $382
endproc Info_RemoveKey_Big 16412 8
export Info_Validate
proc Info_Validate 8 8
line 1135
;1123:
;1124:
;1125:
;1126:
;1127:/*
;1128:==================
;1129:Info_Validate
;1130:
;1131:Some characters are illegal in info strings because they
;1132:can mess up the server's parsing
;1133:==================
;1134:*/
;1135:qboolean Info_Validate( const char *s ) {
line 1136
;1136:	if ( strchr( s, '\"' ) ) {
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
EQU4 $409
line 1137
;1137:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $408
JUMPV
LABELV $409
line 1139
;1138:	}
;1139:	if ( strchr( s, ';' ) ) {
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
EQU4 $411
line 1140
;1140:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $408
JUMPV
LABELV $411
line 1142
;1141:	}
;1142:	return qtrue;
CNSTI4 1
RETI4
LABELV $408
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1068 20
line 1152
;1143:}
;1144:
;1145:/*
;1146:==================
;1147:Info_SetValueForKey
;1148:
;1149:Changes or adds a key/value pair
;1150:==================
;1151:*/
;1152:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1155
;1153:	char	newi[MAX_INFO_STRING];
;1154:
;1155:	if ( strlen( s ) >= MAX_INFO_STRING ) {
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
LTI4 $414
line 1156
;1156:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $416
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1157
;1157:	}
LABELV $414
line 1159
;1158:
;1159:	if (strchr (key, '\\') || strchr (value, '\\'))
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
NEU4 $419
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
EQU4 $417
LABELV $419
line 1160
;1160:	{
line 1161
;1161:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $420
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1162
;1162:		return;
ADDRGP4 $413
JUMPV
LABELV $417
line 1165
;1163:	}
;1164:
;1165:	if (strchr (key, ';') || strchr (value, ';'))
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
NEU4 $423
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
EQU4 $421
LABELV $423
line 1166
;1166:	{
line 1167
;1167:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $424
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1168
;1168:		return;
ADDRGP4 $413
JUMPV
LABELV $421
line 1171
;1169:	}
;1170:
;1171:	if (strchr (key, '\"') || strchr (value, '\"'))
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
NEU4 $427
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
EQU4 $425
LABELV $427
line 1172
;1172:	{
line 1173
;1173:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $428
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1174
;1174:		return;
ADDRGP4 $413
JUMPV
LABELV $425
line 1177
;1175:	}
;1176:
;1177:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1178
;1178:	if (!value || !strlen(value))
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $431
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
NEI4 $429
LABELV $431
line 1179
;1179:		return;
ADDRGP4 $413
JUMPV
LABELV $429
line 1181
;1180:
;1181:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $432
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
line 1183
;1182:
;1183:	if (strlen(newi) + strlen(s) > MAX_INFO_STRING)
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
LEI4 $433
line 1184
;1184:	{
line 1185
;1185:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $435
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1186
;1186:		return;
ADDRGP4 $413
JUMPV
LABELV $433
line 1189
;1187:	}
;1188:
;1189:	strcat (newi, s);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1190
;1190:	strcpy (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1191
;1191:}
LABELV $413
endproc Info_SetValueForKey 1068 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8236 20
line 1200
;1192:
;1193:/*
;1194:==================
;1195:Info_SetValueForKey_Big
;1196:
;1197:Changes or adds a key/value pair
;1198:==================
;1199:*/
;1200:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1203
;1201:	char	newi[BIG_INFO_STRING];
;1202:
;1203:	if ( strlen( s ) >= BIG_INFO_STRING ) {
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
LTI4 $437
line 1204
;1204:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $416
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1205
;1205:	}
LABELV $437
line 1207
;1206:
;1207:	if (strchr (key, '\\') || strchr (value, '\\'))
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
NEU4 $441
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
EQU4 $439
LABELV $441
line 1208
;1208:	{
line 1209
;1209:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $420
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1210
;1210:		return;
ADDRGP4 $436
JUMPV
LABELV $439
line 1213
;1211:	}
;1212:
;1213:	if (strchr (key, ';') || strchr (value, ';'))
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
NEU4 $444
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
EQU4 $442
LABELV $444
line 1214
;1214:	{
line 1215
;1215:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $424
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1216
;1216:		return;
ADDRGP4 $436
JUMPV
LABELV $442
line 1219
;1217:	}
;1218:
;1219:	if (strchr (key, '\"') || strchr (value, '\"'))
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
NEU4 $447
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
EQU4 $445
LABELV $447
line 1220
;1220:	{
line 1221
;1221:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $428
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1222
;1222:		return;
ADDRGP4 $436
JUMPV
LABELV $445
line 1225
;1223:	}
;1224:
;1225:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1226
;1226:	if (!value || !strlen(value))
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $450
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
NEI4 $448
LABELV $450
line 1227
;1227:		return;
ADDRGP4 $436
JUMPV
LABELV $448
line 1229
;1228:
;1229:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $432
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
line 1231
;1230:
;1231:	if (strlen(newi) + strlen(s) > BIG_INFO_STRING)
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
LEI4 $451
line 1232
;1232:	{
line 1233
;1233:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $453
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1234
;1234:		return;
ADDRGP4 $436
JUMPV
LABELV $451
line 1237
;1235:	}
;1236:
;1237:	strcat (s, newi);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1238
;1238:}
LABELV $436
endproc Info_SetValueForKey_Big 8236 20
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 1258
;1239:
;1240:
;1241:
;1242:
;1243://====================================================================
;1244:
;1245:
;1246://unlagged - attack prediction #3
;1247:// moved from g_weapon.c
;1248:/*
;1249:======================
;1250:SnapVectorTowards
;1251:
;1252:Round a vector to integers for more efficient network
;1253:transmission, but make sure that it rounds towards a given point
;1254:rather than blindly truncating.  This prevents it from truncating 
;1255:into a wall.
;1256:======================
;1257:*/
;1258:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 1261
;1259:	int		i;
;1260:
;1261:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $455
line 1262
;1262:		if ( to[i] <= v[i] ) {
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
GTF4 $459
line 1263
;1263:			v[i] = (int)v[i];
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
line 1264
;1264:		} else {
ADDRGP4 $460
JUMPV
LABELV $459
line 1265
;1265:			v[i] = (int)v[i] + 1;
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
line 1266
;1266:		}
LABELV $460
line 1267
;1267:	}
LABELV $456
line 1261
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $455
line 1268
;1268:}
LABELV $454
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
import Max_Ammo
import altAmmoUsage
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
LABELV $453
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
LABELV $435
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
LABELV $432
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $428
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
LABELV $424
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
LABELV $420
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
LABELV $416
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
LABELV $385
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
LABELV $359
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
LABELV $325
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
LABELV $322
byte 1 0
align 1
LABELV $311
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
LABELV $308
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
LABELV $287
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
LABELV $237
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
LABELV $234
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
LABELV $231
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
LABELV $195
byte 1 41
byte 1 0
align 1
LABELV $190
byte 1 40
byte 1 0
align 1
LABELV $171
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
LABELV $77
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
LABELV $73
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
LABELV $67
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
