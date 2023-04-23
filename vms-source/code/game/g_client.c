// 2017 Trepidation Licensed under the GPL2 - Team Trepidation / N5 Networks
//
#include "g_local.h"

// g_client.c -- client functions that don't happen every frame

static vec3_t	playerMins = {-15, -15, -24};
static vec3_t	playerMaxs = {15, 15, 32};

/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
potential spawning position for deathmatch games.
The first time a player enters the game, they will be at an 'initial' spot.
Targets will be fired when someone spawns in on them.
"nobots" will prevent bots from using this spot.
"nohumans" will prevent non-bots from using this spot.
*/
void SP_info_player_deathmatch( gentity_t *ent ) {
	int		i;

	G_SpawnInt( "nobots", "0", &i);
	if ( i ) {
		ent->flags |= FL_NO_BOTS;
	}
	G_SpawnInt( "nohumans", "0", &i );
	if ( i ) {
		ent->flags |= FL_NO_HUMANS;
	}
}

/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
equivelant to info_player_deathmatch
*/
void SP_info_player_start(gentity_t *ent) {
	ent->classname = "info_player_deathmatch";
	SP_info_player_deathmatch( ent );
}

/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
The intermission will be viewed from this point.  Target an info_notnull for the view direction.
*/
void SP_info_player_intermission( gentity_t *ent ) {

}



/*
=======================================================================

  SelectSpawnPoint

=======================================================================
*/

/*
================
SpotWouldTelefrag

================
*/
qboolean SpotWouldTelefrag( gentity_t *spot ) {
	int			i, num;
	int			touch[MAX_GENTITIES];
	gentity_t	*hit;
	vec3_t		mins, maxs;

	VectorAdd( spot->s.origin, playerMins, mins );
	VectorAdd( spot->s.origin, playerMaxs, maxs );
	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );

	for (i=0 ; i<num ; i++) {
		hit = &g_entities[touch[i]];
		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
		if ( hit->client) {
			return qtrue;
		}

	}

	return qfalse;
}

/*
================
SelectNearestDeathmatchSpawnPoint

Find the spot that we DON'T want to use
================
*/
#define	MAX_SPAWN_POINTS	128
gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
	gentity_t	*spot;
	vec3_t		delta;
	float		dist, nearestDist;
	gentity_t	*nearestSpot;

	nearestDist = 999999;
	nearestSpot = NULL;
	spot = NULL;

	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {

		VectorSubtract( spot->s.origin, from, delta );
		dist = VectorLength( delta );
		if ( dist < nearestDist ) {
			nearestDist = dist;
			nearestSpot = spot;
		}
	}

	return nearestSpot;
}


/*
================
SelectRandomDeathmatchSpawnPoint

go to a random point that doesn't telefrag
================
*/
#define	MAX_SPAWN_POINTS	128
gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
	gentity_t	*spot;
	int			count;
	int			selection;
	gentity_t	*spots[MAX_SPAWN_POINTS];

	count = 0;
	spot = NULL;

	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
		if ( SpotWouldTelefrag( spot ) ) {
			continue;
		}
		spots[ count ] = spot;
		count++;
	}

	if ( !count ) {	// no spots that won't telefrag
		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
	}

	selection = rand() % count;
	return spots[ selection ];
}

/*
===========
SelectRandomFurthestSpawnPoint

Chooses a player start, deathmatch start, etc
============
*/
extern gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ); // Bad Bad

gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
	gentity_t	*spot;
	vec3_t		delta;
	float		dist;
	float		list_dist[64];
	gentity_t	*list_spot[64];
	int			numSpots, rnd, i, j;

	numSpots = 0;
	spot = NULL;

	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
		if ( SpotWouldTelefrag( spot ) ) {
			continue;
		}
		VectorSubtract( spot->s.origin, avoidPoint, delta );
		dist = VectorLength( delta );
		for (i = 0; i < numSpots; i++) {
			if ( dist > list_dist[i] ) {
				if ( numSpots >= 64 )
					numSpots = 64-1;
				for (j = numSpots; j > i; j--) {
					list_dist[j] = list_dist[j-1];
					list_spot[j] = list_spot[j-1];
				}
				list_dist[i] = dist;
				list_spot[i] = spot;
				numSpots++;
				if (numSpots > 64)
					numSpots = 64;
				break;
			}
		}
		if (i >= numSpots && numSpots < 64) {
			list_dist[numSpots] = dist;
			list_spot[numSpots] = spot;
			numSpots++;
		}
	}
	if (!numSpots) {
		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
		if (!spot)
		{
			//G_Error( "Couldn't find a spawn point" );  // This is a workaround for skarekrows maps
			//G_Printf("Unable To Locate Spawnpoint using CTF Spawns as fallback.\n");
			//Com_Printf( "Unable To Locate Spawnpoint using CTF Spawns as fallback.");
			spot = SelectRandomTeamSpawnPoint ( TEAM_BEGIN, irandom(1,2) );			   // This is bad bad bad

		}

		VectorCopy (spot->s.origin, origin);
		origin[2] += 9;
		VectorCopy (spot->s.angles, angles);
		return spot;
	}

	// select a random spot from the spawn points furthest away
	rnd = random() * (numSpots / 2);

	VectorCopy (list_spot[rnd]->s.origin, origin);
	origin[2] += 9;
	VectorCopy (list_spot[rnd]->s.angles, angles);

	return list_spot[rnd];
}

/*
===========
SelectSpawnPoint

Chooses a player start, deathmatch start, etc
============
*/
gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );

	/*
	gentity_t	*spot;
	gentity_t	*nearestSpot;

	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );

	spot = SelectRandomDeathmatchSpawnPoint ( );
	if ( spot == nearestSpot ) {
		// roll again if it would be real close to point of death
		spot = SelectRandomDeathmatchSpawnPoint ( );
		if ( spot == nearestSpot ) {
			// last try
			spot = SelectRandomDeathmatchSpawnPoint ( );
		}		
	}

	// find a single player start spot
	if (!spot) {
		G_Error( "Couldn't find a spawn point" );
	}

	VectorCopy (spot->s.origin, origin);
	origin[2] += 9;
	VectorCopy (spot->s.angles, angles);

	return spot;
	*/
}

