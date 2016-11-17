#include "g_local.h"

int	check_time;
static vec3_t	redflag;
static vec3_t	blueflag;

qboolean is_spectator( gclient_t *client ) {
	if ( client == NULL ) return qfalse;
	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) return qtrue;
	if ( client->ps.persistant[ PERS_TEAM ] == TEAM_SPECTATOR ) return qtrue;
	if ( client->sess.spectatorState == SPECTATOR_FOLLOW ) return qtrue;
	return qfalse;
}

qboolean Set_spectator( gentity_t *ent ) {
	vec3_t	origin, angles;

	if ( level.intermissiontime ) return qfalse;
	if ( !ent->freezeState ) return qfalse;
	if ( ent->r.svFlags & SVF_BOT ) {
		ent->client->respawnTime = INT_MAX;
	} else if ( !is_spectator( ent->client ) ) {
		VectorCopy( ent->r.currentOrigin, origin );
		angles[ YAW ] = ent->client->ps.stats[ STAT_DEAD_YAW ];
		angles[ PITCH ] = 0;
		angles[ ROLL ] = 0;
		ClientSpawn( ent );
		VectorCopy( origin, ent->client->ps.origin );
		SetClientViewAngle( ent, angles );
		ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;
		ent->client->sess.spectatorTime = level.time;
		ent->client->sess.spectatorState = SPECTATOR_FREE;
		ent->client->sess.spectatorClient = 0;

		trap_UnlinkEntity( ent );
	}
	return qtrue;
}

qboolean Set_Client( gentity_t *ent ) {
	gclient_t	*cl;
	gentity_t	*tent;

	cl = ent->client;
	if ( cl->ps.pm_type != PM_SPECTATOR ) return qfalse;
	if ( cl->sess.sessionTeam == TEAM_SPECTATOR ) return qfalse;
	if ( ent->freezeState ) return qfalse;

	cl->sess.spectatorState = SPECTATOR_NOT;
	cl->sess.spectatorClient = 0;
	ClientSpawn( ent );

	tent = G_TempEntity( cl->ps.origin, EV_PLAYER_TELEPORT_IN );
	tent->s.clientNum = ent->s.clientNum;

	return qtrue;
}

void respawnSpectator( gentity_t *ent ) {
	gclient_t	*client;

	client = ent->client;
	if ( ent->freezeState ) return;
	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) return;

	if ( level.time > client->respawnTime ) {
		if ( g_forcerespawn.integer > 0 && level.time - client->respawnTime > g_forcerespawn.integer * 1000 ) {
			Cmd_FollowCycle_f( ent, 1 );
		}
	}
}

void Persistant_spectator( gentity_t *ent, gclient_t *cl ) {
	int	i;
	int	persistant[ MAX_PERSISTANT ];
	int	savedPing;

	savedPing = ent->client->ps.ping;
	for ( i = 0; i < MAX_PERSISTANT; i++ ) {
		persistant[ i ] = ent->client->ps.persistant[ i ];
	}
	ent->client->ps = cl->ps;
	ent->client->ps.ping = savedPing;
	for ( i = 0; i < MAX_PERSISTANT; i++ ) {
		switch ( i ) {
		case PERS_HITS:
		case PERS_TEAM:
		case PERS_ATTACKER:
			continue;
		}
		ent->client->ps.persistant[ i ] = persistant[ i ];
	}
}

static void FollowClient( gentity_t *ent, gentity_t *other ) {
	if ( ent->target_ent == other ) return;
	if ( is_spectator( ent->target_ent->client ) ) {
		ent->target_ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
		ent->target_ent->client->sess.spectatorClient = other->s.number;
	}
}

static void player_free( gentity_t *ent ) {
	if ( !ent || !ent->inuse ) return;
	if ( !ent->freezeState ) return;
	ent->freezeState = qfalse;
	ent->client->respawnTime = level.time + 1700;
	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
		StopFollowing( ent );
		ent->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
		ent->client->ps.pm_time = 100;
	}
	ent->client->inactivityTime = level.time + g_inactivity.integer * 1000;
}

void Body_free( gentity_t *self ) {
	int	i;
	gentity_t	*ent;

	if ( self->freezeState ) {
		player_free( self->target_ent );
	}
	if ( self->s.eFlags & EF_KAMIKAZE ) {
		for ( i = 0; i < MAX_GENTITIES; i++ ) {
			ent = &g_entities[ i ];
			if ( !ent->inuse ) continue;
			if ( ent->activator != self ) continue;
			if ( strcmp( ent->classname, "kamikaze timer" ) ) continue;
			G_FreeEntity( ent );
			break;
		}
	}
	self->s.powerups = 0;
	G_FreeEntity( self );
}

