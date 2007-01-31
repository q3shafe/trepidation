bss
align 1
LABELV $73
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../cg_event.c"
line 23
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
;13:
;14:
;15:
;16:/*
;17:===================
;18:CG_PlaceString
;19:
;20:Also called by scoreboard drawing
;21:===================
;22:*/
;23:const char	*CG_PlaceString( int rank ) {
line 27
;24:	static char	str[64];
;25:	char	*s, *t;
;26:
;27:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $74
line 28
;28:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 29
;29:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $76
ASGNP4
line 30
;30:	} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 31
;31:		t = "";
ADDRLP4 4
ADDRGP4 $77
ASGNP4
line 32
;32:	}
LABELV $75
line 34
;33:
;34:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $78
line 35
;35:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $80
ASGNP4
line 36
;36:	} else if ( rank == 2 ) {
ADDRGP4 $79
JUMPV
LABELV $78
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $81
line 37
;37:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $83
ASGNP4
line 38
;38:	} else if ( rank == 3 ) {
ADDRGP4 $82
JUMPV
LABELV $81
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $84
line 39
;39:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $86
ASGNP4
line 40
;40:	} else if ( rank == 11 ) {
ADDRGP4 $85
JUMPV
LABELV $84
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $87
line 41
;41:		s = "11th";
ADDRLP4 0
ADDRGP4 $89
ASGNP4
line 42
;42:	} else if ( rank == 12 ) {
ADDRGP4 $88
JUMPV
LABELV $87
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $90
line 43
;43:		s = "12th";
ADDRLP4 0
ADDRGP4 $92
ASGNP4
line 44
;44:	} else if ( rank == 13 ) {
ADDRGP4 $91
JUMPV
LABELV $90
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $93
line 45
;45:		s = "13th";
ADDRLP4 0
ADDRGP4 $95
ASGNP4
line 46
;46:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $94
JUMPV
LABELV $93
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $96
line 47
;47:		s = va("%ist", rank);
ADDRGP4 $98
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
line 48
;48:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $97
JUMPV
LABELV $96
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $99
line 49
;49:		s = va("%ind", rank);
ADDRGP4 $101
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
line 50
;50:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $100
JUMPV
LABELV $99
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $102
line 51
;51:		s = va("%ird", rank);
ADDRGP4 $104
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
line 52
;52:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 53
;53:		s = va("%ith", rank);
ADDRGP4 $105
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
line 54
;54:	}
LABELV $103
LABELV $100
LABELV $97
LABELV $94
LABELV $91
LABELV $88
LABELV $85
LABELV $82
LABELV $79
line 56
;55:
;56:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $73
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
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
line 57
;57:	return str;
ADDRGP4 $73
RETP4
LABELV $72
endproc CG_PlaceString 12 20
proc CG_Obituary 136 20
line 65
;58:}
;59:
;60:/*
;61:=============
;62:CG_Obituary
;63:=============
;64:*/
;65:static void CG_Obituary( entityState_t *ent ) {
line 77
;66:	int			mod;
;67:	int			target, attacker;
;68:	char		*message;
;69:	char		*message2;
;70:	const char	*targetInfo;
;71:	const char	*attackerInfo;
;72:	char		targetName[32];
;73:	char		attackerName[32];
;74:	gender_t	gender;
;75:	clientInfo_t	*ci;
;76:
;77:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 78
;78:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 79
;79:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 81
;80:
;81:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $110
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $108
LABELV $110
line 82
;82:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $111
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 83
;83:	}
LABELV $108
line 84
;84:	ci = &cgs.clientinfo[target];
ADDRLP4 92
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 86
;85:
;86:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $115
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $113
LABELV $115
line 87
;87:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 88
;88:		attackerInfo = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 89
;89:	} else {
ADDRGP4 $114
JUMPV
LABELV $113
line 90
;90:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
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
line 91
;91:	}
LABELV $114
line 93
;92:
;93:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
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
line 94
;94:	if ( !targetInfo ) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 95
;95:		return;
ADDRGP4 $107
JUMPV
LABELV $116
line 97
;96:	}
;97:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $118
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
line 98
;98:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 100
;99:
;100:	message2 = "";
ADDRLP4 88
ADDRGP4 $77
ASGNP4
line 104
;101:
;102:	// check for single client messages
;103:
;104:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 14
LTI4 $120
ADDRLP4 44
INDIRI4
CNSTI4 27
GTI4 $120
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $142-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $142
address $128
address $130
address $132
address $126
address $120
address $124
address $122
address $136
address $138
address $120
address $140
address $120
address $120
address $134
code
LABELV $122
line 106
;105:	case MOD_SUICIDE:
;106:		message = "suicides";
ADDRLP4 40
ADDRGP4 $123
ASGNP4
line 107
;107:		break;
ADDRGP4 $121
JUMPV
LABELV $124
line 109
;108:	case MOD_FALLING:
;109:		message = "cratered";
ADDRLP4 40
ADDRGP4 $125
ASGNP4
line 110
;110:		break;
ADDRGP4 $121
JUMPV
LABELV $126
line 112
;111:	case MOD_CRUSH:
;112:		message = "was squished";
ADDRLP4 40
ADDRGP4 $127
ASGNP4
line 113
;113:		break;
ADDRGP4 $121
JUMPV
LABELV $128
line 115
;114:	case MOD_WATER:
;115:		message = "sank like a rock";
ADDRLP4 40
ADDRGP4 $129
ASGNP4
line 116
;116:		break;
ADDRGP4 $121
JUMPV
LABELV $130
line 118
;117:	case MOD_SLIME:
;118:		message = "melted";
ADDRLP4 40
ADDRGP4 $131
ASGNP4
line 119
;119:		break;
ADDRGP4 $121
JUMPV
LABELV $132
line 121
;120:	case MOD_LAVA:
;121:		message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $133
ASGNP4
line 122
;122:		break;
ADDRGP4 $121
JUMPV
LABELV $134
line 124
;123:	case MOD_IMMOBILIZED:
;124:		message = "was immobilized";
ADDRLP4 40
ADDRGP4 $135
ASGNP4
line 125
;125:		break;
ADDRGP4 $121
JUMPV
LABELV $136
line 127
;126:	case MOD_TARGET_LASER:
;127:		message = "saw the light";
ADDRLP4 40
ADDRGP4 $137
ASGNP4
line 128
;128:		break;
ADDRGP4 $121
JUMPV
LABELV $138
line 130
;129:	case MOD_TRIGGER_HURT:
;130:		message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $139
ASGNP4
line 131
;131:		break;
ADDRGP4 $121
JUMPV
LABELV $140
line 133
;132:	case MOD_TURRET:
;133:		message = "was shot down by a turret";
ADDRLP4 40
ADDRGP4 $141
ASGNP4
line 134
;134:		break;
ADDRGP4 $121
JUMPV
LABELV $120
line 136
;135:	default:
;136:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 137
;137:		break;
LABELV $121
line 140
;138:	}
;139:
;140:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $144
line 141
;141:		gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 142
;142:		switch (mod) {
ADDRLP4 124
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $172
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
GTI4 $190
LABELV $189
ADDRLP4 44
INDIRI4
CNSTI4 5
EQI4 $148
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $156
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $164
ADDRGP4 $146
JUMPV
LABELV $190
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $174
ADDRGP4 $146
JUMPV
LABELV $148
line 149
;143:#ifdef MISSIONPACK
;144:		case MOD_KAMIKAZE:
;145:			message = "goes out with a bang";
;146:			break;
;147:#endif
;148:		case MOD_GRENADE_SPLASH:
;149:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $149
line 150
;150:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $149
line 151
;151:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $152
line 152
;152:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $154
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $152
line 154
;153:			else
;154:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $155
ASGNP4
line 155
;155:			break;
ADDRGP4 $147
JUMPV
LABELV $156
line 157
;156:		case MOD_ROCKET_SPLASH:
;157:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $157
line 158
;158:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $159
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $157
line 159
;159:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $160
line 160
;160:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $162
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $160
line 162
;161:			else
;162:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $163
ASGNP4
line 163
;163:			break;
ADDRGP4 $147
JUMPV
LABELV $164
line 165
;164:		case MOD_PLASMA_SPLASH:
;165:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $165
line 166
;166:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $165
line 167
;167:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $168
line 168
;168:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $170
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $168
line 170
;169:			else
;170:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
line 171
;171:			break;
ADDRGP4 $147
JUMPV
LABELV $172
line 173
;172:		case MOD_BFG_SPLASH:
;173:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $173
ASGNP4
line 174
;174:			break;
ADDRGP4 $147
JUMPV
LABELV $174
line 176
;175:		case MOD_HEADSHOT:									// Shafe - Headshots
;176:			gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
line 177
;177:			if(gender==GENDER_FEMALE)
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $175
line 178
;178:			{
line 179
;179:				message = "got her head blown off by";
ADDRLP4 40
ADDRGP4 $177
ASGNP4
line 180
;180:			}
ADDRGP4 $147
JUMPV
LABELV $175
line 182
;181:			else
;182:			{
line 183
;183:				if(gender==GENDER_NEUTER)
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $178
line 184
;184:					message = "got its head blown off by";
ADDRLP4 40
ADDRGP4 $180
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $178
line 186
;185:				else
;186:					message = "got his head blown off by";
ADDRLP4 40
ADDRGP4 $181
ASGNP4
line 187
;187:			}
line 188
;188:			break;											
ADDRGP4 $147
JUMPV
LABELV $146
line 201
;189:#ifdef MISSIONPACK
;190:		case MOD_PROXIMITY_MINE:
;191:			if( gender == GENDER_FEMALE ) {
;192:				message = "found her prox mine";
;193:			} else if ( gender == GENDER_NEUTER ) {
;194:				message = "found it's prox mine";
;195:			} else {
;196:				message = "found his prox mine";
;197:			}
;198:			break;
;199:#endif
;200:		default:
;201:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $182
line 202
;202:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $184
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $182
line 203
;203:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $185
line 204
;204:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $187
ASGNP4
ADDRGP4 $147
JUMPV
LABELV $185
line 206
;205:			else
;206:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $188
ASGNP4
line 207
;207:			break;
LABELV $147
line 209
;208:		}
;209:	}
LABELV $144
line 211
;210:
;211:	if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $191
line 212
;212:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $193
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 213
;213:		return;
ADDRGP4 $107
JUMPV
LABELV $191
line 217
;214:	}
;215:
;216:	// check for kill messages from the current clientNum
;217:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $194
line 220
;218:		char	*s;
;219:
;220:		if(mod != MOD_HEADSHOT) // Shafe - Trep - only for headshots
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $197
line 221
;221:		{						
line 222
;222:			if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $199
line 223
;223:					s = va("You fragged %s\n%s place with %i", targetName, 
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
ADDRGP4 $202
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
line 226
;224:					CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;225:					cg.snap->ps.persistant[PERS_SCORE] );
;226:			} else {
ADDRGP4 $198
JUMPV
LABELV $199
line 227
;227:				s = va("You fragged %s", targetName );
ADDRGP4 $205
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
line 228
;228:			}
line 229
;229:		}
ADDRGP4 $198
JUMPV
LABELV $197
line 231
;230:		else										// Shafe - Trep Else for headshot
;231:		{
line 233
;232:
;233:			if ( cgs.gametype < GT_TEAM ) 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $206
line 234
;234:			{
line 235
;235:				s = va("Headshot!\n\nYou fragged %s\n%s place with %i", targetName, 
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
ADDRGP4 $209
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
line 238
;236:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;237:				cg.snap->ps.persistant[PERS_SCORE] );
;238:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $212
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 132
INDIRP4
ASGNP4
line 239
;239:			} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 240
;240:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $212
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
line 241
;241:			}	
LABELV $207
line 244
;242:			
;243:	
;244:		}
LABELV $198
line 250
;245:#ifdef MISSIONPACK
;246:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;247:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;248:		} 
;249:#else
;250:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
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
line 254
;251:#endif
;252:
;253:		// print the text message as well
;254:	}
LABELV $194
line 257
;255:
;256:	// check for double client messages
;257:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $213
line 258
;258:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 259
;259:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $215
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 260
;260:	} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 261
;261:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $118
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
line 262
;262:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 264
;263:		// check for kill messages about the current clientNum
;264:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $216
line 265
;265:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+116400
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 266
;266:		}
LABELV $216
line 267
;267:	}
LABELV $214
line 269
;268:
;269:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $221
line 270
;270:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $223
ADDRLP4 44
INDIRI4
CNSTI4 26
GTI4 $223
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $269-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $269
address $231
address $227
address $229
address $233
address $236
address $239
address $242
address $244
address $247
address $250
address $252
address $254
address $257
address $223
address $223
address $223
address $223
address $259
address $223
address $223
address $223
address $223
address $223
address $265
address $225
address $262
code
LABELV $225
line 272
;271:		case MOD_GRAPPLE:
;272:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $226
ASGNP4
line 273
;273:			break;
ADDRGP4 $224
JUMPV
LABELV $227
line 275
;274:		case MOD_GAUNTLET:
;275:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 276
;276:			break;
ADDRGP4 $224
JUMPV
LABELV $229
line 278
;277:		case MOD_MACHINEGUN:
;278:			message = "was assaulted by";
ADDRLP4 40
ADDRGP4 $230
ASGNP4
line 279
;279:			break;
ADDRGP4 $224
JUMPV
LABELV $231
line 281
;280:		case MOD_SHOTGUN:
;281:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $232
ASGNP4
line 282
;282:			break;
ADDRGP4 $224
JUMPV
LABELV $233
line 284
;283:		case MOD_GRENADE:
;284:			message = "ate";
ADDRLP4 40
ADDRGP4 $234
ASGNP4
line 285
;285:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $235
ASGNP4
line 286
;286:			break;
ADDRGP4 $224
JUMPV
LABELV $236
line 288
;287:		case MOD_GRENADE_SPLASH:
;288:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $237
ASGNP4
line 289
;289:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $238
ASGNP4
line 290
;290:			break;
ADDRGP4 $224
JUMPV
LABELV $239
line 292
;291:		case MOD_ROCKET:
;292:			message = "was crushed by";
ADDRLP4 40
ADDRGP4 $240
ASGNP4
line 293
;293:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $241
ASGNP4
line 294
;294:			break;
ADDRGP4 $224
JUMPV
LABELV $242
line 296
;295:		case MOD_ROCKET_SPLASH:
;296:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $243
ASGNP4
line 297
;297:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $241
ASGNP4
line 298
;298:			break;
ADDRGP4 $224
JUMPV
LABELV $244
line 300
;299:		case MOD_PLASMA:
;300:			message = "was sliced to shreds by";
ADDRLP4 40
ADDRGP4 $245
ASGNP4
line 301
;301:			message2 = "'s gata gun";
ADDRLP4 88
ADDRGP4 $246
ASGNP4
line 302
;302:			break;
ADDRGP4 $224
JUMPV
LABELV $247
line 304
;303:		case MOD_PLASMA_SPLASH:
;304:			message = "was shreded by";
ADDRLP4 40
ADDRGP4 $248
ASGNP4
line 305
;305:			message2 = "'s gata fun";
ADDRLP4 88
ADDRGP4 $249
ASGNP4
line 306
;306:			break;
ADDRGP4 $224
JUMPV
LABELV $250
line 308
;307:		case MOD_RAILGUN:
;308:			message = "was degaussed by"; // Shafe - Trep - Reworded
ADDRLP4 40
ADDRGP4 $251
ASGNP4
line 309
;309:			break;
ADDRGP4 $224
JUMPV
LABELV $252
line 311
;310:		case MOD_LIGHTNING:
;311:			message = "was burnt by";
ADDRLP4 40
ADDRGP4 $253
ASGNP4
line 312
;312:			break;
ADDRGP4 $224
JUMPV
LABELV $254
line 314
;313:		case MOD_BFG:
;314:			message = "was annialated by";
ADDRLP4 40
ADDRGP4 $255
ASGNP4
line 315
;315:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $256
ASGNP4
line 316
;316:			break;
ADDRGP4 $224
JUMPV
LABELV $257
line 318
;317:		case MOD_BFG_SPLASH:
;318:			message = "was annialated by the fallout of";
ADDRLP4 40
ADDRGP4 $258
ASGNP4
line 319
;319:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $256
ASGNP4
line 320
;320:			break;
ADDRGP4 $224
JUMPV
LABELV $259
line 342
;321:#ifdef MISSIONPACK
;322:		case MOD_NAIL:
;323:			message = "was nailed by";
;324:			break;
;325:		case MOD_CHAINGUN:
;326:			message = "got lead poisoning from";
;327:			message2 = "'s Chaingun";
;328:			break;
;329:		case MOD_PROXIMITY_MINE:
;330:			message = "was too close to";
;331:			message2 = "'s Prox Mine";
;332:			break;
;333:		case MOD_KAMIKAZE:
;334:			message = "falls to";
;335:			message2 = "'s Kamikaze blast";
;336:			break;
;337:		case MOD_JUICED:
;338:			message = "was juiced by";
;339:			break;
;340:#endif
;341:		case MOD_TELEFRAG:
;342:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $260
ASGNP4
line 343
;343:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $261
ASGNP4
line 344
;344:			break;
ADDRGP4 $224
JUMPV
LABELV $262
line 346
;345:		case MOD_ALTFLAMER:		// Shafe - Trep - Flame Thrower Alt
;346:			message = "was toasted by";
ADDRLP4 40
ADDRGP4 $263
ASGNP4
line 347
;347:			message2 = "'s flame thrower";
ADDRLP4 88
ADDRGP4 $264
ASGNP4
line 348
;348:			break;
ADDRGP4 $224
JUMPV
LABELV $265
line 350
;349:		case MOD_TURRET:
;350:			message = "was shot down by ";
ADDRLP4 40
ADDRGP4 $266
ASGNP4
line 351
;351:			message2 = "'s turret.";
ADDRLP4 88
ADDRGP4 $267
ASGNP4
line 352
;352:			break;
ADDRGP4 $224
JUMPV
LABELV $223
line 354
;353:		default:
;354:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $268
ASGNP4
line 355
;355:			break;
LABELV $224
line 358
;356:		}
;357:
;358:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
line 359
;359:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $273
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
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
line 361
;360:				targetName, message, attackerName, message2);
;361:			return;
ADDRGP4 $107
JUMPV
LABELV $271
line 363
;362:		}
;363:	}
LABELV $221
line 366
;364:
;365:	// we don't know what it was
;366:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $274
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 367
;367:}
LABELV $107
endproc CG_Obituary 136 20
proc CG_UseItem 32 16
line 376
;368:
;369://==========================================================================
;370:
;371:/*
;372:===============
;373:CG_UseItem
;374:===============
;375:*/
;376:static void CG_UseItem( centity_t *cent ) {
line 382
;377:	clientInfo_t *ci;
;378:	int			itemNum, clientNum;
;379:	gitem_t		*item;
;380:	entityState_t *es;
;381:
;382:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 384
;383:	
;384:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
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
line 385
;385:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $278
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $276
LABELV $278
line 386
;386:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 387
;387:	}
LABELV $276
line 390
;388:
;389:	// print a message if the local player
;390:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $279
line 391
;391:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $282
line 392
;392:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $284
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 393
;393:		} else {
ADDRGP4 $283
JUMPV
LABELV $282
line 394
;394:			item = BG_FindItemForHoldable( itemNum );
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
line 395
;395:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $285
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
line 396
;396:		}
LABELV $283
line 397
;397:	}
LABELV $279
line 399
;398:
;399:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $288
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $287
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $292
ADDRGP4 $286
JUMPV
LABELV $286
LABELV $288
line 402
;400:	default:
;401:	case HI_NONE:
;402:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+154388+612
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 403
;403:		break;
ADDRGP4 $287
JUMPV
line 406
;404:
;405:	case HI_TELEPORTER:
;406:		break;
LABELV $292
line 409
;407:
;408:	case HI_MEDKIT:
;409:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 410
;410:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $293
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $293
line 411
;411:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1740
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 412
;412:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 152
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 413
;413:		}
LABELV $293
line 414
;414:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+154388+944
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 415
;415:		break;
LABELV $287
line 428
;416:
;417:#ifdef MISSIONPACK
;418:	case HI_KAMIKAZE:
;419:		break;
;420:	case HI_PORTAL:
;421:		break;
;422:	case HI_INVULNERABILITY:
;423:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;424:		break;
;425:#endif
;426:	}
;427:
;428:}
LABELV $275
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 437
;429:
;430:/*
;431:================
;432:CG_ItemPickup
;433:
;434:A new item was picked up this frame
;435:================
;436:*/
;437:static void CG_ItemPickup( int itemNum ) {
line 438
;438:	cg.itemPickup = itemNum;
ADDRGP4 cg+126732
ADDRFP4 0
INDIRI4
ASGNI4
line 439
;439:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+126736
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 440
;440:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+126740
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 442
;441:	// see if it should be the grabbed weapon
;442:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $305
line 444
;443:		// select it immediately
;444:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $308
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $308
line 445
;445:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 446
;446:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+111004
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 447
;447:		}
LABELV $308
line 448
;448:	}
LABELV $305
line 450
;449:
;450:}
LABELV $299
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 460
;451:
;452:
;453:/*
;454:================
;455:CG_PainEvent
;456:
;457:Also called by playerstate transition
;458:================
;459:*/
;460:void CG_PainEvent( centity_t *cent, int health ) {
line 464
;461:	char	*snd;
;462:
;463:	// don't do more than two pain sounds a second
;464:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $317
line 465
;465:		return;
ADDRGP4 $316
JUMPV
LABELV $317
line 468
;466:	}
;467:
;468:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $320
line 469
;469:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $322
ASGNP4
line 470
;470:	} else if ( health < 50 ) {
ADDRGP4 $321
JUMPV
LABELV $320
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $323
line 471
;471:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $325
ASGNP4
line 472
;472:	} else if ( health < 75 ) {
ADDRGP4 $324
JUMPV
LABELV $323
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $326
line 473
;473:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $328
ASGNP4
line 474
;474:	} else {
ADDRGP4 $327
JUMPV
LABELV $326
line 475
;475:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $329
ASGNP4
line 476
;476:	}
LABELV $327
LABELV $324
LABELV $321
line 477
;477:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
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
line 481
;478:		CG_CustomSound( cent->currentState.number, snd ) );
;479:
;480:	// save pain time for programitic twitch animation
;481:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 482
;482:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 608
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
line 483
;483:}
LABELV $316
endproc CG_PainEvent 12 16
lit
align 4
LABELV $477
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 112 48
line 496
;484:
;485:
;486:
;487:/*
;488:==============
;489:CG_EntityEvent
;490:
;491:An entity has an event value
;492:also called by CG_CheckPlayerstateEvents
;493:==============
;494:*/
;495:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;496:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 504
;497:	entityState_t	*es;
;498:	int				event;
;499:	vec3_t			dir;
;500:	const char		*s;
;501:	int				clientNum;
;502:	clientInfo_t	*ci;
;503:	
;504:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 505
;505:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 507
;506:
;507:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $332
line 508
;508:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $335
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
line 509
;509:	}
LABELV $332
line 511
;510:
;511:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $336
line 512
;512:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $331
ADDRGP4 $341
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 513
;513:		return;
ADDRGP4 $331
JUMPV
LABELV $336
line 516
;514:	}
;515:
;516:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 517
;517:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $344
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $342
LABELV $344
line 518
;518:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 519
;519:	}
LABELV $342
line 520
;520:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 522
;521:
;522:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $346
ADDRLP4 8
INDIRI4
CNSTI4 77
GTI4 $346
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1051-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1051
address $348
address $358
address $369
address $380
address $391
address $442
address $442
address $442
address $442
address $402
address $416
address $428
address $472
address $484
address $498
address $505
address $512
address $519
address $525
address $543
address $557
address $565
address $572
address $577
address $584
address $589
address $594
address $599
address $604
address $609
address $614
address $619
address $624
address $629
address $634
address $639
address $644
address $649
address $654
address $346
address $680
address $673
address $659
address $666
address $688
address $699
address $784
address $793
address $804
address $758
address $745
address $715
address $720
address $725
address $730
address $771
address $346
address $929
address $937
address $937
address $937
address $943
address $948
address $961
address $974
address $987
address $995
address $1003
address $1010
address $1017
address $710
address $1022
address $346
address $1029
address $1041
address $1036
address $489
code
LABELV $348
line 527
;523:	//
;524:	// movement generated events
;525:	//
;526:	case EV_FOOTSTEP:
;527:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $349
ADDRGP4 $352
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $349
line 528
;528:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $347
line 529
;529:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+154388+620
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 531
;530:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;531:		}
line 532
;532:		break;
ADDRGP4 $347
JUMPV
LABELV $358
line 534
;533:	case EV_FOOTSTEP_METAL:
;534:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $359
ADDRGP4 $362
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $359
line 535
;535:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $347
line 536
;536:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+154388+620+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 538
;537:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;538:		}
line 539
;539:		break;
ADDRGP4 $347
JUMPV
LABELV $369
line 541
;540:	case EV_FOOTSPLASH:
;541:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $370
ADDRGP4 $373
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $370
line 542
;542:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $347
line 543
;543:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+154388+620+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 545
;544:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;545:		}
line 546
;546:		break;
ADDRGP4 $347
JUMPV
LABELV $380
line 548
;547:	case EV_FOOTWADE:
;548:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $381
ADDRGP4 $384
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $381
line 549
;549:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $347
line 550
;550:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+154388+620+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 552
;551:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;552:		}
line 553
;553:		break;
ADDRGP4 $347
JUMPV
LABELV $391
line 555
;554:	case EV_SWIM:
;555:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $392
ADDRGP4 $395
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $392
line 556
;556:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $347
line 557
;557:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+154388+620+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 559
;558:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;559:		}
line 560
;560:		break;
ADDRGP4 $347
JUMPV
LABELV $402
line 564
;561:
;562:
;563:	case EV_FALL_SHORT:
;564:		DEBUGNAME("EV_FALL_SHORT");
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
line 565
;565:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+816
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 566
;566:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $347
line 568
;567:			// smooth landing z changes
;568:			cg.landChange = -8;
ADDRGP4 cg+110996
CNSTF4 3238002688
ASGNF4
line 569
;569:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 570
;570:		}
line 571
;571:		break;
ADDRGP4 $347
JUMPV
LABELV $416
line 573
;572:	case EV_FALL_MEDIUM:
;573:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $417
ADDRGP4 $420
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $417
line 575
;574:		// use normal pain sound
;575:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $329
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
line 576
;576:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $347
line 578
;577:			// smooth landing z changes
;578:			cg.landChange = -16;
ADDRGP4 cg+110996
CNSTF4 3246391296
ASGNF4
line 579
;579:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 580
;580:		}
line 581
;581:		break;
ADDRGP4 $347
JUMPV
LABELV $428
line 583
;582:	case EV_FALL_FAR:
;583:		DEBUGNAME("EV_FALL_FAR");
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
line 584
;584:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $433
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
line 585
;585:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 586
;586:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $347
line 588
;587:			// smooth landing z changes
;588:			cg.landChange = -24;
ADDRGP4 cg+110996
CNSTF4 3250585600
ASGNF4
line 589
;589:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 590
;590:		}
line 591
;591:		break;
ADDRGP4 $347
JUMPV
LABELV $442
line 597
;592:
;593:	case EV_STEP_4:
;594:	case EV_STEP_8:
;595:	case EV_STEP_12:
;596:	case EV_STEP_16:		// smooth out step up transitions
;597:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $443
ADDRGP4 $446
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $443
line 598
;598:	{
line 603
;599:		float	oldStep;
;600:		int		delta;
;601:		int		step;
;602:
;603:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $447
line 604
;604:			break;
ADDRGP4 $347
JUMPV
LABELV $447
line 607
;605:		}
;606:		// if we are interpolating, we don't need to smooth steps
;607:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $459
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $459
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $459
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $451
LABELV $459
line 608
;608:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 609
;609:			break;
ADDRGP4 $347
JUMPV
LABELV $451
line 612
;610:		}
;611:		// check for stepping up before a previous step is completed
;612:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 613
;613:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $462
line 614
;614:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 52
ADDRGP4 cg+110980
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
line 615
;615:		} else {
ADDRGP4 $463
JUMPV
LABELV $462
line 616
;616:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 617
;617:		}
LABELV $463
line 620
;618:
;619:		// add this amount
;620:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 621
;621:		cg.stepChange = oldStep + step;
ADDRGP4 cg+110980
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 622
;622:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+110980
INDIRF4
CNSTF4 1107296256
LEF4 $466
line 623
;623:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+110980
CNSTF4 1107296256
ASGNF4
line 624
;624:		}
LABELV $466
line 625
;625:		cg.stepTime = cg.time;
ADDRGP4 cg+110984
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 626
;626:		break;
ADDRGP4 $347
JUMPV
LABELV $472
line 630
;627:	}
;628:
;629:	case EV_JUMP_PAD:
;630:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $473
ADDRGP4 $476
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $473
line 632
;631://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;632:		{
line 634
;633:			localEntity_t	*smoke;
;634:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $477
INDIRB
ASGNB 12
line 637
;635:
;636:
;637:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 716
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
ADDRGP4 cg+109652
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+154388+288
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
line 644
;638:						  32, 
;639:						  1, 1, 1, 0.33f,
;640:						  1000, 
;641:						  cg.time, 0,
;642:						  LEF_PUFF_DONT_SCALE, 
;643:						  cgs.media.smokePuffShader );
;644:		}
line 647
;645:
;646:		// boing sound at origin, jump sound on player
;647:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+154388+824
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 648
;648:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $483
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
line 649
;649:		break;
ADDRGP4 $347
JUMPV
LABELV $484
line 652
;650:
;651:	case EV_JUMP:
;652:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $485
ADDRGP4 $488
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $485
line 653
;653:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $483
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
line 654
;654:		break;
ADDRGP4 $347
JUMPV
LABELV $489
line 656
;655:	case EV_TAUNT:
;656:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $490
ADDRGP4 $493
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $490
line 657
;657:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $494
line 658
;658:		{
line 660
;659:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;660:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $496
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
line 661
;661:		}
ADDRGP4 $347
JUMPV
LABELV $494
line 663
;662:		else
;663:		{
line 665
;664:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;665:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1736
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRGP4 $497
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
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
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 666
;666:		}
line 667
;667:		break;
ADDRGP4 $347
JUMPV
LABELV $498
line 695
;668:#ifdef MISSIONPACK
;669:	case EV_TAUNT_YES:
;670:		DEBUGNAME("EV_TAUNT_YES");
;671:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;672:		break;
;673:	case EV_TAUNT_NO:
;674:		DEBUGNAME("EV_TAUNT_NO");
;675:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;676:		break;
;677:	case EV_TAUNT_FOLLOWME:
;678:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;679:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;680:		break;
;681:	case EV_TAUNT_GETFLAG:
;682:		DEBUGNAME("EV_TAUNT_GETFLAG");
;683:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;684:		break;
;685:	case EV_TAUNT_GUARDBASE:
;686:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;687:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;688:		break;
;689:	case EV_TAUNT_PATROL:
;690:		DEBUGNAME("EV_TAUNT_PATROL");
;691:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;692:		break;
;693:#endif
;694:	case EV_WATER_TOUCH:
;695:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $499
ADDRGP4 $502
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $499
line 696
;696:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+928
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 697
;697:		break;
ADDRGP4 $347
JUMPV
LABELV $505
line 699
;698:	case EV_WATER_LEAVE:
;699:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $506
ADDRGP4 $509
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $506
line 700
;700:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+932
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 701
;701:		break;
ADDRGP4 $347
JUMPV
LABELV $512
line 703
;702:	case EV_WATER_UNDER:
;703:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $513
ADDRGP4 $516
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $513
line 704
;704:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+936
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 705
;705:		break;
ADDRGP4 $347
JUMPV
LABELV $519
line 707
;706:	case EV_WATER_CLEAR:
;707:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $520
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $520
line 708
;708:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $524
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
CNSTI4 0
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 709
;709:		break;
ADDRGP4 $347
JUMPV
LABELV $525
line 712
;710:
;711:	case EV_ITEM_PICKUP:
;712:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $526
ADDRGP4 $529
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $526
line 713
;713:		{
line 717
;714:			gitem_t	*item;
;715:			int		index;
;716:
;717:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 719
;718:
;719:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $532
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $530
LABELV $532
line 720
;720:				break;
ADDRGP4 $347
JUMPV
LABELV $530
line 722
;721:			}
;722:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 726
;723:
;724:			// powerups and team items will have a separate global sound, this one
;725:			// will be played at prediction time
;726:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 72
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 5
EQI4 $535
ADDRLP4 72
INDIRI4
CNSTI4 8
NEI4 $533
LABELV $535
line 727
;727:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+1088
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 728
;728:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $534
JUMPV
LABELV $533
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $538
line 745
;729:#ifdef MISSIONPACK
;730:				switch (item->giTag ) {
;731:					case PW_SCOUT:
;732:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;733:					break;
;734:					case PW_GUARD:
;735:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;736:					break;
;737:					case PW_DOUBLER:
;738:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;739:					break;
;740:					case PW_AMMOREGEN:
;741:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;742:					break;
;743:				}
;744:#endif
;745:			} else {
ADDRGP4 $539
JUMPV
LABELV $538
line 746
;746:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 64
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
ADDRLP4 0
INDIRP4
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
line 747
;747:			}
LABELV $539
LABELV $534
line 750
;748:
;749:			// show icon and name on status bar
;750:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $347
line 751
;751:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 752
;752:			}
line 753
;753:		}
line 754
;754:		break;
ADDRGP4 $347
JUMPV
LABELV $543
line 757
;755:
;756:	case EV_GLOBAL_ITEM_PICKUP:
;757:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $544
ADDRGP4 $547
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $544
line 758
;758:		{
line 762
;759:			gitem_t	*item;
;760:			int		index;
;761:
;762:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 764
;763:
;764:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $550
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $548
LABELV $550
line 765
;765:				break;
ADDRGP4 $347
JUMPV
LABELV $548
line 767
;766:			}
;767:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 769
;768:			// powerup pickups are global
;769:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $551
line 770
;770:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
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
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 771
;771:			}
LABELV $551
line 774
;772:
;773:			// show icon and name on status bar
;774:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $347
line 775
;775:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 776
;776:			}
line 777
;777:		}
line 778
;778:		break;
ADDRGP4 $347
JUMPV
LABELV $557
line 784
;779:
;780:	//
;781:	// weapon events
;782:	//
;783:	case EV_NOAMMO:
;784:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $558
ADDRGP4 $561
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $558
line 786
;785://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;786:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $347
line 787
;787:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 788
;788:		}
line 789
;789:		break;
ADDRGP4 $347
JUMPV
LABELV $565
line 791
;790:	case EV_CHANGE_WEAPON:
;791:		DEBUGNAME("EV_CHANGE_WEAPON");
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
line 792
;792:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+608
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 793
;793:		break;
ADDRGP4 $347
JUMPV
LABELV $572
line 795
;794:	case EV_FIRE_WEAPON:
;795:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $573
ADDRGP4 $576
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $573
line 796
;796:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 797
;797:		break;
ADDRGP4 $347
JUMPV
LABELV $577
line 800
;798:
;799:	case EV_FIRE_WEAPON2: 
;800:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $578
ADDRGP4 $581
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $578
line 801
;801:		 if (es->weapon == WP_RAILGUN)
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $582
line 802
;802:		 {
line 806
;803:			//CG_DoZoom_f();  // Zoom goes here.  Not quite sure how to do this?
;804:			//CG_ZoomDown_f();
;805:			
;806:		 } 		
ADDRGP4 $347
JUMPV
LABELV $582
line 808
;807:		 else
;808:		 {
line 809
;809:			CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 810
;810:		 }
line 811
;811:		 break;
ADDRGP4 $347
JUMPV
LABELV $584
line 814
;812:
;813:	case EV_USE_ITEM0:
;814:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $585
ADDRGP4 $588
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $585
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
ADDRGP4 $347
JUMPV
LABELV $589
line 818
;817:	case EV_USE_ITEM1:
;818:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $590
ADDRGP4 $593
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $590
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
ADDRGP4 $347
JUMPV
LABELV $594
line 822
;821:	case EV_USE_ITEM2:
;822:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $595
ADDRGP4 $598
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $595
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
ADDRGP4 $347
JUMPV
LABELV $599
line 826
;825:	case EV_USE_ITEM3:
;826:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $600
ADDRGP4 $603
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $600
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
ADDRGP4 $347
JUMPV
LABELV $604
line 830
;829:	case EV_USE_ITEM4:
;830:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $605
ADDRGP4 $608
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $605
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
ADDRGP4 $347
JUMPV
LABELV $609
line 834
;833:	case EV_USE_ITEM5:
;834:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $610
ADDRGP4 $613
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $610
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
ADDRGP4 $347
JUMPV
LABELV $614
line 838
;837:	case EV_USE_ITEM6:
;838:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $615
ADDRGP4 $618
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $615
line 839
;839:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 840
;840:		break;
ADDRGP4 $347
JUMPV
LABELV $619
line 842
;841:	case EV_USE_ITEM7:
;842:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $620
ADDRGP4 $623
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $620
line 843
;843:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 844
;844:		break;
ADDRGP4 $347
JUMPV
LABELV $624
line 846
;845:	case EV_USE_ITEM8:
;846:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $625
ADDRGP4 $628
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $625
line 847
;847:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 848
;848:		break;
ADDRGP4 $347
JUMPV
LABELV $629
line 850
;849:	case EV_USE_ITEM9:
;850:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $630
ADDRGP4 $633
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $630
line 851
;851:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 852
;852:		break;
ADDRGP4 $347
JUMPV
LABELV $634
line 854
;853:	case EV_USE_ITEM10:
;854:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $635
ADDRGP4 $638
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $635
line 855
;855:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 856
;856:		break;
ADDRGP4 $347
JUMPV
LABELV $639
line 858
;857:	case EV_USE_ITEM11:
;858:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $640
ADDRGP4 $643
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $640
line 859
;859:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 860
;860:		break;
ADDRGP4 $347
JUMPV
LABELV $644
line 862
;861:	case EV_USE_ITEM12:
;862:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $645
ADDRGP4 $648
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $645
line 863
;863:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 864
;864:		break;
ADDRGP4 $347
JUMPV
LABELV $649
line 866
;865:	case EV_USE_ITEM13:
;866:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $650
ADDRGP4 $653
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $650
line 867
;867:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 868
;868:		break;
ADDRGP4 $347
JUMPV
LABELV $654
line 870
;869:	case EV_USE_ITEM14:
;870:		DEBUGNAME("EV_USE_ITEM14");
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
line 871
;871:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 872
;872:		break;
ADDRGP4 $347
JUMPV
LABELV $659
line 880
;873:
;874:	//=================================================================
;875:
;876:	//
;877:	// other events
;878:	//
;879:	case EV_PLAYER_TELEPORT_IN:
;880:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $660
ADDRGP4 $663
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $660
line 881
;881:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+796
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 882
;882:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 883
;883:		break;
ADDRGP4 $347
JUMPV
LABELV $666
line 886
;884:
;885:	case EV_PLAYER_TELEPORT_OUT:
;886:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $667
ADDRGP4 $670
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $667
line 887
;887:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+800
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 888
;888:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 889
;889:		break;
ADDRGP4 $347
JUMPV
LABELV $673
line 892
;890:
;891:	case EV_ITEM_POP:
;892:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $674
ADDRGP4 $677
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $674
line 893
;893:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+808
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 894
;894:		break;
ADDRGP4 $347
JUMPV
LABELV $680
line 896
;895:	case EV_ITEM_RESPAWN:
;896:		DEBUGNAME("EV_ITEM_RESPAWN");
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
line 897
;897:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 898
;898:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+808
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 899
;899:		break;
ADDRGP4 $347
JUMPV
LABELV $688
line 902
;900:
;901:	case EV_GRENADE_BOUNCE:
;902:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $689
ADDRGP4 $692
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $689
line 903
;903:		if ( rand() & 1 ) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $693
line 904
;904:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+1092
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 905
;905:		} else {
ADDRGP4 $347
JUMPV
LABELV $693
line 906
;906:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+1096
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 907
;907:		}
line 908
;908:		break;
ADDRGP4 $347
JUMPV
LABELV $699
line 911
;909:
;910:	case EV_PL_BOUNCE:
;911:		DEBUGNAME("EV_PL_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $700
ADDRGP4 $703
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $700
line 912
;912:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $704
line 913
;913:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+1132
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 914
;914:		} else {
ADDRGP4 $347
JUMPV
LABELV $704
line 915
;915:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+154388+1136
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 916
;916:		}
line 917
;917:		break;
ADDRGP4 $347
JUMPV
LABELV $710
line 961
;918:
;919:#ifdef MISSIONPACK
;920:	case EV_PROXIMITY_MINE_STICK:
;921:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;922:		if( es->eventParm & SURF_FLESH ) {
;923:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;924:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;925:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;926:		} else {
;927:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;928:		}
;929:		break;
;930:
;931:	case EV_PROXIMITY_MINE_TRIGGER:
;932:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;933:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;934:		break;
;935:	case EV_KAMIKAZE:
;936:		DEBUGNAME("EV_KAMIKAZE");
;937:		CG_KamikazeEffect( cent->lerpOrigin );
;938:		break;
;939:	case EV_OBELISKEXPLODE:
;940:		DEBUGNAME("EV_OBELISKEXPLODE");
;941:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;942:		break;
;943:	case EV_OBELISKPAIN:
;944:		DEBUGNAME("EV_OBELISKPAIN");
;945:		CG_ObeliskPain( cent->lerpOrigin );
;946:		break;
;947:	case EV_INVUL_IMPACT:
;948:		DEBUGNAME("EV_INVUL_IMPACT");
;949:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;950:		break;
;951:	case EV_JUICED:
;952:		DEBUGNAME("EV_JUICED");
;953:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;954:		break;
;955:	case EV_LIGHTNINGBOLT:
;956:		DEBUGNAME("EV_LIGHTNINGBOLT");
;957:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;958:		break;
;959:#endif
;960:	case EV_SCOREPLUM:
;961:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $711
ADDRGP4 $714
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $711
line 962
;962:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
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
CNSTI4 716
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
line 963
;963:		break;
ADDRGP4 $347
JUMPV
LABELV $715
line 969
;964:
;965:	//
;966:	// missile impacts
;967:	//
;968:	case EV_MISSILE_HIT:
;969:		DEBUGNAME("EV_MISSILE_HIT");
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
line 970
;970:		ByteToDir( es->eventParm, dir );
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
line 971
;971:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 972
;972:		break;
ADDRGP4 $347
JUMPV
LABELV $720
line 975
;973:
;974:	case EV_MISSILE_MISS:
;975:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $721
ADDRGP4 $724
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $721
line 976
;976:		ByteToDir( es->eventParm, dir );
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
;977:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRFP4 0
INDIRP4
ARGP4
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
line 978
;978:		break;
ADDRGP4 $347
JUMPV
LABELV $725
line 981
;979:
;980:	case EV_MISSILE_MISS_METAL:
;981:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $726
ADDRGP4 $729
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $726
line 982
;982:		ByteToDir( es->eventParm, dir );
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
line 983
;983:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_METAL );
ADDRFP4 0
INDIRP4
ARGP4
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
line 984
;984:		break;
ADDRGP4 $347
JUMPV
LABELV $730
line 987
;985:
;986:	case EV_RAILTRAIL:
;987:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $731
ADDRGP4 $734
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $731
line 988
;988:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 991
;989://unlagged - attack prediction #2
;990:		// if the client is us, unlagged is on server-side, and we've got it client-side
;991:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $735
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $735
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $742
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $735
LABELV $742
line 992
;992:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 995
;993:			// do nothing, because it was already predicted
;994:			//Com_Printf("Ignoring rail trail event\n");
;995:		}
ADDRGP4 $347
JUMPV
LABELV $735
line 996
;996:		else {
line 998
;997:			// draw a rail trail, because it wasn't predicted
;998:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 1001
;999:
;1000:			// if the end was on a nomark surface, don't make an explosion
;1001:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $347
line 1002
;1002:				ByteToDir( es->eventParm, dir );
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
line 1003
;1003:				CG_MissileHitWall( cent, es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRFP4 0
INDIRP4
ARGP4
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
line 1004
;1004:			}
line 1006
;1005:			//Com_Printf("Non-predicted rail trail\n");
;1006:		}
line 1008
;1007://unlagged - attack prediction #2
;1008:		break;
ADDRGP4 $347
JUMPV
LABELV $745
line 1011
;1009:
;1010:	case EV_BULLET_HIT_WALL:
;1011:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $746
ADDRGP4 $749
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $746
line 1014
;1012://unlagged - attack prediction #2
;1013:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1014:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $750
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $750
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $757
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $750
LABELV $757
line 1015
;1015:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1018
;1016:			// do nothing, because it was already predicted
;1017:			//Com_Printf("Ignoring bullet event\n");
;1018:		}
ADDRGP4 $347
JUMPV
LABELV $750
line 1019
;1019:		else {
line 1021
;1020:			// do the bullet, because it wasn't predicted
;1021:			ByteToDir( es->eventParm, dir );
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
line 1022
;1022:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1024
;1023:			//Com_Printf("Non-predicted bullet\n");
;1024:		}
line 1026
;1025://unlagged - attack prediction #2
;1026:		break;
ADDRGP4 $347
JUMPV
LABELV $758
line 1029
;1027:
;1028:	case EV_BULLET_HIT_FLESH:
;1029:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $759
ADDRGP4 $762
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $759
line 1032
;1030://unlagged - attack prediction #2
;1031:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1032:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $763
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $763
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $770
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $763
LABELV $770
line 1033
;1033:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1036
;1034:			// do nothing, because it was already predicted
;1035:			//Com_Printf("Ignoring bullet event\n");
;1036:		}
ADDRGP4 $347
JUMPV
LABELV $763
line 1037
;1037:		else {
line 1039
;1038:			// do the bullet, because it wasn't predicted
;1039:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1041
;1040:			//Com_Printf("Non-predicted bullet\n");
;1041:		}
line 1043
;1042://unlagged - attack prediction #2
;1043:		break;
ADDRGP4 $347
JUMPV
LABELV $771
line 1046
;1044:
;1045:	case EV_SHOTGUN:
;1046:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $772
ADDRGP4 $775
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $772
line 1049
;1047://unlagged - attack prediction #2
;1048:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1049:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $776
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $776
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $783
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $776
LABELV $783
line 1050
;1050:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1053
;1051:			// do nothing, because it was already predicted
;1052:			//Com_Printf("Ignoring shotgun event\n");
;1053:		}
ADDRGP4 $347
JUMPV
LABELV $776
line 1054
;1054:		else {
line 1056
;1055:			// do the shotgun pattern, because it wasn't predicted
;1056:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1058
;1057:			//Com_Printf("Non-predicted shotgun pattern\n");
;1058:		}
line 1060
;1059://unlagged - attack prediction #2
;1060:		break;
ADDRGP4 $347
JUMPV
LABELV $784
line 1063
;1061:
;1062:	case EV_GENERAL_SOUND:
;1063:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $785
ADDRGP4 $788
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $785
line 1064
;1064:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $789
line 1065
;1065:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1066
;1066:		} else {
ADDRGP4 $347
JUMPV
LABELV $789
line 1067
;1067:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1068
;1068:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
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
line 1069
;1069:		}
line 1070
;1070:		break;
ADDRGP4 $347
JUMPV
LABELV $793
line 1073
;1071:
;1072:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1073:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $794
ADDRGP4 $797
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $794
line 1074
;1074:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $798
line 1075
;1075:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
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
line 1076
;1076:		} else {
ADDRGP4 $347
JUMPV
LABELV $798
line 1077
;1077:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1078
;1078:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
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
line 1079
;1079:		}
line 1080
;1080:		break;
ADDRGP4 $347
JUMPV
LABELV $804
line 1083
;1081:
;1082:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1083:		{
line 1084
;1084:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $805
ADDRGP4 $808
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $805
line 1085
;1085:			switch( es->eventParm ) {
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
LTI4 $347
ADDRLP4 96
INDIRI4
CNSTI4 13
GTI4 $347
ADDRLP4 96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $928
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $928
address $812
address $822
address $832
address $844
address $856
address $876
address $896
address $904
address $912
address $915
address $918
address $921
address $924
address $347
code
LABELV $812
line 1087
;1086:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1087:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $813
line 1088
;1088:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+154388+976
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $347
JUMPV
LABELV $813
line 1090
;1089:					else
;1090:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+154388+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1091
;1091:					break;
ADDRGP4 $347
JUMPV
LABELV $822
line 1093
;1092:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1093:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $823
line 1094
;1094:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+154388+976
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $347
JUMPV
LABELV $823
line 1096
;1095:					else
;1096:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+154388+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1097
;1097:					break;
ADDRGP4 $347
JUMPV
LABELV $832
line 1099
;1098:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1099:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $833
line 1100
;1100:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+154388+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $834
JUMPV
LABELV $833
line 1102
;1101:					else
;1102:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+154388+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $834
line 1104
;1103:					//
;1104:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+154388+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1105
;1105:					break;
ADDRGP4 $347
JUMPV
LABELV $844
line 1107
;1106:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1107:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $845
line 1108
;1108:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+154388+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $846
JUMPV
LABELV $845
line 1110
;1109:					else
;1110:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+154388+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $846
line 1112
;1111:					//
;1112:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+154388+1000
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1113
;1113:					break;
ADDRGP4 $347
JUMPV
LABELV $856
line 1117
;1114:
;1115:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1116:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1117:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $861
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $857
LABELV $861
line 1118
;1118:					}
ADDRGP4 $347
JUMPV
LABELV $857
line 1119
;1119:					else {
line 1120
;1120:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $862
line 1126
;1121:#ifdef MISSIONPACK
;1122:							if (cgs.gametype == GT_1FCTF) 
;1123:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1124:							else
;1125:#endif
;1126:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+154388+1012
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1127
;1127:						}
ADDRGP4 $347
JUMPV
LABELV $862
line 1128
;1128:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $347
line 1134
;1129:#ifdef MISSIONPACK
;1130:							if (cgs.gametype == GT_1FCTF)
;1131:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1132:							else
;1133:#endif
;1134: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+154388+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1135
;1135:						}
line 1136
;1136:					}
line 1137
;1137:					break;
ADDRGP4 $347
JUMPV
LABELV $876
line 1140
;1138:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1139:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1140:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $881
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $877
LABELV $881
line 1141
;1141:					}
ADDRGP4 $347
JUMPV
LABELV $877
line 1142
;1142:					else {
line 1143
;1143:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $882
line 1149
;1144:#ifdef MISSIONPACK
;1145:							if (cgs.gametype == GT_1FCTF)
;1146:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1147:							else
;1148:#endif
;1149:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+154388+1012
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1150
;1150:						}
ADDRGP4 $347
JUMPV
LABELV $882
line 1151
;1151:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $347
line 1157
;1152:#ifdef MISSIONPACK
;1153:							if (cgs.gametype == GT_1FCTF)
;1154:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1155:							else
;1156:#endif
;1157:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+154388+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1158
;1158:						}
line 1159
;1159:					}
line 1160
;1160:					break;
ADDRGP4 $347
JUMPV
LABELV $896
line 1162
;1161:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1162:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $347
line 1163
;1163:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+154388+1032
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1164
;1164:					}
line 1165
;1165:					break;
ADDRGP4 $347
JUMPV
LABELV $904
line 1167
;1166:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1167:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $347
line 1168
;1168:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+154388+1032
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1169
;1169:					}
line 1170
;1170:					break;
ADDRGP4 $347
JUMPV
LABELV $912
line 1173
;1171:
;1172:				case GTS_REDTEAM_SCORED:
;1173:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+154388+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1174
;1174:					break;
ADDRGP4 $347
JUMPV
LABELV $915
line 1176
;1175:				case GTS_BLUETEAM_SCORED:
;1176:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+154388+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1177
;1177:					break;
ADDRGP4 $347
JUMPV
LABELV $918
line 1179
;1178:				case GTS_REDTEAM_TOOK_LEAD:
;1179:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+154388+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1180
;1180:					break;
ADDRGP4 $347
JUMPV
LABELV $921
line 1182
;1181:				case GTS_BLUETEAM_TOOK_LEAD:
;1182:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+154388+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1183
;1183:					break;
ADDRGP4 $347
JUMPV
LABELV $924
line 1185
;1184:				case GTS_TEAMS_ARE_TIED:
;1185:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+154388+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1186
;1186:					break;
line 1189
;1187:				case GTS_KAMIKAZE:
;1188:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1189:					break;
line 1192
;1190:
;1191:				default:
;1192:					break;
line 1194
;1193:			}
;1194:			break;
ADDRGP4 $347
JUMPV
LABELV $929
line 1200
;1195:		}
;1196:
;1197:	case EV_PAIN:
;1198:		// local player sounds are triggered in CG_CheckLocalSounds,
;1199:		// so ignore events on the player
;1200:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $930
ADDRGP4 $933
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $930
line 1201
;1201:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $347
line 1202
;1202:			CG_PainEvent( cent, es->eventParm );
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
line 1203
;1203:		}
line 1204
;1204:		break;
ADDRGP4 $347
JUMPV
LABELV $937
line 1209
;1205:
;1206:	case EV_DEATH1:
;1207:	case EV_DEATH2:
;1208:	case EV_DEATH3:
;1209:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $938
ADDRGP4 $941
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $938
line 1210
;1210:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $942
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 59
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
line 1212
;1211:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1212:		break;
ADDRGP4 $347
JUMPV
LABELV $943
line 1216
;1213:
;1214:
;1215:	case EV_OBITUARY:
;1216:		DEBUGNAME("EV_OBITUARY");
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
line 1217
;1217:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1218
;1218:		break;
ADDRGP4 $347
JUMPV
LABELV $948
line 1224
;1219:
;1220:	//
;1221:	// powerup events
;1222:	//
;1223:	case EV_POWERUP_QUAD:
;1224:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $949
ADDRGP4 $952
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $949
line 1225
;1225:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $953
line 1226
;1226:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+126476
CNSTI4 1
ASGNI4
line 1227
;1227:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1228
;1228:		}
LABELV $953
line 1229
;1229:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+154388+600
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1230
;1230:		break;
ADDRGP4 $347
JUMPV
LABELV $961
line 1232
;1231:	case EV_POWERUP_BATTLESUIT:
;1232:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $962
ADDRGP4 $965
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $962
line 1233
;1233:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $966
line 1234
;1234:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+126476
CNSTI4 2
ASGNI4
line 1235
;1235:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1236
;1236:		}
LABELV $966
line 1237
;1237:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+154388+1084
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1238
;1238:		break;
ADDRGP4 $347
JUMPV
LABELV $974
line 1240
;1239:	case EV_POWERUP_REGEN:
;1240:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $975
ADDRGP4 $978
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $975
line 1241
;1241:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $979
line 1242
;1242:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+126476
CNSTI4 5
ASGNI4
line 1243
;1243:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1244
;1244:		}
LABELV $979
line 1245
;1245:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+154388+1080
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1246
;1246:		break;
ADDRGP4 $347
JUMPV
LABELV $987
line 1249
;1247:
;1248:	case EV_IMMOBILIZED:
;1249:		DEBUGNAME("EV_IMMOBILIZED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $988
ADDRGP4 $991
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $988
line 1250
;1250:		if ( es->number == cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $347
line 1251
;1251:		{ //-Vincent
line 1252
;1252:		ci->cgimmobilized = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1253
;1253:		}
line 1254
;1254:		break;
ADDRGP4 $347
JUMPV
LABELV $995
line 1257
;1255:
;1256:	case EV_IMMOBILIZED_FREE:
;1257:		DEBUGNAME("EV_IMMOBILIZED_FREE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $996
ADDRGP4 $999
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $996
line 1258
;1258:		if ( es->number == cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $347
line 1259
;1259:		{ //-Vincent
line 1260
;1260:		ci->cgimmobilized = qfalse;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1261
;1261:		}
line 1262
;1262:		break;
ADDRGP4 $347
JUMPV
LABELV $1003
line 1265
;1263:
;1264:	case EV_GIB_PLAYER:
;1265:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1004
ADDRGP4 $1007
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1004
line 1272
;1266:		// don't play gib sound when using the kamikaze because it interferes
;1267:		// with the kamikaze sound, downside is that the gib sound will also
;1268:		// not be played when someone is gibbed while just carrying the kamikaze
;1269:		
;1270:		// We've used this bit
;1271:		//if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1272:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+154388+772
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1275
;1273:		//}
;1274:		
;1275:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1276
;1276:		break;
ADDRGP4 $347
JUMPV
LABELV $1010
line 1280
;1277:
;1278:	// Shafe - Trep - Headshot stuff
;1279:	case EV_GIB_PLAYER_HEADSHOT:
;1280:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1011
ADDRGP4 $1014
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1011
line 1281
;1281:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+154388+772
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1282
;1282:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1283
;1283:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1284
;1284:		break;
ADDRGP4 $347
JUMPV
LABELV $1017
line 1287
;1285:
;1286:	case EV_BODY_NOHEAD:
;1287:		DEBUGNAME("EV_BODY_NOHEAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1018
ADDRGP4 $1021
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1018
line 1288
;1288:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1289
;1289:		break;
ADDRGP4 $347
JUMPV
LABELV $1022
line 1292
;1290:	// Shafe - Trep - End Headshot Stuff
;1291:	case EV_BREAK_GLASS:
;1292: 		DEBUGNAME("EV_BREAK_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1023
ADDRGP4 $1026
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1023
line 1294
;1293: 		// Change cgs.media.gibSound to whatever sound you want it to use
;1294:  		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.glassSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+154388+788
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1295
;1295: 		CG_BreakGlass( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_BreakGlass
CALLV
pop
line 1296
;1296: 		break;
ADDRGP4 $347
JUMPV
LABELV $1029
line 1298
;1297:	case EV_ERROR:
;1298: 		DEBUGNAME("EV_ERROR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1030
ADDRGP4 $1033
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1030
line 1299
;1299: 		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.errorSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+154388+792
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1300
;1300: 		break;
ADDRGP4 $347
JUMPV
LABELV $1036
line 1302
;1301:	case EV_STOPLOOPINGSOUND:
;1302:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1037
ADDRGP4 $1040
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1037
line 1303
;1303:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1304
;1304:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1305
;1305:		break;
ADDRGP4 $347
JUMPV
LABELV $1041
line 1308
;1306:
;1307:	case EV_DEBUG_LINE:
;1308:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1042
ADDRGP4 $1045
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1042
line 1309
;1309:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1310
;1310:		break;
ADDRGP4 $347
JUMPV
LABELV $346
line 1313
;1311:
;1312:	default:
;1313:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1046
ADDRGP4 $1049
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1046
line 1314
;1314:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1050
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1315
;1315:		break;
LABELV $347
line 1318
;1316:	}
;1317:
;1318:}
LABELV $331
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1327
;1319:
;1320:
;1321:/*
;1322:==============
;1323:CG_CheckEvents
;1324:
;1325:==============
;1326:*/
;1327:void CG_CheckEvents( centity_t *cent ) {
line 1329
;1328:	// check for event-only entities
;1329:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1054
line 1330
;1330:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1056
line 1331
;1331:			return;	// already fired
ADDRGP4 $1053
JUMPV
LABELV $1056
line 1334
;1332:		}
;1333:		// if this is a player event set the entity number of the client entity number
;1334:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1058
line 1335
;1335:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1336
;1336:		}
LABELV $1058
line 1338
;1337:
;1338:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 1340
;1339:
;1340:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
CNSTI4 14
SUBI4
ASGNI4
line 1341
;1341:	} else {
ADDRGP4 $1055
JUMPV
LABELV $1054
line 1343
;1342:		// check for events riding with another entity
;1343:		if ( cent->currentState.event == cent->previousEvent ) {
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
CNSTI4 436
ADDP4
INDIRI4
NEI4 $1060
line 1344
;1344:			return;
ADDRGP4 $1053
JUMPV
LABELV $1060
line 1346
;1345:		}
;1346:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1347
;1347:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1062
line 1348
;1348:			return;
ADDRGP4 $1053
JUMPV
LABELV $1062
line 1350
;1349:		}
;1350:	}
LABELV $1055
line 1353
;1351:
;1352:	// calculate the position at exactly the frame time
;1353:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1354
;1354:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1356
;1355:
;1356:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1357
;1357:}
LABELV $1053
endproc CG_CheckEvents 8 12
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
import CG_PlayerSprites
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
LABELV $1050
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
LABELV $1049
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
LABELV $1045
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
LABELV $1040
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
LABELV $1033
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $1026
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 82
byte 1 69
byte 1 65
byte 1 75
byte 1 95
byte 1 71
byte 1 76
byte 1 65
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $1021
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
LABELV $1014
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
LABELV $1007
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
LABELV $999
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 77
byte 1 77
byte 1 79
byte 1 66
byte 1 73
byte 1 76
byte 1 73
byte 1 90
byte 1 69
byte 1 68
byte 1 95
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $991
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 77
byte 1 77
byte 1 79
byte 1 66
byte 1 73
byte 1 76
byte 1 73
byte 1 90
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $978
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
LABELV $965
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
LABELV $952
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
LABELV $947
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
LABELV $942
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
LABELV $941
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
LABELV $933
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
LABELV $808
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
LABELV $797
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
LABELV $788
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
LABELV $775
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
LABELV $762
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
LABELV $749
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
LABELV $734
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
LABELV $729
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
LABELV $724
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
LABELV $719
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
LABELV $714
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
LABELV $703
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
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
LABELV $692
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
LABELV $684
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
LABELV $677
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
LABELV $670
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
LABELV $663
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
LABELV $658
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
LABELV $653
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
LABELV $648
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
LABELV $643
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
LABELV $638
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
LABELV $633
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
LABELV $628
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
LABELV $623
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
LABELV $618
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
LABELV $613
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
LABELV $608
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
LABELV $603
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
LABELV $598
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
LABELV $593
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
LABELV $588
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
LABELV $581
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
LABELV $576
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
LABELV $569
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
LABELV $561
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
LABELV $547
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
LABELV $529
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
LABELV $524
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
LABELV $523
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
LABELV $516
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
LABELV $509
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
LABELV $502
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
LABELV $497
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 37
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $496
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
LABELV $493
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
LABELV $488
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
LABELV $483
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
LABELV $476
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
LABELV $446
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
LABELV $433
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
LABELV $432
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
LABELV $420
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
LABELV $406
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
LABELV $395
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
LABELV $384
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
LABELV $373
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
LABELV $362
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
LABELV $352
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
LABELV $341
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
LABELV $335
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
LABELV $329
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
LABELV $328
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
LABELV $325
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
LABELV $322
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
LABELV $285
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $284
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
LABELV $274
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
LABELV $273
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
LABELV $268
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
LABELV $267
byte 1 39
byte 1 115
byte 1 32
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $266
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 0
align 1
LABELV $264
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
LABELV $263
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
LABELV $261
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
LABELV $260
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
LABELV $258
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 97
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 0
align 1
LABELV $256
byte 1 39
byte 1 115
byte 1 32
byte 1 68
byte 1 101
byte 1 118
byte 1 97
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $255
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 97
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $253
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
LABELV $251
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 103
byte 1 97
byte 1 117
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $249
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $248
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $246
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $245
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 108
byte 1 105
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $243
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
LABELV $241
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $240
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $238
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
LABELV $237
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
LABELV $235
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
LABELV $234
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $232
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
LABELV $230
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $228
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
LABELV $226
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
LABELV $215
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $212
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
LABELV $209
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
LABELV $205
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
LABELV $202
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
LABELV $193
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $188
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
LABELV $187
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
LABELV $184
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
LABELV $181
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
LABELV $180
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
LABELV $177
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
LABELV $173
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
LABELV $171
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
LABELV $170
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
LABELV $167
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
LABELV $163
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
LABELV $162
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
LABELV $159
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
LABELV $155
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
LABELV $154
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
LABELV $151
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
LABELV $141
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $139
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
LABELV $137
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
LABELV $135
byte 1 119
byte 1 97
byte 1 115
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
byte 1 0
align 1
LABELV $133
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
LABELV $131
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $129
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
LABELV $127
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
LABELV $125
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
LABELV $123
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
LABELV $119
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $118
byte 1 110
byte 1 0
align 1
LABELV $111
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
LABELV $106
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $104
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $101
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $92
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $89
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $86
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $83
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $80
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $77
byte 1 0
align 1
LABELV $76
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
