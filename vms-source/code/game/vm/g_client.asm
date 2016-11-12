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
;1:// 2016 Trepidation Licensed under the GPL2
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
CNSTI4 2720
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
CNSTI4 3480
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
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
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
CNSTI4 3480
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
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $202
line 545
;545:			if ( level.clients[i].sess.teamLeader )
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2580
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
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $271
line 776
;776:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 2564
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
CNSTI4 2556
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
CNSTI4 2580
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
CNSTI4 2572
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2576
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
CNSTI4 2556
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
CNSTI4 2572
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2576
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
CNSTI4 3480
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
CNSTI4 3480
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
CNSTI4 2496
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
CNSTI4 2496
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
CNSTI4 2556
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
;1031:	trap_SendServerCommand( clientNum, "print \"Trepidation Development Build 11-12-2016\n\"" );
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
CNSTI4 3480
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
CNSTI4 2556
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
proc ClientSpawn 3324 16
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
line 1156
;1152:
;1153:	// find a spawn point
;1154:	// do it before setting health back up, so farthest
;1155:	// ranging doesn't count this client
;1156:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $408
line 1157
;1157:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3268
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3268
INDIRP4
ASGNP4
line 1159
;1158:						spawn_origin, spawn_angles);
;1159:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $409
JUMPV
LABELV $408
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $410
line 1163
;1160:		// all base oriented team games use the CTF spawn points
;1161:	
;1162:		// Do Reverse CTF Here: g_ReverseCTF
;1163:		if (g_ReverseCTF.value == 1) {
ADDRGP4 g_ReverseCTF+8
INDIRF4
CNSTF4 1065353216
NEF4 $413
line 1165
;1164:
;1165:			if (client->sess.sessionTeam == TEAM_RED) 
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 1
NEI4 $416
line 1166
;1166:			{ 
line 1167
;1167:				spawnPoint = SelectCTFSpawnPoint ( 
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
ADDRLP4 3268
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3268
INDIRP4
ASGNP4
line 1171
;1168:				TEAM_BLUE, 
;1169:				client->pers.teamState.state, 
;1170:				spawn_origin, spawn_angles);
;1171:			} 
LABELV $416
line 1173
;1172:
;1173:			if (client->sess.sessionTeam == TEAM_BLUE) 
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 2
NEI4 $418
line 1174
;1174:			{ 
line 1175
;1175:				spawnPoint = SelectCTFSpawnPoint ( 				
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
ADDRLP4 3268
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3268
INDIRP4
ASGNP4
line 1179
;1176:				TEAM_RED, 
;1177:				client->pers.teamState.state, 
;1178:				spawn_origin, spawn_angles);
;1179:			} 
LABELV $418
line 1182
;1180:
;1181:
;1182:		}
LABELV $413
line 1185
;1183:		
;1184:		
;1185:		if (g_ReverseCTF.value == 0) 
ADDRGP4 g_ReverseCTF+8
INDIRF4
CNSTF4 0
NEF4 $411
line 1186
;1186:		{
line 1189
;1187:		
;1188:		
;1189:			spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 2556
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
ADDRLP4 3272
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3272
INDIRP4
ASGNP4
line 1194
;1190:							client->sess.sessionTeam, 
;1191:							client->pers.teamState.state, 
;1192:							spawn_origin, spawn_angles);
;1193:
;1194:		}
line 1195
;1195:	} else {
ADDRGP4 $411
JUMPV
LABELV $410
LABELV $423
line 1196
;1196:		do {
line 1198
;1197:			// the first spawn should be at a good looking spot
;1198:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 3272
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 3272
INDIRI4
NEI4 $426
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 3272
INDIRI4
EQI4 $426
line 1199
;1199:				client->pers.initialSpawn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1200
;1200:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3276
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3276
INDIRP4
ASGNP4
line 1201
;1201:			} else {
ADDRGP4 $427
JUMPV
LABELV $426
line 1204
;1202:				// don't spawn near existing origin if possible	
;1203:				
;1204:					spawnPoint = SelectSpawnPoint ( 
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 3276
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 3276
INDIRP4
ASGNP4
line 1208
;1205:					client->ps.origin, 
;1206:					spawn_origin, spawn_angles);
;1207:				
;1208:			}
LABELV $427
line 1212
;1209:
;1210:			// Tim needs to prevent bots from spawning at the initial point
;1211:			// on q3dm0...
;1212:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 3276
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 3276
INDIRI4
EQI4 $428
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3276
INDIRI4
EQI4 $428
line 1213
;1213:				continue;	// try again
ADDRGP4 $424
JUMPV
LABELV $428
line 1216
;1214:			}
;1215:			// just to be symetric, we have a nohumans option...
;1216:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 3280
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 3280
INDIRI4
EQI4 $425
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 3280
INDIRI4
NEI4 $425
line 1217
;1217:				continue;	// try again
line 1220
;1218:			}
;1219:
;1220:			break;
LABELV $424
line 1222
;1221:			
;1222:		} while ( 1 );
ADDRGP4 $423
JUMPV
LABELV $425
line 1223
;1223:	}
LABELV $411
LABELV $409
line 1224
;1224:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 1231
;1225:
;1226:	// always clear the kamikaze flag
;1227:	/* ent->s.eFlags &= ~EF_KAMIKAZE; */
;1228:
;1229:	// toggle the teleport bit so the client knows to not lerp
;1230:	// and never clear the voted flag
;1231:	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1232
;1232:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1236
;1233:
;1234://unlagged - backward reconciliation #3
;1235:	// we don't want players being backward-reconciled to the place they died
;1236:	G_ResetHistory( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 1238
;1237:	// and this is as good a time as any to clear the saved state
;1238:	client->saved.leveltime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 3468
ADDP4
CNSTI4 0
ASGNI4
line 1243
;1239://unlagged - backward reconciliation #3
;1240:
;1241:	// clear everything but the persistant data
;1242:
;1243:	saved = client->pers;
ADDRLP4 1132
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 2088
line 1244
;1244:	savedSess = client->sess;
ADDRLP4 3220
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRB
ASGNB 28
line 1245
;1245:	savedPing = client->ps.ping;
ADDRLP4 3248
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1247
;1246://	savedAreaBits = client->areabits;
;1247:	accuracy_hits = client->accuracy_hits;
ADDRLP4 3252
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
INDIRI4
ASGNI4
line 1248
;1248:	accuracy_shots = client->accuracy_shots;
ADDRLP4 3256
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
INDIRI4
ASGNI4
line 1249
;1249:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $432
line 1250
;1250:		persistant[i] = client->ps.persistant[i];
ADDRLP4 3268
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 3268
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 3268
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1251
;1251:	}
LABELV $433
line 1249
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
line 1252
;1252:	eventSequence = client->ps.eventSequence;
ADDRLP4 3260
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1254
;1253:
;1254:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3480
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1256
;1255:
;1256:	client->pers = saved;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1132
INDIRB
ASGNB 2088
line 1257
;1257:	client->sess = savedSess;
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
ADDRLP4 3220
INDIRB
ASGNB 28
line 1258
;1258:	client->ps.ping = savedPing;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 3248
INDIRI4
ASGNI4
line 1260
;1259://	client->areabits = savedAreaBits;
;1260:	client->accuracy_hits = accuracy_hits;
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
ADDRLP4 3252
INDIRI4
ASGNI4
line 1261
;1261:	client->accuracy_shots = accuracy_shots;
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
ADDRLP4 3256
INDIRI4
ASGNI4
line 1262
;1262:	client->lastkilled_client = -1;
ADDRLP4 0
INDIRP4
CNSTI4 2656
ADDP4
CNSTI4 -1
ASGNI4
line 1264
;1263:
;1264:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $436
line 1265
;1265:		client->ps.persistant[i] = persistant[i];
ADDRLP4 3268
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 3268
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 3268
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1266
;1266:	}
LABELV $437
line 1264
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
line 1267
;1267:	client->ps.eventSequence = eventSequence;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 3260
INDIRI4
ASGNI4
line 1269
;1268:	// increment the spawncount so the client will detect the respawn
;1269:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 3268
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 3268
INDIRP4
ADDRLP4 3268
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1270
;1270:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
ASGNI4
line 1272
;1271:
;1272:	client->airOutTime = level.time + 12000;
ADDRLP4 0
INDIRP4
CNSTI4 2684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1274
;1273:
;1274:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
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
line 1276
;1275:	// set max health
;1276:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $281
ARGP4
ADDRLP4 3276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3276
INDIRP4
ARGP4
ADDRLP4 3280
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 3280
INDIRI4
ASGNI4
line 1277
;1277:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 3284
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 1
LTI4 $443
ADDRLP4 3284
INDIRI4
CNSTI4 100
LEI4 $441
LABELV $443
line 1278
;1278:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 1279
;1279:	}
LABELV $441
line 1281
;1280:	// clear entity values
;1281:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
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
line 1282
;1282:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1284
;1283:
;1284:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1285
;1285:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 3480
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1286
;1286:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 1287
;1287:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 1288
;1288:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $444
ASGNP4
line 1289
;1289:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 33554432
ASGNI4
line 1290
;1290:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 33619969
ASGNI4
line 1291
;1291:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 player_die
ASGNP4
line 1292
;1292:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 1293
;1293:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 1294
;1294:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 0
ASGNI4
line 1296
;1295:	
;1296:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1297
;1297:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1299
;1298:
;1299:	client->ps.clientNum = index;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1303
;1300:
;1301:	
;1302:	// Regular
;1303:	if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3292
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3292
INDIRI4
NEI4 $445
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3292
INDIRI4
NEI4 $445
line 1304
;1304:	{	
line 1305
;1305:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1306
;1306:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $449
line 1307
;1307:			client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1308
;1308:		} else {
ADDRGP4 $450
JUMPV
LABELV $449
line 1309
;1309:			client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1310
;1310:		} 
LABELV $450
line 1312
;1311:			
;1312:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3296
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3296
INDIRP4
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1313
;1313:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1314
;1314:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1316
;1315:
;1316:	} 
LABELV $445
line 1320
;1317:
;1318:	// Trepidation Gametype
;1319:	// This is all gonna change once we introduce classes
;1320:	if (g_instagib.integer == 0 && g_GameMode.integer == 3)  // Shafe - Trep Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $452
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
NEI4 $452
line 1321
;1321:	{
line 1322
;1322:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1323
;1323:		if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $456
line 1324
;1324:			client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1325
;1325:		} else {
ADDRGP4 $457
JUMPV
LABELV $456
line 1326
;1326:			client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1327
;1327:		} 
LABELV $457
line 1329
;1328:			
;1329:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3296
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3296
INDIRP4
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1330
;1330:			client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1331
;1331:			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1332
;1332:	}
LABELV $452
line 1335
;1333:	
;1334:	// Instagib
;1335:	if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $459
line 1336
;1336:	{
line 1338
;1337:		// InstaGib - weapons on spawning w/ammo  - Shafe Trep
;1338:		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_RAILGUN );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 128
ASGNI4
line 1339
;1339:		client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1341
;1340: 
;1341:	}
LABELV $459
line 1343
;1342:
;1343:	if (g_GameMode.integer == 1) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $462
line 1344
;1344:	{
line 1346
;1345:		// Arsenal does not run in instagib mode
;1346:		if (g_instagib.integer == 1)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $465
line 1347
;1347:		{
line 1348
;1348:			trap_SendServerCommand( -1, "print \"Instagib is not compatable with Arsenal Gametype\n\"" );
CNSTI4 -1
ARGI4
ADDRGP4 $468
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1349
;1349:			g_instagib.integer = 0; 
ADDRGP4 g_instagib+12
CNSTI4 0
ASGNI4
line 1350
;1350:		}
LABELV $465
line 1352
;1351:
;1352:	}
LABELV $462
line 1356
;1353:
;1354:
;1355:	// health will count down towards max_health
;1356:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 3300
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
ADDRLP4 3300
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 3300
INDIRI4
ASGNI4
line 1358
;1357:
;1358:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1359
;1359:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1362
;1360:
;1361:	// the respawned flag will be cleared after the attack and jump keys come up
;1362:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 3304
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 3304
INDIRP4
ADDRLP4 3304
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1364
;1363:
;1364:	trap_GetUsercmd( client - level.clients, &client->pers.cmd );
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 3480
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
line 1365
;1365:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1367
;1366:
;1367:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $470
line 1369
;1368:
;1369:	} else {
ADDRGP4 $471
JUMPV
LABELV $470
line 1370
;1370:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1371
;1371:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1373
;1372:
;1373:		if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
ADDRLP4 3312
CNSTI4 0
ASGNI4
ADDRGP4 g_instagib+12
INDIRI4
ADDRLP4 3312
INDIRI4
NEI4 $472
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 3312
INDIRI4
NEI4 $472
line 1374
;1374:		{
line 1376
;1375:		// force the base weapon up
;1376:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1377
;1377:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1378
;1378:		} 
LABELV $472
line 1381
;1379:		
;1380:		// Hand out weapons in instagib
;1381:		if (g_instagib.integer == 1) 
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $476
line 1382
;1382:		{
line 1383
;1383:			client->ps.weapon = WP_RAILGUN; // InstaGib
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 7
ASGNI4
line 1384
;1384:		}
LABELV $476
line 1387
;1385:
;1386:		// Hand out weapons for LMS
;1387:		if ((g_GameMode.integer == 2) || (g_GameMode.integer == 4) && (g_instagib.integer == 0))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $484
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 4
NEI4 $479
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $479
LABELV $484
line 1388
;1388:		{
line 1389
;1389:			wpn = irandom(1,9); // Lets clean this up so you can specify which weapons are allowed
CNSTI4 1
ARGI4
CNSTI4 9
ARGI4
ADDRLP4 3316
ADDRGP4 irandom
CALLI4
ASGNI4
ADDRLP4 3264
ADDRLP4 3316
INDIRI4
ASGNI4
line 1405
;1390:			
;1391:			/* This is such a bad way to do this
;1392:			if (g_StartGauntlet.integer == 0) && (wpn == 1) { wpn++; }
;1393:			if (g_StartMG.integer == 0) && (wpn == 2) { wpn++; }
;1394:			if (g_StartSG.integer == 0) && (wpn == 3) { wpn++; }
;1395:			if (g_StartGrenade.integer == 0) && (wpn == 4) { wpn++; }
;1396:			if (g_StartSingCan.integer == 0) && (wpn == 5) { wpn++; }
;1397:			if (g_StartSingFlame.integer == 0) && (wpn == 6) { wpn++; }
;1398:			if (g_StartGauss.integer == 0) && (wpn == 7) { wpn++; }
;1399:			if (g_StartPlasma.integer == 0) && (wpn == 8) { wpn++; }
;1400:			// If the bfg is disabled... Revert to the machine gun..
;1401:			// This is just flat out bad code.
;1402:			if (g_StartBFG.integer == 0) && (wpn == 9) { wpn = 2; } 
;1403:			*/
;1404:
;1405:			client->ps.stats[STAT_WEAPONS] = ( 1 << wpn );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1
ADDRLP4 3264
INDIRI4
LSHI4
ASGNI4
line 1406
;1406:			client->ps.ammo[wpn] = 9999;
ADDRLP4 3264
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
line 1407
;1407:		}
LABELV $479
line 1410
;1408:		
;1409:		// Hand out weapons for arsenal
;1410:		if ((g_GameMode.integer == 1) || (g_GameMode.integer == 999))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $489
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 999
NEI4 $485
LABELV $489
line 1411
;1411:		{
line 1412
;1412:			if (client->pers.h_gauntlet) 
ADDRLP4 0
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $490
line 1413
;1413:			{
line 1414
;1414:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1415
;1415:				client->ps.ammo[WP_GAUNTLET] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 9999
ASGNI4
line 1416
;1416:			}
LABELV $490
line 1418
;1417:			
;1418:			if (client->pers.h_mg) 
ADDRLP4 0
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 1419
;1419:			{
line 1420
;1420:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1421
;1421:			client->ps.ammo[WP_MACHINEGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 9999
ASGNI4
line 1422
;1422:			}
LABELV $492
line 1424
;1423:			
;1424:			if (client->pers.h_sg) 
ADDRLP4 0
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $494
line 1425
;1425:			{
line 1426
;1426:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1427
;1427:			client->ps.ammo[WP_SHOTGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 9999
ASGNI4
line 1428
;1428:			}
LABELV $494
line 1430
;1429:			
;1430:			if (client->pers.h_grenade ) 
ADDRLP4 0
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $496
line 1431
;1431:			{
line 1432
;1432:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1433
;1433:			client->ps.ammo[WP_GRENADE_LAUNCHER] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 9999
ASGNI4
line 1434
;1434:			}
LABELV $496
line 1436
;1435:
;1436:			if (client->pers.h_singcan) 
ADDRLP4 0
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $498
line 1437
;1437:			{
line 1438
;1438:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1439
;1439:			client->ps.ammo[WP_ROCKET_LAUNCHER] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 9999
ASGNI4
line 1440
;1440:			}
LABELV $498
line 1442
;1441:			
;1442:			if (client->pers.h_flame) 
ADDRLP4 0
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $500
line 1443
;1443:			{
line 1444
;1444:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
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
line 1445
;1445:			client->ps.ammo[WP_LIGHTNING] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 9999
ASGNI4
line 1446
;1446:			}
LABELV $500
line 1448
;1447:			
;1448:			if (client->pers.h_gauss) 
ADDRLP4 0
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $502
line 1449
;1449:			{
line 1450
;1450:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1451
;1451:			client->ps.ammo[WP_RAILGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
CNSTI4 9999
ASGNI4
line 1452
;1452:			}
LABELV $502
line 1454
;1453:	
;1454:			if (client->pers.h_plasma) 
ADDRLP4 0
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $504
line 1455
;1455:			{
line 1456
;1456:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1457
;1457:			client->ps.ammo[WP_PLASMAGUN] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 9999
ASGNI4
line 1458
;1458:			}
LABELV $504
line 1460
;1459:			
;1460:			if (client->pers.h_bfg) 
ADDRLP4 0
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $506
line 1461
;1461:			{
line 1462
;1462:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
ADDRLP4 3316
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1463
;1463:			client->ps.ammo[WP_BFG] = 9999;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 9999
ASGNI4
line 1464
;1464:			}
LABELV $506
line 1467
;1465:			//client->ps.stats[STAT_WEAPONS] = ( 1 << wn );
;1466:			//client->ps.ammo[wn] = INFINITE;
;1467:		}
LABELV $485
line 1470
;1468:
;1469:
;1470:	}
LABELV $471
line 1476
;1471:
;1472:
;1473:
;1474:
;1475:	// don't allow full run speed for a bit
;1476:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 3312
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 3312
INDIRP4
ADDRLP4 3312
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1477
;1477:	client->ps.pm_time = 100;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1479
;1478:
;1479:	client->respawnTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2668
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1480
;1480:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 2672
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1481
;1481:	client->latched_buttons = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2600
ADDP4
CNSTI4 0
ASGNI4
line 1484
;1482:
;1483:	// set default animations
;1484:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1485
;1485:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1487
;1486:
;1487:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $511
line 1488
;1488:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1489
;1489:	} else {
ADDRGP4 $512
JUMPV
LABELV $511
line 1491
;1490:		// fire the targets of the spawn point
;1491:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1495
;1492:
;1493:		// select the highest weapon number available, after any
;1494:		// spawn given items have fired
;1495:		client->ps.weapon = 1;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1496
;1496:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 4
CNSTI4 11
ASGNI4
LABELV $514
line 1497
;1497:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
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
EQI4 $518
line 1498
;1498:				client->ps.weapon = i;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1499
;1499:				break;
ADDRGP4 $516
JUMPV
LABELV $518
line 1501
;1500:			}
;1501:		}
LABELV $515
line 1496
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $514
LABELV $516
line 1502
;1502:	}
LABELV $512
line 1506
;1503:
;1504:	// run a client frame to drop exactly to the floor,
;1505:	// initialize animations and other things
;1506:	client->ps.commandTime = level.time - 100;
ADDRLP4 0
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1507
;1507:	client->pers.cmd.serverTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1508
;1508:	ClientThink( ent-g_entities );
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
line 1511
;1509:
;1510:	// positively link the client, even if the command times are weird
;1511:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
EQI4 $522
line 1512
;1512:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
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
line 1513
;1513:		VectorCopy( client->ps.origin, ent->r.currentOrigin );
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
line 1514
;1514:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1515
;1515:	}
LABELV $522
line 1518
;1516:
;1517:	// It seems that the values ARE already cleaned at respawn, but just to be sure -Vincent
;1518:	ent->r.svFlags &= ~SVF_CUSTOM_GRAVITY;
ADDRLP4 3316
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 3316
INDIRP4
ADDRLP4 3316
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 1519
;1519:	ent->r.svFlags &= ~SVF_CUSTOM_SPEED;
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
CNSTI4 -8193
BANDI4
ASGNI4
line 1523
;1520:	// Above: Actual reset is done at immobilizer thinking (prevents double checking, was fixed there)... -Vincent
;1521:
;1522:	// run the presend to set anything else
;1523:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1526
;1524:
;1525:	// Shafe - Trep - Headshots -- Best give em their head back when they respawn
;1526:	client->noHead=qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 1529
;1527:
;1528:	// This is probably going to screw everything up.
;1529:	client->pers.Eliminated = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 0
ASGNI4
line 1530
;1530:	client->pers.Frozen = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2488
ADDP4
CNSTI4 0
ASGNI4
line 1533
;1531:	
;1532:	// clear entity state values
;1533:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
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
line 1534
;1534:}
LABELV $407
endproc ClientSpawn 3324 16
export BalanceTeams
proc BalanceTeams 16 8
line 1538
;1535:
;1536:
;1537:
;1538:team_t BalanceTeams(int team ) {
line 1542
;1539:
;1540:int		i;
;1541:int		c;	
;1542:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1545
;1543:int		t;	
;1544:
;1545:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1546
;1546:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $528
JUMPV
LABELV $525
line 1548
;1547:	
;1548:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 3480
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
NEI4 $530
line 1549
;1549:			continue;
ADDRGP4 $526
JUMPV
LABELV $530
line 1551
;1550:		}
;1551:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $532
line 1553
;1552:			
;1553:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3480
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
NEI4 $534
line 1554
;1554:			{
line 1555
;1555:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1556
;1556:			} 
ADDRGP4 $535
JUMPV
LABELV $534
line 1558
;1557:			else 
;1558:			{ 
line 1559
;1559:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1560
;1560:			}
LABELV $535
line 1562
;1561:
;1562:		}
LABELV $532
line 1563
;1563:	}
LABELV $526
line 1546
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $528
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $525
line 1565
;1564:
;1565:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $536
line 1566
;1566:	{ 
line 1567
;1567:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1568
;1568:	}
LABELV $536
line 1570
;1569:
;1570:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $538
line 1571
;1571:	{	
line 1572
;1572:		t = level.clients[c].ps.persistant[PERS_SCORE];
ADDRLP4 12
CNSTI4 3480
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
line 1573
;1573:		SetTeam(&g_entities[c], "red"); 
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
line 1574
;1574:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3480
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
line 1576
;1575:		//level.clients[c].sess.sessionTeam = TEAM_BLUE;
;1576:	}
LABELV $538
line 1578
;1577:	
;1578:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $540
line 1579
;1579:	{		
line 1580
;1580:		t = level.clients[c].ps.persistant[PERS_SCORE];	
ADDRLP4 12
CNSTI4 3480
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
line 1581
;1581:		SetTeam(&g_entities[c], "blue"); 
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
line 1582
;1582:		level.clients[c].ps.persistant[PERS_SCORE] = t;
CNSTI4 3480
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
line 1584
;1583:		//level.clients[c].sess.sessionTeam = TEAM_RED;
;1584:	}
LABELV $540
line 1586
;1585:	
;1586:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $524
endproc BalanceTeams 16 8
export PlaceMC
proc PlaceMC 16 4
line 1599
;1587:	
;1588:}
;1589:
;1590:
;1591:
;1592: //ent->r.svFlags & SVF_BOT 
;1593:/*
;1594: When someone doesnt build an MC it builds one somewhere for em
;1595: This is a called it picks a player and puts it in their spot..
;1596: hopefully they'll move out of the way.
;1597: Quite a hack.. 
;1598:*/
;1599:team_t PlaceMC(int team ) {
line 1603
;1600:
;1601:int		i;
;1602:int		c;	
;1603:int		b = 0;	
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1606
;1604:
;1605:
;1606:	c = 999;	
ADDRLP4 4
CNSTI4 999
ASGNI4
line 1607
;1607:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $546
JUMPV
LABELV $543
line 1609
;1608:	
;1609:		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
ADDRLP4 12
CNSTI4 3480
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
NEI4 $548
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $548
line 1610
;1610:			continue;
ADDRGP4 $544
JUMPV
LABELV $548
line 1612
;1611:		}
;1612:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2556
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $550
line 1614
;1613:			
;1614:			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
CNSTI4 3480
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
NEI4 $552
line 1615
;1615:			{
line 1616
;1616:				c = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1617
;1617:			} 
ADDRGP4 $553
JUMPV
LABELV $552
line 1619
;1618:			else 
;1619:			{ 
line 1620
;1620:				b = i; 
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1621
;1621:			}
LABELV $553
line 1623
;1622:
;1623:		}
LABELV $550
line 1624
;1624:	}
LABELV $544
line 1607
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $546
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $543
line 1626
;1625:
;1626:	if (c == 999) 
ADDRLP4 4
INDIRI4
CNSTI4 999
NEI4 $554
line 1627
;1627:	{ 
line 1628
;1628:		c = b; 
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1629
;1629:	}
LABELV $554
line 1631
;1630:
;1631:	if (team == TEAM_BLUE) 
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $556
line 1632
;1632:	{	
line 1634
;1633:		// Set it down for the blue team
;1634:		BuildMC(&g_entities[c]);
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
line 1635
;1635:	}
LABELV $556
line 1637
;1636:	
;1637:	if (team == TEAM_RED) 
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $558
line 1638
;1638:	{	
line 1640
;1639:		// set it down for the red team
;1640:		BuildMC(&g_entities[c]);
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
line 1641
;1641:	}
LABELV $558
line 1643
;1642:	
;1643:	return c;
ADDRLP4 4
INDIRI4
RETI4
LABELV $542
endproc PlaceMC 16 4
export ClientDisconnect
proc ClientDisconnect 28 20
line 1662
;1644:	
;1645:}
;1646:
;1647:
;1648:
;1649:
;1650:/*
;1651:===========
;1652:ClientDisconnect
;1653:
;1654:Called when a player drops from the server.
;1655:Will not be called between levels.
;1656:
;1657:This should NOT be called directly by any game logic,
;1658:call trap_DropClient(), which will call this and do
;1659:server system housekeeping.
;1660:============
;1661:*/
;1662:void ClientDisconnect( int clientNum ) {
line 1669
;1663:	gentity_t	*ent;
;1664:	gentity_t	*tent;
;1665:	int			i;
;1666:
;1667:	// cleanup if we are kicking a bot that
;1668:	// hasn't spawned yet
;1669:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1671
;1670:
;1671:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 924
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1672
;1672:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $561
line 1673
;1673:		return;
ADDRGP4 $560
JUMPV
LABELV $561
line 1677
;1674:	}
;1675:
;1676:	// stop any following clients
;1677:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $566
JUMPV
LABELV $563
line 1678
;1678:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 3480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
NEI4 $568
ADDRLP4 12
INDIRP4
CNSTI4 2564
ADDP4
INDIRI4
CNSTI4 2
NEI4 $568
ADDRLP4 12
INDIRP4
CNSTI4 2568
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $568
line 1680
;1679:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1680:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1681
;1681:			StopFollowing( &g_entities[i] );
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
line 1682
;1682:		}
LABELV $568
line 1683
;1683:	}
LABELV $564
line 1677
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $566
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $563
line 1686
;1684:
;1685:	// send effect if they were completely connected
;1686:	if ( ent->client->pers.connected == CON_CONNECTED 
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
NEI4 $570
ADDRLP4 12
INDIRP4
CNSTI4 2556
ADDP4
INDIRI4
CNSTI4 3
EQI4 $570
line 1687
;1687:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1688
;1688:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
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
line 1689
;1689:		tent->s.clientNum = ent->s.clientNum;
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
line 1693
;1690:
;1691:		// They don't get to take powerups with them!
;1692:		// Especially important for stuff like CTF flags
;1693:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1701
;1694:#ifdef MISSIONPACK
;1695:		TossClientPersistantPowerups( ent );
;1696:		if( g_gametype.integer == GT_HARVESTER ) {
;1697:			TossClientCubes( ent );
;1698:		}
;1699:#endif
;1700:
;1701:	}
LABELV $570
line 1703
;1702:
;1703:	 G_LogPrintf( "ClientDisconnect: %i [%s] (%s) \"%s\"\n", clientNum, ent->client->pers.ip, ent->client->pers.guid, ent->client->pers.netname );
ADDRGP4 $572
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
CNSTI4 2529
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 2496
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
line 1706
;1704:	 //G_LogPrintf( "ClientDisconnect: %i \"%s\"\n", clientNum, ent->client->pers.netname );
;1705:	// if we are playing in tourney mode and losing, give a win to the other player
;1706:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $573
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 level+9140
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $573
ADDRGP4 level+16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $573
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $573
line 1708
;1707:		&& !level.intermissiontime
;1708:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1709
;1709:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 24
CNSTI4 3480
ADDRGP4 level+96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2572
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
line 1710
;1710:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+96
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1711
;1711:	}
LABELV $573
line 1713
;1712:
;1713:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1714
;1714:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1715
;1715:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 0
ASGNI4
line 1716
;1716:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $582
ASGNP4
line 1717
;1717:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1718
;1718:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1719
;1719:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2556
ADDP4
CNSTI4 0
ASGNI4
line 1721
;1720:
;1721:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $583
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1723
;1722:
;1723:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1725
;1724:
;1725:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $584
line 1726
;1726:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1727
;1727:	}
LABELV $584
line 1728
;1728:}
LABELV $560
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
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_mapfile
import g_ReverseCTF
import g_GuassRate
import g_GuassSelfDamage
import g_GuassKnockBack
import g_GuassJump
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
LABELV $583
byte 1 0
align 1
LABELV $582
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
LABELV $572
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
LABELV $468
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
LABELV $444
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
byte 1 32
byte 1 49
byte 1 49
byte 1 45
byte 1 49
byte 1 50
byte 1 45
byte 1 50
byte 1 48
byte 1 49
byte 1 54
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
