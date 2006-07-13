export G_BounceMissile
code
proc G_BounceMissile 52 12
file "../g_missile.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#define	MISSILE_PRESTEP_TIME	50
;6:#define FIRST_HOMING_THINK		500
;7:#define HOMING_THINK			60
;8:#define HOMING_MISSILE_SPEED	800
;9:
;10:// Shafe - Once everything works this file needs cleaned up
;11:
;12:/*
;13:================
;14:G_BounceMissile
;15:
;16:================
;17:*/
;18:void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
line 24
;19:	vec3_t	velocity;
;20:	float	dot;
;21:	int		hitTime;
;22:
;23:	// reflect the velocity on the trace plane
;24:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 25
;25:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 26
;26:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 27
;27:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 29
;28:
;29:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $63
line 30
;30:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1059481190
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1059481190
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1059481190
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
ASGNF4
line 32
;31:		// check for stop
;32:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $65
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1109393408
GEF4 $65
line 33
;33:			G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 36
;34:				
;35:			// Shafe - trep - pdg
;36:			if (ent->classname == "pdgrenade") {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 $69
CVPU4 4
NEU4 $55
line 37
;37:			    ent->parent->istelepoint = 1;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1
ASGNI4
line 38
;38:				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 39
;39:				ent->parent->teleloc[2] += 20;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 820
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDF4
ASGNF4
line 42
;40:			
;41:				
;42:				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
ADDRGP4 $70
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 44
;43:				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
;44:			} // end shafe
line 46
;45:
;46:			return;
ADDRGP4 $55
JUMPV
LABELV $65
line 48
;47:		}
;48:	}
LABELV $63
line 50
;49:
;50:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 51
;51:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 52
;52:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 53
;53:}
LABELV $55
endproc G_BounceMissile 52 12
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 63
;54:
;55:
;56:/*
;57:================
;58:G_ExplodeMissile
;59:
;60:Explode a missile without an impact
;61:================
;62:*/
;63:void G_ExplodeMissile( gentity_t *ent ) {
line 67
;64:	vec3_t		dir;
;65:	vec3_t		origin;
;66:
;67:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 68
;68:	SnapVector( origin );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 32
INDIRF4
ASGNF4
line 69
;69:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 72
;70:
;71:	// we don't have a valid direction, so just point straight up
;72:	dir[0] = dir[1] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 73
;73:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 75
;74:
;75:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 76
;76:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 78
;77:
;78:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 81
;79:
;80:	// splash damage
;81:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $80
line 82
;82:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $82
line 83
;83:			, ent->splashMethodOfDeath ) ) {
line 84
;84:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 40
CNSTI4 836
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 85
;85:		}
LABELV $82
line 86
;86:	}
LABELV $80
line 88
;87:
;88:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 89
;89:}
LABELV $72
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 56 32
line 266
;90:
;91:
;92:#ifdef MISSIONPACK
;93:/*
;94:================
;95:ProximityMine_Explode
;96:================
;97:*/
;98:static void ProximityMine_Explode( gentity_t *mine ) {
;99:	G_ExplodeMissile( mine );
;100:	// if the prox mine has a trigger free it
;101:	if (mine->activator) {
;102:		G_FreeEntity(mine->activator);
;103:		mine->activator = NULL;
;104:	}
;105:}
;106:
;107:/*
;108:================
;109:ProximityMine_Die
;110:================
;111:*/
;112:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;113:	ent->think = ProximityMine_Explode;
;114:	ent->nextthink = level.time + 1;
;115:}
;116:
;117:/*
;118:================
;119:ProximityMine_Trigger
;120:================
;121:*/
;122:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;123:	vec3_t		v;
;124:	gentity_t	*mine;
;125:
;126:	if( !other->client ) {
;127:		return;
;128:	}
;129:
;130:	// trigger is a cube, do a distance test now to act as if it's a sphere
;131:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;132:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;133:		return;
;134:	}
;135:
;136:
;137:	if ( g_gametype.integer >= GT_TEAM ) {
;138:		// don't trigger same team mines
;139:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;140:			return;
;141:		}
;142:	}
;143:
;144:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;145:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;146:		return;
;147:	}
;148:
;149:	// trigger the mine!
;150:	mine = trigger->parent;
;151:	mine->s.loopSound = 0;
;152:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;153:	mine->nextthink = level.time + 500;
;154:
;155:	G_FreeEntity( trigger );
;156:}
;157:
;158:/*
;159:================
;160:ProximityMine_Activate
;161:================
;162:*/
;163:static void ProximityMine_Activate( gentity_t *ent ) {
;164:	gentity_t	*trigger;
;165:	float		r;
;166:
;167:	ent->think = ProximityMine_Explode;
;168:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;169:
;170:	ent->takedamage = qtrue;
;171:	ent->health = 1;
;172:	ent->die = ProximityMine_Die;
;173:
;174:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;175:
;176:	// build the proximity trigger
;177:	trigger = G_Spawn ();
;178:
;179:	trigger->classname = "proxmine_trigger";
;180:
;181:	r = ent->splashRadius;
;182:	VectorSet( trigger->r.mins, -r, -r, -r );
;183:	VectorSet( trigger->r.maxs, r, r, r );
;184:
;185:	G_SetOrigin( trigger, ent->s.pos.trBase );
;186:
;187:	trigger->parent = ent;
;188:	trigger->r.contents = CONTENTS_TRIGGER;
;189:	trigger->touch = ProximityMine_Trigger;
;190:
;191:	trap_LinkEntity (trigger);
;192:
;193:	// set pointer to trigger so the entity can be freed when the mine explodes
;194:	ent->activator = trigger;
;195:}
;196:
;197:/*
;198:================
;199:ProximityMine_ExplodeOnPlayer
;200:================
;201:*/
;202:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;203:	gentity_t	*player;
;204:
;205:	player = mine->enemy;
;206:	player->client->ps.eFlags &= ~EF_TICKING;
;207:
;208:	if ( player->client->invulnerabilityTime > level.time ) {
;209:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;210:		player->client->invulnerabilityTime = 0;
;211:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;212:	}
;213:	else {
;214:		G_SetOrigin( mine, player->s.pos.trBase );
;215:		// make sure the explosion gets to the client
;216:		mine->r.svFlags &= ~SVF_NOCLIENT;
;217:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;218:		G_ExplodeMissile( mine );
;219:	}
;220:}
;221:
;222:/*
;223:================
;224:ProximityMine_Player
;225:================
;226:*/
;227:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;228:	if( mine->s.eFlags & EF_NODRAW ) {
;229:		return;
;230:	}
;231:
;232:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;233:
;234:	if( player->s.eFlags & EF_TICKING ) {
;235:		player->activator->splashDamage += mine->splashDamage;
;236:		player->activator->splashRadius *= 1.50;
;237:		mine->think = G_FreeEntity;
;238:		mine->nextthink = level.time;
;239:		return;
;240:	}
;241:
;242:	player->client->ps.eFlags |= EF_TICKING;
;243:	player->activator = mine;
;244:
;245:	mine->s.eFlags |= EF_NODRAW;
;246:	mine->r.svFlags |= SVF_NOCLIENT;
;247:	mine->s.pos.trType = TR_LINEAR;
;248:	VectorClear( mine->s.pos.trDelta );
;249:
;250:	mine->enemy = player;
;251:	mine->think = ProximityMine_ExplodeOnPlayer;
;252:	if ( player->client->invulnerabilityTime > level.time ) {
;253:		mine->nextthink = level.time + 2 * 1000;
;254:	}
;255:	else {
;256:		mine->nextthink = level.time + 10 * 1000;
;257:	}
;258:}
;259:#endif
;260:
;261:/*
;262:================
;263:G_MissileImpact
;264:================
;265:*/
;266:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 268
;267:	gentity_t		*other;
;268:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 273
;269:#ifdef MISSIONPACK
;270:	vec3_t			forward, impactpoint, bouncedir;
;271:	int				eFlags;
;272:#endif
;273:	other = &g_entities[trace->entityNum];
ADDRLP4 0
CNSTI4 836
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 276
;274:
;275:	// check for bounce
;276:	if ( !other->takedamage &&
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $86
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $86
line 277
;277:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 278
;278:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 279
;279:		G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 280
;280:		return;
ADDRGP4 $85
JUMPV
LABELV $86
line 312
;281:	}
;282:
;283:	// Shafe - trep - pdg - Only if not ET_MISSILE
;284:	/*
;285:	ent->parent->istelepoint = 1;
;286:	VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
;287:	ent->parent->teleloc[2] += 8;
;288:	*/
;289:	// End Shafe
;290:
;291:#ifdef MISSIONPACK
;292:	if ( other->takedamage ) {
;293:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;294:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;295:				//
;296:				VectorCopy( ent->s.pos.trDelta, forward );
;297:				VectorNormalize( forward );
;298:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;299:					VectorCopy( bouncedir, trace->plane.normal );
;300:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;301:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;302:					G_BounceMissile( ent, trace );
;303:					ent->s.eFlags |= eFlags;
;304:				}
;305:				ent->target_ent = other;
;306:				return;
;307:			}
;308:		}
;309:	}
;310:#endif
;311:	// impact damage
;312:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $88
line 314
;313:		// FIXME: wrong damage direction?
;314:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $90
line 317
;315:			vec3_t	velocity;
;316:
;317:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 836
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $92
line 318
;318:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 28
CNSTI4 836
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 319
;319:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 320
;320:			}
LABELV $92
line 321
;321:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 322
;322:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
NEF4 $96
line 323
;323:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 324
;324:			}
LABELV $96
line 325
;325:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 836
ADDRLP4 32
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 328
;326:				ent->s.origin, ent->damage, 
;327:				0, ent->methodOfDeath);
;328:		}
LABELV $90
line 329
;329:	}
LABELV $88
line 368
;330:
;331:#ifdef MISSIONPACK
;332:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;333:		if( ent->s.pos.trType != TR_GRAVITY ) {
;334:			return;
;335:		}
;336:
;337:		// if it's a player, stick it on to them (flag them and remove this entity)
;338:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;339:			ProximityMine_Player( ent, other );
;340:			return;
;341:		}
;342:
;343:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;344:		G_SetOrigin( ent, trace->endpos );
;345:		ent->s.pos.trType = TR_STATIONARY;
;346:		VectorClear( ent->s.pos.trDelta );
;347:
;348:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;349:
;350:		ent->think = ProximityMine_Activate;
;351:		ent->nextthink = level.time + 2000;
;352:
;353:		vectoangles( trace->plane.normal, ent->s.angles );
;354:		ent->s.angles[0] += 90;
;355:
;356:		// link the prox mine to the other entity
;357:		ent->enemy = other;
;358:		ent->die = ProximityMine_Die;
;359:		VectorCopy(trace->plane.normal, ent->movedir);
;360:		VectorSet(ent->r.mins, -4, -4, -4);
;361:		VectorSet(ent->r.maxs, 4, 4, 4);
;362:		trap_LinkEntity(ent);
;363:
;364:		return;
;365:	}
;366:#endif
;367:
;368:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $101
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $99
line 372
;369:		gentity_t *nent;
;370:		vec3_t v;
;371:
;372:		nent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 373
;373:		if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $102
line 375
;374:
;375:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 376
;376:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 378
;377:
;378:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 380
;379:
;380:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 381
;381:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
ADDRLP4 20+4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 382
;382:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
ADDRLP4 20+8
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 384
;383:
;384:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 385
;385:		} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 386
;386:			VectorCopy(trace->endpos, v);
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 387
;387:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 388
;388:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTP4 0
ASGNP4
line 389
;389:		}
LABELV $103
line 391
;390:
;391:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 393
;392:
;393:		nent->freeAfterEvent = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 395
;394:		// change over to a normal entity right at the point of impact
;395:		nent->s.eType = ET_GENERAL;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 396
;396:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 398
;397:
;398:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 399
;399:		G_SetOrigin( nent, v );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 401
;400:
;401:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 402
;402:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 404
;403:
;404:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 405
;405:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 407
;406:
;407:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 408
;408:		trap_LinkEntity( nent );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 410
;409:
;410:		return;
ADDRGP4 $85
JUMPV
LABELV $99
line 416
;411:	}
;412:
;413:	// is it cheaper in bandwidth to just remove this ent and create a new
;414:	// one, rather than changing the missile into the explosion?
;415:
;416:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $107
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $107
line 417
;417:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 418
;418:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 419
;419:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $108
JUMPV
LABELV $107
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $109
line 420
;420:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 421
;421:	} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 422
;422:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 423
;423:	}
LABELV $110
LABELV $108
line 425
;424:
;425:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 428
;426:
;427:	// change over to a normal entity right at the point of impact
;428:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 430
;429:
;430:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 432
;431:
;432:	G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 435
;433:
;434:	// splash damage (doesn't apply to person directly hit)
;435:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 436
;436:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $113
line 437
;437:			other, ent->splashMethodOfDeath ) ) {
line 438
;438:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $115
line 439
;439:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 28
CNSTI4 836
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 2588
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 440
;440:			}
LABELV $115
line 441
;441:		}
LABELV $113
line 442
;442:	}
LABELV $111
line 444
;443:
;444:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 445
;445:}
LABELV $85
endproc G_MissileImpact 56 32
export G_RunMissile
proc G_RunMissile 88 28
line 452
;446:
;447:/*
;448:================
;449:G_RunMissile
;450:================
;451:*/
;452:void G_RunMissile( gentity_t *ent ) {
line 458
;453:	vec3_t		origin;
;454:	trace_t		tr;
;455:	int			passent;
;456:
;457:	
;458:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 60
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 462
;459:
;460:
;461:	// if this missile bounced off an invulnerability sphere
;462:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $120
line 463
;463:		passent = ent->target_ent->s.number;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 464
;464:	}
ADDRGP4 $121
JUMPV
LABELV $120
line 471
;465:#ifdef MISSIONPACK
;466:	// prox mines that left the owner bbox will attach to anything, even the owner
;467:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;468:		passent = ENTITYNUM_NONE;
;469:	}
;470:#endif
;471:	else {
line 473
;472:		// ignore interactions with the missile owner
;473:		passent = ent->r.ownerNum;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 474
;474:	}
LABELV $121
line 476
;475:	// trace a line from the previous position to the current position
;476:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 478
;477:
;478:	if ( tr.startsolid || tr.allsolid ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $125
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $122
LABELV $125
line 480
;479:		// make sure the tr.entityNum is set to the entity we're stuck in
;480:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 80
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 481
;481:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 482
;482:	}
ADDRGP4 $123
JUMPV
LABELV $122
line 483
;483:	else {
line 484
;484:		VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 485
;485:	}
LABELV $123
line 487
;486:
;487:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 489
;488:
;489:	if ( tr.fraction != 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $128
line 491
;490:		// never explode or bounce on sky
;491:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $131
line 499
;492:			// If grapple, reset owner
;493:			/* Shafe - Trep - Comment this out for offhand grapple
;494:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
;495:				ent->parent->client->hook = NULL;
;496:			}
;497:			*/
;498:			// Shafe - Trep - Offhand Grappling Hook
;499:			if (g_gametype.integer != GT_CTF) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $134
line 500
;500:			{
line 501
;501:				if (ent->parent && ent->parent->client->hook == ent)
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRP4
CVPU4 4
NEU4 $137
line 502
;502:				{
line 503
;503:					ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
CNSTP4 0
ASGNP4
line 504
;504:					ent->parent->client->hookhasbeenfired = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2636
ADDP4
CNSTI4 0
ASGNI4
line 505
;505:					ent->parent->client->fireHeld = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2628
ADDP4
CNSTI4 0
ASGNI4
line 506
;506:				}
LABELV $137
line 507
;507:			}
LABELV $134
line 510
;508:			// End Shafe
;509:
;510:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 511
;511:			return;
ADDRGP4 $118
JUMPV
LABELV $131
line 513
;512:		}
;513:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 514
;514:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $139
line 515
;515:			return;		// exploded
ADDRGP4 $118
JUMPV
LABELV $139
line 517
;516:		}
;517:	}
LABELV $128
line 529
;518:#ifdef MISSIONPACK
;519:	// if the prox mine wasn't yet outside the player body
;520:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;521:		// check if the prox mine is outside the owner bbox
;522:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;523:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;524:			ent->count = 1;
;525:		}
;526:	}
;527:#endif
;528:	// check think function after bouncing
;529:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 530
;530:}
LABELV $118
endproc G_RunMissile 88 28
export fire_plasma
proc fire_plasma 32 4
line 541
;531:
;532:
;533://=============================================================================
;534:
;535:/*
;536:=================
;537:fire_plasma
;538:
;539:=================
;540:*/
;541:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 544
;542:	gentity_t	*bolt;
;543:
;544:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 546
;545:
;546:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 547
;547:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $142
ASGNP4
line 548
;548:	bolt->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 549
;549:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 550
;550:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 551
;551:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 552
;552:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 553
;553:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 556
;554://unlagged - projectile nudge
;555:	// we'll need this for nudging projectiles later
;556:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 558
;557://unlagged - projectile nudge
;558:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 559
;559:	bolt->damage = 20;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 20
ASGNI4
line 560
;560:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 15
ASGNI4
line 561
;561:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 20
ASGNI4
line 562
;562:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 8
ASGNI4
line 563
;563:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 9
ASGNI4
line 564
;564:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 565
;565:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 567
;566:
;567:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 568
;568:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 569
;569:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 570
;570:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1157234688
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 571
;571:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 573
;572:
;573:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 575
;574:
;575:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $141
endproc fire_plasma 32 4
export G_ExplodePDGrenade
proc G_ExplodePDGrenade 8 8
line 583
;576:}	
;577:
;578://=============================================================================
;579:
;580:
;581:
;582:// Shafe - Trep 
;583:void G_ExplodePDGrenade( gentity_t *ent ) {
line 585
;584: 
;585:	if (ent->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $146
line 586
;586:	{
line 587
;587:		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
ADDRGP4 $148
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 588
;588:	}
LABELV $146
line 589
;589:	ent->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 590
;590: 	VectorClear( ent->parent->teleloc ); // clear the teleport location
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 593
;591:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;592:	
;593:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 594
;594:}
LABELV $145
endproc G_ExplodePDGrenade 8 8
export fire_pdgrenade
proc fire_pdgrenade 32 4
line 601
;595:/*
;596:=================
;597: fire_pdgrenade
;598: Shafe - Trep 
;599:=================
;600:*/
;601:gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 605
;602:	gentity_t	*bolt;
;603:	
;604:	
;605:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 607
;606: 
;607:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 608
;608:	bolt->classname = "pdgrenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $69
ASGNP4
line 609
;609:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 610
;610:	bolt->think = G_ExplodePDGrenade;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodePDGrenade
ASGNP4
line 611
;611:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 614
;612:	//tr.surfaceFlags & SURF_NOIMPACT
;613:	
;614:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 615
;615:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 616
;616:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 617
;617:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 621
;618:
;619:	//unlagged - projectile nudge
;620:	// we'll need this for nudging projectiles later
;621:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 624
;622:	//unlagged - projectile nudge
;623:	
;624:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 625
;625:	bolt->damage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 626
;626:	bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 627
;627:	bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 0
ASGNI4
line 628
;628:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 4
ASGNI4
line 629
;629:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 5
ASGNI4
line 630
;630:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 632
;631: 
;632:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 633
;633:	 bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 634
;634:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 635
;635:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 636
;636:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 638
;637: 
;638:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 640
;639: 
;640: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $149
endproc fire_pdgrenade 32 4
export fire_grenade
proc fire_grenade 32 4
line 648
;641:}
;642:
;643:/*
;644:=================
;645:fire_grenade
;646:=================
;647:*/
;648:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 651
;649:	gentity_t	*bolt;
;650:
;651:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 653
;652:
;653:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 654
;654:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $153
ASGNP4
line 655
;655:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 656
;656:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 657
;657:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 658
;658:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 659
;659:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 660
;660:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 661
;661:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 664
;662://unlagged - projectile nudge
;663:	// we'll need this for nudging projectiles later
;664:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 666
;665://unlagged - projectile nudge
;666:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 667
;667:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 668
;668:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 669
;669:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 150
ASGNI4
line 670
;670:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 4
ASGNI4
line 671
;671:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 5
ASGNI4
line 672
;672:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 673
;673:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 675
;674:
;675:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 676
;676:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 677
;677:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 678
;678:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 679
;679:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 681
;680:
;681:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 683
;682:
;683:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $152
endproc fire_grenade 32 4
export fire_flame
proc fire_flame 32 4
line 694
;684:}
;685:
;686://=============================================================================
;687:
;688:/*
;689:=================
;690:fire_flame
;691:Shafe - Trep - Flame Thrower
;692:=================
;693:*/
;694:gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 698
;695:
;696:	gentity_t	*bolt;
;697:
;698:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 700
;699:
;700:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 701
;701:	bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $157
ASGNP4
line 702
;702:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 703
;703:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 704
;704:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 705
;705:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 706
;706:	bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 707
;707:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 710
;708://unlagged - projectile nudge
;709:	// we'll need this for nudging projectiles later
;710:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 712
;711://unlagged - projectile nudge
;712:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 715
;713:	
;714:	
;715:	if (alt == qfalse ) 
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $159
line 716
;716:	{
line 717
;717:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 25
ASGNI4
line 718
;718:		bolt->damage = 70;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 70
ASGNI4
line 719
;719:		bolt->splashDamage = 55;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 55
ASGNI4
line 720
;720:		bolt->splashRadius = 55;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 55
ASGNI4
line 721
;721:	} else
ADDRGP4 $160
JUMPV
LABELV $159
line 722
;722:	{
line 723
;723:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 25
ASGNI4
line 724
;724:		bolt->damage = 30;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 30
ASGNI4
line 725
;725:		bolt->splashDamage = 25;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 25
ASGNI4
line 726
;726:		bolt->splashRadius = 45;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 45
ASGNI4
line 727
;727:	}
LABELV $160
line 729
;728:
;729:	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 25
ASGNI4
line 730
;730:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 732
;731:
;732:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 733
;733:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 734
;734:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 735
;735:	VectorScale( dir, 300, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 736
;736:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 738
;737:
;738:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 740
;739:
;740:return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $156
endproc fire_flame 32 4
export G_HomingMissile
proc G_HomingMissile 100 12
line 745
;741:}
;742:
;743:
;744:
;745:void G_HomingMissile( gentity_t *ent ) {
line 746
;746:	gentity_t	*target = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 747
;747:	gentity_t	*blip = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 751
;748:	vec3_t		dir, blipdir;
;749:	vec_t		dot, cs;
;750:	qboolean	chaff;
;751:	qboolean	ignorechaff = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 753
;752:
;753:	if (ent->parent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $167
line 754
;754:	{
line 755
;755:		ent->nextthink = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 756
;756:		ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 757
;757:		return;
ADDRGP4 $162
JUMPV
LABELV $166
line 761
;758:	}
;759:
;760:
;761:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
line 762
;762:			chaff = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 764
;763:
;764:			if (blip->client==NULL)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $169
ADDRGP4 $167
JUMPV
LABELV $169
line 765
;765:			if (blip==ent->parent)			continue;
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
NEU4 $171
ADDRGP4 $167
JUMPV
LABELV $171
line 766
;766:			if (blip->health<=0)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $173
ADDRGP4 $167
JUMPV
LABELV $173
line 767
;767:			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
LTI4 $175
line 768
;768:				continue;
ADDRGP4 $167
JUMPV
LABELV $175
line 770
;769:
;770:			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $181
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $177
LABELV $181
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $177
line 772
;771:				OnSameTeam( blip, ent->parent ) )
;772:				continue;
ADDRGP4 $167
JUMPV
LABELV $177
line 775
;773:		
;774:
;775:		if (!visible (ent, blip))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 visible
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $182
line 776
;776:			continue;
ADDRGP4 $167
JUMPV
LABELV $182
line 778
;777:
;778:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
ADDRLP4 60
CNSTI4 488
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 492
ASGNI4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
CNSTI4 496
ASGNI4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 781
;779:
;780:		//NT - give chaff a higher weight
;781:		if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $186
line 782
;782:		{
line 783
;783:			VectorScale(blipdir, 0.5, blipdir);
ADDRLP4 76
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 76
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 76
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 784
;784:		}
LABELV $186
line 786
;785:
;786:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $194
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 76
INDIRF4
ADDRLP4 80
INDIRF4
GEF4 $192
LABELV $194
line 787
;787:		{
line 788
;788:			if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $195
line 789
;789:			{
line 790
;790:				VectorScale(blipdir, 2, blipdir);
ADDRLP4 84
CNSTF4 1073741824
ASGNF4
ADDRLP4 4
ADDRLP4 84
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 84
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1073741824
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 791
;791:			}
LABELV $195
line 794
;792:
;793:			// E.B = |E||B|cos(theta)
;794:			dot = _DotProduct(ent->r.currentAngles, blipdir);
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 84
ADDRGP4 _DotProduct
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 84
INDIRF4
ASGNF4
line 797
;795:
;796:			// Divide E.B by |E||B| to get cos(theta)
;797:			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
DIVF4
ASGNF4
line 800
;798:
;799:			// If angle is less than 120 degrees
;800:			if (cs > cos(120.0f * M_PI / 180.0f))
CNSTF4 1074137746
ARGF4
ADDRLP4 96
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 96
INDIRF4
LEF4 $201
line 801
;801:			{
line 803
;802:				// We add it as our target
;803:				target = blip;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 804
;804:				VectorCopy(blipdir, dir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 805
;805:			}
LABELV $201
line 806
;806:		}
LABELV $192
line 807
;807:	}
LABELV $167
line 761
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTF4 1249125376
ARGF4
ADDRLP4 48
ADDRGP4 findradius
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $166
line 809
;808:
;809:	if (target == NULL)	{
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $203
line 810
;810:		ent->nextthink = level.time + HOMING_THINK; // + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 811
;811:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 812
;812:	} else {
ADDRGP4 $204
JUMPV
LABELV $203
line 814
;813:		// for exact trajectory calculation, set current point to base.
;814:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 816
;815:
;816:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 818
;817:		// 0.5 is swing rate.
;818:		VectorScale(dir, 0.5, dir);
ADDRLP4 56
CNSTF4 1056964608
ASGNF4
ADDRLP4 20
ADDRLP4 56
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 56
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20+8
CNSTF4 1056964608
ADDRLP4 20+8
INDIRF4
MULF4
ASGNF4
line 819
;819:		VectorAdd(dir,ent->r.currentAngles,dir);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDF4
ASGNF4
line 822
;820:
;821:		// turn nozzle to target angle
;822:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 823
;823:		VectorCopy(dir, ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 826
;824:
;825:		// scale direction, put into trDelta
;826:		VectorScale(dir, ent->constantSpeed, dir);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 20+4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 827
;827:		VectorCopy(dir, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 829
;828:
;829:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 831
;830:
;831:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 84
INDIRP4
ADDRLP4 88
INDIRF4
ASGNF4
line 832
;832:		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 833
;833:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 834
;834:	}
LABELV $204
line 835
;835:}
LABELV $162
endproc G_HomingMissile 100 12
export fire_altgrenade
proc fire_altgrenade 32 4
line 915
;836:
;837:
;838:/*
;839:void G_HomingMissile( gentity_t *ent )
;840:{
;841:	gentity_t	*target = NULL;
;842:	gentity_t	*blip = NULL;
;843:	vec3_t  dir, blipdir, temp_dir;
;844:
;845:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000)) != NULL)	{
;846:		if (blip->client==NULL)			continue;
;847:		if (blip==ent->parent)			continue;
;848:		if (blip->health<=0)			continue;
;849:		if (blip->client->sess.sessionTeam == TEAM_SPECTATOR)
;850:			continue;
;851:
;852:		if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
;853:			blip->client->sess.sessionTeam == ent->parent->client->sess.sessionTeam)
;854:			continue;
;855:		//in old code,this ent->parent->cliend-> was blip->parent->client->,
;856:		//so didn't work in CTF and team deathmatch.Now it will work.
;857:
;858:		if (!visible (ent, blip))
;859:			continue;
;860:
;861:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
;862:		blipdir[2] += 16;
;863:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
;864:		{
;865:			//if new target is the nearest
;866:			VectorCopy(blipdir,temp_dir);
;867:			VectorNormalize(temp_dir);
;868:			VectorAdd(temp_dir,ent->r.currentAngles,temp_dir);	
;869:			//now the longer temp_dir length is the more straight path for the rocket.
;870:			if(VectorLength(temp_dir)>1.2)
;871:			{	
;872:				//if this 1.6 were smaller,the rocket also get to target the enemy on his back.
;873:				target = blip;
;874:				VectorCopy(blipdir, dir);
;875:			}
;876:		}
;877:	}
;878:
;879:	if (target == NULL)	{	
;880:		ent->nextthink = level.time + 10000;
;881:		// if once the rocket lose target,it will not search new enemy any more,and go away.
;882:	} else {
;883:		ent->s.pos.trTime=level.time;
;884:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
;885:		//for exact trajectory calculation,set current point to base.
;886:			
;887:		VectorNormalize(dir);
;888:		VectorScale(dir, 0.2,dir);
;889:		VectorAdd(dir,ent->r.currentAngles,dir);
;890:		// this 0.3 is swing rate.this value is cheap,I think.try 0.8 or 1.5.
;891:		// if you want fastest swing,comment out these 3 lines.
;892:
;893:		VectorNormalize(dir);
;894:		VectorCopy(dir,ent->r.currentAngles);
;895:		//locate nozzle to target
;896:
;897:		VectorScale (dir,VectorLength(ent->s.pos.trDelta)*1.1,ent->s.pos.trDelta);
;898:		//trDelta is actual vector for movement.Because the rockets slow down
;899:		// when swing large angle,so accelalate them.
;900:
;901:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
;902:		ent->nextthink = level.time + 100;	//decrease this value also makes fast swing. -- // Shafe was 100
;903:	}
;904:}
;905:*/
;906:
;907:
;908:
;909:/*
;910:=================
;911:fire_altgrenade
;912:Shafe - Trep - Sticky Grenades for Alt
;913:=================
;914:*/
;915:gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 918
;916:	gentity_t	*bolt;
;917:
;918:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 920
;919:
;920:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 921
;921:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $153
ASGNP4
line 922
;922:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 923
;923:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 924
;924:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 925
;925:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 926
;926:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 928
;927://	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
;928:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 931
;929://unlagged - projectile nudge
;930:	// we'll need this for nudging projectiles later
;931:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 933
;932://unlagged - projectile nudge
;933:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 934
;934:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 935
;935:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 936
;936:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 150
ASGNI4
line 937
;937:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 4
ASGNI4
line 938
;938:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 5
ASGNI4
line 939
;939:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 940
;940:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 942
;941:
;942:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 943
;943:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 944
;944:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 945
;945:	VectorScale( dir, 700, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 946
;946:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 948
;947:
;948:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 950
;949:
;950:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $220
endproc fire_altgrenade 32 4
export fire_bfg
proc fire_bfg 36 4
line 961
;951:}
;952:
;953://=============================================================================
;954:
;955:
;956:/*
;957:=================
;958:fire_bfg
;959:=================
;960:*/
;961:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, int charge) {
line 964
;962:	gentity_t	*bolt;
;963:	int			speed;
;964:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 966
;965:
;966:	bolt = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 967
;967:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $224
ASGNP4
line 997
;968:	/*
;969:	bolt->nextthink = level.time + 1000; 
;970:	bolt->think = G_ExplodeMissile;
;971:	bolt->s.eType = ET_MISSILE;
;972:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
;973:	bolt->s.weapon = WP_BFG;
;974:	bolt->r.ownerNum = self->s.number;
;975://unlagged - projectile nudge
;976:	// we'll need this for nudging projectiles later
;977:	bolt->s.otherEntityNum = self->s.number;
;978://unlagged - projectile nudge
;979:	bolt->parent = self;
;980:	bolt->damage = 100;
;981:	bolt->splashDamage = 100;
;982:	bolt->splashRadius = 120;
;983:	bolt->methodOfDeath = MOD_BFG;
;984:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
;985:	bolt->clipmask = MASK_SHOT;
;986:	bolt->target_ent = NULL;
;987:
;988:	//bolt->s.pos.trType = TR_GRAVITY;
;989:	bolt->s.pos.trType = TR_LINEAR;
;990:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;991:	VectorCopy( start, bolt->s.pos.trBase );
;992:	VectorScale( dir, 2000, bolt->s.pos.trDelta ); //		was 2000
;993:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
;994:	VectorCopy (start, bolt->r.currentOrigin);
;995:	return bolt;
;996:	*/
;997:	bolt->nextthink = level.time + 20;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 998
;998:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 999
;999:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1000
;1000:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1001
;1001:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1002
;1002:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1005
;1003://unlagged - projectile nudge
;1004:	// we'll need this for nudging projectiles later
;1005:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1007
;1006://unlagged - projectile nudge
;1007:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1008
;1008:	bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 500
ASGNI4
line 1009
;1009:	bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 300
ASGNI4
line 1010
;1010:	bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 420
ASGNI4
line 1011
;1011:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 12
ASGNI4
line 1012
;1012:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 13
ASGNI4
line 1013
;1013:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 1014
;1014:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1016
;1015:
;1016:		bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1018
;1017:	
;1018:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1019
;1019:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1023
;1020:
;1021:	// How much did the power it up
;1022:	
;1023:	VectorScale( dir, 325, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1134723072
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1025
;1024:	
;1025:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1026
;1026:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1028
;1027:
;1028:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $223
endproc fire_bfg 36 4
export fire_rocket
proc fire_rocket 32 4
line 1041
;1029:
;1030:
;1031:}
;1032:
;1033://=============================================================================
;1034:
;1035:
;1036:/*
;1037:=================
;1038:fire_rocket
;1039:=================
;1040:*/
;1041:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1044
;1042:	gentity_t	*bolt;
;1043:
;1044:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1046
;1045:
;1046:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1047
;1047:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $228
ASGNP4
line 1048
;1048:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1049
;1049:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1050
;1050:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1051
;1051:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1052
;1052:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1053
;1053:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1056
;1054://unlagged - projectile nudge
;1055:	// we'll need this for nudging projectiles later
;1056:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1058
;1057://unlagged - projectile nudge
;1058:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1059
;1059:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 1060
;1060:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 1061
;1061:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 120
ASGNI4
line 1062
;1062:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 6
ASGNI4
line 1063
;1063:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 7
ASGNI4
line 1064
;1064:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 1065
;1065:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1067
;1066:
;1067:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1068
;1068:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1069
;1069:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1070
;1070:	VectorScale( dir, 900, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1147207680
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1147207680
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1147207680
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1071
;1071:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1072
;1072:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1074
;1073:
;1074:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $227
endproc fire_rocket 32 4
lit
align 4
LABELV $232
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $233
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export fire_alt_rocket
code
proc fire_alt_rocket 68 4
line 1083
;1075:}
;1076:
;1077:
;1078:/*
;1079:=================
;1080:fire_alt_rocket
;1081:=================
;1082:*/
;1083:gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1085
;1084:	gentity_t	*bolt;
;1085:	vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
ADDRLP4 4
ADDRGP4 $232
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $233
INDIRB
ASGNB 12
line 1087
;1086:
;1087:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1089
;1088:
;1089:	bolt = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1090
;1090:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $228
ASGNP4
line 1091
;1091:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1092
;1092:	bolt->nextthink = level.time + FIRST_HOMING_THINK;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1093
;1093:	bolt->lastthinktime = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1094
;1094:	bolt->lastthink = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1095
;1095:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1096
;1096:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1097
;1097:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1098
;1098:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1101
;1099:	//unlagged - projectile nudge
;1100:	// we'll need this for nudging projectiles later
;1101:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1103
;1102:	//unlagged - projectile nudge
;1103:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1104
;1104:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 1105
;1105:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 1106
;1106:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 1107
;1107:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 120
ASGNI4
line 1108
;1108:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 6
ASGNI4
line 1109
;1109:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 7
ASGNI4
line 1110
;1110:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 1111
;1111:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1112
;1112:	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1022
ASGNI4
line 1116
;1113:
;1114:
;1115:
;1116:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1117
;1117:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1118
;1118:	bolt->constantSpeed = HOMING_MISSILE_SPEED;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 800
ASGNI4
line 1119
;1119:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1120
;1120:	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1121
;1121:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRF4
ASGNF4
line 1122
;1122:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1123
;1123:	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1125
;1124:
;1125:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $231
endproc fire_alt_rocket 68 4
export fire_grapple
proc fire_grapple 36 4
line 1173
;1126:
;1127:	/*
;1128:	gentity_t	*bolt;
;1129:
;1130:	VectorNormalize (dir);
;1131:
;1132:	bolt = G_Spawn();
;1133:	bolt->classname = "rocket";
;1134:	
;1135:	bolt->think = G_HomingMissile;
;1136:	bolt->nextthink = level.time + 60;
;1137:	
;1138:	bolt->s.eType = ET_MISSILE;
;1139:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
;1140:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
;1141:	bolt->r.ownerNum = self->s.number;
;1142://unlagged - projectile nudge
;1143:	// we'll need this for nudging projectiles later
;1144:	bolt->s.otherEntityNum = self->s.number;
;1145://unlagged - projectile nudge
;1146:	bolt->parent = self;
;1147:	bolt->damage = 100;
;1148:	bolt->splashDamage = 100;
;1149:	bolt->splashRadius = 120;
;1150:	bolt->methodOfDeath = MOD_ROCKET;
;1151:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
;1152:	bolt->clipmask = MASK_SHOT;
;1153:	bolt->target_ent = NULL;
;1154:
;1155:	bolt->s.pos.trType = TR_LINEAR;
;1156:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1157:	VectorCopy( start, bolt->s.pos.trBase );
;1158:	VectorScale( dir, 900, bolt->s.pos.trDelta );
;1159:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
;1160:	VectorCopy (start, bolt->r.currentOrigin);
;1161:
;1162:	VectorCopy (dir, bolt->r.currentAngles);// this is new line. - Shafe -Trep
;1163:
;1164:	return bolt;
;1165:	*/
;1166:}
;1167:
;1168:/*
;1169:=================
;1170:fire_grapple
;1171:=================
;1172:*/
;1173:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 1179
;1174:	gentity_t	*hook;
;1175://unlagged - grapple
;1176:	int hooktime;
;1177://unlagged - grapple
;1178:
;1179:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1181
;1180:
;1181:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1182
;1182:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $101
ASGNP4
line 1183
;1183:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1184
;1184:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 1185
;1185:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1186
;1186:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1187
;1187:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 1188
;1188:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1189
;1189:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 24
ASGNI4
line 1190
;1190:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 1191
;1191:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1192
;1192:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1196
;1193:
;1194://unlagged - grapple
;1195:	// we might want this later
;1196:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1201
;1197:
;1198:	// setting the projectile base time back makes the hook's first
;1199:	// step larger
;1200:
;1201:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
line 1202
;1202:		hooktime = self->client->pers.cmd.serverTime + 50;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1203
;1203:	}
ADDRGP4 $240
JUMPV
LABELV $239
line 1204
;1204:	else {
line 1205
;1205:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1206
;1206:	}
LABELV $240
line 1208
;1207:
;1208:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1211
;1209://unlagged - grapple
;1210:
;1211:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1215
;1212://unlagged - grapple
;1213:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1214://unlagged - grapple
;1215:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1216
;1216:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1217
;1217:	VectorScale( dir, 800, hook->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1145569280
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1145569280
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1145569280
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1218
;1218:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1219
;1219:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1221
;1220:
;1221:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2632
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1223
;1222:
;1223:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $237
endproc fire_grapple 36 4
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
import fire_blaster
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
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
LABELV $228
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $224
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $157
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 80
byte 1 68
byte 1 71
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 69
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $142
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $101
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $70
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 57
byte 1 80
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 99
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 111
byte 1 99
byte 1 107
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $69
byte 1 112
byte 1 100
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
