// Copyright (C) 1999-2000 Id Software, Inc.
//
// g_weapon.c 
// perform the server side effects of a weapon firing

#include "g_local.h"
static	float	s_quadFactor;
static	vec3_t	forward, right, up;
static	vec3_t	muzzle;

#define NUM_NAILSHOTS 15




/*
================
G_BounceProjectile
================
*/
void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
	vec3_t v, newv;
	float dot;

	VectorSubtract( impact, start, v );
	dot = DotProduct( v, dir );
	VectorMA( v, -2*dot, dir, newv );

	VectorNormalize(newv);
	VectorMA(impact, 8192, newv, endout);
}


/*
======================================================================

GAUNTLET

======================================================================
*/

void Weapon_Gauntlet( gentity_t *ent ) {

}

/*
===============
CheckGauntletAttack
===============
*/
qboolean CheckGauntletAttack( gentity_t *ent ) {
	trace_t		tr;
	vec3_t		end;
	gentity_t	*tent;
	gentity_t	*traceEnt;
	int			damage;

	// set aiming directions
	AngleVectors (ent->client->ps.viewangles, forward, right, up);

	CalcMuzzlePoint ( ent, forward, right, up, muzzle );

	VectorMA (muzzle, 32, forward, end);

	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
		return qfalse;
	}

	traceEnt = &g_entities[ tr.entityNum ];

	// send blood impact
	if ( traceEnt->takedamage && traceEnt->client ) {
		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
		tent->s.otherEntityNum = traceEnt->s.number;
		tent->s.eventParm = DirToByte( tr.plane.normal );
		tent->s.weapon = ent->s.weapon;
	}

	if ( !traceEnt->takedamage) {
		return qfalse;
	}

	if (ent->client->ps.powerups[PW_QUAD] ) {
		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
		s_quadFactor = g_quadfactor.value;
	} else {
		s_quadFactor = 1;
	}
#ifdef MISSIONPACK
	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
		s_quadFactor *= 2;
	}
#endif

	damage = 50 * s_quadFactor;
	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
		damage, 0, MOD_GAUNTLET );

	return qtrue;
}


//
//=======================================================================
//FLAME_THROWER
//Shafe - Trep - Flame Thrower
//=======================================================================
//
void Weapon_fire_flame (gentity_t *ent, qboolean alt ) {
	gentity_t	*m;

	m = fire_flame(ent, muzzle, forward, alt);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;
}	


/*
======================================================================

MACHINEGUN

======================================================================
*/

/*
======================
SnapVectorTowards

Round a vector to integers for more efficient network
transmission, but make sure that it rounds towards a given point
rather than blindly truncating.  This prevents it from truncating 
into a wall.
======================
*/
//unlagged - attack prediction #3
// moved to q_shared.c
/*
void SnapVectorTowards( vec3_t v, vec3_t to ) {
	int		i;

	for ( i = 0 ; i < 3 ; i++ ) {
		if ( to[i] <= v[i] ) {
			v[i] = (int)v[i];
		} else {
			v[i] = (int)v[i] + 1;
		}
	}
}
*/
//unlagged - attack prediction #3


/*
=======================================================================
MACHINE GUN
=======================================================================
*/
void Weapon_fire_mg (gentity_t *ent, qboolean alt ) {
	gentity_t *m;

	m = fire_mg(ent, muzzle, forward, alt);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;
}



#ifdef MISSIONPACK
#define CHAINGUN_SPREAD		600
#endif
#define MACHINEGUN_SPREAD	64
#define	MACHINEGUN_DAMAGE	7
#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay

void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
	trace_t		tr;
	vec3_t		end;
#ifdef MISSIONPACK
	vec3_t		impactpoint, bouncedir;
#endif
	float		r;
	float		u;
	gentity_t	*tent;
	gentity_t	*traceEnt;
	int			i, passent;

//unlagged - attack prediction #2
	// we have to use something now that the client knows in advance
	int			seed = ent->client->attackTime % 256;
//unlagged - attack prediction #2

	damage *= s_quadFactor;

//unlagged - attack prediction #2
	// this has to match what's on the client
/*
	r = random() * M_PI * 2.0f;
	u = sin(r) * crandom() * spread * 16;
	r = cos(r) * crandom() * spread * 16;
*/
	r = Q_random(&seed) * M_PI * 2.0f;
	u = sin(r) * Q_crandom(&seed) * spread * 16;
	r = cos(r) * Q_crandom(&seed) * spread * 16;
//unlagged - attack prediction #2
	VectorMA (muzzle, 8192*16, forward, end);
	VectorMA (end, r, right, end);
	VectorMA (end, u, up, end);

	passent = ent->s.number;
	for (i = 0; i < 10; i++) {

//unlagged - backward reconciliation #2
		// backward-reconcile the other clients
		G_DoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);