static void Body_Explode( gentity_t *self ) {
	int	i;
	gentity_t	*e, *tent;
	vec3_t	point;

	for ( i = 0; i < g_maxclients.integer; i++ ) {
		e = g_entities + i;
		if ( !e->inuse ) continue;
		if ( e->health < 1 ) continue;
		if ( e->client->sess.sessionTeam != self->spawnflags ) continue;
		VectorSubtract( self->s.pos.trBase, e->s.pos.trBase, point );
		if ( VectorLength( point ) > 100 ) continue;
		if ( is_spectator( e->client ) ) continue;
		if ( !self->count ) {
			if ( g_dmflags.integer & 1024 || g_gametype.integer == GT_CTF ) {
				self->count = level.time + 2000;
			} else {
				self->count = level.time + 3000;
			}
			G_Sound( self, CHAN_AUTO, self->noise_index );

			self->activator = e;
		} else if ( self->count < level.time ) {
			if ( self->activator == e ) {
			} else if ( !self->activator->inuse ) {
			} else if ( self->activator->health < 1 ) {
			} else {
				VectorSubtract( self->s.pos.trBase, self->activator->s.pos.trBase, point );
				if ( VectorLength( point ) > 100 ) {
				} else if ( is_spectator( self->activator->client ) ) {
				} else {
					e = self->activator;
				}
			}

			tent = G_TempEntity( self->target_ent->r.currentOrigin, EV_OBITUARY );
			tent->s.eventParm = MOD_UNKNOWN;
			tent->s.otherEntityNum = self->target_ent->s.number;
			tent->s.otherEntityNum2 = e->s.number;
			tent->r.svFlags = SVF_BROADCAST;

			G_LogPrintf( "Kill: %i %i %i: %s killed %s by %s\n", e->s.number, self->target_ent->s.number, MOD_UNKNOWN, e->client->pers.netname, self->target_ent->client->pers.netname, "MOD_UNKNOWN" );
			AddScore( e, self->s.pos.trBase, 1 );

			e->client->sess.wins++;
			G_Damage( self, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG );
		}
		return;
	}
	self->count = 0;
}

static void Body_WorldEffects( gentity_t *self ) {
	vec3_t	point;
	int	contents;
	int	i, num;
	int	touch[ MAX_GENTITIES ];
	gentity_t	*hit;
	vec3_t	mins, maxs;
	int	previous_waterlevel;

	VectorCopy( self->r.currentOrigin, point );
	point[ 2 ] -= 23;

	contents = trap_PointContents( point, -1 );
	if ( contents & ( CONTENTS_LAVA | CONTENTS_SLIME ) ) {
		if ( level.time - self->timestamp > 5000 ) {
			G_Damage( self, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG );
		}
		return;
	}
	if ( self->s.pos.trType == TR_STATIONARY && contents & CONTENTS_NODROP ) {
		if ( level.time - self->timestamp > 5000 ) {
			Body_free( self );
		}
		return;
	}

	previous_waterlevel = self->waterlevel;
	self->waterlevel = 0;
	if ( contents & MASK_WATER ) {
		self->waterlevel = 3;
	}
	self->watertype = contents;
	if ( !previous_waterlevel && self->waterlevel ) {
		G_AddEvent( self, EV_WATER_TOUCH, 0 );
	}
	if ( previous_waterlevel && !self->waterlevel ) {
		G_AddEvent( self, EV_WATER_LEAVE, 0 );
	}

	VectorAdd( self->r.currentOrigin, self->r.mins, mins );
	VectorAdd( self->r.currentOrigin, self->r.maxs, maxs );
	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );

	for ( i = 0; i < num; i++ ) {
		hit = &g_entities[ touch[ i ] ];
		if ( !hit->touch ) {
			continue;
		}
		switch ( hit->s.eType ) {
		case ET_PUSH_TRIGGER:
			if ( self->s.pos.trDelta[ 2 ] < 100 ) {
				G_Sound( self, CHAN_AUTO, G_SoundIndex( "sound/world/jumppad.wav" ) );
			}
			VectorCopy( hit->s.origin2, self->s.pos.trDelta );

			self->s.pos.trType = TR_GRAVITY;
			self->s.pos.trTime = level.time;
			break;
		case ET_TELEPORT_TRIGGER:
			if ( !( hit->spawnflags & 1 ) ) {
				G_TempEntity( self->r.currentOrigin, EV_PLAYER_TELEPORT_OUT );
				Body_free( self );
				return;
			}
			break;
		}
	}
}

void Kamikaze_DeathTimer( gentity_t *self );

static void TossBody( gentity_t *self ) {
	int	anim;
	static int	n;

	self->timestamp = level.time;
	self->nextthink = level.time + 5000;
#ifdef MISSIONPACK
	if ( self->s.eFlags & EF_KAMIKAZE ) {
		Kamikaze_DeathTimer( self );
	}
#endif
	self->s.eFlags |= EF_DEAD;
	self->s.powerups = 0;
	self->r.maxs[ 2 ] = -8;
	self->r.contents = CONTENTS_CORPSE;
	self->freezeState = qfalse;
	self->s.weapon = WP_NONE;

	switch ( n ) {
	case 0:
		anim = BOTH_DEATH1;
		break;
	case 1:
		anim = BOTH_DEATH2;
		break;
	case 2:
	default:
		anim = BOTH_DEATH3;
		break;
	}
	n = ( n + 1 ) % 3;

	self->s.torsoAnim = self->s.legsAnim = anim;

	if ( !g_blood.integer ) {
		self->takedamage = qfalse;
	}

	trap_LinkEntity( self );
}

