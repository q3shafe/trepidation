// Copyright (C) 1999-2000 Id Software, Inc.
//
#include "g_local.h"

#define	MISSILE_PRESTEP_TIME	50
#define FIRST_HOMING_THINK		500
#define HOMING_THINK			60
#define HOMING_MISSILE_SPEED	800

// Shafe - Once everything works this file needs cleaned up

/*
================
G_BounceMissile

================
*/
void G_BounceMissile( gentity_t *ent, trace_t *trace ) {
	vec3_t	velocity;
	float	dot;
	int		hitTime;

	// reflect the velocity on the trace plane
	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
	dot = DotProduct( velocity, trace->plane.normal );
	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );

	if ( ent->s.eFlags & EF_BOUNCE_HALF ) {
		VectorScale( ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta );
		// check for stop
		if ( trace->plane.normal[2] > 0.2 && VectorLength( ent->s.pos.trDelta ) < 40 ) {
			G_SetOrigin( ent, trace->endpos );
				
			// Shafe - trep - pdg
			if (ent->classname == "pdgrenade") {
			    ent->parent->istelepoint = 1;
				VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
				ent->parent->teleloc[2] += 20;
			
				
				trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9Particle Displacement Grenade Lock!\n\"") );
				//G_Printf( S_COLOR_RED "Particle Displacement Grenade Lock!\n" );
			} // end shafe

			return;
		}
	}

	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
	ent->s.pos.trTime = level.time;
}


/*
================
G_ExplodeMissile

Explode a missile without an impact
================
*/
void G_ExplodeMissile( gentity_t *ent ) {
	vec3_t		dir;
	vec3_t		origin;

	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
	SnapVector( origin );
	G_SetOrigin( ent, origin );

	// we don't have a valid direction, so just point straight up
	dir[0] = dir[1] = 0;
	dir[2] = 1;

	ent->s.eType = ET_GENERAL;
	G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );

	ent->freeAfterEvent = qtrue;

	// splash damage
	if ( ent->splashDamage ) {
		if( G_RadiusDamage( ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent
			, ent->splashMethodOfDeath ) ) {
			g_entities[ent->r.ownerNum].client->accuracy_hits++;
		}
	}

	trap_LinkEntity( ent );
}


#ifdef MISSIONPACK
/*
================
ProximityMine_Explode
================
*/
static void ProximityMine_Explode( gentity_t *mine ) {
	G_ExplodeMissile( mine );
	// if the prox mine has a trigger free it
	if (mine->activator) {
		G_FreeEntity(mine->activator);
		mine->activator = NULL;
	}
}

/*
================
ProximityMine_Die
================
*/
static void ProximityMine_Die( gentity_t *ent, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
	ent->think = ProximityMine_Explode;
	ent->nextthink = level.time + 1;
}

/*
================
ProximityMine_Trigger
================
*/
void ProximityMine_Trigger( gentity_t *trigger, gentity_t *other, trace_t *trace ) {
	vec3_t		v;
	gentity_t	*mine;

	if( !other->client ) {
		return;
	}

	// trigger is a cube, do a distance test now to act as if it's a sphere
	VectorSubtract( trigger->s.pos.trBase, other->s.pos.trBase, v );
	if( VectorLength( v ) > trigger->parent->splashRadius ) {
		return;
	}


	if ( g_gametype.integer >= GT_TEAM ) {
		// don't trigger same team mines
		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
			return;
		}
	}

	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
	if( !CanDamage( other, trigger->s.pos.trBase ) ) {
		return;
	}

	// trigger the mine!
	mine = trigger->parent;
	mine->s.loopSound = 0;
	G_AddEvent( mine, EV_PROXIMITY_MINE_TRIGGER, 0 );
	mine->nextthink = level.time + 500;

	G_FreeEntity( trigger );
}