//unlagged - backward reconciliation #2
		// put them back
		G_UndoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
			return;
		}

		traceEnt = &g_entities[ tr.entityNum ];

		// snap the endpos to integers, but nudged towards the line
		SnapVectorTowards( tr.endpos, muzzle );

		// send bullet impact
		if ( traceEnt->takedamage && traceEnt->client ) {
			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
			tent->s.eventParm = traceEnt->s.number;
//unlagged - attack prediction #2
			// we need the client number to determine whether or not to
			// suppress this event
			tent->s.clientNum = ent->s.clientNum;
//unlagged - attack prediction #2
			if( LogAccuracyHit( traceEnt, ent ) ) {
				ent->client->accuracy_hits++;
			}
		} else {
			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
			tent->s.eventParm = DirToByte( tr.plane.normal );
//unlagged - attack prediction #2
			// we need the client number to determine whether or not to
			// suppress this event
			tent->s.clientNum = ent->s.clientNum;
//unlagged - attack prediction #2
		}
		tent->s.otherEntityNum = ent->s.number;

		if ( traceEnt->takedamage) {
#ifdef MISSIONPACK
			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
					VectorCopy( impactpoint, muzzle );
					// the player can hit him/herself with the bounced rail
					passent = ENTITYNUM_NONE;
				}
				else {
					VectorCopy( tr.endpos, muzzle );
					passent = traceEnt->s.number;
				}
				continue;
			}
			else {
#endif
				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
					damage, 0, MOD_MACHINEGUN);
#ifdef MISSIONPACK
			}
#endif
		}
		break;
	}
}


/*
======================================================================

BFG

======================================================================
*/

void BFG_Fire ( gentity_t *ent, qboolean alt ) {
	gentity_t	*m;

	// Alt Fire Shoots Upward Just A Bit MOre
	if (alt == qtrue)
	{
		forward[2] += 0.2f;
	}
	
	forward[2] += 0.2f;


	
	VectorNormalize( forward );
	m = fire_bfg (ent, muzzle, forward, alt);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}


/*
======================================================================

SHOTGUN

======================================================================
*/

// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
// client predicts same spreads
#define	DEFAULT_SHOTGUN_DAMAGE	10

qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent, qboolean alt ) {
	trace_t		tr;
	int			damage, i, passent;
	gentity_t	*traceEnt;
#ifdef MISSIONPACK
	vec3_t		impactpoint, bouncedir;
#endif
	vec3_t		tr_start, tr_end;

	passent = ent->s.number;
	VectorCopy( start, tr_start );
	VectorCopy( end, tr_end );
	for (i = 0; i < 10; i++) {
		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
		traceEnt = &g_entities[ tr.entityNum ];

		// send bullet impact
		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
			return qfalse;
		}

		if ( traceEnt->takedamage) {
		
				damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
		
		
			
#ifdef MISSIONPACK
			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
					VectorCopy( impactpoint, tr_start );
					// the player can hit him/herself with the bounced rail
					passent = ENTITYNUM_NONE;
				}
				else {
					VectorCopy( tr.endpos, tr_start );
					passent = traceEnt->s.number;
				}
				continue;
			}
			else {
				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
					damage, 0, MOD_SHOTGUN);
				if( LogAccuracyHit( traceEnt, ent ) ) {
					return qtrue;
				}
			}
#else
			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
				if( LogAccuracyHit( traceEnt, ent ) ) {
					return qtrue;
				}
#endif
		}
		return qfalse;
	}
	return qfalse;
}

// this should match CG_ShotgunPattern
void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent, qboolean alt ) {
	int			i;
	float		r, u;
	vec3_t		end;
	vec3_t		forward, right, up;
	int			oldScore;
	qboolean	hitClient = qfalse;

//unlagged - attack prediction #2
	// use this for testing
	//Com_Printf( "Server seed: %d\n", seed );
//unlagged - attack prediction #2

	// derive the right and up vectors from the forward vector, because
	// the client won't have any other information
	VectorNormalize2( origin2, forward );
	PerpendicularVector( right, forward );
	CrossProduct( forward, right, up );

	oldScore = ent->client->ps.persistant[PERS_SCORE];

//unlagged - backward reconciliation #2
	// backward-reconcile the other clients
	G_DoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

	

	// generate the "random" spread pattern
		for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
			r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
			u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
			VectorMA( origin, 8192 * 16, forward, end);
			VectorMA (end, r, right, end);
			VectorMA (end, u, up, end);
			if( ShotgunPellet( origin, end, ent, alt ) && !hitClient ) {
				hitClient = qtrue;
				ent->client->accuracy_hits++;
			}
		}

//unlagged - backward reconciliation #2
	// put them back
	G_UndoTimeShiftFor( ent );
//unlagged - backward reconciliation #2
}


void weapon_supershotgun_fire (gentity_t *ent, qboolean alt) {
	gentity_t		*tent;

	if (alt == qtrue) { return; }
	// send shotgun blast
	tent = G_TempEntity( muzzle, EV_SHOTGUN );
	VectorScale( forward, 4096, tent->s.origin2 );
	SnapVector( tent->s.origin2 );
//unlagged - attack prediction #2
	// this has to be something the client can predict now
	//tent->s.eventParm = rand() & 255;		// seed for spread pattern
	tent->s.eventParm = ent->client->attackTime % 256; // seed for spread pattern
//unlagged - attack prediction #2
	tent->s.otherEntityNum = ent->s.number;

	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent, alt );
}


/*
======================================================================

BOMB

======================================================================
*/

