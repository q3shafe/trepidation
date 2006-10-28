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
CNSTI4 1732
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
ADDRGP4 $140-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $140
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
address $120
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
LABELV $120
line 133
;132:	default:
;133:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 134
;134:		break;
LABELV $121
line 137
;135:	}
;136:
;137:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $142
line 138
;138:		gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 139
;139:		switch (mod) {
ADDRLP4 124
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $170
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
GTI4 $188
LABELV $187
ADDRLP4 44
INDIRI4
CNSTI4 5
EQI4 $146
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $154
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $162
ADDRGP4 $144
JUMPV
LABELV $188
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $172
ADDRGP4 $144
JUMPV
LABELV $146
line 146
;140:#ifdef MISSIONPACK
;141:		case MOD_KAMIKAZE:
;142:			message = "goes out with a bang";
;143:			break;
;144:#endif
;145:		case MOD_GRENADE_SPLASH:
;146:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $147
line 147
;147:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $149
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $147
line 148
;148:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $150
line 149
;149:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $152
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $150
line 151
;150:			else
;151:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $153
ASGNP4
line 152
;152:			break;
ADDRGP4 $145
JUMPV
LABELV $154
line 154
;153:		case MOD_ROCKET_SPLASH:
;154:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $155
line 155
;155:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $157
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $155
line 156
;156:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $158
line 157
;157:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $160
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $158
line 159
;158:			else
;159:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $161
ASGNP4
line 160
;160:			break;
ADDRGP4 $145
JUMPV
LABELV $162
line 162
;161:		case MOD_PLASMA_SPLASH:
;162:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $163
line 163
;163:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $165
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $163
line 164
;164:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $166
line 165
;165:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $168
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $166
line 167
;166:			else
;167:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $169
ASGNP4
line 168
;168:			break;
ADDRGP4 $145
JUMPV
LABELV $170
line 170
;169:		case MOD_BFG_SPLASH:
;170:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
line 171
;171:			break;
ADDRGP4 $145
JUMPV
LABELV $172
line 173
;172:		case MOD_HEADSHOT:									// Shafe - Headshots
;173:			gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 174
;174:			if(gender==GENDER_FEMALE)
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $173
line 175
;175:			{
line 176
;176:				message = "got her head blown off by";
ADDRLP4 40
ADDRGP4 $175
ASGNP4
line 177
;177:			}
ADDRGP4 $145
JUMPV
LABELV $173
line 179
;178:			else
;179:			{
line 180
;180:				if(gender==GENDER_NEUTER)
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $176
line 181
;181:					message = "got its head blown off by";
ADDRLP4 40
ADDRGP4 $178
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $176
line 183
;182:				else
;183:					message = "got his head blown off by";
ADDRLP4 40
ADDRGP4 $179
ASGNP4
line 184
;184:			}
line 185
;185:			break;											
ADDRGP4 $145
JUMPV
LABELV $144
line 198
;186:#ifdef MISSIONPACK
;187:		case MOD_PROXIMITY_MINE:
;188:			if( gender == GENDER_FEMALE ) {
;189:				message = "found her prox mine";
;190:			} else if ( gender == GENDER_NEUTER ) {
;191:				message = "found it's prox mine";
;192:			} else {
;193:				message = "found his prox mine";
;194:			}
;195:			break;
;196:#endif
;197:		default:
;198:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $180
line 199
;199:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $182
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $180
line 200
;200:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $183
line 201
;201:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $185
ASGNP4
ADDRGP4 $145
JUMPV
LABELV $183
line 203
;202:			else
;203:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $186
ASGNP4
line 204
;204:			break;
LABELV $145
line 206
;205:		}
;206:	}
LABELV $142
line 208
;207:
;208:	if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $189
line 209
;209:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $191
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 210
;210:		return;
ADDRGP4 $107
JUMPV
LABELV $189
line 214
;211:	}
;212:
;213:	// check for kill messages from the current clientNum
;214:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $192
line 217
;215:		char	*s;
;216:
;217:		if(mod != MOD_HEADSHOT) // Shafe - Trep - only for headshots
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $195
line 218
;218:		{						
line 219
;219:			if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $197
line 220
;220:					s = va("You fragged %s\n%s place with %i", targetName, 
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
ADDRGP4 $200
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
line 223
;221:					CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;222:					cg.snap->ps.persistant[PERS_SCORE] );
;223:			} else {
ADDRGP4 $196
JUMPV
LABELV $197
line 224
;224:				s = va("You fragged %s", targetName );
ADDRGP4 $203
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
line 225
;225:			}
line 226
;226:		}
ADDRGP4 $196
JUMPV
LABELV $195
line 228
;227:		else										// Shafe - Trep Else for headshot
;228:		{
line 230
;229:
;230:			if ( cgs.gametype < GT_TEAM ) 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $204
line 231
;231:			{
line 232
;232:				s = va("Headshot!\n\nYou fragged %s\n%s place with %i", targetName, 
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
ADDRGP4 $207
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
line 235
;233:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;234:				cg.snap->ps.persistant[PERS_SCORE] );
;235:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $210
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
line 236
;236:			} else {
ADDRGP4 $205
JUMPV
LABELV $204
line 237
;237:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $210
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
line 238
;238:			}	
LABELV $205
line 241
;239:			
;240:	
;241:		}
LABELV $196
line 247
;242:#ifdef MISSIONPACK
;243:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;244:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;245:		} 
;246:#else
;247:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
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
line 251
;248:#endif
;249:
;250:		// print the text message as well
;251:	}
LABELV $192
line 254
;252:
;253:	// check for double client messages
;254:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $211
line 255
;255:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 256
;256:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $213
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 257
;257:	} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 258
;258:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
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
line 259
;259:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 261
;260:		// check for kill messages about the current clientNum
;261:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $214
line 262
;262:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+116400
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 263
;263:		}
LABELV $214
line 264
;264:	}
LABELV $212
line 266
;265:
;266:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $219
line 267
;267:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $221
ADDRLP4 44
INDIRI4
CNSTI4 26
GTI4 $221
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $267-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $267
address $229
address $225
address $227
address $231
address $234
address $237
address $240
address $242
address $245
address $248
address $250
address $252
address $255
address $221
address $221
address $221
address $221
address $257
address $221
address $221
address $221
address $221
address $221
address $263
address $223
address $260
code
LABELV $223
line 269
;268:		case MOD_GRAPPLE:
;269:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $224
ASGNP4
line 270
;270:			break;
ADDRGP4 $222
JUMPV
LABELV $225
line 272
;271:		case MOD_GAUNTLET:
;272:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $226
ASGNP4
line 273
;273:			break;
ADDRGP4 $222
JUMPV
LABELV $227
line 275
;274:		case MOD_MACHINEGUN:
;275:			message = "was assaulted by";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 276
;276:			break;
ADDRGP4 $222
JUMPV
LABELV $229
line 278
;277:		case MOD_SHOTGUN:
;278:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $230
ASGNP4
line 279
;279:			break;
ADDRGP4 $222
JUMPV
LABELV $231
line 281
;280:		case MOD_GRENADE:
;281:			message = "ate";
ADDRLP4 40
ADDRGP4 $232
ASGNP4
line 282
;282:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $233
ASGNP4
line 283
;283:			break;
ADDRGP4 $222
JUMPV
LABELV $234
line 285
;284:		case MOD_GRENADE_SPLASH:
;285:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $235
ASGNP4
line 286
;286:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $236
ASGNP4
line 287
;287:			break;
ADDRGP4 $222
JUMPV
LABELV $237
line 289
;288:		case MOD_ROCKET:
;289:			message = "was crushed by";
ADDRLP4 40
ADDRGP4 $238
ASGNP4
line 290
;290:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $239
ASGNP4
line 291
;291:			break;
ADDRGP4 $222
JUMPV
LABELV $240
line 293
;292:		case MOD_ROCKET_SPLASH:
;293:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $241
ASGNP4
line 294
;294:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $239
ASGNP4
line 295
;295:			break;
ADDRGP4 $222
JUMPV
LABELV $242
line 297
;296:		case MOD_PLASMA:
;297:			message = "was sliced to shreds by";
ADDRLP4 40
ADDRGP4 $243
ASGNP4
line 298
;298:			message2 = "'s gata gun";
ADDRLP4 88
ADDRGP4 $244
ASGNP4
line 299
;299:			break;
ADDRGP4 $222
JUMPV
LABELV $245
line 301
;300:		case MOD_PLASMA_SPLASH:
;301:			message = "was shreded by";
ADDRLP4 40
ADDRGP4 $246
ASGNP4
line 302
;302:			message2 = "'s gata fun";
ADDRLP4 88
ADDRGP4 $247
ASGNP4
line 303
;303:			break;
ADDRGP4 $222
JUMPV
LABELV $248
line 305
;304:		case MOD_RAILGUN:
;305:			message = "was degaussed by"; // Shafe - Trep - Reworded
ADDRLP4 40
ADDRGP4 $249
ASGNP4
line 306
;306:			break;
ADDRGP4 $222
JUMPV
LABELV $250
line 308
;307:		case MOD_LIGHTNING:
;308:			message = "was burnt by";
ADDRLP4 40
ADDRGP4 $251
ASGNP4
line 309
;309:			break;
ADDRGP4 $222
JUMPV
LABELV $252
line 311
;310:		case MOD_BFG:
;311:			message = "was annialated by";
ADDRLP4 40
ADDRGP4 $253
ASGNP4
line 312
;312:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $254
ASGNP4
line 313
;313:			break;
ADDRGP4 $222
JUMPV
LABELV $255
line 315
;314:		case MOD_BFG_SPLASH:
;315:			message = "was annialated by the fallout of";
ADDRLP4 40
ADDRGP4 $256
ASGNP4
line 316
;316:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $254
ASGNP4
line 317
;317:			break;
ADDRGP4 $222
JUMPV
LABELV $257
line 339
;318:#ifdef MISSIONPACK
;319:		case MOD_NAIL:
;320:			message = "was nailed by";
;321:			break;
;322:		case MOD_CHAINGUN:
;323:			message = "got lead poisoning from";
;324:			message2 = "'s Chaingun";
;325:			break;
;326:		case MOD_PROXIMITY_MINE:
;327:			message = "was too close to";
;328:			message2 = "'s Prox Mine";
;329:			break;
;330:		case MOD_KAMIKAZE:
;331:			message = "falls to";
;332:			message2 = "'s Kamikaze blast";
;333:			break;
;334:		case MOD_JUICED:
;335:			message = "was juiced by";
;336:			break;
;337:#endif
;338:		case MOD_TELEFRAG:
;339:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $258
ASGNP4
line 340
;340:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $259
ASGNP4
line 341
;341:			break;
ADDRGP4 $222
JUMPV
LABELV $260
line 343
;342:		case MOD_ALTFLAMER:		// Shafe - Trep - Flame Thrower Alt
;343:			message = "was toasted by";
ADDRLP4 40
ADDRGP4 $261
ASGNP4
line 344
;344:			message2 = "'s flame thrower";
ADDRLP4 88
ADDRGP4 $262
ASGNP4
line 345
;345:			break;
ADDRGP4 $222
JUMPV
LABELV $263
line 347
;346:		case MOD_TURRET:
;347:			message = "was shot down by ";
ADDRLP4 40
ADDRGP4 $264
ASGNP4
line 348
;348:			message2 = "'s turret.";
ADDRLP4 88
ADDRGP4 $265
ASGNP4
line 349
;349:			break;
ADDRGP4 $222
JUMPV
LABELV $221
line 351
;350:		default:
;351:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $266
ASGNP4
line 352
;352:			break;
LABELV $222
line 355
;353:		}
;354:
;355:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
line 356
;356:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $271
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
line 358
;357:				targetName, message, attackerName, message2);
;358:			return;
ADDRGP4 $107
JUMPV
LABELV $269
line 360
;359:		}
;360:	}
LABELV $219
line 363
;361:
;362:	// we don't know what it was
;363:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $272
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 364
;364:}
LABELV $107
endproc CG_Obituary 136 20
proc CG_UseItem 32 16
line 373
;365:
;366://==========================================================================
;367:
;368:/*
;369:===============
;370:CG_UseItem
;371:===============
;372:*/
;373:static void CG_UseItem( centity_t *cent ) {
line 379
;374:	clientInfo_t *ci;
;375:	int			itemNum, clientNum;
;376:	gitem_t		*item;
;377:	entityState_t *es;
;378:
;379:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 381
;380:	
;381:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
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
line 382
;382:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $276
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $274
LABELV $276
line 383
;383:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 384
;384:	}
LABELV $274
line 387
;385:
;386:	// print a message if the local player
;387:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $277
line 388
;388:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $280
line 389
;389:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $282
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 390
;390:		} else {
ADDRGP4 $281
JUMPV
LABELV $280
line 391
;391:			item = BG_FindItemForHoldable( itemNum );
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
line 392
;392:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $283
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
line 393
;393:		}
LABELV $281
line 394
;394:	}
LABELV $277
line 396
;395:
;396:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $286
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $285
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $290
ADDRGP4 $284
JUMPV
LABELV $284
LABELV $286
line 399
;397:	default:
;398:	case HI_NONE:
;399:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+153876+596
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 400
;400:		break;
ADDRGP4 $285
JUMPV
line 403
;401:
;402:	case HI_TELEPORTER:
;403:		break;
LABELV $290
line 406
;404:
;405:	case HI_MEDKIT:
;406:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 407
;407:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $291
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $291
line 408
;408:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1732
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 409
;409:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 410
;410:		}
LABELV $291
line 411
;411:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+153876+928
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 412
;412:		break;
LABELV $285
line 425
;413:
;414:#ifdef MISSIONPACK
;415:	case HI_KAMIKAZE:
;416:		break;
;417:	case HI_PORTAL:
;418:		break;
;419:	case HI_INVULNERABILITY:
;420:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;421:		break;
;422:#endif
;423:	}
;424:
;425:}
LABELV $273
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 434
;426:
;427:/*
;428:================
;429:CG_ItemPickup
;430:
;431:A new item was picked up this frame
;432:================
;433:*/
;434:static void CG_ItemPickup( int itemNum ) {
line 435
;435:	cg.itemPickup = itemNum;
ADDRGP4 cg+126732
ADDRFP4 0
INDIRI4
ASGNI4
line 436
;436:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+126736
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 437
;437:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+126740
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 439
;438:	// see if it should be the grabbed weapon
;439:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $303
line 441
;440:		// select it immediately
;441:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $306
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $306
line 442
;442:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 443
;443:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+111004
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 444
;444:		}
LABELV $306
line 445
;445:	}
LABELV $303
line 447
;446:
;447:}
LABELV $297
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 457
;448:
;449:
;450:/*
;451:================
;452:CG_PainEvent
;453:
;454:Also called by playerstate transition
;455:================
;456:*/
;457:void CG_PainEvent( centity_t *cent, int health ) {
line 461
;458:	char	*snd;
;459:
;460:	// don't do more than two pain sounds a second
;461:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $315
line 462
;462:		return;
ADDRGP4 $314
JUMPV
LABELV $315
line 465
;463:	}
;464:
;465:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $318
line 466
;466:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $320
ASGNP4
line 467
;467:	} else if ( health < 50 ) {
ADDRGP4 $319
JUMPV
LABELV $318
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $321
line 468
;468:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $323
ASGNP4
line 469
;469:	} else if ( health < 75 ) {
ADDRGP4 $322
JUMPV
LABELV $321
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $324
line 470
;470:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $326
ASGNP4
line 471
;471:	} else {
ADDRGP4 $325
JUMPV
LABELV $324
line 472
;472:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $327
ASGNP4
line 473
;473:	}
LABELV $325
LABELV $322
LABELV $319
line 474
;474:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
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
line 478
;475:		CG_CustomSound( cent->currentState.number, snd ) );
;476:
;477:	// save pain time for programitic twitch animation
;478:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 479
;479:	cent->pe.painDirection ^= 1;
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
line 480
;480:}
LABELV $314
endproc CG_PainEvent 12 16
lit
align 4
LABELV $475
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 112 48
line 493
;481:
;482:
;483:
;484:/*
;485:==============
;486:CG_EntityEvent
;487:
;488:An entity has an event value
;489:also called by CG_CheckPlayerstateEvents
;490:==============
;491:*/
;492:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;493:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 502
;494:	entityState_t	*es;
;495:	int				event;
;496:	vec3_t			dir;
;497:	const char		*s;
;498:	int				clientNum;
;499:	clientInfo_t	*ci;
;500:
;501:	
;502:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 503
;503:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 505
;504:
;505:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $330
line 506
;506:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $333
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
line 507
;507:	}
LABELV $330
line 509
;508:
;509:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $334
line 510
;510:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $329
ADDRGP4 $339
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 511
;511:		return;
ADDRGP4 $329
JUMPV
LABELV $334
line 514
;512:	}
;513:
;514:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 515
;515:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $342
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $340
LABELV $342
line 516
;516:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 517
;517:	}
LABELV $340
line 518
;518:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1732
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 520
;519:
;520:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $344
ADDRLP4 8
INDIRI4
CNSTI4 75
GTI4 $344
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1031-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1031
address $346
address $356
address $367
address $378
address $389
address $440
address $440
address $440
address $440
address $400
address $414
address $426
address $470
address $482
address $496
address $503
address $510
address $517
address $523
address $541
address $555
address $563
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
address $640
address $645
address $650
address $344
address $676
address $669
address $655
address $662
address $684
address $695
address $780
address $789
address $800
address $754
address $741
address $711
address $716
address $721
address $726
address $767
address $344
address $925
address $933
address $933
address $933
address $939
address $944
address $957
address $970
address $983
address $990
address $997
address $706
address $1002
address $344
address $1009
address $1021
address $1016
address $487
code
LABELV $346
line 525
;521:	//
;522:	// movement generated events
;523:	//
;524:	case EV_FOOTSTEP:
;525:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $347
ADDRGP4 $350
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $347
line 526
;526:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 527
;527:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+153876+604
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 529
;528:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;529:		}
line 530
;530:		break;
ADDRGP4 $345
JUMPV
LABELV $356
line 532
;531:	case EV_FOOTSTEP_METAL:
;532:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $357
ADDRGP4 $360
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $357
line 533
;533:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 534
;534:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+153876+604+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 536
;535:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;536:		}
line 537
;537:		break;
ADDRGP4 $345
JUMPV
LABELV $367
line 539
;538:	case EV_FOOTSPLASH:
;539:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $368
ADDRGP4 $371
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $368
line 540
;540:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 541
;541:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+153876+604+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 543
;542:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;543:		}
line 544
;544:		break;
ADDRGP4 $345
JUMPV
LABELV $378
line 546
;545:	case EV_FOOTWADE:
;546:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $379
ADDRGP4 $382
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $379
line 547
;547:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 548
;548:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+153876+604+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 550
;549:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;550:		}
line 551
;551:		break;
ADDRGP4 $345
JUMPV
LABELV $389
line 553
;552:	case EV_SWIM:
;553:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $390
ADDRGP4 $393
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $390
line 554
;554:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 555
;555:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+153876+604+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 557
;556:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;557:		}
line 558
;558:		break;
ADDRGP4 $345
JUMPV
LABELV $400
line 562
;559:
;560:
;561:	case EV_FALL_SHORT:
;562:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $401
ADDRGP4 $404
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $401
line 563
;563:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+800
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 564
;564:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $345
line 566
;565:			// smooth landing z changes
;566:			cg.landChange = -8;
ADDRGP4 cg+110996
CNSTF4 3238002688
ASGNF4
line 567
;567:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 568
;568:		}
line 569
;569:		break;
ADDRGP4 $345
JUMPV
LABELV $414
line 571
;570:	case EV_FALL_MEDIUM:
;571:		DEBUGNAME("EV_FALL_MEDIUM");
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
line 573
;572:		// use normal pain sound
;573:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $327
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
line 574
;574:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $345
line 576
;575:			// smooth landing z changes
;576:			cg.landChange = -16;
ADDRGP4 cg+110996
CNSTF4 3246391296
ASGNF4
line 577
;577:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 578
;578:		}
line 579
;579:		break;
ADDRGP4 $345
JUMPV
LABELV $426
line 581
;580:	case EV_FALL_FAR:
;581:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $427
ADDRGP4 $430
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $427
line 582
;582:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $431
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
line 583
;583:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 584
;584:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $345
line 586
;585:			// smooth landing z changes
;586:			cg.landChange = -24;
ADDRGP4 cg+110996
CNSTF4 3250585600
ASGNF4
line 587
;587:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 588
;588:		}
line 589
;589:		break;
ADDRGP4 $345
JUMPV
LABELV $440
line 595
;590:
;591:	case EV_STEP_4:
;592:	case EV_STEP_8:
;593:	case EV_STEP_12:
;594:	case EV_STEP_16:		// smooth out step up transitions
;595:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $441
ADDRGP4 $444
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $441
line 596
;596:	{
line 601
;597:		float	oldStep;
;598:		int		delta;
;599:		int		step;
;600:
;601:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $445
line 602
;602:			break;
ADDRGP4 $345
JUMPV
LABELV $445
line 605
;603:		}
;604:		// if we are interpolating, we don't need to smooth steps
;605:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $457
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $457
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $457
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $449
LABELV $457
line 606
;606:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 607
;607:			break;
ADDRGP4 $345
JUMPV
LABELV $449
line 610
;608:		}
;609:		// check for stepping up before a previous step is completed
;610:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 611
;611:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $460
line 612
;612:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
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
line 613
;613:		} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 614
;614:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 615
;615:		}
LABELV $461
line 618
;616:
;617:		// add this amount
;618:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 619
;619:		cg.stepChange = oldStep + step;
ADDRGP4 cg+110980
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 620
;620:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+110980
INDIRF4
CNSTF4 1107296256
LEF4 $464
line 621
;621:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+110980
CNSTF4 1107296256
ASGNF4
line 622
;622:		}
LABELV $464
line 623
;623:		cg.stepTime = cg.time;
ADDRGP4 cg+110984
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 624
;624:		break;
ADDRGP4 $345
JUMPV
LABELV $470
line 628
;625:	}
;626:
;627:	case EV_JUMP_PAD:
;628:		DEBUGNAME("EV_JUMP_PAD");
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
line 630
;629://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;630:		{
line 632
;631:			localEntity_t	*smoke;
;632:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $475
INDIRB
ASGNB 12
line 635
;633:
;634:
;635:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
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
ADDRGP4 cgs+153876+288
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
line 642
;636:						  32, 
;637:						  1, 1, 1, 0.33f,
;638:						  1000, 
;639:						  cg.time, 0,
;640:						  LEF_PUFF_DONT_SCALE, 
;641:						  cgs.media.smokePuffShader );
;642:		}
line 645
;643:
;644:		// boing sound at origin, jump sound on player
;645:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+153876+808
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 646
;646:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $481
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
line 647
;647:		break;
ADDRGP4 $345
JUMPV
LABELV $482
line 650
;648:
;649:	case EV_JUMP:
;650:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $483
ADDRGP4 $486
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $483
line 651
;651:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $481
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
line 652
;652:		break;
ADDRGP4 $345
JUMPV
LABELV $487
line 654
;653:	case EV_TAUNT:
;654:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $488
ADDRGP4 $491
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $488
line 655
;655:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $492
line 656
;656:		{
line 658
;657:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;658:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $494
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
line 659
;659:		}
ADDRGP4 $345
JUMPV
LABELV $492
line 661
;660:		else
;661:		{
line 663
;662:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;663:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1728
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRGP4 $495
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
line 664
;664:		}
line 665
;665:		break;
ADDRGP4 $345
JUMPV
LABELV $496
line 693
;666:#ifdef MISSIONPACK
;667:	case EV_TAUNT_YES:
;668:		DEBUGNAME("EV_TAUNT_YES");
;669:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;670:		break;
;671:	case EV_TAUNT_NO:
;672:		DEBUGNAME("EV_TAUNT_NO");
;673:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;674:		break;
;675:	case EV_TAUNT_FOLLOWME:
;676:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;677:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;678:		break;
;679:	case EV_TAUNT_GETFLAG:
;680:		DEBUGNAME("EV_TAUNT_GETFLAG");
;681:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;682:		break;
;683:	case EV_TAUNT_GUARDBASE:
;684:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;685:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;686:		break;
;687:	case EV_TAUNT_PATROL:
;688:		DEBUGNAME("EV_TAUNT_PATROL");
;689:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;690:		break;
;691:#endif
;692:	case EV_WATER_TOUCH:
;693:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $497
ADDRGP4 $500
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $497
line 694
;694:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+912
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 695
;695:		break;
ADDRGP4 $345
JUMPV
LABELV $503
line 697
;696:	case EV_WATER_LEAVE:
;697:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $504
ADDRGP4 $507
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $504
line 698
;698:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+916
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 699
;699:		break;
ADDRGP4 $345
JUMPV
LABELV $510
line 701
;700:	case EV_WATER_UNDER:
;701:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $511
ADDRGP4 $514
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $511
line 702
;702:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+920
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 703
;703:		break;
ADDRGP4 $345
JUMPV
LABELV $517
line 705
;704:	case EV_WATER_CLEAR:
;705:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $518
ADDRGP4 $521
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $518
line 706
;706:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $522
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
line 707
;707:		break;
ADDRGP4 $345
JUMPV
LABELV $523
line 710
;708:
;709:	case EV_ITEM_PICKUP:
;710:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $524
ADDRGP4 $527
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $524
line 711
;711:		{
line 715
;712:			gitem_t	*item;
;713:			int		index;
;714:
;715:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 717
;716:
;717:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $530
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $528
LABELV $530
line 718
;718:				break;
ADDRGP4 $345
JUMPV
LABELV $528
line 720
;719:			}
;720:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 724
;721:
;722:			// powerups and team items will have a separate global sound, this one
;723:			// will be played at prediction time
;724:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
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
EQI4 $533
ADDRLP4 72
INDIRI4
CNSTI4 8
NEI4 $531
LABELV $533
line 725
;725:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+1064
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 726
;726:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $532
JUMPV
LABELV $531
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $536
line 743
;727:#ifdef MISSIONPACK
;728:				switch (item->giTag ) {
;729:					case PW_SCOUT:
;730:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;731:					break;
;732:					case PW_GUARD:
;733:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;734:					break;
;735:					case PW_DOUBLER:
;736:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;737:					break;
;738:					case PW_AMMOREGEN:
;739:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;740:					break;
;741:				}
;742:#endif
;743:			} else {
ADDRGP4 $537
JUMPV
LABELV $536
line 744
;744:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 745
;745:			}
LABELV $537
LABELV $532
line 748
;746:
;747:			// show icon and name on status bar
;748:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 749
;749:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 750
;750:			}
line 751
;751:		}
line 752
;752:		break;
ADDRGP4 $345
JUMPV
LABELV $541
line 755
;753:
;754:	case EV_GLOBAL_ITEM_PICKUP:
;755:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $542
ADDRGP4 $545
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $542
line 756
;756:		{
line 760
;757:			gitem_t	*item;
;758:			int		index;
;759:
;760:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 762
;761:
;762:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $548
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $546
LABELV $548
line 763
;763:				break;
ADDRGP4 $345
JUMPV
LABELV $546
line 765
;764:			}
;765:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 767
;766:			// powerup pickups are global
;767:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $549
line 768
;768:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 769
;769:			}
LABELV $549
line 772
;770:
;771:			// show icon and name on status bar
;772:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 773
;773:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 774
;774:			}
line 775
;775:		}
line 776
;776:		break;
ADDRGP4 $345
JUMPV
LABELV $555
line 782
;777:
;778:	//
;779:	// weapon events
;780:	//
;781:	case EV_NOAMMO:
;782:		DEBUGNAME("EV_NOAMMO");
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
line 784
;783://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;784:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 785
;785:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 786
;786:		}
line 787
;787:		break;
ADDRGP4 $345
JUMPV
LABELV $563
line 789
;788:	case EV_CHANGE_WEAPON:
;789:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $564
ADDRGP4 $567
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $564
line 790
;790:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+592
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 791
;791:		break;
ADDRGP4 $345
JUMPV
LABELV $570
line 793
;792:	case EV_FIRE_WEAPON:
;793:		DEBUGNAME("EV_FIRE_WEAPON");
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
line 794
;794:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 795
;795:		break;
ADDRGP4 $345
JUMPV
LABELV $575
line 798
;796:
;797:	case EV_FIRE_WEAPON2: 
;798:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
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
line 799
;799:		 CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 800
;800:		 break;
ADDRGP4 $345
JUMPV
LABELV $580
line 803
;801:
;802:	case EV_USE_ITEM0:
;803:		DEBUGNAME("EV_USE_ITEM0");
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
line 804
;804:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 805
;805:		break;
ADDRGP4 $345
JUMPV
LABELV $585
line 807
;806:	case EV_USE_ITEM1:
;807:		DEBUGNAME("EV_USE_ITEM1");
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
line 808
;808:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 809
;809:		break;
ADDRGP4 $345
JUMPV
LABELV $590
line 811
;810:	case EV_USE_ITEM2:
;811:		DEBUGNAME("EV_USE_ITEM2");
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
line 812
;812:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 813
;813:		break;
ADDRGP4 $345
JUMPV
LABELV $595
line 815
;814:	case EV_USE_ITEM3:
;815:		DEBUGNAME("EV_USE_ITEM3");
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
line 816
;816:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 817
;817:		break;
ADDRGP4 $345
JUMPV
LABELV $600
line 819
;818:	case EV_USE_ITEM4:
;819:		DEBUGNAME("EV_USE_ITEM4");
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
line 820
;820:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 821
;821:		break;
ADDRGP4 $345
JUMPV
LABELV $605
line 823
;822:	case EV_USE_ITEM5:
;823:		DEBUGNAME("EV_USE_ITEM5");
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
line 824
;824:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 825
;825:		break;
ADDRGP4 $345
JUMPV
LABELV $610
line 827
;826:	case EV_USE_ITEM6:
;827:		DEBUGNAME("EV_USE_ITEM6");
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
line 828
;828:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 829
;829:		break;
ADDRGP4 $345
JUMPV
LABELV $615
line 831
;830:	case EV_USE_ITEM7:
;831:		DEBUGNAME("EV_USE_ITEM7");
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
line 832
;832:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 833
;833:		break;
ADDRGP4 $345
JUMPV
LABELV $620
line 835
;834:	case EV_USE_ITEM8:
;835:		DEBUGNAME("EV_USE_ITEM8");
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
line 836
;836:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 837
;837:		break;
ADDRGP4 $345
JUMPV
LABELV $625
line 839
;838:	case EV_USE_ITEM9:
;839:		DEBUGNAME("EV_USE_ITEM9");
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
line 840
;840:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 841
;841:		break;
ADDRGP4 $345
JUMPV
LABELV $630
line 843
;842:	case EV_USE_ITEM10:
;843:		DEBUGNAME("EV_USE_ITEM10");
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
line 844
;844:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 845
;845:		break;
ADDRGP4 $345
JUMPV
LABELV $635
line 847
;846:	case EV_USE_ITEM11:
;847:		DEBUGNAME("EV_USE_ITEM11");
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
line 848
;848:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 849
;849:		break;
ADDRGP4 $345
JUMPV
LABELV $640
line 851
;850:	case EV_USE_ITEM12:
;851:		DEBUGNAME("EV_USE_ITEM12");
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
line 852
;852:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 853
;853:		break;
ADDRGP4 $345
JUMPV
LABELV $645
line 855
;854:	case EV_USE_ITEM13:
;855:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $646
ADDRGP4 $649
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $646
line 856
;856:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 857
;857:		break;
ADDRGP4 $345
JUMPV
LABELV $650
line 859
;858:	case EV_USE_ITEM14:
;859:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $651
ADDRGP4 $654
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $651
line 860
;860:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 861
;861:		break;
ADDRGP4 $345
JUMPV
LABELV $655
line 869
;862:
;863:	//=================================================================
;864:
;865:	//
;866:	// other events
;867:	//
;868:	case EV_PLAYER_TELEPORT_IN:
;869:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $656
ADDRGP4 $659
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $656
line 870
;870:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+780
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 871
;871:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 872
;872:		break;
ADDRGP4 $345
JUMPV
LABELV $662
line 875
;873:
;874:	case EV_PLAYER_TELEPORT_OUT:
;875:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $663
ADDRGP4 $666
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $663
line 876
;876:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+784
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 877
;877:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 878
;878:		break;
ADDRGP4 $345
JUMPV
LABELV $669
line 881
;879:
;880:	case EV_ITEM_POP:
;881:		DEBUGNAME("EV_ITEM_POP");
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
line 882
;882:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+792
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 883
;883:		break;
ADDRGP4 $345
JUMPV
LABELV $676
line 885
;884:	case EV_ITEM_RESPAWN:
;885:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $677
ADDRGP4 $680
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $677
line 886
;886:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 887
;887:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+792
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 888
;888:		break;
ADDRGP4 $345
JUMPV
LABELV $684
line 891
;889:
;890:	case EV_GRENADE_BOUNCE:
;891:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $685
ADDRGP4 $688
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $685
line 892
;892:		if ( rand() & 1 ) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $689
line 893
;893:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+1068
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 894
;894:		} else {
ADDRGP4 $345
JUMPV
LABELV $689
line 895
;895:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+1072
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 896
;896:		}
line 897
;897:		break;
ADDRGP4 $345
JUMPV
LABELV $695
line 900
;898:
;899:	case EV_PL_BOUNCE:
;900:		DEBUGNAME("EV_PL_BOUNCE");
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
line 901
;901:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $700
line 902
;902:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+1108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 903
;903:		} else {
ADDRGP4 $345
JUMPV
LABELV $700
line 904
;904:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+153876+1112
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 905
;905:		}
line 906
;906:		break;
ADDRGP4 $345
JUMPV
LABELV $706
line 950
;907:
;908:#ifdef MISSIONPACK
;909:	case EV_PROXIMITY_MINE_STICK:
;910:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;911:		if( es->eventParm & SURF_FLESH ) {
;912:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;913:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;914:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;915:		} else {
;916:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;917:		}
;918:		break;
;919:
;920:	case EV_PROXIMITY_MINE_TRIGGER:
;921:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;922:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;923:		break;
;924:	case EV_KAMIKAZE:
;925:		DEBUGNAME("EV_KAMIKAZE");
;926:		CG_KamikazeEffect( cent->lerpOrigin );
;927:		break;
;928:	case EV_OBELISKEXPLODE:
;929:		DEBUGNAME("EV_OBELISKEXPLODE");
;930:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;931:		break;
;932:	case EV_OBELISKPAIN:
;933:		DEBUGNAME("EV_OBELISKPAIN");
;934:		CG_ObeliskPain( cent->lerpOrigin );
;935:		break;
;936:	case EV_INVUL_IMPACT:
;937:		DEBUGNAME("EV_INVUL_IMPACT");
;938:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;939:		break;
;940:	case EV_JUICED:
;941:		DEBUGNAME("EV_JUICED");
;942:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;943:		break;
;944:	case EV_LIGHTNINGBOLT:
;945:		DEBUGNAME("EV_LIGHTNINGBOLT");
;946:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;947:		break;
;948:#endif
;949:	case EV_SCOREPLUM:
;950:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $707
ADDRGP4 $710
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $707
line 951
;951:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
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
line 952
;952:		break;
ADDRGP4 $345
JUMPV
LABELV $711
line 958
;953:
;954:	//
;955:	// missile impacts
;956:	//
;957:	case EV_MISSILE_HIT:
;958:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $712
ADDRGP4 $715
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $712
line 959
;959:		ByteToDir( es->eventParm, dir );
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
line 960
;960:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 961
;961:		break;
ADDRGP4 $345
JUMPV
LABELV $716
line 964
;962:
;963:	case EV_MISSILE_MISS:
;964:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $717
ADDRGP4 $720
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $717
line 965
;965:		ByteToDir( es->eventParm, dir );
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
line 966
;966:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
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
line 967
;967:		break;
ADDRGP4 $345
JUMPV
LABELV $721
line 970
;968:
;969:	case EV_MISSILE_MISS_METAL:
;970:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $722
ADDRGP4 $725
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $722
line 971
;971:		ByteToDir( es->eventParm, dir );
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
line 972
;972:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_METAL );
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
line 973
;973:		break;
ADDRGP4 $345
JUMPV
LABELV $726
line 976
;974:
;975:	case EV_RAILTRAIL:
;976:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $727
ADDRGP4 $730
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $727
line 977
;977:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 980
;978://unlagged - attack prediction #2
;979:		// if the client is us, unlagged is on server-side, and we've got it client-side
;980:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $731
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $731
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $738
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $731
LABELV $738
line 981
;981:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 984
;982:			// do nothing, because it was already predicted
;983:			//Com_Printf("Ignoring rail trail event\n");
;984:		}
ADDRGP4 $345
JUMPV
LABELV $731
line 985
;985:		else {
line 987
;986:			// draw a rail trail, because it wasn't predicted
;987:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 990
;988:
;989:			// if the end was on a nomark surface, don't make an explosion
;990:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $345
line 991
;991:				ByteToDir( es->eventParm, dir );
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
line 992
;992:				CG_MissileHitWall( cent, es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
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
line 993
;993:			}
line 995
;994:			//Com_Printf("Non-predicted rail trail\n");
;995:		}
line 997
;996://unlagged - attack prediction #2
;997:		break;
ADDRGP4 $345
JUMPV
LABELV $741
line 1000
;998:
;999:	case EV_BULLET_HIT_WALL:
;1000:		DEBUGNAME("EV_BULLET_HIT_WALL");
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
line 1003
;1001://unlagged - attack prediction #2
;1002:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1003:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $746
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $746
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $753
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $746
LABELV $753
line 1004
;1004:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1007
;1005:			// do nothing, because it was already predicted
;1006:			//Com_Printf("Ignoring bullet event\n");
;1007:		}
ADDRGP4 $345
JUMPV
LABELV $746
line 1008
;1008:		else {
line 1010
;1009:			// do the bullet, because it wasn't predicted
;1010:			ByteToDir( es->eventParm, dir );
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
line 1011
;1011:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1013
;1012:			//Com_Printf("Non-predicted bullet\n");
;1013:		}
line 1015
;1014://unlagged - attack prediction #2
;1015:		break;
ADDRGP4 $345
JUMPV
LABELV $754
line 1018
;1016:
;1017:	case EV_BULLET_HIT_FLESH:
;1018:		DEBUGNAME("EV_BULLET_HIT_FLESH");
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
line 1021
;1019://unlagged - attack prediction #2
;1020:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1021:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $759
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $759
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $766
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $759
LABELV $766
line 1022
;1022:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1025
;1023:			// do nothing, because it was already predicted
;1024:			//Com_Printf("Ignoring bullet event\n");
;1025:		}
ADDRGP4 $345
JUMPV
LABELV $759
line 1026
;1026:		else {
line 1028
;1027:			// do the bullet, because it wasn't predicted
;1028:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1030
;1029:			//Com_Printf("Non-predicted bullet\n");
;1030:		}
line 1032
;1031://unlagged - attack prediction #2
;1032:		break;
ADDRGP4 $345
JUMPV
LABELV $767
line 1035
;1033:
;1034:	case EV_SHOTGUN:
;1035:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $768
ADDRGP4 $771
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $768
line 1038
;1036://unlagged - attack prediction #2
;1037:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1038:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $772
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $772
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $779
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $772
LABELV $779
line 1039
;1039:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1042
;1040:			// do nothing, because it was already predicted
;1041:			//Com_Printf("Ignoring shotgun event\n");
;1042:		}
ADDRGP4 $345
JUMPV
LABELV $772
line 1043
;1043:		else {
line 1045
;1044:			// do the shotgun pattern, because it wasn't predicted
;1045:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1047
;1046:			//Com_Printf("Non-predicted shotgun pattern\n");
;1047:		}
line 1049
;1048://unlagged - attack prediction #2
;1049:		break;
ADDRGP4 $345
JUMPV
LABELV $780
line 1052
;1050:
;1051:	case EV_GENERAL_SOUND:
;1052:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $781
ADDRGP4 $784
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $781
line 1053
;1053:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $785
line 1054
;1054:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1055
;1055:		} else {
ADDRGP4 $345
JUMPV
LABELV $785
line 1056
;1056:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1057
;1057:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
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
line 1058
;1058:		}
line 1059
;1059:		break;
ADDRGP4 $345
JUMPV
LABELV $789
line 1062
;1060:
;1061:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1062:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $790
ADDRGP4 $793
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $790
line 1063
;1063:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $794
line 1064
;1064:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
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
line 1065
;1065:		} else {
ADDRGP4 $345
JUMPV
LABELV $794
line 1066
;1066:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1067
;1067:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
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
line 1068
;1068:		}
line 1069
;1069:		break;
ADDRGP4 $345
JUMPV
LABELV $800
line 1072
;1070:
;1071:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1072:		{
line 1073
;1073:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $801
ADDRGP4 $804
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $801
line 1074
;1074:			switch( es->eventParm ) {
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
LTI4 $345
ADDRLP4 96
INDIRI4
CNSTI4 13
GTI4 $345
ADDRLP4 96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $924
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $924
address $808
address $818
address $828
address $840
address $852
address $872
address $892
address $900
address $908
address $911
address $914
address $917
address $920
address $345
code
LABELV $808
line 1076
;1075:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1076:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $809
line 1077
;1077:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+153876+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $345
JUMPV
LABELV $809
line 1079
;1078:					else
;1079:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+153876+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1080
;1080:					break;
ADDRGP4 $345
JUMPV
LABELV $818
line 1082
;1081:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1082:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $819
line 1083
;1083:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+153876+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $345
JUMPV
LABELV $819
line 1085
;1084:					else
;1085:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+153876+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1086
;1086:					break;
ADDRGP4 $345
JUMPV
LABELV $828
line 1088
;1087:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1088:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $829
line 1089
;1089:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+153876+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $830
JUMPV
LABELV $829
line 1091
;1090:					else
;1091:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+153876+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $830
line 1093
;1092:					//
;1093:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+153876+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1094
;1094:					break;
ADDRGP4 $345
JUMPV
LABELV $840
line 1096
;1095:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1096:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $841
line 1097
;1097:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+153876+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $842
JUMPV
LABELV $841
line 1099
;1098:					else
;1099:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+153876+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $842
line 1101
;1100:					//
;1101:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+153876+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1102
;1102:					break;
ADDRGP4 $345
JUMPV
LABELV $852
line 1106
;1103:
;1104:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1105:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1106:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $857
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $853
LABELV $857
line 1107
;1107:					}
ADDRGP4 $345
JUMPV
LABELV $853
line 1108
;1108:					else {
line 1109
;1109:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $858
line 1115
;1110:#ifdef MISSIONPACK
;1111:							if (cgs.gametype == GT_1FCTF) 
;1112:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1113:							else
;1114:#endif
;1115:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+153876+996
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1116
;1116:						}
ADDRGP4 $345
JUMPV
LABELV $858
line 1117
;1117:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $345
line 1123
;1118:#ifdef MISSIONPACK
;1119:							if (cgs.gametype == GT_1FCTF)
;1120:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1121:							else
;1122:#endif
;1123: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+153876+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1124
;1124:						}
line 1125
;1125:					}
line 1126
;1126:					break;
ADDRGP4 $345
JUMPV
LABELV $872
line 1129
;1127:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1128:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1129:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $877
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $873
LABELV $877
line 1130
;1130:					}
ADDRGP4 $345
JUMPV
LABELV $873
line 1131
;1131:					else {
line 1132
;1132:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $878
line 1138
;1133:#ifdef MISSIONPACK
;1134:							if (cgs.gametype == GT_1FCTF)
;1135:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1136:							else
;1137:#endif
;1138:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+153876+996
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1139
;1139:						}
ADDRGP4 $345
JUMPV
LABELV $878
line 1140
;1140:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $345
line 1146
;1141:#ifdef MISSIONPACK
;1142:							if (cgs.gametype == GT_1FCTF)
;1143:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1144:							else
;1145:#endif
;1146:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+153876+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1147
;1147:						}
line 1148
;1148:					}
line 1149
;1149:					break;
ADDRGP4 $345
JUMPV
LABELV $892
line 1151
;1150:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1151:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $345
line 1152
;1152:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1153
;1153:					}
line 1154
;1154:					break;
ADDRGP4 $345
JUMPV
LABELV $900
line 1156
;1155:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1156:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $345
line 1157
;1157:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1158
;1158:					}
line 1159
;1159:					break;
ADDRGP4 $345
JUMPV
LABELV $908
line 1162
;1160:
;1161:				case GTS_REDTEAM_SCORED:
;1162:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+153876+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1163
;1163:					break;
ADDRGP4 $345
JUMPV
LABELV $911
line 1165
;1164:				case GTS_BLUETEAM_SCORED:
;1165:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+153876+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1166
;1166:					break;
ADDRGP4 $345
JUMPV
LABELV $914
line 1168
;1167:				case GTS_REDTEAM_TOOK_LEAD:
;1168:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+153876+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1169
;1169:					break;
ADDRGP4 $345
JUMPV
LABELV $917
line 1171
;1170:				case GTS_BLUETEAM_TOOK_LEAD:
;1171:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+153876+952
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1172
;1172:					break;
ADDRGP4 $345
JUMPV
LABELV $920
line 1174
;1173:				case GTS_TEAMS_ARE_TIED:
;1174:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+153876+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1175
;1175:					break;
line 1178
;1176:				case GTS_KAMIKAZE:
;1177:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1178:					break;
line 1181
;1179:
;1180:				default:
;1181:					break;
line 1183
;1182:			}
;1183:			break;
ADDRGP4 $345
JUMPV
LABELV $925
line 1189
;1184:		}
;1185:
;1186:	case EV_PAIN:
;1187:		// local player sounds are triggered in CG_CheckLocalSounds,
;1188:		// so ignore events on the player
;1189:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $926
ADDRGP4 $929
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $926
line 1190
;1190:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $345
line 1191
;1191:			CG_PainEvent( cent, es->eventParm );
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
line 1192
;1192:		}
line 1193
;1193:		break;
ADDRGP4 $345
JUMPV
LABELV $933
line 1198
;1194:
;1195:	case EV_DEATH1:
;1196:	case EV_DEATH2:
;1197:	case EV_DEATH3:
;1198:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $934
ADDRGP4 $937
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $934
line 1199
;1199:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $938
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
line 1201
;1200:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1201:		break;
ADDRGP4 $345
JUMPV
LABELV $939
line 1205
;1202:
;1203:
;1204:	case EV_OBITUARY:
;1205:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $940
ADDRGP4 $943
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $940
line 1206
;1206:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1207
;1207:		break;
ADDRGP4 $345
JUMPV
LABELV $944
line 1213
;1208:
;1209:	//
;1210:	// powerup events
;1211:	//
;1212:	case EV_POWERUP_QUAD:
;1213:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $945
ADDRGP4 $948
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $945
line 1214
;1214:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $949
line 1215
;1215:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+126476
CNSTI4 1
ASGNI4
line 1216
;1216:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1217
;1217:		}
LABELV $949
line 1218
;1218:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+153876+584
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1219
;1219:		break;
ADDRGP4 $345
JUMPV
LABELV $957
line 1221
;1220:	case EV_POWERUP_BATTLESUIT:
;1221:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $958
ADDRGP4 $961
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $958
line 1222
;1222:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $962
line 1223
;1223:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+126476
CNSTI4 2
ASGNI4
line 1224
;1224:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1225
;1225:		}
LABELV $962
line 1226
;1226:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+153876+1060
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1227
;1227:		break;
ADDRGP4 $345
JUMPV
LABELV $970
line 1229
;1228:	case EV_POWERUP_REGEN:
;1229:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $971
ADDRGP4 $974
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $971
line 1230
;1230:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $975
line 1231
;1231:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+126476
CNSTI4 5
ASGNI4
line 1232
;1232:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1233
;1233:		}
LABELV $975
line 1234
;1234:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+153876+1056
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1235
;1235:		break;
ADDRGP4 $345
JUMPV
LABELV $983
line 1238
;1236:
;1237:	case EV_GIB_PLAYER:
;1238:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $984
ADDRGP4 $987
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $984
line 1245
;1239:		// don't play gib sound when using the kamikaze because it interferes
;1240:		// with the kamikaze sound, downside is that the gib sound will also
;1241:		// not be played when someone is gibbed while just carrying the kamikaze
;1242:		
;1243:		// We've used this bit
;1244:		//if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1245:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+153876+756
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1248
;1246:		//}
;1247:		
;1248:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1249
;1249:		break;
ADDRGP4 $345
JUMPV
LABELV $990
line 1253
;1250:
;1251:	// Shafe - Trep - Headshot stuff
;1252:	case EV_GIB_PLAYER_HEADSHOT:
;1253:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $991
ADDRGP4 $994
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $991
line 1254
;1254:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+153876+756
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1255
;1255:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1256
;1256:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1257
;1257:		break;
ADDRGP4 $345
JUMPV
LABELV $997
line 1260
;1258:
;1259:	case EV_BODY_NOHEAD:
;1260:		DEBUGNAME("EV_BODY_NOHEAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $998
ADDRGP4 $1001
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $998
line 1261
;1261:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1262
;1262:		break;
ADDRGP4 $345
JUMPV
LABELV $1002
line 1265
;1263:	// Shafe - Trep - End Headshot Stuff
;1264:	case EV_BREAK_GLASS:
;1265: 		DEBUGNAME("EV_BREAK_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1003
ADDRGP4 $1006
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1003
line 1267
;1266: 		// Change cgs.media.gibSound to whatever sound you want it to use
;1267:  		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.glassSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+153876+772
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1268
;1268: 		CG_BreakGlass( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_BreakGlass
CALLV
pop
line 1269
;1269: 		break;
ADDRGP4 $345
JUMPV
LABELV $1009
line 1271
;1270:	case EV_ERROR:
;1271: 		DEBUGNAME("EV_ERROR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1010
ADDRGP4 $1013
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1010
line 1272
;1272: 		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.errorSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+153876+776
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1273
;1273: 		break;
ADDRGP4 $345
JUMPV
LABELV $1016
line 1275
;1274:	case EV_STOPLOOPINGSOUND:
;1275:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1017
ADDRGP4 $1020
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1017
line 1276
;1276:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1277
;1277:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1278
;1278:		break;
ADDRGP4 $345
JUMPV
LABELV $1021
line 1281
;1279:
;1280:	case EV_DEBUG_LINE:
;1281:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1022
ADDRGP4 $1025
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1022
line 1282
;1282:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1283
;1283:		break;
ADDRGP4 $345
JUMPV
LABELV $344
line 1286
;1284:
;1285:	default:
;1286:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1026
ADDRGP4 $1029
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1026
line 1287
;1287:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1030
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1288
;1288:		break;
LABELV $345
line 1291
;1289:	}
;1290:
;1291:}
LABELV $329
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1300
;1292:
;1293:
;1294:/*
;1295:==============
;1296:CG_CheckEvents
;1297:
;1298:==============
;1299:*/
;1300:void CG_CheckEvents( centity_t *cent ) {
line 1302
;1301:	// check for event-only entities
;1302:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1034
line 1303
;1303:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1036
line 1304
;1304:			return;	// already fired
ADDRGP4 $1033
JUMPV
LABELV $1036
line 1307
;1305:		}
;1306:		// if this is a player event set the entity number of the client entity number
;1307:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1038
line 1308
;1308:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1309
;1309:		}
LABELV $1038
line 1311
;1310:
;1311:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 1313
;1312:
;1313:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1314
;1314:	} else {
ADDRGP4 $1035
JUMPV
LABELV $1034
line 1316
;1315:		// check for events riding with another entity
;1316:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $1040
line 1317
;1317:			return;
ADDRGP4 $1033
JUMPV
LABELV $1040
line 1319
;1318:		}
;1319:		cent->previousEvent = cent->currentState.event;
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
line 1320
;1320:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1042
line 1321
;1321:			return;
ADDRGP4 $1033
JUMPV
LABELV $1042
line 1323
;1322:		}
;1323:	}
LABELV $1035
line 1326
;1324:
;1325:	// calculate the position at exactly the frame time
;1326:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1327
;1327:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1329
;1328:
;1329:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1330
;1330:}
LABELV $1033
endproc CG_CheckEvents 8 12
import irandom
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
LABELV $1030
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
LABELV $1029
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
LABELV $1025
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
LABELV $1020
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
LABELV $1013
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
LABELV $1006
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
LABELV $1001
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
LABELV $994
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
LABELV $987
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
LABELV $974
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
LABELV $961
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
LABELV $948
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
LABELV $943
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
LABELV $938
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
LABELV $937
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
LABELV $929
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
LABELV $804
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
LABELV $793
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
LABELV $784
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
LABELV $771
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
LABELV $758
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
LABELV $745
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
LABELV $730
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
LABELV $725
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
LABELV $720
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
LABELV $715
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
LABELV $710
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
LABELV $699
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
LABELV $688
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
LABELV $680
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
LABELV $673
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
LABELV $666
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
LABELV $659
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
LABELV $654
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
LABELV $649
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
LABELV $644
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
byte 1 49
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
byte 1 48
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
byte 1 57
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
byte 1 56
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
byte 1 55
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
byte 1 54
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
byte 1 53
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
byte 1 52
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
byte 1 51
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
byte 1 50
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
byte 1 49
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
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $579
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
LABELV $574
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
LABELV $567
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
LABELV $559
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
LABELV $545
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
LABELV $527
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
LABELV $522
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
LABELV $521
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
LABELV $514
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
LABELV $507
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
LABELV $500
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
LABELV $495
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
LABELV $494
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
LABELV $491
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
LABELV $486
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
LABELV $481
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
LABELV $474
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
LABELV $444
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
LABELV $431
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
LABELV $430
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
LABELV $418
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
LABELV $404
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
LABELV $393
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
LABELV $382
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
LABELV $371
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
LABELV $360
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
LABELV $350
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
LABELV $339
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
LABELV $333
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
LABELV $327
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
LABELV $326
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
LABELV $323
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
LABELV $320
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
LABELV $283
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $282
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
LABELV $272
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
LABELV $271
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
LABELV $266
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
LABELV $265
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
LABELV $264
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
LABELV $262
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
LABELV $261
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
LABELV $259
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
LABELV $258
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
LABELV $256
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
LABELV $254
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
LABELV $253
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
LABELV $251
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
LABELV $249
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
LABELV $247
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
LABELV $246
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
LABELV $244
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
LABELV $243
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
LABELV $241
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
LABELV $239
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
LABELV $238
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
LABELV $236
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
LABELV $235
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
LABELV $233
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
LABELV $232
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $230
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
LABELV $228
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
LABELV $226
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
LABELV $224
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
LABELV $213
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $210
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
LABELV $207
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
LABELV $203
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
LABELV $200
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
LABELV $191
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $186
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
LABELV $185
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
LABELV $182
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
LABELV $179
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
LABELV $178
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
LABELV $175
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
LABELV $171
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
LABELV $169
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
LABELV $168
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
LABELV $165
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
LABELV $161
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
LABELV $160
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
LABELV $157
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
LABELV $153
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
LABELV $152
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