/*
================
ProximityMine_Activate
================
*/
static void ProximityMine_Activate( gentity_t *ent ) {
	gentity_t	*trigger;
	float		r;

	ent->think = ProximityMine_Explode;
	ent->nextthink = level.time + g_proxMineTimeout.integer;

	ent->takedamage = qtrue;
	ent->health = 1;
	ent->die = ProximityMine_Die;

	ent->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );

	// build the proximity trigger
	trigger = G_Spawn ();

	trigger->classname = "proxmine_trigger";

	r = ent->splashRadius;
	VectorSet( trigger->r.mins, -r, -r, -r );
	VectorSet( trigger->r.maxs, r, r, r );

	G_SetOrigin( trigger, ent->s.pos.trBase );

	trigger->parent = ent;
	trigger->r.contents = CONTENTS_TRIGGER;
	trigger->touch = ProximityMine_Trigger;

	trap_LinkEntity (trigger);

	// set pointer to trigger so the entity can be freed when the mine explodes
	ent->activator = trigger;
}

/*
================
ProximityMine_ExplodeOnPlayer
================
*/
static void ProximityMine_ExplodeOnPlayer( gentity_t *mine ) {
	gentity_t	*player;

	player = mine->enemy;
	player->client->ps.eFlags &= ~EF_TICKING;

	if ( player->client->invulnerabilityTime > level.time ) {
		G_Damage( player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED );
		player->client->invulnerabilityTime = 0;
		G_TempEntity( player->client->ps.origin, EV_JUICED );
	}
	else {
		G_SetOrigin( mine, player->s.pos.trBase );
		// make sure the explosion gets to the client
		mine->r.svFlags &= ~SVF_NOCLIENT;
		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
		G_ExplodeMissile( mine );
	}
}

/*
================
ProximityMine_Player
================
*/
static void ProximityMine_Player( gentity_t *mine, gentity_t *player ) {
	if( mine->s.eFlags & EF_NODRAW ) {
		return;
	}

	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );

	if( player->s.eFlags & EF_TICKING ) {
		player->activator->splashDamage += mine->splashDamage;
		player->activator->splashRadius *= 1.50;
		mine->think = G_FreeEntity;
		mine->nextthink = level.time;
		return;
	}

	player->client->ps.eFlags |= EF_TICKING;
	player->activator = mine;

	mine->s.eFlags |= EF_NODRAW;
	mine->r.svFlags |= SVF_NOCLIENT;
	mine->s.pos.trType = TR_LINEAR;
	VectorClear( mine->s.pos.trDelta );

	mine->enemy = player;
	mine->think = ProximityMine_ExplodeOnPlayer;
	if ( player->client->invulnerabilityTime > level.time ) {
		mine->nextthink = level.time + 2 * 1000;
	}
	else {
		mine->nextthink = level.time + 10 * 1000;
	}
}
#endif