// Shafe - Bomb
void weapon_bomblauncher_fire (gentity_t	*ent, qboolean alt) {
	gentity_t	*m;
	gentity_t	*grenades = NULL;
	 


if (ent->client->bombfired == qfalse) {
		// extra vertical velocity
		forward[2] += 0.2f;
		VectorNormalize( forward );
 
		m = fire_bomb (ent, muzzle, forward, qtrue);
		m->damage *= s_quadFactor;
		m->splashDamage *= s_quadFactor;
		ent->client->bombfired = qtrue;
		return;
	}

 while ((grenades = G_Find (grenades, FOFS(classname), "bomb")) != NULL)
 {
	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
	{
		if (ent->client->bombfired == qtrue)
		{
			G_ExplodeBomb(grenades);
			ent->client->bombfired = qfalse;
			
		}

	}
 }

 	

} 


/*
======================================================================

PDG

======================================================================
*/

// Shafe - PDG
void weapon_pdlauncher_fire (gentity_t	*ent) {
	gentity_t	*m;
	gentity_t	*grenades = NULL;
	 
 while ((grenades = G_Find (grenades, FOFS(classname), "pdgrenade")) != NULL)
 {
	if(grenades->r.ownerNum == ent->s.clientNum)  //make sure its ours
	{
		ent->istelepoint = 0; // client cannot teleport
		VectorClear( ent->teleloc ); // clear the teleport location
		grenades->think = G_ExplodeMissile;
		grenades->nextthink = level.time;
	}
 }
 // extra vertical velocity
 forward[2] += 0.2f;
 VectorNormalize( forward );
 
 m = fire_pdgrenade (ent, muzzle, forward);
 m->damage *= s_quadFactor;
 m->splashDamage *= s_quadFactor;
 ent->client->pdgfired = qtrue;
} 


/*
======================================================================

GRENADE LAUNCHER

======================================================================
*/

void weapon_grenadelauncher_fire (gentity_t *ent) {
	gentity_t	*m;

	// extra vertical velocity
	forward[2] += 0.2f;
	VectorNormalize( forward );

	m = fire_grenade (ent, muzzle, forward);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}

/*
======================================================================

ALT GRENADE LAUNCHER 
Shafe - Trep - Alternate Fire Grenade

======================================================================
*/

void weapon_altgrenadelauncher_fire (gentity_t *ent) {
	gentity_t	*m;

	// extra vertical velocity
	forward[2] += 0.2f;
	VectorNormalize( forward );

	m = fire_altgrenade (ent, muzzle, forward);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}

/*
======================================================================

ROCKET

======================================================================
*/

void Weapon_RocketLauncher_Fire (gentity_t *ent) {
	gentity_t	*m;

	m = fire_rocket (ent, muzzle, forward);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}

// Shafe - Trep Alt Rocket Launcher
void Weapon_RocketLauncher_AltFire (gentity_t *ent) {
	gentity_t	*m;

	m = fire_alt_rocket (ent, muzzle, forward);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}


/*
======================================================================

PLASMA GUN

======================================================================
*/

void Weapon_Plasmagun_Fire (gentity_t *ent) {
	gentity_t	*m;
	int		i;
	
	// Shafe - Add Some Randomness so that 
	// it doesnt fire straight every time
	i = irandom(0,10);
	if (i > 5)
	{
		forward[2] += 0.2f;
		VectorNormalize( forward );
	}

	m = fire_plasma (ent, muzzle, forward);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}

/*
======================================================================

RAILGUN

======================================================================
*/


/*
=================
weapon_railgun_fire
=================
*/
#define	MAX_RAIL_HITS	4
void weapon_railgun_fire (gentity_t *ent) {
	vec3_t		end;
#ifdef MISSIONPACK
	vec3_t impactpoint, bouncedir;
#endif
	trace_t		trace;
	gentity_t	*tent;
	gentity_t	*traceEnt;
	int			damage;
	int			splashDmg = 16;
	int			splashRadius = 64;
	int			i;
	int			hits;
	int			unlinked;
	int			passent;
	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];

	// Shafe - Trep - Instagib
	if (g_instagib.integer == 0)
	{
		damage = 100 * s_quadFactor;
	} else {
		damage = 1000 * s_quadFactor;

	}
	/////////////////////////////////////

	// Rifle Jumping - Shafe
		// Instagib Jumping
		if (g_GuassJump.integer == 1) 
		{
			
			splashRadius = g_GuassKnockBack.integer * 50; 
			splashDmg = splashRadius; 

		} else {
			splashDmg = 0; 
			splashRadius = 0; 
		}

		
		

	VectorMA (muzzle, 8192, forward, end);

//unlagged - backward reconciliation #2
	// backward-reconcile the other clients
	G_DoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

	// trace only against the solids, so the railgun will go through people
	unlinked = 0;
	hits = 0;
	passent = ent->s.number;
	do {
		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
			break;
		}
		traceEnt = &g_entities[ trace.entityNum ];
		if ( traceEnt->takedamage ) {
#ifdef MISSIONPACK
			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
					// snap the endpos to integers to save net bandwidth, but nudged towards the line
					SnapVectorTowards( trace.endpos, muzzle );
					// send railgun beam effect
					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
					// set player number for custom colors on the railtrail
					tent->s.clientNum = ent->s.clientNum;
					VectorCopy( muzzle, tent->s.origin2 );
					// move origin a bit to come closer to the drawn gun muzzle
					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
					tent->s.eventParm = 255;	// don't make the explosion at the end
					//
					VectorCopy( impactpoint, muzzle );
					// the player can hit him/herself with the bounced rail
					passent = ENTITYNUM_NONE;
				}
			}
			else {
				if( LogAccuracyHit( traceEnt, ent ) ) {
					hits++;
				}
				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
			}
