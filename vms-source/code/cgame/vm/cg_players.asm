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
line 513
;512:	
;513:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/lower.md3", modelName );
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
line 514
;514:	ci->legsModel = trap_R_RegisterModel( filename );
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
line 515
;515:	if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $298
line 516
;516:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/lower.md3", modelName );
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
line 517
;517:		ci->legsModel = trap_R_RegisterModel( filename );
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
line 518
;518:		if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 520
;519:			// Now Try Md4/MDr format Shafe - Trep 
;520:			Com_sprintf( filename, sizeof( filename ), "models/players2/%s/lower.mdr", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $303
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 521
;521:			ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 522
;522:			if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $304
line 524
;523:				// Now Try Md3 in the players 2 folder format Shafe - Trep 
;524:				Com_sprintf( filename, sizeof( filename ), "models/players2/%s/lower.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $306
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 525
;525:				ci->legsModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 526
;526:				if ( !ci->legsModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $307
line 527
;527:					Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $309
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 528
;528:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $307
line 530
;529:				}
;530:			}
LABELV $304
line 531
;531:		}
LABELV $301
line 532
;532:	}
LABELV $298
line 534
;533:
;534:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $310
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 535
;535:	ci->torsoModel = trap_R_RegisterModel( filename );
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
line 536
;536:	if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $311
line 537
;537:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $313
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 538
;538:		ci->torsoModel = trap_R_RegisterModel( filename );
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
line 539
;539:		if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $314
line 541
;540:			// Try MDR/MD4 Shafe - Trep
;541:			Com_sprintf( filename, sizeof( filename ), "models/players2/%s/upper.mdr", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $316
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 542
;542:			ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 543
;543:			if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $317
line 544
;544:				Com_sprintf( filename, sizeof( filename ), "models/players2/%s/upper.md3", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $319
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 545
;545:				ci->torsoModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 276
INDIRI4
ASGNI4
line 546
;546:				if ( !ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $320
line 547
;547:					Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $309
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 548
;548:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $320
line 550
;549:				}		
;550:			}		
LABELV $317
line 551
;551:		}
LABELV $314
line 552
;552:	}
LABELV $311
line 554
;553:
;554:	if( headName[0] == '*' ) {
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $322
line 555
;555:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1] );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $324
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
line 556
;556:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 557
;557:	else {
line 558
;558:		Com_sprintf( filename, sizeof( filename ), "models/players/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $325
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 559
;559:	}
LABELV $323
line 560
;560:	ci->headModel = trap_R_RegisterModel( filename );
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
line 562
;561:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;562:	if ( !ci->headModel && headName[0] != '*' ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
ADDRLP4 128
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $326
line 563
;563:		Com_sprintf( filename, sizeof( filename ), "models/players/heads/%s/%s.md3", headModelName, headModelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $324
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
line 564
;564:		ci->headModel = trap_R_RegisterModel( filename );
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
line 565
;565:	}
LABELV $326
line 566
;566:	if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $328
line 568
;567:		// Let's Try MD4 for the head.. // Shafe - Trep
;568:		Com_sprintf( filename, sizeof( filename ), "models/players2/%s/head.mdr", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $330
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 569
;569:		ci->headModel = trap_R_RegisterModel( filename );
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 571
;570:
;571:		if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $331
line 572
;572:			Com_sprintf( filename, sizeof( filename ), "models/players2/%s/head.md3", headName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $333
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 573
;573:			ci->headModel = trap_R_RegisterModel( filename );
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
line 575
;574:
;575:			if ( !ci->headModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $334
line 576
;576:			Com_Printf( "Failed to load model file %s\n", filename );
ADDRGP4 $309
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
LABELV $334
line 580
;578:			}
;579:		
;580:		}
LABELV $331
line 581
;581:	}
LABELV $328
line 584
;582:
;583:	// if any skins failed to load, return failure
;584:	if ( !CG_RegisterClientSkin( ci, teamName, modelName, skinName, headName, headSkinName ) ) {
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
NEI4 $336
line 585
;585:		if ( teamName && *teamName) {
ADDRLP4 276
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $338
ADDRLP4 276
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $338
line 586
;586:			Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $340
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
line 587
;587:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $341
line 588
;588:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $343
ARGP4
ADDRGP4 $344
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 589
;589:			}
ADDRGP4 $342
JUMPV
LABELV $341
line 590
;590:			else {
line 591
;591:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $343
ARGP4
ADDRGP4 $345
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 592
;592:			}
LABELV $342
line 593
;593:			if ( !CG_RegisterClientSkin( ci, newTeamName, modelName, skinName, headName, headSkinName ) ) {
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
NEI4 $339
line 594
;594:				Com_Printf( "Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName );
ADDRGP4 $340
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
line 595
;595:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
line 597
;596:			}
;597:		} else {
LABELV $338
line 598
;598:			Com_Printf( "Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName );
ADDRGP4 $348
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
line 599
;599:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $339
line 601
;600:		}
;601:	}
LABELV $336
line 604
;602:
;603:	// load the animations
;604:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $349
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 605
;605:	if ( !CG_ParseAnimationFile( filename, ci ) ) {
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
NEI4 $350
line 606
;606:		Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/animation.cfg", modelName );
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $352
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 607
;607:		if ( !CG_ParseAnimationFile( filename, ci ) ) {
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
NEI4 $353
line 608
;608:			Com_Printf( "Failed to load animation file %s\n", filename );
ADDRGP4 $355
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 609
;609:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $353
line 611
;610:		}
;611:	}
LABELV $350
line 613
;612:
;613:	if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin" ) ) {
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
ADDRGP4 $358
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
EQI4 $356
line 614
;614:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
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
line 615
;615:	}
ADDRGP4 $357
JUMPV
LABELV $356
line 616
;616:	else if ( CG_FindClientHeadFile( filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga" ) ) {
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
ADDRGP4 $358
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 284
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $359
line 617
;617:		ci->modelIcon = trap_R_RegisterShaderNoMip( filename );
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
line 618
;618:	}
LABELV $359
LABELV $357
line 620
;619:
;620:	if ( !ci->modelIcon ) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $362
line 621
;621:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $294
JUMPV
LABELV $362
line 624
;622:	}
;623:
;624:	return qtrue;
CNSTI4 1
RETI4
LABELV $294
endproc CG_RegisterClientModelname 292 32
proc CG_ColorFromString 20 4
line 632
;625:}
;626:
;627:/*
;628:====================
;629:CG_ColorFromString
;630:====================
;631:*/
;632:static void CG_ColorFromString( const char *v, vec3_t color ) {
line 635
;633:	int val;
;634:
;635:	VectorClear( color );
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
line 637
;636:
;637:	val = atoi( v );
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
line 639
;638:
;639:	if ( val < 1 || val > 7 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $367
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $365
LABELV $367
line 640
;640:		VectorSet( color, 1, 1, 1 );
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
line 641
;641:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 644
;642:	}
;643:
;644:	if ( val & 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $368
line 645
;645:		color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 646
;646:	}
LABELV $368
line 647
;647:	if ( val & 2 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $370
line 648
;648:		color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 649
;649:	}
LABELV $370
line 650
;650:	if ( val & 4 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $372
line 651
;651:		color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 652
;652:	}
LABELV $372
line 653
;653:}
LABELV $364
endproc CG_ColorFromString 20 4
proc CG_LoadClientInfo 152 24
line 663
;654:
;655:/*
;656:===================
;657:CG_LoadClientInfo
;658:
;659:Load it now, taking the disk hits.
;660:This will usually be deferred to a safe time
;661:===================
;662:*/
;663:static void CG_LoadClientInfo( clientInfo_t *ci ) {
line 670
;664:	const char	*dir, *fallback;
;665:	int			i, modelloaded;
;666:	const char	*s;
;667:	int			clientNum;
;668:	char		teamname[MAX_QPATH];
;669:
;670:	teamname[0] = 0;
ADDRLP4 24
CNSTI1 0
ASGNI1
line 683
;671:#ifdef MISSIONPACK
;672:	if( cgs.gametype >= GT_TEAM) {
;673:		if( ci->team == TEAM_BLUE ) {
;674:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname) );
;675:		} else {
;676:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname) );
;677:		}
;678:	}
;679:	if( teamname[0] ) {
;680:		strcat( teamname, "/" );
;681:	}
;682:#endif
;683:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 684
;684:	if ( !CG_RegisterClientModelname( ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname ) ) {
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
NEI4 $375
line 685
;685:		if ( cg_buildScript.integer ) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $377
line 686
;686:			CG_Error( "CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname );
ADDRGP4 $380
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
line 687
;687:		}
LABELV $377
line 690
;688:
;689:		// fall back to default team name
;690:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $381
line 692
;691:			// keep skin name
;692:			if( ci->team == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $384
line 693
;693:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname) );
ADDRLP4 24
ARGP4
ADDRGP4 $344
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 694
;694:			} else {
ADDRGP4 $385
JUMPV
LABELV $384
line 695
;695:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname) );
ADDRLP4 24
ARGP4
ADDRGP4 $345
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 696
;696:			}
LABELV $385
line 697
;697:			if ( !CG_RegisterClientModelname( ci, DEFAULT_TEAM_MODEL, ci->skinName, DEFAULT_TEAM_HEAD, ci->skinName, teamname ) ) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 $388
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
NEI4 $382
line 698
;698:				CG_Error( "DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_TEAM_MODEL, ci->skinName );
ADDRGP4 $389
ARGP4
ADDRGP4 $388
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 699
;699:			}
line 700
;700:		} else {
ADDRGP4 $382
JUMPV
LABELV $381
line 701
;701:			if ( !CG_RegisterClientModelname( ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 $388
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
NEI4 $390
line 702
;702:				CG_Error( "DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL );
ADDRGP4 $392
ARGP4
ADDRGP4 $388
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 703
;703:			}
LABELV $390
line 704
;704:		}
LABELV $382
line 705
;705:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 706
;706:	}
LABELV $375
line 708
;707:
;708:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 709
;709:	if ( ci->torsoModel ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $393
line 712
;710:		orientation_t tag;
;711:		// if the torso model has the "tag_flag"
;712:		if ( trap_R_LerpTag( &tag, ci->torsoModel, 0, 0, 1, "tag_flag" ) ) {
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
ADDRGP4 $397
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $395
line 713
;713:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 714
;714:		}
LABELV $395
line 715
;715:	}
LABELV $393
line 718
;716:
;717:	// sounds
;718:	dir = ci->modelName;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
line 719
;719:	fallback = (cgs.gametype >= GT_TEAM) ? DEFAULT_TEAM_MODEL : DEFAULT_MODEL;
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $400
ADDRLP4 96
ADDRGP4 $388
ASGNP4
ADDRGP4 $401
JUMPV
LABELV $400
ADDRLP4 96
ADDRGP4 $388
ASGNP4
LABELV $401
ADDRLP4 20
ADDRLP4 96
INDIRP4
ASGNP4
line 721
;720:
;721:	for ( i = 0 ; i < MAX_CUSTOM_SOUNDS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $402
line 722
;722:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 723
;723:		if ( !s ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $406
line 724
;724:			break;
ADDRGP4 $404
JUMPV
LABELV $406
line 726
;725:		}
;726:		ci->sounds[i] = 0;
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
line 728
;727:		// if the model didn't load use the sounds of the default model
;728:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $408
line 729
;729:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", dir, s + 1), qfalse );
ADDRGP4 $410
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
line 730
;730:		}
LABELV $408
line 731
;731:		if ( !ci->sounds[i] ) {
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
NEI4 $411
line 732
;732:			ci->sounds[i] = trap_S_RegisterSound( va("sound/player/%s/%s", fallback, s + 1), qfalse );
ADDRGP4 $410
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
line 733
;733:		}
LABELV $411
line 734
;734:	}
LABELV $403
line 721
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $402
LABELV $404
line 736
;735:
;736:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 740
;737:
;738:	// reset any existing players and bodies, because they might be in bad
;739:	// frames for this new model
;740:	clientNum = ci - cgs.clientinfo;
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
line 741
;741:	for ( i = 0 ; i < MAX_GENTITIES ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $414
line 742
;742:		if ( cg_entities[i].currentState.clientNum == clientNum
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
NEI4 $418
ADDRLP4 100
INDIRI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $418
line 743
;743:			&& cg_entities[i].currentState.eType == ET_PLAYER ) {
line 744
;744:			CG_ResetPlayerEntity( &cg_entities[i] );
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
line 745
;745:		}
LABELV $418
line 746
;746:	}
LABELV $415
line 741
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $414
line 747
;747:}
LABELV $374
endproc CG_LoadClientInfo 152 24
proc CG_CopyClientInfoModel 52 12
line 754
;748:
;749:/*
;750:======================
;751:CG_CopyClientInfoModel
;752:======================
;753:*/
;754:static void CG_CopyClientInfoModel( clientInfo_t *from, clientInfo_t *to ) {
line 755
;755:	VectorCopy( from->headOffset, to->headOffset );
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
line 756
;756:	to->footsteps = from->footsteps;
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
line 757
;757:	to->gender = from->gender;
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
line 759
;758:
;759:	to->legsModel = from->legsModel;
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
line 760
;760:	to->legsSkin = from->legsSkin;
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
line 761
;761:	to->torsoModel = from->torsoModel;
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
line 762
;762:	to->torsoSkin = from->torsoSkin;
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
line 763
;763:	to->headModel = from->headModel;
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
line 764
;764:	to->headSkin = from->headSkin;
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
line 765
;765:	to->modelIcon = from->modelIcon;
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
line 767
;766:
;767:	to->newAnims = from->newAnims;
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
line 769
;768:
;769:	memcpy( to->animations, from->animations, sizeof( to->animations ) );
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
line 770
;770:	memcpy( to->sounds, from->sounds, sizeof( to->sounds ) );
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
line 771
;771:}
LABELV $422
endproc CG_CopyClientInfoModel 52 12
proc CG_ScanForExistingClientInfo 60 8
line 778
;772:
;773:/*
;774:======================
;775:CG_ScanForExistingClientInfo
;776:======================
;777:*/
;778:static qboolean CG_ScanForExistingClientInfo( clientInfo_t *ci ) {
line 782
;779:	int		i;
;780:	clientInfo_t	*match;
;781:
;782:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $427
JUMPV
LABELV $424
line 783
;783:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 784
;784:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $430
line 785
;785:			continue;
ADDRGP4 $425
JUMPV
LABELV $430
line 787
;786:		}
;787:		if ( match->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
line 788
;788:			continue;
ADDRGP4 $425
JUMPV
LABELV $432
line 790
;789:		}
;790:		if ( !Q_stricmp( ci->modelName, match->modelName )
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
NEI4 $434
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
NEI4 $434
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
NEI4 $434
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
NEI4 $434
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
NEI4 $434
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $437
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
NEI4 $434
LABELV $437
line 796
;791:			&& !Q_stricmp( ci->skinName, match->skinName )
;792:			&& !Q_stricmp( ci->headModelName, match->headModelName )
;793:			&& !Q_stricmp( ci->headSkinName, match->headSkinName ) 
;794:			&& !Q_stricmp( ci->blueTeam, match->blueTeam ) 
;795:			&& !Q_stricmp( ci->redTeam, match->redTeam )
;796:			&& (cgs.gametype < GT_TEAM || ci->team == match->team) ) {
line 799
;797:			// this clientinfo is identical, so use it's handles
;798:
;799:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 801
;800:
;801:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 803
;802:
;803:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $423
JUMPV
LABELV $434
line 805
;804:		}
;805:	}
LABELV $425
line 782
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $427
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $424
line 808
;806:
;807:	// nothing matches, so defer the load
;808:	return qfalse;
CNSTI4 0
RETI4
LABELV $423
endproc CG_ScanForExistingClientInfo 60 8
proc CG_SetDeferredClientInfo 36 8
line 819
;809:}
;810:
;811:/*
;812:======================
;813:CG_SetDeferredClientInfo
;814:
;815:We aren't going to load it now, so grab some other
;816:client's info to use until we have some spare time.
;817:======================
;818:*/
;819:static void CG_SetDeferredClientInfo( clientInfo_t *ci ) {
line 825
;820:	int		i;
;821:	clientInfo_t	*match;
;822:
;823:	// if someone else is already the same models and skins we
;824:	// can just load the client info
;825:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $442
JUMPV
LABELV $439
line 826
;826:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 827
;827:		if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $447
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $445
LABELV $447
line 828
;828:			continue;
ADDRGP4 $440
JUMPV
LABELV $445
line 830
;829:		}
;830:		if ( Q_stricmp( ci->skinName, match->skinName ) ||
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
NEI4 $452
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
NEI4 $452
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $448
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
EQI4 $448
LABELV $452
line 834
;831:			 Q_stricmp( ci->modelName, match->modelName ) ||
;832://			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;833://			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;834:			 (cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 835
;835:			continue;
ADDRGP4 $440
JUMPV
LABELV $448
line 838
;836:		}
;837:		// just load the real info cause it uses the same models and skins
;838:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 839
;839:		return;
ADDRGP4 $438
JUMPV
LABELV $440
line 825
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $442
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $439
line 843
;840:	}
;841:
;842:	// if we are in teamplay, only grab a model if the skin is correct
;843:	if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $453
line 844
;844:		for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $459
JUMPV
LABELV $456
line 845
;845:			match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 846
;846:			if ( !match->infoValid || match->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $464
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $462
LABELV $464
line 847
;847:				continue;
ADDRGP4 $457
JUMPV
LABELV $462
line 849
;848:			}
;849:			if ( Q_stricmp( ci->skinName, match->skinName ) ||
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
NEI4 $468
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $465
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
EQI4 $465
LABELV $468
line 850
;850:				(cgs.gametype >= GT_TEAM && ci->team != match->team) ) {
line 851
;851:				continue;
ADDRGP4 $457
JUMPV
LABELV $465
line 853
;852:			}
;853:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 854
;854:			CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 855
;855:			return;
ADDRGP4 $438
JUMPV
LABELV $457
line 844
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $459
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $456
line 861
;856:		}
;857:		// load the full model, because we don't ever want to show
;858:		// an improper team skin.  This will cause a hitch for the first
;859:		// player, when the second enters.  Combat shouldn't be going on
;860:		// yet, so it shouldn't matter
;861:		CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 862
;862:		return;
ADDRGP4 $438
JUMPV
LABELV $453
line 866
;863:	}
;864:
;865:	// find the first valid clientinfo and grab its stuff
;866:	for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $469
line 867
;867:		match = &cgs.clientinfo[ i ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 868
;868:		if ( !match->infoValid ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $475
line 869
;869:			continue;
ADDRGP4 $470
JUMPV
LABELV $475
line 872
;870:		}
;871:
;872:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 873
;873:		CG_CopyClientInfoModel( match, ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 874
;874:		return;
ADDRGP4 $438
JUMPV
LABELV $470
line 866
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $472
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $469
line 878
;875:	}
;876:
;877:	// we should never get here...
;878:	CG_Printf( "CG_SetDeferredClientInfo: no valid clients!\n" );
ADDRGP4 $477
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 880
;879:
;880:	CG_LoadClientInfo( ci );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 881
;881:}
LABELV $438
endproc CG_SetDeferredClientInfo 36 8
export CG_NewClientInfo
proc CG_NewClientInfo 1888 12
line 889
;882:
;883:
;884:/*
;885:======================
;886:CG_NewClientInfo
;887:======================
;888:*/
;889:void CG_NewClientInfo( int clientNum ) {
line 896
;890:	clientInfo_t *ci;
;891:	clientInfo_t newInfo;
;892:	const char	*configstring;
;893:	const char	*v;
;894:	char		*slash;
;895:
;896:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1720
CNSTI4 1708
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 898
;897:
;898:	configstring = CG_ConfigString( clientNum + CS_PLAYERS );
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
line 899
;899:	if ( !configstring[0] ) {
ADDRLP4 1712
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $480
line 900
;900:		memset( ci, 0, sizeof( *ci ) );
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
line 901
;901:		return;		// player just left
ADDRGP4 $478
JUMPV
LABELV $480
line 906
;902:	}
;903:
;904:	// build into a temp buffer so the defer checks can use
;905:	// the old value
;906:	memset( &newInfo, 0, sizeof( newInfo ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1708
ARGI4
ADDRGP4 memset
CALLP4
pop
line 909
;907:
;908:	// isolate the player's name
;909:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $482
ARGP4
ADDRLP4 1728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1728
INDIRP4
ASGNP4
line 910
;910:	Q_strncpyz( newInfo.name, v, sizeof( newInfo.name ) );
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
line 913
;911:
;912:	// colors
;913:	v = Info_ValueForKey( configstring, "c1" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $485
ARGP4
ADDRLP4 1732
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1732
INDIRP4
ASGNP4
line 914
;914:	CG_ColorFromString( v, newInfo.color1 );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 0+76
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 916
;915:
;916:	v = Info_ValueForKey( configstring, "c2" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $487
ARGP4
ADDRLP4 1736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1736
INDIRP4
ASGNP4
line 917
;917:	CG_ColorFromString( v, newInfo.color2 );
ADDRLP4 1708
INDIRP4
ARGP4
ADDRLP4 0+88
ARGP4
ADDRGP4 CG_ColorFromString
CALLV
pop
line 920
;918:
;919:	// bot skill
;920:	v = Info_ValueForKey( configstring, "skill" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $489
ARGP4
ADDRLP4 1740
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1740
INDIRP4
ASGNP4
line 921
;921:	newInfo.botSkill = atoi( v );
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
line 924
;922:
;923:	// handicap
;924:	v = Info_ValueForKey( configstring, "hc" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $491
ARGP4
ADDRLP4 1748
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1748
INDIRP4
ASGNP4
line 925
;925:	newInfo.handicap = atoi( v );
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
line 928
;926:
;927:	// wins
;928:	v = Info_ValueForKey( configstring, "w" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $493
ARGP4
ADDRLP4 1756
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1756
INDIRP4
ASGNP4
line 929
;929:	newInfo.wins = atoi( v );
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
line 932
;930:
;931:	// losses
;932:	v = Info_ValueForKey( configstring, "l" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $495
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1764
INDIRP4
ASGNP4
line 933
;933:	newInfo.losses = atoi( v );
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
line 936
;934:
;935:	// team
;936:	v = Info_ValueForKey( configstring, "t" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $497
ARGP4
ADDRLP4 1772
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1772
INDIRP4
ASGNP4
line 937
;937:	newInfo.team = atoi( v );
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
line 940
;938:
;939:	// team task
;940:	v = Info_ValueForKey( configstring, "tt" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $499
ARGP4
ADDRLP4 1780
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1780
INDIRP4
ASGNP4
line 941
;941:	newInfo.teamTask = atoi(v);
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
line 944
;942:
;943:	// team leader
;944:	v = Info_ValueForKey( configstring, "tl" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $501
ARGP4
ADDRLP4 1788
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1788
INDIRP4
ASGNP4
line 945
;945:	newInfo.teamLeader = atoi(v);
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
line 947
;946:
;947:	v = Info_ValueForKey( configstring, "g_redteam" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $503
ARGP4
ADDRLP4 1796
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1796
INDIRP4
ASGNP4
line 948
;948:	Q_strncpyz(newInfo.redTeam, v, MAX_TEAMNAME);
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
line 950
;949:
;950:	v = Info_ValueForKey( configstring, "g_blueteam" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $505
ARGP4
ADDRLP4 1800
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1800
INDIRP4
ASGNP4
line 951
;951:	Q_strncpyz(newInfo.blueTeam, v, MAX_TEAMNAME);
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
line 954
;952:
;953:	// model
;954:	v = Info_ValueForKey( configstring, "model" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $507
ARGP4
ADDRLP4 1804
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1804
INDIRP4
ASGNP4
line 955
;955:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $508
line 961
;956:		// forcemodel makes everyone use a single model
;957:		// to prevent load hitches
;958:		char modelStr[MAX_QPATH];
;959:		char *skin;
;960:
;961:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $511
line 962
;962:			Q_strncpyz( newInfo.modelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.modelName ) );
ADDRLP4 0+160
ARGP4
ADDRGP4 $388
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 963
;963:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 964
;964:		} else {
ADDRGP4 $512
JUMPV
LABELV $511
line 965
;965:			trap_Cvar_VariableStringBuffer( "model", modelStr, sizeof( modelStr ) );
ADDRGP4 $507
ARGP4
ADDRLP4 1808
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 966
;966:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
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
NEU4 $518
line 967
;967:				skin = "default";
ADDRLP4 1872
ADDRGP4 $118
ASGNP4
line 968
;968:			} else {
ADDRGP4 $519
JUMPV
LABELV $518
line 969
;969:				*skin++ = 0;
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
line 970
;970:			}
LABELV $519
line 972
;971:
;972:			Q_strncpyz( newInfo.skinName, skin, sizeof( newInfo.skinName ) );
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
line 973
;973:			Q_strncpyz( newInfo.modelName, modelStr, sizeof( newInfo.modelName ) );
ADDRLP4 0+160
ARGP4
ADDRLP4 1808
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 974
;974:		}
LABELV $512
line 976
;975:
;976:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $509
line 978
;977:			// keep skin name
;978:			slash = strchr( v, '/' );
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
line 979
;979:			if ( slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $509
line 980
;980:				Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
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
line 981
;981:			}
line 982
;982:		}
line 983
;983:	} else {
ADDRGP4 $509
JUMPV
LABELV $508
line 984
;984:		Q_strncpyz( newInfo.modelName, v, sizeof( newInfo.modelName ) );
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
line 986
;985:
;986:		slash = strchr( newInfo.modelName, '/' );
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
line 987
;987:		if ( !slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $534
line 989
;988:			// modelName didn not include a skin name
;989:			Q_strncpyz( newInfo.skinName, "default", sizeof( newInfo.skinName ) );
ADDRLP4 0+224
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 990
;990:		} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 991
;991:			Q_strncpyz( newInfo.skinName, slash + 1, sizeof( newInfo.skinName ) );
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
line 993
;992:			// truncate modelName
;993:			*slash = 0;
ADDRLP4 1716
INDIRP4
CNSTI1 0
ASGNI1
line 994
;994:		}
LABELV $535
line 995
;995:	}
LABELV $509
line 998
;996:
;997:	// head model
;998:	v = Info_ValueForKey( configstring, "hmodel" );
ADDRLP4 1712
INDIRP4
ARGP4
ADDRGP4 $540
ARGP4
ADDRLP4 1808
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1708
ADDRLP4 1808
INDIRP4
ASGNP4
line 999
;999:	if ( cg_forceModel.integer ) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $541
line 1005
;1000:		// forcemodel makes everyone use a single model
;1001:		// to prevent load hitches
;1002:		char modelStr[MAX_QPATH];
;1003:		char *skin;
;1004:
;1005:		if( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $544
line 1006
;1006:			Q_strncpyz( newInfo.headModelName, DEFAULT_TEAM_MODEL, sizeof( newInfo.headModelName ) );
ADDRLP4 0+288
ARGP4
ADDRGP4 $388
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1007
;1007:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1008
;1008:		} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1009
;1009:			trap_Cvar_VariableStringBuffer( "headmodel", modelStr, sizeof( modelStr ) );
ADDRGP4 $551
ARGP4
ADDRLP4 1812
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1010
;1010:			if ( ( skin = strchr( modelStr, '/' ) ) == NULL) {
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
NEU4 $552
line 1011
;1011:				skin = "default";
ADDRLP4 1876
ADDRGP4 $118
ASGNP4
line 1012
;1012:			} else {
ADDRGP4 $553
JUMPV
LABELV $552
line 1013
;1013:				*skin++ = 0;
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
line 1014
;1014:			}
LABELV $553
line 1016
;1015:
;1016:			Q_strncpyz( newInfo.headSkinName, skin, sizeof( newInfo.headSkinName ) );
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
line 1017
;1017:			Q_strncpyz( newInfo.headModelName, modelStr, sizeof( newInfo.headModelName ) );
ADDRLP4 0+288
ARGP4
ADDRLP4 1812
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1018
;1018:		}
LABELV $545
line 1020
;1019:
;1020:		if ( cgs.gametype >= GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $542
line 1022
;1021:			// keep skin name
;1022:			slash = strchr( v, '/' );
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
line 1023
;1023:			if ( slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $542
line 1024
;1024:				Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
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
line 1025
;1025:			}
line 1026
;1026:		}
line 1027
;1027:	} else {
ADDRGP4 $542
JUMPV
LABELV $541
line 1028
;1028:		Q_strncpyz( newInfo.headModelName, v, sizeof( newInfo.headModelName ) );
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
line 1030
;1029:
;1030:		slash = strchr( newInfo.headModelName, '/' );
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
line 1031
;1031:		if ( !slash ) {
ADDRLP4 1716
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $568
line 1033
;1032:			// modelName didn not include a skin name
;1033:			Q_strncpyz( newInfo.headSkinName, "default", sizeof( newInfo.headSkinName ) );
ADDRLP4 0+352
ARGP4
ADDRGP4 $118
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1034
;1034:		} else {
ADDRGP4 $569
JUMPV
LABELV $568
line 1035
;1035:			Q_strncpyz( newInfo.headSkinName, slash + 1, sizeof( newInfo.headSkinName ) );
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
line 1037
;1036:			// truncate modelName
;1037:			*slash = 0;
ADDRLP4 1716
INDIRP4
CNSTI1 0
ASGNI1
line 1038
;1038:		}
LABELV $569
line 1039
;1039:	}
LABELV $542
line 1043
;1040:
;1041:	// scan for an existing clientinfo that matches this modelname
;1042:	// so we can avoid loading checks if possible
;1043:	if ( !CG_ScanForExistingClientInfo( &newInfo ) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1812
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1812
INDIRI4
CNSTI4 0
NEI4 $574
line 1046
;1044:		qboolean	forceDefer;
;1045:
;1046:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1824
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1824
INDIRI4
CNSTI4 4000000
GEI4 $577
ADDRLP4 1820
CNSTI4 1
ASGNI4
ADDRGP4 $578
JUMPV
LABELV $577
ADDRLP4 1820
CNSTI4 0
ASGNI4
LABELV $578
ADDRLP4 1816
ADDRLP4 1820
INDIRI4
ASGNI4
line 1049
;1047:
;1048:		// if we are defering loads, just have it pick the first valid
;1049:		if ( forceDefer || (cg_deferPlayers.integer && !cg_buildScript.integer && !cg.loading ) ) {
ADDRLP4 1828
CNSTI4 0
ASGNI4
ADDRLP4 1816
INDIRI4
ADDRLP4 1828
INDIRI4
NEI4 $584
ADDRGP4 cg_deferPlayers+12
INDIRI4
ADDRLP4 1828
INDIRI4
EQI4 $579
ADDRGP4 cg_buildScript+12
INDIRI4
ADDRLP4 1828
INDIRI4
NEI4 $579
ADDRGP4 cg+20
INDIRI4
ADDRLP4 1828
INDIRI4
NEI4 $579
LABELV $584
line 1051
;1050:			// keep whatever they had if it won't violate team skins
;1051:			CG_SetDeferredClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1053
;1052:			// if we are low on memory, leave them with this model
;1053:			if ( forceDefer ) {
ADDRLP4 1816
INDIRI4
CNSTI4 0
EQI4 $580
line 1054
;1054:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $587
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1055
;1055:				newInfo.deferred = qfalse;
ADDRLP4 0+480
CNSTI4 0
ASGNI4
line 1056
;1056:			}
line 1057
;1057:		} else {
ADDRGP4 $580
JUMPV
LABELV $579
line 1058
;1058:			CG_LoadClientInfo( &newInfo );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1059
;1059:		}
LABELV $580
line 1060
;1060:	}
LABELV $574
line 1063
;1061:
;1062:	// replace whatever was there with the new one
;1063:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1064
;1064:	*ci = newInfo;
ADDRLP4 1720
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1708
line 1065
;1065:}
LABELV $478
endproc CG_NewClientInfo 1888 12
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 20 4
line 1078
;1066:
;1067:
;1068:
;1069:/*
;1070:======================
;1071:CG_LoadDeferredPlayers
;1072:
;1073:Called each frame when a player is dead
;1074:and the scoreboard is up
;1075:so deferred players can be loaded
;1076:======================
;1077:*/
;1078:void CG_LoadDeferredPlayers( void ) {
line 1083
;1079:	int		i;
;1080:	clientInfo_t	*ci;
;1081:
;1082:	// scan for a deferred player to load
;1083:	for ( i = 0, ci = cgs.clientinfo ; i < cgs.maxclients ; i++, ci++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+40972
ASGNP4
ADDRGP4 $593
JUMPV
LABELV $590
line 1084
;1084:		if ( ci->infoValid && ci->deferred ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $596
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $596
line 1086
;1085:			// if we are low on memory, leave it deferred
;1086:			if ( trap_MemoryRemaining() < 4000000 ) {
ADDRLP4 16
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 4000000
GEI4 $598
line 1087
;1087:				CG_Printf( "Memory is low.  Using deferred model.\n" );
ADDRGP4 $587
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1088
;1088:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 1089
;1089:				continue;
ADDRGP4 $591
JUMPV
LABELV $598
line 1091
;1090:			}
;1091:			CG_LoadClientInfo( ci );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1093
;1092://			break;
;1093:		}
LABELV $596
line 1094
;1094:	}
LABELV $591
line 1083
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
LABELV $593
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $590
line 1095
;1095:}
LABELV $589
endproc CG_LoadDeferredPlayers 20 4
proc CG_SetLerpFrameAnimation 12 8
line 1113
;1096:
;1097:/*
;1098:=============================================================================
;1099:
;1100:PLAYER ANIMATION
;1101:
;1102:=============================================================================
;1103:*/
;1104:
;1105:
;1106:/*
;1107:===============
;1108:CG_SetLerpFrameAnimation
;1109:
;1110:may include ANIM_TOGGLEBIT
;1111:===============
;1112:*/
;1113:static void CG_SetLerpFrameAnimation( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation ) {
line 1116
;1114:	animation_t	*anim;
;1115:
;1116:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1117
;1117:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1119
;1118:
;1119:	if ( newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS ) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $603
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $601
LABELV $603
line 1120
;1120:		CG_Error( "Bad animation number: %i", newAnimation );
ADDRGP4 $604
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1121
;1121:	}
LABELV $601
line 1123
;1122:
;1123:	anim = &ci->animations[ newAnimation ];
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
line 1125
;1124:
;1125:	lf->animation = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1126
;1126:	lf->animationTime = lf->frameTime + anim->initialLerp;
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
line 1128
;1127:
;1128:	if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $605
line 1129
;1129:		CG_Printf( "Anim: %i\n", newAnimation );
ADDRGP4 $608
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1130
;1130:	}
LABELV $605
line 1131
;1131:}
LABELV $600
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 44 12
line 1141
;1132:
;1133:/*
;1134:===============
;1135:CG_RunLerpFrame
;1136:
;1137:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1138:cg.time should be between oldFrameTime and frameTime after exit
;1139:===============
;1140:*/
;1141:static void CG_RunLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int newAnimation, float speedScale ) {
line 1146
;1142:	int			f, numFrames;
;1143:	animation_t	*anim;
;1144:
;1145:	// debugging tool to get no animations
;1146:	if ( cg_animSpeed.integer == 0 ) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $610
line 1147
;1147:		lf->oldFrame = lf->frame = lf->backlerp = 0;
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
line 1148
;1148:		return;
ADDRGP4 $609
JUMPV
LABELV $610
line 1152
;1149:	}
;1150:
;1151:	// see if the animation sequence is switching
;1152:	if ( newAnimation != lf->animationNumber || !lf->animation ) {
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
NEI4 $615
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $613
LABELV $615
line 1153
;1153:		CG_SetLerpFrameAnimation( ci, lf, newAnimation );
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
line 1154
;1154:	}
LABELV $613
line 1158
;1155:
;1156:	// if we have passed the current frame, move it to
;1157:	// oldFrame and calculate a new frame
;1158:	if ( cg.time >= lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $616
line 1159
;1159:		lf->oldFrame = lf->frame;
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
line 1160
;1160:		lf->oldFrameTime = lf->frameTime;
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
line 1163
;1161:
;1162:		// get the next frame based on the animation
;1163:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1164
;1164:		if ( !anim->frameLerp ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $619
line 1165
;1165:			return;		// shouldn't happen
ADDRGP4 $609
JUMPV
LABELV $619
line 1167
;1166:		}
;1167:		if ( cg.time < lf->animationTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $621
line 1168
;1168:			lf->frameTime = lf->animationTime;		// initial lerp
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
line 1169
;1169:		} else {
ADDRGP4 $622
JUMPV
LABELV $621
line 1170
;1170:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
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
line 1171
;1171:		}
LABELV $622
line 1172
;1172:		f = ( lf->frameTime - lf->animationTime ) / anim->frameLerp;
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
line 1173
;1173:		f *= speedScale;		// adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1175
;1174:
;1175:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1176
;1176:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $624
line 1177
;1177:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1178
;1178:		}
LABELV $624
line 1179
;1179:		if ( f >= numFrames ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $626
line 1180
;1180:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1181
;1181:			if ( anim->loopFrames ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $628
line 1182
;1182:				f %= anim->loopFrames;
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
line 1183
;1183:				f += anim->numFrames - anim->loopFrames;
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
line 1184
;1184:			} else {
ADDRGP4 $629
JUMPV
LABELV $628
line 1185
;1185:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1188
;1186:				// the animation is stuck at the end, so it
;1187:				// can immediately transition to another sequence
;1188:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1189
;1189:			}
LABELV $629
line 1190
;1190:		}
LABELV $626
line 1191
;1191:		if ( anim->reversed ) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $631
line 1192
;1192:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
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
line 1193
;1193:		}
ADDRGP4 $632
JUMPV
LABELV $631
line 1194
;1194:		else if (anim->flipflop && f>=anim->numFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $633
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $633
line 1195
;1195:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f%anim->numFrames);
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
line 1196
;1196:		}
ADDRGP4 $634
JUMPV
LABELV $633
line 1197
;1197:		else {
line 1198
;1198:			lf->frame = anim->firstFrame + f;
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
line 1199
;1199:		}
LABELV $634
LABELV $632
line 1200
;1200:		if ( cg.time > lf->frameTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $635
line 1201
;1201:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1202
;1202:			if ( cg_debugAnim.integer ) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $639
line 1203
;1203:				CG_Printf( "Clamp lf->frameTime\n");
ADDRGP4 $642
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1204
;1204:			}
LABELV $639
line 1205
;1205:		}
LABELV $635
line 1206
;1206:	}
LABELV $616
line 1208
;1207:
;1208:	if ( lf->frameTime > cg.time + 200 ) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $643
line 1209
;1209:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1210
;1210:	}
LABELV $643
line 1212
;1211:
;1212:	if ( lf->oldFrameTime > cg.time ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $647
line 1213
;1213:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1214
;1214:	}
LABELV $647
line 1216
;1215:	// calculate current lerp value
;1216:	if ( lf->frameTime == lf->oldFrameTime ) {
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
NEI4 $651
line 1217
;1217:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1218
;1218:	} else {
ADDRGP4 $652
JUMPV
LABELV $651
line 1219
;1219:		lf->backlerp = 1.0 - (float)( cg.time - lf->oldFrameTime ) / ( lf->frameTime - lf->oldFrameTime );
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
line 1220
;1220:	}
LABELV $652
line 1221
;1221:}
LABELV $609
endproc CG_RunLerpFrame 44 12
proc CG_ClearLerpFrame 16 12
line 1229
;1222:
;1223:
;1224:/*
;1225:===============
;1226:CG_ClearLerpFrame
;1227:===============
;1228:*/
;1229:static void CG_ClearLerpFrame( clientInfo_t *ci, lerpFrame_t *lf, int animationNumber ) {
line 1230
;1230:	lf->frameTime = lf->oldFrameTime = cg.time;
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
line 1231
;1231:	CG_SetLerpFrameAnimation( ci, lf, animationNumber );
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
line 1232
;1232:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
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
line 1233
;1233:}
LABELV $654
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1242
;1234:
;1235:
;1236:/*
;1237:===============
;1238:CG_PlayerAnimation
;1239:===============
;1240:*/
;1241:static void CG_PlayerAnimation( centity_t *cent, int *legsOld, int *legs, float *legsBackLerp,
;1242:						int *torsoOld, int *torso, float *torsoBackLerp ) {
line 1247
;1243:	clientInfo_t	*ci;
;1244:	int				clientNum;
;1245:	float			speedScale;
;1246:
;1247:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1249
;1248:
;1249:	if ( cg_noPlayerAnims.integer ) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $657
line 1250
;1250:		*legsOld = *legs = *torsoOld = *torso = 0;
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
line 1251
;1251:		return;
ADDRGP4 $656
JUMPV
LABELV $657
line 1254
;1252:	}
;1253:
;1254:	if ( cent->currentState.powerups & ( 1 << PW_HASTE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $660
line 1255
;1255:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1256
;1256:	} else {
ADDRGP4 $661
JUMPV
LABELV $660
line 1257
;1257:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1258
;1258:	}
LABELV $661
line 1260
;1259:
;1260:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 0
CNSTI4 1708
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1263
;1261:
;1262:	// do the shuffle turn frames locally
;1263:	if ( cent->pe.legs.yawing && ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) == LEGS_IDLE ) {
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
EQI4 $663
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $663
line 1264
;1264:		CG_RunLerpFrame( ci, &cent->pe.legs, LEGS_TURN, speedScale );
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
line 1265
;1265:	} else {
ADDRGP4 $664
JUMPV
LABELV $663
line 1266
;1266:		CG_RunLerpFrame( ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale );
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
line 1267
;1267:	}
LABELV $664
line 1269
;1268:
;1269:	*legsOld = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1270
;1270:	*legs = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1271
;1271:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ASGNF4
line 1273
;1272:
;1273:	CG_RunLerpFrame( ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale );
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
line 1275
;1274:
;1275:	*torsoOld = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
line 1276
;1276:	*torso = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1277
;1277:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRF4
ASGNF4
line 1278
;1278:}
LABELV $656
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1294
;1279:
;1280:/*
;1281:=============================================================================
;1282:
;1283:PLAYER ANGLES
;1284:
;1285:=============================================================================
;1286:*/
;1287:
;1288:/*
;1289:==================
;1290:CG_SwingAngles
;1291:==================
;1292:*/
;1293:static void CG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;1294:					float speed, float *angle, qboolean *swinging ) {
line 1299
;1295:	float	swing;
;1296:	float	move;
;1297:	float	scale;
;1298:
;1299:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $666
line 1301
;1300:		// see if a swing should be started
;1301:		swing = AngleSubtract( *angle, destination );
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
line 1302
;1302:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $670
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $668
LABELV $670
line 1303
;1303:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1304
;1304:		}
LABELV $668
line 1305
;1305:	}
LABELV $666
line 1307
;1306:
;1307:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $671
line 1308
;1308:		return;
ADDRGP4 $665
JUMPV
LABELV $671
line 1313
;1309:	}
;1310:	
;1311:	// modify the speed depending on the delta
;1312:	// so it doesn't seem so linear
;1313:	swing = AngleSubtract( destination, *angle );
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
line 1314
;1314:	scale = fabs( swing );
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
line 1315
;1315:	if ( scale < swingTolerance * 0.5 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $673
line 1316
;1316:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1317
;1317:	} else if ( scale < swingTolerance ) {
ADDRGP4 $674
JUMPV
LABELV $673
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $675
line 1318
;1318:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1319
;1319:	} else {
ADDRGP4 $676
JUMPV
LABELV $675
line 1320
;1320:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1321
;1321:	}
LABELV $676
LABELV $674
line 1324
;1322:
;1323:	// swing towards the destination angle
;1324:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $677
line 1325
;1325:		move = cg.frametime * scale * speed;
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
line 1326
;1326:		if ( move >= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $680
line 1327
;1327:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1328
;1328:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1329
;1329:		}
LABELV $680
line 1330
;1330:		*angle = AngleMod( *angle + move );
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
line 1331
;1331:	} else if ( swing < 0 ) {
ADDRGP4 $678
JUMPV
LABELV $677
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $682
line 1332
;1332:		move = cg.frametime * scale * -speed;
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
line 1333
;1333:		if ( move <= swing ) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $685
line 1334
;1334:			move = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1335
;1335:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1336
;1336:		}
LABELV $685
line 1337
;1337:		*angle = AngleMod( *angle + move );
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
line 1338
;1338:	}
LABELV $682
LABELV $678
line 1341
;1339:
;1340:	// clamp to no more than tolerance
;1341:	swing = AngleSubtract( destination, *angle );
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
line 1342
;1342:	if ( swing > clampTolerance ) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $687
line 1343
;1343:		*angle = AngleMod( destination - (clampTolerance - 1) );
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
line 1344
;1344:	} else if ( swing < -clampTolerance ) {
ADDRGP4 $688
JUMPV
LABELV $687
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $689
line 1345
;1345:		*angle = AngleMod( destination + (clampTolerance - 1) );
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
line 1346
;1346:	}
LABELV $689
LABELV $688
line 1347
;1347:}
LABELV $665
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1354
;1348:
;1349:/*
;1350:=================
;1351:CG_AddPainTwitch
;1352:=================
;1353:*/
;1354:static void CG_AddPainTwitch( centity_t *cent, vec3_t torsoAngles ) {
line 1358
;1355:	int		t;
;1356:	float	f;
;1357:
;1358:	t = cg.time - cent->pe.painTime;
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
line 1359
;1359:	if ( t >= PAIN_TWITCH_TIME ) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $693
line 1360
;1360:		return;
ADDRGP4 $691
JUMPV
LABELV $693
line 1363
;1361:	}
;1362:
;1363:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
line 1365
;1364:
;1365:	if ( cent->pe.painDirection ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $695
line 1366
;1366:		torsoAngles[ROLL] += 20 * f;
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
line 1367
;1367:	} else {
ADDRGP4 $696
JUMPV
LABELV $695
line 1368
;1368:		torsoAngles[ROLL] -= 20 * f;
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
line 1369
;1369:	}
LABELV $696
line 1370
;1370:}
LABELV $691
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $698
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
line 1387
;1371:
;1372:
;1373:/*
;1374:===============
;1375:CG_PlayerAngles
;1376:
;1377:Handles seperate torso motion
;1378:
;1379:  legs pivot based on direction of movement
;1380:
;1381:  head always looks exactly at cent->lerpAngles
;1382:
;1383:  if motion < 20 degrees, show in head only
;1384:  if < 45 degrees, also show in torso
;1385:===============
;1386:*/
;1387:static void CG_PlayerAngles( centity_t *cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3] ) {
line 1396
;1388:	vec3_t		legsAngles, torsoAngles, headAngles;
;1389:	float		dest;
;1390:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;1391:	vec3_t		velocity;
;1392:	float		speed;
;1393:	int			dir, clientNum;
;1394:	clientInfo_t	*ci;
;1395:
;1396:	VectorCopy( cent->lerpAngles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRB
ASGNB 12
line 1397
;1397:	headAngles[YAW] = AngleMod( headAngles[YAW] );
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
line 1398
;1398:	VectorClear( legsAngles );
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
line 1399
;1399:	VectorClear( torsoAngles );
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
line 1404
;1400:
;1401:	// --------- yaw -------------
;1402:
;1403:	// allow yaw to drift a bit
;1404:	if ( ( cent->currentState.legsAnim & ~ANIM_TOGGLEBIT ) != LEGS_IDLE 
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
NEI4 $707
ADDRLP4 80
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 11
EQI4 $705
LABELV $707
line 1405
;1405:		|| ( cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT ) != TORSO_STAND  ) {
line 1407
;1406:		// if not standing still, always point all in the same direction
;1407:		cent->pe.torso.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 1
ASGNI4
line 1408
;1408:		cent->pe.torso.pitching = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1409
;1409:		cent->pe.legs.yawing = qtrue;	// always center
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 1
ASGNI4
line 1410
;1410:	}
LABELV $705
line 1413
;1411:
;1412:	// adjust legs for movement dir
;1413:	if ( cent->currentState.eFlags & EF_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $708
line 1415
;1414:		// don't let dead bodies twitch
;1415:		dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1416
;1416:	} else {
ADDRGP4 $709
JUMPV
LABELV $708
line 1417
;1417:		dir = cent->currentState.angles2[YAW];
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1418
;1418:		if ( dir < 0 || dir > 7 ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $712
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $710
LABELV $712
line 1419
;1419:			CG_Error( "Bad player movement angle" );
ADDRGP4 $713
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1420
;1420:		}
LABELV $710
line 1421
;1421:	}
LABELV $709
line 1422
;1422:	legsAngles[YAW] = headAngles[YAW] + movementOffsets[ dir ];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $698
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1423
;1423:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $698
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1426
;1424:
;1425:	// torso
;1426:	CG_SwingAngles( torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing );
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
line 1427
;1427:	CG_SwingAngles( legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing );
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
line 1429
;1428:
;1429:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRF4
ASGNF4
line 1430
;1430:	legsAngles[YAW] = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ASGNF4
line 1436
;1431:
;1432:
;1433:	// --------- pitch -------------
;1434:
;1435:	// only show a fraction of the pitch angle in the torso
;1436:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $724
line 1437
;1437:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 1438
;1438:	} else {
ADDRGP4 $725
JUMPV
LABELV $724
line 1439
;1439:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
CNSTF4 1061158912
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1440
;1440:	}
LABELV $725
line 1441
;1441:	CG_SwingAngles( dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching );
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
line 1442
;1442:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1445
;1443:
;1444:	//
;1445:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1446
;1446:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $726
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $726
line 1447
;1447:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
CNSTI4 1708
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1448
;1448:		if ( ci->fixedtorso ) {
ADDRLP4 64
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
CNSTI4 0
EQI4 $729
line 1449
;1449:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1450
;1450:		}
LABELV $729
line 1451
;1451:	}
LABELV $726
line 1457
;1452:
;1453:	// --------- roll -------------
;1454:
;1455:
;1456:	// lean towards the direction of travel
;1457:	VectorCopy( cent->currentState.pos.trDelta, velocity );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1458
;1458:	speed = VectorNormalize( velocity );
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
line 1459
;1459:	if ( speed ) {
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $731
line 1463
;1460:		vec3_t	axis[3];
;1461:		float	side;
;1462:
;1463:		speed *= 0.05f;
ADDRLP4 56
CNSTF4 1028443341
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 1465
;1464:
;1465:		AnglesToAxis( legsAngles, axis );
ADDRLP4 12
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1466
;1466:		side = speed * DotProduct( velocity, axis[1] );
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
line 1467
;1467:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 144
INDIRF4
SUBF4
ASGNF4
line 1469
;1468:
;1469:		side = speed * DotProduct( velocity, axis[0] );
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
line 1470
;1470:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 144
INDIRF4
ADDF4
ASGNF4
line 1471
;1471:	}
LABELV $731
line 1474
;1472:
;1473:	//
;1474:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1475
;1475:	if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $745
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $745
line 1476
;1476:		ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 64
CNSTI4 1708
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1477
;1477:		if ( ci->fixedlegs ) {
ADDRLP4 64
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $748
line 1478
;1478:			legsAngles[YAW] = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1479
;1479:			legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1480
;1480:			legsAngles[ROLL] = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1481
;1481:		}
LABELV $748
line 1482
;1482:	}
LABELV $745
line 1485
;1483:
;1484:	// pain twitch
;1485:	CG_AddPainTwitch( cent, torsoAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1488
;1486:
;1487:	// pull the angles back out of the hierarchial chain
;1488:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1489
;1489:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1490
;1490:	AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1491
;1491:	AnglesToAxis( torsoAngles, torso );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1492
;1492:	AnglesToAxis( headAngles, head );
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1493
;1493:}
LABELV $697
endproc CG_PlayerAngles 148 24
proc CG_HasteTrail 40 48
line 1503
;1494:
;1495:
;1496://==========================================================================
;1497:
;1498:/*
;1499:===============
;1500:CG_HasteTrail
;1501:===============
;1502:*/
;1503:static void CG_HasteTrail( centity_t *cent ) {
line 1508
;1504:	localEntity_t	*smoke;
;1505:	vec3_t			origin;
;1506:	int				anim;
;1507:
;1508:	if ( cent->trailTime > cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $754
line 1509
;1509:		return;
ADDRGP4 $753
JUMPV
LABELV $754
line 1511
;1510:	}
;1511:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1512
;1512:	if ( anim != LEGS_RUN && anim != LEGS_BACK ) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $757
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $757
line 1513
;1513:		return;
ADDRGP4 $753
JUMPV
LABELV $757
line 1516
;1514:	}
;1515:
;1516:	cent->trailTime += 100;
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
line 1517
;1517:	if ( cent->trailTime < cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $759
line 1518
;1518:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1519
;1519:	}
LABELV $759
line 1521
;1520:
;1521:	VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 1522
;1522:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1524
;1523:
;1524:	smoke = CG_SmokePuff( origin, vec3_origin, 
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
line 1534
;1525:				  8, 
;1526:				  1, 1, 1, 1,
;1527:				  500, 
;1528:				  cg.time,
;1529:				  0,
;1530:				  0,
;1531:				  cgs.media.hastePuffShader );
;1532:
;1533:	// use the optimized local entity add
;1534:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1535
;1535:}
LABELV $753
endproc CG_HasteTrail 40 48
proc CG_TrailItem 188 12
line 1630
;1536:
;1537:#ifdef MISSIONPACK
;1538:/*
;1539:===============
;1540:CG_BreathPuffs
;1541:===============
;1542:*/
;1543:static void CG_BreathPuffs( centity_t *cent, refEntity_t *head) {
;1544:	clientInfo_t *ci;
;1545:	vec3_t up, origin;
;1546:	int contents;
;1547:
;1548:	ci = &cgs.clientinfo[ cent->currentState.number ];
;1549:
;1550:	if (!cg_enableBreath.integer) {
;1551:		return;
;1552:	}
;1553:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
;1554:		return;
;1555:	}
;1556:	if ( cent->currentState.eFlags & EF_DEAD ) {
;1557:		return;
;1558:	}
;1559:	contents = trap_CM_PointContents( head->origin, 0 );
;1560:	if ( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
;1561:		return;
;1562:	}
;1563:	if ( ci->breathPuffTime > cg.time ) {
;1564:		return;
;1565:	}
;1566:
;1567:	VectorSet( up, 0, 0, 8 );
;1568:	VectorMA(head->origin, 8, head->axis[0], origin);
;1569:	VectorMA(origin, -4, head->axis[2], origin);
;1570:	CG_SmokePuff( origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader );
;1571:	ci->breathPuffTime = cg.time + 2000;
;1572:}
;1573:
;1574:/*
;1575:===============
;1576:CG_DustTrail
;1577:===============
;1578:*/
;1579:static void CG_DustTrail( centity_t *cent ) {
;1580:	int				anim;
;1581:	localEntity_t	*dust;
;1582:	vec3_t end, vel;
;1583:	trace_t tr;
;1584:
;1585:	if (!cg_enableDust.integer)
;1586:		return;
;1587:
;1588:	if ( cent->dustTrailTime > cg.time ) {
;1589:		return;
;1590:	}
;1591:
;1592:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;1593:	if ( anim != LEGS_LANDB && anim != LEGS_LAND ) {
;1594:		return;
;1595:	}
;1596:
;1597:	cent->dustTrailTime += 40;
;1598:	if ( cent->dustTrailTime < cg.time ) {
;1599:		cent->dustTrailTime = cg.time;
;1600:	}
;1601:
;1602:	VectorCopy(cent->currentState.pos.trBase, end);
;1603:	end[2] -= 64;
;1604:	CG_Trace( &tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID );
;1605:
;1606:	if ( !(tr.surfaceFlags & SURF_DUST) )
;1607:		return;
;1608:
;1609:	VectorCopy( cent->currentState.pos.trBase, end );
;1610:	end[2] -= 16;
;1611:
;1612:	VectorSet(vel, 0, 0, -30);
;1613:	dust = CG_SmokePuff( end, vel,
;1614:				  24,
;1615:				  .8f, .8f, 0.7f, 0.33f,
;1616:				  500,
;1617:				  cg.time,
;1618:				  0,
;1619:				  0,
;1620:				  cgs.media.dustPuffShader );
;1621:}
;1622:
;1623:#endif
;1624:
;1625:/*
;1626:===============
;1627:CG_TrailItem
;1628:===============
;1629:*/
;1630:static void CG_TrailItem( centity_t *cent, qhandle_t hModel ) {
line 1635
;1631:	refEntity_t		ent;
;1632:	vec3_t			angles;
;1633:	vec3_t			axis[3];
;1634:
;1635:	VectorCopy( cent->lerpAngles, angles );
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRB
ASGNB 12
line 1636
;1636:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1637
;1637:	angles[ROLL] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1638
;1638:	AnglesToAxis( angles, axis );
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1640
;1639:
;1640:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1641
;1641:	VectorMA( cent->lerpOrigin, -16, axis[0], ent.origin );
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
line 1642
;1642:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1643
;1643:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1644
;1644:	AnglesToAxis( angles, ent.axis );
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1646
;1645:
;1646:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1647
;1647:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1648
;1648:}
LABELV $767
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 356 24
line 1656
;1649:
;1650:
;1651:/*
;1652:===============
;1653:CG_PlayerFlag
;1654:===============
;1655:*/
;1656:static void CG_PlayerFlag( centity_t *cent, qhandle_t hSkin, refEntity_t *torso ) {
line 1665
;1657:	clientInfo_t	*ci;
;1658:	refEntity_t	pole;
;1659:	refEntity_t	flag;
;1660:	vec3_t		angles, dir;
;1661:	int			legsAnim, flagAnim, updateangles;
;1662:	float		angle, d;
;1663:
;1664:	// show the flag pole model
;1665:	memset( &pole, 0, sizeof(pole) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1666
;1666:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+152340+88
INDIRI4
ASGNI4
line 1667
;1667:	VectorCopy( torso->lightingOrigin, pole.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1668
;1668:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1669
;1669:	pole.renderfx = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1670
;1670:	CG_PositionEntityOnTag( &pole, torso, torso->hModel, "tag_flag" );
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
ADDRGP4 $397
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1671
;1671:	trap_R_AddRefEntityToScene( &pole );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1674
;1672:
;1673:	// show the flag model
;1674:	memset( &flag, 0, sizeof(flag) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1675
;1675:	flag.hModel = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+152340+92
INDIRI4
ASGNI4
line 1676
;1676:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1677
;1677:	VectorCopy( torso->lightingOrigin, flag.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1678
;1678:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1679
;1679:	flag.renderfx = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1681
;1680:
;1681:	VectorClear(angles);
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
line 1683
;1682:
;1683:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 1684
;1684:	legsAnim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1685
;1685:	if( legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR ) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $799
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $797
LABELV $799
line 1686
;1686:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1687
;1687:	} else if ( legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR ) {
ADDRGP4 $798
JUMPV
LABELV $797
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $802
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $800
LABELV $802
line 1688
;1688:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1689
;1689:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1690
;1690:	} else {
ADDRGP4 $801
JUMPV
LABELV $800
line 1691
;1691:		flagAnim = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 1692
;1692:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1693
;1693:	}
LABELV $801
LABELV $798
line 1695
;1694:
;1695:	if ( updateangles ) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $803
line 1697
;1696:
;1697:		VectorCopy( cent->currentState.pos.trDelta, dir );
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1699
;1698:		// add gravity
;1699:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1700
;1700:		VectorNormalize( dir );
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1701
;1701:		d = DotProduct(pole.axis[2], dir);
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
line 1703
;1702:		// if there is anough movement orthogonal to the flag pole
;1703:		if (fabs(d) < 0.9) {
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
GEF4 $816
line 1705
;1704:			//
;1705:			d = DotProduct(pole.axis[0], dir);
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
line 1706
;1706:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $825
line 1707
;1707:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 1708
;1708:			}
ADDRGP4 $826
JUMPV
LABELV $825
line 1709
;1709:			else if (d < -1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $827
line 1710
;1710:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 1711
;1711:			}
LABELV $827
LABELV $826
line 1712
;1712:			angle = acos(d);
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
line 1714
;1713:
;1714:			d = DotProduct(pole.axis[1], dir);
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
line 1715
;1715:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $839
line 1716
;1716:				angles[YAW] = 360 - angle * 180 / M_PI;
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
line 1717
;1717:			}
ADDRGP4 $840
JUMPV
LABELV $839
line 1718
;1718:			else {
line 1719
;1719:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1127481344
ADDRLP4 324
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1720
;1720:			}
LABELV $840
line 1721
;1721:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $843
line 1722
;1722:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $843
line 1723
;1723:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $847
line 1724
;1724:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $847
line 1729
;1725:
;1726:			//vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1727:			//angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1728:			// change the yaw angle
;1729:			CG_SwingAngles( angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing );
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
line 1730
;1730:		}
LABELV $816
line 1750
;1731:
;1732:		/*
;1733:		d = DotProduct(pole.axis[2], dir);
;1734:		angle = Q_acos(d);
;1735:
;1736:		d = DotProduct(pole.axis[1], dir);
;1737:		if (d < 0) {
;1738:			angle = 360 - angle * 180 / M_PI;
;1739:		}
;1740:		else {
;1741:			angle = angle * 180 / M_PI;
;1742:		}
;1743:		if (angle > 340 && angle < 20) {
;1744:			flagAnim = FLAG_RUNUP;
;1745:		}
;1746:		if (angle > 160 && angle < 200) {
;1747:			flagAnim = FLAG_RUNDOWN;
;1748:		}
;1749:		*/
;1750:	}
LABELV $803
line 1753
;1751:
;1752:	// set the yaw angle
;1753:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ASGNF4
line 1755
;1754:	// lerp the flag animation frames
;1755:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
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
line 1756
;1756:	CG_RunLerpFrame( ci, &cent->pe.flag, flagAnim, 1 );
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
line 1757
;1757:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 1758
;1758:	flag.frame = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 1759
;1759:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ASGNF4
line 1761
;1760:
;1761:	AnglesToAxis( angles, flag.axis );
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1762
;1762:	CG_PositionRotatedEntityOnTag( &flag, &pole, pole.hModel, "tag_flag" );
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $397
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1764
;1763:
;1764:	trap_R_AddRefEntityToScene( &flag );
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1765
;1765:}
LABELV $781
endproc CG_PlayerFlag 356 24
proc CG_PlayerPowerups 16 20
line 1841
;1766:
;1767:
;1768:#ifdef MISSIONPACK // bk001204
;1769:/*
;1770:===============
;1771:CG_PlayerTokens
;1772:===============
;1773:*/
;1774:static void CG_PlayerTokens( centity_t *cent, int renderfx ) {
;1775:	int			tokens, i, j;
;1776:	float		angle;
;1777:	refEntity_t	ent;
;1778:	vec3_t		dir, origin;
;1779:	skulltrail_t *trail;
;1780:	trail = &cg.skulltrails[cent->currentState.number];
;1781:	tokens = cent->currentState.generic1;
;1782:	if ( !tokens ) {
;1783:		trail->numpositions = 0;
;1784:		return;
;1785:	}
;1786:
;1787:	if ( tokens > MAX_SKULLTRAIL ) {
;1788:		tokens = MAX_SKULLTRAIL;
;1789:	}
;1790:
;1791:	// add skulls if there are more than last time
;1792:	for (i = 0; i < tokens - trail->numpositions; i++) {
;1793:		for (j = trail->numpositions; j > 0; j--) {
;1794:			VectorCopy(trail->positions[j-1], trail->positions[j]);
;1795:		}
;1796:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
;1797:	}
;1798:	trail->numpositions = tokens;
;1799:
;1800:	// move all the skulls along the trail
;1801:	VectorCopy(cent->lerpOrigin, origin);
;1802:	for (i = 0; i < trail->numpositions; i++) {
;1803:		VectorSubtract(trail->positions[i], origin, dir);
;1804:		if (VectorNormalize(dir) > 30) {
;1805:			VectorMA(origin, 30, dir, trail->positions[i]);
;1806:		}
;1807:		VectorCopy(trail->positions[i], origin);
;1808:	}
;1809:
;1810:	memset( &ent, 0, sizeof( ent ) );
;1811:	if( cgs.clientinfo[ cent->currentState.clientNum ].team == TEAM_BLUE ) {
;1812:		ent.hModel = cgs.media.redCubeModel;
;1813:	} else {
;1814:		ent.hModel = cgs.media.blueCubeModel;
;1815:	}
;1816:	ent.renderfx = renderfx;
;1817:
;1818:	VectorCopy(cent->lerpOrigin, origin);
;1819:	for (i = 0; i < trail->numpositions; i++) {
;1820:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
;1821:		ent.axis[0][2] = 0;
;1822:		VectorNormalize(ent.axis[0]);
;1823:		VectorSet(ent.axis[2], 0, 0, 1);
;1824:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
;1825:
;1826:		VectorCopy(trail->positions[i], ent.origin);
;1827:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
;1828:		ent.origin[2] += sin(angle) * 10;
;1829:		trap_R_AddRefEntityToScene( &ent );
;1830:		VectorCopy(trail->positions[i], origin);
;1831:	}
;1832:}
;1833:#endif
;1834:
;1835:
;1836:/*
;1837:===============
;1838:CG_PlayerPowerups
;1839:===============
;1840:*/
;1841:static void CG_PlayerPowerups( centity_t *cent, refEntity_t *torso ) {
line 1845
;1842:	int		powerups;
;1843:	clientInfo_t	*ci;
;1844:
;1845:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1846
;1846:	if ( !powerups ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $860
line 1847
;1847:		return;
ADDRGP4 $859
JUMPV
LABELV $860
line 1851
;1848:	}
;1849:
;1850:	// quad gives a dlight
;1851:	if ( powerups & ( 1 << PW_QUAD ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $862
line 1852
;1852:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1 );
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
line 1853
;1853:	}
LABELV $862
line 1856
;1854:
;1855:	// flight plays a looped sound
;1856:	if ( powerups & ( 1 << PW_FLIGHT ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $864
line 1857
;1857:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound );
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
ADDRGP4 cgs+152340+876
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 1858
;1858:	}
LABELV $864
line 1860
;1859:
;1860:	ci = &cgs.clientinfo[ cent->currentState.clientNum ];
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
line 1862
;1861:	// redflag
;1862:	if ( powerups & ( 1 << PW_REDFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $869
line 1863
;1863:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $871
line 1864
;1864:			CG_PlayerFlag( cent, cgs.media.redFlagFlapSkin, torso );
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
line 1865
;1865:		}
ADDRGP4 $872
JUMPV
LABELV $871
line 1866
;1866:		else {
line 1867
;1867:			CG_TrailItem( cent, cgs.media.redFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1868
;1868:		}
LABELV $872
line 1869
;1869:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 0.2f, 0.2f );
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
line 1870
;1870:	}
LABELV $869
line 1873
;1871:
;1872:	// blueflag
;1873:	if ( powerups & ( 1 << PW_BLUEFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $877
line 1874
;1874:		if (ci->newAnims){
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $879
line 1875
;1875:			CG_PlayerFlag( cent, cgs.media.blueFlagFlapSkin, torso );
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
line 1876
;1876:		}
ADDRGP4 $880
JUMPV
LABELV $879
line 1877
;1877:		else {
line 1878
;1878:			CG_TrailItem( cent, cgs.media.blueFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1879
;1879:		}
LABELV $880
line 1880
;1880:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 0.2f, 0.2f, 1.0 );
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
line 1881
;1881:	}
LABELV $877
line 1884
;1882:
;1883:	// neutralflag
;1884:	if ( powerups & ( 1 << PW_NEUTRALFLAG ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $885
line 1885
;1885:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $887
line 1886
;1886:			CG_PlayerFlag( cent, cgs.media.neutralFlagFlapSkin, torso );
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
line 1887
;1887:		}
ADDRGP4 $888
JUMPV
LABELV $887
line 1888
;1888:		else {
line 1889
;1889:			CG_TrailItem( cent, cgs.media.neutralFlagModel );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 1890
;1890:		}
LABELV $888
line 1891
;1891:		trap_R_AddLightToScene( cent->lerpOrigin, 200 + (rand()&31), 1.0, 1.0, 1.0 );
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
line 1892
;1892:	}
LABELV $885
line 1895
;1893:
;1894:	// haste leaves smoke trails
;1895:	if ( powerups & ( 1 << PW_HASTE ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $893
line 1896
;1896:		CG_HasteTrail( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 1897
;1897:	}
LABELV $893
line 1898
;1898:}
LABELV $859
endproc CG_PlayerPowerups 16 20
proc CG_PlayerFloatSprite 144 12
line 1908
;1899:
;1900:
;1901:/*
;1902:===============
;1903:CG_PlayerFloatSprite
;1904:
;1905:Float a sprite over the player's head
;1906:===============
;1907:*/
;1908:static void CG_PlayerFloatSprite( centity_t *cent, qhandle_t shader ) {
line 1912
;1909:	int				rf;
;1910:	refEntity_t		ent;
;1911:
;1912:	if ( cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $896
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $896
line 1913
;1913:		rf = RF_THIRD_PERSON;		// only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 1914
;1914:	} else {
ADDRGP4 $897
JUMPV
LABELV $896
line 1915
;1915:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 1916
;1916:	}
LABELV $897
line 1918
;1917:
;1918:	memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1919
;1919:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 1920
;1920:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1921
;1921:	ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1922
;1922:	ent.customShader = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 1923
;1923:	ent.radius = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 1924
;1924:	ent.renderfx = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 1925
;1925:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 1926
;1926:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 1927
;1927:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 1928
;1928:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 1929
;1929:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1930
;1930:}
LABELV $895
endproc CG_PlayerFloatSprite 144 12
proc CG_PlayerSprites 8 8
line 1941
;1931:
;1932:
;1933:
;1934:/*
;1935:===============
;1936:CG_PlayerSprites
;1937:
;1938:Float sprites over the player's head
;1939:===============
;1940:*/
;1941:static void CG_PlayerSprites( centity_t *cent ) {
line 1944
;1942:	int		team;
;1943:
;1944:	if ( cent->currentState.eFlags & EF_CONNECTION ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $914
line 1945
;1945:		CG_PlayerFloatSprite( cent, cgs.media.connectionShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+208
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1946
;1946:		return;
ADDRGP4 $913
JUMPV
LABELV $914
line 1949
;1947:	}
;1948:
;1949:	if ( cent->currentState.eFlags & EF_TALK ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $918
line 1950
;1950:		CG_PlayerFloatSprite( cent, cgs.media.balloonShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+204
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1951
;1951:		return;
ADDRGP4 $913
JUMPV
LABELV $918
line 1954
;1952:	}
;1953:
;1954:	if ( cent->currentState.eFlags & EF_AWARD_IMPRESSIVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $922
line 1955
;1955:		CG_PlayerFloatSprite( cent, cgs.media.medalImpressive );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+524
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1956
;1956:		return;
ADDRGP4 $913
JUMPV
LABELV $922
line 1959
;1957:	}
;1958:
;1959:	if ( cent->currentState.eFlags & EF_AWARD_EXCELLENT ) {
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
EQI4 $926
line 1960
;1960:		CG_PlayerFloatSprite( cent, cgs.media.medalExcellent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+528
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1961
;1961:		return;
ADDRGP4 $913
JUMPV
LABELV $926
line 1964
;1962:	}
;1963:
;1964:	if ( cent->currentState.eFlags & EF_AWARD_GAUNTLET ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $930
line 1965
;1965:		CG_PlayerFloatSprite( cent, cgs.media.medalGauntlet );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+532
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1966
;1966:		return;
ADDRGP4 $913
JUMPV
LABELV $930
line 1969
;1967:	}
;1968:
;1969:	if ( cent->currentState.eFlags & EF_AWARD_DEFEND ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $934
line 1970
;1970:		CG_PlayerFloatSprite( cent, cgs.media.medalDefend );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+536
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1971
;1971:		return;
ADDRGP4 $913
JUMPV
LABELV $934
line 1974
;1972:	}
;1973:
;1974:	if ( cent->currentState.eFlags & EF_AWARD_ASSIST ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $938
line 1975
;1975:		CG_PlayerFloatSprite( cent, cgs.media.medalAssist );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+540
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1976
;1976:		return;
ADDRGP4 $913
JUMPV
LABELV $938
line 1979
;1977:	}
;1978:
;1979:	if ( cent->currentState.eFlags & EF_AWARD_CAP ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $942
line 1980
;1980:		CG_PlayerFloatSprite( cent, cgs.media.medalCapture );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+544
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1981
;1981:		return;
ADDRGP4 $913
JUMPV
LABELV $942
line 1984
;1982:	}
;1983:
;1984:	team = cgs.clientinfo[ cent->currentState.clientNum ].team;
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
line 1985
;1985:	if ( !(cent->currentState.eFlags & EF_DEAD) && 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $948
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $948
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $948
line 1987
;1986:		cg.snap->ps.persistant[PERS_TEAM] == team &&
;1987:		cgs.gametype >= GT_TEAM) {
line 1988
;1988:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $913
line 1989
;1989:			CG_PlayerFloatSprite( cent, cgs.media.friendShader );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+152340+200
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 1990
;1990:		}
line 1991
;1991:		return;
LABELV $948
line 1993
;1992:	}
;1993:}
LABELV $913
endproc CG_PlayerSprites 8 8
lit
align 4
LABELV $958
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $959
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 104 44
line 2005
;1994:
;1995:/*
;1996:===============
;1997:CG_PlayerShadow
;1998:
;1999:Returns the Z component of the surface being shadowed
;2000:
;2001:  should it return a full plane instead of a Z?
;2002:===============
;2003:*/
;2004:#define	SHADOW_DISTANCE		128
;2005:static qboolean CG_PlayerShadow( centity_t *cent, float *shadowPlane ) {
line 2006
;2006:	vec3_t		end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $958
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $959
INDIRB
ASGNB 12
line 2010
;2007:	trace_t		trace;
;2008:	float		alpha;
;2009:
;2010:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2012
;2011:
;2012:	if ( cg_shadows.integer == 0 ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $960
line 2013
;2013:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $960
line 2017
;2014:	}
;2015:
;2016:	// no shadows when invisible
;2017:	if ( cent->currentState.powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $963
line 2018
;2018:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $963
line 2022
;2019:	}
;2020:
;2021:	// send a trace down from the player to the ground
;2022:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2023
;2023:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2025
;2024:
;2025:	trap_CM_BoxTrace( &trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID );
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
line 2028
;2026:
;2027:	// no shadow if too high
;2028:	if ( trace.fraction == 1.0 || trace.startsolid || trace.allsolid ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $971
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $971
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $966
LABELV $971
line 2029
;2029:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $957
JUMPV
LABELV $966
line 2032
;2030:	}
;2031:
;2032:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2034
;2033:
;2034:	if ( cg_shadows.integer != 1 ) {	// no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $974
line 2035
;2035:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $957
JUMPV
LABELV $974
line 2039
;2036:	}
;2037:
;2038:	// fade the shadow out with height
;2039:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2046
;2040:
;2041:	// bk0101022 - hack / FPE - bogus planes?
;2042:	//assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f ) 
;2043:
;2044:	// add the mark as a temporary, so it goes directly to the renderer
;2045:	// without taking a spot in the cg_marks array
;2046:	CG_ImpactMark( cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, 
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
line 2049
;2047:		cent->pe.legs.yawAngle, alpha,alpha,alpha,1, qfalse, 24, qtrue );
;2048:
;2049:	return qtrue;
CNSTI4 1
RETI4
LABELV $957
endproc CG_PlayerShadow 104 44
proc CG_PlayerSplash 192 28
line 2060
;2050:}
;2051:
;2052:
;2053:/*
;2054:===============
;2055:CG_PlayerSplash
;2056:
;2057:Draw a mark at the water surface
;2058:===============
;2059:*/
;2060:static void CG_PlayerSplash( centity_t *cent ) {
line 2066
;2061:	vec3_t		start, end;
;2062:	trace_t		trace;
;2063:	int			contents;
;2064:	polyVert_t	verts[4];
;2065:
;2066:	if ( !cg_shadows.integer ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $983
line 2067
;2067:		return;
ADDRGP4 $982
JUMPV
LABELV $983
line 2070
;2068:	}
;2069:
;2070:	VectorCopy( cent->lerpOrigin, end );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2071
;2071:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2075
;2072:
;2073:	// if the feet aren't in liquid, don't make a mark
;2074:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2075:	contents = trap_CM_PointContents( end, 0 );
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
line 2076
;2076:	if ( !( contents & ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $987
line 2077
;2077:		return;
ADDRGP4 $982
JUMPV
LABELV $987
line 2080
;2078:	}
;2079:
;2080:	VectorCopy( cent->lerpOrigin, start );
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2081
;2081:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2084
;2082:
;2083:	// if the head isn't out of liquid, don't make a mark
;2084:	contents = trap_CM_PointContents( start, 0 );
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
line 2085
;2085:	if ( contents & ( CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) ) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $990
line 2086
;2086:		return;
ADDRGP4 $982
JUMPV
LABELV $990
line 2090
;2087:	}
;2088:
;2089:	// trace down to find the surface
;2090:	trap_CM_BoxTrace( &trace, start, end, NULL, NULL, 0, ( CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA ) );
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
line 2092
;2091:
;2092:	if ( trace.fraction == 1.0 ) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $992
line 2093
;2093:		return;
ADDRGP4 $982
JUMPV
LABELV $992
line 2097
;2094:	}
;2095:
;2096:	// create a mark polygon
;2097:	VectorCopy( trace.endpos, verts[0].xyz );
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2098
;2098:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2099
;2099:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2100
;2100:	verts[0].st[0] = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2101
;2101:	verts[0].st[1] = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2102
;2102:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2103
;2103:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2104
;2104:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2105
;2105:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2107
;2106:
;2107:	VectorCopy( trace.endpos, verts[1].xyz );
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2108
;2108:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2109
;2109:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2110
;2110:	verts[1].st[0] = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2111
;2111:	verts[1].st[1] = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2112
;2112:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2113
;2113:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2114
;2114:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2115
;2115:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2117
;2116:
;2117:	VectorCopy( trace.endpos, verts[2].xyz );
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2118
;2118:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2119
;2119:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2120
;2120:	verts[2].st[0] = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2121
;2121:	verts[2].st[1] = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2122
;2122:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2123
;2123:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2124
;2124:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2125
;2125:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2127
;2126:
;2127:	VectorCopy( trace.endpos, verts[3].xyz );
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2128
;2128:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2129
;2129:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2130
;2130:	verts[3].st[0] = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2131
;2131:	verts[3].st[1] = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2132
;2132:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2133
;2133:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2134
;2134:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2135
;2135:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2137
;2136:
;2137:	trap_R_AddPolyToScene( cgs.media.wakeMarkShader, 4, verts );
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
line 2138
;2138:}
LABELV $982
endproc CG_PlayerSplash 192 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 0 4
line 2150
;2139:
;2140:
;2141:
;2142:/*
;2143:===============
;2144:CG_AddRefEntityWithPowerups
;2145:
;2146:Adds a piece with modifications or duplications for powerups
;2147:Also called by CG_Missile for quad rockets, but nobody can tell...
;2148:===============
;2149:*/
;2150:void CG_AddRefEntityWithPowerups( refEntity_t *ent, entityState_t *state, int team ) {
line 2152
;2151:
;2152:	if ( state->powerups & ( 1 << PW_INVIS ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1073
line 2153
;2153:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+412
INDIRI4
ASGNI4
line 2154
;2154:		trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2155
;2155:	} else {
ADDRGP4 $1074
JUMPV
LABELV $1073
line 2165
;2156:		/*
;2157:		if ( state->eFlags & EF_KAMIKAZE ) {
;2158:			if (team == TEAM_BLUE)
;2159:				ent->customShader = cgs.media.blueKamikazeShader;
;2160:			else
;2161:				ent->customShader = cgs.media.redKamikazeShader;
;2162:			trap_R_AddRefEntityToScene( ent );
;2163:		}
;2164:		else {*/
;2165:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2168
;2166:		//}
;2167:
;2168:		if ( state->powerups & ( 1 << PW_QUAD ) )
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1077
line 2169
;2169:		{
line 2170
;2170:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1079
line 2171
;2171:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+404
INDIRI4
ASGNI4
ADDRGP4 $1080
JUMPV
LABELV $1079
line 2173
;2172:			else
;2173:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+400
INDIRI4
ASGNI4
LABELV $1080
line 2174
;2174:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2175
;2175:		}
LABELV $1077
line 2176
;2176:		if ( state->powerups & ( 1 << PW_REGEN ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1085
line 2177
;2177:			if ( ( ( cg.time / 100 ) % 10 ) == 1 ) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1087
line 2178
;2178:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+416
INDIRI4
ASGNI4
line 2179
;2179:				trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2180
;2180:			}
LABELV $1087
line 2181
;2181:		}
LABELV $1085
line 2182
;2182:		if ( state->powerups & ( 1 << PW_BATTLESUIT ) ) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1092
line 2183
;2183:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+152340+420
INDIRI4
ASGNI4
line 2184
;2184:			trap_R_AddRefEntityToScene( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2185
;2185:		}
LABELV $1092
line 2186
;2186:	}
LABELV $1074
line 2187
;2187:}
LABELV $1072
endproc CG_AddRefEntityWithPowerups 0 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2195
;2188:
;2189:/*
;2190:=================
;2191:CG_LightVerts
;2192:=================
;2193:*/
;2194:int CG_LightVerts( vec3_t normal, int numVerts, polyVert_t *verts )
;2195:{
line 2202
;2196:	int				i, j;
;2197:	float			incoming;
;2198:	vec3_t			ambientLight;
;2199:	vec3_t			lightDir;
;2200:	vec3_t			directedLight;
;2201:
;2202:	trap_R_LightForPoint( verts[0].xyz, ambientLight, directedLight, lightDir );
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
line 2204
;2203:
;2204:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1100
JUMPV
LABELV $1097
line 2205
;2205:		incoming = DotProduct (normal, lightDir);
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
line 2206
;2206:		if ( incoming <= 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1103
line 2207
;2207:			verts[i].modulate[0] = ambientLight[0];
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
LTF4 $1106
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
ADDRGP4 $1107
JUMPV
LABELV $1106
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1107
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
line 2208
;2208:			verts[i].modulate[1] = ambientLight[1];
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
LTF4 $1110
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
ADDRGP4 $1111
JUMPV
LABELV $1110
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1111
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
line 2209
;2209:			verts[i].modulate[2] = ambientLight[2];
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
LTF4 $1114
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
ADDRGP4 $1115
JUMPV
LABELV $1114
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1115
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
line 2210
;2210:			verts[i].modulate[3] = 255;
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
line 2211
;2211:			continue;
ADDRGP4 $1098
JUMPV
LABELV $1103
line 2213
;2212:		} 
;2213:		j = ( ambientLight[0] + incoming * directedLight[0] );
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
line 2214
;2214:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1116
line 2215
;2215:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2216
;2216:		}
LABELV $1116
line 2217
;2217:		verts[i].modulate[0] = j;
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
line 2219
;2218:
;2219:		j = ( ambientLight[1] + incoming * directedLight[1] );
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
line 2220
;2220:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1120
line 2221
;2221:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2222
;2222:		}
LABELV $1120
line 2223
;2223:		verts[i].modulate[1] = j;
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
line 2225
;2224:
;2225:		j = ( ambientLight[2] + incoming * directedLight[2] );
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
line 2226
;2226:		if ( j > 255 ) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1124
line 2227
;2227:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2228
;2228:		}
LABELV $1124
line 2229
;2229:		verts[i].modulate[2] = j;
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
line 2231
;2230:
;2231:		verts[i].modulate[3] = 255;
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
line 2232
;2232:	}
LABELV $1098
line 2204
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1100
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1097
line 2233
;2233:	return qtrue;
CNSTI4 1
RETI4
LABELV $1096
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 448 28
line 2241
;2234:}
;2235:
;2236:/*
;2237:===============
;2238:CG_Player
;2239:===============
;2240:*/
;2241:void CG_Player( centity_t *cent ) {
line 2262
;2242:	clientInfo_t	*ci;
;2243:	refEntity_t		legs;
;2244:	refEntity_t		torso;
;2245:	refEntity_t		head;
;2246:	int				clientNum;
;2247:	int				renderfx;
;2248:	qboolean		shadow;
;2249:	float			shadowPlane;
;2250:#ifdef MISSIONPACK
;2251:	refEntity_t		skull;
;2252:	refEntity_t		powerup;
;2253:	int				t;
;2254:	float			c;
;2255:	float			angle;
;2256:	vec3_t			dir, angles;
;2257:#endif
;2258:
;2259:	// the client number is stored in clientNum.  It can't be derived
;2260:	// from the entity number, because a single client may have
;2261:	// multiple corpses on the level using the same clientinfo
;2262:	clientNum = cent->currentState.clientNum;
ADDRLP4 428
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2263
;2263:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 428
INDIRI4
CNSTI4 0
LTI4 $1129
ADDRLP4 428
INDIRI4
CNSTI4 64
LTI4 $1127
LABELV $1129
line 2264
;2264:		CG_Error( "Bad clientNum on player entity");
ADDRGP4 $1130
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2265
;2265:	}
LABELV $1127
line 2266
;2266:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 280
CNSTI4 1708
ADDRLP4 428
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 2270
;2267:
;2268:	// it is possible to see corpses from disconnected players that may
;2269:	// not have valid clientinfo
;2270:	if ( !ci->infoValid ) {
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1132
line 2271
;2271:		return;
ADDRGP4 $1126
JUMPV
LABELV $1132
line 2275
;2272:	}
;2273:
;2274:	// get the player model information
;2275:	renderfx = 0;
ADDRLP4 424
CNSTI4 0
ASGNI4
line 2276
;2276:	if ( cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1134
line 2277
;2277:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1137
line 2278
;2278:			renderfx = RF_THIRD_PERSON;			// only draw in mirrors
ADDRLP4 424
CNSTI4 2
ASGNI4
line 2279
;2279:		} else {
ADDRGP4 $1138
JUMPV
LABELV $1137
line 2280
;2280:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1140
line 2281
;2281:				return;
ADDRGP4 $1126
JUMPV
LABELV $1140
line 2283
;2282:			}
;2283:		}
LABELV $1138
line 2284
;2284:	}
LABELV $1134
line 2287
;2285:
;2286:
;2287:	memset( &legs, 0, sizeof(legs) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2288
;2288:	memset( &torso, 0, sizeof(torso) );
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2289
;2289:	memset( &head, 0, sizeof(head) );
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2292
;2290:
;2291:	// get the rotation information
;2292:	CG_PlayerAngles( cent, legs.axis, torso.axis, head.axis );
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
line 2295
;2293:	
;2294:	// get the animation state (after rotation, to allow feet shuffle)
;2295:	CG_PlayerAnimation( cent, &legs.oldframe, &legs.frame, &legs.backlerp,
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
line 2299
;2296:		 &torso.oldframe, &torso.frame, &torso.backlerp );
;2297:
;2298:	// add the talk baloon or disconnect icon
;2299:	CG_PlayerSprites( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2302
;2300:
;2301:	// add the shadow
;2302:	shadow = CG_PlayerShadow( cent, &shadowPlane );
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
line 2305
;2303:
;2304:	// add a water splash if partially in and out of water
;2305:	CG_PlayerSplash( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2307
;2306:
;2307:	if ( cg_shadows.integer == 3 && shadow ) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1152
ADDRLP4 436
INDIRI4
CNSTI4 0
EQI4 $1152
line 2308
;2308:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2309
;2309:	}
LABELV $1152
line 2310
;2310:	renderfx |= RF_LIGHTING_ORIGIN;			// use the same origin for all
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2319
;2311:#ifdef MISSIONPACK
;2312:	if( cgs.gametype == GT_HARVESTER ) {
;2313:		CG_PlayerTokens( cent, renderfx );
;2314:	}
;2315:#endif
;2316:	//
;2317:	// add the legs
;2318:	//
;2319:	legs.hModel = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 2320
;2320:	legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 280
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 2322
;2321:
;2322:	VectorCopy( cent->lerpOrigin, legs.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2324
;2323:
;2324:	VectorCopy( cent->lerpOrigin, legs.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2325
;2325:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2326
;2326:	legs.renderfx = renderfx;
ADDRLP4 0+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2327
;2327:	VectorCopy (legs.origin, legs.oldorigin);	// don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2329
;2328:
;2329:	CG_AddRefEntityWithPowerups( &legs, &cent->currentState, ci->team );
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
line 2332
;2330:
;2331:	// if the model failed, allow the default nullmodel to be displayed
;2332:	if (!legs.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1163
line 2333
;2333:		return;
ADDRGP4 $1126
JUMPV
LABELV $1163
line 2339
;2334:	}
;2335:
;2336:	//
;2337:	// add the torso
;2338:	//
;2339:	torso.hModel = ci->torsoModel;
ADDRLP4 140+8
ADDRLP4 280
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ASGNI4
line 2340
;2340:	if (!torso.hModel) {
ADDRLP4 140+8
INDIRI4
CNSTI4 0
NEI4 $1167
line 2341
;2341:		return;
ADDRGP4 $1126
JUMPV
LABELV $1167
line 2344
;2342:	}
;2343:
;2344:	torso.customSkin = ci->torsoSkin;
ADDRLP4 140+108
ADDRLP4 280
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
line 2346
;2345:
;2346:	VectorCopy( cent->lerpOrigin, torso.lightingOrigin );
ADDRLP4 140+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2348
;2347:
;2348:	CG_PositionRotatedEntityOnTag( &torso, &legs, ci->legsModel, "tag_torso");
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
ADDRGP4 $1172
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2350
;2349:
;2350:	torso.shadowPlane = shadowPlane;
ADDRLP4 140+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2351
;2351:	torso.renderfx = renderfx;
ADDRLP4 140+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2353
;2352:
;2353:	CG_AddRefEntityWithPowerups( &torso, &cent->currentState, ci->team );
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
line 2563
;2354:
;2355:#ifdef MISSIONPACK
;2356:	if ( cent->currentState.eFlags & EF_KAMIKAZE ) {
;2357:
;2358:		memset( &skull, 0, sizeof(skull) );
;2359:
;2360:		VectorCopy( cent->lerpOrigin, skull.lightingOrigin );
;2361:		skull.shadowPlane = shadowPlane;
;2362:		skull.renderfx = renderfx;
;2363:
;2364:		if ( cent->currentState.eFlags & EF_DEAD ) {
;2365:			// one skull bobbing above the dead body
;2366:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
;2367:			if (angle > M_PI * 2)
;2368:				angle -= (float)M_PI * 2;
;2369:			dir[0] = sin(angle) * 20;
;2370:			dir[1] = cos(angle) * 20;
;2371:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2372:			dir[2] = 15 + sin(angle) * 8;
;2373:			VectorAdd(torso.origin, dir, skull.origin);
;2374:			
;2375:			dir[2] = 0;
;2376:			VectorCopy(dir, skull.axis[1]);
;2377:			VectorNormalize(skull.axis[1]);
;2378:			VectorSet(skull.axis[2], 0, 0, 1);
;2379:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2380:
;2381:			skull.hModel = cgs.media.kamikazeHeadModel;
;2382:			trap_R_AddRefEntityToScene( &skull );
;2383:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2384:			trap_R_AddRefEntityToScene( &skull );
;2385:		}
;2386:		else {
;2387:			// three skulls spinning around the player
;2388:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2389:			dir[0] = cos(angle) * 20;
;2390:			dir[1] = sin(angle) * 20;
;2391:			dir[2] = cos(angle) * 20;
;2392:			VectorAdd(torso.origin, dir, skull.origin);
;2393:
;2394:			angles[0] = sin(angle) * 30;
;2395:			angles[1] = (angle * 180 / M_PI) + 90;
;2396:			if (angles[1] > 360)
;2397:				angles[1] -= 360;
;2398:			angles[2] = 0;
;2399:			AnglesToAxis( angles, skull.axis );
;2400:
;2401:			/*
;2402:			dir[2] = 0;
;2403:			VectorInverse(dir);
;2404:			VectorCopy(dir, skull.axis[1]);
;2405:			VectorNormalize(skull.axis[1]);
;2406:			VectorSet(skull.axis[2], 0, 0, 1);
;2407:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2408:			*/
;2409:
;2410:			skull.hModel = cgs.media.kamikazeHeadModel;
;2411:			trap_R_AddRefEntityToScene( &skull );
;2412:			// flip the trail because this skull is spinning in the other direction
;2413:			VectorInverse(skull.axis[1]);
;2414:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2415:			trap_R_AddRefEntityToScene( &skull );
;2416:
;2417:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
;2418:			if (angle > M_PI * 2)
;2419:				angle -= (float)M_PI * 2;
;2420:			dir[0] = sin(angle) * 20;
;2421:			dir[1] = cos(angle) * 20;
;2422:			dir[2] = cos(angle) * 20;
;2423:			VectorAdd(torso.origin, dir, skull.origin);
;2424:
;2425:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
;2426:			angles[1] = 360 - (angle * 180 / M_PI);
;2427:			if (angles[1] > 360)
;2428:				angles[1] -= 360;
;2429:			angles[2] = 0;
;2430:			AnglesToAxis( angles, skull.axis );
;2431:
;2432:			/*
;2433:			dir[2] = 0;
;2434:			VectorCopy(dir, skull.axis[1]);
;2435:			VectorNormalize(skull.axis[1]);
;2436:			VectorSet(skull.axis[2], 0, 0, 1);
;2437:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2438:			*/
;2439:
;2440:			skull.hModel = cgs.media.kamikazeHeadModel;
;2441:			trap_R_AddRefEntityToScene( &skull );
;2442:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2443:			trap_R_AddRefEntityToScene( &skull );
;2444:
;2445:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
;2446:			if (angle > M_PI * 2)
;2447:				angle -= (float)M_PI * 2;
;2448:			dir[0] = sin(angle) * 20;
;2449:			dir[1] = cos(angle) * 20;
;2450:			dir[2] = 0;
;2451:			VectorAdd(torso.origin, dir, skull.origin);
;2452:			
;2453:			VectorCopy(dir, skull.axis[1]);
;2454:			VectorNormalize(skull.axis[1]);
;2455:			VectorSet(skull.axis[2], 0, 0, 1);
;2456:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2457:
;2458:			skull.hModel = cgs.media.kamikazeHeadModel;
;2459:			trap_R_AddRefEntityToScene( &skull );
;2460:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2461:			trap_R_AddRefEntityToScene( &skull );
;2462:		}
;2463:	}
;2464:
;2465:	if ( cent->currentState.powerups & ( 1 << PW_GUARD ) ) {
;2466:		memcpy(&powerup, &torso, sizeof(torso));
;2467:		powerup.hModel = cgs.media.guardPowerupModel;
;2468:		powerup.frame = 0;
;2469:		powerup.oldframe = 0;
;2470:		powerup.customSkin = 0;
;2471:		trap_R_AddRefEntityToScene( &powerup );
;2472:	}
;2473:	if ( cent->currentState.powerups & ( 1 << PW_SCOUT ) ) {
;2474:		memcpy(&powerup, &torso, sizeof(torso));
;2475:		powerup.hModel = cgs.media.scoutPowerupModel;
;2476:		powerup.frame = 0;
;2477:		powerup.oldframe = 0;
;2478:		powerup.customSkin = 0;
;2479:		trap_R_AddRefEntityToScene( &powerup );
;2480:	}
;2481:	if ( cent->currentState.powerups & ( 1 << PW_DOUBLER ) ) {
;2482:		memcpy(&powerup, &torso, sizeof(torso));
;2483:		powerup.hModel = cgs.media.doublerPowerupModel;
;2484:		powerup.frame = 0;
;2485:		powerup.oldframe = 0;
;2486:		powerup.customSkin = 0;
;2487:		trap_R_AddRefEntityToScene( &powerup );
;2488:	}
;2489:	if ( cent->currentState.powerups & ( 1 << PW_AMMOREGEN ) ) {
;2490:		memcpy(&powerup, &torso, sizeof(torso));
;2491:		powerup.hModel = cgs.media.ammoRegenPowerupModel;
;2492:		powerup.frame = 0;
;2493:		powerup.oldframe = 0;
;2494:		powerup.customSkin = 0;
;2495:		trap_R_AddRefEntityToScene( &powerup );
;2496:	}
;2497:	if ( cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) {
;2498:		if ( !ci->invulnerabilityStartTime ) {
;2499:			ci->invulnerabilityStartTime = cg.time;
;2500:		}
;2501:		ci->invulnerabilityStopTime = cg.time;
;2502:	}
;2503:	else {
;2504:		ci->invulnerabilityStartTime = 0;
;2505:	}
;2506:	if ( (cent->currentState.powerups & ( 1 << PW_INVULNERABILITY ) ) ||
;2507:		cg.time - ci->invulnerabilityStopTime < 250 ) {
;2508:
;2509:		memcpy(&powerup, &torso, sizeof(torso));
;2510:		powerup.hModel = cgs.media.invulnerabilityPowerupModel;
;2511:		powerup.customSkin = 0;
;2512:		// always draw
;2513:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2514:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2515:
;2516:		if ( cg.time - ci->invulnerabilityStartTime < 250 ) {
;2517:			c = (float) (cg.time - ci->invulnerabilityStartTime) / 250;
;2518:		}
;2519:		else if (cg.time - ci->invulnerabilityStopTime < 250 ) {
;2520:			c = (float) (250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
;2521:		}
;2522:		else {
;2523:			c = 1;
;2524:		}
;2525:		VectorSet( powerup.axis[0], c, 0, 0 );
;2526:		VectorSet( powerup.axis[1], 0, c, 0 );
;2527:		VectorSet( powerup.axis[2], 0, 0, c );
;2528:		trap_R_AddRefEntityToScene( &powerup );
;2529:	}
;2530:
;2531:	t = cg.time - ci->medkitUsageTime;
;2532:	if ( ci->medkitUsageTime && t < 500 ) {
;2533:		memcpy(&powerup, &torso, sizeof(torso));
;2534:		powerup.hModel = cgs.media.medkitUsageModel;
;2535:		powerup.customSkin = 0;
;2536:		// always draw
;2537:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2538:		VectorClear(angles);
;2539:		AnglesToAxis(angles, powerup.axis);
;2540:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2541:		powerup.origin[2] += -24 + (float) t * 80 / 500;
;2542:		if ( t > 400 ) {
;2543:			c = (float) (t - 1000) * 0xff / 100;
;2544:			powerup.shaderRGBA[0] = 0xff - c;
;2545:			powerup.shaderRGBA[1] = 0xff - c;
;2546:			powerup.shaderRGBA[2] = 0xff - c;
;2547:			powerup.shaderRGBA[3] = 0xff - c;
;2548:		}
;2549:		else {
;2550:			powerup.shaderRGBA[0] = 0xff;
;2551:			powerup.shaderRGBA[1] = 0xff;
;2552:			powerup.shaderRGBA[2] = 0xff;
;2553:			powerup.shaderRGBA[3] = 0xff;
;2554:		}
;2555:		trap_R_AddRefEntityToScene( &powerup );
;2556:	}
;2557:#endif // MISSIONPACK
;2558:
;2559:	//
;2560:	// add the head
;2561:	//
;2562:	// Shafe - Trep - This is all new code for headshots
;2563:	if(!cent->pe.noHead)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1175
line 2564
;2564:	{
line 2565
;2565:		head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 280
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2566
;2566:		if (!head.hModel) 
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1178
line 2567
;2567:		{
line 2568
;2568:			return;
ADDRGP4 $1126
JUMPV
LABELV $1178
line 2570
;2569:		}
;2570:		head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 280
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 2572
;2571:
;2572:		VectorCopy( cent->lerpOrigin, head.lightingOrigin );
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRB
ASGNB 12
line 2574
;2573:
;2574:		CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
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
ADDRGP4 $1183
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2576
;2575:
;2576:		head.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 432
INDIRF4
ASGNF4
line 2577
;2577:		head.renderfx = renderfx;
ADDRLP4 284+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2579
;2578:
;2579:		CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
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
line 2580
;2580:	}
LABELV $1175
line 2609
;2581:
;2582:	/*  Shafe - Trep - This is the original code -- Fuck.. Lets hope we dont end up compiling with MISSIONPACK!
;2583:	head.hModel = ci->headModel;
;2584:	if (!head.hModel) {
;2585:		return;
;2586:	}
;2587:	head.customSkin = ci->headSkin;
;2588:
;2589:	VectorCopy( cent->lerpOrigin, head.lightingOrigin );
;2590:
;2591:	CG_PositionRotatedEntityOnTag( &head, &torso, ci->torsoModel, "tag_head");
;2592:
;2593:	head.shadowPlane = shadowPlane;
;2594:	head.renderfx = renderfx;
;2595:
;2596:	CG_AddRefEntityWithPowerups( &head, &cent->currentState, ci->team );
;2597:	*/
;2598:
;2599:
;2600:#ifdef MISSIONPACK
;2601:	CG_BreathPuffs(cent, &head);
;2602:
;2603:	CG_DustTrail(cent);
;2604:#endif
;2605:
;2606:	//
;2607:	// add the gun / barrel / flash
;2608:	//
;2609:	CG_AddPlayerWeapon( &torso, NULL, cent, ci->team );
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
line 2612
;2610:
;2611:	// add powerups floating behind the player
;2612:	CG_PlayerPowerups( cent, &torso );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2616
;2613:
;2614://unlagged - client options
;2615:	// add the bounding box (if cg_drawBBox is 1)
;2616:	CG_AddBoundingBox( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddBoundingBox
CALLV
pop
line 2618
;2617://unlagged - client options
;2618:}
LABELV $1126
endproc CG_Player 448 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 2630
;2619:
;2620:
;2621://=====================================================================
;2622:
;2623:/*
;2624:===============
;2625:CG_ResetPlayerEntity
;2626:
;2627:A player just came into view or teleported, so reset all animation info
;2628:===============
;2629:*/
;2630:void CG_ResetPlayerEntity( centity_t *cent ) {
line 2631
;2631:	cent->errorTime = -99999;		// guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 -99999
ASGNI4
line 2632
;2632:	cent->extrapolated = qfalse;	
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTI4 0
ASGNI4
line 2634
;2633:
;2634:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.legs, cent->currentState.legsAnim );
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
line 2635
;2635:	CG_ClearLerpFrame( &cgs.clientinfo[ cent->currentState.clientNum ], &cent->pe.torso, cent->currentState.torsoAnim );
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
line 2637
;2636:
;2637:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
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
line 2638
;2638:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
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
line 2640
;2639:
;2640:	VectorCopy( cent->lerpOrigin, cent->rawOrigin );
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
line 2641
;2641:	VectorCopy( cent->lerpAngles, cent->rawAngles );
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
line 2643
;2642:
;2643:	memset( &cent->pe.legs, 0, sizeof( cent->pe.legs ) );
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
line 2644
;2644:	cent->pe.legs.yawAngle = cent->rawAngles[YAW];
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
line 2645
;2645:	cent->pe.legs.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 2646
;2646:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
CNSTF4 0
ASGNF4
line 2647
;2647:	cent->pe.legs.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2649
;2648:
;2649:	memset( &cent->pe.torso, 0, sizeof( cent->pe.legs ) );
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
line 2650
;2650:	cent->pe.torso.yawAngle = cent->rawAngles[YAW];
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
line 2651
;2651:	cent->pe.torso.yawing = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 2652
;2652:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
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
line 2653
;2653:	cent->pe.torso.pitching = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2655
;2654:
;2655:	cent->pe.noHead = qfalse; // Shafe - Trep - Part of the headshot code
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 2657
;2656:
;2657:	if ( cg_debugPosition.integer ) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1191
line 2658
;2658:		CG_Printf("%i ResetPlayerEntity yaw=%i\n", cent->currentState.number, cent->pe.torso.yawAngle );
ADDRGP4 $1194
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
line 2659
;2659:	}
LABELV $1191
line 2660
;2660:}
LABELV $1186
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
LABELV $1194
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
LABELV $1183
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
LABELV $1172
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
LABELV $1130
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
LABELV $713
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
LABELV $642
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
LABELV $608
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
LABELV $604
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
LABELV $587
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
LABELV $551
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
LABELV $540
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $507
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $505
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
LABELV $503
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
LABELV $501
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $499
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $497
byte 1 116
byte 1 0
align 1
LABELV $495
byte 1 108
byte 1 0
align 1
LABELV $493
byte 1 119
byte 1 0
align 1
LABELV $491
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $489
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $487
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $485
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $482
byte 1 110
byte 1 0
align 1
LABELV $477
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
LABELV $410
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
LABELV $397
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
LABELV $392
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
LABELV $389
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
LABELV $388
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $380
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
LABELV $361
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $358
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $355
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
LABELV $352
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
LABELV $349
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
LABELV $348
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
LABELV $345
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $344
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $343
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $340
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
LABELV $333
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
LABELV $330
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
byte 1 114
byte 1 0
align 1
LABELV $325
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
LABELV $324
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
LABELV $319
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
LABELV $316
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
LABELV $310
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
LABELV $309
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
LABELV $306
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
LABELV $303
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