/*
================
G_MissileImpact
================
*/
void G_MissileImpact( gentity_t *ent, trace_t *trace ) {
	gentity_t		*other;
	qboolean		hitClient = qfalse;
#ifdef MISSIONPACK
	vec3_t			forward, impactpoint, bouncedir;
	int				eFlags;
#endif
	other = &g_entities[trace->entityNum];

	// check for bounce
	if ( !other->takedamage &&
		( ent->s.eFlags & ( EF_BOUNCE | EF_BOUNCE_HALF ) ) ) {
		G_BounceMissile( ent, trace );
		G_AddEvent( ent, EV_GRENADE_BOUNCE, 0 );
		return;
	}

	// Shafe - trep - pdg - Only if not ET_MISSILE
	/*
	ent->parent->istelepoint = 1;
	VectorCopy(ent->r.currentOrigin, ent->parent->teleloc);
	ent->parent->teleloc[2] += 8;
	*/
	// End Shafe

#ifdef MISSIONPACK
	if ( other->takedamage ) {
		if ( ent->s.weapon != WP_PROX_LAUNCHER ) {
			if ( other->client && other->client->invulnerabilityTime > level.time ) {
				//
				VectorCopy( ent->s.pos.trDelta, forward );
				VectorNormalize( forward );
				if (G_InvulnerabilityEffect( other, forward, ent->s.pos.trBase, impactpoint, bouncedir )) {
					VectorCopy( bouncedir, trace->plane.normal );
					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
					ent->s.eFlags &= ~EF_BOUNCE_HALF;
					G_BounceMissile( ent, trace );
					ent->s.eFlags |= eFlags;
				}
				ent->target_ent = other;
				return;
			}
		}
	}
#endif
	// impact damage
	if (other->takedamage) {
		// FIXME: wrong damage direction?
		if ( ent->damage ) {
			vec3_t	velocity;

			if( LogAccuracyHit( other, &g_entities[ent->r.ownerNum] ) ) {
				g_entities[ent->r.ownerNum].client->accuracy_hits++;
				hitClient = qtrue;
			}
			BG_EvaluateTrajectoryDelta( &ent->s.pos, level.time, velocity );
			if ( VectorLength( velocity ) == 0 ) {
				velocity[2] = 1;	// stepped on a grenade
			}
			G_Damage (other, ent, &g_entities[ent->r.ownerNum], velocity,
				ent->s.origin, ent->damage, 
				0, ent->methodOfDeath);
		}
	}

#ifdef MISSIONPACK
	if( ent->s.weapon == WP_PROX_LAUNCHER ) {
		if( ent->s.pos.trType != TR_GRAVITY ) {
			return;
		}

		// if it's a player, stick it on to them (flag them and remove this entity)
		if( other->s.eType == ET_PLAYER && other->health > 0 ) {
			ProximityMine_Player( ent, other );
			return;
		}

		SnapVectorTowards( trace->endpos, ent->s.pos.trBase );
		G_SetOrigin( ent, trace->endpos );
		ent->s.pos.trType = TR_STATIONARY;
		VectorClear( ent->s.pos.trDelta );

		G_AddEvent( ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags );

		ent->think = ProximityMine_Activate;
		ent->nextthink = level.time + 2000;

		vectoangles( trace->plane.normal, ent->s.angles );
		ent->s.angles[0] += 90;

		// link the prox mine to the other entity
		ent->enemy = other;
		ent->die = ProximityMine_Die;
		VectorCopy(trace->plane.normal, ent->movedir);
		VectorSet(ent->r.mins, -4, -4, -4);
		VectorSet(ent->r.maxs, 4, 4, 4);
		trap_LinkEntity(ent);

		return;
	}
#endif

	if (!strcmp(ent->classname, "hook")) {
		gentity_t *nent;
		vec3_t v;

		nent = G_Spawn();
		if ( other->takedamage && other->client ) {

			G_AddEvent( nent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
			nent->s.otherEntityNum = other->s.number;

			ent->enemy = other;

			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;

			SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth
		} else {
			VectorCopy(trace->endpos, v);
			G_AddEvent( nent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
			ent->enemy = NULL;
		}

		SnapVectorTowards( v, ent->s.pos.trBase );	// save net bandwidth

		nent->freeAfterEvent = qtrue;
		// change over to a normal entity right at the point of impact
		nent->s.eType = ET_GENERAL;
		ent->s.eType = ET_GRAPPLE;

		G_SetOrigin( ent, v );
		G_SetOrigin( nent, v );

		ent->think = Weapon_HookThink;
		ent->nextthink = level.time + FRAMETIME;

		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
		VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);

		trap_LinkEntity( ent );
		trap_LinkEntity( nent );

		return;
	}

	// is it cheaper in bandwidth to just remove this ent and create a new
	// one, rather than changing the missile into the explosion?

	if ( other->takedamage && other->client ) {
		G_AddEvent( ent, EV_MISSILE_HIT, DirToByte( trace->plane.normal ) );
		ent->s.otherEntityNum = other->s.number;
	} else if( trace->surfaceFlags & SURF_METALSTEPS ) {
		G_AddEvent( ent, EV_MISSILE_MISS_METAL, DirToByte( trace->plane.normal ) );
	} else {
		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( trace->plane.normal ) );
	}

	ent->freeAfterEvent = qtrue;

	// change over to a normal entity right at the point of impact
	ent->s.eType = ET_GENERAL;

	SnapVectorTowards( trace->endpos, ent->s.pos.trBase );	// save net bandwidth

	G_SetOrigin( ent, trace->endpos );

	// splash damage (doesn't apply to person directly hit)
	if ( ent->splashDamage ) {
		if( G_RadiusDamage( trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, 
			other, ent->splashMethodOfDeath ) ) {
			if( !hitClient ) {
				g_entities[ent->r.ownerNum].client->accuracy_hits++;
			}
		}
	}

	trap_LinkEntity( ent );
}