#else

			if( G_RadiusDamage( trace.endpos, ent, splashDmg, splashRadius, NULL, MOD_RAILGUN ) ) // Shafe - Trying to get the rifle jumping to work.
			{
				// Does a burst radius hit really count as a "hit"?  Not for Guass rifles...
				//g_entities[ent->s.number].client->ps.persistant[PERS_ACCURACY_HITS]++;
			}

			
				if( LogAccuracyHit( traceEnt, ent ) ) {
					hits++;
				}
				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
#endif
		}
		if ( trace.contents & CONTENTS_SOLID ) {
			break;		// we hit something solid enough to stop the beam
		}
		// unlink this entity, so the next trace will go past it
		trap_UnlinkEntity( traceEnt );
		unlinkedEntities[unlinked] = traceEnt;
		unlinked++;
	} while ( unlinked < MAX_RAIL_HITS );

//unlagged - backward reconciliation #2
	// put them back
	G_UndoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

	// link back in any entities we unlinked
	for ( i = 0 ; i < unlinked ; i++ ) {
		trap_LinkEntity( unlinkedEntities[i] );
	}

	// the final trace endpos will be the terminal point of the rail trail

	// snap the endpos to integers to save net bandwidth, but nudged towards the line
	SnapVectorTowards( trace.endpos, muzzle );

	// send railgun beam effect
	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );

	// set player number for custom colors on the railtrail
	tent->s.clientNum = ent->s.clientNum;

	VectorCopy( muzzle, tent->s.origin2 );
	// move origin a bit to come closer to the drawn gun muzzle
	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );

	// no explosion at end if SURF_NOIMPACT, but still make the trail
	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
		tent->s.eventParm = 255;	// don't make the explosion at the end
	} else {
		tent->s.eventParm = DirToByte( trace.plane.normal );
	}
	tent->s.clientNum = ent->s.clientNum;

	// give the shooter a reward sound if they have made two railgun hits in a row
	if ( hits == 0 ) {
		// complete miss
		ent->client->accurateCount = 0;
	} else {
		// check for "impressive" reward sound
		ent->client->accurateCount += hits;
		if ( ent->client->accurateCount >= 2 ) {
			ent->client->accurateCount -= 2;
			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
			// add the sprite over the player's head
			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
		}
		ent->client->accuracy_hits++;
	}

	trap_SendServerCommand(ent->client->ps.clientNum, "+greset");

}


/*
======================================================================

GRAPPLING HOOK

======================================================================
*/

void Weapon_GrapplingHook_Fire (gentity_t *ent)
{
	// Shafe - Trep  - Offhand Grappling Hook
	AngleVectors (ent->client->ps.viewangles, forward, right, up);
	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
	// End Shafe
	
	if (!ent->client->fireHeld && !ent->client->hook)
		fire_grapple (ent, muzzle, forward);

	ent->client->fireHeld = qtrue;
}


void Weapon_HookFree (gentity_t *ent)
{
	ent->parent->client->hook = NULL;
	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
	G_FreeEntity( ent );
}

void Weapon_HookThink (gentity_t *ent)
{
	if (ent->enemy) {
		vec3_t v, oldorigin;

		VectorCopy(ent->r.currentOrigin, oldorigin);
		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
		SnapVectorTowards( v, oldorigin );	// save net bandwidth

		G_SetOrigin( ent, v );
	}

	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
}

/*
=======================================================================
TURRET - Not Used but this would be good for a vehichle
=======================================================================
*/
void Weapon_fire_turret (gentity_t *ent, qboolean alt ) {
	gentity_t *m;
	float newforward[] = {0,0,0};


	// All of this is useless.. for the turrets, but lets tweak it for use as a shotgun variant

	m = fire_turret(ent, muzzle, forward, alt);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

	if (alt == qtrue) {
		
		
		//Second bullet goes to the right
		AngleVectors( ent->client->ps.viewangles, forward, right, up );
		VectorCopy( forward, newforward );
		if ( forward[0] >= 0.5 && forward[0] <= 1 ) 
		{
			newforward[1] += .35f;
		} 
		else if ( forward[0] <= -0.5 && forward[0] >= -1 ) 
		{
			newforward[1] += .35f;
		} else {
			newforward[0] += .35f;
		}
	
		VectorNormalize( newforward );
		VectorAdd( newforward, forward, forward );
		CalcMuzzlePoint( ent, forward, right, up, muzzle );
	

		m = fire_turret(ent, muzzle, forward, alt);
		m->damage *= s_quadFactor;
		m->splashDamage *= s_quadFactor;



		//Third bullet goes to the left
		AngleVectors (ent->client->ps.viewangles, forward, right, up);
		VectorCopy( forward, newforward );
		if ( forward[0] >= 0.5 && forward[0] <= 1 ) {
		newforward[1] -= .35f;
		} else if ( forward[0] <= -0.5 && forward[0] >= -1 ) {
		newforward[1] -= .35f;
		} else {
		newforward[0] -= .35f;
		}
		VectorNormalize( newforward );
		VectorAdd( newforward, forward, forward );
		CalcMuzzlePoint ( ent, forward, right, up, muzzle );

		m = fire_turret(ent, muzzle, forward, alt);
		m->damage *= s_quadFactor;
		m->splashDamage *= s_quadFactor;
	}

}