/*
===========
SelectInitialSpawnPoint

Try to find a spawn point marked 'initial', otherwise
use normal spawn selection.
============
*/
gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
	gentity_t	*spot;

	spot = NULL;
	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
		if ( spot->spawnflags & 1 ) {
			break;
		}
	}

	if ( !spot || SpotWouldTelefrag( spot ) ) {
		return SelectSpawnPoint( vec3_origin, origin, angles );
	}

	VectorCopy (spot->s.origin, origin);
	origin[2] += 9;
	VectorCopy (spot->s.angles, angles);

	return spot;
}

/*
===========
SelectSpectatorSpawnPoint

============
*/
gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
	FindIntermissionPoint();

	VectorCopy( level.intermission_origin, origin );
	VectorCopy( level.intermission_angle, angles );

	return NULL;
}

/*
=======================================================================

BODYQUE

=======================================================================
*/

/*
===============
InitBodyQue
===============
*/
void InitBodyQue (void) {
	int		i;
	gentity_t	*ent;

	level.bodyQueIndex = 0;
	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
		ent = G_Spawn();
		ent->classname = "bodyque";
		ent->neverFree = qtrue;
		level.bodyQue[i] = ent;
	}
}

/*
=============
BodySink

After sitting around for five seconds, fall into the ground and dissapear
=============
*/
void BodySink( gentity_t *ent ) {
	if ( level.time - ent->timestamp > 6500 ) {
		// the body ques are never actually freed, they are just unlinked
		trap_UnlinkEntity( ent );
		ent->physicsObject = qfalse;
		return;	
	}
	ent->nextthink = level.time + 100;
	ent->s.pos.trBase[2] -= 1;
}

/*
=============
CopyToBodyQue

A player is respawning, so make an entity that looks
just like the existing corpse to leave behind.
=============
*/
void CopyToBodyQue( gentity_t *ent ) {
#ifdef MISSIONPACK
	gentity_t	*e;
	int i;
#endif
	gentity_t		*body;
	int			contents;

	trap_UnlinkEntity (ent);

	// if client is in a nodrop area, don't leave the body
	contents = trap_PointContents( ent->s.origin, -1 );
	if ( contents & CONTENTS_NODROP ) {
		return;
	}

	// grab a body que and cycle to the next one
	body = level.bodyQue[ level.bodyQueIndex ];
	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;

	trap_UnlinkEntity (body);

	body->s = ent->s;
	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
#ifdef MISSIONPACK
	if ( ent->s.eFlags & EF_KAMIKAZE ) {
		body->s.eFlags |= EF_KAMIKAZE;

		// check if there is a kamikaze timer around for this owner
		for (i = 0; i < MAX_GENTITIES; i++) {
			e = &g_entities[i];
			if (!e->inuse)
				continue;
			if (e->activator != ent)
				continue;
			if (strcmp(e->classname, "kamikaze timer"))
				continue;
			e->activator = body;
			break;
		}
	}
#endif
	body->s.powerups = 0;	// clear powerups
	body->s.loopSound = 0;	// clear lava burning
	body->s.number = body - g_entities;
	body->timestamp = level.time;
	body->physicsObject = qtrue;
	body->physicsBounce = 0;		// don't bounce
	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
		body->s.pos.trType = TR_GRAVITY;
		body->s.pos.trTime = level.time;
		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
	} else {
		body->s.pos.trType = TR_STATIONARY;
	}
	body->s.event = 0;

	// change the animation to the last-frame only, so the sequence
	// doesn't repeat anew for the body
	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
	case BOTH_DEATH1:
	case BOTH_DEAD1:
		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
		break;
	case BOTH_DEATH2:
	case BOTH_DEAD2:
		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
		break;
	case BOTH_DEATH3:
	case BOTH_DEAD3:
	default:
		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
		break;
	}

	body->r.svFlags = ent->r.svFlags;
	VectorCopy (ent->r.mins, body->r.mins);
	VectorCopy (ent->r.maxs, body->r.maxs);
	VectorCopy (ent->r.absmin, body->r.absmin);
	VectorCopy (ent->r.absmax, body->r.absmax);

	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
	body->r.contents = CONTENTS_CORPSE;
	body->r.ownerNum = ent->s.number;

	body->nextthink = level.time + 5000;
	body->think = BodySink;

	body->die = body_die;

	// don't take more damage if already gibbed
	if ( ent->health <= GIB_HEALTH ) {
		body->takedamage = qfalse;
	} else {
		body->takedamage = qtrue;
	}

	// Shafe - Trep - Headshots
	if(ent->client->noHead) { 
		G_AddEvent( body,EV_BODY_NOHEAD,0 );
	}
	// Shafe - Trep - End Headshots

	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
	trap_LinkEntity (body);
}

//======================================================================


/*
==================
SetClientViewAngle

==================
*/
void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
	int			i;

	// set the delta angle
	for (i=0 ; i<3 ; i++) {
		int		cmdAngle;

		cmdAngle = ANGLE2SHORT(angle[i]);
		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
	}
	VectorCopy( angle, ent->s.angles );
	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
}

/*
================
respawn
================
*/
void respawn( gentity_t *ent ) {
	gentity_t	*tent;

	CopyToBodyQue (ent);
	ClientSpawn(ent);

	// add a teleportation effect
	tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
	tent->s.clientNum = ent->s.clientNum;
}

/*
================
TeamCount

Returns number of players on a team
================
*/
team_t TeamCount( int ignoreClientNum, int team ) {
	int		i;
	int		count = 0;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( i == ignoreClientNum ) {
			continue;
		}
		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
			continue;
		}
		if ( level.clients[i].sess.sessionTeam == team ) {
			count++;
		}
	}

	return count;
}

