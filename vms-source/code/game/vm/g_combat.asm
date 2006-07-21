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
;293:	if (ent->client->pers.h_gauntlet) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $132
line 294
;294:	if (ent->client->pers.h_mg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $134
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $134
line 295
;295:	if (ent->client->pers.h_sg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
INDIRI4
CNSTI4 0
EQI4 $136
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $136
line 296
;296:	if (ent->client->pers.h_grenade) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
INDIRI4
CNSTI4 0
EQI4 $138
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $138
line 297
;297:	if (ent->client->pers.h_singcan) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $140
line 298
;298:	if (ent->client->pers.h_flame) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $142
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $142
line 299
;299:	if (ent->client->pers.h_gauss) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $144
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $144
line 300
;300:	if (ent->client->pers.h_plasma) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
INDIRI4
CNSTI4 0
EQI4 $146
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $146
line 301
;301:	if (ent->client->pers.h_bfg) { return qfalse; }
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $148
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $148
line 302
;302:	return qtrue;
CNSTI4 1
RETI4
LABELV $131
endproc IsOutOfWeapons 0 0
data
export modNames
align 4
LABELV modNames
address $150
address $151
address $152
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
export CheckAlmostCapture
code
proc CheckAlmostCapture 56 12
line 376
;303:}
;304:
;305:
;306:// these are just for logging, the client prints its own messages
;307:char	*modNames[] = {
;308:	"MOD_UNKNOWN",
;309:	"MOD_SHOTGUN",
;310:	"MOD_GAUNTLET",
;311:	"MOD_MACHINEGUN",
;312:	"MOD_GRENADE",
;313:	"MOD_GRENADE_SPLASH",
;314:	"MOD_ROCKET",
;315:	"MOD_ROCKET_SPLASH",
;316:	"MOD_PLASMA",
;317:	"MOD_PLASMA_SPLASH",
;318:	"MOD_RAILGUN",
;319:	"MOD_LIGHTNING",
;320:	"MOD_BFG",
;321:	"MOD_BFG_SPLASH",
;322:	"MOD_WATER",
;323:	"MOD_SLIME",
;324:	"MOD_LAVA",
;325:	"MOD_CRUSH",
;326:	"MOD_TELEFRAG",
;327:	"MOD_FALLING",
;328:	"MOD_SUICIDE",
;329:	"MOD_TARGET_LASER",
;330:	"MOD_TRIGGER_HURT",
;331:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;332:#ifdef MISSIONPACK
;333:	"MOD_NAIL",
;334:	"MOD_CHAINGUN",
;335:	"MOD_PROXIMITY_MINE",
;336:#endif
;337:	"MOD_GRAPPLE"
;338:};
;339:
;340:#ifdef MISSIONPACK
;341:/*
;342:==================
;343:Kamikaze_DeathActivate
;344:==================
;345:*/
;346:void Kamikaze_DeathActivate( gentity_t *ent ) {
;347:	G_StartKamikaze(ent);
;348:	G_FreeEntity(ent);
;349:}
;350:
;351:/*
;352:==================
;353:Kamikaze_DeathTimer
;354:==================
;355:*/
;356:void Kamikaze_DeathTimer( gentity_t *self ) {
;357:	gentity_t *ent;
;358:
;359:	ent = G_Spawn();
;360:	ent->classname = "kamikaze timer";
;361:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;362:	ent->r.svFlags |= SVF_NOCLIENT;
;363:	ent->think = Kamikaze_DeathActivate;
;364:	ent->nextthink = level.time + 5 * 1000;
;365:
;366:	ent->activator = self;
;367:}
;368:
;369:#endif
;370:
;371:/*
;372:==================
;373:CheckAlmostCapture
;374:==================
;375:*/
;376:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 382
;377:	gentity_t	*ent;
;378:	vec3_t		dir;
;379:	char		*classname;
;380:
;381:	// if this player was carrying a flag
;382:	if ( self->client->ps.powerups[PW_REDFLAG] ||
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
NEI4 $179
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $179
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $176
LABELV $179
line 384
;383:		self->client->ps.powerups[PW_BLUEFLAG] ||
;384:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 386
;385:		// get the goal flag this player should have been going for
;386:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $180
line 387
;387:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $183
line 388
;388:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $185
ASGNP4
line 389
;389:			}
ADDRGP4 $181
JUMPV
LABELV $183
line 390
;390:			else {
line 391
;391:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $186
ASGNP4
line 392
;392:			}
line 393
;393:		}
ADDRGP4 $181
JUMPV
LABELV $180
line 394
;394:		else {
line 395
;395:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $187
line 396
;396:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $186
ASGNP4
line 397
;397:			}
ADDRGP4 $188
JUMPV
LABELV $187
line 398
;398:			else {
line 399
;399:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $185
ASGNP4
line 400
;400:			}
LABELV $188
line 401
;401:		}
LABELV $181
line 402
;402:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $189
line 404
;403:		do
;404:		{
line 405
;405:			ent = G_Find(ent, FOFS(classname), classname);
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
line 406
;406:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $190
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $189
LABELV $192
line 408
;407:		// if we found the destination flag and it's not picked up
;408:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $193
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $193
line 410
;409:			// if the player was *very* close
;410:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 411
;411:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 8
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 1128792064
GEF4 $197
line 412
;412:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 413
;413:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
line 414
;414:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 415
;415:				}
LABELV $199
line 416
;416:			}
LABELV $197
line 417
;417:		}
LABELV $193
line 418
;418:	}
LABELV $176
line 419
;419:}
LABELV $175
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 426
;420:
;421:/*
;422:==================
;423:CheckAlmostScored
;424:==================
;425:*/
;426:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 432
;427:	gentity_t	*ent;
;428:	vec3_t		dir;
;429:	char		*classname;
;430:
;431:	// if the player was carrying cubes
;432:	if ( self->client->ps.generic1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $202
line 433
;433:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 2
NEI4 $204
line 434
;434:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $206
ASGNP4
line 435
;435:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 436
;436:		else {
line 437
;437:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $207
ASGNP4
line 438
;438:		}
LABELV $205
line 439
;439:		ent = G_Find(NULL, FOFS(classname), classname);
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
line 441
;440:		// if we found the destination obelisk
;441:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
line 443
;442:			// if the player was *very* close
;443:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 444
;444:			if ( VectorLength(dir) < 200 ) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $212
line 445
;445:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 446
;446:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 447
;447:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 448
;448:				}
LABELV $214
line 449
;449:			}
LABELV $212
line 450
;450:		}
LABELV $208
line 451
;451:	}
LABELV $202
line 452
;452:}
LABELV $201
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $217
skip 4
align 4
LABELV $342
skip 4
export player_die
code
proc player_die 116 28
line 462
;453:
;454:
;455:
;456:/*
;457:==================
;458:player_die
;459:==================
;460:*/
;461:extern int CountSurvivors();
;462:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 479
;463:	gentity_t	*ent;
;464:	int			anim;
;465:	int			contents;
;466:	int			killer;
;467:	int			i;
;468:	char		*killerName, *obit;
;469:	// Shafe - Trep - For Arsenal
;470:	int			tmpW;
;471:	int			tmpCnt;
;472:	static		int deathNum;
;473:	//gentity_t	*xte;
;474:
;475:
;476:
;477:
;478:
;479:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $218
line 480
;480:		return;
ADDRGP4 $216
JUMPV
LABELV $218
line 483
;481:	}
;482:
;483:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $220
line 484
;484:		return;
ADDRGP4 $216
JUMPV
LABELV $220
line 490
;485:	}
;486:
;487:
;488://unlagged - backward reconciliation #2
;489:	// make sure the body shows up in the client's current position
;490:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 494
;491://unlagged - backward reconciliation #2
;492:
;493:	// check for an almost capture
;494:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 496
;495:	// check for a player that almost brought in cubes
;496:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 499
;497:
;498:
;499:	if (self->client && self->client->hook)
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
EQU4 $223
ADDRLP4 36
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $223
line 500
;500:		Weapon_HookFree(self->client->hook);
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
LABELV $223
line 508
;501:#ifdef MISSIONPACK
;502:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;503:		self->client->ps.eFlags &= ~EF_TICKING;
;504:		self->activator->think = G_FreeEntity;
;505:		self->activator->nextthink = level.time;
;506:	}
;507:#endif
;508:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 511
;509:
;510:	// Shafe - Trep - Clear out the PDG
;511:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 512
;512:	VectorClear( self->teleloc ); 
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
line 514
;513:
;514:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $225
line 515
;515:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 516
;516:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 517
;517:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 518
;518:		} else {
ADDRGP4 $226
JUMPV
LABELV $227
line 519
;519:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $229
ASGNP4
line 520
;520:		}
line 521
;521:	} else {
ADDRGP4 $226
JUMPV
LABELV $225
line 522
;522:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 523
;523:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $230
ASGNP4
line 524
;524:	}
LABELV $226
line 526
;525:
;526:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $233
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $231
LABELV $233
line 527
;527:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 528
;528:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $230
ASGNP4
line 529
;529:	}
LABELV $231
line 531
;530:
;531:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 56
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
LTI4 $236
ADDRLP4 56
INDIRI4
CVIU4 4
CNSTU4 25
LTU4 $234
LABELV $236
line 532
;532:		obit = "<bad obituary>";
ADDRLP4 24
ADDRGP4 $237
ASGNP4
line 533
;533:	} else {
ADDRGP4 $235
JUMPV
LABELV $234
line 534
;534:		obit = modNames[ meansOfDeath ];
ADDRLP4 24
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 535
;535:	}
LABELV $235
line 537
;536:
;537:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $238
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
line 542
;538:		killer, self->s.number, meansOfDeath, killerName, 
;539:		self->client->pers.netname, obit );
;540:
;541:	// broadcast the death event to everyone
;542:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
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
line 543
;543:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 544
;544:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 545
;545:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 546
;546:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 32
ASGNI4
line 548
;547:
;548:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 550
;549:
;550:	self->client->ps.persistant[PERS_KILLED]++;
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
line 552
;551:
;552:	if (attacker && attacker->client) {
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
EQU4 $239
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $239
line 553
;553:		attacker->client->lastkilled_client = self->s.number;
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
line 555
;554:
;555:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
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
EQU4 $243
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
EQI4 $241
LABELV $243
line 556
;556:			AddScore( attacker, self->r.currentOrigin, -1 );
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
line 559
;557:			
;558:
;559:		} else {
ADDRGP4 $240
JUMPV
LABELV $241
line 560
;560:			AddScore( attacker, self->r.currentOrigin, 1 );
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
line 562
;561:
;562:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $244
line 565
;563:				
;564:				// play humiliation on player
;565:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
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
line 568
;566:
;567:				// add the sprite over the player's head
;568:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 569
;569:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
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
line 570
;570:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 573
;571:
;572:				// also play humiliation on target
;573:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
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
line 574
;574:			}
LABELV $244
line 578
;575:
;576:			// check for two kills in a short amount of time
;577:			// if this is close enough to the last kill, give a reward sound
;578:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
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
GEI4 $247
line 580
;579:				// play excellent on player
;580:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
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
line 583
;581:
;582:				// add the sprite over the player's head
;583:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
line 584
;584:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
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
line 585
;585:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
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
line 586
;586:			}
LABELV $247
line 587
;587:			attacker->client->lastKillTime = level.time;
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
line 589
;588:
;589:		}
line 590
;590:	} else {
ADDRGP4 $240
JUMPV
LABELV $239
line 591
;591:		AddScore( self, self->r.currentOrigin, -1 );
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
line 592
;592:	}
LABELV $240
line 595
;593:
;594:	// Add team bonuses
;595:	Team_FragBonuses(self, inflictor, attacker);
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
line 598
;596:
;597:	// if I committed suicide, the flag does not fall, it returns.
;598:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $252
line 599
;599:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 600
;600:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 601
;601:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 602
;602:		}
ADDRGP4 $255
JUMPV
LABELV $254
line 603
;603:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
line 604
;604:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 605
;605:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 606
;606:		}
ADDRGP4 $257
JUMPV
LABELV $256
line 607
;607:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $258
line 608
;608:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 609
;609:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 610
;610:		}
LABELV $258
LABELV $257
LABELV $255
line 611
;611:	}
LABELV $252
line 614
;612:
;613:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;614:	contents = trap_PointContents( self->r.currentOrigin, -1 );
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
ADDRLP4 16
ADDRLP4 80
INDIRI4
ASGNI4
line 615
;615:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $260
line 616
;616:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 617
;617:	}
ADDRGP4 $261
JUMPV
LABELV $260
line 618
;618:	else {
line 619
;619:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $262
line 620
;620:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 621
;621:		}
ADDRGP4 $263
JUMPV
LABELV $262
line 622
;622:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $264
line 623
;623:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 624
;624:		}
ADDRGP4 $265
JUMPV
LABELV $264
line 625
;625:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $266
line 626
;626:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 627
;627:		}
LABELV $266
LABELV $265
LABELV $263
line 628
;628:	}
LABELV $261
line 637
;629:#ifdef MISSIONPACK
;630:	TossClientPersistantPowerups( self );
;631:	if( g_gametype.integer == GT_HARVESTER ) {
;632:		TossClientCubes( self );
;633:	}
;634:#endif
;635:
;636:			// Shafe - Trep - Arsenal Stuff
;637:		if ( g_GameMode.integer != 0 && meansOfDeath != MOD_TELEFRAG && !level.warmupTime) 
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $268
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $268
ADDRGP4 level+16
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $268
line 638
;638:		{
line 639
;639:			tmpW = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 642
;640:			
;641:			//G_Printf( S_COLOR_GREEN "DEBUG: Weapon You Held by %s was %i\n", self->client->pers.netname, tmpW );
;642:			if (level.firstStrike == qfalse)
ADDRGP4 level+9228
INDIRI4
CNSTI4 0
NEI4 $272
line 643
;643:			{
line 644
;644:				level.firstStrike = qtrue;
ADDRGP4 level+9228
CNSTI4 1
ASGNI4
line 645
;645:				BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $276
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 646
;646:				trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $277
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
line 647
;647:			}
LABELV $272
line 649
;648:
;649:			if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 12
INDIRI4
CNSTI4 9
NEI4 $278
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2480
ADDP4
CNSTI4 0
ASGNI4
LABELV $278
line 650
;650:			if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 12
INDIRI4
CNSTI4 8
NEI4 $280
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2476
ADDP4
CNSTI4 0
ASGNI4
LABELV $280
line 651
;651:			if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 7
NEI4 $282
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2472
ADDP4
CNSTI4 0
ASGNI4
LABELV $282
line 652
;652:			if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 6
NEI4 $284
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2468
ADDP4
CNSTI4 0
ASGNI4
LABELV $284
line 653
;653:			if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 5
NEI4 $286
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2464
ADDP4
CNSTI4 0
ASGNI4
LABELV $286
line 654
;654:			if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 4
NEI4 $288
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2460
ADDP4
CNSTI4 0
ASGNI4
LABELV $288
line 655
;655:			if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 3
NEI4 $290
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2456
ADDP4
CNSTI4 0
ASGNI4
LABELV $290
line 656
;656:			if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $292
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2452
ADDP4
CNSTI4 0
ASGNI4
LABELV $292
line 657
;657:			if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $294
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2448
ADDP4
CNSTI4 0
ASGNI4
LABELV $294
line 659
;658:
;659:			if (IsOutOfWeapons(self)) 
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
EQI4 $296
line 660
;660:			{
line 661
;661:				trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $298
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
line 662
;662:				trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $299
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
line 666
;663:				
;664:
;665:				// Send them to Spec
;666:				self->client->pers.TrueScore = self->client->ps.persistant[PERS_SCORE];
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 2488
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 667
;667:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 668
;668:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $300
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 671
;669:
;670:
;671:				tmpCnt = (CountSurvivors());
ADDRLP4 104
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 104
INDIRI4
ASGNI4
line 674
;672:
;673:						
;674:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 28
INDIRI4
ADDRGP4 level+9220
INDIRI4
EQI4 $301
line 675
;675:				{
line 677
;676:
;677:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9220
ADDRLP4 28
INDIRI4
ASGNI4
line 680
;678:			
;679:			
;680:					if (tmpCnt == 5) 
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $305
line 681
;681:					{
line 682
;682:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $307
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 683
;683:					}
LABELV $305
line 685
;684:					
;685:					if (tmpCnt == 4) 
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $308
line 686
;686:					{
line 687
;687:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $310
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 688
;688:					}
LABELV $308
line 690
;689:
;690:					if (tmpCnt == 3) 
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $311
line 691
;691:					{
line 692
;692:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $313
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 693
;693:					}
LABELV $311
line 695
;694:
;695:					if (tmpCnt == 2) 
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $314
line 696
;696:					{
line 698
;697:						
;698:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $316
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 699
;699:					}
LABELV $314
line 701
;700:
;701:					if (tmpCnt == 1) 
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $317
line 702
;702:					{
line 703
;703:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $319
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 707
;704:					
;705:
;706:						////////////////
;707:					}			
LABELV $317
line 708
;708:				}
LABELV $301
line 709
;709:			} 
LABELV $296
line 711
;710:
;711:		}
LABELV $268
line 714
;712:		// End Arsenal Stuff
;713:
;714:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 717
;715:	// send updated scores to any clients that are following this one,
;716:	// or they would get stale scoreboards
;717:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $323
JUMPV
LABELV $320
line 720
;718:		gclient_t	*client;
;719:
;720:		client = &level.clients[i];
ADDRLP4 88
CNSTI4 3392
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 721
;721:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 88
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $325
line 722
;722:			continue;
ADDRGP4 $321
JUMPV
LABELV $325
line 724
;723:		}
;724:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 88
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
EQI4 $327
line 725
;725:			continue;
ADDRGP4 $321
JUMPV
LABELV $327
line 727
;726:		}
;727:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 88
INDIRP4
CNSTI4 2504
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $329
line 728
;728:			Cmd_Score_f( g_entities + i );
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
line 729
;729:		}
LABELV $329
line 730
;730:	}
LABELV $321
line 717
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $323
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $320
line 732
;731:
;732:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 1
ASGNI4
line 734
;733:
;734:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 735
;735:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 736
;736:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 738
;737:
;738:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 739
;739:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 740
;740:	LookAtKiller (self, inflictor, attacker);
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
line 742
;741:
;742:	VectorCopy( self->s.angles, self->client->ps.viewangles );
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
line 744
;743:
;744:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 746
;745:
;746:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3238002688
ASGNF4
line 750
;747:
;748:	// don't allow respawn until the death anim is done
;749:	// g_forcerespawn may force spawning at some later time
;750:	self->client->respawnTime = level.time + 1700;  // This is the real line
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
line 757
;751:	
;752:
;753:	
;754:	
;755:
;756:	// remove powerups
;757:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
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
line 759
;758:
;759:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $332
line 760
;760:	{
line 761
;761:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $334
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 762
;762:	}
LABELV $332
line 767
;763:
;764:
;765:
;766:	// never gib in a nodrop
;767:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $341
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $341
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $341
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $338
LABELV $341
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $335
LABELV $338
line 769
;768:		// gib death
;769:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 770
;770:	} else {
ADDRGP4 $336
JUMPV
LABELV $335
line 774
;771:		// normal death
;772:		static int i;
;773:
;774:		switch ( i ) {
ADDRLP4 92
ADDRGP4 $342
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $345
ADDRLP4 92
INDIRI4
CNSTI4 1
EQI4 $346
ADDRLP4 92
INDIRI4
CNSTI4 2
EQI4 $347
ADDRGP4 $343
JUMPV
LABELV $345
line 776
;775:		case 0:
;776:			anim = BOTH_DEATH1;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 777
;777:			break;
ADDRGP4 $344
JUMPV
LABELV $346
line 779
;778:		case 1:
;779:			anim = BOTH_DEATH2;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 780
;780:			break;
ADDRGP4 $344
JUMPV
LABELV $347
LABELV $343
line 783
;781:		case 2:
;782:		default:
;783:			anim = BOTH_DEATH3;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 784
;784:			break;
LABELV $344
line 789
;785:		}
;786:
;787:		// for the no-blood option, we need to prevent the health
;788:		// from going to gib level
;789:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $348
line 790
;790:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 -39
ASGNI4
line 791
;791:		}
LABELV $348
line 793
;792:
;793:		self->client->ps.legsAnim = 
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
line 795
;794:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;795:		self->client->ps.torsoAnim = 
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
line 798
;796:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;797:
;798:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $342
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
line 801
;799:
;800:		// Shafe - Trep Headshot //////////////////////////////////////////
;801:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $350
line 802
;802:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $351
JUMPV
LABELV $350
line 804
;803:		else
;804:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2648
ADDP4
CNSTI4 0
ASGNI4
LABELV $351
line 808
;805:		// Shafe - Trep - End Headshot /////////////////////////////
;806:
;807:		// the body can still be gibbed
;808:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 body_die
ASGNP4
line 811
;809:
;810:		// globally cycle through the different death animations
;811:		i = ( i + 1 ) % 3;
ADDRLP4 112
ADDRGP4 $342
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
line 820
;812:
;813:
;814:
;815:#ifdef MISSIONPACK
;816:		if (self->s.eFlags & EF_KAMIKAZE) {
;817:			Kamikaze_DeathTimer( self );
;818:		}
;819:#endif
;820:	}
LABELV $336
line 825
;821:
;822:	
;823:
;824:
;825:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 827
;826:
;827:}
LABELV $216
endproc player_die 116 28
export CheckArmor
proc CheckArmor 20 4
line 836
;828:
;829:
;830:/*
;831:================
;832:CheckArmor
;833:================
;834:*/
;835:int CheckArmor (gentity_t *ent, int damage, int dflags)
;836:{
line 841
;837:	gclient_t	*client;
;838:	int			save;
;839:	int			count;
;840:
;841:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $353
line 842
;842:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $352
JUMPV
LABELV $353
line 844
;843:
;844:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 846
;845:
;846:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $355
line 847
;847:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $352
JUMPV
LABELV $355
line 849
;848:
;849:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $357
line 850
;850:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $352
JUMPV
LABELV $357
line 853
;851:
;852:	// armor
;853:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 854
;854:	save = ceil( damage * ARMOR_PROTECTION );
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
line 855
;855:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $359
line 856
;856:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $359
line 858
;857:
;858:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $361
line 859
;859:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $352
JUMPV
LABELV $361
line 861
;860:
;861:	client->ps.stats[STAT_ARMOR] -= save;
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
line 863
;862:
;863:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $352
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 871
;864:}
;865:
;866:/*
;867:================
;868:RaySphereIntersections
;869:================
;870:*/
;871:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 880
;872:	float b, c, d, t;
;873:
;874:	//	| origin - (point + t * dir) | = radius
;875:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;876:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;877:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;878:
;879:	// normalize dir so a = 1
;880:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 881
;881:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
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
line 882
;882:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
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
line 887
;883:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;884:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;885:		radius * radius;
;886:
;887:	d = b * b - 4 * c;
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
line 888
;888:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $364
line 889
;889:		t = (- b + sqrt(d)) / 2;
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
line 890
;890:		VectorMA(point, t, dir, intersections[0]);
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
line 891
;891:		t = (- b - sqrt(d)) / 2;
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
line 892
;892:		VectorMA(point, t, dir, intersections[1]);
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
line 893
;893:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $363
JUMPV
LABELV $364
line 895
;894:	}
;895:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $366
line 896
;896:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 897
;897:		VectorMA(point, t, dir, intersections[0]);
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
line 898
;898:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $363
JUMPV
LABELV $366
line 900
;899:	}
;900:	return 0;
CNSTI4 0
RETI4
LABELV $363
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 967
;901:}
;902:
;903:#ifdef MISSIONPACK
;904:/*
;905:================
;906:G_InvulnerabilityEffect
;907:================
;908:*/
;909:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;910:	gentity_t	*impact;
;911:	vec3_t		intersections[2], vec;
;912:	int			n;
;913:
;914:	if ( !targ->client ) {
;915:		return qfalse;
;916:	}
;917:	VectorCopy(dir, vec);
;918:	VectorInverse(vec);
;919:	// sphere model radius = 42 units
;920:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;921:	if (n > 0) {
;922:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;923:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;924:		vectoangles(vec, impact->s.angles);
;925:		impact->s.angles[0] += 90;
;926:		if (impact->s.angles[0] > 360)
;927:			impact->s.angles[0] -= 360;
;928:		if ( impactpoint ) {
;929:			VectorCopy( intersections[0], impactpoint );
;930:		}
;931:		if ( bouncedir ) {
;932:			VectorCopy( vec, bouncedir );
;933:			VectorNormalize( bouncedir );
;934:		}
;935:		return qtrue;
;936:	}
;937:	else {
;938:		return qfalse;
;939:	}
;940:}
;941:#endif
;942:/*
;943:============
;944:T_Damage
;945:
;946:targ		entity that is being damaged
;947:inflictor	entity that is causing the damage
;948:attacker	entity that caused the inflictor to damage targ
;949:	example: targ=monster, inflictor=rocket, attacker=player
;950:
;951:dir			direction of the attack for knockback
;952:point		point at which the damage is being inflicted, used for headshots
;953:damage		amount of damage being inflicted
;954:knockback	force to be applied against targ as a result of the damage
;955:
;956:inflictor, attacker, dir, and point can be NULL for environmental effects
;957:
;958:dflags		these flags are used to control how T_Damage works
;959:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;960:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;961:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;962:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;963:============
;964:*/
;965:
;966:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;967:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 985
;968:	gclient_t	*client;
;969:	int			take;
;970:	int			save;
;971:	int			asave;
;972:	int			knockback;
;973:	int			max;
;974:	// Shafe - Trep - Headshot
;975:	float		z_ratio;
;976:	float		z_rel;
;977:	int			height;
;978:	float		targ_maxs2;
;979:	// Shafe - Trep - End Headshot
;980:
;981:#ifdef MISSIONPACK
;982:	vec3_t		bouncedir, impactpoint;
;983:#endif
;984:
;985:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $369
line 986
;986:		return;
ADDRGP4 $368
JUMPV
LABELV $369
line 991
;987:	}
;988:
;989:	// the intermission has allready been qualified for, so don't
;990:	// allow any extra scoring
;991:	if ( level.intermissionQueued ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $371
line 992
;992:		return;
ADDRGP4 $368
JUMPV
LABELV $371
line 1004
;993:	}
;994:#ifdef MISSIONPACK
;995:	if ( targ->client && mod != MOD_JUICED) {
;996:		if ( targ->client->invulnerabilityTime > level.time) {
;997:			if ( dir && point ) {
;998:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;999:			}
;1000:			return;
;1001:		}
;1002:	}
;1003:#endif
;1004:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $374
line 1005
;1005:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+854392
ASGNP4
line 1006
;1006:	}
LABELV $374
line 1007
;1007:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $377
line 1008
;1008:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+854392
ASGNP4
line 1009
;1009:	}
LABELV $377
line 1012
;1010:
;1011:	// shootable doors / buttons don't actually have any health
;1012:	if ( targ->s.eType == ET_MOVER ) {
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
NEI4 $380
line 1013
;1013:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
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
EQU4 $368
ADDRLP4 44
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $368
line 1014
;1014:			targ->use( targ, inflictor, attacker );
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
line 1015
;1015:		}
line 1016
;1016:		return;
ADDRGP4 $368
JUMPV
LABELV $380
line 1025
;1017:	}
;1018:#ifdef MISSIONPACK
;1019:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1020:		return;
;1021:	}
;1022:#endif
;1023:	// reduce damage by the attacker's handicap value
;1024:	// unless they are rocket jumping
;1025:	if ( attacker->client && attacker != targ ) {
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
EQU4 $384
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $384
line 1026
;1026:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
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
line 1032
;1027:#ifdef MISSIONPACK
;1028:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1029:			max /= 2;
;1030:		}
;1031:#endif
;1032:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1033
;1033:	}
LABELV $384
line 1035
;1034:
;1035:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1037
;1036:
;1037:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $386
line 1038
;1038:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $388
line 1039
;1039:			return;
ADDRGP4 $368
JUMPV
LABELV $388
line 1041
;1040:		}
;1041:	}
LABELV $386
line 1043
;1042:
;1043:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $390
line 1044
;1044:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1045
;1045:	} else {
ADDRGP4 $391
JUMPV
LABELV $390
line 1046
;1046:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1047
;1047:	}
LABELV $391
line 1049
;1048:
;1049:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1050
;1050:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $392
line 1051
;1051:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1052
;1052:	}
LABELV $392
line 1053
;1053:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $394
line 1054
;1054:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1055
;1055:	}
LABELV $394
line 1056
;1056:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $396
line 1057
;1057:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1058
;1058:	}
LABELV $396
line 1061
;1059:
;1060:	// figure momentum add, even if the damage won't be taken
;1061:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $398
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $398
line 1065
;1062:		vec3_t	kvel;
;1063:		float	mass;
;1064:
;1065:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1067
;1066:
;1067:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
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
line 1068
;1068:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
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
line 1072
;1069:
;1070:		// set the timer so that the other client can't cancel
;1071:		// out the movement immediately
;1072:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $407
line 1075
;1073:			int		t;
;1074:
;1075:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1076
;1076:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $409
line 1077
;1077:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1078
;1078:			}
LABELV $409
line 1079
;1079:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $411
line 1080
;1080:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1081
;1081:			}
LABELV $411
line 1082
;1082:			targ->client->ps.pm_time = t;
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
line 1083
;1083:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
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
line 1084
;1084:		}
LABELV $407
line 1085
;1085:	}
LABELV $398
line 1088
;1086:
;1087:	// check for completely getting out of the damage
;1088:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $413
line 1095
;1089:
;1090:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1091:		// if the attacker was on the same team
;1092:#ifdef MISSIONPACK
;1093:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1094:#else	
;1095:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
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
EQU4 $415
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
EQI4 $415
line 1097
;1096:#endif
;1097:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $417
line 1098
;1098:				return;
ADDRGP4 $368
JUMPV
LABELV $417
line 1100
;1099:			}
;1100:		}
LABELV $415
line 1113
;1101:#ifdef MISSIONPACK
;1102:		if (mod == MOD_PROXIMITY_MINE) {
;1103:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1104:				return;
;1105:			}
;1106:			if (targ == attacker) {
;1107:				return;
;1108:			}
;1109:		}
;1110:#endif
;1111:
;1112:		// check for godmode
;1113:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $420
line 1114
;1114:			return;
ADDRGP4 $368
JUMPV
LABELV $420
line 1116
;1115:		}
;1116:	}
LABELV $413
line 1120
;1117:
;1118:	// battlesuit protects from all radius damage (but takes knockback)
;1119:	// and protects 50% against all damage
;1120:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $422
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $422
line 1121
;1121:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
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
line 1122
;1122:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $426
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $424
LABELV $426
line 1123
;1123:			return;
ADDRGP4 $368
JUMPV
LABELV $424
line 1125
;1124:		}
;1125:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1126
;1126:	}
LABELV $422
line 1129
;1127:
;1128:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1129:	if ( attacker->client && targ != attacker && targ->health > 0
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
EQU4 $427
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
EQU4 $427
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
LEI4 $427
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
EQI4 $427
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $427
line 1131
;1130:			&& targ->s.eType != ET_MISSILE
;1131:			&& targ->s.eType != ET_GENERAL) {
line 1132
;1132:		if ( OnSameTeam( targ, attacker ) ) {
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
EQI4 $429
line 1133
;1133:			attacker->client->ps.persistant[PERS_HITS]--;
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
line 1134
;1134:		} else {
ADDRGP4 $430
JUMPV
LABELV $429
line 1135
;1135:			attacker->client->ps.persistant[PERS_HITS]++;
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
line 1136
;1136:		}
LABELV $430
line 1137
;1137:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
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
line 1138
;1138:	}
LABELV $427
line 1142
;1139:
;1140:	// always give half damage if hurting self
;1141:	// calculated after knockback, so rocket jumping works
;1142:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $431
line 1143
;1143:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1144
;1144:	}
LABELV $431
line 1146
;1145:
;1146:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $433
line 1147
;1147:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1148
;1148:	}
LABELV $433
line 1149
;1149:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1150
;1150:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1153
;1151:
;1152:	// save some from armor
;1153:	asave = CheckArmor (targ, take, dflags);
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
line 1154
;1154:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1156
;1155:
;1156:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $435
line 1157
;1157:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $438
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
line 1159
;1158:			targ->health, take, asave );
;1159:	}
LABELV $435
line 1164
;1160:
;1161:	// add to the damage inflicted on a player this frame
;1162:	// the total will be turned into screen blends and view angle kicks
;1163:	// at the end of the frame
;1164:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $440
line 1165
;1165:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $442
line 1166
;1166:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1167
;1167:		} else {
ADDRGP4 $443
JUMPV
LABELV $442
line 1168
;1168:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1169
;1169:		}
LABELV $443
line 1170
;1170:		client->damage_armor += asave;
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
line 1171
;1171:		client->damage_blood += take;
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
line 1172
;1172:		client->damage_knockback += knockback;
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
line 1173
;1173:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $444
line 1174
;1174:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2564
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1175
;1175:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 0
ASGNI4
line 1176
;1176:		} else {
ADDRGP4 $445
JUMPV
LABELV $444
line 1177
;1177:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
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
line 1178
;1178:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2576
ADDP4
CNSTI4 1
ASGNI4
line 1179
;1179:		}
LABELV $445
line 1180
;1180:	}
LABELV $440
line 1186
;1181:
;1182:	// See if it's the player hurting the emeny flag carrier
;1183:#ifdef MISSIONPACK
;1184:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1185:#else	
;1186:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $446
line 1188
;1187:#endif
;1188:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1189
;1189:	}
LABELV $446
line 1191
;1190:
;1191:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $449
line 1193
;1192:		// set the last client who damaged the target
;1193:		targ->client->lasthurt_client = attacker->s.number;
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
line 1194
;1194:		targ->client->lasthurt_mod = mod;
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
line 1195
;1195:	}
LABELV $449
line 1198
;1196:
;1197:	// Shafe - Trep - Headshots
;1198:	if (targ->client && attacker->client && targ->health > 0)
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
EQU4 $451
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $451
ADDRLP4 72
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
LEI4 $451
line 1199
;1199:	{   
line 1201
;1200:		// let's say only railgun can do head shots
;1201:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $453
line 1202
;1202:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ASGNF4
line 1205
;1203:	
;1204:			// handling crouching
;1205:			if(targ->client->ps.pm_flags & PMF_DUCKED){
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
EQI4 $455
line 1206
;1206:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
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
line 1207
;1207:			}
ADDRGP4 $456
JUMPV
LABELV $455
line 1209
;1208:			else
;1209:				height = abs(targ->r.mins[2]) + targ_maxs2; 
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
LABELV $456
line 1214
;1210:				
;1211:			// project the z component of point 
;1212:			// onto the z component of the model's origin
;1213:			// this results in the z component from the origin at 0
;1214:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
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
line 1215
;1215:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1217
;1216:		
;1217:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $457
line 1218
;1218:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1219
;1219:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1220
;1220:			}
LABELV $457
line 1221
;1221:		}
LABELV $453
line 1222
;1222:	}
LABELV $451
line 1227
;1223:	// Shafe - Trep - End Headshot Code
;1224:
;1225:
;1226:	// do the damage
;1227:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $459
line 1228
;1228:		targ->health = targ->health - take;
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
line 1229
;1229:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $461
line 1230
;1230:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
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
line 1231
;1231:		}
LABELV $461
line 1233
;1232:			
;1233:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $463
line 1234
;1234:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $465
line 1235
;1235:				targ->flags |= FL_NO_KNOCKBACK;
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
LABELV $465
line 1237
;1236:
;1237:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $467
line 1238
;1238:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 -999
ASGNI4
LABELV $467
line 1240
;1239:
;1240:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1241
;1241:			targ->die (targ, inflictor, attacker, take, mod);
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
line 1242
;1242:			return;
ADDRGP4 $368
JUMPV
LABELV $463
line 1243
;1243:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $469
line 1244
;1244:			targ->pain (targ, attacker, take);
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
line 1245
;1245:		}
LABELV $469
line 1246
;1246:	}
LABELV $459
line 1248
;1247:
;1248:}
LABELV $368
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1259
;1249:
;1250:
;1251:/*
;1252:============
;1253:CanDamage
;1254:
;1255:Returns qtrue if the inflictor can directly damage the target.  Used for
;1256:explosions and melee attacks.
;1257:============
;1258:*/
;1259:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1266
;1260:	vec3_t	dest;
;1261:	trace_t	tr;
;1262:	vec3_t	midpoint;
;1263:
;1264:	// use the midpoint of the bounds instead of the origin, because
;1265:	// bmodels may have their origin is 0,0,0
;1266:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
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
line 1267
;1267:	VectorScale (midpoint, 0.5, midpoint);
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
line 1269
;1268:
;1269:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1270
;1270:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1271
;1271:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $482
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $478
LABELV $482
line 1272
;1272:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $471
JUMPV
LABELV $478
line 1276
;1273:
;1274:	// this should probably check in the plane of projection, 
;1275:	// rather than in world coordinate, and also include Z
;1276:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1277
;1277:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1278
;1278:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1279
;1279:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1280
;1280:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $484
line 1281
;1281:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $471
JUMPV
LABELV $484
line 1283
;1282:
;1283:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1284
;1284:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1285
;1285:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1286
;1286:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1287
;1287:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $488
line 1288
;1288:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $471
JUMPV
LABELV $488
line 1290
;1289:
;1290:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1291
;1291:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1292
;1292:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1293
;1293:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1294
;1294:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $492
line 1295
;1295:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $471
JUMPV
LABELV $492
line 1297
;1296:
;1297:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1298
;1298:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1299
;1299:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1300
;1300:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1301
;1301:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $496
line 1302
;1302:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $471
JUMPV
LABELV $496
line 1305
;1303:
;1304:
;1305:	return qfalse;
CNSTI4 0
RETI4
LABELV $471
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1315
;1306:}
;1307:
;1308:
;1309:/*
;1310:============
;1311:G_RadiusDamage
;1312:============
;1313:*/
;1314:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1315:					 gentity_t *ignore, int mod) {
line 1324
;1316:	float		points, dist;
;1317:	gentity_t	*ent;
;1318:	int			entityList[MAX_GENTITIES];
;1319:	int			numListedEntities;
;1320:	vec3_t		mins, maxs;
;1321:	vec3_t		v;
;1322:	vec3_t		dir;
;1323:	int			i, e;
;1324:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1326
;1325:
;1326:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $500
line 1327
;1327:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1328
;1328:	}
LABELV $500
line 1330
;1329:
;1330:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $502
line 1331
;1331:		mins[i] = origin[i] - radius;
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
line 1332
;1332:		maxs[i] = origin[i] + radius;
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
line 1333
;1333:	}
LABELV $503
line 1330
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $502
line 1335
;1334:
;1335:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
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
line 1337
;1336:
;1337:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $509
JUMPV
LABELV $506
line 1338
;1338:		ent = &g_entities[entityList[ e ]];
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
line 1340
;1339:
;1340:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $510
line 1341
;1341:			continue;
ADDRGP4 $507
JUMPV
LABELV $510
line 1342
;1342:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
NEI4 $512
line 1343
;1343:			continue;
ADDRGP4 $507
JUMPV
LABELV $512
line 1346
;1344:
;1345:		// find the distance from the edge of the bounding box
;1346:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $514
line 1347
;1347:			if ( origin[i] < ent->r.absmin[i] ) {
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
GEF4 $518
line 1348
;1348:				v[i] = ent->r.absmin[i] - origin[i];
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
line 1349
;1349:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $519
JUMPV
LABELV $518
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
LEF4 $520
line 1350
;1350:				v[i] = origin[i] - ent->r.absmax[i];
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
line 1351
;1351:			} else {
ADDRGP4 $521
JUMPV
LABELV $520
line 1352
;1352:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1353
;1353:			}
LABELV $521
LABELV $519
line 1354
;1354:		}
LABELV $515
line 1346
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $514
line 1356
;1355:
;1356:		dist = VectorLength( v );
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
line 1357
;1357:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $522
line 1358
;1358:			continue;
ADDRGP4 $507
JUMPV
LABELV $522
line 1361
;1359:		}
;1360:
;1361:		points = damage * ( 1.0 - dist / radius );
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
line 1363
;1362:
;1363:		if( CanDamage (ent, origin) ) {
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
EQI4 $524
line 1364
;1364:			if( LogAccuracyHit( ent, attacker ) ) {
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
EQI4 $526
line 1365
;1365:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1366
;1366:			}
LABELV $526
line 1367
;1367:			VectorSubtract (ent->r.currentOrigin, origin, dir);
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
line 1370
;1368:			// push the center of mass higher than the origin so players
;1369:			// get knocked into the air more
;1370:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1371
;1371:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
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
line 1372
;1372:		}
LABELV $524
line 1373
;1373:	}
LABELV $507
line 1337
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $509
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $506
line 1375
;1374:
;1375:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $499
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
LABELV $438
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
LABELV $319
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
LABELV $316
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
LABELV $313
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
LABELV $310
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
LABELV $307
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
LABELV $300
byte 1 115
byte 1 0
align 1
LABELV $299
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
LABELV $298
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
LABELV $277
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
LABELV $276
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
LABELV $238
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
LABELV $237
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
LABELV $230
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $229
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
LABELV $207
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
LABELV $206
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
LABELV $186
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
LABELV $185
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
LABELV $174
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
LABELV $173
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
LABELV $172
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
LABELV $171
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
LABELV $170
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
LABELV $169
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
LABELV $168
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
LABELV $167
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
LABELV $166
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
LABELV $165
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
LABELV $164
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
LABELV $163
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
LABELV $162
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $161
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
LABELV $160
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
LABELV $159
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
LABELV $158
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
LABELV $157
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
LABELV $156
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
LABELV $155
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
LABELV $154
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
LABELV $153
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
LABELV $152
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
LABELV $151
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
LABELV $150
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