static void Body_think( gentity_t *self ) {
	self->nextthink = level.time + FRAMETIME;

	if ( !self->target_ent || !self->target_ent->client || !self->target_ent->inuse ) {
		Body_free( self );
		return;
	}
	if ( self->s.otherEntityNum != self->target_ent->s.number ) {
		Body_free( self );
		return;
	}
	if ( level.intermissiontime || level.intermissionQueued ) {
		return;
	}
	if ( level.time - self->timestamp > 150000 || ( ( g_dmflags.integer & 1024 || g_gametype.integer == GT_CTF ) && level.time - self->timestamp > 60000 ) ) {
		player_free( self->target_ent );
		TossBody( self );
		return;
	}

	if ( self->freezeState ) {
		if ( !self->target_ent->freezeState ) {
			TossBody( self );
			return;
		}
		Body_Explode( self );
		if ( self->last_move_time < level.time - 1000 ) {
			Body_WorldEffects( self );
			self->last_move_time = level.time;
		}
		return;
	}

	if ( level.time - self->timestamp > 6500 ) {
		Body_free( self );
	} else {
		self->s.pos.trBase[ 2 ] -= 1;
	}
}

static void Body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod ) {
	gentity_t	*tent;

	if ( self->health > GIB_HEALTH ) {
		return;
	}

	if ( self->freezeState && !g_blood.integer ) {
		player_free( self->target_ent );
		TossBody( self );
		return;
	}

	tent = G_TempEntity( self->r.currentOrigin, EV_GIB_PLAYER );
	if ( self->freezeState ) {
		tent->s.eventParm = 255;
	}
	Body_free( self );
}

qboolean DamageBody( gentity_t *targ, gentity_t *attacker, vec3_t dir, int mod, int knockback ) {
	static float	mass;
	vec3_t	kvel;

	if ( !mass ) {
		char	info[ 1024 ];
		static char	mapname[ 128 ];

		trap_GetServerinfo( info, sizeof ( info ) );
		strncpy( mapname, Info_ValueForKey( info, "mapname" ), sizeof ( mapname ) - 1 );
		mapname[ sizeof ( mapname ) - 1 ] = '\0';

		if ( !Q_stricmp( mapname, "q3tourney3" ) ||
			!Q_stricmp( mapname, "q3dm16" ) ||
			!Q_stricmp( mapname, "q3dm17" ) ||
			!Q_stricmp( mapname, "q3dm18" ) ||
			!Q_stricmp( mapname, "q3dm19" ) ||
			!Q_stricmp( mapname, "q3tourney6" ) ||
			!Q_stricmp( mapname, "q3ctf4" ) ||
			!Q_stricmp( mapname, "mpq3ctf4" ) ||
			!Q_stricmp( mapname, "mpq3tourney6" ) ||
			!Q_stricmp( mapname, "mpteam6" ) ) {
			mass = 300;
		} else {
			mass = 200;
		}
		if ( g_dmflags.integer & 1024 ) mass = 300;
	}

	if ( attacker->client && targ->freezeState ) {
		if ( knockback ) {
			VectorScale( dir, g_knockback.value * (float) knockback / mass, kvel );
			if ( mass == 200 ) kvel[ 2 ] += 24;
			VectorAdd( targ->s.pos.trDelta, kvel, targ->s.pos.trDelta );

			targ->s.pos.trType = TR_GRAVITY;
			targ->s.pos.trTime = level.time;

			targ->pain_debounce_time = level.time;
		}
		if ( mod == MOD_GAUNTLET || mod == MOD_RAILGUN ) {
			FollowClient( targ, attacker );
		}
		return qtrue;
	}
	return qfalse;
}

qboolean is_body( gentity_t *ent ) {
	if ( !ent || !ent->inuse ) return qfalse;
	return ( ent->classname && !Q_stricmp( ent->classname, "freezebody" ) );
}

qboolean is_body_freeze( gentity_t *ent ) {
	if ( is_body( ent ) ) {
		return ent->freezeState;
	}
	return qfalse;
}

#ifdef MISSIONPACK
void G_ExplodeMissile( gentity_t *ent );

static void ProximityMine_ExplodeOnBody( gentity_t *mine ) {
	gentity_t	*body;

	if ( !is_body_freeze( mine->enemy ) ) {
		mine->think = G_FreeEntity;
		mine->nextthink = level.time;
		return;
	}

	body = mine->enemy;
	body->s.eFlags &= ~EF_TICKING;

	body->s.loopSound = 0;

	G_SetOrigin( mine, body->s.pos.trBase );
	mine->r.svFlags &= ~SVF_NOCLIENT;
	mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
	G_ExplodeMissile( mine );
}

