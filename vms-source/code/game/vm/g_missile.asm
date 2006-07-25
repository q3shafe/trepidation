export G_Missile_Die
code
proc G_Missile_Die 0 0
file "../g_missile.c"
line 17
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
;14:G_Missile_Die
;15:================
;16:*/
;17:void G_Missile_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
line 18
;18:	ent->nextthink = level.time + 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 19
;19:	ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 20
;20:}
LABELV $55
endproc G_Missile_Die 0 0
export G_BounceMissile
proc G_BounceMissile 52 12
line 28
;21:
;22:/*
;23:================
;24:G_BounceMissile
;25:
;26:================
;27:*/
;28:void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
line 34
;29:	vec3_t	velocity;
;30:	float	dot;
;31:	int		hitTime;
;32:
;33:	// reflect the velocity on the trace plane
;34:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
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
line 35
;35:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
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
line 36
;36:	dot = DotProduct( velocity, trace->plane.normal );
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
line 37
;37:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
line 39
;38:
;39:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $65
line 40
;40:		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
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
line 42
;41:		// check for stop
;42:		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $67
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
GEF4 $67
line 43
;43:			G_SetOrigin( ent, trace->endpos );
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
line 46
;44:				
;45:			// Shafe - trep - pdg
;46:			if (ent->classname == "pdgrenade") {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 $71
CVPU4 4
NEU4 $57
line 47
;47:			    ent->parent->istelepoint = 1;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1
ASGNI4
line 48
;48:				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
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
line 49
;49:				ent->parent->teleloc[2] += 20;
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
line 52
;50:			
;51:				
;52:				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
ADDRGP4 $72
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
line 54
;53:				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
;54:			} // end shafe
line 56
;55:
;56:			return;
ADDRGP4 $57
JUMPV
LABELV $67
line 58
;57:		}
;58:	}
LABELV $65
line 60
;59:
;60:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
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
line 61
;61:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 62
;62:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 63
;63:}
LABELV $57
endproc G_BounceMissile 52 12
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 73
;64:
;65:
;66:/*
;67:================
;68:G_ExplodeMissile
;69:
;70:Explode a missile without an impact
;71:================
;72:*/
;73:void G_ExplodeMissile( gentity_t *ent ) {
line 77
;74:	vec3_t		dir;
;75:	vec3_t		origin;
;76:
;77:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 78
;78:	SnapVector( origin );
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
line 79
;79:	G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 82
;80:
;81:	// we don't have a valid direction, so just point straight up
;82:	dir[0] = dir[1] = 0;
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
line 83
;83:	dir[2] = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 85
;84:
;85:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 86
;86:	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 88
;87:
;88:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 91
;89:
;90:	// splash damage
;91:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $82
line 92
;92:		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
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
EQI4 $84
line 93
;93:			, ent->splashMethodOfDeath ) ) {
line 94
;94:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
line 95
;95:		}
LABELV $84
line 96
;96:	}
LABELV $82
line 98
;97:
;98:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 99
;99:}
LABELV $74
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 56 32
line 276
;100:
;101:
;102:#ifdef MISSIONPACK
;103:/*
;104:================
;105:ProximityMine_Explode
;106:================
;107:*/
;108:static void ProximityMine_Explode( gentity_t *mine ) {
;109:	G_ExplodeMissile( mine );
;110:	// if the prox mine has a trigger free it
;111:	if (mine->activator) {
;112:		G_FreeEntity(mine->activator);
;113:		mine->activator = NULL;
;114:	}
;115:}
;116:
;117:/*
;118:================
;119:ProximityMine_Die
;120:================
;121:*/
;122:static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
;123:	ent->think = ProximityMine_Explode;
;124:	ent->nextthink = level.time + 1;
;125:}
;126:
;127:/*
;128:================
;129:ProximityMine_Trigger
;130:================
;131:*/
;132:void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
;133:	vec3_t		v;
;134:	gentity_t	*mine;
;135:
;136:	if( !other->client ) {
;137:		return;
;138:	}
;139:
;140:	// trigger is a cube, do a distance test now to act as if it's a sphere
;141:	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
;142:	if( VectorLength( v ) > trigger->parent->splashRadius ) {
;143:		return;
;144:	}
;145:
;146:
;147:	if ( g_gametype.integer >= GT_TEAM ) {
;148:		// don't trigger same team mines
;149:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;150:			return;
;151:		}
;152:	}
;153:
;154:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;155:	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
;156:		return;
;157:	}
;158:
;159:	// trigger the mine!
;160:	mine = trigger->parent;
;161:	mine->s.loopSound = 0;
;162:	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
;163:	mine->nextthink = level.time + 500;
;164:
;165:	G_FreeEntity( trigger );
;166:}
;167:
;168:/*
;169:================
;170:ProximityMine_Activate
;171:================
;172:*/
;173:static void ProximityMine_Activate( gentity_t *ent ) {
;174:	gentity_t	*trigger;
;175:	float		r;
;176:
;177:	ent->think = ProximityMine_Explode;
;178:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;179:
;180:	ent->takedamage = qtrue;
;181:	ent->health = 1;
;182:	ent->die = ProximityMine_Die;
;183:
;184:	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );
;185:
;186:	// build the proximity trigger
;187:	trigger = G_Spawn ();
;188:
;189:	trigger->classname = "proxmine_trigger";
;190:
;191:	r = ent->splashRadius;
;192:	VectorSet( trigger->r.mins, -r, -r, -r );
;193:	VectorSet( trigger->r.maxs, r, r, r );
;194:
;195:	G_SetOrigin( trigger, ent->s.pos.trBase );
;196:
;197:	trigger->parent = ent;
;198:	trigger->r.contents = CONTENTS_TRIGGER;
;199:	trigger->touch = ProximityMine_Trigger;
;200:
;201:	trap_LinkEntity (trigger);
;202:
;203:	// set pointer to trigger so the entity can be freed when the mine explodes
;204:	ent->activator = trigger;
;205:}
;206:
;207:/*
;208:================
;209:ProximityMine_ExplodeOnPlayer
;210:================
;211:*/
;212:static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
;213:	gentity_t	*player;
;214:
;215:	player = mine->enemy;
;216:	player->client->ps.eFlags &= ~EF_TICKING;
;217:
;218:	if ( player->client->invulnerabilityTime > level.time ) {
;219:		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
;220:		player->client->invulnerabilityTime = 0;
;221:		G_TempEntity( player->client->ps.origin, EV_JUICED );
;222:	}
;223:	else {
;224:		G_SetOrigin( mine, player->s.pos.trBase );
;225:		// make sure the explosion gets to the client
;226:		mine->r.svFlags &= ~SVF_NOCLIENT;
;227:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;228:		G_ExplodeMissile( mine );
;229:	}
;230:}
;231:
;232:/*
;233:================
;234:ProximityMine_Player
;235:================
;236:*/
;237:static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
;238:	if( mine->s.eFlags & EF_NODRAW ) {
;239:		return;
;240:	}
;241:
;242:	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );
;243:
;244:	if( player->s.eFlags & EF_TICKING ) {
;245:		player->activator->splashDamage += mine->splashDamage;
;246:		player->activator->splashRadius *= 1.50;
;247:		mine->think = G_FreeEntity;
;248:		mine->nextthink = level.time;
;249:		return;
;250:	}
;251:
;252:	player->client->ps.eFlags |= EF_TICKING;
;253:	player->activator = mine;
;254:
;255:	mine->s.eFlags |= EF_NODRAW;
;256:	mine->r.svFlags |= SVF_NOCLIENT;
;257:	mine->s.pos.trType = TR_LINEAR;
;258:	VectorClear( mine->s.pos.trDelta );
;259:
;260:	mine->enemy = player;
;261:	mine->think = ProximityMine_ExplodeOnPlayer;
;262:	if ( player->client->invulnerabilityTime > level.time ) {
;263:		mine->nextthink = level.time + 2 * 1000;
;264:	}
;265:	else {
;266:		mine->nextthink = level.time + 10 * 1000;
;267:	}
;268:}
;269:#endif
;270:
;271:/*
;272:================
;273:G_MissileImpact
;274:================
;275:*/
;276:void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
line 278
;277:	gentity_t		*other;
;278:	qboolean		hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 283
;279:#ifdef MISSIONPACK
;280:	vec3_t			forward, impactpoint, bouncedir;
;281:	int				eFlags;
;282:#endif
;283:	other = &g_entities[trace->entityNum];
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
line 286
;284:
;285:	// check for bounce
;286:	if ( !other->takedamage &&
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
NEI4 $88
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $88
line 287
;287:		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
line 288
;288:		G_BounceMissile( ent, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 290
;289:		
;290:		if (ent->classname == "plasma")
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 $92
CVPU4 4
NEU4 $90
line 291
;291:		{
line 292
;292:			G_AddEvent( ent, EV_PL_BOUNCE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 293
;293:		} 
ADDRGP4 $87
JUMPV
LABELV $90
line 295
;294:		else
;295:		{
line 297
;296:			// Regular Grenade
;297:			G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
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
line 298
;298:		}
line 300
;299:
;300:		return;
ADDRGP4 $87
JUMPV
LABELV $88
line 332
;301:	}
;302:
;303:	// Shafe - trep - pdg - Only if not ET_MISSILE
;304:	/*
;305:	ent->parent->istelepoint = 1;
;306:	VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
;307:	ent->parent->teleloc[2] += 8;
;308:	*/
;309:	// End Shafe
;310:
;311:#ifdef MISSIONPACK
;312:	if ( other->takedamage ) {
;313:		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
;314:			if ( other->client && other->client->invulnerabilityTime > level.time ) {
;315:				//
;316:				VectorCopy( ent->s.pos.trDelta, forward );
;317:				VectorNormalize( forward );
;318:				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
;319:					VectorCopy( bouncedir, trace->plane.normal );
;320:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;321:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;322:					G_BounceMissile( ent, trace );
;323:					ent->s.eFlags |= eFlags;
;324:				}
;325:				ent->target_ent = other;
;326:				return;
;327:			}
;328:		}
;329:	}
;330:#endif
;331:	// impact damage
;332:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
line 334
;333:		// FIXME: wrong damage direction?
;334:		if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $95
line 337
;335:			vec3_t	velocity;
;336:
;337:			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
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
EQI4 $97
line 338
;338:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
line 339
;339:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 340
;340:			}
LABELV $97
line 341
;341:			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
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
line 342
;342:			if ( VectorLength( velocity ) == 0 ) {
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
NEF4 $101
line 343
;343:				velocity[2] = 1;	// stepped on a grenade
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 344
;344:			}
LABELV $101
line 345
;345:			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
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
line 348
;346:				ent->s.origin, ent->damage, 
;347:				0, ent->methodOfDeath);
;348:		}
LABELV $95
line 349
;349:	}
LABELV $93
line 388
;350:
;351:#ifdef MISSIONPACK
;352:	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
;353:		if( ent->s.pos.trType != TR_GRAVITY ) {
;354:			return;
;355:		}
;356:
;357:		// if it's a player, stick it on to them (flag them and remove this entity)
;358:		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
;359:			ProximityMine_Player( ent, other );
;360:			return;
;361:		}
;362:
;363:		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
;364:		G_SetOrigin( ent, trace->endpos );
;365:		ent->s.pos.trType = TR_STATIONARY;
;366:		VectorClear( ent->s.pos.trDelta );
;367:
;368:		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );
;369:
;370:		ent->think = ProximityMine_Activate;
;371:		ent->nextthink = level.time + 2000;
;372:
;373:		vectoangles( trace->plane.normal, ent->s.angles );
;374:		ent->s.angles[0] += 90;
;375:
;376:		// link the prox mine to the other entity
;377:		ent->enemy = other;
;378:		ent->die = ProximityMine_Die;
;379:		VectorCopy(trace->plane.normal, ent->movedir);
;380:		VectorSet(ent->r.mins, -4, -4, -4);
;381:		VectorSet(ent->r.maxs, 4, 4, 4);
;382:		trap_LinkEntity(ent);
;383:
;384:		return;
;385:	}
;386:#endif
;387:
;388:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $106
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $104
line 392
;389:		gentity_t *nent;
;390:		vec3_t v;
;391:
;392:		nent = G_Spawn();
ADDRLP4 32
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 393
;393:		if ( other->takedamage && other->client ) {
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
line 395
;394:
;395:			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 396
;396:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 398
;397:
;398:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 400
;399:
;400:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
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
line 401
;401:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
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
line 402
;402:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
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
line 404
;403:
;404:			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 405
;405:		} else {
ADDRGP4 $108
JUMPV
LABELV $107
line 406
;406:			VectorCopy(trace->endpos, v);
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 407
;407:			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
CNSTI4 53
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 408
;408:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTP4 0
ASGNP4
line 409
;409:		}
LABELV $108
line 411
;410:
;411:		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
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
line 413
;412:
;413:		nent->freeAfterEvent = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 415
;414:		// change over to a normal entity right at the point of impact
;415:		nent->s.eType = ET_GENERAL;
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 416
;416:		ent->s.eType = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 418
;417:
;418:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 419
;419:		G_SetOrigin( nent, v );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 421
;420:
;421:		ent->think = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 422
;422:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 424
;423:
;424:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
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
line 425
;425:		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
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
line 427
;426:
;427:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 428
;428:		trap_LinkEntity( nent );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 430
;429:
;430:		return;
ADDRGP4 $87
JUMPV
LABELV $104
line 436
;431:	}
;432:
;433:	// is it cheaper in bandwidth to just remove this ent and create a new
;434:	// one, rather than changing the missile into the explosion?
;435:
;436:	if ( other->takedamage && other->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $112
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $112
line 437
;437:		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
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
line 438
;438:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 439
;439:	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
ADDRGP4 $113
JUMPV
LABELV $112
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $114
line 440
;440:		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
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
CNSTI4 54
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 441
;441:	} else {
ADDRGP4 $115
JUMPV
LABELV $114
line 442
;442:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
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
line 443
;443:	}
LABELV $115
LABELV $113
line 445
;444:
;445:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 448
;446:
;447:	// change over to a normal entity right at the point of impact
;448:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 450
;449:
;450:	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth
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
line 452
;451:
;452:	G_SetOrigin( ent, trace->endpos );
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
line 455
;453:
;454:	// splash damage (doesn't apply to person directly hit)
;455:	if ( ent->splashDamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
CNSTI4 0
EQI4 $116
line 456
;456:		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
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
EQI4 $118
line 457
;457:			other, ent->splashMethodOfDeath ) ) {
line 458
;458:			if( !hitClient ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $120
line 459
;459:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
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
line 460
;460:			}
LABELV $120
line 461
;461:		}
LABELV $118
line 462
;462:	}
LABELV $116
line 464
;463:
;464:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 465
;465:}
LABELV $87
endproc G_MissileImpact 56 32
export G_RunMissile
proc G_RunMissile 88 28
line 472
;466:
;467:/*
;468:================
;469:G_RunMissile
;470:================
;471:*/
;472:void G_RunMissile( gentity_t *ent ) {
line 478
;473:	vec3_t		origin;
;474:	trace_t		tr;
;475:	int			passent;
;476:
;477:	
;478:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
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
line 482
;479:
;480:
;481:	// if this missile bounced off an invulnerability sphere
;482:	if ( ent->target_ent ) {
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $125
line 483
;483:		passent = ent->target_ent->s.number;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 484
;484:	}
ADDRGP4 $126
JUMPV
LABELV $125
line 491
;485:#ifdef MISSIONPACK
;486:	// prox mines that left the owner bbox will attach to anything, even the owner
;487:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;488:		passent = ENTITYNUM_NONE;
;489:	}
;490:#endif
;491:	else {
line 493
;492:		// ignore interactions with the missile owner
;493:		passent = ent->r.ownerNum;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 494
;494:	}
LABELV $126
line 496
;495:	// trace a line from the previous position to the current position
;496:	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );
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
line 498
;497:
;498:	if ( tr.startsolid || tr.allsolid ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $130
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $127
LABELV $130
line 500
;499:		// make sure the tr.entityNum is set to the entity we're stuck in
;500:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask );
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
line 501
;501:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 502
;502:	}
ADDRGP4 $128
JUMPV
LABELV $127
line 503
;503:	else {
line 504
;504:		VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 505
;505:	}
LABELV $128
line 507
;506:
;507:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 509
;508:
;509:	if ( tr.fraction != 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $133
line 511
;510:		// never explode or bounce on sky
;511:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $136
line 519
;512:			// If grapple, reset owner
;513:			/* Shafe - Trep - Comment this out for offhand grapple
;514:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
;515:				ent->parent->client->hook = NULL;
;516:			}
;517:			*/
;518:			// Shafe - Trep - Offhand Grappling Hook
;519:			if (g_gametype.integer != GT_CTF) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $139
line 520
;520:			{
line 521
;521:				if (ent->parent && ent->parent->client->hook == ent)
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
EQU4 $142
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
NEU4 $142
line 522
;522:				{
line 523
;523:					ent->parent->client->hook = NULL;
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
line 524
;524:					ent->parent->client->hookhasbeenfired = qfalse;
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
line 525
;525:					ent->parent->client->fireHeld = qfalse;
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
line 526
;526:				}
LABELV $142
line 527
;527:			}
LABELV $139
line 530
;528:			// End Shafe
;529:
;530:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 531
;531:			return;
ADDRGP4 $123
JUMPV
LABELV $136
line 533
;532:		}
;533:		G_MissileImpact( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 534
;534:		if ( ent->s.eType != ET_MISSILE ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $144
line 535
;535:			return;		// exploded
ADDRGP4 $123
JUMPV
LABELV $144
line 537
;536:		}
;537:	}
LABELV $133
line 549
;538:#ifdef MISSIONPACK
;539:	// if the prox mine wasn't yet outside the player body
;540:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;541:		// check if the prox mine is outside the owner bbox
;542:		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
;543:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;544:			ent->count = 1;
;545:		}
;546:	}
;547:#endif
;548:	// check think function after bouncing
;549:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 550
;550:}
LABELV $123
endproc G_RunMissile 88 28
export fire_plasma
proc fire_plasma 32 4
line 561
;551:
;552:
;553://=============================================================================
;554:
;555:/*
;556:=================
;557:fire_plasma
;558:
;559:=================
;560:*/
;561:gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
line 564
;562:	gentity_t	*bolt;
;563:
;564:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 566
;565:
;566:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 567
;567:	bolt->classname = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $92
ASGNP4
line 568
;568:	bolt->nextthink = level.time + 1200; //10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1200
ADDI4
ASGNI4
line 569
;569:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 570
;570:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 571
;571:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 572
;572:	bolt->s.weapon = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 573
;573:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 576
;574://unlagged - projectile nudge
;575:	// we'll need this for nudging projectiles later
;576:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 578
;577://unlagged - projectile nudge
;578:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 579
;579:	bolt->damage = 30;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 30
ASGNI4
line 580
;580:	bolt->splashDamage = 15;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 15
ASGNI4
line 581
;581:	bolt->splashRadius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 20
ASGNI4
line 582
;582:	bolt->methodOfDeath = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 8
ASGNI4
line 583
;583:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 9
ASGNI4
line 584
;584:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 585
;585:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 588
;586:
;587:	// Shafe - Make it bounce
;588:	bolt->s.eFlags = EF_BOUNCE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 16
ASGNI4
line 590
;589:
;590:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 591
;591:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 592
;592:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 593
;593:	VectorScale( dir, 2000, bolt->s.pos.trDelta );
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
line 594
;594:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 596
;595:
;596:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 598
;597:
;598:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $146
endproc fire_plasma 32 4
export G_ExplodePDGrenade
proc G_ExplodePDGrenade 8 8
line 606
;599:}	
;600:
;601://=============================================================================
;602:
;603:
;604:
;605:// Shafe - Trep 
;606:void G_ExplodePDGrenade( gentity_t *ent ) {
line 608
;607: 
;608:	if (ent->parent->istelepoint != 0)
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $150
line 609
;609:	{
line 610
;610:		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
ADDRGP4 $152
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
line 611
;611:	}
LABELV $150
line 612
;612:	ent->parent->istelepoint = 0; // client cannot teleport
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 613
;613: 	VectorClear( ent->parent->teleloc ); // clear the teleport location
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
line 616
;614:	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
;615:	
;616:	G_ExplodeMissile( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ExplodeMissile
CALLV
pop
line 617
;617:}
LABELV $149
endproc G_ExplodePDGrenade 8 8
export fire_pdgrenade
proc fire_pdgrenade 32 4
line 624
;618:/*
;619:=================
;620: fire_pdgrenade
;621: Shafe - Trep 
;622:=================
;623:*/
;624:gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 628
;625:	gentity_t	*bolt;
;626:	//vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
;627:
;628:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 630
;629: 
;630:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 631
;631:	bolt->classname = "pdgrenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $71
ASGNP4
line 632
;632:	bolt->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 633
;633:	bolt->think = G_ExplodePDGrenade;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodePDGrenade
ASGNP4
line 634
;634:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 637
;635:	//tr.surfaceFlags & SURF_NOIMPACT
;636:	
;637:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 638
;638:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 639
;639:	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 640
;640:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 644
;641:
;642:	//unlagged - projectile nudge
;643:	// we'll need this for nudging projectiles later
;644:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 647
;645:	//unlagged - projectile nudge
;646:	
;647:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 648
;648:	bolt->damage = 1;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 649
;649:	bolt->splashDamage = 0;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 650
;650:	bolt->splashRadius = 0;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 0
ASGNI4
line 651
;651:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 4
ASGNI4
line 652
;652:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 5
ASGNI4
line 653
;653:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 666
;654: 
;655:	// Make Em Shootable
;656:	/*
;657:	bolt->r.contents = CONTENTS_SHOOTABLE;
;658:	VectorCopy(mins, bolt->r.mins);
;659:	VectorCopy(maxs, bolt->r.maxs);
;660:	bolt->takedamage = qtrue;
;661:	bolt->health = 70;
;662:	bolt->die = G_ExplodePDGrenade;
;663:	//bolt-ignoresize = qtrue;
;664:	*/
;665:
;666:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 667
;667:	 bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 668
;668:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 669
;669:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 670
;670:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 672
;671: 
;672:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 674
;673: 
;674: return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $153
endproc fire_pdgrenade 32 4
export fire_grenade
proc fire_grenade 32 4
line 682
;675:}
;676:
;677:/*
;678:=================
;679:fire_grenade
;680:=================
;681:*/
;682:gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 685
;683:	gentity_t	*bolt;
;684:
;685:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 687
;686:
;687:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 688
;688:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $157
ASGNP4
line 689
;689:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 690
;690:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 691
;691:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 692
;692:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 693
;693:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 694
;694:	bolt->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 695
;695:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 698
;696://unlagged - projectile nudge
;697:	// we'll need this for nudging projectiles later
;698:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 700
;699://unlagged - projectile nudge
;700:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 701
;701:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 702
;702:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 703
;703:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 150
ASGNI4
line 704
;704:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 4
ASGNI4
line 705
;705:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 5
ASGNI4
line 706
;706:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 707
;707:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 709
;708:
;709:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 710
;710:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 711
;711:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 712
;712:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 713
;713:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 715
;714:
;715:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 717
;716:
;717:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $156
endproc fire_grenade 32 4
export fire_flame
proc fire_flame 32 4
line 728
;718:}
;719:
;720://=============================================================================
;721:
;722:/*
;723:=================
;724:fire_flame
;725:Shafe - Trep - Flame Thrower
;726:=================
;727:*/
;728:gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 732
;729:
;730:	gentity_t	*bolt;
;731:
;732:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 734
;733:
;734:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 735
;735:	bolt->classname = "flame";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $161
ASGNP4
line 736
;736:	bolt->nextthink = level.time + 1500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 737
;737:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 738
;738:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 739
;739:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 740
;740:	bolt->s.weapon = WP_LIGHTNING;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 6
ASGNI4
line 741
;741:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 744
;742://unlagged - projectile nudge
;743:	// we'll need this for nudging projectiles later
;744:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 746
;745://unlagged - projectile nudge
;746:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 749
;747:	
;748:	
;749:	if (alt == qfalse ) 
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $163
line 750
;750:	{
line 751
;751:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 25
ASGNI4
line 752
;752:		bolt->damage = 70;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 70
ASGNI4
line 753
;753:		bolt->splashDamage = 55;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 55
ASGNI4
line 754
;754:		bolt->splashRadius = 55;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 55
ASGNI4
line 755
;755:	} else
ADDRGP4 $164
JUMPV
LABELV $163
line 756
;756:	{
line 757
;757:		bolt->methodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 25
ASGNI4
line 758
;758:		bolt->damage = 30;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 30
ASGNI4
line 759
;759:		bolt->splashDamage = 25;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 25
ASGNI4
line 760
;760:		bolt->splashRadius = 45;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 45
ASGNI4
line 761
;761:	}
LABELV $164
line 763
;762:
;763:	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 25
ASGNI4
line 764
;764:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 766
;765:
;766:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 767
;767:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 768
;768:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 769
;769:	VectorScale( dir, 300, bolt->s.pos.trDelta );
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
line 770
;770:	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
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
line 772
;771:
;772:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 774
;773:
;774:return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $160
endproc fire_flame 32 4
export G_HomingMissile
proc G_HomingMissile 100 12
line 779
;775:}
;776:
;777:
;778:
;779:void G_HomingMissile( gentity_t *ent ) {
line 780
;780:	gentity_t	*target = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 781
;781:	gentity_t	*blip = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 785
;782:	vec3_t		dir, blipdir;
;783:	vec_t		dot, cs;
;784:	qboolean	chaff;
;785:	qboolean	ignorechaff = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 787
;786:
;787:	if (ent->parent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $171
line 788
;788:	{
line 789
;789:		ent->nextthink = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 790
;790:		ent->think = G_ExplodeMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 791
;791:		return;
ADDRGP4 $166
JUMPV
LABELV $170
line 795
;792:	}
;793:
;794:
;795:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
line 796
;796:			chaff = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 798
;797:
;798:			if (blip->client==NULL)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
ADDRGP4 $171
JUMPV
LABELV $173
line 799
;799:			if (blip==ent->parent)			continue;
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
NEU4 $175
ADDRGP4 $171
JUMPV
LABELV $175
line 800
;800:			if (blip->health<=0)			continue;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
GTI4 $177
ADDRGP4 $171
JUMPV
LABELV $177
line 801
;801:			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
CNSTI4 3
LTI4 $179
line 802
;802:				continue;
ADDRGP4 $171
JUMPV
LABELV $179
line 804
;803:
;804:			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $185
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $181
LABELV $185
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
EQI4 $181
line 806
;805:				OnSameTeam( blip, ent->parent ) )
;806:				continue;
ADDRGP4 $171
JUMPV
LABELV $181
line 809
;807:		
;808:
;809:		if (!visible (ent, blip))
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
NEI4 $186
line 810
;810:			continue;
ADDRGP4 $171
JUMPV
LABELV $186
line 812
;811:
;812:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
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
line 815
;813:
;814:		//NT - give chaff a higher weight
;815:		if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $190
line 816
;816:		{
line 817
;817:			VectorScale(blipdir, 0.5, blipdir);
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
line 818
;818:		}
LABELV $190
line 820
;819:
;820:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $198
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
GEF4 $196
LABELV $198
line 821
;821:		{
line 822
;822:			if (chaff)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $199
line 823
;823:			{
line 824
;824:				VectorScale(blipdir, 2, blipdir);
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
line 825
;825:			}
LABELV $199
line 828
;826:
;827:			// E.B = |E||B|cos(theta)
;828:			dot = _DotProduct(ent->r.currentAngles, blipdir);
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
line 831
;829:
;830:			// Divide E.B by |E||B| to get cos(theta)
;831:			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));
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
line 834
;832:
;833:			// If angle is less than 120 degrees
;834:			if (cs > cos(120.0f * M_PI / 180.0f))
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
LEF4 $205
line 835
;835:			{
line 837
;836:				// We add it as our target
;837:				target = blip;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
line 838
;838:				VectorCopy(blipdir, dir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 839
;839:			}
LABELV $205
line 840
;840:		}
LABELV $196
line 841
;841:	}
LABELV $171
line 795
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
NEU4 $170
line 843
;842:
;843:	if (target == NULL)	{
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
line 844
;844:		ent->nextthink = level.time + HOMING_THINK; // + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 845
;845:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 846
;846:	} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 848
;847:		// for exact trajectory calculation, set current point to base.
;848:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
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
line 850
;849:
;850:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 852
;851:		// 0.5 is swing rate.
;852:		VectorScale(dir, 0.5, dir);
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
line 853
;853:		VectorAdd(dir,ent->r.currentAngles,dir);
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
line 856
;854:
;855:		// turn nozzle to target angle
;856:		VectorNormalize(dir);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 857
;857:		VectorCopy(dir, ent->r.currentAngles);
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 860
;858:
;859:		// scale direction, put into trDelta
;860:		VectorScale(dir, ent->constantSpeed, dir);
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
line 861
;861:		VectorCopy(dir, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 863
;862:
;863:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 865
;864:
;865:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
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
line 866
;866:		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60
ADDI4
ASGNI4
line 867
;867:		ent->think = G_HomingMissile;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 868
;868:	}
LABELV $208
line 869
;869:}
LABELV $166
endproc G_HomingMissile 100 12
export fire_altgrenade
proc fire_altgrenade 32 4
line 949
;870:
;871:
;872:/*
;873:void G_HomingMissile( gentity_t *ent )
;874:{
;875:	gentity_t	*target = NULL;
;876:	gentity_t	*blip = NULL;
;877:	vec3_t  dir, blipdir, temp_dir;
;878:
;879:	while ((blip = findradius(blip, ent->r.currentOrigin, 2000)) != NULL)	{
;880:		if (blip->client==NULL)			continue;
;881:		if (blip==ent->parent)			continue;
;882:		if (blip->health<=0)			continue;
;883:		if (blip->client->sess.sessionTeam == TEAM_SPECTATOR)
;884:			continue;
;885:
;886:		if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
;887:			blip->client->sess.sessionTeam == ent->parent->client->sess.sessionTeam)
;888:			continue;
;889:		//in old code,this ent->parent->cliend-> was blip->parent->client->,
;890:		//so didn't work in CTF and team deathmatch.Now it will work.
;891:
;892:		if (!visible (ent, blip))
;893:			continue;
;894:
;895:		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
;896:		blipdir[2] += 16;
;897:		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
;898:		{
;899:			//if new target is the nearest
;900:			VectorCopy(blipdir,temp_dir);
;901:			VectorNormalize(temp_dir);
;902:			VectorAdd(temp_dir,ent->r.currentAngles,temp_dir);	
;903:			//now the longer temp_dir length is the more straight path for the rocket.
;904:			if(VectorLength(temp_dir)>1.2)
;905:			{	
;906:				//if this 1.6 were smaller,the rocket also get to target the enemy on his back.
;907:				target = blip;
;908:				VectorCopy(blipdir, dir);
;909:			}
;910:		}
;911:	}
;912:
;913:	if (target == NULL)	{	
;914:		ent->nextthink = level.time + 10000;
;915:		// if once the rocket lose target,it will not search new enemy any more,and go away.
;916:	} else {
;917:		ent->s.pos.trTime=level.time;
;918:		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
;919:		//for exact trajectory calculation,set current point to base.
;920:			
;921:		VectorNormalize(dir);
;922:		VectorScale(dir, 0.2,dir);
;923:		VectorAdd(dir,ent->r.currentAngles,dir);
;924:		// this 0.3 is swing rate.this value is cheap,I think.try 0.8 or 1.5.
;925:		// if you want fastest swing,comment out these 3 lines.
;926:
;927:		VectorNormalize(dir);
;928:		VectorCopy(dir,ent->r.currentAngles);
;929:		//locate nozzle to target
;930:
;931:		VectorScale (dir,VectorLength(ent->s.pos.trDelta)*1.1,ent->s.pos.trDelta);
;932:		//trDelta is actual vector for movement.Because the rockets slow down
;933:		// when swing large angle,so accelalate them.
;934:
;935:		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
;936:		ent->nextthink = level.time + 100;	//decrease this value also makes fast swing. -- // Shafe was 100
;937:	}
;938:}
;939:*/
;940:
;941:
;942:
;943:/*
;944:=================
;945:fire_altgrenade
;946:Shafe - Trep - Sticky Grenades for Alt
;947:=================
;948:*/
;949:gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
line 952
;950:	gentity_t	*bolt;
;951:
;952:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 954
;953:
;954:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 955
;955:	bolt->classname = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $157
ASGNP4
line 956
;956:	bolt->nextthink = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 957
;957:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 958
;958:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 959
;959:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 960
;960:	bolt->s.weapon = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 962
;961://	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
;962:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 965
;963://unlagged - projectile nudge
;964:	// we'll need this for nudging projectiles later
;965:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 967
;966://unlagged - projectile nudge
;967:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 968
;968:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 969
;969:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 970
;970:	bolt->splashRadius = 150;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 150
ASGNI4
line 971
;971:	bolt->methodOfDeath = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 4
ASGNI4
line 972
;972:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 5
ASGNI4
line 973
;973:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 974
;974:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 976
;975:
;976:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 977
;977:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 978
;978:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 979
;979:	VectorScale( dir, 700, bolt->s.pos.trDelta );
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
line 980
;980:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 982
;981:
;982:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 984
;983:
;984:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $224
endproc fire_altgrenade 32 4
export fire_bfg
proc fire_bfg 36 4
line 995
;985:}
;986:
;987://=============================================================================
;988:
;989:
;990:/*
;991:=================
;992:fire_bfg
;993:=================
;994:*/
;995:gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
line 998
;996:	gentity_t	*bolt;
;997:	int			speed;
;998:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1000
;999:
;1000:	bolt = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1001
;1001:	bolt->classname = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $228
ASGNP4
line 1035
;1002:
;1003:	// All of this stuff from the original BFG Is Just For Reference
;1004:	// CLEANME - later
;1005:		/*
;1006:	bolt->nextthink = level.time + 1000; 
;1007:	bolt->think = G_ExplodeMissile;
;1008:	bolt->s.eType = ET_MISSILE;
;1009:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
;1010:	bolt->s.weapon = WP_BFG;
;1011:	bolt->r.ownerNum = self->s.number;
;1012://unlagged - projectile nudge
;1013:	// we'll need this for nudging projectiles later
;1014:	bolt->s.otherEntityNum = self->s.number;
;1015://unlagged - projectile nudge
;1016:	bolt->parent = self;
;1017:	bolt->damage = 100;
;1018:	bolt->splashDamage = 100;
;1019:	bolt->splashRadius = 120;
;1020:	bolt->methodOfDeath = MOD_BFG;
;1021:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
;1022:	bolt->clipmask = MASK_SHOT;
;1023:	bolt->target_ent = NULL;
;1024:
;1025:	//bolt->s.pos.trType = TR_GRAVITY;
;1026:	bolt->s.pos.trType = TR_LINEAR;
;1027:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1028:	VectorCopy( start, bolt->s.pos.trBase );
;1029:	VectorScale( dir, 2000, bolt->s.pos.trDelta ); //		was 2000
;1030:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
;1031:	VectorCopy (start, bolt->r.currentOrigin);
;1032:	return bolt;
;1033:	*/
;1034:
;1035:	bolt->nextthink = level.time + 20;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1036
;1036:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1037
;1037:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1038
;1038:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1039
;1039:	bolt->s.weapon = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 1040
;1040:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1043
;1041://unlagged - projectile nudge
;1042:	// we'll need this for nudging projectiles later
;1043:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1045
;1044://unlagged - projectile nudge
;1045:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1047
;1046:	
;1047:	bolt->methodOfDeath = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 12
ASGNI4
line 1048
;1048:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 13
ASGNI4
line 1049
;1049:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 1050
;1050:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1051
;1051:	bolt->s.pos.trType = TR_ORBITAL;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 6
ASGNI4
line 1052
;1052:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1054
;1053:
;1054:	if (alt == qtrue)
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $231
line 1055
;1055:	{
line 1057
;1056:		// Alt Fire
;1057:		bolt->damage = 500;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 500
ASGNI4
line 1058
;1058:		bolt->splashDamage = 300;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 300
ASGNI4
line 1059
;1059:		bolt->splashRadius = 420;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 420
ASGNI4
line 1060
;1060:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1061
;1061:		VectorScale( dir, 325, bolt->s.pos.trDelta );
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
line 1062
;1062:	} 
ADDRGP4 $232
JUMPV
LABELV $231
line 1064
;1063:	else
;1064:	{
line 1066
;1065:		// Regular Fire
;1066:		bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 1067
;1067:		bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 1068
;1068:		bolt->splashRadius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 100
ASGNI4
line 1069
;1069:		VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1070
;1070:		VectorScale( dir, 1300, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1151500288
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1151500288
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
CNSTF4 1151500288
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1072
;1071:
;1072:	}
LABELV $232
line 1075
;1073:
;1074:	
;1075:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1076
;1076:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1078
;1077:
;1078:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $227
endproc fire_bfg 36 4
export fire_rocket
proc fire_rocket 32 4
line 1091
;1079:
;1080:
;1081:}
;1082:
;1083://=============================================================================
;1084:
;1085:
;1086:/*
;1087:=================
;1088:fire_rocket
;1089:=================
;1090:*/
;1091:gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1094
;1092:	gentity_t	*bolt;
;1093:
;1094:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1096
;1095:
;1096:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1097
;1097:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $234
ASGNP4
line 1098
;1098:	bolt->nextthink = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1099
;1099:	bolt->think = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1100
;1100:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1101
;1101:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1102
;1102:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1103
;1103:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1106
;1104://unlagged - projectile nudge
;1105:	// we'll need this for nudging projectiles later
;1106:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1108
;1107://unlagged - projectile nudge
;1108:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1109
;1109:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 1110
;1110:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 1111
;1111:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 120
ASGNI4
line 1112
;1112:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 6
ASGNI4
line 1113
;1113:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 7
ASGNI4
line 1114
;1114:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 1115
;1115:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1117
;1116:
;1117:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1118
;1118:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
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
;1120:	VectorScale( dir, 900, bolt->s.pos.trDelta );
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
line 1121
;1121:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1124
;1123:
;1124:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $233
endproc fire_rocket 32 4
lit
align 4
LABELV $238
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $239
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export fire_alt_rocket
code
proc fire_alt_rocket 68 4
line 1133
;1125:}
;1126:
;1127:
;1128:/*
;1129:=================
;1130:fire_alt_rocket
;1131:=================
;1132:*/
;1133:gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
line 1135
;1134:	gentity_t	*bolt;
;1135:	vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };
ADDRLP4 4
ADDRGP4 $238
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $239
INDIRB
ASGNB 12
line 1137
;1136:
;1137:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1139
;1138:
;1139:	bolt = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1140
;1140:	bolt->classname = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $234
ASGNP4
line 1141
;1141:	bolt->think = G_HomingMissile;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 G_HomingMissile
ASGNP4
line 1142
;1142:	bolt->nextthink = level.time + FIRST_HOMING_THINK;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1143
;1143:	bolt->lastthinktime = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 1144
;1144:	bolt->lastthink = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 1145
;1145:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1146
;1146:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1147
;1147:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 1148
;1148:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1151
;1149:	//unlagged - projectile nudge
;1150:	// we'll need this for nudging projectiles later
;1151:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1153
;1152:	//unlagged - projectile nudge
;1153:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1154
;1154:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 1155
;1155:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 100
ASGNI4
line 1156
;1156:	bolt->splashDamage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 100
ASGNI4
line 1157
;1157:	bolt->splashRadius = 120;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 120
ASGNI4
line 1158
;1158:	bolt->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 6
ASGNI4
line 1159
;1159:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 7
ASGNI4
line 1160
;1160:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 1161
;1161:	bolt->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1162
;1162:	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1022
ASGNI4
line 1166
;1163:
;1164:
;1165:
;1166:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1167
;1167:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1168
;1168:	bolt->constantSpeed = HOMING_MISSILE_SPEED;
ADDRLP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 800
ASGNI4
line 1169
;1169:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1170
;1170:	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
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
line 1171
;1171:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
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
line 1172
;1172:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1173
;1173:	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1175
;1174:
;1175:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $237
endproc fire_alt_rocket 68 4
export fire_grapple
proc fire_grapple 36 4
line 1223
;1176:
;1177:	/*
;1178:	gentity_t	*bolt;
;1179:
;1180:	VectorNormalize (dir);
;1181:
;1182:	bolt = G_Spawn();
;1183:	bolt->classname = "rocket";
;1184:	
;1185:	bolt->think = G_HomingMissile;
;1186:	bolt->nextthink = level.time + 60;
;1187:	
;1188:	bolt->s.eType = ET_MISSILE;
;1189:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
;1190:	bolt->s.weapon = WP_ROCKET_LAUNCHER;
;1191:	bolt->r.ownerNum = self->s.number;
;1192://unlagged - projectile nudge
;1193:	// we'll need this for nudging projectiles later
;1194:	bolt->s.otherEntityNum = self->s.number;
;1195://unlagged - projectile nudge
;1196:	bolt->parent = self;
;1197:	bolt->damage = 100;
;1198:	bolt->splashDamage = 100;
;1199:	bolt->splashRadius = 120;
;1200:	bolt->methodOfDeath = MOD_ROCKET;
;1201:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
;1202:	bolt->clipmask = MASK_SHOT;
;1203:	bolt->target_ent = NULL;
;1204:
;1205:	bolt->s.pos.trType = TR_LINEAR;
;1206:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1207:	VectorCopy( start, bolt->s.pos.trBase );
;1208:	VectorScale( dir, 900, bolt->s.pos.trDelta );
;1209:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
;1210:	VectorCopy (start, bolt->r.currentOrigin);
;1211:
;1212:	VectorCopy (dir, bolt->r.currentAngles);// this is new line. - Shafe -Trep
;1213:
;1214:	return bolt;
;1215:	*/
;1216:}
;1217:
;1218:/*
;1219:=================
;1220:fire_grapple
;1221:=================
;1222:*/
;1223:gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
line 1229
;1224:	gentity_t	*hook;
;1225://unlagged - grapple
;1226:	int hooktime;
;1227://unlagged - grapple
;1228:
;1229:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1231
;1230:
;1231:	hook = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1232
;1232:	hook->classname = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $106
ASGNP4
line 1233
;1233:	hook->nextthink = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1234
;1234:	hook->think = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 1235
;1235:	hook->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1236
;1236:	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 1237
;1237:	hook->s.weapon = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 1238
;1238:	hook->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1239
;1239:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 24
ASGNI4
line 1240
;1240:	hook->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100664321
ASGNI4
line 1241
;1241:	hook->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1242
;1242:	hook->target_ent = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 1246
;1243:
;1244://unlagged - grapple
;1245:	// we might want this later
;1246:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1251
;1247:
;1248:	// setting the projectile base time back makes the hook's first
;1249:	// step larger
;1250:
;1251:	if ( self->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
line 1252
;1252:		hooktime = self->client->pers.cmd.serverTime + 50;
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
line 1253
;1253:	}
ADDRGP4 $246
JUMPV
LABELV $245
line 1254
;1254:	else {
line 1255
;1255:		hooktime = level.time - MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1256
;1256:	}
LABELV $246
line 1258
;1257:
;1258:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1261
;1259://unlagged - grapple
;1260:
;1261:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1265
;1262://unlagged - grapple
;1263:	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
;1264://unlagged - grapple
;1265:	hook->s.otherEntityNum = self->s.number; // use to match beam in client
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1266
;1266:	VectorCopy( start, hook->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1267
;1267:	VectorScale( dir, 800, hook->s.pos.trDelta );
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
line 1268
;1268:	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
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
line 1269
;1269:	VectorCopy (start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1271
;1270:
;1271:	self->client->hook = hook;
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
line 1273
;1272:
;1273:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $243
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
LABELV $234
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $228
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $161
byte 1 102
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $157
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $152
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
LABELV $106
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
align 1
LABELV $92
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $72
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
LABELV $71
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
