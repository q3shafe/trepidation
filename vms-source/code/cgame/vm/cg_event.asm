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
CNSTI4 520
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
CNSTI4 520
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
ADDRGP4 cgs+154388+612
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
CNSTI4 1740
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
CNSTI4 152
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
ADDRGP4 cgs+154388+944
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
line 501
;494:	entityState_t	*es;
;495:	int				event;
;496:	vec3_t			dir;
;497:	const char		*s;
;498:	int				clientNum;
;499:	clientInfo_t	*ci;
;500:	
;501:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 502
;502:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 504
;503:
;504:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $330
line 505
;505:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
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
line 506
;506:	}
LABELV $330
line 508
;507:
;508:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $334
line 509
;509:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $329
ADDRGP4 $339
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 510
;510:		return;
ADDRGP4 $329
JUMPV
LABELV $334
line 513
;511:	}
;512:
;513:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 514
;514:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $342
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $340
LABELV $342
line 515
;515:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 516
;516:	}
LABELV $340
line 517
;517:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 519
;518:
;519:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $344
ADDRLP4 8
INDIRI4
CNSTI4 77
GTI4 $344
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1049-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1049
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
address $582
address $587
address $592
address $597
address $602
address $607
address $612
address $617
address $622
address $627
address $632
address $637
address $642
address $647
address $652
address $344
address $678
address $671
address $657
address $664
address $686
address $697
address $782
address $791
address $802
address $756
address $743
address $713
address $718
address $723
address $728
address $769
address $344
address $927
address $935
address $935
address $935
address $941
address $946
address $959
address $972
address $985
address $993
address $1001
address $1008
address $1015
address $708
address $1020
address $344
address $1027
address $1039
address $1034
address $487
code
LABELV $346
line 524
;520:	//
;521:	// movement generated events
;522:	//
;523:	case EV_FOOTSTEP:
;524:		DEBUGNAME("EV_FOOTSTEP");
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
line 525
;525:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 526
;526:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 528
;527:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;528:		}
line 529
;529:		break;
ADDRGP4 $345
JUMPV
LABELV $356
line 531
;530:	case EV_FOOTSTEP_METAL:
;531:		DEBUGNAME("EV_FOOTSTEP_METAL");
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
line 532
;532:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 533
;533:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 535
;534:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;535:		}
line 536
;536:		break;
ADDRGP4 $345
JUMPV
LABELV $367
line 538
;537:	case EV_FOOTSPLASH:
;538:		DEBUGNAME("EV_FOOTSPLASH");
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
line 539
;539:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 540
;540:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 542
;541:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;542:		}
line 543
;543:		break;
ADDRGP4 $345
JUMPV
LABELV $378
line 545
;544:	case EV_FOOTWADE:
;545:		DEBUGNAME("EV_FOOTWADE");
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
line 546
;546:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 547
;547:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 549
;548:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;549:		}
line 550
;550:		break;
ADDRGP4 $345
JUMPV
LABELV $389
line 552
;551:	case EV_SWIM:
;552:		DEBUGNAME("EV_SWIM");
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
line 553
;553:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $345
line 554
;554:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 556
;555:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;556:		}
line 557
;557:		break;
ADDRGP4 $345
JUMPV
LABELV $400
line 561
;558:
;559:
;560:	case EV_FALL_SHORT:
;561:		DEBUGNAME("EV_FALL_SHORT");
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
line 562
;562:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
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
line 563
;563:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $345
line 565
;564:			// smooth landing z changes
;565:			cg.landChange = -8;
ADDRGP4 cg+110996
CNSTF4 3238002688
ASGNF4
line 566
;566:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 567
;567:		}
line 568
;568:		break;
ADDRGP4 $345
JUMPV
LABELV $414
line 570
;569:	case EV_FALL_MEDIUM:
;570:		DEBUGNAME("EV_FALL_MEDIUM");
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
line 572
;571:		// use normal pain sound
;572:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
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
line 573
;573:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $345
line 575
;574:			// smooth landing z changes
;575:			cg.landChange = -16;
ADDRGP4 cg+110996
CNSTF4 3246391296
ASGNF4
line 576
;576:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 577
;577:		}
line 578
;578:		break;
ADDRGP4 $345
JUMPV
LABELV $426
line 580
;579:	case EV_FALL_FAR:
;580:		DEBUGNAME("EV_FALL_FAR");
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
line 581
;581:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
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
line 582
;582:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 583
;583:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $345
line 585
;584:			// smooth landing z changes
;585:			cg.landChange = -24;
ADDRGP4 cg+110996
CNSTF4 3250585600
ASGNF4
line 586
;586:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 587
;587:		}
line 588
;588:		break;
ADDRGP4 $345
JUMPV
LABELV $440
line 594
;589:
;590:	case EV_STEP_4:
;591:	case EV_STEP_8:
;592:	case EV_STEP_12:
;593:	case EV_STEP_16:		// smooth out step up transitions
;594:		DEBUGNAME("EV_STEP");
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
line 595
;595:	{
line 600
;596:		float	oldStep;
;597:		int		delta;
;598:		int		step;
;599:
;600:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $445
line 601
;601:			break;
ADDRGP4 $345
JUMPV
LABELV $445
line 604
;602:		}
;603:		// if we are interpolating, we don't need to smooth steps
;604:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
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
line 605
;605:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 606
;606:			break;
ADDRGP4 $345
JUMPV
LABELV $449
line 609
;607:		}
;608:		// check for stepping up before a previous step is completed
;609:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 610
;610:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $460
line 611
;611:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
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
line 612
;612:		} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 613
;613:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 614
;614:		}
LABELV $461
line 617
;615:
;616:		// add this amount
;617:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 618
;618:		cg.stepChange = oldStep + step;
ADDRGP4 cg+110980
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 619
;619:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+110980
INDIRF4
CNSTF4 1107296256
LEF4 $464
line 620
;620:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+110980
CNSTF4 1107296256
ASGNF4
line 621
;621:		}
LABELV $464
line 622
;622:		cg.stepTime = cg.time;
ADDRGP4 cg+110984
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 623
;623:		break;
ADDRGP4 $345
JUMPV
LABELV $470
line 627
;624:	}
;625:
;626:	case EV_JUMP_PAD:
;627:		DEBUGNAME("EV_JUMP_PAD");
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
line 629
;628://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;629:		{
line 631
;630:			localEntity_t	*smoke;
;631:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $475
INDIRB
ASGNB 12
line 634
;632:
;633:
;634:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
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
line 641
;635:						  32, 
;636:						  1, 1, 1, 0.33f,
;637:						  1000, 
;638:						  cg.time, 0,
;639:						  LEF_PUFF_DONT_SCALE, 
;640:						  cgs.media.smokePuffShader );
;641:		}
line 644
;642:
;643:		// boing sound at origin, jump sound on player
;644:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
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
line 645
;645:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
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
line 646
;646:		break;
ADDRGP4 $345
JUMPV
LABELV $482
line 649
;647:
;648:	case EV_JUMP:
;649:		DEBUGNAME("EV_JUMP");
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
line 650
;650:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
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
line 651
;651:		break;
ADDRGP4 $345
JUMPV
LABELV $487
line 653
;652:	case EV_TAUNT:
;653:		DEBUGNAME("EV_TAUNT");
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
line 654
;654:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $492
line 655
;655:		{
line 657
;656:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;657:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
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
line 658
;658:		}
ADDRGP4 $345
JUMPV
LABELV $492
line 660
;659:		else
;660:		{
line 662
;661:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;662:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
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
line 663
;663:		}
line 664
;664:		break;
ADDRGP4 $345
JUMPV
LABELV $496
line 692
;665:#ifdef MISSIONPACK
;666:	case EV_TAUNT_YES:
;667:		DEBUGNAME("EV_TAUNT_YES");
;668:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;669:		break;
;670:	case EV_TAUNT_NO:
;671:		DEBUGNAME("EV_TAUNT_NO");
;672:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;673:		break;
;674:	case EV_TAUNT_FOLLOWME:
;675:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;676:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;677:		break;
;678:	case EV_TAUNT_GETFLAG:
;679:		DEBUGNAME("EV_TAUNT_GETFLAG");
;680:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;681:		break;
;682:	case EV_TAUNT_GUARDBASE:
;683:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;684:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;685:		break;
;686:	case EV_TAUNT_PATROL:
;687:		DEBUGNAME("EV_TAUNT_PATROL");
;688:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;689:		break;
;690:#endif
;691:	case EV_WATER_TOUCH:
;692:		DEBUGNAME("EV_WATER_TOUCH");
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
line 693
;693:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
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
line 694
;694:		break;
ADDRGP4 $345
JUMPV
LABELV $503
line 696
;695:	case EV_WATER_LEAVE:
;696:		DEBUGNAME("EV_WATER_LEAVE");
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
line 697
;697:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
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
line 698
;698:		break;
ADDRGP4 $345
JUMPV
LABELV $510
line 700
;699:	case EV_WATER_UNDER:
;700:		DEBUGNAME("EV_WATER_UNDER");
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
line 701
;701:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
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
line 702
;702:		break;
ADDRGP4 $345
JUMPV
LABELV $517
line 704
;703:	case EV_WATER_CLEAR:
;704:		DEBUGNAME("EV_WATER_CLEAR");
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
line 705
;705:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
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
line 706
;706:		break;
ADDRGP4 $345
JUMPV
LABELV $523
line 709
;707:
;708:	case EV_ITEM_PICKUP:
;709:		DEBUGNAME("EV_ITEM_PICKUP");
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
line 710
;710:		{
line 714
;711:			gitem_t	*item;
;712:			int		index;
;713:
;714:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 716
;715:
;716:			if ( index < 1 || index >= bg_numItems ) {
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
line 717
;717:				break;
ADDRGP4 $345
JUMPV
LABELV $528
line 719
;718:			}
;719:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 723
;720:
;721:			// powerups and team items will have a separate global sound, this one
;722:			// will be played at prediction time
;723:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
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
line 724
;724:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
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
line 725
;725:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
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
line 742
;726:#ifdef MISSIONPACK
;727:				switch (item->giTag ) {
;728:					case PW_SCOUT:
;729:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;730:					break;
;731:					case PW_GUARD:
;732:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;733:					break;
;734:					case PW_DOUBLER:
;735:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;736:					break;
;737:					case PW_AMMOREGEN:
;738:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;739:					break;
;740:				}
;741:#endif
;742:			} else {
ADDRGP4 $537
JUMPV
LABELV $536
line 743
;743:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 744
;744:			}
LABELV $537
LABELV $532
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
NEI4 $345
line 748
;748:				CG_ItemPickup( index );
ADDRLP4 60
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
ADDRGP4 $345
JUMPV
LABELV $541
line 754
;752:
;753:	case EV_GLOBAL_ITEM_PICKUP:
;754:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
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
line 755
;755:		{
line 759
;756:			gitem_t	*item;
;757:			int		index;
;758:
;759:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 761
;760:
;761:			if ( index < 1 || index >= bg_numItems ) {
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
line 762
;762:				break;
ADDRGP4 $345
JUMPV
LABELV $546
line 764
;763:			}
;764:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 766
;765:			// powerup pickups are global
;766:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $549
line 767
;767:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 768
;768:			}
LABELV $549
line 771
;769:
;770:			// show icon and name on status bar
;771:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 772
;772:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 773
;773:			}
line 774
;774:		}
line 775
;775:		break;
ADDRGP4 $345
JUMPV
LABELV $555
line 781
;776:
;777:	//
;778:	// weapon events
;779:	//
;780:	case EV_NOAMMO:
;781:		DEBUGNAME("EV_NOAMMO");
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
line 783
;782://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;783:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 784
;784:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 785
;785:		}
line 786
;786:		break;
ADDRGP4 $345
JUMPV
LABELV $563
line 788
;787:	case EV_CHANGE_WEAPON:
;788:		DEBUGNAME("EV_CHANGE_WEAPON");
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
line 789
;789:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
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
line 790
;790:		break;
ADDRGP4 $345
JUMPV
LABELV $570
line 792
;791:	case EV_FIRE_WEAPON:
;792:		DEBUGNAME("EV_FIRE_WEAPON");
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
line 793
;793:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 794
;794:		break;
ADDRGP4 $345
JUMPV
LABELV $575
line 797
;795:
;796:	case EV_FIRE_WEAPON2: 
;797:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
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
line 798
;798:		 if (es->weapon == WP_RAILGUN)
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $580
line 799
;799:		 {
line 801
;800:			//CG_DoZoom_f();  // Zoom goes here.  Not quite sure how to do this?
;801:		 } 		
ADDRGP4 $345
JUMPV
LABELV $580
line 803
;802:		 else
;803:		 {
line 804
;804:			CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 805
;805:		 }
line 806
;806:		 break;
ADDRGP4 $345
JUMPV
LABELV $582
line 809
;807:
;808:	case EV_USE_ITEM0:
;809:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $583
ADDRGP4 $586
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $583
line 810
;810:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 811
;811:		break;
ADDRGP4 $345
JUMPV
LABELV $587
line 813
;812:	case EV_USE_ITEM1:
;813:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $588
ADDRGP4 $591
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $588
line 814
;814:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 815
;815:		break;
ADDRGP4 $345
JUMPV
LABELV $592
line 817
;816:	case EV_USE_ITEM2:
;817:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $593
ADDRGP4 $596
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $593
line 818
;818:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 819
;819:		break;
ADDRGP4 $345
JUMPV
LABELV $597
line 821
;820:	case EV_USE_ITEM3:
;821:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $598
ADDRGP4 $601
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $598
line 822
;822:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 823
;823:		break;
ADDRGP4 $345
JUMPV
LABELV $602
line 825
;824:	case EV_USE_ITEM4:
;825:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $603
ADDRGP4 $606
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $603
line 826
;826:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 827
;827:		break;
ADDRGP4 $345
JUMPV
LABELV $607
line 829
;828:	case EV_USE_ITEM5:
;829:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $608
ADDRGP4 $611
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $608
line 830
;830:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 831
;831:		break;
ADDRGP4 $345
JUMPV
LABELV $612
line 833
;832:	case EV_USE_ITEM6:
;833:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $613
ADDRGP4 $616
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $613
line 834
;834:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 835
;835:		break;
ADDRGP4 $345
JUMPV
LABELV $617
line 837
;836:	case EV_USE_ITEM7:
;837:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $618
ADDRGP4 $621
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $618
line 838
;838:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 839
;839:		break;
ADDRGP4 $345
JUMPV
LABELV $622
line 841
;840:	case EV_USE_ITEM8:
;841:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $623
ADDRGP4 $626
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $623
line 842
;842:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 843
;843:		break;
ADDRGP4 $345
JUMPV
LABELV $627
line 845
;844:	case EV_USE_ITEM9:
;845:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $628
ADDRGP4 $631
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $628
line 846
;846:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 847
;847:		break;
ADDRGP4 $345
JUMPV
LABELV $632
line 849
;848:	case EV_USE_ITEM10:
;849:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $633
ADDRGP4 $636
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $633
line 850
;850:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 851
;851:		break;
ADDRGP4 $345
JUMPV
LABELV $637
line 853
;852:	case EV_USE_ITEM11:
;853:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $638
ADDRGP4 $641
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $638
line 854
;854:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 855
;855:		break;
ADDRGP4 $345
JUMPV
LABELV $642
line 857
;856:	case EV_USE_ITEM12:
;857:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $643
ADDRGP4 $646
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $643
line 858
;858:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 859
;859:		break;
ADDRGP4 $345
JUMPV
LABELV $647
line 861
;860:	case EV_USE_ITEM13:
;861:		DEBUGNAME("EV_USE_ITEM13");
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
line 862
;862:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 863
;863:		break;
ADDRGP4 $345
JUMPV
LABELV $652
line 865
;864:	case EV_USE_ITEM14:
;865:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $653
ADDRGP4 $656
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $653
line 866
;866:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 867
;867:		break;
ADDRGP4 $345
JUMPV
LABELV $657
line 875
;868:
;869:	//=================================================================
;870:
;871:	//
;872:	// other events
;873:	//
;874:	case EV_PLAYER_TELEPORT_IN:
;875:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $658
ADDRGP4 $661
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $658
line 876
;876:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
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
line 877
;877:		CG_SpawnEffect( position);
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
LABELV $664
line 881
;879:
;880:	case EV_PLAYER_TELEPORT_OUT:
;881:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $665
ADDRGP4 $668
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $665
line 882
;882:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
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
line 883
;883:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 884
;884:		break;
ADDRGP4 $345
JUMPV
LABELV $671
line 887
;885:
;886:	case EV_ITEM_POP:
;887:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $672
ADDRGP4 $675
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $672
line 888
;888:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 889
;889:		break;
ADDRGP4 $345
JUMPV
LABELV $678
line 891
;890:	case EV_ITEM_RESPAWN:
;891:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $679
ADDRGP4 $682
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $679
line 892
;892:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
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
ADDRGP4 $345
JUMPV
LABELV $686
line 897
;895:
;896:	case EV_GRENADE_BOUNCE:
;897:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $687
ADDRGP4 $690
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $687
line 898
;898:		if ( rand() & 1 ) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $691
line 899
;899:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
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
line 900
;900:		} else {
ADDRGP4 $345
JUMPV
LABELV $691
line 901
;901:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
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
line 902
;902:		}
line 903
;903:		break;
ADDRGP4 $345
JUMPV
LABELV $697
line 906
;904:
;905:	case EV_PL_BOUNCE:
;906:		DEBUGNAME("EV_PL_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $698
ADDRGP4 $701
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $698
line 907
;907:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $702
line 908
;908:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
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
line 909
;909:		} else {
ADDRGP4 $345
JUMPV
LABELV $702
line 910
;910:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
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
line 911
;911:		}
line 912
;912:		break;
ADDRGP4 $345
JUMPV
LABELV $708
line 956
;913:
;914:#ifdef MISSIONPACK
;915:	case EV_PROXIMITY_MINE_STICK:
;916:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;917:		if( es->eventParm & SURF_FLESH ) {
;918:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;919:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;920:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;921:		} else {
;922:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;923:		}
;924:		break;
;925:
;926:	case EV_PROXIMITY_MINE_TRIGGER:
;927:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;928:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;929:		break;
;930:	case EV_KAMIKAZE:
;931:		DEBUGNAME("EV_KAMIKAZE");
;932:		CG_KamikazeEffect( cent->lerpOrigin );
;933:		break;
;934:	case EV_OBELISKEXPLODE:
;935:		DEBUGNAME("EV_OBELISKEXPLODE");
;936:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;937:		break;
;938:	case EV_OBELISKPAIN:
;939:		DEBUGNAME("EV_OBELISKPAIN");
;940:		CG_ObeliskPain( cent->lerpOrigin );
;941:		break;
;942:	case EV_INVUL_IMPACT:
;943:		DEBUGNAME("EV_INVUL_IMPACT");
;944:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;945:		break;
;946:	case EV_JUICED:
;947:		DEBUGNAME("EV_JUICED");
;948:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;949:		break;
;950:	case EV_LIGHTNINGBOLT:
;951:		DEBUGNAME("EV_LIGHTNINGBOLT");
;952:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;953:		break;
;954:#endif
;955:	case EV_SCOREPLUM:
;956:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $709
ADDRGP4 $712
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $709
line 957
;957:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
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
line 958
;958:		break;
ADDRGP4 $345
JUMPV
LABELV $713
line 964
;959:
;960:	//
;961:	// missile impacts
;962:	//
;963:	case EV_MISSILE_HIT:
;964:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $714
ADDRGP4 $717
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $714
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
;966:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 967
;967:		break;
ADDRGP4 $345
JUMPV
LABELV $718
line 970
;968:
;969:	case EV_MISSILE_MISS:
;970:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $719
ADDRGP4 $722
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $719
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
;972:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
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
line 973
;973:		break;
ADDRGP4 $345
JUMPV
LABELV $723
line 976
;974:
;975:	case EV_MISSILE_MISS_METAL:
;976:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $724
ADDRGP4 $727
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $724
line 977
;977:		ByteToDir( es->eventParm, dir );
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
line 978
;978:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_METAL );
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
line 979
;979:		break;
ADDRGP4 $345
JUMPV
LABELV $728
line 982
;980:
;981:	case EV_RAILTRAIL:
;982:		DEBUGNAME("EV_RAILTRAIL");
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
line 983
;983:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 986
;984://unlagged - attack prediction #2
;985:		// if the client is us, unlagged is on server-side, and we've got it client-side
;986:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $733
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $733
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $740
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $733
LABELV $740
line 987
;987:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 990
;988:			// do nothing, because it was already predicted
;989:			//Com_Printf("Ignoring rail trail event\n");
;990:		}
ADDRGP4 $345
JUMPV
LABELV $733
line 991
;991:		else {
line 993
;992:			// draw a rail trail, because it wasn't predicted
;993:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 996
;994:
;995:			// if the end was on a nomark surface, don't make an explosion
;996:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $345
line 997
;997:				ByteToDir( es->eventParm, dir );
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
line 998
;998:				CG_MissileHitWall( cent, es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
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
line 999
;999:			}
line 1001
;1000:			//Com_Printf("Non-predicted rail trail\n");
;1001:		}
line 1003
;1002://unlagged - attack prediction #2
;1003:		break;
ADDRGP4 $345
JUMPV
LABELV $743
line 1006
;1004:
;1005:	case EV_BULLET_HIT_WALL:
;1006:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $744
ADDRGP4 $747
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $744
line 1009
;1007://unlagged - attack prediction #2
;1008:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1009:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $748
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $748
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $755
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $748
LABELV $755
line 1010
;1010:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1013
;1011:			// do nothing, because it was already predicted
;1012:			//Com_Printf("Ignoring bullet event\n");
;1013:		}
ADDRGP4 $345
JUMPV
LABELV $748
line 1014
;1014:		else {
line 1016
;1015:			// do the bullet, because it wasn't predicted
;1016:			ByteToDir( es->eventParm, dir );
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
line 1017
;1017:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1019
;1018:			//Com_Printf("Non-predicted bullet\n");
;1019:		}
line 1021
;1020://unlagged - attack prediction #2
;1021:		break;
ADDRGP4 $345
JUMPV
LABELV $756
line 1024
;1022:
;1023:	case EV_BULLET_HIT_FLESH:
;1024:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $757
ADDRGP4 $760
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $757
line 1027
;1025://unlagged - attack prediction #2
;1026:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1027:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $761
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $761
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $768
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $761
LABELV $768
line 1028
;1028:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1031
;1029:			// do nothing, because it was already predicted
;1030:			//Com_Printf("Ignoring bullet event\n");
;1031:		}
ADDRGP4 $345
JUMPV
LABELV $761
line 1032
;1032:		else {
line 1034
;1033:			// do the bullet, because it wasn't predicted
;1034:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1036
;1035:			//Com_Printf("Non-predicted bullet\n");
;1036:		}
line 1038
;1037://unlagged - attack prediction #2
;1038:		break;
ADDRGP4 $345
JUMPV
LABELV $769
line 1041
;1039:
;1040:	case EV_SHOTGUN:
;1041:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $770
ADDRGP4 $773
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $770
line 1044
;1042://unlagged - attack prediction #2
;1043:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1044:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $774
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+155528
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $774
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $781
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $774
LABELV $781
line 1045
;1045:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1048
;1046:			// do nothing, because it was already predicted
;1047:			//Com_Printf("Ignoring shotgun event\n");
;1048:		}
ADDRGP4 $345
JUMPV
LABELV $774
line 1049
;1049:		else {
line 1051
;1050:			// do the shotgun pattern, because it wasn't predicted
;1051:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1053
;1052:			//Com_Printf("Non-predicted shotgun pattern\n");
;1053:		}
line 1055
;1054://unlagged - attack prediction #2
;1055:		break;
ADDRGP4 $345
JUMPV
LABELV $782
line 1058
;1056:
;1057:	case EV_GENERAL_SOUND:
;1058:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $783
ADDRGP4 $786
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $783
line 1059
;1059:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $787
line 1060
;1060:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1061
;1061:		} else {
ADDRGP4 $345
JUMPV
LABELV $787
line 1062
;1062:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1063
;1063:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
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
line 1064
;1064:		}
line 1065
;1065:		break;
ADDRGP4 $345
JUMPV
LABELV $791
line 1068
;1066:
;1067:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1068:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $792
ADDRGP4 $795
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $792
line 1069
;1069:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $796
line 1070
;1070:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
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
line 1071
;1071:		} else {
ADDRGP4 $345
JUMPV
LABELV $796
line 1072
;1072:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1073
;1073:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
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
line 1074
;1074:		}
line 1075
;1075:		break;
ADDRGP4 $345
JUMPV
LABELV $802
line 1078
;1076:
;1077:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1078:		{
line 1079
;1079:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $803
ADDRGP4 $806
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $803
line 1080
;1080:			switch( es->eventParm ) {
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
ADDRGP4 $926
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $926
address $810
address $820
address $830
address $842
address $854
address $874
address $894
address $902
address $910
address $913
address $916
address $919
address $922
address $345
code
LABELV $810
line 1082
;1081:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1082:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $811
line 1083
;1083:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+154388+976
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $345
JUMPV
LABELV $811
line 1085
;1084:					else
;1085:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+154388+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1086
;1086:					break;
ADDRGP4 $345
JUMPV
LABELV $820
line 1088
;1087:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1088:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $821
line 1089
;1089:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+154388+976
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $345
JUMPV
LABELV $821
line 1091
;1090:					else
;1091:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+154388+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1092
;1092:					break;
ADDRGP4 $345
JUMPV
LABELV $830
line 1094
;1093:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1094:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $831
line 1095
;1095:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+154388+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $832
JUMPV
LABELV $831
line 1097
;1096:					else
;1097:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+154388+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $832
line 1099
;1098:					//
;1099:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+154388+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1100
;1100:					break;
ADDRGP4 $345
JUMPV
LABELV $842
line 1102
;1101:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1102:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $843
line 1103
;1103:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+154388+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $844
JUMPV
LABELV $843
line 1105
;1104:					else
;1105:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+154388+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $844
line 1107
;1106:					//
;1107:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+154388+1000
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1108
;1108:					break;
ADDRGP4 $345
JUMPV
LABELV $854
line 1112
;1109:
;1110:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1111:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1112:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $859
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $855
LABELV $859
line 1113
;1113:					}
ADDRGP4 $345
JUMPV
LABELV $855
line 1114
;1114:					else {
line 1115
;1115:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $860
line 1121
;1116:#ifdef MISSIONPACK
;1117:							if (cgs.gametype == GT_1FCTF) 
;1118:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1119:							else
;1120:#endif
;1121:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+154388+1012
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1122
;1122:						}
ADDRGP4 $345
JUMPV
LABELV $860
line 1123
;1123:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $345
line 1129
;1124:#ifdef MISSIONPACK
;1125:							if (cgs.gametype == GT_1FCTF)
;1126:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1127:							else
;1128:#endif
;1129: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+154388+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1130
;1130:						}
line 1131
;1131:					}
line 1132
;1132:					break;
ADDRGP4 $345
JUMPV
LABELV $874
line 1135
;1133:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1134:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1135:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $879
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $875
LABELV $879
line 1136
;1136:					}
ADDRGP4 $345
JUMPV
LABELV $875
line 1137
;1137:					else {
line 1138
;1138:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $880
line 1144
;1139:#ifdef MISSIONPACK
;1140:							if (cgs.gametype == GT_1FCTF)
;1141:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1142:							else
;1143:#endif
;1144:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+154388+1012
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1145
;1145:						}
ADDRGP4 $345
JUMPV
LABELV $880
line 1146
;1146:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $345
line 1152
;1147:#ifdef MISSIONPACK
;1148:							if (cgs.gametype == GT_1FCTF)
;1149:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1150:							else
;1151:#endif
;1152:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+154388+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1153
;1153:						}
line 1154
;1154:					}
line 1155
;1155:					break;
ADDRGP4 $345
JUMPV
LABELV $894
line 1157
;1156:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1157:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $345
line 1158
;1158:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+154388+1032
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1159
;1159:					}
line 1160
;1160:					break;
ADDRGP4 $345
JUMPV
LABELV $902
line 1162
;1161:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1162:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $345
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
ADDRGP4 $345
JUMPV
LABELV $910
line 1168
;1166:
;1167:				case GTS_REDTEAM_SCORED:
;1168:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+154388+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1169
;1169:					break;
ADDRGP4 $345
JUMPV
LABELV $913
line 1171
;1170:				case GTS_BLUETEAM_SCORED:
;1171:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+154388+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1172
;1172:					break;
ADDRGP4 $345
JUMPV
LABELV $916
line 1174
;1173:				case GTS_REDTEAM_TOOK_LEAD:
;1174:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+154388+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1175
;1175:					break;
ADDRGP4 $345
JUMPV
LABELV $919
line 1177
;1176:				case GTS_BLUETEAM_TOOK_LEAD:
;1177:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+154388+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1178
;1178:					break;
ADDRGP4 $345
JUMPV
LABELV $922
line 1180
;1179:				case GTS_TEAMS_ARE_TIED:
;1180:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+154388+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1181
;1181:					break;
line 1184
;1182:				case GTS_KAMIKAZE:
;1183:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1184:					break;
line 1187
;1185:
;1186:				default:
;1187:					break;
line 1189
;1188:			}
;1189:			break;
ADDRGP4 $345
JUMPV
LABELV $927
line 1195
;1190:		}
;1191:
;1192:	case EV_PAIN:
;1193:		// local player sounds are triggered in CG_CheckLocalSounds,
;1194:		// so ignore events on the player
;1195:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $928
ADDRGP4 $931
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $928
line 1196
;1196:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $345
line 1197
;1197:			CG_PainEvent( cent, es->eventParm );
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
line 1198
;1198:		}
line 1199
;1199:		break;
ADDRGP4 $345
JUMPV
LABELV $935
line 1204
;1200:
;1201:	case EV_DEATH1:
;1202:	case EV_DEATH2:
;1203:	case EV_DEATH3:
;1204:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $936
ADDRGP4 $939
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $936
line 1205
;1205:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $940
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
line 1207
;1206:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1207:		break;
ADDRGP4 $345
JUMPV
LABELV $941
line 1211
;1208:
;1209:
;1210:	case EV_OBITUARY:
;1211:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $942
ADDRGP4 $945
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $942
line 1212
;1212:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1213
;1213:		break;
ADDRGP4 $345
JUMPV
LABELV $946
line 1219
;1214:
;1215:	//
;1216:	// powerup events
;1217:	//
;1218:	case EV_POWERUP_QUAD:
;1219:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $947
ADDRGP4 $950
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $947
line 1220
;1220:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $951
line 1221
;1221:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+126476
CNSTI4 1
ASGNI4
line 1222
;1222:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1223
;1223:		}
LABELV $951
line 1224
;1224:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
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
line 1225
;1225:		break;
ADDRGP4 $345
JUMPV
LABELV $959
line 1227
;1226:	case EV_POWERUP_BATTLESUIT:
;1227:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $960
ADDRGP4 $963
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $960
line 1228
;1228:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $964
line 1229
;1229:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+126476
CNSTI4 2
ASGNI4
line 1230
;1230:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1231
;1231:		}
LABELV $964
line 1232
;1232:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
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
line 1233
;1233:		break;
ADDRGP4 $345
JUMPV
LABELV $972
line 1235
;1234:	case EV_POWERUP_REGEN:
;1235:		DEBUGNAME("EV_POWERUP_REGEN");
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
line 1236
;1236:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $977
line 1237
;1237:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+126476
CNSTI4 5
ASGNI4
line 1238
;1238:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1239
;1239:		}
LABELV $977
line 1240
;1240:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
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
line 1241
;1241:		break;
ADDRGP4 $345
JUMPV
LABELV $985
line 1244
;1242:
;1243:	case EV_IMMOBILIZED:
;1244:		DEBUGNAME("EV_IMMOBILIZED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $986
ADDRGP4 $989
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $986
line 1245
;1245:		if ( es->number == cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 1246
;1246:		{ //-Vincent
line 1247
;1247:		ci->cgimmobilized = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1248
;1248:		}
line 1249
;1249:		break;
ADDRGP4 $345
JUMPV
LABELV $993
line 1252
;1250:
;1251:	case EV_IMMOBILIZED_FREE:
;1252:		DEBUGNAME("EV_IMMOBILIZED_FREE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $994
ADDRGP4 $997
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $994
line 1253
;1253:		if ( es->number == cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $345
line 1254
;1254:		{ //-Vincent
line 1255
;1255:		ci->cgimmobilized = qfalse;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1256
;1256:		}
line 1257
;1257:		break;
ADDRGP4 $345
JUMPV
LABELV $1001
line 1260
;1258:
;1259:	case EV_GIB_PLAYER:
;1260:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1002
ADDRGP4 $1005
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1002
line 1267
;1261:		// don't play gib sound when using the kamikaze because it interferes
;1262:		// with the kamikaze sound, downside is that the gib sound will also
;1263:		// not be played when someone is gibbed while just carrying the kamikaze
;1264:		
;1265:		// We've used this bit
;1266:		//if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1267:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1270
;1268:		//}
;1269:		
;1270:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1271
;1271:		break;
ADDRGP4 $345
JUMPV
LABELV $1008
line 1275
;1272:
;1273:	// Shafe - Trep - Headshot stuff
;1274:	case EV_GIB_PLAYER_HEADSHOT:
;1275:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1009
ADDRGP4 $1012
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1009
line 1276
;1276:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1277
;1277:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1278
;1278:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1279
;1279:		break;
ADDRGP4 $345
JUMPV
LABELV $1015
line 1282
;1280:
;1281:	case EV_BODY_NOHEAD:
;1282:		DEBUGNAME("EV_BODY_NOHEAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1016
ADDRGP4 $1019
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1016
line 1283
;1283:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1284
;1284:		break;
ADDRGP4 $345
JUMPV
LABELV $1020
line 1287
;1285:	// Shafe - Trep - End Headshot Stuff
;1286:	case EV_BREAK_GLASS:
;1287: 		DEBUGNAME("EV_BREAK_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1021
ADDRGP4 $1024
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1021
line 1289
;1288: 		// Change cgs.media.gibSound to whatever sound you want it to use
;1289:  		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.glassSound );
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
line 1290
;1290: 		CG_BreakGlass( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_BreakGlass
CALLV
pop
line 1291
;1291: 		break;
ADDRGP4 $345
JUMPV
LABELV $1027
line 1293
;1292:	case EV_ERROR:
;1293: 		DEBUGNAME("EV_ERROR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1028
ADDRGP4 $1031
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1028
line 1294
;1294: 		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.errorSound );
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
line 1295
;1295: 		break;
ADDRGP4 $345
JUMPV
LABELV $1034
line 1297
;1296:	case EV_STOPLOOPINGSOUND:
;1297:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1035
ADDRGP4 $1038
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1035
line 1298
;1298:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1299
;1299:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1300
;1300:		break;
ADDRGP4 $345
JUMPV
LABELV $1039
line 1303
;1301:
;1302:	case EV_DEBUG_LINE:
;1303:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1040
ADDRGP4 $1043
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1040
line 1304
;1304:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1305
;1305:		break;
ADDRGP4 $345
JUMPV
LABELV $344
line 1308
;1306:
;1307:	default:
;1308:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1044
ADDRGP4 $1047
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1044
line 1309
;1309:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1048
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1310
;1310:		break;
LABELV $345
line 1313
;1311:	}
;1312:
;1313:}
LABELV $329
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1322
;1314:
;1315:
;1316:/*
;1317:==============
;1318:CG_CheckEvents
;1319:
;1320:==============
;1321:*/
;1322:void CG_CheckEvents( centity_t *cent ) {
line 1324
;1323:	// check for event-only entities
;1324:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1052
line 1325
;1325:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1054
line 1326
;1326:			return;	// already fired
ADDRGP4 $1051
JUMPV
LABELV $1054
line 1329
;1327:		}
;1328:		// if this is a player event set the entity number of the client entity number
;1329:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1056
line 1330
;1330:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1331
;1331:		}
LABELV $1056
line 1333
;1332:
;1333:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 1335
;1334:
;1335:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1336
;1336:	} else {
ADDRGP4 $1053
JUMPV
LABELV $1052
line 1338
;1337:		// check for events riding with another entity
;1338:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $1058
line 1339
;1339:			return;
ADDRGP4 $1051
JUMPV
LABELV $1058
line 1341
;1340:		}
;1341:		cent->previousEvent = cent->currentState.event;
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
line 1342
;1342:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1060
line 1343
;1343:			return;
ADDRGP4 $1051
JUMPV
LABELV $1060
line 1345
;1344:		}
;1345:	}
LABELV $1053
line 1348
;1346:
;1347:	// calculate the position at exactly the frame time
;1348:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1349
;1349:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1351
;1350:
;1351:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1352
;1352:}
LABELV $1051
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
LABELV $1048
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
LABELV $1047
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
LABELV $1043
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
LABELV $1038
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
LABELV $1031
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
LABELV $1024
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
LABELV $1019
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
LABELV $1012
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
LABELV $1005
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
LABELV $997
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
LABELV $989
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
LABELV $976
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
LABELV $963
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
LABELV $950
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
LABELV $945
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
LABELV $940
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
LABELV $939
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
LABELV $931
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
LABELV $806
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
LABELV $795
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
LABELV $786
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
LABELV $773
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
LABELV $760
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
LABELV $747
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
LABELV $732
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
LABELV $727
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
LABELV $722
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
LABELV $717
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
LABELV $712
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
LABELV $701
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
LABELV $690
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
LABELV $682
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
LABELV $675
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
LABELV $668
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
LABELV $661
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
LABELV $656
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
LABELV $651
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
LABELV $646
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
LABELV $641
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
LABELV $636
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
LABELV $631
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
LABELV $626
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
LABELV $621
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
LABELV $616
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
LABELV $611
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
LABELV $606
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
LABELV $601
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
LABELV $596
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
LABELV $591
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
LABELV $586
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