/*
======================================================================

LIGHTNING GUN

======================================================================
*/

void Weapon_LightningFire( gentity_t *ent ) {
	trace_t		tr;
	vec3_t		end;
#ifdef MISSIONPACK
	vec3_t impactpoint, bouncedir;
#endif
	gentity_t	*traceEnt, *tent;
	int			damage, i, passent;

//unlagged - server options
	// this is configurable now
//	damage = 8 * s_quadFactor;
	damage = g_lightningDamage.integer * s_quadFactor;
//unlagged - server options

	passent = ent->s.number;
	for (i = 0; i < 10; i++) {
		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );

//unlagged - backward reconciliation #2
	// backward-reconcile the other clients
	G_DoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);

//unlagged - backward reconciliation #2
	// put them back
	G_UndoTimeShiftFor( ent );
//unlagged - backward reconciliation #2

#ifdef MISSIONPACK
		// if not the first trace (the lightning bounced of an invulnerability sphere)
		if (i) {
			// add bounced off lightning bolt temp entity
			// the first lightning bolt is a cgame only visual
			//
			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
			VectorCopy( tr.endpos, end );
			SnapVector( end );
			VectorCopy( end, tent->s.origin2 );
		}
#endif
		if ( tr.entityNum == ENTITYNUM_NONE ) {
			return;
		}

		traceEnt = &g_entities[ tr.entityNum ];

		if ( traceEnt->takedamage) {
#ifdef MISSIONPACK
			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
					VectorCopy( impactpoint, muzzle );
					VectorSubtract( end, impactpoint, forward );
					VectorNormalize(forward);
					// the player can hit him/herself with the bounced lightning
					passent = ENTITYNUM_NONE;
				}
				else {
					VectorCopy( tr.endpos, muzzle );
					passent = traceEnt->s.number;
				}
				continue;
			}
			else {
				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
					damage, 0, MOD_LIGHTNING);
			}
#else
				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
					damage, 0, MOD_LIGHTNING);
#endif
		}

		if ( traceEnt->takedamage && traceEnt->client ) {
			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
			tent->s.otherEntityNum = traceEnt->s.number;
			tent->s.eventParm = DirToByte( tr.plane.normal );
			tent->s.weapon = ent->s.weapon;
			if( LogAccuracyHit( traceEnt, ent ) ) {
				ent->client->accuracy_hits++;
			}
		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
			tent->s.eventParm = DirToByte( tr.plane.normal );
		}

		break;
	}
}

#ifdef MISSIONPACK
/*
======================================================================

NAILGUN

======================================================================
*/

void Weapon_Nailgun_Fire (gentity_t *ent) {
	gentity_t	*m;
	int			count;

	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
		m = fire_nail (ent, muzzle, forward, right, up );
		m->damage *= s_quadFactor;
		m->splashDamage *= s_quadFactor;
	}

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}


/*
======================================================================

PROXIMITY MINE LAUNCHER

======================================================================
*/

void weapon_proxlauncher_fire (gentity_t *ent) {
	gentity_t	*m;

	// extra vertical velocity
	forward[2] += 0.2f;
	VectorNormalize( forward );

	m = fire_prox (ent, muzzle, forward);
	m->damage *= s_quadFactor;
	m->splashDamage *= s_quadFactor;

//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
}

#endif

//======================================================================


/*
===============
LogAccuracyHit
===============
*/
qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
	if( !target->takedamage ) {
		return qfalse;
	}

	if ( target == attacker ) {
		return qfalse;
	}

	if( !target->client ) {
		return qfalse;
	}

	if( !attacker->client ) {
		return qfalse;
	}

	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
		return qfalse;
	}

	if ( OnSameTeam( target, attacker ) ) {
		return qfalse;
	}

	return qtrue;
}


/*
===============
CalcMuzzlePoint

set muzzle location relative to pivoting eye
===============
*/
void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
	VectorCopy( ent->s.pos.trBase, muzzlePoint );
	muzzlePoint[2] += ent->client->ps.viewheight;
	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
	// snap to integer coordinates for more efficient network bandwidth usage
	SnapVector( muzzlePoint );
}

/*
===============
CalcMuzzlePointOrigin

set muzzle location relative to pivoting eye
===============
*/
void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
	VectorCopy( ent->s.pos.trBase, muzzlePoint );
	muzzlePoint[2] += ent->client->ps.viewheight;
	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
	// snap to integer coordinates for more efficient network bandwidth usage
	SnapVector( muzzlePoint );
}



/*
===============
FireWeapon
===============
*/
void FireWeapon( gentity_t *ent ) {
	if (ent->client->ps.powerups[PW_QUAD] ) {
		s_quadFactor = g_quadfactor.value;
	} else {
		s_quadFactor = 1;
	}
#ifdef MISSIONPACK
	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
		s_quadFactor *= 2;
	}
#endif

	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
