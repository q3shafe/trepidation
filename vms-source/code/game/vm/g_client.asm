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
line 155
;146:}
;147:
;148:/*
;149:===========
;150:SelectRandomFurthestSpawnPoint
;151:
;152:Chooses a player start, deathmatch start, etc
;153:============
;154:*/
;155:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 163
;156:	gentity_t	*spot;
;157:	vec3_t		delta;
;158:	float		dist;
;159:	float		list_dist[64];
;160:	gentity_t	*list_spot[64];
;161:	int			numSpots, rnd, i, j;
;162:
;163:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 164
;164:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $99
JUMPV
LABELV $98
line 166
;165:
;166:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 167
;167:		if ( SpotWouldTelefrag( spot ) ) {
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
line 168
;168:			continue;
ADDRGP4 $99
JUMPV
LABELV $101
line 170
;169:		}
;170:		VectorSubtract( spot->s.origin, avoidPoint, delta );
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
line 171
;171:		dist = VectorLength( delta );
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
line 172
;172:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $105
line 173
;173:			if ( dist > list_dist[i] ) {
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
line 174
;174:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $111
line 175
;175:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $111
line 176
;176:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $113
line 177
;177:					list_dist[j] = list_dist[j-1];
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
line 178
;178:					list_spot[j] = list_spot[j-1];
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
line 179
;179:				}
LABELV $114
line 176
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
line 180
;180:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 181
;181:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 182
;182:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 183
;183:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $107
line 184
;184:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 185
;185:				break;
ADDRGP4 $107
JUMPV
LABELV $109
line 187
;186:			}
;187:		}
LABELV $106
line 172
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
line 188
;188:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $121
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $121
line 189
;189:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 190
;190:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 191
;191:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 192
;192:		}
LABELV $121
line 193
;193:	}
LABELV $99
line 166
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
line 194
;194:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $123
line 195
;195:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
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
line 196
;196:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 197
;197:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $127
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $125
line 198
;198:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 199
;199:		origin[2] += 9;
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
line 200
;200:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 201
;201:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $97
JUMPV
LABELV $123
line 205
;202:	}
;203:
;204:	// select a random spot from the spawn points furthest away
;205:	rnd = random() * (numSpots / 2);
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
line 207
;206:
;207:	VectorCopy (list_spot[rnd]->s.origin, origin);
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
line 208
;208:	origin[2] += 9;
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
;209:	VectorCopy (list_spot[rnd]->s.angles, angles);
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
line 211
;210:
;211:	return list_spot[rnd];
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
line 221
;212:}
;213:
;214:/*
;215:===========
;216:SelectSpawnPoint
;217:
;218:Chooses a player start, deathmatch start, etc
;219:============
;220:*/
;221:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 222
;222:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
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
LABELV $128
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 261
;223:
;224:	/*
;225:	gentity_t	*spot;
;226:	gentity_t	*nearestSpot;
;227:
;228:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;229:
;230:	spot = SelectRandomDeathmatchSpawnPoint ( );
;231:	if ( spot == nearestSpot ) {
;232:		// roll again if it would be real close to point of death
;233:		spot = SelectRandomDeathmatchSpawnPoint ( );
;234:		if ( spot == nearestSpot ) {
;235:			// last try
;236:			spot = SelectRandomDeathmatchSpawnPoint ( );
;237:		}		
;238:	}
;239:
;240:	// find a single player start spot
;241:	if (!spot) {
;242:		G_Error( "Couldn't find a spawn point" );
;243:	}
;244:
;245:	VectorCopy (spot->s.origin, origin);
;246:	origin[2] += 9;
;247:	VectorCopy (spot->s.angles, angles);
;248:
;249:	return spot;
;250:	*/
;251:}
;252:
;253:/*
;254:===========
;255:SelectInitialSpawnPoint
;256:
;257:Try to find a spawn point marked 'initial', otherwise
;258:use normal spawn selection.
;259:============
;260:*/
;261:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 264
;262:	gentity_t	*spot;
;263:
;264:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $131
JUMPV
LABELV $130
line 265
;265:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 266
;266:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $133
line 267
;267:			break;
ADDRGP4 $132
JUMPV
LABELV $133
line 269
;268:		}
;269:	}
LABELV $131
line 265
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
NEU4 $130
LABELV $132
line 271
;270:
;271:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
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
EQI4 $135
LABELV $137
line 272
;272:		return SelectSpawnPoint( vec3_origin, origin, angles );
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
ADDRGP4 $129
JUMPV
LABELV $135
line 275
;273:	}
;274:
;275:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 276
;276:	origin[2] += 9;
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
line 277
;277:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 279
;278:
;279:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $129
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 288
;280:}
;281:
;282:/*
;283:===========
;284:SelectSpectatorSpawnPoint
;285:
;286:============
;287:*/
;288:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 289
;289:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 291
;290:
;291:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9156
INDIRB
ASGNB 12
line 292
;292:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9168
INDIRB
ASGNB 12
line 294
;293:
;294:	return NULL;
CNSTP4 0
RETP4
LABELV $138
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 310
;295:}
;296:
;297:/*
;298:=======================================================================
;299:
;300:BODYQUE
;301:
;302:=======================================================================
;303:*/
;304:
;305:/*
;306:===============
;307:InitBodyQue
;308:===============
;309:*/
;310:void InitBodyQue (void) {
line 314
;311:	int		i;
;312:	gentity_t	*ent;
;313:
;314:	level.bodyQueIndex = 0;
ADDRGP4 level+9188
CNSTI4 0
ASGNI4
line 315
;315:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $143
line 316
;316:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 317
;317:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $147
ASGNP4
line 318
;318:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 319
;319:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9192
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 320
;320:	}
LABELV $144
line 315
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $143
line 321
;321:}
LABELV $141
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 330
;322:
;323:/*
;324:=============
;325:BodySink
;326:
;327:After sitting around for five seconds, fall into the ground and dissapear
;328:=============
;329:*/
;330:void BodySink( gentity_t *ent ) {
line 331
;331:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $150
line 333
;332:		// the body ques are never actually freed, they are just unlinked
;333:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 334
;334:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 0
ASGNI4
line 335
;335:		return;	
ADDRGP4 $149
JUMPV
LABELV $150
line 337
;336:	}
;337:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 338
;338:	ent->s.pos.trBase[2] -= 1;
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
line 339
;339:}
LABELV $149
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 48 12
line 349
;340:
;341:/*
;342:=============
;343:CopyToBodyQue
;344:
;345:A player is respawning, so make an entity that looks
;346:just like the existing corpse to leave behind.
;347:=============
;348:*/
;349:void CopyToBodyQue( gentity_t *ent ) {
line 357
;350:#ifdef MISSIONPACK
;351:	gentity_t	*e;
;352:	int i;
;353:#endif
;354:	gentity_t		*body;
;355:	int			contents;
;356:
;357:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 360
;358:
;359:	// if client is in a nodrop area, don't leave the body
;360:	contents = trap_PointContents( ent->s.origin, -1 );
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
line 361
;361:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $155
line 362
;362:		return;
ADDRGP4 $154
JUMPV
LABELV $155
line 366
;363:	}
;364:
;365:	// grab a body que and cycle to the next one
;366:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9188
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9192
ADDP4
INDIRP4
ASGNP4
line 367
;367:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9188
ADDRGP4 level+9188
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 369
;368:
;369:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 371
;370:
;371:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 212
line 372
;372:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 391
;373:#ifdef MISSIONPACK
;374:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
;375:		body->s.eFlags |= EF_KAMIKAZE;
;376:
;377:		// check if there is a kamikaze timer around for this owner
;378:		for (i = 0; i < MAX_GENTITIES; i++) {
;379:			e = &g_entities[i];
;380:			if (!e->inuse)
;381:				continue;
;382:			if (e->activator != ent)
;383:				continue;
;384:			if (strcmp(e->classname, "kamikaze timer"))
;385:				continue;
;386:			e->activator = body;
;387:			break;
;388:		}
;389:	}
;390:#endif
;391:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 392
;392:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 393
;393:	body->s.number = body - g_entities;
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
line 394
;394:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 395
;395:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
line 396
;396:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTF4 0
ASGNF4
line 397
;397:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $162
line 398
;398:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 399
;399:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 400
;400:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
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
line 401
;401:	} else {
ADDRGP4 $163
JUMPV
LABELV $162
line 402
;402:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 403
;403:	}
LABELV $163
line 404
;404:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 408
;405:
;406:	// change the animation to the last-frame only, so the sequence
;407:	// doesn't repeat anew for the body
;408:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
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
LTI4 $165
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $165
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $171
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $171
address $168
address $168
address $169
address $169
address $170
address $170
code
LABELV $168
line 411
;409:	case BOTH_DEATH1:
;410:	case BOTH_DEAD1:
;411:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
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
line 412
;412:		break;
ADDRGP4 $166
JUMPV
LABELV $169
line 415
;413:	case BOTH_DEATH2:
;414:	case BOTH_DEAD2:
;415:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
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
line 416
;416:		break;
ADDRGP4 $166
JUMPV
LABELV $170
LABELV $165
line 420
;417:	case BOTH_DEATH3:
;418:	case BOTH_DEAD3:
;419:	default:
;420:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
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
line 421
;421:		break;
LABELV $166
line 424
;422:	}
;423:
;424:	body->r.svFlags = ent->r.svFlags;
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
line 425
;425:	VectorCopy (ent->r.mins, body->r.mins);
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
line 426
;426:	VectorCopy (ent->r.maxs, body->r.maxs);
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
line 427
;427:	VectorCopy (ent->r.absmin, body->r.absmin);
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
line 428
;428:	VectorCopy (ent->r.absmax, body->r.absmax);
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
line 430
;429:
;430:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 65537
ASGNI4
line 431
;431:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 432
;432:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 434
;433:
;434:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 435
;435:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 BodySink
ASGNP4
line 437
;436:
;437:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 body_die
ASGNP4
line 440
;438:
;439:	// don't take more damage if already gibbed
;440:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $173
line 441
;441:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 442
;442:	} else {
ADDRGP4 $174
JUMPV
LABELV $173
line 443
;443:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 444
;444:	}
LABELV $174
line 447
;445:
;446:	// Shafe - Trep - Headshots
;447:	if(ent->client->noHead) { 
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $175
line 448
;448:		G_AddEvent( body,EV_BODY_NOHEAD,0 );
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
line 449
;449:	}
LABELV $175
line 452
;450:	// Shafe - Trep - End Headshots
;451:
;452:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
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
line 453
;453:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 454
;454:}
LABELV $154
endproc CopyToBodyQue 48 12
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 465
;455:
;456://======================================================================
;457:
;458:
;459:/*
;460:==================
;461:SetClientViewAngle
;462:
;463:==================
;464:*/
;465:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 469
;466:	int			i;
;467:
;468:	// set the delta angle
;469:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $178
line 472
;470:		int		cmdAngle;
;471:
;472:		cmdAngle = ANGLE2SHORT(angle[i]);
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
line 473
;473:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
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
line 474
;474:	}
LABELV $179
line 469
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $178
line 475
;475:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 476
;476:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
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
line 477
;477:}
LABELV $177
endproc SetClientViewAngle 16 0
export respawn
proc respawn 12 8
line 484
;478:
;479:/*
;480:================
;481:respawn
;482:================
;483:*/
;484:void respawn( gentity_t *ent ) {
line 487
;485:	gentity_t	*tent;
;486:
;487:	CopyToBodyQue (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 488
;488:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 491
;489:
;490:	// add a teleportation effect
;491:	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
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
line 492
;492:	tent->s.clientNum = ent->s.clientNum;
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
line 493
;493:}
LABELV $182
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 502
;494:
;495:/*
;496:================
;497:TeamCount
;498:
;499:Returns number of players on a team
;500:================
;501:*/
;502:team_t TeamCount( int ignoreClientNum, int team ) {
line 504
;503:	int		i;
;504:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 506
;505:
;506:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $187
JUMPV
LABELV $184
line 507
;507:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $189
line 508
;508:			continue;
ADDRGP4 $185
JUMPV
LABELV $189
line 510
;509:		}
;510:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3456
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
NEI4 $191
line 511
;511:			continue;
ADDRGP4 $185
JUMPV
LABELV $191
line 513
;512:		}
;513:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3456
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
NEI4 $193
line 514
;514:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 515
;515:		}
LABELV $193
line 516
;516:	}
LABELV $185
line 506
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $187
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $184
line 518
;517:
;518:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $183
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 528
;519:}
;520:
;521:/*
;522:================
;523:TeamLeader
;524:
;525:Returns the client number of the team leader
;526:================
;527:*/
;528:int TeamLeader( int team ) {
line 531
;529:	int		i;
;530:
;531:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 532
;532:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3456
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
NEI4 $201
line 533
;533:			continue;
ADDRGP4 $197
JUMPV
LABELV $201
line 535
;534:		}
;535:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3456
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
NEI4 $203
line 536
;536:			if ( level.clients[i].sess.teamLeader )
CNSTI4 3456
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
EQI4 $205
line 537
;537:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $195
JUMPV
LABELV $205
line 538
;538:		}
LABELV $203
line 539
;539:	}
LABELV $197
line 531
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $196
line 541
;540:
;541:	return -1;
CNSTI4 -1
RETI4
LABELV $195
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 551
;542:}
;543:
;544:
;545:/*
;546:================
;547:PickTeam
;548:
;549:================
;550:*/
;551:team_t PickTeam( int ignoreClientNum ) {
line 554
;552:	int		counts[TEAM_NUM_TEAMS];
;553:
;554:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
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
line 555
;555:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
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
line 557
;556:
;557:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $210
line 558
;558:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $207
JUMPV
LABELV $210
line 560
;559:	}
;560:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $214
line 561
;561:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $207
JUMPV
LABELV $214
line 564
;562:	}
;563:	// equal team count, so join the team with the lowest score
;564:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+52+8
INDIRI4
ADDRGP4 level+52+4
INDIRI4
LEI4 $218
line 565
;565:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $207
JUMPV
LABELV $218
line 567
;566:	}
;567:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $207
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 595
;568:}
;569:
;570:/*
;571:===========
;572:ForceClientSkin
;573:
;574:Forces a client's skin (for teamplay)
;575:===========
;576:*/
;577:/*
;578:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;579:	char *p;
;580:
;581:	if ((p = Q_strrchr(model, '/')) != 0) {
;582:		*p = 0;
;583:	}
;584:
;585:	Q_strcat(model, MAX_QPATH, "/");
;586:	Q_strcat(model, MAX_QPATH, skin);
;587:}
;588:*/
;589:
;590:/*
;591:===========
;592:ClientCheckName
;593:============
;594:*/
;595:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 602
;596:	int		len, colorlessLen;
;597:	char	ch;
;598:	char	*p;
;599:	int		spaces;
;600:
;601:	//save room for trailing null byte
;602:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 604
;603:
;604:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 605
;605:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 606
;606:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 607
;607:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 608
;608:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $225
line 610
;609:
;610:	while( 1 ) {
line 611
;611:		ch = *in++;
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
line 612
;612:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $228
line 613
;613:			break;
ADDRGP4 $227
JUMPV
LABELV $228
line 617
;614:		}
;615:
;616:		// don't allow leading spaces
;617:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $230
line 618
;618:			continue;
ADDRGP4 $226
JUMPV
LABELV $230
line 622
;619:		}
;620:
;621:		// check colors
;622:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $232
line 624
;623:			// solo trailing carat is not a color prefix
;624:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $234
line 625
;625:				break;
ADDRGP4 $227
JUMPV
LABELV $234
line 629
;626:			}
;627:
;628:			// don't allow black in a name, period
;629:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $236
line 630
;630:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 631
;631:				continue;
ADDRGP4 $226
JUMPV
LABELV $236
line 635
;632:			}
;633:
;634:			// make sure room in dest for both chars
;635:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $238
line 636
;636:				break;
ADDRGP4 $227
JUMPV
LABELV $238
line 639
;637:			}
;638:
;639:			*out++ = ch;
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
line 640
;640:			*out++ = *in++;
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
line 641
;641:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 642
;642:			continue;
ADDRGP4 $226
JUMPV
LABELV $232
line 646
;643:		}
;644:
;645:		// don't allow too many consecutive spaces
;646:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $240
line 647
;647:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 648
;648:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $241
line 649
;649:				continue;
ADDRGP4 $226
JUMPV
line 651
;650:			}
;651:		}
LABELV $240
line 652
;652:		else {
line 653
;653:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 654
;654:		}
LABELV $241
line 656
;655:
;656:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $244
line 657
;657:			break;
ADDRGP4 $227
JUMPV
LABELV $244
line 660
;658:		}
;659:
;660:		*out++ = ch;
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
line 661
;661:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 662
;662:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 663
;663:	}
LABELV $226
line 610
ADDRGP4 $225
JUMPV
LABELV $227
line 664
;664:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 667
;665:
;666:	// don't allow empty names
;667:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $248
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $246
LABELV $248
line 668
;668:		Q_strncpyz( p, "UnnamedPlayer", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $249
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 669
;669:	}
LABELV $246
line 670
;670:}
LABELV $224
endproc ClientCleanName 40 12
export ClientUserinfoChanged
proc ClientUserinfoChanged 6436 56
line 684
;671:
;672:
;673:/*
;674:===========
;675:ClientUserInfoChanged
;676:
;677:Called from ClientConnect when the player first connects and
;678:directly by the server system when the player updates a userinfo variable.
;679:
;680:The game can override any of the settings and call trap_SetUserinfo
;681:if desired.
;682:============
;683:*/
;684:void ClientUserinfoChanged( int clientNum ) {
line 698
;685:	gentity_t *ent;
;686:	int		teamTask, teamLeader, team, health;
;687:	char	*s;
;688:	char	model[MAX_QPATH];
;689:	char	headModel[MAX_QPATH];
;690:	char	oldname[MAX_STRING_CHARS];
;691:	gclient_t	*client;
;692:	char	c1[MAX_INFO_STRING];
;693:	char	c2[MAX_INFO_STRING];
;694:	char	redTeam[MAX_INFO_STRING];
;695:	char	blueTeam[MAX_INFO_STRING];
;696:	char	userinfo[MAX_INFO_STRING];
;697:
;698:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 699
;699:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 701
;700:
;701:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 704
;702:
;703:	// check for malformed or illegal info strings
;704:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 8
ARGP4
ADDRLP4 6300
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
NEI4 $251
line 705
;705:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 8
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 706
;706:	}
LABELV $251
line 709
;707:
;708:	// check for local client
;709:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 8
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 6304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6304
INDIRP4
ASGNP4
line 710
;710:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 6308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6308
INDIRI4
CNSTI4 0
NEI4 $255
line 711
;711:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 712
;712:	}
LABELV $255
line 715
;713:
;714:	// check the item prediction
;715:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 8
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 6312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6312
INDIRP4
ASGNP4
line 716
;716:	if ( !atoi( s ) ) {
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
NEI4 $259
line 717
;717:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 718
;718:	} else {
ADDRGP4 $260
JUMPV
LABELV $259
line 719
;719:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 720
;720:	}
LABELV $260
line 724
;721:
;722://unlagged - client options
;723:	// see if the player has opted out
;724:	s = Info_ValueForKey( userinfo, "cg_delag" );
ADDRLP4 8
ARGP4
ADDRGP4 $261
ARGP4
ADDRLP4 6320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6320
INDIRP4
ASGNP4
line 725
;725:	if ( !atoi( s ) ) {
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
NEI4 $262
line 726
;726:		client->pers.delag = 0;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 727
;727:	} else {
ADDRGP4 $263
JUMPV
LABELV $262
line 728
;728:		client->pers.delag = atoi( s );
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
line 729
;729:	}
LABELV $263
line 732
;730:
;731:	// see if the player is nudging his shots
;732:	s = Info_ValueForKey( userinfo, "cg_cmdTimeNudge" );
ADDRLP4 8
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 6328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6328
INDIRP4
ASGNP4
line 733
;733:	client->pers.cmdTimeNudge = atoi( s );
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
line 736
;734:
;735:	// see if the player wants to debug the backward reconciliation
;736:	s = Info_ValueForKey( userinfo, "cg_debugDelag" );
ADDRLP4 8
ARGP4
ADDRGP4 $265
ARGP4
ADDRLP4 6336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6336
INDIRP4
ASGNP4
line 737
;737:	if ( !atoi( s ) ) {
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
NEI4 $266
line 738
;738:		client->pers.debugDelag = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 739
;739:	}
ADDRGP4 $267
JUMPV
LABELV $266
line 740
;740:	else {
line 741
;741:		client->pers.debugDelag = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 742
;742:	}
LABELV $267
line 745
;743:
;744:	// see if the player is simulating incoming latency
;745:	s = Info_ValueForKey( userinfo, "cg_latentSnaps" );
ADDRLP4 8
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6344
INDIRP4
ASGNP4
line 746
;746:	client->pers.latentSnaps = atoi( s );
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
line 749
;747:
;748:	// see if the player is simulating outgoing latency
;749:	s = Info_ValueForKey( userinfo, "cg_latentCmds" );
ADDRLP4 8
ARGP4
ADDRGP4 $269
ARGP4
ADDRLP4 6352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6352
INDIRP4
ASGNP4
line 750
;750:	client->pers.latentCmds = atoi( s );
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
line 753
;751:
;752:	// see if the player is simulating outgoing packet loss
;753:	s = Info_ValueForKey( userinfo, "cg_plOut" );
ADDRLP4 8
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6360
INDIRP4
ASGNP4
line 754
;754:	client->pers.plOut = atoi( s );
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
line 758
;755://unlagged - client options
;756:
;757:	// set name
;758:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
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
line 759
;759:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 8
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 6368
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6368
INDIRP4
ASGNP4
line 760
;760:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
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
line 762
;761:
;762:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $272
line 763
;763:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 3
NEI4 $274
line 764
;764:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 $276
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 765
;765:		}
LABELV $274
line 766
;766:	}
LABELV $272
line 768
;767:
;768:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $277
line 769
;769:		if ( strcmp( oldname, client->pers.netname ) ) {
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
EQI4 $279
line 770
;770:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, 
ADDRGP4 $281
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
line 772
;771:				client->pers.netname) );
;772:		}
LABELV $279
line 773
;773:	}
LABELV $277
line 787
;774:
;775:	// set max health
;776:#ifdef MISSIONPACK
;777:	if (client->ps.powerups[PW_GUARD]) {
;778:		client->pers.maxHealth = 200;
;779:	} else {
;780:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
;781:		client->pers.maxHealth = health;
;782:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
;783:			client->pers.maxHealth = 100;
;784:		}
;785:	}
;786:#else
;787:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $282
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
line 788
;788:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 2196
INDIRI4
ASGNI4
line 789
;789:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
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
LTI4 $285
ADDRLP4 6380
INDIRI4
CNSTI4 100
LEI4 $283
LABELV $285
line 790
;790:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 791
;791:	}
LABELV $283
line 793
;792:#endif
;793:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
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
line 796
;794:
;795:	// set model
;796:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $286
line 797
;797:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 8
ARGP4
ADDRGP4 $289
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
line 798
;798:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
ADDRLP4 8
ARGP4
ADDRGP4 $290
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
line 799
;799:	} else {
ADDRGP4 $287
JUMPV
LABELV $286
line 800
;800:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 8
ARGP4
ADDRGP4 $291
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
line 801
;801:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
ADDRLP4 8
ARGP4
ADDRGP4 $292
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
line 802
;802:	}
LABELV $287
line 805
;803:
;804:	// bots set their team a few frames later
;805:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $293
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
EQI4 $293
line 806
;806:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 8
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6388
INDIRP4
ASGNP4
line 807
;807:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 6392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6392
INDIRI4
CNSTI4 0
EQI4 $303
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 6396
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6396
INDIRI4
CNSTI4 0
NEI4 $299
LABELV $303
line 808
;808:			team = TEAM_RED;
ADDRLP4 4248
CNSTI4 1
ASGNI4
line 809
;809:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $294
JUMPV
LABELV $299
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $306
ARGP4
ADDRLP4 6400
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6400
INDIRI4
CNSTI4 0
EQI4 $308
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 6404
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6404
INDIRI4
CNSTI4 0
NEI4 $304
LABELV $308
line 810
;810:			team = TEAM_BLUE;
ADDRLP4 4248
CNSTI4 2
ASGNI4
line 811
;811:		} else {
ADDRGP4 $294
JUMPV
LABELV $304
line 813
;812:			// pick the team with the least number of players
;813:			team = PickTeam( clientNum );
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
line 814
;814:		}
line 815
;815:	}
ADDRGP4 $294
JUMPV
LABELV $293
line 816
;816:	else {
line 817
;817:		team = client->sess.sessionTeam;
ADDRLP4 4248
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ASGNI4
line 818
;818:	}
LABELV $294
line 854
;819:
;820:/*	NOTE: all client side now
;821:
;822:	// team
;823:	switch( team ) {
;824:	case TEAM_RED:
;825:		ForceClientSkin(client, model, "red");
;826://		ForceClientSkin(client, headModel, "red");
;827:		break;
;828:	case TEAM_BLUE:
;829:		ForceClientSkin(client, model, "blue");
;830://		ForceClientSkin(client, headModel, "blue");
;831:		break;
;832:	}
;833:	// don't ever use a default skin in teamplay, it would just waste memory
;834:	// however bots will always join a team but they spawn in as spectator
;835:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;836:		ForceClientSkin(client, model, "red");
;837://		ForceClientSkin(client, headModel, "red");
;838:	}
;839:*/
;840:
;841:#ifdef MISSIONPACK
;842:	if (g_gametype.integer >= GT_TEAM) {
;843:		client->pers.teamInfo = qtrue;
;844:	} else {
;845:		s = Info_ValueForKey( userinfo, "teamoverlay" );
;846:		if ( ! *s || atoi( s ) != 0 ) {
;847:			client->pers.teamInfo = qtrue;
;848:		} else {
;849:			client->pers.teamInfo = qfalse;
;850:		}
;851:	}
;852:#else
;853:	// teamInfo
;854:	s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 8
ARGP4
ADDRGP4 $309
ARGP4
ADDRLP4 6388
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6388
INDIRP4
ASGNP4
line 855
;855:	if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $312
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
EQI4 $310
LABELV $312
line 856
;856:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 857
;857:	} else {
ADDRGP4 $311
JUMPV
LABELV $310
line 858
;858:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 859
;859:	}
LABELV $311
line 872
;860:#endif
;861:	/*
;862:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;863:	if ( !*s || atoi( s ) == 0 ) {
;864:		client->pers.pmoveFixed = qfalse;
;865:	}
;866:	else {
;867:		client->pers.pmoveFixed = qtrue;
;868:	}
;869:	*/
;870:
;871:	// team task (0 = none, 1 = offence, 2 = defence)
;872:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 8
ARGP4
ADDRGP4 $313
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
line 874
;873:	// team Leader (1 = leader, 0 is normal player)
;874:	teamLeader = client->sess.teamLeader;
ADDRLP4 2192
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
INDIRI4
ASGNI4
line 877
;875:
;876:	// colors
;877:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 8
ARGP4
ADDRGP4 $314
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
line 878
;878:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 8
ARGP4
ADDRGP4 $315
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
line 880
;879:
;880:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 8
ARGP4
ADDRGP4 $316
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
line 881
;881:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 8
ARGP4
ADDRGP4 $317
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
line 885
;882:
;883:	// send over a subset of the userinfo keys so other clients can
;884:	// print scoreboards, display models, and play custom sounds
;885:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $318
line 886
;886:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 8
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 6424
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $320
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
line 890
;887:			client->pers.netname, team, model, headModel, c1, c2, 
;888:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;889:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;890:	} else {
ADDRGP4 $319
JUMPV
LABELV $318
line 891
;891:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $322
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
line 894
;892:			client->pers.netname, client->sess.sessionTeam, model, headModel, redTeam, blueTeam, c1, c2, 
;893:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;894:	}
LABELV $319
line 896
;895:
;896:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
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
line 898
;897:
;898:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $323
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
line 899
;899:}
LABELV $250
endproc ClientUserinfoChanged 6436 56
export ClientConnect
proc ClientConnect 1100 12
line 922
;900:
;901:
;902:/*
;903:===========
;904:ClientConnect
;905:
;906:Called when a player begins connecting to the server.
;907:Called again for every map change or tournement restart.
;908:
;909:The session information will be valid after exit.
;910:
;911:Return NULL if the client should be allowed, otherwise return
;912:a string with the reason for denial.
;913:
;914:Otherwise, the client will be sent the current gamestate
;915:and will eventually get to ClientBegin.
;916:
;917:firstTime will be qtrue the very first time a client connects
;918:to the server machine, but qfalse on map changes and tournement
;919:restarts.
;920:============
;921:*/
;922:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 929
;923:	char		*value;
;924://	char		*areabits;
;925:	gclient_t	*client;
;926:	char		userinfo[MAX_INFO_STRING];
;927:	gentity_t	*ent;
;928:	char		guid[ 33 ];
;929:	ent = &g_entities[ clientNum ];
ADDRLP4 1032
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 931
;930:
;931:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
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
line 934
;932:
;933:	// Admin System
;934:	value = Info_ValueForKey( userinfo, "cl_guid" );
ADDRLP4 8
ARGP4
ADDRGP4 $325
ARGP4
ADDRLP4 1072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1072
INDIRP4
ASGNP4
line 935
;935:	Q_strncpyz( guid, value, sizeof( guid ) );
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
line 938
;936:
;937:	// check to see if they are on the banned IP list
;938:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 8
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 1076
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1076
INDIRP4
ASGNP4
line 939
;939:	if ( G_FilterPacket( value ) ) {
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
EQI4 $326
line 940
;940:		return "Banned.";
ADDRGP4 $328
RETP4
ADDRGP4 $324
JUMPV
LABELV $326
line 943
;941:	}
;942:
;943:	if ( !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 1032
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $329
line 945
;944:		// check for a password
;945:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 8
ARGP4
ADDRGP4 $331
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1084
INDIRP4
ASGNP4
line 946
;946:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $332
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $332
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
EQI4 $332
line 947
;947:			strcmp( g_password.string, value) != 0) {
line 948
;948:			return "Invalid password";
ADDRGP4 $338
RETP4
ADDRGP4 $324
JUMPV
LABELV $332
line 950
;949:		}
;950:	}
LABELV $329
line 953
;951:
;952:	// they can connect
;953:	ent->client = level.clients + clientNum;
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3456
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 954
;954:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 958
;955:
;956://	areabits = client->areabits;
;957:
;958:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3456
ARGI4
ADDRGP4 memset
CALLP4
pop
line 963
;959:
;960:
;961:
;962:  // add guid to session so we don't have to keep parsing userinfo everywhere /*
;963:  if( !guid[0] )
ADDRLP4 1036
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $339
line 964
;964:  {
line 965
;965:    Q_strncpyz( client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
ARGP4
ADDRGP4 $341
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 967
;966:      sizeof( client->pers.guid ) );
;967:  }
ADDRGP4 $340
JUMPV
LABELV $339
line 969
;968:  else
;969:  {
line 970
;970:    Q_strncpyz( client->pers.guid, guid, sizeof( client->pers.guid ) );
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
line 971
;971:  }
LABELV $340
line 978
;972:	/* Admin System TJW
;973:	Q_strncpyz( client->pers.ip, ip, sizeof( client->pers.ip ) );
;974:	client->pers.adminLevel = G_admin_level( ent );
;975:	*/
;976:  
;977:
;978:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 981
;979:
;980:	// read or initialize the session data
;981:	if ( firstTime || level.newSession ) {
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1084
INDIRI4
NEI4 $345
ADDRGP4 level+76
INDIRI4
ADDRLP4 1084
INDIRI4
EQI4 $342
LABELV $345
line 982
;982:		G_InitSessionData( client, userinfo );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
line 983
;983:	}
LABELV $342
line 984
;984:	G_ReadSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 986
;985:
;986:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $346
line 987
;987:		ent->r.svFlags |= SVF_BOT;
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
line 988
;988:		ent->inuse = qtrue;
ADDRLP4 1032
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 989
;989:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $351
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $352
JUMPV
LABELV $351
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $352
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
NEI4 $348
line 990
;990:			return "BotConnectfailed";
ADDRGP4 $353
RETP4
ADDRGP4 $324
JUMPV
LABELV $348
line 992
;991:		}
;992:	}
LABELV $346
line 995
;993:
;994:	// get and distribute relevent paramters
;995:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $354
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 996
;996:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 999
;997:
;998:	// don't do the "xxx connected" messages if they were caried over from previous level
;999:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $355
line 1000
;1000:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
ADDRGP4 $357
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
line 1001
;1001:	}
LABELV $355
line 1003
;1002:
;1003:	if ( g_gametype.integer >= GT_TEAM &&
ADDRLP4 1088
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1088
INDIRI4
LTI4 $358
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRLP4 1088
INDIRI4
EQI4 $358
line 1004
;1004:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1005
;1005:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 1006
;1006:	}
LABELV $358
line 1009
;1007:
;1008:	// count current clients and rank for scoreboard
;1009:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1018
;1010:
;1011:	// for statistics
;1012://	client->areabits = areabits;
;1013://	if ( !client->areabits )
;1014://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;1015:
;1016://unlagged - backward reconciliation #5
;1017:	// announce it
;1018:	trap_SendServerCommand( clientNum, "print \"Trepidation Development Build 10-29-06 Rev C (11/05)\n\"" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $361
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1019
;1019:	if ( g_delagHitscan.integer ) {
ADDRGP4 g_delagHitscan+12
INDIRI4
CNSTI4 0
EQI4 $362
line 1021
;1020://		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is ON!\n\"" );
;1021:	}
LABELV $362
line 1022
;1022:	else {
line 1024
;1023://		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is OFF!\n\"" );
;1024:	}
LABELV $363
line 1027
;1025://unlagged - backward reconciliation #5
;1026:
;1027:	return NULL;
CNSTP4 0
RETP4
LABELV $324
endproc ClientConnect 1100 12
export ClientBegin
proc ClientBegin 28 12
line 1039
;1028:}
;1029:
;1030:/*
;1031:===========
;1032:ClientBegin
;1033:
;1034:called when a client has finished connecting, and is ready
;1035:to be placed into the level.  This will happen every level load,
;1036:and on transition between teams, but doesn't happen on respawns
;1037:============
;1038:*/
;1039:void ClientBegin( int clientNum ) {
line 1045
;1040:	gentity_t	*ent;
;1041:	gclient_t	*client;
;1042:	gentity_t	*tent;
;1043:	int			flags;
;1044:
;1045:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1047
;1046:
;1047:	client = level.clients + clientNum;
ADDRLP4 0
CNSTI4 3456
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1049
;1048:
;1049:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
line 1050
;1050:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1051
;1051:	}
LABELV $366
line 1052
;1052:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 1053
;1053:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
CNSTP4 0
ASGNP4
line 1054
;1054:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 1055
;1055:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1057
;1056:
;1057:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 1058
;1058:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1059
;1059:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 1066
;1060:
;1061:	// save eflags around this, because changing teams will
;1062:	// cause this to happen with a valid entity, and we
;1063:	// want to make sure the teleport bit is set right
;1064:	// so the viewpoint doesn't interpolate through the
;1065:	// world to the new position
;1066:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1067
;1067:	memset( &client->ps, 0, sizeof( client->ps ) );
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
line 1068
;1068:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1071
;1069:
;1070:	// Set What Weapons Are Allow for Arsenal
;1071:	if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $369
line 1072
;1072:	{
line 1074
;1073:			// Set Starting Weapons
;1074:		if (g_StartGauntlet.integer > 0) { client->pers.h_gauntlet = qtrue; }
ADDRGP4 g_StartGauntlet+12
INDIRI4
CNSTI4 0
LEI4 $372
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 1
ASGNI4
LABELV $372
line 1075
;1075:		if (g_StartMG.integer > 0) { client->pers.h_mg = qtrue; }
ADDRGP4 g_StartMG+12
INDIRI4
CNSTI4 0
LEI4 $375
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 1
ASGNI4
LABELV $375
line 1076
;1076:		if (g_StartSG.integer > 0) { client->pers.h_sg = qtrue; }
ADDRGP4 g_StartSG+12
INDIRI4
CNSTI4 0
LEI4 $378
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 1
ASGNI4
LABELV $378
line 1077
;1077:		if (g_StartGrenade.integer > 0) { client->pers.h_grenade = qtrue; }
ADDRGP4 g_StartGrenade+12
INDIRI4
CNSTI4 0
LEI4 $381
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 1
ASGNI4
LABELV $381
line 1078
;1078:		if (g_StartSingCan.integer > 0) { client->pers.h_singcan = qtrue; }
ADDRGP4 g_StartSingCan+12
INDIRI4
CNSTI4 0
LEI4 $384
ADDRLP4 0
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 1
ASGNI4
LABELV $384
line 1079
;1079:		if (g_StartFlame.integer > 0) { client->pers.h_flame = qtrue; }
ADDRGP4 g_StartFlame+12
INDIRI4
CNSTI4 0
LEI4 $387
ADDRLP4 0
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 1
ASGNI4
LABELV $387
line 1080
;1080:		if (g_StartGauss.integer > 0) { client->pers.h_gauss = qtrue; }
ADDRGP4 g_StartGauss+12
INDIRI4
CNSTI4 0
LEI4 $390
ADDRLP4 0
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 1
ASGNI4
LABELV $390
line 1081
;1081:		if (g_StartPlasma.integer > 0) { client->pers.h_plasma = qtrue;}
ADDRGP4 g_StartPlasma+12
INDIRI4
CNSTI4 0
LEI4 $393
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 1
ASGNI4
LABELV $393
line 1082
;1082:		if (g_StartBFG.integer > 0) { client->pers.h_bfg = qtrue;}
ADDRGP4 g_StartBFG+12
INDIRI4
CNSTI4 0
LEI4 $396
ADDRLP4 0
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 1
ASGNI4
LABELV $396
line 1083
;1083:	}
LABELV $369
line 1084
;1084:	client->pers.Eliminated = qfalse;  // They are not eliminated
ADDRLP4 0
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1088
;1085:	// End Arsenal
;1086:
;1087:	// locate ent at a spawn point
;1088:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1090
;1089:
;1090:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $399
line 1092
;1091:		// send event
;1092:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
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
line 1093
;1093:		tent->s.clientNum = ent->s.clientNum;
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
line 1095
;1094:
;1095:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $401
line 1096
;1096:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $404
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
line 1097
;1097:		}
LABELV $401
line 1098
;1098:	}
LABELV $399
line 1099
;1099:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $405
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1102
;1100:
;1101:	// count current clients and rank for scoreboard
;1102:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1103
;1103:}
LABELV $365
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 3312 16
line 1116
;1104:
;1105:
;1106:
;1107:/*
;1108:===========
;1109:ClientSpawn
;1110:
;1111:Called every time a client is placed fresh in the world:
;1112:after the first ClientBegin, and after each respawn
;1113:Initializes all non-persistant parts of playerState
;1114:============
;1115:*/
;1116:void ClientSpawn(gentity_t *ent) {
line 1133
;1117:	int		index;
;1118:	vec3_t	spawn_origin, spawn_angles;
;1119:	gclient_t	*client;
;1120:	int		i;
;1121:	clientPersistant_t	saved;
;1122:	clientSession_t		savedSess;
;1123:	int		persistant[MAX_PERSISTANT];
;1124:	gentity_t	*spawnPoint;
;1125:	int		flags;
;1126:	int		savedPing;
;1127://	char	*savedAreaBits;
;1128:	int		accuracy_hits, accuracy_shots;
;1129:	int		eventSequence;
;1130:	char	userinfo[MAX_INFO_STRING];
;1131:	int		wpn;
;1132:
;1133:	index = ent - g_entities;
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
line 1134
;1134:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1139
;1135:
;1136:	// find a spawn point
;1137:	// do it before setting health back up, so farthest
;1138:	// ranging doesn't count this client
;1139:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $407
line 1140
;1140:		spawnPoint = SelectSpectatorSpawnPoint ( 
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
line 1142
;1141:						spawn_origin, spawn_angles);
;1142:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $408
JUMPV
LABELV $407
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $409
line 1144
;1143:		// all base oriented team games use the CTF spawn points
;1144:		spawnPoint = SelectCTFSpawnPoint ( 
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
line 1148
;1145:						client->sess.sessionTeam, 
;1146:						client->pers.teamState.state, 
;1147:						spawn_origin, spawn_angles);
;1148:	} else {
ADDRGP4 $410
JUMPV
LABELV $409
LABELV $412
line 1149
;1149:		do {
line 1151
;1150:			// the first spawn should be at a good looking spot
;1151:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
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
NEI4 $415
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 3268
INDIRI4
EQI4 $415
line 1152
;1152:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1153
;1153:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
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
line 1154
;1154:			} else {
ADDRGP4 $416
JUMPV
LABELV $415
line 1156
;1155:				// don't spawn near existing origin if possible
;1156:				spawnPoint = SelectSpawnPoint ( 
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
line 1159
;1157:					client->ps.origin, 
;1158:					spawn_origin, spawn_angles);
;1159:			}
LABELV $416
line 1163
;1160:
;1161:			// Tim needs to prevent bots from spawning at the initial point
;1162:			// on q3dm0...
;1163:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
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
EQI4 $417
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3272
INDIRI4
EQI4 $417
line 1164
;1164:				continue;	// try again
ADDRGP4 $413
JUMPV
LABELV $417
line 1167
;1165:			}
;1166:			// just to be symetric, we have a nohumans option...
;1167:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
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
EQI4 $414
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3276
INDIRI4
NEI4 $414
line 1168
;1168:				continue;	// try again
line 1171
;1169:			}
;1170:
;1171:			break;
LABELV $413
line 1173
;1172:
;1173:		} while ( 1 );
ADDRGP4 $412
JUMPV
LABELV $414
line 1174
;1174:	}
LABELV $410
LABELV $408
line 1175
;1175:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 1182
;1176:
;1177:	// always clear the kamikaze flag
;1178:	/* ent->s.eFlags &= ~EF_KAMIKAZE; */
;1179:
;1180:	// toggle the teleport bit so the client knows to not lerp
;1181:	// and never clear the voted flag
;1182:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
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
line 1183
;1183:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1187
;1184:
;1185://unlagged - backward reconciliation #3
;1186:	// we don't want players being backward-reconciled to the place they died
;1187:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 1189
;1188:	// and this is as good a time as any to clear the saved state
;1189:	ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 3444
ADDP4
CNSTI4 0
ASGNI4
line 1194
;1190://unlagged - backward reconciliation #3
;1191:
;1192:	// clear everything but the persistant data
;1193:
;1194:	saved = client->pers;
ADDRLP4 1132
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 2084
line 1195
;1195:	savedSess = client->sess;
ADDRLP4 3216
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
INDIRB
ASGNB 28
line 1196
;1196:	savedPing = client->ps.ping;
ADDRLP4 3244
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1198
;1197://	savedAreaBits = client->areabits;
;1198:	accuracy_hits = client->accuracy_hits;
ADDRLP4 3248
ADDRLP4 4
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
ASGNI4
line 1199
;1199:	accuracy_shots = client->accuracy_shots;
ADDRLP4 3252
ADDRLP4 4
INDIRP4
CNSTI4 2644
ADDP4
INDIRI4
ASGNI4
line 1200
;1200:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $421
line 1201
;1201:		persistant[i] = client->ps.persistant[i];
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
line 1202
;1202:	}
LABELV $422
line 1200
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $421
line 1203
;1203:	eventSequence = client->ps.eventSequence;
ADDRLP4 3256
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1205
;1204:
;1205:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3456
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1207
;1206:
;1207:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1132
INDIRB
ASGNB 2084
line 1208
;1208:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 2552
ADDP4
ADDRLP4 3216
INDIRB
ASGNB 28
line 1209
;1209:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 3244
INDIRI4
ASGNI4
line 1211
;1210://	client->areabits = savedAreaBits;
;1211:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 2648
ADDP4
ADDRLP4 3248
INDIRI4
ASGNI4
line 1212
;1212:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 2644
ADDP4
ADDRLP4 3252
INDIRI4
ASGNI4
line 1213
;1213:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 2652
ADDP4
CNSTI4 -1
ASGNI4
line 1215
;1214:
;1215:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $425
line 1216
;1216:		client->ps.persistant[i] = persistant[i];
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
line 1217
;1217:	}
LABELV $426
line 1215
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $425
line 1218
;1218:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 3256
INDIRI4
ASGNI4
line 1220
;1219:	// increment the spawncount so the client will detect the respawn
;1220:	client->ps.persistant[PERS_SPAWN_COUNT]++;
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
line 1221
;1221:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
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
line 1223
;1222:
;1223:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 2680
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1225
;1224:
;1225:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
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
line 1227
;1226:	// set max health
;1227:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $282
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
line 1228
;1228:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
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
LTI4 $432
ADDRLP4 3280
INDIRI4
CNSTI4 100
LEI4 $430
LABELV $432
line 1229
;1229:		client->pers.maxHealth = 100;
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 1230
;1230:	}
LABELV $430
line 1232
;1231:	// clear entity values
;1232:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
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
line 1233
;1233:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1235
;1234:
;1235:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1236
;1236:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3456
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1237
;1237:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 1238
;1238:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 1239
;1239:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $433
ASGNP4
line 1240
;1240:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 33554432
ASGNI4
line 1241
;1241:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 33619969
ASGNI4
line 1242
;1242:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 player_die
ASGNP4
line 1243
;1243:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTI4 0
ASGNI4
line 1244
;1244:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTI4 0
ASGNI4
line 1245
;1245:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 0
ASGNI4
line 1247
;1246:	
;1247:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1248
;1248:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1250
;1249:
;1250:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1254
;1251:
;1252:	
;1253:	// Regular
;1254:	if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3288
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3288
INDIRI4
NEI4 $434
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3288
INDIRI4
NEI4 $434
line 1255
;1255:	{	
line 1256
;1256:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1257
;1257:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $438
line 1258
;1258:			client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1259
;1259:		} else {
ADDRGP4 $439
JUMPV
LABELV $438
line 1260
;1260:			client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1261
;1261:		} 
LABELV $439
line 1263
;1262:			
;1263:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
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
line 1264
;1264:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1265
;1265:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1267
;1266:
;1267:	} 
LABELV $434
line 1271
;1268:
;1269:	// Trepidation Gametype
;1270:	// This is all gonna change once we introduce classes
;1271:	if (g_instagib.integer == 0 && g_GameMode.integer == 3)  // Shafe - Trep Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $441
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $441
line 1272
;1272:	{
line 1273
;1273:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1274
;1274:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $445
line 1275
;1275:			client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1276
;1276:		} else {
ADDRGP4 $446
JUMPV
LABELV $445
line 1277
;1277:			client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1278
;1278:		} 
LABELV $446
line 1280
;1279:			
;1280:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
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
line 1281
;1281:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1282
;1282:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1283
;1283:	}
LABELV $441
line 1286
;1284:	
;1285:	// Instagib
;1286:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $448
line 1287
;1287:	{
line 1289
;1288:		// InstaGib - weapons on spawning w/ammo  - Shafe Trep
;1289:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_RAILGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 128
ASGNI4
line 1290
;1290:		client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1292
;1291: 
;1292:	}
LABELV $448
line 1294
;1293:
;1294:	if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $451
line 1295
;1295:	{
line 1297
;1296:		// Arsenal does not run in instagib mode
;1297:		if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $454
line 1298
;1298:		{
line 1299
;1299:			trap_SendServerCommand( -1, "print \"Instagib is not compatable with Arsenal Gametype\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1300
;1300:			g_instagib.integer = 0; 
ADDRGP4 g_instagib+12
CNSTI4 0
ASGNI4
line 1301
;1301:		}
LABELV $454
line 1303
;1302:
;1303:	}
LABELV $451
line 1307
;1304:
;1305:
;1306:	// health will count down towards max_health
;1307:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
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
line 1309
;1308:
;1309:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1310
;1310:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1313
;1311:
;1312:	// the respawned flag will be cleared after the attack and jump keys come up
;1313:	client->ps.pm_flags |= PMF_RESPAWNED;
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
line 1315
;1314:
;1315:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3456
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
line 1316
;1316:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1318
;1317:
;1318:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
NEI4 $459
line 1320
;1319:
;1320:	} else {
ADDRGP4 $460
JUMPV
LABELV $459
line 1321
;1321:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1322
;1322:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1324
;1323:
;1324:		if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3304
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3304
INDIRI4
NEI4 $461
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3304
INDIRI4
NEI4 $461
line 1325
;1325:		{
line 1327
;1326:		// force the base weapon up
;1327:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1328
;1328:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1329
;1329:		} 
LABELV $461
line 1332
;1330:		
;1331:		// Hand out weapons in instagib
;1332:		if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $465
line 1333
;1333:		{
line 1334
;1334:			client->ps.weapon = WP_RAILGUN; // InstaGib
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 7
ASGNI4
line 1335
;1335:		}
LABELV $465
line 1338
;1336:
;1337:		// Hand out weapons for LMS
;1338:		if ((g_GameMode.integer == 2) && (g_instagib.integer == 0))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $468
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $468
line 1339
;1339:		{
line 1340
;1340:			wpn = irandom(1,9); // Lets clean this up so you can specify which weapons are allowed
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
line 1356
;1341:			
;1342:			/* This is such a bad way to do this
;1343:			if (g_StartGauntlet.integer == 0) && (wpn == 1) { wpn++; }
;1344:			if (g_StartMG.integer == 0) && (wpn == 2) { wpn++; }
;1345:			if (g_StartSG.integer == 0) && (wpn == 3) { wpn++; }
;1346:			if (g_StartGrenade.integer == 0) && (wpn == 4) { wpn++; }
;1347:			if (g_StartSingCan.integer == 0) && (wpn == 5) { wpn++; }
;1348:			if (g_StartSingFlame.integer == 0) && (wpn == 6) { wpn++; }
;1349:			if (g_StartGauss.integer == 0) && (wpn == 7) { wpn++; }
;1350:			if (g_StartPlasma.integer == 0) && (wpn == 8) { wpn++; }
;1351:			// If the bfg is disabled... Revert to the machine gun..
;1352:			// This is just flat out bad code.
;1353:			if (g_StartBFG.integer == 0) && (wpn == 9) { wpn = 2; } 
;1354:			*/
;1355:
;1356:			client->ps.stats[STAT_WEAPONS] = ( 1 << wpn );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1
ADDRLP4 3260
INDIRI4
LSHI4
ASGNI4
line 1357
;1357:			client->ps.ammo[wpn] = 9999;
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
line 1358
;1358:		}
LABELV $468
line 1361
;1359:		
;1360:		// Hand out weapons for arsenal
;1361:		if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $472
line 1362
;1362:		{
line 1363
;1363:			if (client->pers.h_gauntlet) 
ADDRLP4 4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $475
line 1364
;1364:			{
line 1365
;1365:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
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
line 1366
;1366:				client->ps.ammo[WP_GAUNTLET] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 9999
ASGNI4
line 1367
;1367:			}
LABELV $475
line 1369
;1368:			
;1369:			if (client->pers.h_mg) 
ADDRLP4 4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $477
line 1370
;1370:			{
line 1371
;1371:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
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
line 1372
;1372:			client->ps.ammo[WP_MACHINEGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 9999
ASGNI4
line 1373
;1373:			}
LABELV $477
line 1375
;1374:			
;1375:			if (client->pers.h_sg) 
ADDRLP4 4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $479
line 1376
;1376:			{
line 1377
;1377:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
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
line 1378
;1378:			client->ps.ammo[WP_SHOTGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 9999
ASGNI4
line 1379
;1379:			}
LABELV $479
line 1381
;1380:			
;1381:			if (client->pers.h_grenade ) 
ADDRLP4 4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $481
line 1382
;1382:			{
line 1383
;1383:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
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
line 1384
;1384:			client->ps.ammo[WP_GRENADE_LAUNCHER] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 9999
ASGNI4
line 1385
;1385:			}
LABELV $481
line 1387
;1386:
;1387:			if (client->pers.h_singcan) 
ADDRLP4 4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $483
line 1388
;1388:			{
line 1389
;1389:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
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
line 1390
;1390:			client->ps.ammo[WP_ROCKET_LAUNCHER] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 9999
ASGNI4
line 1391
;1391:			}
LABELV $483
line 1393
;1392:			
;1393:			if (client->pers.h_flame) 
ADDRLP4 4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
line 1394
;1394:			{
line 1395
;1395:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
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
line 1396
;1396:			client->ps.ammo[WP_LIGHTNING] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 9999
ASGNI4
line 1397
;1397:			}
LABELV $485
line 1399
;1398:			
;1399:			if (client->pers.h_gauss) 
ADDRLP4 4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $487
line 1400
;1400:			{
line 1401
;1401:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
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
line 1402
;1402:			client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1403
;1403:			}
LABELV $487
line 1405
;1404:	
;1405:			if (client->pers.h_plasma) 
ADDRLP4 4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $489
line 1406
;1406:			{
line 1407
;1407:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
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
line 1408
;1408:			client->ps.ammo[WP_PLASMAGUN] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 9999
ASGNI4
line 1409
;1409:			}
LABELV $489
line 1411
;1410:			
;1411:			if (client->pers.h_bfg) 
ADDRLP4 4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $491
line 1412
;1412:			{
line 1413
;1413:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
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
line 1414
;1414:			client->ps.ammo[WP_BFG] = 9999;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 9999
ASGNI4
line 1415
;1415:			}
LABELV $491
line 1418
;1416:			//client->ps.stats[STAT_WEAPONS] = ( 1 << wn );
;1417:			//client->ps.ammo[wn] = INFINITE;
;1418:		}
LABELV $472
line 1421
;1419:
;1420:
;1421:	}
LABELV $460
line 1427
;1422:
;1423:
;1424:
;1425:
;1426:	// don't allow full run speed for a bit
;1427:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
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
line 1428
;1428:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1430
;1429:
;1430:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 2664
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1431
;1431:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
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
line 1432
;1432:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 2596
ADDP4
CNSTI4 0
ASGNI4
line 1435
;1433:
;1434:	// set default animations
;1435:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1436
;1436:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1438
;1437:
;1438:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $496
line 1439
;1439:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1440
;1440:	} else {
ADDRGP4 $497
JUMPV
LABELV $496
line 1442
;1441:		// fire the targets of the spawn point
;1442:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1446
;1443:
;1444:		// select the highest weapon number available, after any
;1445:		// spawn given items have fired
;1446:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1447
;1447:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 11
ASGNI4
LABELV $499
line 1448
;1448:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
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
EQI4 $503
line 1449
;1449:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1450
;1450:				break;
ADDRGP4 $501
JUMPV
LABELV $503
line 1452
;1451:			}
;1452:		}
LABELV $500
line 1447
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $499
LABELV $501
line 1453
;1453:	}
LABELV $497
line 1457
;1454:
;1455:	// run a client frame to drop exactly to the floor,
;1456:	// initialize animations and other things
;1457:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1458
;1458:	ent->client->pers.cmd.serverTime = level.time;
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
line 1459
;1459:	ClientThink( ent-g_entities );
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
line 1462
;1460:
;1461:	// positively link the client, even if the command times are weird
;1462:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $507
line 1463
;1463:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
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
line 1464
;1464:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
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
line 1465
;1465:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1466
;1466:	}
LABELV $507
line 1469
;1467:
;1468:	// run the presend to set anything else
;1469:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1472
;1470:
;1471:	// Shafe - Trep - Headshots -- Best give em their head back when they respawn
;1472:	ent->client->noHead=qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2712
ADDP4
CNSTI4 0
ASGNI4
line 1475
;1473:
;1474:	// This is probably going to screw everything up.
;1475:	ent->client->pers.Eliminated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1478
;1476:	
;1477:	// clear entity state values
;1478:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
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
line 1479
;1479:}
LABELV $406
endproc ClientSpawn 3312 16
export BalanceTeams
proc BalanceTeams 16 8
line 1483
;1480:
;1481:
;1482:
;1483:team_t BalanceTeams(int team ) {
line 1487
;1484:
;1485:int		i;
;1486:int		c;	
;1487:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1490
;1488:int		t;	
;1489:
;1490:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1491
;1491:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $513
JUMPV
LABELV $510
line 1493
;1492:	
;1493:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3456
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
NEI4 $515
line 1494
;1494:			continue;
ADDRGP4 $511
JUMPV
LABELV $515
line 1496
;1495:		}
;1496:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3456
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
NEI4 $517
line 1498
;1497:			
;1498:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3456
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
NEI4 $519
line 1499
;1499:			{
line 1500
;1500:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1501
;1501:			} 
ADDRGP4 $520
JUMPV
LABELV $519
line 1503
;1502:			else 
;1503:			{ 
line 1504
;1504:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1505
;1505:			}
LABELV $520
line 1507
;1506:
;1507:		}
LABELV $517
line 1508
;1508:	}
LABELV $511
line 1491
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $513
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $510
line 1510
;1509:
;1510:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $521
line 1511
;1511:	{ 
line 1512
;1512:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1513
;1513:	}
LABELV $521
line 1515
;1514:
;1515:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $523
line 1516
;1516:	{	
line 1517
;1517:		t = level.clients[c].ps.persistant[PERS_SCORE];
ADDRLP4 12
CNSTI4 3456
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
line 1518
;1518:		SetTeam(&g_entities[c], "red"); 
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1519
;1519:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3456
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
line 1521
;1520:		//level.clients[c].sess.sessionTeam = TEAM_BLUE;
;1521:	}
LABELV $523
line 1523
;1522:	
;1523:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $525
line 1524
;1524:	{		
line 1525
;1525:		t = level.clients[c].ps.persistant[PERS_SCORE];	
ADDRLP4 12
CNSTI4 3456
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
line 1526
;1526:		SetTeam(&g_entities[c], "blue"); 
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $306
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1527
;1527:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3456
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
line 1529
;1528:		//level.clients[c].sess.sessionTeam = TEAM_RED;
;1529:	}
LABELV $525
line 1531
;1530:	
;1531:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $509
endproc BalanceTeams 16 8
export PlaceMC
proc PlaceMC 16 4
line 1541
;1532:	
;1533:}
;1534:
;1535:/*
;1536: When someone doesnt build an MC it builds one somewhere for em
;1537: This is a called it picks a player and puts it in their spot..
;1538: hopefully they'll move out of the way.
;1539: Quite a hack.. 
;1540:*/
;1541:team_t PlaceMC(int team ) {
line 1545
;1542:
;1543:int		i;
;1544:int		c;	
;1545:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1548
;1546:
;1547:
;1548:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1549
;1549:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $531
JUMPV
LABELV $528
line 1551
;1550:	
;1551:		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
ADDRLP4 12
CNSTI4 3456
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
NEI4 $533
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $533
line 1552
;1552:			continue;
ADDRGP4 $529
JUMPV
LABELV $533
line 1554
;1553:		}
;1554:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3456
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
NEI4 $535
line 1556
;1555:			
;1556:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3456
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
NEI4 $537
line 1557
;1557:			{
line 1558
;1558:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1559
;1559:			} 
ADDRGP4 $538
JUMPV
LABELV $537
line 1561
;1560:			else 
;1561:			{ 
line 1562
;1562:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1563
;1563:			}
LABELV $538
line 1565
;1564:
;1565:		}
LABELV $535
line 1566
;1566:	}
LABELV $529
line 1549
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $531
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $528
line 1568
;1567:
;1568:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $539
line 1569
;1569:	{ 
line 1570
;1570:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1571
;1571:	}
LABELV $539
line 1573
;1572:
;1573:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $541
line 1574
;1574:	{	
line 1576
;1575:		// Set it down for the blue team
;1576:		BuildMC(&g_entities[c]);
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
line 1577
;1577:	}
LABELV $541
line 1579
;1578:	
;1579:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $543
line 1580
;1580:	{	
line 1582
;1581:		// set it down for the red team
;1582:		BuildMC(&g_entities[c]);
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
line 1583
;1583:	}
LABELV $543
line 1585
;1584:	
;1585:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $527
endproc PlaceMC 16 4
export ClientDisconnect
proc ClientDisconnect 28 20
line 1604
;1586:	
;1587:}
;1588:
;1589:
;1590:
;1591:
;1592:/*
;1593:===========
;1594:ClientDisconnect
;1595:
;1596:Called when a player drops from the server.
;1597:Will not be called between levels.
;1598:
;1599:This should NOT be called directly by any game logic,
;1600:call trap_DropClient(), which will call this and do
;1601:server system housekeeping.
;1602:============
;1603:*/
;1604:void ClientDisconnect( int clientNum ) {
line 1611
;1605:	gentity_t	*ent;
;1606:	gentity_t	*tent;
;1607:	int			i;
;1608:
;1609:	// cleanup if we are kicking a bot that
;1610:	// hasn't spawned yet
;1611:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1613
;1612:
;1613:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 916
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1614
;1614:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $546
line 1615
;1615:		return;
ADDRGP4 $545
JUMPV
LABELV $546
line 1619
;1616:	}
;1617:
;1618:	// stop any following clients
;1619:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $551
JUMPV
LABELV $548
line 1620
;1620:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 3456
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
NEI4 $553
ADDRLP4 12
INDIRP4
CNSTI4 2560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $553
ADDRLP4 12
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $553
line 1622
;1621:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1622:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1623
;1623:			StopFollowing( &g_entities[i] );
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
line 1624
;1624:		}
LABELV $553
line 1625
;1625:	}
LABELV $549
line 1619
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $551
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $548
line 1628
;1626:
;1627:	// send effect if they were completely connected
;1628:	if ( ent->client->pers.connected == CON_CONNECTED 
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
NEI4 $555
ADDRLP4 12
INDIRP4
CNSTI4 2552
ADDP4
INDIRI4
CNSTI4 3
EQI4 $555
line 1629
;1629:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1630
;1630:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
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
line 1631
;1631:		tent->s.clientNum = ent->s.clientNum;
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
line 1635
;1632:
;1633:		// They don't get to take powerups with them!
;1634:		// Especially important for stuff like CTF flags
;1635:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1643
;1636:#ifdef MISSIONPACK
;1637:		TossClientPersistantPowerups( ent );
;1638:		if( g_gametype.integer == GT_HARVESTER ) {
;1639:			TossClientCubes( ent );
;1640:		}
;1641:#endif
;1642:
;1643:	}
LABELV $555
line 1645
;1644:
;1645:	 G_LogPrintf( "ClientDisconnect: %i [%s] (%s) \"%s\"\n", clientNum, ent->client->pers.ip, ent->client->pers.guid, ent->client->pers.netname );
ADDRGP4 $557
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
line 1648
;1646:	 //G_LogPrintf( "ClientDisconnect: %i \"%s\"\n", clientNum, ent->client->pers.netname );
;1647:	// if we are playing in tourney mode and losing, give a win to the other player
;1648:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $558
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 level+9140
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $558
ADDRGP4 level+16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $558
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $558
line 1650
;1649:		&& !level.intermissiontime
;1650:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1651
;1651:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 24
CNSTI4 3456
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
line 1652
;1652:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+96
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1653
;1653:	}
LABELV $558
line 1655
;1654:
;1655:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1656
;1656:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1657
;1657:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 0
ASGNI4
line 1658
;1658:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $567
ASGNP4
line 1659
;1659:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1660
;1660:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1661
;1661:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2552
ADDP4
CNSTI4 0
ASGNI4
line 1663
;1662:
;1663:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $568
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1665
;1664:
;1665:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1667
;1666:
;1667:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $569
line 1668
;1668:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1669
;1669:	}
LABELV $569
line 1670
;1670:}
LABELV $545
endproc ClientDisconnect 28 20
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
LABELV $568
byte 1 0
align 1
LABELV $567
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
LABELV $557
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
LABELV $457
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
LABELV $433
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $405
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
LABELV $404
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
LABELV $361
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
byte 1 49
byte 1 48
byte 1 45
byte 1 50
byte 1 57
byte 1 45
byte 1 48
byte 1 54
byte 1 32
byte 1 82
byte 1 101
byte 1 118
byte 1 32
byte 1 67
byte 1 32
byte 1 40
byte 1 49
byte 1 49
byte 1 47
byte 1 48
byte 1 53
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $357
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
LABELV $354
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
LABELV $353
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
LABELV $341
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
LABELV $338
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
LABELV $336
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $331
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
LABELV $328
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $325
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $323
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
LABELV $322
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
LABELV $321
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $320
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
LABELV $317
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
LABELV $316
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
LABELV $315
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $314
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $313
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
LABELV $309
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
LABELV $307
byte 1 98
byte 1 0
align 1
LABELV $306
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $302
byte 1 114
byte 1 0
align 1
LABELV $301
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $298
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $292
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
LABELV $291
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
LABELV $289
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
LABELV $282
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
LABELV $281
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
LABELV $276
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
LABELV $271
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $270
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
byte 1 67
byte 1 109
byte 1 100
byte 1 115
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
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $265
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
LABELV $264
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
LABELV $261
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
LABELV $258
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
LABELV $257
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
LABELV $254
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $253
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
LABELV $249
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
LABELV $147
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
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