void ProximityMine_Body( gentity_t *mine, gentity_t *body ) {
	if ( mine->s.eFlags & EF_NODRAW )
		return;

	G_AddEvent( mine, EV_PROXIMITY_MINE_STICK, 0 );

	if ( body->s.eFlags & EF_TICKING ) {
		body->activator->splashDamage += mine->splashDamage;
		body->activator->splashRadius *= 1.50;
		mine->think = G_FreeEntity;
		mine->nextthink = level.time;
		return;
	}

	body->s.loopSound = G_SoundIndex( "sound/weapons/proxmine/wstbtick.wav" );

	body->s.eFlags |= EF_TICKING;
	body->activator = mine;

	mine->s.eFlags |= EF_NODRAW;
	mine->r.svFlags |= SVF_NOCLIENT;
	mine->s.pos.trType = TR_LINEAR;
	VectorClear( mine->s.pos.trDelta );

	mine->enemy = body;
	mine->think = ProximityMine_ExplodeOnBody;
	mine->nextthink = level.time + 10 * 1000;
}
#endif

static void CopyToBody( gentity_t *ent ) {
	gentity_t	*body;

	body = G_Spawn();
	body->classname = "freezebody";
	body->s = ent->s;
	body->s.eFlags = 0;
	if ( ent->s.eFlags & EF_KAMIKAZE ) {
		body->s.eFlags |= EF_KAMIKAZE;
	}
	body->s.powerups = 1 << PW_BATTLESUIT;
	body->s.number = body - g_entities;
	body->timestamp = level.time;
	body->physicsObject = qtrue;

	G_SetOrigin( body, ent->r.currentOrigin );
	body->s.pos.trType = TR_GRAVITY;
	body->s.pos.trTime = level.time;
	VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
	body->s.event = 0;

	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
	case LEGS_WALKCR:
	case LEGS_WALK:
	case LEGS_RUN:
	case LEGS_BACK:
	case LEGS_SWIM:
	case LEGS_IDLE:
	case LEGS_IDLECR:
	case LEGS_TURN:
	case LEGS_BACKCR:
	case LEGS_BACKWALK:
		switch ( rand() % 4 ) {
		case 0:
			body->s.legsAnim = LEGS_JUMP;
			break;
		case 1:
			body->s.legsAnim = LEGS_LAND;
			break;
		case 2:
			body->s.legsAnim = LEGS_JUMPB;
			break;
		case 3:
			body->s.legsAnim = LEGS_LANDB;
			break;
		}
	}

	body->r.svFlags = ent->r.svFlags;
	VectorCopy( ent->r.mins, body->r.mins );
	VectorCopy( ent->r.maxs, body->r.maxs );
	VectorCopy( ent->r.absmin, body->r.absmin );
	VectorCopy( ent->r.absmax, body->r.absmax );

	body->clipmask = MASK_PLAYERSOLID;
	body->r.contents = CONTENTS_BODY;

	body->think = Body_think;
	body->nextthink = level.time + FRAMETIME;

	body->die = Body_die;
	body->takedamage = qtrue;

	body->target_ent = ent;
	ent->target_ent = body;
	body->s.otherEntityNum = ent->s.number;
	body->noise_index = G_SoundIndex( "sound/player/tankjr/jump1.wav" );
	body->freezeState = qtrue;
	body->spawnflags = ent->client->sess.sessionTeam;
	body->waterlevel = ent->waterlevel;
	body->count = 0;

	trap_LinkEntity( body );
}

static qboolean NearbyBody( gentity_t *targ ) {
	gentity_t	*spot;
	vec3_t	delta;

	if ( g_gametype.integer == GT_CTF ) {
		return qfalse;
	}

	spot = NULL;
	while ( ( spot = G_Find( spot, FOFS( classname ), "freezebody" ) ) != NULL ) {
		if ( !spot->freezeState ) continue;
		if ( spot->spawnflags != targ->client->sess.sessionTeam ) continue;
		VectorSubtract( spot->s.pos.trBase, targ->s.pos.trBase, delta );
		if ( VectorLength( delta ) > 100 ) continue;
		if ( level.time - spot->timestamp > 400 ) {
			return qtrue;
		}
	}
	return qfalse;
}