#ifdef MISSIONPACK
		if( ent->s.weapon == WP_NAILGUN ) {
			ent->client->accuracy_shots += NUM_NAILSHOTS;
		} else {
			ent->client->accuracy_shots++;
		}
#else
		ent->client->accuracy_shots++;
#endif
	}

	// set aiming directions
	AngleVectors (ent->client->ps.viewangles, forward, right, up);

	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );

	// fire the specific weapon
	switch( ent->s.weapon ) {
	case WP_GAUNTLET:
		Weapon_Gauntlet( ent );
		break;
	case WP_LIGHTNING:
		//Weapon_LightningFire( ent );
		Weapon_fire_flame(ent , qfalse );  // Shafe - Trep - Flame Thrower
		break;
	case WP_SHOTGUN:
		weapon_supershotgun_fire( ent, qfalse );
		break;
	case WP_MACHINEGUN:
		Weapon_fire_mg( ent, qfalse);
		/*
		if ( g_gametype.integer != GT_TEAM ) {
			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
		} else {
			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
		}
		*/
		break;
	case WP_GRENADE_LAUNCHER:
		weapon_grenadelauncher_fire( ent );
		//weapon_bomblauncher_fire( ent, qtrue);  // This is the 2 step grenades, may be worth revisiting - Shafe
		break;
	case WP_ROCKET_LAUNCHER:
		Weapon_RocketLauncher_Fire( ent );
		break;
	case WP_PLASMAGUN:
		Weapon_Plasmagun_Fire( ent );
		break;
	case WP_RAILGUN:
		weapon_railgun_fire( ent );
		break;
	case WP_BFG:
		BFG_Fire( ent, qfalse );
		break;
	case WP_GRAPPLING_HOOK:
		Weapon_GrapplingHook_Fire( ent );
		break;
	case WP_TURRET:
		Weapon_fire_turret( ent, qfalse );
		break;	
#ifdef MISSIONPACK
	case WP_NAILGUN:
		Weapon_Nailgun_Fire( ent );
		break;
	case WP_PROX_LAUNCHER:
		weapon_proxlauncher_fire( ent );
		break;
	case WP_CHAINGUN:
		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
		break;
#endif
	default:
// FIXME		G_Error( "Bad ent->s.weapon" );
		break;
	}
}


/* 
=============== 
FireWeapon2 
Shafe - Trep - Alt Fire FireWeapon2
Right now this just shoots rockets...
=============== 
*/ 
void FireWeapon2( gentity_t *ent ) { 
 if (ent->client->ps.powerups[PW_QUAD] ) { 
  s_quadFactor = g_quadfactor.value; 
 } else { 
  s_quadFactor = 1; 
 } 

 // track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked 
 if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) { 
   //ent->client->ps.persistant[PERS_ACCURACY_SHOTS]++;  // This doesnt exist?
	// ent->client->accuracy_shots++;
 } 

 // set aiming directions 
 AngleVectors (ent->client->ps.viewangles, forward, right, up); 

 CalcMuzzlePoint ( ent, forward, right, up, muzzle ); 

 // fire the specific weapon 
 switch( ent->s.weapon ) { 
 case WP_GAUNTLET: 
	Weapon_Gauntlet( ent ); 
	break; 
 case WP_LIGHTNING: 
	Weapon_fire_flame( ent, qtrue);  // Shafe - Trep - Flame Thrower
	break; 
 case WP_SHOTGUN: 
	 //weapon_bomblauncher_fire( ent, qtrue); // Not Ready Yet
	 //weapon_supershotgun_fire( ent, qtrue );
	break; 
 case WP_MACHINEGUN: 
  //Weapon_RocketLauncher_Fire( ent );
 	//Weapon_fire_turret( ent );
	 Weapon_fire_mg( ent, qtrue);
	/* 
	if ( g_gametype.integer != GT_TEAM ) { 
		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE ); 
	} else { 
		Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE ); 
	} 
	*/
  break; 
 case WP_GRENADE_LAUNCHER: 
	weapon_altgrenadelauncher_fire( ent ); 
	break; 
 case WP_ROCKET_LAUNCHER: 
	Weapon_RocketLauncher_AltFire( ent );
	break; 
 case WP_PLASMAGUN: 
	weapon_pdlauncher_fire( ent); 
	break; 
 case WP_RAILGUN: 
	// This is just zoom
	break; 
 case WP_BFG: 
	BFG_Fire( ent, qtrue); 
	break; 
 case WP_GRAPPLING_HOOK: 
	Weapon_GrapplingHook_Fire( ent ); 
	break;
 case WP_TURRET:
	Weapon_fire_turret( ent, qtrue );
	break;	
 default: 
// FIXME  G_Error( "Bad ent->s.weapon" ); 
  break; 
 } 
}


#ifdef MISSIONPACK

