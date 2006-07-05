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
proc AddScore 8 12
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
;57:	if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $67
line 58
;58:		level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $67
line 59
;59:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 60
;60:}
LABELV $61
endproc AddScore 8 12
export TossClientItems
proc TossClientItems 36 12
line 69
;61:
;62:/*
;63:=================
;64:TossClientItems
;65:
;66:Toss the weapon and powerups for the killed player
;67:=================
;68:*/
;69:void TossClientItems( gentity_t *self ) {
line 77
;70:	gitem_t		*item;
;71:	int			weapon;
;72:	float		angle;
;73:	int			i;
;74:	gentity_t	*drop;
;75:
;76:	// drop the weapon if not a gauntlet or machinegun
;77:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 83
;78:
;79:	// make a special check to see if they are changing to a new
;80:	// weapon that isn't the mg or gauntlet.  Without this, a client
;81:	// can pick up a weapon, be killed, and not drop the weapon because
;82:	// their weapon change hasn't completed yet and they are still holding the MG.
;83:	if ( weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK ) {
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $74
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $72
LABELV $74
line 84
;84:		if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
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
line 85
;85:			weapon = self->client->pers.cmd.weapon;
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
line 86
;86:		}
LABELV $75
line 87
;87:		if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
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
line 88
;88:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 89
;89:		}
LABELV $77
line 90
;90:	}
LABELV $72
line 93
;91:
;92:	// Shafe - Trep - Dont drop weapons In Instagib
;93:	if (g_instagib.integer == 0)
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 0
NEI4 $79
line 94
;94:	{
line 95
;95:		if ( weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && 
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
line 96
;96:			self->client->ps.ammo[ weapon ] ) {
line 98
;97:			// find the item type for this weapon
;98:			item = BG_FindItemForWeapon( weapon );
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
line 101
;99:	
;100:			// spawn the item
;101:			Drop_Item( self, item, 0 );
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
line 102
;102:		}
LABELV $82
line 103
;103:	} // End Shafe - Trep instagib
LABELV $79
line 106
;104:
;105:	// drop all the powerups if not in teamplay
;106:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $84
line 107
;107:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 108
;108:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $87
line 109
;109:			if ( self->client->ps.powerups[ i ] > level.time ) {
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
line 110
;110:				item = BG_FindItemForPowerup( i );
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
line 111
;111:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $94
line 112
;112:					continue;
ADDRGP4 $88
JUMPV
LABELV $94
line 114
;113:				}
;114:				drop = Drop_Item( self, item, angle );
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
line 116
;115:				// decide how many seconds it has left
;116:				drop->count = ( self->client->ps.powerups[ i ] - level.time ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 760
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
line 117
;117:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $97
line 118
;118:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 119
;119:				}
LABELV $97
line 120
;120:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 121
;121:			}
LABELV $91
line 122
;122:		}
LABELV $88
line 108
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
line 123
;123:	}
LABELV $84
line 124
;124:}
LABELV $71
endproc TossClientItems 36 12
export LookAtKiller
proc LookAtKiller 52 4
line 214
;125:
;126:#ifdef MISSIONPACK
;127:
;128:/*
;129:=================
;130:TossClientCubes
;131:=================
;132:*/
;133:extern gentity_t	*neutralObelisk;
;134:
;135:void TossClientCubes( gentity_t *self ) {
;136:	gitem_t		*item;
;137:	gentity_t	*drop;
;138:	vec3_t		velocity;
;139:	vec3_t		angles;
;140:	vec3_t		origin;
;141:
;142:	self->client->ps.generic1 = 0;
;143:
;144:	// this should never happen but we should never
;145:	// get the server to crash due to skull being spawned in
;146:	if (!G_EntitiesFree()) {
;147:		return;
;148:	}
;149:
;150:	if( self->client->sess.sessionTeam == TEAM_RED ) {
;151:		item = BG_FindItem( "Red Cube" );
;152:	}
;153:	else {
;154:		item = BG_FindItem( "Blue Cube" );
;155:	}
;156:
;157:	angles[YAW] = (float)(level.time % 360);
;158:	angles[PITCH] = 0;	// always forward
;159:	angles[ROLL] = 0;
;160:
;161:	AngleVectors( angles, velocity, NULL, NULL );
;162:	VectorScale( velocity, 150, velocity );
;163:	velocity[2] += 200 + crandom() * 50;
;164:
;165:	if( neutralObelisk ) {
;166:		VectorCopy( neutralObelisk->s.pos.trBase, origin );
;167:		origin[2] += 44;
;168:	} else {
;169:		VectorClear( origin ) ;
;170:	}
;171:
;172:	drop = LaunchItem( item, origin, velocity );
;173:
;174:	drop->nextthink = level.time + g_cubeTimeout.integer * 1000;
;175:	drop->think = G_FreeEntity;
;176:	drop->spawnflags = self->client->sess.sessionTeam;
;177:}
;178:
;179:
;180:/*
;181:=================
;182:TossClientPersistantPowerups
;183:=================
;184:*/
;185:void TossClientPersistantPowerups( gentity_t *ent ) {
;186:	gentity_t	*powerup;
;187:
;188:	if( !ent->client ) {
;189:		return;
;190:	}
;191:
;192:	if( !ent->client->persistantPowerup ) {
;193:		return;
;194:	}
;195:
;196:	powerup = ent->client->persistantPowerup;
;197:
;198:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;199:	powerup->s.eFlags &= ~EF_NODRAW;
;200:	powerup->r.contents = CONTENTS_TRIGGER;
;201:	trap_LinkEntity( powerup );
;202:
;203:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;204:	ent->client->persistantPowerup = NULL;
;205:}
;206:#endif
;207:
;208:
;209:/*
;210:==================
;211:LookAtKiller
;212:==================
;213:*/
;214:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 218
;215:	vec3_t		dir;
;216:	vec3_t		angles;
;217:
;218:	if ( attacker && attacker != self ) {
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
line 219
;219:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
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
line 220
;220:	} else if ( inflictor && inflictor != self ) {
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
line 221
;221:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
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
line 222
;222:	} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 223
;223:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
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
line 224
;224:		return;
ADDRGP4 $99
JUMPV
LABELV $105
LABELV $101
line 227
;225:	}
;226:
;227:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
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
line 229
;228:
;229:	angles[YAW] = vectoyaw ( dir );
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
line 230
;230:	angles[PITCH] = 0; 
ADDRLP4 12
CNSTF4 0
ASGNF4
line 231
;231:	angles[ROLL] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 232
;232:}
LABELV $99
endproc LookAtKiller 52 4
export GibEntity
proc GibEntity 12 12
line 239
;233:
;234:/*
;235:==================
;236:GibEntity
;237:==================
;238:*/
;239:void GibEntity( gentity_t *self, int killer ) {
line 244
;240:	gentity_t *ent;
;241:	int i;
;242:
;243:	//if this entity still has kamikaze
;244:	if (self->s.eFlags & EF_KAMIKAZE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $111
line 246
;245:		// check if there is a kamikaze timer around for this owner
;246:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $113
line 247
;247:			ent = &g_entities[i];
ADDRLP4 0
CNSTI4 824
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 248
;248:			if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $117
line 249
;249:				continue;
ADDRGP4 $114
JUMPV
LABELV $117
line 250
;250:			if (ent->activator != self)
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $119
line 251
;251:				continue;
ADDRGP4 $114
JUMPV
LABELV $119
line 252
;252:			if (strcmp(ent->classname, "kamikaze timer"))
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
line 253
;253:				continue;
ADDRGP4 $114
JUMPV
LABELV $121
line 254
;254:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 255
;255:			break;
ADDRGP4 $115
JUMPV
LABELV $114
line 246
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
line 257
;256:		}
;257:	}
LABELV $111
line 258
;258:	G_AddEvent( self, EV_GIB_PLAYER, killer );
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
line 259
;259:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 260
;260:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 261
;261:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 262
;262:}
LABELV $110
endproc GibEntity 12 12
export GibEntity_Headshot
proc GibEntity_Headshot 0 12
line 266
;263:
;264:
;265:// Shafe - Trep - Headshot Function
;266:void GibEntity_Headshot( gentity_t *self, int killer ) {
line 267
;267:	G_AddEvent( self, EV_GIB_PLAYER_HEADSHOT, 0 );
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
line 268
;268:	self->client->noHead = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
CNSTI4 1
ASGNI4
line 269
;269:}
LABELV $124
endproc GibEntity_Headshot 0 12
export body_die
proc body_die 0 8
line 277
;270:// Shafe - Trep - End Headshot Function
;271:
;272:/*
;273:==================
;274:body_die
;275:==================
;276:*/
;277:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 278
;278:	if ( self->health > GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $126
line 279
;279:		return;
ADDRGP4 $125
JUMPV
LABELV $126
line 281
;280:	}
;281:	if ( !g_blood.integer ) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $128
line 282
;282:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 283
;283:		return;
ADDRGP4 $125
JUMPV
LABELV $128
line 286
;284:	}
;285:
;286:	GibEntity( self, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 287
;287:}
LABELV $125
endproc body_die 0 8
export IsOutOfWeapons
proc IsOutOfWeapons 0 0
line 290
;288:
;289:// Shafe - Trep - Arsenal Mod
;290:extern qboolean IsOutOfWeapons( gentity_t *ent ) {
line 292
;291:
;292:	if (ent->client->pers.h_gauntlet) { return qfalse; }
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
line 293
;293:	if (ent->client->pers.h_mg) { return qfalse; }
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
line 294
;294:	if (ent->client->pers.h_sg) { return qfalse; }
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
line 295
;295:	if (ent->client->pers.h_grenade) { return qfalse; }
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
line 296
;296:	if (ent->client->pers.h_singcan) { return qfalse; }
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
line 297
;297:	if (ent->client->pers.h_flame) { return qfalse; }
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
line 298
;298:	if (ent->client->pers.h_gauss) { return qfalse; }
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
line 299
;299:	if (ent->client->pers.h_plasma) { return qfalse; }
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
line 300
;300:	if (ent->client->pers.h_bfg) { return qfalse; }
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
line 301
;301:	return qtrue;
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
line 375
;302:}
;303:
;304:
;305:// these are just for logging, the client prints its own messages
;306:char	*modNames[] = {
;307:	"MOD_UNKNOWN",
;308:	"MOD_SHOTGUN",
;309:	"MOD_GAUNTLET",
;310:	"MOD_MACHINEGUN",
;311:	"MOD_GRENADE",
;312:	"MOD_GRENADE_SPLASH",
;313:	"MOD_ROCKET",
;314:	"MOD_ROCKET_SPLASH",
;315:	"MOD_PLASMA",
;316:	"MOD_PLASMA_SPLASH",
;317:	"MOD_RAILGUN",
;318:	"MOD_LIGHTNING",
;319:	"MOD_BFG",
;320:	"MOD_BFG_SPLASH",
;321:	"MOD_WATER",
;322:	"MOD_SLIME",
;323:	"MOD_LAVA",
;324:	"MOD_CRUSH",
;325:	"MOD_TELEFRAG",
;326:	"MOD_FALLING",
;327:	"MOD_SUICIDE",
;328:	"MOD_TARGET_LASER",
;329:	"MOD_TRIGGER_HURT",
;330:	"MOD_HEADSHOT",		// Shafe - Trep - Headshot
;331:#ifdef MISSIONPACK
;332:	"MOD_NAIL",
;333:	"MOD_CHAINGUN",
;334:	"MOD_PROXIMITY_MINE",
;335:#endif
;336:	"MOD_GRAPPLE"
;337:};
;338:
;339:#ifdef MISSIONPACK
;340:/*
;341:==================
;342:Kamikaze_DeathActivate
;343:==================
;344:*/
;345:void Kamikaze_DeathActivate( gentity_t *ent ) {
;346:	G_StartKamikaze(ent);
;347:	G_FreeEntity(ent);
;348:}
;349:
;350:/*
;351:==================
;352:Kamikaze_DeathTimer
;353:==================
;354:*/
;355:void Kamikaze_DeathTimer( gentity_t *self ) {
;356:	gentity_t *ent;
;357:
;358:	ent = G_Spawn();
;359:	ent->classname = "kamikaze timer";
;360:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;361:	ent->r.svFlags |= SVF_NOCLIENT;
;362:	ent->think = Kamikaze_DeathActivate;
;363:	ent->nextthink = level.time + 5 * 1000;
;364:
;365:	ent->activator = self;
;366:}
;367:
;368:#endif
;369:
;370:/*
;371:==================
;372:CheckAlmostCapture
;373:==================
;374:*/
;375:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 381
;376:	gentity_t	*ent;
;377:	vec3_t		dir;
;378:	char		*classname;
;379:
;380:	// if this player was carrying a flag
;381:	if ( self->client->ps.powerups[PW_REDFLAG] ||
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
line 383
;382:		self->client->ps.powerups[PW_BLUEFLAG] ||
;383:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
line 385
;384:		// get the goal flag this player should have been going for
;385:		if ( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $180
line 386
;386:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 2
NEI4 $183
line 387
;387:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $185
ASGNP4
line 388
;388:			}
ADDRGP4 $181
JUMPV
LABELV $183
line 389
;389:			else {
line 390
;390:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $186
ASGNP4
line 391
;391:			}
line 392
;392:		}
ADDRGP4 $181
JUMPV
LABELV $180
line 393
;393:		else {
line 394
;394:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 2
NEI4 $187
line 395
;395:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $186
ASGNP4
line 396
;396:			}
ADDRGP4 $188
JUMPV
LABELV $187
line 397
;397:			else {
line 398
;398:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $185
ASGNP4
line 399
;399:			}
LABELV $188
line 400
;400:		}
LABELV $181
line 401
;401:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $189
line 403
;402:		do
;403:		{
line 404
;404:			ent = G_Find(ent, FOFS(classname), classname);
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
line 405
;405:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
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
line 407
;406:		// if we found the destination flag and it's not picked up
;407:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
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
line 409
;408:			// if the player was *very* close
;409:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 410
;410:			if ( VectorLength(dir) < 200 ) {
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
line 411
;411:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 412
;412:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $199
line 413
;413:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 414
;414:				}
LABELV $199
line 415
;415:			}
LABELV $197
line 416
;416:		}
LABELV $193
line 417
;417:	}
LABELV $176
line 418
;418:}
LABELV $175
endproc CheckAlmostCapture 56 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 425
;419:
;420:/*
;421:==================
;422:CheckAlmostScored
;423:==================
;424:*/
;425:void CheckAlmostScored( gentity_t *self, gentity_t *attacker ) {
line 431
;426:	gentity_t	*ent;
;427:	vec3_t		dir;
;428:	char		*classname;
;429:
;430:	// if the player was carrying cubes
;431:	if ( self->client->ps.generic1 ) {
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
line 432
;432:		if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 2
NEI4 $204
line 433
;433:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $206
ASGNP4
line 434
;434:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 435
;435:		else {
line 436
;436:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $207
ASGNP4
line 437
;437:		}
LABELV $205
line 438
;438:		ent = G_Find(NULL, FOFS(classname), classname);
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
line 440
;439:		// if we found the destination obelisk
;440:		if ( ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
line 442
;441:			// if the player was *very* close
;442:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
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
line 443
;443:			if ( VectorLength(dir) < 200 ) {
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
line 444
;444:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 445
;445:				if ( attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 446
;446:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
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
line 447
;447:				}
LABELV $214
line 448
;448:			}
LABELV $212
line 449
;449:		}
LABELV $208
line 450
;450:	}
LABELV $202
line 451
;451:}
LABELV $201
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $217
skip 4
align 4
LABELV $348
skip 4
export player_die
code
proc player_die 116 28
line 461
;452:
;453:
;454:
;455:/*
;456:==================
;457:player_die
;458:==================
;459:*/
;460:extern int CountSurvivors();
;461:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 477
;462:	gentity_t	*ent;
;463:	int			anim;
;464:	int			contents;
;465:	int			killer;
;466:	int			i;
;467:	char		*killerName, *obit;
;468:	// Shafe - Trep - For Arsenal
;469:	int			tmpW;
;470:	int			tmpCnt;
;471:	static		int deathNum;
;472:	gentity_t	*xte;
;473:
;474:
;475:	// Shafe - Trep is it first strike?  
;476:	// In arsenal you can join until the first kill has been made
;477:	if ( level.warmupTime ) 
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $218
line 478
;478:	{
line 479
;479:		level.firstStrike = qfalse;
ADDRGP4 level+9228
CNSTI4 0
ASGNI4
line 480
;480:		level.OneSurvivor = qfalse;
ADDRGP4 level+9232
CNSTI4 0
ASGNI4
line 481
;481:		level.lastClient = -1;
ADDRGP4 level+9236
CNSTI4 -1
ASGNI4
line 483
;482:
;483:	} 
ADDRGP4 $219
JUMPV
LABELV $218
line 485
;484:	else
;485:	{
line 486
;486:		if (level.firstStrike == qfalse)
ADDRGP4 level+9228
INDIRI4
CNSTI4 0
NEI4 $224
line 487
;487:		{
line 488
;488:		level.firstStrike = qtrue;
ADDRGP4 level+9228
CNSTI4 1
ASGNI4
line 489
;489:		BroadCastSound("sound/misc/laff02.wav");
ADDRGP4 $228
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 490
;490:		trap_SendServerCommand( -1, va("print \"%s Made First Strike!\n\"",attacker->client->pers.netname));
ADDRGP4 $229
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 491
;491:		}
LABELV $224
line 492
;492:	}
LABELV $219
line 495
;493:
;494:
;495:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $230
line 496
;496:		return;
ADDRGP4 $216
JUMPV
LABELV $230
line 499
;497:	}
;498:
;499:	if ( level.intermissiontime ) {
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $232
line 500
;500:		return;
ADDRGP4 $216
JUMPV
LABELV $232
line 506
;501:	}
;502:
;503:
;504://unlagged - backward reconciliation #2
;505:	// make sure the body shows up in the client's current position
;506:	G_UnTimeShiftClient( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 510
;507://unlagged - backward reconciliation #2
;508:
;509:	// check for an almost capture
;510:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 512
;511:	// check for a player that almost brought in cubes
;512:	CheckAlmostScored( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 514
;513:
;514:	if (self->client && self->client->hook)
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $235
ADDRLP4 40
INDIRP4
CNSTI4 2628
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $235
line 515
;515:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2628
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
LABELV $235
line 523
;516:#ifdef MISSIONPACK
;517:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;518:		self->client->ps.eFlags &= ~EF_TICKING;
;519:		self->activator->think = G_FreeEntity;
;520:		self->activator->nextthink = level.time;
;521:	}
;522:#endif
;523:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 526
;524:
;525:	// Shafe - Trep - Clear out the PDG
;526:	self->istelepoint = 0;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 0
ASGNI4
line 527
;527:	VectorClear( self->teleloc ); 
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 808
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 48
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 529
;528:
;529:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $237
line 530
;530:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 531
;531:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
line 532
;532:			killerName = attacker->client->pers.netname;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
line 533
;533:		} else {
ADDRGP4 $238
JUMPV
LABELV $239
line 534
;534:			killerName = "<non-client>";
ADDRLP4 20
ADDRGP4 $241
ASGNP4
line 535
;535:		}
line 536
;536:	} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 537
;537:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 538
;538:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $242
ASGNP4
line 539
;539:	}
LABELV $238
line 541
;540:
;541:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $245
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $243
LABELV $245
line 542
;542:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 543
;543:		killerName = "<world>";
ADDRLP4 20
ADDRGP4 $242
ASGNP4
line 544
;544:	}
LABELV $243
line 546
;545:
;546:	if ( meansOfDeath < 0 || meansOfDeath >= sizeof( modNames ) / sizeof( modNames[0] ) ) {
ADDRLP4 60
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
LTI4 $248
ADDRLP4 60
INDIRI4
CVIU4 4
CNSTU4 25
LTU4 $246
LABELV $248
line 547
;547:		obit = "<bad obituary>";
ADDRLP4 24
ADDRGP4 $249
ASGNP4
line 548
;548:	} else {
ADDRGP4 $247
JUMPV
LABELV $246
line 549
;549:		obit = modNames[ meansOfDeath ];
ADDRLP4 24
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 550
;550:	}
LABELV $247
line 552
;551:
;552:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", 
ADDRGP4 $250
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 64
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
line 557
;553:		killer, self->s.number, meansOfDeath, killerName, 
;554:		self->client->pers.netname, obit );
;555:
;556:	// broadcast the death event to everyone
;557:	ent = G_TempEntity( self->r.currentOrigin, EV_OBITUARY );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 61
ARGI4
ADDRLP4 68
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 68
INDIRP4
ASGNP4
line 558
;558:	ent->s.eventParm = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 559
;559:	ent->s.otherEntityNum = self->s.number;
ADDRLP4 8
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 560
;560:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 561
;561:	ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 32
ASGNI4
line 563
;562:
;563:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 565
;564:
;565:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
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
line 567
;566:
;567:	if (attacker && attacker->client) {
ADDRLP4 76
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 76
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $251
ADDRLP4 76
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $251
line 568
;568:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 570
;569:
;570:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 84
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 88
INDIRP4
CVPU4 4
EQU4 $255
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $253
LABELV $255
line 571
;571:			AddScore( attacker, self->r.currentOrigin, -1 );
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
line 572
;572:		} else {
ADDRGP4 $252
JUMPV
LABELV $253
line 573
;573:			AddScore( attacker, self->r.currentOrigin, 1 );
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
line 575
;574:
;575:			if( meansOfDeath == MOD_GAUNTLET ) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $256
line 578
;576:				
;577:				// play humiliation on player
;578:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 581
;579:
;580:				// add the sprite over the player's head
;581:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
CNSTI4 -231497
BANDI4
ASGNI4
line 582
;582:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 583
;583:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2612
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
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 587
;587:			}
LABELV $256
line 591
;588:
;589:			// check for two kills in a short amount of time
;590:			// if this is close enough to the last kill, give a reward sound
;591:			if ( level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $259
line 593
;592:				// play excellent on player
;593:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 596
;594:
;595:				// add the sprite over the player's head
;596:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
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
CNSTI4 -231497
BANDI4
ASGNI4
line 597
;597:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 598
;598:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2612
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 599
;599:			}
LABELV $259
line 600
;600:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2620
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 602
;601:
;602:		}
line 603
;603:	} else {
ADDRGP4 $252
JUMPV
LABELV $251
line 604
;604:		AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 605
;605:	}
LABELV $252
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
NEI4 $264
line 612
;612:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $266
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
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:		}
ADDRGP4 $267
JUMPV
LABELV $266
line 616
;616:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $268
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
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 619
;619:		}
ADDRGP4 $269
JUMPV
LABELV $268
line 620
;620:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
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
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 623
;623:		}
LABELV $270
LABELV $269
LABELV $267
line 624
;624:	}
LABELV $264
line 627
;625:
;626:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;627:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 84
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 84
INDIRI4
ASGNI4
line 628
;628:	if ( !( contents & CONTENTS_NODROP )) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $272
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
ADDRGP4 $273
JUMPV
LABELV $272
line 631
;631:	else {
line 632
;632:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $274
line 633
;633:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 634
;634:		}
ADDRGP4 $275
JUMPV
LABELV $274
line 635
;635:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $276
line 636
;636:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 637
;637:		}
ADDRGP4 $277
JUMPV
LABELV $276
line 638
;638:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $278
line 639
;639:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 640
;640:		}
LABELV $278
LABELV $277
LABELV $275
line 641
;641:	}
LABELV $273
line 650
;642:#ifdef MISSIONPACK
;643:	TossClientPersistantPowerups( self );
;644:	if( g_gametype.integer == GT_HARVESTER ) {
;645:		TossClientCubes( self );
;646:	}
;647:#endif
;648:
;649:			// Shafe - Trep - Arsenal Stuff
;650:		if ( g_Arsenal.integer != 0 && meansOfDeath != MOD_TELEFRAG && level.firstStrike == qtrue) 
ADDRGP4 g_Arsenal+12
INDIRI4
CNSTI4 0
EQI4 $280
ADDRFP4 16
INDIRI4
CNSTI4 18
EQI4 $280
ADDRGP4 level+9228
INDIRI4
CNSTI4 1
NEI4 $280
line 651
;651:		{
line 652
;652:			tmpW = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 656
;653:			
;654:			//G_Printf( S_COLOR_GREEN "DEBUG: Weapon You Held by %s was %i\n", self->client->pers.netname, tmpW );
;655:			
;656:			if (tmpW == 9) { self->client->pers.h_bfg = qfalse;  }
ADDRLP4 12
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
;657:			if (tmpW == 8) { self->client->pers.h_plasma = qfalse;}
ADDRLP4 12
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
;658:			if (tmpW == 7) { self->client->pers.h_gauss = qfalse; }
ADDRLP4 12
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
;659:			if (tmpW == 6) { self->client->pers.h_flame = qfalse; }
ADDRLP4 12
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
;660:			if (tmpW == 5) { self->client->pers.h_singcan = qfalse; }
ADDRLP4 12
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
;661:			if (tmpW == 4) { self->client->pers.h_grenade = qfalse; }
ADDRLP4 12
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
;662:			if (tmpW == 3) { self->client->pers.h_sg = qfalse; }
ADDRLP4 12
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
;663:			if (tmpW == 2) { self->client->pers.h_mg = qfalse; }
ADDRLP4 12
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
;664:			if (tmpW == 1) { self->client->pers.h_gauntlet = qfalse; }
ADDRLP4 12
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
;666:			if (IsOutOfWeapons(self)) 
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
line 667
;667:			{
line 668
;668:				trap_SendServerCommand( -1, va("print \"%s's Arsenal Is Empty!\n\"",self->client->pers.netname));
ADDRGP4 $304
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
line 669
;669:				trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE "'s Arsenal is Empty.\n\"", self->client->pers.netname) );
ADDRGP4 $305
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
line 673
;670:				
;671:
;672:				// Send them to Spec
;673:				self->client->pers.Eliminated = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2484
ADDP4
CNSTI4 1
ASGNI4
line 674
;674:				SetTeam(self, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $306
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 677
;675:
;676:
;677:				tmpCnt = (CountSurvivors());
ADDRLP4 100
ADDRGP4 CountSurvivors
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 100
INDIRI4
ASGNI4
line 680
;678:
;679:						
;680:				if (tmpCnt != level.levelSurvivors)
ADDRLP4 28
INDIRI4
ADDRGP4 level+9220
INDIRI4
EQI4 $307
line 681
;681:				{
line 683
;682:
;683:					level.levelSurvivors = tmpCnt;
ADDRGP4 level+9220
ADDRLP4 28
INDIRI4
ASGNI4
line 686
;684:			
;685:			
;686:					if (tmpCnt == 5) 
ADDRLP4 28
INDIRI4
CNSTI4 5
NEI4 $311
line 687
;687:					{
line 688
;688:						BroadCastSound("sound/misc/5.wav");
ADDRGP4 $313
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 689
;689:					}
LABELV $311
line 691
;690:					
;691:					if (tmpCnt == 4) 
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $314
line 692
;692:					{
line 693
;693:						BroadCastSound("sound/misc/4.wav");
ADDRGP4 $316
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 694
;694:					}
LABELV $314
line 696
;695:
;696:					if (tmpCnt == 3) 
ADDRLP4 28
INDIRI4
CNSTI4 3
NEI4 $317
line 697
;697:					{
line 698
;698:						BroadCastSound("sound/misc/3.wav");
ADDRGP4 $319
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 699
;699:					}
LABELV $317
line 701
;700:
;701:					if (tmpCnt == 2) 
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $320
line 702
;702:					{
line 704
;703:						
;704:						BroadCastSound("sound/misc/2.wav");
ADDRGP4 $322
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 705
;705:					}
LABELV $320
line 707
;706:
;707:					if (tmpCnt == 1) 
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $323
line 708
;708:					{
line 709
;709:						BroadCastSound("sound/misc/laff01.wav");
ADDRGP4 $325
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 777
;710:						// Win The Game
;711:						/*
;712:						trap_SendServerCommand( -1, "print \"::: ^9WINNER BONUSES :::\n\"");	
;713:						trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Is The Survivor!\n\"", attacker->client->pers.netname) );
;714:						attacker->client->ps.persistant[PERS_SCORE]+=20;
;715:						trap_SendServerCommand( -1, "print \"^9Survivor Bonus: ^3+20\n\"");	
;716:						
;717:						if (attacker->client->pers.h_bfg) 
;718:						{ 
;719:							attacker->client->ps.persistant[PERS_SCORE]+=1; 
;720:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: BFG: ^3+1\n\"");	
;721:						}
;722:						
;723:						if (attacker->client->pers.h_plasma) 
;724:						{ 
;725:							attacker->client->ps.persistant[PERS_SCORE]+=2; 
;726:							trap_SendServerCommand( -1, "print \"^Arsenal Contents: Particle Distruptor: ^3+2\n\"");	
;727:						}
;728:						
;729:						if (attacker->client->pers.h_gauss) 
;730:						{ 
;731:							attacker->client->ps.persistant[PERS_SCORE]+=3; 
;732:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: M42 Gauss Rifle: ^3+3\n\"");	
;733:						}
;734:						
;735:						if (attacker->client->pers.h_flame) 
;736:						{ 
;737:							attacker->client->ps.persistant[PERS_SCORE]+=4; 
;738:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Flame Thrower: ^3+4\n\"");	
;739:						}
;740:						if (attacker->client->pers.h_singcan) 
;741:						{ 
;742:							attacker->client->ps.persistant[PERS_SCORE]+=8; 
;743:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Singularity Cannon: ^3+8\n\"");	
;744:						}
;745:						
;746:						if (attacker->client->pers.h_gauntlet) 
;747:						{ 
;748:							attacker->client->ps.persistant[PERS_SCORE]+=10; 
;749:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Gauntlet: ^3+10\n\"");	
;750:						}
;751:
;752:						if (attacker->client->pers.h_grenade) 
;753:						{ 
;754:							attacker->client->ps.persistant[PERS_SCORE]+=9; 
;755:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Grenade Launcher: ^3+9\n\"");	
;756:						}
;757:
;758:						if (attacker->client->pers.h_sg) 
;759:						{ 
;760:							attacker->client->ps.persistant[PERS_SCORE]+=5; 
;761:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Shotgun: ^3+5\n\"");	
;762:						}
;763:
;764:						if (attacker->client->pers.h_mg) 
;765:						{ 
;766:							attacker->client->ps.persistant[PERS_SCORE]+=6; 
;767:							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Assault Rifle: ^3+6\n\"");	
;768:						}
;769:				
;770:						
;771:						
;772:						LogExit( "Fraglimit hit." );
;773:						BroadCastSound("sound/misc/laff01.wav");
;774:						*/
;775:
;776:						////////////////
;777:					}			
LABELV $323
line 778
;778:				}
LABELV $307
line 779
;779:			} 
LABELV $302
line 781
;780:
;781:		}
LABELV $280
line 784
;782:		// End Arsenal Stuff
;783:
;784:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 787
;785:	// send updated scores to any clients that are following this one,
;786:	// or they would get stale scoreboards
;787:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $326
line 790
;788:		gclient_t	*client;
;789:
;790:		client = &level.clients[i];
ADDRLP4 88
CNSTI4 3388
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 791
;791:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 88
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $331
line 792
;792:			continue;
ADDRGP4 $327
JUMPV
LABELV $331
line 794
;793:		}
;794:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 88
INDIRP4
CNSTI4 2488
ADDP4
INDIRI4
CNSTI4 3
EQI4 $333
line 795
;795:			continue;
ADDRGP4 $327
JUMPV
LABELV $333
line 797
;796:		}
;797:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 88
INDIRP4
CNSTI4 2500
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $335
line 798
;798:			Cmd_Score_f( g_entities + i );
CNSTI4 824
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 799
;799:		}
LABELV $335
line 800
;800:	}
LABELV $327
line 787
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $329
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $326
line 802
;801:
;802:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 804
;803:
;804:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 805
;805:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 806
;806:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 808
;807:
;808:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 809
;809:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 810
;810:	LookAtKiller (self, inflictor, attacker);
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
line 812
;811:
;812:	VectorCopy( self->s.angles, self->client->ps.viewangles );
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
line 814
;813:
;814:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 816
;815:
;816:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3238002688
ASGNF4
line 820
;817:
;818:	// don't allow respawn until the death anim is done
;819:	// g_forcerespawn may force spawning at some later time
;820:	self->client->respawnTime = level.time + 1700;  // This is the real line
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2600
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 827
;821:	
;822:
;823:	
;824:	
;825:
;826:	// remove powerups
;827:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
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
line 829
;828:
;829:	if (meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $338
line 830
;830:	{
line 831
;831:			BroadCastSound("sound/misc/headshot.wav");
ADDRGP4 $340
ARGP4
ADDRGP4 BroadCastSound
CALLV
pop
line 832
;832:	}
LABELV $338
line 837
;833:
;834:
;835:
;836:	// never gib in a nodrop
;837:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer && meansOfDeath != MOD_HEADSHOT) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $347
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $347
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
EQI4 $347
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $344
LABELV $347
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $341
LABELV $344
line 839
;838:		// gib death
;839:		GibEntity( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 840
;840:	} else {
ADDRGP4 $342
JUMPV
LABELV $341
line 844
;841:		// normal death
;842:		static int i;
;843:
;844:		switch ( i ) {
ADDRLP4 92
ADDRGP4 $348
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $351
ADDRLP4 92
INDIRI4
CNSTI4 1
EQI4 $352
ADDRLP4 92
INDIRI4
CNSTI4 2
EQI4 $353
ADDRGP4 $349
JUMPV
LABELV $351
line 846
;845:		case 0:
;846:			anim = BOTH_DEATH1;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 847
;847:			break;
ADDRGP4 $350
JUMPV
LABELV $352
line 849
;848:		case 1:
;849:			anim = BOTH_DEATH2;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 850
;850:			break;
ADDRGP4 $350
JUMPV
LABELV $353
LABELV $349
line 853
;851:		case 2:
;852:		default:
;853:			anim = BOTH_DEATH3;
ADDRLP4 32
CNSTI4 4
ASGNI4
line 854
;854:			break;
LABELV $350
line 859
;855:		}
;856:
;857:		// for the no-blood option, we need to prevent the health
;858:		// from going to gib level
;859:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $354
line 860
;860:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 861
;861:		}
LABELV $354
line 863
;862:
;863:		self->client->ps.legsAnim = 
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
line 865
;864:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;865:		self->client->ps.torsoAnim = 
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
line 868
;866:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;867:
;868:		G_AddEvent( self, EV_DEATH1 + i, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $348
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
line 871
;869:
;870:		// Shafe - Trep Headshot //////////////////////////////////////////
;871:		if(meansOfDeath == MOD_HEADSHOT)
ADDRFP4 16
INDIRI4
CNSTI4 23
NEI4 $356
line 872
;872:			GibEntity_Headshot( self, killer );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity_Headshot
CALLV
pop
ADDRGP4 $357
JUMPV
LABELV $356
line 874
;873:		else
;874:			self->client->noHead = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2644
ADDP4
CNSTI4 0
ASGNI4
LABELV $357
line 878
;875:		// Shafe - Trep - End Headshot /////////////////////////////
;876:
;877:		// the body can still be gibbed
;878:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 881
;879:
;880:		// globally cycle through the different death animations
;881:		i = ( i + 1 ) % 3;
ADDRLP4 112
ADDRGP4 $348
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
line 890
;882:
;883:
;884:
;885:#ifdef MISSIONPACK
;886:		if (self->s.eFlags & EF_KAMIKAZE) {
;887:			Kamikaze_DeathTimer( self );
;888:		}
;889:#endif
;890:	}
LABELV $342
line 893
;891:
;892:	
;893:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 895
;894:
;895:}
LABELV $216
endproc player_die 116 28
export CheckArmor
proc CheckArmor 20 4
line 904
;896:
;897:
;898:/*
;899:================
;900:CheckArmor
;901:================
;902:*/
;903:int CheckArmor (gentity_t *ent, int damage, int dflags)
;904:{
line 909
;905:	gclient_t	*client;
;906:	int			save;
;907:	int			count;
;908:
;909:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $359
line 910
;910:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $358
JUMPV
LABELV $359
line 912
;911:
;912:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 914
;913:
;914:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 915
;915:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $358
JUMPV
LABELV $361
line 917
;916:
;917:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $363
line 918
;918:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $358
JUMPV
LABELV $363
line 921
;919:
;920:	// armor
;921:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 922
;922:	save = ceil( damage * ARMOR_PROTECTION );
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
line 923
;923:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $365
line 924
;924:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $365
line 926
;925:
;926:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $367
line 927
;927:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $358
JUMPV
LABELV $367
line 929
;928:
;929:	client->ps.stats[STAT_ARMOR] -= save;
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
line 931
;930:
;931:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $358
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 939
;932:}
;933:
;934:/*
;935:================
;936:RaySphereIntersections
;937:================
;938:*/
;939:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 948
;940:	float b, c, d, t;
;941:
;942:	//	| origin - (point + t * dir) | = radius
;943:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;944:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;945:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;946:
;947:	// normalize dir so a = 1
;948:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 949
;949:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
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
line 950
;950:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
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
line 955
;951:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;952:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;953:		radius * radius;
;954:
;955:	d = b * b - 4 * c;
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
line 956
;956:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $370
line 957
;957:		t = (- b + sqrt(d)) / 2;
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
line 958
;958:		VectorMA(point, t, dir, intersections[0]);
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
line 959
;959:		t = (- b - sqrt(d)) / 2;
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
line 960
;960:		VectorMA(point, t, dir, intersections[1]);
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
line 961
;961:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $369
JUMPV
LABELV $370
line 963
;962:	}
;963:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $372
line 964
;964:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 965
;965:		VectorMA(point, t, dir, intersections[0]);
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
line 966
;966:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $369
JUMPV
LABELV $372
line 968
;967:	}
;968:	return 0;
CNSTI4 0
RETI4
LABELV $369
endproc RaySphereIntersections 96 4
export G_Damage
proc G_Damage 96 24
line 1035
;969:}
;970:
;971:#ifdef MISSIONPACK
;972:/*
;973:================
;974:G_InvulnerabilityEffect
;975:================
;976:*/
;977:int G_InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
;978:	gentity_t	*impact;
;979:	vec3_t		intersections[2], vec;
;980:	int			n;
;981:
;982:	if ( !targ->client ) {
;983:		return qfalse;
;984:	}
;985:	VectorCopy(dir, vec);
;986:	VectorInverse(vec);
;987:	// sphere model radius = 42 units
;988:	n = RaySphereIntersections( targ->client->ps.origin, 42, point, vec, intersections);
;989:	if (n > 0) {
;990:		impact = G_TempEntity( targ->client->ps.origin, EV_INVUL_IMPACT );
;991:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;992:		vectoangles(vec, impact->s.angles);
;993:		impact->s.angles[0] += 90;
;994:		if (impact->s.angles[0] > 360)
;995:			impact->s.angles[0] -= 360;
;996:		if ( impactpoint ) {
;997:			VectorCopy( intersections[0], impactpoint );
;998:		}
;999:		if ( bouncedir ) {
;1000:			VectorCopy( vec, bouncedir );
;1001:			VectorNormalize( bouncedir );
;1002:		}
;1003:		return qtrue;
;1004:	}
;1005:	else {
;1006:		return qfalse;
;1007:	}
;1008:}
;1009:#endif
;1010:/*
;1011:============
;1012:T_Damage
;1013:
;1014:targ		entity that is being damaged
;1015:inflictor	entity that is causing the damage
;1016:attacker	entity that caused the inflictor to damage targ
;1017:	example: targ=monster, inflictor=rocket, attacker=player
;1018:
;1019:dir			direction of the attack for knockback
;1020:point		point at which the damage is being inflicted, used for headshots
;1021:damage		amount of damage being inflicted
;1022:knockback	force to be applied against targ as a result of the damage
;1023:
;1024:inflictor, attacker, dir, and point can be NULL for environmental effects
;1025:
;1026:dflags		these flags are used to control how T_Damage works
;1027:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;1028:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;1029:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;1030:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;1031:============
;1032:*/
;1033:
;1034:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;1035:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 1053
;1036:	gclient_t	*client;
;1037:	int			take;
;1038:	int			save;
;1039:	int			asave;
;1040:	int			knockback;
;1041:	int			max;
;1042:	// Shafe - Trep - Headshot
;1043:	float		z_ratio;
;1044:	float		z_rel;
;1045:	int			height;
;1046:	float		targ_maxs2;
;1047:	// Shafe - Trep - End Headshot
;1048:
;1049:#ifdef MISSIONPACK
;1050:	vec3_t		bouncedir, impactpoint;
;1051:#endif
;1052:
;1053:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $375
line 1054
;1054:		return;
ADDRGP4 $374
JUMPV
LABELV $375
line 1059
;1055:	}
;1056:
;1057:	// the intermission has allready been qualified for, so don't
;1058:	// allow any extra scoring
;1059:	if ( level.intermissionQueued ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $377
line 1060
;1060:		return;
ADDRGP4 $374
JUMPV
LABELV $377
line 1072
;1061:	}
;1062:#ifdef MISSIONPACK
;1063:	if ( targ->client && mod != MOD_JUICED) {
;1064:		if ( targ->client->invulnerabilityTime > level.time) {
;1065:			if ( dir && point ) {
;1066:				G_InvulnerabilityEffect( targ, dir, point, impactpoint, bouncedir );
;1067:			}
;1068:			return;
;1069:		}
;1070:	}
;1071:#endif
;1072:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $380
line 1073
;1073:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+842128
ASGNP4
line 1074
;1074:	}
LABELV $380
line 1075
;1075:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $383
line 1076
;1076:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+842128
ASGNP4
line 1077
;1077:	}
LABELV $383
line 1080
;1078:
;1079:	// shootable doors / buttons don't actually have any health
;1080:	if ( targ->s.eType == ET_MOVER ) {
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
NEI4 $386
line 1081
;1081:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $374
ADDRLP4 44
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $374
line 1082
;1082:			targ->use( targ, inflictor, attacker );
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
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
line 1083
;1083:		}
line 1084
;1084:		return;
ADDRGP4 $374
JUMPV
LABELV $386
line 1093
;1085:	}
;1086:#ifdef MISSIONPACK
;1087:	if( g_gametype.integer == GT_OBELISK && CheckObeliskAttack( targ, attacker ) ) {
;1088:		return;
;1089:	}
;1090:#endif
;1091:	// reduce damage by the attacker's handicap value
;1092:	// unless they are rocket jumping
;1093:	if ( attacker->client && attacker != targ ) {
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
EQU4 $390
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $390
line 1094
;1094:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
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
line 1100
;1095:#ifdef MISSIONPACK
;1096:		if( bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;1097:			max /= 2;
;1098:		}
;1099:#endif
;1100:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 20
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 1101
;1101:	}
LABELV $390
line 1103
;1102:
;1103:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1105
;1104:
;1105:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $392
line 1106
;1106:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 2520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 1107
;1107:			return;
ADDRGP4 $374
JUMPV
LABELV $394
line 1109
;1108:		}
;1109:	}
LABELV $392
line 1111
;1110:
;1111:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $396
line 1112
;1112:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 1113
;1113:	} else {
ADDRGP4 $397
JUMPV
LABELV $396
line 1114
;1114:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1115
;1115:	}
LABELV $397
line 1117
;1116:
;1117:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 1118
;1118:	if ( knockback > 200 ) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $398
line 1119
;1119:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 1120
;1120:	}
LABELV $398
line 1121
;1121:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $400
line 1122
;1122:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1123
;1123:	}
LABELV $400
line 1124
;1124:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $402
line 1125
;1125:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1126
;1126:	}
LABELV $402
line 1129
;1127:
;1128:	// figure momentum add, even if the damage won't be taken
;1129:	if ( knockback && targ->client ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $404
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $404
line 1133
;1130:		vec3_t	kvel;
;1131:		float	mass;
;1132:
;1133:		mass = 200;
ADDRLP4 60
CNSTF4 1128792064
ASGNF4
line 1135
;1134:
;1135:		VectorScale (dir, g_knockback.value * (float)knockback / mass, kvel);
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
line 1136
;1136:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
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
line 1140
;1137:
;1138:		// set the timer so that the other client can't cancel
;1139:		// out the movement immediately
;1140:		if ( !targ->client->ps.pm_time ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $413
line 1143
;1141:			int		t;
;1142:
;1143:			t = knockback * 2;
ADDRLP4 88
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1144
;1144:			if ( t < 50 ) {
ADDRLP4 88
INDIRI4
CNSTI4 50
GEI4 $415
line 1145
;1145:				t = 50;
ADDRLP4 88
CNSTI4 50
ASGNI4
line 1146
;1146:			}
LABELV $415
line 1147
;1147:			if ( t > 200 ) {
ADDRLP4 88
INDIRI4
CNSTI4 200
LEI4 $417
line 1148
;1148:				t = 200;
ADDRLP4 88
CNSTI4 200
ASGNI4
line 1149
;1149:			}
LABELV $417
line 1150
;1150:			targ->client->ps.pm_time = t;
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
line 1151
;1151:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
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
line 1152
;1152:		}
LABELV $413
line 1153
;1153:	}
LABELV $404
line 1156
;1154:
;1155:	// check for completely getting out of the damage
;1156:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $419
line 1163
;1157:
;1158:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;1159:		// if the attacker was on the same team
;1160:#ifdef MISSIONPACK
;1161:		if ( mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam (targ, attacker)  ) {
;1162:#else	
;1163:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
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
EQU4 $421
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
EQI4 $421
line 1165
;1164:#endif
;1165:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $423
line 1166
;1166:				return;
ADDRGP4 $374
JUMPV
LABELV $423
line 1168
;1167:			}
;1168:		}
LABELV $421
line 1181
;1169:#ifdef MISSIONPACK
;1170:		if (mod == MOD_PROXIMITY_MINE) {
;1171:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;1172:				return;
;1173:			}
;1174:			if (targ == attacker) {
;1175:				return;
;1176:			}
;1177:		}
;1178:#endif
;1179:
;1180:		// check for godmode
;1181:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $426
line 1182
;1182:			return;
ADDRGP4 $374
JUMPV
LABELV $426
line 1184
;1183:		}
;1184:	}
LABELV $419
line 1188
;1185:
;1186:	// battlesuit protects from all radius damage (but takes knockback)
;1187:	// and protects 50% against all damage
;1188:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $428
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 1189
;1189:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
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
line 1190
;1190:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $432
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $430
LABELV $432
line 1191
;1191:			return;
ADDRGP4 $374
JUMPV
LABELV $430
line 1193
;1192:		}
;1193:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1194
;1194:	}
LABELV $428
line 1197
;1195:
;1196:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;1197:	if ( attacker->client && targ != attacker && targ->health > 0
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
EQU4 $433
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
EQU4 $433
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $433
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
EQI4 $433
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $433
line 1199
;1198:			&& targ->s.eType != ET_MISSILE
;1199:			&& targ->s.eType != ET_GENERAL) {
line 1200
;1200:		if ( OnSameTeam( targ, attacker ) ) {
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
EQI4 $435
line 1201
;1201:			attacker->client->ps.persistant[PERS_HITS]--;
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
line 1202
;1202:		} else {
ADDRGP4 $436
JUMPV
LABELV $435
line 1203
;1203:			attacker->client->ps.persistant[PERS_HITS]++;
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
line 1204
;1204:		}
LABELV $436
line 1205
;1205:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 732
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
line 1206
;1206:	}
LABELV $433
line 1210
;1207:
;1208:	// always give half damage if hurting self
;1209:	// calculated after knockback, so rocket jumping works
;1210:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $437
line 1211
;1211:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1212
;1212:	}
LABELV $437
line 1214
;1213:
;1214:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $439
line 1215
;1215:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 1216
;1216:	}
LABELV $439
line 1217
;1217:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 1218
;1218:	save = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1221
;1219:
;1220:	// save some from armor
;1221:	asave = CheckArmor (targ, take, dflags);
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
line 1222
;1222:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 1224
;1223:
;1224:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $441
line 1225
;1225:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $444
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
CNSTI4 732
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
line 1227
;1226:			targ->health, take, asave );
;1227:	}
LABELV $441
line 1232
;1228:
;1229:	// add to the damage inflicted on a player this frame
;1230:	// the total will be turned into screen blends and view angle kicks
;1231:	// at the end of the frame
;1232:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $446
line 1233
;1233:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
line 1234
;1234:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1235
;1235:		} else {
ADDRGP4 $449
JUMPV
LABELV $448
line 1236
;1236:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 1237
;1237:		}
LABELV $449
line 1238
;1238:		client->damage_armor += asave;
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 2548
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
line 1239
;1239:		client->damage_blood += take;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 2552
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
line 1240
;1240:		client->damage_knockback += knockback;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 2556
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
line 1241
;1241:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $450
line 1242
;1242:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1243
;1243:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 2572
ADDP4
CNSTI4 0
ASGNI4
line 1244
;1244:		} else {
ADDRGP4 $451
JUMPV
LABELV $450
line 1245
;1245:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 2560
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1246
;1246:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 2572
ADDP4
CNSTI4 1
ASGNI4
line 1247
;1247:		}
LABELV $451
line 1248
;1248:	}
LABELV $446
line 1254
;1249:
;1250:	// See if it's the player hurting the emeny flag carrier
;1251:#ifdef MISSIONPACK
;1252:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF ) {
;1253:#else	
;1254:	if( g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $452
line 1256
;1255:#endif
;1256:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1257
;1257:	}
LABELV $452
line 1259
;1258:
;1259:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $455
line 1261
;1260:		// set the last client who damaged the target
;1261:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2592
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1262
;1262:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2596
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1263
;1263:	}
LABELV $455
line 1266
;1264:
;1265:	// Shafe - Trep - Headshots
;1266:	if (targ->client && attacker->client && targ->health > 0)
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
EQU4 $457
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $457
ADDRLP4 72
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $457
line 1267
;1267:	{   
line 1269
;1268:		// let's say only railgun can do head shots
;1269:		if(inflictor->s.weapon==WP_RAILGUN){
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 7
NEI4 $459
line 1270
;1270:			targ_maxs2 = targ->r.maxs[2];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ASGNF4
line 1273
;1271:	
;1272:			// handling crouching
;1273:			if(targ->client->ps.pm_flags & PMF_DUCKED){
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
EQI4 $461
line 1274
;1274:				height = (abs(targ->r.mins[2]) + targ_maxs2)*(0.75);
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
line 1275
;1275:			}
ADDRGP4 $462
JUMPV
LABELV $461
line 1277
;1276:			else
;1277:				height = abs(targ->r.mins[2]) + targ_maxs2; 
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
LABELV $462
line 1282
;1278:				
;1279:			// project the z component of point 
;1280:			// onto the z component of the model's origin
;1281:			// this results in the z component from the origin at 0
;1282:			z_rel = point[2] - targ->r.currentOrigin[2] + abs(targ->r.mins[2]);
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
line 1283
;1283:			z_ratio = z_rel / height;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1285
;1284:		
;1285:			if (z_ratio > 0.90){
ADDRLP4 24
INDIRF4
CNSTF4 1063675494
LEF4 $463
line 1286
;1286:				take=9999; // head shot is a sure kill
ADDRLP4 8
CNSTI4 9999
ASGNI4
line 1287
;1287:				mod=MOD_HEADSHOT;
ADDRFP4 28
CNSTI4 23
ASGNI4
line 1288
;1288:			}
LABELV $463
line 1289
;1289:		}
LABELV $459
line 1290
;1290:	}
LABELV $457
line 1295
;1291:	// Shafe - Trep - End Headshot Code
;1292:
;1293:
;1294:	// do the damage
;1295:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $465
line 1296
;1296:		targ->health = targ->health - take;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 732
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
line 1297
;1297:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $467
line 1298
;1298:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
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
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1299
;1299:		}
LABELV $467
line 1301
;1300:			
;1301:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $469
line 1302
;1302:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $471
line 1303
;1303:				targ->flags |= FL_NO_KNOCKBACK;
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
LABELV $471
line 1305
;1304:
;1305:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $473
line 1306
;1306:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -999
ASGNI4
LABELV $473
line 1308
;1307:
;1308:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1309
;1309:			targ->die (targ, inflictor, attacker, take, mod);
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
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 1310
;1310:			return;
ADDRGP4 $374
JUMPV
LABELV $469
line 1311
;1311:		} else if ( targ->pain ) {
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $475
line 1312
;1312:			targ->pain (targ, attacker, take);
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
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 1313
;1313:		}
LABELV $475
line 1314
;1314:	}
LABELV $465
line 1316
;1315:
;1316:}
LABELV $374
endproc G_Damage 96 24
export CanDamage
proc CanDamage 112 28
line 1327
;1317:
;1318:
;1319:/*
;1320:============
;1321:CanDamage
;1322:
;1323:Returns qtrue if the inflictor can directly damage the target.  Used for
;1324:explosions and melee attacks.
;1325:============
;1326:*/
;1327:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 1334
;1328:	vec3_t	dest;
;1329:	trace_t	tr;
;1330:	vec3_t	midpoint;
;1331:
;1332:	// use the midpoint of the bounds instead of the origin, because
;1333:	// bmodels may have their origin is 0,0,0
;1334:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
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
line 1335
;1335:	VectorScale (midpoint, 0.5, midpoint);
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
line 1337
;1336:
;1337:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1338
;1338:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1339
;1339:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $488
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $484
LABELV $488
line 1340
;1340:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $477
JUMPV
LABELV $484
line 1344
;1341:
;1342:	// this should probably check in the plane of projection, 
;1343:	// rather than in world coordinate, and also include Z
;1344:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1345
;1345:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1346
;1346:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1347
;1347:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1348
;1348:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $490
line 1349
;1349:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $477
JUMPV
LABELV $490
line 1351
;1350:
;1351:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1352
;1352:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1353
;1353:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1354
;1354:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1355
;1355:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $494
line 1356
;1356:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $477
JUMPV
LABELV $494
line 1358
;1357:
;1358:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1359
;1359:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1360
;1360:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 1361
;1361:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1362
;1362:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $498
line 1363
;1363:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $477
JUMPV
LABELV $498
line 1365
;1364:
;1365:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 1366
;1366:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1367
;1367:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 1368
;1368:	trap_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
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
line 1369
;1369:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $502
line 1370
;1370:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $477
JUMPV
LABELV $502
line 1373
;1371:
;1372:
;1373:	return qfalse;
CNSTI4 0
RETI4
LABELV $477
endproc CanDamage 112 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1383
;1374:}
;1375:
;1376:
;1377:/*
;1378:============
;1379:G_RadiusDamage
;1380:============
;1381:*/
;1382:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;1383:					 gentity_t *ignore, int mod) {
line 1392
;1384:	float		points, dist;
;1385:	gentity_t	*ent;
;1386:	int			entityList[MAX_GENTITIES];
;1387:	int			numListedEntities;
;1388:	vec3_t		mins, maxs;
;1389:	vec3_t		v;
;1390:	vec3_t		dir;
;1391:	int			i, e;
;1392:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1394
;1393:
;1394:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $506
line 1395
;1395:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1396
;1396:	}
LABELV $506
line 1398
;1397:
;1398:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $508
line 1399
;1399:		mins[i] = origin[i] - radius;
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
line 1400
;1400:		maxs[i] = origin[i] + radius;
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
line 1401
;1401:	}
LABELV $509
line 1398
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $508
line 1403
;1402:
;1403:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
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
line 1405
;1404:
;1405:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $512
line 1406
;1406:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 824
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
line 1408
;1407:
;1408:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $516
line 1409
;1409:			continue;
ADDRGP4 $513
JUMPV
LABELV $516
line 1410
;1410:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $518
line 1411
;1411:			continue;
ADDRGP4 $513
JUMPV
LABELV $518
line 1414
;1412:
;1413:		// find the distance from the edge of the bounding box
;1414:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $520
line 1415
;1415:			if ( origin[i] < ent->r.absmin[i] ) {
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
GEF4 $524
line 1416
;1416:				v[i] = ent->r.absmin[i] - origin[i];
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
line 1417
;1417:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $525
JUMPV
LABELV $524
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
LEF4 $526
line 1418
;1418:				v[i] = origin[i] - ent->r.absmax[i];
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
line 1419
;1419:			} else {
ADDRGP4 $527
JUMPV
LABELV $526
line 1420
;1420:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1421
;1421:			}
LABELV $527
LABELV $525
line 1422
;1422:		}
LABELV $521
line 1414
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $520
line 1424
;1423:
;1424:		dist = VectorLength( v );
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
line 1425
;1425:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $528
line 1426
;1426:			continue;
ADDRGP4 $513
JUMPV
LABELV $528
line 1429
;1427:		}
;1428:
;1429:		points = damage * ( 1.0 - dist / radius );
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
line 1431
;1430:
;1431:		if( CanDamage (ent, origin) ) {
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
EQI4 $530
line 1432
;1432:			if( LogAccuracyHit( ent, attacker ) ) {
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
EQI4 $532
line 1433
;1433:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1434
;1434:			}
LABELV $532
line 1435
;1435:			VectorSubtract (ent->r.currentOrigin, origin, dir);
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
line 1438
;1436:			// push the center of mass higher than the origin so players
;1437:			// get knocked into the air more
;1438:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1439
;1439:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
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
line 1440
;1440:		}
LABELV $530
line 1441
;1441:	}
LABELV $513
line 1405
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $515
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $512
line 1443
;1442:
;1443:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $505
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
import g_Arsenal
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
LABELV $444
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
LABELV $325
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
LABELV $322
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
byte 1 51
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
byte 1 52
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
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $306
byte 1 115
byte 1 0
align 1
LABELV $305
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
LABELV $304
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
LABELV $250
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
LABELV $249
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
LABELV $242
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $241
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
LABELV $229
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
LABELV $228
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
