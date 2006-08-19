export UpdateTournamentInfo
code
proc UpdateTournamentInfo 1104 44
file "../g_arenas.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3://
;4:// g_arenas.c
;5://
;6:
;7:#include "g_local.h"
;8:
;9:
;10:gentity_t	*podium1;
;11:gentity_t	*podium2;
;12:gentity_t	*podium3;
;13:
;14:
;15:/*
;16:==================
;17:UpdateTournamentInfo
;18:==================
;19:*/
;20:void UpdateTournamentInfo( void ) {
line 34
;21:	int			i;
;22:	gentity_t	*player;
;23:	int			playerClientNum;
;24:	int			n, accuracy, perfect,	msglen;
;25:	int			buflen;
;26:#ifdef MISSIONPACK // bk001205
;27:  int score1, score2;
;28:	qboolean won;
;29:#endif
;30:	char		buf[32];
;31:	char		msg[MAX_STRING_CHARS];
;32:
;33:	// find the real player
;34:	player = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 35
;35:	for (i = 0; i < level.maxclients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $56
line 36
;36:		player = &g_entities[i];
ADDRLP4 40
CNSTI4 860
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 37
;37:		if ( !player->inuse ) {
ADDRLP4 40
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $61
line 38
;38:			continue;
ADDRGP4 $57
JUMPV
LABELV $61
line 40
;39:		}
;40:		if ( !( player->r.svFlags & SVF_BOT ) ) {
ADDRLP4 40
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $63
line 41
;41:			break;
ADDRGP4 $58
JUMPV
LABELV $63
line 43
;42:		}
;43:	}
LABELV $57
line 35
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $59
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $56
LABELV $58
line 45
;44:	// this should never happen!
;45:	if ( !player || i == level.maxclients ) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $68
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
NEI4 $65
LABELV $68
line 46
;46:		return;
ADDRGP4 $55
JUMPV
LABELV $65
line 48
;47:	}
;48:	playerClientNum = i;
ADDRLP4 1076
ADDRLP4 0
INDIRI4
ASGNI4
line 50
;49:
;50:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 52
;51:
;52:	if ( level.clients[playerClientNum].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 3392
ADDRLP4 1076
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
NEI4 $69
line 56
;53:#ifdef MISSIONPACK
;54:		Com_sprintf( msg, sizeof(msg), "postgame %i %i 0 0 0 0 0 0 0 0 0 0 0", level.numNonSpectatorClients, playerClientNum );
;55:#else
;56:		if (g_gametype.integer == GT_SINGLE_PLAYER || g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $75
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $70
LABELV $75
line 57
;57:		{
line 58
;58:			Com_sprintf( msg, sizeof(msg), "postgame %i %i 0 0 0 0 0 0", level.numNonSpectatorClients, playerClientNum );
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $76
ARGP4
ADDRGP4 level+80
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 59
;59:		}
line 61
;60:#endif
;61:	}
ADDRGP4 $70
JUMPV
LABELV $69
line 62
;62:	else {
line 63
;63:		if( player->client->accuracy_shots ) {
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $78
line 64
;64:			accuracy = player->client->accuracy_hits * 100 / player->client->accuracy_shots;
ADDRLP4 1088
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1080
CNSTI4 100
ADDRLP4 1088
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
MULI4
ADDRLP4 1088
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
DIVI4
ASGNI4
line 65
;65:		}
ADDRGP4 $79
JUMPV
LABELV $78
line 66
;66:		else {
line 67
;67:			accuracy = 0;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 68
;68:		}
LABELV $79
line 102
;69:#ifdef MISSIONPACK
;70:		won = qfalse;
;71:		if (g_gametype.integer >= GT_CTF) {
;72:			score1 = level.teamScores[TEAM_RED];
;73:			score2 = level.teamScores[TEAM_BLUE];
;74:			if (level.clients[playerClientNum].sess.sessionTeam	== TEAM_RED) {
;75:				won = (level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE]);
;76:			} else {
;77:				won = (level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED]);
;78:			}
;79:		} else {
;80:			if (&level.clients[playerClientNum] == &level.clients[ level.sortedClients[0] ]) {
;81:				won = qtrue;
;82:				score1 = level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE];
;83:				score2 = level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE];
;84:			} else {
;85:				score2 = level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE];
;86:				score1 = level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE];
;87:			}
;88:		}
;89:		if (won && player->client->ps.persistant[PERS_KILLED] == 0) {
;90:			perfect = 1;
;91:		} else {
;92:			perfect = 0;
;93:		}
;94:	
;95:		
;96:		Com_sprintf( msg, sizeof(msg), "postgame %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.numNonSpectatorClients, playerClientNum, accuracy,
;97:			player->client->ps.persistant[PERS_IMPRESSIVE_COUNT], player->client->ps.persistant[PERS_EXCELLENT_COUNT],player->client->ps.persistant[PERS_DEFEND_COUNT],
;98:			player->client->ps.persistant[PERS_ASSIST_COUNT], player->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], player->client->ps.persistant[PERS_SCORE],
;99:			perfect, score1, score2, level.time, player->client->ps.persistant[PERS_CAPTURES] );
;100:
;101:#else
;102:		if (g_gametype.integer == GT_SINGLE_PLAYER || g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $84
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $80
LABELV $84
line 103
;103:		{
line 104
;104:			perfect = ( level.clients[playerClientNum].ps.persistant[PERS_RANK] == 0 && player->client->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 1092
CNSTI4 0
ASGNI4
CNSTI4 3392
ADDRLP4 1076
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
ADDRLP4 1092
INDIRI4
NEI4 $86
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 1092
INDIRI4
NEI4 $86
ADDRLP4 1088
CNSTI4 1
ASGNI4
ADDRGP4 $87
JUMPV
LABELV $86
ADDRLP4 1088
CNSTI4 0
ASGNI4
LABELV $87
ADDRLP4 1084
ADDRLP4 1088
INDIRI4
ASGNI4
line 105
;105:			Com_sprintf( msg, sizeof(msg), "postgame %i %i %i %i %i %i %i %i", level.numNonSpectatorClients, playerClientNum, accuracy,
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $88
ARGP4
ADDRGP4 level+80
INDIRI4
ARGI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRLP4 1096
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1084
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 109
;106:				player->client->ps.persistant[PERS_IMPRESSIVE_COUNT], player->client->ps.persistant[PERS_EXCELLENT_COUNT],
;107:				player->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], player->client->ps.persistant[PERS_SCORE],
;108:				perfect );
;109:		}
LABELV $80
line 111
;110:#endif
;111:	}
LABELV $70
line 113
;112:
;113:	msglen = strlen( msg );
ADDRLP4 44
ARGP4
ADDRLP4 1088
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1088
INDIRI4
ASGNI4
line 114
;114:	for( i = 0; i < level.numNonSpectatorClients; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $90
line 115
;115:		n = level.sortedClients[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ASGNI4
line 116
;116:		Com_sprintf( buf, sizeof(buf), " %i %i %i", n, level.clients[n].ps.persistant[PERS_RANK], level.clients[n].ps.persistant[PERS_SCORE] );
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $96
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1096
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 117
;117:		buflen = strlen( buf );
ADDRLP4 8
ARGP4
ADDRLP4 1100
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1068
ADDRLP4 1100
INDIRI4
ASGNI4
line 118
;118:		if( msglen + buflen + 1 >= sizeof(msg) ) {
ADDRLP4 1072
INDIRI4
ADDRLP4 1068
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CVIU4 4
CNSTU4 1024
LTU4 $97
line 119
;119:			break;
ADDRGP4 $92
JUMPV
LABELV $97
line 121
;120:		}
;121:		strcat( msg, buf );
ADDRLP4 44
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 122
;122:	}
LABELV $91
line 114
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $93
ADDRLP4 0
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $90
LABELV $92
line 123
;123:	trap_SendConsoleCommand( EXEC_APPEND, msg );
CNSTI4 2
ARGI4
ADDRLP4 44
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 124
;124:}
LABELV $55
endproc UpdateTournamentInfo 1104 44
proc SpawnModelOnVictoryPad 108 16
line 127
;125:
;126:
;127:static gentity_t *SpawnModelOnVictoryPad( gentity_t *pad, vec3_t offset, gentity_t *ent, int place ) {
line 132
;128:	gentity_t	*body;
;129:	vec3_t		vec;
;130:	vec3_t		f, r, u;
;131:
;132:	body = G_Spawn();
ADDRLP4 52
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 133
;133:	if ( !body ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $100
line 134
;134:		G_Printf( S_COLOR_RED "ERROR: out of gentities\n" );
ADDRGP4 $102
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 135
;135:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $99
JUMPV
LABELV $100
line 138
;136:	}
;137:
;138:	body->classname = ent->client->pers.netname;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 139
;139:	body->client = ent->client;
ADDRLP4 56
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 140
;140:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 208
line 141
;141:	body->s.eType = ET_PLAYER;		// could be ET_INVISIBLE
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 142
;142:	body->s.eFlags = 0;				// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 143
;143:	body->s.powerups = 0;			// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 144
;144:	body->s.loopSound = 0;			// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 145
;145:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 860
DIVI4
ASGNI4
line 146
;146:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 147
;147:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 148
;148:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 149
;149:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 150
;150:	body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 151
;151:	body->s.groundEntityNum = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1022
ASGNI4
line 152
;152:	body->s.legsAnim = LEGS_IDLE;
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 22
ASGNI4
line 153
;153:	body->s.torsoAnim = TORSO_STAND;
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 11
ASGNI4
line 154
;154:	if( body->s.weapon == WP_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
NEI4 $104
line 155
;155:		body->s.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 2
ASGNI4
line 156
;156:	}
LABELV $104
line 157
;157:	if( body->s.weapon == WP_GAUNTLET) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
NEI4 $106
line 158
;158:		body->s.torsoAnim = TORSO_STAND2;
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 12
ASGNI4
line 159
;159:	}
LABELV $106
line 160
;160:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 161
;161:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 64
CNSTI4 424
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 162
;162:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 68
CNSTI4 436
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 163
;163:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 72
CNSTI4 448
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 164
;164:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 76
CNSTI4 464
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 165
;165:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 80
CNSTI4 476
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 166
;166:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 167
;167:	body->r.contents = CONTENTS_BODY;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 168
;168:	body->r.ownerNum = ent->r.ownerNum;
ADDRLP4 84
CNSTI4 512
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 169
;169:	body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 0
ASGNI4
line 171
;170:
;171:	VectorSubtract( level.intermission_origin, pad->r.currentOrigin, vec );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 level+9148
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRGP4 level+9148+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 172
;172:	vectoangles( vec, body->s.apos.trBase );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 173
;173:	body->s.apos.trBase[PITCH] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 174
;174:	body->s.apos.trBase[ROLL] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 176
;175:
;176:	AngleVectors( body->s.apos.trBase, f, r, u );
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 177
;177:	VectorMA( pad->r.currentOrigin, offset[0], f, vec );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 92
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 96
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 92
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 96
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 178
;178:	VectorMA( vec, offset[1], r, vec );
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 100
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 100
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 179
;179:	VectorMA( vec, offset[2], u, vec );
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 40+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 181
;180:
;181:	G_SetOrigin( body, vec );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 183
;182:
;183:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 185
;184:
;185:	body->count = place;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 187
;186:
;187:	return body;
ADDRLP4 0
INDIRP4
RETP4
LABELV $99
endproc SpawnModelOnVictoryPad 108 16
proc CelebrateStop 12 0
line 191
;188:}
;189:
;190:
;191:static void CelebrateStop( gentity_t *player ) {
line 194
;192:	int		anim;
;193:
;194:	if( player->s.weapon == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
NEI4 $132
line 195
;195:		anim = TORSO_STAND2;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 196
;196:	}
ADDRGP4 $133
JUMPV
LABELV $132
line 197
;197:	else {
line 198
;198:		anim = TORSO_STAND;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 199
;199:	}
LABELV $133
line 200
;200:	player->s.torsoAnim = ( ( player->s.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 8
CNSTI4 128
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
ADDRLP4 8
INDIRI4
BXORI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 201
;201:}
LABELV $131
endproc CelebrateStop 12 0
proc CelebrateStart 8 12
line 205
;202:
;203:
;204:#define	TIMER_GESTURE	(34*66+50)
;205:static void CelebrateStart( gentity_t *player ) {
line 206
;206:	player->s.torsoAnim = ( ( player->s.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | TORSO_GESTURE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ASGNP4
ADDRLP4 4
CNSTI4 128
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
BXORI4
CNSTI4 6
BORI4
ASGNI4
line 207
;207:	player->nextthink = level.time + TIMER_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2294
ADDI4
ASGNI4
line 208
;208:	player->think = CelebrateStop;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 CelebrateStop
ASGNP4
line 215
;209:
;210:	/*
;211:	player->client->ps.events[player->client->ps.eventSequence & (MAX_PS_EVENTS-1)] = EV_TAUNT;
;212:	player->client->ps.eventParms[player->client->ps.eventSequence & (MAX_PS_EVENTS-1)] = 0;
;213:	player->client->ps.eventSequence++;
;214:	*/
;215:	G_AddEvent(player, EV_TAUNT, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 72
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 216
;216:}
LABELV $134
endproc CelebrateStart 8 12
data
align 4
LABELV offsetFirst
byte 4 0
byte 4 0
byte 4 1116995584
align 4
LABELV offsetSecond
byte 4 3240099840
byte 4 1114636288
byte 4 1113063424
align 4
LABELV offsetThird
byte 4 3247964160
byte 4 3262119936
byte 4 1110704128
code
proc PodiumPlacementThink 92 16
line 223
;217:
;218:
;219:static vec3_t	offsetFirst  = {0, 0, 74};
;220:static vec3_t	offsetSecond = {-10, 60, 54};
;221:static vec3_t	offsetThird  = {-19, -60, 45};
;222:
;223:static void PodiumPlacementThink( gentity_t *podium ) {
line 228
;224:	vec3_t		vec;
;225:	vec3_t		origin;
;226:	vec3_t		f, r, u;
;227:
;228:	podium->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 230
;229:
;230:	AngleVectors( level.intermission_angle, vec, NULL, NULL );
ADDRGP4 level+9160
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 231
;231:	VectorMA( level.intermission_origin, trap_Cvar_VariableIntegerValue( "g_podiumDist" ), vec, origin );
ADDRGP4 $140
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48
ADDRGP4 level+9148
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 64
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $140
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $140
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48+8
ADDRGP4 level+9148+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 72
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 232
;232:	origin[2] -= trap_Cvar_VariableIntegerValue( "g_podiumDrop" );
ADDRGP4 $150
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
ADDRLP4 76
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 233
;233:	G_SetOrigin( podium, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 235
;234:
;235:	if( podium1 ) {
ADDRGP4 podium1
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $151
line 236
;236:		VectorSubtract( level.intermission_origin, podium->r.currentOrigin, vec );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 level+9148
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+9148+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 237
;237:		vectoangles( vec, podium1->s.apos.trBase );
ADDRLP4 0
ARGP4
ADDRGP4 podium1
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 238
;238:		podium1->s.apos.trBase[PITCH] = 0;
ADDRGP4 podium1
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 239
;239:		podium1->s.apos.trBase[ROLL] = 0;
ADDRGP4 podium1
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 241
;240:
;241:		AngleVectors( podium1->s.apos.trBase, f, r, u );
ADDRGP4 podium1
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 242
;242:		VectorMA( podium->r.currentOrigin, offsetFirst[0], f, vec );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRGP4 offsetFirst
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 offsetFirst
INDIRF4
MULF4
ADDF4
ASGNF4
line 243
;243:		VectorMA( vec, offsetFirst[1], r, vec );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 offsetFirst+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 offsetFirst+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 offsetFirst+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 244
;244:		VectorMA( vec, offsetFirst[2], u, vec );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 offsetFirst+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 offsetFirst+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 offsetFirst+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 246
;245:
;246:		G_SetOrigin( podium1, vec );
ADDRGP4 podium1
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 247
;247:	}
LABELV $151
line 249
;248:
;249:		if( podium2 ) {
ADDRGP4 podium2
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
line 250
;250:			VectorSubtract( level.intermission_origin, podium->r.currentOrigin, vec );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 level+9148
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+9148+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 251
;251:			vectoangles( vec, podium2->s.apos.trBase );
ADDRLP4 0
ARGP4
ADDRGP4 podium2
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 252
;252:			podium2->s.apos.trBase[PITCH] = 0;
ADDRGP4 podium2
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 253
;253:			podium2->s.apos.trBase[ROLL] = 0;
ADDRGP4 podium2
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 255
;254:
;255:			AngleVectors( podium2->s.apos.trBase, f, r, u );
ADDRGP4 podium2
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 256
;256:			VectorMA( podium->r.currentOrigin, offsetSecond[0], f, vec );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRGP4 offsetSecond
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 offsetSecond
INDIRF4
MULF4
ADDF4
ASGNF4
line 257
;257:			VectorMA( vec, offsetSecond[1], r, vec );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 offsetSecond+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 offsetSecond+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 offsetSecond+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 258
;258:			VectorMA( vec, offsetSecond[2], u, vec );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 offsetSecond+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 offsetSecond+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 offsetSecond+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 260
;259:
;260:			G_SetOrigin( podium2, vec );
ADDRGP4 podium2
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 261
;261:		}
LABELV $182
line 263
;262:
;263:		if( podium3 ) {
ADDRGP4 podium3
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $213
line 264
;264:			VectorSubtract( level.intermission_origin, podium->r.currentOrigin, vec );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 level+9148
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 level+9148+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 265
;265:			vectoangles( vec, podium3->s.apos.trBase );
ADDRLP4 0
ARGP4
ADDRGP4 podium3
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 266
;266:			podium3->s.apos.trBase[PITCH] = 0;
ADDRGP4 podium3
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 0
ASGNF4
line 267
;267:			podium3->s.apos.trBase[ROLL] = 0;
ADDRGP4 podium3
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 269
;268:
;269:			AngleVectors( podium3->s.apos.trBase, f, r, u );
ADDRGP4 podium3
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 270
;270:			VectorMA( podium->r.currentOrigin, offsetThird[0], f, vec );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRGP4 offsetThird
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 offsetThird
INDIRF4
MULF4
ADDF4
ASGNF4
line 271
;271:			VectorMA( vec, offsetThird[1], r, vec );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 offsetThird+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 offsetThird+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 offsetThird+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 272
;272:			VectorMA( vec, offsetThird[2], u, vec );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 offsetThird+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 offsetThird+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 offsetThird+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 274
;273:
;274:			G_SetOrigin( podium3, vec );
ADDRGP4 podium3
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 275
;275:		}
LABELV $213
line 277
;276:
;277:}
LABELV $136
endproc PodiumPlacementThink 92 16
proc SpawnPodium 68 16
line 280
;278:
;279:
;280:static gentity_t *SpawnPodium( void ) {
line 285
;281:	gentity_t	*podium;
;282:	vec3_t		vec;
;283:	vec3_t		origin;
;284:
;285:	podium = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 286
;286:	if ( !podium ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $245
line 287
;287:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $244
JUMPV
LABELV $245
line 290
;288:	}
;289:
;290:	podium->classname = "podium";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $247
ASGNP4
line 291
;291:	podium->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 292
;292:	podium->s.number = podium - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 860
DIVI4
ASGNI4
line 293
;293:	podium->clipmask = CONTENTS_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
line 294
;294:	podium->r.contents = CONTENTS_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1
ASGNI4
line 295
;295:	podium->s.modelindex = G_ModelIndex( SP_PODIUM_MODEL );
ADDRGP4 $248
ARGP4
ADDRLP4 36
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 297
;296:
;297:	AngleVectors( level.intermission_angle, vec, NULL, NULL );
ADDRGP4 level+9160
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
CNSTP4 0
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 298
;298:	VectorMA( level.intermission_origin, trap_Cvar_VariableIntegerValue( "g_podiumDist" ), vec, origin );
ADDRGP4 $140
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 level+9148
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $140
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 48
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRGP4 $140
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16+8
ADDRGP4 level+9148+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 52
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 299
;299:	origin[2] -= trap_Cvar_VariableIntegerValue( "g_podiumDrop" );
ADDRGP4 $150
ARGP4
ADDRLP4 56
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 300
;300:	G_SetOrigin( podium, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 302
;301:
;302:	VectorSubtract( level.intermission_origin, podium->r.currentOrigin, vec );
ADDRLP4 4
ADDRGP4 level+9148
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRGP4 level+9148+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRGP4 level+9148+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 303
;303:	podium->s.apos.trBase[YAW] = vectoyaw( vec );
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 64
INDIRF4
ASGNF4
line 304
;304:	trap_LinkEntity (podium);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 306
;305:
;306:	podium->think = PodiumPlacementThink;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 PodiumPlacementThink
ASGNP4
line 307
;307:	podium->nextthink = level.time + 100;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 308
;308:	return podium;
ADDRLP4 0
INDIRP4
RETP4
LABELV $244
endproc SpawnPodium 68 16
export SpawnModelsOnVictoryPads
proc SpawnModelsOnVictoryPads 24 16
line 317
;309:}
;310:
;311:
;312:/*
;313:==================
;314:SpawnModelsOnVictoryPads
;315:==================
;316:*/
;317:void SpawnModelsOnVictoryPads( void ) {
line 321
;318:	gentity_t	*player;
;319:	gentity_t	*podium;
;320:
;321:	podium1 = NULL;
ADDRGP4 podium1
CNSTP4 0
ASGNP4
line 322
;322:	podium2 = NULL;
ADDRGP4 podium2
CNSTP4 0
ASGNP4
line 323
;323:	podium3 = NULL;
ADDRGP4 podium3
CNSTP4 0
ASGNP4
line 325
;324:
;325:	podium = SpawnPodium();
ADDRLP4 8
ADDRGP4 SpawnPodium
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 327
;326:
;327:	player = SpawnModelOnVictoryPad( podium, offsetFirst, &g_entities[level.sortedClients[0]],
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetFirst
ARGP4
CNSTI4 860
ADDRGP4 level+88
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 3392
ADDRGP4 level+88
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 12
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 329
;328:				level.clients[ level.sortedClients[0] ].ps.persistant[PERS_RANK] &~ RANK_TIED_FLAG );
;329:	if ( player ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
line 330
;330:		player->nextthink = level.time + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 331
;331:		player->think = CelebrateStart;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 CelebrateStart
ASGNP4
line 332
;332:		podium1 = player;
ADDRGP4 podium1
ADDRLP4 0
INDIRP4
ASGNP4
line 333
;333:	}
LABELV $271
line 335
;334:
;335:	player = SpawnModelOnVictoryPad( podium, offsetSecond, &g_entities[level.sortedClients[1]],
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetSecond
ARGP4
CNSTI4 860
ADDRGP4 level+88+4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 3392
ADDRGP4 level+88+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 16
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 337
;336:				level.clients[ level.sortedClients[1] ].ps.persistant[PERS_RANK] &~ RANK_TIED_FLAG );
;337:	if ( player ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
line 338
;338:		podium2 = player;
ADDRGP4 podium2
ADDRLP4 0
INDIRP4
ASGNP4
line 339
;339:	}
LABELV $278
line 341
;340:
;341:	if ( level.numNonSpectatorClients > 2 )  {
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LEI4 $280
line 342
;342:		player = SpawnModelOnVictoryPad( podium, offsetThird, &g_entities[level.sortedClients[2]],
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetThird
ARGP4
CNSTI4 860
ADDRGP4 level+88+8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 3392
ADDRGP4 level+88+8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 20
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 344
;343:				level.clients[ level.sortedClients[2] ].ps.persistant[PERS_RANK] &~ RANK_TIED_FLAG );
;344:		if ( player ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $281
line 345
;345:			podium3 = player;
ADDRGP4 podium3
ADDRLP4 0
INDIRP4
ASGNP4
line 346
;346:		}
line 347
;347:	} else if ((g_gametype.integer == GT_FFA) && (level.numConnectedClients > 2)) // Spawn the 3rd person in arsenal... The 3rd person will always be a spec
ADDRGP4 $281
JUMPV
LABELV $280
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $289
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LEI4 $289
line 348
;348:	{
line 349
;349:		player = SpawnModelOnVictoryPad( podium, offsetThird, &g_entities[level.sortedClients[2]],
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 offsetThird
ARGP4
CNSTI4 860
ADDRGP4 level+88+8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 3392
ADDRGP4 level+88+8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
ARGI4
ADDRLP4 20
ADDRGP4 SpawnModelOnVictoryPad
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 351
;350:		level.clients[ level.sortedClients[2] ].ps.persistant[PERS_RANK] &~ RANK_TIED_FLAG );
;351:		if ( player ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $297
line 352
;352:		podium3 = player;
ADDRGP4 podium3
ADDRLP4 0
INDIRP4
ASGNP4
line 353
;353:		}
LABELV $297
line 354
;354:	}
LABELV $289
LABELV $281
line 356
;355:
;356:}
LABELV $268
endproc SpawnModelsOnVictoryPads 24 16
export Svcmd_AbortPodium_f
proc Svcmd_AbortPodium_f 0 0
line 364
;357:
;358:
;359:/*
;360:===============
;361:Svcmd_AbortPodium_f
;362:===============
;363:*/
;364:void Svcmd_AbortPodium_f( void ) {
line 372
;365:
;366:	/* Shafe podium
;367:	if( g_gametype.integer != GT_SINGLE_PLAYER ) {
;368:		return;
;369:	}
;370:	*/
;371:
;372:	if( podium1 ) {
ADDRGP4 podium1
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
line 373
;373:		podium1->nextthink = level.time;
ADDRGP4 podium1
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 374
;374:		podium1->think = CelebrateStop;
ADDRGP4 podium1
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 CelebrateStop
ASGNP4
line 375
;375:	}
LABELV $300
line 376
;376:}
LABELV $299
endproc Svcmd_AbortPodium_f 0 0
bss
export podium3
align 4
LABELV podium3
skip 4
export podium2
align 4
LABELV podium2
skip 4
export podium1
align 4
LABELV podium1
skip 4
import CheckPlayerPostions
import G_SendCommandToClient
import visible
import findradius
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJumps
import g_GameMode
import g_instagib
import sv_fps
import g_lightningDamage
import g_truePing
import g_unlaggedVersion
import g_delagHitscan
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_DropFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import BuildMC
import BuildGenerator
import BuildTurret
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_pdgrenade
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import G_ExplodeMissile
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $248
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $247
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $150
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $140
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $102
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $96
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $88
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $76
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 32
byte 1 48
byte 1 0