void player_freeze( gentity_t *self, gentity_t *attacker, int mod ) {
	if ( level.warmupTime ) {
		return;
	}
	if ( g_gametype.integer != GT_TEAM && g_gametype.integer != GT_CTF ) {
		return;
	}

	if ( self != attacker && OnSameTeam( self, attacker ) ) {
		return;
	}
	if ( self != attacker && g_gametype.integer == GT_CTF && redflag && blueflag ) {
		vec3_t	dist1, dist2;

		VectorSubtract( redflag, self->s.pos.trBase, dist1 );
		VectorSubtract( blueflag, self->s.pos.trBase, dist2 );

		if ( self->client->sess.sessionTeam == TEAM_RED ) {
			if ( VectorLength( dist1 ) < VectorLength( dist2 ) ) {
				return;
			}
		} else if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
			if ( VectorLength( dist2 ) < VectorLength( dist1 ) ) {
				return;
			}
		}
	}
	switch ( mod ) {
	case MOD_UNKNOWN:
	case MOD_WATER:
	case MOD_CRUSH:
	case MOD_TELEFRAG:
	//case MOD_FALLING:
	case MOD_SUICIDE:
	case MOD_TARGET_LASER:
	//case MOD_TRIGGER_HURT:
#ifdef MISSIONPACK
	case MOD_JUICED:
#endif
//	case MOD_GRAPPLE:
		return;
	}

	CopyToBody( self );
	self->r.maxs[ 2 ] = -8;
	self->freezeState = qtrue;
	check_time = ( level.time - 3000 ) + 200;

	self->takedamage = qfalse;
	self->s.eType = ET_INVISIBLE;
	self->r.contents = 0;
	self->health = GIB_HEALTH;

	if ( attacker->client && self != attacker && NearbyBody( self ) ) {
		attacker->client->ps.persistant[ PERS_DEFEND_COUNT ]++;
		attacker->client->ps.eFlags &= ~( EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
	}
}

qboolean readyCheck( void ) {
	int	i;
	gentity_t	*e;

	if ( level.warmupTime == 0 ) return qfalse;
	if ( !g_doReady.integer ) return qfalse;

	for ( i = 0; i < g_maxclients.integer; i++ ) {
		e = g_entities + i;
		if ( !e->inuse ) continue;
		if ( e->r.svFlags & SVF_BOT ) continue;
		if ( e->client->pers.connected == CON_DISCONNECTED ) continue;
		if ( e->client->sess.sessionTeam == TEAM_SPECTATOR ) continue;
		if ( !e->readyBegin ) return qtrue;
	}
	return qfalse;
}

gentity_t *SelectRandomDeathmatchSpawnPoint( void );

void Team_ForceGesture( int team );

void team_wins( int team ) {
	int	i;
	gentity_t	*e;
	char	*teamstr;
	gentity_t	*spawnPoint;
	int	j;
	int	flight;
	gclient_t	*cl;
	gentity_t	*te;

	spawnPoint = SelectRandomDeathmatchSpawnPoint();
	for ( i = 0; i < g_maxclients.integer; i++ ) {
		e = g_entities + i;
		cl = e->client;
		if ( !e->inuse ) continue;
		if ( e->freezeState ) {
			if ( !( g_dmflags.integer & 128 ) || cl->sess.sessionTeam != team ) {
				player_free( e );
			}
			continue;
		}
		if ( e->health < 1 ) continue;
		if ( is_spectator( cl ) ) continue;
		if ( g_dmflags.integer & 64 ) continue;

		if ( e->health < cl->ps.stats[ STAT_MAX_HEALTH ] ) {
			e->health = cl->ps.stats[ STAT_MAX_HEALTH ];
		}

		memset( cl->ps.ammo, 0, sizeof ( cl->ps.ammo ) );

		cl->ps.stats[ STAT_WEAPONS ] = 1 << WP_MACHINEGUN;
		cl->ps.ammo[ WP_MACHINEGUN ] = 50;

		cl->ps.stats[ STAT_WEAPONS ] |= 1 << WP_GAUNTLET;
		cl->ps.ammo[ WP_GAUNTLET ] = -1;
		cl->ps.ammo[ WP_GRAPPLING_HOOK ] = -1;

		cl->ps.weapon = WP_MACHINEGUN;
		cl->ps.weaponstate = WEAPON_READY;

		SpawnWeapon( cl );

		flight = cl->ps.powerups[ PW_FLIGHT ];
		if ( cl->ps.powerups[ PW_REDFLAG ] ) {
			memset( cl->ps.powerups, 0, sizeof ( cl->ps.powerups ) );
			cl->ps.powerups[ PW_REDFLAG ] = INT_MAX;
		} else if ( cl->ps.powerups[ PW_BLUEFLAG ] ) {
			memset( cl->ps.powerups, 0, sizeof ( cl->ps.powerups ) );
			cl->ps.powerups[ PW_BLUEFLAG ] = INT_MAX;
		} else if ( cl->ps.powerups[ PW_NEUTRALFLAG ] ) {
			memset( cl->ps.powerups, 0, sizeof ( cl->ps.powerups ) );
			cl->ps.powerups[ PW_NEUTRALFLAG ] = INT_MAX;
		} else {
			memset( cl->ps.powerups, 0, sizeof ( cl->ps.powerups ) );
		}
		cl->ps.powerups[ PW_FLIGHT ] = flight;

		cl->ps.stats[ STAT_ARMOR ] = 0;

		if ( !( g_dmflags.integer & 1024 ) ) G_UseTargets( spawnPoint, e );
		cl->ps.weapon = 1;
		for ( j = WP_NUM_WEAPONS - 1; j > 0; j-- ) {
			if ( cl->ps.stats[ STAT_WEAPONS ] & ( 1 << j ) ) {
				cl->ps.weapon = j;
				break;
			}
		}
		if ( cl->ps.stats[ STAT_WEAPONS ] & ( 1 << WP_ROCKET_LAUNCHER ) ) {
			cl->ps.weapon = WP_ROCKET_LAUNCHER;
		}

		if ( g_startArmor.integer > 0 ) {
			cl->ps.stats[ STAT_ARMOR ] += g_startArmor.integer;
			if ( cl->ps.stats[ STAT_ARMOR ] > cl->ps.stats[ STAT_MAX_HEALTH ] * 2 ) {
				cl->ps.stats[ STAT_ARMOR ] = cl->ps.stats[ STAT_MAX_HEALTH ] * 2;
			}
		}
	}

	if ( level.numPlayingClients < 2 || g_gametype.integer == GT_CTF ) {
		return;
	}

	te = G_TempEntity( vec3_origin, EV_GLOBAL_TEAM_SOUND );
	if ( team == TEAM_RED ) {
		teamstr = "Red";
		te->s.eventParm = GTS_BLUE_CAPTURE;
	} else {
		teamstr = "Blue";
		te->s.eventParm = GTS_RED_CAPTURE;
	}
	te->r.svFlags |= SVF_BROADCAST;

	trap_SendServerCommand( -1, va( "cp \"" S_COLOR_MAGENTA "%s " S_COLOR_WHITE "team scores!\n\"", teamstr ) );
	trap_SendServerCommand( -1, va( "print \"%s team scores!\n\"", teamstr ) );

	AddTeamScore( vec3_origin, team, 1 );
	Team_ForceGesture( team );

	CalculateRanks();
}

