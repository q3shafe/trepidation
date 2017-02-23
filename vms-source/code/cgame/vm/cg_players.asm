data
export cg_customSoundNames
align 4
LABELV cg_customSoundNames
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
skip 72
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../cg_players.c"
line 34
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:
;6:char	*cg_customSoundNames[MAX_CUSTOM_SOUNDS] = {
;7:	"*death1.wav",
;8:	"*death2.wav",
;9:	"*death3.wav",
;10:	"*jump1.wav",
;11:	"*pain25_1.wav",
;12:	"*pain50_1.wav",
;13:	"*pain75_1.wav",
;14:	"*pain100_1.wav",
;15:	"*falling1.wav",
;16:	"*gasp.wav",
;17:	"*drown.wav",
;18:	"*fall1.wav",
;19:	"*taunt.wav",
;20:	"*taunt1.wav",
;21:	"*taunt2.wav",
;22:	"*taunt3.wav",
;23:	"*taunt4.wav",
;24:	"*taunt5.wav"	
;25:};
;26:
;27:
;28:/*
;29:================
;30:CG_CustomSound
;31:
;32:================
;33:*/
;34:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 38
;35:	clientInfo_t *ci;
;36:	int			i;
;37:
;38:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $91
line 39
;39:		return trap_S_RegisterSound( soundName, qfalse );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $90
JUMPV
LABELV $91
line 42
;40:	}
;41:
;42:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $95
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $93
LABELV $95
line 43
;43:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 44
;44:	}
LABELV $93
line 45
;45:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 1740
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 47
;46:
;47:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 48
;48:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $101
line 49
;49:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1592
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $90
JUMPV
LABELV $101
line 51
;50:		}
;51:	}
LABELV $98
line 47
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 0
INDIRI4
CNSTI4 36
GEI4 $103
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $97
LABELV $103
line 53
;52:
;53:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $104
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 54
;54:	return 0;
CNSTI4 0
RETI4
LABELV $90
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20084 12
line 75
;55:}
;56:
;57:
;58:
;59:/*
;60:=============================================================================
;61:
;62:CLIENT INFO
;63:
;64:=============================================================================
;65:*/
;66:
;67:/*
;68:======================
;69:CG_ParseAnimationFile
;70:
;71:Read a configuration file containing animation coutns and rates
;72:models/players/visor/animation.cfg, etc
;73:======================
;74:*/
;75:static qboolean	CG_ParseAnimationFile( const char *filename, clientInfo_t *ci ) {
line 86
;76:	char		*text_p, *prev;
;77:	int			len;
;78:	int			i;
;79:	char		*token;
;80:	float		fps;
;81:	int			skip;
;82:	char		text[20000];
;83:	fileHandle_t	f;
;84:	animation_t *animations;
;85:
;86:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 556
ADDP4
ASGNP4
line 89
;87:
;88:	// load the file
;89:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20032
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 90
;90:	if ( len <= 0 ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $106
line 91
;91:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $106
line 93
;92:	}
;93:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $108
line 94
;94:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $110
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 95
;95:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $108
line 97
;96:	}
;97:	trap_FS_Read( text, len, f );
ADDRLP4 32
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 98
;98:	text[len] = 0;
ADDRLP4 28
INDIRI4
ADDRLP4 32
ADDP4
CNSTI1 0
ASGNI1
line 99
;99:	trap_FS_FCloseFile( f );
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 102
;100:
;101:	// parse the text
;102:	text_p = text;
ADDRLP4 12
ADDRLP4 32
ASGNP4
line 103
;103:	skip = 0;	// quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 105
;104:
;105:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 106
;106:	VectorClear( ci->headOffset );
ADDRLP4 20040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20044
CNSTF4 0
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 504
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
line 107
;107:	ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 108
;108:	ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 109
;109:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $111
line 112
;110:
;111:	// read optional parameters
;112:	while ( 1 ) {
line 113
;113:		prev = text_p;	// so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 114
;114:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 115
;115:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 116
;116:			break;
ADDRGP4 $113
JUMPV
LABELV $114
line 118
;117:		}
;118:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $116
line 119
;119:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 120
;120:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $119
line 121
;121:				break;
ADDRGP4 $113
JUMPV
LABELV $119
line 123
;122:			}
;123:			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $124
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $121
LABELV $125
line 124
;124:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 125
;125:			} else if ( !Q_stricmp( token, "boot" ) ) {
ADDRGP4 $112
JUMPV
LABELV $121
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $126
line 126
;126:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 1
ASGNI4
line 127
;127:			} else if ( !Q_stricmp( token, "flesh" ) ) {
ADDRGP4 $112
JUMPV
LABELV $126
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $129
line 128
;128:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 2
ASGNI4
line 129
;129:			} else if ( !Q_stricmp( token, "mech" ) ) {
ADDRGP4 $112
JUMPV
LABELV $129
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 20076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 0
NEI4 $132
line 130
;130:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 3
ASGNI4
line 131
;131:			} else if ( !Q_stricmp( token, "energy" ) ) {
ADDRGP4 $112
JUMPV
LABELV $132
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 20080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20080
INDIRI4
CNSTI4 0
NEI4 $135
line 132
;132:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 4
ASGNI4
line 133
;133:			} else {
ADDRGP4 $112
JUMPV
LABELV $135
line 134
;134:				CG_Printf( "Bad footsteps parm in %s: %s Reverting to Fallback\n", filename, token );
ADDRGP4 $138
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 135
;135:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 136
;136:			}
line 137
;137:			continue;
ADDRGP4 $112
JUMPV
LABELV $116
line 138
;138:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $139
line 139
;139:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $142
line 140
;140:				token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 141
;141:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 142
;142:					break;
ADDRGP4 $112
JUMPV
LABELV $146
line 144
;143:				}
;144:				ci->headOffset[i] = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 504
ADDP4
ADDP4
ADDRLP4 20064
INDIRF4
ASGNF4
line 145
;145:			}
LABELV $143
line 139
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $142
line 146
;146:			continue;
ADDRGP4 $112
JUMPV
LABELV $139
line 147
;147:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $150
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $148
line 148
;148:			token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20064
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20064
INDIRP4
ASGNP4
line 149
;149:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $151
line 150
;150:				break;
ADDRGP4 $113
JUMPV
LABELV $151
line 152
;151:			}
;152:			if ( token[0] == 'f' || token[0] == 'F' ) {
ADDRLP4 20068
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 102
EQI4 $155
ADDRLP4 20068
INDIRI4
CNSTI4 70
NEI4 $153
LABELV $155
line 153
;153:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 154
;154:			} else if ( token[0] == 'n' || token[0] == 'N' ) {
ADDRGP4 $112
JUMPV
LABELV $153
ADDRLP4 20072
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 110
EQI4 $158
ADDRLP4 20072
INDIRI4
CNSTI4 78
NEI4 $156
LABELV $158
line 155
;155:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 156
;156:			} else {
ADDRGP4 $112
JUMPV
LABELV $156
line 157
;157:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 158
;158:			}
line 159
;159:			continue;
ADDRGP4 $112
JUMPV
LABELV $148
line 160
;160:		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $159
line 161
;161:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 162
;162:			continue;
ADDRGP4 $112
JUMPV
LABELV $159
line 163
;163:		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $164
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $162
line 164
;164:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 165
;165:			continue;
ADDRGP4 $112
JUMPV
LABELV $162
line 169
;166:		}
;167:
;168:		// if it is a number, start parsing animations
;169:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20072
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 48
LTI4 $165
ADDRLP4 20072
INDIRI4
CNSTI4 57
GTI4 $165
line 170
;170:			text_p = prev;	// unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 171
;171:			break;
ADDRGP4 $113
JUMPV
LABELV $165
line 173
;172:		}
;173:		Com_Printf( "unknown token '%s' is %s\n", token, filename );
ADDRGP4 $167
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 174
;174:	}
LABELV $112
line 112
ADDRGP4 $111
JUMPV
LABELV $113
line 177
;175:
;176:	// read information for each frame
;177:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $168
line 179
;178:
;179:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 180
;180:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $172
line 181
;181:			if( i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE ) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $170
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $170
line 182
;182:				animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 183
;183:				animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 184
;184:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 185
;185:				animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 186
;186:				animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 187
;187:				animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:				animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 189
;189:				continue;
ADDRGP4 $169
JUMPV
line 191
;190:			}
;191:			break;
LABELV $172
line 193
;192:		}
;193:		animations[i].firstFrame = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20052
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20052
INDIRI4
ASGNI4
line 195
;194:		// leg only frames are adjusted to not count the upper body only frames
;195:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $176
line 196
;196:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 197
;197:		}
LABELV $176
line 198
;198:		if ( i >= LEGS_WALKCR && i<TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $178
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $178
line 199
;199:			animations[i].firstFrame -= skip;
ADDRLP4 20060
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20060
INDIRP4
ADDRLP4 20060
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 200
;200:		}
LABELV $178
line 202
;201:
;202:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 203
;203:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $180
line 204
;204:			break;
ADDRGP4 $170
JUMPV
LABELV $180
line 206
;205:		}
;206:		animations[i].numFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20064
INDIRI4
ASGNI4
line 208
;207:
;208:		animations[i].reversed = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 209
;209:		animations[i].flipflop = qfalse;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 211
;210:		// if numFrames is negative the animation is reversed
;211:		if (animations[i].numFrames < 0) {
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $182
line 212
;212:			animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 20068
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20068
INDIRP4
ADDRLP4 20068
INDIRP4
INDIRI4
NEGI4
ASGNI4
line 213
;213:			animations[i].reversed = qtrue;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 214
;214:		}
LABELV $182
line 216
;215:
;216:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 217
;217:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $184
line 218
;218:			break;
ADDRGP4 $170
JUMPV
LABELV $184
line 220
;219:		}
;220:		animations[i].loopFrames = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atoi
CALLI4
ASGNI4
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20072
INDIRI4
ASGNI4
line 222
;221:
;222:		token = COM_Parse( &text_p );
ADDRLP4 12
ARGP4
ADDRLP4 20076
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20076
INDIRP4
ASGNP4
line 223
;223:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $186
line 224
;224:			break;
ADDRGP4 $170
JUMPV
LABELV $186
line 226
;225:		}
;226:		fps = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20080
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20080
INDIRF4
ASGNF4
line 227
;227:		if ( fps == 0 ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $188
line 228
;228:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 229
;229:		}
LABELV $188
line 230
;230:		animations[i].frameLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 231
;231:		animations[i].initialLerp = 1000 / fps;
CNSTI4 28
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 232
;232:	}
LABELV $169
line 177
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $168
LABELV $170
line 234
;233:
;234:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $190
line 235
;235:		CG_Printf( "Error parsing animation file: %s", filename );
ADDRGP4 $192
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 236
;236:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $105
JUMPV
LABELV $190
line 240
;237:	}
;238:
;239:	// crouch backward animation
;240:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 241
;241:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 243
;242:	// walk backward animation
;243:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 244
;244:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 246
;245:	// flag moving fast
;246:	animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 247
;247:	animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 248
;248:	animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 249
;249:	animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 250
;250:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 251
;251:	animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 253
;252:	// flag not moving or moving slowly
;253:	animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 254
;254:	animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 255
;255:	animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 256
;256:	animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 257
;257:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 258
;258:	animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 260
;259:	// flag speeding up
;260:	animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 261
;261:	animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 262
;262:	animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 263
;263:	animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 264
;264:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 265
;265:	animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 275
;266:	//
;267:	// new anims changes
;268:	//
;269://	animations[TORSO_GETFLAG].flipflop = qtrue;
;270://	animations[TORSO_GUARDBASE].flipflop = qtrue;
;271://	animations[TORSO_PATROL].flipflop = qtrue;
;272://	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
;273://	animations[TORSO_NEGATIVE].flipflop = qtrue;
;274:	//
;275:	return qtrue;
CNSTI4 1
RETI4
LABELV $105
endproc CG_ParseAnimationFile 20084 12
proc CG_FileExists 8 12
line 283
;276:}
;277:
;278:/*
;279:==========================
;280:CG_FileExists
;281:==========================
;282:*/
;283:static qboolean	CG_FileExists(const char *filename) {
line 286
;284:	int len;
;285:
;286:	len = trap_FS_FOpenFile( filename, 0, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 287
;287:	if (len>0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $194
line 288
;288:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $193
JUMPV
LABELV $194
line 290
;289:	}
;290:	return qfalse;
CNSTI4 0
RETI4
LABELV $193
endproc CG_FileExists 8 12
proc CG_FindClientModelFile 48 40
line 298
;291:}
;292:
;293:/*
;294:==========================
;295:CG_FindClientModelFile
;296:==========================
;297:*/
;298:static qboolean	CG_FindClientModelFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *base, const char *ext ) {
line 302
;299:	char *team, *charactersFolder;
;300:	int i;
;301:
;302:	ci->efmodel = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 303
;303:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $197
line 304
;304:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $203
ADDRGP4 $200
JUMPV
LABELV $203
line 305
;305:			case TEAM_BLUE: {
line 306
;306:				team = "blue";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 307
;307:				break;
ADDRGP4 $198
JUMPV
LABELV $200
line 309
;308:			}
;309:			default: {
line 310
;310:				team = "red";
ADDRLP4 8
ADDRGP4 $205
ASGNP4
line 311
;311:				break;
line 314
;312:			}
;313:		}
;314:	}
ADDRGP4 $198
JUMPV
LABELV $197
line 315
;315:	else {
line 316
;316:		team = "default";
ADDRLP4 8
ADDRGP4 $123
ASGNP4
line 317
;317:	}
LABELV $198
line 318
;318:	charactersFolder = "";
ADDRLP4 4
ADDRGP4 $206
ASGNP4
ADDRGP4 $208
JUMPV
LABELV $207
line 319
;319:	while(1) {
line 320
;320:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $210
line 321
;321:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $214
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $214
line 323
;322:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;323:				Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 326
;324:				
;325:				
;326:			}
ADDRGP4 $215
JUMPV
LABELV $214
line 327
;327:			else {
line 329
;328:				//								"models/players/characters/james/lower_lily_red.skin"
;329:				Com_sprintf( filename, length, "models/players/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $217
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 330
;330:			}
LABELV $215
line 331
;331:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $218
line 332
;332:				ci->efmodel = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 333
;333:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $218
line 336
;334:			}
;335:			// MDR Format
;336:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $220
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $220
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $220
line 338
;337:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;338:				Com_sprintf( filename, length, "models/players2/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $222
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 339
;339:			}
ADDRGP4 $221
JUMPV
LABELV $220
line 340
;340:			else {
line 342
;341:				//								"models/players/characters/james/lower_lily_red.skin"
;342:				Com_sprintf( filename, length, "models/players2/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $223
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 343
;343:			}
LABELV $221
line 344
;344:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $224
line 345
;345:				ci->efmodel = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 1
ASGNI4
line 346
;346:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $224
line 351
;347:			}
;348:
;349:
;350:
;351:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $226
line 352
;352:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $229
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $229
line 354
;353:					//								"models/players/characters/james/stroggs/lower_red.skin"
;354:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 355
;355:				}
ADDRGP4 $227
JUMPV
LABELV $229
line 356
;356:				else {
line 358
;357:					//								"models/players/characters/james/lower_red.skin"
;358:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $232
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 359
;359:				}
line 360
;360:			}
ADDRGP4 $227
JUMPV
LABELV $226
line 361
;361:			else {
line 362
;362:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $233
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $233
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $233
line 364
;363:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;364:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 365
;365:				}
ADDRGP4 $234
JUMPV
LABELV $233
line 366
;366:				else {
line 368
;367:					//								"models/players/characters/james/lower_lily.skin"
;368:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $232
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 369
;369:				}
LABELV $234
line 370
;370:			}
LABELV $227
line 371
;371:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $235
line 372
;372:				ci->efmodel = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 373
;373:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $235
line 379
;374:
;375:			}
;376:
;377:
;378:			// Same thing MDR format thoguh
;379:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $237
line 380
;380:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $240
ADDRLP4 44
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
EQI4 $240
line 382
;381:					//								"models/players/characters/james/stroggs/lower_red.skin"
;382:					Com_sprintf( filename, length, "models/players2/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 383
;383:				}
ADDRGP4 $238
JUMPV
LABELV $240
line 384
;384:				else {
line 386
;385:					//								"models/players/characters/james/lower_red.skin"
;386:					Com_sprintf( filename, length, "models/players2/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 387
;387:				}
line 388
;388:			}
ADDRGP4 $238
JUMPV
LABELV $237
line 389
;389:			else {
line 390
;390:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $244
ADDRLP4 44
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $244
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
EQI4 $244
line 392
;391:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;392:					Com_sprintf( filename, length, "models/players2/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 393
;393:				}
ADDRGP4 $245
JUMPV
LABELV $244
line 394
;394:				else {
line 396
;395:					//								"models/players/characters/james/lower_lily.skin"
;396:					Com_sprintf( filename, length, "models/players2/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 397
;397:				}
LABELV $245
line 398
;398:			}
LABELV $238
line 399
;399:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $246
line 400
;400:				ci->efmodel = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 1
ASGNI4
line 401
;401:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $196
JUMPV
LABELV $246
line 407
;402:			}
;403:
;404:
;405:
;406:
;407:			if ( !teamName || !*teamName ) {
ADDRLP4 44
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $248
LABELV $250
line 408
;408:				break;
ADDRGP4 $212
JUMPV
LABELV $248
line 410
;409:			}
;410:		}
LABELV $211
line 320
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $210
LABELV $212
line 412
;411:		// if tried the heads folder first
;412:		if ( charactersFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $251
line 413
;413:			break;
ADDRGP4 $209
JUMPV
LABELV $251
line 415
;414:		}
;415:		charactersFolder = "characters/";
ADDRLP4 4
ADDRGP4 $253
ASGNP4
line 416
;416:	}
LABELV $208
line 319
ADDRGP4 $207
JUMPV
LABELV $209
line 418
;417:
;418:	return qfalse;
CNSTI4 0
RETI4
LABELV $196
endproc CG_FindClientModelFile 48 40
proc CG_FindClientHeadFile 48 40
line 426
;419:}
;420:
;421:/*
;422:==========================
;423:CG_FindClientHeadFile
;424:==========================
;425:*/
;426:static qboolean	CG_FindClientHeadFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 430
;427:	char *team, *headsFolder;
;428:	int i;
;429:
;430:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $255
line 431
;431:		switch ( ci->team ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $261
ADDRGP4 $258
JUMPV
LABELV $261
line 432
;432:			case TEAM_BLUE: {
line 433
;433:				team = "blue";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 434
;434:				break;
ADDRGP4 $256
JUMPV
LABELV $258
line 436
;435:			}
;436:			default: {
line 437
;437:				team = "red";
ADDRLP4 8
ADDRGP4 $205
ASGNP4
line 438
;438:				break;
line 441
;439:			}
;440:		}
;441:	}
ADDRGP4 $256
JUMPV
LABELV $255
line 442
;442:	else {
line 443
;443:		team = "default";
ADDRLP4 8
ADDRGP4 $123
ASGNP4
line 444
;444:	}
LABELV $256
line 446
;445:
;446:	if ( headModelName[0] == '*' ) {
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $262
line 447
;447:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $264
ASGNP4
line 448
;448:		headModelName++;
ADDRFP4 16
ADDRFP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 449
;449:	}
ADDRGP4 $266
JUMPV
LABELV $262
line 450
;450:	else {
line 451
;451:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $206
ASGNP4
line 452
;452:	}
ADDRGP4 $266
JUMPV
LABELV $265
line 453
;453:	while(1) {
line 454
;454:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $268
line 455
;455:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $272
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $272
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $272
line 456
;456:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 457
;457:			}
ADDRGP4 $273
JUMPV
LABELV $272
line 458
;458:			else {
line 459
;459:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $275
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 460
;460:			}
LABELV $273
line 461
;461:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $276
line 462
;462:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $254
JUMPV
LABELV $276
line 466
;463:			}
;464:			
;465:			// Try EF Format
;466:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $278
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $278
line 467
;467:				Com_sprintf( filename, length, "models/players2/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $280
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 468
;468:			}
ADDRGP4 $279
JUMPV
LABELV $278
line 469
;469:			else {
line 470
;470:				Com_sprintf( filename, length, "models/players2/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $281
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 471
;471:			}
LABELV $279
line 472
;472:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $282
line 473
;473:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $254
JUMPV
LABELV $282
line 477
;474:			}
;475:
;476:			// q3 format
;477:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $284
line 478
;478:				if ( i == 0 &&  teamName && *teamName ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $287
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $287
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $287
line 479
;479:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 480
;480:				}
ADDRGP4 $285
JUMPV
LABELV $287
line 481
;481:				else {
line 482
;482:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $232
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 483
;483:				}
line 484
;484:			}
ADDRGP4 $285
JUMPV
LABELV $284
line 485
;485:			else {
line 486
;486:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $289
ADDRLP4 40
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
ADDRLP4 40
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $289
line 487
;487:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 488
;488:				}
ADDRGP4 $290
JUMPV
LABELV $289
line 489
;489:				else {
line 490
;490:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $232
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 491
;491:				}
LABELV $290
line 492
;492:			}
LABELV $285
line 494
;493:
;494:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $291
line 495
;495:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $254
JUMPV
LABELV $291
line 499
;496:			} 
;497:
;498:			// EF Format
;499:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $293
line 500
;500:				if ( i == 0 &&  teamName && *teamName ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $296
ADDRLP4 44
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $296
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
EQI4 $296
line 501
;501:					Com_sprintf( filename, length, "models/players2/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 502
;502:				}
ADDRGP4 $294
JUMPV
LABELV $296
line 503
;503:				else {
line 504
;504:					Com_sprintf( filename, length, "models/players2/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 505
;505:				}
line 506
;506:			}
ADDRGP4 $294
JUMPV
LABELV $293
line 507
;507:			else {
line 508
;508:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $298
ADDRLP4 44
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $298
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
EQI4 $298
line 509
;509:					Com_sprintf( filename, length, "models/players2/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $242
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 510
;510:				}
ADDRGP4 $299
JUMPV
LABELV $298
line 511
;511:				else {
line 512
;512:					Com_sprintf( filename, length, "models/players2/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 513
;513:				}
LABELV $299
line 514
;514:			}
LABELV $294
line 516
;515:
;516:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $300
line 517
;517:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $254
JUMPV
LABELV $300
line 522
;518:			} 
;519:
;520:
;521:
;522:			if ( !teamName || !*teamName ) {
ADDRLP4 44
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $304
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $302
LABELV $304
line 523
;523:				break;
ADDRGP4 $270
JUMPV
LABELV $302
line 525
;524:			}
;525:		}
LABELV $269
line 454
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $268
LABELV $270
line 527
;526:		// if tried the heads folder first
;527:		if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $305
line 528
;528:			break;
ADDRGP4 $267
JUMPV
LABELV $305
line 530
;529:		}
;530:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $264
ASGNP4
line 531
;531:	}
LABELV $266
line 453
ADDRGP4 $265
JUMPV
LABELV $267
line 533
;532:
;533:	return qfalse;
CNSTI4 0
RETI4
LABELV $254
endproc CG_FindClientHeadFile 48 40
proc CG_RegisterClientSkin 84 32
line 541
;534:}
;535:
;536:/*
;537:==========================
;538:CG_RegisterClientSkin
;539:==========================
;540:*/
;541:static qboolean	CG_RegisterClientSkin( clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName ) {
line 566
;542:	char filename[MAX_QPATH];
;543:
;544:	/*
;545:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%slower_%s.skin", modelName, teamName, skinName );
;546:	ci->legsSkin = trap_R_RegisterSkin( filename );
;547:	if (!ci->legsSkin) {
;548:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%slower_%s.skin", modelName, teamName, skinName );
;549:		ci->legsSkin = trap_R_RegisterSkin( filename );
;550:		if (!ci->legsSkin) {
;551:			Com_Printf( "Leg skin load failure: %s\n", filename );
;552:		}
;553:	}
;554:
;555:
;556:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%supper_%s.skin", modelName, teamName, skinName );
;557:	ci->torsoSkin = trap_R_RegisterSkin( filename );
;558:	if (!ci->torsoSkin) {
;559:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%supper_%s.skin", modelName, teamName, skinName );
;560:		ci->torsoSkin = trap_R_RegisterSkin( filename );
;561:		if (!ci->torsoSkin) {
;562:			Com_Printf( "Torso skin load failure: %s\n", filename );
;563:		}
;564:	}
;565:	*/
;566:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "lower", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $310
ARGP4
ADDRGP4 $311
ARGP4
ADDRLP4 64
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $308
line 567
;567:		ci->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 568
;568:	}
LABELV $308
line 569
;569:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $312
line 570
;570:		Com_Printf( "Leg skin load failure: %s\n", filename );
ADDRGP4 $314
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 571
;571:	}
LABELV $312
line 573
;572:
;573:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "upper", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRGP4 $311
ARGP4
ADDRLP4 68
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $315
line 574
;574:		ci->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 575
;575:	}
LABELV $315
line 576
;576:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $318
line 577
;577:		Com_Printf( "Torso skin load failure: %s\n", filename );
ADDRGP4 $320
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 578
;578:	}
LABELV $318
line 580
;579:
;580:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headModelName, headSkinName, "head", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRGP4 $311
ARGP4
ADDRLP4 72
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $321
line 581
;581:		ci->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 582
;582:	}
LABELV $321
line 583
;583:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
line 584
;584:		Com_Printf( "Head skin load failure: %s\n", filename );
ADDRGP4 $326
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 585
;585:	}
LABELV $324
line 588
;586:
;587:	// if any skins failed to load
;588:	if ( !ci->legsSkin || !ci->torsoSkin || !ci->headSkin ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $330
ADDRLP4 76
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $330
ADDRLP4 76
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $327
LABELV $330
line 591
;589:		// Try EF Folders
;590:
;591:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $307
JUMPV
LABELV $327
line 593
;592:	}
;593:	return qtrue;
CNSTI4 1
RETI4
LABELV $307
endproc CG_RegisterClientSkin 84 32
proc CG_RegisterClientModelname 292 32
line 602
;594:}
;595:
;596:/*
;597:==========================
;598:CG_RegisterClientModelname
;599:==========================
;600:*/
;601:
;602:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName ) {
line 607
;603:	char	filename[MAX_QPATH*2];
;604:	const char		*headName;
;605:	char newTeamName[MAX_QPATH*2];
;606:
;607:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $332
line 608
;608:		headName = modelName;
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
line 609
;609:	}
ADDRGP4 $333
JUMPV
LABELV $332
line 610
;610:	else {
line 611
;611:		headName = headModelName;
ADDRLP4 128
ADDRFP4 12
INDIRP4
ASGNP4
line 612
;612:	}
LABELV $333
line 615
;613:
;614:	
;615:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $334
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 616
;616:	ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 260
INDIRI4
ASGNI4
line 617
;617:	ci->efmodel = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 618
;618:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $335
line 619
;619:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $337
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 620
;620:		ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 621
;621:		ci->efmodel = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 622
;622:		if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $338
line 624
;623:			// Now Try Md4/MDr format Shafe - Trep 
;624:			Com_sprintf( filename, sizeof( filename ), "models/players2/%s/lower.mdr", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $340
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 625
;625:			ci->efmodel = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 1
ASGNI4
line 626
;626:			ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 627
;627:			if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $341
line 629
;628:				// Now Try Md3 in the players 2 folder format Shafe - Trep 
;629:				Com_sprintf( filename, sizeof( filename ), "models/players2/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $343
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 630
;630:				ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 631
;631:				ci->efmodel = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 1
ASGNI4
line 632
;632:				if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $344
line 633
;633:					Com_Printf( "CG_RegisterClientModelname: Failed to load model file 6673 %s\n", filename );
ADDRGP4 $346
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 634
;634:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $344
line 636
;635:				}
;636:			}
LABELV $341
line 637
;637:		}
LABELV $338
line 638
;638:	}
LABELV $335
line 641
;639:
;640:	
;641:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $347
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 642
;642:	ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 643
;643:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 0
NEI4 $348
line 644
;644:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $350
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 645
;645:		ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 646
;646:		if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 0
NEI4 $351
line 648
;647:			// Try MDR/MD4 Shafe - Trep
;648:			Com_sprintf( filename, sizeof( filename ), "models/players2/%s/upper.mdr", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $353
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 649
;649:			ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 650
;650:			if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 0
NEI4 $354
line 651
;651:				Com_sprintf( filename, sizeof( filename ), "models/players2/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $356
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 652
;652:				ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 276
INDIRI4
ASGNI4
line 653
;653:				if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 0
NEI4 $357
line 654
;654:					Com_Printf( "CG_RegisterClientModelname: Failed to load model file %s\n", filename );
ADDRGP4 $359
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 655
;655:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $357
line 657
;656:				}		
;657:			}		
LABELV $354
line 658
;658:		}
LABELV $351
line 659
;659:	}
LABELV $348
line 661
;660:
;661:if( headName[0] == '*' ) {
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $360
line 662
;662:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $362
ARGP4
ADDRLP4 268
ADDRFP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 663
;663:	}
ADDRGP4 $361
JUMPV
LABELV $360
line 664
;664:	else {
line 665
;665:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $363
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 666
;666:	}
LABELV $361
line 668
;667:
;668:	ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 670
;669:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;670:	if ( !ci->headModel && headName[0] != '*' ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $364
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $364
line 671
;671:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $362
ARGP4
ADDRLP4 272
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 672
;672:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 276
INDIRI4
ASGNI4
line 673
;673:	}
LABELV $364
line 674
;674:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $366
line 675
;675:		Com_sprintf( filename, sizeof( filename ), "models/players2/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $368
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 676
;676:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 678
;677:		
;678:		if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $369
line 679
;679:			Com_Printf( "CG_RegisterClientModelname: Failed to load model file %s\n", filename );
ADDRGP4 $359
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 680
;680:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $369
line 682
;681:		}
;682:	}
LABELV $366
line 685
;683:
;684:	// if any skins failed to load, return failure
;685:	if ( !CG_RegisterClientSkin( ci, teamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $371
line 686
;686:		if ( teamName && *teamName) {
ADDRLP4 276
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $373
ADDRLP4 276
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $373
line 687
;687:			Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $375
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 688
;688:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $376
line 689
;689:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $378
ARGP4
ADDRGP4 $379
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 690
;690:			}
ADDRGP4 $377
JUMPV
LABELV $376
line 691
;691:			else {
line 692
;692:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $378
ARGP4
ADDRGP4 $380
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 693
;693:			}
LABELV $377
line 694
;694:			if ( !CG_RegisterClientSkin( ci, newTeamName, modelName, skinName, headName, headSkinName ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $374
line 695
;695:				Com_Printf( "CG_RegisterClientModelname: Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $383
ARGP4
ADDRLP4 132
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 696
;696:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
line 698
;697:			}
;698:		} else {
LABELV $373
line 699
;699:			Com_Printf( "CG_RegisterClientModelname: Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName );
ADDRGP4 $384
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 700
;700:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $374
line 702
;701:		}
;702:	}
LABELV $371
line 705
;703:
;704:	// load the animations
;705:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $385
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 706
;706:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $386
line 707
;707:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $388
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 708
;708:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $389
line 709
;709:			Com_sprintf( filename, sizeof( filename ), "models/players2/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $391
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 710
;710:			if ( !CG_ParseAnimationFile( filename, ci ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $392
line 711
;711:				Com_Printf( "CG_RegisterClientModelname: Failed to load animation file %s\n", filename );
ADDRGP4 $394
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 712
;712:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $392
line 714
;713:			}
;714:		}
LABELV $389
line 715
;715:	}
LABELV $386
line 717
;716:
;717:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 $311
ARGP4
ADDRLP4 280
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $395
line 718
;718:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 719
;719:	}
ADDRGP4 $396
JUMPV
LABELV $395
line 720
;720:	else if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga" ) ) {
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 $400
ARGP4
ADDRLP4 284
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $398
line 721
;721:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 722
;722:	}
LABELV $398
LABELV $396
line 724
;723:
;724:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $401
line 725
;725:		Com_Printf( "CG_RegisterClientModelname: Failed to modelIcon %s\n", filename );
ADDRGP4 $403
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 726
;726:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $331
JUMPV
LABELV $401
line 729
;727:	}
;728:
;729:	return qtrue;
CNSTI4 1
RETI4
LABELV $331
endproc CG_RegisterClientModelname 292 32
proc CG_ColorFromString 20 4
line 737
;730:}
;731:
;732:/*
;733:====================
;734:CG_ColorFromString
;735:====================
;736:*/
;737:static void CG_ColorFromString( const char *v, vec3_t color ) {
line 740
;738:	int val;
;739:
;740:	VectorClear( color );
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 742
;741:
;742:	val = atoi( v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 744
;743:
;744:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $407
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $405
LABELV $407
line 745
;745:		VectorSet( color, 1, 1, 1 );
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 746
;746:		return;
ADDRGP4 $404
JUMPV
LABELV $405
line 749
;747:	}
;748:
;749:	if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $408
line 750
;750:		color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 751
;751:	}
LABELV $408
line 752
;752:	if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $410
line 753
;753:		color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 754
;754:	}
LABELV $410
line 755
;755:	if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $412
line 756
;756:		color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 757
;757:	}
LABELV $412
line 758
;758:}
LABELV $404
endproc CG_ColorFromString 20 4
proc CG_LoadClientInfo 156 24
line 768
;759:
;760:/*
;761:===================
;762:CG_LoadClientInfo
;763:
;764:Load it now, taking the disk hits.
;765:This will usually be deferred to a safe time
;766:===================
;767:*/
;768:static void CG_LoadClientInfo( clientInfo_t *ci ) {
line 779
;769:	const char	*dir, *fallback;
;770:	int			i, modelloaded;
;771:	const char	*s;
;772:	int			clientNum;
;773:	char		teamname[MAX_QPATH];
;774://	char		*filename;
;775://	char		temp_string[200];
;776://	qboolean	noMoreTaunts; //, loadingTaunt;
;777:	int			y;
;778:
;779:	teamname[0] = 0;
ADDRLP4 20
CNSTI1 0
ASGNI1
line 792
;780:#ifdef MISSIONPACK
;781:	if( cgs.gametype >= GT_TEAM) {
;782:		if( ci->team == TEAM_BLUE ) {
;783:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
;784:		} else {
;785:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
;786:		}
;787:	}
;788:	if( teamname[0] ) {
;789:		strcat( teamname, "/" );
;790:	}
;791:#endif
;792:	modelloaded = qtrue;
ADDRLP4 84
CNSTI4 1
ASGNI4
line 793
;793:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname ) ) {
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 296
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 360
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 96
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $415
line 794
;794:		if ( cg_buildScript.integer ) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $417
line 795
;795:			CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
ADDRGP4 $420
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 296
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 360
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 796
;796:		}
LABELV $417
line 799
;797:
;798:		// fall back to default team name
;799:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $421
line 801
;800:			// keep skin name
;801:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $424
line 802
;802:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 20
ARGP4
ADDRGP4 $379
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 803
;803:			} else {
ADDRGP4 $425
JUMPV
LABELV $424
line 804
;804:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 20
ARGP4
ADDRGP4 $380
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 805
;805:			}
LABELV $425
line 806
;806:			if ( !CG_RegisterClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, DEFAULT_TEAM_HEAD, ci->skinName, teamname ) ) {
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 $428
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRLP4 100
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 112
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $422
line 807
;807:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_TEAM_MODEL, ci->skinName );
ADDRGP4 $429
ARGP4
ADDRGP4 $428
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 808
;808:			}
line 809
;809:		} else {
ADDRGP4 $422
JUMPV
LABELV $421
line 810
;810:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 $428
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 $123
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 108
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $430
line 811
;811:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $432
ARGP4
ADDRGP4 $428
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 812
;812:			}
LABELV $430
line 813
;813:		}
LABELV $422
line 814
;814:		modelloaded = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 815
;815:	}
LABELV $415
line 817
;816:
;817:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 818
;818:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 0
EQI4 $433
line 821
;819:		orientation_t tag;
;820:		// if the torso model has the "tag_flag"
;821:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 100
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ARGI4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ARGI4
ADDRLP4 148
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $437
ARGP4
ADDRLP4 152
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $435
line 822
;822:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 823
;823:		}
LABELV $435
line 824
;824:	}
LABELV $433
line 827
;825:
;826:	// sounds
;827:	dir = ci->modelName;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
line 828
;828:	fallback = (cgs.gametype >= GT_TEAM) ? DEFAULT_TEAM_MODEL : DEFAULT_MODEL;
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $440
ADDRLP4 100
ADDRGP4 $428
ASGNP4
ADDRGP4 $441
JUMPV
LABELV $440
ADDRLP4 100
ADDRGP4 $428
ASGNP4
LABELV $441
ADDRLP4 88
ADDRLP4 100
INDIRP4
ASGNP4
line 830
;829:
;830:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $442
line 831
;831:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 832
;832:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $446
line 833
;833:			break;
ADDRGP4 $444
JUMPV
LABELV $446
line 836
;834:		}
;835:
;836:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1592
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 837
;837:		if (CG_FileExists(va("sound/player/%s/%s", dir, s + 1)))
ADDRGP4 $450
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $448
line 838
;838:		{
line 839
;839:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $450
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1592
ADDP4
ADDP4
ADDRLP4 116
INDIRI4
ASGNI4
line 840
;840:		} 
ADDRGP4 $449
JUMPV
LABELV $448
line 842
;841:		else
;842:		{
line 843
;843:			ci->sounds[i] = trap_S_RegisterSound( va("sound/voice/%s/misc/%s", dir, s + 1), qtrue );
ADDRGP4 $451
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 116
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1592
ADDP4
ADDP4
ADDRLP4 116
INDIRI4
ASGNI4
line 844
;844:		}
LABELV $449
line 847
;845:				
;846:		
;847:	y=i;
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
line 848
;848:	}
LABELV $443
line 830
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 36
LTI4 $442
LABELV $444
line 851
;849:
;850:
;851:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 0
ASGNI4
line 855
;852:
;853:	// reset any existing players and bodies, because they might be in bad
;854:	// frames for this new model
;855:	clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+40972
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1740
DIVI4
ASGNI4
line 856
;856:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $453
line 857
;857:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 104
CNSTI4 740
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $457
ADDRLP4 104
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $457
line 858
;858:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 859
;859:			CG_ResetPlayerEntity( &cg_entities[i] );
CNSTI4 740
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 860
;860:		}
LABELV $457
line 861
;861:	}
LABELV $454
line 856
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $453
line 862
;862:}
LABELV $414
endproc CG_LoadClientInfo 156 24
proc CG_CopyClientInfoModel 56 12
line 869
;863:
;864:/*
;865:======================
;866:CG_CopyClientInfoModel
;867:======================
;868:*/
;869:static void CG_CopyClientInfoModel( clientInfo_t *from, clientInfo_t *to ) {
line 870
;870:	VectorCopy( from->headOffset, to->headOffset );
ADDRLP4 0
CNSTI4 504
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 871
;871:	to->footsteps = from->footsteps;
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 872
;872:	to->gender = from->gender;
ADDRLP4 8
CNSTI4 520
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 873
;873:	to->numTaunts = from->numTaunts;
ADDRLP4 12
CNSTI4 1736
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 875
;874:
;875:	to->legsModel = from->legsModel;
ADDRLP4 16
CNSTI4 528
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 876
;876:	to->legsSkin = from->legsSkin;
ADDRLP4 20
CNSTI4 532
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 877
;877:	to->torsoModel = from->torsoModel;
ADDRLP4 24
CNSTI4 536
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 878
;878:	to->torsoSkin = from->torsoSkin;
ADDRLP4 28
CNSTI4 540
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 879
;879:	to->headModel = from->headModel;
ADDRLP4 32
CNSTI4 544
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 880
;880:	to->headSkin = from->headSkin;
ADDRLP4 36
CNSTI4 548
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 881
;881:	to->modelIcon = from->modelIcon;
ADDRLP4 40
CNSTI4 552
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 883
;882:
;883:	to->newAnims = from->newAnims;
ADDRLP4 44
CNSTI4 492
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 885
;884:
;885:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
ADDRLP4 48
CNSTI4 556
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 886
;886:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRLP4 52
CNSTI4 1592
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 887
;887:}
LABELV $461
endproc CG_CopyClientInfoModel 56 12
proc CG_ScanForExistingClientInfo 60 8
line 894
;888:
;889:/*
;890:======================
;891:CG_ScanForExistingClientInfo
;892:======================
;893:*/
;894:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 898
;895:	int		i;
;896:	clientInfo_t	*match;
;897:
;898:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $466
JUMPV
LABELV $463
line 899
;899:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 900
;900:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $469
line 901
;901:			continue;
ADDRGP4 $464
JUMPV
LABELV $469
line 903
;902:		}
;903:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $471
line 904
;904:			continue;
ADDRGP4 $464
JUMPV
LABELV $471
line 906
;905:		}
;906:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $473
ADDRLP4 16
CNSTI4 232
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $473
ADDRLP4 24
CNSTI4 296
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $473
ADDRLP4 32
CNSTI4 360
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $473
ADDRLP4 40
CNSTI4 456
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $473
ADDRLP4 48
CNSTI4 424
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $473
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $476
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
NEI4 $473
LABELV $476
line 912
;907:			&& !Q_stricmp( ci->skinName, match->skinName )
;908:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;909:			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;910:			&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;911:			&& !Q_stricmp( ci->redTeam, match->redTeam )
;912:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) ) {
line 915
;913:			// this clientinfo is identical, so use it's handles
;914:
;915:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 0
ASGNI4
line 917
;916:
;917:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 919
;918:
;919:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $462
JUMPV
LABELV $473
line 921
;920:		}
;921:	}
LABELV $464
line 898
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $466
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $463
line 924
;922:
;923:	// nothing matches, so defer the load
;924:	return qfalse;
CNSTI4 0
RETI4
LABELV $462
endproc CG_ScanForExistingClientInfo 60 8
proc CG_SetDeferredClientInfo 36 8
line 935
;925:}
;926:
;927:/*
;928:======================
;929:CG_SetDeferredClientInfo
;930:
;931:We aren't going to load it now, so grab some other
;932:client's info to use until we have some spare time.
;933:======================
;934:*/
;935:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 941
;936:	int		i;
;937:	clientInfo_t	*match;
;938:
;939:	// if someone else is already the same models and skins we
;940:	// can just load the client info
;941:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $478
line 942
;942:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 943
;943:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $486
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $484
LABELV $486
line 944
;944:			continue;
ADDRGP4 $479
JUMPV
LABELV $484
line 946
;945:		}
;946:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 232
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $491
ADDRLP4 24
CNSTI4 168
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $491
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $487
ADDRLP4 32
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $487
LABELV $491
line 950
;947:			 Q_stricmp( ci->modelName, match->modelName ) ||
;948://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;949://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;950:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 951
;951:			continue;
ADDRGP4 $479
JUMPV
LABELV $487
line 954
;952:		}
;953:		// just load the real info cause it uses the same models and skins
;954:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 955
;955:		return;
ADDRGP4 $477
JUMPV
LABELV $479
line 941
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $481
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $478
line 959
;956:	}
;957:
;958:	// if we are in teamplay, only grab a model if the skin is correct
;959:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $492
line 960
;960:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 961
;961:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 962
;962:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $503
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $501
LABELV $503
line 963
;963:				continue;
ADDRGP4 $496
JUMPV
LABELV $501
line 965
;964:			}
;965:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 232
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $507
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $504
ADDRLP4 24
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
EQI4 $504
LABELV $507
line 966
;966:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 967
;967:				continue;
ADDRGP4 $496
JUMPV
LABELV $504
line 969
;968:			}
;969:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 1
ASGNI4
line 970
;970:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 971
;971:			return;
ADDRGP4 $477
JUMPV
LABELV $496
line 960
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $498
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $495
line 977
;972:		}
;973:		// load the full model, because we don't ever want to show
;974:		// an improper team skin.  This will cause a hitch for the first
;975:		// player, when the second enters.  Combat shouldn't be going on
;976:		// yet, so it shouldn't matter
;977:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 978
;978:		return;
ADDRGP4 $477
JUMPV
LABELV $492
line 982
;979:	}
;980:
;981:	// find the first valid clientinfo and grab its stuff
;982:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 983
;983:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 984
;984:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $514
line 985
;985:			continue;
ADDRGP4 $509
JUMPV
LABELV $514
line 988
;986:		}
;987:
;988:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 1
ASGNI4
line 989
;989:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 990
;990:		return;
ADDRGP4 $477
JUMPV
LABELV $509
line 982
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $508
line 994
;991:	}
;992:
;993:	// we should never get here...
;994:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $516
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 996
;995:
;996:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 997
;997:}
LABELV $477
endproc CG_SetDeferredClientInfo 36 8
export CG_NewClientInfo
proc CG_NewClientInfo 1920 12
line 1005
;998:
;999:
;1000:/*
;1001:======================
;1002:CG_NewClientInfo
;1003:======================
;1004:*/
;1005:void CG_NewClientInfo( int clientNum ) {
line 1012
;1006:	clientInfo_t *ci;
;1007:	clientInfo_t newInfo;
;1008:	const char	*configstring;
;1009:	const char	*v;
;1010:	char		*slash;
;1011:
;1012:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1752
CNSTI4 1740
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1014
;1013:
;1014:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1756
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1744
ADDRLP4 1756
INDIRP4
ASGNP4
line 1015
;1015:	if ( !configstring[0] ) {
ADDRLP4 1744
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $519
line 1016
;1016:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 1752
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1740
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1017
;1017:		return;		// player just left
ADDRGP4 $517
JUMPV
LABELV $519
line 1022
;1018:	}
;1019:
;1020:	// build into a temp buffer so the defer checks can use
;1021:	// the old value
;1022:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1740
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1025
;1023:
;1024:	// isolate the player's name
;1025:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 1760
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1760
INDIRP4
ASGNP4
line 1026
;1026:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 0+4
ARGP4
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1029
;1027:
;1028:	// colors
;1029:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1764
INDIRP4
ASGNP4
line 1030
;1030:	CG_ColorFromString( v, newInfo.color1 );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 0+76
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 1032
;1031:
;1032:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $526
ARGP4
ADDRLP4 1768
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1768
INDIRP4
ASGNP4
line 1033
;1033:	CG_ColorFromString( v, newInfo.color2 );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 0+88
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 1036
;1034:
;1035:	// bot skill
;1036:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $528
ARGP4
ADDRLP4 1772
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1772
INDIRP4
ASGNP4
line 1037
;1037:	newInfo.botSkill = atoi( v );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1776
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+72
ADDRLP4 1776
INDIRI4
ASGNI4
line 1040
;1038:
;1039:	// handicap
;1040:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $530
ARGP4
ADDRLP4 1780
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1780
INDIRP4
ASGNP4
line 1041
;1041:	newInfo.handicap = atoi( v );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1784
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+120
ADDRLP4 1784
INDIRI4
ASGNI4
line 1044
;1042:
;1043:	// wins
;1044:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $532
ARGP4
ADDRLP4 1788
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1788
INDIRP4
ASGNP4
line 1045
;1045:	newInfo.wins = atoi( v );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1792
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+124
ADDRLP4 1792
INDIRI4
ASGNI4
line 1048
;1046:
;1047:	// losses
;1048:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 1796
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1796
INDIRP4
ASGNP4
line 1049
;1049:	newInfo.losses = atoi( v );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1800
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+128
ADDRLP4 1800
INDIRI4
ASGNI4
line 1052
;1050:
;1051:	// team
;1052:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 1804
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1804
INDIRP4
ASGNP4
line 1053
;1053:	newInfo.team = atoi( v );
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1808
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+68
ADDRLP4 1808
INDIRI4
ASGNI4
line 1056
;1054:
;1055:	// team task
;1056:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 1812
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1812
INDIRP4
ASGNP4
line 1057
;1057:	newInfo.teamTask = atoi(v);
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1816
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+132
ADDRLP4 1816
INDIRI4
ASGNI4
line 1060
;1058:
;1059:	// team leader
;1060:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $540
ARGP4
ADDRLP4 1820
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1820
INDIRP4
ASGNP4
line 1061
;1061:	newInfo.teamLeader = atoi(v);
ADDRLP4 1740
INDIRP4
ARGP4
ADDRLP4 1824
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+136
ADDRLP4 1824
INDIRI4
ASGNI4
line 1063
;1062:
;1063:	v = Info_ValueForKey( configstring, "g_redteam" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 1828
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1828
INDIRP4
ASGNP4
line 1064
;1064:	Q_strncpyz(newInfo.redTeam, v, MAX_TEAMNAME);
ADDRLP4 0+424
ARGP4
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1066
;1065:
;1066:	v = Info_ValueForKey( configstring, "g_blueteam" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 1832
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1832
INDIRP4
ASGNP4
line 1067
;1067:	Q_strncpyz(newInfo.blueTeam, v, MAX_TEAMNAME);
ADDRLP4 0+456
ARGP4
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1070
;1068:
;1069:	// model
;1070:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 1836
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1836
INDIRP4
ASGNP4
line 1071
;1071:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $547
line 1077
;1072:		// forcemodel makes everyone use a single model
;1073:		// to prevent load hitches
;1074:		char modelStr[MAX_QPATH];
;1075:		char *skin;
;1076:
;1077:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $550
line 1078
;1078:			Q_strncpyz( newInfo.modelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.modelName ) );
ADDRLP4 0+168
ARGP4
ADDRGP4 $428
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1079
;1079:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 0+232
ARGP4
ADDRGP4 $123
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1080
;1080:		} else {
ADDRGP4 $551
JUMPV
LABELV $550
line 1081
;1081:			trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $546
ARGP4
ADDRLP4 1840
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1082
;1082:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 1840
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1908
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1904
ADDRLP4 1908
INDIRP4
ASGNP4
ADDRLP4 1908
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $557
line 1083
;1083:				skin = "default";
ADDRLP4 1904
ADDRGP4 $123
ASGNP4
line 1084
;1084:			} else {
ADDRGP4 $558
JUMPV
LABELV $557
line 1085
;1085:				*skin++ = 0;
ADDRLP4 1912
ADDRLP4 1904
INDIRP4
ASGNP4
ADDRLP4 1904
ADDRLP4 1912
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1912
INDIRP4
CNSTI1 0
ASGNI1
line 1086
;1086:			}
LABELV $558
line 1088
;1087:
;1088:			Q_strncpyz( newInfo.skinName, skin, sizeof( newInfo.skinName ) );
ADDRLP4 0+232
ARGP4
ADDRLP4 1904
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1089
;1089:			Q_strncpyz( newInfo.modelName, modelStr, sizeof( newInfo.modelName ) );
ADDRLP4 0+168
ARGP4
ADDRLP4 1840
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1090
;1090:		}
LABELV $551
line 1092
;1091:
;1092:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $548
line 1094
;1093:			// keep skin name
;1094:			slash = strchr( v, '/' );
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1908
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1748
ADDRLP4 1908
INDIRP4
ASGNP4
line 1095
;1095:			if ( slash ) {
ADDRLP4 1748
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $548
line 1096
;1096:				Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 0+232
ARGP4
ADDRLP4 1748
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1097
;1097:			}
line 1098
;1098:		}
line 1099
;1099:	} else {
ADDRGP4 $548
JUMPV
LABELV $547
line 1100
;1100:		Q_strncpyz( newInfo.modelName, v, sizeof( newInfo.modelName ) );
ADDRLP4 0+168
ARGP4
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1102
;1101:
;1102:		slash = strchr( newInfo.modelName, '/' );
ADDRLP4 0+168
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1840
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1748
ADDRLP4 1840
INDIRP4
ASGNP4
line 1103
;1103:		if ( !slash ) {
ADDRLP4 1748
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $573
line 1105
;1104:			// modelName didn not include a skin name
;1105:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 0+232
ARGP4
ADDRGP4 $123
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1106
;1106:		} else {
ADDRGP4 $574
JUMPV
LABELV $573
line 1107
;1107:			Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 0+232
ARGP4
ADDRLP4 1748
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1109
;1108:			// truncate modelName
;1109:			*slash = 0;
ADDRLP4 1748
INDIRP4
CNSTI1 0
ASGNI1
line 1110
;1110:		}
LABELV $574
line 1111
;1111:	}
LABELV $548
line 1114
;1112:
;1113:	// head model
;1114:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1744
INDIRP4
ARGP4
ADDRGP4 $579
ARGP4
ADDRLP4 1840
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1740
ADDRLP4 1840
INDIRP4
ASGNP4
line 1115
;1115:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $580
line 1121
;1116:		// forcemodel makes everyone use a single model
;1117:		// to prevent load hitches
;1118:		char modelStr[MAX_QPATH];
;1119:		char *skin;
;1120:
;1121:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $583
line 1122
;1122:			Q_strncpyz( newInfo.headModelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.headModelName ) );
ADDRLP4 0+296
ARGP4
ADDRGP4 $428
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1123
;1123:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 0+360
ARGP4
ADDRGP4 $123
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1124
;1124:		} else {
ADDRGP4 $584
JUMPV
LABELV $583
line 1125
;1125:			trap_Cvar_VariableStringBuffer( "headmodel", modelStr, sizeof( modelStr ) );
ADDRGP4 $590
ARGP4
ADDRLP4 1844
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1126
;1126:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 1844
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1912
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1908
ADDRLP4 1912
INDIRP4
ASGNP4
ADDRLP4 1912
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $591
line 1127
;1127:				skin = "default";
ADDRLP4 1908
ADDRGP4 $123
ASGNP4
line 1128
;1128:			} else {
ADDRGP4 $592
JUMPV
LABELV $591
line 1129
;1129:				*skin++ = 0;
ADDRLP4 1916
ADDRLP4 1908
INDIRP4
ASGNP4
ADDRLP4 1908
ADDRLP4 1916
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1916
INDIRP4
CNSTI1 0
ASGNI1
line 1130
;1130:			}
LABELV $592
line 1132
;1131:
;1132:			Q_strncpyz( newInfo.headSkinName, skin, sizeof( newInfo.headSkinName ) );
ADDRLP4 0+360
ARGP4
ADDRLP4 1908
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1133
;1133:			Q_strncpyz( newInfo.headModelName, modelStr, sizeof( newInfo.headModelName ) );
ADDRLP4 0+296
ARGP4
ADDRLP4 1844
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1134
;1134:		}
LABELV $584
line 1136
;1135:
;1136:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $581
line 1138
;1137:			// keep skin name
;1138:			slash = strchr( v, '/' );
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1912
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1748
ADDRLP4 1912
INDIRP4
ASGNP4
line 1139
;1139:			if ( slash ) {
ADDRLP4 1748
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $581
line 1140
;1140:				Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
ADDRLP4 0+360
ARGP4
ADDRLP4 1748
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1141
;1141:			}
line 1142
;1142:		}
line 1143
;1143:	} else {
ADDRGP4 $581
JUMPV
LABELV $580
line 1144
;1144:		Q_strncpyz( newInfo.headModelName, v, sizeof( newInfo.headModelName ) );
ADDRLP4 0+296
ARGP4
ADDRLP4 1740
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1146
;1145:
;1146:		slash = strchr( newInfo.headModelName, '/' );
ADDRLP4 0+296
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1844
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1748
ADDRLP4 1844
INDIRP4
ASGNP4
line 1147
;1147:		if ( !slash ) {
ADDRLP4 1748
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $607
line 1149
;1148:			// modelName didn not include a skin name
;1149:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 0+360
ARGP4
ADDRGP4 $123
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1150
;1150:		} else {
ADDRGP4 $608
JUMPV
LABELV $607
line 1151
;1151:			Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
ADDRLP4 0+360
ARGP4
ADDRLP4 1748
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1153
;1152:			// truncate modelName
;1153:			*slash = 0;
ADDRLP4 1748
INDIRP4
CNSTI1 0
ASGNI1
line 1154
;1154:		}
LABELV $608
line 1155
;1155:	}
LABELV $581
line 1159
;1156:
;1157:	// scan for an existing clientinfo that matches this modelname
;1158:	// so we can avoid loading checks if possible
;1159:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1844
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1844
INDIRI4
CNSTI4 0
NEI4 $613
line 1162
;1160:		qboolean	forceDefer;
;1161:
;1162:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1856
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1856
INDIRI4
CNSTI4 4000000
GEI4 $616
ADDRLP4 1852
CNSTI4 1
ASGNI4
ADDRGP4 $617
JUMPV
LABELV $616
ADDRLP4 1852
CNSTI4 0
ASGNI4
LABELV $617
ADDRLP4 1848
ADDRLP4 1852
INDIRI4
ASGNI4
line 1165
;1163:
;1164:		// if we are defering loads, just have it pick the first valid
;1165:		if ( forceDefer || (cg_deferPlayers.integer && !cg_buildScript.integer && !cg.loading ) ) {
ADDRLP4 1860
CNSTI4 0
ASGNI4
ADDRLP4 1848
INDIRI4
ADDRLP4 1860
INDIRI4
NEI4 $623
ADDRGP4 cg_deferPlayers+12
INDIRI4
ADDRLP4 1860
INDIRI4
EQI4 $618
ADDRGP4 cg_buildScript+12
INDIRI4
ADDRLP4 1860
INDIRI4
NEI4 $618
ADDRGP4 cg+20
INDIRI4
ADDRLP4 1860
INDIRI4
NEI4 $618
LABELV $623
line 1167
;1166:			// keep whatever they had if it won't violate team skins
;1167:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1169
;1168:			// if we are low on memory, leave them with this model
;1169:			if ( forceDefer ) {
ADDRLP4 1848
INDIRI4
CNSTI4 0
EQI4 $619
line 1170
;1170:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $626
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1171
;1171:				newInfo.deferred = qfalse;
ADDRLP4 0+488
CNSTI4 0
ASGNI4
line 1172
;1172:			}
line 1173
;1173:		} else {
ADDRGP4 $619
JUMPV
LABELV $618
line 1174
;1174:			CG_LoadClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1175
;1175:		}
LABELV $619
line 1176
;1176:	}
LABELV $613
line 1179
;1177:
;1178:	// replace whatever was there with the new one
;1179:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1180
;1180:	*ci = newInfo;
ADDRLP4 1752
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1740
line 1181
;1181:}
LABELV $517
endproc CG_NewClientInfo 1920 12
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 20 4
line 1194
;1182:
;1183:
;1184:
;1185:/*
;1186:======================
;1187:CG_LoadDeferredPlayers
;1188:
;1189:Called each frame when a player is dead
;1190:and the scoreboard is up
;1191:so deferred players can be loaded
;1192:======================
;1193:*/
;1194:void CG_LoadDeferredPlayers( void ) {
line 1199
;1195:	int		i;
;1196:	clientInfo_t	*ci;
;1197:
;1198:	// scan for a deferred player to load
;1199:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+40972
ASGNP4
ADDRGP4 $632
JUMPV
LABELV $629
line 1200
;1200:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $635
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $635
line 1202
;1201:			// if we are low on memory, leave it deferred
;1202:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 16
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4000000
GEI4 $637
line 1203
;1203:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $626
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1204
;1204:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 0
ASGNI4
line 1205
;1205:				continue;
ADDRGP4 $630
JUMPV
LABELV $637
line 1207
;1206:			}
;1207:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1209
;1208://			break;
;1209:		}
LABELV $635
line 1210
;1210:	}
LABELV $630
line 1199
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1740
ADDP4
ASGNP4
LABELV $632
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $629
line 1211
;1211:}
LABELV $628
endproc CG_LoadDeferredPlayers 20 4
proc CG_SetLerpFrameAnimation 12 8
line 1229
;1212:
;1213:/*
;1214:=============================================================================
;1215:
;1216:PLAYER ANIMATION
;1217:
;1218:=============================================================================
;1219:*/
;1220:
;1221:
;1222:/*
;1223:===============
;1224:CG_SetLerpFrameAnimation
;1225:
;1226:may include ANIM_TOGGLEBIT
;1227:===============
;1228:*/
;1229:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1232
;1230:	animation_t	*anim;
;1231:
;1232:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1233
;1233:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1235
;1234:
;1235:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $642
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $640
LABELV $642
line 1236
;1236:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $643
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1237
;1237:	}
LABELV $640
line 1239
;1238:
;1239:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDP4
ASGNP4
line 1241
;1240:
;1241:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1242
;1242:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1244
;1243:
;1244:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $644
line 1245
;1245:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $647
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1246
;1246:	}
LABELV $644
line 1247
;1247:}
LABELV $639
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 44 12
line 1257
;1248:
;1249:/*
;1250:===============
;1251:CG_RunLerpFrame
;1252:
;1253:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1254:cg.time should be between oldFrameTime and frameTime after exit
;1255:===============
;1256:*/
;1257:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1262
;1258:	int			f, numFrames;
;1259:	animation_t	*anim;
;1260:
;1261:	// debugging tool to get no animations
;1262:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $649
line 1263
;1263:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1264
;1264:		return;
ADDRGP4 $648
JUMPV
LABELV $649
line 1268
;1265:	}
;1266:
;1267:	// see if the animation sequence is switching
;1268:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $654
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $652
LABELV $654
line 1269
;1269:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1270
;1270:	}
LABELV $652
line 1274
;1271:
;1272:	// if we have passed the current frame, move it to
;1273:	// oldFrame and calculate a new frame
;1274:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $655
line 1275
;1275:		lf->oldFrame = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1276
;1276:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1279
;1277:
;1278:		// get the next frame based on the animation
;1279:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1280
;1280:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $658
line 1281
;1281:			return;		// shouldn't happen
ADDRGP4 $648
JUMPV
LABELV $658
line 1283
;1282:		}
;1283:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $660
line 1284
;1284:			lf->frameTime = lf->animationTime;		// initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1285
;1285:		} else {
ADDRGP4 $661
JUMPV
LABELV $660
line 1286
;1286:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 12
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1287
;1287:		}
LABELV $661
line 1288
;1288:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 12
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1289
;1289:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1291
;1290:
;1291:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1292
;1292:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $663
line 1293
;1293:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1294
;1294:		}
LABELV $663
line 1295
;1295:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $665
line 1296
;1296:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1297
;1297:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $667
line 1298
;1298:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 1299
;1299:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1300
;1300:			} else {
ADDRGP4 $668
JUMPV
LABELV $667
line 1301
;1301:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1304
;1302:				// the animation is stuck at the end, so it
;1303:				// can immediately transition to another sequence
;1304:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1305
;1305:			}
LABELV $668
line 1306
;1306:		}
LABELV $665
line 1307
;1307:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $670
line 1308
;1308:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1309
;1309:		}
ADDRGP4 $671
JUMPV
LABELV $670
line 1310
;1310:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $672
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $672
line 1311
;1311:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
MODI4
SUBI4
ASGNI4
line 1312
;1312:		}
ADDRGP4 $673
JUMPV
LABELV $672
line 1313
;1313:		else {
line 1314
;1314:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1315
;1315:		}
LABELV $673
LABELV $671
line 1316
;1316:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $674
line 1317
;1317:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1318
;1318:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $678
line 1319
;1319:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $681
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1320
;1320:			}
LABELV $678
line 1321
;1321:		}
LABELV $674
line 1322
;1322:	}
LABELV $655
line 1324
;1323:
;1324:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
CNSTI4 200
ADDI4
LEI4 $682
line 1325
;1325:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1326
;1326:	}
LABELV $682
line 1328
;1327:
;1328:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
LEI4 $686
line 1329
;1329:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1330
;1330:	}
LABELV $686
line 1332
;1331:	// calculate current lerp value
;1332:	if ( lf->frameTime == lf->oldFrameTime ) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $690
line 1333
;1333:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1334
;1334:	} else {
ADDRGP4 $691
JUMPV
LABELV $690
line 1335
;1335:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+109652
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1336
;1336:	}
LABELV $691
line 1337
;1337:}
LABELV $648
endproc CG_RunLerpFrame 44 12
proc CG_ClearLerpFrame 16 12
line 1345
;1338:
;1339:
;1340:/*
;1341:===============
;1342:CG_ClearLerpFrame
;1343:===============
;1344:*/
;1345:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1346
;1346:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1347
;1347:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1348
;1348:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1349
;1349:}
LABELV $693
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1358
;1350:
;1351:
;1352:/*
;1353:===============
;1354:CG_PlayerAnimation
;1355:===============
;1356:*/
;1357:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1358:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1363
;1359:	clientInfo_t	*ci;
;1360:	int				clientNum;
;1361:	float			speedScale;
;1362:
;1363:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1365
;1364:
;1365:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $696
line 1366
;1366:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1367
;1367:		return;
ADDRGP4 $695
JUMPV
LABELV $696
line 1370
;1368:	}
;1369:
;1370:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $699
line 1371
;1371:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1372
;1372:	} else {
ADDRGP4 $700
JUMPV
LABELV $699
line 1373
;1373:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1374
;1374:	}
LABELV $700
line 1376
;1375:
;1376:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 1740
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1379
;1377:
;1378:	// do the shuffle turn frames locally
;1379:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $702
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $702
line 1380
;1380:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1381
;1381:	} else {
ADDRGP4 $703
JUMPV
LABELV $702
line 1382
;1382:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1383
;1383:	}
LABELV $703
line 1385
;1384:
;1385:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1386
;1386:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1387
;1387:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ASGNF4
line 1389
;1388:
;1389:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1391
;1390:
;1391:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1392
;1392:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 1393
;1393:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 1394
;1394:}
LABELV $695
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1410
;1395:
;1396:/*
;1397:=============================================================================
;1398:
;1399:PLAYER ANGLES
;1400:
;1401:=============================================================================
;1402:*/
;1403:
;1404:/*
;1405:==================
;1406:CG_SwingAngles
;1407:==================
;1408:*/
;1409:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1410:					float speed, float *angle, qboolean *swinging ) {
line 1415
;1411:	float	swing;
;1412:	float	move;
;1413:	float	scale;
;1414:
;1415:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $705
line 1417
;1416:		// see if a swing should be started
;1417:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1418
;1418:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $709
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $707
LABELV $709
line 1419
;1419:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1420
;1420:		}
LABELV $707
line 1421
;1421:	}
LABELV $705
line 1423
;1422:
;1423:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $710
line 1424
;1424:		return;
ADDRGP4 $704
JUMPV
LABELV $710
line 1429
;1425:	}
;1426:	
;1427:	// modify the speed depending on the delta
;1428:	// so it doesn't seem so linear
;1429:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1430
;1430:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1431
;1431:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $712
line 1432
;1432:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1433
;1433:	} else if ( scale < swingTolerance ) {
ADDRGP4 $713
JUMPV
LABELV $712
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $714
line 1434
;1434:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1435
;1435:	} else {
ADDRGP4 $715
JUMPV
LABELV $714
line 1436
;1436:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1437
;1437:	}
LABELV $715
LABELV $713
line 1440
;1438:
;1439:	// swing towards the destination angle
;1440:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $716
line 1441
;1441:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+109648
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1442
;1442:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $719
line 1443
;1443:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1444
;1444:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1445
;1445:		}
LABELV $719
line 1446
;1446:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1447
;1447:	} else if ( swing < 0 ) {
ADDRGP4 $717
JUMPV
LABELV $716
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $721
line 1448
;1448:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+109648
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 1449
;1449:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $724
line 1450
;1450:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1451
;1451:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1452
;1452:		}
LABELV $724
line 1453
;1453:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1454
;1454:	}
LABELV $721
LABELV $717
line 1457
;1455:
;1456:	// clamp to no more than tolerance
;1457:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1458
;1458:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $726
line 1459
;1459:		*angle = AngleMod( destination - (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1460
;1460:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $727
JUMPV
LABELV $726
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $728
line 1461
;1461:		*angle = AngleMod( destination + (clampTolerance - 1) );
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1462
;1462:	}
LABELV $728
LABELV $727
line 1463
;1463:}
LABELV $704
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1470
;1464:
;1465:/*
;1466:=================
;1467:CG_AddPainTwitch
;1468:=================
;1469:*/
;1470:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1474
;1471:	int		t;
;1472:	float	f;
;1473:
;1474:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1475
;1475:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $732
line 1476
;1476:		return;
ADDRGP4 $730
JUMPV
LABELV $732
line 1479
;1477:	}
;1478:
;1479:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 1481
;1480:
;1481:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 0
EQI4 $734
line 1482
;1482:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1483
;1483:	} else {
ADDRGP4 $735
JUMPV
LABELV $734
line 1484
;1484:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1485
;1485:	}
LABELV $735
line 1486
;1486:}
LABELV $730
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $737
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 148 24
line 1503
;1487:
;1488:
;1489:/*
;1490:===============
;1491:CG_PlayerAngles
;1492:
;1493:Handles seperate torso motion
;1494:
;1495:  legs pivot based on direction of movement
;1496:
;1497:  head always looks exactly at cent->lerpAngles
;1498:
;1499:  if motion < 20 degrees, show in head only
;1500:  if < 45 degrees, also show in torso
;1501:===============
;1502:*/
;1503:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1512
;1504:	vec3_t		legsAngles, torsoAngles, headAngles;
;1505:	float		dest;
;1506:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1507:	vec3_t		velocity;
;1508:	float		speed;
;1509:	int			dir, clientNum;
;1510:	clientInfo_t	*ci;
;1511:
;1512:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1513
;1513:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 68
INDIRF4
ASGNF4
line 1514
;1514:	VectorClear( legsAngles );
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 72
INDIRF4
ASGNF4
line 1515
;1515:	VectorClear( torsoAngles );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRF4
ASGNF4
line 1520
;1516:
;1517:	// --------- yaw -------------
;1518:
;1519:	// allow yaw to drift a bit
;1520:	if ( ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 -129
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 22
NEI4 $746
ADDRLP4 80
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 11
EQI4 $744
LABELV $746
line 1521
;1521:		|| ( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
line 1523
;1522:		// if not standing still, always point all in the same direction
;1523:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1524
;1524:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1525
;1525:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 1526
;1526:	}
LABELV $744
line 1529
;1527:
;1528:	// adjust legs for movement dir
;1529:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $747
line 1531
;1530:		// don't let dead bodies twitch
;1531:		dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1532
;1532:	} else {
ADDRGP4 $748
JUMPV
LABELV $747
line 1533
;1533:		dir = cent->currentState.angles2[YAW];
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1534
;1534:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $751
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $749
LABELV $751
line 1535
;1535:			CG_Error( "Bad player movement angle" );
ADDRGP4 $752
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1536
;1536:		}
LABELV $749
line 1537
;1537:	}
LABELV $748
line 1538
;1538:	legsAngles[YAW] = headAngles[YAW] + movementOffsets[ dir ];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $737
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1539
;1539:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $737
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1542
;1540:
;1541:	// torso
;1542:	CG_SwingAngles( torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1543
;1543:	CG_SwingAngles( legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
ADDRLP4 12+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1545
;1544:
;1545:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1546
;1546:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ASGNF4
line 1552
;1547:
;1548:
;1549:	// --------- pitch -------------
;1550:
;1551:	// only show a fraction of the pitch angle in the torso
;1552:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $763
line 1553
;1553:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 1554
;1554:	} else {
ADDRGP4 $764
JUMPV
LABELV $763
line 1555
;1555:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1556
;1556:	}
LABELV $764
line 1557
;1557:	CG_SwingAngles( dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 536
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1558
;1558:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ASGNF4
line 1561
;1559:
;1560:	//
;1561:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1562
;1562:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $765
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $765
line 1563
;1563:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
CNSTI4 1740
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1564
;1564:		if ( ci->fixedtorso ) {
ADDRLP4 64
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
EQI4 $768
line 1565
;1565:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1566
;1566:		}
LABELV $768
line 1567
;1567:	}
LABELV $765
line 1573
;1568:
;1569:	// --------- roll -------------
;1570:
;1571:
;1572:	// lean towards the direction of travel
;1573:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1574
;1574:	speed = VectorNormalize( velocity );
ADDRLP4 40
ARGP4
ADDRLP4 104
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 104
INDIRF4
ASGNF4
line 1575
;1575:	if ( speed ) {
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $770
line 1579
;1576:		vec3_t	axis[3];
;1577:		float	side;
;1578:
;1579:		speed *= 0.05f;
ADDRLP4 56
CNSTF4 1028443341
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 1581
;1580:
;1581:		AnglesToAxis( legsAngles, axis );
ADDRLP4 12
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1582
;1582:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 144
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 108+12
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 108+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 108+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1583
;1583:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 144
INDIRF4
SUBF4
ASGNF4
line 1585
;1584:
;1585:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 144
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 108
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 108+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 108+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1586
;1586:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 144
INDIRF4
ADDF4
ASGNF4
line 1587
;1587:	}
LABELV $770
line 1590
;1588:
;1589:	//
;1590:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1591
;1591:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $784
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $784
line 1592
;1592:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
CNSTI4 1740
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1593
;1593:		if ( ci->fixedlegs ) {
ADDRLP4 64
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
EQI4 $787
line 1594
;1594:			legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1595
;1595:			legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1596
;1596:			legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1597
;1597:		}
LABELV $787
line 1598
;1598:	}
LABELV $784
line 1601
;1599:
;1600:	// pain twitch
;1601:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1604
;1602:
;1603:	// pull the angles back out of the hierarchial chain
;1604:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1605
;1605:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1606
;1606:	AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1607
;1607:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1608
;1608:	AnglesToAxis( headAngles, head );
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1609
;1609:}
LABELV $736
endproc CG_PlayerAngles 148 24
proc CG_HasteTrail 40 48
line 1619
;1610:
;1611:
;1612://==========================================================================
;1613:
;1614:/*
;1615:===============
;1616:CG_HasteTrail
;1617:===============
;1618:*/
;1619:static void CG_HasteTrail( centity_t *cent ) {
line 1624
;1620:	localEntity_t	*smoke;
;1621:	vec3_t			origin;
;1622:	int				anim;
;1623:
;1624:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
LEI4 $793
line 1625
;1625:		return;
ADDRGP4 $792
JUMPV
LABELV $793
line 1627
;1626:	}
;1627:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1628
;1628:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $796
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $796
line 1629
;1629:		return;
ADDRGP4 $792
JUMPV
LABELV $796
line 1632
;1630:	}
;1631:
;1632:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1633
;1633:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRGP4 cg+109652
INDIRI4
GEI4 $798
line 1634
;1634:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1635
;1635:	}
LABELV $798
line 1637
;1636:
;1637:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 1638
;1638:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1640
;1639:
;1640:	smoke = CG_SmokePuff( origin, vec3_origin, 
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 cgs+154388+452
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 1650
;1641:				  8, 
;1642:				  1, 1, 1, 1,
;1643:				  500, 
;1644:				  cg.time,
;1645:				  0,
;1646:				  0,
;1647:				  cgs.media.hastePuffShader );
;1648:
;1649:	// use the optimized local entity add
;1650:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1651
;1651:}
LABELV $792
endproc CG_HasteTrail 40 48
proc CG_TrailItem 188 12
line 1746
;1652:
;1653:#ifdef MISSIONPACK
;1654:/*
;1655:===============
;1656:CG_BreathPuffs
;1657:===============
;1658:*/
;1659:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
;1660:	clientInfo_t *ci;
;1661:	vec3_t up, origin;
;1662:	int contents;
;1663:
;1664:	ci = &cgs.clientinfo[ cent->currentState.number ];
;1665:
;1666:	if (!cg_enableBreath.integer) {
;1667:		return;
;1668:	}
;1669:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
;1670:		return;
;1671:	}
;1672:	if ( cent->currentState.eFlags & EF_DEAD ) {
;1673:		return;
;1674:	}
;1675:	contents = trap_CM_PointContents( head->origin, 0 );
;1676:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
;1677:		return;
;1678:	}
;1679:	if ( ci->breathPuffTime > cg.time ) {
;1680:		return;
;1681:	}
;1682:
;1683:	VectorSet( up, 0, 0, 8 );
;1684:	VectorMA(head->origin, 8, head->axis[0], origin);
;1685:	VectorMA(origin, -4, head->axis[2], origin);
;1686:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
;1687:	ci->breathPuffTime = cg.time + 2000;
;1688:}
;1689:
;1690:/*
;1691:===============
;1692:CG_DustTrail
;1693:===============
;1694:*/
;1695:static void CG_DustTrail( centity_t *cent ) {
;1696:	int				anim;
;1697:	localEntity_t	*dust;
;1698:	vec3_t end, vel;
;1699:	trace_t tr;
;1700:
;1701:	if (!cg_enableDust.integer)
;1702:		return;
;1703:
;1704:	if ( cent->dustTrailTime > cg.time ) {
;1705:		return;
;1706:	}
;1707:
;1708:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;1709:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;1710:		return;
;1711:	}
;1712:
;1713:	cent->dustTrailTime += 40;
;1714:	if ( cent->dustTrailTime < cg.time ) {
;1715:		cent->dustTrailTime = cg.time;
;1716:	}
;1717:
;1718:	VectorCopy(cent->currentState.pos.trBase, end);
;1719:	end[2] -= 64;
;1720:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;1721:
;1722:	if ( !(tr.surfaceFlags & SURF_DUST) )
;1723:		return;
;1724:
;1725:	VectorCopy( cent->currentState.pos.trBase, end );
;1726:	end[2] -= 16;
;1727:
;1728:	VectorSet(vel, 0, 0, -30);
;1729:	dust = CG_SmokePuff( end, vel,
;1730:				  24,
;1731:				  .8f, .8f, 0.7f, 0.33f,
;1732:				  500,
;1733:				  cg.time,
;1734:				  0,
;1735:				  0,
;1736:				  cgs.media.dustPuffShader );
;1737:}
;1738:
;1739:#endif
;1740:
;1741:/*
;1742:===============
;1743:CG_TrailItem
;1744:===============
;1745:*/
;1746:static void CG_TrailItem( centity_t *cent, qhandle_t hModel ) {
line 1751
;1747:	refEntity_t		ent;
;1748:	vec3_t			angles;
;1749:	vec3_t			axis[3];
;1750:
;1751:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1752
;1752:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1753
;1753:	angles[ROLL] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1754
;1754:	AnglesToAxis( angles, axis );
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1756
;1755:
;1756:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1757
;1757:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 152
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 152+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 152+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1758
;1758:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1759
;1759:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1760
;1760:	AnglesToAxis( angles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1762
;1761:
;1762:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1763
;1763:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1764
;1764:}
LABELV $806
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 356 24
line 1772
;1765:
;1766:
;1767:/*
;1768:===============
;1769:CG_PlayerFlag
;1770:===============
;1771:*/
;1772:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 1781
;1773:	clientInfo_t	*ci;
;1774:	refEntity_t	pole;
;1775:	refEntity_t	flag;
;1776:	vec3_t		angles, dir;
;1777:	int			legsAnim, flagAnim, updateangles;
;1778:	float		angle, d;
;1779:
;1780:	// show the flag pole model
;1781:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1782
;1782:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+154388+88
INDIRI4
ASGNI4
line 1783
;1783:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1784
;1784:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1785
;1785:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1786
;1786:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $437
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1787
;1787:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1790
;1788:
;1789:	// show the flag model
;1790:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1791
;1791:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+154388+92
INDIRI4
ASGNI4
line 1792
;1792:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1793
;1793:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1794
;1794:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1795
;1795:	flag.renderfx = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1797
;1796:
;1797:	VectorClear(angles);
ADDRLP4 332
CNSTF4 0
ASGNF4
ADDRLP4 280+8
ADDRLP4 332
INDIRF4
ASGNF4
ADDRLP4 280+4
ADDRLP4 332
INDIRF4
ASGNF4
ADDRLP4 280
ADDRLP4 332
INDIRF4
ASGNF4
line 1799
;1798:
;1799:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 1800
;1800:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1801
;1801:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $838
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $836
LABELV $838
line 1802
;1802:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1803
;1803:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $837
JUMPV
LABELV $836
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $841
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $839
LABELV $841
line 1804
;1804:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1805
;1805:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1806
;1806:	} else {
ADDRGP4 $840
JUMPV
LABELV $839
line 1807
;1807:		flagAnim = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 1808
;1808:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1809
;1809:	}
LABELV $840
LABELV $837
line 1811
;1810:
;1811:	if ( updateangles ) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $842
line 1813
;1812:
;1813:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1815
;1814:		// add gravity
;1815:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1816
;1816:		VectorNormalize( dir );
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1817
;1817:		d = DotProduct(pole.axis[2], dir);
ADDRLP4 308
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1819
;1818:		// if there is anough movement orthogonal to the flag pole
;1819:		if (fabs(d) < 0.9) {
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 344
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 344
INDIRF4
CNSTF4 1063675494
GEF4 $855
line 1821
;1820:			//
;1821:			d = DotProduct(pole.axis[0], dir);
ADDRLP4 308
ADDRLP4 0+28
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1822
;1822:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $864
line 1823
;1823:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 1824
;1824:			}
ADDRGP4 $865
JUMPV
LABELV $864
line 1825
;1825:			else if (d < -1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $866
line 1826
;1826:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 1827
;1827:			}
LABELV $866
LABELV $865
line 1828
;1828:			angle = acos(d);
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 348
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 348
INDIRF4
ASGNF4
line 1830
;1829:
;1830:			d = DotProduct(pole.axis[1], dir);
ADDRLP4 308
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1831
;1831:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $878
line 1832
;1832:				angles[YAW] = 360 - angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1135869952
CNSTF4 1127481344
ADDRLP4 324
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
SUBF4
ASGNF4
line 1833
;1833:			}
ADDRGP4 $879
JUMPV
LABELV $878
line 1834
;1834:			else {
line 1835
;1835:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1127481344
ADDRLP4 324
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1836
;1836:			}
LABELV $879
line 1837
;1837:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $882
line 1838
;1838:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $882
line 1839
;1839:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $886
line 1840
;1840:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $886
line 1845
;1841:
;1842:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1843:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1844:			// change the yaw angle
;1845:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
ADDRLP4 280+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1041865114
ARGF4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 576
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1846
;1846:		}
LABELV $855
line 1866
;1847:
;1848:		/*
;1849:		d = DotProduct(pole.axis[2], dir);
;1850:		angle = Q_acos(d);
;1851:
;1852:		d = DotProduct(pole.axis[1], dir);
;1853:		if (d < 0) {
;1854:			angle = 360 - angle * 180 / M_PI;
;1855:		}
;1856:		else {
;1857:			angle = angle * 180 / M_PI;
;1858:		}
;1859:		if (angle > 340 && angle < 20) {
;1860:			flagAnim = FLAG_RUNUP;
;1861:		}
;1862:		if (angle > 160 && angle < 200) {
;1863:			flagAnim = FLAG_RUNDOWN;
;1864:		}
;1865:		*/
;1866:	}
LABELV $842
line 1869
;1867:
;1868:	// set the yaw angle
;1869:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
ASGNF4
line 1871
;1870:	// lerp the flag animation frames
;1871:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 316
CNSTI4 1740
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1872
;1872:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
ADDRLP4 316
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ARGP4
ADDRLP4 320
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1873
;1873:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 1874
;1874:	flag.frame = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
ASGNI4
line 1875
;1875:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ASGNF4
line 1877
;1876:
;1877:	AnglesToAxis( angles, flag.axis );
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1878
;1878:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $437
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1880
;1879:
;1880:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1881
;1881:}
LABELV $820
endproc CG_PlayerFlag 356 24
proc CG_PlayerPowerups 56 20
line 1958
;1882:
;1883:
;1884:#ifdef MISSIONPACK // bk001204
;1885:/*
;1886:===============
;1887:CG_PlayerTokens
;1888:===============
;1889:*/
;1890:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
;1891:	int			tokens, i, j;
;1892:	float		angle;
;1893:	refEntity_t	ent;
;1894:	vec3_t		dir, origin;
;1895:	skulltrail_t *trail;
;1896:	trail = &cg.skulltrails[cent->currentState.number];
;1897:	tokens = cent->currentState.generic1;
;1898:	if ( !tokens ) {
;1899:		trail->numpositions = 0;
;1900:		return;
;1901:	}
;1902:
;1903:	if ( tokens > MAX_SKULLTRAIL ) {
;1904:		tokens = MAX_SKULLTRAIL;
;1905:	}
;1906:
;1907:	// add skulls if there are more than last time
;1908:	for (i = 0; i < tokens - trail->numpositions; i++) {
;1909:		for (j = trail->numpositions; j > 0; j--) {
;1910:			VectorCopy(trail->positions[j-1], trail->positions[j]);
;1911:		}
;1912:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
;1913:	}
;1914:	trail->numpositions = tokens;
;1915:
;1916:	// move all the skulls along the trail
;1917:	VectorCopy(cent->lerpOrigin, origin);
;1918:	for (i = 0; i < trail->numpositions; i++) {
;1919:		VectorSubtract(trail->positions[i], origin, dir);
;1920:		if (VectorNormalize(dir) > 30) {
;1921:			VectorMA(origin, 30, dir, trail->positions[i]);
;1922:		}
;1923:		VectorCopy(trail->positions[i], origin);
;1924:	}
;1925:
;1926:	memset( &ent, 0, sizeof( ent ) );
;1927:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
;1928:		ent.hModel = cgs.media.redCubeModel;
;1929:	} else {
;1930:		ent.hModel = cgs.media.blueCubeModel;
;1931:	}
;1932:	ent.renderfx = renderfx;
;1933:
;1934:	VectorCopy(cent->lerpOrigin, origin);
;1935:	for (i = 0; i < trail->numpositions; i++) {
;1936:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
;1937:		ent.axis[0][2] = 0;
;1938:		VectorNormalize(ent.axis[0]);
;1939:		VectorSet(ent.axis[2], 0, 0, 1);
;1940:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
;1941:
;1942:		VectorCopy(trail->positions[i], ent.origin);
;1943:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
;1944:		ent.origin[2] += sin(angle) * 10;
;1945:		trap_R_AddRefEntityToScene( &ent );
;1946:		VectorCopy(trail->positions[i], origin);
;1947:	}
;1948:}
;1949:#endif
;1950:
;1951:
;1952:/*
;1953:===============
;1954:CG_PlayerPowerups
;1955:===============
;1956:*/
;1957:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) 
;1958:{
line 1964
;1959:	int		powerups;
;1960:	clientInfo_t	*ci;
;1961:	entityState_t	*state;
;1962:	float	r1, r2, r3;
;1963:	
;1964:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1965
;1965:	ci		 = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
CNSTI4 1740
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1966
;1966:	state	 = &cent->currentState;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1968
;1967:		
;1968:	if ( state->time2 == 9 || ci->cgimmobilized == qtrue ) 
ADDRLP4 8
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 9
EQI4 $902
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $900
LABELV $902
line 1969
;1969:	{ // Special immobilized dlight :P -Vincent
line 1971
;1970:		// Display only to the actual immobilized player -Vincent
;1971:		if ( state->number == cg.snap->ps.clientNum )
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $903
line 1972
;1972:		{
line 1973
;1973:		CG_CenterPrint( "^3You have been immobilized!", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $906
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 1974
;1974:		}
LABELV $903
line 1975
;1975:		if ( ci->immobi >= 0 && ci->immobi <= 74 )
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $907
ADDRLP4 24
INDIRI4
CNSTI4 74
GTI4 $907
line 1976
;1976:		{
line 1977
;1977:		r1 = 0.6f;
ADDRLP4 12
CNSTF4 1058642330
ASGNF4
line 1978
;1978:		r2 = 0.2f;
ADDRLP4 16
CNSTF4 1045220557
ASGNF4
line 1979
;1979:		r3 = 0.6f;
ADDRLP4 20
CNSTF4 1058642330
ASGNF4
line 1980
;1980:		}
ADDRGP4 $908
JUMPV
LABELV $907
line 1981
;1981:		else if ( ci->immobi >= 75 && ci->immobi <= 149 )
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 75
LTI4 $909
ADDRLP4 28
INDIRI4
CNSTI4 149
GTI4 $909
line 1982
;1982:		{
line 1983
;1983:		r1 = 0.2f;
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
line 1984
;1984:		r2 = 0.2f;
ADDRLP4 16
CNSTF4 1045220557
ASGNF4
line 1985
;1985:		r3 = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 1986
;1986:		}
ADDRGP4 $910
JUMPV
LABELV $909
line 1987
;1987:		else if ( ci->immobi >= 150 &&ci->immobi <= 224 )
ADDRLP4 32
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 150
LTI4 $911
ADDRLP4 32
INDIRI4
CNSTI4 224
GTI4 $911
line 1988
;1988:		{
line 1989
;1989:		r1 = 0.2f;
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
line 1990
;1990:		r2 = 0.6f;
ADDRLP4 16
CNSTF4 1058642330
ASGNF4
line 1991
;1991:		r3 = 0.6f;
ADDRLP4 20
CNSTF4 1058642330
ASGNF4
line 1992
;1992:		}
ADDRGP4 $912
JUMPV
LABELV $911
line 1993
;1993:		else if ( ci->immobi >= 225 && ci->immobi <= 299 )		
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 225
LTI4 $913
ADDRLP4 36
INDIRI4
CNSTI4 299
GTI4 $913
line 1994
;1994:		{
line 1995
;1995:		r1 = 0.2f;
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
line 1996
;1996:		r2 = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1997
;1997:		r3 = 0.2f;
ADDRLP4 20
CNSTF4 1045220557
ASGNF4
line 1998
;1998:		}
ADDRGP4 $914
JUMPV
LABELV $913
line 1999
;1999:		else if ( ci->immobi >= 300 && ci->immobi <= 374 )
ADDRLP4 40
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 300
LTI4 $915
ADDRLP4 40
INDIRI4
CNSTI4 374
GTI4 $915
line 2000
;2000:		{
line 2001
;2001:		r1 = 0.6f;
ADDRLP4 12
CNSTF4 1058642330
ASGNF4
line 2002
;2002:		r2 = 0.6f;
ADDRLP4 16
CNSTF4 1058642330
ASGNF4
line 2003
;2003:		r3 = 0.2f;
ADDRLP4 20
CNSTF4 1045220557
ASGNF4
line 2004
;2004:		}
ADDRGP4 $916
JUMPV
LABELV $915
line 2005
;2005:		else if ( ci->immobi >= 375 && ci->immobi <= 448 )
ADDRLP4 44
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 375
LTI4 $917
ADDRLP4 44
INDIRI4
CNSTI4 448
GTI4 $917
line 2006
;2006:		{
line 2007
;2007:		r1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 2008
;2008:		r2 = 0.2f;
ADDRLP4 16
CNSTF4 1045220557
ASGNF4
line 2009
;2009:		r3 = 0.2f;
ADDRLP4 20
CNSTF4 1045220557
ASGNF4
line 2010
;2010:		}
ADDRGP4 $918
JUMPV
LABELV $917
line 2012
;2011:		else
;2012:		{ // Reset
line 2013
;2013:		ci->immobi = 0;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2014
;2014:		}
LABELV $918
LABELV $916
LABELV $914
LABELV $912
LABELV $910
LABELV $908
line 2015
;2015:	ci->immobi++;
ADDRLP4 48
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2016
;2016:	trap_R_AddLightToScene( torso->origin, 250 + (rand()&31), r1, r2, r3 );
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRLP4 52
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 250
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2017
;2017:	}
LABELV $900
line 2021
;2018:
;2019:	
;2020:	// quad gives a dlight
;2021:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $919
line 2022
;2022:		trap_R_AddLightToScene( cent->lerpOrigin, 250 + (rand()&31), 0.2f, 0.2f, 1 );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 250
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1045220557
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2023
;2023:	}
LABELV $919
line 2026
;2024:
;2025:	// flight plays a looped sound
;2026:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $921
line 2027
;2027:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+154388+940
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 2028
;2028:	}
LABELV $921
line 2031
;2029:
;2030:	// redflag
;2031:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $925
line 2032
;2032:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $927
line 2033
;2033:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+96
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2034
;2034:		}
ADDRGP4 $928
JUMPV
LABELV $927
line 2035
;2035:		else {
line 2036
;2036:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2037
;2037:		}
LABELV $928
line 2038
;2038:		trap_R_AddLightToScene( cent->lerpOrigin, 250 + (rand()&31), 1.0, 0.2f, 0.2f );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 250
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
CNSTF4 1045220557
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2039
;2039:	}
LABELV $925
line 2042
;2040:
;2041:	// blueflag
;2042:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $933
line 2043
;2043:		if (ci->newAnims){
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $935
line 2044
;2044:			CG_PlayerFlag( cent, cgs.media.blueFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+100
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2045
;2045:		}
ADDRGP4 $936
JUMPV
LABELV $935
line 2046
;2046:		else {
line 2047
;2047:			CG_TrailItem( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2048
;2048:		}
LABELV $936
line 2049
;2049:		trap_R_AddLightToScene( cent->lerpOrigin, 250 + (rand()&31), 0.2f, 0.2f, 1.0 );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 250
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1045220557
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2050
;2050:	}
LABELV $933
line 2053
;2051:
;2052:	// neutralflag
;2053:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $941
line 2054
;2054:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $943
line 2055
;2055:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2056
;2056:		}
ADDRGP4 $944
JUMPV
LABELV $943
line 2057
;2057:		else {
line 2058
;2058:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2059
;2059:		}
LABELV $944
line 2060
;2060:		trap_R_AddLightToScene( cent->lerpOrigin, 250 + (rand()&31), 1.0, 1.0, 1.0 );
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 250
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2061
;2061:	}
LABELV $941
line 2064
;2062:
;2063:	// haste leaves smoke trails
;2064:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $949
line 2065
;2065:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 2066
;2066:	}
LABELV $949
line 2067
;2067:}
LABELV $898
endproc CG_PlayerPowerups 56 20
proc CG_PlayerFloatSprite 144 12
line 2077
;2068:
;2069:
;2070:/*
;2071:===============
;2072:CG_PlayerFloatSprite
;2073:
;2074:Float a sprite over the player's head
;2075:===============
;2076:*/
;2077:static void CG_PlayerFloatSprite( centity_t *cent, qhandle_t shader ) {
line 2081
;2078:	int				rf;
;2079:	refEntity_t		ent;
;2080:
;2081:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $952
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
NEI4 $952
line 2082
;2082:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 2083
;2083:	} else {
ADDRGP4 $953
JUMPV
LABELV $952
line 2084
;2084:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2085
;2085:	}
LABELV $953
line 2087
;2086:
;2087:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2088
;2088:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2089
;2089:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 2090
;2090:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 2091
;2091:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 2092
;2092:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 2093
;2093:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 2094
;2094:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 2095
;2095:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 2096
;2096:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 2097
;2097:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2098
;2098:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2099
;2099:}
LABELV $951
endproc CG_PlayerFloatSprite 144 12
export CG_PlayerSprites
proc CG_PlayerSprites 8 8
line 2110
;2100:
;2101:
;2102:
;2103:/*
;2104:===============
;2105:CG_PlayerSprites
;2106:
;2107:Float sprites over the player's head
;2108:===============
;2109:*/
;2110:void CG_PlayerSprites( centity_t *cent ) {
line 2115
;2111:	int		team;
;2112:
;2113:
;2114:	// Any Buildable Object That is your team needs a cute little sprite too
;2115:	if (cent->currentState.eType == ET_BUILDABLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $970
line 2116
;2116:	{
line 2117
;2117:			team = cent->currentState.team;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 2118
;2118:			if ( cg.snap->ps.persistant[PERS_TEAM] == team) 
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $969
line 2119
;2119:			{
line 2120
;2120:				CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+212
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2121
;2121:			}
line 2122
;2122:			return;
ADDRGP4 $969
JUMPV
LABELV $970
line 2126
;2123:	}
;2124:		
;2125:	
;2126:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $977
line 2127
;2127:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+220
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2128
;2128:		return;
ADDRGP4 $969
JUMPV
LABELV $977
line 2131
;2129:	}
;2130:
;2131:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $981
line 2132
;2132:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+216
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2133
;2133:		return;
ADDRGP4 $969
JUMPV
LABELV $981
line 2136
;2134:	}
;2135:
;2136:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $985
line 2137
;2137:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+576
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2138
;2138:		return;
ADDRGP4 $969
JUMPV
LABELV $985
line 2141
;2139:	}
;2140:
;2141:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
ADDRLP4 4
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $989
line 2142
;2142:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+580
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2143
;2143:		return;
ADDRGP4 $969
JUMPV
LABELV $989
line 2146
;2144:	}
;2145:
;2146:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $993
line 2147
;2147:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+584
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2148
;2148:		return;
ADDRGP4 $969
JUMPV
LABELV $993
line 2151
;2149:	}
;2150:
;2151:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $997
line 2152
;2152:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+588
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2153
;2153:		return;
ADDRGP4 $969
JUMPV
LABELV $997
line 2156
;2154:	}
;2155:
;2156:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1001
line 2157
;2157:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+592
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2158
;2158:		return;
ADDRGP4 $969
JUMPV
LABELV $1001
line 2161
;2159:	}
;2160:
;2161:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1005
line 2162
;2162:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+596
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2163
;2163:		return;
ADDRGP4 $969
JUMPV
LABELV $1005
line 2166
;2164:	}
;2165:
;2166:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 0
CNSTI4 1740
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
ASGNI4
line 2168
;2167:
;2168:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1011
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1011
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $1011
line 2170
;2169:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;2170:		cgs.gametype >= GT_TEAM) {
line 2171
;2171:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $969
line 2172
;2172:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+154388+212
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2173
;2173:		}
line 2174
;2174:		return;
LABELV $1011
line 2176
;2175:	}
;2176:}
LABELV $969
endproc CG_PlayerSprites 8 8
lit
align 4
LABELV $1021
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1022
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 104 44
line 2188
;2177:
;2178:/*
;2179:===============
;2180:CG_PlayerShadow
;2181:
;2182:Returns the Z component of the surface being shadowed
;2183:
;2184:  should it return a full plane instead of a Z?
;2185:===============
;2186:*/
;2187:#define	SHADOW_DISTANCE		128
;2188:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 2189
;2189:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $1021
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $1022
INDIRB
ASGNB 12
line 2193
;2190:	trace_t		trace;
;2191:	float		alpha;
;2192:
;2193:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2195
;2194:
;2195:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1023
line 2196
;2196:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1020
JUMPV
LABELV $1023
line 2200
;2197:	}
;2198:
;2199:	// no shadows when invisible
;2200:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1026
line 2201
;2201:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1020
JUMPV
LABELV $1026
line 2205
;2202:	}
;2203:
;2204:	// send a trace down from the player to the ground
;2205:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2206
;2206:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2208
;2207:
;2208:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2211
;2209:
;2210:	// no shadow if too high
;2211:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1034
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $1034
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $1029
LABELV $1034
line 2212
;2212:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1020
JUMPV
LABELV $1029
line 2215
;2213:	}
;2214:
;2215:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2217
;2216:
;2217:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1037
line 2218
;2218:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1020
JUMPV
LABELV $1037
line 2222
;2219:	}
;2220:
;2221:	// fade the shadow out with height
;2222:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2229
;2223:
;2224:	// bk0101022 - hack / FPE - bogus planes?
;2225:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;2226:
;2227:	// add the mark as a temporary, so it goes directly to the renderer
;2228:	// without taking a spot in the cg_marks array
;2229:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+154388+368
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2232
;2230:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2231:
;2232:	return qtrue;
CNSTI4 1
RETI4
LABELV $1020
endproc CG_PlayerShadow 104 44
proc CG_PlayerSplash 192 28
line 2243
;2233:}
;2234:
;2235:
;2236:/*
;2237:===============
;2238:CG_PlayerSplash
;2239:
;2240:Draw a mark at the water surface
;2241:===============
;2242:*/
;2243:static void CG_PlayerSplash( centity_t *cent ) {
line 2249
;2244:	vec3_t		start, end;
;2245:	trace_t		trace;
;2246:	int			contents;
;2247:	polyVert_t	verts[4];
;2248:
;2249:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1046
line 2250
;2250:		return;
ADDRGP4 $1045
JUMPV
LABELV $1046
line 2253
;2251:	}
;2252:
;2253:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2254
;2254:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2258
;2255:
;2256:	// if the feet aren't in liquid, don't make a mark
;2257:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2258:	contents = trap_CM_PointContents( end, 0 );
ADDRLP4 164
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
line 2259
;2259:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1050
line 2260
;2260:		return;
ADDRGP4 $1045
JUMPV
LABELV $1050
line 2263
;2261:	}
;2262:
;2263:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2264
;2264:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2267
;2265:
;2266:	// if the head isn't out of liquid, don't make a mark
;2267:	contents = trap_CM_PointContents( start, 0 );
ADDRLP4 152
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
line 2268
;2268:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $1053
line 2269
;2269:		return;
ADDRGP4 $1045
JUMPV
LABELV $1053
line 2273
;2270:	}
;2271:
;2272:	// trace down to find the surface
;2273:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
ADDRLP4 96
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
ADDRLP4 188
CNSTP4 0
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 188
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2275
;2274:
;2275:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1055
line 2276
;2276:		return;
ADDRGP4 $1045
JUMPV
LABELV $1055
line 2280
;2277:	}
;2278:
;2279:	// create a mark polygon
;2280:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2281
;2281:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2282
;2282:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2283
;2283:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2284
;2284:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2285
;2285:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2286
;2286:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2287
;2287:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2288
;2288:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2290
;2289:
;2290:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2291
;2291:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2292
;2292:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2293
;2293:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2294
;2294:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2295
;2295:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2296
;2296:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2297
;2297:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2298
;2298:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2300
;2299:
;2300:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2301
;2301:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2302
;2302:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2303
;2303:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2304
;2304:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2305
;2305:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2306
;2306:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2307
;2307:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2308
;2308:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2310
;2309:
;2310:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2311
;2311:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2312
;2312:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2313
;2313:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2314
;2314:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2315
;2315:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2316
;2316:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2317
;2317:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2318
;2318:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2320
;2319:
;2320:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+154388+392
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2321
;2321:}
LABELV $1045
endproc CG_PlayerSplash 192 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 8 4
line 2334
;2322:
;2323:
;2324:
;2325:/*
;2326:===============
;2327:CG_AddRefEntityWithPowerups
;2328:
;2329:Adds a piece with modifications or duplications for powerups
;2330:Also called by CG_Missile for quad rockets, but nobody can tell...
;2331:===============
;2332:*/
;2333:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team, centity_t *cent ) 
;2334:{
line 2337
;2335:	clientInfo_t	*ci;
;2336:	int				clientNum;
;2337:	clientNum =		cent->currentState.clientNum;
ADDRLP4 0
ADDRFP4 12
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2338
;2338:	ci		  =		&cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 1740
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2340
;2339:
;2340:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1137
line 2341
;2341:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+436
INDIRI4
ASGNI4
line 2342
;2342:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2343
;2343:	} else {
ADDRGP4 $1138
JUMPV
LABELV $1137
line 2353
;2344:		/*
;2345:		if ( state->eFlags & EF_KAMIKAZE ) {
;2346:			if (team == TEAM_BLUE)
;2347:				ent->customShader = cgs.media.blueKamikazeShader;
;2348:			else
;2349:				ent->customShader = cgs.media.redKamikazeShader;
;2350:			trap_R_AddRefEntityToScene( ent );
;2351:		}
;2352:		else {*/
;2353:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2356
;2354:		//}
;2355:
;2356:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1141
line 2357
;2357:		{
line 2358
;2358:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1143
line 2359
;2359:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+420
INDIRI4
ASGNI4
ADDRGP4 $1144
JUMPV
LABELV $1143
line 2361
;2360:			else
;2361:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+420
INDIRI4
ASGNI4
LABELV $1144
line 2362
;2362:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2363
;2363:		}
LABELV $1141
line 2364
;2364:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1149
line 2365
;2365:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+109652
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1151
line 2366
;2366:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+440
INDIRI4
ASGNI4
line 2367
;2367:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2368
;2368:			}
LABELV $1151
line 2369
;2369:		}
LABELV $1149
line 2370
;2370:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1156
line 2371
;2371:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+444
INDIRI4
ASGNI4
line 2372
;2372:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2373
;2373:		}
LABELV $1156
line 2375
;2374:		
;2375:		if ( state->time2 == 9 || ci->cgimmobilized == qtrue ) 
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 9
EQI4 $1162
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1160
LABELV $1162
line 2376
;2376:		{ //-Vincent
line 2377
;2377:		ent->customShader = cgs.media.immobilizedShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+464
INDIRI4
ASGNI4
line 2378
;2378:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2379
;2379:		}
LABELV $1160
line 2381
;2380:
;2381:		if ( state->powerups & ( 1 << PW_INVULNERABILITY ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1165
line 2382
;2382:			ent->customShader = cgs.media.buildShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+154388+424
INDIRI4
ASGNI4
line 2383
;2383:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2384
;2384:		}
LABELV $1165
line 2385
;2385:	}
LABELV $1138
line 2386
;2386:}
LABELV $1135
endproc CG_AddRefEntityWithPowerups 8 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2394
;2387:
;2388:/*
;2389:=================
;2390:CG_LightVerts
;2391:=================
;2392:*/
;2393:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2394:{
line 2401
;2395:	int				i, j;
;2396:	float			incoming;
;2397:	vec3_t			ambientLight;
;2398:	vec3_t			lightDir;
;2399:	vec3_t			directedLight;
;2400:
;2401:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2403
;2402:
;2403:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1173
JUMPV
LABELV $1170
line 2404
;2404:		incoming = DotProduct (normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2405
;2405:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1176
line 2406
;2406:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1179
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1180
JUMPV
LABELV $1179
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1180
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 2407
;2407:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1183
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1184
JUMPV
LABELV $1183
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1184
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 2408
;2408:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1187
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1188
JUMPV
LABELV $1187
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1188
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 2409
;2409:			verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2410
;2410:			continue;
ADDRGP4 $1171
JUMPV
LABELV $1176
line 2412
;2411:		} 
;2412:		j = ( ambientLight[0] + incoming * directedLight[0] );
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2413
;2413:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1189
line 2414
;2414:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2415
;2415:		}
LABELV $1189
line 2416
;2416:		verts[i].modulate[0] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2418
;2417:
;2418:		j = ( ambientLight[1] + incoming * directedLight[1] );
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2419
;2419:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1193
line 2420
;2420:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2421
;2421:		}
LABELV $1193
line 2422
;2422:		verts[i].modulate[1] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2424
;2423:
;2424:		j = ( ambientLight[2] + incoming * directedLight[2] );
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2425
;2425:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1197
line 2426
;2426:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2427
;2427:		}
LABELV $1197
line 2428
;2428:		verts[i].modulate[2] = j;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2430
;2429:
;2430:		verts[i].modulate[3] = 255;
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2431
;2431:	}
LABELV $1171
line 2403
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1173
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1170
line 2432
;2432:	return qtrue;
CNSTI4 1
RETI4
LABELV $1169
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 460 28
line 2440
;2433:}
;2434:
;2435:/*
;2436:===============
;2437:CG_Player
;2438:===============
;2439:*/
;2440:void CG_Player( centity_t *cent ) {
line 2461
;2441:	clientInfo_t	*ci;
;2442:	refEntity_t		legs;
;2443:	refEntity_t		torso;
;2444:	refEntity_t		head;
;2445:	int				clientNum;
;2446:	int				renderfx;
;2447:	qboolean		shadow;
;2448:	float			shadowPlane;
;2449:#ifdef MISSIONPACK
;2450:	refEntity_t		skull;
;2451:	refEntity_t		powerup;
;2452:	int				t;
;2453:	float			c;
;2454:	float			angle;
;2455:	vec3_t			dir, angles;
;2456:#endif
;2457:
;2458:	// the client number is stored in clientNum.  It can't be derived
;2459:	// from the entity number, because a single client may have
;2460:	// multiple corpses on the level using the same clientinfo
;2461:	clientNum = cent->currentState.clientNum;
ADDRLP4 428
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2462
;2462:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 428
INDIRI4
CNSTI4 0
LTI4 $1202
ADDRLP4 428
INDIRI4
CNSTI4 64
LTI4 $1200
LABELV $1202
line 2463
;2463:		CG_Error( "Bad clientNum on player entity");
ADDRGP4 $1203
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2464
;2464:	}
LABELV $1200
line 2465
;2465:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 280
CNSTI4 1740
ADDRLP4 428
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2469
;2466:
;2467:	// it is possible to see corpses from disconnected players that may
;2468:	// not have valid clientinfo
;2469:	if ( !ci->infoValid ) {
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1205
line 2470
;2470:		return;
ADDRGP4 $1199
JUMPV
LABELV $1205
line 2474
;2471:	}
;2472:
;2473:	// get the player model information
;2474:	renderfx = 0;
ADDRLP4 424
CNSTI4 0
ASGNI4
line 2475
;2475:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1207
line 2476
;2476:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+109676
INDIRI4
CNSTI4 0
NEI4 $1210
line 2477
;2477:			renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 424
CNSTI4 2
ASGNI4
line 2478
;2478:		} else {
ADDRGP4 $1211
JUMPV
LABELV $1210
line 2479
;2479:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1213
line 2480
;2480:				return;
ADDRGP4 $1199
JUMPV
LABELV $1213
line 2482
;2481:			}
;2482:		}
LABELV $1211
line 2483
;2483:	}
LABELV $1207
line 2486
;2484:
;2485:
;2486:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2487
;2487:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2488
;2488:	memset( &head, 0, sizeof(head) );
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2491
;2489:
;2490:	// get the rotation information
;2491:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 140+28
ARGP4
ADDRLP4 284+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
line 2494
;2492:	
;2493:	// get the animation state (after rotation, to allow feet shuffle)
;2494:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRLP4 140+96
ARGP4
ADDRLP4 140+80
ARGP4
ADDRLP4 140+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 2498
;2495:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;2496:
;2497:	// add the talk baloon or disconnect icon
;2498:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2501
;2499:
;2500:	// add the shadow
;2501:	shadow = CG_PlayerShadow( cent, &shadowPlane );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 432
ARGP4
ADDRLP4 444
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 436
ADDRLP4 444
INDIRI4
ASGNI4
line 2504
;2502:
;2503:	// add a water splash if partially in and out of water
;2504:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2506
;2505:
;2506:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1225
ADDRLP4 436
INDIRI4
CNSTI4 0
EQI4 $1225
line 2507
;2507:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2508
;2508:	}
LABELV $1225
line 2509
;2509:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2518
;2510:#ifdef MISSIONPACK
;2511:	if( cgs.gametype == GT_HARVESTER ) {
;2512:		CG_PlayerTokens( cent, renderfx );
;2513:	}
;2514:#endif
;2515:	//
;2516:	// add the legs
;2517:	//
;2518:	legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 2519
;2519:	legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 280
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2521
;2520:
;2521:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2523
;2522:
;2523:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2524
;2524:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2525
;2525:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2526
;2526:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2528
;2527:
;2528:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team, cent );
ADDRLP4 0
ARGP4
ADDRLP4 448
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2531
;2529:
;2530:	// if the model failed, allow the default nullmodel to be displayed
;2531:	if (!legs.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1236
line 2532
;2532:		return;
ADDRGP4 $1199
JUMPV
LABELV $1236
line 2538
;2533:	}
;2534:
;2535:	//
;2536:	// add the torso
;2537:	//
;2538:	torso.hModel = ci->torsoModel;
ADDRLP4 140+8
ADDRLP4 280
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 2539
;2539:	if (!torso.hModel) {
ADDRLP4 140+8
INDIRI4
CNSTI4 0
NEI4 $1240
line 2540
;2540:		return;
ADDRGP4 $1199
JUMPV
LABELV $1240
line 2543
;2541:	}
;2542:
;2543:	torso.customSkin = ci->torsoSkin;
ADDRLP4 140+108
ADDRLP4 280
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ASGNI4
line 2545
;2544:
;2545:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2547
;2546:
;2547:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1245
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2549
;2548:
;2549:	torso.shadowPlane = shadowPlane;
ADDRLP4 140+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2550
;2550:	torso.renderfx = renderfx;
ADDRLP4 140+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2552
;2551:
;2552:	CG_AddRefEntityWithPowerups( &torso, &cent->currentState, ci->team, cent );
ADDRLP4 140
ARGP4
ADDRLP4 452
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 452
INDIRP4
ARGP4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2735
;2553:
;2554:#ifdef MISSIONPACK
;2555:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
;2556:
;2557:		memset( &skull, 0, sizeof(skull) );
;2558:
;2559:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
;2560:		skull.shadowPlane = shadowPlane;
;2561:		skull.renderfx = renderfx;
;2562:
;2563:		if ( cent->currentState.eFlags & EF_DEAD ) {
;2564:			// one skull bobbing above the dead body
;2565:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
;2566:			if (angle > M_PI * 2)
;2567:				angle -= (float)M_PI * 2;
;2568:			dir[0] = sin(angle) * 20;
;2569:			dir[1] = cos(angle) * 20;
;2570:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2571:			dir[2] = 15 + sin(angle) * 8;
;2572:			VectorAdd(torso.origin, dir, skull.origin);
;2573:			
;2574:			dir[2] = 0;
;2575:			VectorCopy(dir, skull.axis[1]);
;2576:			VectorNormalize(skull.axis[1]);
;2577:			VectorSet(skull.axis[2], 0, 0, 1);
;2578:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2579:
;2580:			skull.hModel = cgs.media.kamikazeHeadModel;
;2581:			trap_R_AddRefEntityToScene( &skull );
;2582:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2583:			trap_R_AddRefEntityToScene( &skull );
;2584:		}
;2585:		else {
;2586:			// three skulls spinning around the player
;2587:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2588:			dir[0] = cos(angle) * 20;
;2589:			dir[1] = sin(angle) * 20;
;2590:			dir[2] = cos(angle) * 20;
;2591:			VectorAdd(torso.origin, dir, skull.origin);
;2592:
;2593:			angles[0] = sin(angle) * 30;
;2594:			angles[1] = (angle * 180 / M_PI) + 90;
;2595:			if (angles[1] > 360)
;2596:				angles[1] -= 360;
;2597:			angles[2] = 0;
;2598:			AnglesToAxis( angles, skull.axis );
;2599:
;2600:			/*
;2601:			dir[2] = 0;
;2602:			VectorInverse(dir);
;2603:			VectorCopy(dir, skull.axis[1]);
;2604:			VectorNormalize(skull.axis[1]);
;2605:			VectorSet(skull.axis[2], 0, 0, 1);
;2606:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2607:			*/
;2608:
;2609:			skull.hModel = cgs.media.kamikazeHeadModel;
;2610:			trap_R_AddRefEntityToScene( &skull );
;2611:			// flip the trail because this skull is spinning in the other direction
;2612:			VectorInverse(skull.axis[1]);
;2613:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2614:			trap_R_AddRefEntityToScene( &skull );
;2615:
;2616:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
;2617:			if (angle > M_PI * 2)
;2618:				angle -= (float)M_PI * 2;
;2619:			dir[0] = sin(angle) * 20;
;2620:			dir[1] = cos(angle) * 20;
;2621:			dir[2] = cos(angle) * 20;
;2622:			VectorAdd(torso.origin, dir, skull.origin);
;2623:
;2624:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
;2625:			angles[1] = 360 - (angle * 180 / M_PI);
;2626:			if (angles[1] > 360)
;2627:				angles[1] -= 360;
;2628:			angles[2] = 0;
;2629:			AnglesToAxis( angles, skull.axis );
;2630:
;2631:			/*
;2632:			dir[2] = 0;
;2633:			VectorCopy(dir, skull.axis[1]);
;2634:			VectorNormalize(skull.axis[1]);
;2635:			VectorSet(skull.axis[2], 0, 0, 1);
;2636:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2637:			*/
;2638:
;2639:			skull.hModel = cgs.media.kamikazeHeadModel;
;2640:			trap_R_AddRefEntityToScene( &skull );
;2641:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2642:			trap_R_AddRefEntityToScene( &skull );
;2643:
;2644:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
;2645:			if (angle > M_PI * 2)
;2646:				angle -= (float)M_PI * 2;
;2647:			dir[0] = sin(angle) * 20;
;2648:			dir[1] = cos(angle) * 20;
;2649:			dir[2] = 0;
;2650:			VectorAdd(torso.origin, dir, skull.origin);
;2651:			
;2652:			VectorCopy(dir, skull.axis[1]);
;2653:			VectorNormalize(skull.axis[1]);
;2654:			VectorSet(skull.axis[2], 0, 0, 1);
;2655:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2656:
;2657:			skull.hModel = cgs.media.kamikazeHeadModel;
;2658:			trap_R_AddRefEntityToScene( &skull );
;2659:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2660:			trap_R_AddRefEntityToScene( &skull );
;2661:		}
;2662:	}
;2663:
;2664:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
;2665:		memcpy(&powerup, &torso, sizeof(torso));
;2666:		powerup.hModel = cgs.media.guardPowerupModel;
;2667:		powerup.frame = 0;
;2668:		powerup.oldframe = 0;
;2669:		powerup.customSkin = 0;
;2670:		trap_R_AddRefEntityToScene( &powerup );
;2671:	}
;2672:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
;2673:		memcpy(&powerup, &torso, sizeof(torso));
;2674:		powerup.hModel = cgs.media.scoutPowerupModel;
;2675:		powerup.frame = 0;
;2676:		powerup.oldframe = 0;
;2677:		powerup.customSkin = 0;
;2678:		trap_R_AddRefEntityToScene( &powerup );
;2679:	}
;2680:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
;2681:		memcpy(&powerup, &torso, sizeof(torso));
;2682:		powerup.hModel = cgs.media.doublerPowerupModel;
;2683:		powerup.frame = 0;
;2684:		powerup.oldframe = 0;
;2685:		powerup.customSkin = 0;
;2686:		trap_R_AddRefEntityToScene( &powerup );
;2687:	}
;2688:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
;2689:		memcpy(&powerup, &torso, sizeof(torso));
;2690:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
;2691:		powerup.frame = 0;
;2692:		powerup.oldframe = 0;
;2693:		powerup.customSkin = 0;
;2694:		trap_R_AddRefEntityToScene( &powerup );
;2695:	}
;2696:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
;2697:		if ( !ci->invulnerabilityStartTime ) {
;2698:			ci->invulnerabilityStartTime = cg.time;
;2699:		}
;2700:		ci->invulnerabilityStopTime = cg.time;
;2701:	}
;2702:	else {
;2703:		ci->invulnerabilityStartTime = 0;
;2704:	}
;2705:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
;2706:		cg.time - ci->invulnerabilityStopTime < 250 ) {
;2707:
;2708:		memcpy(&powerup, &torso, sizeof(torso));
;2709:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
;2710:		powerup.customSkin = 0;
;2711:		// always draw
;2712:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2713:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2714:
;2715:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
;2716:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
;2717:		}
;2718:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
;2719:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
;2720:		}
;2721:		else {
;2722:			c = 1;
;2723:		}
;2724:		VectorSet( powerup.axis[0], c, 0, 0 );
;2725:		VectorSet( powerup.axis[1], 0, c, 0 );
;2726:		VectorSet( powerup.axis[2], 0, 0, c );
;2727:		trap_R_AddRefEntityToScene( &powerup );
;2728:	}
;2729:#endif // MISSIONPACK
;2730:
;2731:	//
;2732:	// add the head
;2733:	//
;2734:	// Shafe - Trep - This is all new code for headshots
;2735:	if(!cent->pe.noHead)
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1248
line 2736
;2736:	{
line 2737
;2737:		head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 280
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2738
;2738:		if (!head.hModel) 
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1251
line 2739
;2739:		{
line 2740
;2740:			return;
ADDRGP4 $1199
JUMPV
LABELV $1251
line 2742
;2741:		}
;2742:		head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 280
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 2744
;2743:
;2744:		VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2746
;2745:
;2746:		CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 284
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1256
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2748
;2747:
;2748:		head.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2749
;2749:		head.renderfx = renderfx;
ADDRLP4 284+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2751
;2750:
;2751:		CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team, cent );
ADDRLP4 284
ARGP4
ADDRLP4 456
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 456
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 456
INDIRP4
ARGP4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2752
;2752:	}
LABELV $1248
line 2781
;2753:
;2754:	/*  Shafe - Trep - This is the original code -- Fuck.. Lets hope we dont end up compiling with MISSIONPACK!
;2755:	head.hModel = ci->headModel;
;2756:	if (!head.hModel) {
;2757:		return;
;2758:	}
;2759:	head.customSkin = ci->headSkin;
;2760:
;2761:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
;2762:
;2763:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
;2764:
;2765:	head.shadowPlane = shadowPlane;
;2766:	head.renderfx = renderfx;
;2767:
;2768:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team, cent );
;2769:	*/
;2770:
;2771:
;2772:#ifdef MISSIONPACK
;2773:	CG_BreathPuffs(cent, &head);
;2774:
;2775:	CG_DustTrail(cent);
;2776:#endif
;2777:
;2778:	//
;2779:	// add the gun / barrel / flash
;2780:	//
;2781:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team );
ADDRLP4 140
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 2784
;2782:
;2783:	// add powerups floating behind the player
;2784:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2788
;2785:
;2786://unlagged - client options
;2787:	// add the bounding box (if cg_drawBBox is 1)
;2788:	CG_AddBoundingBox( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddBoundingBox
CALLV
pop
line 2790
;2789://unlagged - client options
;2790:}
LABELV $1199
endproc CG_Player 460 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 2802
;2791:
;2792:
;2793://=====================================================================
;2794:
;2795:/*
;2796:===============
;2797:CG_ResetPlayerEntity
;2798:
;2799:A player just came into view or teleported, so reset all animation info
;2800:===============
;2801:*/
;2802:void CG_ResetPlayerEntity( centity_t *cent ) {
line 2803
;2803:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 -99999
ASGNI4
line 2804
;2804:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 2806
;2805:
;2806:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1740
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2807
;2807:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1740
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2809
;2808:
;2809:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2810
;2810:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+109652
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2812
;2811:
;2812:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2813
;2813:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 2815
;2814:
;2815:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2816
;2816:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2817
;2817:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2818
;2818:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 0
ASGNF4
line 2819
;2819:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 2821
;2820:
;2821:	memset( &cent->pe.torso, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2822
;2822:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2823
;2823:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2824
;2824:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ASGNF4
line 2825
;2825:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 2827
;2826:
;2827:	cent->pe.noHead = qfalse; // Shafe - Trep - Part of the headshot code
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 0
ASGNI4
line 2829
;2828:
;2829:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1264
line 2830
;2830:		CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1267
ARGP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 2831
;2831:	}
LABELV $1264
line 2832
;2832:}
LABELV $1259
endproc CG_ResetPlayerEntity 40 12
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
import CG_BreakGlass
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_ShotgunTrail
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
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ResetZoom
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
import cg_CurrentRound
import cg_RedMC
import cg_BlueMC
import cg_GameMode
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
LABELV $1267
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1256
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1245
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $1203
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $906
byte 1 94
byte 1 51
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 111
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $752
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $681
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $647
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $643
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $626
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $590
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $579
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $546
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $544
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $542
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $540
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $538
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $536
byte 1 116
byte 1 0
align 1
LABELV $534
byte 1 108
byte 1 0
align 1
LABELV $532
byte 1 119
byte 1 0
align 1
LABELV $530
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $528
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $526
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $524
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $521
byte 1 110
byte 1 0
align 1
LABELV $516
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $451
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $450
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $437
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $432
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $429
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 47
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $428
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $420
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $403
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $400
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $397
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $394
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $391
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $388
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $385
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $384
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $383
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $380
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $379
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $378
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $375
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $368
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $363
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $362
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $359
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $356
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $353
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $350
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $347
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $346
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 54
byte 1 54
byte 1 55
byte 1 51
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $343
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $340
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $337
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $334
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $326
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $323
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $320
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $317
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $314
byte 1 76
byte 1 101
byte 1 103
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $311
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $310
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $281
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $280
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $275
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $274
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $253
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $243
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $242
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $232
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $231
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $223
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $222
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 50
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $216
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $206
byte 1 0
align 1
LABELV $205
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $204
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $192
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $167
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $161
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $150
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $141
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $138
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 82
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 70
byte 1 97
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $137
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $131
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $128
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $124
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $123
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $118
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $110
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $104
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $88
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 52
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $87
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $86
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $85
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $84
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $79
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $78
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $77
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $76
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $75
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $74
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $73
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $72
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
