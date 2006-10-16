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
proc CG_Obituary 132 20
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
;232:			} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 233
;233:				s = va("Headshot!\n\nYou fragged %s", targetName );
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
line 234
;234:			}	
LABELV $203
line 237
;235:			
;236:	
;237:		}
LABELV $194
line 243
;238:#ifdef MISSIONPACK
;239:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;240:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;241:		} 
;242:#else
;243:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
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
line 247
;244:#endif
;245:
;246:		// print the text message as well
;247:	}
LABELV $190
line 250
;248:
;249:	// check for double client messages
;250:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $209
line 251
;251:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 252
;252:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $211
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 253
;253:	} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 254
;254:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
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
line 255
;255:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 257
;256:		// check for kill messages about the current clientNum
;257:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $212
line 258
;258:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+116400
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 259
;259:		}
LABELV $212
line 260
;260:	}
LABELV $210
line 262
;261:
;262:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $217
line 263
;263:		switch (mod) {
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
ADDRGP4 $263-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $263
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
address $250
address $219
address $219
address $219
address $219
address $253
address $219
address $219
address $219
address $219
address $219
address $259
address $221
address $256
code
LABELV $221
line 265
;264:		case MOD_GRAPPLE:
;265:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $222
ASGNP4
line 266
;266:			break;
ADDRGP4 $220
JUMPV
LABELV $223
line 268
;267:		case MOD_GAUNTLET:
;268:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $224
ASGNP4
line 269
;269:			break;
ADDRGP4 $220
JUMPV
LABELV $225
line 271
;270:		case MOD_MACHINEGUN:
;271:			message = "was assaulted by";
ADDRLP4 40
ADDRGP4 $226
ASGNP4
line 272
;272:			break;
ADDRGP4 $220
JUMPV
LABELV $227
line 274
;273:		case MOD_SHOTGUN:
;274:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 275
;275:			break;
ADDRGP4 $220
JUMPV
LABELV $229
line 277
;276:		case MOD_GRENADE:
;277:			message = "ate";
ADDRLP4 40
ADDRGP4 $230
ASGNP4
line 278
;278:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $231
ASGNP4
line 279
;279:			break;
ADDRGP4 $220
JUMPV
LABELV $232
line 281
;280:		case MOD_GRENADE_SPLASH:
;281:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $233
ASGNP4
line 282
;282:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $234
ASGNP4
line 283
;283:			break;
ADDRGP4 $220
JUMPV
LABELV $235
line 285
;284:		case MOD_ROCKET:
;285:			message = "was crushed by";
ADDRLP4 40
ADDRGP4 $236
ASGNP4
line 286
;286:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $237
ASGNP4
line 287
;287:			break;
ADDRGP4 $220
JUMPV
LABELV $238
line 289
;288:		case MOD_ROCKET_SPLASH:
;289:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $239
ASGNP4
line 290
;290:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $237
ASGNP4
line 291
;291:			break;
ADDRGP4 $220
JUMPV
LABELV $240
line 293
;292:		case MOD_PLASMA:
;293:			message = "was sliced to shreds by";
ADDRLP4 40
ADDRGP4 $241
ASGNP4
line 294
;294:			message2 = "'s gata gun";
ADDRLP4 88
ADDRGP4 $242
ASGNP4
line 295
;295:			break;
ADDRGP4 $220
JUMPV
LABELV $243
line 297
;296:		case MOD_PLASMA_SPLASH:
;297:			message = "was shreded by";
ADDRLP4 40
ADDRGP4 $244
ASGNP4
line 298
;298:			message2 = "'s gata fun";
ADDRLP4 88
ADDRGP4 $245
ASGNP4
line 299
;299:			break;
ADDRGP4 $220
JUMPV
LABELV $246
line 301
;300:		case MOD_RAILGUN:
;301:			message = "was degaussed by"; // Shafe - Trep - Reworded
ADDRLP4 40
ADDRGP4 $247
ASGNP4
line 302
;302:			break;
ADDRGP4 $220
JUMPV
LABELV $248
line 304
;303:		case MOD_LIGHTNING:
;304:			message = "was burnt by";
ADDRLP4 40
ADDRGP4 $249
ASGNP4
line 305
;305:			break;
ADDRGP4 $220
JUMPV
LABELV $250
line 308
;306:		case MOD_BFG:
;307:		case MOD_BFG_SPLASH:
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
line 332
;311:#ifdef MISSIONPACK
;312:		case MOD_NAIL:
;313:			message = "was nailed by";
;314:			break;
;315:		case MOD_CHAINGUN:
;316:			message = "got lead poisoning from";
;317:			message2 = "'s Chaingun";
;318:			break;
;319:		case MOD_PROXIMITY_MINE:
;320:			message = "was too close to";
;321:			message2 = "'s Prox Mine";
;322:			break;
;323:		case MOD_KAMIKAZE:
;324:			message = "falls to";
;325:			message2 = "'s Kamikaze blast";
;326:			break;
;327:		case MOD_JUICED:
;328:			message = "was juiced by";
;329:			break;
;330:#endif
;331:		case MOD_TELEFRAG:
;332:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $254
ASGNP4
line 333
;333:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $255
ASGNP4
line 334
;334:			break;
ADDRGP4 $220
JUMPV
LABELV $256
line 336
;335:		case MOD_ALTFLAMER:		// Shafe - Trep - Flame Thrower Alt
;336:			message = "was toasted by";
ADDRLP4 40
ADDRGP4 $257
ASGNP4
line 337
;337:			message2 = "'s flame thrower";
ADDRLP4 88
ADDRGP4 $258
ASGNP4
line 338
;338:			break;
ADDRGP4 $220
JUMPV
LABELV $259
line 340
;339:		case MOD_TURRET:
;340:			message = "was shot down by ";
ADDRLP4 40
ADDRGP4 $260
ASGNP4
line 341
;341:			message2 = "'s turret.";
ADDRLP4 88
ADDRGP4 $261
ASGNP4
line 342
;342:			break;
ADDRGP4 $220
JUMPV
LABELV $219
line 344
;343:		default:
;344:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $262
ASGNP4
line 345
;345:			break;
LABELV $220
line 348
;346:		}
;347:
;348:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $265
line 349
;349:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $267
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
line 351
;350:				targetName, message, attackerName, message2);
;351:			return;
ADDRGP4 $107
JUMPV
LABELV $265
line 353
;352:		}
;353:	}
LABELV $217
line 356
;354:
;355:	// we don't know what it was
;356:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $268
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 357
;357:}
LABELV $107
endproc CG_Obituary 132 20
proc CG_UseItem 32 16
line 366
;358:
;359://==========================================================================
;360:
;361:/*
;362:===============
;363:CG_UseItem
;364:===============
;365:*/
;366:static void CG_UseItem( centity_t *cent ) {
line 372
;367:	clientInfo_t *ci;
;368:	int			itemNum, clientNum;
;369:	gitem_t		*item;
;370:	entityState_t *es;
;371:
;372:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 374
;373:	
;374:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
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
line 375
;375:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $272
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $270
LABELV $272
line 376
;376:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 377
;377:	}
LABELV $270
line 380
;378:
;379:	// print a message if the local player
;380:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $273
line 381
;381:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $276
line 382
;382:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $278
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 383
;383:		} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 384
;384:			item = BG_FindItemForHoldable( itemNum );
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
line 385
;385:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $279
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
line 386
;386:		}
LABELV $277
line 387
;387:	}
LABELV $273
line 389
;388:
;389:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $282
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $281
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $286
ADDRGP4 $280
JUMPV
LABELV $280
LABELV $282
line 392
;390:	default:
;391:	case HI_NONE:
;392:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
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
line 393
;393:		break;
ADDRGP4 $281
JUMPV
line 396
;394:
;395:	case HI_TELEPORTER:
;396:		break;
LABELV $286
line 399
;397:
;398:	case HI_MEDKIT:
;399:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 400
;400:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $287
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $287
line 401
;401:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1732
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 402
;402:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 403
;403:		}
LABELV $287
line 404
;404:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
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
line 405
;405:		break;
LABELV $281
line 418
;406:
;407:#ifdef MISSIONPACK
;408:	case HI_KAMIKAZE:
;409:		break;
;410:	case HI_PORTAL:
;411:		break;
;412:	case HI_INVULNERABILITY:
;413:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;414:		break;
;415:#endif
;416:	}
;417:
;418:}
LABELV $269
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 427
;419:
;420:/*
;421:================
;422:CG_ItemPickup
;423:
;424:A new item was picked up this frame
;425:================
;426:*/
;427:static void CG_ItemPickup( int itemNum ) {
line 428
;428:	cg.itemPickup = itemNum;
ADDRGP4 cg+126732
ADDRFP4 0
INDIRI4
ASGNI4
line 429
;429:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+126736
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 430
;430:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+126740
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 432
;431:	// see if it should be the grabbed weapon
;432:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $299
line 434
;433:		// select it immediately
;434:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $302
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $302
line 435
;435:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+126744
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 436
;436:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+111004
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 437
;437:		}
LABELV $302
line 438
;438:	}
LABELV $299
line 440
;439:
;440:}
LABELV $293
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 450
;441:
;442:
;443:/*
;444:================
;445:CG_PainEvent
;446:
;447:Also called by playerstate transition
;448:================
;449:*/
;450:void CG_PainEvent( centity_t *cent, int health ) {
line 454
;451:	char	*snd;
;452:
;453:	// don't do more than two pain sounds a second
;454:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+109652
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $311
line 455
;455:		return;
ADDRGP4 $310
JUMPV
LABELV $311
line 458
;456:	}
;457:
;458:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $314
line 459
;459:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $316
ASGNP4
line 460
;460:	} else if ( health < 50 ) {
ADDRGP4 $315
JUMPV
LABELV $314
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $317
line 461
;461:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $319
ASGNP4
line 462
;462:	} else if ( health < 75 ) {
ADDRGP4 $318
JUMPV
LABELV $317
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $320
line 463
;463:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $322
ASGNP4
line 464
;464:	} else {
ADDRGP4 $321
JUMPV
LABELV $320
line 465
;465:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $323
ASGNP4
line 466
;466:	}
LABELV $321
LABELV $318
LABELV $315
line 467
;467:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
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
line 471
;468:		CG_CustomSound( cent->currentState.number, snd ) );
;469:
;470:	// save pain time for programitic twitch animation
;471:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 472
;472:	cent->pe.painDirection ^= 1;
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
line 473
;473:}
LABELV $310
endproc CG_PainEvent 12 16
lit
align 4
LABELV $471
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 112 48
line 486
;474:
;475:
;476:
;477:/*
;478:==============
;479:CG_EntityEvent
;480:
;481:An entity has an event value
;482:also called by CG_CheckPlayerstateEvents
;483:==============
;484:*/
;485:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;486:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 495
;487:	entityState_t	*es;
;488:	int				event;
;489:	vec3_t			dir;
;490:	const char		*s;
;491:	int				clientNum;
;492:	clientInfo_t	*ci;
;493:
;494:	
;495:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 496
;496:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 498
;497:
;498:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $326
line 499
;499:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $329
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
line 500
;500:	}
LABELV $326
line 502
;501:
;502:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $330
line 503
;503:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $325
ADDRGP4 $335
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 504
;504:		return;
ADDRGP4 $325
JUMPV
LABELV $330
line 507
;505:	}
;506:
;507:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 508
;508:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $338
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $336
LABELV $338
line 509
;509:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 510
;510:	}
LABELV $336
line 511
;511:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1732
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 513
;512:
;513:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $340
ADDRLP4 8
INDIRI4
CNSTI4 75
GTI4 $340
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1027-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1027
address $342
address $352
address $363
address $374
address $385
address $436
address $436
address $436
address $436
address $396
address $410
address $422
address $466
address $478
address $492
address $499
address $506
address $513
address $519
address $537
address $551
address $559
address $566
address $571
address $576
address $581
address $586
address $591
address $596
address $601
address $606
address $611
address $616
address $621
address $626
address $631
address $636
address $641
address $646
address $340
address $672
address $665
address $651
address $658
address $680
address $691
address $776
address $785
address $796
address $750
address $737
address $707
address $712
address $717
address $722
address $763
address $340
address $921
address $929
address $929
address $929
address $935
address $940
address $953
address $966
address $979
address $986
address $993
address $702
address $998
address $340
address $1005
address $1017
address $1012
address $483
code
LABELV $342
line 518
;514:	//
;515:	// movement generated events
;516:	//
;517:	case EV_FOOTSTEP:
;518:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $343
ADDRGP4 $346
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $343
line 519
;519:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $341
line 520
;520:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
line 522
;521:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;522:		}
line 523
;523:		break;
ADDRGP4 $341
JUMPV
LABELV $352
line 525
;524:	case EV_FOOTSTEP_METAL:
;525:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $353
ADDRGP4 $356
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $353
line 526
;526:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $341
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
ADDRGP4 cgs+153876+604+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 529
;528:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;529:		}
line 530
;530:		break;
ADDRGP4 $341
JUMPV
LABELV $363
line 532
;531:	case EV_FOOTSPLASH:
;532:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $364
ADDRGP4 $367
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $364
line 533
;533:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $341
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
ADDRGP4 cgs+153876+604+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 536
;535:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;536:		}
line 537
;537:		break;
ADDRGP4 $341
JUMPV
LABELV $374
line 539
;538:	case EV_FOOTWADE:
;539:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $375
ADDRGP4 $378
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $375
line 540
;540:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $341
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
ADDRGP4 $341
JUMPV
LABELV $385
line 546
;545:	case EV_SWIM:
;546:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $386
ADDRGP4 $389
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $386
line 547
;547:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $341
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
ADDRGP4 $341
JUMPV
LABELV $396
line 555
;552:
;553:
;554:	case EV_FALL_SHORT:
;555:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $397
ADDRGP4 $400
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $397
line 556
;556:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
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
line 557
;557:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $341
line 559
;558:			// smooth landing z changes
;559:			cg.landChange = -8;
ADDRGP4 cg+110996
CNSTF4 3238002688
ASGNF4
line 560
;560:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 561
;561:		}
line 562
;562:		break;
ADDRGP4 $341
JUMPV
LABELV $410
line 564
;563:	case EV_FALL_MEDIUM:
;564:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $411
ADDRGP4 $414
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $411
line 566
;565:		// use normal pain sound
;566:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $323
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
line 567
;567:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $341
line 569
;568:			// smooth landing z changes
;569:			cg.landChange = -16;
ADDRGP4 cg+110996
CNSTF4 3246391296
ASGNF4
line 570
;570:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 571
;571:		}
line 572
;572:		break;
ADDRGP4 $341
JUMPV
LABELV $422
line 574
;573:	case EV_FALL_FAR:
;574:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $423
ADDRGP4 $426
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $423
line 575
;575:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $427
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
line 576
;576:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 577
;577:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $341
line 579
;578:			// smooth landing z changes
;579:			cg.landChange = -24;
ADDRGP4 cg+110996
CNSTF4 3250585600
ASGNF4
line 580
;580:			cg.landTime = cg.time;
ADDRGP4 cg+111000
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 581
;581:		}
line 582
;582:		break;
ADDRGP4 $341
JUMPV
LABELV $436
line 588
;583:
;584:	case EV_STEP_4:
;585:	case EV_STEP_8:
;586:	case EV_STEP_12:
;587:	case EV_STEP_16:		// smooth out step up transitions
;588:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $437
ADDRGP4 $440
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $437
line 589
;589:	{
line 594
;590:		float	oldStep;
;591:		int		delta;
;592:		int		step;
;593:
;594:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
EQI4 $441
line 595
;595:			break;
ADDRGP4 $341
JUMPV
LABELV $441
line 598
;596:		}
;597:		// if we are interpolating, we don't need to smooth steps
;598:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $453
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $453
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $453
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $445
LABELV $453
line 599
;599:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 600
;600:			break;
ADDRGP4 $341
JUMPV
LABELV $445
line 603
;601:		}
;602:		// check for stepping up before a previous step is completed
;603:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+109652
INDIRI4
ADDRGP4 cg+110984
INDIRI4
SUBI4
ASGNI4
line 604
;604:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $456
line 605
;605:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
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
line 606
;606:		} else {
ADDRGP4 $457
JUMPV
LABELV $456
line 607
;607:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 608
;608:		}
LABELV $457
line 611
;609:
;610:		// add this amount
;611:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 612
;612:		cg.stepChange = oldStep + step;
ADDRGP4 cg+110980
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 613
;613:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+110980
INDIRF4
CNSTF4 1107296256
LEF4 $460
line 614
;614:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+110980
CNSTF4 1107296256
ASGNF4
line 615
;615:		}
LABELV $460
line 616
;616:		cg.stepTime = cg.time;
ADDRGP4 cg+110984
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 617
;617:		break;
ADDRGP4 $341
JUMPV
LABELV $466
line 621
;618:	}
;619:
;620:	case EV_JUMP_PAD:
;621:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $467
ADDRGP4 $470
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $467
line 623
;622://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;623:		{
line 625
;624:			localEntity_t	*smoke;
;625:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $471
INDIRB
ASGNB 12
line 628
;626:
;627:
;628:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
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
line 635
;629:						  32, 
;630:						  1, 1, 1, 0.33f,
;631:						  1000, 
;632:						  cg.time, 0,
;633:						  LEF_PUFF_DONT_SCALE, 
;634:						  cgs.media.smokePuffShader );
;635:		}
line 638
;636:
;637:		// boing sound at origin, jump sound on player
;638:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
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
line 639
;639:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $477
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
line 640
;640:		break;
ADDRGP4 $341
JUMPV
LABELV $478
line 643
;641:
;642:	case EV_JUMP:
;643:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $479
ADDRGP4 $482
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $479
line 644
;644:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $477
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
line 645
;645:		break;
ADDRGP4 $341
JUMPV
LABELV $483
line 647
;646:	case EV_TAUNT:
;647:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $484
ADDRGP4 $487
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $484
line 648
;648:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $488
line 649
;649:		{
line 651
;650:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;651:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $490
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
line 652
;652:		}
ADDRGP4 $341
JUMPV
LABELV $488
line 654
;653:		else
;654:		{
line 656
;655:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;656:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
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
ADDRGP4 $491
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
line 657
;657:		}
line 658
;658:		break;
ADDRGP4 $341
JUMPV
LABELV $492
line 686
;659:#ifdef MISSIONPACK
;660:	case EV_TAUNT_YES:
;661:		DEBUGNAME("EV_TAUNT_YES");
;662:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;663:		break;
;664:	case EV_TAUNT_NO:
;665:		DEBUGNAME("EV_TAUNT_NO");
;666:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;667:		break;
;668:	case EV_TAUNT_FOLLOWME:
;669:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;670:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;671:		break;
;672:	case EV_TAUNT_GETFLAG:
;673:		DEBUGNAME("EV_TAUNT_GETFLAG");
;674:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;675:		break;
;676:	case EV_TAUNT_GUARDBASE:
;677:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;678:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;679:		break;
;680:	case EV_TAUNT_PATROL:
;681:		DEBUGNAME("EV_TAUNT_PATROL");
;682:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;683:		break;
;684:#endif
;685:	case EV_WATER_TOUCH:
;686:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $493
ADDRGP4 $496
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $493
line 687
;687:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
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
line 688
;688:		break;
ADDRGP4 $341
JUMPV
LABELV $499
line 690
;689:	case EV_WATER_LEAVE:
;690:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $500
ADDRGP4 $503
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $500
line 691
;691:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
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
line 692
;692:		break;
ADDRGP4 $341
JUMPV
LABELV $506
line 694
;693:	case EV_WATER_UNDER:
;694:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $507
ADDRGP4 $510
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $507
line 695
;695:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
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
line 696
;696:		break;
ADDRGP4 $341
JUMPV
LABELV $513
line 698
;697:	case EV_WATER_CLEAR:
;698:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $514
ADDRGP4 $517
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $514
line 699
;699:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $518
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
line 700
;700:		break;
ADDRGP4 $341
JUMPV
LABELV $519
line 703
;701:
;702:	case EV_ITEM_PICKUP:
;703:		DEBUGNAME("EV_ITEM_PICKUP");
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
line 704
;704:		{
line 708
;705:			gitem_t	*item;
;706:			int		index;
;707:
;708:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 710
;709:
;710:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $526
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $524
LABELV $526
line 711
;711:				break;
ADDRGP4 $341
JUMPV
LABELV $524
line 713
;712:			}
;713:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 717
;714:
;715:			// powerups and team items will have a separate global sound, this one
;716:			// will be played at prediction time
;717:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
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
EQI4 $529
ADDRLP4 72
INDIRI4
CNSTI4 8
NEI4 $527
LABELV $529
line 718
;718:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
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
line 719
;719:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $528
JUMPV
LABELV $527
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $532
line 736
;720:#ifdef MISSIONPACK
;721:				switch (item->giTag ) {
;722:					case PW_SCOUT:
;723:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;724:					break;
;725:					case PW_GUARD:
;726:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;727:					break;
;728:					case PW_DOUBLER:
;729:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;730:					break;
;731:					case PW_AMMOREGEN:
;732:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;733:					break;
;734:				}
;735:#endif
;736:			} else {
ADDRGP4 $533
JUMPV
LABELV $532
line 737
;737:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 738
;738:			}
LABELV $533
LABELV $528
line 741
;739:
;740:			// show icon and name on status bar
;741:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $341
line 742
;742:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 743
;743:			}
line 744
;744:		}
line 745
;745:		break;
ADDRGP4 $341
JUMPV
LABELV $537
line 748
;746:
;747:	case EV_GLOBAL_ITEM_PICKUP:
;748:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $538
ADDRGP4 $541
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $538
line 749
;749:		{
line 753
;750:			gitem_t	*item;
;751:			int		index;
;752:
;753:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 755
;754:
;755:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $544
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $542
LABELV $544
line 756
;756:				break;
ADDRGP4 $341
JUMPV
LABELV $542
line 758
;757:			}
;758:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 760
;759:			// powerup pickups are global
;760:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $545
line 761
;761:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 762
;762:			}
LABELV $545
line 765
;763:
;764:			// show icon and name on status bar
;765:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $341
line 766
;766:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 767
;767:			}
line 768
;768:		}
line 769
;769:		break;
ADDRGP4 $341
JUMPV
LABELV $551
line 775
;770:
;771:	//
;772:	// weapon events
;773:	//
;774:	case EV_NOAMMO:
;775:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $552
ADDRGP4 $555
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $552
line 777
;776://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;777:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $341
line 778
;778:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 779
;779:		}
line 780
;780:		break;
ADDRGP4 $341
JUMPV
LABELV $559
line 782
;781:	case EV_CHANGE_WEAPON:
;782:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $560
ADDRGP4 $563
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $560
line 783
;783:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
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
line 784
;784:		break;
ADDRGP4 $341
JUMPV
LABELV $566
line 786
;785:	case EV_FIRE_WEAPON:
;786:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $567
ADDRGP4 $570
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $567
line 787
;787:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 788
;788:		break;
ADDRGP4 $341
JUMPV
LABELV $571
line 791
;789:
;790:	case EV_FIRE_WEAPON2: 
;791:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $572
ADDRGP4 $575
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $572
line 792
;792:		 CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 793
;793:		 break;
ADDRGP4 $341
JUMPV
LABELV $576
line 796
;794:
;795:	case EV_USE_ITEM0:
;796:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $577
ADDRGP4 $580
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $577
line 797
;797:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 798
;798:		break;
ADDRGP4 $341
JUMPV
LABELV $581
line 800
;799:	case EV_USE_ITEM1:
;800:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $582
ADDRGP4 $585
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $582
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
ADDRGP4 $341
JUMPV
LABELV $586
line 804
;803:	case EV_USE_ITEM2:
;804:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $587
ADDRGP4 $590
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $587
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
ADDRGP4 $341
JUMPV
LABELV $591
line 808
;807:	case EV_USE_ITEM3:
;808:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $592
ADDRGP4 $595
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $592
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
ADDRGP4 $341
JUMPV
LABELV $596
line 812
;811:	case EV_USE_ITEM4:
;812:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $597
ADDRGP4 $600
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $597
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
ADDRGP4 $341
JUMPV
LABELV $601
line 816
;815:	case EV_USE_ITEM5:
;816:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $602
ADDRGP4 $605
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $602
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
ADDRGP4 $341
JUMPV
LABELV $606
line 820
;819:	case EV_USE_ITEM6:
;820:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $607
ADDRGP4 $610
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $607
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
ADDRGP4 $341
JUMPV
LABELV $611
line 824
;823:	case EV_USE_ITEM7:
;824:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $612
ADDRGP4 $615
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $612
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
ADDRGP4 $341
JUMPV
LABELV $616
line 828
;827:	case EV_USE_ITEM8:
;828:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $617
ADDRGP4 $620
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $617
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
ADDRGP4 $341
JUMPV
LABELV $621
line 832
;831:	case EV_USE_ITEM9:
;832:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $622
ADDRGP4 $625
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $622
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
ADDRGP4 $341
JUMPV
LABELV $626
line 836
;835:	case EV_USE_ITEM10:
;836:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $627
ADDRGP4 $630
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $627
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
ADDRGP4 $341
JUMPV
LABELV $631
line 840
;839:	case EV_USE_ITEM11:
;840:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $632
ADDRGP4 $635
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $632
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
ADDRGP4 $341
JUMPV
LABELV $636
line 844
;843:	case EV_USE_ITEM12:
;844:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $637
ADDRGP4 $640
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $637
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
ADDRGP4 $341
JUMPV
LABELV $641
line 848
;847:	case EV_USE_ITEM13:
;848:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $642
ADDRGP4 $645
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $642
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
ADDRGP4 $341
JUMPV
LABELV $646
line 852
;851:	case EV_USE_ITEM14:
;852:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $647
ADDRGP4 $650
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $647
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
ADDRGP4 $341
JUMPV
LABELV $651
line 862
;855:
;856:	//=================================================================
;857:
;858:	//
;859:	// other events
;860:	//
;861:	case EV_PLAYER_TELEPORT_IN:
;862:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $652
ADDRGP4 $655
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $652
line 863
;863:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
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
line 864
;864:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 865
;865:		break;
ADDRGP4 $341
JUMPV
LABELV $658
line 868
;866:
;867:	case EV_PLAYER_TELEPORT_OUT:
;868:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $659
ADDRGP4 $662
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $659
line 869
;869:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
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
line 870
;870:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 871
;871:		break;
ADDRGP4 $341
JUMPV
LABELV $665
line 874
;872:
;873:	case EV_ITEM_POP:
;874:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $666
ADDRGP4 $669
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $666
line 875
;875:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 876
;876:		break;
ADDRGP4 $341
JUMPV
LABELV $672
line 878
;877:	case EV_ITEM_RESPAWN:
;878:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $673
ADDRGP4 $676
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $673
line 879
;879:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 880
;880:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
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
line 881
;881:		break;
ADDRGP4 $341
JUMPV
LABELV $680
line 884
;882:
;883:	case EV_GRENADE_BOUNCE:
;884:		DEBUGNAME("EV_GRENADE_BOUNCE");
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
line 885
;885:		if ( rand() & 1 ) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $685
line 886
;886:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
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
line 887
;887:		} else {
ADDRGP4 $341
JUMPV
LABELV $685
line 888
;888:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
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
line 889
;889:		}
line 890
;890:		break;
ADDRGP4 $341
JUMPV
LABELV $691
line 893
;891:
;892:	case EV_PL_BOUNCE:
;893:		DEBUGNAME("EV_PL_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $692
ADDRGP4 $695
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $692
line 894
;894:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $696
line 895
;895:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
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
line 896
;896:		} else {
ADDRGP4 $341
JUMPV
LABELV $696
line 897
;897:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
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
line 898
;898:		}
line 899
;899:		break;
ADDRGP4 $341
JUMPV
LABELV $702
line 943
;900:
;901:#ifdef MISSIONPACK
;902:	case EV_PROXIMITY_MINE_STICK:
;903:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;904:		if( es->eventParm & SURF_FLESH ) {
;905:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;906:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;907:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;908:		} else {
;909:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;910:		}
;911:		break;
;912:
;913:	case EV_PROXIMITY_MINE_TRIGGER:
;914:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;915:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;916:		break;
;917:	case EV_KAMIKAZE:
;918:		DEBUGNAME("EV_KAMIKAZE");
;919:		CG_KamikazeEffect( cent->lerpOrigin );
;920:		break;
;921:	case EV_OBELISKEXPLODE:
;922:		DEBUGNAME("EV_OBELISKEXPLODE");
;923:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;924:		break;
;925:	case EV_OBELISKPAIN:
;926:		DEBUGNAME("EV_OBELISKPAIN");
;927:		CG_ObeliskPain( cent->lerpOrigin );
;928:		break;
;929:	case EV_INVUL_IMPACT:
;930:		DEBUGNAME("EV_INVUL_IMPACT");
;931:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;932:		break;
;933:	case EV_JUICED:
;934:		DEBUGNAME("EV_JUICED");
;935:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;936:		break;
;937:	case EV_LIGHTNINGBOLT:
;938:		DEBUGNAME("EV_LIGHTNINGBOLT");
;939:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;940:		break;
;941:#endif
;942:	case EV_SCOREPLUM:
;943:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $703
ADDRGP4 $706
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $703
line 944
;944:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
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
line 945
;945:		break;
ADDRGP4 $341
JUMPV
LABELV $707
line 951
;946:
;947:	//
;948:	// missile impacts
;949:	//
;950:	case EV_MISSILE_HIT:
;951:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $708
ADDRGP4 $711
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $708
line 952
;952:		ByteToDir( es->eventParm, dir );
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
line 953
;953:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 954
;954:		break;
ADDRGP4 $341
JUMPV
LABELV $712
line 957
;955:
;956:	case EV_MISSILE_MISS:
;957:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $713
ADDRGP4 $716
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $713
line 958
;958:		ByteToDir( es->eventParm, dir );
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
line 959
;959:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
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
line 960
;960:		break;
ADDRGP4 $341
JUMPV
LABELV $717
line 963
;961:
;962:	case EV_MISSILE_MISS_METAL:
;963:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $718
ADDRGP4 $721
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $718
line 964
;964:		ByteToDir( es->eventParm, dir );
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
line 965
;965:		CG_MissileHitWall( cent, es->weapon, 0, position, dir, IMPACTSOUND_METAL );
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
line 966
;966:		break;
ADDRGP4 $341
JUMPV
LABELV $722
line 969
;967:
;968:	case EV_RAILTRAIL:
;969:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $723
ADDRGP4 $726
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $723
line 970
;970:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 973
;971://unlagged - attack prediction #2
;972:		// if the client is us, unlagged is on server-side, and we've got it client-side
;973:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $727
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $727
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 80
INDIRI4
NEI4 $734
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 80
INDIRI4
EQI4 $727
LABELV $734
line 974
;974:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 977
;975:			// do nothing, because it was already predicted
;976:			//Com_Printf("Ignoring rail trail event\n");
;977:		}
ADDRGP4 $341
JUMPV
LABELV $727
line 978
;978:		else {
line 980
;979:			// draw a rail trail, because it wasn't predicted
;980:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 983
;981:
;982:			// if the end was on a nomark surface, don't make an explosion
;983:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $341
line 984
;984:				ByteToDir( es->eventParm, dir );
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
line 985
;985:				CG_MissileHitWall( cent, es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
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
line 986
;986:			}
line 988
;987:			//Com_Printf("Non-predicted rail trail\n");
;988:		}
line 990
;989://unlagged - attack prediction #2
;990:		break;
ADDRGP4 $341
JUMPV
LABELV $737
line 993
;991:
;992:	case EV_BULLET_HIT_WALL:
;993:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $738
ADDRGP4 $741
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $738
line 996
;994://unlagged - attack prediction #2
;995:		// if the client is us, unlagged is on server-side, and we've got it client-side
;996:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $742
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $742
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 84
INDIRI4
NEI4 $749
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $742
LABELV $749
line 997
;997:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1000
;998:			// do nothing, because it was already predicted
;999:			//Com_Printf("Ignoring bullet event\n");
;1000:		}
ADDRGP4 $341
JUMPV
LABELV $742
line 1001
;1001:		else {
line 1003
;1002:			// do the bullet, because it wasn't predicted
;1003:			ByteToDir( es->eventParm, dir );
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
line 1004
;1004:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1006
;1005:			//Com_Printf("Non-predicted bullet\n");
;1006:		}
line 1008
;1007://unlagged - attack prediction #2
;1008:		break;
ADDRGP4 $341
JUMPV
LABELV $750
line 1011
;1009:
;1010:	case EV_BULLET_HIT_FLESH:
;1011:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $751
ADDRGP4 $754
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $751
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
NEI4 $755
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $755
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $762
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $755
LABELV $762
line 1015
;1015:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1018
;1016:			// do nothing, because it was already predicted
;1017:			//Com_Printf("Ignoring bullet event\n");
;1018:		}
ADDRGP4 $341
JUMPV
LABELV $755
line 1019
;1019:		else {
line 1021
;1020:			// do the bullet, because it wasn't predicted
;1021:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1023
;1022:			//Com_Printf("Non-predicted bullet\n");
;1023:		}
line 1025
;1024://unlagged - attack prediction #2
;1025:		break;
ADDRGP4 $341
JUMPV
LABELV $763
line 1028
;1026:
;1027:	case EV_SHOTGUN:
;1028:		DEBUGNAME("EV_SHOTGUN");
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
line 1031
;1029://unlagged - attack prediction #2
;1030:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1031:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+109684+140
INDIRI4
NEI4 $768
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154992
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $768
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $775
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $768
LABELV $775
line 1032
;1032:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1035
;1033:			// do nothing, because it was already predicted
;1034:			//Com_Printf("Ignoring shotgun event\n");
;1035:		}
ADDRGP4 $341
JUMPV
LABELV $768
line 1036
;1036:		else {
line 1038
;1037:			// do the shotgun pattern, because it wasn't predicted
;1038:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1040
;1039:			//Com_Printf("Non-predicted shotgun pattern\n");
;1040:		}
line 1042
;1041://unlagged - attack prediction #2
;1042:		break;
ADDRGP4 $341
JUMPV
LABELV $776
line 1045
;1043:
;1044:	case EV_GENERAL_SOUND:
;1045:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $777
ADDRGP4 $780
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $777
line 1046
;1046:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $781
line 1047
;1047:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1048
;1048:		} else {
ADDRGP4 $341
JUMPV
LABELV $781
line 1049
;1049:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1050
;1050:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
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
line 1051
;1051:		}
line 1052
;1052:		break;
ADDRGP4 $341
JUMPV
LABELV $785
line 1055
;1053:
;1054:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1055:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $786
ADDRGP4 $789
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $786
line 1056
;1056:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $790
line 1057
;1057:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
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
line 1058
;1058:		} else {
ADDRGP4 $341
JUMPV
LABELV $790
line 1059
;1059:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
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
line 1060
;1060:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
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
line 1061
;1061:		}
line 1062
;1062:		break;
ADDRGP4 $341
JUMPV
LABELV $796
line 1065
;1063:
;1064:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1065:		{
line 1066
;1066:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $797
ADDRGP4 $800
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $797
line 1067
;1067:			switch( es->eventParm ) {
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
LTI4 $341
ADDRLP4 96
INDIRI4
CNSTI4 13
GTI4 $341
ADDRLP4 96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $920
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $920
address $804
address $814
address $824
address $836
address $848
address $868
address $888
address $896
address $904
address $907
address $910
address $913
address $916
address $341
code
LABELV $804
line 1069
;1068:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1069:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $805
line 1070
;1070:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+153876+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $341
JUMPV
LABELV $805
line 1072
;1071:					else
;1072:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+153876+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1073
;1073:					break;
ADDRGP4 $341
JUMPV
LABELV $814
line 1075
;1074:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1075:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $815
line 1076
;1076:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+153876+960
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $341
JUMPV
LABELV $815
line 1078
;1077:					else
;1078:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+153876+964
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1079
;1079:					break;
ADDRGP4 $341
JUMPV
LABELV $824
line 1081
;1080:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1081:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $825
line 1082
;1082:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+153876+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $826
JUMPV
LABELV $825
line 1084
;1083:					else
;1084:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+153876+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $826
line 1086
;1085:					//
;1086:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+153876+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1087
;1087:					break;
ADDRGP4 $341
JUMPV
LABELV $836
line 1089
;1088:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1089:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $837
line 1090
;1090:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+153876+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $838
JUMPV
LABELV $837
line 1092
;1091:					else
;1092:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+153876+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $838
line 1094
;1093:					//
;1094:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+153876+984
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1095
;1095:					break;
ADDRGP4 $341
JUMPV
LABELV $848
line 1099
;1096:
;1097:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1098:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1099:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $853
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $849
LABELV $853
line 1100
;1100:					}
ADDRGP4 $341
JUMPV
LABELV $849
line 1101
;1101:					else {
line 1102
;1102:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $854
line 1108
;1103:#ifdef MISSIONPACK
;1104:							if (cgs.gametype == GT_1FCTF) 
;1105:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1106:							else
;1107:#endif
;1108:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+153876+996
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1109
;1109:						}
ADDRGP4 $341
JUMPV
LABELV $854
line 1110
;1110:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $341
line 1116
;1111:#ifdef MISSIONPACK
;1112:							if (cgs.gametype == GT_1FCTF)
;1113:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1114:							else
;1115:#endif
;1116: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+153876+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1117
;1117:						}
line 1118
;1118:					}
line 1119
;1119:					break;
ADDRGP4 $341
JUMPV
LABELV $868
line 1122
;1120:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1121:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1122:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
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
NEI4 $873
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
EQI4 $869
LABELV $873
line 1123
;1123:					}
ADDRGP4 $341
JUMPV
LABELV $869
line 1124
;1124:					else {
line 1125
;1125:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $874
line 1131
;1126:#ifdef MISSIONPACK
;1127:							if (cgs.gametype == GT_1FCTF)
;1128:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1129:							else
;1130:#endif
;1131:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+153876+996
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1132
;1132:						}
ADDRGP4 $341
JUMPV
LABELV $874
line 1133
;1133:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $341
line 1139
;1134:#ifdef MISSIONPACK
;1135:							if (cgs.gametype == GT_1FCTF)
;1136:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1137:							else
;1138:#endif
;1139:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+153876+1004
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1140
;1140:						}
line 1141
;1141:					}
line 1142
;1142:					break;
ADDRGP4 $341
JUMPV
LABELV $888
line 1144
;1143:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1144:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $341
line 1145
;1145:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1146
;1146:					}
line 1147
;1147:					break;
ADDRGP4 $341
JUMPV
LABELV $896
line 1149
;1148:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1149:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1732
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $341
line 1150
;1150:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+153876+1016
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1151
;1151:					}
line 1152
;1152:					break;
ADDRGP4 $341
JUMPV
LABELV $904
line 1155
;1153:
;1154:				case GTS_REDTEAM_SCORED:
;1155:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+153876+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1156
;1156:					break;
ADDRGP4 $341
JUMPV
LABELV $907
line 1158
;1157:				case GTS_BLUETEAM_SCORED:
;1158:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+153876+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1159
;1159:					break;
ADDRGP4 $341
JUMPV
LABELV $910
line 1161
;1160:				case GTS_REDTEAM_TOOK_LEAD:
;1161:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+153876+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1162
;1162:					break;
ADDRGP4 $341
JUMPV
LABELV $913
line 1164
;1163:				case GTS_BLUETEAM_TOOK_LEAD:
;1164:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+153876+952
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1165
;1165:					break;
ADDRGP4 $341
JUMPV
LABELV $916
line 1167
;1166:				case GTS_TEAMS_ARE_TIED:
;1167:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+153876+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1168
;1168:					break;
line 1171
;1169:				case GTS_KAMIKAZE:
;1170:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1171:					break;
line 1174
;1172:
;1173:				default:
;1174:					break;
line 1176
;1175:			}
;1176:			break;
ADDRGP4 $341
JUMPV
LABELV $921
line 1182
;1177:		}
;1178:
;1179:	case EV_PAIN:
;1180:		// local player sounds are triggered in CG_CheckLocalSounds,
;1181:		// so ignore events on the player
;1182:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $922
ADDRGP4 $925
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $922
line 1183
;1183:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $341
line 1184
;1184:			CG_PainEvent( cent, es->eventParm );
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
line 1185
;1185:		}
line 1186
;1186:		break;
ADDRGP4 $341
JUMPV
LABELV $929
line 1191
;1187:
;1188:	case EV_DEATH1:
;1189:	case EV_DEATH2:
;1190:	case EV_DEATH3:
;1191:		DEBUGNAME("EV_DEATHx");
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
line 1192
;1192:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $934
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
line 1194
;1193:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1194:		break;
ADDRGP4 $341
JUMPV
LABELV $935
line 1198
;1195:
;1196:
;1197:	case EV_OBITUARY:
;1198:		DEBUGNAME("EV_OBITUARY");
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
line 1199
;1199:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1200
;1200:		break;
ADDRGP4 $341
JUMPV
LABELV $940
line 1206
;1201:
;1202:	//
;1203:	// powerup events
;1204:	//
;1205:	case EV_POWERUP_QUAD:
;1206:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $941
ADDRGP4 $944
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $941
line 1207
;1207:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $945
line 1208
;1208:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+126476
CNSTI4 1
ASGNI4
line 1209
;1209:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1210
;1210:		}
LABELV $945
line 1211
;1211:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
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
line 1212
;1212:		break;
ADDRGP4 $341
JUMPV
LABELV $953
line 1214
;1213:	case EV_POWERUP_BATTLESUIT:
;1214:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $954
ADDRGP4 $957
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $954
line 1215
;1215:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $958
line 1216
;1216:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+126476
CNSTI4 2
ASGNI4
line 1217
;1217:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1218
;1218:		}
LABELV $958
line 1219
;1219:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
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
line 1220
;1220:		break;
ADDRGP4 $341
JUMPV
LABELV $966
line 1222
;1221:	case EV_POWERUP_REGEN:
;1222:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $967
ADDRGP4 $970
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $967
line 1223
;1223:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $971
line 1224
;1224:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+126476
CNSTI4 5
ASGNI4
line 1225
;1225:			cg.powerupTime = cg.time;
ADDRGP4 cg+126480
ADDRGP4 cg+109652
INDIRI4
ASGNI4
line 1226
;1226:		}
LABELV $971
line 1227
;1227:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
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
line 1228
;1228:		break;
ADDRGP4 $341
JUMPV
LABELV $979
line 1231
;1229:
;1230:	case EV_GIB_PLAYER:
;1231:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $980
ADDRGP4 $983
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $980
line 1238
;1232:		// don't play gib sound when using the kamikaze because it interferes
;1233:		// with the kamikaze sound, downside is that the gib sound will also
;1234:		// not be played when someone is gibbed while just carrying the kamikaze
;1235:		
;1236:		// We've used this bit
;1237:		//if ( !(es->eFlags & EF_KAMIKAZE) ) {
;1238:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
line 1241
;1239:		//}
;1240:		
;1241:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1242
;1242:		break;
ADDRGP4 $341
JUMPV
LABELV $986
line 1246
;1243:
;1244:	// Shafe - Trep - Headshot stuff
;1245:	case EV_GIB_PLAYER_HEADSHOT:
;1246:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
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
line 1247
;1247:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
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
;1248:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1249
;1249:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1250
;1250:		break;
ADDRGP4 $341
JUMPV
LABELV $993
line 1253
;1251:
;1252:	case EV_BODY_NOHEAD:
;1253:		DEBUGNAME("EV_BODY_NOHEAD");
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
line 1254
;1254:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTI4 1
ASGNI4
line 1255
;1255:		break;
ADDRGP4 $341
JUMPV
LABELV $998
line 1258
;1256:	// Shafe - Trep - End Headshot Stuff
;1257:	case EV_BREAK_GLASS:
;1258: 		DEBUGNAME("EV_BREAK_GLASS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $999
ADDRGP4 $1002
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $999
line 1260
;1259: 		// Change cgs.media.gibSound to whatever sound you want it to use
;1260:  		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.glassSound );
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
line 1261
;1261: 		CG_BreakGlass( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_BreakGlass
CALLV
pop
line 1262
;1262: 		break;
ADDRGP4 $341
JUMPV
LABELV $1005
line 1264
;1263:	case EV_ERROR:
;1264: 		DEBUGNAME("EV_ERROR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1006
ADDRGP4 $1009
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1006
line 1265
;1265: 		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.errorSound );
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
line 1266
;1266: 		break;
ADDRGP4 $341
JUMPV
LABELV $1012
line 1268
;1267:	case EV_STOPLOOPINGSOUND:
;1268:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1013
ADDRGP4 $1016
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1013
line 1269
;1269:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1270
;1270:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1271
;1271:		break;
ADDRGP4 $341
JUMPV
LABELV $1017
line 1274
;1272:
;1273:	case EV_DEBUG_LINE:
;1274:		DEBUGNAME("EV_DEBUG_LINE");
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
line 1275
;1275:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1276
;1276:		break;
ADDRGP4 $341
JUMPV
LABELV $340
line 1279
;1277:
;1278:	default:
;1279:		DEBUGNAME("UNKNOWN");
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
line 1280
;1280:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1026
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1281
;1281:		break;
LABELV $341
line 1284
;1282:	}
;1283:
;1284:}
LABELV $325
endproc CG_EntityEvent 112 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1293
;1285:
;1286:
;1287:/*
;1288:==============
;1289:CG_CheckEvents
;1290:
;1291:==============
;1292:*/
;1293:void CG_CheckEvents( centity_t *cent ) {
line 1295
;1294:	// check for event-only entities
;1295:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1030
line 1296
;1296:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1032
line 1297
;1297:			return;	// already fired
ADDRGP4 $1029
JUMPV
LABELV $1032
line 1300
;1298:		}
;1299:		// if this is a player event set the entity number of the client entity number
;1300:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1034
line 1301
;1301:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1302
;1302:		}
LABELV $1034
line 1304
;1303:
;1304:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTI4 1
ASGNI4
line 1306
;1305:
;1306:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1307
;1307:	} else {
ADDRGP4 $1031
JUMPV
LABELV $1030
line 1309
;1308:		// check for events riding with another entity
;1309:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $1036
line 1310
;1310:			return;
ADDRGP4 $1029
JUMPV
LABELV $1036
line 1312
;1311:		}
;1312:		cent->previousEvent = cent->currentState.event;
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
line 1313
;1313:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1038
line 1314
;1314:			return;
ADDRGP4 $1029
JUMPV
LABELV $1038
line 1316
;1315:		}
;1316:	}
LABELV $1031
line 1319
;1317:
;1318:	// calculate the position at exactly the frame time
;1319:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1320
;1320:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1322
;1321:
;1322:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1323
;1323:}
LABELV $1029
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
LABELV $1026
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
LABELV $1025
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
LABELV $1021
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
LABELV $1016
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
LABELV $1009
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
LABELV $1002
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
LABELV $997
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
LABELV $990
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
LABELV $983
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
LABELV $970
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
LABELV $957
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
LABELV $944
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
LABELV $939
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
LABELV $934
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
LABELV $933
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
LABELV $925
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
LABELV $800
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
LABELV $789
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
LABELV $780
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
LABELV $767
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
LABELV $754
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
LABELV $741
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
LABELV $726
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
LABELV $721
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
LABELV $716
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
LABELV $711
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
LABELV $706
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
LABELV $695
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
LABELV $684
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
LABELV $676
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
LABELV $669
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
LABELV $662
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
LABELV $655
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
LABELV $650
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
LABELV $645
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
LABELV $640
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
LABELV $635
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
LABELV $630
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
LABELV $625
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
LABELV $620
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
LABELV $615
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
LABELV $610
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
LABELV $605
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
LABELV $600
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
LABELV $595
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
LABELV $590
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
LABELV $585
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
LABELV $580
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
LABELV $575
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
LABELV $570
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
LABELV $563
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
LABELV $555
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
LABELV $541
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
LABELV $523
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
LABELV $518
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
LABELV $517
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
LABELV $510
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
LABELV $503
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
LABELV $496
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
LABELV $491
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
LABELV $490
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
LABELV $487
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
LABELV $482
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
LABELV $477
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
LABELV $470
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
LABELV $440
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
LABELV $427
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
LABELV $426
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
LABELV $414
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
LABELV $400
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
LABELV $389
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
LABELV $378
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
LABELV $367
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
LABELV $356
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
LABELV $346
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
LABELV $335
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
LABELV $329
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
LABELV $323
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
LABELV $322
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
LABELV $319
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
LABELV $316
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
LABELV $279
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $278
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
LABELV $268
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
LABELV $267
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
LABELV $262
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
LABELV $261
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
LABELV $260
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
LABELV $258
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
LABELV $257
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
LABELV $255
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
LABELV $254
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