/*
================
TeamLeader

Returns the client number of the team leader
================
*/
int TeamLeader( int team ) {
	int		i;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
			continue;
		}
		if ( level.clients[i].sess.sessionTeam == team ) {
			if ( level.clients[i].sess.teamLeader )
				return i;
		}
	}

	return -1;
}


/*
================
PickTeam

================
*/
team_t PickTeam( int ignoreClientNum ) {
	int		counts[TEAM_NUM_TEAMS];

//	if(g_GameMode.integer != 999)
//	{
		counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
		counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );

		if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
			return TEAM_RED;
		}
		if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
			return TEAM_BLUE;
		}
		// equal team count, so join the team with the lowest score
		if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
			return TEAM_RED;
		}
		return TEAM_BLUE;
//	}
	
}

/*
===========
ForceClientSkin

Forces a client's skin (for teamplay)
===========
*/
/*
static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
	char *p;

	if ((p = Q_strrchr(model, '/')) != 0) {
		*p = 0;
	}

	Q_strcat(model, MAX_QPATH, "/");
	Q_strcat(model, MAX_QPATH, skin);
}
*/

/*
===========
ClientCheckName
============
*/
static void ClientCleanName( const char *in, char *out, int outSize ) {
	int		len, colorlessLen;
	char	ch;
	char	*p;
	int		spaces;

	//save room for trailing null byte
	outSize--;

	len = 0;
	colorlessLen = 0;
	p = out;
	*p = 0;
	spaces = 0;

	while( 1 ) {
		ch = *in++;
		if( !ch ) {
			break;
		}

		// don't allow leading spaces
		if( !*p && ch == ' ' ) {
			continue;
		}

		// check colors
		if( ch == Q_COLOR_ESCAPE ) {
			// solo trailing carat is not a color prefix
			if( !*in ) {
				break;
			}

			// don't allow black in a name, period
			if( ColorIndex(*in) == 0 ) {
				in++;
				continue;
			}

			// make sure room in dest for both chars
			if( len > outSize - 2 ) {
				break;
			}

			*out++ = ch;
			*out++ = *in++;
			len += 2;
			continue;
		}

		// don't allow too many consecutive spaces
		if( ch == ' ' ) {
			spaces++;
			if( spaces > 3 ) {
				continue;
			}
		}
		else {
			spaces = 0;
		}

		if( len > outSize - 1 ) {
			break;
		}

		*out++ = ch;
		colorlessLen++;
		len++;
	}
	*out = 0;

	// don't allow empty names
	if( *p == 0 || colorlessLen == 0 ) {
		Q_strncpyz( p, "UnnamedPlayer", outSize );
	}
}


/*
===========
ClientUserInfoChanged

Called from ClientConnect when the player first connects and
directly by the server system when the player updates a userinfo variable.

The game can override any of the settings and call trap_SetUserinfo
if desired.
============
*/
void ClientUserinfoChanged( int clientNum ) {
	gentity_t *ent;
	int		teamTask, teamLeader, team, health;
	char	*s;
	char	model[MAX_QPATH];
	char	headModel[MAX_QPATH];
	char	oldname[MAX_STRING_CHARS];
	gclient_t	*client;
	char	c1[MAX_INFO_STRING];
	char	c2[MAX_INFO_STRING];
	char	redTeam[MAX_INFO_STRING];
	char	blueTeam[MAX_INFO_STRING];
	char	userinfo[MAX_INFO_STRING];

	ent = g_entities + clientNum;
	client = ent->client;

	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );

	// check for malformed or illegal info strings
	if ( !Info_Validate(userinfo) ) {
		strcpy (userinfo, "\\name\\badinfo");
	}

	// check for local client
	s = Info_ValueForKey( userinfo, "ip" );
	if ( !strcmp( s, "localhost" ) ) {
		client->pers.localClient = qtrue;
	}

	// check the item prediction
	s = Info_ValueForKey( userinfo, "cg_predictItems" );
	if ( !atoi( s ) ) {
		client->pers.predictItemPickup = qfalse;
	} else {
		client->pers.predictItemPickup = qtrue;
	}

//unlagged - client options
	// see if the player has opted out
	s = Info_ValueForKey( userinfo, "cg_delag" );
	if ( !atoi( s ) ) {
		client->pers.delag = 0;
	} else {
		client->pers.delag = atoi( s );
	}

	// see if the player is nudging his shots
	s = Info_ValueForKey( userinfo, "cg_cmdTimeNudge" );
	client->pers.cmdTimeNudge = atoi( s );

	// see if the player wants to debug the backward reconciliation
	s = Info_ValueForKey( userinfo, "cg_debugDelag" );
	if ( !atoi( s ) ) {
		client->pers.debugDelag = qfalse;
	}
	else {
		client->pers.debugDelag = qtrue;
	}

	// see if the player is simulating incoming latency
	s = Info_ValueForKey( userinfo, "cg_latentSnaps" );
	client->pers.latentSnaps = atoi( s );

	// see if the player is simulating outgoing latency
	s = Info_ValueForKey( userinfo, "cg_latentCmds" );
	client->pers.latentCmds = atoi( s );

	// see if the player is simulating outgoing packet loss
	s = Info_ValueForKey( userinfo, "cg_plOut" );
	client->pers.plOut = atoi( s );
//unlagged - client options

	// set name
	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
	s = Info_ValueForKey (userinfo, "name");
	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );

	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
		}
	}

	if ( client->pers.connected == CON_CONNECTED ) {
		if ( strcmp( oldname, client->pers.netname ) ) {
			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, 
				client->pers.netname) );
		}
	}

	// set max health
#ifdef MISSIONPACK
	if (client->ps.powerups[PW_GUARD]) {
		client->pers.maxHealth = 200;
	} else {
		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
		client->pers.maxHealth = health;
		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
			client->pers.maxHealth = 100;
		}
	}
#else
	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
	client->pers.maxHealth = health;
	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
		client->pers.maxHealth = 100;
	}