/*
===============
KamikazeRadiusDamage
===============
*/
static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
	float		dist;
	gentity_t	*ent;
	int			entityList[MAX_GENTITIES];
	int			numListedEntities;
	vec3_t		mins, maxs;
	vec3_t		v;
	vec3_t		dir;
	int			i, e;

	if ( radius < 1 ) {
		radius = 1;
	}

	for ( i = 0 ; i < 3 ; i++ ) {
		mins[i] = origin[i] - radius;
		maxs[i] = origin[i] + radius;
	}

	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );

	for ( e = 0 ; e < numListedEntities ; e++ ) {
		ent = &g_entities[entityList[ e ]];

		if (!ent->takedamage) {
			continue;
		}

		// dont hit things we have already hit
		if( ent->kamikazeTime > level.time ) {
			continue;
		}

		// find the distance from the edge of the bounding box
		for ( i = 0 ; i < 3 ; i++ ) {
			if ( origin[i] < ent->r.absmin[i] ) {
				v[i] = ent->r.absmin[i] - origin[i];
			} else if ( origin[i] > ent->r.absmax[i] ) {
				v[i] = origin[i] - ent->r.absmax[i];
			} else {
				v[i] = 0;
			}
		}

		dist = VectorLength( v );
		if ( dist >= radius ) {
			continue;
		}

//		if( CanDamage (ent, origin) ) {
			VectorSubtract (ent->r.currentOrigin, origin, dir);
			// push the center of mass higher than the origin so players
			// get knocked into the air more
			dir[2] += 24;
			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
			ent->kamikazeTime = level.time + 3000;
//		}
	}
}

/*
===============
KamikazeShockWave
===============
*/
static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
	float		dist;
	gentity_t	*ent;
	int			entityList[MAX_GENTITIES];
	int			numListedEntities;
	vec3_t		mins, maxs;
	vec3_t		v;
	vec3_t		dir;
	int			i, e;

	if ( radius < 1 )
		radius = 1;

	for ( i = 0 ; i < 3 ; i++ ) {
		mins[i] = origin[i] - radius;
		maxs[i] = origin[i] + radius;
	}

	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );

	for ( e = 0 ; e < numListedEntities ; e++ ) {
		ent = &g_entities[entityList[ e ]];

		// dont hit things we have already hit
		if( ent->kamikazeShockTime > level.time ) {
			continue;
		}

		// find the distance from the edge of the bounding box
		for ( i = 0 ; i < 3 ; i++ ) {
			if ( origin[i] < ent->r.absmin[i] ) {
				v[i] = ent->r.absmin[i] - origin[i];
			} else if ( origin[i] > ent->r.absmax[i] ) {
				v[i] = origin[i] - ent->r.absmax[i];
			} else {
				v[i] = 0;
			}
		}

		dist = VectorLength( v );
		if ( dist >= radius ) {
			continue;
		}

//		if( CanDamage (ent, origin) ) {
			VectorSubtract (ent->r.currentOrigin, origin, dir);
			dir[2] += 24;
			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
			//
			dir[2] = 0;
			VectorNormalize(dir);
			if ( ent->client ) {
				ent->client->ps.velocity[0] = dir[0] * push;
				ent->client->ps.velocity[1] = dir[1] * push;
				ent->client->ps.velocity[2] = 100;
			}
			ent->kamikazeShockTime = level.time + 3000;
//		}
	}
}

/*
===============
KamikazeDamage
===============
*/
static void KamikazeDamage( gentity_t *self ) {
	int i;
	float t;
	gentity_t *ent;
	vec3_t newangles;

	self->count += 100;

	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
		// shockwave push back
		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
	}
	//
	if (self->count >= KAMI_EXPLODE_STARTTIME) {
		// do our damage
		t = self->count - KAMI_EXPLODE_STARTTIME;
		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
	}

	// either cycle or kill self
	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
		G_FreeEntity( self );
		return;
	}
	self->nextthink = level.time + 100;

	// add earth quake effect
	newangles[0] = crandom() * 2;
	newangles[1] = crandom() * 2;
	newangles[2] = 0;
	for (i = 0; i < MAX_CLIENTS; i++)
	{
		ent = &g_entities[i];
		if (!ent->inuse)
			continue;
		if (!ent->client)
			continue;

		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
			ent->client->ps.velocity[0] += crandom() * 120;
			ent->client->ps.velocity[1] += crandom() * 120;
			ent->client->ps.velocity[2] = 30 + random() * 25;
		}

		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
	}
	VectorCopy(newangles, self->movedir);
}

/*
===============
G_StartKamikaze
===============
*/
void G_StartKamikaze( gentity_t *ent ) {
	gentity_t	*explosion;
	gentity_t	*te;
	vec3_t		snapped;

	// start up the explosion logic
	explosion = G_Spawn();

	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
	explosion->eventTime = level.time;

	if ( ent->client ) {
		VectorCopy( ent->s.pos.trBase, snapped );
	}
	else {
		VectorCopy( ent->activator->s.pos.trBase, snapped );
	}
	SnapVector( snapped );		// save network bandwidth
	G_SetOrigin( explosion, snapped );

	explosion->classname = "kamikaze";
	explosion->s.pos.trType = TR_STATIONARY;

	explosion->kamikazeTime = level.time;

	explosion->think = KamikazeDamage;
	explosion->nextthink = level.time + 100;
	explosion->count = 0;
	VectorClear(explosion->movedir);

	trap_LinkEntity( explosion );

	if (ent->client) {
		//
		explosion->activator = ent;
		//
		ent->s.eFlags &= ~EF_KAMIKAZE;
		// nuke the guy that used it
		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
	}
	else {
		if ( !strcmp(ent->activator->classname, "bodyque") ) {
			explosion->activator = &g_entities[ent->activator->r.ownerNum];
		}
		else {
			explosion->activator = ent->activator;
		}
	}

	// play global sound at all clients
	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
	te->r.svFlags |= SVF_BROADCAST;
	te->s.eventParm = GTS_KAMIKAZE;
}
#endif


