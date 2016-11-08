bss
align 1
LABELV $73
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../cg_event.c"
line 23
;1:// 2016 Trepidation Licensed under the GPL2
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
;115:		message = "drowned";
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
;121:		message = "burned up";
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
;409:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound ); //-Vincent
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
line 410
;410:		break;
LABELV $287
line 423
;411:
;412:#ifdef MISSIONPACK
;413:	case HI_KAMIKAZE:
;414:		break;
;415:	case HI_PORTAL:
;416:		break;
;417:	case HI_INVULNERABILITY:
;418:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;419:		break;
;420:#endif
;421:	}
;422:
;423:}
LABELV $275
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 432
;424:
;425:/*
;426:================
;427:CG_ItemPickup
;428:
;429:A new item was picked up this frame
;430:================
;431:*/
;432:static void CG_ItemPickup( int itemNum ) {
line 433
;433:	cg.itemPickup = itemNum;
ADDRGP4 cg+126732
ADDRFP4 0
INDIRI4
ASGNI4
line 434
;434:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+126736
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 435
;435:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+126740
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 437
;436:	// see if it should be the grabbed weapon
;437:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $301
line 439
;438:		// select it immediately
;439:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $304
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $304
line 440
;440:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 441
;441:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+111004
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 443
;442:
;443:		}
LABELV $304
line 444
;444:	}
LABELV $301
line 446
;445:
;446:}
LABELV $295
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 456
;447:
;448:
;449:/*
;450:================
;451:CG_PainEvent
;452:
;453:Also called by playerstate transition
;454:================
;455:*/
;456:void CG_PainEvent( centity_t *cent, int health ) {
line 460
;457:	char	*snd;
;458:
;459:	// don't do more than two pain sounds a second
;460:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $313
line 461
;461:		return;
ADDRGP4 $312
JUMPV
LABELV $313
line 464
;462:	}
;463:
;464:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $316
line 465
;465:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $318
ASGNP4
line 466
;466:	} else if ( health < 50 ) {
ADDRGP4 $317
JUMPV
LABELV $316
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $319
line 467
;467:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $321
ASGNP4
line 468
;468:	} else if ( health < 75 ) {
ADDRGP4 $320
JUMPV
LABELV $319
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $322
line 469
;469:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $324
ASGNP4
line 470
;470:	} else {
ADDRGP4 $323
JUMPV
LABELV $322
line 471
;471:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $325
ASGNP4
line 472
;472:	}
LABELV $323
LABELV $320
LABELV $317
line 473
;473:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
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
line 477
;474:		CG_CustomSound( cent->currentState.number, snd ) );
;475:
;476:	// save pain time for programitic twitch animation
;477:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 478
;478:	cent->pe.painDirection ^= 1;
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
line 479
;479:}
LABELV $312
endproc CG_PainEvent 12 16
lit
align 4
LABELV $473
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 112 48
line 492
;480:
;481:
;482:
;483:/*
;484:==============
;485:CG_EntityEvent
;486:
;487:An entity has an event value
;488:also called by CG_CheckPlayerstateEvents
;489:==============
;490:*/
;491:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;492:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 500
;493:	entityState_t	*es;
;494:	int				event;
;495:	vec3_t			dir;
;496:	const char		*s;
;497:	int				clientNum;
;498:	clientInfo_t	*ci;
;499:	
;500:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 501
;501:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 503
;502:
;503:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $328
line 504
;504:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $331
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
line 505
;505:	}
LABELV $328
line 507
;506:
;507:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $332
line 508
;508:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $327
ADDRGP4 $337
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 509
;509:		return;
ADDRGP4 $327
JUMPV
LABELV $332
line 512
;510:	}
;511:
;512:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 513
;513:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $340
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $338
LABELV $340
line 514
;514:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 515
;515:	}
LABELV $338
line 516
;516:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1740
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 518
;517:
;518:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $342
ADDRLP4 8
INDIRI4
CNSTI4 77
GTI4 $342
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1055-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1055
address $344
address $354
address $365
address $376
address $387
address $438
address $438
address $438
address $438
address $398
address $412
address $424
address $468
address $480
address $494
address $501
address $508
address $515
address $521
address $539
address $553
address $561
address $568
address $573
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
address $342
address $676
address $669
address $655
address $662
address $684
address $695
address $788
address $797
address $808
address $754
address $741
address $711
address $716
address $721
address $726
address $767
address $342
address $933
address $941
address $941
address $941
address $947
address $952
address $965
address $978
address $991
address $999
address $1007
address $1014
address $1021
address $706
address $1026
address $342
address $1033
address $1045
address $1040
address $485
code
LABELV $344
line 523
;519:	//
;520:	// movement generated events
;521:	//
;522:	case EV_FOOTSTEP:
;523:		DEBUGNAME("EV_FOOTSTEP");
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
line 524
;524:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
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
line 527
;526:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;527:		}
line 528
;528:		break;
ADDRGP4 $343
JUMPV
LABELV $354
line 530
;529:	case EV_FOOTSTEP_METAL:
;530:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $355
ADDRGP4 $358
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $355
line 531
;531:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
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
ADDRGP4 cgs+154388+620+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 534
;533:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;534:		}
line 535
;535:		break;
ADDRGP4 $343
JUMPV
LABELV $365
line 537
;536:	case EV_FOOTSPLASH:
;537:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $366
ADDRGP4 $369
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $366
line 538
;538:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
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
ADDRGP4 cgs+154388+620+96
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
ADDRGP4 $343
JUMPV
LABELV $376
line 544
;543:	case EV_FOOTWADE:
;544:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $377
ADDRGP4 $380
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $377
line 545
;545:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 546
;546:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 548
;547:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;548:		}
line 549
;549:		break;
ADDRGP4 $343
JUMPV
LABELV $387
line 551
;550:	case EV_SWIM:
;551:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $388
ADDRGP4 $391
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $388
line 552
;552:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 553
;553:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 555
;554:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;555:		}
line 556
;556:		break;
ADDRGP4 $343
JUMPV
LABELV $398
line 560
;557:
;558:
;559:	case EV_FALL_SHORT:
;560:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $399
ADDRGP4 $402
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $399
line 561
;561:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
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
line 562
;562:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $343
line 564
;563:			// smooth landing z changes
;564:			cg.landChange = -8;
ADDRGP4 cg+110996
CNSTF4 3238002688
ASGNF4
line 565
;565:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 566
;566:		}
line 567
;567:		break;
ADDRGP4 $343
JUMPV
LABELV $412
line 569
;568:	case EV_FALL_MEDIUM:
;569:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $413
ADDRGP4 $416
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $413
line 571
;570:		// use normal pain sound
;571:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $325
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
line 572
;572:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $343
line 574
;573:			// smooth landing z changes
;574:			cg.landChange = -16;
ADDRGP4 cg+110996
CNSTF4 3246391296
ASGNF4
line 575
;575:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 576
;576:		}
line 577
;577:		break;
ADDRGP4 $343
JUMPV
LABELV $424
line 579
;578:	case EV_FALL_FAR:
;579:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $425
ADDRGP4 $428
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $425
line 580
;580:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $429
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
line 581
;581:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 582
;582:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $343
line 584
;583:			// smooth landing z changes
;584:			cg.landChange = -24;
ADDRGP4 cg+110996
CNSTF4 3250585600
ASGNF4
line 585
;585:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 586
;586:		}
line 587
;587:		break;
ADDRGP4 $343
JUMPV
LABELV $438
line 593
;588:
;589:	case EV_STEP_4:
;590:	case EV_STEP_8:
;591:	case EV_STEP_12:
;592:	case EV_STEP_16:		// smooth out step up transitions
;593:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $439
ADDRGP4 $442
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $439
line 594
;594:	{
line 599
;595:		float	oldStep;
;596:		int		delta;
;597:		int		step;
;598:
;599:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $443
line 600
;600:			break;
ADDRGP4 $343
JUMPV
LABELV $443
line 603
;601:		}
;602:		// if we are interpolating, we don't need to smooth steps
;603:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $455
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $455
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $455
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $447
LABELV $455
line 604
;604:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 605
;605:			break;
ADDRGP4 $343
JUMPV
LABELV $447
line 608
;606:		}
;607:		// check for stepping up before a previous step is completed
;608:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 609
;609:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $458
line 610
;610:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
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
line 611
;611:		} else {
ADDRGP4 $459
JUMPV
LABELV $458
line 612
;612:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 613
;613:		}
LABELV $459
line 616
;614:
;615:		// add this amount
;616:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 617
;617:		cg.stepChange = oldStep + step;
ADDRGP4 cg+110980
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 618
;618:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+110980
INDIRF4
CNSTF4 1107296256
LEF4 $462
line 619
;619:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+110980
CNSTF4 1107296256
ASGNF4
line 620
;620:		}
LABELV $462
line 621
;621:		cg.stepTime = cg.time;
ADDRGP4 cg+110984
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 622
;622:		break;
ADDRGP4 $343
JUMPV
LABELV $468
line 626
;623:	}
;624:
;625:	case EV_JUMP_PAD:
;626:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $469
ADDRGP4 $472
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $469
line 628
;627://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;628:		{
line 630
;629:			localEntity_t	*smoke;
;630:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $473
INDIRB
ASGNB 12
line 633
;631:
;632:
;633:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
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
line 640
;634:						  32, 
;635:						  1, 1, 1, 0.33f,
;636:						  1000, 
;637:						  cg.time, 0,
;638:						  LEF_PUFF_DONT_SCALE, 
;639:						  cgs.media.smokePuffShader );
;640:		}
line 643
;641:
;642:		// boing sound at origin, jump sound on player
;643:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
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
line 644
;644:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $479
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
line 645
;645:		break;
ADDRGP4 $343
JUMPV
LABELV $480
line 648
;646:
;647:	case EV_JUMP:
;648:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $481
ADDRGP4 $484
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $481
line 649
;649:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $479
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
line 650
;650:		break;
ADDRGP4 $343
JUMPV
LABELV $485
line 652
;651:	case EV_TAUNT:
;652:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $486
ADDRGP4 $489
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $486
line 653
;653:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
NEI4 $490
line 654
;654:		{
line 656
;655:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;656:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $492
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
line 657
;657:		}
ADDRGP4 $343
JUMPV
LABELV $490
line 659
;658:		else
;659:		{
line 661
;660:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;661:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
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
ADDRGP4 $493
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
line 662
;662:		}
line 663
;663:		break;
ADDRGP4 $343
JUMPV
LABELV $494
line 691
;664:#ifdef MISSIONPACK
;665:	case EV_TAUNT_YES:
;666:		DEBUGNAME("EV_TAUNT_YES");
;667:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;668:		break;
;669:	case EV_TAUNT_NO:
;670:		DEBUGNAME("EV_TAUNT_NO");
;671:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;672:		break;
;673:	case EV_TAUNT_FOLLOWME:
;674:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;675:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;676:		break;
;677:	case EV_TAUNT_GETFLAG:
;678:		DEBUGNAME("EV_TAUNT_GETFLAG");
;679:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;680:		break;
;681:	case EV_TAUNT_GUARDBASE:
;682:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;683:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;684:		break;
;685:	case EV_TAUNT_PATROL:
;686:		DEBUGNAME("EV_TAUNT_PATROL");
;687:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;688:		break;
;689:#endif
;690:	case EV_WATER_TOUCH:
;691:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $495
ADDRGP4 $498
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $495
line 692
;692:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
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
line 693
;693:		break;
ADDRGP4 $343
JUMPV
LABELV $501
line 695
;694:	case EV_WATER_LEAVE:
;695:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $502
ADDRGP4 $505
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $502
line 696
;696:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
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
line 697
;697:		break;
ADDRGP4 $343
JUMPV
LABELV $508
line 699
;698:	case EV_WATER_UNDER:
;699:		DEBUGNAME("EV_WATER_UNDER");
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
line 700
;700:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
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
line 701
;701:		break;
ADDRGP4 $343
JUMPV
LABELV $515
line 703
;702:	case EV_WATER_CLEAR:
;703:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $516
ADDRGP4 $519
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $516
line 704
;704:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $520
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
line 705
;705:		break;
ADDRGP4 $343
JUMPV
LABELV $521
line 708
;706:
;707:	case EV_ITEM_PICKUP:
;708:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $522
ADDRGP4 $525
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $522
line 709
;709:		{
line 713
;710:			gitem_t	*item;
;711:			int		index;
;712:
;713:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 715
;714:
;715:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $528
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $526
LABELV $528
line 716
;716:				break;
ADDRGP4 $343
JUMPV
LABELV $526
line 718
;717:			}
;718:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 722
;719:
;720:			// powerups and team items will have a separate global sound, this one
;721:			// will be played at prediction time
;722:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
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
EQI4 $531
ADDRLP4 72
INDIRI4
CNSTI4 8
NEI4 $529
LABELV $531
line 723
;723:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
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
line 724
;724:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $530
JUMPV
LABELV $529
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $534
line 741
;725:#ifdef MISSIONPACK
;726:				switch (item->giTag ) {
;727:					case PW_SCOUT:
;728:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;729:					break;
;730:					case PW_GUARD:
;731:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;732:					break;
;733:					case PW_DOUBLER:
;734:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;735:					break;
;736:					case PW_AMMOREGEN:
;737:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;738:					break;
;739:				}
;740:#endif
;741:			} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 742
;742:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 743
;743:			}
LABELV $535
LABELV $530
line 746
;744:
;745:			// show icon and name on status bar
;746:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 747
;747:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 748
;748:			}
line 749
;749:		}
line 750
;750:		break;
ADDRGP4 $343
JUMPV
LABELV $539
line 753
;751:
;752:	case EV_GLOBAL_ITEM_PICKUP:
;753:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $540
ADDRGP4 $543
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $540
line 754
;754:		{
line 758
;755:			gitem_t	*item;
;756:			int		index;
;757:
;758:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 760
;759:
;760:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $546
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $544
LABELV $546
line 761
;761:				break;
ADDRGP4 $343
JUMPV
LABELV $544
line 763
;762:			}
;763:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 765
;764:			// powerup pickups are global
;765:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $547
line 766
;766:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 767
;767:			}
LABELV $547
line 770
;768:
;769:			// show icon and name on status bar
;770:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 771
;771:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 772
;772:			}
line 773
;773:		}
line 774
;774:		break;
ADDRGP4 $343
JUMPV
LABELV $553
line 780
;775:
;776:	//
;777:	// weapon events
;778:	//
;779:	case EV_NOAMMO:
;780:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $554
ADDRGP4 $557
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $554
line 782
;781://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;782:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 783
;783:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 784
;784:		}
line 785
;785:		break;
ADDRGP4 $343
JUMPV
LABELV $561
line 787
;786:	case EV_CHANGE_WEAPON:
;787:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $562
ADDRGP4 $565
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $562
line 788
;788:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
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
line 789
;789:		break;
ADDRGP4 $343
JUMPV
LABELV $568
line 791
;790:	case EV_FIRE_WEAPON:
;791:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $569
ADDRGP4 $572
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $569
line 792
;792:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 793
;793:		break;
ADDRGP4 $343
JUMPV
LABELV $573
line 796
;794:
;795:	case EV_FIRE_WEAPON2: 
;796:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $574
ADDRGP4 $577
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $574
line 797
;797:		 if (es->weapon == WP_RAILGUN)
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $578
line 798
;798:		 {
line 802
;799:			//CG_DoZoom_f();  // Zoom goes here.  Not quite sure how to do this?
;800:			//CG_ZoomDown_f();
;801:			
;802:		 } 		
ADDRGP4 $343
JUMPV
LABELV $578
line 804
;803:		 else
;804:		 {
line 805
;805:			CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 806
;806:		 }
line 807
;807:		 break;
ADDRGP4 $343
JUMPV
LABELV $580
line 810
;808:
;809:	case EV_USE_ITEM0:
;810:		DEBUGNAME("EV_USE_ITEM0");
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
ADDRGP4 $343
JUMPV
LABELV $585
line 814
;813:	case EV_USE_ITEM1:
;814:		DEBUGNAME("EV_USE_ITEM1");
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
ADDRGP4 $343
JUMPV
LABELV $590
line 818
;817:	case EV_USE_ITEM2:
;818:		DEBUGNAME("EV_USE_ITEM2");
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
ADDRGP4 $343
JUMPV
LABELV $595
line 822
;821:	case EV_USE_ITEM3:
;822:		DEBUGNAME("EV_USE_ITEM3");
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
ADDRGP4 $343
JUMPV
LABELV $600
line 826
;825:	case EV_USE_ITEM4:
;826:		DEBUGNAME("EV_USE_ITEM4");
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
ADDRGP4 $343
JUMPV
LABELV $605
line 830
;829:	case EV_USE_ITEM5:
;830:		DEBUGNAME("EV_USE_ITEM5");
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
ADDRGP4 $343
JUMPV
LABELV $610
line 834
;833:	case EV_USE_ITEM6:
;834:		DEBUGNAME("EV_USE_ITEM6");
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
ADDRGP4 $343
JUMPV
LABELV $615
line 838
;837:	case EV_USE_ITEM7:
;838:		DEBUGNAME("EV_USE_ITEM7");
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
ADDRGP4 $343
JUMPV
LABELV $620
line 842
;841:	case EV_USE_ITEM8:
;842:		DEBUGNAME("EV_USE_ITEM8");
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
ADDRGP4 $343
JUMPV
LABELV $625
line 846
;845:	case EV_USE_ITEM9:
;846:		DEBUGNAME("EV_USE_ITEM9");
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
ADDRGP4 $343
JUMPV
LABELV $630
line 850
;849:	case EV_USE_ITEM10:
;850:		DEBUGNAME("EV_USE_ITEM10");
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
ADDRGP4 $343
JUMPV
LABELV $635
line 854
;853:	case EV_USE_ITEM11:
;854:		DEBUGNAME("EV_USE_ITEM11");
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
ADDRGP4 $343
JUMPV
LABELV $640
line 858
;857:	case EV_USE_ITEM12:
;858:		DEBUGNAME("EV_USE_ITEM12");
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
ADDRGP4 $343
JUMPV
LABELV $645
line 862
;861:	case EV_USE_ITEM13:
;862:		DEBUGNAME("EV_USE_ITEM13");
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
ADDRGP4 $343
JUMPV
LABELV $650
line 866
;865:	case EV_USE_ITEM14:
;866:		DEBUGNAME("EV_USE_ITEM14");
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
ADDRGP4 $343
JUMPV
LABELV $655
line 876
;869:
;870:	//=================================================================
;871:
;872:	//
;873:	// other events
;874:	//
;875:	case EV_PLAYER_TELEPORT_IN:
;876:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
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
line 877
;877:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
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
line 878
;878:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 879
;879:		break;
ADDRGP4 $343
JUMPV
LABELV $662
line 882
;880:
;881:	case EV_PLAYER_TELEPORT_OUT:
;882:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
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
line 883
;883:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
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
line 884
;884:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 885
;885:		break;
ADDRGP4 $343
JUMPV
LABELV $669
line 888
;886:
;887:	case EV_ITEM_POP:
;888:		DEBUGNAME("EV_ITEM_POP");
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
line 889
;889:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 890
;890:		break;
ADDRGP4 $343
JUMPV
LABELV $676
line 892
;891:	case EV_ITEM_RESPAWN:
;892:		DEBUGNAME("EV_ITEM_RESPAWN");
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
line 893
;893:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 894
;894:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 895
;895:		break;
ADDRGP4 $343
JUMPV
LABELV $684
line 898
;896:
;897:	case EV_GRENADE_BOUNCE:
;898:		DEBUGNAME("EV_GRENADE_BOUNCE");
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
line 899
;899:		if ( rand() & 1 ) {
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
line 900
;900:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
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
line 901
;901:		} else {
ADDRGP4 $343
JUMPV
LABELV $689
line 902
;902:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
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
line 903
;903:		}
line 904
;904:		break;
ADDRGP4 $343
JUMPV
LABELV $695
line 907
;905:
;906:	case EV_PL_BOUNCE:
;907:		DEBUGNAME("EV_PL_BOUNCE");
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
line 908
;908:		if ( rand() & 1 ) {
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
line 909
;909:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
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
line 910
;910:		} else {
ADDRGP4 $343
JUMPV
LABELV $700
line 911
;911:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
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
line 912
;912:		}
line 913
;913:		break;
ADDRGP4 $343
JUMPV
LABELV $706
line 957
;914:
;915:#ifdef MISSIONPACK
;916:	case EV_PROXIMITY_MINE_STICK:
;917:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;918:		if( es->eventParm & SURF_FLESH ) {
;919:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;920:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;921:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;922:		} else {
;923:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;924:		}
;925:		break;
;926:
;927:	case EV_PROXIMITY_MINE_TRIGGER:
;928:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;929:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;930:		break;
;931:	case EV_KAMIKAZE:
;932:		DEBUGNAME("EV_KAMIKAZE");
;933:		CG_KamikazeEffect( cent->lerpOrigin );
;934:		break;
;935:	case EV_OBELISKEXPLODE:
;936:		DEBUGNAME("EV_OBELISKEXPLODE");
;937:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;938:		break;
;939:	case EV_OBELISKPAIN:
;940:		DEBUGNAME("EV_OBELISKPAIN");
;941:		CG_ObeliskPain( cent->lerpOrigin );
;942:		break;
;943:	case EV_INVUL_IMPACT:
;944:		DEBUGNAME("EV_INVUL_IMPACT");
;945:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;946:		break;
;947:	case EV_JUICED:
;948:		DEBUGNAME("EV_JUICED");
;949:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;950:		break;
;951:	case EV_LIGHTNINGBOLT:
;952:		DEBUGNAME("EV_LIGHTNINGBOLT");
;953:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;954:		break;
;955:#endif
;956:	case EV_SCOREPLUM:
;957:		DEBUGNAME("EV_SCOREPLUM");
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
line 958
;958:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
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
line 959
;959:		break;
ADDRGP4 $343
JUMPV
LABELV $711
line 965
;960:
;961:	//
;962:	// missile impacts
;963:	//
;964:	case EV_MISSILE_HIT:
;965:		DEBUGNAME("EV_MISSILE_HIT");
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
line 966
;966:		ByteToDir( es->eventParm, dir );
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
line 967
;967:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 968
;968:		break;
ADDRGP4 $343
JUMPV
LABELV $716
line 971
;969:
;970:	case EV_MISSILE_MISS:
;971:		DEBUGNAME("EV_MISSILE_MISS");
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
line 972
;972:		ByteToDir( es->eventParm, dir );
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
line 973
;973:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
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
line 974
;974:		break;
ADDRGP4 $343
JUMPV
LABELV $721
line 977
;975:
;976:	case EV_MISSILE_MISS_METAL:
;977:		DEBUGNAME("EV_MISSILE_MISS_METAL");
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
line 978
;978:		ByteToDir( es->eventParm, dir );
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
line 979
;979:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_METAL );
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
line 980
;980:		break;
ADDRGP4 $343
JUMPV
LABELV $726
line 983
;981:
;982:	case EV_RAILTRAIL:
;983:		DEBUGNAME("EV_RAILTRAIL");
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
line 984
;984:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 987
;985://unlagged - attack prediction #2
;986:		// if the client is us, unlagged is on server-side, and we've got it client-side
;987:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
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
ADDRGP4 cgs+155528
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
line 988
;988:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 991
;989:			// do nothing, because it was already predicted
;990:			//Com_Printf("Ignoring rail trail event\n");
;991:		}
ADDRGP4 $343
JUMPV
LABELV $731
line 992
;992:		else {
line 994
;993:			// draw a rail trail, because it wasn't predicted
;994:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 997
;995:
;996:			// if the end was on a nomark surface, don't make an explosion
;997:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $343
line 998
;998:				ByteToDir( es->eventParm, dir );
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
line 999
;999:				CG_MissileHitWall( cent, es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
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
line 1000
;1000:			}
line 1002
;1001:			//Com_Printf("Non-predicted rail trail\n");
;1002:		}
line 1004
;1003://unlagged - attack prediction #2
;1004:		break;
ADDRGP4 $343
JUMPV
LABELV $741
line 1007
;1005:
;1006:	case EV_BULLET_HIT_WALL:
;1007:		DEBUGNAME("EV_BULLET_HIT_WALL");
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
line 1010
;1008://unlagged - attack prediction #2
;1009:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1010:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
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
ADDRGP4 cgs+155528
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
line 1011
;1011:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1014
;1012:			// do nothing, because it was already predicted
;1013:			//Com_Printf("Ignoring bullet event\n");
;1014:		}
ADDRGP4 $343
JUMPV
LABELV $746
line 1015
;1015:		else {
line 1017
;1016:			// do the bullet, because it wasn't predicted
;1017:			ByteToDir( es->eventParm, dir );
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
line 1018
;1018:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1020
;1019:			//Com_Printf("Non-predicted bullet\n");
;1020:		}
line 1022
;1021://unlagged - attack prediction #2
;1022:		break;
ADDRGP4 $343
JUMPV
LABELV $754
line 1025
;1023:
;1024:	case EV_BULLET_HIT_FLESH:
;1025:		DEBUGNAME("EV_BULLET_HIT_FLESH");
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
line 1028
;1026://unlagged - attack prediction #2
;1027:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1028:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
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
ADDRGP4 cgs+155528
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
line 1029
;1029:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1032
;1030:			// do nothing, because it was already predicted
;1031:			//Com_Printf("Ignoring bullet event\n");
;1032:		}
ADDRGP4 $343
JUMPV
LABELV $759
line 1033
;1033:		else {
line 1035
;1034:			// do the bullet, because it wasn't predicted
;1035:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1037
;1036:			//Com_Printf("Non-predicted bullet\n");
;1037:		}
line 1039
;1038://unlagged - attack prediction #2
;1039:		break;
ADDRGP4 $343
JUMPV
LABELV $767
line 1042
;1040:
;1041:	case EV_SHOTGUN:
;1042:		DEBUGNAME("EV_SHOTGUN");
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
line 1045
;1043://unlagged - attack prediction #2
;1044:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1045:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
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
ADDRGP4 cgs+155528
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
line 1046
;1046:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1049
;1047:			// do nothing, because it was already predicted
;1048:			//Com_Printf("Ignoring shotgun event\n");
;1049:		}
ADDRGP4 $343
JUMPV
LABELV $772
line 1050
;1050:		else {
line 1052
;1051:			// do the shotgun pattern, because it wasn't predicted	
;1052:			if (cent->currentState.eFlags & EF_ALT_FIRING)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $780
line 1053
;1053:			{
line 1055
;1054:				// Do Nothing?
;1055:			} else {
ADDRGP4 $343
JUMPV
LABELV $780
line 1056
;1056:				if (!cg.snap->ps.eFlags & EF_ALT_FIRING) {	CG_ShotgunFire( es ); }
ADDRGP4 cg+36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $786
ADDRLP4 96
CNSTI4 1
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $786
ADDRLP4 96
CNSTI4 0
ASGNI4
LABELV $787
ADDRLP4 96
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $343
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1057
;1057:			}
line 1061
;1058:			
;1059:
;1060:			//Com_Printf("Non-predicted shotgun pattern\n");
;1061:		}
line 1063
;1062://unlagged - attack prediction #2
;1063:		break;
ADDRGP4 $343
JUMPV
LABELV $788
line 1066
;1064:
;1065:	case EV_GENERAL_SOUND:
;1066:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $789
ADDRGP4 $792
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $789
line 1067
;1067:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $793
line 1068
;1068:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1069
;1069:		} else {
ADDRGP4 $343
JUMPV
LABELV $793
line 1070
;1070:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1071
;1071:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
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
line 1072
;1072:		}
line 1073
;1073:		break;
ADDRGP4 $343
JUMPV
LABELV $797
line 1076
;1074:
;1075:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1076:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $798
ADDRGP4 $801
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $798
line 1077
;1077:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $802
line 1078
;1078:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
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
line 1079
;1079:		} else {
ADDRGP4 $343
JUMPV
LABELV $802
line 1080
;1080:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1081
;1081:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
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
line 1082
;1082:		}
line 1083
;1083:		break;
ADDRGP4 $343
JUMPV
LABELV $808
line 1086
;1084:
;1085:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1086:		{
line 1087
;1087:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $809
ADDRGP4 $812
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $809
line 1088
;1088:			switch( es->eventParm ) {
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
LTI4 $343
ADDRLP4 96
INDIRI4
CNSTI4 13
GTI4 $343
ADDRLP4 96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $932
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $932
address $816
address $826
address $836
address $848
address $860
address $880
address $900
address $908
address $916
address $919
address $922
address $925
address $928
address $343
code
LABELV $816
line 1090
;1089:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1090:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $817
line 1091
;1091:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+154388+976
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $343
JUMPV
LABELV $817
line 1093
;1092:					else
;1093:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+154388+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1094
;1094:					break;
ADDRGP4 $343
JUMPV
LABELV $826
line 1096
;1095:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1096:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $827
line 1097
;1097:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+154388+976
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $343
JUMPV
LABELV $827
line 1099
;1098:					else
;1099:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+154388+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1100
;1100:					break;
ADDRGP4 $343
JUMPV
LABELV $836
line 1102
;1101:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1102:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $837
line 1103
;1103:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+154388+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $838
JUMPV
LABELV $837
line 1105
;1104:					else
;1105:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+154388+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $838
line 1107
;1106:					//
;1107:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+154388+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1108
;1108:					break;
ADDRGP4 $343
JUMPV
LABELV $848
line 1110
;1109:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1110:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $849
line 1111
;1111:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+154388+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $850
JUMPV
LABELV $849
line 1113
;1112:					else
;1113:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+154388+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $850
line 1115
;1114:					//
;1115:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+154388+1000
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1116
;1116:					break;
ADDRGP4 $343
JUMPV
LABELV $860
line 1120
;1117:
;1118:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1119:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1120:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $865
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $861
LABELV $865
line 1121
;1121:					}
ADDRGP4 $343
JUMPV
LABELV $861
line 1122
;1122:					else {
line 1123
;1123:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $866
line 1129
;1124:#ifdef MISSIONPACK
;1125:							if (cgs.gametype == GT_1FCTF) 
;1126:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1127:							else
;1128:#endif
;1129:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+154388+1012
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1130
;1130:						}
ADDRGP4 $343
JUMPV
LABELV $866
line 1131
;1131:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $343
line 1137
;1132:#ifdef MISSIONPACK
;1133:							if (cgs.gametype == GT_1FCTF)
;1134:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1135:							else
;1136:#endif
;1137: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+154388+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1138
;1138:						}
line 1139
;1139:					}
line 1140
;1140:					break;
ADDRGP4 $343
JUMPV
LABELV $880
line 1143
;1141:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1142:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1143:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $885
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $881
LABELV $885
line 1144
;1144:					}
ADDRGP4 $343
JUMPV
LABELV $881
line 1145
;1145:					else {
line 1146
;1146:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $886
line 1152
;1147:#ifdef MISSIONPACK
;1148:							if (cgs.gametype == GT_1FCTF)
;1149:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1150:							else
;1151:#endif
;1152:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+154388+1012
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1153
;1153:						}
ADDRGP4 $343
JUMPV
LABELV $886
line 1154
;1154:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 1160
;1155:#ifdef MISSIONPACK
;1156:							if (cgs.gametype == GT_1FCTF)
;1157:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1158:							else
;1159:#endif
;1160:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+154388+1020
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1161
;1161:						}
line 1162
;1162:					}
line 1163
;1163:					break;
ADDRGP4 $343
JUMPV
LABELV $900
line 1165
;1164:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1165:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $343
line 1166
;1166:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+154388+1032
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1167
;1167:					}
line 1168
;1168:					break;
ADDRGP4 $343
JUMPV
LABELV $908
line 1170
;1169:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1170:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1740
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 1171
;1171:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+154388+1032
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1172
;1172:					}
line 1173
;1173:					break;
ADDRGP4 $343
JUMPV
LABELV $916
line 1176
;1174:
;1175:				case GTS_REDTEAM_SCORED:
;1176:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+154388+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1177
;1177:					break;
ADDRGP4 $343
JUMPV
LABELV $919
line 1179
;1178:				case GTS_BLUETEAM_SCORED:
;1179:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+154388+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1180
;1180:					break;
ADDRGP4 $343
JUMPV
LABELV $922
line 1182
;1181:				case GTS_REDTEAM_TOOK_LEAD:
;1182:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+154388+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1183
;1183:					break;
ADDRGP4 $343
JUMPV
LABELV $925
line 1185
;1184:				case GTS_BLUETEAM_TOOK_LEAD:
;1185:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+154388+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1186
;1186:					break;
ADDRGP4 $343
JUMPV
LABELV $928
line 1188
;1187:				case GTS_TEAMS_ARE_TIED:
;1188:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+154388+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1189
;1189:					break;
line 1192
;1190:				case GTS_KAMIKAZE:
;1191:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1192:					break;
line 1195
;1193:
;1194:				default:
;1195:					break;
line 1197
;1196:			}
;1197:			break;
ADDRGP4 $343
JUMPV
LABELV $933
line 1203
;1198:		}
;1199:
;1200:	case EV_PAIN:
;1201:		// local player sounds are triggered in CG_CheckLocalSounds,
;1202:		// so ignore events on the player
;1203:		DEBUGNAME("EV_PAIN");
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
line 1204
;1204:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $343
line 1205
;1205:			CG_PainEvent( cent, es->eventParm );
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
line 1206
;1206:		}
line 1207
;1207:		break;
ADDRGP4 $343
JUMPV
LABELV $941
line 1212
;1208:
;1209:	case EV_DEATH1:
;1210:	case EV_DEATH2:
;1211:	case EV_DEATH3:
;1212:		DEBUGNAME("EV_DEATHx");
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
line 1213
;1213:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $946
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
line 1215
;1214:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1215:		break;
ADDRGP4 $343
JUMPV
LABELV $947
line 1219
;1216:
;1217:
;1218:	case EV_OBITUARY:
;1219:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $948
ADDRGP4 $951
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $948
line 1220
;1220:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1221
;1221:		break;
ADDRGP4 $343
JUMPV
LABELV $952
line 1227
;1222:
;1223:	//
;1224:	// powerup events
;1225:	//
;1226:	case EV_POWERUP_QUAD:
;1227:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $953
ADDRGP4 $956
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $953
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
NEI4 $957
line 1229
;1229:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+126476
CNSTI4 1
ASGNI4
line 1230
;1230:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1231
;1231:		}
LABELV $957
line 1232
;1232:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
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
line 1233
;1233:		break;
ADDRGP4 $343
JUMPV
LABELV $965
line 1235
;1234:	case EV_POWERUP_BATTLESUIT:
;1235:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
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
NEI4 $970
line 1237
;1237:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+126476
CNSTI4 2
ASGNI4
line 1238
;1238:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1239
;1239:		}
LABELV $970
line 1240
;1240:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
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
line 1241
;1241:		break;
ADDRGP4 $343
JUMPV
LABELV $978
line 1243
;1242:	case EV_POWERUP_REGEN:
;1243:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $979
ADDRGP4 $982
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $979
line 1244
;1244:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $983
line 1245
;1245:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+126476
CNSTI4 5
ASGNI4
line 1246
;1246:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1247
;1247:		}
LABELV $983
line 1248
;1248:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
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
line 1249
;1249:		break;
ADDRGP4 $343
JUMPV
LABELV $991
line 1252
;1250:
;1251:	case EV_IMMOBILIZED:
;1252:		DEBUGNAME("EV_IMMOBILIZED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $992
ADDRGP4 $995
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $992
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
NEI4 $343
line 1254
;1254:		{ //-Vincent
line 1255
;1255:		ci->cgimmobilized = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1256
;1256:		}
line 1257
;1257:		break;
ADDRGP4 $343
JUMPV
LABELV $999
line 1260
;1258:
;1259:	case EV_IMMOBILIZED_FREE:
;1260:		DEBUGNAME("EV_IMMOBILIZED_FREE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1000
ADDRGP4 $1003
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1000
line 1261
;1261:		if ( es->number == cg.snap->ps.clientNum ) 
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 1262
;1262:		{ //-Vincent
line 1263
;1263:		ci->cgimmobilized = qfalse;
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1264
;1264:		}
line 1265
;1265:		break;
ADDRGP4 $343
JUMPV
LABELV $1007
line 1268
;1266:
;1267:	case EV_GIB_PLAYER:
;1268:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1008
ADDRGP4 $1011
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1008
line 1275
;1269:		// don't play gib sound when using the kamikaze because it interferes
;1270:		// with the kamikaze sound, downside is that the gib sound will also
;1271:		// not be played when someone is gibbed while just carrying the kamikaze
;1272:		
;1273:		// We've used this bit
;1274:		//if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1275:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1278
;1276:		//}
;1277:		
;1278:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1279
;1279:		break;
ADDRGP4 $343
JUMPV
LABELV $1014
line 1283
;1280:
;1281:	// Shafe - Trep - Headshot stuff
;1282:	case EV_GIB_PLAYER_HEADSHOT:
;1283:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1015
ADDRGP4 $1018
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1015
line 1284
;1284:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1285
;1285:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1286
;1286:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1287
;1287:		break;
ADDRGP4 $343
JUMPV
LABELV $1021
line 1290
;1288:
;1289:	case EV_BODY_NOHEAD:
;1290:		DEBUGNAME("EV_BODY_NOHEAD");
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
line 1291
;1291:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1292
;1292:		break;
ADDRGP4 $343
JUMPV
LABELV $1026
line 1295
;1293:	// Shafe - Trep - End Headshot Stuff
;1294:	case EV_BREAK_GLASS:
;1295: 		DEBUGNAME("EV_BREAK_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1027
ADDRGP4 $1030
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1027
line 1297
;1296: 		// Change cgs.media.gibSound to whatever sound you want it to use
;1297:  		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.glassSound );
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
line 1298
;1298: 		CG_BreakGlass( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_BreakGlass
CALLV
pop
line 1299
;1299: 		break;
ADDRGP4 $343
JUMPV
LABELV $1033
line 1301
;1300:	case EV_ERROR:
;1301: 		DEBUGNAME("EV_ERROR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1034
ADDRGP4 $1037
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1034
line 1302
;1302: 		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.errorSound );
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
line 1303
;1303: 		break;
ADDRGP4 $343
JUMPV
LABELV $1040
line 1305
;1304:	case EV_STOPLOOPINGSOUND:
;1305:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1041
ADDRGP4 $1044
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1041
line 1306
;1306:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1307
;1307:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1308
;1308:		break;
ADDRGP4 $343
JUMPV
LABELV $1045
line 1311
;1309:
;1310:	case EV_DEBUG_LINE:
;1311:		DEBUGNAME("EV_DEBUG_LINE");
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
line 1312
;1312:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1313
;1313:		break;
ADDRGP4 $343
JUMPV
LABELV $342
line 1316
;1314:
;1315:	default:
;1316:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1050
ADDRGP4 $1053
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1050
line 1317
;1317:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1054
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1318
;1318:		break;
LABELV $343
line 1321
;1319:	}
;1320:
;1321:}
LABELV $327
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1330
;1322:
;1323:
;1324:/*
;1325:==============
;1326:CG_CheckEvents
;1327:
;1328:==============
;1329:*/
;1330:void CG_CheckEvents( centity_t *cent ) {
line 1332
;1331:	// check for event-only entities
;1332:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1058
line 1333
;1333:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1060
line 1334
;1334:			return;	// already fired
ADDRGP4 $1057
JUMPV
LABELV $1060
line 1337
;1335:		}
;1336:		// if this is a player event set the entity number of the client entity number
;1337:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1062
line 1338
;1338:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1339
;1339:		}
LABELV $1062
line 1341
;1340:
;1341:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 1343
;1342:
;1343:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1344
;1344:	} else {
ADDRGP4 $1059
JUMPV
LABELV $1058
line 1346
;1345:		// check for events riding with another entity
;1346:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $1064
line 1347
;1347:			return;
ADDRGP4 $1057
JUMPV
LABELV $1064
line 1349
;1348:		}
;1349:		cent->previousEvent = cent->currentState.event;
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
line 1350
;1350:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1066
line 1351
;1351:			return;
ADDRGP4 $1057
JUMPV
LABELV $1066
line 1353
;1352:		}
;1353:	}
LABELV $1059
line 1356
;1354:
;1355:	// calculate the position at exactly the frame time
;1356:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1357
;1357:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1359
;1358:
;1359:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1360
;1360:}
LABELV $1057
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
LABELV $1054
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
LABELV $1053
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
LABELV $1049
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
LABELV $1044
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
LABELV $1037
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
LABELV $1030
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
LABELV $1025
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
LABELV $1018
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
LABELV $1011
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
LABELV $1003
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
LABELV $995
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
LABELV $982
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
LABELV $969
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
LABELV $956
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
LABELV $951
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
LABELV $946
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
LABELV $945
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
LABELV $937
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
LABELV $812
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
LABELV $801
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
LABELV $792
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
LABELV $577
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
LABELV $572
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
LABELV $565
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
LABELV $557
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
LABELV $543
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
LABELV $525
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
LABELV $520
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
LABELV $519
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
LABELV $512
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
LABELV $505
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
LABELV $498
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
LABELV $493
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
LABELV $492
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
LABELV $489
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
LABELV $484
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
LABELV $479
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
LABELV $472
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
LABELV $442
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
LABELV $429
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
LABELV $428
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
LABELV $416
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
LABELV $402
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
LABELV $391
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
LABELV $380
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
LABELV $369
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
LABELV $358
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
byte 1 10
byte 1 0
align 1
LABELV $337
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
LABELV $331
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
LABELV $325
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
LABELV $324
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
LABELV $321
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
LABELV $318
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
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 117
byte 1 112
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
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 100
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