#endif
	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;

	// set model
	if( g_gametype.integer >= GT_TEAM ) {
		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
	} else {
		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
	}

	// bots set their team a few frames later
	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
		s = Info_ValueForKey( userinfo, "team" );
		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
			team = TEAM_RED;
		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
			team = TEAM_BLUE;
		} else {
			// pick the team with the least number of players	
			team = PickTeam( clientNum );
		}
	}
	else {
		team = client->sess.sessionTeam;
	}

/*	NOTE: all client side now

	// team
	switch( team ) {
	case TEAM_RED:
		ForceClientSkin(client, model, "red");
//		ForceClientSkin(client, headModel, "red");
		break;
	case TEAM_BLUE:
		ForceClientSkin(client, model, "blue");
//		ForceClientSkin(client, headModel, "blue");
		break;
	}
	// don't ever use a default skin in teamplay, it would just waste memory
	// however bots will always join a team but they spawn in as spectator
	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
		ForceClientSkin(client, model, "red");
//		ForceClientSkin(client, headModel, "red");
	}
*/

#ifdef MISSIONPACK
	if (g_gametype.integer >= GT_TEAM) {
		client->pers.teamInfo = qtrue;
	} else {
		s = Info_ValueForKey( userinfo, "teamoverlay" );
		if ( ! *s || atoi( s ) != 0 ) {
			client->pers.teamInfo = qtrue;
		} else {
			client->pers.teamInfo = qfalse;
		}
	}
#else
	// teamInfo
	s = Info_ValueForKey( userinfo, "teamoverlay" );
	if ( ! *s || atoi( s ) != 0 ) {
		client->pers.teamInfo = qtrue;
	} else {
		client->pers.teamInfo = qfalse;
	}
#endif
	/*
	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
	if ( !*s || atoi( s ) == 0 ) {
		client->pers.pmoveFixed = qfalse;
	}
	else {
		client->pers.pmoveFixed = qtrue;
	}
	*/

	// team task (0 = none, 1 = offence, 2 = defence)
	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
	// team Leader (1 = leader, 0 is normal player)
	teamLeader = client->sess.teamLeader;

	// colors
	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));

	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));

	// send over a subset of the userinfo keys so other clients can
	// print scoreboards, display models, and play custom sounds
	if ( ent->r.svFlags & SVF_BOT ) {
		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
			client->pers.netname, team, model, headModel, c1, c2, 
			client->pers.maxHealth, client->sess.wins, client->sess.losses,
			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
	} else {
		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
			client->pers.netname, client->sess.sessionTeam, model, headModel, redTeam, blueTeam, c1, c2, 
			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
	}

	trap_SetConfigstring( CS_PLAYERS+clientNum, s );

	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
}


/*
===========
ClientConnect

Called when a player begins connecting to the server.
Called again for every map change or tournement restart.

The session information will be valid after exit.

Return NULL if the client should be allowed, otherwise return
a string with the reason for denial.

Otherwise, the client will be sent the current gamestate
and will eventually get to ClientBegin.

firstTime will be qtrue the very first time a client connects
to the server machine, but qfalse on map changes and tournement
restarts.
============
*/
char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
	char		*value;
//	char		*areabits;
	gclient_t	*client;
	char		userinfo[MAX_INFO_STRING];
	gentity_t	*ent;
	char		guid[ 33 ];
	ent = &g_entities[ clientNum ];

	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );



	// Admin System
	value = Info_ValueForKey( userinfo, "cl_guid" );
	Q_strncpyz( guid, value, sizeof( guid ) );

	// check to see if they are on the banned IP list
	value = Info_ValueForKey (userinfo, "ip");
	if ( G_FilterPacket( value ) ) {
		return "Banned.";
	}

	if ( !( ent->r.svFlags & SVF_BOT ) ) {
		// check for a password
		value = Info_ValueForKey (userinfo, "password");
		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
			strcmp( g_password.string, value) != 0) {
			return "Invalid password";
		}
	}

	// they can connect
	ent->client = level.clients + clientNum;
	client = ent->client;

//	areabits = client->areabits;

	memset( client, 0, sizeof(*client) );



  // add guid to session so we don't have to keep parsing userinfo everywhere /*
  if( !guid[0] )
  {
    Q_strncpyz( client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      sizeof( client->pers.guid ) );
  }
  else
  {
    Q_strncpyz( client->pers.guid, guid, sizeof( client->pers.guid ) );
  }
	/* Admin System TJW
	Q_strncpyz( client->pers.ip, ip, sizeof( client->pers.ip ) );
	client->pers.adminLevel = G_admin_level( ent );
	*/
  

	client->pers.connected = CON_CONNECTING;

	// read or initialize the session data
	if ( firstTime || level.newSession ) {
		G_InitSessionData( client, userinfo );
	}
	G_ReadSessionData( client );

	if( isBot ) {
		ent->r.svFlags |= SVF_BOT;
		ent->inuse = qtrue;
		if( !G_BotConnect( clientNum, !firstTime ) ) {
			return "BotConnectfailed";
		}
	}

	// get and distribute relevent paramters
	G_LogPrintf( "ClientConnect: %i\n", clientNum );
	ClientUserinfoChanged( clientNum );

	// don't do the "xxx connected" messages if they were caried over from previous level
	if ( firstTime ) {
		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
	}

	if ( g_gametype.integer >= GT_TEAM &&
		client->sess.sessionTeam != TEAM_SPECTATOR ) {
		BroadcastTeamChange( client, -1 );
	}

	// count current clients and rank for scoreboard
	CalculateRanks();

	// for statistics
//	client->areabits = areabits;
//	if ( !client->areabits )
//		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );

//unlagged - backward reconciliation #5
	// announce it
	trap_SendServerCommand( clientNum, "print \"Trepidation Dev Snapshot\n\"" );
	if ( g_delagHitscan.integer ) {
//		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is ON!\n\"" );
	}
	else {
//		trap_SendServerCommand( clientNum, "print \"This server is Unlagged: full lag compensation is OFF!\n\"" );
	}
//unlagged - backward reconciliation #5

	return NULL;
}