/*
================
G_RunMissile
================
*/
void G_RunMissile( gentity_t *ent ) {
	vec3_t		origin;
	trace_t		tr;
	int			passent;

	
	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );


	// if this missile bounced off an invulnerability sphere
	if ( ent->target_ent ) {
		passent = ent->target_ent->s.number;
	}
#ifdef MISSIONPACK
	// prox mines that left the owner bbox will attach to anything, even the owner
	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
		passent = ENTITYNUM_NONE;
	}
#endif
	else {
		// ignore interactions with the missile owner
		passent = ent->r.ownerNum;
	}
	// trace a line from the previous position to the current position
	trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask );

	if ( tr.startsolid || tr.allsolid ) {
		// make sure the tr.entityNum is set to the entity we're stuck in
		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask );
		tr.fraction = 0;
	}
	else {
		VectorCopy( tr.endpos, ent->r.currentOrigin );
	}

	trap_LinkEntity( ent );

	if ( tr.fraction != 1 ) {
		// never explode or bounce on sky
		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
			// If grapple, reset owner
			/* Shafe - Trep - Comment this out for offhand grapple
			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
				ent->parent->client->hook = NULL;
			}
			*/
			// Shafe - Trep - Offhand Grappling Hook
			if (g_gametype.integer != GT_CTF) 
			{
				if (ent->parent && ent->parent->client->hook == ent)
				{
					ent->parent->client->hook = NULL;
					ent->parent->client->hookhasbeenfired = qfalse;
					ent->parent->client->fireHeld = qfalse;
				}
			}
			// End Shafe

			G_FreeEntity( ent );
			return;
		}
		G_MissileImpact( ent, &tr );
		if ( ent->s.eType != ET_MISSILE ) {
			return;		// exploded
		}
	}
#ifdef MISSIONPACK
	// if the prox mine wasn't yet outside the player body
	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
		// check if the prox mine is outside the owner bbox
		trap_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask );
		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
			ent->count = 1;
		}
	}
#endif
	// check think function after bouncing
	G_RunThink( ent );
}


//=============================================================================

/*
=================
fire_plasma

=================
*/
gentity_t *fire_plasma (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "plasma";
	bolt->nextthink = level.time + 1000; //10000;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_PLASMAGUN;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 30;
	bolt->splashDamage = 15;
	bolt->splashRadius = 20;
	bolt->methodOfDeath = MOD_PLASMA;
	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	// Shafe - Make it bounce
	bolt->s.eFlags = EF_BOUNCE;

	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 2000, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth

	VectorCopy (start, bolt->r.currentOrigin);

	return bolt;
}	

//=============================================================================



// Shafe - Trep 
void G_ExplodePDGrenade( gentity_t *ent ) {
 
	if (ent->parent->istelepoint != 0)
	{
		trap_SendServerCommand( ent->r.ownerNum, va("cp \"^9PDG Lock Expired!\n\"") );
	}
	ent->parent->istelepoint = 0; // client cannot teleport
 	VectorClear( ent->parent->teleloc ); // clear the teleport location
	//G_Printf( S_COLOR_GREEN "Particle Displacement Grenade Expired\n" );
	
	G_ExplodeMissile( ent );
}
/*
=================
 fire_pdgrenade
 Shafe - Trep 
=================
*/
gentity_t *fire_pdgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*bolt;
	
	
	VectorNormalize (dir);
 
	bolt = G_Spawn();
	bolt->classname = "pdgrenade";
	bolt->nextthink = level.time + 30000;
	bolt->think = G_ExplodePDGrenade;
	bolt->s.eType = ET_MISSILE;
	//tr.surfaceFlags & SURF_NOIMPACT
	
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_GRENADE_LAUNCHER;
	bolt->s.eFlags = EF_BOUNCE_HALF;  // Get rid of this for no bounce
	bolt->r.ownerNum = self->s.number;

	//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
	//unlagged - projectile nudge
	
	bolt->parent = self;
	bolt->damage = 1;
	bolt->splashDamage = 0;
	bolt->splashRadius = 0;
	bolt->methodOfDeath = MOD_GRENADE;
	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
	bolt->clipmask = MASK_SHOT;
 
	bolt->s.pos.trType = TR_GRAVITY;
	 bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 700, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );// save net bandwidth
 
	VectorCopy (start, bolt->r.currentOrigin);
 
 return bolt;
}

