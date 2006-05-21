bss
align 1
LABELV $71
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../cg_event.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:
;7:// for the voice chats
;8:#ifdef MISSIONPACK // bk001205
;9:#include "../../ui/menudef.h"
;10:#endif
;11://==========================================================================
;12:
;13:/*
;14:===================
;15:CG_PlaceString
;16:
;17:Also called by scoreboard drawing
;18:===================
;19:*/
;20:const char	*CG_PlaceString( int rank ) {
line 24
;21:	static char	str[64];
;22:	char	*s, *t;
;23:
;24:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $72
line 25
;25:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 26
;26:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $74
ASGNP4
line 27
;27:	} else {
ADDRGP4 $73
JUMPV
LABELV $72
line 28
;28:		t = "";
ADDRLP4 4
ADDRGP4 $75
ASGNP4
line 29
;29:	}
LABELV $73
line 31
;30:
;31:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $76
line 32
;32:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $78
ASGNP4
line 33
;33:	} else if ( rank == 2 ) {
ADDRGP4 $77
JUMPV
LABELV $76
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $79
line 34
;34:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $81
ASGNP4
line 35
;35:	} else if ( rank == 3 ) {
ADDRGP4 $80
JUMPV
LABELV $79
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $82
line 36
;36:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $84
ASGNP4
line 37
;37:	} else if ( rank == 11 ) {
ADDRGP4 $83
JUMPV
LABELV $82
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $85
line 38
;38:		s = "11th";
ADDRLP4 0
ADDRGP4 $87
ASGNP4
line 39
;39:	} else if ( rank == 12 ) {
ADDRGP4 $86
JUMPV
LABELV $85
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $88
line 40
;40:		s = "12th";
ADDRLP4 0
ADDRGP4 $90
ASGNP4
line 41
;41:	} else if ( rank == 13 ) {
ADDRGP4 $89
JUMPV
LABELV $88
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $91
line 42
;42:		s = "13th";
ADDRLP4 0
ADDRGP4 $93
ASGNP4
line 43
;43:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $94
line 44
;44:		s = va("%ist", rank);
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 45
;45:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $95
JUMPV
LABELV $94
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $97
line 46
;46:		s = va("%ind", rank);
ADDRGP4 $99
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 47
;47:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $100
line 48
;48:		s = va("%ird", rank);
ADDRGP4 $102
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 49
;49:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 50
;50:		s = va("%ith", rank);
ADDRGP4 $103
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 51
;51:	}
LABELV $101
LABELV $98
LABELV $95
LABELV $92
LABELV $89
LABELV $86
LABELV $83
LABELV $80
LABELV $77
line 53
;52:
;53:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $71
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $104
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 54
;54:	return str;
ADDRGP4 $71
RETP4
LABELV $70
endproc CG_PlaceString 12 20
proc CG_Obituary 132 20
line 62
;55:}
;56:
;57:/*
;58:=============
;59:CG_Obituary
;60:=============
;61:*/
;62:static void CG_Obituary( entityState_t *ent ) {
line 74
;63:	int			mod;
;64:	int			target, attacker;
;65:	char		*message;
;66:	char		*message2;
;67:	const char	*targetInfo;
;68:	const char	*attackerInfo;
;69:	char		targetName[32];
;70:	char		attackerName[32];
;71:	gender_t	gender;
;72:	clientInfo_t	*ci;
;73:
;74:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 75
;75:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 76
;76:	mod = ent->eventParm;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 78
;77:
;78:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $108
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $106
LABELV $108
line 79
;79:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $109
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 80
;80:	}
LABELV $106
line 81
;81:	ci = &cgs.clientinfo[target];
ADDRLP4 92
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 83
;82:
;83:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $113
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $111
LABELV $113
line 84
;84:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 85
;85:		attackerInfo = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 86
;86:	} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 87
;87:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 108
INDIRP4
ASGNP4
line 88
;88:	}
LABELV $112
line 90
;89:
;90:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 108
INDIRP4
ASGNP4
line 91
;91:	if ( !targetInfo ) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 92
;92:		return;
ADDRGP4 $105
JUMPV
LABELV $114
line 94
;93:	}
;94:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 95
;95:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 97
;96:
;97:	message2 = "";
ADDRLP4 88
ADDRGP4 $75
ASGNP4
line 101
;98:
;99:	// check for single client messages
;100:
;101:	switch( mod ) {
ADDRLP4 40
INDIRI4
CNSTI4 14
LTI4 $118
ADDRLP4 40
INDIRI4
CNSTI4 22
GTI4 $118
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $136-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $136
address $126
address $128
address $130
address $124
address $118
address $122
address $120
address $132
address $134
code
LABELV $120
line 103
;102:	case MOD_SUICIDE:
;103:		message = "suicides";
ADDRLP4 44
ADDRGP4 $121
ASGNP4
line 104
;104:		break;
ADDRGP4 $119
JUMPV
LABELV $122
line 106
;105:	case MOD_FALLING:
;106:		message = "cratered";
ADDRLP4 44
ADDRGP4 $123
ASGNP4
line 107
;107:		break;
ADDRGP4 $119
JUMPV
LABELV $124
line 109
;108:	case MOD_CRUSH:
;109:		message = "was squished";
ADDRLP4 44
ADDRGP4 $125
ASGNP4
line 110
;110:		break;
ADDRGP4 $119
JUMPV
LABELV $126
line 112
;111:	case MOD_WATER:
;112:		message = "sank like a rock";
ADDRLP4 44
ADDRGP4 $127
ASGNP4
line 113
;113:		break;
ADDRGP4 $119
JUMPV
LABELV $128
line 115
;114:	case MOD_SLIME:
;115:		message = "melted";
ADDRLP4 44
ADDRGP4 $129
ASGNP4
line 116
;116:		break;
ADDRGP4 $119
JUMPV
LABELV $130
line 118
;117:	case MOD_LAVA:
;118:		message = "does a back flip into the lava";
ADDRLP4 44
ADDRGP4 $131
ASGNP4
line 119
;119:		break;
ADDRGP4 $119
JUMPV
LABELV $132
line 121
;120:	case MOD_TARGET_LASER:
;121:		message = "saw the light";
ADDRLP4 44
ADDRGP4 $133
ASGNP4
line 122
;122:		break;
ADDRGP4 $119
JUMPV
LABELV $134
line 124
;123:	case MOD_TRIGGER_HURT:
;124:		message = "was in the wrong place";
ADDRLP4 44
ADDRGP4 $135
ASGNP4
line 125
;125:		break;
ADDRGP4 $119
JUMPV
LABELV $118
line 127
;126:	default:
;127:		message = NULL;
ADDRLP4 44
CNSTP4 0
ASGNP4
line 128
;128:		break;
LABELV $119
line 131
;129:	}
;130:
;131:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $138
line 132
;132:		gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 133
;133:		switch (mod) {
ADDRLP4 124
CNSTI4 13
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $166
ADDRLP4 40
INDIRI4
ADDRLP4 124
INDIRI4
GTI4 $184
LABELV $183
ADDRLP4 40
INDIRI4
CNSTI4 5
EQI4 $142
ADDRLP4 40
INDIRI4
CNSTI4 7
EQI4 $150
ADDRLP4 40
INDIRI4
CNSTI4 9
EQI4 $158
ADDRGP4 $140
JUMPV
LABELV $184
ADDRLP4 40
INDIRI4
CNSTI4 23
EQI4 $168
ADDRGP4 $140
JUMPV
LABELV $142
line 140
;134:#ifdef MISSIONPACK
;135:		case MOD_KAMIKAZE:
;136:			message = "goes out with a bang";
;137:			break;
;138:#endif
;139:		case MOD_GRENADE_SPLASH:
;140:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $143
line 141
;141:				message = "tripped on her own grenade";
ADDRLP4 44
ADDRGP4 $145
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $143
line 142
;142:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $146
line 143
;143:				message = "tripped on its own grenade";
ADDRLP4 44
ADDRGP4 $148
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $146
line 145
;144:			else
;145:				message = "tripped on his own grenade";
ADDRLP4 44
ADDRGP4 $149
ASGNP4
line 146
;146:			break;
ADDRGP4 $141
JUMPV
LABELV $150
line 148
;147:		case MOD_ROCKET_SPLASH:
;148:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $151
line 149
;149:				message = "blew herself up";
ADDRLP4 44
ADDRGP4 $153
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $151
line 150
;150:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $154
line 151
;151:				message = "blew itself up";
ADDRLP4 44
ADDRGP4 $156
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $154
line 153
;152:			else
;153:				message = "blew himself up";
ADDRLP4 44
ADDRGP4 $157
ASGNP4
line 154
;154:			break;
ADDRGP4 $141
JUMPV
LABELV $158
line 156
;155:		case MOD_PLASMA_SPLASH:
;156:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $159
line 157
;157:				message = "melted herself";
ADDRLP4 44
ADDRGP4 $161
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $159
line 158
;158:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $162
line 159
;159:				message = "melted itself";
ADDRLP4 44
ADDRGP4 $164
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $162
line 161
;160:			else
;161:				message = "melted himself";
ADDRLP4 44
ADDRGP4 $165
ASGNP4
line 162
;162:			break;
ADDRGP4 $141
JUMPV
LABELV $166
line 164
;163:		case MOD_BFG_SPLASH:
;164:			message = "should have used a smaller gun";
ADDRLP4 44
ADDRGP4 $167
ASGNP4
line 165
;165:			break;
ADDRGP4 $141
JUMPV
LABELV $168
line 167
;166:		case MOD_HEADSHOT:									// Shafe - Headshots
;167:			gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 168
;168:			if(gender==GENDER_FEMALE)
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $169
line 169
;169:			{
line 170
;170:				message = "got her head blown off by";
ADDRLP4 44
ADDRGP4 $171
ASGNP4
line 171
;171:			}
ADDRGP4 $141
JUMPV
LABELV $169
line 173
;172:			else
;173:			{
line 174
;174:				if(gender==GENDER_NEUTER)
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $172
line 175
;175:					message = "got its head blown off by";
ADDRLP4 44
ADDRGP4 $174
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $172
line 177
;176:				else
;177:					message = "got his head blown off by";
ADDRLP4 44
ADDRGP4 $175
ASGNP4
line 178
;178:			}
line 179
;179:			break;											
ADDRGP4 $141
JUMPV
LABELV $140
line 192
;180:#ifdef MISSIONPACK
;181:		case MOD_PROXIMITY_MINE:
;182:			if( gender == GENDER_FEMALE ) {
;183:				message = "found her prox mine";
;184:			} else if ( gender == GENDER_NEUTER ) {
;185:				message = "found it's prox mine";
;186:			} else {
;187:				message = "found his prox mine";
;188:			}
;189:			break;
;190:#endif
;191:		default:
;192:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $176
line 193
;193:				message = "killed herself";
ADDRLP4 44
ADDRGP4 $178
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $176
line 194
;194:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $179
line 195
;195:				message = "killed itself";
ADDRLP4 44
ADDRGP4 $181
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $179
line 197
;196:			else
;197:				message = "killed himself";
ADDRLP4 44
ADDRGP4 $182
ASGNP4
line 198
;198:			break;
LABELV $141
line 200
;199:		}
;200:	}
LABELV $138
line 202
;201:
;202:	if (message) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
line 203
;203:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $187
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 204
;204:		return;
ADDRGP4 $105
JUMPV
LABELV $185
line 208
;205:	}
;206:
;207:	// check for kill messages from the current clientNum
;208:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $188
line 211
;209:		char	*s;
;210:
;211:		if(mod != MOD_HEADSHOT) // Shafe - Trep - only for headshots
ADDRLP4 40
INDIRI4
CNSTI4 23
EQI4 $191
line 212
;212:		{						
line 213
;213:			if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $193
line 214
;214:					s = va("You fragged %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 124
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $196
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 128
INDIRP4
ASGNP4
line 217
;215:					CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;216:					cg.snap->ps.persistant[PERS_SCORE] );
;217:			} else {
ADDRGP4 $192
JUMPV
LABELV $193
line 218
;218:				s = va("You fragged %s", targetName );
ADDRGP4 $199
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 124
INDIRP4
ASGNP4
line 219
;219:			}
line 220
;220:		}
ADDRGP4 $192
JUMPV
LABELV $191
line 222
;221:		else										// Shafe - Trep Else for headshot
;222:		{
line 224
;223:
;224:			if ( cgs.gametype < GT_TEAM ) 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $200
line 225
;225:			{
line 226
;226:				s = va("Headshot!\n\nYou fragged %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 124
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $203
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 128
INDIRP4
ASGNP4
line 229
;227:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;228:				cg.snap->ps.persistant[PERS_SCORE] );
;229:			} else {
ADDRGP4 $201
JUMPV
LABELV $200
line 230
;230:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $206
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 124
INDIRP4
ASGNP4
line 231
;231:			}	
LABELV $201
line 232
;232:		}
LABELV $192
line 238
;233:#ifdef MISSIONPACK
;234:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;235:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;236:		} 
;237:#else
;238:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 242
;239:#endif
;240:
;241:		// print the text message as well
;242:	}
LABELV $188
line 245
;243:
;244:	// check for double client messages
;245:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
line 246
;246:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 247
;247:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $209
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 248
;248:	} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 249
;249:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 250
;250:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 252
;251:		// check for kill messages about the current clientNum
;252:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $210
line 253
;253:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+114344
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 254
;254:		}
LABELV $210
line 255
;255:	}
LABELV $208
line 257
;256:
;257:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $215
line 258
;258:		switch (mod) {
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $217
ADDRLP4 40
INDIRI4
CNSTI4 25
GTI4 $217
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $255-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $255
address $225
address $221
address $223
address $227
address $230
address $233
address $235
address $237
address $240
address $241
address $243
address $245
address $245
address $217
address $217
address $217
address $217
address $248
address $217
address $217
address $217
address $217
address $217
address $219
address $251
code
LABELV $219
line 260
;259:		case MOD_GRAPPLE:
;260:			message = "was caught by";
ADDRLP4 44
ADDRGP4 $220
ASGNP4
line 261
;261:			break;
ADDRGP4 $218
JUMPV
LABELV $221
line 263
;262:		case MOD_GAUNTLET:
;263:			message = "was pummeled by";
ADDRLP4 44
ADDRGP4 $222
ASGNP4
line 264
;264:			break;
ADDRGP4 $218
JUMPV
LABELV $223
line 266
;265:		case MOD_MACHINEGUN:
;266:			message = "was machinegunned by";
ADDRLP4 44
ADDRGP4 $224
ASGNP4
line 267
;267:			break;
ADDRGP4 $218
JUMPV
LABELV $225
line 269
;268:		case MOD_SHOTGUN:
;269:			message = "was gunned down by";
ADDRLP4 44
ADDRGP4 $226
ASGNP4
line 270
;270:			break;
ADDRGP4 $218
JUMPV
LABELV $227
line 272
;271:		case MOD_GRENADE:
;272:			message = "ate";
ADDRLP4 44
ADDRGP4 $228
ASGNP4
line 273
;273:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $229
ASGNP4
line 274
;274:			break;
ADDRGP4 $218
JUMPV
LABELV $230
line 276
;275:		case MOD_GRENADE_SPLASH:
;276:			message = "was shredded by";
ADDRLP4 44
ADDRGP4 $231
ASGNP4
line 277
;277:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $232
ASGNP4
line 278
;278:			break;
ADDRGP4 $218
JUMPV
LABELV $233
line 280
;279:		case MOD_ROCKET:
;280:			message = "ate";
ADDRLP4 44
ADDRGP4 $228
ASGNP4
line 281
;281:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $234
ASGNP4
line 282
;282:			break;
ADDRGP4 $218
JUMPV
LABELV $235
line 284
;283:		case MOD_ROCKET_SPLASH:
;284:			message = "almost dodged";
ADDRLP4 44
ADDRGP4 $236
ASGNP4
line 285
;285:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $234
ASGNP4
line 286
;286:			break;
ADDRGP4 $218
JUMPV
LABELV $237
line 288
;287:		case MOD_PLASMA:
;288:			message = "was melted by";
ADDRLP4 44
ADDRGP4 $238
ASGNP4
line 289
;289:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $239
ASGNP4
line 290
;290:			break;
ADDRGP4 $218
JUMPV
LABELV $240
line 292
;291:		case MOD_PLASMA_SPLASH:
;292:			message = "was melted by";
ADDRLP4 44
ADDRGP4 $238
ASGNP4
line 293
;293:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $239
ASGNP4
line 294
;294:			break;
ADDRGP4 $218
JUMPV
LABELV $241
line 296
;295:		case MOD_RAILGUN:
;296:			message = "was railed by";
ADDRLP4 44
ADDRGP4 $242
ASGNP4
line 297
;297:			break;
ADDRGP4 $218
JUMPV
LABELV $243
line 299
;298:		case MOD_LIGHTNING:
;299:			message = "was burnt by";
ADDRLP4 44
ADDRGP4 $244
ASGNP4
line 300
;300:			break;
ADDRGP4 $218
JUMPV
LABELV $245
line 303
;301:		case MOD_BFG:
;302:		case MOD_BFG_SPLASH:
;303:			message = "was blasted by";
ADDRLP4 44
ADDRGP4 $246
ASGNP4
line 304
;304:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $247
ASGNP4
line 305
;305:			break;
ADDRGP4 $218
JUMPV
LABELV $248
line 327
;306:#ifdef MISSIONPACK
;307:		case MOD_NAIL:
;308:			message = "was nailed by";
;309:			break;
;310:		case MOD_CHAINGUN:
;311:			message = "got lead poisoning from";
;312:			message2 = "'s Chaingun";
;313:			break;
;314:		case MOD_PROXIMITY_MINE:
;315:			message = "was too close to";
;316:			message2 = "'s Prox Mine";
;317:			break;
;318:		case MOD_KAMIKAZE:
;319:			message = "falls to";
;320:			message2 = "'s Kamikaze blast";
;321:			break;
;322:		case MOD_JUICED:
;323:			message = "was juiced by";
;324:			break;
;325:#endif
;326:		case MOD_TELEFRAG:
;327:			message = "tried to invade";
ADDRLP4 44
ADDRGP4 $249
ASGNP4
line 328
;328:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $250
ASGNP4
line 329
;329:			break;
ADDRGP4 $218
JUMPV
LABELV $251
line 331
;330:		case MOD_ALTFLAMER:		// Shafe - Trep - Flame Thrower Alt
;331:			message = "was toasted by";
ADDRLP4 44
ADDRGP4 $252
ASGNP4
line 332
;332:			message2 = "'s flame thrower";
ADDRLP4 88
ADDRGP4 $253
ASGNP4
line 333
;333:			break;
ADDRGP4 $218
JUMPV
LABELV $217
line 335
;334:		default:
;335:			message = "was killed by";
ADDRLP4 44
ADDRGP4 $254
ASGNP4
line 336
;336:			break;
LABELV $218
line 339
;337:		}
;338:
;339:		if (message) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $257
line 340
;340:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $259
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 342
;341:				targetName, message, attackerName, message2);
;342:			return;
ADDRGP4 $105
JUMPV
LABELV $257
line 344
;343:		}
;344:	}
LABELV $215
line 347
;345:
;346:	// we don't know what it was
;347:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $260
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 348
;348:}
LABELV $105
endproc CG_Obituary 132 20
proc CG_UseItem 32 16
line 357
;349:
;350://==========================================================================
;351:
;352:/*
;353:===============
;354:CG_UseItem
;355:===============
;356:*/
;357:static void CG_UseItem( centity_t *cent ) {
line 363
;358:	clientInfo_t *ci;
;359:	int			itemNum, clientNum;
;360:	gitem_t		*item;
;361:	entityState_t *es;
;362:
;363:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 365
;364:	
;365:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 25
SUBI4
ASGNI4
line 366
;366:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $264
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $262
LABELV $264
line 367
;367:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 368
;368:	}
LABELV $262
line 371
;369:
;370:	// print a message if the local player
;371:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $265
line 372
;372:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $268
line 373
;373:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $270
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 374
;374:		} else {
ADDRGP4 $269
JUMPV
LABELV $268
line 375
;375:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 376
;376:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $271
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 377
;377:		}
LABELV $269
line 378
;378:	}
LABELV $265
line 380
;379:
;380:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $274
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $273
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $278
ADDRGP4 $272
JUMPV
LABELV $272
LABELV $274
line 383
;381:	default:
;382:	case HI_NONE:
;383:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+548
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 384
;384:		break;
ADDRGP4 $273
JUMPV
line 387
;385:
;386:	case HI_TELEPORTER:
;387:		break;
LABELV $278
line 390
;388:
;389:	case HI_MEDKIT:
;390:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 391
;391:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $279
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $279
line 392
;392:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1708
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 393
;393:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 394
;394:		}
LABELV $279
line 395
;395:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+868
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 396
;396:		break;
LABELV $273
line 410
;397:
;398:#ifdef MISSIONPACK
;399:	case HI_KAMIKAZE:
;400:		break;
;401:
;402:	case HI_PORTAL:
;403:		break;
;404:	case HI_INVULNERABILITY:
;405:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;406:		break;
;407:#endif
;408:	}
;409:
;410:}
LABELV $261
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 419
;411:
;412:/*
;413:================
;414:CG_ItemPickup
;415:
;416:A new item was picked up this frame
;417:================
;418:*/
;419:static void CG_ItemPickup( int itemNum ) {
line 420
;420:	cg.itemPickup = itemNum;
ADDRGP4 cg+124676
ADDRFP4 0
INDIRI4
ASGNI4
line 421
;421:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+124680
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 422
;422:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+124684
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 424
;423:	// see if it should be the grabbed weapon
;424:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $291
line 426
;425:		// select it immediately
;426:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $294
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $294
line 427
;427:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+124688
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 428
;428:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108948
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 429
;429:		}
LABELV $294
line 430
;430:	}
LABELV $291
line 432
;431:
;432:}
LABELV $285
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 442
;433:
;434:
;435:/*
;436:================
;437:CG_PainEvent
;438:
;439:Also called by playerstate transition
;440:================
;441:*/
;442:void CG_PainEvent( centity_t *cent, int health ) {
line 446
;443:	char	*snd;
;444:
;445:	// don't do more than two pain sounds a second
;446:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $303
line 447
;447:		return;
ADDRGP4 $302
JUMPV
LABELV $303
line 450
;448:	}
;449:
;450:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $306
line 451
;451:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $308
ASGNP4
line 452
;452:	} else if ( health < 50 ) {
ADDRGP4 $307
JUMPV
LABELV $306
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $309
line 453
;453:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $311
ASGNP4
line 454
;454:	} else if ( health < 75 ) {
ADDRGP4 $310
JUMPV
LABELV $309
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $312
line 455
;455:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $314
ASGNP4
line 456
;456:	} else {
ADDRGP4 $313
JUMPV
LABELV $312
line 457
;457:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $315
ASGNP4
line 458
;458:	}
LABELV $313
LABELV $310
LABELV $307
line 459
;459:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 463
;460:		CG_CustomSound( cent->currentState.number, snd ) );
;461:
;462:	// save pain time for programitic twitch animation
;463:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 464
;464:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 465
;465:}
LABELV $302
endproc CG_PainEvent 12 16
lit
align 4
LABELV $463
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 112 48
line 478
;466:
;467:
;468:
;469:/*
;470:==============
;471:CG_EntityEvent
;472:
;473:An entity has an event value
;474:also called by CG_CheckPlayerstateEvents
;475:==============
;476:*/
;477:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;478:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 486
;479:	entityState_t	*es;
;480:	int				event;
;481:	vec3_t			dir;
;482:	const char		*s;
;483:	int				clientNum;
;484:	clientInfo_t	*ci;
;485:
;486:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 487
;487:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 489
;488:
;489:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $318
line 490
;490:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $321
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 491
;491:	}
LABELV $318
line 493
;492:
;493:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $322
line 494
;494:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $317
ADDRGP4 $327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 495
;495:		return;
ADDRGP4 $317
JUMPV
LABELV $322
line 498
;496:	}
;497:
;498:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 499
;499:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $330
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $328
LABELV $330
line 500
;500:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 501
;501:	}
LABELV $328
line 502
;502:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 504
;503:
;504:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $332
ADDRLP4 8
INDIRI4
CNSTI4 71
GTI4 $332
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $992-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $992
address $334
address $344
address $355
address $366
address $377
address $428
address $428
address $428
address $428
address $388
address $402
address $414
address $458
address $470
address $481
address $488
address $495
address $502
address $508
address $526
address $540
address $548
address $555
address $560
address $565
address $570
address $575
address $580
address $585
address $590
address $595
address $600
address $605
address $610
address $615
address $620
address $625
address $630
address $635
address $332
address $661
address $654
address $640
address $647
address $669
address $754
address $763
address $774
address $728
address $715
address $685
address $690
address $695
address $700
address $741
address $332
address $898
address $906
address $906
address $906
address $912
address $917
address $930
address $943
address $956
address $965
address $972
address $680
address $982
address $977
address $475
code
LABELV $334
line 509
;505:	//
;506:	// movement generated events
;507:	//
;508:	case EV_FOOTSTEP:
;509:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $335
ADDRGP4 $338
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $335
line 510
;510:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 511
;511:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+152340+556
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 513
;512:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;513:		}
line 514
;514:		break;
ADDRGP4 $333
JUMPV
LABELV $344
line 516
;515:	case EV_FOOTSTEP_METAL:
;516:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $345
ADDRGP4 $348
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $345
line 517
;517:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 518
;518:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 520
;519:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;520:		}
line 521
;521:		break;
ADDRGP4 $333
JUMPV
LABELV $355
line 523
;522:	case EV_FOOTSPLASH:
;523:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $356
ADDRGP4 $359
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $356
line 524
;524:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 525
;525:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 527
;526:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;527:		}
line 528
;528:		break;
ADDRGP4 $333
JUMPV
LABELV $366
line 530
;529:	case EV_FOOTWADE:
;530:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $367
ADDRGP4 $370
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $367
line 531
;531:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 532
;532:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 534
;533:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;534:		}
line 535
;535:		break;
ADDRGP4 $333
JUMPV
LABELV $377
line 537
;536:	case EV_SWIM:
;537:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $378
ADDRGP4 $381
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $378
line 538
;538:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $333
line 539
;539:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 541
;540:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;541:		}
line 542
;542:		break;
ADDRGP4 $333
JUMPV
LABELV $388
line 546
;543:
;544:
;545:	case EV_FALL_SHORT:
;546:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $389
ADDRGP4 $392
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $389
line 547
;547:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+740
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 548
;548:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $333
line 550
;549:			// smooth landing z changes
;550:			cg.landChange = -8;
ADDRGP4 cg+108940
CNSTF4 3238002688
ASGNF4
line 551
;551:			cg.landTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 552
;552:		}
line 553
;553:		break;
ADDRGP4 $333
JUMPV
LABELV $402
line 555
;554:	case EV_FALL_MEDIUM:
;555:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $403
ADDRGP4 $406
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $403
line 557
;556:		// use normal pain sound
;557:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $315
ARGP4
ADDRLP4 40
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 558
;558:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $333
line 560
;559:			// smooth landing z changes
;560:			cg.landChange = -16;
ADDRGP4 cg+108940
CNSTF4 3246391296
ASGNF4
line 561
;561:			cg.landTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 562
;562:		}
line 563
;563:		break;
ADDRGP4 $333
JUMPV
LABELV $414
line 565
;564:	case EV_FALL_FAR:
;565:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $415
ADDRGP4 $418
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $415
line 566
;566:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $419
ARGP4
ADDRLP4 44
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 567
;567:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 568
;568:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $333
line 570
;569:			// smooth landing z changes
;570:			cg.landChange = -24;
ADDRGP4 cg+108940
CNSTF4 3250585600
ASGNF4
line 571
;571:			cg.landTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 572
;572:		}
line 573
;573:		break;
ADDRGP4 $333
JUMPV
LABELV $428
line 579
;574:
;575:	case EV_STEP_4:
;576:	case EV_STEP_8:
;577:	case EV_STEP_12:
;578:	case EV_STEP_16:		// smooth out step up transitions
;579:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $429
ADDRGP4 $432
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $429
line 580
;580:	{
line 585
;581:		float	oldStep;
;582:		int		delta;
;583:		int		step;
;584:
;585:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $433
line 586
;586:			break;
ADDRGP4 $333
JUMPV
LABELV $433
line 589
;587:		}
;588:		// if we are interpolating, we don't need to smooth steps
;589:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $445
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $445
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $445
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $437
LABELV $445
line 590
;590:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 591
;591:			break;
ADDRGP4 $333
JUMPV
LABELV $437
line 594
;592:		}
;593:		// check for stepping up before a previous step is completed
;594:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108928
INDIRI4
SUBI4
ASGNI4
line 595
;595:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $448
line 596
;596:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 52
ADDRGP4 cg+108924
INDIRF4
CNSTI4 200
ADDRLP4 48
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 597
;597:		} else {
ADDRGP4 $449
JUMPV
LABELV $448
line 598
;598:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 599
;599:		}
LABELV $449
line 602
;600:
;601:		// add this amount
;602:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 56
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 603
;603:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108924
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 604
;604:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108924
INDIRF4
CNSTF4 1107296256
LEF4 $452
line 605
;605:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108924
CNSTF4 1107296256
ASGNF4
line 606
;606:		}
LABELV $452
line 607
;607:		cg.stepTime = cg.time;
ADDRGP4 cg+108928
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 608
;608:		break;
ADDRGP4 $333
JUMPV
LABELV $458
line 612
;609:	}
;610:
;611:	case EV_JUMP_PAD:
;612:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $459
ADDRGP4 $462
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $459
line 614
;613://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;614:		{
line 616
;615:			localEntity_t	*smoke;
;616:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $463
INDIRB
ASGNB 12
line 619
;617:
;618:
;619:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 48
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 64
CNSTF4 1065353216
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+152340+276
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 68
INDIRP4
ASGNP4
line 626
;620:						  32, 
;621:						  1, 1, 1, 0.33f,
;622:						  1000, 
;623:						  cg.time, 0,
;624:						  LEF_PUFF_DONT_SCALE, 
;625:						  cgs.media.smokePuffShader );
;626:		}
line 629
;627:
;628:		// boing sound at origin, jump sound on player
;629:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+152340+748
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 630
;630:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRLP4 48
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 631
;631:		break;
ADDRGP4 $333
JUMPV
LABELV $470
line 634
;632:
;633:	case EV_JUMP:
;634:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $471
ADDRGP4 $474
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $471
line 635
;635:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 636
;636:		break;
ADDRGP4 $333
JUMPV
LABELV $475
line 638
;637:	case EV_TAUNT:
;638:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $476
ADDRGP4 $479
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $476
line 639
;639:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $480
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 640
;640:		break;
ADDRGP4 $333
JUMPV
LABELV $481
line 668
;641:#ifdef MISSIONPACK
;642:	case EV_TAUNT_YES:
;643:		DEBUGNAME("EV_TAUNT_YES");
;644:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;645:		break;
;646:	case EV_TAUNT_NO:
;647:		DEBUGNAME("EV_TAUNT_NO");
;648:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;649:		break;
;650:	case EV_TAUNT_FOLLOWME:
;651:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;652:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;653:		break;
;654:	case EV_TAUNT_GETFLAG:
;655:		DEBUGNAME("EV_TAUNT_GETFLAG");
;656:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;657:		break;
;658:	case EV_TAUNT_GUARDBASE:
;659:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;660:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;661:		break;
;662:	case EV_TAUNT_PATROL:
;663:		DEBUGNAME("EV_TAUNT_PATROL");
;664:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;665:		break;
;666:#endif
;667:	case EV_WATER_TOUCH:
;668:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $482
ADDRGP4 $485
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $482
line 669
;669:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+852
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 670
;670:		break;
ADDRGP4 $333
JUMPV
LABELV $488
line 672
;671:	case EV_WATER_LEAVE:
;672:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $489
ADDRGP4 $492
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $489
line 673
;673:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+856
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 674
;674:		break;
ADDRGP4 $333
JUMPV
LABELV $495
line 676
;675:	case EV_WATER_UNDER:
;676:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $496
ADDRGP4 $499
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $496
line 677
;677:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+860
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 678
;678:		break;
ADDRGP4 $333
JUMPV
LABELV $502
line 680
;679:	case EV_WATER_CLEAR:
;680:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $503
ADDRGP4 $506
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $503
line 681
;681:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $507
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 682
;682:		break;
ADDRGP4 $333
JUMPV
LABELV $508
line 685
;683:
;684:	case EV_ITEM_PICKUP:
;685:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $509
ADDRGP4 $512
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $509
line 686
;686:		{
line 690
;687:			gitem_t	*item;
;688:			int		index;
;689:
;690:			index = es->eventParm;		// player predicted
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 692
;691:
;692:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 72
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $515
ADDRLP4 72
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $513
LABELV $515
line 693
;693:				break;
ADDRGP4 $333
JUMPV
LABELV $513
line 695
;694:			}
;695:			item = &bg_itemlist[ index ];
ADDRLP4 68
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 699
;696:
;697:			// powerups and team items will have a separate global sound, this one
;698:			// will be played at prediction time
;699:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 5
EQI4 $518
ADDRLP4 76
INDIRI4
CNSTI4 8
NEI4 $516
LABELV $518
line 700
;700:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1004
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 701
;701:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $517
JUMPV
LABELV $516
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $521
line 718
;702:#ifdef MISSIONPACK
;703:				switch (item->giTag ) {
;704:					case PW_SCOUT:
;705:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;706:					break;
;707:					case PW_GUARD:
;708:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;709:					break;
;710:					case PW_DOUBLER:
;711:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;712:					break;
;713:					case PW_AMMOREGEN:
;714:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;715:					break;
;716:				}
;717:#endif
;718:			} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 719
;719:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 720
;720:			}
LABELV $522
LABELV $517
line 723
;721:
;722:			// show icon and name on status bar
;723:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $333
line 724
;724:				CG_ItemPickup( index );
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 725
;725:			}
line 726
;726:		}
line 727
;727:		break;
ADDRGP4 $333
JUMPV
LABELV $526
line 730
;728:
;729:	case EV_GLOBAL_ITEM_PICKUP:
;730:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $527
ADDRGP4 $530
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $527
line 731
;731:		{
line 735
;732:			gitem_t	*item;
;733:			int		index;
;734:
;735:			index = es->eventParm;		// player predicted
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 737
;736:
;737:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 72
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $533
ADDRLP4 72
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $531
LABELV $533
line 738
;738:				break;
ADDRGP4 $333
JUMPV
LABELV $531
line 740
;739:			}
;740:			item = &bg_itemlist[ index ];
ADDRLP4 68
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 742
;741:			// powerup pickups are global
;742:			if( item->pickup_sound ) {
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $534
line 743
;743:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 744
;744:			}
LABELV $534
line 747
;745:
;746:			// show icon and name on status bar
;747:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $333
line 748
;748:				CG_ItemPickup( index );
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 749
;749:			}
line 750
;750:		}
line 751
;751:		break;
ADDRGP4 $333
JUMPV
LABELV $540
line 757
;752:
;753:	//
;754:	// weapon events
;755:	//
;756:	case EV_NOAMMO:
;757:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $541
ADDRGP4 $544
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $541
line 759
;758://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;759:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $333
line 760
;760:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 761
;761:		}
line 762
;762:		break;
ADDRGP4 $333
JUMPV
LABELV $548
line 764
;763:	case EV_CHANGE_WEAPON:
;764:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $549
ADDRGP4 $552
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $549
line 765
;765:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+544
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 766
;766:		break;
ADDRGP4 $333
JUMPV
LABELV $555
line 768
;767:	case EV_FIRE_WEAPON:
;768:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $556
ADDRGP4 $559
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $556
line 769
;769:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 770
;770:		break;
ADDRGP4 $333
JUMPV
LABELV $560
line 773
;771:
;772:	case EV_FIRE_WEAPON2: 
;773:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $561
ADDRGP4 $564
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $561
line 774
;774:		 CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 775
;775:		 break;
ADDRGP4 $333
JUMPV
LABELV $565
line 778
;776:
;777:	case EV_USE_ITEM0:
;778:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $566
ADDRGP4 $569
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $566
line 779
;779:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 780
;780:		break;
ADDRGP4 $333
JUMPV
LABELV $570
line 782
;781:	case EV_USE_ITEM1:
;782:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $571
ADDRGP4 $574
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $571
line 783
;783:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 784
;784:		break;
ADDRGP4 $333
JUMPV
LABELV $575
line 786
;785:	case EV_USE_ITEM2:
;786:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $576
ADDRGP4 $579
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $576
line 787
;787:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 788
;788:		break;
ADDRGP4 $333
JUMPV
LABELV $580
line 790
;789:	case EV_USE_ITEM3:
;790:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $581
ADDRGP4 $584
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $581
line 791
;791:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 792
;792:		break;
ADDRGP4 $333
JUMPV
LABELV $585
line 794
;793:	case EV_USE_ITEM4:
;794:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $586
ADDRGP4 $589
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $586
line 795
;795:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 796
;796:		break;
ADDRGP4 $333
JUMPV
LABELV $590
line 798
;797:	case EV_USE_ITEM5:
;798:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $591
ADDRGP4 $594
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $591
line 799
;799:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 800
;800:		break;
ADDRGP4 $333
JUMPV
LABELV $595
line 802
;801:	case EV_USE_ITEM6:
;802:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $596
ADDRGP4 $599
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $596
line 803
;803:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 804
;804:		break;
ADDRGP4 $333
JUMPV
LABELV $600
line 806
;805:	case EV_USE_ITEM7:
;806:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $601
ADDRGP4 $604
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $601
line 807
;807:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 808
;808:		break;
ADDRGP4 $333
JUMPV
LABELV $605
line 810
;809:	case EV_USE_ITEM8:
;810:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $606
ADDRGP4 $609
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $606
line 811
;811:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 812
;812:		break;
ADDRGP4 $333
JUMPV
LABELV $610
line 814
;813:	case EV_USE_ITEM9:
;814:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $611
ADDRGP4 $614
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $611
line 815
;815:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 816
;816:		break;
ADDRGP4 $333
JUMPV
LABELV $615
line 818
;817:	case EV_USE_ITEM10:
;818:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $616
ADDRGP4 $619
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $616
line 819
;819:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 820
;820:		break;
ADDRGP4 $333
JUMPV
LABELV $620
line 822
;821:	case EV_USE_ITEM11:
;822:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $621
ADDRGP4 $624
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $621
line 823
;823:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 824
;824:		break;
ADDRGP4 $333
JUMPV
LABELV $625
line 826
;825:	case EV_USE_ITEM12:
;826:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $626
ADDRGP4 $629
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $626
line 827
;827:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 828
;828:		break;
ADDRGP4 $333
JUMPV
LABELV $630
line 830
;829:	case EV_USE_ITEM13:
;830:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $631
ADDRGP4 $634
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $631
line 831
;831:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 832
;832:		break;
ADDRGP4 $333
JUMPV
LABELV $635
line 834
;833:	case EV_USE_ITEM14:
;834:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $636
ADDRGP4 $639
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $636
line 835
;835:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 836
;836:		break;
ADDRGP4 $333
JUMPV
LABELV $640
line 844
;837:
;838:	//=================================================================
;839:
;840:	//
;841:	// other events
;842:	//
;843:	case EV_PLAYER_TELEPORT_IN:
;844:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $641
ADDRGP4 $644
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $641
line 845
;845:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+720
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 846
;846:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 847
;847:		break;
ADDRGP4 $333
JUMPV
LABELV $647
line 850
;848:
;849:	case EV_PLAYER_TELEPORT_OUT:
;850:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $648
ADDRGP4 $651
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $648
line 851
;851:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+724
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 852
;852:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 853
;853:		break;
ADDRGP4 $333
JUMPV
LABELV $654
line 856
;854:
;855:	case EV_ITEM_POP:
;856:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $655
ADDRGP4 $658
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $655
line 857
;857:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+732
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 858
;858:		break;
ADDRGP4 $333
JUMPV
LABELV $661
line 860
;859:	case EV_ITEM_RESPAWN:
;860:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $662
ADDRGP4 $665
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $662
line 861
;861:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 862
;862:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+732
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 863
;863:		break;
ADDRGP4 $333
JUMPV
LABELV $669
line 866
;864:
;865:	case EV_GRENADE_BOUNCE:
;866:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $670
ADDRGP4 $673
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $670
line 867
;867:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $674
line 868
;868:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1008
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 869
;869:		} else {
ADDRGP4 $333
JUMPV
LABELV $674
line 870
;870:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1012
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 871
;871:		}
line 872
;872:		break;
ADDRGP4 $333
JUMPV
LABELV $680
line 916
;873:
;874:#ifdef MISSIONPACK
;875:	case EV_PROXIMITY_MINE_STICK:
;876:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;877:		if( es->eventParm & SURF_FLESH ) {
;878:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;879:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;880:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;881:		} else {
;882:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;883:		}
;884:		break;
;885:
;886:	case EV_PROXIMITY_MINE_TRIGGER:
;887:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;888:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;889:		break;
;890:	case EV_KAMIKAZE:
;891:		DEBUGNAME("EV_KAMIKAZE");
;892:		CG_KamikazeEffect( cent->lerpOrigin );
;893:		break;
;894:	case EV_OBELISKEXPLODE:
;895:		DEBUGNAME("EV_OBELISKEXPLODE");
;896:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;897:		break;
;898:	case EV_OBELISKPAIN:
;899:		DEBUGNAME("EV_OBELISKPAIN");
;900:		CG_ObeliskPain( cent->lerpOrigin );
;901:		break;
;902:	case EV_INVUL_IMPACT:
;903:		DEBUGNAME("EV_INVUL_IMPACT");
;904:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;905:		break;
;906:	case EV_JUICED:
;907:		DEBUGNAME("EV_JUICED");
;908:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;909:		break;
;910:	case EV_LIGHTNINGBOLT:
;911:		DEBUGNAME("EV_LIGHTNINGBOLT");
;912:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;913:		break;
;914:#endif
;915:	case EV_SCOREPLUM:
;916:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $681
ADDRGP4 $684
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $681
line 917
;917:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 918
;918:		break;
ADDRGP4 $333
JUMPV
LABELV $685
line 924
;919:
;920:	//
;921:	// missile impacts
;922:	//
;923:	case EV_MISSILE_HIT:
;924:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $686
ADDRGP4 $689
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $686
line 925
;925:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 926
;926:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 927
;927:		break;
ADDRGP4 $333
JUMPV
LABELV $690
line 930
;928:
;929:	case EV_MISSILE_MISS:
;930:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $691
ADDRGP4 $694
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $691
line 931
;931:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 932
;932:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 933
;933:		break;
ADDRGP4 $333
JUMPV
LABELV $695
line 936
;934:
;935:	case EV_MISSILE_MISS_METAL:
;936:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $696
ADDRGP4 $699
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $696
line 937
;937:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 938
;938:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 939
;939:		break;
ADDRGP4 $333
JUMPV
LABELV $700
line 942
;940:
;941:	case EV_RAILTRAIL:
;942:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $701
ADDRGP4 $704
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $701
line 943
;943:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 946
;944://unlagged - attack prediction #2
;945:		// if the client is us, unlagged is on server-side, and we've got it client-side
;946:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $705
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cgs+153372
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $705
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $712
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $705
LABELV $712
line 947
;947:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 950
;948:			// do nothing, because it was already predicted
;949:			//Com_Printf("Ignoring rail trail event\n");
;950:		}
ADDRGP4 $333
JUMPV
LABELV $705
line 951
;951:		else {
line 953
;952:			// draw a rail trail, because it wasn't predicted
;953:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 956
;954:
;955:			// if the end was on a nomark surface, don't make an explosion
;956:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $333
line 957
;957:				ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 958
;958:				CG_MissileHitWall( es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 959
;959:			}
line 961
;960:			//Com_Printf("Non-predicted rail trail\n");
;961:		}
line 963
;962://unlagged - attack prediction #2
;963:		break;
ADDRGP4 $333
JUMPV
LABELV $715
line 966
;964:
;965:	case EV_BULLET_HIT_WALL:
;966:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $716
ADDRGP4 $719
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $716
line 969
;967://unlagged - attack prediction #2
;968:		// if the client is us, unlagged is on server-side, and we've got it client-side
;969:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $720
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cgs+153372
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $720
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $727
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $720
LABELV $727
line 970
;970:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 973
;971:			// do nothing, because it was already predicted
;972:			//Com_Printf("Ignoring bullet event\n");
;973:		}
ADDRGP4 $333
JUMPV
LABELV $720
line 974
;974:		else {
line 976
;975:			// do the bullet, because it wasn't predicted
;976:			ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 977
;977:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 979
;978:			//Com_Printf("Non-predicted bullet\n");
;979:		}
line 981
;980://unlagged - attack prediction #2
;981:		break;
ADDRGP4 $333
JUMPV
LABELV $728
line 984
;982:
;983:	case EV_BULLET_HIT_FLESH:
;984:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $729
ADDRGP4 $732
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $729
line 987
;985://unlagged - attack prediction #2
;986:		// if the client is us, unlagged is on server-side, and we've got it client-side
;987:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $733
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+153372
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $733
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $740
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $733
LABELV $740
line 988
;988:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 991
;989:			// do nothing, because it was already predicted
;990:			//Com_Printf("Ignoring bullet event\n");
;991:		}
ADDRGP4 $333
JUMPV
LABELV $733
line 992
;992:		else {
line 994
;993:			// do the bullet, because it wasn't predicted
;994:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 996
;995:			//Com_Printf("Non-predicted bullet\n");
;996:		}
line 998
;997://unlagged - attack prediction #2
;998:		break;
ADDRGP4 $333
JUMPV
LABELV $741
line 1001
;999:
;1000:	case EV_SHOTGUN:
;1001:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $742
ADDRGP4 $745
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $742
line 1004
;1002://unlagged - attack prediction #2
;1003:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1004:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $746
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+153372
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $746
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $753
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $746
LABELV $753
line 1005
;1005:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1008
;1006:			// do nothing, because it was already predicted
;1007:			//Com_Printf("Ignoring shotgun event\n");
;1008:		}
ADDRGP4 $333
JUMPV
LABELV $746
line 1009
;1009:		else {
line 1011
;1010:			// do the shotgun pattern, because it wasn't predicted
;1011:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1013
;1012:			//Com_Printf("Non-predicted shotgun pattern\n");
;1013:		}
line 1015
;1014://unlagged - attack prediction #2
;1015:		break;
ADDRGP4 $333
JUMPV
LABELV $754
line 1018
;1016:
;1017:	case EV_GENERAL_SOUND:
;1018:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $755
ADDRGP4 $758
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $755
line 1019
;1019:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $759
line 1020
;1020:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1021
;1021:		} else {
ADDRGP4 $333
JUMPV
LABELV $759
line 1022
;1022:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 96
INDIRP4
ASGNP4
line 1023
;1023:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1024
;1024:		}
line 1025
;1025:		break;
ADDRGP4 $333
JUMPV
LABELV $763
line 1028
;1026:
;1027:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1028:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $764
ADDRGP4 $767
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $764
line 1029
;1029:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $768
line 1030
;1030:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 96
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1031
;1031:		} else {
ADDRGP4 $333
JUMPV
LABELV $768
line 1032
;1032:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 96
INDIRP4
ASGNP4
line 1033
;1033:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1034
;1034:		}
line 1035
;1035:		break;
ADDRGP4 $333
JUMPV
LABELV $774
line 1038
;1036:
;1037:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1038:		{
line 1039
;1039:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $775
ADDRGP4 $778
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $775
line 1040
;1040:			switch( es->eventParm ) {
ADDRLP4 96
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
LTI4 $333
ADDRLP4 96
INDIRI4
CNSTI4 12
GTI4 $333
ADDRLP4 96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $897
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $897
address $782
address $792
address $802
address $814
address $826
address $846
address $866
address $874
address $882
address $885
address $888
address $891
address $894
code
LABELV $782
line 1042
;1041:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1042:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $783
line 1043
;1043:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $333
JUMPV
LABELV $783
line 1045
;1044:					else
;1045:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1046
;1046:					break;
ADDRGP4 $333
JUMPV
LABELV $792
line 1048
;1047:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1048:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $793
line 1049
;1049:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $333
JUMPV
LABELV $793
line 1051
;1050:					else
;1051:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1052
;1052:					break;
ADDRGP4 $333
JUMPV
LABELV $802
line 1054
;1053:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1054:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $803
line 1055
;1055:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $804
JUMPV
LABELV $803
line 1057
;1056:					else
;1057:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+912
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $804
line 1059
;1058:					//
;1059:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+152340+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1060
;1060:					break;
ADDRGP4 $333
JUMPV
LABELV $814
line 1062
;1061:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1062:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $815
line 1063
;1063:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $816
JUMPV
LABELV $815
line 1065
;1064:					else
;1065:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+912
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $816
line 1067
;1066:					//
;1067:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+152340+924
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1068
;1068:					break;
ADDRGP4 $333
JUMPV
LABELV $826
line 1072
;1069:
;1070:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1071:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1072:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $831
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $827
LABELV $831
line 1073
;1073:					}
ADDRGP4 $333
JUMPV
LABELV $827
line 1074
;1074:					else {
line 1075
;1075:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $832
line 1081
;1076:#ifdef MISSIONPACK
;1077:							if (cgs.gametype == GT_1FCTF) 
;1078:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1079:							else
;1080:#endif
;1081:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1082
;1082:						}
ADDRGP4 $333
JUMPV
LABELV $832
line 1083
;1083:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $333
line 1089
;1084:#ifdef MISSIONPACK
;1085:							if (cgs.gametype == GT_1FCTF)
;1086:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1087:							else
;1088:#endif
;1089: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1090
;1090:						}
line 1091
;1091:					}
line 1092
;1092:					break;
ADDRGP4 $333
JUMPV
LABELV $846
line 1095
;1093:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1094:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1095:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
NEI4 $851
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $847
LABELV $851
line 1096
;1096:					}
ADDRGP4 $333
JUMPV
LABELV $847
line 1097
;1097:					else {
line 1098
;1098:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $852
line 1104
;1099:#ifdef MISSIONPACK
;1100:							if (cgs.gametype == GT_1FCTF)
;1101:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1102:							else
;1103:#endif
;1104:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1105
;1105:						}
ADDRGP4 $333
JUMPV
LABELV $852
line 1106
;1106:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 1112
;1107:#ifdef MISSIONPACK
;1108:							if (cgs.gametype == GT_1FCTF)
;1109:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1110:							else
;1111:#endif
;1112:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1113
;1113:						}
line 1114
;1114:					}
line 1115
;1115:					break;
ADDRGP4 $333
JUMPV
LABELV $866
line 1117
;1116:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1117:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $333
line 1118
;1118:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1119
;1119:					}
line 1120
;1120:					break;
ADDRGP4 $333
JUMPV
LABELV $874
line 1122
;1121:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1122:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 1123
;1123:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1124
;1124:					}
line 1125
;1125:					break;
ADDRGP4 $333
JUMPV
LABELV $882
line 1128
;1126:
;1127:				case GTS_REDTEAM_SCORED:
;1128:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+152340+880
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1129
;1129:					break;
ADDRGP4 $333
JUMPV
LABELV $885
line 1131
;1130:				case GTS_BLUETEAM_SCORED:
;1131:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+152340+884
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1132
;1132:					break;
ADDRGP4 $333
JUMPV
LABELV $888
line 1134
;1133:				case GTS_REDTEAM_TOOK_LEAD:
;1134:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+152340+888
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1135
;1135:					break;
ADDRGP4 $333
JUMPV
LABELV $891
line 1137
;1136:				case GTS_BLUETEAM_TOOK_LEAD:
;1137:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+152340+892
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1138
;1138:					break;
ADDRGP4 $333
JUMPV
LABELV $894
line 1140
;1139:				case GTS_TEAMS_ARE_TIED:
;1140:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+152340+896
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1141
;1141:					break;
line 1148
;1142:#ifdef MISSIONPACK
;1143:				case GTS_KAMIKAZE:
;1144:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1145:					break;
;1146:#endif
;1147:				default:
;1148:					break;
line 1150
;1149:			}
;1150:			break;
ADDRGP4 $333
JUMPV
LABELV $898
line 1156
;1151:		}
;1152:
;1153:	case EV_PAIN:
;1154:		// local player sounds are triggered in CG_CheckLocalSounds,
;1155:		// so ignore events on the player
;1156:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $899
ADDRGP4 $902
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $899
line 1157
;1157:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $333
line 1158
;1158:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1159
;1159:		}
line 1160
;1160:		break;
ADDRGP4 $333
JUMPV
LABELV $906
line 1165
;1161:
;1162:	case EV_DEATH1:
;1163:	case EV_DEATH2:
;1164:	case EV_DEATH3:
;1165:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $907
ADDRGP4 $910
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $907
line 1166
;1166:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $911
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 58
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1168
;1167:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1168:		break;
ADDRGP4 $333
JUMPV
LABELV $912
line 1172
;1169:
;1170:
;1171:	case EV_OBITUARY:
;1172:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $913
ADDRGP4 $916
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $913
line 1173
;1173:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1174
;1174:		break;
ADDRGP4 $333
JUMPV
LABELV $917
line 1180
;1175:
;1176:	//
;1177:	// powerup events
;1178:	//
;1179:	case EV_POWERUP_QUAD:
;1180:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $918
ADDRGP4 $921
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $918
line 1181
;1181:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $922
line 1182
;1182:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+124420
CNSTI4 1
ASGNI4
line 1183
;1183:			cg.powerupTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1184
;1184:		}
LABELV $922
line 1185
;1185:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+536
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1186
;1186:		break;
ADDRGP4 $333
JUMPV
LABELV $930
line 1188
;1187:	case EV_POWERUP_BATTLESUIT:
;1188:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $931
ADDRGP4 $934
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $931
line 1189
;1189:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $935
line 1190
;1190:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+124420
CNSTI4 2
ASGNI4
line 1191
;1191:			cg.powerupTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1192
;1192:		}
LABELV $935
line 1193
;1193:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+1000
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1194
;1194:		break;
ADDRGP4 $333
JUMPV
LABELV $943
line 1196
;1195:	case EV_POWERUP_REGEN:
;1196:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $944
ADDRGP4 $947
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $944
line 1197
;1197:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $948
line 1198
;1198:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+124420
CNSTI4 5
ASGNI4
line 1199
;1199:			cg.powerupTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1200
;1200:		}
LABELV $948
line 1201
;1201:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+996
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1202
;1202:		break;
ADDRGP4 $333
JUMPV
LABELV $956
line 1205
;1203:
;1204:	case EV_GIB_PLAYER:
;1205:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $957
ADDRGP4 $960
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $957
line 1209
;1206:		// don't play gib sound when using the kamikaze because it interferes
;1207:		// with the kamikaze sound, downside is that the gib sound will also
;1208:		// not be played when someone is gibbed while just carrying the kamikaze
;1209:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $961
line 1210
;1210:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1211
;1211:		}
LABELV $961
line 1212
;1212:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1213
;1213:		break;
ADDRGP4 $333
JUMPV
LABELV $965
line 1217
;1214:
;1215:	// Shafe - Trep - Headshot stuff
;1216:	case EV_GIB_PLAYER_HEADSHOT:
;1217:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $966
ADDRGP4 $969
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $966
line 1218
;1218:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1219
;1219:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 1
ASGNI4
line 1220
;1220:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1221
;1221:		break;
ADDRGP4 $333
JUMPV
LABELV $972
line 1224
;1222:
;1223:	case EV_BODY_NOHEAD:
;1224:		DEBUGNAME("EV_BODY_NOHEAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $973
ADDRGP4 $976
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $973
line 1225
;1225:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 1
ASGNI4
line 1226
;1226:		break;
ADDRGP4 $333
JUMPV
LABELV $977
line 1230
;1227:	// Shafe - Trep - End Headshot Stuff
;1228:
;1229:	case EV_STOPLOOPINGSOUND:
;1230:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $978
ADDRGP4 $981
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $978
line 1231
;1231:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1232
;1232:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1233
;1233:		break;
ADDRGP4 $333
JUMPV
LABELV $982
line 1236
;1234:
;1235:	case EV_DEBUG_LINE:
;1236:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $983
ADDRGP4 $986
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $983
line 1237
;1237:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1238
;1238:		break;
ADDRGP4 $333
JUMPV
LABELV $332
line 1241
;1239:
;1240:	default:
;1241:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $987
ADDRGP4 $990
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $987
line 1242
;1242:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $991
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1243
;1243:		break;
LABELV $333
line 1246
;1244:	}
;1245:
;1246:}
LABELV $317
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1255
;1247:
;1248:
;1249:/*
;1250:==============
;1251:CG_CheckEvents
;1252:
;1253:==============
;1254:*/
;1255:void CG_CheckEvents( centity_t *cent ) {
line 1257
;1256:	// check for event-only entities
;1257:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $995
line 1258
;1258:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $997
line 1259
;1259:			return;	// already fired
ADDRGP4 $994
JUMPV
LABELV $997
line 1262
;1260:		}
;1261:		// if this is a player event set the entity number of the client entity number
;1262:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $999
line 1263
;1263:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1264
;1264:		}
LABELV $999
line 1266
;1265:
;1266:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1268
;1267:
;1268:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
ASGNI4
line 1269
;1269:	} else {
ADDRGP4 $996
JUMPV
LABELV $995
line 1271
;1270:		// check for events riding with another entity
;1271:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
NEI4 $1001
line 1272
;1272:			return;
ADDRGP4 $994
JUMPV
LABELV $1001
line 1274
;1273:		}
;1274:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1275
;1275:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1003
line 1276
;1276:			return;
ADDRGP4 $994
JUMPV
LABELV $1003
line 1278
;1277:		}
;1278:	}
LABELV $996
line 1281
;1279:
;1280:	// calculate the position at exactly the frame time
;1281:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1282
;1282:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1284
;1283:
;1284:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1285
;1285:}
LABELV $994
endproc CG_CheckEvents 8 12
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
LABELV $991
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $990
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $986
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $981
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $976
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 79
byte 1 68
byte 1 89
byte 1 95
byte 1 78
byte 1 79
byte 1 72
byte 1 69
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $969
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 69
byte 1 65
byte 1 68
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $960
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $947
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 82
byte 1 69
byte 1 71
byte 1 69
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $934
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 84
byte 1 76
byte 1 69
byte 1 83
byte 1 85
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $921
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 81
byte 1 85
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $916
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $911
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $910
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $902
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $778
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $767
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $758
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $745
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $732
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $719
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $704
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $699
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $694
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $689
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $684
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $673
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $665
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $658
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $651
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $644
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $639
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $634
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $629
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $624
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $619
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 10
byte 1 0
align 1
LABELV $609
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $604
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 10
byte 1 0
align 1
LABELV $594
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $589
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $584
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $579
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $569
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $564
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $559
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $552
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $544
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $530
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $512
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $507
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
LABELV $506
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $499
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $492
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $485
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $480
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
LABELV $479
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $474
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $469
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
LABELV $462
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 95
byte 1 80
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $432
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $419
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
LABELV $418
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $406
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $392
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $381
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $370
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $359
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $348
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 69
byte 1 86
byte 1 69
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $321
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $315
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
LABELV $314
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
LABELV $311
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
LABELV $308
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
LABELV $271
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $270
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $259
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $254
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $253
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $252
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $250
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $249
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $247
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $246
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $244
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $242
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $239
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $238
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $236
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $234
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $232
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $231
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $229
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $228
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $226
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $224
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $222
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $220
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $209
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $206
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 33
byte 1 10
byte 1 10
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $203
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 33
byte 1 10
byte 1 10
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $199
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $187
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $182
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $181
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $178
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $175
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $174
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $171
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $167
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $165
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $164
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $161
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $157
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $156
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $153
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $129
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $125
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $121
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $116
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $102
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $99
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $96
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $84
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $81
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $78
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $75
byte 1 0
align 1
LABELV $74
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