/*
===========
ClientBegin

called when a client has finished connecting, and is ready
to be placed into the level.  This will happen every level load,
and on transition between teams, but doesn't happen on respawns
============
*/
void ClientBegin( int clientNum ) {
	gentity_t	*ent;
	gclient_t	*client;
	gentity_t	*tent;
	int			flags;

	ent = g_entities + clientNum;

	client = level.clients + clientNum;

	if ( ent->r.linked ) {
		trap_UnlinkEntity( ent );
	}
	G_InitGentity( ent );
	ent->touch = 0;
	ent->pain = 0;
	ent->client = client;

	client->pers.connected = CON_CONNECTED;
	client->pers.enterTime = level.time;
	client->pers.teamState.state = TEAM_BEGIN;

	// save eflags around this, because changing teams will
	// cause this to happen with a valid entity, and we
	// want to make sure the teleport bit is set right
	// so the viewpoint doesn't interpolate through the
	// world to the new position
	flags = client->ps.eFlags;
	memset( &client->ps, 0, sizeof( client->ps ) );
	client->ps.eFlags = flags;

	// Set What Weapons Are Allow for Arsenal
	if ((g_GameMode.integer == 1) || (g_GameMode.integer == 999) )
	{
			// Set Starting Weapons
		
			if (g_StartGauntlet.integer > 0) { client->pers.h_gauntlet = qtrue; }
			if (g_StartMG.integer > 0) { client->pers.h_mg = qtrue; }
			if (g_StartSG.integer > 0) { client->pers.h_sg = qtrue; }
			if (g_StartGrenade.integer > 0) { client->pers.h_grenade = qtrue; }
			if (g_StartSingCan.integer > 0) { client->pers.h_singcan = qtrue; }
			if (g_StartFlame.integer > 0) { client->pers.h_flame = qtrue; }
			if (g_StartGauss.integer > 0) { client->pers.h_gauss = qtrue; }
			if (g_StartPlasma.integer > 0) { client->pers.h_plasma = qtrue;}
			if (g_StartBFG.integer > 0) { client->pers.h_bfg = qtrue;}
		
	}
	client->pers.Eliminated = qfalse;  // They are not eliminated
	// End Arsenal

	client->pers.Frozen = qfalse;  // freeze

	// locate ent at a spawn point
	ClientSpawn( ent );

	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
		// send event
		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
		tent->s.clientNum = ent->s.clientNum;

		if ( g_gametype.integer != GT_TOURNAMENT  ) {
			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
		}
	}
	G_LogPrintf( "ClientBegin: %i\n", clientNum );

	// count current clients and rank for scoreboard
	CalculateRanks();
}



/*
===========
ClientSpawn

Called every time a client is placed fresh in the world:
after the first ClientBegin, and after each respawn
Initializes all non-persistant parts of playerState
============
*/
void ClientSpawn(gentity_t *ent) {
	int		index;
	vec3_t	spawn_origin, spawn_angles;
	gclient_t	*client;
	int		i;
	clientPersistant_t	saved;
	clientSession_t		savedSess;
	int		persistant[MAX_PERSISTANT];
	gentity_t	*spawnPoint;
	int		flags;
	int		savedPing;
//	char	*savedAreaBits;
	int		accuracy_hits, accuracy_shots;
	int		eventSequence;
	char	userinfo[MAX_INFO_STRING];
	int		wpn;

	index = ent - g_entities;
	client = ent->client;


	// find a spawn point
	// do it before setting health back up, so farthest
	// ranging doesn't count this client
	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
		spawnPoint = SelectSpectatorSpawnPoint ( 
						spawn_origin, spawn_angles);
	} else if (g_gametype.integer >= GT_CTF ) {
		// all base oriented team games use the CTF spawn points
	
		// Do Reverse CTF Here: g_ReverseCTF
		if (g_ReverseCTF.value == 1) {

			if (client->sess.sessionTeam == TEAM_RED) 
			{ 
				spawnPoint = SelectCTFSpawnPoint ( 
				TEAM_BLUE, 
				client->pers.teamState.state, 
				spawn_origin, spawn_angles);
			} 

			if (client->sess.sessionTeam == TEAM_BLUE) 
			{ 
				spawnPoint = SelectCTFSpawnPoint ( 				
				TEAM_RED, 
				client->pers.teamState.state, 
				spawn_origin, spawn_angles);
			} 


		}
		
		
		if (g_ReverseCTF.value == 0) 
		{
			spawnPoint = SelectCTFSpawnPoint ( 
			client->sess.sessionTeam, 
			client->pers.teamState.state, 
			spawn_origin, spawn_angles);
		}

	} else {
		do {
			// the first spawn should be at a good looking spot
			if ( !client->pers.initialSpawn && client->pers.localClient ) {
				client->pers.initialSpawn = qtrue;
				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
			} else {
				// don't spawn near existing origin if possible	
				spawnPoint = SelectSpawnPoint ( 
				client->ps.origin, 
				spawn_origin, spawn_angles);
			}

			// Tim needs to prevent bots from spawning at the initial point
			// on q3dm0...
			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
				continue;	// try again
			}
			// just to be symetric, we have a nohumans option...
			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
				continue;	// try again
			}

			break;
			
		} while ( 1 );
	}
	client->pers.teamState.state = TEAM_ACTIVE;


	// always clear the kamikaze flag
	/* ent->s.eFlags &= ~EF_KAMIKAZE; */

	// toggle the teleport bit so the client knows to not lerp
	// and never clear the voted flag
	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
	flags ^= EF_TELEPORT_BIT;

//unlagged - backward reconciliation #3
	// we don't want players being backward-reconciled to the place they died
	G_ResetHistory( ent );
	// and this is as good a time as any to clear the saved state
	client->saved.leveltime = 0;
//unlagged - backward reconciliation #3

	// clear everything but the persistant data

	saved = client->pers;
	savedSess = client->sess;
	savedPing = client->ps.ping;