/*
=================
fire_grenade
=================
*/
gentity_t *fire_grenade (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "grenade";
	bolt->nextthink = level.time + 2500;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_GRENADE_LAUNCHER;
	bolt->s.eFlags = EF_BOUNCE_HALF;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 100;
	bolt->splashDamage = 100;
	bolt->splashRadius = 150;
	bolt->methodOfDeath = MOD_GRENADE;
	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	bolt->s.pos.trType = TR_GRAVITY;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 700, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth

	VectorCopy (start, bolt->r.currentOrigin);

	return bolt;
}

//=============================================================================

/*
=================
fire_flame
Shafe - Trep - Flame Thrower
=================
*/
gentity_t *fire_flame (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {

	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "flame";
	bolt->nextthink = level.time + 1500;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_LIGHTNING;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	
	
	if (alt == qfalse ) 
	{
		bolt->methodOfDeath = MOD_ALTFLAMER;
		bolt->damage = 70;
		bolt->splashDamage = 55;
		bolt->splashRadius = 55;
	} else
	{
		bolt->methodOfDeath = MOD_ALTFLAMER;
		bolt->damage = 30;
		bolt->splashDamage = 25;
		bolt->splashRadius = 45;
	}

	bolt->splashMethodOfDeath = MOD_ALTFLAMER;
	bolt->clipmask = MASK_SHOT;

	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 300, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );// save net bandwidth

	VectorCopy (start, bolt->r.currentOrigin);

return bolt;
}



void G_HomingMissile( gentity_t *ent ) {
	gentity_t	*target = NULL;
	gentity_t	*blip = NULL;
	vec3_t		dir, blipdir;
	vec_t		dot, cs;
	qboolean	chaff;
	qboolean	ignorechaff = qfalse;

	if (ent->parent->health <= 0)
	{
		ent->nextthink = level.time + 4000;
		ent->think = G_ExplodeMissile;
		return;
	}


	while ((blip = findradius(blip, ent->r.currentOrigin, 2000 * 2000)) != NULL)	{
			chaff = qfalse;

			if (blip->client==NULL)			continue;
			if (blip==ent->parent)			continue;
			if (blip->health<=0)			continue;
			if (blip->client->sess.sessionTeam >= TEAM_SPECTATOR)
				continue;

			if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
				OnSameTeam( blip, ent->parent ) )
				continue;
		

		if (!visible (ent, blip))
			continue;

		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);

		//NT - give chaff a higher weight
		if (chaff)
		{
			VectorScale(blipdir, 0.5, blipdir);
		}

		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
		{
			if (chaff)
			{
				VectorScale(blipdir, 2, blipdir);
			}

			// E.B = |E||B|cos(theta)
			dot = _DotProduct(ent->r.currentAngles, blipdir);

			// Divide E.B by |E||B| to get cos(theta)
			cs = dot / (VectorLength(ent->r.currentAngles) * VectorLength(blipdir));

			// If angle is less than 120 degrees
			if (cs > cos(120.0f * M_PI / 180.0f))
			{
				// We add it as our target
				target = blip;
				VectorCopy(blipdir, dir);
			}
		}
	}

	if (target == NULL)	{
		ent->nextthink = level.time + HOMING_THINK; // + 10000;
		ent->think = G_HomingMissile;
	} else {
		// for exact trajectory calculation, set current point to base.
		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );

		VectorNormalize(dir);
		// 0.5 is swing rate.
		VectorScale(dir, 0.5, dir);
		VectorAdd(dir,ent->r.currentAngles,dir);

		// turn nozzle to target angle
		VectorNormalize(dir);
		VectorCopy(dir, ent->r.currentAngles);

		// scale direction, put into trDelta
		VectorScale(dir, ent->constantSpeed, dir);
		VectorCopy(dir, ent->s.pos.trDelta);

		ent->s.pos.trTime = level.time;

		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
		ent->nextthink = level.time + HOMING_THINK;	// decrease this value also makes fast swing
		ent->think = G_HomingMissile;
	}
}


