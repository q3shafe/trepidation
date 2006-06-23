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
skip 76
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../cg_players.c"
line 29
;1:// Copyright (C) 1999-2000 Id Software, Inc.
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
;19:	"*taunt.wav"
;20:};
;21:
;22:
;23:/*
;24:================
;25:CG_CustomSound
;26:
;27:================
;28:*/
;29:sfxHandle_t	CG_CustomSound( int clientNum, const char *soundName ) {
line 33
;30:	clientInfo_t *ci;
;31:	int			i;
;32:
;33:	if ( soundName[0] != '*' ) {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $86
line 34
;34:		return trap_S_RegisterSound( soundName, qfalse );
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
ADDRGP4 $85
JUMPV
LABELV $86
line 37
;35:	}
;36:
;37:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $90
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $88
LABELV $90
line 38
;38:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 39
;39:	}
LABELV $88
line 40
;40:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 4
CNSTI4 1708
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 42
;41:
;42:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i] ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 43
;43:		if ( !strcmp( soundName, cg_customSoundNames[i] ) ) {
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
NEI4 $96
line 44
;44:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1580
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $85
JUMPV
LABELV $96
line 46
;45:		}
;46:	}
LABELV $93
line 42
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $98
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $92
LABELV $98
line 48
;47:
;48:	CG_Error( "Unknown custom sound: %s", soundName );
ADDRGP4 $99
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 49
;49:	return 0;
CNSTI4 0
RETI4
LABELV $85
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20084 12
line 70
;50:}
;51:
;52:
;53:
;54:/*
;55:=============================================================================
;56:
;57:CLIENT INFO
;58:
;59:=============================================================================
;60:*/
;61:
;62:/*
;63:======================
;64:CG_ParseAnimationFile
;65:
;66:Read a configuration file containing animation coutns and rates
;67:models/players/visor/animation.cfg, etc
;68:======================
;69:*/
;70:static qboolean	CG_ParseAnimationFile( const char *filename, clientInfo_t *ci ) {
line 81
;71:	char		*text_p, *prev;
;72:	int			len;
;73:	int			i;
;74:	char		*token;
;75:	float		fps;
;76:	int			skip;
;77:	char		text[20000];
;78:	fileHandle_t	f;
;79:	animation_t *animations;
;80:
;81:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
line 84
;82:
;83:	// load the file
;84:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 85
;85:	if ( len <= 0 ) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $101
line 86
;86:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 88
;87:	}
;88:	if ( len >= sizeof( text ) - 1 ) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $103
line 89
;89:		CG_Printf( "File %s too long\n", filename );
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 90
;90:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $103
line 92
;91:	}
;92:	trap_FS_Read( text, len, f );
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
line 93
;93:	text[len] = 0;
ADDRLP4 28
INDIRI4
ADDRLP4 32
ADDP4
CNSTI1 0
ASGNI1
line 94
;94:	trap_FS_FCloseFile( f );
ADDRLP4 20032
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 97
;95:
;96:	// parse the text
;97:	text_p = text;
ADDRLP4 12
ADDRLP4 32
ASGNP4
line 98
;98:	skip = 0;	// quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 100
;99:
;100:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 101
;101:	VectorClear( ci->headOffset );
ADDRLP4 20040
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20044
CNSTF4 0
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 504
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
ADDRLP4 20040
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20044
INDIRF4
ASGNF4
line 102
;102:	ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 103
;103:	ci->fixedlegs = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 0
ASGNI4
line 104
;104:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $106
line 107
;105:
;106:	// read optional parameters
;107:	while ( 1 ) {
line 108
;108:		prev = text_p;	// so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 109
;109:		token = COM_Parse( &text_p );
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
line 110
;110:		if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $109
line 111
;111:			break;
ADDRGP4 $108
JUMPV
LABELV $109
line 113
;112:		}
;113:		if ( !Q_stricmp( token, "footsteps" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $111
line 114
;114:			token = COM_Parse( &text_p );
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
line 115
;115:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 116
;116:				break;
ADDRGP4 $108
JUMPV
LABELV $114
line 118
;117:			}
;118:			if ( !Q_stricmp( token, "default" ) || !Q_stricmp( token, "normal" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
EQI4 $120
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $116
LABELV $120
line 119
;119:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 120
;120:			} else if ( !Q_stricmp( token, "boot" ) ) {
ADDRGP4 $107
JUMPV
LABELV $116
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $121
line 121
;121:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 122
;122:			} else if ( !Q_stricmp( token, "flesh" ) ) {
ADDRGP4 $107
JUMPV
LABELV $121
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $124
line 123
;123:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 2
ASGNI4
line 124
;124:			} else if ( !Q_stricmp( token, "mech" ) ) {
ADDRGP4 $107
JUMPV
LABELV $124
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $129
ARGP4
ADDRLP4 20076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20076
INDIRI4
CNSTI4 0
NEI4 $127
line 125
;125:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 3
ASGNI4
line 126
;126:			} else if ( !Q_stricmp( token, "energy" ) ) {
ADDRGP4 $107
JUMPV
LABELV $127
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 20080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20080
INDIRI4
CNSTI4 0
NEI4 $130
line 127
;127:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 4
ASGNI4
line 128
;128:			} else {
ADDRGP4 $107
JUMPV
LABELV $130
line 129
;129:				CG_Printf( "Bad footsteps parm in %s: %s\n", filename, token );
ADDRGP4 $133
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
line 130
;130:			}
line 131
;131:			continue;
ADDRGP4 $107
JUMPV
LABELV $111
line 132
;132:		} else if ( !Q_stricmp( token, "headoffset" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $134
line 133
;133:			for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $137
line 134
;134:				token = COM_Parse( &text_p );
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
line 135
;135:				if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $141
line 136
;136:					break;
ADDRGP4 $107
JUMPV
LABELV $141
line 138
;137:				}
;138:				ci->headOffset[i] = atof( token );
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
CNSTI4 496
ADDP4
ADDP4
ADDRLP4 20064
INDIRF4
ASGNF4
line 139
;139:			}
LABELV $138
line 133
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $137
line 140
;140:			continue;
ADDRGP4 $107
JUMPV
LABELV $134
line 141
;141:		} else if ( !Q_stricmp( token, "sex" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $143
line 142
;142:			token = COM_Parse( &text_p );
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
line 143
;143:			if ( !token ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 144
;144:				break;
ADDRGP4 $108
JUMPV
LABELV $146
line 146
;145:			}
;146:			if ( token[0] == 'f' || token[0] == 'F' ) {
ADDRLP4 20068
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 102
EQI4 $150
ADDRLP4 20068
INDIRI4
CNSTI4 70
NEI4 $148
LABELV $150
line 147
;147:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 148
;148:			} else if ( token[0] == 'n' || token[0] == 'N' ) {
ADDRGP4 $107
JUMPV
LABELV $148
ADDRLP4 20072
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 110
EQI4 $153
ADDRLP4 20072
INDIRI4
CNSTI4 78
NEI4 $151
LABELV $153
line 149
;149:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 2
ASGNI4
line 150
;150:			} else {
ADDRGP4 $107
JUMPV
LABELV $151
line 151
;151:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 152
;152:			}
line 153
;153:			continue;
ADDRGP4 $107
JUMPV
LABELV $143
line 154
;154:		} else if ( !Q_stricmp( token, "fixedlegs" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $154
line 155
;155:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 488
ADDP4
CNSTI4 1
ASGNI4
line 156
;156:			continue;
ADDRGP4 $107
JUMPV
LABELV $154
line 157
;157:		} else if ( !Q_stricmp( token, "fixedtorso" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $157
line 158
;158:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 1
ASGNI4
line 159
;159:			continue;
ADDRGP4 $107
JUMPV
LABELV $157
line 163
;160:		}
;161:
;162:		// if it is a number, start parsing animations
;163:		if ( token[0] >= '0' && token[0] <= '9' ) {
ADDRLP4 20072
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 48
LTI4 $160
ADDRLP4 20072
INDIRI4
CNSTI4 57
GTI4 $160
line 164
;164:			text_p = prev;	// unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 165
;165:			break;
ADDRGP4 $108
JUMPV
LABELV $160
line 167
;166:		}
;167:		Com_Printf( "unknown token '%s' is %s\n", token, filename );
ADDRGP4 $162
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
line 168
;168:	}
LABELV $107
line 107
ADDRGP4 $106
JUMPV
LABELV $108
line 171
;169:
;170:	// read information for each frame
;171:	for ( i = 0 ; i < MAX_ANIMATIONS ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $163
line 173
;172:
;173:		token = COM_Parse( &text_p );
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
line 174
;174:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $167
line 175
;175:			if( i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE ) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $165
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $165
line 176
;176:				animations[i].firstFrame = animations[TORSO_GESTURE].firstFrame;
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
line 177
;177:				animations[i].frameLerp = animations[TORSO_GESTURE].frameLerp;
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
line 178
;178:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
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
line 179
;179:				animations[i].loopFrames = animations[TORSO_GESTURE].loopFrames;
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
line 180
;180:				animations[i].numFrames = animations[TORSO_GESTURE].numFrames;
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
line 181
;181:				animations[i].reversed = qfalse;
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
line 182
;182:				animations[i].flipflop = qfalse;
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
line 183
;183:				continue;
ADDRGP4 $164
JUMPV
line 185
;184:			}
;185:			break;
LABELV $167
line 187
;186:		}
;187:		animations[i].firstFrame = atoi( token );
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
line 189
;188:		// leg only frames are adjusted to not count the upper body only frames
;189:		if ( i == LEGS_WALKCR ) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $171
line 190
;190:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
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
line 191
;191:		}
LABELV $171
line 192
;192:		if ( i >= LEGS_WALKCR && i<TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $173
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $173
line 193
;193:			animations[i].firstFrame -= skip;
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
line 194
;194:		}
LABELV $173
line 196
;195:
;196:		token = COM_Parse( &text_p );
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
line 197
;197:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $175
line 198
;198:			break;
ADDRGP4 $165
JUMPV
LABELV $175
line 200
;199:		}
;200:		animations[i].numFrames = atoi( token );
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
line 202
;201:
;202:		animations[i].reversed = qfalse;
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
line 203
;203:		animations[i].flipflop = qfalse;
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
line 205
;204:		// if numFrames is negative the animation is reversed
;205:		if (animations[i].numFrames < 0) {
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
GEI4 $177
line 206
;206:			animations[i].numFrames = -animations[i].numFrames;
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
line 207
;207:			animations[i].reversed = qtrue;
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
line 208
;208:		}
LABELV $177
line 210
;209:
;210:		token = COM_Parse( &text_p );
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
line 211
;211:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $179
line 212
;212:			break;
ADDRGP4 $165
JUMPV
LABELV $179
line 214
;213:		}
;214:		animations[i].loopFrames = atoi( token );
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
line 216
;215:
;216:		token = COM_Parse( &text_p );
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
line 217
;217:		if ( !*token ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $181
line 218
;218:			break;
ADDRGP4 $165
JUMPV
LABELV $181
line 220
;219:		}
;220:		fps = atof( token );
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
line 221
;221:		if ( fps == 0 ) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $183
line 222
;222:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 223
;223:		}
LABELV $183
line 224
;224:		animations[i].frameLerp = 1000 / fps;
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
line 225
;225:		animations[i].initialLerp = 1000 / fps;
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
line 226
;226:	}
LABELV $164
line 171
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $163
LABELV $165
line 228
;227:
;228:	if ( i != MAX_ANIMATIONS ) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $185
line 229
;229:		CG_Printf( "Error parsing animation file: %s", filename );
ADDRGP4 $187
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 230
;230:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $185
line 234
;231:	}
;232:
;233:	// crouch backward animation
;234:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
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
line 235
;235:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 237
;236:	// walk backward animation
;237:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
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
line 238
;238:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 240
;239:	// flag moving fast
;240:	animations[FLAG_RUN].firstFrame = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 241
;241:	animations[FLAG_RUN].numFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 242
;242:	animations[FLAG_RUN].loopFrames = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 243
;243:	animations[FLAG_RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 244
;244:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 245
;245:	animations[FLAG_RUN].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 247
;246:	// flag not moving or moving slowly
;247:	animations[FLAG_STAND].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 248
;248:	animations[FLAG_STAND].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 249
;249:	animations[FLAG_STAND].loopFrames = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 250
;250:	animations[FLAG_STAND].frameLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 251
;251:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 252
;252:	animations[FLAG_STAND].reversed = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 254
;253:	// flag speeding up
;254:	animations[FLAG_STAND2RUN].firstFrame = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 255
;255:	animations[FLAG_STAND2RUN].numFrames = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 256
;256:	animations[FLAG_STAND2RUN].loopFrames = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 257
;257:	animations[FLAG_STAND2RUN].frameLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 258
;258:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 259
;259:	animations[FLAG_STAND2RUN].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 269
;260:	//
;261:	// new anims changes
;262:	//
;263://	animations[TORSO_GETFLAG].flipflop = qtrue;
;264://	animations[TORSO_GUARDBASE].flipflop = qtrue;
;265://	animations[TORSO_PATROL].flipflop = qtrue;
;266://	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
;267://	animations[TORSO_NEGATIVE].flipflop = qtrue;
;268:	//
;269:	return qtrue;
CNSTI4 1
RETI4
LABELV $100
endproc CG_ParseAnimationFile 20084 12
proc CG_FileExists 8 12
line 277
;270:}
;271:
;272:/*
;273:==========================
;274:CG_FileExists
;275:==========================
;276:*/
;277:static qboolean	CG_FileExists(const char *filename) {
line 280
;278:	int len;
;279:
;280:	len = trap_FS_FOpenFile( filename, 0, FS_READ );
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
line 281
;281:	if (len>0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $189
line 282
;282:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $188
JUMPV
LABELV $189
line 284
;283:	}
;284:	return qfalse;
CNSTI4 0
RETI4
LABELV $188
endproc CG_FileExists 8 12
proc CG_FindClientModelFile 32 40
line 292
;285:}
;286:
;287:/*
;288:==========================
;289:CG_FindClientModelFile
;290:==========================
;291:*/
;292:static qboolean	CG_FindClientModelFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *base, const char *ext ) {
line 296
;293:	char *team, *charactersFolder;
;294:	int i;
;295:
;296:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $192
line 297
;297:		switch ( ci->team ) {
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
EQI4 $198
ADDRGP4 $195
JUMPV
LABELV $198
line 298
;298:			case TEAM_BLUE: {
line 299
;299:				team = "blue";
ADDRLP4 8
ADDRGP4 $199
ASGNP4
line 300
;300:				break;
ADDRGP4 $193
JUMPV
LABELV $195
line 302
;301:			}
;302:			default: {
line 303
;303:				team = "red";
ADDRLP4 8
ADDRGP4 $200
ASGNP4
line 304
;304:				break;
line 307
;305:			}
;306:		}
;307:	}
ADDRGP4 $193
JUMPV
LABELV $192
line 308
;308:	else {
line 309
;309:		team = "default";
ADDRLP4 8
ADDRGP4 $118
ASGNP4
line 310
;310:	}
LABELV $193
line 311
;311:	charactersFolder = "";
ADDRLP4 4
ADDRGP4 $201
ASGNP4
ADDRGP4 $203
JUMPV
LABELV $202
line 312
;312:	while(1) {
line 313
;313:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $205
line 314
;314:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $209
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $209
line 316
;315:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;316:				Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $211
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
line 317
;317:			}
ADDRGP4 $210
JUMPV
LABELV $209
line 318
;318:			else {
line 320
;319:				//								"models/players/characters/james/lower_lily_red.skin"
;320:				Com_sprintf( filename, length, "models/players/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $212
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
line 321
;321:			}
LABELV $210
line 322
;322:			if ( CG_FileExists( filename ) ) {
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
EQI4 $213
line 323
;323:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $191
JUMPV
LABELV $213
line 325
;324:			}
;325:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $215
line 326
;326:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $218
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $218
line 328
;327:					//								"models/players/characters/james/stroggs/lower_red.skin"
;328:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $220
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
line 329
;329:				}
ADDRGP4 $216
JUMPV
LABELV $218
line 330
;330:				else {
line 332
;331:					//								"models/players/characters/james/lower_red.skin"
;332:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $221
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
line 333
;333:				}
line 334
;334:			}
ADDRGP4 $216
JUMPV
LABELV $215
line 335
;335:			else {
line 336
;336:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $222
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $222
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $222
line 338
;337:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;338:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $220
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
line 339
;339:				}
ADDRGP4 $223
JUMPV
LABELV $222
line 340
;340:				else {
line 342
;341:					//								"models/players/characters/james/lower_lily.skin"
;342:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $221
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
line 343
;343:				}
LABELV $223
line 344
;344:			}
LABELV $216
line 345
;345:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $224
line 346
;346:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $191
JUMPV
LABELV $224
line 348
;347:			}
;348:			if ( !teamName || !*teamName ) {
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $226
LABELV $228
line 349
;349:				break;
ADDRGP4 $207
JUMPV
LABELV $226
line 351
;350:			}
;351:		}
LABELV $206
line 313
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $205
LABELV $207
line 353
;352:		// if tried the heads folder first
;353:		if ( charactersFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $229
line 354
;354:			break;
ADDRGP4 $204
JUMPV
LABELV $229
line 356
;355:		}
;356:		charactersFolder = "characters/";
ADDRLP4 4
ADDRGP4 $231
ASGNP4
line 357
;357:	}
LABELV $203
line 312
ADDRGP4 $202
JUMPV
LABELV $204
line 359
;358:
;359:	return qfalse;
CNSTI4 0
RETI4
LABELV $191
endproc CG_FindClientModelFile 32 40
proc CG_FindClientHeadFile 32 40
line 367
;360:}
;361:
;362:/*
;363:==========================
;364:CG_FindClientHeadFile
;365:==========================
;366:*/
;367:static qboolean	CG_FindClientHeadFile( char *filename, int length, clientInfo_t *ci, const char *teamName, const char *headModelName, const char *headSkinName, const char *base, const char *ext ) {
line 371
;368:	char *team, *headsFolder;
;369:	int i;
;370:
;371:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $233
line 372
;372:		switch ( ci->team ) {
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
EQI4 $239
ADDRGP4 $236
JUMPV
LABELV $239
line 373
;373:			case TEAM_BLUE: {
line 374
;374:				team = "blue";
ADDRLP4 8
ADDRGP4 $199
ASGNP4
line 375
;375:				break;
ADDRGP4 $234
JUMPV
LABELV $236
line 377
;376:			}
;377:			default: {
line 378
;378:				team = "red";
ADDRLP4 8
ADDRGP4 $200
ASGNP4
line 379
;379:				break;
line 382
;380:			}
;381:		}
;382:	}
ADDRGP4 $234
JUMPV
LABELV $233
line 383
;383:	else {
line 384
;384:		team = "default";
ADDRLP4 8
ADDRGP4 $118
ASGNP4
line 385
;385:	}
LABELV $234
line 387
;386:
;387:	if ( headModelName[0] == '*' ) {
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $240
line 388
;388:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $242
ASGNP4
line 389
;389:		headModelName++;
ADDRFP4 16
ADDRFP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 390
;390:	}
ADDRGP4 $244
JUMPV
LABELV $240
line 391
;391:	else {
line 392
;392:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $201
ASGNP4
line 393
;393:	}
ADDRGP4 $244
JUMPV
LABELV $243
line 394
;394:	while(1) {
line 395
;395:		for ( i = 0; i < 2; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $246
line 396
;396:			if ( i == 0 && teamName && *teamName ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $250
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $250
line 397
;397:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $252
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
line 398
;398:			}
ADDRGP4 $251
JUMPV
LABELV $250
line 399
;399:			else {
line 400
;400:				Com_sprintf( filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $253
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
line 401
;401:			}
LABELV $251
line 402
;402:			if ( CG_FileExists( filename ) ) {
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
EQI4 $254
line 403
;403:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $232
JUMPV
LABELV $254
line 405
;404:			}
;405:			if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $256
line 406
;406:				if ( i == 0 &&  teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $259
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $259
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $259
line 407
;407:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $220
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
line 408
;408:				}
ADDRGP4 $257
JUMPV
LABELV $259
line 409
;409:				else {
line 410
;410:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $221
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
line 411
;411:				}
line 412
;412:			}
ADDRGP4 $257
JUMPV
LABELV $256
line 413
;413:			else {
line 414
;414:				if ( i == 0 && teamName && *teamName ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $261
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $261
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $261
line 415
;415:					Com_sprintf( filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $220
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
line 416
;416:				}
ADDRGP4 $262
JUMPV
LABELV $261
line 417
;417:				else {
line 418
;418:					Com_sprintf( filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $221
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
line 419
;419:				}
LABELV $262
line 420
;420:			}
LABELV $257
line 421
;421:			if ( CG_FileExists( filename ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $263
line 422
;422:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $232
JUMPV
LABELV $263
line 424
;423:			}
;424:			if ( !teamName || !*teamName ) {
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $265
LABELV $267
line 425
;425:				break;
ADDRGP4 $248
JUMPV
LABELV $265
line 427
;426:			}
;427:		}
LABELV $247
line 395
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $246
LABELV $248
line 429
;428:		// if tried the heads folder first
;429:		if ( headsFolder[0] ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $268
line 430
;430:			break;
ADDRGP4 $245
JUMPV
LABELV $268
line 432
;431:		}
;432:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $242
ASGNP4
line 433
;433:	}
LABELV $244
line 394
ADDRGP4 $243
JUMPV
LABELV $245
line 435
;434:
;435:	return qfalse;
CNSTI4 0
RETI4
LABELV $232
endproc CG_FindClientHeadFile 32 40
proc CG_RegisterClientSkin 84 32
line 443
;436:}
;437:
;438:/*
;439:==========================
;440:CG_RegisterClientSkin
;441:==========================
;442:*/
;443:static qboolean	CG_RegisterClientSkin( clientInfo_t *ci, const char *teamName, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName ) {
line 468
;444:	char filename[MAX_QPATH];
;445:
;446:	/*
;447:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%slower_%s.skin", modelName, teamName, skinName );
;448:	ci->legsSkin = trap_R_RegisterSkin( filename );
;449:	if (!ci->legsSkin) {
;450:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%slower_%s.skin", modelName, teamName, skinName );
;451:		ci->legsSkin = trap_R_RegisterSkin( filename );
;452:		if (!ci->legsSkin) {
;453:			Com_Printf( "Leg skin load failure: %s\n", filename );
;454:		}
;455:	}
;456:
;457:
;458:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%supper_%s.skin", modelName, teamName, skinName );
;459:	ci->torsoSkin = trap_R_RegisterSkin( filename );
;460:	if (!ci->torsoSkin) {
;461:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%supper_%s.skin", modelName, teamName, skinName );
;462:		ci->torsoSkin = trap_R_RegisterSkin( filename );
;463:		if (!ci->torsoSkin) {
;464:			Com_Printf( "Torso skin load failure: %s\n", filename );
;465:		}
;466:	}
;467:	*/
;468:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "lower", "skin" ) ) {
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
ADDRGP4 $273
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 64
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $271
line 469
;469:		ci->legsSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 470
;470:	}
LABELV $271
line 471
;471:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $275
line 472
;472:		Com_Printf( "Leg skin load failure: %s\n", filename );
ADDRGP4 $277
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 473
;473:	}
LABELV $275
line 475
;474:
;475:	if ( CG_FindClientModelFile( filename, sizeof(filename), ci, teamName, modelName, skinName, "upper", "skin" ) ) {
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
ADDRGP4 $280
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 68
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $278
line 476
;476:		ci->torsoSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 477
;477:	}
LABELV $278
line 478
;478:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $281
line 479
;479:		Com_Printf( "Torso skin load failure: %s\n", filename );
ADDRGP4 $283
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 480
;480:	}
LABELV $281
line 482
;481:
;482:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headModelName, headSkinName, "head", "skin" ) ) {
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
ADDRGP4 $286
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 72
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $284
line 483
;483:		ci->headSkin = trap_R_RegisterSkin( filename );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 484
;484:	}
LABELV $284
line 485
;485:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 0
NEI4 $287
line 486
;486:		Com_Printf( "Head skin load failure: %s\n", filename );
ADDRGP4 $289
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 487
;487:	}
LABELV $287
line 490
;488:
;489:	// if any skins failed to load
;490:	if ( !ci->legsSkin || !ci->torsoSkin || !ci->headSkin ) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $293
ADDRLP4 76
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $293
ADDRLP4 76
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $290
LABELV $293
line 491
;491:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $270
JUMPV
LABELV $290
line 493
;492:	}
;493:	return qtrue;
CNSTI4 1
RETI4
LABELV $270
endproc CG_RegisterClientSkin 84 32
proc CG_RegisterClientModelname 292 32
line 501
;494:}
;495:
;496:/*
;497:==========================
;498:CG_RegisterClientModelname
;499:==========================
;500:*/
;501:static qboolean CG_RegisterClientModelname( clientInfo_t *ci, const char *modelName, const char *skinName, const char *headModelName, const char *headSkinName, const char *teamName ) {
line 506
;502:	char	filename[MAX_QPATH*2];
;503:	const char		*headName;
;504:	char newTeamName[MAX_QPATH*2];
;505:
;506:	if ( headModelName[0] == '\0' ) {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $295
line 507
;507:		headName = modelName;
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
line 508
;508:	}
ADDRGP4 $296
JUMPV
LABELV $295
line 509
;509:	else {
line 510
;510:		headName = headModelName;
ADDRLP4 128
ADDRFP4 12
INDIRP4
ASGNP4
line 511
;511:	}
LABELV $296
line 512
;512:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $297
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 513
;513:	ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 260
INDIRI4
ASGNI4
line 514
;514:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $298
line 515
;515:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $300
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 516
;516:		ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 517
;517:		if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 518
;518:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $303
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 519
;519:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $301
line 521
;520:		}
;521:	}
LABELV $298
line 523
;522:
;523:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $304
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 524
;524:	ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 525
;525:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $305
line 526
;526:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $307
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 527
;527:		ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 528
;528:		if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $308
line 529
;529:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $303
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 530
;530:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $308
line 532
;531:		}
;532:	}
LABELV $305
line 534
;533:
;534:	if( headName[0] == '*' ) {
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $310
line 535
;535:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $312
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
line 536
;536:	}
ADDRGP4 $311
JUMPV
LABELV $310
line 537
;537:	else {
line 538
;538:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $313
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 539
;539:	}
LABELV $311
line 540
;540:	ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 542
;541:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;542:	if ( !ci->headModel && headName[0] != '*' ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $314
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $314
line 543
;543:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $312
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
line 544
;544:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 276
INDIRI4
ASGNI4
line 545
;545:	}
LABELV $314
line 546
;546:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $316
line 547
;547:		Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $303
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 548
;548:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $316
line 552
;549:	}
;550:
;551:	// if any skins failed to load, return failure
;552:	if ( !CG_RegisterClientSkin( ci, teamName, modelName, skinName, headName, headSkinName ) ) {
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
NEI4 $318
line 553
;553:		if ( teamName && *teamName) {
ADDRLP4 276
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $320
ADDRLP4 276
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $320
line 554
;554:			Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $322
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
line 555
;555:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $323
line 556
;556:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $325
ARGP4
ADDRGP4 $326
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 557
;557:			}
ADDRGP4 $324
JUMPV
LABELV $323
line 558
;558:			else {
line 559
;559:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $325
ARGP4
ADDRGP4 $327
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 560
;560:			}
LABELV $324
line 561
;561:			if ( !CG_RegisterClientSkin( ci, newTeamName, modelName, skinName, headName, headSkinName ) ) {
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
NEI4 $321
line 562
;562:				Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $322
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
line 563
;563:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
line 565
;564:			}
;565:		} else {
LABELV $320
line 566
;566:			Com_Printf( "Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName );
ADDRGP4 $330
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
line 567
;567:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $321
line 569
;568:		}
;569:	}
LABELV $318
line 572
;570:
;571:	// load the animations
;572:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $331
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 573
;573:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
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
NEI4 $332
line 574
;574:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
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
line 575
;575:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
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
NEI4 $335
line 576
;576:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $337
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 577
;577:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $335
line 579
;578:		}
;579:	}
LABELV $332
line 581
;580:
;581:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin" ) ) {
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
ADDRGP4 $340
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 280
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $338
line 582
;582:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 583
;583:	}
ADDRGP4 $339
JUMPV
LABELV $338
line 584
;584:	else if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga" ) ) {
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
ADDRGP4 $340
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 284
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $341
line 585
;585:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 288
INDIRI4
ASGNI4
line 586
;586:	}
LABELV $341
LABELV $339
line 588
;587:
;588:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $344
line 589
;589:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $344
line 592
;590:	}
;591:
;592:	return qtrue;
CNSTI4 1
RETI4
LABELV $294
endproc CG_RegisterClientModelname 292 32
proc CG_ColorFromString 20 4
line 600
;593:}
;594:
;595:/*
;596:====================
;597:CG_ColorFromString
;598:====================
;599:*/
;600:static void CG_ColorFromString( const char *v, vec3_t color ) {
line 603
;601:	int val;
;602:
;603:	VectorClear( color );
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
line 605
;604:
;605:	val = atoi( v );
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
line 607
;606:
;607:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $349
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $347
LABELV $349
line 608
;608:		VectorSet( color, 1, 1, 1 );
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
line 609
;609:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 612
;610:	}
;611:
;612:	if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $350
line 613
;613:		color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 614
;614:	}
LABELV $350
line 615
;615:	if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $352
line 616
;616:		color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 617
;617:	}
LABELV $352
line 618
;618:	if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $354
line 619
;619:		color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 620
;620:	}
LABELV $354
line 621
;621:}
LABELV $346
endproc CG_ColorFromString 20 4
proc CG_LoadClientInfo 152 24
line 631
;622:
;623:/*
;624:===================
;625:CG_LoadClientInfo
;626:
;627:Load it now, taking the disk hits.
;628:This will usually be deferred to a safe time
;629:===================
;630:*/
;631:static void CG_LoadClientInfo( clientInfo_t *ci ) {
line 638
;632:	const char	*dir, *fallback;
;633:	int			i, modelloaded;
;634:	const char	*s;
;635:	int			clientNum;
;636:	char		teamname[MAX_QPATH];
;637:
;638:	teamname[0] = 0;
ADDRLP4 24
CNSTI1 0
ASGNI1
line 651
;639:#ifdef MISSIONPACK
;640:	if( cgs.gametype >= GT_TEAM) {
;641:		if( ci->team == TEAM_BLUE ) {
;642:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
;643:		} else {
;644:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
;645:		}
;646:	}
;647:	if( teamname[0] ) {
;648:		strcat( teamname, "/" );
;649:	}
;650:#endif
;651:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 652
;652:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname ) ) {
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 288
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 352
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 92
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $357
line 653
;653:		if ( cg_buildScript.integer ) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $359
line 654
;654:			CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
ADDRGP4 $362
ARGP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 288
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 352
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 655
;655:		}
LABELV $359
line 658
;656:
;657:		// fall back to default team name
;658:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $363
line 660
;659:			// keep skin name
;660:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $366
line 661
;661:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 24
ARGP4
ADDRGP4 $326
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 662
;662:			} else {
ADDRGP4 $367
JUMPV
LABELV $366
line 663
;663:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 24
ARGP4
ADDRGP4 $327
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 664
;664:			}
LABELV $367
line 665
;665:			if ( !CG_RegisterClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, DEFAULT_TEAM_HEAD, ci->skinName, teamname ) ) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 $370
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRLP4 96
INDIRP4
CNSTI4 224
ADDP4
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
ADDRLP4 24
ARGP4
ADDRLP4 108
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $364
line 666
;666:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_TEAM_MODEL, ci->skinName );
ADDRGP4 $371
ARGP4
ADDRGP4 $370
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 667
;667:			}
line 668
;668:		} else {
ADDRGP4 $364
JUMPV
LABELV $363
line 669
;669:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 $370
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 $118
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 104
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $372
line 670
;670:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $374
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 671
;671:			}
LABELV $372
line 672
;672:		}
LABELV $364
line 673
;673:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 674
;674:	}
LABELV $357
line 676
;675:
;676:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 677
;677:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $375
line 680
;678:		orientation_t tag;
;679:		// if the torso model has the "tag_flag"
;680:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
ADDRLP4 96
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $379
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $377
line 681
;681:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 682
;682:		}
LABELV $377
line 683
;683:	}
LABELV $375
line 686
;684:
;685:	// sounds
;686:	dir = ci->modelName;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 687
;687:	fallback = (cgs.gametype >= GT_TEAM) ? DEFAULT_TEAM_MODEL : DEFAULT_MODEL;
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $382
ADDRLP4 96
ADDRGP4 $370
ASGNP4
ADDRGP4 $383
JUMPV
LABELV $382
ADDRLP4 96
ADDRGP4 $370
ASGNP4
LABELV $383
ADDRLP4 20
ADDRLP4 96
INDIRP4
ASGNP4
line 689
;688:
;689:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $384
line 690
;690:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 691
;691:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $388
line 692
;692:			break;
ADDRGP4 $386
JUMPV
LABELV $388
line 694
;693:		}
;694:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 696
;695:		// if the model didn't load use the sounds of the default model
;696:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $390
line 697
;697:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $392
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 698
;698:		}
LABELV $390
line 699
;699:		if ( !ci->sounds[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $393
line 700
;700:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", fallback, s + 1), qfalse );
ADDRGP4 $392
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 104
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1580
ADDP4
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 701
;701:		}
LABELV $393
line 702
;702:	}
LABELV $385
line 689
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $384
LABELV $386
line 704
;703:
;704:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 708
;705:
;706:	// reset any existing players and bodies, because they might be in bad
;707:	// frames for this new model
;708:	clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+40972
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1708
DIVI4
ASGNI4
line 709
;709:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $396
line 710
;710:		if ( cg_entities[i].currentState.clientNum == clientNum
ADDRLP4 100
CNSTI4 732
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $400
ADDRLP4 100
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $400
line 711
;711:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 712
;712:			CG_ResetPlayerEntity( &cg_entities[i] );
CNSTI4 732
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 713
;713:		}
LABELV $400
line 714
;714:	}
LABELV $397
line 709
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $396
line 715
;715:}
LABELV $356
endproc CG_LoadClientInfo 152 24
proc CG_CopyClientInfoModel 52 12
line 722
;716:
;717:/*
;718:======================
;719:CG_CopyClientInfoModel
;720:======================
;721:*/
;722:static void CG_CopyClientInfoModel( clientInfo_t *from, clientInfo_t *to ) {
line 723
;723:	VectorCopy( from->headOffset, to->headOffset );
ADDRLP4 0
CNSTI4 496
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
line 724
;724:	to->footsteps = from->footsteps;
ADDRLP4 4
CNSTI4 508
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
line 725
;725:	to->gender = from->gender;
ADDRLP4 8
CNSTI4 512
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
line 727
;726:
;727:	to->legsModel = from->legsModel;
ADDRLP4 12
CNSTI4 516
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
line 728
;728:	to->legsSkin = from->legsSkin;
ADDRLP4 16
CNSTI4 520
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
line 729
;729:	to->torsoModel = from->torsoModel;
ADDRLP4 20
CNSTI4 524
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
line 730
;730:	to->torsoSkin = from->torsoSkin;
ADDRLP4 24
CNSTI4 528
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
line 731
;731:	to->headModel = from->headModel;
ADDRLP4 28
CNSTI4 532
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
line 732
;732:	to->headSkin = from->headSkin;
ADDRLP4 32
CNSTI4 536
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
line 733
;733:	to->modelIcon = from->modelIcon;
ADDRLP4 36
CNSTI4 540
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
line 735
;734:
;735:	to->newAnims = from->newAnims;
ADDRLP4 40
CNSTI4 484
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
line 737
;736:
;737:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
ADDRLP4 44
CNSTI4 544
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 738
;738:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
ADDRLP4 48
CNSTI4 1580
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
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 739
;739:}
LABELV $404
endproc CG_CopyClientInfoModel 52 12
proc CG_ScanForExistingClientInfo 60 8
line 746
;740:
;741:/*
;742:======================
;743:CG_ScanForExistingClientInfo
;744:======================
;745:*/
;746:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 750
;747:	int		i;
;748:	clientInfo_t	*match;
;749:
;750:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $406
line 751
;751:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 752
;752:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $412
line 753
;753:			continue;
ADDRGP4 $407
JUMPV
LABELV $412
line 755
;754:		}
;755:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $414
line 756
;756:			continue;
ADDRGP4 $407
JUMPV
LABELV $414
line 758
;757:		}
;758:		if ( !Q_stricmp( ci->modelName, match->modelName )
ADDRLP4 8
CNSTI4 160
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
NEI4 $416
ADDRLP4 16
CNSTI4 224
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
NEI4 $416
ADDRLP4 24
CNSTI4 288
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
NEI4 $416
ADDRLP4 32
CNSTI4 352
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
NEI4 $416
ADDRLP4 40
CNSTI4 448
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
NEI4 $416
ADDRLP4 48
CNSTI4 416
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
NEI4 $416
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $419
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
NEI4 $416
LABELV $419
line 764
;759:			&& !Q_stricmp( ci->skinName, match->skinName )
;760:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;761:			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;762:			&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;763:			&& !Q_stricmp( ci->redTeam, match->redTeam )
;764:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) ) {
line 767
;765:			// this clientinfo is identical, so use it's handles
;766:
;767:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 769
;768:
;769:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 771
;770:
;771:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $405
JUMPV
LABELV $416
line 773
;772:		}
;773:	}
LABELV $407
line 750
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $409
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $406
line 776
;774:
;775:	// nothing matches, so defer the load
;776:	return qfalse;
CNSTI4 0
RETI4
LABELV $405
endproc CG_ScanForExistingClientInfo 60 8
proc CG_SetDeferredClientInfo 36 8
line 787
;777:}
;778:
;779:/*
;780:======================
;781:CG_SetDeferredClientInfo
;782:
;783:We aren't going to load it now, so grab some other
;784:client's info to use until we have some spare time.
;785:======================
;786:*/
;787:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 793
;788:	int		i;
;789:	clientInfo_t	*match;
;790:
;791:	// if someone else is already the same models and skins we
;792:	// can just load the client info
;793:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $421
line 794
;794:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 795
;795:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $429
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $427
LABELV $429
line 796
;796:			continue;
ADDRGP4 $422
JUMPV
LABELV $427
line 798
;797:		}
;798:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 224
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
NEI4 $434
ADDRLP4 24
CNSTI4 160
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
NEI4 $434
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $430
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
EQI4 $430
LABELV $434
line 802
;799:			 Q_stricmp( ci->modelName, match->modelName ) ||
;800://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;801://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;802:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 803
;803:			continue;
ADDRGP4 $422
JUMPV
LABELV $430
line 806
;804:		}
;805:		// just load the real info cause it uses the same models and skins
;806:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 807
;807:		return;
ADDRGP4 $420
JUMPV
LABELV $422
line 793
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $424
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $421
line 811
;808:	}
;809:
;810:	// if we are in teamplay, only grab a model if the skin is correct
;811:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $435
line 812
;812:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $438
line 813
;813:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 814
;814:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $446
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $444
LABELV $446
line 815
;815:				continue;
ADDRGP4 $439
JUMPV
LABELV $444
line 817
;816:			}
;817:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
ADDRLP4 16
CNSTI4 224
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
NEI4 $450
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $447
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
EQI4 $447
LABELV $450
line 818
;818:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 819
;819:				continue;
ADDRGP4 $439
JUMPV
LABELV $447
line 821
;820:			}
;821:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 822
;822:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 823
;823:			return;
ADDRGP4 $420
JUMPV
LABELV $439
line 812
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $441
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $438
line 829
;824:		}
;825:		// load the full model, because we don't ever want to show
;826:		// an improper team skin.  This will cause a hitch for the first
;827:		// player, when the second enters.  Combat shouldn't be going on
;828:		// yet, so it shouldn't matter
;829:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 830
;830:		return;
ADDRGP4 $420
JUMPV
LABELV $435
line 834
;831:	}
;832:
;833:	// find the first valid clientinfo and grab its stuff
;834:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $454
JUMPV
LABELV $451
line 835
;835:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 836
;836:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $457
line 837
;837:			continue;
ADDRGP4 $452
JUMPV
LABELV $457
line 840
;838:		}
;839:
;840:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 841
;841:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 842
;842:		return;
ADDRGP4 $420
JUMPV
LABELV $452
line 834
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $454
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $451
line 846
;843:	}
;844:
;845:	// we should never get here...
;846:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $459
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 848
;847:
;848:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 849
;849:}
LABELV $420
endproc CG_SetDeferredClientInfo 36 8
export CG_NewClientInfo
proc CG_NewClientInfo 1888 12
line 857
;850:
;851:
;852:/*
;853:======================
;854:CG_NewClientInfo
;855:======================
;856:*/
;857:void CG_NewClientInfo( int clientNum ) {
line 864
;858:	clientInfo_t *ci;
;859:	clientInfo_t newInfo;
;860:	const char	*configstring;
;861:	const char	*v;
;862:	char		*slash;
;863:
;864:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1720
CNSTI4 1708
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 866
;865:
;866:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1724
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1712
ADDRLP4 1724
INDIRP4
ASGNP4
line 867
;867:	if ( !configstring[0] ) {
ADDRLP4 1712
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $462
line 868
;868:		memset( ci, 0, sizeof( *ci ) );
ADDRLP4 1720
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1708
ARGI4
ADDRGP4 memset
CALLP4
pop
line 869
;869:		return;		// player just left
ADDRGP4 $460
JUMPV
LABELV $462
line 874
;870:	}
;871:
;872:	// build into a temp buffer so the defer checks can use
;873:	// the old value
;874:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1708
ARGI4
ADDRGP4 memset
CALLP4
pop
line 877
;875:
;876:	// isolate the player's name
;877:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 1728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1728
INDIRP4
ASGNP4
line 878
;878:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
ADDRLP4 0+4
ARGP4
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 881
;879:
;880:	// colors
;881:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $467
ARGP4
ADDRLP4 1732
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1732
INDIRP4
ASGNP4
line 882
;882:	CG_ColorFromString( v, newInfo.color1 );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 0+76
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 884
;883:
;884:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $469
ARGP4
ADDRLP4 1736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1736
INDIRP4
ASGNP4
line 885
;885:	CG_ColorFromString( v, newInfo.color2 );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 0+88
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 888
;886:
;887:	// bot skill
;888:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $471
ARGP4
ADDRLP4 1740
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1740
INDIRP4
ASGNP4
line 889
;889:	newInfo.botSkill = atoi( v );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1744
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+72
ADDRLP4 1744
INDIRI4
ASGNI4
line 892
;890:
;891:	// handicap
;892:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 1748
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1748
INDIRP4
ASGNP4
line 893
;893:	newInfo.handicap = atoi( v );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1752
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+120
ADDRLP4 1752
INDIRI4
ASGNI4
line 896
;894:
;895:	// wins
;896:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 1756
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1756
INDIRP4
ASGNP4
line 897
;897:	newInfo.wins = atoi( v );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1760
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+124
ADDRLP4 1760
INDIRI4
ASGNI4
line 900
;898:
;899:	// losses
;900:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $477
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1764
INDIRP4
ASGNP4
line 901
;901:	newInfo.losses = atoi( v );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1768
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+128
ADDRLP4 1768
INDIRI4
ASGNI4
line 904
;902:
;903:	// team
;904:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 1772
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1772
INDIRP4
ASGNP4
line 905
;905:	newInfo.team = atoi( v );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1776
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+68
ADDRLP4 1776
INDIRI4
ASGNI4
line 908
;906:
;907:	// team task
;908:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $481
ARGP4
ADDRLP4 1780
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1780
INDIRP4
ASGNP4
line 909
;909:	newInfo.teamTask = atoi(v);
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1784
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+132
ADDRLP4 1784
INDIRI4
ASGNI4
line 912
;910:
;911:	// team leader
;912:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRLP4 1788
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1788
INDIRP4
ASGNP4
line 913
;913:	newInfo.teamLeader = atoi(v);
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 1792
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+136
ADDRLP4 1792
INDIRI4
ASGNI4
line 915
;914:
;915:	v = Info_ValueForKey( configstring, "g_redteam" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $485
ARGP4
ADDRLP4 1796
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1796
INDIRP4
ASGNP4
line 916
;916:	Q_strncpyz(newInfo.redTeam, v, MAX_TEAMNAME);
ADDRLP4 0+416
ARGP4
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 918
;917:
;918:	v = Info_ValueForKey( configstring, "g_blueteam" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $487
ARGP4
ADDRLP4 1800
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1800
INDIRP4
ASGNP4
line 919
;919:	Q_strncpyz(newInfo.blueTeam, v, MAX_TEAMNAME);
ADDRLP4 0+448
ARGP4
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 922
;920:
;921:	// model
;922:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $489
ARGP4
ADDRLP4 1804
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1804
INDIRP4
ASGNP4
line 923
;923:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $490
line 929
;924:		// forcemodel makes everyone use a single model
;925:		// to prevent load hitches
;926:		char modelStr[MAX_QPATH];
;927:		char *skin;
;928:
;929:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $493
line 930
;930:			Q_strncpyz( newInfo.modelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.modelName ) );
ADDRLP4 0+160
ARGP4
ADDRGP4 $370
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 931
;931:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 932
;932:		} else {
ADDRGP4 $494
JUMPV
LABELV $493
line 933
;933:			trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $489
ARGP4
ADDRLP4 1808
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 934
;934:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 1808
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1876
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1872
ADDRLP4 1876
INDIRP4
ASGNP4
ADDRLP4 1876
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $500
line 935
;935:				skin = "default";
ADDRLP4 1872
ADDRGP4 $118
ASGNP4
line 936
;936:			} else {
ADDRGP4 $501
JUMPV
LABELV $500
line 937
;937:				*skin++ = 0;
ADDRLP4 1880
ADDRLP4 1872
INDIRP4
ASGNP4
ADDRLP4 1872
ADDRLP4 1880
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1880
INDIRP4
CNSTI1 0
ASGNI1
line 938
;938:			}
LABELV $501
line 940
;939:
;940:			Q_strncpyz( newInfo.skinName, skin, sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRLP4 1872
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 941
;941:			Q_strncpyz( newInfo.modelName, modelStr, sizeof( newInfo.modelName ) );
ADDRLP4 0+160
ARGP4
ADDRLP4 1808
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 942
;942:		}
LABELV $494
line 944
;943:
;944:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $491
line 946
;945:			// keep skin name
;946:			slash = strchr( v, '/' );
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1876
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1716
ADDRLP4 1876
INDIRP4
ASGNP4
line 947
;947:			if ( slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $491
line 948
;948:				Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRLP4 1716
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 949
;949:			}
line 950
;950:		}
line 951
;951:	} else {
ADDRGP4 $491
JUMPV
LABELV $490
line 952
;952:		Q_strncpyz( newInfo.modelName, v, sizeof( newInfo.modelName ) );
ADDRLP4 0+160
ARGP4
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 954
;953:
;954:		slash = strchr( newInfo.modelName, '/' );
ADDRLP4 0+160
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1808
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1716
ADDRLP4 1808
INDIRP4
ASGNP4
line 955
;955:		if ( !slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $516
line 957
;956:			// modelName didn not include a skin name
;957:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 958
;958:		} else {
ADDRGP4 $517
JUMPV
LABELV $516
line 959
;959:			Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRLP4 1716
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 961
;960:			// truncate modelName
;961:			*slash = 0;
ADDRLP4 1716
INDIRP4
CNSTI1 0
ASGNI1
line 962
;962:		}
LABELV $517
line 963
;963:	}
LABELV $491
line 966
;964:
;965:	// head model
;966:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 1808
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1808
INDIRP4
ASGNP4
line 967
;967:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $523
line 973
;968:		// forcemodel makes everyone use a single model
;969:		// to prevent load hitches
;970:		char modelStr[MAX_QPATH];
;971:		char *skin;
;972:
;973:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $526
line 974
;974:			Q_strncpyz( newInfo.headModelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.headModelName ) );
ADDRLP4 0+288
ARGP4
ADDRGP4 $370
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 975
;975:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 976
;976:		} else {
ADDRGP4 $527
JUMPV
LABELV $526
line 977
;977:			trap_Cvar_VariableStringBuffer( "headmodel", modelStr, sizeof( modelStr ) );
ADDRGP4 $533
ARGP4
ADDRLP4 1812
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 978
;978:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
ADDRLP4 1812
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1880
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1876
ADDRLP4 1880
INDIRP4
ASGNP4
ADDRLP4 1880
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $534
line 979
;979:				skin = "default";
ADDRLP4 1876
ADDRGP4 $118
ASGNP4
line 980
;980:			} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 981
;981:				*skin++ = 0;
ADDRLP4 1884
ADDRLP4 1876
INDIRP4
ASGNP4
ADDRLP4 1876
ADDRLP4 1884
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1884
INDIRP4
CNSTI1 0
ASGNI1
line 982
;982:			}
LABELV $535
line 984
;983:
;984:			Q_strncpyz( newInfo.headSkinName, skin, sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRLP4 1876
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 985
;985:			Q_strncpyz( newInfo.headModelName, modelStr, sizeof( newInfo.headModelName ) );
ADDRLP4 0+288
ARGP4
ADDRLP4 1812
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 986
;986:		}
LABELV $527
line 988
;987:
;988:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $524
line 990
;989:			// keep skin name
;990:			slash = strchr( v, '/' );
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1880
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1716
ADDRLP4 1880
INDIRP4
ASGNP4
line 991
;991:			if ( slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $524
line 992
;992:				Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRLP4 1716
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 993
;993:			}
line 994
;994:		}
line 995
;995:	} else {
ADDRGP4 $524
JUMPV
LABELV $523
line 996
;996:		Q_strncpyz( newInfo.headModelName, v, sizeof( newInfo.headModelName ) );
ADDRLP4 0+288
ARGP4
ADDRLP4 1708
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 998
;997:
;998:		slash = strchr( newInfo.headModelName, '/' );
ADDRLP4 0+288
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 1812
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1716
ADDRLP4 1812
INDIRP4
ASGNP4
line 999
;999:		if ( !slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $550
line 1001
;1000:			// modelName didn not include a skin name
;1001:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1002
;1002:		} else {
ADDRGP4 $551
JUMPV
LABELV $550
line 1003
;1003:			Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRLP4 1716
INDIRP4
CNSTI4 1
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1005
;1004:			// truncate modelName
;1005:			*slash = 0;
ADDRLP4 1716
INDIRP4
CNSTI1 0
ASGNI1
line 1006
;1006:		}
LABELV $551
line 1007
;1007:	}
LABELV $524
line 1011
;1008:
;1009:	// scan for an existing clientinfo that matches this modelname
;1010:	// so we can avoid loading checks if possible
;1011:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1812
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1812
INDIRI4
CNSTI4 0
NEI4 $556
line 1014
;1012:		qboolean	forceDefer;
;1013:
;1014:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1824
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1824
INDIRI4
CNSTI4 4000000
GEI4 $559
ADDRLP4 1820
CNSTI4 1
ASGNI4
ADDRGP4 $560
JUMPV
LABELV $559
ADDRLP4 1820
CNSTI4 0
ASGNI4
LABELV $560
ADDRLP4 1816
ADDRLP4 1820
INDIRI4
ASGNI4
line 1017
;1015:
;1016:		// if we are defering loads, just have it pick the first valid
;1017:		if ( forceDefer || (cg_deferPlayers.integer && !cg_buildScript.integer && !cg.loading ) ) {
ADDRLP4 1828
CNSTI4 0
ASGNI4
ADDRLP4 1816
INDIRI4
ADDRLP4 1828
INDIRI4
NEI4 $566
ADDRGP4 cg_deferPlayers+12
INDIRI4
ADDRLP4 1828
INDIRI4
EQI4 $561
ADDRGP4 cg_buildScript+12
INDIRI4
ADDRLP4 1828
INDIRI4
NEI4 $561
ADDRGP4 cg+20
INDIRI4
ADDRLP4 1828
INDIRI4
NEI4 $561
LABELV $566
line 1019
;1018:			// keep whatever they had if it won't violate team skins
;1019:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1021
;1020:			// if we are low on memory, leave them with this model
;1021:			if ( forceDefer ) {
ADDRLP4 1816
INDIRI4
CNSTI4 0
EQI4 $562
line 1022
;1022:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $569
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1023
;1023:				newInfo.deferred = qfalse;
ADDRLP4 0+480
CNSTI4 0
ASGNI4
line 1024
;1024:			}
line 1025
;1025:		} else {
ADDRGP4 $562
JUMPV
LABELV $561
line 1026
;1026:			CG_LoadClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1027
;1027:		}
LABELV $562
line 1028
;1028:	}
LABELV $556
line 1031
;1029:
;1030:	// replace whatever was there with the new one
;1031:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1032
;1032:	*ci = newInfo;
ADDRLP4 1720
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1708
line 1033
;1033:}
LABELV $460
endproc CG_NewClientInfo 1888 12
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 20 4
line 1046
;1034:
;1035:
;1036:
;1037:/*
;1038:======================
;1039:CG_LoadDeferredPlayers
;1040:
;1041:Called each frame when a player is dead
;1042:and the scoreboard is up
;1043:so deferred players can be loaded
;1044:======================
;1045:*/
;1046:void CG_LoadDeferredPlayers( void ) {
line 1051
;1047:	int		i;
;1048:	clientInfo_t	*ci;
;1049:
;1050:	// scan for a deferred player to load
;1051:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+40972
ASGNP4
ADDRGP4 $575
JUMPV
LABELV $572
line 1052
;1052:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $578
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $578
line 1054
;1053:			// if we are low on memory, leave it deferred
;1054:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 16
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4000000
GEI4 $580
line 1055
;1055:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $569
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1056
;1056:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 1057
;1057:				continue;
ADDRGP4 $573
JUMPV
LABELV $580
line 1059
;1058:			}
;1059:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1061
;1060://			break;
;1061:		}
LABELV $578
line 1062
;1062:	}
LABELV $573
line 1051
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1708
ADDP4
ASGNP4
LABELV $575
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $572
line 1063
;1063:}
LABELV $571
endproc CG_LoadDeferredPlayers 20 4
proc CG_SetLerpFrameAnimation 12 8
line 1081
;1064:
;1065:/*
;1066:=============================================================================
;1067:
;1068:PLAYER ANIMATION
;1069:
;1070:=============================================================================
;1071:*/
;1072:
;1073:
;1074:/*
;1075:===============
;1076:CG_SetLerpFrameAnimation
;1077:
;1078:may include ANIM_TOGGLEBIT
;1079:===============
;1080:*/
;1081:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1084
;1082:	animation_t	*anim;
;1083:
;1084:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1085
;1085:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1087
;1086:
;1087:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $585
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $583
LABELV $585
line 1088
;1088:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $586
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1089
;1089:	}
LABELV $583
line 1091
;1090:
;1091:	anim = &ci->animations[ newAnimation ];
ADDRLP4 0
CNSTI4 28
ADDRFP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDP4
ASGNP4
line 1093
;1092:
;1093:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1094
;1094:	lf->animationTime = lf->frameTime + anim->initialLerp;
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
line 1096
;1095:
;1096:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $587
line 1097
;1097:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $590
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1098
;1098:	}
LABELV $587
line 1099
;1099:}
LABELV $582
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 44 12
line 1109
;1100:
;1101:/*
;1102:===============
;1103:CG_RunLerpFrame
;1104:
;1105:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1106:cg.time should be between oldFrameTime and frameTime after exit
;1107:===============
;1108:*/
;1109:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1114
;1110:	int			f, numFrames;
;1111:	animation_t	*anim;
;1112:
;1113:	// debugging tool to get no animations
;1114:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $592
line 1115
;1115:		lf->oldFrame = lf->frame = lf->backlerp = 0;
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
line 1116
;1116:		return;
ADDRGP4 $591
JUMPV
LABELV $592
line 1120
;1117:	}
;1118:
;1119:	// see if the animation sequence is switching
;1120:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
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
NEI4 $597
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $595
LABELV $597
line 1121
;1121:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
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
line 1122
;1122:	}
LABELV $595
line 1126
;1123:
;1124:	// if we have passed the current frame, move it to
;1125:	// oldFrame and calculate a new frame
;1126:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $598
line 1127
;1127:		lf->oldFrame = lf->frame;
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
line 1128
;1128:		lf->oldFrameTime = lf->frameTime;
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
line 1131
;1129:
;1130:		// get the next frame based on the animation
;1131:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1132
;1132:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $601
line 1133
;1133:			return;		// shouldn't happen
ADDRGP4 $591
JUMPV
LABELV $601
line 1135
;1134:		}
;1135:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $603
line 1136
;1136:			lf->frameTime = lf->animationTime;		// initial lerp
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
line 1137
;1137:		} else {
ADDRGP4 $604
JUMPV
LABELV $603
line 1138
;1138:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
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
line 1139
;1139:		}
LABELV $604
line 1140
;1140:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
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
line 1141
;1141:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1143
;1142:
;1143:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1144
;1144:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $606
line 1145
;1145:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1146
;1146:		}
LABELV $606
line 1147
;1147:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $608
line 1148
;1148:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1149
;1149:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $610
line 1150
;1150:				f %= anim->loopFrames;
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
line 1151
;1151:				f += anim->numFrames - anim->loopFrames;
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
line 1152
;1152:			} else {
ADDRGP4 $611
JUMPV
LABELV $610
line 1153
;1153:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1156
;1154:				// the animation is stuck at the end, so it
;1155:				// can immediately transition to another sequence
;1156:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1157
;1157:			}
LABELV $611
line 1158
;1158:		}
LABELV $608
line 1159
;1159:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $613
line 1160
;1160:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
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
line 1161
;1161:		}
ADDRGP4 $614
JUMPV
LABELV $613
line 1162
;1162:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $615
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $615
line 1163
;1163:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
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
line 1164
;1164:		}
ADDRGP4 $616
JUMPV
LABELV $615
line 1165
;1165:		else {
line 1166
;1166:			lf->frame = anim->firstFrame + f;
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
line 1167
;1167:		}
LABELV $616
LABELV $614
line 1168
;1168:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $617
line 1169
;1169:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1170
;1170:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $621
line 1171
;1171:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $624
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1172
;1172:			}
LABELV $621
line 1173
;1173:		}
LABELV $617
line 1174
;1174:	}
LABELV $598
line 1176
;1175:
;1176:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $625
line 1177
;1177:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1178
;1178:	}
LABELV $625
line 1180
;1179:
;1180:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $629
line 1181
;1181:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1182
;1182:	}
LABELV $629
line 1184
;1183:	// calculate current lerp value
;1184:	if ( lf->frameTime == lf->oldFrameTime ) {
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
NEI4 $633
line 1185
;1185:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1186
;1186:	} else {
ADDRGP4 $634
JUMPV
LABELV $633
line 1187
;1187:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
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
ADDRGP4 cg+107604
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
line 1188
;1188:	}
LABELV $634
line 1189
;1189:}
LABELV $591
endproc CG_RunLerpFrame 44 12
proc CG_ClearLerpFrame 16 12
line 1197
;1190:
;1191:
;1192:/*
;1193:===============
;1194:CG_ClearLerpFrame
;1195:===============
;1196:*/
;1197:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1198
;1198:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+107604
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
line 1199
;1199:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
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
line 1200
;1200:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
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
line 1201
;1201:}
LABELV $636
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1210
;1202:
;1203:
;1204:/*
;1205:===============
;1206:CG_PlayerAnimation
;1207:===============
;1208:*/
;1209:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1210:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1215
;1211:	clientInfo_t	*ci;
;1212:	int				clientNum;
;1213:	float			speedScale;
;1214:
;1215:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1217
;1216:
;1217:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $639
line 1218
;1218:		*legsOld = *legs = *torsoOld = *torso = 0;
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
line 1219
;1219:		return;
ADDRGP4 $638
JUMPV
LABELV $639
line 1222
;1220:	}
;1221:
;1222:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $642
line 1223
;1223:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1224
;1224:	} else {
ADDRGP4 $643
JUMPV
LABELV $642
line 1225
;1225:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1226
;1226:	}
LABELV $643
line 1228
;1227:
;1228:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1231
;1229:
;1230:	// do the shuffle turn frames locally
;1231:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $645
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $645
line 1232
;1232:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 452
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
line 1233
;1233:	} else {
ADDRGP4 $646
JUMPV
LABELV $645
line 1234
;1234:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 452
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
line 1235
;1235:	}
LABELV $646
line 1237
;1236:
;1237:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1238
;1238:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1239
;1239:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ASGNF4
line 1241
;1240:
;1241:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 500
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
line 1243
;1242:
;1243:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
line 1244
;1244:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1245
;1245:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRF4
ASGNF4
line 1246
;1246:}
LABELV $638
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1262
;1247:
;1248:/*
;1249:=============================================================================
;1250:
;1251:PLAYER ANGLES
;1252:
;1253:=============================================================================
;1254:*/
;1255:
;1256:/*
;1257:==================
;1258:CG_SwingAngles
;1259:==================
;1260:*/
;1261:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1262:					float speed, float *angle, qboolean *swinging ) {
line 1267
;1263:	float	swing;
;1264:	float	move;
;1265:	float	scale;
;1266:
;1267:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $648
line 1269
;1268:		// see if a swing should be started
;1269:		swing = AngleSubtract( *angle, destination );
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
line 1270
;1270:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $652
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $650
LABELV $652
line 1271
;1271:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1272
;1272:		}
LABELV $650
line 1273
;1273:	}
LABELV $648
line 1275
;1274:
;1275:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $653
line 1276
;1276:		return;
ADDRGP4 $647
JUMPV
LABELV $653
line 1281
;1277:	}
;1278:	
;1279:	// modify the speed depending on the delta
;1280:	// so it doesn't seem so linear
;1281:	swing = AngleSubtract( destination, *angle );
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
line 1282
;1282:	scale = fabs( swing );
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
line 1283
;1283:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $655
line 1284
;1284:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1285
;1285:	} else if ( scale < swingTolerance ) {
ADDRGP4 $656
JUMPV
LABELV $655
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $657
line 1286
;1286:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1287
;1287:	} else {
ADDRGP4 $658
JUMPV
LABELV $657
line 1288
;1288:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1289
;1289:	}
LABELV $658
LABELV $656
line 1292
;1290:
;1291:	// swing towards the destination angle
;1292:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $659
line 1293
;1293:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1294
;1294:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $662
line 1295
;1295:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1296
;1296:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1297
;1297:		}
LABELV $662
line 1298
;1298:		*angle = AngleMod( *angle + move );
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
line 1299
;1299:	} else if ( swing < 0 ) {
ADDRGP4 $660
JUMPV
LABELV $659
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $664
line 1300
;1300:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+107600
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
line 1301
;1301:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $667
line 1302
;1302:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1303
;1303:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1304
;1304:		}
LABELV $667
line 1305
;1305:		*angle = AngleMod( *angle + move );
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
line 1306
;1306:	}
LABELV $664
LABELV $660
line 1309
;1307:
;1308:	// clamp to no more than tolerance
;1309:	swing = AngleSubtract( destination, *angle );
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
line 1310
;1310:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $669
line 1311
;1311:		*angle = AngleMod( destination - (clampTolerance - 1) );
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
line 1312
;1312:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $670
JUMPV
LABELV $669
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $671
line 1313
;1313:		*angle = AngleMod( destination + (clampTolerance - 1) );
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
line 1314
;1314:	}
LABELV $671
LABELV $670
line 1315
;1315:}
LABELV $647
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1322
;1316:
;1317:/*
;1318:=================
;1319:CG_AddPainTwitch
;1320:=================
;1321:*/
;1322:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1326
;1323:	int		t;
;1324:	float	f;
;1325:
;1326:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1327
;1327:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $675
line 1328
;1328:		return;
ADDRGP4 $673
JUMPV
LABELV $675
line 1331
;1329:	}
;1330:
;1331:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 1333
;1332:
;1333:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $677
line 1334
;1334:		torsoAngles[ROLL] += 20 * f;
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
line 1335
;1335:	} else {
ADDRGP4 $678
JUMPV
LABELV $677
line 1336
;1336:		torsoAngles[ROLL] -= 20 * f;
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
line 1337
;1337:	}
LABELV $678
line 1338
;1338:}
LABELV $673
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $680
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
line 1355
;1339:
;1340:
;1341:/*
;1342:===============
;1343:CG_PlayerAngles
;1344:
;1345:Handles seperate torso motion
;1346:
;1347:  legs pivot based on direction of movement
;1348:
;1349:  head always looks exactly at cent->lerpAngles
;1350:
;1351:  if motion < 20 degrees, show in head only
;1352:  if < 45 degrees, also show in torso
;1353:===============
;1354:*/
;1355:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1364
;1356:	vec3_t		legsAngles, torsoAngles, headAngles;
;1357:	float		dest;
;1358:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1359:	vec3_t		velocity;
;1360:	float		speed;
;1361:	int			dir, clientNum;
;1362:	clientInfo_t	*ci;
;1363:
;1364:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRB
ASGNB 12
line 1365
;1365:	headAngles[YAW] = AngleMod( headAngles[YAW] );
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
line 1366
;1366:	VectorClear( legsAngles );
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
line 1367
;1367:	VectorClear( torsoAngles );
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
line 1372
;1368:
;1369:	// --------- yaw -------------
;1370:
;1371:	// allow yaw to drift a bit
;1372:	if ( ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
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
NEI4 $689
ADDRLP4 80
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 11
EQI4 $687
LABELV $689
line 1373
;1373:		|| ( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
line 1375
;1374:		// if not standing still, always point all in the same direction
;1375:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 1
ASGNI4
line 1376
;1376:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1377
;1377:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 1
ASGNI4
line 1378
;1378:	}
LABELV $687
line 1381
;1379:
;1380:	// adjust legs for movement dir
;1381:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $690
line 1383
;1382:		// don't let dead bodies twitch
;1383:		dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1384
;1384:	} else {
ADDRGP4 $691
JUMPV
LABELV $690
line 1385
;1385:		dir = cent->currentState.angles2[YAW];
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1386
;1386:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $694
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $692
LABELV $694
line 1387
;1387:			CG_Error( "Bad player movement angle" );
ADDRGP4 $695
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1388
;1388:		}
LABELV $692
line 1389
;1389:	}
LABELV $691
line 1390
;1390:	legsAngles[YAW] = headAngles[YAW] + movementOffsets[ dir ];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $680
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1391
;1391:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $680
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1394
;1392:
;1393:	// torso
;1394:	CG_SwingAngles( torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
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
CNSTI4 520
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 524
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1395
;1395:	CG_SwingAngles( legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
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
CNSTI4 472
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1397
;1396:
;1397:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRF4
ASGNF4
line 1398
;1398:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ASGNF4
line 1404
;1399:
;1400:
;1401:	// --------- pitch -------------
;1402:
;1403:	// only show a fraction of the pitch angle in the torso
;1404:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $706
line 1405
;1405:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 1406
;1406:	} else {
ADDRGP4 $707
JUMPV
LABELV $706
line 1407
;1407:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1408
;1408:	}
LABELV $707
line 1409
;1409:	CG_SwingAngles( dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
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
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1410
;1410:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1413
;1411:
;1412:	//
;1413:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1414
;1414:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $708
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $708
line 1415
;1415:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
CNSTI4 1708
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1416
;1416:		if ( ci->fixedtorso ) {
ADDRLP4 64
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $711
line 1417
;1417:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1418
;1418:		}
LABELV $711
line 1419
;1419:	}
LABELV $708
line 1425
;1420:
;1421:	// --------- roll -------------
;1422:
;1423:
;1424:	// lean towards the direction of travel
;1425:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1426
;1426:	speed = VectorNormalize( velocity );
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
line 1427
;1427:	if ( speed ) {
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $713
line 1431
;1428:		vec3_t	axis[3];
;1429:		float	side;
;1430:
;1431:		speed *= 0.05f;
ADDRLP4 56
CNSTF4 1028443341
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 1433
;1432:
;1433:		AnglesToAxis( legsAngles, axis );
ADDRLP4 12
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1434
;1434:		side = speed * DotProduct( velocity, axis[1] );
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
line 1435
;1435:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 144
INDIRF4
SUBF4
ASGNF4
line 1437
;1436:
;1437:		side = speed * DotProduct( velocity, axis[0] );
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
line 1438
;1438:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 144
INDIRF4
ADDF4
ASGNF4
line 1439
;1439:	}
LABELV $713
line 1442
;1440:
;1441:	//
;1442:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1443
;1443:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $727
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $727
line 1444
;1444:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
CNSTI4 1708
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1445
;1445:		if ( ci->fixedlegs ) {
ADDRLP4 64
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $730
line 1446
;1446:			legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1447
;1447:			legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1448
;1448:			legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1449
;1449:		}
LABELV $730
line 1450
;1450:	}
LABELV $727
line 1453
;1451:
;1452:	// pain twitch
;1453:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1456
;1454:
;1455:	// pull the angles back out of the hierarchial chain
;1456:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1457
;1457:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1458
;1458:	AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1459
;1459:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1460
;1460:	AnglesToAxis( headAngles, head );
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1461
;1461:}
LABELV $679
endproc CG_PlayerAngles 148 24
proc CG_HasteTrail 40 48
line 1471
;1462:
;1463:
;1464://==========================================================================
;1465:
;1466:/*
;1467:===============
;1468:CG_HasteTrail
;1469:===============
;1470:*/
;1471:static void CG_HasteTrail( centity_t *cent ) {
line 1476
;1472:	localEntity_t	*smoke;
;1473:	vec3_t			origin;
;1474:	int				anim;
;1475:
;1476:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $736
line 1477
;1477:		return;
ADDRGP4 $735
JUMPV
LABELV $736
line 1479
;1478:	}
;1479:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1480
;1480:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $739
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $739
line 1481
;1481:		return;
ADDRGP4 $735
JUMPV
LABELV $739
line 1484
;1482:	}
;1483:
;1484:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 436
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
line 1485
;1485:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $741
line 1486
;1486:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1487
;1487:	}
LABELV $741
line 1489
;1488:
;1489:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 1490
;1490:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1492
;1491:
;1492:	smoke = CG_SmokePuff( origin, vec3_origin, 
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
ADDRGP4 cg+107604
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
ADDRGP4 cgs+152340+428
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
line 1502
;1493:				  8, 
;1494:				  1, 1, 1, 1,
;1495:				  500, 
;1496:				  cg.time,
;1497:				  0,
;1498:				  0,
;1499:				  cgs.media.hastePuffShader );
;1500:
;1501:	// use the optimized local entity add
;1502:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1503
;1503:}
LABELV $735
endproc CG_HasteTrail 40 48
proc CG_TrailItem 188 12
line 1598
;1504:
;1505:#ifdef MISSIONPACK
;1506:/*
;1507:===============
;1508:CG_BreathPuffs
;1509:===============
;1510:*/
;1511:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
;1512:	clientInfo_t *ci;
;1513:	vec3_t up, origin;
;1514:	int contents;
;1515:
;1516:	ci = &cgs.clientinfo[ cent->currentState.number ];
;1517:
;1518:	if (!cg_enableBreath.integer) {
;1519:		return;
;1520:	}
;1521:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
;1522:		return;
;1523:	}
;1524:	if ( cent->currentState.eFlags & EF_DEAD ) {
;1525:		return;
;1526:	}
;1527:	contents = trap_CM_PointContents( head->origin, 0 );
;1528:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
;1529:		return;
;1530:	}
;1531:	if ( ci->breathPuffTime > cg.time ) {
;1532:		return;
;1533:	}
;1534:
;1535:	VectorSet( up, 0, 0, 8 );
;1536:	VectorMA(head->origin, 8, head->axis[0], origin);
;1537:	VectorMA(origin, -4, head->axis[2], origin);
;1538:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
;1539:	ci->breathPuffTime = cg.time + 2000;
;1540:}
;1541:
;1542:/*
;1543:===============
;1544:CG_DustTrail
;1545:===============
;1546:*/
;1547:static void CG_DustTrail( centity_t *cent ) {
;1548:	int				anim;
;1549:	localEntity_t	*dust;
;1550:	vec3_t end, vel;
;1551:	trace_t tr;
;1552:
;1553:	if (!cg_enableDust.integer)
;1554:		return;
;1555:
;1556:	if ( cent->dustTrailTime > cg.time ) {
;1557:		return;
;1558:	}
;1559:
;1560:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;1561:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;1562:		return;
;1563:	}
;1564:
;1565:	cent->dustTrailTime += 40;
;1566:	if ( cent->dustTrailTime < cg.time ) {
;1567:		cent->dustTrailTime = cg.time;
;1568:	}
;1569:
;1570:	VectorCopy(cent->currentState.pos.trBase, end);
;1571:	end[2] -= 64;
;1572:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;1573:
;1574:	if ( !(tr.surfaceFlags & SURF_DUST) )
;1575:		return;
;1576:
;1577:	VectorCopy( cent->currentState.pos.trBase, end );
;1578:	end[2] -= 16;
;1579:
;1580:	VectorSet(vel, 0, 0, -30);
;1581:	dust = CG_SmokePuff( end, vel,
;1582:				  24,
;1583:				  .8f, .8f, 0.7f, 0.33f,
;1584:				  500,
;1585:				  cg.time,
;1586:				  0,
;1587:				  0,
;1588:				  cgs.media.dustPuffShader );
;1589:}
;1590:
;1591:#endif
;1592:
;1593:/*
;1594:===============
;1595:CG_TrailItem
;1596:===============
;1597:*/
;1598:static void CG_TrailItem( centity_t *cent, qhandle_t hModel ) {
line 1603
;1599:	refEntity_t		ent;
;1600:	vec3_t			angles;
;1601:	vec3_t			axis[3];
;1602:
;1603:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRB
ASGNB 12
line 1604
;1604:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1605
;1605:	angles[ROLL] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1606
;1606:	AnglesToAxis( angles, axis );
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1608
;1607:
;1608:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1609
;1609:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
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
CNSTI4 712
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
CNSTI4 716
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 152+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1610
;1610:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1611
;1611:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1612
;1612:	AnglesToAxis( angles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1614
;1613:
;1614:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1615
;1615:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1616
;1616:}
LABELV $749
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 356 24
line 1624
;1617:
;1618:
;1619:/*
;1620:===============
;1621:CG_PlayerFlag
;1622:===============
;1623:*/
;1624:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 1633
;1625:	clientInfo_t	*ci;
;1626:	refEntity_t	pole;
;1627:	refEntity_t	flag;
;1628:	vec3_t		angles, dir;
;1629:	int			legsAnim, flagAnim, updateangles;
;1630:	float		angle, d;
;1631:
;1632:	// show the flag pole model
;1633:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1634
;1634:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+152340+88
INDIRI4
ASGNI4
line 1635
;1635:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1636
;1636:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1637
;1637:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1638
;1638:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
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
ADDRGP4 $379
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1639
;1639:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1642
;1640:
;1641:	// show the flag model
;1642:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1643
;1643:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+152340+92
INDIRI4
ASGNI4
line 1644
;1644:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1645
;1645:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1646
;1646:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1647
;1647:	flag.renderfx = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1649
;1648:
;1649:	VectorClear(angles);
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
line 1651
;1650:
;1651:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 1652
;1652:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1653
;1653:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $781
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $779
LABELV $781
line 1654
;1654:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1655
;1655:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $780
JUMPV
LABELV $779
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $784
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $782
LABELV $784
line 1656
;1656:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1657
;1657:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1658
;1658:	} else {
ADDRGP4 $783
JUMPV
LABELV $782
line 1659
;1659:		flagAnim = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 1660
;1660:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1661
;1661:	}
LABELV $783
LABELV $780
line 1663
;1662:
;1663:	if ( updateangles ) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $785
line 1665
;1664:
;1665:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1667
;1666:		// add gravity
;1667:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1668
;1668:		VectorNormalize( dir );
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1669
;1669:		d = DotProduct(pole.axis[2], dir);
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
line 1671
;1670:		// if there is anough movement orthogonal to the flag pole
;1671:		if (fabs(d) < 0.9) {
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
GEF4 $798
line 1673
;1672:			//
;1673:			d = DotProduct(pole.axis[0], dir);
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
line 1674
;1674:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $807
line 1675
;1675:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 1676
;1676:			}
ADDRGP4 $808
JUMPV
LABELV $807
line 1677
;1677:			else if (d < -1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $809
line 1678
;1678:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 1679
;1679:			}
LABELV $809
LABELV $808
line 1680
;1680:			angle = acos(d);
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
line 1682
;1681:
;1682:			d = DotProduct(pole.axis[1], dir);
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
line 1683
;1683:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $821
line 1684
;1684:				angles[YAW] = 360 - angle * 180 / M_PI;
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
line 1685
;1685:			}
ADDRGP4 $822
JUMPV
LABELV $821
line 1686
;1686:			else {
line 1687
;1687:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1127481344
ADDRLP4 324
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1688
;1688:			}
LABELV $822
line 1689
;1689:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $825
line 1690
;1690:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $825
line 1691
;1691:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $829
line 1692
;1692:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $829
line 1697
;1693:
;1694:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1695:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1696:			// change the yaw angle
;1697:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
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
CNSTI4 568
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 572
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1698
;1698:		}
LABELV $798
line 1718
;1699:
;1700:		/*
;1701:		d = DotProduct(pole.axis[2], dir);
;1702:		angle = Q_acos(d);
;1703:
;1704:		d = DotProduct(pole.axis[1], dir);
;1705:		if (d < 0) {
;1706:			angle = 360 - angle * 180 / M_PI;
;1707:		}
;1708:		else {
;1709:			angle = angle * 180 / M_PI;
;1710:		}
;1711:		if (angle > 340 && angle < 20) {
;1712:			flagAnim = FLAG_RUNUP;
;1713:		}
;1714:		if (angle > 160 && angle < 200) {
;1715:			flagAnim = FLAG_RUNDOWN;
;1716:		}
;1717:		*/
;1718:	}
LABELV $785
line 1721
;1719:
;1720:	// set the yaw angle
;1721:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ASGNF4
line 1723
;1722:	// lerp the flag animation frames
;1723:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 316
CNSTI4 1708
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1724
;1724:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
ADDRLP4 316
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 548
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
line 1725
;1725:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 1726
;1726:	flag.frame = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 1727
;1727:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ASGNF4
line 1729
;1728:
;1729:	AnglesToAxis( angles, flag.axis );
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1730
;1730:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $379
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1732
;1731:
;1732:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1733
;1733:}
LABELV $763
endproc CG_PlayerFlag 356 24
proc CG_PlayerPowerups 16 20
line 1809
;1734:
;1735:
;1736:#ifdef MISSIONPACK // bk001204
;1737:/*
;1738:===============
;1739:CG_PlayerTokens
;1740:===============
;1741:*/
;1742:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
;1743:	int			tokens, i, j;
;1744:	float		angle;
;1745:	refEntity_t	ent;
;1746:	vec3_t		dir, origin;
;1747:	skulltrail_t *trail;
;1748:	trail = &cg.skulltrails[cent->currentState.number];
;1749:	tokens = cent->currentState.generic1;
;1750:	if ( !tokens ) {
;1751:		trail->numpositions = 0;
;1752:		return;
;1753:	}
;1754:
;1755:	if ( tokens > MAX_SKULLTRAIL ) {
;1756:		tokens = MAX_SKULLTRAIL;
;1757:	}
;1758:
;1759:	// add skulls if there are more than last time
;1760:	for (i = 0; i < tokens - trail->numpositions; i++) {
;1761:		for (j = trail->numpositions; j > 0; j--) {
;1762:			VectorCopy(trail->positions[j-1], trail->positions[j]);
;1763:		}
;1764:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
;1765:	}
;1766:	trail->numpositions = tokens;
;1767:
;1768:	// move all the skulls along the trail
;1769:	VectorCopy(cent->lerpOrigin, origin);
;1770:	for (i = 0; i < trail->numpositions; i++) {
;1771:		VectorSubtract(trail->positions[i], origin, dir);
;1772:		if (VectorNormalize(dir) > 30) {
;1773:			VectorMA(origin, 30, dir, trail->positions[i]);
;1774:		}
;1775:		VectorCopy(trail->positions[i], origin);
;1776:	}
;1777:
;1778:	memset( &ent, 0, sizeof( ent ) );
;1779:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
;1780:		ent.hModel = cgs.media.redCubeModel;
;1781:	} else {
;1782:		ent.hModel = cgs.media.blueCubeModel;
;1783:	}
;1784:	ent.renderfx = renderfx;
;1785:
;1786:	VectorCopy(cent->lerpOrigin, origin);
;1787:	for (i = 0; i < trail->numpositions; i++) {
;1788:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
;1789:		ent.axis[0][2] = 0;
;1790:		VectorNormalize(ent.axis[0]);
;1791:		VectorSet(ent.axis[2], 0, 0, 1);
;1792:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
;1793:
;1794:		VectorCopy(trail->positions[i], ent.origin);
;1795:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
;1796:		ent.origin[2] += sin(angle) * 10;
;1797:		trap_R_AddRefEntityToScene( &ent );
;1798:		VectorCopy(trail->positions[i], origin);
;1799:	}
;1800:}
;1801:#endif
;1802:
;1803:
;1804:/*
;1805:===============
;1806:CG_PlayerPowerups
;1807:===============
;1808:*/
;1809:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 1813
;1810:	int		powerups;
;1811:	clientInfo_t	*ci;
;1812:
;1813:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1814
;1814:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $842
line 1815
;1815:		return;
ADDRGP4 $841
JUMPV
LABELV $842
line 1819
;1816:	}
;1817:
;1818:	// quad gives a dlight
;1819:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $844
line 1820
;1820:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1821
;1821:	}
LABELV $844
line 1824
;1822:
;1823:	// flight plays a looped sound
;1824:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $846
line 1825
;1825:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+152340+872
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1826
;1826:	}
LABELV $846
line 1828
;1827:
;1828:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
ADDRLP4 4
CNSTI4 1708
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1830
;1829:	// redflag
;1830:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $851
line 1831
;1831:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $853
line 1832
;1832:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+96
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 1833
;1833:		}
ADDRGP4 $854
JUMPV
LABELV $853
line 1834
;1834:		else {
line 1835
;1835:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1836
;1836:		}
LABELV $854
line 1837
;1837:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 0.2f, 0.2f );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1838
;1838:	}
LABELV $851
line 1841
;1839:
;1840:	// blueflag
;1841:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $859
line 1842
;1842:		if (ci->newAnims){
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $861
line 1843
;1843:			CG_PlayerFlag( cent, cgs.media.blueFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+100
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 1844
;1844:		}
ADDRGP4 $862
JUMPV
LABELV $861
line 1845
;1845:		else {
line 1846
;1846:			CG_TrailItem( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1847
;1847:		}
LABELV $862
line 1848
;1848:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
ADDRLP4 12
CNSTF4 1045220557
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1849
;1849:	}
LABELV $859
line 1852
;1850:
;1851:	// neutralflag
;1852:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $867
line 1853
;1853:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $869
line 1854
;1854:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 1855
;1855:		}
ADDRGP4 $870
JUMPV
LABELV $869
line 1856
;1856:		else {
line 1857
;1857:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1858
;1858:		}
LABELV $870
line 1859
;1859:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 1.0, 1.0 );
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
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
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1860
;1860:	}
LABELV $867
line 1863
;1861:
;1862:	// haste leaves smoke trails
;1863:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $875
line 1864
;1864:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 1865
;1865:	}
LABELV $875
line 1866
;1866:}
LABELV $841
endproc CG_PlayerPowerups 16 20
proc CG_PlayerFloatSprite 144 12
line 1876
;1867:
;1868:
;1869:/*
;1870:===============
;1871:CG_PlayerFloatSprite
;1872:
;1873:Float a sprite over the player's head
;1874:===============
;1875:*/
;1876:static void CG_PlayerFloatSprite( centity_t *cent, qhandle_t shader ) {
line 1880
;1877:	int				rf;
;1878:	refEntity_t		ent;
;1879:
;1880:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $878
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $878
line 1881
;1881:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 1882
;1882:	} else {
ADDRGP4 $879
JUMPV
LABELV $878
line 1883
;1883:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 1884
;1884:	}
LABELV $879
line 1886
;1885:
;1886:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1887
;1887:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 1888
;1888:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1889
;1889:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1890
;1890:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 1891
;1891:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 1892
;1892:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 1893
;1893:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 1894
;1894:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 1895
;1895:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 1896
;1896:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 1897
;1897:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1898
;1898:}
LABELV $877
endproc CG_PlayerFloatSprite 144 12
proc CG_PlayerSprites 8 8
line 1909
;1899:
;1900:
;1901:
;1902:/*
;1903:===============
;1904:CG_PlayerSprites
;1905:
;1906:Float sprites over the player's head
;1907:===============
;1908:*/
;1909:static void CG_PlayerSprites( centity_t *cent ) {
line 1912
;1910:	int		team;
;1911:
;1912:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $896
line 1913
;1913:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+208
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1914
;1914:		return;
ADDRGP4 $895
JUMPV
LABELV $896
line 1917
;1915:	}
;1916:
;1917:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $900
line 1918
;1918:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+204
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1919
;1919:		return;
ADDRGP4 $895
JUMPV
LABELV $900
line 1922
;1920:	}
;1921:
;1922:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $904
line 1923
;1923:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+520
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1924
;1924:		return;
ADDRGP4 $895
JUMPV
LABELV $904
line 1927
;1925:	}
;1926:
;1927:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
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
EQI4 $908
line 1928
;1928:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+524
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1929
;1929:		return;
ADDRGP4 $895
JUMPV
LABELV $908
line 1932
;1930:	}
;1931:
;1932:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $912
line 1933
;1933:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+528
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1934
;1934:		return;
ADDRGP4 $895
JUMPV
LABELV $912
line 1937
;1935:	}
;1936:
;1937:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $916
line 1938
;1938:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+532
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1939
;1939:		return;
ADDRGP4 $895
JUMPV
LABELV $916
line 1942
;1940:	}
;1941:
;1942:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $920
line 1943
;1943:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+536
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1944
;1944:		return;
ADDRGP4 $895
JUMPV
LABELV $920
line 1947
;1945:	}
;1946:
;1947:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $924
line 1948
;1948:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+540
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1949
;1949:		return;
ADDRGP4 $895
JUMPV
LABELV $924
line 1952
;1950:	}
;1951:
;1952:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
ADDRLP4 0
CNSTI4 1708
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
line 1953
;1953:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $930
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $930
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $930
line 1955
;1954:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;1955:		cgs.gametype >= GT_TEAM) {
line 1956
;1956:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $895
line 1957
;1957:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+200
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1958
;1958:		}
line 1959
;1959:		return;
LABELV $930
line 1961
;1960:	}
;1961:}
LABELV $895
endproc CG_PlayerSprites 8 8
lit
align 4
LABELV $940
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $941
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 104 44
line 1973
;1962:
;1963:/*
;1964:===============
;1965:CG_PlayerShadow
;1966:
;1967:Returns the Z component of the surface being shadowed
;1968:
;1969:  should it return a full plane instead of a Z?
;1970:===============
;1971:*/
;1972:#define	SHADOW_DISTANCE		128
;1973:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 1974
;1974:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $940
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $941
INDIRB
ASGNB 12
line 1978
;1975:	trace_t		trace;
;1976:	float		alpha;
;1977:
;1978:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 1980
;1979:
;1980:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $942
line 1981
;1981:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $939
JUMPV
LABELV $942
line 1985
;1982:	}
;1983:
;1984:	// no shadows when invisible
;1985:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $945
line 1986
;1986:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $939
JUMPV
LABELV $945
line 1990
;1987:	}
;1988:
;1989:	// send a trace down from the player to the ground
;1990:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 1991
;1991:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 1993
;1992:
;1993:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 708
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
line 1996
;1994:
;1995:	// no shadow if too high
;1996:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $953
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $953
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $948
LABELV $953
line 1997
;1997:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $939
JUMPV
LABELV $948
line 2000
;1998:	}
;1999:
;2000:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2002
;2001:
;2002:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $956
line 2003
;2003:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $939
JUMPV
LABELV $956
line 2007
;2004:	}
;2005:
;2006:	// fade the shadow out with height
;2007:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2014
;2008:
;2009:	// bk0101022 - hack / FPE - bogus planes?
;2010:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;2011:
;2012:	// add the mark as a temporary, so it goes directly to the renderer
;2013:	// without taking a spot in the cg_marks array
;2014:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
ADDRGP4 cgs+152340+352
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 472
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
line 2017
;2015:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2016:
;2017:	return qtrue;
CNSTI4 1
RETI4
LABELV $939
endproc CG_PlayerShadow 104 44
proc CG_PlayerSplash 192 28
line 2028
;2018:}
;2019:
;2020:
;2021:/*
;2022:===============
;2023:CG_PlayerSplash
;2024:
;2025:Draw a mark at the water surface
;2026:===============
;2027:*/
;2028:static void CG_PlayerSplash( centity_t *cent ) {
line 2034
;2029:	vec3_t		start, end;
;2030:	trace_t		trace;
;2031:	int			contents;
;2032:	polyVert_t	verts[4];
;2033:
;2034:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $965
line 2035
;2035:		return;
ADDRGP4 $964
JUMPV
LABELV $965
line 2038
;2036:	}
;2037:
;2038:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2039
;2039:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2043
;2040:
;2041:	// if the feet aren't in liquid, don't make a mark
;2042:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2043:	contents = trap_CM_PointContents( end, 0 );
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
line 2044
;2044:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $969
line 2045
;2045:		return;
ADDRGP4 $964
JUMPV
LABELV $969
line 2048
;2046:	}
;2047:
;2048:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2049
;2049:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2052
;2050:
;2051:	// if the head isn't out of liquid, don't make a mark
;2052:	contents = trap_CM_PointContents( start, 0 );
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
line 2053
;2053:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $972
line 2054
;2054:		return;
ADDRGP4 $964
JUMPV
LABELV $972
line 2058
;2055:	}
;2056:
;2057:	// trace down to find the surface
;2058:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
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
line 2060
;2059:
;2060:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $974
line 2061
;2061:		return;
ADDRGP4 $964
JUMPV
LABELV $974
line 2065
;2062:	}
;2063:
;2064:	// create a mark polygon
;2065:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2066
;2066:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2067
;2067:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2068
;2068:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2069
;2069:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2070
;2070:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2071
;2071:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2072
;2072:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2073
;2073:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2075
;2074:
;2075:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2076
;2076:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2077
;2077:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2078
;2078:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2079
;2079:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2080
;2080:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2081
;2081:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2082
;2082:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2083
;2083:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2085
;2084:
;2085:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2086
;2086:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2087
;2087:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2088
;2088:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2089
;2089:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2090
;2090:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2091
;2091:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2092
;2092:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2093
;2093:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2095
;2094:
;2095:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2096
;2096:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2097
;2097:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2098
;2098:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2099
;2099:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2100
;2100:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2101
;2101:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2102
;2102:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2103
;2103:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2105
;2104:
;2105:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
ADDRGP4 cgs+152340+376
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2106
;2106:}
LABELV $964
endproc CG_PlayerSplash 192 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 0 4
line 2118
;2107:
;2108:
;2109:
;2110:/*
;2111:===============
;2112:CG_AddRefEntityWithPowerups
;2113:
;2114:Adds a piece with modifications or duplications for powerups
;2115:Also called by CG_Missile for quad rockets, but nobody can tell...
;2116:===============
;2117:*/
;2118:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 2120
;2119:
;2120:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1055
line 2121
;2121:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+412
INDIRI4
ASGNI4
line 2122
;2122:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2123
;2123:	} else {
ADDRGP4 $1056
JUMPV
LABELV $1055
line 2133
;2124:		/*
;2125:		if ( state->eFlags & EF_KAMIKAZE ) {
;2126:			if (team == TEAM_BLUE)
;2127:				ent->customShader = cgs.media.blueKamikazeShader;
;2128:			else
;2129:				ent->customShader = cgs.media.redKamikazeShader;
;2130:			trap_R_AddRefEntityToScene( ent );
;2131:		}
;2132:		else {*/
;2133:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2136
;2134:		//}
;2135:
;2136:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1059
line 2137
;2137:		{
line 2138
;2138:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1061
line 2139
;2139:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+404
INDIRI4
ASGNI4
ADDRGP4 $1062
JUMPV
LABELV $1061
line 2141
;2140:			else
;2141:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+400
INDIRI4
ASGNI4
LABELV $1062
line 2142
;2142:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2143
;2143:		}
LABELV $1059
line 2144
;2144:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1067
line 2145
;2145:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1069
line 2146
;2146:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+416
INDIRI4
ASGNI4
line 2147
;2147:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2148
;2148:			}
LABELV $1069
line 2149
;2149:		}
LABELV $1067
line 2150
;2150:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1074
line 2151
;2151:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+420
INDIRI4
ASGNI4
line 2152
;2152:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2153
;2153:		}
LABELV $1074
line 2154
;2154:	}
LABELV $1056
line 2155
;2155:}
LABELV $1054
endproc CG_AddRefEntityWithPowerups 0 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2163
;2156:
;2157:/*
;2158:=================
;2159:CG_LightVerts
;2160:=================
;2161:*/
;2162:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2163:{
line 2170
;2164:	int				i, j;
;2165:	float			incoming;
;2166:	vec3_t			ambientLight;
;2167:	vec3_t			lightDir;
;2168:	vec3_t			directedLight;
;2169:
;2170:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
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
line 2172
;2171:
;2172:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1082
JUMPV
LABELV $1079
line 2173
;2173:		incoming = DotProduct (normal, lightDir);
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
line 2174
;2174:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1085
line 2175
;2175:			verts[i].modulate[0] = ambientLight[0];
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
LTF4 $1088
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
ADDRGP4 $1089
JUMPV
LABELV $1088
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1089
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
line 2176
;2176:			verts[i].modulate[1] = ambientLight[1];
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
LTF4 $1092
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
ADDRGP4 $1093
JUMPV
LABELV $1092
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1093
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
line 2177
;2177:			verts[i].modulate[2] = ambientLight[2];
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
LTF4 $1096
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
ADDRGP4 $1097
JUMPV
LABELV $1096
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1097
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
line 2178
;2178:			verts[i].modulate[3] = 255;
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
line 2179
;2179:			continue;
ADDRGP4 $1080
JUMPV
LABELV $1085
line 2181
;2180:		} 
;2181:		j = ( ambientLight[0] + incoming * directedLight[0] );
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
line 2182
;2182:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1098
line 2183
;2183:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2184
;2184:		}
LABELV $1098
line 2185
;2185:		verts[i].modulate[0] = j;
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
line 2187
;2186:
;2187:		j = ( ambientLight[1] + incoming * directedLight[1] );
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
line 2188
;2188:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1102
line 2189
;2189:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2190
;2190:		}
LABELV $1102
line 2191
;2191:		verts[i].modulate[1] = j;
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
line 2193
;2192:
;2193:		j = ( ambientLight[2] + incoming * directedLight[2] );
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
line 2194
;2194:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1106
line 2195
;2195:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2196
;2196:		}
LABELV $1106
line 2197
;2197:		verts[i].modulate[2] = j;
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
line 2199
;2198:
;2199:		verts[i].modulate[3] = 255;
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
line 2200
;2200:	}
LABELV $1080
line 2172
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1082
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1079
line 2201
;2201:	return qtrue;
CNSTI4 1
RETI4
LABELV $1078
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 448 28
line 2209
;2202:}
;2203:
;2204:/*
;2205:===============
;2206:CG_Player
;2207:===============
;2208:*/
;2209:void CG_Player( centity_t *cent ) {
line 2230
;2210:	clientInfo_t	*ci;
;2211:	refEntity_t		legs;
;2212:	refEntity_t		torso;
;2213:	refEntity_t		head;
;2214:	int				clientNum;
;2215:	int				renderfx;
;2216:	qboolean		shadow;
;2217:	float			shadowPlane;
;2218:#ifdef MISSIONPACK
;2219:	refEntity_t		skull;
;2220:	refEntity_t		powerup;
;2221:	int				t;
;2222:	float			c;
;2223:	float			angle;
;2224:	vec3_t			dir, angles;
;2225:#endif
;2226:
;2227:	// the client number is stored in clientNum.  It can't be derived
;2228:	// from the entity number, because a single client may have
;2229:	// multiple corpses on the level using the same clientinfo
;2230:	clientNum = cent->currentState.clientNum;
ADDRLP4 428
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2231
;2231:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 428
INDIRI4
CNSTI4 0
LTI4 $1111
ADDRLP4 428
INDIRI4
CNSTI4 64
LTI4 $1109
LABELV $1111
line 2232
;2232:		CG_Error( "Bad clientNum on player entity");
ADDRGP4 $1112
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2233
;2233:	}
LABELV $1109
line 2234
;2234:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 280
CNSTI4 1708
ADDRLP4 428
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2238
;2235:
;2236:	// it is possible to see corpses from disconnected players that may
;2237:	// not have valid clientinfo
;2238:	if ( !ci->infoValid ) {
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1114
line 2239
;2239:		return;
ADDRGP4 $1108
JUMPV
LABELV $1114
line 2243
;2240:	}
;2241:
;2242:	// get the player model information
;2243:	renderfx = 0;
ADDRLP4 424
CNSTI4 0
ASGNI4
line 2244
;2244:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1116
line 2245
;2245:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1119
line 2246
;2246:			renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 424
CNSTI4 2
ASGNI4
line 2247
;2247:		} else {
ADDRGP4 $1120
JUMPV
LABELV $1119
line 2248
;2248:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1122
line 2249
;2249:				return;
ADDRGP4 $1108
JUMPV
LABELV $1122
line 2251
;2250:			}
;2251:		}
LABELV $1120
line 2252
;2252:	}
LABELV $1116
line 2255
;2253:
;2254:
;2255:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2256
;2256:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2257
;2257:	memset( &head, 0, sizeof(head) );
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2260
;2258:
;2259:	// get the rotation information
;2260:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
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
line 2263
;2261:	
;2262:	// get the animation state (after rotation, to allow feet shuffle)
;2263:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
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
line 2267
;2264:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;2265:
;2266:	// add the talk baloon or disconnect icon
;2267:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2270
;2268:
;2269:	// add the shadow
;2270:	shadow = CG_PlayerShadow( cent, &shadowPlane );
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
line 2273
;2271:
;2272:	// add a water splash if partially in and out of water
;2273:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2275
;2274:
;2275:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1134
ADDRLP4 436
INDIRI4
CNSTI4 0
EQI4 $1134
line 2276
;2276:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2277
;2277:	}
LABELV $1134
line 2278
;2278:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2287
;2279:#ifdef MISSIONPACK
;2280:	if( cgs.gametype == GT_HARVESTER ) {
;2281:		CG_PlayerTokens( cent, renderfx );
;2282:	}
;2283:#endif
;2284:	//
;2285:	// add the legs
;2286:	//
;2287:	legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 2288
;2288:	legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 280
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 2290
;2289:
;2290:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2292
;2291:
;2292:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2293
;2293:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2294
;2294:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2295
;2295:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2297
;2296:
;2297:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team );
ADDRLP4 0
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
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2300
;2298:
;2299:	// if the model failed, allow the default nullmodel to be displayed
;2300:	if (!legs.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1145
line 2301
;2301:		return;
ADDRGP4 $1108
JUMPV
LABELV $1145
line 2307
;2302:	}
;2303:
;2304:	//
;2305:	// add the torso
;2306:	//
;2307:	torso.hModel = ci->torsoModel;
ADDRLP4 140+8
ADDRLP4 280
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ASGNI4
line 2308
;2308:	if (!torso.hModel) {
ADDRLP4 140+8
INDIRI4
CNSTI4 0
NEI4 $1149
line 2309
;2309:		return;
ADDRGP4 $1108
JUMPV
LABELV $1149
line 2312
;2310:	}
;2311:
;2312:	torso.customSkin = ci->torsoSkin;
ADDRLP4 140+108
ADDRLP4 280
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 2314
;2313:
;2314:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2316
;2315:
;2316:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1154
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2318
;2317:
;2318:	torso.shadowPlane = shadowPlane;
ADDRLP4 140+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2319
;2319:	torso.renderfx = renderfx;
ADDRLP4 140+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2321
;2320:
;2321:	CG_AddRefEntityWithPowerups( &torso, &cent->currentState, ci->team );
ADDRLP4 140
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
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2531
;2322:
;2323:#ifdef MISSIONPACK
;2324:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
;2325:
;2326:		memset( &skull, 0, sizeof(skull) );
;2327:
;2328:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
;2329:		skull.shadowPlane = shadowPlane;
;2330:		skull.renderfx = renderfx;
;2331:
;2332:		if ( cent->currentState.eFlags & EF_DEAD ) {
;2333:			// one skull bobbing above the dead body
;2334:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
;2335:			if (angle > M_PI * 2)
;2336:				angle -= (float)M_PI * 2;
;2337:			dir[0] = sin(angle) * 20;
;2338:			dir[1] = cos(angle) * 20;
;2339:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2340:			dir[2] = 15 + sin(angle) * 8;
;2341:			VectorAdd(torso.origin, dir, skull.origin);
;2342:			
;2343:			dir[2] = 0;
;2344:			VectorCopy(dir, skull.axis[1]);
;2345:			VectorNormalize(skull.axis[1]);
;2346:			VectorSet(skull.axis[2], 0, 0, 1);
;2347:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2348:
;2349:			skull.hModel = cgs.media.kamikazeHeadModel;
;2350:			trap_R_AddRefEntityToScene( &skull );
;2351:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2352:			trap_R_AddRefEntityToScene( &skull );
;2353:		}
;2354:		else {
;2355:			// three skulls spinning around the player
;2356:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2357:			dir[0] = cos(angle) * 20;
;2358:			dir[1] = sin(angle) * 20;
;2359:			dir[2] = cos(angle) * 20;
;2360:			VectorAdd(torso.origin, dir, skull.origin);
;2361:
;2362:			angles[0] = sin(angle) * 30;
;2363:			angles[1] = (angle * 180 / M_PI) + 90;
;2364:			if (angles[1] > 360)
;2365:				angles[1] -= 360;
;2366:			angles[2] = 0;
;2367:			AnglesToAxis( angles, skull.axis );
;2368:
;2369:			/*
;2370:			dir[2] = 0;
;2371:			VectorInverse(dir);
;2372:			VectorCopy(dir, skull.axis[1]);
;2373:			VectorNormalize(skull.axis[1]);
;2374:			VectorSet(skull.axis[2], 0, 0, 1);
;2375:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2376:			*/
;2377:
;2378:			skull.hModel = cgs.media.kamikazeHeadModel;
;2379:			trap_R_AddRefEntityToScene( &skull );
;2380:			// flip the trail because this skull is spinning in the other direction
;2381:			VectorInverse(skull.axis[1]);
;2382:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2383:			trap_R_AddRefEntityToScene( &skull );
;2384:
;2385:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
;2386:			if (angle > M_PI * 2)
;2387:				angle -= (float)M_PI * 2;
;2388:			dir[0] = sin(angle) * 20;
;2389:			dir[1] = cos(angle) * 20;
;2390:			dir[2] = cos(angle) * 20;
;2391:			VectorAdd(torso.origin, dir, skull.origin);
;2392:
;2393:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
;2394:			angles[1] = 360 - (angle * 180 / M_PI);
;2395:			if (angles[1] > 360)
;2396:				angles[1] -= 360;
;2397:			angles[2] = 0;
;2398:			AnglesToAxis( angles, skull.axis );
;2399:
;2400:			/*
;2401:			dir[2] = 0;
;2402:			VectorCopy(dir, skull.axis[1]);
;2403:			VectorNormalize(skull.axis[1]);
;2404:			VectorSet(skull.axis[2], 0, 0, 1);
;2405:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2406:			*/
;2407:
;2408:			skull.hModel = cgs.media.kamikazeHeadModel;
;2409:			trap_R_AddRefEntityToScene( &skull );
;2410:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2411:			trap_R_AddRefEntityToScene( &skull );
;2412:
;2413:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
;2414:			if (angle > M_PI * 2)
;2415:				angle -= (float)M_PI * 2;
;2416:			dir[0] = sin(angle) * 20;
;2417:			dir[1] = cos(angle) * 20;
;2418:			dir[2] = 0;
;2419:			VectorAdd(torso.origin, dir, skull.origin);
;2420:			
;2421:			VectorCopy(dir, skull.axis[1]);
;2422:			VectorNormalize(skull.axis[1]);
;2423:			VectorSet(skull.axis[2], 0, 0, 1);
;2424:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2425:
;2426:			skull.hModel = cgs.media.kamikazeHeadModel;
;2427:			trap_R_AddRefEntityToScene( &skull );
;2428:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2429:			trap_R_AddRefEntityToScene( &skull );
;2430:		}
;2431:	}
;2432:
;2433:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
;2434:		memcpy(&powerup, &torso, sizeof(torso));
;2435:		powerup.hModel = cgs.media.guardPowerupModel;
;2436:		powerup.frame = 0;
;2437:		powerup.oldframe = 0;
;2438:		powerup.customSkin = 0;
;2439:		trap_R_AddRefEntityToScene( &powerup );
;2440:	}
;2441:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
;2442:		memcpy(&powerup, &torso, sizeof(torso));
;2443:		powerup.hModel = cgs.media.scoutPowerupModel;
;2444:		powerup.frame = 0;
;2445:		powerup.oldframe = 0;
;2446:		powerup.customSkin = 0;
;2447:		trap_R_AddRefEntityToScene( &powerup );
;2448:	}
;2449:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
;2450:		memcpy(&powerup, &torso, sizeof(torso));
;2451:		powerup.hModel = cgs.media.doublerPowerupModel;
;2452:		powerup.frame = 0;
;2453:		powerup.oldframe = 0;
;2454:		powerup.customSkin = 0;
;2455:		trap_R_AddRefEntityToScene( &powerup );
;2456:	}
;2457:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
;2458:		memcpy(&powerup, &torso, sizeof(torso));
;2459:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
;2460:		powerup.frame = 0;
;2461:		powerup.oldframe = 0;
;2462:		powerup.customSkin = 0;
;2463:		trap_R_AddRefEntityToScene( &powerup );
;2464:	}
;2465:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
;2466:		if ( !ci->invulnerabilityStartTime ) {
;2467:			ci->invulnerabilityStartTime = cg.time;
;2468:		}
;2469:		ci->invulnerabilityStopTime = cg.time;
;2470:	}
;2471:	else {
;2472:		ci->invulnerabilityStartTime = 0;
;2473:	}
;2474:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
;2475:		cg.time - ci->invulnerabilityStopTime < 250 ) {
;2476:
;2477:		memcpy(&powerup, &torso, sizeof(torso));
;2478:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
;2479:		powerup.customSkin = 0;
;2480:		// always draw
;2481:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2482:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2483:
;2484:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
;2485:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
;2486:		}
;2487:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
;2488:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
;2489:		}
;2490:		else {
;2491:			c = 1;
;2492:		}
;2493:		VectorSet( powerup.axis[0], c, 0, 0 );
;2494:		VectorSet( powerup.axis[1], 0, c, 0 );
;2495:		VectorSet( powerup.axis[2], 0, 0, c );
;2496:		trap_R_AddRefEntityToScene( &powerup );
;2497:	}
;2498:
;2499:	t = cg.time - ci->medkitUsageTime;
;2500:	if ( ci->medkitUsageTime && t < 500 ) {
;2501:		memcpy(&powerup, &torso, sizeof(torso));
;2502:		powerup.hModel = cgs.media.medkitUsageModel;
;2503:		powerup.customSkin = 0;
;2504:		// always draw
;2505:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2506:		VectorClear(angles);
;2507:		AnglesToAxis(angles, powerup.axis);
;2508:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2509:		powerup.origin[2] += -24 + (float) t * 80 / 500;
;2510:		if ( t > 400 ) {
;2511:			c = (float) (t - 1000) * 0xff / 100;
;2512:			powerup.shaderRGBA[0] = 0xff - c;
;2513:			powerup.shaderRGBA[1] = 0xff - c;
;2514:			powerup.shaderRGBA[2] = 0xff - c;
;2515:			powerup.shaderRGBA[3] = 0xff - c;
;2516:		}
;2517:		else {
;2518:			powerup.shaderRGBA[0] = 0xff;
;2519:			powerup.shaderRGBA[1] = 0xff;
;2520:			powerup.shaderRGBA[2] = 0xff;
;2521:			powerup.shaderRGBA[3] = 0xff;
;2522:		}
;2523:		trap_R_AddRefEntityToScene( &powerup );
;2524:	}
;2525:#endif // MISSIONPACK
;2526:
;2527:	//
;2528:	// add the head
;2529:	//
;2530:	// Shafe - Trep - This is all new code for headshots
;2531:	if(!cent->pe.noHead)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1157
line 2532
;2532:	{
line 2533
;2533:		head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 280
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2534
;2534:		if (!head.hModel) 
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1160
line 2535
;2535:		{
line 2536
;2536:			return;
ADDRGP4 $1108
JUMPV
LABELV $1160
line 2538
;2537:		}
;2538:		head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 280
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 2540
;2539:
;2540:		VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2542
;2541:
;2542:		CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 284
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1165
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2544
;2543:
;2544:		head.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2545
;2545:		head.renderfx = renderfx;
ADDRLP4 284+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2547
;2546:
;2547:		CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
ADDRLP4 284
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
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2548
;2548:	}
LABELV $1157
line 2577
;2549:
;2550:	/*  Shafe - Trep - This is the original code -- Fuck.. Lets hope we dont end up compiling with MISSIONPACK!
;2551:	head.hModel = ci->headModel;
;2552:	if (!head.hModel) {
;2553:		return;
;2554:	}
;2555:	head.customSkin = ci->headSkin;
;2556:
;2557:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
;2558:
;2559:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
;2560:
;2561:	head.shadowPlane = shadowPlane;
;2562:	head.renderfx = renderfx;
;2563:
;2564:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
;2565:	*/
;2566:
;2567:
;2568:#ifdef MISSIONPACK
;2569:	CG_BreathPuffs(cent, &head);
;2570:
;2571:	CG_DustTrail(cent);
;2572:#endif
;2573:
;2574:	//
;2575:	// add the gun / barrel / flash
;2576:	//
;2577:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team );
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
line 2580
;2578:
;2579:	// add powerups floating behind the player
;2580:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2584
;2581:
;2582://unlagged - client options
;2583:	// add the bounding box (if cg_drawBBox is 1)
;2584:	CG_AddBoundingBox( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddBoundingBox
CALLV
pop
line 2586
;2585://unlagged - client options
;2586:}
LABELV $1108
endproc CG_Player 448 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 2598
;2587:
;2588:
;2589://=====================================================================
;2590:
;2591:/*
;2592:===============
;2593:CG_ResetPlayerEntity
;2594:
;2595:A player just came into view or teleported, so reset all animation info
;2596:===============
;2597:*/
;2598:void CG_ResetPlayerEntity( centity_t *cent ) {
line 2599
;2599:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 -99999
ASGNI4
line 2600
;2600:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 0
ASGNI4
line 2602
;2601:
;2602:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1708
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
CNSTI4 452
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
line 2603
;2603:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 1708
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
CNSTI4 500
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
line 2605
;2604:
;2605:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2606
;2606:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 720
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2608
;2607:
;2608:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 672
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2609
;2609:	VectorCopy( cent->lerpAngles, cent->rawAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 720
ADDP4
INDIRB
ASGNB 12
line 2611
;2610:
;2611:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2612
;2612:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 472
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 688
ADDP4
INDIRF4
ASGNF4
line 2613
;2613:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 2614
;2614:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 0
ASGNF4
line 2615
;2615:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2617
;2616:
;2617:	memset( &cent->pe.torso, 0, sizeof( cent->pe.legs ) );
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2618
;2618:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 688
ADDP4
INDIRF4
ASGNF4
line 2619
;2619:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 2620
;2620:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ASGNF4
line 2621
;2621:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2623
;2622:
;2623:	cent->pe.noHead = qfalse; // Shafe - Trep - Part of the headshot code
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 2625
;2624:
;2625:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1173
line 2626
;2626:		CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1176
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
CNSTI4 520
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 2627
;2627:	}
LABELV $1173
line 2628
;2628:}
LABELV $1168
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
lit
align 1
LABELV $1176
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
LABELV $1165
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
LABELV $1154
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
LABELV $1112
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
LABELV $695
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
LABELV $624
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
LABELV $590
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
LABELV $586
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
LABELV $569
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
LABELV $533
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
LABELV $522
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $489
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $487
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
LABELV $485
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
LABELV $483
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $481
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $479
byte 1 116
byte 1 0
align 1
LABELV $477
byte 1 108
byte 1 0
align 1
LABELV $475
byte 1 119
byte 1 0
align 1
LABELV $473
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $471
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $469
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $467
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $464
byte 1 110
byte 1 0
align 1
LABELV $459
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
LABELV $392
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
LABELV $379
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
LABELV $374
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
LABELV $371
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
LABELV $370
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $362
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
LABELV $343
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $340
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $337
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
LABELV $331
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
LABELV $330
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
LABELV $327
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $326
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $325
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $322
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
LABELV $313
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
LABELV $312
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
LABELV $307
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
LABELV $304
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
LABELV $303
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
LABELV $300
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
LABELV $297
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
LABELV $289
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
LABELV $286
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $283
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
LABELV $280
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $277
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
LABELV $274
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $273
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $253
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
LABELV $252
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
LABELV $242
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $231
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
LABELV $221
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
LABELV $220
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
LABELV $212
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
LABELV $211
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
LABELV $201
byte 1 0
align 1
LABELV $200
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $199
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $187
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
LABELV $162
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
LABELV $159
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
LABELV $156
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
LABELV $145
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $136
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
LABELV $133
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
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $129
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $126
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $123
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $119
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $118
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $113
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
LABELV $105
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
LABELV $99
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