//	savedAreaBits = client->areabits;
	accuracy_hits = client->accuracy_hits;
	accuracy_shots = client->accuracy_shots;
	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
		persistant[i] = client->ps.persistant[i];
	}
	eventSequence = client->ps.eventSequence;

	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?

	client->pers = saved;
	client->sess = savedSess;
	client->ps.ping = savedPing;
//	client->areabits = savedAreaBits;
	client->accuracy_hits = accuracy_hits;
	client->accuracy_shots = accuracy_shots;
	client->lastkilled_client = -1;

	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
		client->ps.persistant[i] = persistant[i];
	}
	client->ps.eventSequence = eventSequence;
	// increment the spawncount so the client will detect the respawn
	client->ps.persistant[PERS_SPAWN_COUNT]++;
	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;

	client->airOutTime = level.time + 12000;

	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
	
	// set max health
	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
		client->pers.maxHealth = 100;
	}

	// clear entity values
	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
	client->ps.eFlags = flags;


	// Game startes zoom should reset, otherwise you get stuck in zoom without the guass rifle -- shafes
	//trap_SendServerCommand(client->ps.clientNum, "-gzoom");
	//client->Zoomed = qfalse;
	
	ent->s.groundEntityNum = ENTITYNUM_NONE;
	ent->client = &level.clients[index];
	ent->takedamage = qtrue;
	ent->inuse = qtrue;
	ent->classname = "player";
	ent->r.contents = CONTENTS_BODY;
	ent->clipmask = MASK_PLAYERSOLID;
	ent->die = player_die;
	ent->waterlevel = 0;
	ent->watertype = 0;
	ent->flags = 0;
	
	VectorCopy (playerMins, ent->r.mins);
	VectorCopy (playerMaxs, ent->r.maxs);

	client->ps.clientNum = index;
	
	// Default star ammo for LFO
	client->ps.ammo[WP_MACHINEGUN] = 40;

	// FFA
	if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
	{	
		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
		if ( g_gametype.integer == GT_TEAM ) {
			client->ps.ammo[WP_MACHINEGUN] = 40;
		} 			
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
			client->ps.ammo[WP_GAUNTLET] = 99999;
			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;

	} 

	// Trepidation Gametype
	// Instagib
	if (g_instagib.value == 1)
	{
		// InstaGib - weapons on spawning w/ammo  - Shafe Trep
		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_RAILGUN );
		client->ps.ammo[WP_RAILGUN] = 9999;
		//trap_SendServerCommand( -1, "print \"Registered Instagib Weapons\n\"" );
 
	} 

	// This should not be running but it does after a turret is build
	if ((g_instagib.value == 0) && (g_GameMode.integer == 3))  // Shafe - Trep Instagib
	{
		client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
		if ( g_gametype.integer == GT_TEAM ) {
			client->ps.ammo[WP_MACHINEGUN] = 40;
		} 			
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
			client->ps.ammo[WP_GAUNTLET] = -1;
			client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
			//trap_SendServerCommand( -1, "print \"Registered Non-Instagib Weapons\n\"" );
	}
	
	

	if (g_GameMode.integer == 1) 
	{
		// Arsenal does not run in instagib mode
		if (g_instagib.integer == 1)
		{
			trap_SendServerCommand( -1, "print \"Instagib is not compatable with Arsenal Gametype\n\"" );
			g_instagib.integer = 0; 
		}

	}


	// health will count down towards max_health
	if(g_GameMode.integer == 999) // Single player starts out with more health
	{
		if ( !( ent->r.svFlags & SVF_BOT ) ) { // is not a bot
			ent->health = 500;
			client->pers.maxHealth = 500;
			client->ps.stats[STAT_HEALTH] = 500;
			client->ps.stats[STAT_MAX_HEALTH] = 500;
		} else {
			ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25; // is a bot
		}
	} else {
		ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
	}

	G_SetOrigin( ent, spawn_origin );
	VectorCopy( spawn_origin, client->ps.origin );

	// the respawned flag will be cleared after the attack and jump keys come up
	client->ps.pm_flags |= PMF_RESPAWNED;

	trap_GetUsercmd( client - level.clients, &client->pers.cmd );
	SetClientViewAngle( ent, spawn_angles );

	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
		// Client is a spectator don't hand out weapons

	} else {
		G_KillBox( ent );
		trap_LinkEntity (ent);

		if (g_instagib.integer == 0 && g_GameMode.integer == 0)  // Shafe - Trep Instagib
		{
			// force the base weapon up
			client->ps.weapon = WP_MACHINEGUN;
			client->ps.weaponstate = WEAPON_READY;
		} 
		
		// Hand out weapons in instagib
		if (g_instagib.integer == 1) 
		{
			client->ps.weapon = WP_RAILGUN; // InstaGib
		}

		// Hand out weapons for LMS
		if ((g_GameMode.integer == 2) || (g_GameMode.integer == 4) && (g_instagib.integer == 0))
		{
			wpn = irandom(1,9); // Lets clean this up so you can specify which weapons are allowed
			
			if(wpn == WP_GAUNTLET) { // Gauntlet Was chosen, lets give them a 1 in 5 chance of being the poor fool who actually gets it.
				int r;
				r = irandom(1,5);  // 1 in 5 chance you'll actually get it
				if(r != 1) { wpn = r; }
			}

			if(wpn == WP_BFG) { // Devastator Was chosen, lets give them a 1 in 5 chance of being the lucky bastard who actually gets it.
				int r;
				r = irandom(4,9);  // 1 in 5 chance you'll actually get it
				if(r != 9) { wpn = r; }
			}
						
			client->ps.stats[STAT_WEAPONS] = ( 1 << wpn );
			client->ps.ammo[wpn] = 9999;
		}
		
		// Hand out weapons for arsenal
		if (g_GameMode.integer == 1)
		{
			if (client->pers.h_gauntlet) 
			{
				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
				client->ps.ammo[WP_GAUNTLET] = 99999;
			}
			
			if (client->pers.h_mg) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
			client->ps.ammo[WP_MACHINEGUN] = 9999;
			}
			
			if (client->pers.h_sg) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
			client->ps.ammo[WP_SHOTGUN] = 9999;
			}
			
			if (client->pers.h_grenade ) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
			client->ps.ammo[WP_GRENADE_LAUNCHER] = 9999;
			}

			if (client->pers.h_singcan) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
			client->ps.ammo[WP_ROCKET_LAUNCHER] = 9999;
			}
			
			if (client->pers.h_flame) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
			client->ps.ammo[WP_LIGHTNING] = 9999;
			}
			
			if (client->pers.h_gauss) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
			client->ps.ammo[WP_RAILGUN] = 9999;
			}
	
			if (client->pers.h_plasma) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
			client->ps.ammo[WP_PLASMAGUN] = 9999;
			}
			
			if (client->pers.h_bfg) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
			client->ps.ammo[WP_BFG] = 9999;
			}
	

		}


		// Hand out weapons for single player
		if (g_GameMode.integer == 999)
		{
			if (client->pers.h_gauntlet) 
			{
				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
				client->ps.ammo[WP_GAUNTLET] = 99999;
			}
			
			if (client->pers.h_mg) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_MACHINEGUN );
			client->ps.ammo[WP_MACHINEGUN] = 75;
			}
			
			if (client->pers.h_sg) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SHOTGUN );
			client->ps.ammo[WP_SHOTGUN] = 25;
			}
			
			if (client->pers.h_grenade ) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GRENADE_LAUNCHER );
			client->ps.ammo[WP_GRENADE_LAUNCHER] = 25;
			}

			if (client->pers.h_singcan) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_ROCKET_LAUNCHER );
			client->ps.ammo[WP_ROCKET_LAUNCHER] = 15;
			}
			
			if (client->pers.h_flame) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_LIGHTNING );
			client->ps.ammo[WP_LIGHTNING] = 75;
			}
			
			if (client->pers.h_gauss) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_RAILGUN );
			client->ps.ammo[WP_RAILGUN] = 10;
			}
	
			if (client->pers.h_plasma) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_PLASMAGUN );
			client->ps.ammo[WP_PLASMAGUN] = 75;
			}
			
			if (client->pers.h_bfg) 
			{
			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BFG );
			client->ps.ammo[WP_BFG] = 15;
			}

		}

	}


	// don't allow full run speed for a bit
	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
	client->ps.pm_time = 100;

	client->respawnTime = level.time;
	client->inactivityTime = level.time + g_inactivity.integer * 1000;
	client->latched_buttons = 0;

	// set default animations
	client->ps.torsoAnim = TORSO_STAND;
	client->ps.legsAnim = LEGS_IDLE;

	if ( level.intermissiontime ) {
		MoveClientToIntermission( ent );
	} else {
		// fire the targets of the spawn point
		G_UseTargets( spawnPoint, ent );

		// select the highest weapon number available, after any
		// spawn given items have fired
		client->ps.weapon = 1;
		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
				client->ps.weapon = i;
				break;
			}
		}
	}

	// run a client frame to drop exactly to the floor,
	// initialize animations and other things
	client->ps.commandTime = level.time - 100;
	client->pers.cmd.serverTime = level.time;
	ClientThink( ent-g_entities );

	// positively link the client, even if the command times are weird
	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
		VectorCopy( client->ps.origin, ent->r.currentOrigin );
		trap_LinkEntity( ent );
	}

	// It seems that the values ARE already cleaned at respawn, but just to be sure -Vincent
	ent->r.svFlags &= ~SVF_CUSTOM_GRAVITY;
	ent->r.svFlags &= ~SVF_CUSTOM_SPEED;
	// Above: Actual reset is done at immobilizer thinking (prevents double checking, was fixed there)... -Vincent

	// run the presend to set anything else
	ClientEndFrame( ent );

	// Shafe - Trep - Headshots -- Best give em their head back when they respawn
	client->noHead=qfalse;

	// This is probably going to screw everything up.
	client->pers.Eliminated = qfalse;
	client->pers.Frozen = qfalse;
	
	// clear entity state values
	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
}