/*
void G_HomingMissile( gentity_t *ent )
{
	gentity_t	*target = NULL;
	gentity_t	*blip = NULL;
	vec3_t  dir, blipdir, temp_dir;

	while ((blip = findradius(blip, ent->r.currentOrigin, 2000)) != NULL)	{
		if (blip->client==NULL)			continue;
		if (blip==ent->parent)			continue;
		if (blip->health<=0)			continue;
		if (blip->client->sess.sessionTeam == TEAM_SPECTATOR)
			continue;

		if ((g_gametype.integer == GT_TEAM || g_gametype.integer == GT_CTF) &&
			blip->client->sess.sessionTeam == ent->parent->client->sess.sessionTeam)
			continue;
		//in old code,this ent->parent->cliend-> was blip->parent->client->,
		//so didn't work in CTF and team deathmatch.Now it will work.

		if (!visible (ent, blip))
			continue;

		VectorSubtract(blip->r.currentOrigin, ent->r.currentOrigin, blipdir);
		blipdir[2] += 16;
		if ((target == NULL) || (VectorLength(blipdir) < VectorLength(dir)))
		{
			//if new target is the nearest
			VectorCopy(blipdir,temp_dir);
			VectorNormalize(temp_dir);
			VectorAdd(temp_dir,ent->r.currentAngles,temp_dir);	
			//now the longer temp_dir length is the more straight path for the rocket.
			if(VectorLength(temp_dir)>1.2)
			{	
				//if this 1.6 were smaller,the rocket also get to target the enemy on his back.
				target = blip;
				VectorCopy(blipdir, dir);
			}
		}
	}

	if (target == NULL)	{	
		ent->nextthink = level.time + 10000;
		// if once the rocket lose target,it will not search new enemy any more,and go away.
	} else {
		ent->s.pos.trTime=level.time;
		VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase );
		//for exact trajectory calculation,set current point to base.
			
		VectorNormalize(dir);
		VectorScale(dir, 0.2,dir);
		VectorAdd(dir,ent->r.currentAngles,dir);
		// this 0.3 is swing rate.this value is cheap,I think.try 0.8 or 1.5.
		// if you want fastest swing,comment out these 3 lines.

		VectorNormalize(dir);
		VectorCopy(dir,ent->r.currentAngles);
		//locate nozzle to target

		VectorScale (dir,VectorLength(ent->s.pos.trDelta)*1.1,ent->s.pos.trDelta);
		//trDelta is actual vector for movement.Because the rockets slow down
		// when swing large angle,so accelalate them.

		SnapVector (ent->s.pos.trDelta);                      // save net bandwidth
		ent->nextthink = level.time + 100;	//decrease this value also makes fast swing. -- // Shafe was 100
	}
}
*/



/*
=================
fire_altgrenade
Shafe - Trep - Sticky Grenades for Alt
=================
*/
gentity_t *fire_altgrenade (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "grenade";
	bolt->nextthink = level.time + 2500;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_GRENADE_LAUNCHER;
//	bolt->s.eFlags = EF_BOUNCE_HALF;  // Simple Change
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 100;
	bolt->splashDamage = 100;
	bolt->splashRadius = 150;
	bolt->methodOfDeath = MOD_GRENADE;
	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	bolt->s.pos.trType = TR_GRAVITY;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 700, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth

	VectorCopy (start, bolt->r.currentOrigin);

	return bolt;
}

//=============================================================================