static qboolean CalculateScores( int team ) {
	int	i;
	gentity_t	*e;
	qboolean	modified = qfalse;

	for ( i = 0; i < g_maxclients.integer; i++ ) {
		e = g_entities + i;
		if ( !e->inuse ) continue;
		if ( e->client->sess.sessionTeam != team ) continue;
		if ( e->freezeState ) {
			modified = qtrue;
			continue;
		}
		if ( e->client->pers.connected == CON_CONNECTING ) continue;
		if ( ( e->health < 1 || is_spectator( e->client ) ) && level.time > e->client->respawnTime ) continue;
		return qfalse;
	}
	if ( modified ) {
		team_wins( OtherTeam( team ) );
	}
	return modified;
}

void CheckDelay( void ) {
	int	i;
	gentity_t	*e;
	int	readyMask;

	readyMask = 0;
	for ( i = 0; i < g_maxclients.integer; i++ ) {
		e = g_entities + i;
		if ( !e->inuse ) continue;
		if ( level.warmupTime != 0 && !e->readyBegin ) continue;
		if ( level.warmupTime == 0 && !e->freezeState ) continue;
		if ( i < 16 ) {
			readyMask |= 1 << i;
		}
	}
	for ( i = 0; i < g_maxclients.integer; i++ ) {
		e = g_entities + i;
		if ( !e->inuse ) continue;
		e->client->ps.stats[ STAT_CLIENTS_READY ] = readyMask;
	}

	if ( check_time > level.time - 3000 ) {
		return;
	}
	check_time = level.time;

	if ( !CalculateScores( TEAM_RED ) ) {
		CalculateScores( TEAM_BLUE );
	}
}

void SP_target_location( gentity_t *self );

void locationSpawn( gentity_t *ent, gitem_t *item ) {
	gentity_t	*e;

	switch ( item->giType ) {
	case IT_AMMO:
		return;
	case IT_ARMOR:
		if ( Q_stricmp( item->classname, "item_armor_shard" ) ) {
			break;
		}
		return;
	case IT_HEALTH:
		if ( !Q_stricmp( item->classname, "item_health_mega" ) ) {
			break;
		}
		return;
	case IT_PERSISTANT_POWERUP:
		return;
	case IT_TEAM:
		if ( item->giTag == PW_BLUEFLAG ) {
			VectorCopy( ent->r.currentOrigin, blueflag );
		} else if ( item->giTag == PW_REDFLAG ) {
			VectorCopy( ent->r.currentOrigin, redflag );
		}
	}

	e = G_Spawn();
	e->classname = "target_location";
	e->message = item->pickup_name;
	e->count = 255;
	VectorCopy( ent->r.currentOrigin, e->s.origin );

	SP_target_location( e );
}

void Weapon_GrapplingHook_Fire(	gentity_t *ent );

void Hook_Fire( gentity_t *ent ) {
	gclient_t	*client;
	usercmd_t	*ucmd;
	/*
	if ( g_grapple.integer < 1 ) {
		return;
	}
	*/

	client = ent->client;
	if ( client->ps.weapon == WP_GRAPPLING_HOOK ) {
		return;
	}
	if ( client->ps.pm_type != PM_NORMAL ) {
		return;
	}

	ucmd = &client->pers.cmd;
	if ( client->hook && !( ucmd->buttons & 32 ) ) {
		Weapon_HookFree( client->hook );
	}
	if ( !client->hook && ( ucmd->buttons & 32 ) ) {
		if ( ent->timestamp > level.time - 400 ) {
			return;
		}
		client->fireHeld = qfalse;
		Weapon_GrapplingHook_Fire( ent );
	}
}

