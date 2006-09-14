export BroadCastSound
code
proc BroadCastSound 36 8
file "../g_combat.c"
line 9
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:// Shafe - Trep - Utility Function - Move this!  
;9:void BroadCastSound(char *path) {
line 12
;10:	gentity_t*te;
;11:	vec3_t origin;
;12:	if(!strlen(path))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $56
line 13
;13:	return;
ADDRGP4 $55
JUMPV
LABELV $56
line 14
;14:	origin[0] = origin[1] = origin[2] = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 15
;15:	te = G_TempEntity(origin, EV_GLOBAL_SOUND);
ADDRLP4 0
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 24
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 16
;16:	te->s.eventParm = G_SoundIndex(path);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 17
;17:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 18
;18:}
LABELV $55
endproc BroadCastSound 36 8
export ScorePlum
proc ScorePlum 12 8
line 26
;19:
;20:
;21:/*
;22:============
;23:ScorePlum
;24:============
;25:*/
;26:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 29
;27:	gentity_t *plum;
;28:
;29:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 69
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 31
;30:	// only send this temp entity to a single client
;31:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 32
;32:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 34
;33:	//
;34:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 35
;35:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 36
;36:}
LABELV $60
endproc ScorePlum 12 8
export AddScore
proc AddScore 12 12
line 45
;37:
;38:/*
;39:============
;40:AddScore
;41:
;42:Adds score to both the client and his team
;43:============
;44:*/
;45:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 47
;46:
;47:		if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $62
line 48
;48:			return;
ADDRGP4 $61
JUMPV
LABELV $62
line 51
;49:		}
;50:		// no scoring during pre-match warmup
;51:		if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $64
line 52
;52:			return;
ADDRGP4 $61
JUMPV
LABELV $64
line 55
;53:		}
;54:		// show score plum
;55:		ScorePlum(ent, origin, score);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 ScorePlum
CALLV
pop
line 57
;56:		//
;57:		ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 248
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 58
;58:		ent->client->pers.TrueScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 60
;59:
;60:	if (g_GameMode.integer != 3)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 3
EQI4 $67
line 61
;61:	{
line 62
;62:		if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $70
line 63
;63:			level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+52
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $70
line 65
;64:	
;65:	}
LABELV $67
line 66
;66:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 67
;67:}
LABELV $61
endproc AddScore 12 12
export TossClientItems
proc TossClientItems 36 12
line 76
;68:
;69:/*
;70:=================
;71:TossClientItems
;72:
;73:Toss the weapon and powerups for the killed player
;74:=================
;75:*/
;76:void TossClientItems( gentity_t *self ) {
line 84
;77:	gitem_t		*item;
;78:	int			weapon;
;79:	float		angle;
;80:	int			i;
;81:	gentity_t	*drop;
;82:
;83:	// drop the weapon if not a gauntlet or machinegun
;84:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 90
;85:
;86:	// make a special check to see if they are changing to a new
;87:	// weapon that isn't the mg or gauntlet.  Without this, a client
;88:	// can pick up a weapon, be killed, and not drop the weapon because
;89:	// their weapon change hasn't completed yet and they are still holding the MG.
;90:	if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) {
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $77
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $75
LABELV $77
line 91
;91:		if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $78
line 92
;92:			weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 93
;93:		}
LABELV $78
line 94
;94:		if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $80
line 95
;95:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 96
;96:		}
LABELV $80
line 97
;97:	}
LABELV $75
line 100
;98:
;99:	// Shafe - Trep - Dont drop weapons In Instagib
;100:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $82
line 101
;101:	{
line 102
;102:		if ( weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && 
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $85
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $85
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $85
line 103
;103:			self->client->ps.ammo[ weapon ] ) {
line 105
;104:			// find the item type for this weapon
;105:			item = BG_FindItemForWeapon( weapon );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 108
;106:	
;107:			// spawn the item
;108:			Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 109
;109:		}
LABELV $85
line 110
;110:	} // End Shafe - Trep instagib
LABELV $82
line 113
;111:
;112:	// drop all the powerups if not in teamplay
;113:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $87
line 114
;114:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 115
;115:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $90
line 116
;116:			if ( self->client->ps.powerups[ i ] > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $94
line 117
;117:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 118
;118:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $97
line 119
;119:					continue;
ADDRGP4 $91
JUMPV
LABELV $97
line 121
;120:				}
;121:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 123
;122:				// decide how many seconds it has left
;123:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 124
;124:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
GEI4 $100
line 125
;125:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 1
ASGNI4
line 126
;126:				}
LABELV $100
line 127
;127:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 128
;128:			}
LABELV $94
line 129
;129:		}
LABELV $91
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $90
line 130
;130:	}
LABELV $87
line 131
;131:}
LABELV $74
endproc TossClientItems 36 12
export LookAtKiller
proc LookAtKiller 52 4
line 221
;132:
;133:#ifdef MISSIONPACK
;134:
;135:/*
;136:=================
;137:TossClientCubes
;138:=================
;139:*/
;140:extern gentity_t	*neutralObelisk;
;141:
;142:void TossClientCubes( gentity_t *self ) {
;143:	gitem_t		*item;
;144:	gentity_t	*drop;
;145:	vec3_t		velocity;
;146:	vec3_t		angles;
;147:	vec3_t		origin;
;148:
;149:	self->client->ps.generic1 = 0;
;150:
;151:	// this should never happen but we should never
;152:	// get the server to crash due to skull being spawned in
;153:	if (!G_EntitiesFree()) {
;154:		return;
;155:	}
;156:
;157:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;158:		item = BG_FindItem( "Red Cube" );
;159:	}
;160:	else {
;161:		item = BG_FindItem( "Blue Cube" );
;162:	}
;163:
;164:	angles[YAW] = (float)(level.time % 360);
;165:	angles[PITCH] = 0;	// always forward
;166:	angles[ROLL] = 0;
;167:
;168:	AngleVectors( angles, velocity, NULL, NULL );
;169:	VectorScale( velocity, 150, velocity );
;170:	velocity[2] += 200 + crandom() * 50;
;171:
;172:	if( neutralObelisk ) {
;173:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;174:		origin[2] += 44;
;175:	} else {
;176:		VectorClear( origin ) ;
;177:	}
;178:
;179:	drop = LaunchItem( item, origin, velocity );
;180:
;181:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;182:	drop->think = G_FreeEntity;
;183:	drop->spawnflags = self->client->sess.sessionTeam;
;184:}
;185:
;186:
;187:/*
;188:=================
;189:TossClientPersistantPowerups
;190:=================
;191:*/
;192:void TossClientPersistantPowerups( gentity_t *ent ) {
;193:	gentity_t	*powerup;
;194:
;195:	if( !ent->client ) {
;196:		return;
;197:	}
;198:
;199:	if( !ent->client->persistantPowerup ) {
;200:		return;
;201:	}
;202:
;203:	powerup = ent->client->persistantPowerup;
;204:
;205:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;206:	powerup->s.eFlags &= ~EF_NODRAW;
;207:	powerup->r.contents = CONTENTS_TRIGGER;
;208:	trap_LinkEntity( powerup );
;209:
;210:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;211:	ent->client->persistantPowerup = NULL;
;212:}
;213:#endif
;214:
;215:
;216:/*
;217:==================
;218:LookAtKiller
;219:==================
;220:*/
;221:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 225
;222:	vec3_t		dir;
;223:	vec3_t		angles;
;224:
;225:	if ( attacker && attacker != self ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $103
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $103
line 226
;226:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 227
;227:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $107
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $107
line 228
;228:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 24
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 229
;229:	} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 230
;230:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 231
;231:		return;
ADDRGP4 $102
JUMPV
LABELV $108
LABELV $104
line 234
;232:	}
;233:
;234:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 236
;235:
;236:	angles[YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
line 237
;237:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 238
;238:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 239
;239:}
LABELV $102
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 12 12
line 246
;240:
;241:/*
;242:==================
;243:GibEntity
;244:==================
;245:*/
;246:void GibEntity( gentity_t *self, int killer ) {
line 251
;247:	gentity_t *ent;
;248:	int i;
;249:
;250:	//if this entity still has kamikaze
;251:	if (self->s.eFlags & EF_KAMIKAZE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $114
line 253
;252:		// check if there is a kamikaze timer around for this owner
;253:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $116
line 254
;254:			ent = &g_entities[i];
ADDRLP4 0
CNSTI4 872
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 255
;255:			if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
line 256
;256:				continue;
ADDRGP4 $117
JUMPV
LABELV $120
line 257
;257:			if (ent->activator != self)
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $122
line 258
;258:				continue;
ADDRGP4 $117
JUMPV
LABELV $122
line 259
;259:			if (strcmp(ent->classname, "kamikaze timer"))
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $124
line 260
;260:				continue;
ADDRGP4 $117
JUMPV
LABELV $124
line 261
;261:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 262
;262:			break;
ADDRGP4 $118
JUMPV
LABELV $117
line 253
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $116
LABELV $118
line 264
;263:		}
;264:	}
LABELV $114
line 265
;265:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 266
;266:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 267
;267:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 268
;268:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 269
;269:}
LABELV $113
endproc GibEntity 12 12
export GibEntity_Headshot
proc GibEntity_Headshot 0 12
line 273
;270:
;271:
;272:// Shafe - Trep - Headshot Function
;273:void GibEntity_Headshot( gentity_t *self, int killer ) {
line 274
;274:	G_AddEvent( self, EV_GIB_PLAYER_HEADSHOT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 67
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 275
;275:	self->client->noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
CNSTI4 1
ASGNI4
line 276
;276:}
LABELV $127
endproc GibEntity_Headshot 0 12
export body_die
proc body_die 0 8
line 284
;277:// Shafe - Trep - End Headshot Function
;278:
;279:/*
;280:==================
;281:body_die
;282:==================
;283:*/
;284:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 285
;285:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $129
line 286
;286:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 288
;287:	}
;288:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $131
line 289
;289:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 290
;290:		return;
ADDRGP4 $128
JUMPV
LABELV $131
line 293
;291:	}
;292:
;293:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 294
;294:}
LABELV $128
endproc body_die 0 8
export IsOutOfWeapons
proc IsOutOfWeapons 0 0
line 297
;295:
;296:// Shafe - Trep - Arsenal Mod
;297:extern qboolean IsOutOfWeapons( gentity_t *ent ) {
line 299
;298:
;299:	if (g_GameMode.integer != 1) { return qfalse; } // Do nothing unless it's arsenal
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $135
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $135
line 301
;300:
;301:	if (ent->client->pers.h_gauntlet) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $138
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $138
line 302
;302:	if (ent->client->pers.h_mg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $140
line 303
;303:	if (ent->client->pers.h_sg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $142
line 304
;304:	if (ent->client->pers.h_grenade) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $144
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $144
line 305
;305:	if (ent->client->pers.h_singcan) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $146
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $146
line 306
;306:	if (ent->client->pers.h_flame) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $148
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $148
line 307
;307:	if (ent->client->pers.h_gauss) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $150
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $150
line 308
;308:	if (ent->client->pers.h_plasma) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $152
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $152
line 309
;309:	if (ent->client->pers.h_bfg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $154
CNSTI4 0
RETI4
ADDRGP4 $134
JUMPV
LABELV $154
line 311
;310:
;311:	return qtrue;
CNSTI4 1
RETI4
LABELV $134
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
address $156
address $157
address $158
address $159
address $160
address $161
address $162
address $163
address $164
address $165
address $166
address $167
address $168
address $169
address $170
address $171
address $172
address $173
address $174
address $175
address $176
address $177
address $178
address $179
address $180
export CheckAlmostCapture
code
proc CheckAlmostCapture 56 12
line 385
;312:}
;313:
;314:
;315:// these are just for logging, the client prints its own messages
;316:char	*modNames[] = {
;317:	"MOD_UNKNOWN",
;318:	"MOD_SHOTGUN",
;319:	"MOD_GAUNTLET",
;320:	"MOD_MACHINEGUN",
;321:	"MOD_GRENADE",
;322:	"MOD_GRENADE_SPLASH",
;323:	"MOD_ROCKET",
;324:	"MOD_ROCKET_SPLASH",
;325:	"MOD_PLASMA",
;326:	"MOD_PLASMA_SPLASH",
;327:	"MOD_RAILGUN",
;328:	"MOD_LIGHTNING",
;329:	"MOD_BFG",
;330:	"MOD_BFG_SPLASH",
;331:	"MOD_WATER",
;332:	"MOD_SLIME",
;333:	"MOD_LAVA",
;334:	"MOD_CRUSH",
;335:	"MOD_TELEFRAG",
;336:	"MOD_FALLING",
;337:	"MOD_SUICIDE",
;338:	"MOD_TARGET_LASER",
;339:	"MOD_TRIGGER_HURT",
;340:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;341:#ifdef MISSIONPACK
;342:	"MOD_NAIL",
;343:	"MOD_CHAINGUN",
;344:	"MOD_PROXIMITY_MINE",
;345:#endif
;346:	"MOD_GRAPPLE"
;347:};
;348:
;349:#ifdef MISSIONPACK
;350:/*
;351:==================
;352:Kamikaze_DeathActivate
;353:==================
;354:*/
;355:void Kamikaze_DeathActivate( gentity_t *ent ) {
;356:	G_StartKamikaze(ent);
;357:	G_FreeEntity(ent);
;358:}
;359:
;360:/*
;361:==================
;362:Kamikaze_DeathTimer
;363:==================
;364:*/
;365:void Kamikaze_DeathTimer( gentity_t *self ) {
;366:	gentity_t *ent;
;367:
;368:	ent = G_Spawn();
;369:	ent->classname = "kamikaze timer";
;370:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;371:	ent->r.svFlags |= SVF_NOCLIENT;
;372:	ent->think = Kamikaze_DeathActivate;
;373:	ent->nextthink = level.time + 5 * 1000;
;374:
;375:	ent->activator = self;
;376:}
;377:
;378:#endif
;379:
;380:/*
;381:==================
;382:CheckAlmostCapture
;383:==================
;384:*/
;385:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 391
;386:	gentity_t	*ent;
;387:	vec3_t		dir;
;388:	char		*classname;
;389:
;390:	// if this player was carrying a flag
;391:	if ( self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $185
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $185
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $182
LABELV $185
line 393
;392:		self->client->ps.powerups[PW_BLUEFLAG] ||
;393:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 395
;394:		// get the goal flag this player should have been going for
;395:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $186
line 396
;396:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $189
line 397
;397:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $191
ASGNP4
line 398
;398:			}
ADDRGP4 $187
JUMPV
LABELV $189
line 399
;399:			else {
line 400
;400:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $192
ASGNP4
line 401
;401:			}
line 402
;402:		}
ADDRGP4 $187
JUMPV
LABELV $186
line 403
;403:		else {
line 404
;404:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $193
line 405
;405:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $192
ASGNP4
line 406
;406:			}
ADDRGP4 $194
JUMPV
LABELV $193
line 407
;407:			else {
line 408
;408:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $191
ASGNP4
line 409
;409:			}
LABELV $194
line 410
;410:		}
LABELV $187
line 411
;411:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $195
line 413
;412:		do
;413:		{
line 414
;414:			ent = G_Find(ent, FOFS(classname), classname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 532
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 415
;415:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $196
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $198
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $195
LABELV $198
line 417
;416:		// if we found the destination flag and it's not picked up
;417:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $199
line 419
;418:			// if the player was *very* close
;419:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 420
;420:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $203
line 421
;421:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 422
;422:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $205
line 423
;423:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 424
;424:				}
LABELV $205
line 425
;425:			}
LABELV $203
line 426
;426:		}
LABELV $199
line 427
;427:	}
LABELV $182
line 428
;428:}
LABELV $181
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 435
;429:
;430:/*
;431:==================
;432:CheckAlmostScored
;433:==================
;434:*/
;435:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 441
;436:	gentity_t	*ent;
;437:	vec3_t		dir;
;438:	char		*classname;
;439:
;440:	// if the player was carrying cubes
;441:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 442
;442:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $210
line 443
;443:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $212
ASGNP4
line 444
;444:		}
ADDRGP4 $211
JUMPV
LABELV $210
line 445
;445:		else {
line 446
;446:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $213
ASGNP4
line 447
;447:		}
LABELV $211
line 448
;448:		ent = G_Find(NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 532
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 450
;449:		// if we found the destination obelisk
;450:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 452
;451:			// if the player was *very* close
;452:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 453
;453:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $218
line 454
;454:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 455
;455:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $220
line 456
;456:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 457
;457:				}
LABELV $220
line 458
;458:			}
LABELV $218
line 459
;459:		}
LABELV $214
line 460
;460:	}
LABELV $208
line 461
;461:}
LABELV $207
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $223
skip 4
align 4
LABELV $369
skip 4
export player_die
code
proc player_die 120 28
line 472
;462:
;463:
;464:
;465:/*
;466:==================
;467:player_die
;468:==================
;469:*/
;470:extern int CountSurvivors();
;471:
;472:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 489
;473:	gentity_t	*ent;
;474:	int			anim;
;475:	int			contents;
;476:	int			killer;
;477:	int			i;
;478:	char		*killerName, *obit;
;479:	// Shafe - Trep - For Arsenal
;480:	int			tmpW;
;481:	int			tmpCnt;
;482:	static		int deathNum;
;483:	//gentity_t	*xte;
;484:
;485:
;486:
;487:
;488:
;489:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $224
line 490
;490:		return;
ADDRGP4 $222
JUMPV
LABELV $224
line 493
;491:	}
;492:
;493:	if ( level.intermissiontime ) {
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $226
line 494
;494:		return;
ADDRGP4 $222
JUMPV
LABELV $226
line 503
;495:	}
;496:
;497:
;498:
;499:
;500:
;501://unlagged - backward reconciliation #2
;502:	// make sure the body shows up in the client's current position
;503:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 507
;504://unlagged - backward reconciliation #2
;505:
;506:	// check for an almost capture
;507:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 509
;508:	// check for a player that almost brought in cubes
;509:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 512
;510:
;511:
;512:	if (self->client && self->client->hook)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $229
ADDRLP4 36
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $229
line 513
;513:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $229
line 521
;514:#ifdef MISSIONPACK
;515:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;516:		self->client->ps.eFlags &= ~EF_TICKING;
;517:		self->activator->think = G_FreeEntity;
;518:		self->activator->nextthink = level.time;
;519:	}
;520:#endif
;521:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 524
;522:
;523:	// Shafe - Trep - Clear out the PDG
;524:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 525
;525:	VectorClear( self->teleloc ); 
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 527
;526:
;527:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $231
line 528
;528:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 529
;529:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $233
line 530
;530:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 531
;531:		} else {
ADDRGP4 $232
JUMPV
LABELV $233
line 532
;532:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $235
ASGNP4
line 533
;533:		}
line 534
;534:	} else {
ADDRGP4 $232
JUMPV
LABELV $231
line 535
;535:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 536
;536:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $236
ASGNP4
line 537
;537:	}
LABELV $232
line 539
;538:
;539:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $239
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $237
LABELV $239
line 540
;540:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 541
;541:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $236
ASGNP4
line 542
;542:	}
LABELV $237
line 544
;543:
;544:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 56
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $242
ADDRLP4 56
INDIRI4
CVIU4 4
CNSTU4 25
LTU4 $240
LABELV $242
line 545
;545:		obit = "<bad obituary>";
ADDRLP4 24
ADDRGP4 $243
ASGNP4
line 546
;546:	} else {
ADDRGP4 $241
JUMPV
LABELV $240
line 547
;547:		obit = modNames[ meansOfDeath ];
ADDRLP4 24
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 548
;548:	}
LABELV $241
line 550
;549:
;550:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $244
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 555
;551:		killer, self->s.number, meansOfDeath, killerName, 
;552:		self->client->pers.netname, obit );
;553:
;554:	// broadcast the death event to everyone
;555:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 62
ARGI4
ADDRLP4 64
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
ASGNP4
line 556
;556:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 557
;557:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 558
;558:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 559
;559:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 432
ADDP4
CNSTI4 32
ASGNI4
line 561
;560:
;561:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 563
;562:
;563:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 565
;564:
;565:	if (attacker && attacker->client) {
ADDRLP4 72
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
CNSTU4 0
ASGNU4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $245
ADDRLP4 72
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $245
line 566
;566:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2592
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 568
;567:
;568:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 80
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRP4
CVPU4 4
EQU4 $249
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $247
LABELV $249
line 569
;569:			AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 572
;570:			
;571:
;572:		} else {
ADDRGP4 $246
JUMPV
LABELV $247
line 573
;573:			AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 575
;574:
;575:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $250
line 578
;576:				
;577:				// play humiliation on player
;578:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 581
;579:
;580:				// add the sprite over the player's head
;581:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 582
;582:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 583
;583:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2616
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 586
;584:
;585:				// also play humiliation on target
;586:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 587
;587:			}
LABELV $250
line 591
;588:
;589:			// check for two kills in a short amount of time
;590:			// if this is close enough to the last kill, give a reward sound
;591:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2624
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $253
line 593
;592:				// play excellent on player
;593:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 596
;594:
;595:				// add the sprite over the player's head
;596:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 597
;597:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 598
;598:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2616
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 599
;599:			}
LABELV $253
line 600
;600:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2624
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 602
;601:
;602:		}
line 603
;603:	} else {
ADDRGP4 $246
JUMPV
LABELV $245
line 604
;604:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 605
;605:	}
LABELV $246
line 608
;606:
;607:	// Add team bonuses
;608:	Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 611
;609:
;610:	// if I committed suicide, the flag does not fall, it returns.
;611:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $258
line 612
;612:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $260
line 613
;613:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 614
;614:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:		}
ADDRGP4 $261
JUMPV
LABELV $260
line 616
;616:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $262
line 617
;617:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 618
;618:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 619
;619:		}
ADDRGP4 $263
JUMPV
LABELV $262
line 620
;620:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $264
line 621
;621:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 622
;622:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 623
;623:		}
LABELV $264
LABELV $263
LABELV $261
line 624
;624:	}
LABELV $258
line 627
;625:
;626:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;627:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 80
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 80
INDIRI4
ASGNI4
line 628
;628:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $266
line 629
;629:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 630
;630:	}
ADDRGP4 $267
JUMPV
LABELV $266
line 631
;631:	else {
line 632
;632:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $268
line 633
;633:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 634
;634:		}
ADDRGP4 $269
JUMPV
LABELV $268
line 635
;635:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 636
;636:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 637
;637:		}
ADDRGP4 $271
JUMPV
LABELV $270
line 638
;638:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $272
line 639
;639:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 640
;640:		}
LABELV $272
LABELV $271
LABELV $269
line 641
;641:	}
LABELV $267
line 650
;642:#ifdef MISSIONPACK
;643:	TossClientPersistantPowerups( self );
;644:	if( g_gametype.integer == GT_HARVESTER ) {
;645:		TossClientCubes( self );
;646:	}
;647:#endif
;648:
;649:	
;650:	if ((level.firstStrike == qfalse) && (!level.warmupTime))
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 level+9236
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $274
ADDRGP4 level+16
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $274
line 651
;651:	{
line 652
;652:		if (self != attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $278
line 653
;653:		{
line 654
;654:			level.firstStrike = qtrue;
ADDRGP4 level+9236
CNSTI4 1
ASGNI4
line 655
;655:			BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $281
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 656
;656:			trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $282
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 657
;657:		}
LABELV $278
line 658
;658:	}
LABELV $274
line 660
;659:
;660:	if (level.warmupTime != 0)
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $283
line 661
;661:	{
line 662
;662:		level.firstStrike == qfalse;
line 664
;663:		//trap_SendServerCommand( -1, va("print \"%s FS Is FALSE!!\n\"",attacker->client->pers.netname));	
;664:	} 
LABELV $283
line 668
;665:		
;666:	
;667:		// Shafe - Trep - Arsenal Stuff
;668:		if ( g_GameMode.integer > 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $287
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $287
ADDRGP4 level+16
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $287
line 669
;669:		{
line 670
;670:			tmpW = self->s.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 672
;671:
;672:			if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $291
line 673
;673:			{
line 674
;674:				if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 16
INDIRI4
CNSTI4 9
NEI4 $294
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $294
line 675
;675:				if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 16
INDIRI4
CNSTI4 8
NEI4 $296
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $296
line 676
;676:				if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 7
NEI4 $298
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $298
line 677
;677:				if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 6
NEI4 $300
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $300
line 678
;678:				if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 5
NEI4 $302
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $302
line 679
;679:				if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 4
NEI4 $304
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $304
line 680
;680:				if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 3
NEI4 $306
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $306
line 681
;681:				if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $308
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $308
line 682
;682:				if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $310
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $310
line 684
;683:
;684:			}
LABELV $291
line 687
;685:			
;686:			
;687:			if ((g_GameMode.integer == 2) || (IsOutOfWeapons(self)))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $315
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 IsOutOfWeapons
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $312
LABELV $315
line 688
;688:			{
line 691
;689:				
;690:				// Arsenal Message
;691:				if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $316
line 692
;692:				{
line 693
;693:					trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $319
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 694
;694:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $320
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 695
;695:				}
LABELV $316
line 698
;696:
;697:				// LMS Message
;698:				if (g_GameMode.integer == 2)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $321
line 699
;699:				{
line 700
;700:					trap_SendServerCommand( -1, va("print \"%s Has Been Eliminated!!\n\"",self->client->pers.netname));
ADDRGP4 $324
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 701
;701:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Has Been Eliminated.\n\"", self->client->pers.netname) );
ADDRGP4 $325
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 702
;702:				}
LABELV $321
line 705
;703:				
;704:				// Send them to Spec
;705:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 96
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 706
;706:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 707
;707:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $326
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 709
;708:				// Set The Last Attacker In Case The Winner Blows Themself up on the winning shot
;709:				level.lastClient == attacker->client;
line 711
;710:
;711:				tmpCnt = (CountSurvivors());
ADDRLP4 100
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 100
INDIRI4
ASGNI4
line 714
;712:
;713:						
;714:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 28
INDIRI4
ADDRGP4 level+9228
INDIRI4
EQI4 $328
line 715
;715:				{
line 717
;716:
;717:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9228
ADDRLP4 28
INDIRI4
ASGNI4
line 720
;718:			
;719:			
;720:					if (tmpCnt == 5) 
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $332
line 721
;721:					{
line 722
;722:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $334
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 723
;723:					}
LABELV $332
line 725
;724:					
;725:					if (tmpCnt == 4) 
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $335
line 726
;726:					{
line 727
;727:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $337
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 728
;728:					}
LABELV $335
line 730
;729:
;730:					if (tmpCnt == 3) 
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $338
line 731
;731:					{
line 732
;732:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $340
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 733
;733:					}
LABELV $338
line 735
;734:
;735:					if (tmpCnt == 2) 
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $341
line 736
;736:					{
line 738
;737:						
;738:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $343
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 739
;739:					}
LABELV $341
line 741
;740:
;741:					if (tmpCnt == 1) 
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $344
line 742
;742:					{
line 743
;743:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $346
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 745
;744:
;745:					}
LABELV $344
line 747
;746:				
;747:				}
LABELV $328
line 748
;748:			} 
LABELV $312
line 750
;749:
;750:		}
LABELV $287
line 753
;751:		// End Arsenal Stuff
;752:
;753:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 756
;754:	// send updated scores to any clients that are following this one,
;755:	// or they would get stale scoreboards
;756:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $347
line 759
;757:		gclient_t	*client;
;758:
;759:		client = &level.clients[i];
ADDRLP4 92
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 760
;760:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 92
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $352
line 761
;761:			continue;
ADDRGP4 $348
JUMPV
LABELV $352
line 763
;762:		}
;763:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 92
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $354
line 764
;764:			continue;
ADDRGP4 $348
JUMPV
LABELV $354
line 766
;765:		}
;766:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 92
INDIRP4
CNSTI4 2504
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $356
line 767
;767:			Cmd_Score_f( g_entities + i );
CNSTI4 872
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 768
;768:		}
LABELV $356
line 769
;769:	}
LABELV $348
line 756
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $350
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $347
line 771
;770:
;771:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 1
ASGNI4
line 773
;772:
;773:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 774
;774:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 775
;775:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 67108864
ASGNI4
line 777
;776:
;777:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 778
;778:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 779
;779:	LookAtKiller (self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 781
;780:
;781:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 783
;782:
;783:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 785
;784:
;785:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
CNSTF4 3238002688
ASGNF4
line 789
;786:
;787:	// don't allow respawn until the death anim is done
;788:	// g_forcerespawn may force spawning at some later time
;789:	self->client->respawnTime = level.time + 1700;  // This is the real line
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2604
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 794
;790:	
;791:
;792:
;793:	// remove powerups
;794:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 796
;795:
;796:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $359
line 797
;797:	{
line 798
;798:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $361
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 799
;799:	}
LABELV $359
line 804
;800:
;801:
;802:
;803:	// never gib in a nodrop
;804:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $368
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $368
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $368
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $365
LABELV $368
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $362
LABELV $365
line 806
;805:		// gib death
;806:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 807
;807:	} else {
ADDRGP4 $363
JUMPV
LABELV $362
line 811
;808:		// normal death
;809:		static int i;
;810:
;811:		switch ( i ) {
ADDRLP4 96
ADDRGP4 $369
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $372
ADDRLP4 96
INDIRI4
CNSTI4 1
EQI4 $373
ADDRLP4 96
INDIRI4
CNSTI4 2
EQI4 $374
ADDRGP4 $370
JUMPV
LABELV $372
line 813
;812:		case 0:
;813:			anim = BOTH_DEATH1;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 814
;814:			break;
ADDRGP4 $371
JUMPV
LABELV $373
line 816
;815:		case 1:
;816:			anim = BOTH_DEATH2;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 817
;817:			break;
ADDRGP4 $371
JUMPV
LABELV $374
LABELV $370
line 820
;818:		case 2:
;819:		default:
;820:			anim = BOTH_DEATH3;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 821
;821:			break;
LABELV $371
line 826
;822:		}
;823:
;824:		// for the no-blood option, we need to prevent the health
;825:		// from going to gib level
;826:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $375
line 827
;827:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -39
ASGNI4
line 828
;828:		}
LABELV $375
line 830
;829:
;830:		self->client->ps.legsAnim = 
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 104
CNSTI4 128
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
ADDRLP4 104
INDIRI4
BANDI4
ADDRLP4 104
INDIRI4
BXORI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 832
;831:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;832:		self->client->ps.torsoAnim = 
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 112
CNSTI4 128
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
ADDRLP4 112
INDIRI4
BANDI4
ADDRLP4 112
INDIRI4
BXORI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 835
;833:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;834:
;835:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $369
INDIRI4
CNSTI4 59
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 838
;836:
;837:		// Shafe - Trep Headshot //////////////////////////////////////////
;838:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $377
line 839
;839:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $378
JUMPV
LABELV $377
line 841
;840:		else
;841:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
CNSTI4 0
ASGNI4
LABELV $378
line 845
;842:		// Shafe - Trep - End Headshot /////////////////////////////
;843:
;844:		// the body can still be gibbed
;845:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 body_die
ASGNP4
line 848
;846:
;847:		// globally cycle through the different death animations
;848:		i = ( i + 1 ) % 3;
ADDRLP4 116
ADDRGP4 $369
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 857
;849:
;850:
;851:
;852:#ifdef MISSIONPACK
;853:		if (self->s.eFlags & EF_KAMIKAZE) {
;854:			Kamikaze_DeathTimer( self );
;855:		}
;856:#endif
;857:	}
LABELV $363
line 862
;858:
;859:	
;860:
;861:
;862:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 864
;863:
;864:}
LABELV $222
endproc player_die 120 28
export CheckArmor
proc CheckArmor 20 4
line 873
;865:
;866:
;867:/*
;868:================
;869:CheckArmor
;870:================
;871:*/
;872:int CheckArmor (gentity_t *ent, int damage, int dflags)
;873:{
line 878
;874:	gclient_t	*client;
;875:	int			save;
;876:	int			count;
;877:
;878:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $380
line 879
;879:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $379
JUMPV
LABELV $380
line 881
;880:
;881:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 883
;882:
;883:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $382
line 884
;884:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $379
JUMPV
LABELV $382
line 886
;885:
;886:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $384
line 887
;887:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $379
JUMPV
LABELV $384
line 890
;888:
;889:	// armor
;890:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 891
;891:	save = ceil( damage * ARMOR_PROTECTION );
CNSTF4 1059648963
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 892
;892:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $386
line 893
;893:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $386
line 895
;894:
;895:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $388
line 896
;896:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $379
JUMPV
LABELV $388
line 898
;897:
;898:	client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 900
;899:
;900:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $379
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 908
;901:}
;902:
;903:/*
;904:================
;905:RaySphereIntersections
;906:================
;907:*/
;908:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 917
;909:	float b, c, d, t;
;910:
;911:	//	| origin - (point + t * dir) | = radius
;912:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;913:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;914:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;915:
;916:	// normalize dir so a = 1
;917:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 918
;918:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 4
CNSTF4 1073741824
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
MULF4
ASGNF4
line 919
;919:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRLP4 60
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ADDRLP4 60
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
SUBF4
ASGNF4
line 924
;920:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;921:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;922:		radius * radius;
;923:
;924:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 925
;925:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $391
line 926
;926:		t = (- b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 72
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 927
;927:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 928
;928:		t = (- b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 84
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 929
;929:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 930
;930:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $390
JUMPV
LABELV $391
line 932
;931:	}
;932:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $393
line 933
;933:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 934
;934:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 935
;935:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $390
JUMPV
LABELV $393
line 937
;936:	}
;937:	return 0;
CNSTI4 0
RETI4
LABELV $390
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 1004
;938:}
;939:
;940:#ifdef MISSIONPACK
;941:/*
;942:================
;943:G_InvulnerabilityEffect
;944:================
;945:*/
;946:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;947:	gentity_t	*impact;
;948:	vec3_t		intersections[2], vec;
;949:	int			n;
;950:
;951:	if ( !targ->client ) {
;952:		return qfalse;
;953:	}
;954:	VectorCopy(dir, vec);
;955:	VectorInverse(vec);
;956:	// sphere model radius = 42 units
;957:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;958:	if (n > 0) {
;959:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;960:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;961:		vectoangles(vec, impact->s.angles);
;962:		impact->s.angles[0] += 90;
;963:		if (impact->s.angles[0] > 360)
;964:			impact->s.angles[0] -= 360;
;965:		if ( impactpoint ) {
;966:			VectorCopy( intersections[0], impactpoint );
;967:		}
;968:		if ( bouncedir ) {
;969:			VectorCopy( vec, bouncedir );
;970:			VectorNormalize( bouncedir );
;971:		}
;972:		return qtrue;
;973:	}
;974:	else {
;975:		return qfalse;
;976:	}
;977:}
;978:#endif
;979:/*
;980:============
;981:T_Damage
;982:
;983:targ		entity that is being damaged
;984:inflictor	entity that is causing the damage
;985:attacker	entity that caused the inflictor to damage targ
;986:	example: targ=monster, inflictor=rocket, attacker=player
;987:
;988:dir			direction of the attack for knockback
;989:point		point at which the damage is being inflicted, used for headshots
;990:damage		amount of damage being inflicted
;991:knockback	force to be applied against targ as a result of the damage
;992:
;993:inflictor, attacker, dir, and point can be NULL for environmental effects
;994:
;995:dflags		these flags are used to control how T_Damage works
;996:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;997:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;998:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;999:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;1000:============
;1001:*/
;1002:
;1003:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;1004:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1022
;1005:	gclient_t	*client;
;1006:	int			take;
;1007:	int			save;
;1008:	int			asave;
;1009:	int			knockback;
;1010:	int			max;
;1011:	// Shafe - Trep - Headshot
;1012:	float		z_ratio;
;1013:	float		z_rel;
;1014:	int			height;
;1015:	float		targ_maxs2;
;1016:	// Shafe - Trep - End Headshot
;1017:
;1018:#ifdef MISSIONPACK
;1019:	vec3_t		bouncedir, impactpoint;
;1020:#endif
;1021:
;1022:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $396
line 1023
;1023:		return;
ADDRGP4 $395
JUMPV
LABELV $396
line 1028
;1024:	}
;1025:
;1026:	// the intermission has allready been qualified for, so don't
;1027:	// allow any extra scoring
;1028:	if ( level.intermissionQueued ) {
ADDRGP4 level+9136
INDIRI4
CNSTI4 0
EQI4 $398
line 1029
;1029:		return;
ADDRGP4 $395
JUMPV
LABELV $398
line 1041
;1030:	}
;1031:#ifdef MISSIONPACK
;1032:	if ( targ->client && mod != MOD_JUICED) {
;1033:		if ( targ->client->invulnerabilityTime > level.time) {
;1034:			if ( dir && point ) {
;1035:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1036:			}
;1037:			return;
;1038:		}
;1039:	}
;1040:#endif
;1041:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $401
line 1042
;1042:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+891184
ASGNP4
line 1043
;1043:	}
LABELV $401
line 1044
;1044:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $404
line 1045
;1045:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+891184
ASGNP4
line 1046
;1046:	}
LABELV $404
line 1049
;1047:
;1048:	// shootable doors / buttons don't actually have any health
;1049:	if ( targ->s.eType == ET_MOVER ) {
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $407
line 1050
;1050:		if ( targ->use && targ->moverState == MOVER_POS1 || targ->moverState == ROTATOR_POS1) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $412
ADDRLP4 44
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $411
LABELV $412
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 4
NEI4 $395
LABELV $411
line 1051
;1051:			targ->use( targ, inflictor, attacker );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CALLV
pop
line 1052
;1052:		}
line 1053
;1053:		return;
ADDRGP4 $395
JUMPV
LABELV $407
line 1057
;1054:	}
;1055:
;1056:	// If we shot a breakable item subtract the damage from its health and try to break it
;1057: 	if ( targ->s.eType == ET_BREAKABLE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
NEI4 $413
line 1058
;1058:         targ->health -= damage;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRFP4 20
INDIRI4
SUBI4
ASGNI4
line 1059
;1059: 		G_BreakGlass( targ, point, mod );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 G_BreakGlass
CALLV
pop
line 1060
;1060: 		return;
ADDRGP4 $395
JUMPV
LABELV $413
line 1069
;1061: 	}
;1062:#ifdef MISSIONPACK
;1063:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1064:		return;
;1065:	}
;1066:#endif
;1067:	// reduce damage by the attacker's handicap value
;1068:	// unless they are rocket jumping
;1069:	if ( attacker->client && attacker != targ ) {
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $415
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $415
line 1070
;1070:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 1076
;1071:#ifdef MISSIONPACK
;1072:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1073:			max /= 2;
;1074:		}
;1075:#endif
;1076:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1077
;1077:	}
LABELV $415
line 1079
;1078:
;1079:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ASGNP4
line 1081
;1080:
;1081:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $417
line 1082
;1082:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 1083
;1083:			return;
ADDRGP4 $395
JUMPV
LABELV $419
line 1085
;1084:		}
;1085:	}
LABELV $417
line 1087
;1086:
;1087:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 1088
;1088:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1089
;1089:	} else {
ADDRGP4 $422
JUMPV
LABELV $421
line 1090
;1090:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1091
;1091:	}
LABELV $422
line 1093
;1092:
;1093:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1094
;1094:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $423
line 1095
;1095:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1096
;1096:	}
LABELV $423
line 1097
;1097:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $425
line 1098
;1098:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1099
;1099:	}
LABELV $425
line 1100
;1100:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $427
line 1101
;1101:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1102
;1102:	}
LABELV $427
line 1105
;1103:
;1104:	// figure momentum add, even if the damage won't be taken
;1105:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $429
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $429
line 1109
;1106:		vec3_t	kvel;
;1107:		float	mass;
;1108:
;1109:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1111
;1110:
;1111:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 64
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 72
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 48
ADDRLP4 64
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
ADDRLP4 72
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
ADDRLP4 72
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 60
INDIRF4
DIVF4
MULF4
ASGNF4
line 1112
;1112:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 48+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 48+8
INDIRF4
ADDF4
ASGNF4
line 1116
;1113:
;1114:		// set the timer so that the other client can't cancel
;1115:		// out the movement immediately
;1116:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $438
line 1119
;1117:			int		t;
;1118:
;1119:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1120
;1120:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $440
line 1121
;1121:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1122
;1122:			}
LABELV $440
line 1123
;1123:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $442
line 1124
;1124:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1125
;1125:			}
LABELV $442
line 1126
;1126:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 1127
;1127:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1128
;1128:		}
LABELV $438
line 1129
;1129:	}
LABELV $429
line 1132
;1130:
;1131:	// check for completely getting out of the damage
;1132:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $444
line 1139
;1133:
;1134:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1135:		// if the attacker was on the same team
;1136:#ifdef MISSIONPACK
;1137:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1138:#else	
;1139:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRP4
CVPU4 4
EQU4 $446
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $446
line 1141
;1140:#endif
;1141:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $448
line 1142
;1142:				return;
ADDRGP4 $395
JUMPV
LABELV $448
line 1144
;1143:			}
;1144:		}
LABELV $446
line 1157
;1145:#ifdef MISSIONPACK
;1146:		if (mod == MOD_PROXIMITY_MINE) {
;1147:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1148:				return;
;1149:			}
;1150:			if (targ == attacker) {
;1151:				return;
;1152:			}
;1153:		}
;1154:#endif
;1155:
;1156:		// check for godmode
;1157:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $451
line 1158
;1158:			return;
ADDRGP4 $395
JUMPV
LABELV $451
line 1160
;1159:		}
;1160:	}
LABELV $444
line 1164
;1161:
;1162:	// battlesuit protects from all radius damage (but takes knockback)
;1163:	// and protects 50% against all damage
;1164:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $453
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $453
line 1165
;1165:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1166
;1166:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $457
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $455
LABELV $457
line 1167
;1167:			return;
ADDRGP4 $395
JUMPV
LABELV $455
line 1169
;1168:		}
;1169:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1170
;1170:	}
LABELV $453
line 1173
;1171:
;1172:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1173:	if ( attacker->client && targ != attacker && targ->health > 0
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $458
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRP4
CVPU4 4
EQU4 $458
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $458
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $458
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $458
line 1175
;1174:			&& targ->s.eType != ET_MISSILE
;1175:			&& targ->s.eType != ET_GENERAL) {
line 1176
;1176:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $460
line 1177
;1177:			attacker->client->ps.persistant[PERS_HITS]--;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1178
;1178:		} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 1179
;1179:			attacker->client->ps.persistant[PERS_HITS]++;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1180
;1180:		}
LABELV $461
line 1181
;1181:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
BORI4
ASGNI4
line 1182
;1182:	}
LABELV $458
line 1186
;1183:
;1184:	// always give half damage if hurting self
;1185:	// calculated after knockback, so rocket jumping works
;1186:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $462
line 1187
;1187:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1188
;1188:	}
LABELV $462
line 1190
;1189:
;1190:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $464
line 1191
;1191:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1192
;1192:	}
LABELV $464
line 1193
;1193:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1194
;1194:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1197
;1195:
;1196:	// save some from armor
;1197:	asave = CheckArmor (targ, take, dflags);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 68
INDIRI4
ASGNI4
line 1198
;1198:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1200
;1199:
;1200:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $466
line 1201
;1201:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $469
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 1203
;1202:			targ->health, take, asave );
;1203:	}
LABELV $466
line 1208
;1204:
;1205:	// add to the damage inflicted on a player this frame
;1206:	// the total will be turned into screen blends and view angle kicks
;1207:	// at the end of the frame
;1208:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $471
line 1209
;1209:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $473
line 1210
;1210:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1211
;1211:		} else {
ADDRGP4 $474
JUMPV
LABELV $473
line 1212
;1212:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1213
;1213:		}
LABELV $474
line 1214
;1214:		client->damage_armor += asave;
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 2552
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1215
;1215:		client->damage_blood += take;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 2556
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1216
;1216:		client->damage_knockback += knockback;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1217
;1217:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $475
line 1218
;1218:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1219
;1219:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 1220
;1220:		} else {
ADDRGP4 $476
JUMPV
LABELV $475
line 1221
;1221:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRB
ASGNB 12
line 1222
;1222:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 1
ASGNI4
line 1223
;1223:		}
LABELV $476
line 1224
;1224:	}
LABELV $471
line 1230
;1225:
;1226:	// See if it's the player hurting the emeny flag carrier
;1227:#ifdef MISSIONPACK
;1228:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1229:#else	
;1230:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $477
line 1232
;1231:#endif
;1232:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1233
;1233:	}
LABELV $477
line 1235
;1234:
;1235:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $480
line 1237
;1236:		// set the last client who damaged the target
;1237:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2596
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1238
;1238:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1239
;1239:	}
LABELV $480
line 1242
;1240:
;1241:	// Shafe - Trep - Headshots
;1242:	if (targ->client && attacker->client && targ->health > 0)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 524
ASGNI4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $482
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $482
ADDRLP4 72
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
LEI4 $482
line 1243
;1243:	{   
line 1245
;1244:		// let's say only railgun can do head shots
;1245:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $484
line 1246
;1246:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ASGNF4
line 1249
;1247:	
;1248:			// handling crouching
;1249:			if(targ->client->ps.pm_flags & PMF_DUCKED){
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $486
line 1250
;1250:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 84
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
CNSTF4 1061158912
ADDRLP4 84
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDF4
MULF4
CVFI4 4
ASGNI4
line 1251
;1251:			}
ADDRGP4 $487
JUMPV
LABELV $486
line 1253
;1252:			else
;1253:				height = abs(targ->r.mins[2]) + targ_maxs2; 
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 84
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 84
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
ADDF4
CVFI4 4
ASGNI4
LABELV $487
line 1258
;1254:				
;1255:			// project the z component of point 
;1256:			// onto the z component of the model's origin
;1257:			// this results in the z component from the origin at 0
;1258:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 92
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ADDRLP4 92
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1259
;1259:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1261
;1260:		
;1261:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $488
line 1262
;1262:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1263
;1263:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1264
;1264:			}
LABELV $488
line 1265
;1265:		}
LABELV $484
line 1266
;1266:	}
LABELV $482
line 1271
;1267:	// Shafe - Trep - End Headshot Code
;1268:
;1269:
;1270:	// do the damage
;1271:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $490
line 1272
;1272:		targ->health = targ->health - take;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1273
;1273:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $492
line 1274
;1274:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 1275
;1275:		}
LABELV $492
line 1277
;1276:			
;1277:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
GTI4 $494
line 1278
;1278:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $496
line 1279
;1279:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $496
line 1281
;1280:
;1281:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $498
line 1282
;1282:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 -999
ASGNI4
LABELV $498
line 1284
;1283:
;1284:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1285
;1285:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CALLV
pop
line 1286
;1286:			return;
ADDRGP4 $395
JUMPV
LABELV $494
line 1287
;1287:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $500
line 1288
;1288:			targ->pain (targ, attacker, take);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CALLV
pop
line 1289
;1289:		}
LABELV $500
line 1290
;1290:	}
LABELV $490
line 1292
;1291:
;1292:}
LABELV $395
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1303
;1293:
;1294:
;1295:/*
;1296:============
;1297:CanDamage
;1298:
;1299:Returns qtrue if the inflictor can directly damage the target.  Used for
;1300:explosions and melee attacks.
;1301:============
;1302:*/
;1303:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1310
;1304:	vec3_t	dest;
;1305:	trace_t	tr;
;1306:	vec3_t	midpoint;
;1307:
;1308:	// use the midpoint of the bounds instead of the origin, because
;1309:	// bmodels may have their origin is 0,0,0
;1310:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 84
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1311
;1311:	VectorScale (midpoint, 0.5, midpoint);
ADDRLP4 88
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 88
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 88
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1313
;1312:
;1313:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1314
;1314:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1315
;1315:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $513
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $509
LABELV $513
line 1316
;1316:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $509
line 1320
;1317:
;1318:	// this should probably check in the plane of projection, 
;1319:	// rather than in world coordinate, and also include Z
;1320:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1321
;1321:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1322
;1322:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1323
;1323:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1324
;1324:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $515
line 1325
;1325:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $515
line 1327
;1326:
;1327:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1328
;1328:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1329
;1329:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1330
;1330:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1331
;1331:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $519
line 1332
;1332:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $519
line 1334
;1333:
;1334:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1335
;1335:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1336
;1336:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1337
;1337:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1338
;1338:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $523
line 1339
;1339:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $523
line 1341
;1340:
;1341:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1342
;1342:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1343
;1343:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1344
;1344:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1345
;1345:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $527
line 1346
;1346:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $502
JUMPV
LABELV $527
line 1349
;1347:
;1348:
;1349:	return qfalse;
CNSTI4 0
RETI4
LABELV $502
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1359
;1350:}
;1351:
;1352:
;1353:/*
;1354:============
;1355:G_RadiusDamage
;1356:============
;1357:*/
;1358:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1359:					 gentity_t *ignore, int mod) {
line 1368
;1360:	float		points, dist;
;1361:	gentity_t	*ent;
;1362:	int			entityList[MAX_GENTITIES];
;1363:	int			numListedEntities;
;1364:	vec3_t		mins, maxs;
;1365:	vec3_t		v;
;1366:	vec3_t		dir;
;1367:	int			i, e;
;1368:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1370
;1369:
;1370:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $531
line 1371
;1371:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1372
;1372:	}
LABELV $531
line 1374
;1373:
;1374:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $533
line 1375
;1375:		mins[i] = origin[i] - radius;
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 4144
ADDP4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1376
;1376:		maxs[i] = origin[i] + radius;
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 4156
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1377
;1377:	}
LABELV $534
line 1374
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $533
line 1379
;1378:
;1379:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 1381
;1380:
;1381:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $537
line 1382
;1382:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 872
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1384
;1383:
;1384:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $541
line 1385
;1385:			continue;
ADDRGP4 $538
JUMPV
LABELV $541
line 1386
;1386:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
NEI4 $543
line 1387
;1387:			continue;
ADDRGP4 $538
JUMPV
LABELV $543
line 1390
;1388:
;1389:		// find the distance from the edge of the bounding box
;1390:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $545
line 1391
;1391:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
GEF4 $549
line 1392
;1392:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1393
;1393:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $550
JUMPV
LABELV $549
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
LEF4 $551
line 1394
;1394:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4184
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4184
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4184
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4184
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1395
;1395:			} else {
ADDRGP4 $552
JUMPV
LABELV $551
line 1396
;1396:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1397
;1397:			}
LABELV $552
LABELV $550
line 1398
;1398:		}
LABELV $546
line 1390
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $545
line 1400
;1399:
;1400:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 1401
;1401:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $553
line 1402
;1402:			continue;
ADDRGP4 $538
JUMPV
LABELV $553
line 1405
;1403:		}
;1404:
;1405:		points = damage * ( 1.0 - dist / radius );
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 1407
;1406:
;1407:		if( CanDamage (ent, origin) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $555
line 1408
;1408:			if( LogAccuracyHit( ent, attacker ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $557
line 1409
;1409:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1410
;1410:			}
LABELV $557
line 1411
;1411:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1414
;1412:			// push the center of mass higher than the origin so players
;1413:			// get knocked into the air more
;1414:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1415
;1415:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1416
;1416:		}
LABELV $555
line 1417
;1417:	}
LABELV $538
line 1381
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $540
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $537
line 1419
;1418:
;1419:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $530
endproc G_RadiusDamage 4196 32
import CountSurvivors
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
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
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
import PlaceMC
import SpotWouldTelefrag
import CalculateRanks
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
import G_BreakGlass
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
import G_InvulnerabilityEffect
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
LABELV $469
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $361
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $346
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 97
byte 1 102
byte 1 102
byte 1 48
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $343
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $337
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 52
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $334
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $326
byte 1 115
byte 1 0
align 1
LABELV $325
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 46
byte 1 49
byte 1 53
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 66
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $324
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 72
byte 1 97
byte 1 115
byte 1 32
byte 1 66
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 69
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 33
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $320
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 46
byte 1 49
byte 1 53
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 115
byte 1 32
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $319
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 73
byte 1 115
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 33
byte 1 10
byte 1 34
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
byte 1 32
byte 1 77
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 107
byte 1 101
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $281
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 108
byte 1 97
byte 1 102
byte 1 102
byte 1 48
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $244
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $243
byte 1 60
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $236
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $235
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
align 1
LABELV $213
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $212
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $192
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $191
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $180
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $179
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 72
byte 1 69
byte 1 65
byte 1 68
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $178
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 85
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $177
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 83
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $176
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 85
byte 1 73
byte 1 67
byte 1 73
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $175
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $174
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $173
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 67
byte 1 82
byte 1 85
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $172
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 65
byte 1 86
byte 1 65
byte 1 0
align 1
LABELV $171
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 76
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $170
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $169
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $168
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $167
byte 1 77
byte 1 79
byte 1 68
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
byte 1 0
align 1
LABELV $166
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $165
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $164
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 0
align 1
LABELV $163
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $162
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $161
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $160
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $159
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 77
byte 1 65
byte 1 67
byte 1 72
byte 1 73
byte 1 78
byte 1 69
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $158
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $157
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $156
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
align 1
LABELV $126
byte 1 107
byte 1 97
byte 1 109
byte 1 105
byte 1 107
byte 1 97
byte 1 122
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