team_t BalanceTeams(int team ) {

int		i;
int		c;	
int		b = 0;	
int		t;	

	c = 999;	
	for ( i = 0 ; i < level.maxclients ; i++ ) {
	
		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
			continue;
		}
		if ( level.clients[i].sess.sessionTeam == team ) {
			
			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
			{
				c = i;
			} 
			else 
			{ 
				b = i; 
			}

		}
	}

	if (c == 999) 
	{ 
		c = b; 
	}

	if (team == TEAM_BLUE) 
	{	
		t = level.clients[c].ps.persistant[PERS_SCORE];
		SetTeam(&g_entities[c], "red"); 
		level.clients[c].ps.persistant[PERS_SCORE] = t;
		//level.clients[c].sess.sessionTeam = TEAM_BLUE;
	}
	
	if (team == TEAM_RED) 
	{		
		t = level.clients[c].ps.persistant[PERS_SCORE];	
		SetTeam(&g_entities[c], "blue"); 
		level.clients[c].ps.persistant[PERS_SCORE] = t;
		//level.clients[c].sess.sessionTeam = TEAM_RED;
	}
	
	return c;
	
}
/*

	THIS STUFF IS ACTUALLY BOT AI STUFF KIND OF FOR BUILDABLES, SO THAT BOTS AT LEAST APPEAR TO PLAY TREPIDATION GAMETYPE.

*/

/*
	When playing trepidation, a bot kinda randomly builds shit. 
	
*/
team_t PlaceImmobile(int team ) {

int		i;
int		c;	
int		b = 0;	


	c = 999;	
	for ( i = 0 ; i < level.maxclients ; i++ ) {
	
		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
			continue;
		}
			
		if ( level.clients[i].sess.sessionTeam == team ) {
			
			// Make sure it's a bot
			if(g_entities[i].r.svFlags & SVF_BOT)
			{
				c=i;
			} 

		}
	}

	if (c == 999) 
	{ 
		return c; // if there are no bots dont do anything, because
	}

	if (team == TEAM_BLUE) 
	{	
		// Set it down for the blue team
		BuildDisplacer(&g_entities[c]);
	}
	
	if (team == TEAM_RED) 
	{	
		// set it down for the red team
		BuildDisplacer(&g_entities[c]);
	}
	
	return c;
	
}