char *ConcatArgs( int start );

void Cmd_Drop_f( gentity_t *ent ) {
	char	*name;
	gitem_t	*it;
	gentity_t	*drop;
	int	quantity;
	int	j;

	if ( is_spectator( ent->client ) ) {
		return;
	}
	if ( ent->health <= 0 ) {
		return;
	}
	name = ConcatArgs( 1 );
	it = BG_FindItem( name );
	if ( !Registered( it ) ) {
		return;
	}

	j = it->giTag;
	switch ( it->giType ) {
	case IT_WEAPON:
		if ( g_dmflags.integer & 256 ) {
			return;
		}
		if ( !( ent->client->ps.stats[ STAT_WEAPONS ] & ( 1 << j ) ) ) {
			return;
		}
		if ( ent->client->ps.weaponstate != WEAPON_READY ) {
			return;
		}
		if ( j == ent->s.weapon ) {
			return;
		}
		if ( j > WP_MACHINEGUN && j != WP_GRAPPLING_HOOK && ent->client->ps.ammo[ j ] ) {
			drop = Drop_Item( ent, it, 0 );
			drop->count = 1;
			drop->s.otherEntityNum = ent->s.clientNum + 1;
			ent->client->ps.stats[ STAT_WEAPONS ] &= ~( 1 << j );
			ent->client->ps.ammo[ j ] -= 1;
		}
		break;
	case IT_AMMO:
		quantity = ent->client->ps.ammo[ j ];
		if ( !quantity ) {
			return;
		}
		if ( quantity > it->quantity ) {
			quantity = it->quantity;
		}
		drop = Drop_Item( ent, it, 0 );
		drop->count = quantity;
		drop->s.otherEntityNum = ent->s.clientNum + 1;
		ent->client->ps.ammo[ j ] -= quantity;
		break;
	case IT_POWERUP:
		if ( ent->client->ps.powerups[ j ] > level.time ) {
			drop = Drop_Item( ent, it, 0 );
			drop->count = ( ent->client->ps.powerups[ j ] - level.time ) / 1000;
			if ( drop->count < 1 ) {
				drop->count = 1;
			}
			drop->s.otherEntityNum = ent->s.clientNum + 1;
			ent->client->ps.powerups[ j ] = 0;
		}
		break;
	case IT_HOLDABLE:
		if ( j == HI_KAMIKAZE ) {
			return;
		}
		if ( bg_itemlist[ ent->client->ps.stats[ STAT_HOLDABLE_ITEM ] ].giTag == j ) {
			drop = Drop_Item( ent, it, 0 );
			drop->s.otherEntityNum = ent->s.clientNum + 1;
			ent->client->ps.stats[ STAT_HOLDABLE_ITEM ] = 0;
		}
		break;
	}
}

void Cmd_Ready_f( gentity_t *ent ) {
	ent->readyBegin = qtrue;
	trap_SendServerCommand( ent - g_entities, "print \"ready\n\"" );
}



int G_ItemDisabled( gitem_t *item );

