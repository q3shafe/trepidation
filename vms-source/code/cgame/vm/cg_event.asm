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
CNSTI4 22
GTI4 $120
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $138-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $138
address $128
address $130
address $132
address $126
address $120
address $124
address $122
address $134
address $136
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
;123:	case MOD_TARGET_LASER:
;124:		message = "saw the light";
ADDRLP4 40
ADDRGP4 $135
ASGNP4
line 125
;125:		break;
ADDRGP4 $121
JUMPV
LABELV $136
line 127
;126:	case MOD_TRIGGER_HURT:
;127:		message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $137
ASGNP4
line 128
;128:		break;
ADDRGP4 $121
JUMPV
LABELV $120
line 130
;129:	default:
;130:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 131
;131:		break;
LABELV $121
line 134
;132:	}
;133:
;134:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $140
line 135
;135:		gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 136
;136:		switch (mod) {
ADDRLP4 124
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $168
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
GTI4 $186
LABELV $185
ADDRLP4 44
INDIRI4
CNSTI4 5
EQI4 $144
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $152
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $160
ADDRGP4 $142
JUMPV
LABELV $186
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $170
ADDRGP4 $142
JUMPV
LABELV $144
line 143
;137:#ifdef MISSIONPACK
;138:		case MOD_KAMIKAZE:
;139:			message = "goes out with a bang";
;140:			break;
;141:#endif
;142:		case MOD_GRENADE_SPLASH:
;143:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $145
line 144
;144:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $145
line 145
;145:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $148
line 146
;146:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $150
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $148
line 148
;147:			else
;148:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
line 149
;149:			break;
ADDRGP4 $143
JUMPV
LABELV $152
line 151
;150:		case MOD_ROCKET_SPLASH:
;151:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $153
line 152
;152:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $155
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $153
line 153
;153:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $156
line 154
;154:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $158
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $156
line 156
;155:			else
;156:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $159
ASGNP4
line 157
;157:			break;
ADDRGP4 $143
JUMPV
LABELV $160
line 159
;158:		case MOD_PLASMA_SPLASH:
;159:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $161
line 160
;160:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $163
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $161
line 161
;161:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $164
line 162
;162:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $166
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $164
line 164
;163:			else
;164:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
line 165
;165:			break;
ADDRGP4 $143
JUMPV
LABELV $168
line 167
;166:		case MOD_BFG_SPLASH:
;167:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $169
ASGNP4
line 168
;168:			break;
ADDRGP4 $143
JUMPV
LABELV $170
line 170
;169:		case MOD_HEADSHOT:									// Shafe - Headshots
;170:			gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 171
;171:			if(gender==GENDER_FEMALE)
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $171
line 172
;172:			{
line 173
;173:				message = "got her head blown off by";
ADDRLP4 40
ADDRGP4 $173
ASGNP4
line 174
;174:			}
ADDRGP4 $143
JUMPV
LABELV $171
line 176
;175:			else
;176:			{
line 177
;177:				if(gender==GENDER_NEUTER)
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $174
line 178
;178:					message = "got its head blown off by";
ADDRLP4 40
ADDRGP4 $176
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $174
line 180
;179:				else
;180:					message = "got his head blown off by";
ADDRLP4 40
ADDRGP4 $177
ASGNP4
line 181
;181:			}
line 182
;182:			break;											
ADDRGP4 $143
JUMPV
LABELV $142
line 195
;183:#ifdef MISSIONPACK
;184:		case MOD_PROXIMITY_MINE:
;185:			if( gender == GENDER_FEMALE ) {
;186:				message = "found her prox mine";
;187:			} else if ( gender == GENDER_NEUTER ) {
;188:				message = "found it's prox mine";
;189:			} else {
;190:				message = "found his prox mine";
;191:			}
;192:			break;
;193:#endif
;194:		default:
;195:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $178
line 196
;196:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $180
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $178
line 197
;197:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $181
line 198
;198:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $183
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $181
line 200
;199:			else
;200:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $184
ASGNP4
line 201
;201:			break;
LABELV $143
line 203
;202:		}
;203:	}
LABELV $140
line 205
;204:
;205:	if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $187
line 206
;206:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $189
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 207
;207:		return;
ADDRGP4 $107
JUMPV
LABELV $187
line 211
;208:	}
;209:
;210:	// check for kill messages from the current clientNum
;211:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $190
line 214
;212:		char	*s;
;213:
;214:		if(mod != MOD_HEADSHOT) // Shafe - Trep - only for headshots
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $193
line 215
;215:		{						
line 216
;216:			if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $195
line 217
;217:					s = va("You fragged %s\n%s place with %i", targetName, 
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
ADDRGP4 $198
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
line 220
;218:					CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;219:					cg.snap->ps.persistant[PERS_SCORE] );
;220:			} else {
ADDRGP4 $194
JUMPV
LABELV $195
line 221
;221:				s = va("You fragged %s", targetName );
ADDRGP4 $201
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
line 222
;222:			}
line 223
;223:		}
ADDRGP4 $194
JUMPV
LABELV $193
line 225
;224:		else										// Shafe - Trep Else for headshot
;225:		{
line 227
;226:
;227:			if ( cgs.gametype < GT_TEAM ) 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $202
line 228
;228:			{
line 229
;229:				s = va("Headshot!\n\nYou fragged %s\n%s place with %i", targetName, 
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
ADDRGP4 $205
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
line 232
;230:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;231:				cg.snap->ps.persistant[PERS_SCORE] );
;232:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $208
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
line 233
;233:			} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 234
;234:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $208
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
line 235
;235:			}	
LABELV $203
line 238
;236:			
;237:	
;238:		}
LABELV $194
line 244
;239:#ifdef MISSIONPACK
;240:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;241:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;242:		} 
;243:#else
;244:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
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
line 248
;245:#endif
;246:
;247:		// print the text message as well
;248:	}
LABELV $190
line 251
;249:
;250:	// check for double client messages
;251:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $209
line 252
;252:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 253
;253:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $211
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 254
;254:	} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 255
;255:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
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
line 256
;256:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 258
;257:		// check for kill messages about the current clientNum
;258:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $212
line 259
;259:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+116400
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 260
;260:		}
LABELV $212
line 261
;261:	}
LABELV $210
line 263
;262:
;263:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $217
line 264
;264:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $219
ADDRLP4 44
INDIRI4
CNSTI4 26
GTI4 $219
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $265-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $265
address $227
address $223
address $225
address $229
address $232
address $235
address $238
address $240
address $243
address $246
address $248
address $250
address $253
address $219
address $219
address $219
address $219
address $255
address $219
address $219
address $219
address $219
address $219
address $261
address $221
address $258
code
LABELV $221
line 266
;265:		case MOD_GRAPPLE:
;266:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $222
ASGNP4
line 267
;267:			break;
ADDRGP4 $220
JUMPV
LABELV $223
line 269
;268:		case MOD_GAUNTLET:
;269:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $224
ASGNP4
line 270
;270:			break;
ADDRGP4 $220
JUMPV
LABELV $225
line 272
;271:		case MOD_MACHINEGUN:
;272:			message = "was assaulted by";
ADDRLP4 40
ADDRGP4 $226
ASGNP4
line 273
;273:			break;
ADDRGP4 $220
JUMPV
LABELV $227
line 275
;274:		case MOD_SHOTGUN:
;275:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 276
;276:			break;
ADDRGP4 $220
JUMPV
LABELV $229
line 278
;277:		case MOD_GRENADE:
;278:			message = "ate";
ADDRLP4 40
ADDRGP4 $230
ASGNP4
line 279
;279:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $231
ASGNP4
line 280
;280:			break;
ADDRGP4 $220
JUMPV
LABELV $232
line 282
;281:		case MOD_GRENADE_SPLASH:
;282:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $233
ASGNP4
line 283
;283:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $234
ASGNP4
line 284
;284:			break;
ADDRGP4 $220
JUMPV
LABELV $235
line 286
;285:		case MOD_ROCKET:
;286:			message = "was crushed by";
ADDRLP4 40
ADDRGP4 $236
ASGNP4
line 287
;287:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $237
ASGNP4
line 288
;288:			break;
ADDRGP4 $220
JUMPV
LABELV $238
line 290
;289:		case MOD_ROCKET_SPLASH:
;290:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $239
ASGNP4
line 291
;291:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $237
ASGNP4
line 292
;292:			break;
ADDRGP4 $220
JUMPV
LABELV $240
line 294
;293:		case MOD_PLASMA:
;294:			message = "was sliced to shreds by";
ADDRLP4 40
ADDRGP4 $241
ASGNP4
line 295
;295:			message2 = "'s gata gun";
ADDRLP4 88
ADDRGP4 $242
ASGNP4
line 296
;296:			break;
ADDRGP4 $220
JUMPV
LABELV $243
line 298
;297:		case MOD_PLASMA_SPLASH:
;298:			message = "was shreded by";
ADDRLP4 40
ADDRGP4 $244
ASGNP4
line 299
;299:			message2 = "'s gata fun";
ADDRLP4 88
ADDRGP4 $245
ASGNP4
line 300
;300:			break;
ADDRGP4 $220
JUMPV
LABELV $246
line 302
;301:		case MOD_RAILGUN:
;302:			message = "was degaussed by"; // Shafe - Trep - Reworded
ADDRLP4 40
ADDRGP4 $247
ASGNP4
line 303
;303:			break;
ADDRGP4 $220
JUMPV
LABELV $248
line 305
;304:		case MOD_LIGHTNING:
;305:			message = "was burnt by";
ADDRLP4 40
ADDRGP4 $249
ASGNP4
line 306
;306:			break;
ADDRGP4 $220
JUMPV
LABELV $250
line 308
;307:		case MOD_BFG:
;308:			message = "was annialated by";
ADDRLP4 40
ADDRGP4 $251
ASGNP4
line 309
;309:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 310
;310:			break;
ADDRGP4 $220
JUMPV
LABELV $253
line 312
;311:		case MOD_BFG_SPLASH:
;312:			message = "was annialated by the fallout of";
ADDRLP4 40
ADDRGP4 $254
ASGNP4
line 313
;313:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 314
;314:			break;
ADDRGP4 $220
JUMPV
LABELV $255
line 336
;315:#ifdef MISSIONPACK
;316:		case MOD_NAIL:
;317:			message = "was nailed by";
;318:			break;
;319:		case MOD_CHAINGUN:
;320:			message = "got lead poisoning from";
;321:			message2 = "'s Chaingun";
;322:			break;
;323:		case MOD_PROXIMITY_MINE:
;324:			message = "was too close to";
;325:			message2 = "'s Prox Mine";
;326:			break;
;327:		case MOD_KAMIKAZE:
;328:			message = "falls to";
;329:			message2 = "'s Kamikaze blast";
;330:			break;
;331:		case MOD_JUICED:
;332:			message = "was juiced by";
;333:			break;
;334:#endif
;335:		case MOD_TELEFRAG:
;336:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $256
ASGNP4
line 337
;337:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $257
ASGNP4
line 338
;338:			break;
ADDRGP4 $220
JUMPV
LABELV $258
line 340
;339:		case MOD_ALTFLAMER:		// Shafe - Trep - Flame Thrower Alt
;340:			message = "was toasted by";
ADDRLP4 40
ADDRGP4 $259
ASGNP4
line 341
;341:			message2 = "'s flame thrower";
ADDRLP4 88
ADDRGP4 $260
ASGNP4
line 342
;342:			break;
ADDRGP4 $220
JUMPV
LABELV $261
line 344
;343:		case MOD_TURRET:
;344:			message = "was shot down by ";
ADDRLP4 40
ADDRGP4 $262
ASGNP4
line 345
;345:			message2 = "'s turret.";
ADDRLP4 88
ADDRGP4 $263
ASGNP4
line 346
;346:			break;
ADDRGP4 $220
JUMPV
LABELV $219
line 348
;347:		default:
;348:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $264
ASGNP4
line 349
;349:			break;
LABELV $220
line 352
;350:		}
;351:
;352:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
line 353
;353:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $269
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
line 355
;354:				targetName, message, attackerName, message2);
;355:			return;
ADDRGP4 $107
JUMPV
LABELV $267
line 357
;356:		}
;357:	}
LABELV $217
line 360
;358:
;359:	// we don't know what it was
;360:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $270
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 361
;361:}
LABELV $107
endproc CG_Obituary 136 20
proc CG_UseItem 32 16
line 370
;362:
;363://==========================================================================
;364:
;365:/*
;366:===============
;367:CG_UseItem
;368:===============
;369:*/
;370:static void CG_UseItem( centity_t *cent ) {
line 376
;371:	clientInfo_t *ci;
;372:	int			itemNum, clientNum;
;373:	gitem_t		*item;
;374:	entityState_t *es;
;375:
;376:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 378
;377:	
;378:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
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
line 379
;379:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $274
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $272
LABELV $274
line 380
;380:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 381
;381:	}
LABELV $272
line 384
;382:
;383:	// print a message if the local player
;384:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $275
line 385
;385:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $278
line 386
;386:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $280
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 387
;387:		} else {
ADDRGP4 $279
JUMPV
LABELV $278
line 388
;388:			item = BG_FindItemForHoldable( itemNum );
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
line 389
;389:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $281
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
line 390
;390:		}
LABELV $279
line 391
;391:	}
LABELV $275
line 393
;392:
;393:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $284
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $283
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $288
ADDRGP4 $282
JUMPV
LABELV $282
LABELV $284
line 396
;394:	default:
;395:	case HI_NONE:
;396:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
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
line 397
;397:		break;
ADDRGP4 $283
JUMPV
line 400
;398:
;399:	case HI_TELEPORTER:
;400:		break;
LABELV $288
line 403
;401:
;402:	case HI_MEDKIT:
;403:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 404
;404:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $289
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $289
line 405
;405:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1732
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 406
;406:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 407
;407:		}
LABELV $289
line 408
;408:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
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
line 409
;409:		break;
LABELV $283
line 422
;410:
;411:#ifdef MISSIONPACK
;412:	case HI_KAMIKAZE:
;413:		break;
;414:	case HI_PORTAL:
;415:		break;
;416:	case HI_INVULNERABILITY:
;417:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;418:		break;
;419:#endif
;420:	}
;421:
;422:}
LABELV $271
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 431
;423:
;424:/*
;425:================
;426:CG_ItemPickup
;427:
;428:A new item was picked up this frame
;429:================
;430:*/
;431:static void CG_ItemPickup( int itemNum ) {
line 432
;432:	cg.itemPickup = itemNum;
ADDRGP4 cg+126732
ADDRFP4 0
INDIRI4
ASGNI4
line 433
;433:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+126736
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 434
;434:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+126740
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 436
;435:	// see if it should be the grabbed weapon
;436:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $301
line 438
;437:		// select it immediately
;438:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
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
line 439
;439:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 440
;440:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+111004
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 441
;441:		}
LABELV $304
line 442
;442:	}
LABELV $301
line 444
;443:
;444:}
LABELV $295
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 454
;445:
;446:
;447:/*
;448:================
;449:CG_PainEvent
;450:
;451:Also called by playerstate transition
;452:================
;453:*/
;454:void CG_PainEvent( centity_t *cent, int health ) {
line 458
;455:	char	*snd;
;456:
;457:	// don't do more than two pain sounds a second
;458:	if ( cg.time - cent->pe.painTime < 500 ) {
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
line 459
;459:		return;
ADDRGP4 $312
JUMPV
LABELV $313
line 462
;460:	}
;461:
;462:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $316
line 463
;463:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $318
ASGNP4
line 464
;464:	} else if ( health < 50 ) {
ADDRGP4 $317
JUMPV
LABELV $316
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $319
line 465
;465:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $321
ASGNP4
line 466
;466:	} else if ( health < 75 ) {
ADDRGP4 $320
JUMPV
LABELV $319
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $322
line 467
;467:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $324
ASGNP4
line 468
;468:	} else {
ADDRGP4 $323
JUMPV
LABELV $322
line 469
;469:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $325
ASGNP4
line 470
;470:	}
LABELV $323
LABELV $320
LABELV $317
line 471
;471:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
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
line 475
;472:		CG_CustomSound( cent->currentState.number, snd ) );
;473:
;474:	// save pain time for programitic twitch animation
;475:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 476
;476:	cent->pe.painDirection ^= 1;
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
line 477
;477:}
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
line 490
;478:
;479:
;480:
;481:/*
;482:==============
;483:CG_EntityEvent
;484:
;485:An entity has an event value
;486:also called by CG_CheckPlayerstateEvents
;487:==============
;488:*/
;489:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;490:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 499
;491:	entityState_t	*es;
;492:	int				event;
;493:	vec3_t			dir;
;494:	const char		*s;
;495:	int				clientNum;
;496:	clientInfo_t	*ci;
;497:
;498:	
;499:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 500
;500:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 502
;501:
;502:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $328
line 503
;503:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
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
line 504
;504:	}
LABELV $328
line 506
;505:
;506:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $332
line 507
;507:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $327
ADDRGP4 $337
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 508
;508:		return;
ADDRGP4 $327
JUMPV
LABELV $332
line 511
;509:	}
;510:
;511:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 512
;512:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $340
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $338
LABELV $340
line 513
;513:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 514
;514:	}
LABELV $338
line 515
;515:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1732
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 517
;516:
;517:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $342
ADDRLP4 8
INDIRI4
CNSTI4 75
GTI4 $342
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1029-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1029
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
address $578
address $583
address $588
address $593
address $598
address $603
address $608
address $613
address $618
address $623
address $628
address $633
address $638
address $643
address $648
address $342
address $674
address $667
address $653
address $660
address $682
address $693
address $778
address $787
address $798
address $752
address $739
address $709
address $714
address $719
address $724
address $765
address $342
address $923
address $931
address $931
address $931
address $937
address $942
address $955
address $968
address $981
address $988
address $995
address $704
address $1000
address $342
address $1007
address $1019
address $1014
address $485
code
LABELV $344
line 522
;518:	//
;519:	// movement generated events
;520:	//
;521:	case EV_FOOTSTEP:
;522:		DEBUGNAME("EV_FOOTSTEP");
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
line 523
;523:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 524
;524:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 526
;525:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;526:		}
line 527
;527:		break;
ADDRGP4 $343
JUMPV
LABELV $354
line 529
;528:	case EV_FOOTSTEP_METAL:
;529:		DEBUGNAME("EV_FOOTSTEP_METAL");
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
line 530
;530:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 531
;531:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 533
;532:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;533:		}
line 534
;534:		break;
ADDRGP4 $343
JUMPV
LABELV $365
line 536
;535:	case EV_FOOTSPLASH:
;536:		DEBUGNAME("EV_FOOTSPLASH");
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
line 537
;537:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 538
;538:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 540
;539:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;540:		}
line 541
;541:		break;
ADDRGP4 $343
JUMPV
LABELV $376
line 543
;542:	case EV_FOOTWADE:
;543:		DEBUGNAME("EV_FOOTWADE");
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
line 544
;544:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 545
;545:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 547
;546:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;547:		}
line 548
;548:		break;
ADDRGP4 $343
JUMPV
LABELV $387
line 550
;549:	case EV_SWIM:
;550:		DEBUGNAME("EV_SWIM");
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
line 551
;551:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $343
line 552
;552:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 554
;553:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;554:		}
line 555
;555:		break;
ADDRGP4 $343
JUMPV
LABELV $398
line 559
;556:
;557:
;558:	case EV_FALL_SHORT:
;559:		DEBUGNAME("EV_FALL_SHORT");
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
line 560
;560:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
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
line 561
;561:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $343
line 563
;562:			// smooth landing z changes
;563:			cg.landChange = -8;
ADDRGP4 cg+110996
CNSTF4 3238002688
ASGNF4
line 564
;564:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 565
;565:		}
line 566
;566:		break;
ADDRGP4 $343
JUMPV
LABELV $412
line 568
;567:	case EV_FALL_MEDIUM:
;568:		DEBUGNAME("EV_FALL_MEDIUM");
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
line 570
;569:		// use normal pain sound
;570:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
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
line 571
;571:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $343
line 573
;572:			// smooth landing z changes
;573:			cg.landChange = -16;
ADDRGP4 cg+110996
CNSTF4 3246391296
ASGNF4
line 574
;574:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 575
;575:		}
line 576
;576:		break;
ADDRGP4 $343
JUMPV
LABELV $424
line 578
;577:	case EV_FALL_FAR:
;578:		DEBUGNAME("EV_FALL_FAR");
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
line 579
;579:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
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
line 580
;580:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 581
;581:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $343
line 583
;582:			// smooth landing z changes
;583:			cg.landChange = -24;
ADDRGP4 cg+110996
CNSTF4 3250585600
ASGNF4
line 584
;584:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 585
;585:		}
line 586
;586:		break;
ADDRGP4 $343
JUMPV
LABELV $438
line 592
;587:
;588:	case EV_STEP_4:
;589:	case EV_STEP_8:
;590:	case EV_STEP_12:
;591:	case EV_STEP_16:		// smooth out step up transitions
;592:		DEBUGNAME("EV_STEP");
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
line 593
;593:	{
line 598
;594:		float	oldStep;
;595:		int		delta;
;596:		int		step;
;597:
;598:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $443
line 599
;599:			break;
ADDRGP4 $343
JUMPV
LABELV $443
line 602
;600:		}
;601:		// if we are interpolating, we don't need to smooth steps
;602:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
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
line 603
;603:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 604
;604:			break;
ADDRGP4 $343
JUMPV
LABELV $447
line 607
;605:		}
;606:		// check for stepping up before a previous step is completed
;607:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 608
;608:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $458
line 609
;609:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
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
line 610
;610:		} else {
ADDRGP4 $459
JUMPV
LABELV $458
line 611
;611:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 612
;612:		}
LABELV $459
line 615
;613:
;614:		// add this amount
;615:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 616
;616:		cg.stepChange = oldStep + step;
ADDRGP4 cg+110980
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 617
;617:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+110980
INDIRF4
CNSTF4 1107296256
LEF4 $462
line 618
;618:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+110980
CNSTF4 1107296256
ASGNF4
line 619
;619:		}
LABELV $462
line 620
;620:		cg.stepTime = cg.time;
ADDRGP4 cg+110984
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 621
;621:		break;
ADDRGP4 $343
JUMPV
LABELV $468
line 625
;622:	}
;623:
;624:	case EV_JUMP_PAD:
;625:		DEBUGNAME("EV_JUMP_PAD");
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
line 627
;626://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;627:		{
line 629
;628:			localEntity_t	*smoke;
;629:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $473
INDIRB
ASGNB 12
line 632
;630:
;631:
;632:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
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
line 639
;633:						  32, 
;634:						  1, 1, 1, 0.33f,
;635:						  1000, 
;636:						  cg.time, 0,
;637:						  LEF_PUFF_DONT_SCALE, 
;638:						  cgs.media.smokePuffShader );
;639:		}
line 642
;640:
;641:		// boing sound at origin, jump sound on player
;642:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
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
line 643
;643:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
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
line 644
;644:		break;
ADDRGP4 $343
JUMPV
LABELV $480
line 647
;645:
;646:	case EV_JUMP:
;647:		DEBUGNAME("EV_JUMP");
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
line 648
;648:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
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
line 649
;649:		break;
ADDRGP4 $343
JUMPV
LABELV $485
line 651
;650:	case EV_TAUNT:
;651:		DEBUGNAME("EV_TAUNT");
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
line 652
;652:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $490
line 653
;653:		{
line 655
;654:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;655:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
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
line 656
;656:		}
ADDRGP4 $343
JUMPV
LABELV $490
line 658
;657:		else
;658:		{
line 660
;659:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;660:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
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
line 661
;661:		}
line 662
;662:		break;
ADDRGP4 $343
JUMPV
LABELV $494
line 690
;663:#ifdef MISSIONPACK
;664:	case EV_TAUNT_YES:
;665:		DEBUGNAME("EV_TAUNT_YES");
;666:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;667:		break;
;668:	case EV_TAUNT_NO:
;669:		DEBUGNAME("EV_TAUNT_NO");
;670:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;671:		break;
;672:	case EV_TAUNT_FOLLOWME:
;673:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;674:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;675:		break;
;676:	case EV_TAUNT_GETFLAG:
;677:		DEBUGNAME("EV_TAUNT_GETFLAG");
;678:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;679:		break;
;680:	case EV_TAUNT_GUARDBASE:
;681:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;682:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;683:		break;
;684:	case EV_TAUNT_PATROL:
;685:		DEBUGNAME("EV_TAUNT_PATROL");
;686:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;687:		break;
;688:#endif
;689:	case EV_WATER_TOUCH:
;690:		DEBUGNAME("EV_WATER_TOUCH");
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
line 691
;691:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
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
line 692
;692:		break;
ADDRGP4 $343
JUMPV
LABELV $501
line 694
;693:	case EV_WATER_LEAVE:
;694:		DEBUGNAME("EV_WATER_LEAVE");
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
line 695
;695:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
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
line 696
;696:		break;
ADDRGP4 $343
JUMPV
LABELV $508
line 698
;697:	case EV_WATER_UNDER:
;698:		DEBUGNAME("EV_WATER_UNDER");
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
line 699
;699:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
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
line 700
;700:		break;
ADDRGP4 $343
JUMPV
LABELV $515
line 702
;701:	case EV_WATER_CLEAR:
;702:		DEBUGNAME("EV_WATER_CLEAR");
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
line 703
;703:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
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
line 704
;704:		break;
ADDRGP4 $343
JUMPV
LABELV $521
line 707
;705:
;706:	case EV_ITEM_PICKUP:
;707:		DEBUGNAME("EV_ITEM_PICKUP");
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
line 708
;708:		{
line 712
;709:			gitem_t	*item;
;710:			int		index;
;711:
;712:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 714
;713:
;714:			if ( index < 1 || index >= bg_numItems ) {
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
line 715
;715:				break;
ADDRGP4 $343
JUMPV
LABELV $526
line 717
;716:			}
;717:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 721
;718:
;719:			// powerups and team items will have a separate global sound, this one
;720:			// will be played at prediction time
;721:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
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
line 722
;722:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
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
line 723
;723:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
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
line 740
;724:#ifdef MISSIONPACK
;725:				switch (item->giTag ) {
;726:					case PW_SCOUT:
;727:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;728:					break;
;729:					case PW_GUARD:
;730:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;731:					break;
;732:					case PW_DOUBLER:
;733:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;734:					break;
;735:					case PW_AMMOREGEN:
;736:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;737:					break;
;738:				}
;739:#endif
;740:			} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 741
;741:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 742
;742:			}
LABELV $535
LABELV $530
line 745
;743:
;744:			// show icon and name on status bar
;745:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 746
;746:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 747
;747:			}
line 748
;748:		}
line 749
;749:		break;
ADDRGP4 $343
JUMPV
LABELV $539
line 752
;750:
;751:	case EV_GLOBAL_ITEM_PICKUP:
;752:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
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
line 753
;753:		{
line 757
;754:			gitem_t	*item;
;755:			int		index;
;756:
;757:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 759
;758:
;759:			if ( index < 1 || index >= bg_numItems ) {
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
line 760
;760:				break;
ADDRGP4 $343
JUMPV
LABELV $544
line 762
;761:			}
;762:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 764
;763:			// powerup pickups are global
;764:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $547
line 765
;765:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 766
;766:			}
LABELV $547
line 769
;767:
;768:			// show icon and name on status bar
;769:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 770
;770:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 771
;771:			}
line 772
;772:		}
line 773
;773:		break;
ADDRGP4 $343
JUMPV
LABELV $553
line 779
;774:
;775:	//
;776:	// weapon events
;777:	//
;778:	case EV_NOAMMO:
;779:		DEBUGNAME("EV_NOAMMO");
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
line 781
;780://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;781:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $343
line 782
;782:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 783
;783:		}
line 784
;784:		break;
ADDRGP4 $343
JUMPV
LABELV $561
line 786
;785:	case EV_CHANGE_WEAPON:
;786:		DEBUGNAME("EV_CHANGE_WEAPON");
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
line 787
;787:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
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
line 788
;788:		break;
ADDRGP4 $343
JUMPV
LABELV $568
line 790
;789:	case EV_FIRE_WEAPON:
;790:		DEBUGNAME("EV_FIRE_WEAPON");
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
line 791
;791:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 792
;792:		break;
ADDRGP4 $343
JUMPV
LABELV $573
line 795
;793:
;794:	case EV_FIRE_WEAPON2: 
;795:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
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
line 796
;796:		 CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 797
;797:		 break;
ADDRGP4 $343
JUMPV
LABELV $578
line 800
;798:
;799:	case EV_USE_ITEM0:
;800:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $579
ADDRGP4 $582
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $579
line 801
;801:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 802
;802:		break;
ADDRGP4 $343
JUMPV
LABELV $583
line 804
;803:	case EV_USE_ITEM1:
;804:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $584
ADDRGP4 $587
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $584
line 805
;805:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 806
;806:		break;
ADDRGP4 $343
JUMPV
LABELV $588
line 808
;807:	case EV_USE_ITEM2:
;808:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $589
ADDRGP4 $592
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $589
line 809
;809:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 810
;810:		break;
ADDRGP4 $343
JUMPV
LABELV $593
line 812
;811:	case EV_USE_ITEM3:
;812:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $594
ADDRGP4 $597
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $594
line 813
;813:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 814
;814:		break;
ADDRGP4 $343
JUMPV
LABELV $598
line 816
;815:	case EV_USE_ITEM4:
;816:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $599
ADDRGP4 $602
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $599
line 817
;817:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 818
;818:		break;
ADDRGP4 $343
JUMPV
LABELV $603
line 820
;819:	case EV_USE_ITEM5:
;820:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $604
ADDRGP4 $607
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $604
line 821
;821:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 822
;822:		break;
ADDRGP4 $343
JUMPV
LABELV $608
line 824
;823:	case EV_USE_ITEM6:
;824:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $609
ADDRGP4 $612
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $609
line 825
;825:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 826
;826:		break;
ADDRGP4 $343
JUMPV
LABELV $613
line 828
;827:	case EV_USE_ITEM7:
;828:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $614
ADDRGP4 $617
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $614
line 829
;829:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 830
;830:		break;
ADDRGP4 $343
JUMPV
LABELV $618
line 832
;831:	case EV_USE_ITEM8:
;832:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $619
ADDRGP4 $622
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $619
line 833
;833:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 834
;834:		break;
ADDRGP4 $343
JUMPV
LABELV $623
line 836
;835:	case EV_USE_ITEM9:
;836:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $624
ADDRGP4 $627
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $624
line 837
;837:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 838
;838:		break;
ADDRGP4 $343
JUMPV
LABELV $628
line 840
;839:	case EV_USE_ITEM10:
;840:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $629
ADDRGP4 $632
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $629
line 841
;841:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 842
;842:		break;
ADDRGP4 $343
JUMPV
LABELV $633
line 844
;843:	case EV_USE_ITEM11:
;844:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $634
ADDRGP4 $637
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $634
line 845
;845:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 846
;846:		break;
ADDRGP4 $343
JUMPV
LABELV $638
line 848
;847:	case EV_USE_ITEM12:
;848:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $639
ADDRGP4 $642
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $639
line 849
;849:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 850
;850:		break;
ADDRGP4 $343
JUMPV
LABELV $643
line 852
;851:	case EV_USE_ITEM13:
;852:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $644
ADDRGP4 $647
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $644
line 853
;853:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 854
;854:		break;
ADDRGP4 $343
JUMPV
LABELV $648
line 856
;855:	case EV_USE_ITEM14:
;856:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $649
ADDRGP4 $652
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $649
line 857
;857:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 858
;858:		break;
ADDRGP4 $343
JUMPV
LABELV $653
line 866
;859:
;860:	//=================================================================
;861:
;862:	//
;863:	// other events
;864:	//
;865:	case EV_PLAYER_TELEPORT_IN:
;866:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $654
ADDRGP4 $657
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $654
line 867
;867:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
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
line 868
;868:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 869
;869:		break;
ADDRGP4 $343
JUMPV
LABELV $660
line 872
;870:
;871:	case EV_PLAYER_TELEPORT_OUT:
;872:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $661
ADDRGP4 $664
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $661
line 873
;873:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
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
line 874
;874:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 875
;875:		break;
ADDRGP4 $343
JUMPV
LABELV $667
line 878
;876:
;877:	case EV_ITEM_POP:
;878:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $668
ADDRGP4 $671
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $668
line 879
;879:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 880
;880:		break;
ADDRGP4 $343
JUMPV
LABELV $674
line 882
;881:	case EV_ITEM_RESPAWN:
;882:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $675
ADDRGP4 $678
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $675
line 883
;883:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 884
;884:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 885
;885:		break;
ADDRGP4 $343
JUMPV
LABELV $682
line 888
;886:
;887:	case EV_GRENADE_BOUNCE:
;888:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $683
ADDRGP4 $686
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $683
line 889
;889:		if ( rand() & 1 ) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $687
line 890
;890:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
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
line 891
;891:		} else {
ADDRGP4 $343
JUMPV
LABELV $687
line 892
;892:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
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
line 893
;893:		}
line 894
;894:		break;
ADDRGP4 $343
JUMPV
LABELV $693
line 897
;895:
;896:	case EV_PL_BOUNCE:
;897:		DEBUGNAME("EV_PL_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $694
ADDRGP4 $697
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $694
line 898
;898:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $698
line 899
;899:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
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
line 900
;900:		} else {
ADDRGP4 $343
JUMPV
LABELV $698
line 901
;901:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
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
line 902
;902:		}
line 903
;903:		break;
ADDRGP4 $343
JUMPV
LABELV $704
line 947
;904:
;905:#ifdef MISSIONPACK
;906:	case EV_PROXIMITY_MINE_STICK:
;907:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;908:		if( es->eventParm & SURF_FLESH ) {
;909:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;910:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;911:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;912:		} else {
;913:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;914:		}
;915:		break;
;916:
;917:	case EV_PROXIMITY_MINE_TRIGGER:
;918:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;919:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;920:		break;
;921:	case EV_KAMIKAZE:
;922:		DEBUGNAME("EV_KAMIKAZE");
;923:		CG_KamikazeEffect( cent->lerpOrigin );
;924:		break;
;925:	case EV_OBELISKEXPLODE:
;926:		DEBUGNAME("EV_OBELISKEXPLODE");
;927:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;928:		break;
;929:	case EV_OBELISKPAIN:
;930:		DEBUGNAME("EV_OBELISKPAIN");
;931:		CG_ObeliskPain( cent->lerpOrigin );
;932:		break;
;933:	case EV_INVUL_IMPACT:
;934:		DEBUGNAME("EV_INVUL_IMPACT");
;935:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;936:		break;
;937:	case EV_JUICED:
;938:		DEBUGNAME("EV_JUICED");
;939:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;940:		break;
;941:	case EV_LIGHTNINGBOLT:
;942:		DEBUGNAME("EV_LIGHTNINGBOLT");
;943:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;944:		break;
;945:#endif
;946:	case EV_SCOREPLUM:
;947:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $705
ADDRGP4 $708
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $705
line 948
;948:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
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
line 949
;949:		break;
ADDRGP4 $343
JUMPV
LABELV $709
line 955
;950:
;951:	//
;952:	// missile impacts
;953:	//
;954:	case EV_MISSILE_HIT:
;955:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $710
ADDRGP4 $713
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $710
line 956
;956:		ByteToDir( es->eventParm, dir );
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
line 957
;957:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 958
;958:		break;
ADDRGP4 $343
JUMPV
LABELV $714
line 961
;959:
;960:	case EV_MISSILE_MISS:
;961:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $715
ADDRGP4 $718
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $715
line 962
;962:		ByteToDir( es->eventParm, dir );
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
line 963
;963:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
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
line 964
;964:		break;
ADDRGP4 $343
JUMPV
LABELV $719
line 967
;965:
;966:	case EV_MISSILE_MISS_METAL:
;967:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $720
ADDRGP4 $723
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $720
line 968
;968:		ByteToDir( es->eventParm, dir );
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
line 969
;969:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_METAL );
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
line 970
;970:		break;
ADDRGP4 $343
JUMPV
LABELV $724
line 973
;971:
;972:	case EV_RAILTRAIL:
;973:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $725
ADDRGP4 $728
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $725
line 974
;974:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 977
;975://unlagged - attack prediction #2
;976:		// if the client is us, unlagged is on server-side, and we've got it client-side
;977:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $729
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $729
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $736
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $729
LABELV $736
line 978
;978:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 981
;979:			// do nothing, because it was already predicted
;980:			//Com_Printf("Ignoring rail trail event\n");
;981:		}
ADDRGP4 $343
JUMPV
LABELV $729
line 982
;982:		else {
line 984
;983:			// draw a rail trail, because it wasn't predicted
;984:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 987
;985:
;986:			// if the end was on a nomark surface, don't make an explosion
;987:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $343
line 988
;988:				ByteToDir( es->eventParm, dir );
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
line 989
;989:				CG_MissileHitWall( cent, es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
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
line 990
;990:			}
line 992
;991:			//Com_Printf("Non-predicted rail trail\n");
;992:		}
line 994
;993://unlagged - attack prediction #2
;994:		break;
ADDRGP4 $343
JUMPV
LABELV $739
line 997
;995:
;996:	case EV_BULLET_HIT_WALL:
;997:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $740
ADDRGP4 $743
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $740
line 1000
;998://unlagged - attack prediction #2
;999:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1000:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $744
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $744
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $751
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $744
LABELV $751
line 1001
;1001:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1004
;1002:			// do nothing, because it was already predicted
;1003:			//Com_Printf("Ignoring bullet event\n");
;1004:		}
ADDRGP4 $343
JUMPV
LABELV $744
line 1005
;1005:		else {
line 1007
;1006:			// do the bullet, because it wasn't predicted
;1007:			ByteToDir( es->eventParm, dir );
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
line 1008
;1008:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1010
;1009:			//Com_Printf("Non-predicted bullet\n");
;1010:		}
line 1012
;1011://unlagged - attack prediction #2
;1012:		break;
ADDRGP4 $343
JUMPV
LABELV $752
line 1015
;1013:
;1014:	case EV_BULLET_HIT_FLESH:
;1015:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $753
ADDRGP4 $756
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $753
line 1018
;1016://unlagged - attack prediction #2
;1017:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1018:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $757
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $757
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $764
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $757
LABELV $764
line 1019
;1019:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1022
;1020:			// do nothing, because it was already predicted
;1021:			//Com_Printf("Ignoring bullet event\n");
;1022:		}
ADDRGP4 $343
JUMPV
LABELV $757
line 1023
;1023:		else {
line 1025
;1024:			// do the bullet, because it wasn't predicted
;1025:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1027
;1026:			//Com_Printf("Non-predicted bullet\n");
;1027:		}
line 1029
;1028://unlagged - attack prediction #2
;1029:		break;
ADDRGP4 $343
JUMPV
LABELV $765
line 1032
;1030:
;1031:	case EV_SHOTGUN:
;1032:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $766
ADDRGP4 $769
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $766
line 1035
;1033://unlagged - attack prediction #2
;1034:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1035:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $770
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $770
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $777
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $770
LABELV $777
line 1036
;1036:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1039
;1037:			// do nothing, because it was already predicted
;1038:			//Com_Printf("Ignoring shotgun event\n");
;1039:		}
ADDRGP4 $343
JUMPV
LABELV $770
line 1040
;1040:		else {
line 1042
;1041:			// do the shotgun pattern, because it wasn't predicted
;1042:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1044
;1043:			//Com_Printf("Non-predicted shotgun pattern\n");
;1044:		}
line 1046
;1045://unlagged - attack prediction #2
;1046:		break;
ADDRGP4 $343
JUMPV
LABELV $778
line 1049
;1047:
;1048:	case EV_GENERAL_SOUND:
;1049:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $779
ADDRGP4 $782
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $779
line 1050
;1050:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $783
line 1051
;1051:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1052
;1052:		} else {
ADDRGP4 $343
JUMPV
LABELV $783
line 1053
;1053:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1054
;1054:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
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
line 1055
;1055:		}
line 1056
;1056:		break;
ADDRGP4 $343
JUMPV
LABELV $787
line 1059
;1057:
;1058:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1059:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $788
ADDRGP4 $791
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $788
line 1060
;1060:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $792
line 1061
;1061:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
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
line 1062
;1062:		} else {
ADDRGP4 $343
JUMPV
LABELV $792
line 1063
;1063:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1064
;1064:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
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
line 1065
;1065:		}
line 1066
;1066:		break;
ADDRGP4 $343
JUMPV
LABELV $798
line 1069
;1067:
;1068:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1069:		{
line 1070
;1070:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $799
ADDRGP4 $802
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $799
line 1071
;1071:			switch( es->eventParm ) {
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
ADDRGP4 $922
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $922
address $806
address $816
address $826
address $838
address $850
address $870
address $890
address $898
address $906
address $909
address $912
address $915
address $918
address $343
code
LABELV $806
line 1073
;1072:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1073:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $807
line 1074
;1074:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+153876+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $343
JUMPV
LABELV $807
line 1076
;1075:					else
;1076:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+153876+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1077
;1077:					break;
ADDRGP4 $343
JUMPV
LABELV $816
line 1079
;1078:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1079:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $817
line 1080
;1080:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+153876+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $343
JUMPV
LABELV $817
line 1082
;1081:					else
;1082:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+153876+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1083
;1083:					break;
ADDRGP4 $343
JUMPV
LABELV $826
line 1085
;1084:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1085:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $827
line 1086
;1086:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+153876+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $828
JUMPV
LABELV $827
line 1088
;1087:					else
;1088:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+153876+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $828
line 1090
;1089:					//
;1090:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+153876+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1091
;1091:					break;
ADDRGP4 $343
JUMPV
LABELV $838
line 1093
;1092:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1093:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $839
line 1094
;1094:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+153876+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $840
JUMPV
LABELV $839
line 1096
;1095:					else
;1096:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+153876+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $840
line 1098
;1097:					//
;1098:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+153876+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1099
;1099:					break;
ADDRGP4 $343
JUMPV
LABELV $850
line 1103
;1100:
;1101:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1102:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1103:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $855
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $851
LABELV $855
line 1104
;1104:					}
ADDRGP4 $343
JUMPV
LABELV $851
line 1105
;1105:					else {
line 1106
;1106:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $856
line 1112
;1107:#ifdef MISSIONPACK
;1108:							if (cgs.gametype == GT_1FCTF) 
;1109:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1110:							else
;1111:#endif
;1112:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+153876+996
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1113
;1113:						}
ADDRGP4 $343
JUMPV
LABELV $856
line 1114
;1114:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $343
line 1120
;1115:#ifdef MISSIONPACK
;1116:							if (cgs.gametype == GT_1FCTF)
;1117:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1118:							else
;1119:#endif
;1120: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+153876+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1121
;1121:						}
line 1122
;1122:					}
line 1123
;1123:					break;
ADDRGP4 $343
JUMPV
LABELV $870
line 1126
;1124:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1125:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1126:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $875
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $871
LABELV $875
line 1127
;1127:					}
ADDRGP4 $343
JUMPV
LABELV $871
line 1128
;1128:					else {
line 1129
;1129:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $876
line 1135
;1130:#ifdef MISSIONPACK
;1131:							if (cgs.gametype == GT_1FCTF)
;1132:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1133:							else
;1134:#endif
;1135:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+153876+996
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1136
;1136:						}
ADDRGP4 $343
JUMPV
LABELV $876
line 1137
;1137:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 1143
;1138:#ifdef MISSIONPACK
;1139:							if (cgs.gametype == GT_1FCTF)
;1140:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1141:							else
;1142:#endif
;1143:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+153876+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1144
;1144:						}
line 1145
;1145:					}
line 1146
;1146:					break;
ADDRGP4 $343
JUMPV
LABELV $890
line 1148
;1147:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1148:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $343
line 1149
;1149:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1150
;1150:					}
line 1151
;1151:					break;
ADDRGP4 $343
JUMPV
LABELV $898
line 1153
;1152:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1153:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $343
line 1154
;1154:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1155
;1155:					}
line 1156
;1156:					break;
ADDRGP4 $343
JUMPV
LABELV $906
line 1159
;1157:
;1158:				case GTS_REDTEAM_SCORED:
;1159:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+153876+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1160
;1160:					break;
ADDRGP4 $343
JUMPV
LABELV $909
line 1162
;1161:				case GTS_BLUETEAM_SCORED:
;1162:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+153876+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1163
;1163:					break;
ADDRGP4 $343
JUMPV
LABELV $912
line 1165
;1164:				case GTS_REDTEAM_TOOK_LEAD:
;1165:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+153876+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1166
;1166:					break;
ADDRGP4 $343
JUMPV
LABELV $915
line 1168
;1167:				case GTS_BLUETEAM_TOOK_LEAD:
;1168:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+153876+952
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1169
;1169:					break;
ADDRGP4 $343
JUMPV
LABELV $918
line 1171
;1170:				case GTS_TEAMS_ARE_TIED:
;1171:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+153876+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1172
;1172:					break;
line 1175
;1173:				case GTS_KAMIKAZE:
;1174:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1175:					break;
line 1178
;1176:
;1177:				default:
;1178:					break;
line 1180
;1179:			}
;1180:			break;
ADDRGP4 $343
JUMPV
LABELV $923
line 1186
;1181:		}
;1182:
;1183:	case EV_PAIN:
;1184:		// local player sounds are triggered in CG_CheckLocalSounds,
;1185:		// so ignore events on the player
;1186:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $924
ADDRGP4 $927
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $924
line 1187
;1187:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $343
line 1188
;1188:			CG_PainEvent( cent, es->eventParm );
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
line 1189
;1189:		}
line 1190
;1190:		break;
ADDRGP4 $343
JUMPV
LABELV $931
line 1195
;1191:
;1192:	case EV_DEATH1:
;1193:	case EV_DEATH2:
;1194:	case EV_DEATH3:
;1195:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $932
ADDRGP4 $935
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $932
line 1196
;1196:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $936
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
line 1198
;1197:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1198:		break;
ADDRGP4 $343
JUMPV
LABELV $937
line 1202
;1199:
;1200:
;1201:	case EV_OBITUARY:
;1202:		DEBUGNAME("EV_OBITUARY");
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
line 1203
;1203:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1204
;1204:		break;
ADDRGP4 $343
JUMPV
LABELV $942
line 1210
;1205:
;1206:	//
;1207:	// powerup events
;1208:	//
;1209:	case EV_POWERUP_QUAD:
;1210:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $943
ADDRGP4 $946
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $943
line 1211
;1211:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $947
line 1212
;1212:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+126476
CNSTI4 1
ASGNI4
line 1213
;1213:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1214
;1214:		}
LABELV $947
line 1215
;1215:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
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
line 1216
;1216:		break;
ADDRGP4 $343
JUMPV
LABELV $955
line 1218
;1217:	case EV_POWERUP_BATTLESUIT:
;1218:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $956
ADDRGP4 $959
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $956
line 1219
;1219:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $960
line 1220
;1220:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+126476
CNSTI4 2
ASGNI4
line 1221
;1221:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1222
;1222:		}
LABELV $960
line 1223
;1223:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
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
line 1224
;1224:		break;
ADDRGP4 $343
JUMPV
LABELV $968
line 1226
;1225:	case EV_POWERUP_REGEN:
;1226:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $969
ADDRGP4 $972
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $969
line 1227
;1227:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $973
line 1228
;1228:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+126476
CNSTI4 5
ASGNI4
line 1229
;1229:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1230
;1230:		}
LABELV $973
line 1231
;1231:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
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
line 1232
;1232:		break;
ADDRGP4 $343
JUMPV
LABELV $981
line 1235
;1233:
;1234:	case EV_GIB_PLAYER:
;1235:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $982
ADDRGP4 $985
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $982
line 1242
;1236:		// don't play gib sound when using the kamikaze because it interferes
;1237:		// with the kamikaze sound, downside is that the gib sound will also
;1238:		// not be played when someone is gibbed while just carrying the kamikaze
;1239:		
;1240:		// We've used this bit
;1241:		//if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1242:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1245
;1243:		//}
;1244:		
;1245:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1246
;1246:		break;
ADDRGP4 $343
JUMPV
LABELV $988
line 1250
;1247:
;1248:	// Shafe - Trep - Headshot stuff
;1249:	case EV_GIB_PLAYER_HEADSHOT:
;1250:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $989
ADDRGP4 $992
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $989
line 1251
;1251:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1252
;1252:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1253
;1253:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1254
;1254:		break;
ADDRGP4 $343
JUMPV
LABELV $995
line 1257
;1255:
;1256:	case EV_BODY_NOHEAD:
;1257:		DEBUGNAME("EV_BODY_NOHEAD");
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
;1258:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1259
;1259:		break;
ADDRGP4 $343
JUMPV
LABELV $1000
line 1262
;1260:	// Shafe - Trep - End Headshot Stuff
;1261:	case EV_BREAK_GLASS:
;1262: 		DEBUGNAME("EV_BREAK_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1001
ADDRGP4 $1004
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1001
line 1264
;1263: 		// Change cgs.media.gibSound to whatever sound you want it to use
;1264:  		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.glassSound );
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
line 1265
;1265: 		CG_BreakGlass( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_BreakGlass
CALLV
pop
line 1266
;1266: 		break;
ADDRGP4 $343
JUMPV
LABELV $1007
line 1268
;1267:	case EV_ERROR:
;1268: 		DEBUGNAME("EV_ERROR");
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
line 1269
;1269: 		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.errorSound );
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
line 1270
;1270: 		break;
ADDRGP4 $343
JUMPV
LABELV $1014
line 1272
;1271:	case EV_STOPLOOPINGSOUND:
;1272:		DEBUGNAME("EV_STOPLOOPINGSOUND");
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
line 1273
;1273:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1274
;1274:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1275
;1275:		break;
ADDRGP4 $343
JUMPV
LABELV $1019
line 1278
;1276:
;1277:	case EV_DEBUG_LINE:
;1278:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1020
ADDRGP4 $1023
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1020
line 1279
;1279:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1280
;1280:		break;
ADDRGP4 $343
JUMPV
LABELV $342
line 1283
;1281:
;1282:	default:
;1283:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1024
ADDRGP4 $1027
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1024
line 1284
;1284:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1028
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1285
;1285:		break;
LABELV $343
line 1288
;1286:	}
;1287:
;1288:}
LABELV $327
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1297
;1289:
;1290:
;1291:/*
;1292:==============
;1293:CG_CheckEvents
;1294:
;1295:==============
;1296:*/
;1297:void CG_CheckEvents( centity_t *cent ) {
line 1299
;1298:	// check for event-only entities
;1299:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1032
line 1300
;1300:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1034
line 1301
;1301:			return;	// already fired
ADDRGP4 $1031
JUMPV
LABELV $1034
line 1304
;1302:		}
;1303:		// if this is a player event set the entity number of the client entity number
;1304:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1036
line 1305
;1305:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1306
;1306:		}
LABELV $1036
line 1308
;1307:
;1308:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 1310
;1309:
;1310:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1311
;1311:	} else {
ADDRGP4 $1033
JUMPV
LABELV $1032
line 1313
;1312:		// check for events riding with another entity
;1313:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $1038
line 1314
;1314:			return;
ADDRGP4 $1031
JUMPV
LABELV $1038
line 1316
;1315:		}
;1316:		cent->previousEvent = cent->currentState.event;
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
line 1317
;1317:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1040
line 1318
;1318:			return;
ADDRGP4 $1031
JUMPV
LABELV $1040
line 1320
;1319:		}
;1320:	}
LABELV $1033
line 1323
;1321:
;1322:	// calculate the position at exactly the frame time
;1323:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1324
;1324:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1326
;1325:
;1326:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1327
;1327:}
LABELV $1031
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
LABELV $1028
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
LABELV $1027
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
LABELV $1023
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
LABELV $1018
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
LABELV $1011
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
LABELV $1004
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
LABELV $999
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
LABELV $992
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
LABELV $985
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
LABELV $972
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
LABELV $959
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
LABELV $946
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
LABELV $941
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
LABELV $936
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
LABELV $935
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
LABELV $927
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
LABELV $802
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
LABELV $791
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
LABELV $782
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
LABELV $769
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
LABELV $756
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
LABELV $743
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
LABELV $728
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
LABELV $723
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
LABELV $718
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
LABELV $713
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
LABELV $708
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
LABELV $697
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
LABELV $686
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
LABELV $678
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
LABELV $671
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
LABELV $664
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
LABELV $657
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
LABELV $652
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
LABELV $647
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
LABELV $642
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
LABELV $637
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
LABELV $632
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
LABELV $627
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
LABELV $622
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
LABELV $617
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
LABELV $612
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
LABELV $607
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
LABELV $602
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
LABELV $597
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
LABELV $592
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
LABELV $587
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
LABELV $582
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
LABELV $281
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $280
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
LABELV $270
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
LABELV $269
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
LABELV $264
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
LABELV $263
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
LABELV $262
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
LABELV $260
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
LABELV $259
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
LABELV $257
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
LABELV $256
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
LABELV $254
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
LABELV $252
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
LABELV $251
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
LABELV $249
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
LABELV $247
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
LABELV $245
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
LABELV $244
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
LABELV $242
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
LABELV $241
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
LABELV $239
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
LABELV $237
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
LABELV $236
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
LABELV $234
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
LABELV $233
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
LABELV $231
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
LABELV $230
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $228
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
LABELV $226
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
LABELV $224
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
LABELV $222
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
LABELV $211
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $208
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
LABELV $205
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
LABELV $201
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
LABELV $198
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
LABELV $189
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
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
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $183
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
LABELV $180
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
LABELV $177
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
LABELV $176
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
LABELV $173
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
LABELV $169
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
LABELV $167
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
LABELV $166
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
LABELV $163
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
LABELV $159
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
LABELV $158
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
LABELV $155
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
LABELV $150
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
LABELV $147
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
LABELV $137
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
LABELV $135
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