/*
=================
fire_bfg
=================
*/
gentity_t *fire_bfg (gentity_t *self, vec3_t start, vec3_t dir, qboolean alt) {
	gentity_t	*bolt;
	int			speed;
	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "bfg";

	// All of this stuff from the original BFG Is Just For Reference
	// CLEANME - later
		/*
	bolt->nextthink = level.time + 1000; 
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_BFG;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 100;
	bolt->splashDamage = 100;
	bolt->splashRadius = 120;
	bolt->methodOfDeath = MOD_BFG;
	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	//bolt->s.pos.trType = TR_GRAVITY;
	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 2000, bolt->s.pos.trDelta ); //		was 2000
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
	VectorCopy (start, bolt->r.currentOrigin);
	return bolt;
	*/

	bolt->nextthink = level.time + 20;
	bolt->think = G_HomingMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_BFG;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	
	bolt->methodOfDeath = MOD_BFG;
	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;
	bolt->s.pos.trType = TR_ORBITAL;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame

	if (alt == qtrue)
	{
		// Alt Fire
		bolt->damage = 500;
		bolt->splashDamage = 300;
		bolt->splashRadius = 420;
		VectorCopy( start, bolt->s.pos.trBase );
		VectorScale( dir, 325, bolt->s.pos.trDelta );
	} 
	else
	{
		// Regular Fire
		bolt->damage = 100;
		bolt->splashDamage = 100;
		bolt->splashRadius = 100;
		VectorCopy( start, bolt->s.pos.trBase );
		VectorScale( dir, 1300, bolt->s.pos.trDelta );

	}

	
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
	VectorCopy (start, bolt->r.currentOrigin);

	return bolt;


}

//=============================================================================


/*
=================
fire_rocket
=================
*/
gentity_t *fire_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "rocket";
	bolt->nextthink = level.time + 15000;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_ROCKET_LAUNCHER;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 100;
	bolt->splashDamage = 100;
	bolt->splashRadius = 120;
	bolt->methodOfDeath = MOD_ROCKET;
	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 900, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
	VectorCopy (start, bolt->r.currentOrigin);

	return bolt;
}


/*
=================
fire_alt_rocket
=================
*/
gentity_t *fire_alt_rocket (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*bolt;
	vec3_t		mins = { -8, -8, -8 }, maxs = { 8, 8, 8 };

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "rocket";
	bolt->think = G_HomingMissile;
	bolt->nextthink = level.time + FIRST_HOMING_THINK;
	bolt->lastthinktime = level.time + 15000;
	bolt->lastthink = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_ROCKET_LAUNCHER;
	bolt->r.ownerNum = self->s.number;
	//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
	//unlagged - projectile nudge
	bolt->parent = self;
	bolt->clipmask = MASK_SHOT;
	bolt->damage = 100;
	bolt->splashDamage = 100;
	bolt->splashRadius = 120;
	bolt->methodOfDeath = MOD_ROCKET;
	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;
	bolt->s.otherEntityNum2 = ENTITYNUM_WORLD;



	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	bolt->constantSpeed = HOMING_MISSILE_SPEED;
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, bolt->constantSpeed, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
	VectorCopy (start, bolt->r.currentOrigin);
	VectorCopy (dir, bolt->r.currentAngles);		// this is new line.

	return bolt;

	/*
	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "rocket";
	
	bolt->think = G_HomingMissile;
	bolt->nextthink = level.time + 60;
	
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_ROCKET_LAUNCHER;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 100;
	bolt->splashDamage = 100;
	bolt->splashRadius = 120;
	bolt->methodOfDeath = MOD_ROCKET;
	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 900, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
	VectorCopy (start, bolt->r.currentOrigin);

	VectorCopy (dir, bolt->r.currentAngles);// this is new line. - Shafe -Trep

	return bolt;
	*/
}