team_t PlaceTurret(int team ) {

int		i;
int		c;	
int		b = 0;	
int		cts;
int		iserror;
int		type;
int		f;

	c = 999;	
	for ( i = 0 ; i < level.maxclients ; i++ ) {
	
		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
			continue;
		}
			
		if ( level.clients[i].sess.sessionTeam == team ) {
			
			// Make sure it's a bot
			if(g_entities[i].r.svFlags & SVF_BOT)
			{
				if (irandom(1,2) == 1) {  c = i; } // randomize a bit who gets to do it.
			} 

		}
	}

	if (c == 999) 
	{ 
		//  the above failed, do nothing... 
		return;
		
	}

	// Figure out the best turret available
	cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];		
	type = 0;
	if (cts > 3)  { type = 1; }  
	if (cts > 6)  { type = 2; }  

	// If this is ctf pick a random turret type
	if(g_gametype.integer == GT_CTF)
	{
		type = irandom(0,2);
	}

	if (team == TEAM_BLUE) 
	{	
		// Set it down for the blue team
		BuildTurret(&g_entities[c],type);
	}
	
	if (team == TEAM_RED) 
	{	
		// set it down for the red team
		BuildTurret(&g_entities[c],type);
	}
	
	return;
	
}



/*
	When playing trepidation, a bot kinda randomly builds shit. 
*/
team_t PlaceGen(int team ) {

int		i;
int		c;	
int		b = 0;	


	c = 999;	
	for ( i = 0 ; i < level.maxclients ; i++ ) {
	
		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
			continue;
		}
			
		if ( level.clients[i].sess.sessionTeam == team ) {
			
			// Make sure it's a bot
			if(g_entities[i].r.svFlags & SVF_BOT)
			{
				c=i;
			} 

		}
	}

	if (c == 999) 
	{ 
		return c; // if there are no bots dont do anything, because
	}

	if (team == TEAM_BLUE) 
	{	
		// Set it down for the blue team
		BuildGenerator(&g_entities[c]);
	}
	
	if (team == TEAM_RED) 
	{	
		// set it down for the red team
		BuildGenerator(&g_entities[c]);
	}
	
	return c;
	
}

/*

	END THE BOT AI STUFF THAT SHOULD PROBABLY GO ELSEWHERE.

*/


/*
 When someone doesnt build an MC it builds one somewhere for em
 This is a called it picks a player and puts it in their spot..
 hopefully they'll move out of the way.
 Quite a hack.. 
*/
team_t PlaceMC(int team ) {

int		i;
int		c;	
int		b = 0;	


	c = 999;	
	for ( i = 0 ; i < level.maxclients ; i++ ) {
	
		if (( level.clients[i].pers.connected == CON_DISCONNECTED ) && ( level.clients[i].ps.pm_type == PM_DEAD )) {
			continue;
		}
		if ( level.clients[i].sess.sessionTeam == team ) {
			
			if (level.clients[i].ps.persistant[PERS_SCORE] == 0) 
			{
				c = i;
			} 
			else 
			{ 
				b = i; 
			}

		}
	}

	if (c == 999) 
	{ 
		c = b; 
	}

	if (team == TEAM_BLUE) 
	{	
		// Set it down for the blue team
		BuildMC(&g_entities[c]);
	}
	
	if (team == TEAM_RED) 
	{	
		// set it down for the red team
		BuildMC(&g_entities[c]);
	}
	
	return c;
	
}




/*
===========
ClientDisconnect

Called when a player drops from the server.
Will not be called between levels.

This should NOT be called directly by any game logic,
call trap_DropClient(), which will call this and do
server system housekeeping.
============
*/
void ClientDisconnect( int clientNum ) {
	gentity_t	*ent;
	gentity_t	*tent;
	int			i;

	// cleanup if we are kicking a bot that
	// hasn't spawned yet
	G_RemoveQueuedBotBegin( clientNum );

	ent = g_entities + clientNum;
	if ( !ent->client ) {
		return;
	}

	// stop any following clients
	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
			&& level.clients[i].sess.spectatorClient == clientNum ) {
			StopFollowing( &g_entities[i] );
		}
	}

	// send effect if they were completely connected
	if ( ent->client->pers.connected == CON_CONNECTED 
		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
		tent->s.clientNum = ent->s.clientNum;

		// They don't get to take powerups with them!
		// Especially important for stuff like CTF flags
		TossClientItems( ent );
#ifdef MISSIONPACK
		TossClientPersistantPowerups( ent );
		if( g_gametype.integer == GT_HARVESTER ) {
			TossClientCubes( ent );
		}
#endif

	}

	 G_LogPrintf( "ClientDisconnect: %i [%s] (%s) \"%s\"\n", clientNum, ent->client->pers.ip, ent->client->pers.guid, ent->client->pers.netname );
	 //G_LogPrintf( "ClientDisconnect: %i \"%s\"\n", clientNum, ent->client->pers.netname );
	// if we are playing in tourney mode and losing, give a win to the other player
	if ( (g_gametype.integer == GT_TOURNAMENT )
		&& !level.intermissiontime
		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
		level.clients[ level.sortedClients[0] ].sess.wins++;
		ClientUserinfoChanged( level.sortedClients[0] );
	}

	trap_UnlinkEntity (ent);
	ent->s.modelindex = 0;
	ent->inuse = qfalse;
	ent->classname = "disconnected";
	ent->client->pers.connected = CON_DISCONNECTED;
	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
	ent->client->sess.sessionTeam = TEAM_FREE;

	trap_SetConfigstring( CS_PLAYERS + clientNum, "");

	CalculateRanks();

	if ( ent->r.svFlags & SVF_BOT ) {
		BotAIShutdownClient( clientNum, qfalse );
	}
}


