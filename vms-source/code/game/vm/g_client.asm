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
;1:// Copyright (C) 1999-2000 Id Software, Inc.
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
CNSTI4 916
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
line 201
;200:			//G_Error( "Couldn't find a spawn point" );  // This is a workaround for skarekrows maps
;201:			G_Printf("Unable To Locate Spawnpoint using CTF Spawns as fallback.\n");
ADDRGP4 $127
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 202
;202:			Com_Printf( "Unable To Locate Spawnpoint using CTF Spawns as fallback.");
ADDRGP4 $128
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 203
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
LABELV $129
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
ADDRGP4 $132
JUMPV
LABELV $131
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
EQI4 $134
line 276
;276:			break;
ADDRGP4 $133
JUMPV
LABELV $134
line 278
;277:		}
;278:	}
LABELV $132
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
NEU4 $131
LABELV $133
line 280
;279:
;280:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $138
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
EQI4 $136
LABELV $138
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
ADDRGP4 $130
JUMPV
LABELV $136
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
LABELV $130
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
LABELV $139
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
LABELV $144
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
ADDRGP4 $148
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
LABELV $145
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
LTI4 $144
line 330
;330:}
LABELV $142
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
LEI4 $151
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
ADDRGP4 $150
JUMPV
LABELV $151
line 346
;345:	}
;346:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 696
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
LABELV $150
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
EQU4 $156
line 371
;371:		return;
ADDRGP4 $155
JUMPV
LABELV $156
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
CNSTI4 916
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
NEI4 $163
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
ADDRGP4 $164
JUMPV
LABELV $163
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
LABELV $164
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
LTI4 $166
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $166
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $172
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $172
address $169
address $169
address $170
address $170
address $171
address $171
code
LABELV $169
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
ADDRGP4 $167
JUMPV
LABELV $170
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
ADDRGP4 $167
JUMPV
LABELV $171
LABELV $166
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
LABELV $167
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
CNSTI4 696
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
CNSTI4 708
ADDP4
ADDRGP4 BodySink
ASGNP4
line 446
;445:
;446:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 body_die
ASGNP4
line 449
;447:
;448:	// don't take more damage if already gibbed
;449:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $174
line 450
;450:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 451
;451:	} else {
ADDRGP4 $175
JUMPV
LABELV $174
line 452
;452:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 453
;453:	}
LABELV $175
line 456
;454:
;455:	// Shafe - Trep - Headshots
;456:	if(ent->client->noHead) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $176
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
LABELV $176
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
LABELV $155
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
LABELV $179
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
LABELV $180
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
LTI4 $179
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
LABELV $178
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
LABELV $183
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
ADDRGP4 $188
JUMPV
LABELV $185
line 516
;516:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $190
line 517
;517:			continue;
ADDRGP4 $186
JUMPV
LABELV $190
line 519
;518:		}
;519:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3464
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
NEI4 $192
line 520
;520:			continue;
ADDRGP4 $186
JUMPV
LABELV $192
line 522
;521:		}
;522:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $194
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
LABELV $194
line 525
;525:	}
LABELV $186
line 515
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $188
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $185
line 527
;526:
;527:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $184
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
ADDRGP4 $200
JUMPV
LABELV $197
line 541
;541:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3464
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
NEI4 $202
line 542
;542:			continue;
ADDRGP4 $198
JUMPV
LABELV $202
line 544
;543:		}
;544:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $204
line 545
;545:			if ( level.clients[i].sess.teamLeader )
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $206
line 546
;546:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $196
JUMPV
LABELV $206
line 547
;547:		}
LABELV $204
line 548
;548:	}
LABELV $198
line 540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $197
line 550
;549:
;550:	return -1;
CNSTI4 -1
RETI4
LABELV $196
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
line 563
;561:	int		counts[TEAM_NUM_TEAMS];
;562:
;563:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
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
line 564
;564:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
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
line 566
;565:
;566:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $211
line 567
;567:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $208
JUMPV
LABELV $211
line 569
;568:	}
;569:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $215
line 570
;570:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $208
JUMPV
LABELV $215
line 573
;571:	}
;572:	// equal team count, so join the team with the lowest score
;573:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+52+8
INDIRI4
ADDRGP4 level+52+4
INDIRI4
LEI4 $219
line 574
;574:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $208
JUMPV
LABELV $219
line 576
;575:	}
;576:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $208
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 604
;577:}
;578:
;579:/*
;580:===========
;581:ForceClientSkin
;582:
;583:Forces a client's skin (for teamplay)
;584:===========
;585:*/
;586:/*
;587:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;588:	char *p;
;589:
;590:	if ((p = Q_strrchr(model, '/')) != 0) {
;591:		*p = 0;
;592:	}
;593:
;594:	Q_strcat(model, MAX_QPATH, "/");
;595:	Q_strcat(model, MAX_QPATH, skin);
;596:}
;597:*/
;598:
;599:/*
;600:===========
;601:ClientCheckName
;602:============
;603:*/
;604:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 611
;605:	int		len, colorlessLen;
;606:	char	ch;
;607:	char	*p;
;608:	int		spaces;
;609:
;610:	//save room for trailing null byte
;611:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 613
;612:
;613:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 614
;614:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 615
;615:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 616
;616:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 617
;617:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $226
line 619
;618:
;619:	while( 1 ) {
line 620
;620:		ch = *in++;
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
line 621
;621:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $229
line 622
;622:			break;
ADDRGP4 $228
JUMPV
LABELV $229
line 626
;623:		}
;624:
;625:		// don't allow leading spaces
;626:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $231
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $231
line 627
;627:			continue;
ADDRGP4 $227
JUMPV
LABELV $231
line 631
;628:		}
;629:
;630:		// check colors
;631:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $233
line 633
;632:			// solo trailing carat is not a color prefix
;633:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $235
line 634
;634:				break;
ADDRGP4 $228
JUMPV
LABELV $235
line 638
;635:			}
;636:
;637:			// don't allow black in a name, period
;638:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $237
line 639
;639:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 640
;640:				continue;
ADDRGP4 $227
JUMPV
LABELV $237
line 644
;641:			}
;642:
;643:			// make sure room in dest for both chars
;644:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $239
line 645
;645:				break;
ADDRGP4 $228
JUMPV
LABELV $239
line 648
;646:			}
;647:
;648:			*out++ = ch;
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
line 649
;649:			*out++ = *in++;
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
line 650
;650:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 651
;651:			continue;
ADDRGP4 $227
JUMPV
LABELV $233
line 655
;652:		}
;653:
;654:		// don't allow too many consecutive spaces
;655:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $241
line 656
;656:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 657
;657:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $242
line 658
;658:				continue;
ADDRGP4 $227
JUMPV
line 660
;659:			}
;660:		}
LABELV $241
line 661
;661:		else {
line 662
;662:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 663
;663:		}
LABELV $242
line 665
;664:
;665:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $245
line 666
;666:			break;
ADDRGP4 $228
JUMPV
LABELV $245
line 669
;667:		}
;668:
;669:		*out++ = ch;
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
line 670
;670:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 671
;671:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 672
;672:	}
LABELV $227
line 619
ADDRGP4 $226
JUMPV
LABELV $228
line 673
;673:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 676
;674:
;675:	// don't allow empty names
;676:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $249
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $247
LABELV $249
line 677
;677:		Q_strncpyz( p, "UnnamedPlayer", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $250
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 678
;678:	}
LABELV $247
line 679
;679:}
LABELV $225
endproc ClientCleanName 40 12
export ClientUserinfoChanged
proc ClientUserinfoChanged 6436 56
line 693
;680:
;681:
;682:/*
;683:===========
;684:ClientUserInfoChanged
;685:
;686:Called from ClientConnect when the player first connects and
;687:directly by the server system when the player updates a userinfo variable.
;688:
;689:The game can override any of the settings and call trap_SetUserinfo
;690:if desired.
;691:============
;692:*/
;693:void ClientUserinfoChanged( int clientNum ) {
line 707
;694:	gentity_t *ent;
;695:	int		teamTask, teamLeader, team, health;
;696:	char	*s;
;697:	char	model[MAX_QPATH];
;698:	char	headModel[MAX_QPATH];
;699:	char	oldname[MAX_STRING_CHARS];
;700:	gclient_t	*client;
;701:	char	c1[MAX_INFO_STRING];
;702:	char	c2[MAX_INFO_STRING];
;703:	char	redTeam[MAX_INFO_STRING];
;704:	char	blueTeam[MAX_INFO_STRING];
;705:	char	userinfo[MAX_INFO_STRING];
;706:
;707:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 708
;708:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 710
;709:
;710:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 713
;711:
;712:	// check for malformed or illegal info strings
;713:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 8
ARGP4
ADDRLP4 6300
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
NEI4 $252
line 714
;714:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 8
ARGP4
ADDRGP4 $254
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 715
;715:	}
LABELV $252
line 718
;716:
;717:	// check for local client
;718:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 8
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 6304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6304
INDIRP4
ASGNP4
line 719
;719:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 6308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6308
INDIRI4
CNSTI4 0
NEI4 $256
line 720
;720:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 721
;721:	}
LABELV $256
line 724
;722:
;723:	// check the item prediction
;724:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 8
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 6312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6312
INDIRP4
ASGNP4
line 725
;725:	if ( !atoi( s ) ) {
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
NEI4 $260
line 726
;726:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 727
;727:	} else {
ADDRGP4 $261
JUMPV
LABELV $260
line 728
;728:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 729
;729:	}
LABELV $261
line 733
;730:
;731://unlagged - client options
;732:	// see if the player has opted out
;733:	s = Info_ValueForKey( userinfo, "cg_delag" );
ADDRLP4 8
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 6320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6320
INDIRP4
ASGNP4
line 734
;734:	if ( !atoi( s ) ) {
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
NEI4 $263
line 735
;735:		client->pers.delag = 0;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 736
;736:	} else {
ADDRGP4 $264
JUMPV
LABELV $263
line 737
;737:		client->pers.delag = atoi( s );
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
line 738
;738:	}
LABELV $264
line 741
;739:
;740:	// see if the player is nudging his shots
;741:	s = Info_ValueForKey( userinfo, "cg_cmdTimeNudge" );
ADDRLP4 8
ARGP4
ADDRGP4 $265
ARGP4
ADDRLP4 6328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6328
INDIRP4
ASGNP4
line 742
;742:	client->pers.cmdTimeNudge = atoi( s );
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
line 745
;743:
;744:	// see if the player wants to debug the backward reconciliation
;745:	s = Info_ValueForKey( userinfo, "cg_debugDelag" );
ADDRLP4 8
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6336
INDIRP4
ASGNP4
line 746
;746:	if ( !atoi( s ) ) {
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
NEI4 $267
line 747
;747:		client->pers.debugDelag = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 748
;748:	}
ADDRGP4 $268
JUMPV
LABELV $267
line 749
;749:	else {
line 750
;750:		client->pers.debugDelag = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 751
;751:	}
LABELV $268
line 754
;752:
;753:	// see if the player is simulating incoming latency
;754:	s = Info_ValueForKey( userinfo, "cg_latentSnaps" );
ADDRLP4 8
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6344
INDIRP4
ASGNP4
line 755
;755:	client->pers.latentSnaps = atoi( s );
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
line 758
;756:
;757:	// see if the player is simulating outgoing latency
;758:	s = Info_ValueForKey( userinfo, "cg_latentCmds" );
ADDRLP4 8
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 6352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6352
INDIRP4
ASGNP4
line 759
;759:	client->pers.latentCmds = atoi( s );
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
line 762
;760:
;761:	// see if the player is simulating outgoing packet loss
;762:	s = Info_ValueForKey( userinfo, "cg_plOut" );
ADDRLP4 8
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6360
INDIRP4
ASGNP4
line 763
;763:	client->pers.plOut = atoi( s );
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
line 767
;764://unlagged - client options
;765:
;766:	// set name
;767:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
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
line 768
;768:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 8
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 6368
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6368
INDIRP4
ASGNP4
line 769
;769:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
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
line 771
;770:
;771:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $273
line 772
;772:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $275
line 773
;773:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 $277
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 774
;774:		}
LABELV $275
line 775
;775:	}
LABELV $273
line 777
;776:
;777:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $278
line 778
;778:		if ( strcmp( oldname, client->pers.netname ) ) {
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
EQI4 $280
line 779
;779:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, 
ADDRGP4 $282
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
line 781
;780:				client->pers.netname) );
;781:		}
LABELV $280
line 782
;782:	}
LABELV $278
line 796
;783:
;784:	// set max health
;785:#ifdef MISSIONPACK
;786:	if (client->ps.powerups[PW_GUARD]) {
;787:		client->pers.maxHealth = 200;
;788:	} else {
;789:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
;790:		client->pers.maxHealth = health;
;791:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
;792:			client->pers.maxHealth = 100;
;793:		}
;794:	}
;795:#else
;796:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $283
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
line 797
;797:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 2196
INDIRI4
ASGNI4
line 798
;798:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
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
LTI4 $286
ADDRLP4 6380
INDIRI4
CNSTI4 100
LEI4 $284
LABELV $286
line 799
;799:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 800
;800:	}
LABELV $284
line 802
;801:#endif
;802:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
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
line 805
;803:
;804:	// set model
;805:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $287
line 806
;806:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
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
line 807
;807:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
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
line 808
;808:	} else {
ADDRGP4 $288
JUMPV
LABELV $287
line 809
;809:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 8
ARGP4
ADDRGP4 $292
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
line 810
;810:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
ADDRLP4 8
ARGP4
ADDRGP4 $293
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
line 811
;811:	}
LABELV $288
line 814
;812:
;813:	// bots set their team a few frames later
;814:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $294
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $294
line 815
;815:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 8
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6388
INDIRP4
ASGNP4
line 816
;816:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 6392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6392
INDIRI4
CNSTI4 0
EQI4 $304
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $303
ARGP4
ADDRLP4 6396
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6396
INDIRI4
CNSTI4 0
NEI4 $300
LABELV $304
line 817
;817:			team = TEAM_RED;
ADDRLP4 4248
CNSTI4 1
ASGNI4
line 818
;818:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $295
JUMPV
LABELV $300
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 6400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6400
INDIRI4
CNSTI4 0
EQI4 $309
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $308
ARGP4
ADDRLP4 6404
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6404
INDIRI4
CNSTI4 0
NEI4 $305
LABELV $309
line 819
;819:			team = TEAM_BLUE;
ADDRLP4 4248
CNSTI4 2
ASGNI4
line 820
;820:		} else {
ADDRGP4 $295
JUMPV
LABELV $305
line 822
;821:			// pick the team with the least number of players
;822:			team = PickTeam( clientNum );
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
line 823
;823:		}
line 824
;824:	}
ADDRGP4 $295
JUMPV
LABELV $294
line 825
;825:	else {
line 826
;826:		team = client->sess.sessionTeam;
ADDRLP4 4248
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 827
;827:	}
LABELV $295
line 863
;828:
;829:/*	NOTE: all client side now
;830:
;831:	// team
;832:	switch( team ) {
;833:	case TEAM_RED:
;834:		ForceClientSkin(client, model, "red");
;835://		ForceClientSkin(client, headModel, "red");
;836:		break;
;837:	case TEAM_BLUE:
;838:		ForceClientSkin(client, model, "blue");
;839://		ForceClientSkin(client, headModel, "blue");
;840:		break;
;841:	}
;842:	// don't ever use a default skin in teamplay, it would just waste memory
;843:	// however bots will always join a team but they spawn in as spectator
;844:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;845:		ForceClientSkin(client, model, "red");
;846://		ForceClientSkin(client, headModel, "red");
;847:	}
;848:*/
;849:
;850:#ifdef MISSIONPACK
;851:	if (g_gametype.integer >= GT_TEAM) {
;852:		client->pers.teamInfo = qtrue;
;853:	} else {
;854:		s = Info_ValueForKey( userinfo, "teamoverlay" );
;855:		if ( ! *s || atoi( s ) != 0 ) {
;856:			client->pers.teamInfo = qtrue;
;857:		} else {
;858:			client->pers.teamInfo = qfalse;
;859:		}
;860:	}
;861:#else
;862:	// teamInfo
;863:	s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 8
ARGP4
ADDRGP4 $310
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6388
INDIRP4
ASGNP4
line 864
;864:	if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $313
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
EQI4 $311
LABELV $313
line 865
;865:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 866
;866:	} else {
ADDRGP4 $312
JUMPV
LABELV $311
line 867
;867:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 868
;868:	}
LABELV $312
line 881
;869:#endif
;870:	/*
;871:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;872:	if ( !*s || atoi( s ) == 0 ) {
;873:		client->pers.pmoveFixed = qfalse;
;874:	}
;875:	else {
;876:		client->pers.pmoveFixed = qtrue;
;877:	}
;878:	*/
;879:
;880:	// team task (0 = none, 1 = offence, 2 = defence)
;881:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 8
ARGP4
ADDRGP4 $314
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
line 883
;882:	// team Leader (1 = leader, 0 is normal player)
;883:	teamLeader = client->sess.teamLeader;
ADDRLP4 2192
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
ASGNI4
line 886
;884:
;885:	// colors
;886:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 8
ARGP4
ADDRGP4 $315
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
line 887
;887:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 8
ARGP4
ADDRGP4 $316
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
line 889
;888:
;889:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 8
ARGP4
ADDRGP4 $317
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
line 890
;890:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 8
ARGP4
ADDRGP4 $318
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
line 894
;891:
;892:	// send over a subset of the userinfo keys so other clients can
;893:	// print scoreboards, display models, and play custom sounds
;894:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $319
line 895
;895:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 8
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 6424
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $321
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
CNSTI4 2568
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2572
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
line 899
;896:			client->pers.netname, team, model, headModel, c1, c2, 
;897:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;898:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;899:	} else {
ADDRGP4 $320
JUMPV
LABELV $319
line 900
;900:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $323
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 2552
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
CNSTI4 2568
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2572
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
line 903
;901:			client->pers.netname, client->sess.sessionTeam, model, headModel, redTeam, blueTeam, c1, c2, 
;902:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;903:	}
LABELV $320
line 905
;904:
;905:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
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
line 907
;906:
;907:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $324
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
line 908
;908:}
LABELV $251
endproc ClientUserinfoChanged 6436 56
export ClientConnect
proc ClientConnect 1100 12
line 931
;909:
;910:
;911:/*
;912:===========
;913:ClientConnect
;914:
;915:Called when a player begins connecting to the server.
;916:Called again for every map change or tournement restart.
;917:
;918:The session information will be valid after exit.
;919:
;920:Return NULL if the client should be allowed, otherwise return
;921:a string with the reason for denial.
;922:
;923:Otherwise, the client will be sent the current gamestate
;924:and will eventually get to ClientBegin.
;925:
;926:firstTime will be qtrue the very first time a client connects
;927:to the server machine, but qfalse on map changes and tournement
;928:restarts.
;929:============
;930:*/
;931:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 938
;932:	char		*value;
;933://	char		*areabits;
;934:	gclient_t	*client;
;935:	char		userinfo[MAX_INFO_STRING];
;936:	gentity_t	*ent;
;937:	char		guid[ 33 ];
;938:	ent = &g_entities[ clientNum ];
ADDRLP4 1032
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 940
;939:
;940:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 943
;941:
;942:	// Admin System
;943:	value = Info_ValueForKey( userinfo, "cl_guid" );
ADDRLP4 8
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 1072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1072
INDIRP4
ASGNP4
line 944
;944:	Q_strncpyz( guid, value, sizeof( guid ) );
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
line 947
;945:
;946:	// check to see if they are on the banned IP list
;947:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 8
ARGP4
ADDRGP4 $255
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1076
INDIRP4
ASGNP4
line 948
;948:	if ( G_FilterPacket( value ) ) {
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
EQI4 $327
line 949
;949:		return "Banned.";
ADDRGP4 $329
RETP4
ADDRGP4 $325
JUMPV
LABELV $327
line 952
;950:	}
;951:
;952:	if ( !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $330
line 954
;953:		// check for a password
;954:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 8
ARGP4
ADDRGP4 $332
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1084
INDIRP4
ASGNP4
line 955
;955:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $333
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $333
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
EQI4 $333
line 956
;956:			strcmp( g_password.string, value) != 0) {
line 957
;957:			return "Invalid password";
ADDRGP4 $339
RETP4
ADDRGP4 $325
JUMPV
LABELV $333
line 959
;958:		}
;959:	}
LABELV $330
line 962
;960:
;961:	// they can connect
;962:	ent->client = level.clients + clientNum;
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3464
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 963
;963:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 967
;964:
;965://	areabits = client->areabits;
;966:
;967:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3464
ARGI4
ADDRGP4 memset
CALLP4
pop
line 972
;968:
;969:
;970:
;971:  // add guid to session so we don't have to keep parsing userinfo everywhere /*
;972:  if( !guid[0] )
ADDRLP4 1036
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $340
line 973
;973:  {
line 974
;974:    Q_strncpyz( client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ARGP4
ADDRGP4 $342
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 976
;975:      sizeof( client->pers.guid ) );
;976:  }
ADDRGP4 $341
JUMPV
LABELV $340
line 978
;977:  else
;978:  {
line 979
;979:    Q_strncpyz( client->pers.guid, guid, sizeof( client->pers.guid ) );
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 980
;980:  }
LABELV $341
line 987
;981:	/* Admin System TJW
;982:	Q_strncpyz( client->pers.ip, ip, sizeof( client->pers.ip ) );
;983:	client->pers.adminLevel = G_admin_level( ent );
;984:	*/
;985:  
;986:
;987:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 990
;988:
;989:	// read or initialize the session data
;990:	if ( firstTime || level.newSession ) {
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1084
INDIRI4
NEI4 $346
ADDRGP4 level+76
INDIRI4
ADDRLP4 1084
INDIRI4
EQI4 $343
LABELV $346
line 991
;991:		G_InitSessionData( client, userinfo );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
line 992
;992:	}
LABELV $343
line 993
;993:	G_ReadSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 995
;994:
;995:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $347
line 996
;996:		ent->r.svFlags |= SVF_BOT;
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
line 997
;997:		ent->inuse = qtrue;
ADDRLP4 1032
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 998
;998:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $352
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $353
JUMPV
LABELV $352
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $353
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
NEI4 $349
line 999
;999:			return "BotConnectfailed";
ADDRGP4 $354
RETP4
ADDRGP4 $325
JUMPV
LABELV $349
line 1001
;1000:		}
;1001:	}
LABELV $347
line 1004
;1002:
;1003:	// get and distribute relevent paramters
;1004:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $355
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1005
;1005:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1008
;1006:
;1007:	// don't do the "xxx connected" messages if they were caried over from previous level
;1008:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $356
line 1009
;1009:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
ADDRGP4 $358
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
line 1010
;1010:	}
LABELV $356
line 1012
;1011:
;1012:	if ( g_gametype.integer >= GT_TEAM &&
ADDRLP4 1088
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1088
INDIRI4
LTI4 $359
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $359
line 1013
;1013:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1014
;1014:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1015
;1015:	}
LABELV $359
line 1018
;1016:
;1017:	// count current clients and rank for scoreboard
;1018:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1027
;1019:
;1020:	// for statistics
;1021://	client->areabits = areabits;
;1022://	if ( !client->areabits )
;1023://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1024:
;1025://unlagged - backward reconciliation #5
;1026:	// announce it
;1027:	trap_SendServerCommand( clientNum, "print \"Trepidation Development Build 05-12-07\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $362
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1028
;1028:	if ( g_delagHitscan.integer ) {
ADDRGP4 g_delagHitscan+12
INDIRI4
CNSTI4 0
EQI4 $363
line 1030
;1029://		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is ON!\n\"" );
;1030:	}
LABELV $363
line 1031
;1031:	else {
line 1033
;1032://		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is OFF!\n\"" );
;1033:	}
LABELV $364
line 1036
;1034://unlagged - backward reconciliation #5
;1035:
;1036:	return NULL;
CNSTP4 0
RETP4
LABELV $325
endproc ClientConnect 1100 12
export ClientBegin
proc ClientBegin 28 12
line 1048
;1037:}
;1038:
;1039:/*
;1040:===========
;1041:ClientBegin
;1042:
;1043:called when a client has finished connecting, and is ready
;1044:to be placed into the level.  This will happen every level load,
;1045:and on transition between teams, but doesn't happen on respawns
;1046:============
;1047:*/
;1048:void ClientBegin( int clientNum ) {
line 1054
;1049:	gentity_t	*ent;
;1050:	gclient_t	*client;
;1051:	gentity_t	*tent;
;1052:	int			flags;
;1053:
;1054:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1056
;1055:
;1056:	client = level.clients + clientNum;
ADDRLP4 0
CNSTI4 3464
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1058
;1057:
;1058:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $367
line 1059
;1059:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1060
;1060:	}
LABELV $367
line 1061
;1061:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1062
;1062:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
CNSTP4 0
ASGNP4
line 1063
;1063:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 1064
;1064:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1066
;1065:
;1066:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 1067
;1067:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1068
;1068:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 1075
;1069:
;1070:	// save eflags around this, because changing teams will
;1071:	// cause this to happen with a valid entity, and we
;1072:	// want to make sure the teleport bit is set right
;1073:	// so the viewpoint doesn't interpolate through the
;1074:	// world to the new position
;1075:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1076
;1076:	memset( &client->ps, 0, sizeof( client->ps ) );
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
line 1077
;1077:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1080
;1078:
;1079:	// Set What Weapons Are Allow for Arsenal
;1080:	if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $370
line 1081
;1081:	{
line 1083
;1082:			// Set Starting Weapons
;1083:		if (g_StartGauntlet.integer > 0) { client->pers.h_gauntlet = qtrue; }
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
line 1084
;1084:		if (g_StartMG.integer > 0) { client->pers.h_mg = qtrue; }
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
line 1085
;1085:		if (g_StartSG.integer > 0) { client->pers.h_sg = qtrue; }
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
line 1086
;1086:		if (g_StartGrenade.integer > 0) { client->pers.h_grenade = qtrue; }
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
line 1087
;1087:		if (g_StartSingCan.integer > 0) { client->pers.h_singcan = qtrue; }
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
line 1088
;1088:		if (g_StartFlame.integer > 0) { client->pers.h_flame = qtrue; }
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
line 1089
;1089:		if (g_StartGauss.integer > 0) { client->pers.h_gauss = qtrue; }
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
line 1090
;1090:		if (g_StartPlasma.integer > 0) { client->pers.h_plasma = qtrue;}
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
line 1091
;1091:		if (g_StartBFG.integer > 0) { client->pers.h_bfg = qtrue;}
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
line 1092
;1092:	}
LABELV $370
line 1093
;1093:	client->pers.Eliminated = qfalse;  // They are not eliminated
ADDRLP4 0
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1097
;1094:	// End Arsenal
;1095:
;1096:	// locate ent at a spawn point
;1097:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1099
;1098:
;1099:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $400
line 1101
;1100:		// send event
;1101:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
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
line 1102
;1102:		tent->s.clientNum = ent->s.clientNum;
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
line 1104
;1103:
;1104:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $402
line 1105
;1105:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
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
line 1106
;1106:		}
LABELV $402
line 1107
;1107:	}
LABELV $400
line 1108
;1108:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $406
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1111
;1109:
;1110:	// count current clients and rank for scoreboard
;1111:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1112
;1112:}
LABELV $366
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 3312 16
line 1125
;1113:
;1114:
;1115:
;1116:/*
;1117:===========
;1118:ClientSpawn
;1119:
;1120:Called every time a client is placed fresh in the world:
;1121:after the first ClientBegin, and after each respawn
;1122:Initializes all non-persistant parts of playerState
;1123:============
;1124:*/
;1125:void ClientSpawn(gentity_t *ent) {
line 1142
;1126:	int		index;
;1127:	vec3_t	spawn_origin, spawn_angles;
;1128:	gclient_t	*client;
;1129:	int		i;
;1130:	clientPersistant_t	saved;
;1131:	clientSession_t		savedSess;
;1132:	int		persistant[MAX_PERSISTANT];
;1133:	gentity_t	*spawnPoint;
;1134:	int		flags;
;1135:	int		savedPing;
;1136://	char	*savedAreaBits;
;1137:	int		accuracy_hits, accuracy_shots;
;1138:	int		eventSequence;
;1139:	char	userinfo[MAX_INFO_STRING];
;1140:	int		wpn;
;1141:
;1142:	index = ent - g_entities;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ASGNI4
line 1143
;1143:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1148
;1144:
;1145:	// find a spawn point
;1146:	// do it before setting health back up, so farthest
;1147:	// ranging doesn't count this client
;1148:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $408
line 1149
;1149:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3264
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3264
INDIRP4
ASGNP4
line 1151
;1150:						spawn_origin, spawn_angles);
;1151:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $409
JUMPV
LABELV $408
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $410
line 1153
;1152:		// all base oriented team games use the CTF spawn points
;1153:		spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3268
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3268
INDIRP4
ASGNP4
line 1157
;1154:						client->sess.sessionTeam, 
;1155:						client->pers.teamState.state, 
;1156:						spawn_origin, spawn_angles);
;1157:	} else {
ADDRGP4 $411
JUMPV
LABELV $410
LABELV $413
line 1158
;1158:		do {
line 1160
;1159:			// the first spawn should be at a good looking spot
;1160:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 3268
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 3268
INDIRI4
NEI4 $416
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 3268
INDIRI4
EQI4 $416
line 1161
;1161:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1162
;1162:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3272
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3272
INDIRP4
ASGNP4
line 1163
;1163:			} else {
ADDRGP4 $417
JUMPV
LABELV $416
line 1165
;1164:				// don't spawn near existing origin if possible
;1165:				spawnPoint = SelectSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3272
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3272
INDIRP4
ASGNP4
line 1168
;1166:					client->ps.origin, 
;1167:					spawn_origin, spawn_angles);
;1168:			}
LABELV $417
line 1172
;1169:
;1170:			// Tim needs to prevent bots from spawning at the initial point
;1171:			// on q3dm0...
;1172:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 3272
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 3272
INDIRI4
EQI4 $418
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3272
INDIRI4
EQI4 $418
line 1173
;1173:				continue;	// try again
ADDRGP4 $414
JUMPV
LABELV $418
line 1176
;1174:			}
;1175:			// just to be symetric, we have a nohumans option...
;1176:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 3276
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 3276
INDIRI4
EQI4 $415
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3276
INDIRI4
NEI4 $415
line 1177
;1177:				continue;	// try again
line 1180
;1178:			}
;1179:
;1180:			break;
LABELV $414
line 1182
;1181:
;1182:		} while ( 1 );
ADDRGP4 $413
JUMPV
LABELV $415
line 1183
;1183:	}
LABELV $411
LABELV $409
line 1184
;1184:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 1191
;1185:
;1186:	// always clear the kamikaze flag
;1187:	/* ent->s.eFlags &= ~EF_KAMIKAZE; */
;1188:
;1189:	// toggle the teleport bit so the client knows to not lerp
;1190:	// and never clear the voted flag
;1191:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1192
;1192:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1196
;1193:
;1194://unlagged - backward reconciliation #3
;1195:	// we don't want players being backward-reconciled to the place they died
;1196:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 1198
;1197:	// and this is as good a time as any to clear the saved state
;1198:	ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3452
ADDP4
CNSTI4 0
ASGNI4
line 1203
;1199://unlagged - backward reconciliation #3
;1200:
;1201:	// clear everything but the persistant data
;1202:
;1203:	saved = client->pers;
ADDRLP4 1132
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 2084
line 1204
;1204:	savedSess = client->sess;
ADDRLP4 3216
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRB
ASGNB 28
line 1205
;1205:	savedPing = client->ps.ping;
ADDRLP4 3244
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1207
;1206://	savedAreaBits = client->areabits;
;1207:	accuracy_hits = client->accuracy_hits;
ADDRLP4 3248
ADDRLP4 4
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
ASGNI4
line 1208
;1208:	accuracy_shots = client->accuracy_shots;
ADDRLP4 3252
ADDRLP4 4
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
ASGNI4
line 1209
;1209:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $422
line 1210
;1210:		persistant[i] = client->ps.persistant[i];
ADDRLP4 3264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 3264
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 3264
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1211
;1211:	}
LABELV $423
line 1209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $422
line 1212
;1212:	eventSequence = client->ps.eventSequence;
ADDRLP4 3256
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1214
;1213:
;1214:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3464
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1216
;1215:
;1216:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1132
INDIRB
ASGNB 2084
line 1217
;1217:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
ADDRLP4 3216
INDIRB
ASGNB 28
line 1218
;1218:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 3244
INDIRI4
ASGNI4
line 1220
;1219://	client->areabits = savedAreaBits;
;1220:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 2648
ADDP4
ADDRLP4 3248
INDIRI4
ASGNI4
line 1221
;1221:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 2644
ADDP4
ADDRLP4 3252
INDIRI4
ASGNI4
line 1222
;1222:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 -1
ASGNI4
line 1224
;1223:
;1224:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $426
line 1225
;1225:		client->ps.persistant[i] = persistant[i];
ADDRLP4 3264
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 3264
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 3264
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1226
;1226:	}
LABELV $427
line 1224
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $426
line 1227
;1227:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 3256
INDIRI4
ASGNI4
line 1229
;1228:	// increment the spawncount so the client will detect the respawn
;1229:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 3264
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 3264
INDIRP4
ADDRLP4 3264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1230
;1230:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 1232
;1231:
;1232:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 2680
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1234
;1233:
;1234:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
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
line 1236
;1235:	// set max health
;1236:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 3272
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3272
INDIRP4
ARGP4
ADDRLP4 3276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 3276
INDIRI4
ASGNI4
line 1237
;1237:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 3280
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 1
LTI4 $433
ADDRLP4 3280
INDIRI4
CNSTI4 100
LEI4 $431
LABELV $433
line 1238
;1238:		client->pers.maxHealth = 100;
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 1239
;1239:	}
LABELV $431
line 1241
;1240:	// clear entity values
;1241:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 1242
;1242:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1244
;1243:
;1244:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1245
;1245:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3464
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1246
;1246:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 1247
;1247:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 1248
;1248:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $434
ASGNP4
line 1249
;1249:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 33554432
ASGNI4
line 1250
;1250:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 33619969
ASGNI4
line 1251
;1251:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 player_die
ASGNP4
line 1252
;1252:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 0
ASGNI4
line 1253
;1253:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 0
ASGNI4
line 1254
;1254:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 0
ASGNI4
line 1256
;1255:	
;1256:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1257
;1257:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1259
;1258:
;1259:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1263
;1260:
;1261:	
;1262:	// Regular
;1263:	if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3288
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3288
INDIRI4
NEI4 $435
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3288
INDIRI4
NEI4 $435
line 1264
;1264:	{	
line 1265
;1265:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1266
;1266:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $439
line 1267
;1267:			client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1268
;1268:		} else {
ADDRGP4 $440
JUMPV
LABELV $439
line 1269
;1269:			client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1270
;1270:		} 
LABELV $440
line 1272
;1271:			
;1272:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3292
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3292
INDIRP4
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1273
;1273:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1274
;1274:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1276
;1275:
;1276:	} 
LABELV $435
line 1280
;1277:
;1278:	// Trepidation Gametype
;1279:	// This is all gonna change once we introduce classes
;1280:	if (g_instagib.integer == 0 && g_GameMode.integer == 3)  // Shafe - Trep Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $442
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $442
line 1281
;1281:	{
line 1282
;1282:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1283
;1283:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $446
line 1284
;1284:			client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1285
;1285:		} else {
ADDRGP4 $447
JUMPV
LABELV $446
line 1286
;1286:			client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1287
;1287:		} 
LABELV $447
line 1289
;1288:			
;1289:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3292
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3292
INDIRP4
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1290
;1290:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1291
;1291:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1292
;1292:	}
LABELV $442
line 1295
;1293:	
;1294:	// Instagib
;1295:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $449
line 1296
;1296:	{
line 1298
;1297:		// InstaGib - weapons on spawning w/ammo  - Shafe Trep
;1298:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_RAILGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 128
ASGNI4
line 1299
;1299:		client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1301
;1300: 
;1301:	}
LABELV $449
line 1303
;1302:
;1303:	if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $452
line 1304
;1304:	{
line 1306
;1305:		// Arsenal does not run in instagib mode
;1306:		if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $455
line 1307
;1307:		{
line 1308
;1308:			trap_SendServerCommand( -1, "print \"Instagib is not compatable with Arsenal Gametype\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $458
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1309
;1309:			g_instagib.integer = 0; 
ADDRGP4 g_instagib+12
CNSTI4 0
ASGNI4
line 1310
;1310:		}
LABELV $455
line 1312
;1311:
;1312:	}
LABELV $452
line 1316
;1313:
;1314:
;1315:	// health will count down towards max_health
;1316:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 3296
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 3296
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 3296
INDIRI4
ASGNI4
line 1318
;1317:
;1318:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1319
;1319:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1322
;1320:
;1321:	// the respawned flag will be cleared after the attack and jump keys come up
;1322:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 3300
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 3300
INDIRP4
ADDRLP4 3300
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1324
;1323:
;1324:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3464
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1325
;1325:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1327
;1326:
;1327:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $460
line 1329
;1328:
;1329:	} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 1330
;1330:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1331
;1331:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1333
;1332:
;1333:		if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3304
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3304
INDIRI4
NEI4 $462
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3304
INDIRI4
NEI4 $462
line 1334
;1334:		{
line 1336
;1335:		// force the base weapon up
;1336:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1337
;1337:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1338
;1338:		} 
LABELV $462
line 1341
;1339:		
;1340:		// Hand out weapons in instagib
;1341:		if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $466
line 1342
;1342:		{
line 1343
;1343:			client->ps.weapon = WP_RAILGUN; // InstaGib
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 7
ASGNI4
line 1344
;1344:		}
LABELV $466
line 1347
;1345:
;1346:		// Hand out weapons for LMS
;1347:		if ((g_GameMode.integer == 2) && (g_instagib.integer == 0))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $469
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $469
line 1348
;1348:		{
line 1349
;1349:			wpn = irandom(1,9); // Lets clean this up so you can specify which weapons are allowed
CNSTI4 1
ARGI4
CNSTI4 9
ARGI4
ADDRLP4 3308
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 3260
ADDRLP4 3308
INDIRI4
ASGNI4
line 1365
;1350:			
;1351:			/* This is such a bad way to do this
;1352:			if (g_StartGauntlet.integer == 0) && (wpn == 1) { wpn++; }
;1353:			if (g_StartMG.integer == 0) && (wpn == 2) { wpn++; }
;1354:			if (g_StartSG.integer == 0) && (wpn == 3) { wpn++; }
;1355:			if (g_StartGrenade.integer == 0) && (wpn == 4) { wpn++; }
;1356:			if (g_StartSingCan.integer == 0) && (wpn == 5) { wpn++; }
;1357:			if (g_StartSingFlame.integer == 0) && (wpn == 6) { wpn++; }
;1358:			if (g_StartGauss.integer == 0) && (wpn == 7) { wpn++; }
;1359:			if (g_StartPlasma.integer == 0) && (wpn == 8) { wpn++; }
;1360:			// If the bfg is disabled... Revert to the machine gun..
;1361:			// This is just flat out bad code.
;1362:			if (g_StartBFG.integer == 0) && (wpn == 9) { wpn = 2; } 
;1363:			*/
;1364:
;1365:			client->ps.stats[STAT_WEAPONS] = ( 1 << wpn );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1
ADDRLP4 3260
INDIRI4
LSHI4
ASGNI4
line 1366
;1366:			client->ps.ammo[wpn] = 9999;
ADDRLP4 3260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 9999
ASGNI4
line 1367
;1367:		}
LABELV $469
line 1370
;1368:		
;1369:		// Hand out weapons for arsenal
;1370:		if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $473
line 1371
;1371:		{
line 1372
;1372:			if (client->pers.h_gauntlet) 
ADDRLP4 4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 1373
;1373:			{
line 1374
;1374:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3308
ADDRLP4 4
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
line 1375
;1375:				client->ps.ammo[WP_GAUNTLET] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 9999
ASGNI4
line 1376
;1376:			}
LABELV $476
line 1378
;1377:			
;1378:			if (client->pers.h_mg) 
ADDRLP4 4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $478
line 1379
;1379:			{
line 1380
;1380:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1381
;1381:			client->ps.ammo[WP_MACHINEGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 9999
ASGNI4
line 1382
;1382:			}
LABELV $478
line 1384
;1383:			
;1384:			if (client->pers.h_sg) 
ADDRLP4 4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $480
line 1385
;1385:			{
line 1386
;1386:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1387
;1387:			client->ps.ammo[WP_SHOTGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 9999
ASGNI4
line 1388
;1388:			}
LABELV $480
line 1390
;1389:			
;1390:			if (client->pers.h_grenade ) 
ADDRLP4 4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $482
line 1391
;1391:			{
line 1392
;1392:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1393
;1393:			client->ps.ammo[WP_GRENADE_LAUNCHER] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 9999
ASGNI4
line 1394
;1394:			}
LABELV $482
line 1396
;1395:
;1396:			if (client->pers.h_singcan) 
ADDRLP4 4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $484
line 1397
;1397:			{
line 1398
;1398:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1399
;1399:			client->ps.ammo[WP_ROCKET_LAUNCHER] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 9999
ASGNI4
line 1400
;1400:			}
LABELV $484
line 1402
;1401:			
;1402:			if (client->pers.h_flame) 
ADDRLP4 4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
line 1403
;1403:			{
line 1404
;1404:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1405
;1405:			client->ps.ammo[WP_LIGHTNING] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 9999
ASGNI4
line 1406
;1406:			}
LABELV $486
line 1408
;1407:			
;1408:			if (client->pers.h_gauss) 
ADDRLP4 4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $488
line 1409
;1409:			{
line 1410
;1410:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1411
;1411:			client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1412
;1412:			}
LABELV $488
line 1414
;1413:	
;1414:			if (client->pers.h_plasma) 
ADDRLP4 4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $490
line 1415
;1415:			{
line 1416
;1416:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3308
INDIRP4
ADDRLP4 3308
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1417
;1417:			client->ps.ammo[WP_PLASMAGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 9999
ASGNI4
line 1418
;1418:			}
LABELV $490
line 1420
;1419:			
;1420:			if (client->pers.h_bfg) 
ADDRLP4 4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 1421
;1421:			{
line 1422
;1422:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
ADDRLP4 3308
ADDRLP4 4
INDIRP4
CNSTI4 192
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
line 1423
;1423:			client->ps.ammo[WP_BFG] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 9999
ASGNI4
line 1424
;1424:			}
LABELV $492
line 1427
;1425:			//client->ps.stats[STAT_WEAPONS] = ( 1 << wn );
;1426:			//client->ps.ammo[wn] = INFINITE;
;1427:		}
LABELV $473
line 1430
;1428:
;1429:
;1430:	}
LABELV $461
line 1436
;1431:
;1432:
;1433:
;1434:
;1435:	// don't allow full run speed for a bit
;1436:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 3304
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 3304
INDIRP4
ADDRLP4 3304
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1437
;1437:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1439
;1438:
;1439:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 2664
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1440
;1440:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 2668
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1441
;1441:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 2596
ADDP4
CNSTI4 0
ASGNI4
line 1444
;1442:
;1443:	// set default animations
;1444:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1445
;1445:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1447
;1446:
;1447:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $497
line 1448
;1448:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1449
;1449:	} else {
ADDRGP4 $498
JUMPV
LABELV $497
line 1451
;1450:		// fire the targets of the spawn point
;1451:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1455
;1452:
;1453:		// select the highest weapon number available, after any
;1454:		// spawn given items have fired
;1455:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1456
;1456:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 11
ASGNI4
LABELV $500
line 1457
;1457:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $504
line 1458
;1458:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1459
;1459:				break;
ADDRGP4 $502
JUMPV
LABELV $504
line 1461
;1460:			}
;1461:		}
LABELV $501
line 1456
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $500
LABELV $502
line 1462
;1462:	}
LABELV $498
line 1466
;1463:
;1464:	// run a client frame to drop exactly to the floor,
;1465:	// initialize animations and other things
;1466:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1467
;1467:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1468
;1468:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1471
;1469:
;1470:	// positively link the client, even if the command times are weird
;1471:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $508
line 1472
;1472:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
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
line 1473
;1473:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 3308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3308
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 3308
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1474
;1474:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1475
;1475:	}
LABELV $508
line 1478
;1476:
;1477:	// run the presend to set anything else
;1478:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1481
;1479:
;1480:	// Shafe - Trep - Headshots -- Best give em their head back when they respawn
;1481:	ent->client->noHead=qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 0
ASGNI4
line 1484
;1482:
;1483:	// This is probably going to screw everything up.
;1484:	ent->client->pers.Eliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1487
;1485:	
;1486:	// clear entity state values
;1487:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
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
line 1488
;1488:}
LABELV $407
endproc ClientSpawn 3312 16
export BalanceTeams
proc BalanceTeams 16 8
line 1492
;1489:
;1490:
;1491:
;1492:team_t BalanceTeams(int team ) {
line 1496
;1493:
;1494:int		i;
;1495:int		c;	
;1496:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1499
;1497:int		t;	
;1498:
;1499:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1500
;1500:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $514
JUMPV
LABELV $511
line 1502
;1501:	
;1502:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3464
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
NEI4 $516
line 1503
;1503:			continue;
ADDRGP4 $512
JUMPV
LABELV $516
line 1505
;1504:		}
;1505:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $518
line 1507
;1506:			
;1507:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3464
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
NEI4 $520
line 1508
;1508:			{
line 1509
;1509:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1510
;1510:			} 
ADDRGP4 $521
JUMPV
LABELV $520
line 1512
;1511:			else 
;1512:			{ 
line 1513
;1513:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1514
;1514:			}
LABELV $521
line 1516
;1515:
;1516:		}
LABELV $518
line 1517
;1517:	}
LABELV $512
line 1500
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $514
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $511
line 1519
;1518:
;1519:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $522
line 1520
;1520:	{ 
line 1521
;1521:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1522
;1522:	}
LABELV $522
line 1524
;1523:
;1524:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $524
line 1525
;1525:	{	
line 1526
;1526:		t = level.clients[c].ps.persistant[PERS_SCORE];
ADDRLP4 12
CNSTI4 3464
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
line 1527
;1527:		SetTeam(&g_entities[c], "red"); 
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1528
;1528:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3464
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
line 1530
;1529:		//level.clients[c].sess.sessionTeam = TEAM_BLUE;
;1530:	}
LABELV $524
line 1532
;1531:	
;1532:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $526
line 1533
;1533:	{		
line 1534
;1534:		t = level.clients[c].ps.persistant[PERS_SCORE];	
ADDRLP4 12
CNSTI4 3464
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
line 1535
;1535:		SetTeam(&g_entities[c], "blue"); 
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $307
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1536
;1536:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3464
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
line 1538
;1537:		//level.clients[c].sess.sessionTeam = TEAM_RED;
;1538:	}
LABELV $526
line 1540
;1539:	
;1540:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $510
endproc BalanceTeams 16 8
export PlaceMC
proc PlaceMC 16 4
line 1550
;1541:	
;1542:}
;1543:
;1544:/*
;1545: When someone doesnt build an MC it builds one somewhere for em
;1546: This is a called it picks a player and puts it in their spot..
;1547: hopefully they'll move out of the way.
;1548: Quite a hack.. 
;1549:*/
;1550:team_t PlaceMC(int team ) {
line 1554
;1551:
;1552:int		i;
;1553:int		c;	
;1554:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1557
;1555:
;1556:
;1557:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1558
;1558:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $532
JUMPV
LABELV $529
line 1560
;1559:	
;1560:		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
ADDRLP4 12
CNSTI4 3464
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
NEI4 $534
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $534
line 1561
;1561:			continue;
ADDRGP4 $530
JUMPV
LABELV $534
line 1563
;1562:		}
;1563:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $536
line 1565
;1564:			
;1565:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3464
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
NEI4 $538
line 1566
;1566:			{
line 1567
;1567:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1568
;1568:			} 
ADDRGP4 $539
JUMPV
LABELV $538
line 1570
;1569:			else 
;1570:			{ 
line 1571
;1571:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1572
;1572:			}
LABELV $539
line 1574
;1573:
;1574:		}
LABELV $536
line 1575
;1575:	}
LABELV $530
line 1558
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $532
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $529
line 1577
;1576:
;1577:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $540
line 1578
;1578:	{ 
line 1579
;1579:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1580
;1580:	}
LABELV $540
line 1582
;1581:
;1582:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $542
line 1583
;1583:	{	
line 1585
;1584:		// Set it down for the blue team
;1585:		BuildMC(&g_entities[c]);
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 1586
;1586:	}
LABELV $542
line 1588
;1587:	
;1588:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $544
line 1589
;1589:	{	
line 1591
;1590:		// set it down for the red team
;1591:		BuildMC(&g_entities[c]);
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 BuildMC
CALLV
pop
line 1592
;1592:	}
LABELV $544
line 1594
;1593:	
;1594:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $528
endproc PlaceMC 16 4
export ClientDisconnect
proc ClientDisconnect 28 20
line 1613
;1595:	
;1596:}
;1597:
;1598:
;1599:
;1600:
;1601:/*
;1602:===========
;1603:ClientDisconnect
;1604:
;1605:Called when a player drops from the server.
;1606:Will not be called between levels.
;1607:
;1608:This should NOT be called directly by any game logic,
;1609:call trap_DropClient(), which will call this and do
;1610:server system housekeeping.
;1611:============
;1612:*/
;1613:void ClientDisconnect( int clientNum ) {
line 1620
;1614:	gentity_t	*ent;
;1615:	gentity_t	*tent;
;1616:	int			i;
;1617:
;1618:	// cleanup if we are kicking a bot that
;1619:	// hasn't spawned yet
;1620:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1622
;1621:
;1622:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1623
;1623:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $547
line 1624
;1624:		return;
ADDRGP4 $546
JUMPV
LABELV $547
line 1628
;1625:	}
;1626:
;1627:	// stop any following clients
;1628:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $552
JUMPV
LABELV $549
line 1629
;1629:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 3464
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $554
ADDRLP4 12
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $554
ADDRLP4 12
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $554
line 1631
;1630:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1631:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1632
;1632:			StopFollowing( &g_entities[i] );
CNSTI4 916
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1633
;1633:		}
LABELV $554
line 1634
;1634:	}
LABELV $550
line 1628
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $552
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $549
line 1637
;1635:
;1636:	// send effect if they were completely connected
;1637:	if ( ent->client->pers.connected == CON_CONNECTED 
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
NEI4 $556
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $556
line 1638
;1638:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1639
;1639:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
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
line 1640
;1640:		tent->s.clientNum = ent->s.clientNum;
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
line 1644
;1641:
;1642:		// They don't get to take powerups with them!
;1643:		// Especially important for stuff like CTF flags
;1644:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1652
;1645:#ifdef MISSIONPACK
;1646:		TossClientPersistantPowerups( ent );
;1647:		if( g_gametype.integer == GT_HARVESTER ) {
;1648:			TossClientCubes( ent );
;1649:		}
;1650:#endif
;1651:
;1652:	}
LABELV $556
line 1654
;1653:
;1654:	 G_LogPrintf( "ClientDisconnect: %i [%s] (%s) \"%s\"\n", clientNum, ent->client->pers.ip, ent->client->pers.guid, ent->client->pers.netname );
ADDRGP4 $558
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
CNSTI4 2525
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 2492
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
line 1657
;1655:	 //G_LogPrintf( "ClientDisconnect: %i \"%s\"\n", clientNum, ent->client->pers.netname );
;1656:	// if we are playing in tourney mode and losing, give a win to the other player
;1657:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $559
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 level+9140
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $559
ADDRGP4 level+16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $559
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $559
line 1659
;1658:		&& !level.intermissiontime
;1659:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1660
;1660:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 24
CNSTI4 3464
ADDRGP4 level+96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2568
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
line 1661
;1661:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+96
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1662
;1662:	}
LABELV $559
line 1664
;1663:
;1664:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1665
;1665:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1666
;1666:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 0
ASGNI4
line 1667
;1667:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $568
ASGNP4
line 1668
;1668:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1669
;1669:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1670
;1670:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
CNSTI4 0
ASGNI4
line 1672
;1671:
;1672:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $569
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1674
;1673:
;1674:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1676
;1675:
;1676:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $570
line 1677
;1677:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1678
;1678:	}
LABELV $570
line 1679
;1679:}
LABELV $546
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
import g_PCTeamkills
import g_GrappleMode
import g_Turrets
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
LABELV $569
byte 1 0
align 1
LABELV $568
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
LABELV $558
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
LABELV $458
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
LABELV $434
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
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
LABELV $362
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
byte 1 32
byte 1 48
byte 1 53
byte 1 45
byte 1 49
byte 1 50
byte 1 45
byte 1 48
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $358
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
LABELV $355
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
LABELV $354
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
LABELV $342
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
LABELV $339
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
LABELV $337
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $332
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
LABELV $329
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $326
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $324
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
LABELV $323
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
LABELV $322
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
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
LABELV $318
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
LABELV $317
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
LABELV $316
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $315
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $314
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
LABELV $310
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
LABELV $308
byte 1 98
byte 1 0
align 1
LABELV $307
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $303
byte 1 114
byte 1 0
align 1
LABELV $302
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $299
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $293
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
LABELV $292
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $291
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
LABELV $290
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
LABELV $283
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
LABELV $282
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
LABELV $277
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
LABELV $272
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $271
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
LABELV $270
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
LABELV $269
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
LABELV $266
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
LABELV $265
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
LABELV $262
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
LABELV $259
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
LABELV $258
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
LABELV $255
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $254
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
LABELV $250
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
LABELV $148
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 0
align 1
LABELV $127
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 84
byte 1 111
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 10
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