/*
=================
fire_grapple
=================
*/
gentity_t *fire_grapple (gentity_t *self, vec3_t start, vec3_t dir) {
	gentity_t	*hook;
//unlagged - grapple
	int hooktime;
//unlagged - grapple

	VectorNormalize (dir);

	hook = G_Spawn();
	hook->classname = "hook";
	hook->nextthink = level.time + 10000;
	hook->think = Weapon_HookFree;
	hook->s.eType = ET_MISSILE;
	hook->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	hook->s.weapon = WP_GRAPPLING_HOOK;
	hook->r.ownerNum = self->s.number;
	hook->methodOfDeath = MOD_GRAPPLE;
	hook->clipmask = MASK_SHOT;
	hook->parent = self;
	hook->target_ent = NULL;

//unlagged - grapple
	// we might want this later
	hook->s.otherEntityNum = self->s.number;

	// setting the projectile base time back makes the hook's first
	// step larger

	if ( self->client ) {
		hooktime = self->client->pers.cmd.serverTime + 50;
	}
	else {
		hooktime = level.time - MISSILE_PRESTEP_TIME;
	}

	hook->s.pos.trTime = hooktime;
//unlagged - grapple

	hook->s.pos.trType = TR_LINEAR;
//unlagged - grapple
	//hook->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
//unlagged - grapple
	hook->s.otherEntityNum = self->s.number; // use to match beam in client
	VectorCopy( start, hook->s.pos.trBase );
	VectorScale( dir, 800, hook->s.pos.trDelta );
	SnapVector( hook->s.pos.trDelta );			// save net bandwidth
	VectorCopy (start, hook->r.currentOrigin);

	self->client->hook = hook;

	return hook;
}


#ifdef MISSIONPACK
/*
=================
fire_nail
=================
*/
#define NAILGUN_SPREAD	500

gentity_t *fire_nail( gentity_t *self, vec3_t start, vec3_t forward, vec3_t right, vec3_t up ) {
	gentity_t	*bolt;
	vec3_t		dir;
	vec3_t		end;
	float		r, u, scale;

	bolt = G_Spawn();
	bolt->classname = "nail";
	bolt->nextthink = level.time + 10000;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_NAILGUN;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 20;
	bolt->methodOfDeath = MOD_NAIL;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;

	bolt->s.pos.trType = TR_LINEAR;
	bolt->s.pos.trTime = level.time;
	VectorCopy( start, bolt->s.pos.trBase );

	r = random() * M_PI * 2.0f;
	u = sin(r) * crandom() * NAILGUN_SPREAD * 16;
	r = cos(r) * crandom() * NAILGUN_SPREAD * 16;
	VectorMA( start, 8192 * 16, forward, end);
	VectorMA (end, r, right, end);
	VectorMA (end, u, up, end);
	VectorSubtract( end, start, dir );
	VectorNormalize( dir );

	scale = 555 + random() * 1800;
	VectorScale( dir, scale, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );

	VectorCopy( start, bolt->r.currentOrigin );

	return bolt;
}	


/*
=================
fire_prox
=================
*/
gentity_t *fire_prox( gentity_t *self, vec3_t start, vec3_t dir ) {
	gentity_t	*bolt;

	VectorNormalize (dir);

	bolt = G_Spawn();
	bolt->classname = "prox mine";
	bolt->nextthink = level.time + 3000;
	bolt->think = G_ExplodeMissile;
	bolt->s.eType = ET_MISSILE;
	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
	bolt->s.weapon = WP_PROX_LAUNCHER;
	bolt->s.eFlags = 0;
	bolt->r.ownerNum = self->s.number;
//unlagged - projectile nudge
	// we'll need this for nudging projectiles later
	bolt->s.otherEntityNum = self->s.number;
//unlagged - projectile nudge
	bolt->parent = self;
	bolt->damage = 0;
	bolt->splashDamage = 100;
	bolt->splashRadius = 150;
	bolt->methodOfDeath = MOD_PROXIMITY_MINE;
	bolt->splashMethodOfDeath = MOD_PROXIMITY_MINE;
	bolt->clipmask = MASK_SHOT;
	bolt->target_ent = NULL;
	// count is used to check if the prox mine left the player bbox
	// if count == 1 then the prox mine left the player bbox and can attack to it
	bolt->count = 0;

	//FIXME: we prolly wanna abuse another field
	bolt->s.generic1 = self->client->sess.sessionTeam;

	bolt->s.pos.trType = TR_GRAVITY;
	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;		// move a bit on the very first frame
	VectorCopy( start, bolt->s.pos.trBase );
	VectorScale( dir, 700, bolt->s.pos.trDelta );
	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth

	VectorCopy (start, bolt->r.currentOrigin);

	return bolt;
}
#endif