/*
====================================================
MORE BUILDABLE STUFF
Done here for those night forward, right, and up values 
=================
*/
#define PLACEDIST			64

/*
=================
CanBuildHere

This checks to see that we can build this thing
=================
*/
qboolean CanBuildHere(gentity_t *playerent)
{
	trace_t		tr;
	vec3_t		fwd, pos, dest, mins = {-16,-16, 0}, maxs = {16,16,16};

	

	// can we place this in front of us?
	AngleVectors (playerent->client->ps.viewangles, fwd, NULL, NULL);
	fwd[2] = 0;
	VectorMA(playerent->client->ps.origin, PLACEDIST, fwd, dest);
	trap_Trace (&tr, playerent->client->ps.origin, mins, maxs, dest, playerent->s.number, MASK_SHOT );
	if (tr.fraction > 0.9)
	{//room in front
		VectorCopy(tr.endpos, pos);
		// drop to floor
		VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
		trap_Trace( &tr, pos, mins, maxs, dest, playerent->s.number, MASK_SOLID );
		if ( !tr.startsolid && !tr.allsolid )
		{	
			return qtrue;
		}
	}
	// no room
	return qfalse;
}




/*
=================
BuildableSpawn

This checks puts it in front, drops it to the ground and angles it correctly
=================
*/
void BuildableSpawn( gentity_t *base )
{ // Done here for those night forward, right, and up values -Vincent	
vec3_t		start, dir, angles; // Part 1 stuff
vec3_t		origin, slope, nvf, ovf, ovr, new_angles = {0, 0, 0 }; // Part 2
float		pitch, mod, dot; // Part 2
trace_t		tr1, tr2; // Part 2

if( !base || !base->parent || !base->parent->client )
	return; // Verify for both parts

// Part 1: Initial spawning in front of the player -Vincent
VectorCopy( base->parent->client->ps.viewangles, angles );
angles[0] = 0; // Stay straight
angles[2] = 0; // Stay straight

AngleVectors( angles, forward, right, up );
CalcMuzzlePoint( base, forward, right, up, start ); // Actual start point, away from the owner
VectorNormalize( forward );
VectorMA( start, 32, forward, start ); // Go in front of the player


G_SetOrigin( base, start ); // Start a bit in front of the player
base->s.pos.trTime = level.time;
	
VectorCopy( forward, dir ); // To tweak it below this...
VectorNormalize( dir );
VectorScale( dir, 300, base->s.pos.trDelta );
base->s.pos.trTime = level.time;
vectoangles( dir, base->s.angles);
VectorCopy( base->s.angles, base->s.apos.trBase );
VectorSet( base->s.apos.trDelta, 50, 0, 0 ); // Speed
base->s.apos.trTime = level.time;


// Part 2: Put it on the ground and match it to slopes -Vincent

VectorCopy( base->r.currentOrigin, origin );
origin[2] -= 2500; // Trace it straight down
// Trace for solids from the previous position to the new position on the ground, 
// but without getting stuck in the owner!
trap_Trace( &tr1, base->r.currentOrigin, base->r.mins, base->r.maxs, origin, 
			base->parent ? base->parent->s.number : base->s.number, MASK_SHOT );


VectorCopy( base->r.currentOrigin, origin ); // Keep the old value for lava checking
G_SetOrigin( base, tr1.endpos );
VectorCopy( base->r.currentOrigin, base->s.origin ); // Set it's new origin


if( tr1.fraction < 1.0 && ( &tr1.plane ) )
{ // Match to a slope when necessary
VectorCopy( tr1.plane.normal, slope ); // Get the slopes' angles
AngleVectors( base->s.angles, ovf, ovr, NULL ); // Already calculated in part 1
vectoangles( slope, new_angles );
pitch = new_angles[PITCH] + 90;
new_angles[ROLL] = new_angles[PITCH] = 0;
AngleVectors( new_angles, nvf, NULL, NULL );

mod = DotProduct( nvf, ovr );
if( mod < 0 )
	mod = -1;
else
	mod = 1;

dot = DotProduct( nvf, ovf );
// Modify its actual angles
base->s.angles[PITCH] = dot * pitch;
base->s.angles[ROLL] = ( ( 1-Q_fabs( dot ) ) * pitch * mod );
VectorCopy( base->s.angles, base->s.apos.trBase );
}

trap_LinkEntity( base ); // Add it...

// Trace back to its original point to see if the buildable hit any non-solid content on its way
// When it does, the buildable should be cleared!
trap_Trace( &tr2, origin, base->r.mins, base->r.maxs, base->r.currentOrigin, 
		   	base->parent ? base->parent->s.number : base->s.number, CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_SOLID );

if( tr2.fraction < 1.0 ) // It did go through a bad content
{
base->s.eType = ET_GENERAL; // To go for a die in g_buildables
}
else
{
base->s.eType = ET_BUILDABLE; // Initialize it
}
// The actual buildables' thinking happens in g_buildables again, after this func
}

