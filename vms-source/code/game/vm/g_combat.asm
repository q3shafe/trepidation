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
CNSTI4 47
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
CNSTI4 424
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
CNSTI4 68
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
CNSTI4 424
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
CNSTI4 428
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
line 46
;46:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $62
line 47
;47:		return;
ADDRGP4 $61
JUMPV
LABELV $62
line 50
;48:	}
;49:	// no scoring during pre-match warmup
;50:	if ( level.warmupTime ) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $64
line 51
;51:		return;
ADDRGP4 $61
JUMPV
LABELV $64
line 54
;52:	}
;53:	// show score plum
;54:	ScorePlum(ent, origin, score);
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
line 56
;55:	//
;56:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 57
;57:	ent->client->pers.TrueScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 58
;58:	if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $67
line 59
;59:		level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
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
LABELV $67
line 60
;60:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 61
;61:}
LABELV $61
endproc AddScore 12 12
export TossClientItems
proc TossClientItems 36 12
line 70
;62:
;63:/*
;64:=================
;65:TossClientItems
;66:
;67:Toss the weapon and powerups for the killed player
;68:=================
;69:*/
;70:void TossClientItems( gentity_t *self ) {
line 78
;71:	gitem_t		*item;
;72:	int			weapon;
;73:	float		angle;
;74:	int			i;
;75:	gentity_t	*drop;
;76:
;77:	// drop the weapon if not a gauntlet or machinegun
;78:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 84
;79:
;80:	// make a special check to see if they are changing to a new
;81:	// weapon that isn't the mg or gauntlet.  Without this, a client
;82:	// can pick up a weapon, be killed, and not drop the weapon because
;83:	// their weapon change hasn't completed yet and they are still holding the MG.
;84:	if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) {
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $74
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $72
LABELV $74
line 85
;85:		if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $75
line 86
;86:			weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 87
;87:		}
LABELV $75
line 88
;88:		if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
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
NEI4 $77
line 89
;89:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 90
;90:		}
LABELV $77
line 91
;91:	}
LABELV $72
line 94
;92:
;93:	// Shafe - Trep - Dont drop weapons In Instagib
;94:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $79
line 95
;95:	{
line 96
;96:		if ( weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && 
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $82
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $82
ADDRLP4 12
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $82
line 97
;97:			self->client->ps.ammo[ weapon ] ) {
line 99
;98:			// find the item type for this weapon
;99:			item = BG_FindItemForWeapon( weapon );
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
line 102
;100:	
;101:			// spawn the item
;102:			Drop_Item( self, item, 0 );
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
line 103
;103:		}
LABELV $82
line 104
;104:	} // End Shafe - Trep instagib
LABELV $79
line 107
;105:
;106:	// drop all the powerups if not in teamplay
;107:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $84
line 108
;108:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 109
;109:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $87
line 110
;110:			if ( self->client->ps.powerups[ i ] > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $91
line 111
;111:				item = BG_FindItemForPowerup( i );
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
line 112
;112:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $94
line 113
;113:					continue;
ADDRGP4 $88
JUMPV
LABELV $94
line 115
;114:				}
;115:				drop = Drop_Item( self, item, angle );
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
line 117
;116:				// decide how many seconds it has left
;117:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 118
;118:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
CNSTI4 1
GEI4 $97
line 119
;119:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 1
ASGNI4
line 120
;120:				}
LABELV $97
line 121
;121:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 122
;122:			}
LABELV $91
line 123
;123:		}
LABELV $88
line 109
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $87
line 124
;124:	}
LABELV $84
line 125
;125:}
LABELV $71
endproc TossClientItems 36 12
export LookAtKiller
proc LookAtKiller 52 4
line 215
;126:
;127:#ifdef MISSIONPACK
;128:
;129:/*
;130:=================
;131:TossClientCubes
;132:=================
;133:*/
;134:extern gentity_t	*neutralObelisk;
;135:
;136:void TossClientCubes( gentity_t *self ) {
;137:	gitem_t		*item;
;138:	gentity_t	*drop;
;139:	vec3_t		velocity;
;140:	vec3_t		angles;
;141:	vec3_t		origin;
;142:
;143:	self->client->ps.generic1 = 0;
;144:
;145:	// this should never happen but we should never
;146:	// get the server to crash due to skull being spawned in
;147:	if (!G_EntitiesFree()) {
;148:		return;
;149:	}
;150:
;151:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;152:		item = BG_FindItem( "Red Cube" );
;153:	}
;154:	else {
;155:		item = BG_FindItem( "Blue Cube" );
;156:	}
;157:
;158:	angles[YAW] = (float)(level.time % 360);
;159:	angles[PITCH] = 0;	// always forward
;160:	angles[ROLL] = 0;
;161:
;162:	AngleVectors( angles, velocity, NULL, NULL );
;163:	VectorScale( velocity, 150, velocity );
;164:	velocity[2] += 200 + crandom() * 50;
;165:
;166:	if( neutralObelisk ) {
;167:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;168:		origin[2] += 44;
;169:	} else {
;170:		VectorClear( origin ) ;
;171:	}
;172:
;173:	drop = LaunchItem( item, origin, velocity );
;174:
;175:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;176:	drop->think = G_FreeEntity;
;177:	drop->spawnflags = self->client->sess.sessionTeam;
;178:}
;179:
;180:
;181:/*
;182:=================
;183:TossClientPersistantPowerups
;184:=================
;185:*/
;186:void TossClientPersistantPowerups( gentity_t *ent ) {
;187:	gentity_t	*powerup;
;188:
;189:	if( !ent->client ) {
;190:		return;
;191:	}
;192:
;193:	if( !ent->client->persistantPowerup ) {
;194:		return;
;195:	}
;196:
;197:	powerup = ent->client->persistantPowerup;
;198:
;199:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;200:	powerup->s.eFlags &= ~EF_NODRAW;
;201:	powerup->r.contents = CONTENTS_TRIGGER;
;202:	trap_LinkEntity( powerup );
;203:
;204:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;205:	ent->client->persistantPowerup = NULL;
;206:}
;207:#endif
;208:
;209:
;210:/*
;211:==================
;212:LookAtKiller
;213:==================
;214:*/
;215:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 219
;216:	vec3_t		dir;
;217:	vec3_t		angles;
;218:
;219:	if ( attacker && attacker != self ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $100
ADDRLP4 24
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $100
line 220
;220:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
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
line 221
;221:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $101
JUMPV
LABELV $100
ADDRLP4 28
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $104
ADDRLP4 28
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $104
line 222
;222:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
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
line 223
;223:	} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 224
;224:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 516
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
line 225
;225:		return;
ADDRGP4 $99
JUMPV
LABELV $105
LABELV $101
line 228
;226:	}
;227:
;228:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 230
;229:
;230:	angles[YAW] = vectoyaw ( dir );
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
line 231
;231:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 232
;232:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 233
;233:}
LABELV $99
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 12 12
line 240
;234:
;235:/*
;236:==================
;237:GibEntity
;238:==================
;239:*/
;240:void GibEntity( gentity_t *self, int killer ) {
line 245
;241:	gentity_t *ent;
;242:	int i;
;243:
;244:	//if this entity still has kamikaze
;245:	if (self->s.eFlags & EF_KAMIKAZE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $111
line 247
;246:		// check if there is a kamikaze timer around for this owner
;247:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $113
line 248
;248:			ent = &g_entities[i];
ADDRLP4 0
CNSTI4 836
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 249
;249:			if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $117
line 250
;250:				continue;
ADDRGP4 $114
JUMPV
LABELV $117
line 251
;251:			if (ent->activator != self)
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $119
line 252
;252:				continue;
ADDRGP4 $114
JUMPV
LABELV $119
line 253
;253:			if (strcmp(ent->classname, "kamikaze timer"))
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $121
line 254
;254:				continue;
ADDRGP4 $114
JUMPV
LABELV $121
line 255
;255:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 256
;256:			break;
ADDRGP4 $115
JUMPV
LABELV $114
line 247
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $113
LABELV $115
line 258
;257:		}
;258:	}
LABELV $111
line 259
;259:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 65
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 260
;260:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 0
ASGNI4
line 261
;261:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 262
;262:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 263
;263:}
LABELV $110
endproc GibEntity 12 12
export GibEntity_Headshot
proc GibEntity_Headshot 0 12
line 267
;264:
;265:
;266:// Shafe - Trep - Headshot Function
;267:void GibEntity_Headshot( gentity_t *self, int killer ) {
line 268
;268:	G_AddEvent( self, EV_GIB_PLAYER_HEADSHOT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 269
;269:	self->client->noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
CNSTI4 1
ASGNI4
line 270
;270:}
LABELV $124
endproc GibEntity_Headshot 0 12
export body_die
proc body_die 0 8
line 278
;271:// Shafe - Trep - End Headshot Function
;272:
;273:/*
;274:==================
;275:body_die
;276:==================
;277:*/
;278:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 279
;279:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $126
line 280
;280:		return;
ADDRGP4 $125
JUMPV
LABELV $126
line 282
;281:	}
;282:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $128
line 283
;283:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 -39
ASGNI4
line 284
;284:		return;
ADDRGP4 $125
JUMPV
LABELV $128
line 287
;285:	}
;286:
;287:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 288
;288:}
LABELV $125
endproc body_die 0 8
export IsOutOfWeapons
proc IsOutOfWeapons 0 0
line 291
;289:
;290:// Shafe - Trep - Arsenal Mod
;291:extern qboolean IsOutOfWeapons( gentity_t *ent ) {
line 293
;292:
;293:	if (g_GameMode.integer != 1) { return qfalse; } // Do nothing unless it's arsenal
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
EQI4 $132
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $132
line 295
;294:
;295:	if (ent->client->pers.h_gauntlet) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $135
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $135
line 296
;296:	if (ent->client->pers.h_mg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $137
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $137
line 297
;297:	if (ent->client->pers.h_sg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $139
line 298
;298:	if (ent->client->pers.h_grenade) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $141
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $141
line 299
;299:	if (ent->client->pers.h_singcan) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $143
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $143
line 300
;300:	if (ent->client->pers.h_flame) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $145
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $145
line 301
;301:	if (ent->client->pers.h_gauss) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $147
line 302
;302:	if (ent->client->pers.h_plasma) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $149
line 303
;303:	if (ent->client->pers.h_bfg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $151
line 305
;304:
;305:	return qtrue;
CNSTI4 1
RETI4
LABELV $131
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
address $153
address $154
address $155
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
export CheckAlmostCapture
code
proc CheckAlmostCapture 56 12
line 379
;306:}
;307:
;308:
;309:// these are just for logging, the client prints its own messages
;310:char	*modNames[] = {
;311:	"MOD_UNKNOWN",
;312:	"MOD_SHOTGUN",
;313:	"MOD_GAUNTLET",
;314:	"MOD_MACHINEGUN",
;315:	"MOD_GRENADE",
;316:	"MOD_GRENADE_SPLASH",
;317:	"MOD_ROCKET",
;318:	"MOD_ROCKET_SPLASH",
;319:	"MOD_PLASMA",
;320:	"MOD_PLASMA_SPLASH",
;321:	"MOD_RAILGUN",
;322:	"MOD_LIGHTNING",
;323:	"MOD_BFG",
;324:	"MOD_BFG_SPLASH",
;325:	"MOD_WATER",
;326:	"MOD_SLIME",
;327:	"MOD_LAVA",
;328:	"MOD_CRUSH",
;329:	"MOD_TELEFRAG",
;330:	"MOD_FALLING",
;331:	"MOD_SUICIDE",
;332:	"MOD_TARGET_LASER",
;333:	"MOD_TRIGGER_HURT",
;334:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;335:#ifdef MISSIONPACK
;336:	"MOD_NAIL",
;337:	"MOD_CHAINGUN",
;338:	"MOD_PROXIMITY_MINE",
;339:#endif
;340:	"MOD_GRAPPLE"
;341:};
;342:
;343:#ifdef MISSIONPACK
;344:/*
;345:==================
;346:Kamikaze_DeathActivate
;347:==================
;348:*/
;349:void Kamikaze_DeathActivate( gentity_t *ent ) {
;350:	G_StartKamikaze(ent);
;351:	G_FreeEntity(ent);
;352:}
;353:
;354:/*
;355:==================
;356:Kamikaze_DeathTimer
;357:==================
;358:*/
;359:void Kamikaze_DeathTimer( gentity_t *self ) {
;360:	gentity_t *ent;
;361:
;362:	ent = G_Spawn();
;363:	ent->classname = "kamikaze timer";
;364:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;365:	ent->r.svFlags |= SVF_NOCLIENT;
;366:	ent->think = Kamikaze_DeathActivate;
;367:	ent->nextthink = level.time + 5 * 1000;
;368:
;369:	ent->activator = self;
;370:}
;371:
;372:#endif
;373:
;374:/*
;375:==================
;376:CheckAlmostCapture
;377:==================
;378:*/
;379:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 385
;380:	gentity_t	*ent;
;381:	vec3_t		dir;
;382:	char		*classname;
;383:
;384:	// if this player was carrying a flag
;385:	if ( self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 516
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
NEI4 $182
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $182
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $179
LABELV $182
line 387
;386:		self->client->ps.powerups[PW_BLUEFLAG] ||
;387:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 389
;388:		// get the goal flag this player should have been going for
;389:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $183
line 390
;390:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $186
line 391
;391:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $188
ASGNP4
line 392
;392:			}
ADDRGP4 $184
JUMPV
LABELV $186
line 393
;393:			else {
line 394
;394:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $189
ASGNP4
line 395
;395:			}
line 396
;396:		}
ADDRGP4 $184
JUMPV
LABELV $183
line 397
;397:		else {
line 398
;398:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $190
line 399
;399:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $189
ASGNP4
line 400
;400:			}
ADDRGP4 $191
JUMPV
LABELV $190
line 401
;401:			else {
line 402
;402:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $188
ASGNP4
line 403
;403:			}
LABELV $191
line 404
;404:		}
LABELV $184
line 405
;405:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $192
line 407
;406:		do
;407:		{
line 408
;408:			ent = G_Find(ent, FOFS(classname), classname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
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
line 409
;409:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $193
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $195
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $192
LABELV $195
line 411
;410:		// if we found the destination flag and it's not picked up
;411:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $196
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $196
line 413
;412:			// if the player was *very* close
;413:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
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
CNSTI4 516
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
line 414
;414:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $200
line 415
;415:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 416
;416:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $202
line 417
;417:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 516
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
line 418
;418:				}
LABELV $202
line 419
;419:			}
LABELV $200
line 420
;420:		}
LABELV $196
line 421
;421:	}
LABELV $179
line 422
;422:}
LABELV $178
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 429
;423:
;424:/*
;425:==================
;426:CheckAlmostScored
;427:==================
;428:*/
;429:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 435
;430:	gentity_t	*ent;
;431:	vec3_t		dir;
;432:	char		*classname;
;433:
;434:	// if the player was carrying cubes
;435:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $205
line 436
;436:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $207
line 437
;437:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $209
ASGNP4
line 438
;438:		}
ADDRGP4 $208
JUMPV
LABELV $207
line 439
;439:		else {
line 440
;440:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $210
ASGNP4
line 441
;441:		}
LABELV $208
line 442
;442:		ent = G_Find(NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 524
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
line 444
;443:		// if we found the destination obelisk
;444:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
line 446
;445:			// if the player was *very* close
;446:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 516
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
CNSTI4 516
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
line 447
;447:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $215
line 448
;448:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 449
;449:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $217
line 450
;450:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 516
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
line 451
;451:				}
LABELV $217
line 452
;452:			}
LABELV $215
line 453
;453:		}
LABELV $211
line 454
;454:	}
LABELV $205
line 455
;455:}
LABELV $204
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $220
skip 4
align 4
LABELV $358
skip 4
export player_die
code
proc player_die 116 28
line 465
;456:
;457:
;458:
;459:/*
;460:==================
;461:player_die
;462:==================
;463:*/
;464:extern int CountSurvivors();
;465:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 482
;466:	gentity_t	*ent;
;467:	int			anim;
;468:	int			contents;
;469:	int			killer;
;470:	int			i;
;471:	char		*killerName, *obit;
;472:	// Shafe - Trep - For Arsenal
;473:	int			tmpW;
;474:	int			tmpCnt;
;475:	static		int deathNum;
;476:	//gentity_t	*xte;
;477:
;478:
;479:
;480:
;481:
;482:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $221
line 483
;483:		return;
ADDRGP4 $219
JUMPV
LABELV $221
line 486
;484:	}
;485:
;486:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $223
line 487
;487:		return;
ADDRGP4 $219
JUMPV
LABELV $223
line 493
;488:	}
;489:
;490:
;491://unlagged - backward reconciliation #2
;492:	// make sure the body shows up in the client's current position
;493:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 497
;494://unlagged - backward reconciliation #2
;495:
;496:	// check for an almost capture
;497:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 499
;498:	// check for a player that almost brought in cubes
;499:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 502
;500:
;501:
;502:	if (self->client && self->client->hook)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
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
EQU4 $226
ADDRLP4 36
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $226
line 503
;503:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $226
line 511
;504:#ifdef MISSIONPACK
;505:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;506:		self->client->ps.eFlags &= ~EF_TICKING;
;507:		self->activator->think = G_FreeEntity;
;508:		self->activator->nextthink = level.time;
;509:	}
;510:#endif
;511:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 514
;512:
;513:	// Shafe - Trep - Clear out the PDG
;514:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 515
;515:	VectorClear( self->teleloc ); 
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 44
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 517
;516:
;517:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
line 518
;518:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 519
;519:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
line 520
;520:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 521
;521:		} else {
ADDRGP4 $229
JUMPV
LABELV $230
line 522
;522:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $232
ASGNP4
line 523
;523:		}
line 524
;524:	} else {
ADDRGP4 $229
JUMPV
LABELV $228
line 525
;525:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 526
;526:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $233
ASGNP4
line 527
;527:	}
LABELV $229
line 529
;528:
;529:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $236
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $234
LABELV $236
line 530
;530:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 531
;531:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $233
ASGNP4
line 532
;532:	}
LABELV $234
line 534
;533:
;534:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 56
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $239
ADDRLP4 56
INDIRI4
CVIU4 4
CNSTU4 25
LTU4 $237
LABELV $239
line 535
;535:		obit = "<bad obituary>";
ADDRLP4 24
ADDRGP4 $240
ASGNP4
line 536
;536:	} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 537
;537:		obit = modNames[ meansOfDeath ];
ADDRLP4 24
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 538
;538:	}
LABELV $238
line 540
;539:
;540:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $241
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
CNSTI4 516
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
line 545
;541:		killer, self->s.number, meansOfDeath, killerName, 
;542:		self->client->pers.netname, obit );
;543:
;544:	// broadcast the death event to everyone
;545:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 61
ARGI4
ADDRLP4 64
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
ASGNP4
line 546
;546:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 547
;547:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 548
;548:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 549
;549:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 32
ASGNI4
line 551
;550:
;551:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 553
;552:
;553:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 555
;554:
;555:	if (attacker && attacker->client) {
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
EQU4 $242
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $242
line 556
;556:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2592
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 558
;557:
;558:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
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
EQU4 $246
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
EQI4 $244
LABELV $246
line 559
;559:			AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 562
;560:			
;561:
;562:		} else {
ADDRGP4 $243
JUMPV
LABELV $244
line 563
;563:			AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 565
;564:
;565:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $247
line 568
;566:				
;567:				// play humiliation on player
;568:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 571
;569:
;570:				// add the sprite over the player's head
;571:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 572
;572:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 573
;573:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2616
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 576
;574:
;575:				// also play humiliation on target
;576:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 577
;577:			}
LABELV $247
line 581
;578:
;579:			// check for two kills in a short amount of time
;580:			// if this is close enough to the last kill, give a reward sound
;581:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2624
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $250
line 583
;582:				// play excellent on player
;583:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 586
;584:
;585:				// add the sprite over the player's head
;586:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 587
;587:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 588
;588:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2616
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 589
;589:			}
LABELV $250
line 590
;590:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2624
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 592
;591:
;592:		}
line 593
;593:	} else {
ADDRGP4 $243
JUMPV
LABELV $242
line 594
;594:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 595
;595:	}
LABELV $243
line 598
;596:
;597:	// Add team bonuses
;598:	Team_FragBonuses(self, inflictor, attacker);
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
line 601
;599:
;600:	// if I committed suicide, the flag does not fall, it returns.
;601:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $255
line 602
;602:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $257
line 603
;603:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 604
;604:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 605
;605:		}
ADDRGP4 $258
JUMPV
LABELV $257
line 606
;606:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $259
line 607
;607:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 608
;608:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 609
;609:		}
ADDRGP4 $260
JUMPV
LABELV $259
line 610
;610:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $261
line 611
;611:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 612
;612:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 613
;613:		}
LABELV $261
LABELV $260
LABELV $258
line 614
;614:	}
LABELV $255
line 617
;615:
;616:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;617:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
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
line 618
;618:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $263
line 619
;619:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 620
;620:	}
ADDRGP4 $264
JUMPV
LABELV $263
line 621
;621:	else {
line 622
;622:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $265
line 623
;623:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 624
;624:		}
ADDRGP4 $266
JUMPV
LABELV $265
line 625
;625:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $267
line 626
;626:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 627
;627:		}
ADDRGP4 $268
JUMPV
LABELV $267
line 628
;628:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $269
line 629
;629:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 630
;630:		}
LABELV $269
LABELV $268
LABELV $266
line 631
;631:	}
LABELV $264
line 642
;632:#ifdef MISSIONPACK
;633:	TossClientPersistantPowerups( self );
;634:	if( g_gametype.integer == GT_HARVESTER ) {
;635:		TossClientCubes( self );
;636:	}
;637:#endif
;638:
;639:		
;640:	
;641:		// Shafe - Trep - Arsenal Stuff
;642:		if ( g_GameMode.integer > 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $271
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $271
ADDRGP4 level+16
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $271
line 643
;643:		{
line 644
;644:			tmpW = self->s.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 647
;645:			
;646:			//G_Printf( S_COLOR_GREEN "DEBUG: Weapon You Held by %s was %i\n", self->client->pers.netname, tmpW );
;647:			if (level.firstStrike == qfalse)
ADDRGP4 level+9228
INDIRI4
CNSTI4 0
NEI4 $275
line 648
;648:			{
line 649
;649:				level.firstStrike = qtrue;
ADDRGP4 level+9228
CNSTI4 1
ASGNI4
line 650
;650:				BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $279
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 651
;651:				trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $280
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 652
;652:			}
LABELV $275
line 654
;653:
;654:			if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $281
line 655
;655:			{
line 656
;656:				if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 16
INDIRI4
CNSTI4 9
NEI4 $284
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $284
line 657
;657:				if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 16
INDIRI4
CNSTI4 8
NEI4 $286
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $286
line 658
;658:				if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 7
NEI4 $288
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $288
line 659
;659:				if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 6
NEI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $290
line 660
;660:				if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 5
NEI4 $292
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $292
line 661
;661:				if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 4
NEI4 $294
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $294
line 662
;662:				if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 3
NEI4 $296
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $296
line 663
;663:				if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $298
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $298
line 664
;664:				if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 16
INDIRI4
CNSTI4 1
NEI4 $300
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $300
line 666
;665:
;666:			}
LABELV $281
line 669
;667:			
;668:			
;669:			if ((g_GameMode.integer == 2) || (IsOutOfWeapons(self)))
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
EQI4 $305
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 IsOutOfWeapons
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $302
LABELV $305
line 670
;670:			{
line 673
;671:				
;672:				// Arsenal Message
;673:				if (g_GameMode.integer == 1)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 1
NEI4 $306
line 674
;674:				{
line 675
;675:					trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $309
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 676
;676:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $310
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 677
;677:				}
LABELV $306
line 680
;678:
;679:				// LMS Message
;680:				if (g_GameMode.integer == 2)
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $311
line 681
;681:				{
line 682
;682:					trap_SendServerCommand( -1, va("print \"%s Has Been Eliminated!!\n\"",self->client->pers.netname));
ADDRGP4 $314
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 683
;683:					trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Has Been Eliminated.\n\"", self->client->pers.netname) );
ADDRGP4 $315
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 684
;684:				}
LABELV $311
line 687
;685:				
;686:				// Send them to Spec
;687:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 688
;688:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 689
;689:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 692
;690:
;691:
;692:				tmpCnt = (CountSurvivors());
ADDRLP4 96
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 96
INDIRI4
ASGNI4
line 695
;693:
;694:						
;695:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 28
INDIRI4
ADDRGP4 level+9220
INDIRI4
EQI4 $317
line 696
;696:				{
line 698
;697:
;698:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9220
ADDRLP4 28
INDIRI4
ASGNI4
line 701
;699:			
;700:			
;701:					if (tmpCnt == 5) 
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $321
line 702
;702:					{
line 703
;703:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $323
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 704
;704:					}
LABELV $321
line 706
;705:					
;706:					if (tmpCnt == 4) 
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $324
line 707
;707:					{
line 708
;708:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $326
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 709
;709:					}
LABELV $324
line 711
;710:
;711:					if (tmpCnt == 3) 
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $327
line 712
;712:					{
line 713
;713:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $329
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 714
;714:					}
LABELV $327
line 716
;715:
;716:					if (tmpCnt == 2) 
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $330
line 717
;717:					{
line 719
;718:						
;719:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $332
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 720
;720:					}
LABELV $330
line 722
;721:
;722:					if (tmpCnt == 1) 
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $333
line 723
;723:					{
line 724
;724:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $335
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 728
;725:					
;726:
;727:						////////////////
;728:					}			
LABELV $333
line 729
;729:				}
LABELV $317
line 730
;730:			} 
LABELV $302
line 732
;731:
;732:		}
LABELV $271
line 735
;733:		// End Arsenal Stuff
;734:
;735:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 738
;736:	// send updated scores to any clients that are following this one,
;737:	// or they would get stale scoreboards
;738:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $336
line 741
;739:		gclient_t	*client;
;740:
;741:		client = &level.clients[i];
ADDRLP4 88
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 742
;742:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 88
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $341
line 743
;743:			continue;
ADDRGP4 $337
JUMPV
LABELV $341
line 745
;744:		}
;745:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 88
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $343
line 746
;746:			continue;
ADDRGP4 $337
JUMPV
LABELV $343
line 748
;747:		}
;748:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 88
INDIRP4
CNSTI4 2504
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $345
line 749
;749:			Cmd_Score_f( g_entities + i );
CNSTI4 836
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 750
;750:		}
LABELV $345
line 751
;751:	}
LABELV $337
line 738
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $339
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $336
line 753
;752:
;753:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 1
ASGNI4
line 755
;754:
;755:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 756
;756:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 757
;757:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 759
;758:
;759:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 760
;760:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 761
;761:	LookAtKiller (self, inflictor, attacker);
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
line 763
;762:
;763:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 765
;764:
;765:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 767
;766:
;767:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3238002688
ASGNF4
line 771
;768:
;769:	// don't allow respawn until the death anim is done
;770:	// g_forcerespawn may force spawning at some later time
;771:	self->client->respawnTime = level.time + 1700;  // This is the real line
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2604
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 778
;772:	
;773:
;774:	
;775:	
;776:
;777:	// remove powerups
;778:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 780
;779:
;780:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $348
line 781
;781:	{
line 782
;782:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $350
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 783
;783:	}
LABELV $348
line 788
;784:
;785:
;786:
;787:	// never gib in a nodrop
;788:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $357
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $357
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $354
LABELV $357
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $351
LABELV $354
line 790
;789:		// gib death
;790:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 791
;791:	} else {
ADDRGP4 $352
JUMPV
LABELV $351
line 795
;792:		// normal death
;793:		static int i;
;794:
;795:		switch ( i ) {
ADDRLP4 92
ADDRGP4 $358
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $361
ADDRLP4 92
INDIRI4
CNSTI4 1
EQI4 $362
ADDRLP4 92
INDIRI4
CNSTI4 2
EQI4 $363
ADDRGP4 $359
JUMPV
LABELV $361
line 797
;796:		case 0:
;797:			anim = BOTH_DEATH1;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 798
;798:			break;
ADDRGP4 $360
JUMPV
LABELV $362
line 800
;799:		case 1:
;800:			anim = BOTH_DEATH2;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 801
;801:			break;
ADDRGP4 $360
JUMPV
LABELV $363
LABELV $359
line 804
;802:		case 2:
;803:		default:
;804:			anim = BOTH_DEATH3;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 805
;805:			break;
LABELV $360
line 810
;806:		}
;807:
;808:		// for the no-blood option, we need to prevent the health
;809:		// from going to gib level
;810:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $364
line 811
;811:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 -39
ASGNI4
line 812
;812:		}
LABELV $364
line 814
;813:
;814:		self->client->ps.legsAnim = 
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 100
CNSTI4 128
ASGNI4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
ADDRLP4 100
INDIRI4
BANDI4
ADDRLP4 100
INDIRI4
BXORI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 816
;815:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;816:		self->client->ps.torsoAnim = 
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 108
CNSTI4 128
ASGNI4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
ADDRLP4 108
INDIRI4
BANDI4
ADDRLP4 108
INDIRI4
BXORI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 819
;817:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;818:
;819:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $358
INDIRI4
CNSTI4 58
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 822
;820:
;821:		// Shafe - Trep Headshot //////////////////////////////////////////
;822:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $366
line 823
;823:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $367
JUMPV
LABELV $366
line 825
;824:		else
;825:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
CNSTI4 0
ASGNI4
LABELV $367
line 829
;826:		// Shafe - Trep - End Headshot /////////////////////////////
;827:
;828:		// the body can still be gibbed
;829:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 body_die
ASGNP4
line 832
;830:
;831:		// globally cycle through the different death animations
;832:		i = ( i + 1 ) % 3;
ADDRLP4 112
ADDRGP4 $358
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 841
;833:
;834:
;835:
;836:#ifdef MISSIONPACK
;837:		if (self->s.eFlags & EF_KAMIKAZE) {
;838:			Kamikaze_DeathTimer( self );
;839:		}
;840:#endif
;841:	}
LABELV $352
line 846
;842:
;843:	
;844:
;845:
;846:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 848
;847:
;848:}
LABELV $219
endproc player_die 116 28
export CheckArmor
proc CheckArmor 20 4
line 857
;849:
;850:
;851:/*
;852:================
;853:CheckArmor
;854:================
;855:*/
;856:int CheckArmor (gentity_t *ent, int damage, int dflags)
;857:{
line 862
;858:	gclient_t	*client;
;859:	int			save;
;860:	int			count;
;861:
;862:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $369
line 863
;863:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $369
line 865
;864:
;865:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 867
;866:
;867:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $371
line 868
;868:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $371
line 870
;869:
;870:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $373
line 871
;871:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $373
line 874
;872:
;873:	// armor
;874:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 875
;875:	save = ceil( damage * ARMOR_PROTECTION );
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
line 876
;876:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $375
line 877
;877:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $375
line 879
;878:
;879:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $377
line 880
;880:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $377
line 882
;881:
;882:	client->ps.stats[STAT_ARMOR] -= save;
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
line 884
;883:
;884:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $368
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 892
;885:}
;886:
;887:/*
;888:================
;889:RaySphereIntersections
;890:================
;891:*/
;892:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 901
;893:	float b, c, d, t;
;894:
;895:	//	| origin - (point + t * dir) | = radius
;896:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;897:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;898:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;899:
;900:	// normalize dir so a = 1
;901:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 902
;902:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
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
line 903
;903:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
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
line 908
;904:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;905:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;906:		radius * radius;
;907:
;908:	d = b * b - 4 * c;
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
line 909
;909:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $380
line 910
;910:		t = (- b + sqrt(d)) / 2;
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
line 911
;911:		VectorMA(point, t, dir, intersections[0]);
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
line 912
;912:		t = (- b - sqrt(d)) / 2;
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
line 913
;913:		VectorMA(point, t, dir, intersections[1]);
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
line 914
;914:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $379
JUMPV
LABELV $380
line 916
;915:	}
;916:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $382
line 917
;917:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 918
;918:		VectorMA(point, t, dir, intersections[0]);
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
line 919
;919:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $379
JUMPV
LABELV $382
line 921
;920:	}
;921:	return 0;
CNSTI4 0
RETI4
LABELV $379
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 988
;922:}
;923:
;924:#ifdef MISSIONPACK
;925:/*
;926:================
;927:G_InvulnerabilityEffect
;928:================
;929:*/
;930:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;931:	gentity_t	*impact;
;932:	vec3_t		intersections[2], vec;
;933:	int			n;
;934:
;935:	if ( !targ->client ) {
;936:		return qfalse;
;937:	}
;938:	VectorCopy(dir, vec);
;939:	VectorInverse(vec);
;940:	// sphere model radius = 42 units
;941:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;942:	if (n > 0) {
;943:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;944:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;945:		vectoangles(vec, impact->s.angles);
;946:		impact->s.angles[0] += 90;
;947:		if (impact->s.angles[0] > 360)
;948:			impact->s.angles[0] -= 360;
;949:		if ( impactpoint ) {
;950:			VectorCopy( intersections[0], impactpoint );
;951:		}
;952:		if ( bouncedir ) {
;953:			VectorCopy( vec, bouncedir );
;954:			VectorNormalize( bouncedir );
;955:		}
;956:		return qtrue;
;957:	}
;958:	else {
;959:		return qfalse;
;960:	}
;961:}
;962:#endif
;963:/*
;964:============
;965:T_Damage
;966:
;967:targ		entity that is being damaged
;968:inflictor	entity that is causing the damage
;969:attacker	entity that caused the inflictor to damage targ
;970:	example: targ=monster, inflictor=rocket, attacker=player
;971:
;972:dir			direction of the attack for knockback
;973:point		point at which the damage is being inflicted, used for headshots
;974:damage		amount of damage being inflicted
;975:knockback	force to be applied against targ as a result of the damage
;976:
;977:inflictor, attacker, dir, and point can be NULL for environmental effects
;978:
;979:dflags		these flags are used to control how T_Damage works
;980:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;981:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;982:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;983:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;984:============
;985:*/
;986:
;987:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;988:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1006
;989:	gclient_t	*client;
;990:	int			take;
;991:	int			save;
;992:	int			asave;
;993:	int			knockback;
;994:	int			max;
;995:	// Shafe - Trep - Headshot
;996:	float		z_ratio;
;997:	float		z_rel;
;998:	int			height;
;999:	float		targ_maxs2;
;1000:	// Shafe - Trep - End Headshot
;1001:
;1002:#ifdef MISSIONPACK
;1003:	vec3_t		bouncedir, impactpoint;
;1004:#endif
;1005:
;1006:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $385
line 1007
;1007:		return;
ADDRGP4 $384
JUMPV
LABELV $385
line 1012
;1008:	}
;1009:
;1010:	// the intermission has allready been qualified for, so don't
;1011:	// allow any extra scoring
;1012:	if ( level.intermissionQueued ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $387
line 1013
;1013:		return;
ADDRGP4 $384
JUMPV
LABELV $387
line 1025
;1014:	}
;1015:#ifdef MISSIONPACK
;1016:	if ( targ->client && mod != MOD_JUICED) {
;1017:		if ( targ->client->invulnerabilityTime > level.time) {
;1018:			if ( dir && point ) {
;1019:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1020:			}
;1021:			return;
;1022:		}
;1023:	}
;1024:#endif
;1025:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $390
line 1026
;1026:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+854392
ASGNP4
line 1027
;1027:	}
LABELV $390
line 1028
;1028:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $393
line 1029
;1029:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+854392
ASGNP4
line 1030
;1030:	}
LABELV $393
line 1033
;1031:
;1032:	// shootable doors / buttons don't actually have any health
;1033:	if ( targ->s.eType == ET_MOVER ) {
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
NEI4 $396
line 1034
;1034:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 716
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $384
ADDRLP4 44
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $384
line 1035
;1035:			targ->use( targ, inflictor, attacker );
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
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 1036
;1036:		}
line 1037
;1037:		return;
ADDRGP4 $384
JUMPV
LABELV $396
line 1046
;1038:	}
;1039:#ifdef MISSIONPACK
;1040:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1041:		return;
;1042:	}
;1043:#endif
;1044:	// reduce damage by the attacker's handicap value
;1045:	// unless they are rocket jumping
;1046:	if ( attacker->client && attacker != targ ) {
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $400
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $400
line 1047
;1047:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 1053
;1048:#ifdef MISSIONPACK
;1049:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1050:			max /= 2;
;1051:		}
;1052:#endif
;1053:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1054
;1054:	}
LABELV $400
line 1056
;1055:
;1056:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1058
;1057:
;1058:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $402
line 1059
;1059:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $404
line 1060
;1060:			return;
ADDRGP4 $384
JUMPV
LABELV $404
line 1062
;1061:		}
;1062:	}
LABELV $402
line 1064
;1063:
;1064:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $406
line 1065
;1065:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1066
;1066:	} else {
ADDRGP4 $407
JUMPV
LABELV $406
line 1067
;1067:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1068
;1068:	}
LABELV $407
line 1070
;1069:
;1070:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1071
;1071:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $408
line 1072
;1072:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1073
;1073:	}
LABELV $408
line 1074
;1074:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $410
line 1075
;1075:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1076
;1076:	}
LABELV $410
line 1077
;1077:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $412
line 1078
;1078:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1079
;1079:	}
LABELV $412
line 1082
;1080:
;1081:	// figure momentum add, even if the damage won't be taken
;1082:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $414
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $414
line 1086
;1083:		vec3_t	kvel;
;1084:		float	mass;
;1085:
;1086:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1088
;1087:
;1088:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
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
line 1089
;1089:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
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
CNSTI4 516
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
CNSTI4 516
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
line 1093
;1090:
;1091:		// set the timer so that the other client can't cancel
;1092:		// out the movement immediately
;1093:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $423
line 1096
;1094:			int		t;
;1095:
;1096:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1097
;1097:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $425
line 1098
;1098:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1099
;1099:			}
LABELV $425
line 1100
;1100:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $427
line 1101
;1101:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1102
;1102:			}
LABELV $427
line 1103
;1103:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 1104
;1104:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
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
line 1105
;1105:		}
LABELV $423
line 1106
;1106:	}
LABELV $414
line 1109
;1107:
;1108:	// check for completely getting out of the damage
;1109:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $429
line 1116
;1110:
;1111:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1112:		// if the attacker was on the same team
;1113:#ifdef MISSIONPACK
;1114:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1115:#else	
;1116:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
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
EQU4 $431
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
EQI4 $431
line 1118
;1117:#endif
;1118:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $433
line 1119
;1119:				return;
ADDRGP4 $384
JUMPV
LABELV $433
line 1121
;1120:			}
;1121:		}
LABELV $431
line 1134
;1122:#ifdef MISSIONPACK
;1123:		if (mod == MOD_PROXIMITY_MINE) {
;1124:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1125:				return;
;1126:			}
;1127:			if (targ == attacker) {
;1128:				return;
;1129:			}
;1130:		}
;1131:#endif
;1132:
;1133:		// check for godmode
;1134:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $436
line 1135
;1135:			return;
ADDRGP4 $384
JUMPV
LABELV $436
line 1137
;1136:		}
;1137:	}
LABELV $429
line 1141
;1138:
;1139:	// battlesuit protects from all radius damage (but takes knockback)
;1140:	// and protects 50% against all damage
;1141:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $438
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $438
line 1142
;1142:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1143
;1143:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $442
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $440
LABELV $442
line 1144
;1144:			return;
ADDRGP4 $384
JUMPV
LABELV $440
line 1146
;1145:		}
;1146:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1147
;1147:	}
LABELV $438
line 1150
;1148:
;1149:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1150:	if ( attacker->client && targ != attacker && targ->health > 0
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $443
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
EQU4 $443
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $443
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
EQI4 $443
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $443
line 1152
;1151:			&& targ->s.eType != ET_MISSILE
;1152:			&& targ->s.eType != ET_GENERAL) {
line 1153
;1153:		if ( OnSameTeam( targ, attacker ) ) {
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
EQI4 $445
line 1154
;1154:			attacker->client->ps.persistant[PERS_HITS]--;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 1155
;1155:		} else {
ADDRGP4 $446
JUMPV
LABELV $445
line 1156
;1156:			attacker->client->ps.persistant[PERS_HITS]++;
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 516
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
line 1157
;1157:		}
LABELV $446
line 1158
;1158:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
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
line 1159
;1159:	}
LABELV $443
line 1163
;1160:
;1161:	// always give half damage if hurting self
;1162:	// calculated after knockback, so rocket jumping works
;1163:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $447
line 1164
;1164:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1165
;1165:	}
LABELV $447
line 1167
;1166:
;1167:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $449
line 1168
;1168:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1169
;1169:	}
LABELV $449
line 1170
;1170:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1171
;1171:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1174
;1172:
;1173:	// save some from armor
;1174:	asave = CheckArmor (targ, take, dflags);
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
line 1175
;1175:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1177
;1176:
;1177:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $451
line 1178
;1178:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $454
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
CNSTI4 740
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
line 1180
;1179:			targ->health, take, asave );
;1180:	}
LABELV $451
line 1185
;1181:
;1182:	// add to the damage inflicted on a player this frame
;1183:	// the total will be turned into screen blends and view angle kicks
;1184:	// at the end of the frame
;1185:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
line 1186
;1186:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $458
line 1187
;1187:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1188
;1188:		} else {
ADDRGP4 $459
JUMPV
LABELV $458
line 1189
;1189:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1190
;1190:		}
LABELV $459
line 1191
;1191:		client->damage_armor += asave;
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
line 1192
;1192:		client->damage_blood += take;
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
line 1193
;1193:		client->damage_knockback += knockback;
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
line 1194
;1194:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $460
line 1195
;1195:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1196
;1196:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 1197
;1197:		} else {
ADDRGP4 $461
JUMPV
LABELV $460
line 1198
;1198:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1199
;1199:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 1
ASGNI4
line 1200
;1200:		}
LABELV $461
line 1201
;1201:	}
LABELV $456
line 1207
;1202:
;1203:	// See if it's the player hurting the emeny flag carrier
;1204:#ifdef MISSIONPACK
;1205:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1206:#else	
;1207:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $462
line 1209
;1208:#endif
;1209:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1210
;1210:	}
LABELV $462
line 1212
;1211:
;1212:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $465
line 1214
;1213:		// set the last client who damaged the target
;1214:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2596
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1215
;1215:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1216
;1216:	}
LABELV $465
line 1219
;1217:
;1218:	// Shafe - Trep - Headshots
;1219:	if (targ->client && attacker->client && targ->health > 0)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 516
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
EQU4 $467
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $467
ADDRLP4 72
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
LEI4 $467
line 1220
;1220:	{   
line 1222
;1221:		// let's say only railgun can do head shots
;1222:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $469
line 1223
;1223:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ASGNF4
line 1226
;1224:	
;1225:			// handling crouching
;1226:			if(targ->client->ps.pm_flags & PMF_DUCKED){
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $471
line 1227
;1227:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
ADDRFP4 0
INDIRP4
CNSTI4 444
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
line 1228
;1228:			}
ADDRGP4 $472
JUMPV
LABELV $471
line 1230
;1229:			else
;1230:				height = abs(targ->r.mins[2]) + targ_maxs2; 
ADDRFP4 0
INDIRP4
CNSTI4 444
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
LABELV $472
line 1235
;1231:				
;1232:			// project the z component of point 
;1233:			// onto the z component of the model's origin
;1234:			// this results in the z component from the origin at 0
;1235:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 444
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
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ADDRLP4 92
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1236
;1236:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1238
;1237:		
;1238:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $473
line 1239
;1239:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1240
;1240:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1241
;1241:			}
LABELV $473
line 1242
;1242:		}
LABELV $469
line 1243
;1243:	}
LABELV $467
line 1248
;1244:	// Shafe - Trep - End Headshot Code
;1245:
;1246:
;1247:	// do the damage
;1248:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $475
line 1249
;1249:		targ->health = targ->health - take;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 740
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
line 1250
;1250:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $477
line 1251
;1251:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 1252
;1252:		}
LABELV $477
line 1254
;1253:			
;1254:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $479
line 1255
;1255:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $481
line 1256
;1256:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 536
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
LABELV $481
line 1258
;1257:
;1258:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $483
line 1259
;1259:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 -999
ASGNI4
LABELV $483
line 1261
;1260:
;1261:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1262
;1262:			targ->die (targ, inflictor, attacker, take, mod);
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
CNSTI4 724
ADDP4
INDIRP4
CALLV
pop
line 1263
;1263:			return;
ADDRGP4 $384
JUMPV
LABELV $479
line 1264
;1264:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $485
line 1265
;1265:			targ->pain (targ, attacker, take);
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
CNSTI4 720
ADDP4
INDIRP4
CALLV
pop
line 1266
;1266:		}
LABELV $485
line 1267
;1267:	}
LABELV $475
line 1269
;1268:
;1269:}
LABELV $384
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1280
;1270:
;1271:
;1272:/*
;1273:============
;1274:CanDamage
;1275:
;1276:Returns qtrue if the inflictor can directly damage the target.  Used for
;1277:explosions and melee attacks.
;1278:============
;1279:*/
;1280:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1287
;1281:	vec3_t	dest;
;1282:	trace_t	tr;
;1283:	vec3_t	midpoint;
;1284:
;1285:	// use the midpoint of the bounds instead of the origin, because
;1286:	// bmodels may have their origin is 0,0,0
;1287:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 480
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
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1288
;1288:	VectorScale (midpoint, 0.5, midpoint);
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
line 1290
;1289:
;1290:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1291
;1291:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1292
;1292:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $498
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $494
LABELV $498
line 1293
;1293:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $487
JUMPV
LABELV $494
line 1297
;1294:
;1295:	// this should probably check in the plane of projection, 
;1296:	// rather than in world coordinate, and also include Z
;1297:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1298
;1298:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1299
;1299:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1300
;1300:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1301
;1301:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $500
line 1302
;1302:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $487
JUMPV
LABELV $500
line 1304
;1303:
;1304:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1305
;1305:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1306
;1306:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1307
;1307:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1308
;1308:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $504
line 1309
;1309:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $487
JUMPV
LABELV $504
line 1311
;1310:
;1311:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1312
;1312:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1313
;1313:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1314
;1314:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1315
;1315:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $508
line 1316
;1316:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $487
JUMPV
LABELV $508
line 1318
;1317:
;1318:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1319
;1319:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1320
;1320:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1321
;1321:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1322
;1322:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $512
line 1323
;1323:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $487
JUMPV
LABELV $512
line 1326
;1324:
;1325:
;1326:	return qfalse;
CNSTI4 0
RETI4
LABELV $487
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1336
;1327:}
;1328:
;1329:
;1330:/*
;1331:============
;1332:G_RadiusDamage
;1333:============
;1334:*/
;1335:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1336:					 gentity_t *ignore, int mod) {
line 1345
;1337:	float		points, dist;
;1338:	gentity_t	*ent;
;1339:	int			entityList[MAX_GENTITIES];
;1340:	int			numListedEntities;
;1341:	vec3_t		mins, maxs;
;1342:	vec3_t		v;
;1343:	vec3_t		dir;
;1344:	int			i, e;
;1345:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1347
;1346:
;1347:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $516
line 1348
;1348:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1349
;1349:	}
LABELV $516
line 1351
;1350:
;1351:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $518
line 1352
;1352:		mins[i] = origin[i] - radius;
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
line 1353
;1353:		maxs[i] = origin[i] + radius;
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
line 1354
;1354:	}
LABELV $519
line 1351
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $518
line 1356
;1355:
;1356:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
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
line 1358
;1357:
;1358:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $525
JUMPV
LABELV $522
line 1359
;1359:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 836
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
line 1361
;1360:
;1361:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $526
line 1362
;1362:			continue;
ADDRGP4 $523
JUMPV
LABELV $526
line 1363
;1363:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $528
line 1364
;1364:			continue;
ADDRGP4 $523
JUMPV
LABELV $528
line 1367
;1365:
;1366:		// find the distance from the edge of the bounding box
;1367:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $530
line 1368
;1368:			if ( origin[i] < ent->r.absmin[i] ) {
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
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $534
line 1369
;1369:				v[i] = ent->r.absmin[i] - origin[i];
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
CNSTI4 464
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
line 1370
;1370:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $535
JUMPV
LABELV $534
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
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $536
line 1371
;1371:				v[i] = origin[i] - ent->r.absmax[i];
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
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1372
;1372:			} else {
ADDRGP4 $537
JUMPV
LABELV $536
line 1373
;1373:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1374
;1374:			}
LABELV $537
LABELV $535
line 1375
;1375:		}
LABELV $531
line 1367
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $530
line 1377
;1376:
;1377:		dist = VectorLength( v );
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
line 1378
;1378:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $538
line 1379
;1379:			continue;
ADDRGP4 $523
JUMPV
LABELV $538
line 1382
;1380:		}
;1381:
;1382:		points = damage * ( 1.0 - dist / radius );
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
line 1384
;1383:
;1384:		if( CanDamage (ent, origin) ) {
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
EQI4 $540
line 1385
;1385:			if( LogAccuracyHit( ent, attacker ) ) {
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
EQI4 $542
line 1386
;1386:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1387
;1387:			}
LABELV $542
line 1388
;1388:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 488
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
CNSTI4 492
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
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1391
;1389:			// push the center of mass higher than the origin so players
;1390:			// get knocked into the air more
;1391:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1392
;1392:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
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
line 1393
;1393:		}
LABELV $540
line 1394
;1394:	}
LABELV $523
line 1358
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $525
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $522
line 1396
;1395:
;1396:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $515
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
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJump
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
LABELV $454
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
LABELV $350
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
LABELV $335
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
LABELV $332
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
LABELV $329
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
LABELV $326
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
LABELV $323
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
LABELV $316
byte 1 115
byte 1 0
align 1
LABELV $315
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
LABELV $314
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
LABELV $310
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
LABELV $309
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
LABELV $279
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
LABELV $241
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
LABELV $240
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
LABELV $233
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $232
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
LABELV $210
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
LABELV $209
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
LABELV $189
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
LABELV $188
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
LABELV $177
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
LABELV $176
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
LABELV $175
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
LABELV $174
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
LABELV $173
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
LABELV $172
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
LABELV $171
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
LABELV $170
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
LABELV $169
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
LABELV $168
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
LABELV $167
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
LABELV $166
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
LABELV $165
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $164
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
LABELV $163
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
LABELV $162
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
LABELV $161
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
LABELV $160
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
LABELV $159
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
LABELV $158
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
LABELV $157
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
LABELV $156
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
LABELV $155
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
LABELV $154
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
LABELV $153
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
LABELV $123
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
