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
CNSTI4 1716
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
EQI4 $170
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
GTI4 $196
LABELV $195
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
ADDRGP4 $142
JUMPV
LABELV $196
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $172
ADDRLP4 44
INDIRI4
CNSTI4 26
EQI4 $180
ADDRLP4 44
INDIRI4
CNSTI4 27
EQI4 $144
ADDRGP4 $142
JUMPV
LABELV $144
line 139
;137:#ifdef MISSIONPACK
;138:		case MOD_KAMIKAZE:
;139:			message = "goes out with a bang";
ADDRLP4 40
ADDRGP4 $145
ASGNP4
line 140
;140:			break;
ADDRGP4 $143
JUMPV
LABELV $146
line 143
;141:#endif
;142:		case MOD_GRENADE_SPLASH:
;143:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $147
line 144
;144:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $149
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $147
line 145
;145:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $150
line 146
;146:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $152
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $150
line 148
;147:			else
;148:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $153
ASGNP4
line 149
;149:			break;
ADDRGP4 $143
JUMPV
LABELV $154
line 151
;150:		case MOD_ROCKET_SPLASH:
;151:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $155
line 152
;152:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $157
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $155
line 153
;153:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $158
line 154
;154:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $160
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $158
line 156
;155:			else
;156:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $161
ASGNP4
line 157
;157:			break;
ADDRGP4 $143
JUMPV
LABELV $162
line 159
;158:		case MOD_PLASMA_SPLASH:
;159:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $163
line 160
;160:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $165
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $163
line 161
;161:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $166
line 162
;162:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $168
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $166
line 164
;163:			else
;164:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $169
ASGNP4
line 165
;165:			break;
ADDRGP4 $143
JUMPV
LABELV $170
line 167
;166:		case MOD_BFG_SPLASH:
;167:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $171
ASGNP4
line 168
;168:			break;
ADDRGP4 $143
JUMPV
LABELV $172
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
NEI4 $173
line 172
;172:			{
line 173
;173:				message = "got her head blown off by";
ADDRLP4 40
ADDRGP4 $175
ASGNP4
line 174
;174:			}
ADDRGP4 $143
JUMPV
LABELV $173
line 176
;175:			else
;176:			{
line 177
;177:				if(gender==GENDER_NEUTER)
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $176
line 178
;178:					message = "got its head blown off by";
ADDRLP4 40
ADDRGP4 $178
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $176
line 180
;179:				else
;180:					message = "got his head blown off by";
ADDRLP4 40
ADDRGP4 $179
ASGNP4
line 181
;181:			}
line 182
;182:			break;											
ADDRGP4 $143
JUMPV
LABELV $180
line 185
;183:#ifdef MISSIONPACK
;184:		case MOD_PROXIMITY_MINE:
;185:			if( gender == GENDER_FEMALE ) {
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $181
line 186
;186:				message = "found her prox mine";
ADDRLP4 40
ADDRGP4 $183
ASGNP4
line 187
;187:			} else if ( gender == GENDER_NEUTER ) {
ADDRGP4 $143
JUMPV
LABELV $181
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $184
line 188
;188:				message = "found it's prox mine";
ADDRLP4 40
ADDRGP4 $186
ASGNP4
line 189
;189:			} else {
ADDRGP4 $143
JUMPV
LABELV $184
line 190
;190:				message = "found his prox mine";
ADDRLP4 40
ADDRGP4 $187
ASGNP4
line 191
;191:			}
line 192
;192:			break;
ADDRGP4 $143
JUMPV
LABELV $142
line 195
;193:#endif
;194:		default:
;195:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $188
line 196
;196:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $190
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $188
line 197
;197:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $191
line 198
;198:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $193
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $191
line 200
;199:			else
;200:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $194
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
EQU4 $197
line 206
;206:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $199
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
LABELV $197
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
NEI4 $200
line 214
;212:		char	*s;
;213:
;214:		if(mod != MOD_HEADSHOT) // Shafe - Trep - only for headshots
ADDRLP4 44
INDIRI4
CNSTI4 23
EQI4 $203
line 215
;215:		{						
line 216
;216:			if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $205
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
ADDRGP4 $208
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
ADDRGP4 $204
JUMPV
LABELV $205
line 221
;221:				s = va("You fragged %s", targetName );
ADDRGP4 $211
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
ADDRGP4 $204
JUMPV
LABELV $203
line 225
;224:		else										// Shafe - Trep Else for headshot
;225:		{
line 227
;226:
;227:			if ( cgs.gametype < GT_TEAM ) 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $212
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
ADDRGP4 $215
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
ADDRGP4 $213
JUMPV
LABELV $212
line 233
;233:				s = va("Headshot!\n\nYou fragged %s", targetName );
ADDRGP4 $218
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
LABELV $213
line 237
;235:			
;236:	
;237:		}
LABELV $204
line 239
;238:#ifdef MISSIONPACK
;239:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRGP4 cg_singlePlayerActive+12
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $223
ADDRGP4 cg_cameraOrbit+12
INDIRI4
ADDRLP4 124
INDIRI4
NEI4 $219
LABELV $223
line 240
;240:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
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
line 241
;241:		} 
LABELV $219
line 247
;242:#else
;243:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;244:#endif
;245:
;246:		// print the text message as well
;247:	}
LABELV $200
line 250
;248:
;249:	// check for double client messages
;250:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $224
line 251
;251:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 252
;252:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $226
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 253
;253:	} else {
ADDRGP4 $225
JUMPV
LABELV $224
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
NEI4 $227
line 258
;258:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+114344
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
LABELV $227
line 260
;260:	}
LABELV $225
line 262
;261:
;262:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $232
line 263
;263:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $234
ADDRLP4 44
INDIRI4
CNSTI4 30
GTI4 $234
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $288-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $288
address $242
address $238
address $240
address $244
address $247
address $250
address $253
address $255
address $258
address $261
address $263
address $265
address $265
address $234
address $234
address $234
address $234
address $281
address $234
address $234
address $234
address $234
address $234
address $268
address $270
address $273
address $276
address $279
address $236
address $284
code
LABELV $236
line 265
;264:		case MOD_GRAPPLE:
;265:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $237
ASGNP4
line 266
;266:			break;
ADDRGP4 $235
JUMPV
LABELV $238
line 268
;267:		case MOD_GAUNTLET:
;268:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $239
ASGNP4
line 269
;269:			break;
ADDRGP4 $235
JUMPV
LABELV $240
line 271
;270:		case MOD_MACHINEGUN:
;271:			message = "was assaulted by";
ADDRLP4 40
ADDRGP4 $241
ASGNP4
line 272
;272:			break;
ADDRGP4 $235
JUMPV
LABELV $242
line 274
;273:		case MOD_SHOTGUN:
;274:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $243
ASGNP4
line 275
;275:			break;
ADDRGP4 $235
JUMPV
LABELV $244
line 277
;276:		case MOD_GRENADE:
;277:			message = "ate";
ADDRLP4 40
ADDRGP4 $245
ASGNP4
line 278
;278:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $246
ASGNP4
line 279
;279:			break;
ADDRGP4 $235
JUMPV
LABELV $247
line 281
;280:		case MOD_GRENADE_SPLASH:
;281:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $248
ASGNP4
line 282
;282:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $249
ASGNP4
line 283
;283:			break;
ADDRGP4 $235
JUMPV
LABELV $250
line 285
;284:		case MOD_ROCKET:
;285:			message = "was crushed by";
ADDRLP4 40
ADDRGP4 $251
ASGNP4
line 286
;286:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 287
;287:			break;
ADDRGP4 $235
JUMPV
LABELV $253
line 289
;288:		case MOD_ROCKET_SPLASH:
;289:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $254
ASGNP4
line 290
;290:			message2 = "'s singularity";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 291
;291:			break;
ADDRGP4 $235
JUMPV
LABELV $255
line 293
;292:		case MOD_PLASMA:
;293:			message = "was sliced to shreds by";
ADDRLP4 40
ADDRGP4 $256
ASGNP4
line 294
;294:			message2 = "'s gata gun";
ADDRLP4 88
ADDRGP4 $257
ASGNP4
line 295
;295:			break;
ADDRGP4 $235
JUMPV
LABELV $258
line 297
;296:		case MOD_PLASMA_SPLASH:
;297:			message = "was shreded by";
ADDRLP4 40
ADDRGP4 $259
ASGNP4
line 298
;298:			message2 = "'s gata fun";
ADDRLP4 88
ADDRGP4 $260
ASGNP4
line 299
;299:			break;
ADDRGP4 $235
JUMPV
LABELV $261
line 301
;300:		case MOD_RAILGUN:
;301:			message = "was degaussed by"; // Shafe - Trep - Reworded
ADDRLP4 40
ADDRGP4 $262
ASGNP4
line 302
;302:			break;
ADDRGP4 $235
JUMPV
LABELV $263
line 304
;303:		case MOD_LIGHTNING:
;304:			message = "was burnt by";
ADDRLP4 40
ADDRGP4 $264
ASGNP4
line 305
;305:			break;
ADDRGP4 $235
JUMPV
LABELV $265
line 308
;306:		case MOD_BFG:
;307:		case MOD_BFG_SPLASH:
;308:			message = "was annialated by";
ADDRLP4 40
ADDRGP4 $266
ASGNP4
line 309
;309:			message2 = "'s Devastator";
ADDRLP4 88
ADDRGP4 $267
ASGNP4
line 310
;310:			break;
ADDRGP4 $235
JUMPV
LABELV $268
line 313
;311:#ifdef MISSIONPACK
;312:		case MOD_NAIL:
;313:			message = "was nailed by";
ADDRLP4 40
ADDRGP4 $269
ASGNP4
line 314
;314:			break;
ADDRGP4 $235
JUMPV
LABELV $270
line 316
;315:		case MOD_CHAINGUN:
;316:			message = "got lead poisoning from";
ADDRLP4 40
ADDRGP4 $271
ASGNP4
line 317
;317:			message2 = "'s Chaingun";
ADDRLP4 88
ADDRGP4 $272
ASGNP4
line 318
;318:			break;
ADDRGP4 $235
JUMPV
LABELV $273
line 320
;319:		case MOD_PROXIMITY_MINE:
;320:			message = "was too close to";
ADDRLP4 40
ADDRGP4 $274
ASGNP4
line 321
;321:			message2 = "'s Prox Mine";
ADDRLP4 88
ADDRGP4 $275
ASGNP4
line 322
;322:			break;
ADDRGP4 $235
JUMPV
LABELV $276
line 324
;323:		case MOD_KAMIKAZE:
;324:			message = "falls to";
ADDRLP4 40
ADDRGP4 $277
ASGNP4
line 325
;325:			message2 = "'s Kamikaze blast";
ADDRLP4 88
ADDRGP4 $278
ASGNP4
line 326
;326:			break;
ADDRGP4 $235
JUMPV
LABELV $279
line 328
;327:		case MOD_JUICED:
;328:			message = "was juiced by";
ADDRLP4 40
ADDRGP4 $280
ASGNP4
line 329
;329:			break;
ADDRGP4 $235
JUMPV
LABELV $281
line 332
;330:#endif
;331:		case MOD_TELEFRAG:
;332:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $282
ASGNP4
line 333
;333:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $283
ASGNP4
line 334
;334:			break;
ADDRGP4 $235
JUMPV
LABELV $284
line 336
;335:		case MOD_ALTFLAMER:		// Shafe - Trep - Flame Thrower Alt
;336:			message = "was toasted by";
ADDRLP4 40
ADDRGP4 $285
ASGNP4
line 337
;337:			message2 = "'s flame thrower";
ADDRLP4 88
ADDRGP4 $286
ASGNP4
line 338
;338:			break;
ADDRGP4 $235
JUMPV
LABELV $234
line 340
;339:		default:
;340:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $287
ASGNP4
line 341
;341:			break;
LABELV $235
line 344
;342:		}
;343:
;344:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $290
line 345
;345:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $292
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
line 347
;346:				targetName, message, attackerName, message2);
;347:			return;
ADDRGP4 $107
JUMPV
LABELV $290
line 349
;348:		}
;349:	}
LABELV $232
line 352
;350:
;351:	// we don't know what it was
;352:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $293
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 353
;353:}
LABELV $107
endproc CG_Obituary 136 20
proc CG_UseItem 32 16
line 362
;354:
;355://==========================================================================
;356:
;357:/*
;358:===============
;359:CG_UseItem
;360:===============
;361:*/
;362:static void CG_UseItem( centity_t *cent ) {
line 368
;363:	clientInfo_t *ci;
;364:	int			itemNum, clientNum;
;365:	gitem_t		*item;
;366:	entityState_t *es;
;367:
;368:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 370
;369:	
;370:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
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
line 371
;371:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $297
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $295
LABELV $297
line 372
;372:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 373
;373:	}
LABELV $295
line 376
;374:
;375:	// print a message if the local player
;376:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $298
line 377
;377:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $301
line 378
;378:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $303
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 379
;379:		} else {
ADDRGP4 $302
JUMPV
LABELV $301
line 380
;380:			item = BG_FindItemForHoldable( itemNum );
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
line 381
;381:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $304
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
line 382
;382:		}
LABELV $302
line 383
;383:	}
LABELV $298
line 385
;384:
;385:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $305
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $305
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $323
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $323
address $307
address $306
address $311
address $306
address $306
address $320
code
LABELV $305
LABELV $307
line 388
;386:	default:
;387:	case HI_NONE:
;388:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152852+652
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 389
;389:		break;
ADDRGP4 $306
JUMPV
line 392
;390:
;391:	case HI_TELEPORTER:
;392:		break;
LABELV $311
line 395
;393:
;394:	case HI_MEDKIT:
;395:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 396
;396:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $312
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $312
line 397
;397:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1716
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 398
;398:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 399
;399:		}
LABELV $312
line 400
;400:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152852+1064
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 401
;401:		break;
ADDRGP4 $306
JUMPV
line 405
;402:
;403:#ifdef MISSIONPACK
;404:	case HI_KAMIKAZE:
;405:		break;
line 407
;406:	case HI_PORTAL:
;407:		break;
LABELV $320
line 409
;408:	case HI_INVULNERABILITY:
;409:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152852+852
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 410
;410:		break;
LABELV $306
line 414
;411:#endif
;412:	}
;413:
;414:}
LABELV $294
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 423
;415:
;416:/*
;417:================
;418:CG_ItemPickup
;419:
;420:A new item was picked up this frame
;421:================
;422:*/
;423:static void CG_ItemPickup( int itemNum ) {
line 424
;424:	cg.itemPickup = itemNum;
ADDRGP4 cg+124676
ADDRFP4 0
INDIRI4
ASGNI4
line 425
;425:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+124680
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 426
;426:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+124684
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 428
;427:	// see if it should be the grabbed weapon
;428:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $330
line 430
;429:		// select it immediately
;430:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $333
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $333
line 431
;431:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+124688
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 432
;432:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108948
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 433
;433:		}
LABELV $333
line 434
;434:	}
LABELV $330
line 436
;435:
;436:}
LABELV $324
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 446
;437:
;438:
;439:/*
;440:================
;441:CG_PainEvent
;442:
;443:Also called by playerstate transition
;444:================
;445:*/
;446:void CG_PainEvent( centity_t *cent, int health ) {
line 450
;447:	char	*snd;
;448:
;449:	// don't do more than two pain sounds a second
;450:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $342
line 451
;451:		return;
ADDRGP4 $341
JUMPV
LABELV $342
line 454
;452:	}
;453:
;454:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $345
line 455
;455:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $347
ASGNP4
line 456
;456:	} else if ( health < 50 ) {
ADDRGP4 $346
JUMPV
LABELV $345
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $348
line 457
;457:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $350
ASGNP4
line 458
;458:	} else if ( health < 75 ) {
ADDRGP4 $349
JUMPV
LABELV $348
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $351
line 459
;459:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $353
ASGNP4
line 460
;460:	} else {
ADDRGP4 $352
JUMPV
LABELV $351
line 461
;461:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $354
ASGNP4
line 462
;462:	}
LABELV $352
LABELV $349
LABELV $346
line 463
;463:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
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
line 467
;464:		CG_CustomSound( cent->currentState.number, snd ) );
;465:
;466:	// save pain time for programitic twitch animation
;467:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 468
;468:	cent->pe.painDirection ^= 1;
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
line 469
;469:}
LABELV $341
endproc CG_PainEvent 12 16
lit
align 4
LABELV $502
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 120 48
line 482
;470:
;471:
;472:
;473:/*
;474:==============
;475:CG_EntityEvent
;476:
;477:An entity has an event value
;478:also called by CG_CheckPlayerstateEvents
;479:==============
;480:*/
;481:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;482:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 491
;483:	entityState_t	*es;
;484:	int				event;
;485:	vec3_t			dir;
;486:	const char		*s;
;487:	int				clientNum;
;488:	clientInfo_t	*ci;
;489:
;490:	
;491:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 492
;492:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 494
;493:
;494:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $357
line 495
;495:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $360
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
line 496
;496:	}
LABELV $357
line 498
;497:
;498:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $361
line 499
;499:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $356
ADDRGP4 $366
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 500
;500:		return;
ADDRGP4 $356
JUMPV
LABELV $361
line 503
;501:	}
;502:
;503:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 504
;504:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $369
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $367
LABELV $369
line 505
;505:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 506
;506:	}
LABELV $367
line 507
;507:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1716
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 509
;508:
;509:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $371
ADDRLP4 8
INDIRI4
CNSTI4 86
GTI4 $371
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1171-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1171
address $373
address $383
address $394
address $405
address $416
address $467
address $467
address $467
address $467
address $427
address $441
address $453
address $497
address $509
address $559
address $566
address $573
address $580
address $586
address $621
address $635
address $643
address $650
address $655
address $660
address $665
address $670
address $675
address $680
address $685
address $690
address $695
address $700
address $705
address $710
address $715
address $720
address $725
address $730
address $371
address $756
address $749
address $735
address $742
address $764
address $775
address $912
address $921
address $932
address $886
address $873
address $843
address $848
address $853
address $858
address $899
address $371
address $1077
address $1085
address $1085
address $1085
address $1091
address $1096
address $1109
address $1122
address $1135
address $1144
address $1151
address $838
address $786
address $801
address $808
address $813
address $818
address $823
address $828
address $833
address $1161
address $1156
address $514
address $523
address $529
address $535
address $541
address $547
address $553
code
LABELV $373
line 514
;510:	//
;511:	// movement generated events
;512:	//
;513:	case EV_FOOTSTEP:
;514:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $374
ADDRGP4 $377
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $374
line 515
;515:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $372
line 516
;516:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+152852+660
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 518
;517:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;518:		}
line 519
;519:		break;
ADDRGP4 $372
JUMPV
LABELV $383
line 521
;520:	case EV_FOOTSTEP_METAL:
;521:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $384
ADDRGP4 $387
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $384
line 522
;522:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $372
line 523
;523:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+152852+660+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 525
;524:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;525:		}
line 526
;526:		break;
ADDRGP4 $372
JUMPV
LABELV $394
line 528
;527:	case EV_FOOTSPLASH:
;528:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $395
ADDRGP4 $398
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $395
line 529
;529:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $372
line 530
;530:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+152852+660+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 532
;531:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;532:		}
line 533
;533:		break;
ADDRGP4 $372
JUMPV
LABELV $405
line 535
;534:	case EV_FOOTWADE:
;535:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $406
ADDRGP4 $409
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $406
line 536
;536:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $372
line 537
;537:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+152852+660+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 539
;538:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;539:		}
line 540
;540:		break;
ADDRGP4 $372
JUMPV
LABELV $416
line 542
;541:	case EV_SWIM:
;542:		DEBUGNAME("EV_SWIM");
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
line 543
;543:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $372
line 544
;544:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
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
ADDRGP4 cgs+152852+660+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 546
;545:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;546:		}
line 547
;547:		break;
ADDRGP4 $372
JUMPV
LABELV $427
line 551
;548:
;549:
;550:	case EV_FALL_SHORT:
;551:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $428
ADDRGP4 $431
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $428
line 552
;552:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+936
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 553
;553:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $372
line 555
;554:			// smooth landing z changes
;555:			cg.landChange = -8;
ADDRGP4 cg+108940
CNSTF4 3238002688
ASGNF4
line 556
;556:			cg.landTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 557
;557:		}
line 558
;558:		break;
ADDRGP4 $372
JUMPV
LABELV $441
line 560
;559:	case EV_FALL_MEDIUM:
;560:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $442
ADDRGP4 $445
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $442
line 562
;561:		// use normal pain sound
;562:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $354
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
line 563
;563:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $372
line 565
;564:			// smooth landing z changes
;565:			cg.landChange = -16;
ADDRGP4 cg+108940
CNSTF4 3246391296
ASGNF4
line 566
;566:			cg.landTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 567
;567:		}
line 568
;568:		break;
ADDRGP4 $372
JUMPV
LABELV $453
line 570
;569:	case EV_FALL_FAR:
;570:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $454
ADDRGP4 $457
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $454
line 571
;571:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $458
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
line 572
;572:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 573
;573:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $372
line 575
;574:			// smooth landing z changes
;575:			cg.landChange = -24;
ADDRGP4 cg+108940
CNSTF4 3250585600
ASGNF4
line 576
;576:			cg.landTime = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 577
;577:		}
line 578
;578:		break;
ADDRGP4 $372
JUMPV
LABELV $467
line 584
;579:
;580:	case EV_STEP_4:
;581:	case EV_STEP_8:
;582:	case EV_STEP_12:
;583:	case EV_STEP_16:		// smooth out step up transitions
;584:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $468
ADDRGP4 $471
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $468
line 585
;585:	{
line 590
;586:		float	oldStep;
;587:		int		delta;
;588:		int		step;
;589:
;590:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $472
line 591
;591:			break;
ADDRGP4 $372
JUMPV
LABELV $472
line 594
;592:		}
;593:		// if we are interpolating, we don't need to smooth steps
;594:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $484
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $484
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $484
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $476
LABELV $484
line 595
;595:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 596
;596:			break;
ADDRGP4 $372
JUMPV
LABELV $476
line 599
;597:		}
;598:		// check for stepping up before a previous step is completed
;599:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108928
INDIRI4
SUBI4
ASGNI4
line 600
;600:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $487
line 601
;601:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
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
line 602
;602:		} else {
ADDRGP4 $488
JUMPV
LABELV $487
line 603
;603:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 604
;604:		}
LABELV $488
line 607
;605:
;606:		// add this amount
;607:		step = 4 * (event - EV_STEP_4 + 1 );
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
line 608
;608:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108924
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 609
;609:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108924
INDIRF4
CNSTF4 1107296256
LEF4 $491
line 610
;610:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108924
CNSTF4 1107296256
ASGNF4
line 611
;611:		}
LABELV $491
line 612
;612:		cg.stepTime = cg.time;
ADDRGP4 cg+108928
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 613
;613:		break;
ADDRGP4 $372
JUMPV
LABELV $497
line 617
;614:	}
;615:
;616:	case EV_JUMP_PAD:
;617:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $498
ADDRGP4 $501
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $498
line 619
;618://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;619:		{
line 621
;620:			localEntity_t	*smoke;
;621:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $502
INDIRB
ASGNB 12
line 624
;622:
;623:
;624:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
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
ADDRGP4 cgs+152852+308
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
line 631
;625:						  32, 
;626:						  1, 1, 1, 0.33f,
;627:						  1000, 
;628:						  cg.time, 0,
;629:						  LEF_PUFF_DONT_SCALE, 
;630:						  cgs.media.smokePuffShader );
;631:		}
line 634
;632:
;633:		// boing sound at origin, jump sound on player
;634:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+152852+944
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 635
;635:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $508
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
line 636
;636:		break;
ADDRGP4 $372
JUMPV
LABELV $509
line 639
;637:
;638:	case EV_JUMP:
;639:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $510
ADDRGP4 $513
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $510
line 640
;640:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $508
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
line 641
;641:		break;
ADDRGP4 $372
JUMPV
LABELV $514
line 643
;642:	case EV_TAUNT:
;643:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $515
ADDRGP4 $518
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $515
line 644
;644:		if (ci->efmodel == qfalse) 
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $519
line 645
;645:		{
line 647
;646:			//CG_CenterPrint( "QUAKE 3 MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;647:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $521
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
line 648
;648:		}
ADDRGP4 $372
JUMPV
LABELV $519
line 650
;649:		else
;650:		{
line 652
;651:			//CG_CenterPrint( "Elite Force MODEL TAUNT", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );// Shafe - Debug
;652:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, va("*taunt%d.wav", irandom(1, ci->numTaunts) ) ) );
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 1712
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRGP4 $522
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
line 653
;653:		}
line 654
;654:		break;
ADDRGP4 $372
JUMPV
LABELV $523
line 657
;655:#ifdef MISSIONPACK
;656:	case EV_TAUNT_YES:
;657:		DEBUGNAME("EV_TAUNT_YES");
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
line 658
;658:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $528
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 659
;659:		break;
ADDRGP4 $372
JUMPV
LABELV $529
line 661
;660:	case EV_TAUNT_NO:
;661:		DEBUGNAME("EV_TAUNT_NO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $530
ADDRGP4 $533
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $530
line 662
;662:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $534
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 663
;663:		break;
ADDRGP4 $372
JUMPV
LABELV $535
line 665
;664:	case EV_TAUNT_FOLLOWME:
;665:		DEBUGNAME("EV_TAUNT_FOLLOWME");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $536
ADDRGP4 $539
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $536
line 666
;666:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $540
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 667
;667:		break;
ADDRGP4 $372
JUMPV
LABELV $541
line 669
;668:	case EV_TAUNT_GETFLAG:
;669:		DEBUGNAME("EV_TAUNT_GETFLAG");
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
line 670
;670:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $546
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 671
;671:		break;
ADDRGP4 $372
JUMPV
LABELV $547
line 673
;672:	case EV_TAUNT_GUARDBASE:
;673:		DEBUGNAME("EV_TAUNT_GUARDBASE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $548
ADDRGP4 $551
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $548
line 674
;674:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $552
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 675
;675:		break;
ADDRGP4 $372
JUMPV
LABELV $553
line 677
;676:	case EV_TAUNT_PATROL:
;677:		DEBUGNAME("EV_TAUNT_PATROL");
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
line 678
;678:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 53
ARGI4
ADDRGP4 $558
ARGP4
ADDRGP4 CG_VoiceChatLocal
CALLV
pop
line 679
;679:		break;
ADDRGP4 $372
JUMPV
LABELV $559
line 682
;680:#endif
;681:	case EV_WATER_TOUCH:
;682:		DEBUGNAME("EV_WATER_TOUCH");
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
line 683
;683:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1048
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 684
;684:		break;
ADDRGP4 $372
JUMPV
LABELV $566
line 686
;685:	case EV_WATER_LEAVE:
;686:		DEBUGNAME("EV_WATER_LEAVE");
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
line 687
;687:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1052
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 688
;688:		break;
ADDRGP4 $372
JUMPV
LABELV $573
line 690
;689:	case EV_WATER_UNDER:
;690:		DEBUGNAME("EV_WATER_UNDER");
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
line 691
;691:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1056
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 692
;692:		break;
ADDRGP4 $372
JUMPV
LABELV $580
line 694
;693:	case EV_WATER_CLEAR:
;694:		DEBUGNAME("EV_WATER_CLEAR");
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
line 695
;695:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $585
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
line 696
;696:		break;
ADDRGP4 $372
JUMPV
LABELV $586
line 699
;697:
;698:	case EV_ITEM_PICKUP:
;699:		DEBUGNAME("EV_ITEM_PICKUP");
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
line 700
;700:		{
line 704
;701:			gitem_t	*item;
;702:			int		index;
;703:
;704:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 706
;705:
;706:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $593
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $591
LABELV $593
line 707
;707:				break;
ADDRGP4 $372
JUMPV
LABELV $591
line 709
;708:			}
;709:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 713
;710:
;711:			// powerups and team items will have a separate global sound, this one
;712:			// will be played at prediction time
;713:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
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
EQI4 $596
ADDRLP4 72
INDIRI4
CNSTI4 8
NEI4 $594
LABELV $596
line 714
;714:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1264
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 715
;715:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $595
JUMPV
LABELV $594
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $599
line 717
;716:#ifdef MISSIONPACK
;717:				switch (item->giTag ) {
ADDRLP4 76
ADDRLP4 64
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $600
ADDRLP4 76
INDIRI4
CNSTI4 13
GTI4 $600
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $616-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $616
address $604
address $607
address $610
address $613
code
LABELV $604
line 719
;718:					case PW_SCOUT:
;719:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1240
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 720
;720:					break;
ADDRGP4 $600
JUMPV
LABELV $607
line 722
;721:					case PW_GUARD:
;722:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1236
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 723
;723:					break;
ADDRGP4 $600
JUMPV
LABELV $610
line 725
;724:					case PW_DOUBLER:
;725:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1232
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 726
;726:					break;
ADDRGP4 $600
JUMPV
LABELV $613
line 728
;727:					case PW_AMMOREGEN:
;728:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1228
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 729
;729:					break;
line 732
;730:				}
;731:#endif
;732:			} else {
ADDRGP4 $600
JUMPV
LABELV $599
line 733
;733:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 734
;734:			}
LABELV $600
LABELV $595
line 737
;735:
;736:			// show icon and name on status bar
;737:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $372
line 738
;738:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 739
;739:			}
line 740
;740:		}
line 741
;741:		break;
ADDRGP4 $372
JUMPV
LABELV $621
line 744
;742:
;743:	case EV_GLOBAL_ITEM_PICKUP:
;744:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
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
line 745
;745:		{
line 749
;746:			gitem_t	*item;
;747:			int		index;
;748:
;749:			index = es->eventParm;		// player predicted
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 751
;750:
;751:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 68
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $628
ADDRLP4 68
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $626
LABELV $628
line 752
;752:				break;
ADDRGP4 $372
JUMPV
LABELV $626
line 754
;753:			}
;754:			item = &bg_itemlist[ index ];
ADDRLP4 64
CNSTI4 52
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 756
;755:			// powerup pickups are global
;756:			if( item->pickup_sound ) {
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $629
line 757
;757:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
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
line 758
;758:			}
LABELV $629
line 761
;759:
;760:			// show icon and name on status bar
;761:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $372
line 762
;762:				CG_ItemPickup( index );
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 763
;763:			}
line 764
;764:		}
line 765
;765:		break;
ADDRGP4 $372
JUMPV
LABELV $635
line 771
;766:
;767:	//
;768:	// weapon events
;769:	//
;770:	case EV_NOAMMO:
;771:		DEBUGNAME("EV_NOAMMO");
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
line 773
;772://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;773:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $372
line 774
;774:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 775
;775:		}
line 776
;776:		break;
ADDRGP4 $372
JUMPV
LABELV $643
line 778
;777:	case EV_CHANGE_WEAPON:
;778:		DEBUGNAME("EV_CHANGE_WEAPON");
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
line 779
;779:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+648
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 780
;780:		break;
ADDRGP4 $372
JUMPV
LABELV $650
line 782
;781:	case EV_FIRE_WEAPON:
;782:		DEBUGNAME("EV_FIRE_WEAPON");
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
line 783
;783:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 784
;784:		break;
ADDRGP4 $372
JUMPV
LABELV $655
line 787
;785:
;786:	case EV_FIRE_WEAPON2: 
;787:		 DEBUGNAME("EV_FIRE_WEAPON2"); // Shafe - Trep Alt Fire
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
line 788
;788:		 CG_FireWeapon2( cent ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon2
CALLV
pop
line 789
;789:		 break;
ADDRGP4 $372
JUMPV
LABELV $660
line 792
;790:
;791:	case EV_USE_ITEM0:
;792:		DEBUGNAME("EV_USE_ITEM0");
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
line 793
;793:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 794
;794:		break;
ADDRGP4 $372
JUMPV
LABELV $665
line 796
;795:	case EV_USE_ITEM1:
;796:		DEBUGNAME("EV_USE_ITEM1");
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
ADDRGP4 $372
JUMPV
LABELV $670
line 800
;799:	case EV_USE_ITEM2:
;800:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $671
ADDRGP4 $674
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $671
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
ADDRGP4 $372
JUMPV
LABELV $675
line 804
;803:	case EV_USE_ITEM3:
;804:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $676
ADDRGP4 $679
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $676
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
ADDRGP4 $372
JUMPV
LABELV $680
line 808
;807:	case EV_USE_ITEM4:
;808:		DEBUGNAME("EV_USE_ITEM4");
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
ADDRGP4 $372
JUMPV
LABELV $685
line 812
;811:	case EV_USE_ITEM5:
;812:		DEBUGNAME("EV_USE_ITEM5");
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
ADDRGP4 $372
JUMPV
LABELV $690
line 816
;815:	case EV_USE_ITEM6:
;816:		DEBUGNAME("EV_USE_ITEM6");
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
ADDRGP4 $372
JUMPV
LABELV $695
line 820
;819:	case EV_USE_ITEM7:
;820:		DEBUGNAME("EV_USE_ITEM7");
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
ADDRGP4 $372
JUMPV
LABELV $700
line 824
;823:	case EV_USE_ITEM8:
;824:		DEBUGNAME("EV_USE_ITEM8");
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
ADDRGP4 $372
JUMPV
LABELV $705
line 828
;827:	case EV_USE_ITEM9:
;828:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $706
ADDRGP4 $709
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $706
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
ADDRGP4 $372
JUMPV
LABELV $710
line 832
;831:	case EV_USE_ITEM10:
;832:		DEBUGNAME("EV_USE_ITEM10");
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
ADDRGP4 $372
JUMPV
LABELV $715
line 836
;835:	case EV_USE_ITEM11:
;836:		DEBUGNAME("EV_USE_ITEM11");
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
ADDRGP4 $372
JUMPV
LABELV $720
line 840
;839:	case EV_USE_ITEM12:
;840:		DEBUGNAME("EV_USE_ITEM12");
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
ADDRGP4 $372
JUMPV
LABELV $725
line 844
;843:	case EV_USE_ITEM13:
;844:		DEBUGNAME("EV_USE_ITEM13");
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
ADDRGP4 $372
JUMPV
LABELV $730
line 848
;847:	case EV_USE_ITEM14:
;848:		DEBUGNAME("EV_USE_ITEM14");
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
ADDRGP4 $372
JUMPV
LABELV $735
line 858
;851:
;852:	//=================================================================
;853:
;854:	//
;855:	// other events
;856:	//
;857:	case EV_PLAYER_TELEPORT_IN:
;858:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $736
ADDRGP4 $739
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $736
line 859
;859:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+916
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 860
;860:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 861
;861:		break;
ADDRGP4 $372
JUMPV
LABELV $742
line 864
;862:
;863:	case EV_PLAYER_TELEPORT_OUT:
;864:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $743
ADDRGP4 $746
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $743
line 865
;865:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+920
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 866
;866:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 867
;867:		break;
ADDRGP4 $372
JUMPV
LABELV $749
line 870
;868:
;869:	case EV_ITEM_POP:
;870:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $750
ADDRGP4 $753
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $750
line 871
;871:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+928
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 872
;872:		break;
ADDRGP4 $372
JUMPV
LABELV $756
line 874
;873:	case EV_ITEM_RESPAWN:
;874:		DEBUGNAME("EV_ITEM_RESPAWN");
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
line 875
;875:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 876
;876:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+928
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 877
;877:		break;
ADDRGP4 $372
JUMPV
LABELV $764
line 880
;878:
;879:	case EV_GRENADE_BOUNCE:
;880:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $765
ADDRGP4 $768
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $765
line 881
;881:		if ( rand() & 1 ) {
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $769
line 882
;882:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1268
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 883
;883:		} else {
ADDRGP4 $372
JUMPV
LABELV $769
line 884
;884:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1272
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 885
;885:		}
line 886
;886:		break;
ADDRGP4 $372
JUMPV
LABELV $775
line 889
;887:
;888:	case EV_PL_BOUNCE:
;889:		DEBUGNAME("EV_PL_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $776
ADDRGP4 $779
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $776
line 890
;890:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $780
line 891
;891:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1308
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 892
;892:		} else {
ADDRGP4 $372
JUMPV
LABELV $780
line 893
;893:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hplb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1312
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 894
;894:		}
line 895
;895:		break;
ADDRGP4 $372
JUMPV
LABELV $786
line 899
;896:
;897:#ifdef MISSIONPACK
;898:	case EV_PROXIMITY_MINE_STICK:
;899:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $787
ADDRGP4 $790
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $787
line 900
;900:		if( es->eventParm & SURF_FLESH ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $791
line 901
;901:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1276
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 902
;902:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
ADDRGP4 $372
JUMPV
LABELV $791
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $795
line 903
;903:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1280
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 904
;904:		} else {
ADDRGP4 $372
JUMPV
LABELV $795
line 905
;905:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1284
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 906
;906:		}
line 907
;907:		break;
ADDRGP4 $372
JUMPV
LABELV $801
line 910
;908:
;909:	case EV_PROXIMITY_MINE_TRIGGER:
;910:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $802
ADDRGP4 $805
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $802
line 911
;911:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152852+1288
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 912
;912:		break;
ADDRGP4 $372
JUMPV
LABELV $808
line 914
;913:	case EV_KAMIKAZE:
;914:		DEBUGNAME("EV_KAMIKAZE");
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
line 915
;915:		CG_KamikazeEffect( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_KamikazeEffect
CALLV
pop
line 916
;916:		break;
ADDRGP4 $372
JUMPV
LABELV $813
line 918
;917:	case EV_OBELISKEXPLODE:
;918:		DEBUGNAME("EV_OBELISKEXPLODE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $814
ADDRGP4 $817
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $814
line 919
;919:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ObeliskExplode
CALLV
pop
line 920
;920:		break;
ADDRGP4 $372
JUMPV
LABELV $818
line 922
;921:	case EV_OBELISKPAIN:
;922:		DEBUGNAME("EV_OBELISKPAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $819
ADDRGP4 $822
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $819
line 923
;923:		CG_ObeliskPain( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_ObeliskPain
CALLV
pop
line 924
;924:		break;
ADDRGP4 $372
JUMPV
LABELV $823
line 926
;925:	case EV_INVUL_IMPACT:
;926:		DEBUGNAME("EV_INVUL_IMPACT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $824
ADDRGP4 $827
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $824
line 927
;927:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 CG_InvulnerabilityImpact
CALLV
pop
line 928
;928:		break;
ADDRGP4 $372
JUMPV
LABELV $828
line 930
;929:	case EV_JUICED:
;930:		DEBUGNAME("EV_JUICED");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $829
ADDRGP4 $832
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $829
line 931
;931:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_InvulnerabilityJuiced
CALLV
pop
line 932
;932:		break;
ADDRGP4 $372
JUMPV
LABELV $833
line 934
;933:	case EV_LIGHTNINGBOLT:
;934:		DEBUGNAME("EV_LIGHTNINGBOLT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $834
ADDRGP4 $837
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $834
line 935
;935:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
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
ADDRGP4 CG_LightningBoltBeam
CALLV
pop
line 936
;936:		break;
ADDRGP4 $372
JUMPV
LABELV $838
line 939
;937:#endif
;938:	case EV_SCOREPLUM:
;939:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $839
ADDRGP4 $842
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $839
line 940
;940:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 941
;941:		break;
ADDRGP4 $372
JUMPV
LABELV $843
line 947
;942:
;943:	//
;944:	// missile impacts
;945:	//
;946:	case EV_MISSILE_HIT:
;947:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $844
ADDRGP4 $847
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $844
line 948
;948:		ByteToDir( es->eventParm, dir );
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
line 949
;949:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
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
line 950
;950:		break;
ADDRGP4 $372
JUMPV
LABELV $848
line 953
;951:
;952:	case EV_MISSILE_MISS:
;953:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $849
ADDRGP4 $852
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $849
line 954
;954:		ByteToDir( es->eventParm, dir );
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
line 955
;955:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 956
;956:		break;
ADDRGP4 $372
JUMPV
LABELV $853
line 959
;957:
;958:	case EV_MISSILE_MISS_METAL:
;959:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $854
ADDRGP4 $857
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $854
line 960
;960:		ByteToDir( es->eventParm, dir );
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
line 961
;961:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL );
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
line 962
;962:		break;
ADDRGP4 $372
JUMPV
LABELV $858
line 965
;963:
;964:	case EV_RAILTRAIL:
;965:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $859
ADDRGP4 $862
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $859
line 966
;966:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
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
NEI4 $863
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154168
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $863
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $870
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $863
LABELV $870
line 970
;970:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 16) ) {
line 973
;971:			// do nothing, because it was already predicted
;972:			//Com_Printf("Ignoring rail trail event\n");
;973:		}
ADDRGP4 $372
JUMPV
LABELV $863
line 974
;974:		else {
line 976
;975:			// draw a rail trail, because it wasn't predicted
;976:			CG_RailTrail( ci, es->origin2, es->pos.trBase );
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
line 979
;977:
;978:			// if the end was on a nomark surface, don't make an explosion
;979:			if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $372
line 980
;980:				ByteToDir( es->eventParm, dir );
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
line 981
;981:				CG_MissileHitWall( es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
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
line 982
;982:			}
line 984
;983:			//Com_Printf("Non-predicted rail trail\n");
;984:		}
line 986
;985://unlagged - attack prediction #2
;986:		break;
ADDRGP4 $372
JUMPV
LABELV $873
line 989
;987:
;988:	case EV_BULLET_HIT_WALL:
;989:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $874
ADDRGP4 $877
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $874
line 992
;990://unlagged - attack prediction #2
;991:		// if the client is us, unlagged is on server-side, and we've got it client-side
;992:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $878
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154168
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $878
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $885
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 92
INDIRI4
EQI4 $878
LABELV $885
line 993
;993:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 996
;994:			// do nothing, because it was already predicted
;995:			//Com_Printf("Ignoring bullet event\n");
;996:		}
ADDRGP4 $372
JUMPV
LABELV $878
line 997
;997:		else {
line 999
;998:			// do the bullet, because it wasn't predicted
;999:			ByteToDir( es->eventParm, dir );
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
line 1000
;1000:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
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
line 1002
;1001:			//Com_Printf("Non-predicted bullet\n");
;1002:		}
line 1004
;1003://unlagged - attack prediction #2
;1004:		break;
ADDRGP4 $372
JUMPV
LABELV $886
line 1007
;1005:
;1006:	case EV_BULLET_HIT_FLESH:
;1007:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $887
ADDRGP4 $890
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $887
line 1010
;1008://unlagged - attack prediction #2
;1009:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1010:		if ( es->clientNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $891
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154168
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $891
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 96
INDIRI4
NEI4 $898
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 96
INDIRI4
EQI4 $891
LABELV $898
line 1011
;1011:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 2) ) {
line 1014
;1012:			// do nothing, because it was already predicted
;1013:			//Com_Printf("Ignoring bullet event\n");
;1014:		}
ADDRGP4 $372
JUMPV
LABELV $891
line 1015
;1015:		else {
line 1017
;1016:			// do the bullet, because it wasn't predicted
;1017:			CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
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
line 1019
;1018:			//Com_Printf("Non-predicted bullet\n");
;1019:		}
line 1021
;1020://unlagged - attack prediction #2
;1021:		break;
ADDRGP4 $372
JUMPV
LABELV $899
line 1024
;1022:
;1023:	case EV_SHOTGUN:
;1024:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $900
ADDRGP4 $903
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $900
line 1027
;1025://unlagged - attack prediction #2
;1026:		// if the client is us, unlagged is on server-side, and we've got it client-side
;1027:		if ( es->otherEntityNum == cg.predictedPlayerState.clientNum && 
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $904
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 cgs+154168
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $904
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 100
INDIRI4
NEI4 $911
ADDRGP4 cg_delag+12
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 100
INDIRI4
EQI4 $904
LABELV $911
line 1028
;1028:				cgs.delagHitscan && (cg_delag.integer & 1 || cg_delag.integer & 4) ) {
line 1031
;1029:			// do nothing, because it was already predicted
;1030:			//Com_Printf("Ignoring shotgun event\n");
;1031:		}
ADDRGP4 $372
JUMPV
LABELV $904
line 1032
;1032:		else {
line 1034
;1033:			// do the shotgun pattern, because it wasn't predicted
;1034:			CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 1036
;1035:			//Com_Printf("Non-predicted shotgun pattern\n");
;1036:		}
line 1038
;1037://unlagged - attack prediction #2
;1038:		break;
ADDRGP4 $372
JUMPV
LABELV $912
line 1041
;1039:
;1040:	case EV_GENERAL_SOUND:
;1041:		DEBUGNAME("EV_GENERAL_SOUND");
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
line 1042
;1042:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $917
line 1043
;1043:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 1044
;1044:		} else {
ADDRGP4 $372
JUMPV
LABELV $917
line 1045
;1045:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 104
INDIRP4
ASGNP4
line 1046
;1046:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 108
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
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1047
;1047:		}
line 1048
;1048:		break;
ADDRGP4 $372
JUMPV
LABELV $921
line 1051
;1049:
;1050:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;1051:		DEBUGNAME("EV_GLOBAL_SOUND");
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
line 1052
;1052:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $926
line 1053
;1053:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 104
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 104
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
line 1054
;1054:		} else {
ADDRGP4 $372
JUMPV
LABELV $926
line 1055
;1055:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 104
INDIRP4
ASGNP4
line 1056
;1056:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 108
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
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1057
;1057:		}
line 1058
;1058:		break;
ADDRGP4 $372
JUMPV
LABELV $932
line 1061
;1059:
;1060:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;1061:		{
line 1062
;1062:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $933
ADDRGP4 $936
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $933
line 1063
;1063:			switch( es->eventParm ) {
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
LTI4 $372
ADDRLP4 104
INDIRI4
CNSTI4 13
GTI4 $372
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1076
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1076
address $940
address $950
address $960
address $972
address $984
address $1014
address $1044
address $1052
address $1060
address $1063
address $1066
address $1069
address $1072
address $372
code
LABELV $940
line 1065
;1064:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1065:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $941
line 1066
;1066:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152852+1096
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $941
line 1068
;1067:					else
;1068:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152852+1100
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1069
;1069:					break;
ADDRGP4 $372
JUMPV
LABELV $950
line 1071
;1070:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1071:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $951
line 1072
;1072:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152852+1096
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $951
line 1074
;1073:					else
;1074:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152852+1100
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1075
;1075:					break;
ADDRGP4 $372
JUMPV
LABELV $960
line 1077
;1076:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;1077:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $961
line 1078
;1078:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152852+1104
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $962
JUMPV
LABELV $961
line 1080
;1079:					else
;1080:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152852+1108
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $962
line 1082
;1081:					//
;1082:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+152852+1124
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1083
;1083:					break;
ADDRGP4 $372
JUMPV
LABELV $972
line 1085
;1084:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;1085:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $973
line 1086
;1086:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152852+1104
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $974
JUMPV
LABELV $973
line 1088
;1087:					else
;1088:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152852+1108
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $974
line 1090
;1089:					//
;1090:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+152852+1120
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1091
;1091:					break;
ADDRGP4 $372
JUMPV
LABELV $984
line 1095
;1092:
;1093:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1094:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1095:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
NEI4 $989
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $985
LABELV $989
line 1096
;1096:					}
ADDRGP4 $372
JUMPV
LABELV $985
line 1097
;1097:					else {
line 1098
;1098:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $990
line 1100
;1099:#ifdef MISSIONPACK
;1100:							if (cgs.gametype == GT_1FCTF) 
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $995
line 1101
;1101:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
ADDRGP4 cgs+152852+1144
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $995
line 1104
;1102:							else
;1103:#endif
;1104:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152852+1132
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1105
;1105:						}
ADDRGP4 $372
JUMPV
LABELV $990
line 1106
;1106:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $372
line 1108
;1107:#ifdef MISSIONPACK
;1108:							if (cgs.gametype == GT_1FCTF)
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $1007
line 1109
;1109:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
ADDRGP4 cgs+152852+1136
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $1007
line 1112
;1110:							else
;1111:#endif
;1112: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152852+1140
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
ADDRGP4 $372
JUMPV
LABELV $1014
line 1118
;1116:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1117:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1118:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
NEI4 $1019
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $1015
LABELV $1019
line 1119
;1119:					}
ADDRGP4 $372
JUMPV
LABELV $1015
line 1120
;1120:					else {
line 1121
;1121:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1020
line 1123
;1122:#ifdef MISSIONPACK
;1123:							if (cgs.gametype == GT_1FCTF)
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $1025
line 1124
;1124:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
ADDRGP4 cgs+152852+1144
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $1025
line 1127
;1125:							else
;1126:#endif
;1127:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152852+1132
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1128
;1128:						}
ADDRGP4 $372
JUMPV
LABELV $1020
line 1129
;1129:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $372
line 1131
;1130:#ifdef MISSIONPACK
;1131:							if (cgs.gametype == GT_1FCTF)
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $1037
line 1132
;1132:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
ADDRGP4 cgs+152852+1136
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $372
JUMPV
LABELV $1037
line 1135
;1133:							else
;1134:#endif
;1135:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152852+1140
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1136
;1136:						}
line 1137
;1137:					}
line 1138
;1138:					break;
ADDRGP4 $372
JUMPV
LABELV $1044
line 1140
;1139:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1140:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $372
line 1141
;1141:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152852+1152
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1142
;1142:					}
line 1143
;1143:					break;
ADDRGP4 $372
JUMPV
LABELV $1052
line 1145
;1144:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1145:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1716
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $372
line 1146
;1146:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152852+1152
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1147
;1147:					}
line 1148
;1148:					break;
ADDRGP4 $372
JUMPV
LABELV $1060
line 1151
;1149:
;1150:				case GTS_REDTEAM_SCORED:
;1151:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+152852+1076
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1152
;1152:					break;
ADDRGP4 $372
JUMPV
LABELV $1063
line 1154
;1153:				case GTS_BLUETEAM_SCORED:
;1154:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+152852+1080
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1155
;1155:					break;
ADDRGP4 $372
JUMPV
LABELV $1066
line 1157
;1156:				case GTS_REDTEAM_TOOK_LEAD:
;1157:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+152852+1084
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1158
;1158:					break;
ADDRGP4 $372
JUMPV
LABELV $1069
line 1160
;1159:				case GTS_BLUETEAM_TOOK_LEAD:
;1160:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+152852+1088
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1161
;1161:					break;
ADDRGP4 $372
JUMPV
LABELV $1072
line 1163
;1162:				case GTS_TEAMS_ARE_TIED:
;1163:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+152852+1092
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1164
;1164:					break;
line 1167
;1165:				case GTS_KAMIKAZE:
;1166:					//trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1167:					break;
line 1170
;1168:
;1169:				default:
;1170:					break;
line 1172
;1171:			}
;1172:			break;
ADDRGP4 $372
JUMPV
LABELV $1077
line 1178
;1173:		}
;1174:
;1175:	case EV_PAIN:
;1176:		// local player sounds are triggered in CG_CheckLocalSounds,
;1177:		// so ignore events on the player
;1178:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1078
ADDRGP4 $1081
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1078
line 1179
;1179:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $372
line 1180
;1180:			CG_PainEvent( cent, es->eventParm );
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
line 1181
;1181:		}
line 1182
;1182:		break;
ADDRGP4 $372
JUMPV
LABELV $1085
line 1187
;1183:
;1184:	case EV_DEATH1:
;1185:	case EV_DEATH2:
;1186:	case EV_DEATH3:
;1187:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1086
ADDRGP4 $1089
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1086
line 1188
;1188:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $1090
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 59
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
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
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1190
;1189:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1190:		break;
ADDRGP4 $372
JUMPV
LABELV $1091
line 1194
;1191:
;1192:
;1193:	case EV_OBITUARY:
;1194:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1092
ADDRGP4 $1095
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1092
line 1195
;1195:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1196
;1196:		break;
ADDRGP4 $372
JUMPV
LABELV $1096
line 1202
;1197:
;1198:	//
;1199:	// powerup events
;1200:	//
;1201:	case EV_POWERUP_QUAD:
;1202:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1097
ADDRGP4 $1100
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1097
line 1203
;1203:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1101
line 1204
;1204:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+124420
CNSTI4 1
ASGNI4
line 1205
;1205:			cg.powerupTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1206
;1206:		}
LABELV $1101
line 1207
;1207:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152852+640
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1208
;1208:		break;
ADDRGP4 $372
JUMPV
LABELV $1109
line 1210
;1209:	case EV_POWERUP_BATTLESUIT:
;1210:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1110
ADDRGP4 $1113
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1110
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
NEI4 $1114
line 1212
;1212:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+124420
CNSTI4 2
ASGNI4
line 1213
;1213:			cg.powerupTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1214
;1214:		}
LABELV $1114
line 1215
;1215:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152852+1260
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1216
;1216:		break;
ADDRGP4 $372
JUMPV
LABELV $1122
line 1218
;1217:	case EV_POWERUP_REGEN:
;1218:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1123
ADDRGP4 $1126
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1123
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
NEI4 $1127
line 1220
;1220:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+124420
CNSTI4 5
ASGNI4
line 1221
;1221:			cg.powerupTime = cg.time;
ADDRGP4 cg+124424
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1222
;1222:		}
LABELV $1127
line 1223
;1223:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152852+1256
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1224
;1224:		break;
ADDRGP4 $372
JUMPV
LABELV $1135
line 1227
;1225:
;1226:	case EV_GIB_PLAYER:
;1227:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1136
ADDRGP4 $1139
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1136
line 1231
;1228:		// don't play gib sound when using the kamikaze because it interferes
;1229:		// with the kamikaze sound, downside is that the gib sound will also
;1230:		// not be played when someone is gibbed while just carrying the kamikaze
;1231:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $1140
line 1232
;1232:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152852+900
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1233
;1233:		}
LABELV $1140
line 1234
;1234:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1235
;1235:		break;
ADDRGP4 $372
JUMPV
LABELV $1144
line 1239
;1236:
;1237:	// Shafe - Trep - Headshot stuff
;1238:	case EV_GIB_PLAYER_HEADSHOT:
;1239:		DEBUGNAME("EV_GIB_PLAYER_HEADSHOT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1145
ADDRGP4 $1148
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1145
line 1240
;1240:		trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152852+900
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1241
;1241:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 1
ASGNI4
line 1242
;1242:		CG_GibPlayerHeadshot( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ARGP4
ADDRGP4 CG_GibPlayerHeadshot
CALLV
pop
line 1243
;1243:		break;
ADDRGP4 $372
JUMPV
LABELV $1151
line 1246
;1244:
;1245:	case EV_BODY_NOHEAD:
;1246:		DEBUGNAME("EV_BODY_NOHEAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1152
ADDRGP4 $1155
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1152
line 1247
;1247:		cent->pe.noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 1
ASGNI4
line 1248
;1248:		break;
ADDRGP4 $372
JUMPV
LABELV $1156
line 1252
;1249:	// Shafe - Trep - End Headshot Stuff
;1250:
;1251:	case EV_STOPLOOPINGSOUND:
;1252:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1157
ADDRGP4 $1160
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1157
line 1253
;1253:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1254
;1254:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1255
;1255:		break;
ADDRGP4 $372
JUMPV
LABELV $1161
line 1258
;1256:
;1257:	case EV_DEBUG_LINE:
;1258:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1162
ADDRGP4 $1165
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1162
line 1259
;1259:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1260
;1260:		break;
ADDRGP4 $372
JUMPV
LABELV $371
line 1263
;1261:
;1262:	default:
;1263:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $1166
ADDRGP4 $1169
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $1166
line 1264
;1264:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $1170
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1265
;1265:		break;
LABELV $372
line 1268
;1266:	}
;1267:
;1268:}
LABELV $356
endproc CG_EntityEvent 120 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1277
;1269:
;1270:
;1271:/*
;1272:==============
;1273:CG_CheckEvents
;1274:
;1275:==============
;1276:*/
;1277:void CG_CheckEvents( centity_t *cent ) {
line 1279
;1278:	// check for event-only entities
;1279:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 14
LEI4 $1174
line 1280
;1280:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1176
line 1281
;1281:			return;	// already fired
ADDRGP4 $1173
JUMPV
LABELV $1176
line 1284
;1282:		}
;1283:		// if this is a player event set the entity number of the client entity number
;1284:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1178
line 1285
;1285:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1286
;1286:		}
LABELV $1178
line 1288
;1287:
;1288:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1290
;1289:
;1290:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1291
;1291:	} else {
ADDRGP4 $1175
JUMPV
LABELV $1174
line 1293
;1292:		// check for events riding with another entity
;1293:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $1180
line 1294
;1294:			return;
ADDRGP4 $1173
JUMPV
LABELV $1180
line 1296
;1295:		}
;1296:		cent->previousEvent = cent->currentState.event;
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
line 1297
;1297:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $1182
line 1298
;1298:			return;
ADDRGP4 $1173
JUMPV
LABELV $1182
line 1300
;1299:		}
;1300:	}
LABELV $1175
line 1303
;1301:
;1302:	// calculate the position at exactly the frame time
;1303:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1304
;1304:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1306
;1305:
;1306:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1307
;1307:}
LABELV $1173
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
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
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
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
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
LABELV $1170
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
LABELV $1169
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
LABELV $1165
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
LABELV $1160
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
LABELV $1155
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
LABELV $1148
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
LABELV $1139
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
LABELV $1126
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
LABELV $1113
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
LABELV $1100
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
LABELV $1095
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
LABELV $1090
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
LABELV $1089
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
LABELV $1081
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
LABELV $936
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
LABELV $925
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
LABELV $916
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
LABELV $903
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
LABELV $890
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
LABELV $877
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
LABELV $862
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
LABELV $857
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
LABELV $852
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
LABELV $847
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
LABELV $842
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
LABELV $837
byte 1 69
byte 1 86
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 66
byte 1 79
byte 1 76
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $832
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 73
byte 1 67
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $827
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 85
byte 1 76
byte 1 95
byte 1 73
byte 1 77
byte 1 80
byte 1 65
byte 1 67
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $822
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 69
byte 1 76
byte 1 73
byte 1 83
byte 1 75
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $817
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 69
byte 1 76
byte 1 73
byte 1 83
byte 1 75
byte 1 69
byte 1 88
byte 1 80
byte 1 76
byte 1 79
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $812
byte 1 69
byte 1 86
byte 1 95
byte 1 75
byte 1 65
byte 1 77
byte 1 73
byte 1 75
byte 1 65
byte 1 90
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $805
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 82
byte 1 79
byte 1 88
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 89
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $790
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 82
byte 1 79
byte 1 88
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 89
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 73
byte 1 67
byte 1 75
byte 1 10
byte 1 0
align 1
LABELV $779
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
LABELV $768
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
LABELV $760
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
LABELV $753
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
LABELV $746
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
LABELV $739
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
LABELV $734
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
LABELV $729
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
LABELV $724
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
LABELV $719
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
LABELV $714
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
LABELV $709
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
LABELV $704
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
LABELV $699
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
LABELV $694
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
LABELV $689
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
LABELV $684
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
LABELV $679
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
LABELV $674
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
LABELV $669
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
LABELV $664
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
LABELV $659
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
LABELV $654
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
LABELV $647
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
LABELV $639
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
LABELV $625
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
LABELV $590
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
LABELV $585
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
LABELV $584
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
LABELV $577
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
LABELV $570
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
LABELV $563
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
LABELV $558
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $557
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 84
byte 1 82
byte 1 79
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $552
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $551
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 71
byte 1 85
byte 1 65
byte 1 82
byte 1 68
byte 1 66
byte 1 65
byte 1 83
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $546
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $545
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 84
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $540
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $539
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 70
byte 1 79
byte 1 76
byte 1 76
byte 1 79
byte 1 87
byte 1 77
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $534
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $533
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 78
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $528
byte 1 121
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $527
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 89
byte 1 69
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $522
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
LABELV $521
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
LABELV $518
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
LABELV $513
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
LABELV $508
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
LABELV $501
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
LABELV $471
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
LABELV $458
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
LABELV $457
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
LABELV $445
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
LABELV $431
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
LABELV $420
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
LABELV $409
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
LABELV $398
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
LABELV $387
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
LABELV $377
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
LABELV $366
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
LABELV $360
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
LABELV $354
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
LABELV $353
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
LABELV $350
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
LABELV $347
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
LABELV $304
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $303
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
LABELV $293
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
LABELV $292
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
LABELV $287
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
LABELV $286
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
LABELV $285
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
LABELV $283
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
LABELV $282
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
LABELV $280
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 106
byte 1 117
byte 1 105
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $278
byte 1 39
byte 1 115
byte 1 32
byte 1 75
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $277
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $275
byte 1 39
byte 1 115
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $274
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $272
byte 1 39
byte 1 115
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $271
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 115
byte 1 111
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $269
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 110
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
LABELV $267
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
LABELV $266
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
LABELV $264
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
LABELV $262
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
LABELV $260
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
LABELV $259
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
LABELV $257
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
LABELV $256
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
LABELV $254
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
LABELV $252
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
LABELV $251
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
LABELV $249
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
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $245
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $243
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
LABELV $241
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
LABELV $239
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
LABELV $237
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
LABELV $226
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $218
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
LABELV $215
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
LABELV $211
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
LABELV $208
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
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $194
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
LABELV $193
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
LABELV $190
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
LABELV $187
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $186
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $183
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 120
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
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
LABELV $145
byte 1 103
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 103
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
