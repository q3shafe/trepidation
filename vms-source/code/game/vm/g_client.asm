data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../g_client.c"
line 17
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:#include "g_local.h"
;4:
;5:// g_client.c -- client functions that don't happen every frame
;6:
;7:static vec3_t	playerMins = {-15, -15, -24};
;8:static vec3_t	playerMaxs = {15, 15, 32};
;9:
;10:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;11:potential spawning position for deathmatch games.
;12:The first time a player enters the game, they will be at an 'initial' spot.
;13:Targets will be fired when someone spawns in on them.
;14:"nobots" will prevent bots from using this spot.
;15:"nohumans" will prevent non-bots from using this spot.
;16:*/
;17:void SP_info_player_deathmatch( gentity_t *ent ) {
line 20
;18:	int		i;
;19:
;20:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $56
ARGP4
ADDRGP4 $57
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 21
;21:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $58
line 22
;22:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 23
;23:	}
LABELV $58
line 24
;24:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $60
ARGP4
ADDRGP4 $57
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 25
;25:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $61
line 26
;26:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 27
;27:	}
LABELV $61
line 28
;28:}
LABELV $55
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 33
;29:
;30:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;31:equivelant to info_player_deathmatch
;32:*/
;33:void SP_info_player_start(gentity_t *ent) {
line 34
;34:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $64
ASGNP4
line 35
;35:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 36
;36:}
LABELV $63
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 41
;37:
;38:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;39:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;40:*/
;41:void SP_info_player_intermission( gentity_t *ent ) {
line 43
;42:
;43:}
LABELV $65
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 61
;44:
;45:
;46:
;47:/*
;48:=======================================================================
;49:
;50:  SelectSpawnPoint
;51:
;52:=======================================================================
;53:*/
;54:
;55:/*
;56:================
;57:SpotWouldTelefrag
;58:
;59:================
;60:*/
;61:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 67
;62:	int			i, num;
;63:	int			touch[MAX_GENTITIES];
;64:	gentity_t	*hit;
;65:	vec3_t		mins, maxs;
;66:
;67:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 68
;68:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 69
;69:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 71
;70:
;71:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $78
JUMPV
LABELV $75
line 72
;72:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 924
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 74
;73:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;74:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $79
line 75
;75:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $66
JUMPV
LABELV $79
line 78
;76:		}
;77:
;78:	}
LABELV $76
line 71
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $78
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $75
line 80
;79:
;80:	return qfalse;
CNSTI4 0
RETI4
LABELV $66
endproc SpotWouldTelefrag 4144 16
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 12
line 91
;81:}
;82:
;83:/*
;84:================
;85:SelectNearestDeathmatchSpawnPoint
;86:
;87:Find the spot that we DON'T want to use
;88:================
;89:*/
;90:#define	MAX_SPAWN_POINTS	128
;91:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 97
;92:	gentity_t	*spot;
;93:	vec3_t		delta;
;94:	float		dist, nearestDist;
;95:	gentity_t	*nearestSpot;
;96:
;97:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 98
;98:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 99
;99:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $83
JUMPV
LABELV $82
line 101
;100:
;101:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 103
;102:
;103:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 104
;104:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 105
;105:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $87
line 106
;106:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 107
;107:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 108
;108:		}
LABELV $87
line 109
;109:	}
LABELV $83
line 101
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $64
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $82
line 111
;110:
;111:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $81
endproc SelectNearestDeathmatchSpawnPoint 40 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 123
;112:}
;113:
;114:
;115:/*
;116:================
;117:SelectRandomDeathmatchSpawnPoint
;118:
;119:go to a random point that doesn't telefrag
;120:================
;121:*/
;122:#define	MAX_SPAWN_POINTS	128
;123:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 129
;124:	gentity_t	*spot;
;125:	int			count;
;126:	int			selection;
;127:	gentity_t	*spots[MAX_SPAWN_POINTS];
;128:
;129:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 130
;130:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $91
JUMPV
LABELV $90
line 132
;131:
;132:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 133
;133:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $93
line 134
;134:			continue;
ADDRGP4 $91
JUMPV
LABELV $93
line 136
;135:		}
;136:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 137
;137:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 138
;138:	}
LABELV $91
line 132
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $64
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $90
line 140
;139:
;140:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $95
line 141
;141:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $64
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $89
JUMPV
LABELV $95
line 144
;142:	}
;143:
;144:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 145
;145:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $89
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 572 12
line 157
;146:}
;147:
;148:/*
;149:===========
;150:SelectRandomFurthestSpawnPoint
;151:
;152:Chooses a player start, deathmatch start, etc
;153:============
;154:*/
;155:extern gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ); // Bad Bad
;156:
;157:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 165
;158:	gentity_t	*spot;
;159:	vec3_t		delta;
;160:	float		dist;
;161:	float		list_dist[64];
;162:	gentity_t	*list_spot[64];
;163:	int			numSpots, rnd, i, j;
;164:
;165:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 166
;166:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $99
JUMPV
LABELV $98
line 168
;167:
;168:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 169
;169:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $101
line 170
;170:			continue;
ADDRGP4 $99
JUMPV
LABELV $101
line 172
;171:		}
;172:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 173
;173:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 174
;174:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 175
;175:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $109
line 176
;176:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $111
line 177
;177:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $111
line 178
;178:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $113
line 179
;179:					list_dist[j] = list_dist[j-1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 180
;180:					list_spot[j] = list_spot[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 181
;181:				}
LABELV $114
line 178
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $116
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $113
line 182
;182:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 183
;183:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 184
;184:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 185
;185:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $107
line 186
;186:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 187
;187:				break;
ADDRGP4 $107
JUMPV
LABELV $109
line 189
;188:			}
;189:		}
LABELV $106
line 174
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $108
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $105
LABELV $107
line 190
;190:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $121
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $121
line 191
;191:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 192
;192:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 193
;193:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 194
;194:		}
LABELV $121
line 195
;195:	}
LABELV $99
line 168
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $64
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $98
line 196
;196:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $123
line 197
;197:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $64
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 198
;198:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 199
;199:		{
line 203
;200:			//G_Error( "Couldn't find a spawn point" );  // This is a workaround for skarekrows maps
;201:			//G_Printf("Unable To Locate Spawnpoint using CTF Spawns as fallback.\n");
;202:			//Com_Printf( "Unable To Locate Spawnpoint using CTF Spawns as fallback.");
;203:			spot = SelectRandomTeamSpawnPoint ( TEAM_BEGIN, irandom(1,2) );			   // This is bad bad bad
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 556
ADDRGP4 irandom
CALLI4
ASGNI4
CNSTI4 0
ARGI4
ADDRLP4 556
INDIRI4
ARGI4
ADDRLP4 560
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 560
INDIRP4
ASGNP4
line 205
;204:
;205:		}
LABELV $125
line 207
;206:
;207:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 208
;208:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 209
;209:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 210
;210:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $97
JUMPV
LABELV $123
line 214
;211:	}
;212:
;213:	// select a random spot from the spawn points furthest away
;214:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 216
;215:
;216:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 217
;217:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 218
;218:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 220
;219:
;220:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $97
endproc SelectRandomFurthestSpawnPoint 572 12
export SelectSpawnPoint
proc SelectSpawnPoint 4 12
line 230
;221:}
;222:
;223:/*
;224:===========
;225:SelectSpawnPoint
;226:
;227:Chooses a player start, deathmatch start, etc
;228:============
;229:*/
;230:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 231
;231:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 270
;232:
;233:	/*
;234:	gentity_t	*spot;
;235:	gentity_t	*nearestSpot;
;236:
;237:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;238:
;239:	spot = SelectRandomDeathmatchSpawnPoint ( );
;240:	if ( spot == nearestSpot ) {
;241:		// roll again if it would be real close to point of death
;242:		spot = SelectRandomDeathmatchSpawnPoint ( );
;243:		if ( spot == nearestSpot ) {
;244:			// last try
;245:			spot = SelectRandomDeathmatchSpawnPoint ( );
;246:		}		
;247:	}
;248:
;249:	// find a single player start spot
;250:	if (!spot) {
;251:		G_Error( "Couldn't find a spawn point" );
;252:	}
;253:
;254:	VectorCopy (spot->s.origin, origin);
;255:	origin[2] += 9;
;256:	VectorCopy (spot->s.angles, angles);
;257:
;258:	return spot;
;259:	*/
;260:}
;261:
;262:/*
;263:===========
;264:SelectInitialSpawnPoint
;265:
;266:Try to find a spawn point marked 'initial', otherwise
;267:use normal spawn selection.
;268:============
;269:*/
;270:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 273
;271:	gentity_t	*spot;
;272:
;273:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $130
JUMPV
LABELV $129
line 274
;274:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 275
;275:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $132
line 276
;276:			break;
ADDRGP4 $131
JUMPV
LABELV $132
line 278
;277:		}
;278:	}
LABELV $130
line 274
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRGP4 $64
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
LABELV $131
line 280
;279:
;280:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $136
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $134
LABELV $136
line 281
;281:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $128
JUMPV
LABELV $134
line 284
;282:	}
;283:
;284:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 285
;285:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 286
;286:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 288
;287:
;288:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $128
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 297
;289:}
;290:
;291:/*
;292:===========
;293:SelectSpectatorSpawnPoint
;294:
;295:============
;296:*/
;297:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 298
;298:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 300
;299:
;300:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9156
INDIRB
ASGNB 12
line 301
;301:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9168
INDIRB
ASGNB 12
line 303
;302:
;303:	return NULL;
CNSTP4 0
RETP4
LABELV $137
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 319
;304:}
;305:
;306:/*
;307:=======================================================================
;308:
;309:BODYQUE
;310:
;311:=======================================================================
;312:*/
;313:
;314:/*
;315:===============
;316:InitBodyQue
;317:===============
;318:*/
;319:void InitBodyQue (void) {
line 323
;320:	int		i;
;321:	gentity_t	*ent;
;322:
;323:	level.bodyQueIndex = 0;
ADDRGP4 level+9188
CNSTI4 0
ASGNI4
line 324
;324:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $142
line 325
;325:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 326
;326:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $146
ASGNP4
line 327
;327:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 328
;328:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9192
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 329
;329:	}
LABELV $143
line 324
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $142
line 330
;330:}
LABELV $140
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 339
;331:
;332:/*
;333:=============
;334:BodySink
;335:
;336:After sitting around for five seconds, fall into the ground and dissapear
;337:=============
;338:*/
;339:void BodySink( gentity_t *ent ) {
line 340
;340:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $149
line 342
;341:		// the body ques are never actually freed, they are just unlinked
;342:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 343
;343:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 0
ASGNI4
line 344
;344:		return;	
ADDRGP4 $148
JUMPV
LABELV $149
line 346
;345:	}
;346:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 347
;347:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 348
;348:}
LABELV $148
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 48 12
line 358
;349:
;350:/*
;351:=============
;352:CopyToBodyQue
;353:
;354:A player is respawning, so make an entity that looks
;355:just like the existing corpse to leave behind.
;356:=============
;357:*/
;358:void CopyToBodyQue( gentity_t *ent ) {
line 366
;359:#ifdef MISSIONPACK
;360:	gentity_t	*e;
;361:	int i;
;362:#endif
;363:	gentity_t		*body;
;364:	int			contents;
;365:
;366:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 369
;367:
;368:	// if client is in a nodrop area, don't leave the body
;369:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 370
;370:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $154
line 371
;371:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 375
;372:	}
;373:
;374:	// grab a body que and cycle to the next one
;375:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9188
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9192
ADDP4
INDIRP4
ASGNP4
line 376
;376:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9188
ADDRGP4 level+9188
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 378
;377:
;378:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 380
;379:
;380:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 212
line 381
;381:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 400
;382:#ifdef MISSIONPACK
;383:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
;384:		body->s.eFlags |= EF_KAMIKAZE;
;385:
;386:		// check if there is a kamikaze timer around for this owner
;387:		for (i = 0; i < MAX_GENTITIES; i++) {
;388:			e = &g_entities[i];
;389:			if (!e->inuse)
;390:				continue;
;391:			if (e->activator != ent)
;392:				continue;
;393:			if (strcmp(e->classname, "kamikaze timer"))
;394:				continue;
;395:			e->activator = body;
;396:			break;
;397:		}
;398:	}
;399:#endif
;400:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 401
;401:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 402
;402:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ASGNI4
line 403
;403:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 404
;404:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
line 405
;405:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTF4 0
ASGNF4
line 406
;406:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $161
line 407
;407:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 408
;408:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 409
;409:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 410
;410:	} else {
ADDRGP4 $162
JUMPV
LABELV $161
line 411
;411:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 412
;412:	}
LABELV $162
line 413
;413:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 417
;414:
;415:	// change the animation to the last-frame only, so the sequence
;416:	// doesn't repeat anew for the body
;417:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $164
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $164
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $170
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $170
address $167
address $167
address $168
address $168
address $169
address $169
code
LABELV $167
line 420
;418:	case BOTH_DEATH1:
;419:	case BOTH_DEAD1:
;420:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 421
;421:		break;
ADDRGP4 $165
JUMPV
LABELV $168
line 424
;422:	case BOTH_DEATH2:
;423:	case BOTH_DEAD2:
;424:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 36
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 425
;425:		break;
ADDRGP4 $165
JUMPV
LABELV $169
LABELV $164
line 429
;426:	case BOTH_DEATH3:
;427:	case BOTH_DEAD3:
;428:	default:
;429:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 44
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 430
;430:		break;
LABELV $165
line 433
;431:	}
;432:
;433:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 24
CNSTI4 432
ASGNI4
ADDRLP4 0
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
line 434
;434:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 28
CNSTI4 444
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 435
;435:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 32
CNSTI4 456
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 436
;436:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 36
CNSTI4 472
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 437
;437:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 40
CNSTI4 484
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 439
;438:
;439:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 65537
ASGNI4
line 440
;440:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 441
;441:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 443
;442:
;443:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 444
;444:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 BodySink
ASGNP4
line 446
;445:
;446:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 body_die
ASGNP4
line 449
;447:
;448:	// don't take more damage if already gibbed
;449:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $172
line 450
;450:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 451
;451:	} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 452
;452:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 453
;453:	}
LABELV $173
line 456
;454:
;455:	// Shafe - Trep - Headshots
;456:	if(ent->client->noHead) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $174
line 457
;457:		G_AddEvent( body,EV_BODY_NOHEAD,0 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 70
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 458
;458:	}
LABELV $174
line 461
;459:	// Shafe - Trep - End Headshots
;460:
;461:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 462
;462:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 463
;463:}
LABELV $153
endproc CopyToBodyQue 48 12
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 474
;464:
;465://======================================================================
;466:
;467:
;468:/*
;469:==================
;470:SetClientViewAngle
;471:
;472:==================
;473:*/
;474:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 478
;475:	int			i;
;476:
;477:	// set the delta angle
;478:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $177
line 481
;479:		int		cmdAngle;
;480:
;481:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 482
;482:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 483
;483:	}
LABELV $178
line 478
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $177
line 484
;484:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 485
;485:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 486
;486:}
LABELV $176
endproc SetClientViewAngle 16 0
export respawn
proc respawn 12 8
line 493
;487:
;488:/*
;489:================
;490:respawn
;491:================
;492:*/
;493:void respawn( gentity_t *ent ) {
line 496
;494:	gentity_t	*tent;
;495:
;496:	CopyToBodyQue (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 497
;497:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 500
;498:
;499:	// add a teleportation effect
;500:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 501
;501:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 0
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
line 502
;502:}
LABELV $181
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 511
;503:
;504:/*
;505:================
;506:TeamCount
;507:
;508:Returns number of players on a team
;509:================
;510:*/
;511:team_t TeamCount( int ignoreClientNum, int team ) {
line 513
;512:	int		i;
;513:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 515
;514:
;515:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $183
line 516
;516:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $188
line 517
;517:			continue;
ADDRGP4 $184
JUMPV
LABELV $188
line 519
;518:		}
;519:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $190
line 520
;520:			continue;
ADDRGP4 $184
JUMPV
LABELV $190
line 522
;521:		}
;522:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $192
line 523
;523:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 524
;524:		}
LABELV $192
line 525
;525:	}
LABELV $184
line 515
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $186
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $183
line 527
;526:
;527:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $182
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 537
;528:}
;529:
;530:/*
;531:================
;532:TeamLeader
;533:
;534:Returns the client number of the team leader
;535:================
;536:*/
;537:int TeamLeader( int team ) {
line 540
;538:	int		i;
;539:
;540:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $198
JUMPV
LABELV $195
line 541
;541:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 542
;542:			continue;
ADDRGP4 $196
JUMPV
LABELV $200
line 544
;543:		}
;544:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $202
line 545
;545:			if ( level.clients[i].sess.teamLeader )
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $204
line 546
;546:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $194
JUMPV
LABELV $204
line 547
;547:		}
LABELV $202
line 548
;548:	}
LABELV $196
line 540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $198
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $195
line 550
;549:
;550:	return -1;
CNSTI4 -1
RETI4
LABELV $194
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 560
;551:}
;552:
;553:
;554:/*
;555:================
;556:PickTeam
;557:
;558:================
;559:*/
;560:team_t PickTeam( int ignoreClientNum ) {
line 565
;561:	int		counts[TEAM_NUM_TEAMS];
;562:
;563://	if(g_GameMode.integer != 999)
;564://	{
;565:		counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 566
;566:		counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 568
;567:
;568:		if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $209
line 569
;569:			return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $209
line 571
;570:		}
;571:		if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $213
line 572
;572:			return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $206
JUMPV
LABELV $213
line 575
;573:		}
;574:		// equal team count, so join the team with the lowest score
;575:		if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+52+8
INDIRI4
ADDRGP4 level+52+4
INDIRI4
LEI4 $217
line 576
;576:			return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $217
line 578
;577:		}
;578:		return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $206
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 608
;579://	}
;580:	
;581:}
;582:
;583:/*
;584:===========
;585:ForceClientSkin
;586:
;587:Forces a client's skin (for teamplay)
;588:===========
;589:*/
;590:/*
;591:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;592:	char *p;
;593:
;594:	if ((p = Q_strrchr(model, '/')) != 0) {
;595:		*p = 0;
;596:	}
;597:
;598:	Q_strcat(model, MAX_QPATH, "/");
;599:	Q_strcat(model, MAX_QPATH, skin);
;600:}
;601:*/
;602:
;603:/*
;604:===========
;605:ClientCheckName
;606:============
;607:*/
;608:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 615
;609:	int		len, colorlessLen;
;610:	char	ch;
;611:	char	*p;
;612:	int		spaces;
;613:
;614:	//save room for trailing null byte
;615:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 617
;616:
;617:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 618
;618:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 619
;619:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 620
;620:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 621
;621:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
line 623
;622:
;623:	while( 1 ) {
line 624
;624:		ch = *in++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
line 625
;625:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $227
line 626
;626:			break;
ADDRGP4 $226
JUMPV
LABELV $227
line 630
;627:		}
;628:
;629:		// don't allow leading spaces
;630:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $229
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $229
line 631
;631:			continue;
ADDRGP4 $225
JUMPV
LABELV $229
line 635
;632:		}
;633:
;634:		// check colors
;635:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $231
line 637
;636:			// solo trailing carat is not a color prefix
;637:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $233
line 638
;638:				break;
ADDRGP4 $226
JUMPV
LABELV $233
line 642
;639:			}
;640:
;641:			// don't allow black in a name, period
;642:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $235
line 643
;643:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 644
;644:				continue;
ADDRGP4 $225
JUMPV
LABELV $235
line 648
;645:			}
;646:
;647:			// make sure room in dest for both chars
;648:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $237
line 649
;649:				break;
ADDRGP4 $226
JUMPV
LABELV $237
line 652
;650:			}
;651:
;652:			*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 653
;653:			*out++ = *in++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 654
;654:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 655
;655:			continue;
ADDRGP4 $225
JUMPV
LABELV $231
line 659
;656:		}
;657:
;658:		// don't allow too many consecutive spaces
;659:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $239
line 660
;660:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 661
;661:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $240
line 662
;662:				continue;
ADDRGP4 $225
JUMPV
line 664
;663:			}
;664:		}
LABELV $239
line 665
;665:		else {
line 666
;666:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 667
;667:		}
LABELV $240
line 669
;668:
;669:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $243
line 670
;670:			break;
ADDRGP4 $226
JUMPV
LABELV $243
line 673
;671:		}
;672:
;673:		*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 674
;674:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 675
;675:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 676
;676:	}
LABELV $225
line 623
ADDRGP4 $224
JUMPV
LABELV $226
line 677
;677:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 680
;678:
;679:	// don't allow empty names
;680:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $247
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $245
LABELV $247
line 681
;681:		Q_strncpyz( p, "UnnamedPlayer", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 682
;682:	}
LABELV $245
line 683
;683:}
LABELV $223
endproc ClientCleanName 40 12
export ClientUserinfoChanged
proc ClientUserinfoChanged 6436 56
line 697
;684:
;685:
;686:/*
;687:===========
;688:ClientUserInfoChanged
;689:
;690:Called from ClientConnect when the player first connects and
;691:directly by the server system when the player updates a userinfo variable.
;692:
;693:The game can override any of the settings and call trap_SetUserinfo
;694:if desired.
;695:============
;696:*/
;697:void ClientUserinfoChanged( int clientNum ) {
line 711
;698:	gentity_t *ent;
;699:	int		teamTask, teamLeader, team, health;
;700:	char	*s;
;701:	char	model[MAX_QPATH];
;702:	char	headModel[MAX_QPATH];
;703:	char	oldname[MAX_STRING_CHARS];
;704:	gclient_t	*client;
;705:	char	c1[MAX_INFO_STRING];
;706:	char	c2[MAX_INFO_STRING];
;707:	char	redTeam[MAX_INFO_STRING];
;708:	char	blueTeam[MAX_INFO_STRING];
;709:	char	userinfo[MAX_INFO_STRING];
;710:
;711:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 712
;712:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 714
;713:
;714:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 717
;715:
;716:	// check for malformed or illegal info strings
;717:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 8
ARGP4
ADDRLP4 6300
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
NEI4 $250
line 718
;718:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 8
ARGP4
ADDRGP4 $252
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 719
;719:	}
LABELV $250
line 722
;720:
;721:	// check for local client
;722:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 8
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 6304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6304
INDIRP4
ASGNP4
line 723
;723:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 6308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6308
INDIRI4
CNSTI4 0
NEI4 $254
line 724
;724:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 725
;725:	}
LABELV $254
line 728
;726:
;727:	// check the item prediction
;728:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 8
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 6312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6312
INDIRP4
ASGNP4
line 729
;729:	if ( !atoi( s ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6316
INDIRI4
CNSTI4 0
NEI4 $258
line 730
;730:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:	} else {
ADDRGP4 $259
JUMPV
LABELV $258
line 732
;732:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 733
;733:	}
LABELV $259
line 737
;734:
;735://unlagged - client options
;736:	// see if the player has opted out
;737:	s = Info_ValueForKey( userinfo, "cg_delag" );
ADDRLP4 8
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 6320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6320
INDIRP4
ASGNP4
line 738
;738:	if ( !atoi( s ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6324
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6324
INDIRI4
CNSTI4 0
NEI4 $261
line 739
;739:		client->pers.delag = 0;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 740
;740:	} else {
ADDRGP4 $262
JUMPV
LABELV $261
line 741
;741:		client->pers.delag = atoi( s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6328
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRLP4 6328
INDIRI4
ASGNI4
line 742
;742:	}
LABELV $262
line 745
;743:
;744:	// see if the player is nudging his shots
;745:	s = Info_ValueForKey( userinfo, "cg_cmdTimeNudge" );
ADDRLP4 8
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 6328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6328
INDIRP4
ASGNP4
line 746
;746:	client->pers.cmdTimeNudge = atoi( s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6332
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 6332
INDIRI4
ASGNI4
line 749
;747:
;748:	// see if the player wants to debug the backward reconciliation
;749:	s = Info_ValueForKey( userinfo, "cg_debugDelag" );
ADDRLP4 8
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6336
INDIRP4
ASGNP4
line 750
;750:	if ( !atoi( s ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6340
INDIRI4
CNSTI4 0
NEI4 $265
line 751
;751:		client->pers.debugDelag = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 752
;752:	}
ADDRGP4 $266
JUMPV
LABELV $265
line 753
;753:	else {
line 754
;754:		client->pers.debugDelag = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 755
;755:	}
LABELV $266
line 758
;756:
;757:	// see if the player is simulating incoming latency
;758:	s = Info_ValueForKey( userinfo, "cg_latentSnaps" );
ADDRLP4 8
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6344
INDIRP4
ASGNP4
line 759
;759:	client->pers.latentSnaps = atoi( s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6348
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 6348
INDIRI4
ASGNI4
line 762
;760:
;761:	// see if the player is simulating outgoing latency
;762:	s = Info_ValueForKey( userinfo, "cg_latentCmds" );
ADDRLP4 8
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 6352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6352
INDIRP4
ASGNP4
line 763
;763:	client->pers.latentCmds = atoi( s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6356
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 6356
INDIRI4
ASGNI4
line 766
;764:
;765:	// see if the player is simulating outgoing packet loss
;766:	s = Info_ValueForKey( userinfo, "cg_plOut" );
ADDRLP4 8
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6360
INDIRP4
ASGNP4
line 767
;767:	client->pers.plOut = atoi( s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6364
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 6364
INDIRI4
ASGNI4
line 771
;768://unlagged - client options
;769:
;770:	// set name
;771:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1164
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 772
;772:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 8
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 6368
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6368
INDIRP4
ASGNP4
line 773
;773:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 775
;774:
;775:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $271
line 776
;776:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2572
ADDP4
INDIRI4
CNSTI4 3
NEI4 $273
line 777
;777:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 $275
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 778
;778:		}
LABELV $273
line 779
;779:	}
LABELV $271
line 781
;780:
;781:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $276
line 782
;782:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1164
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 6372
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6372
INDIRI4
CNSTI4 0
EQI4 $278
line 783
;783:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, 
ADDRGP4 $280
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 6376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 785
;784:				client->pers.netname) );
;785:		}
LABELV $278
line 786
;786:	}
LABELV $276
line 800
;787:
;788:	// set max health
;789:#ifdef MISSIONPACK
;790:	if (client->ps.powerups[PW_GUARD]) {
;791:		client->pers.maxHealth = 200;
;792:	} else {
;793:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
;794:		client->pers.maxHealth = health;
;795:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
;796:			client->pers.maxHealth = 100;
;797:		}
;798:	}
;799:#else
;800:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 6372
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6372
INDIRP4
ARGP4
ADDRLP4 6376
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2196
ADDRLP4 6376
INDIRI4
ASGNI4
line 801
;801:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 2196
INDIRI4
ASGNI4
line 802
;802:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 6380
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6380
INDIRI4
CNSTI4 1
LTI4 $284
ADDRLP4 6380
INDIRI4
CNSTI4 100
LEI4 $282
LABELV $284
line 803
;803:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 804
;804:	}
LABELV $282
line 806
;805:#endif
;806:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 809
;807:
;808:	// set model
;809:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $285
line 810
;810:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 8
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6388
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 811
;811:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
ADDRLP4 8
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 6392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 6392
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 812
;812:	} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 813
;813:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 8
ARGP4
ADDRGP4 $290
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6388
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 814
;814:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
ADDRLP4 8
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 6392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 6392
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 815
;815:	}
LABELV $286
line 818
;816:
;817:	// bots set their team a few frames later
;818:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $292
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $292
line 819
;819:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 8
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6388
INDIRP4
ASGNP4
line 820
;820:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 6392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6392
INDIRI4
CNSTI4 0
EQI4 $302
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 6396
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6396
INDIRI4
CNSTI4 0
NEI4 $298
LABELV $302
line 821
;821:			team = TEAM_RED;
ADDRLP4 4248
CNSTI4 1
ASGNI4
line 822
;822:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $293
JUMPV
LABELV $298
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $305
ARGP4
ADDRLP4 6400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6400
INDIRI4
CNSTI4 0
EQI4 $307
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $306
ARGP4
ADDRLP4 6404
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6404
INDIRI4
CNSTI4 0
NEI4 $303
LABELV $307
line 823
;823:			team = TEAM_BLUE;
ADDRLP4 4248
CNSTI4 2
ASGNI4
line 824
;824:		} else {
ADDRGP4 $293
JUMPV
LABELV $303
line 826
;825:			// pick the team with the least number of players	
;826:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 6408
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4248
ADDRLP4 6408
INDIRI4
ASGNI4
line 827
;827:		}
line 828
;828:	}
ADDRGP4 $293
JUMPV
LABELV $292
line 829
;829:	else {
line 830
;830:		team = client->sess.sessionTeam;
ADDRLP4 4248
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ASGNI4
line 831
;831:	}
LABELV $293
line 867
;832:
;833:/*	NOTE: all client side now
;834:
;835:	// team
;836:	switch( team ) {
;837:	case TEAM_RED:
;838:		ForceClientSkin(client, model, "red");
;839://		ForceClientSkin(client, headModel, "red");
;840:		break;
;841:	case TEAM_BLUE:
;842:		ForceClientSkin(client, model, "blue");
;843://		ForceClientSkin(client, headModel, "blue");
;844:		break;
;845:	}
;846:	// don't ever use a default skin in teamplay, it would just waste memory
;847:	// however bots will always join a team but they spawn in as spectator
;848:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;849:		ForceClientSkin(client, model, "red");
;850://		ForceClientSkin(client, headModel, "red");
;851:	}
;852:*/
;853:
;854:#ifdef MISSIONPACK
;855:	if (g_gametype.integer >= GT_TEAM) {
;856:		client->pers.teamInfo = qtrue;
;857:	} else {
;858:		s = Info_ValueForKey( userinfo, "teamoverlay" );
;859:		if ( ! *s || atoi( s ) != 0 ) {
;860:			client->pers.teamInfo = qtrue;
;861:		} else {
;862:			client->pers.teamInfo = qfalse;
;863:		}
;864:	}
;865:#else
;866:	// teamInfo
;867:	s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 8
ARGP4
ADDRGP4 $308
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6388
INDIRP4
ASGNP4
line 868
;868:	if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $311
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6396
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6396
INDIRI4
CNSTI4 0
EQI4 $309
LABELV $311
line 869
;869:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 870
;870:	} else {
ADDRGP4 $310
JUMPV
LABELV $309
line 871
;871:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 872
;872:	}
LABELV $310
line 885
;873:#endif
;874:	/*
;875:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;876:	if ( !*s || atoi( s ) == 0 ) {
;877:		client->pers.pmoveFixed = qfalse;
;878:	}
;879:	else {
;880:		client->pers.pmoveFixed = qtrue;
;881:	}
;882:	*/
;883:
;884:	// team task (0 = none, 1 = offence, 2 = defence)
;885:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 8
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 6400
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6400
INDIRP4
ARGP4
ADDRLP4 6404
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2188
ADDRLP4 6404
INDIRI4
ASGNI4
line 887
;886:	// team Leader (1 = leader, 0 is normal player)
;887:	teamLeader = client->sess.teamLeader;
ADDRLP4 2192
ADDRLP4 0
INDIRP4
CNSTI4 2588
ADDP4
INDIRI4
ASGNI4
line 890
;888:
;889:	// colors
;890:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 8
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 6408
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2200
ARGP4
ADDRLP4 6408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 891
;891:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 8
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 6412
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3224
ARGP4
ADDRLP4 6412
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 893
;892:
;893:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 8
ARGP4
ADDRGP4 $315
ARGP4
ADDRLP4 6416
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4252
ARGP4
ADDRLP4 6416
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 894
;894:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 8
ARGP4
ADDRGP4 $316
ARGP4
ADDRLP4 6420
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5276
ARGP4
ADDRLP4 6420
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 898
;895:
;896:	// send over a subset of the userinfo keys so other clients can
;897:	// print scoreboards, display models, and play custom sounds
;898:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $317
line 899
;899:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 8
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 6424
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $319
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4248
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2580
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
ARGI4
ADDRLP4 6424
INDIRP4
ARGP4
ADDRLP4 2188
INDIRI4
ARGI4
ADDRLP4 2192
INDIRI4
ARGI4
ADDRLP4 6432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6432
INDIRP4
ASGNP4
line 903
;900:			client->pers.netname, team, model, headModel, c1, c2, 
;901:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;902:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;903:	} else {
ADDRGP4 $318
JUMPV
LABELV $317
line 904
;904:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $321
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 4252
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2580
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2584
ADDP4
INDIRI4
ARGI4
ADDRLP4 2188
INDIRI4
ARGI4
ADDRLP4 2192
INDIRI4
ARGI4
ADDRLP4 6428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6428
INDIRP4
ASGNP4
line 907
;905:			client->pers.netname, client->sess.sessionTeam, model, headModel, redTeam, blueTeam, c1, c2, 
;906:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;907:	}
LABELV $318
line 909
;908:
;909:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 911
;910:
;911:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $322
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 912
;912:}
LABELV $249
endproc ClientUserinfoChanged 6436 56
export ClientConnect
proc ClientConnect 1100 12
line 935
;913:
;914:
;915:/*
;916:===========
;917:ClientConnect
;918:
;919:Called when a player begins connecting to the server.
;920:Called again for every map change or tournement restart.
;921:
;922:The session information will be valid after exit.
;923:
;924:Return NULL if the client should be allowed, otherwise return
;925:a string with the reason for denial.
;926:
;927:Otherwise, the client will be sent the current gamestate
;928:and will eventually get to ClientBegin.
;929:
;930:firstTime will be qtrue the very first time a client connects
;931:to the server machine, but qfalse on map changes and tournement
;932:restarts.
;933:============
;934:*/
;935:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 942
;936:	char		*value;
;937://	char		*areabits;
;938:	gclient_t	*client;
;939:	char		userinfo[MAX_INFO_STRING];
;940:	gentity_t	*ent;
;941:	char		guid[ 33 ];
;942:	ent = &g_entities[ clientNum ];
ADDRLP4 1032
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 944
;943:
;944:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 947
;945:
;946:	// Admin System
;947:	value = Info_ValueForKey( userinfo, "cl_guid" );
ADDRLP4 8
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 1072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1072
INDIRP4
ASGNP4
line 948
;948:	Q_strncpyz( guid, value, sizeof( guid ) );
ADDRLP4 1036
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 951
;949:
;950:	// check to see if they are on the banned IP list
;951:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 8
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1076
INDIRP4
ASGNP4
line 952
;952:	if ( G_FilterPacket( value ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $325
line 953
;953:		return "Banned.";
ADDRGP4 $327
RETP4
ADDRGP4 $323
JUMPV
LABELV $325
line 956
;954:	}
;955:
;956:	if ( !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $328
line 958
;957:		// check for a password
;958:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 8
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1084
INDIRP4
ASGNP4
line 959
;959:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $331
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $335
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $331
ADDRGP4 g_password+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $331
line 960
;960:			strcmp( g_password.string, value) != 0) {
line 961
;961:			return "Invalid password";
ADDRGP4 $337
RETP4
ADDRGP4 $323
JUMPV
LABELV $331
line 963
;962:		}
;963:	}
LABELV $328
line 966
;964:
;965:	// they can connect
;966:	ent->client = level.clients + clientNum;
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 967
;967:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 971
;968:
;969://	areabits = client->areabits;
;970:
;971:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3492
ARGI4
ADDRGP4 memset
CALLP4
pop
line 976
;972:
;973:
;974:
;975:  // add guid to session so we don't have to keep parsing userinfo everywhere /*
;976:  if( !guid[0] )
ADDRLP4 1036
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $338
line 977
;977:  {
line 978
;978:    Q_strncpyz( client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
ADDRLP4 0
INDIRP4
CNSTI4 2504
ADDP4
ARGP4
ADDRGP4 $340
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 980
;979:      sizeof( client->pers.guid ) );
;980:  }
ADDRGP4 $339
JUMPV
LABELV $338
line 982
;981:  else
;982:  {
line 983
;983:    Q_strncpyz( client->pers.guid, guid, sizeof( client->pers.guid ) );
ADDRLP4 0
INDIRP4
CNSTI4 2504
ADDP4
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 984
;984:  }
LABELV $339
line 991
;985:	/* Admin System TJW
;986:	Q_strncpyz( client->pers.ip, ip, sizeof( client->pers.ip ) );
;987:	client->pers.adminLevel = G_admin_level( ent );
;988:	*/
;989:  
;990:
;991:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 994
;992:
;993:	// read or initialize the session data
;994:	if ( firstTime || level.newSession ) {
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1084
INDIRI4
NEI4 $344
ADDRGP4 level+76
INDIRI4
ADDRLP4 1084
INDIRI4
EQI4 $341
LABELV $344
line 995
;995:		G_InitSessionData( client, userinfo );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
line 996
;996:	}
LABELV $341
line 997
;997:	G_ReadSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 999
;998:
;999:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $345
line 1000
;1000:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1088
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1001
;1001:		ent->inuse = qtrue;
ADDRLP4 1032
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 1002
;1002:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $350
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $350
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $351
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $347
line 1003
;1003:			return "BotConnectfailed";
ADDRGP4 $352
RETP4
ADDRGP4 $323
JUMPV
LABELV $347
line 1005
;1004:		}
;1005:	}
LABELV $345
line 1008
;1006:
;1007:	// get and distribute relevent paramters
;1008:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $353
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1009
;1009:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1012
;1010:
;1011:	// don't do the "xxx connected" messages if they were caried over from previous level
;1012:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $354
line 1013
;1013:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
ADDRGP4 $356
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1014
;1014:	}
LABELV $354
line 1016
;1015:
;1016:	if ( g_gametype.integer >= GT_TEAM &&
ADDRLP4 1088
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1088
INDIRI4
LTI4 $357
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $357
line 1017
;1017:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1018
;1018:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1019
;1019:	}
LABELV $357
line 1022
;1020:
;1021:	// count current clients and rank for scoreboard
;1022:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1031
;1023:
;1024:	// for statistics
;1025://	client->areabits = areabits;
;1026://	if ( !client->areabits )
;1027://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1028:
;1029://unlagged - backward reconciliation #5
;1030:	// announce it
;1031:	trap_SendServerCommand( clientNum, "print \"Trepidation Development Build\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $360
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1032
;1032:	if ( g_delagHitscan.integer ) {
ADDRGP4 g_delagHitscan+12
INDIRI4
CNSTI4 0
EQI4 $361
line 1034
;1033://		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is ON!\n\"" );
;1034:	}
LABELV $361
line 1035
;1035:	else {
line 1037
;1036://		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is OFF!\n\"" );
;1037:	}
LABELV $362
line 1040
;1038://unlagged - backward reconciliation #5
;1039:
;1040:	return NULL;
CNSTP4 0
RETP4
LABELV $323
endproc ClientConnect 1100 12
export ClientBegin
proc ClientBegin 28 12
line 1052
;1041:}
;1042:
;1043:/*
;1044:===========
;1045:ClientBegin
;1046:
;1047:called when a client has finished connecting, and is ready
;1048:to be placed into the level.  This will happen every level load,
;1049:and on transition between teams, but doesn't happen on respawns
;1050:============
;1051:*/
;1052:void ClientBegin( int clientNum ) {
line 1058
;1053:	gentity_t	*ent;
;1054:	gclient_t	*client;
;1055:	gentity_t	*tent;
;1056:	int			flags;
;1057:
;1058:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1060
;1059:
;1060:	client = level.clients + clientNum;
ADDRLP4 0
CNSTI4 3492
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1062
;1061:
;1062:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $365
line 1063
;1063:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1064
;1064:	}
LABELV $365
line 1065
;1065:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1066
;1066:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 1067
;1067:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
CNSTP4 0
ASGNP4
line 1068
;1068:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1070
;1069:
;1070:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 1071
;1071:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1072
;1072:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 1079
;1073:
;1074:	// save eflags around this, because changing teams will
;1075:	// cause this to happen with a valid entity, and we
;1076:	// want to make sure the teleport bit is set right
;1077:	// so the viewpoint doesn't interpolate through the
;1078:	// world to the new position
;1079:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1080
;1080:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1081
;1081:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1084
;1082:
;1083:	// Set What Weapons Are Allow for Arsenal
;1084:	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 999) )
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $372
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $368
LABELV $372
line 1085
;1085:	{
line 1088
;1086:			// Set Starting Weapons
;1087:		
;1088:			if (g_StartGauntlet.integer > 0) { client->pers.h_gauntlet = qtrue; }
ADDRGP4 g_StartGauntlet+12
INDIRI4
CNSTI4 0
LEI4 $373
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 1
ASGNI4
LABELV $373
line 1089
;1089:			if (g_StartMG.integer > 0) { client->pers.h_mg = qtrue; }
ADDRGP4 g_StartMG+12
INDIRI4
CNSTI4 0
LEI4 $376
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 1
ASGNI4
LABELV $376
line 1090
;1090:			if (g_StartSG.integer > 0) { client->pers.h_sg = qtrue; }
ADDRGP4 g_StartSG+12
INDIRI4
CNSTI4 0
LEI4 $379
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 1
ASGNI4
LABELV $379
line 1091
;1091:			if (g_StartGrenade.integer > 0) { client->pers.h_grenade = qtrue; }
ADDRGP4 g_StartGrenade+12
INDIRI4
CNSTI4 0
LEI4 $382
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 1
ASGNI4
LABELV $382
line 1092
;1092:			if (g_StartSingCan.integer > 0) { client->pers.h_singcan = qtrue; }
ADDRGP4 g_StartSingCan+12
INDIRI4
CNSTI4 0
LEI4 $385
ADDRLP4 0
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 1
ASGNI4
LABELV $385
line 1093
;1093:			if (g_StartFlame.integer > 0) { client->pers.h_flame = qtrue; }
ADDRGP4 g_StartFlame+12
INDIRI4
CNSTI4 0
LEI4 $388
ADDRLP4 0
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 1
ASGNI4
LABELV $388
line 1094
;1094:			if (g_StartGauss.integer > 0) { client->pers.h_gauss = qtrue; }
ADDRGP4 g_StartGauss+12
INDIRI4
CNSTI4 0
LEI4 $391
ADDRLP4 0
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 1
ASGNI4
LABELV $391
line 1095
;1095:			if (g_StartPlasma.integer > 0) { client->pers.h_plasma = qtrue;}
ADDRGP4 g_StartPlasma+12
INDIRI4
CNSTI4 0
LEI4 $394
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 1
ASGNI4
LABELV $394
line 1096
;1096:			if (g_StartBFG.integer > 0) { client->pers.h_bfg = qtrue;}
ADDRGP4 g_StartBFG+12
INDIRI4
CNSTI4 0
LEI4 $397
ADDRLP4 0
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 1
ASGNI4
LABELV $397
line 1098
;1097:		
;1098:	}
LABELV $368
line 1099
;1099:	client->pers.Eliminated = qfalse;  // They are not eliminated
ADDRLP4 0
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1102
;1100:	// End Arsenal
;1101:
;1102:	client->pers.Frozen = qfalse;  // freeze
ADDRLP4 0
INDIRP4
CNSTI4 2488
ADDP4
CNSTI4 0
ASGNI4
line 1105
;1103:
;1104:	// locate ent at a spawn point
;1105:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1107
;1106:
;1107:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
EQI4 $400
line 1109
;1108:		// send event
;1109:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 1110
;1110:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 168
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1112
;1111:
;1112:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $402
line 1113
;1113:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $405
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1114
;1114:		}
LABELV $402
line 1115
;1115:	}
LABELV $400
line 1116
;1116:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $406
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1119
;1117:
;1118:	// count current clients and rank for scoreboard
;1119:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1120
;1120:}
LABELV $364
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 3332 16
line 1133
;1121:
;1122:
;1123:
;1124:/*
;1125:===========
;1126:ClientSpawn
;1127:
;1128:Called every time a client is placed fresh in the world:
;1129:after the first ClientBegin, and after each respawn
;1130:Initializes all non-persistant parts of playerState
;1131:============
;1132:*/
;1133:void ClientSpawn(gentity_t *ent) {
line 1150
;1134:	int		index;
;1135:	vec3_t	spawn_origin, spawn_angles;
;1136:	gclient_t	*client;
;1137:	int		i;
;1138:	clientPersistant_t	saved;
;1139:	clientSession_t		savedSess;
;1140:	int		persistant[MAX_PERSISTANT];
;1141:	gentity_t	*spawnPoint;
;1142:	int		flags;
;1143:	int		savedPing;
;1144://	char	*savedAreaBits;
;1145:	int		accuracy_hits, accuracy_shots;
;1146:	int		eventSequence;
;1147:	char	userinfo[MAX_INFO_STRING];
;1148:	int		wpn;
;1149:
;1150:	index = ent - g_entities;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ASGNI4
line 1151
;1151:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1157
;1152:
;1153:
;1154:	// find a spawn point
;1155:	// do it before setting health back up, so farthest
;1156:	// ranging doesn't count this client
;1157:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $408
line 1158
;1158:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3280
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3280
INDIRP4
ASGNP4
line 1160
;1159:						spawn_origin, spawn_angles);
;1160:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $409
JUMPV
LABELV $408
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $410
line 1164
;1161:		// all base oriented team games use the CTF spawn points
;1162:	
;1163:		// Do Reverse CTF Here: g_ReverseCTF
;1164:		if (g_ReverseCTF.value == 1) {
ADDRGP4 g_ReverseCTF+8
INDIRF4
CNSTF4 1065353216
NEF4 $413
line 1166
;1165:
;1166:			if (client->sess.sessionTeam == TEAM_RED) 
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 1
NEI4 $416
line 1167
;1167:			{ 
line 1168
;1168:				spawnPoint = SelectCTFSpawnPoint ( 
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3280
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3280
INDIRP4
ASGNP4
line 1172
;1169:				TEAM_BLUE, 
;1170:				client->pers.teamState.state, 
;1171:				spawn_origin, spawn_angles);
;1172:			} 
LABELV $416
line 1174
;1173:
;1174:			if (client->sess.sessionTeam == TEAM_BLUE) 
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $418
line 1175
;1175:			{ 
line 1176
;1176:				spawnPoint = SelectCTFSpawnPoint ( 				
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3280
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3280
INDIRP4
ASGNP4
line 1180
;1177:				TEAM_RED, 
;1178:				client->pers.teamState.state, 
;1179:				spawn_origin, spawn_angles);
;1180:			} 
LABELV $418
line 1183
;1181:
;1182:
;1183:		}
LABELV $413
line 1186
;1184:		
;1185:		
;1186:		if (g_ReverseCTF.value == 0) 
ADDRGP4 g_ReverseCTF+8
INDIRF4
CNSTF4 0
NEF4 $411
line 1187
;1187:		{
line 1190
;1188:		
;1189:		
;1190:			spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3284
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3284
INDIRP4
ASGNP4
line 1195
;1191:							client->sess.sessionTeam, 
;1192:							client->pers.teamState.state, 
;1193:							spawn_origin, spawn_angles);
;1194:
;1195:		}
line 1196
;1196:	} else {
ADDRGP4 $411
JUMPV
LABELV $410
LABELV $423
line 1197
;1197:		do {
line 1199
;1198:			// the first spawn should be at a good looking spot
;1199:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 3284
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 3284
INDIRI4
NEI4 $426
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 3284
INDIRI4
EQI4 $426
line 1200
;1200:				client->pers.initialSpawn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1201
;1201:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3288
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3288
INDIRP4
ASGNP4
line 1202
;1202:			} else {
ADDRGP4 $427
JUMPV
LABELV $426
line 1205
;1203:				// don't spawn near existing origin if possible	
;1204:				
;1205:					spawnPoint = SelectSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3288
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3288
INDIRP4
ASGNP4
line 1209
;1206:					client->ps.origin, 
;1207:					spawn_origin, spawn_angles);
;1208:				
;1209:			}
LABELV $427
line 1213
;1210:
;1211:			// Tim needs to prevent bots from spawning at the initial point
;1212:			// on q3dm0...
;1213:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 3288
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 3288
INDIRI4
EQI4 $428
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3288
INDIRI4
EQI4 $428
line 1214
;1214:				continue;	// try again
ADDRGP4 $424
JUMPV
LABELV $428
line 1217
;1215:			}
;1216:			// just to be symetric, we have a nohumans option...
;1217:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 3292
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 3292
INDIRI4
EQI4 $425
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3292
INDIRI4
NEI4 $425
line 1218
;1218:				continue;	// try again
line 1221
;1219:			}
;1220:
;1221:			break;
LABELV $424
line 1223
;1222:			
;1223:		} while ( 1 );
ADDRGP4 $423
JUMPV
LABELV $425
line 1224
;1224:	}
LABELV $411
LABELV $409
line 1225
;1225:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 1232
;1226:
;1227:	// always clear the kamikaze flag
;1228:	/* ent->s.eFlags &= ~EF_KAMIKAZE; */
;1229:
;1230:	// toggle the teleport bit so the client knows to not lerp
;1231:	// and never clear the voted flag
;1232:	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1233
;1233:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1237
;1234:
;1235://unlagged - backward reconciliation #3
;1236:	// we don't want players being backward-reconciled to the place they died
;1237:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 1239
;1238:	// and this is as good a time as any to clear the saved state
;1239:	client->saved.leveltime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 3480
ADDP4
CNSTI4 0
ASGNI4
line 1244
;1240://unlagged - backward reconciliation #3
;1241:
;1242:	// clear everything but the persistant data
;1243:
;1244:	saved = client->pers;
ADDRLP4 1132
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 2096
line 1245
;1245:	savedSess = client->sess;
ADDRLP4 3228
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRB
ASGNB 32
line 1246
;1246:	savedPing = client->ps.ping;
ADDRLP4 3260
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1248
;1247://	savedAreaBits = client->areabits;
;1248:	accuracy_hits = client->accuracy_hits;
ADDRLP4 3264
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
INDIRI4
ASGNI4
line 1249
;1249:	accuracy_shots = client->accuracy_shots;
ADDRLP4 3268
ADDRLP4 0
INDIRP4
CNSTI4 2660
ADDP4
INDIRI4
ASGNI4
line 1250
;1250:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $432
line 1251
;1251:		persistant[i] = client->ps.persistant[i];
ADDRLP4 3280
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 3280
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 3280
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1252
;1252:	}
LABELV $433
line 1250
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $432
line 1253
;1253:	eventSequence = client->ps.eventSequence;
ADDRLP4 3272
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1255
;1254:
;1255:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3492
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1257
;1256:
;1257:	client->pers = saved;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1132
INDIRB
ASGNB 2096
line 1258
;1258:	client->sess = savedSess;
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRLP4 3228
INDIRB
ASGNB 32
line 1259
;1259:	client->ps.ping = savedPing;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 3260
INDIRI4
ASGNI4
line 1261
;1260://	client->areabits = savedAreaBits;
;1261:	client->accuracy_hits = accuracy_hits;
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
ADDRLP4 3264
INDIRI4
ASGNI4
line 1262
;1262:	client->accuracy_shots = accuracy_shots;
ADDRLP4 0
INDIRP4
CNSTI4 2660
ADDP4
ADDRLP4 3268
INDIRI4
ASGNI4
line 1263
;1263:	client->lastkilled_client = -1;
ADDRLP4 0
INDIRP4
CNSTI4 2668
ADDP4
CNSTI4 -1
ASGNI4
line 1265
;1264:
;1265:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $436
line 1266
;1266:		client->ps.persistant[i] = persistant[i];
ADDRLP4 3280
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 3280
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 3280
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1267
;1267:	}
LABELV $437
line 1265
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $436
line 1268
;1268:	client->ps.eventSequence = eventSequence;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 3272
INDIRI4
ASGNI4
line 1270
;1269:	// increment the spawncount so the client will detect the respawn
;1270:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 3280
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 3280
INDIRP4
ADDRLP4 3280
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1271
;1271:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ASGNI4
line 1273
;1272:
;1273:	client->airOutTime = level.time + 12000;
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1275
;1274:
;1275:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1277
;1276:	// set max health
;1277:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 3288
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3288
INDIRP4
ARGP4
ADDRLP4 3292
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 3292
INDIRI4
ASGNI4
line 1278
;1278:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 3296
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRI4
CNSTI4 1
LTI4 $443
ADDRLP4 3296
INDIRI4
CNSTI4 100
LEI4 $441
LABELV $443
line 1279
;1279:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 1280
;1280:	}
LABELV $441
line 1283
;1281:
;1282:	// clear entity values
;1283:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 1284
;1284:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1288
;1285:
;1286:
;1287:	// Game startes zoom should reset, otherwise you get stuck in zoom without the guass rifle -- shafes
;1288:	trap_SendServerCommand(client->ps.clientNum, "-gzoom");
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 $444
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1289
;1289:	client->Zoomed = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2740
ADDP4
CNSTI4 0
ASGNI4
line 1291
;1290:	
;1291:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1292
;1292:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3492
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1293
;1293:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1294
;1294:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 1295
;1295:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $445
ASGNP4
line 1296
;1296:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 33554432
ASGNI4
line 1297
;1297:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 33619969
ASGNI4
line 1298
;1298:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 player_die
ASGNP4
line 1299
;1299:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 1300
;1300:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 1301
;1301:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 0
ASGNI4
line 1303
;1302:	
;1303:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1304
;1304:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1306
;1305:
;1306:	client->ps.clientNum = index;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1310
;1307:
;1308:	
;1309:	// Regular
;1310:	if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3304
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3304
INDIRI4
NEI4 $446
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3304
INDIRI4
NEI4 $446
line 1311
;1311:	{	
line 1312
;1312:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1313
;1313:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $450
line 1314
;1314:			client->ps.ammo[WP_MACHINEGUN] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 40
ASGNI4
line 1315
;1315:		} else {
ADDRGP4 $451
JUMPV
LABELV $450
line 1316
;1316:			client->ps.ammo[WP_MACHINEGUN] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 40
ASGNI4
line 1317
;1317:		} 
LABELV $451
line 1319
;1318:			
;1319:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3308
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1320
;1320:			client->ps.ammo[WP_GAUNTLET] = 99999;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 99999
ASGNI4
line 1321
;1321:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1323
;1322:
;1323:	} 
LABELV $446
line 1327
;1324:
;1325:	// Trepidation Gametype
;1326:	// This is all gonna change once we introduce classes
;1327:	if (g_instagib.integer == 0 && g_GameMode.integer == 3)  // Shafe - Trep Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $453
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $453
line 1328
;1328:	{
line 1329
;1329:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1330
;1330:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $457
line 1331
;1331:			client->ps.ammo[WP_MACHINEGUN] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 40
ASGNI4
line 1332
;1332:		} else {
ADDRGP4 $458
JUMPV
LABELV $457
line 1333
;1333:			client->ps.ammo[WP_MACHINEGUN] = 40;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 40
ASGNI4
line 1334
;1334:		} 
LABELV $458
line 1336
;1335:			
;1336:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3308
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1337
;1337:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1338
;1338:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1339
;1339:	}
LABELV $453
line 1342
;1340:	
;1341:	// Instagib
;1342:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $460
line 1343
;1343:	{
line 1345
;1344:		// InstaGib - weapons on spawning w/ammo  - Shafe Trep
;1345:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_RAILGUN );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 1346
;1346:		client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 9999
ASGNI4
line 1348
;1347: 
;1348:	}
LABELV $460
line 1350
;1349:
;1350:	if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $463
line 1351
;1351:	{
line 1353
;1352:		// Arsenal does not run in instagib mode
;1353:		if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $466
line 1354
;1354:		{
line 1355
;1355:			trap_SendServerCommand( -1, "print \"Instagib is not compatable with Arsenal Gametype\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $469
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1356
;1356:			g_instagib.integer = 0; 
ADDRGP4 g_instagib+12
CNSTI4 0
ASGNI4
line 1357
;1357:		}
LABELV $466
line 1359
;1358:
;1359:	}
LABELV $463
line 1363
;1360:
;1361:
;1362:	// health will count down towards max_health
;1363:	if(g_GameMode.integer == 999) // Single player starts out with more health
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $471
line 1364
;1364:	{
line 1365
;1365:		if ( !( ent->r.svFlags & SVF_BOT ) ) { // is not a bot
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $474
line 1366
;1366:			ent->health = 500;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 500
ASGNI4
line 1367
;1367:			client->pers.maxHealth = 500;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 500
ASGNI4
line 1368
;1368:			client->ps.stats[STAT_HEALTH] = 500;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 500
ASGNI4
line 1369
;1369:			client->ps.stats[STAT_MAX_HEALTH] = 500;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 500
ASGNI4
line 1370
;1370:		} else {
ADDRGP4 $472
JUMPV
LABELV $474
line 1371
;1371:			ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25; // is a bot
ADDRLP4 3312
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 3312
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 3312
INDIRI4
ASGNI4
line 1372
;1372:		}
line 1373
;1373:	} else {
ADDRGP4 $472
JUMPV
LABELV $471
line 1374
;1374:		ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 3312
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 3312
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 3312
INDIRI4
ASGNI4
line 1375
;1375:	}
LABELV $472
line 1377
;1376:
;1377:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1378
;1378:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1381
;1379:
;1380:	// the respawned flag will be cleared after the attack and jump keys come up
;1381:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 3308
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1383
;1382:
;1383:	trap_GetUsercmd( client - level.clients, &client->pers.cmd );
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3492
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1384
;1384:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1386
;1385:
;1386:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $476
line 1388
;1387:
;1388:	} else {
ADDRGP4 $477
JUMPV
LABELV $476
line 1389
;1389:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1390
;1390:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1392
;1391:
;1392:		if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3316
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3316
INDIRI4
NEI4 $478
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3316
INDIRI4
NEI4 $478
line 1393
;1393:		{
line 1395
;1394:		// force the base weapon up
;1395:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1396
;1396:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1397
;1397:		} 
LABELV $478
line 1400
;1398:		
;1399:		// Hand out weapons in instagib
;1400:		if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $482
line 1401
;1401:		{
line 1402
;1402:			client->ps.weapon = WP_RAILGUN; // InstaGib
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 3
ASGNI4
line 1403
;1403:		}
LABELV $482
line 1406
;1404:
;1405:		// Hand out weapons for LMS
;1406:		if ((g_GameMode.integer == 2) || (g_GameMode.integer == 4) && (g_instagib.integer == 0))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $490
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 4
NEI4 $485
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $485
LABELV $490
line 1407
;1407:		{
line 1408
;1408:			wpn = irandom(1,9); // Lets clean this up so you can specify which weapons are allowed
CNSTI4 1
ARGI4
CNSTI4 9
ARGI4
ADDRLP4 3320
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 3276
ADDRLP4 3320
INDIRI4
ASGNI4
line 1410
;1409:			
;1410:			if(wpn == WP_GAUNTLET) { // Gauntlet Was chosen, lets give them a 1 in 5 chance of being the poor fool who actually gets it.
ADDRLP4 3276
INDIRI4
CNSTI4 1
NEI4 $491
line 1412
;1411:				int r;
;1412:				r = irandom(1,5);  // 1 in 5 chance you'll actually get it
CNSTI4 1
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 3328
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 3324
ADDRLP4 3328
INDIRI4
ASGNI4
line 1413
;1413:				if(r != 1) { wpn = r; }
ADDRLP4 3324
INDIRI4
CNSTI4 1
EQI4 $493
ADDRLP4 3276
ADDRLP4 3324
INDIRI4
ASGNI4
LABELV $493
line 1414
;1414:			}
LABELV $491
line 1416
;1415:
;1416:			if(wpn == WP_BFG) { // Devastator Was chosen, lets give them a 1 in 5 chance of being the lucky bastard who actually gets it.
ADDRLP4 3276
INDIRI4
CNSTI4 9
NEI4 $495
line 1418
;1417:				int r;
;1418:				r = irandom(4,9);  // 1 in 5 chance you'll actually get it
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRLP4 3328
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 3324
ADDRLP4 3328
INDIRI4
ASGNI4
line 1419
;1419:				if(r != 9) { wpn = r; }
ADDRLP4 3324
INDIRI4
CNSTI4 9
EQI4 $497
ADDRLP4 3276
ADDRLP4 3324
INDIRI4
ASGNI4
LABELV $497
line 1420
;1420:			}
LABELV $495
line 1422
;1421:						
;1422:			client->ps.stats[STAT_WEAPONS] = ( 1 << wpn );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1
ADDRLP4 3276
INDIRI4
LSHI4
ASGNI4
line 1423
;1423:			client->ps.ammo[wpn] = 9999;
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 9999
ASGNI4
line 1424
;1424:		}
LABELV $485
line 1427
;1425:		
;1426:		// Hand out weapons for arsenal
;1427:		if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $499
line 1428
;1428:		{
line 1429
;1429:			if (client->pers.h_gauntlet) 
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $502
line 1430
;1430:			{
line 1431
;1431:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1432
;1432:				client->ps.ammo[WP_GAUNTLET] = 99999;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 99999
ASGNI4
line 1433
;1433:			}
LABELV $502
line 1435
;1434:			
;1435:			if (client->pers.h_mg) 
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $504
line 1436
;1436:			{
line 1437
;1437:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1438
;1438:			client->ps.ammo[WP_MACHINEGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 9999
ASGNI4
line 1439
;1439:			}
LABELV $504
line 1441
;1440:			
;1441:			if (client->pers.h_sg) 
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $506
line 1442
;1442:			{
line 1443
;1443:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1444
;1444:			client->ps.ammo[WP_SHOTGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 9999
ASGNI4
line 1445
;1445:			}
LABELV $506
line 1447
;1446:			
;1447:			if (client->pers.h_grenade ) 
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $508
line 1448
;1448:			{
line 1449
;1449:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1450
;1450:			client->ps.ammo[WP_GRENADE_LAUNCHER] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 9999
ASGNI4
line 1451
;1451:			}
LABELV $508
line 1453
;1452:
;1453:			if (client->pers.h_singcan) 
ADDRLP4 0
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $510
line 1454
;1454:			{
line 1455
;1455:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1456
;1456:			client->ps.ammo[WP_ROCKET_LAUNCHER] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 9999
ASGNI4
line 1457
;1457:			}
LABELV $510
line 1459
;1458:			
;1459:			if (client->pers.h_flame) 
ADDRLP4 0
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $512
line 1460
;1460:			{
line 1461
;1461:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1462
;1462:			client->ps.ammo[WP_LIGHTNING] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 9999
ASGNI4
line 1463
;1463:			}
LABELV $512
line 1465
;1464:			
;1465:			if (client->pers.h_gauss) 
ADDRLP4 0
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $514
line 1466
;1466:			{
line 1467
;1467:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1468
;1468:			client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 9999
ASGNI4
line 1469
;1469:			}
LABELV $514
line 1471
;1470:	
;1471:			if (client->pers.h_plasma) 
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $516
line 1472
;1472:			{
line 1473
;1473:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1474
;1474:			client->ps.ammo[WP_PLASMAGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1475
;1475:			}
LABELV $516
line 1477
;1476:			
;1477:			if (client->pers.h_bfg) 
ADDRLP4 0
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $518
line 1478
;1478:			{
line 1479
;1479:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1480
;1480:			client->ps.ammo[WP_BFG] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 9999
ASGNI4
line 1481
;1481:			}
LABELV $518
line 1484
;1482:			//client->ps.stats[STAT_WEAPONS] = ( 1 << wn );
;1483:			//client->ps.ammo[wn] = INFINITE;
;1484:		}
LABELV $499
line 1488
;1485:
;1486:
;1487:				// Hand out weapons for single player
;1488:		if (g_GameMode.integer == 999)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $520
line 1489
;1489:		{
line 1490
;1490:			if (client->pers.h_gauntlet) 
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
line 1491
;1491:			{
line 1492
;1492:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1493
;1493:				client->ps.ammo[WP_GAUNTLET] = 99999;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 99999
ASGNI4
line 1494
;1494:			}
LABELV $523
line 1496
;1495:			
;1496:			if (client->pers.h_mg) 
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $525
line 1497
;1497:			{
line 1498
;1498:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1499
;1499:			client->ps.ammo[WP_MACHINEGUN] = 75;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 75
ASGNI4
line 1500
;1500:			}
LABELV $525
line 1502
;1501:			
;1502:			if (client->pers.h_sg) 
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $527
line 1503
;1503:			{
line 1504
;1504:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1505
;1505:			client->ps.ammo[WP_SHOTGUN] = 25;
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 25
ASGNI4
line 1506
;1506:			}
LABELV $527
line 1508
;1507:			
;1508:			if (client->pers.h_grenade ) 
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $529
line 1509
;1509:			{
line 1510
;1510:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1511
;1511:			client->ps.ammo[WP_GRENADE_LAUNCHER] = 25;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 25
ASGNI4
line 1512
;1512:			}
LABELV $529
line 1514
;1513:
;1514:			if (client->pers.h_singcan) 
ADDRLP4 0
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $531
line 1515
;1515:			{
line 1516
;1516:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1517
;1517:			client->ps.ammo[WP_ROCKET_LAUNCHER] = 15;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 15
ASGNI4
line 1518
;1518:			}
LABELV $531
line 1520
;1519:			
;1520:			if (client->pers.h_flame) 
ADDRLP4 0
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $533
line 1521
;1521:			{
line 1522
;1522:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1523
;1523:			client->ps.ammo[WP_LIGHTNING] = 75;
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 75
ASGNI4
line 1524
;1524:			}
LABELV $533
line 1526
;1525:			
;1526:			if (client->pers.h_gauss) 
ADDRLP4 0
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $535
line 1527
;1527:			{
line 1528
;1528:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1529
;1529:			client->ps.ammo[WP_RAILGUN] = 10;
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 10
ASGNI4
line 1530
;1530:			}
LABELV $535
line 1532
;1531:	
;1532:			if (client->pers.h_plasma) 
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $537
line 1533
;1533:			{
line 1534
;1534:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1535
;1535:			client->ps.ammo[WP_PLASMAGUN] = 75;
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 75
ASGNI4
line 1536
;1536:			}
LABELV $537
line 1538
;1537:			
;1538:			if (client->pers.h_bfg) 
ADDRLP4 0
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $539
line 1539
;1539:			{
line 1540
;1540:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
ADDRLP4 3320
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1541
;1541:			client->ps.ammo[WP_BFG] = 15;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 15
ASGNI4
line 1542
;1542:			}
LABELV $539
line 1545
;1543:			//client->ps.stats[STAT_WEAPONS] = ( 1 << wn );
;1544:			//client->ps.ammo[wn] = INFINITE;
;1545:		}
LABELV $520
line 1547
;1546:
;1547:	}
LABELV $477
line 1553
;1548:
;1549:
;1550:
;1551:
;1552:	// don't allow full run speed for a bit
;1553:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1554
;1554:	client->ps.pm_time = 100;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1556
;1555:
;1556:	client->respawnTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2680
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1557
;1557:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 2684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1558
;1558:	client->latched_buttons = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2612
ADDP4
CNSTI4 0
ASGNI4
line 1561
;1559:
;1560:	// set default animations
;1561:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1562
;1562:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1564
;1563:
;1564:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $544
line 1565
;1565:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1566
;1566:	} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1568
;1567:		// fire the targets of the spawn point
;1568:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1572
;1569:
;1570:		// select the highest weapon number available, after any
;1571:		// spawn given items have fired
;1572:		client->ps.weapon = 1;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1573
;1573:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 4
CNSTI4 11
ASGNI4
LABELV $547
line 1574
;1574:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $551
line 1575
;1575:				client->ps.weapon = i;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1576
;1576:				break;
ADDRGP4 $549
JUMPV
LABELV $551
line 1578
;1577:			}
;1578:		}
LABELV $548
line 1573
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $547
LABELV $549
line 1579
;1579:	}
LABELV $545
line 1583
;1580:
;1581:	// run a client frame to drop exactly to the floor,
;1582:	// initialize animations and other things
;1583:	client->ps.commandTime = level.time - 100;
ADDRLP4 0
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1584
;1584:	client->pers.cmd.serverTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1585
;1585:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 924
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1588
;1586:
;1587:	// positively link the client, even if the command times are weird
;1588:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
EQI4 $555
line 1589
;1589:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1590
;1590:		VectorCopy( client->ps.origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1591
;1591:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1592
;1592:	}
LABELV $555
line 1595
;1593:
;1594:	// It seems that the values ARE already cleaned at respawn, but just to be sure -Vincent
;1595:	ent->r.svFlags &= ~SVF_CUSTOM_GRAVITY;
ADDRLP4 3320
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 3320
INDIRP4
ADDRLP4 3320
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 1596
;1596:	ent->r.svFlags &= ~SVF_CUSTOM_SPEED;
ADDRLP4 3324
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 3324
INDIRP4
ADDRLP4 3324
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1600
;1597:	// Above: Actual reset is done at immobilizer thinking (prevents double checking, was fixed there)... -Vincent
;1598:
;1599:	// run the presend to set anything else
;1600:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1603
;1601:
;1602:	// Shafe - Trep - Headshots -- Best give em their head back when they respawn
;1603:	client->noHead=qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 0
ASGNI4
line 1606
;1604:
;1605:	// This is probably going to screw everything up.
;1606:	client->pers.Eliminated = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1607
;1607:	client->pers.Frozen = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2488
ADDP4
CNSTI4 0
ASGNI4
line 1610
;1608:	
;1609:	// clear entity state values
;1610:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1611
;1611:}
LABELV $407
endproc ClientSpawn 3332 16
export BalanceTeams
proc BalanceTeams 16 8
line 1615
;1612:
;1613:
;1614:
;1615:team_t BalanceTeams(int team ) {
line 1619
;1616:
;1617:int		i;
;1618:int		c;	
;1619:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1622
;1620:int		t;	
;1621:
;1622:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1623
;1623:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $561
JUMPV
LABELV $558
line 1625
;1624:	
;1625:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $563
line 1626
;1626:			continue;
ADDRGP4 $559
JUMPV
LABELV $563
line 1628
;1627:		}
;1628:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $565
line 1630
;1629:			
;1630:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $567
line 1631
;1631:			{
line 1632
;1632:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1633
;1633:			} 
ADDRGP4 $568
JUMPV
LABELV $567
line 1635
;1634:			else 
;1635:			{ 
line 1636
;1636:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1637
;1637:			}
LABELV $568
line 1639
;1638:
;1639:		}
LABELV $565
line 1640
;1640:	}
LABELV $559
line 1623
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $561
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $558
line 1642
;1641:
;1642:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $569
line 1643
;1643:	{ 
line 1644
;1644:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1645
;1645:	}
LABELV $569
line 1647
;1646:
;1647:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $571
line 1648
;1648:	{	
line 1649
;1649:		t = level.clients[c].ps.persistant[PERS_SCORE];
ADDRLP4 12
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1650
;1650:		SetTeam(&g_entities[c], "red"); 
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1651
;1651:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1653
;1652:		//level.clients[c].sess.sessionTeam = TEAM_BLUE;
;1653:	}
LABELV $571
line 1655
;1654:	
;1655:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $573
line 1656
;1656:	{		
line 1657
;1657:		t = level.clients[c].ps.persistant[PERS_SCORE];	
ADDRLP4 12
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1658
;1658:		SetTeam(&g_entities[c], "blue"); 
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $305
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1659
;1659:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3492
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1661
;1660:		//level.clients[c].sess.sessionTeam = TEAM_RED;
;1661:	}
LABELV $573
line 1663
;1662:	
;1663:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $557
endproc BalanceTeams 16 8
export PlaceMC
proc PlaceMC 16 4
line 1676
;1664:	
;1665:}
;1666:
;1667:
;1668:
;1669: //ent->r.svFlags & SVF_BOT 
;1670:/*
;1671: When someone doesnt build an MC it builds one somewhere for em
;1672: This is a called it picks a player and puts it in their spot..
;1673: hopefully they'll move out of the way.
;1674: Quite a hack.. 
;1675:*/
;1676:team_t PlaceMC(int team ) {
line 1680
;1677:
;1678:int		i;
;1679:int		c;	
;1680:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1683
;1681:
;1682:
;1683:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1684
;1684:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $576
line 1686
;1685:	
;1686:		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
ADDRLP4 12
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $581
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $581
line 1687
;1687:			continue;
ADDRGP4 $577
JUMPV
LABELV $581
line 1689
;1688:		}
;1689:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $583
line 1691
;1690:			
;1691:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $585
line 1692
;1692:			{
line 1693
;1693:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1694
;1694:			} 
ADDRGP4 $586
JUMPV
LABELV $585
line 1696
;1695:			else 
;1696:			{ 
line 1697
;1697:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1698
;1698:			}
LABELV $586
line 1700
;1699:
;1700:		}
LABELV $583
line 1701
;1701:	}
LABELV $577
line 1684
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $579
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $576
line 1703
;1702:
;1703:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $587
line 1704
;1704:	{ 
line 1705
;1705:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1706
;1706:	}
LABELV $587
line 1708
;1707:
;1708:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $589
line 1709
;1709:	{	
line 1711
;1710:		// Set it down for the blue team
;1711:		BuildMC(&g_entities[c]);
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 1712
;1712:	}
LABELV $589
line 1714
;1713:	
;1714:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $591
line 1715
;1715:	{	
line 1717
;1716:		// set it down for the red team
;1717:		BuildMC(&g_entities[c]);
CNSTI4 924
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 1718
;1718:	}
LABELV $591
line 1720
;1719:	
;1720:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $575
endproc PlaceMC 16 4
export ClientDisconnect
proc ClientDisconnect 28 20
line 1739
;1721:	
;1722:}
;1723:
;1724:
;1725:
;1726:
;1727:/*
;1728:===========
;1729:ClientDisconnect
;1730:
;1731:Called when a player drops from the server.
;1732:Will not be called between levels.
;1733:
;1734:This should NOT be called directly by any game logic,
;1735:call trap_DropClient(), which will call this and do
;1736:server system housekeeping.
;1737:============
;1738:*/
;1739:void ClientDisconnect( int clientNum ) {
line 1746
;1740:	gentity_t	*ent;
;1741:	gentity_t	*tent;
;1742:	int			i;
;1743:
;1744:	// cleanup if we are kicking a bot that
;1745:	// hasn't spawned yet
;1746:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1748
;1747:
;1748:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1749
;1749:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $594
line 1750
;1750:		return;
ADDRGP4 $593
JUMPV
LABELV $594
line 1754
;1751:	}
;1752:
;1753:	// stop any following clients
;1754:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $599
JUMPV
LABELV $596
line 1755
;1755:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 3492
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
NEI4 $601
ADDRLP4 12
INDIRP4
CNSTI4 2572
ADDP4
INDIRI4
CNSTI4 2
NEI4 $601
ADDRLP4 12
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $601
line 1757
;1756:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1757:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1758
;1758:			StopFollowing( &g_entities[i] );
CNSTI4 924
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1759
;1759:		}
LABELV $601
line 1760
;1760:	}
LABELV $597
line 1754
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $599
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $596
line 1763
;1761:
;1762:	// send effect if they were completely connected
;1763:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $603
ADDRLP4 12
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 3
EQI4 $603
line 1764
;1764:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1765
;1765:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 44
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1766
;1766:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 168
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1770
;1767:
;1768:		// They don't get to take powerups with them!
;1769:		// Especially important for stuff like CTF flags
;1770:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1778
;1771:#ifdef MISSIONPACK
;1772:		TossClientPersistantPowerups( ent );
;1773:		if( g_gametype.integer == GT_HARVESTER ) {
;1774:			TossClientCubes( ent );
;1775:		}
;1776:#endif
;1777:
;1778:	}
LABELV $603
line 1780
;1779:
;1780:	 G_LogPrintf( "ClientDisconnect: %i [%s] (%s) \"%s\"\n", clientNum, ent->client->pers.ip, ent->client->pers.guid, ent->client->pers.netname );
ADDRGP4 $605
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 2537
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 2504
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1783
;1781:	 //G_LogPrintf( "ClientDisconnect: %i \"%s\"\n", clientNum, ent->client->pers.netname );
;1782:	// if we are playing in tourney mode and losing, give a win to the other player
;1783:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $606
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 level+9140
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $606
ADDRGP4 level+16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $606
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $606
line 1785
;1784:		&& !level.intermissiontime
;1785:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1786
;1786:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 24
CNSTI4 3492
ADDRGP4 level+96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2580
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1787
;1787:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+96
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1788
;1788:	}
LABELV $606
line 1790
;1789:
;1790:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1791
;1791:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1792
;1792:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 0
ASGNI4
line 1793
;1793:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $615
ASGNP4
line 1794
;1794:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1795
;1795:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1796
;1796:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2564
ADDP4
CNSTI4 0
ASGNI4
line 1798
;1797:
;1798:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $616
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1800
;1799:
;1800:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1802
;1801:
;1802:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $617
line 1803
;1803:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1804
;1804:	}
LABELV $617
line 1805
;1805:}
LABELV $593
endproc ClientDisconnect 28 20
import SelectRandomTeamSpawnPoint
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
import trap_AAS_AreaLadder
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
import trep_debug
import g_allowDevastator
import g_allowGrapple
import g_CurrentRound
import g_NumRounds
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_easymap
import g_mapfile
import g_ReverseCTF
import g_GaussRate
import g_GaussSelfDamage
import g_GaussKnockBack
import g_GaussJump
import g_PCTeamkills
import g_GrappleMode
import g_MaxTurrets
import g_Turrets
import g_StartRandom
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_RedMC
import g_BlueMC
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
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
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
import Team_Point
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
import fire_flamer
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import CalculateRanks
import AddScore
import player_die
import InitClientResp
import InitClientPersistant
import BeginIntermission
import BuildDisplacer
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
import G_BreakGlass
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_mg
import fire_turret
import fire_alt_gata
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_bomb
import fire_pdgrenade
import fire_grenade
import fire_plasma2
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
import G_ExplodeBomb
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
import BG_FindItemForAmmo
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
LABELV $616
byte 1 0
align 1
LABELV $615
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $605
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $469
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 105
byte 1 98
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $445
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $444
byte 1 45
byte 1 103
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $406
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $405
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $360
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 68
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $356
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $353
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $352
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $340
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 0
align 1
LABELV $337
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $335
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $330
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $327
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $324
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $321
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
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
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $320
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $319
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $316
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
LABELV $315
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
LABELV $314
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $313
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $312
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $308
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $306
byte 1 98
byte 1 0
align 1
LABELV $305
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $301
byte 1 114
byte 1 0
align 1
LABELV $300
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $297
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $291
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
LABELV $290
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $289
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
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
LABELV $288
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $281
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $280
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $275
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $270
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $269
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 108
byte 1 79
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $268
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 109
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $267
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $263
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 109
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 78
byte 1 117
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $257
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $256
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $253
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $252
byte 1 92
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 92
byte 1 98
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $248
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $146
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $64
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $60
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $57
byte 1 48
byte 1 0
align 1
LABELV $56
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