qboolean WeaponDisabled( gitem_t *item ) {
	if ( g_weaponlimit.integer & 1 ) {
		if ( !Q_stricmp( item->classname, "ammo_bullets" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 2 ) {
		if ( !Q_stricmp( item->classname, "weapon_shotgun" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_shells" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 4 ) {
		if ( !Q_stricmp( item->classname, "weapon_grenadelauncher" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_grenades" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 8 ) {
		if ( !Q_stricmp( item->classname, "weapon_rocketlauncher" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_rockets" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 16 ) {
		if ( !Q_stricmp( item->classname, "weapon_lightning" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_lightning" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 32 ) {
		if ( !Q_stricmp( item->classname, "weapon_railgun" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_slugs" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 64 ) {
		if ( !Q_stricmp( item->classname, "weapon_plasmagun" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_cells" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 128 ) {
		if ( !Q_stricmp( item->classname, "weapon_bfg" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_bfg" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 256 ) {
		if ( !Q_stricmp( item->classname, "weapon_nailgun" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_nails" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 512 ) {
		if ( !Q_stricmp( item->classname, "weapon_prox_launcher" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_mines" ) ) {
			return qtrue;
		}
	}
	if ( g_weaponlimit.integer & 1024 ) {
		if ( !Q_stricmp( item->classname, "weapon_chaingun" ) ) {
			return qtrue;
		}
		if ( !Q_stricmp( item->classname, "ammo_belt" ) ) {
			return qtrue;
		}
	}

	if ( G_ItemDisabled( item ) ) {
		return qtrue;
	}
	return qfalse;
}

void RegisterWeapon( void ) {
	if ( g_wpflags.integer & 2 ) {
		RegisterItem( BG_FindItemForWeapon( WP_SHOTGUN ) );
	}
	if ( g_wpflags.integer & 4 ) {
		RegisterItem( BG_FindItemForWeapon( WP_GRENADE_LAUNCHER ) );
	}
	if ( g_wpflags.integer & 8 ) {
		RegisterItem( BG_FindItemForWeapon( WP_ROCKET_LAUNCHER ) );
	}
	if ( g_wpflags.integer & 16 ) {
		RegisterItem( BG_FindItemForWeapon( WP_LIGHTNING ) );
	}
	if ( g_wpflags.integer & 32 ) {
		RegisterItem( BG_FindItemForWeapon( WP_RAILGUN ) );
	}
	if ( g_wpflags.integer & 64 ) {
		RegisterItem( BG_FindItemForWeapon( WP_PLASMAGUN ) );
	}
	if ( g_wpflags.integer & 128 ) {
		RegisterItem( BG_FindItemForWeapon( WP_BFG ) );
	}
	if ( g_wpflags.integer & 512 ) {
		RegisterItem( BG_FindItemForWeapon( WP_PROX_LAUNCHER ) );
	}

#ifdef MISSIONPACK
	if ( g_wpflags.integer & 256 ) {
		RegisterItem( BG_FindItemForWeapon( WP_NAILGUN ) );
	}
	if ( g_wpflags.integer & 512 ) {
		RegisterItem( BG_FindItemForWeapon( WP_PROX_LAUNCHER ) );
	}
	if ( g_wpflags.integer & 1024 ) {
		RegisterItem( BG_FindItemForWeapon( WP_CHAINGUN ) );
	}
#endif
	/*
	if ( g_grapple.integer > 0 ) {
		RegisterItem( BG_FindItemForWeapon( WP_GRAPPLING_HOOK ) );
	} */

	VectorClear( redflag );
	VectorClear( blueflag );
}

void SpawnWeapon( gclient_t *client ) {
	int	i;

	if ( g_weaponlimit.integer & 1 && !( g_wpflags.integer & 1 ) ) {
		client->ps.stats[ STAT_WEAPONS ] &= ~( 1 << WP_MACHINEGUN );
		client->ps.ammo[ WP_MACHINEGUN ] = 0;
	}
	if ( g_wpflags.integer & 2 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_SHOTGUN;
		client->ps.ammo[ WP_SHOTGUN ] = 10;
	}
	if ( g_wpflags.integer & 4 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_GRENADE_LAUNCHER;
		client->ps.ammo[ WP_GRENADE_LAUNCHER ] = 5;
	}
	if ( g_wpflags.integer & 8 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_ROCKET_LAUNCHER;
		client->ps.ammo[ WP_ROCKET_LAUNCHER ] = 5;
	}
	if ( g_wpflags.integer & 16 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_LIGHTNING;
		client->ps.ammo[ WP_LIGHTNING ] = 60;
	}
	if ( g_wpflags.integer & 32 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_RAILGUN;
		client->ps.ammo[ WP_RAILGUN ] = 10;
	}
	if ( g_wpflags.integer & 64 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_PLASMAGUN;
		client->ps.ammo[ WP_PLASMAGUN ] = 30;
	}
	if ( g_wpflags.integer & 128 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_BFG;
		client->ps.ammo[ WP_BFG ] = 15;
	}
	if ( g_wpflags.integer & 512 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_PROX_LAUNCHER;
		client->ps.ammo[ WP_PROX_LAUNCHER ] = 10;
	}
#ifdef MISSIONPACK
	if ( g_wpflags.integer & 256 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_NAILGUN;
		client->ps.ammo[ WP_NAILGUN ] = 20;
	}
	if ( g_wpflags.integer & 512 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_PROX_LAUNCHER;
		client->ps.ammo[ WP_PROX_LAUNCHER ] = 10;
	}
	if ( g_wpflags.integer & 1024 ) {
		client->ps.stats[ STAT_WEAPONS ] |= 1 << WP_CHAINGUN;
		client->ps.ammo[ WP_CHAINGUN ] = 100;
	}
#endif

	if ( g_dmflags.integer & 1024 ) {
		for ( i = 0; i < MAX_WEAPONS; i++ ) {
			client->ps.ammo[ i ] = 999;
		}
	}
}

int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[ 2 ] );

int InvulnerabilityEffect( gentity_t *targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir ) {
	vec3_t	intersections[ 2 ], vec;
	int	n;

	if ( !targ->freezeState ) {
		return qfalse;
	}
	VectorCopy( dir, vec );
	VectorInverse( vec );
	n = RaySphereIntersections( targ->r.currentOrigin, 42, point, vec, intersections );
	if ( n > 0 ) {
		VectorSubtract( intersections[ 0 ], targ->r.currentOrigin, vec );
		if ( impactpoint ) {
			VectorCopy( intersections[ 0 ], impactpoint );
		}
		if ( bouncedir ) {
			VectorCopy( vec, bouncedir );
			VectorNormalize( bouncedir );
		}
		return qtrue;
	}
	return qfalse;
}
