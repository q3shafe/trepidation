//
// Trepidation Buildable Objects 
// (C)2006-2017 Trepidation
// General Public License
//
// Most of the build rules are checked before any of the stuff in here is executed. 

#include "g_local.h"
extern void BroadCastSound( char *path ); // De-warning -Vincent
extern void BuildableSpawn( gentity_t *base ); //In g_weapon -Vincent
extern qboolean CanBuildHere(gentity_t *playerent); //In g_weapon -Shafe

/* 
====================================

   TURRET CONTROL

==================================== 
*/
#define RANGE 500	// Turret Range
#define IMRANGE 300 // Immobilizer range

// These control the radius
#define HARC 90
#define DARC 10
#define UARC 45

#define IHARC 180 
#define IDARC 10
#define IUARC 45

// Are we using these?
#define TURRET_MG_SPREAD	100
#define	TURRET_MG_DAMAGE	15
#define	TURRET_MG_DAMAGE2	40


// Lets define trep rules
#define PC_HEALTH	1500



void turret_remove(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
{

	gentity_t	*buildables = NULL; 
	vec3_t dir; // needed by the event being adde

	dir[0] = dir[1] = 0;
	dir[2] = 1;


	if (self->chain) {
		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
	}
	
	if (self->s.team == TEAM_BLUE)
	{
		//trap_SendServerCommand( -1, "print \"DEBUG: Called destroy buildables for BLUE.\n\"" );
		level.blueMC = 0; 	
		level.blueBuilding = level.time;
		level.blueNeedMC= 1;
	}
	if (self->s.team == TEAM_RED)
	{
		//trap_SendServerCommand( -1, "print \"DEBUG: Called destroy buildables for RED.\n\"" );
		level.redMC = 0; 	
		level.redBuilding = level.time;
		level.redNeedMC= 1;
	}
	
	self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
	self->takedamage = qfalse; // Stop multiple explosions -Vincent
	self->targetname = ""; // And again... -Vincent
	G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here
	self->freeAfterEvent = qtrue; // so the base goes away after the explosion
	self->think = G_FreeEntity;

}



/*
===========================
turret_explode
We use this to blow up lots of
stuff.. So it's at top
===========================
*/
void turret_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
{

	gentity_t	*buildables = NULL; 
	vec3_t dir; // needed by the event being adde

	dir[0] = dir[1] = 0;
	dir[2] = 1;

	

	// Take item away from master level stats
	
	if (self->s.time2 != 666)
	{
		self->s.time2 = 666;
		if (self->s.team == TEAM_BLUE)
		{
			

			if ( !Q_stricmp( self->classname, "timedisplacer") )
			{ 
				level.blueTD--; 			
				G_LogPrintf("Kill: %i %i %i: Blue IMMOBILIZER was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
				//G_Printf("Blue IMMOBILIZER was destroyed by %s\n", attacker->client->pers.netname);
				
				if (attacker != &g_entities[ENTITYNUM_WORLD])
				{
					trap_SendServerCommand( -1, va("print \"^7Blue IMMOBILIZER was destroyed by %s \n\"", attacker->client->pers.netname ) );

					if (attacker->client->sess.sessionTeam == TEAM_RED) 
					{ 	
						AddScore(attacker, self->r.currentOrigin, 1); 
					} else
					{
						AddScore(attacker, self->r.currentOrigin, -1); 
					}
					self->nextthink = 30000;
				}
			}
			
			if ( !Q_stricmp( self->classname, "generator") )
			{ 
				level.blueGen--; 	
				level.blueBuilding = level.time;
				G_LogPrintf("Kill: %i %i %i: Blue Generator was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
				//G_Printf("Blue GENERATOR was destroyed by %s\n", attacker->client->pers.netname);
				
				if (attacker != &g_entities[ENTITYNUM_WORLD])
				{
					trap_SendServerCommand( -1, va("print \"^7Blue GENERATOR was destroyed by %s \n\"", attacker->client->pers.netname ) );
					if (attacker->client->sess.sessionTeam == TEAM_RED) 
					{ 	
						AddScore(attacker, self->r.currentOrigin, 2); 
					} else
					{
						AddScore(attacker, self->r.currentOrigin, -2); 
					}
					self->nextthink = 30000;
				}	
			}
			if ( !Q_stricmp( self->classname, "turret") ) 
			{
				level.blueTurrets--; 
				level.blueBuilding = level.time;
				G_LogPrintf("Kill: %i %i %i: Blue Turret was shot down by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
				///G_Printf("Blue TURRET was shot down by %s\n", attacker->client->pers.netname);
				if (attacker != &g_entities[ENTITYNUM_WORLD])
				{
					trap_SendServerCommand( -1, va("print \"^7Blue TURRET was destroyed by %s \n\"", attacker->client->pers.netname ) );
					if (attacker->client->sess.sessionTeam == TEAM_RED) 
					{ 	
						AddScore(attacker, self->r.currentOrigin, 1); 
					} else
					{
						AddScore(attacker, self->r.currentOrigin, -1); 
					}
					self->nextthink = 30000;
				}		
			}
			if ( !Q_stricmp( self->classname, "mc") )
			{ 
				if (level.blueNeedMC == 0)
				{
					
					level.blueMC = 0; 					
					level.blueNeedMC = 1;
					level.blueBuilding = 0;

					if(mod != MOD_SUICIDE) {
						level.redScoreLatched = 1;
						trap_SendConsoleCommand( EXEC_INSERT, va("g_BlueMC \"%i\"\n", 0) );
						level.blueCredits = 0;
						G_LogPrintf("Kill: %i %i %i: Blue Power Core was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
						//G_Printf("Blue POWER CORE was shot down by %s\n", attacker->client->pers.netname);
						if (attacker != &g_entities[ENTITYNUM_WORLD])
						{
							trap_SendServerCommand( -1, va("print \"^7Blue POWERCORE was destroyed by %s \n\"", attacker->client->pers.netname ) );
							if (attacker->client->sess.sessionTeam == TEAM_RED) 
							{ 	
								AddScore(attacker, self->r.currentOrigin, 10); 
							} else
							{
								AddScore(attacker, self->r.currentOrigin, -10); 
							}
						}
							
						if(g_pointrebuild.integer == 1) {
							while ((buildables = G_Find (buildables, FOFS(classname), "mc")) != NULL)
							{
									if(self->s.team = TEAM_RED) {
									buildables->die=turret_remove;
									trap_SendConsoleCommand( EXEC_INSERT, va("g_RedMC \"%i\"\n", 0) );
									//buildables->health = 0;	
									level.blueScoreTime = level.time;
									buildables->nextthink = 500;
									turret_remove(buildables,attacker,attacker,5000,MOD_LAVA);
									
									}
							}
						}	
							


					}
				}
			}		
		}
		if (self->s.team == TEAM_RED)
		{

			if ( !Q_stricmp( self->classname, "timedisplacer") )
			{ 
				level.redTD--;
				G_LogPrintf("Kill: %i %i %i: Red IMMOBILIZER was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
				//G_Printf("Red IMOBILIZER was destroyed by %s\n", attacker->client->pers.netname);
				if (attacker != &g_entities[ENTITYNUM_WORLD])
				{
					trap_SendServerCommand( -1, va("print \"^7Red IMMOBILIZER was destroyed by %s \n\"", attacker->client->pers.netname ) );
					if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
					{ 	
						AddScore(attacker, self->r.currentOrigin, 1); 
					} else
					{
						AddScore(attacker, self->r.currentOrigin, -1); 
					}
					self->nextthink = 30000;
				}
						
			}
			
			if ( !Q_stricmp( self->classname, "generator") )
			{ 
				level.redGen--;
				level.redBuilding = level.time;
				G_LogPrintf("Kill: %i %i %i: Red Generator was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
				
				if (attacker != &g_entities[ENTITYNUM_WORLD])
				{
					trap_SendServerCommand( -1, va("print \"^7Red GENERATOR was destroyed by %s \n\"", attacker->client->pers.netname ) );
					//G_Printf("Red GENERATOR was destroyed by %s\n", attacker->client->pers.netname);
					if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
					{ 	
						AddScore(attacker, self->r.currentOrigin, 2); 
					} else
					{
						AddScore(attacker, self->r.currentOrigin, -2); 
					}
					self->nextthink = 30000;
				}
						
			}
			if ( !Q_stricmp( self->classname, "turret") )
			{ 
				level.redTurrets--;
				level.redBuilding = level.time;
				G_LogPrintf("Kill: %i %i %i: Red Turret was shot down by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
				//G_Printf("Red TURRET was shot down by %s\n", attacker->client->pers.netname);
				if (attacker != &g_entities[ENTITYNUM_WORLD])
				{
					trap_SendServerCommand( -1, va("print \"^7Red TURRET was destroyed by %s \n\"", attacker->client->pers.netname ) );
					if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
					{ 	
						AddScore(attacker, self->r.currentOrigin, 1); 
					} else
					{
						AddScore(attacker, self->r.currentOrigin, -1); 
					}
					self->nextthink = 30000;
				}
			}
		
			if ( !Q_stricmp( self->classname, "mc") )
			{ 
				if (level.redNeedMC == 0)
				{
					level.redMC= 0; 					
					level.redNeedMC = 1;
					level.redBuilding = 0;

					if(mod != MOD_SUICIDE) {
						level.blueScoreLatched = 1;
						trap_SendConsoleCommand( EXEC_INSERT, va("g_RedMC \"%i\"\n", 0) );
						level.redCredits = 0;
						G_LogPrintf("Kill: %i %i %i: Red POWERCORE was destroyed by %s\n", attacker->client->pers.netname, 0, 0, attacker->client->pers.netname);
						//G_Printf("Red POWER CORE was shot down by %s\n", attacker->client->pers.netname);
						if (attacker != &g_entities[ENTITYNUM_WORLD])
						{
							trap_SendServerCommand( -1, va("print \"^7Red POWER CORE was destroyed by %s \n\"", attacker->client->pers.netname ) );
							if (attacker->client->sess.sessionTeam == TEAM_BLUE) 
							{ 	
								AddScore(attacker, self->r.currentOrigin, 10); 
							} else
							{
								AddScore(attacker, self->r.currentOrigin, -10); 
							}
						}
							
						if(g_pointrebuild.integer == 1) {
							while ((buildables = G_Find (buildables, FOFS(classname), "mc")) != NULL)
							{
								if(self->s.team = TEAM_BLUE) {
								buildables->die=turret_remove;
								//buildables->health = 0;
								trap_SendConsoleCommand( EXEC_INSERT, va("g_BlueMC \"%i\"\n", 0) );								
								turret_remove(buildables,attacker,attacker,5000,MOD_LAVA);
								level.redScoreTime = level.time;
								
								}
								
							}
						}
							
					}
				}
			
			}		

		}
	}
	// This is an extra check .. Mostly likely redundant now
	if (level.redTurrets < 0) { level.redTurrets = 0; }
	if (level.blueTurrets < 0) { level.blueTurrets = 0; }
	if (level.redGen < 0) { level.redGen = 0; }
	if (level.blueGen < 0) { level.blueGen = 0; }

	if (self->chain) {
		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
	}
	
	
	self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
	self->takedamage = qfalse; // Stop multiple explosions -Vincent
	self->targetname = ""; // And again... -Vincent
	G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here
	self->freeAfterEvent = qtrue; // so the base goes away after the explosion
	self->think = G_FreeEntity;

}



/*
=================
AnnounceBuildables

This will put a message up when a new buildable is available
=================
*/
void AnnounceBuildables( void) {

int cts;

	cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];

	if (cts == 2) 
	{
		BroadCastSound("sound/world/tim_pump.ogg");
		trap_SendServerCommand( -1, va("cp \"^7Immobilizer Now Available\n\"") );
		trap_SendServerCommand( -1, va( "print \"^9Immobilizer Now Available\n\"") );
	}


	if (cts == 3) 
	{
		BroadCastSound("sound/world/tim_pump.ogg");
		trap_SendServerCommand( -1, va("cp \"^7Shielded Turrets Now Available\n\"") );
		trap_SendServerCommand( -1, va( "print \"^9Shielded Turrets Now Available\n\"") );
	}

	if (cts == 6) 
	{
		BroadCastSound("sound/world/tim_pump.ogg");
		trap_SendServerCommand( -1, va("cp \"^7Cloaking Turrets Now Available\n\"") );
		trap_SendServerCommand( -1, va( "print \"Cloaking Turrets Now Available\n\"") );
	}




}



/*
===========================
checktarget
===========================
*/
qboolean checktarget(gentity_t *firer,gentity_t *target){

	vec3_t		distance;
	trace_t		trace;
	int			angle;

/*
returns qfalse if the target is not valid. returns qtrue if it is
*/

if (!target) // Do we have a target?
	return qfalse;

if (!target->inuse) // Does the target still exist?
	return qfalse;

if (target==firer) // is the target us?
	return qfalse;

if(!target->client) // is the target a bot or player?
	return qfalse;

if (target==firer->parent) // is the target the person that created the turret?
{
	// If so are they still on the same team?
	if (target->client->sess.sessionTeam == firer->s.team)
	{
		return qfalse;
	}

}

//if (target==firer->parent) // is the target the person that created the turret?
//  103 	return qfalse;

if (firer->s.team == target->client->sess.sessionTeam) // is the target one of us?
	return qfalse;

if (target->health<0) // is the target still alive?
	return qfalse;


if (!strcmp(firer->classname, "timedisplacer"))
{
	// Immobilizer has less of a range
	VectorSubtract(target->r.currentOrigin,firer->r.currentOrigin,distance);
	if (VectorLength(distance)>IMRANGE) // is the target within range?
		return qfalse;
} 
else
{
	VectorSubtract(target->r.currentOrigin,firer->r.currentOrigin,distance);
	if (VectorLength(distance)>RANGE) // is the target within range?
		return qfalse;
}



trap_Trace (&trace, firer->s.pos.trBase, NULL, NULL, target->s.pos.trBase, firer->s.number, MASK_SHOT );
if ( trace.contents & CONTENTS_SOLID ) // can we see the target?
	return qfalse;
/*
The last two checks are done last as they require more processing power than the others.
this order is just better from a proccesing load perspective
*/

	if (!strcmp(firer->classname, "timedisplacer"))
	{

		vectoangles (distance,distance);
		VectorSubtract(firer->centerpoint,distance,distance);
		angle=abs((int)distance[1]);
		while (angle>=360)
		{
			angle-=360;
		}
		if ((angle>=IHARC) && (angle<=(360-IHARC)))
			return qfalse;
		angle=abs((int)distance[0]);
		while (angle>=360)
		{
			angle-=360;
		}
		if ((angle>IUARC) && (angle<(360-IDARC)))
			return qfalse;

		
	}
	else
	{

		vectoangles (distance,distance);
		VectorSubtract(firer->centerpoint,distance,distance);
		angle=abs((int)distance[1]);
		while (angle>=360)
		{
			angle-=360;
		}
		if ((angle>=HARC) && (angle<=(360-HARC)))
			return qfalse;
		angle=abs((int)distance[0]);
		while (angle>=360)
		{
			angle-=360;
		}
		if ((angle>UARC) && (angle<(360-DARC)))
			return qfalse;
	
	
	}

return qtrue;
}


/*
===========================
turret_findenemy
===========================
*/
void turret_findenemy( gentity_t *ent){
	gentity_t *target;

	target = g_entities;

	for (; target < &g_entities[level.num_entities]; target++)
	{
		if(!checktarget(ent,target))
			continue;
		ent->enemy=target;
		return;
	}

	ent->enemy=NULL;
}



/*
===========================
turret_trackenemy
===========================
*/
void turret_trackenemy( gentity_t *ent){
	vec3_t dir;

	VectorSubtract(ent->enemy->r.currentOrigin,ent->r.currentOrigin,dir);
	VectorNormalize(dir);
	VectorCopy(dir,ent->turloc);
	vectoangles(dir,dir);
	VectorCopy(dir,ent->s.angles);
	VectorCopy(dir,ent->r.currentAngles);
	VectorCopy( dir,ent->s.apos.trBase );
	trap_LinkEntity (ent);

}




/*
===========================
turret_fireonenemy
===========================
*/

void turret_fireonenemy( gentity_t *ent){

	
	if (!level.intermissiontime) 
	{
	
		// 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
		if (ent->s.time2 > 1)
		{
			//This is the best turret
			fire_turret( ent->parent, ent->r.currentOrigin, ent->turloc, qtrue );
			if (trep_debug.integer == 2) { G_Printf("%s Turret Firing: %s\n", ent->parent->client->pers.netname ); }
			
			
		} else
		{
			
			if (ent->s.time2 == 0)
			{
				// This is the weakest
				//fire_plasma( ent->activator, ent->r.currentOrigin, ent->turloc );
				fire_turret( ent->parent, ent->r.currentOrigin, ent->turloc, qfalse );
				if (trep_debug.integer==2) { G_Printf("%s Turret Firing: %s\n", ent->parent->client->pers.netname ); }
				
			} else
			{
				// Middle Power
				fire_turret( ent->parent, ent->r.currentOrigin, ent->turloc, qfalse );
				if (trep_debug.integer==2) { G_Printf("%s Turret Firing: %s\n", ent->parent->client->pers.netname ); }
				
			}
			
			
		}
		
		G_AddEvent( ent, EV_FIRE_WEAPON, 0 );

	
		ent->count=level.time+100;

		// decloaks a cloaked turret when firing.
		if (ent->s.time2==2)
		{
			ent->s.time2=3;
			ent->chain->s.time2=3;
		}
	}
}

/*
===========================
Base_Think
===========================
*/
void Base_think(gentity_t *ent){

	gentity_t *attacker;
	attacker = &g_entities[ENTITYNUM_WORLD];
	// If the mc is gone blow up the turret... Meaning
	// you need an mc before you can build turrets.
	// 
	// This also destroys all turrets when a point is made.
	
	if(g_GameMode.integer == 3) // dont kill them without a power core on ctf
	{
		if (ent->s.team == TEAM_BLUE)
		{
			if (level.blueMC == 0) 
			{	
				ent->health = 1; 
				ent->s.time2 = 0;
				G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
				if (trep_debug.integer) { G_Printf("Destroyed in Base_think: %s\n", ent->client->pers.netname ); }
			
	
			}
		}
		if (ent->s.team == TEAM_RED)
		{
			if (level.redMC == 0) 
			{ 
				ent->health = 1; 
				ent->s.time2 = 0;
				G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
				if (trep_debug.integer) { G_Printf("Destroyed in Base_think: %s\n", ent->client->pers.netname ); }
	
			}
		}
	}
	ent->think = Base_think;
	ent->nextthink=level.time+100;

// for shielded turrets. regenerates health to 400 at 10 health a second
if ((ent->s.time2==1)&(ent->health<400)){
	ent->health+=1;
	ent->nextthink=level.time+100;
}

// recloaks a turret without a valid target. checks once a second
if ((ent->s.time2==3)&(!ent->chain->enemy))
	{
	ent->s.time2=2;
	ent->chain->s.time2=2;
	ent->nextthink=level.time+100;
	}


}

/*
============
turret_think
============
*/

void turret_think( gentity_t *ent){

	ent->nextthink=level.time+10;

	if (!checktarget(ent,ent->enemy))
		turret_findenemy(ent);
	if(!ent->enemy)
		return;
	turret_trackenemy(ent);
	if (ent->count<level.time)
		turret_fireonenemy(ent);
}


/*
===========================
createturretgun
===========================
*/
// let's add weapon and turret type to this call
void createturretgun(gentity_t *ent)
{
	gentity_t *turret; 	// The object to hold the turrets details.

	ent->nextthink=level.time+100; // sets up the thinking for the cloaking or regeneration/
	ent->think=Base_think; // handles cloaking or regeneration
	ent->clipmask = CONTENTS_SOLID;
	ent->r.contents = CONTENTS_SOLID;
	turret=G_Spawn();
	turret->parent=ent;
	if (trep_debug.integer) { G_Printf("%s Turret Gun Built - Owner: %s\n", turret->parent->client->pers.netname ); }
	turret->chain=ent;
	ent->chain=turret;
	turret->s.eType=ET_BUILDABLE;
	
	turret->s.time2=ent->s.time2;
	turret->eventTime=200;
	turret->s.number = turret - g_entities;
	
	
	//turret->s.weapon=WP_MACHINEGUN;
	// 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	// Regular Turret
	
	if (ent->s.time2 == 0)
	{
		turret->s.weapon=WP_TURRET;
		turret->s.modelindex = G_ModelIndex("models/turrets/gun1.md3");
		turret->model = "models/turrets/gun1.md3";
		turret->s.modelindex2 = G_ModelIndex("models/turrets/gun1.md3");
	} 
	else 
	{
		turret->s.modelindex = G_ModelIndex("models/turrets/gun2.md3");
		turret->model = "models/turrets/gun1.md3";
		turret->s.modelindex2 = G_ModelIndex("models/turrets/gun2.md3");
	}
	
	// These two are for later in case we want to define them differently
	// Sheilded Turret
	if (ent->s.time2 == 1)
	{
		turret->s.weapon=WP_TURRET;
	}
	// Cloaked Turret
	if (ent->s.time2 > 1)
	{
		turret->s.weapon=WP_TURRET;
	}
	
	
	
	turret->s.team =  ent->s.team;	

	
	turret->think=turret_think;
	turret->nextthink=level.time+100;
	G_SetOrigin( turret, ent->r.currentOrigin );
	VectorCopy(ent->s.apos.trBase,turret->s.apos.trBase);
	VectorCopy(turret->s.apos.trBase,turret->centerpoint);
	trap_LinkEntity (turret);
	BroadCastSound("sound/items/electro.ogg");
}

/*
===========================
turret_retaliate
===========================
*/
void turret_retaliate(gentity_t *self, gentity_t *attacker, int damage)
{
// set the guns enemy to the person that shot it. (does not override targeting rules)
if (self->chain)
	self->chain->enemy=attacker;

// this is here to cause the turret to unshield when its taken a certain amount of damage. (enough to reduce health to below 100)
	if (self->s.time2==1)
	{
		if (self->health<100)
		{
			self->s.time2=0;
			if (self->chain)
			{
				self->chain->s.time2=0;
			}
		}
	}
}

/*
===========================
BuildTurret
===========================
*/
void BuildTurret( gentity_t *ent , int type )
{
	// We need to check the turret type and select the appropriate model
	gentity_t	*base;	

	if (CanBuildHere(ent) == qfalse) 
	{ 
		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
		return; 
	}

	base=G_Spawn();
	base->parent=ent;	
	if (trep_debug.integer) { G_Printf("%s Turret Built - Owner: %s\n", base->parent->client->pers.netname ); }
	
	// This used to have 2 different types, but now only one base 
	base->s.modelindex = G_ModelIndex("models/turrets/base2.md3");
	base->model = "models/turrets/base2.md3";
	base->s.modelindex2 = G_ModelIndex("models/turrets/base2.md3");
	

	G_SetOrigin(base,ent->r.currentOrigin);
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
	
	if(g_instagib.integer = 0) {
		if (type==0)
		{
			base->health=200; // change this to make the turrets tougher or weaker.
		} 
		else
		{
			base->health=300; // change this to make the turrets tougher or weaker.
		}
	} else {
		// Instagib gets higher health on turrets
		if (type==0)
		{
			base->health=400; // change this to make the turrets tougher or weaker.
		} 
		else
		{
			base->health=600; // change this to make the turrets tougher or weaker.
		}
	}


	base->s.eType=ET_GENERAL;

	if (ent->client->sess.sessionTeam == TEAM_BLUE)
	{
		level.blueTurrets++;
	}
	if (ent->client->sess.sessionTeam == TEAM_RED)
	{
		level.redTurrets++;
	}	

	base->s.time2=type; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	
	base->classname = "turret";
	base->s.team =  ent->client->sess.sessionTeam;	

	base->takedamage=qtrue; // so they can be destroyed
	base->die=turret_explode; // so they actually explode when destroyed
	base->pain=turret_retaliate; // if they are damaged they switch target to the person attacking (if its a valid target)

	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
	base->s.pos.trType = TR_GRAVITY;
	
	// Correction to default numbers -Vincent
	VectorSet( base->r.mins, -16, -16, -16 );
	VectorSet( base->r.maxs, 16, 16, 16);

	trap_LinkEntity( base );

	BuildableSpawn( base ); // New spawning -Vincent
	if( base->s.eType == ET_GENERAL )
	{ // Clear it!
	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
	}
	else
	{ // Initalize it!
	base->nextthink = level.time + 5000;
	base->think	    = createturretgun;
	}
}


/* 
====================================

   MASTER CONTROLLER // POWER CORE

==================================== 
*/


/*
===========================
MC_think

 Power Core//Master Controller Think.
 This controls the shielding 
 as well.
===========================
*/
void MC_think(gentity_t *ent)
{
	int shieldMultiplier;

	shieldMultiplier = 1;

	ent->clipmask = CONTENTS_SOLID;
	ent->r.contents = CONTENTS_SOLID;

	// single player option  gamemode = -1
	if (g_GameMode.integer == 999)
	{
		turret_think( ent );  // MC Will shoot at you too.
	}

	// Determine The Sheilding By Counting Shield Generators
	if (ent->s.team == TEAM_BLUE)
	{
		shieldMultiplier = level.blueGen;
		level.blueCredits = ent->health;

	}
	if (ent->s.team == TEAM_RED)
	{
		shieldMultiplier = level.redGen;
		level.redCredits = ent->health;
		
	}

	shieldMultiplier++;

	// If there's at least one shield generator and the MC's health is above 35 it'll be shielded
	if (shieldMultiplier > 1) { ent->s.time2 = 1; } else { ent->s.time2 = 0; }

	 	
	// It's shielded but health is too low.. 
	// This turns shielding off and regeneration stops.
	if (ent->s.time2==1)
	{
		
		if ((ent->health<150) && (g_instagib.integer == 0)) // Was 350
		{
			ent->s.time2=0;
		}
	}
	
	if ((ent->s.time2==1) && (shieldMultiplier > 1)) 
	{
		if (ent->health < ( 750 * (shieldMultiplier-1)) )  // was: 600 * shieldMultiplier  why?  - This should also be a define.  FIXME
		{
			ent->health+=shieldMultiplier;
			ent->nextthink=level.time+1000;
		}
	}

	ent->nextthink=level.time+100;
}


/*
===========================
MC_prethink

The MC as it is in the 
'being built' state
===========================
*/
void MC_prethink(gentity_t *ent)
{
	if (ent->s.team == TEAM_BLUE)
	{
		level.blueScoreLatched = 0;
	} 
	else 
	{
		level.redScoreLatched = 0;
	}

	ent->takedamage=qtrue; // so they can be destroyed
	// - We'll start it high, so that it cant be destroyed easily right away.
	ent->health=1500; // change this to make the turrets tougher or weaker.
	ent->die=turret_explode; // so they actually explode when destroyed
	
	ent->s.time2=1;
	ent->think = MC_think;
	ent->nextthink=level.time+100;

	// Announce any new buildables available
	// AnnounceBuildables();  // Move this to player scores?
}


/*
===========================
BuildMC
===========================
*/
void BuildMC( gentity_t *ent )
{
	gentity_t	*base;
	
	if (CanBuildHere(ent) == qfalse) 
	{ 
		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
		return; 
	}

	// single player only blue team can have a power core
	if((ent->client->sess.sessionTeam == TEAM_RED) && (g_GameMode.integer == 999))
	{
		return;
	}


	if (ent->client->sess.sessionTeam == TEAM_RED)
	{
		level.redMC++;
		level.redNeedMC = 0;
	}
	if (ent->client->sess.sessionTeam == TEAM_BLUE)
	{
		level.blueMC++;
		level.blueNeedMC = 0;
	}

	base=G_Spawn();
	base->parent=ent;
	
	base->s.modelindex = G_ModelIndex("models/turrets/mc.md3");
	base->model = "models/turrets/mc.md3";
	base->s.modelindex2 = G_ModelIndex("models/turrets/mc.md3");

	G_SetOrigin(base,ent->r.currentOrigin);
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
	
	base->s.eType=ET_GENERAL;
	base->s.time2=9; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	base->takedamage=qfalse; // so they can be destroyed
	//base->die=turret_explode; // so they actually explode when destroyed
	base->classname = "mc";
	base->s.team =  ent->client->sess.sessionTeam;
	
	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
	base->s.pos.trType = TR_GRAVITY;
	
	// Correction to default numbers -Vincent
	VectorSet( base->r.mins, -16, -16, -16 );
	VectorSet( base->r.maxs, 16, 16, 16);

	trap_LinkEntity( base );

	BuildableSpawn( base ); // New spawning -Vincent
	if( base->s.eType == ET_GENERAL )
	{ 
	
		// Bug , need a check here to make sure the other team doesn't get a point for this  MOD
		turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_SUICIDE );  
	}
	else
	{ // Initalize it!
	base->nextthink = level.time + 3000;
	base->think = MC_prethink;
	}
}




/* 
====================================

   SHIELD GENERATORS

==================================== 
*/

void GEN_think(gentity_t *ent)
{
	gentity_t *attacker;
	attacker = &g_entities[ENTITYNUM_WORLD];

	ent->clipmask = CONTENTS_SOLID;
	ent->r.contents = CONTENTS_SOLID;


	// If the mc is gone blow up the generator... Meaning
	// you need an mc before you can build generators.
	// Otherwise you just sit there looking good.
	if (ent->s.team == TEAM_BLUE)
	{
		// If there is no MC or too many sheild generators blow it up.
		if (level.blueMC == 0 || level.blueGen > 2)  
		{	
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
		}
	}
	if (ent->s.team == TEAM_RED)
	{
		if (level.redMC == 0 || level.redGen > 2) 
		{ 
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
		}
	}

	ent->think = GEN_think;
	ent->nextthink=level.time+100;

}

/*
===========================
gen_prethink

The generator in 'being
built' state
===========================
*/
// Generators Are Never Shielded
void gen_prethink(gentity_t *ent)
{
	// Dont count them until they have been built
	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
	{
		level.blueGen++;
		
	}
	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
	{
		level.redGen++;
		
	}

		BroadCastSound("sound/items/protect.ogg");
		ent->s.time2=0;
		ent->think = GEN_think;
		ent->nextthink=level.time+100;
}


/*
===========================
BuildGenerator
===========================
*/

void BuildGenerator( gentity_t *ent )
{

	gentity_t	*base;
	
	if (CanBuildHere(ent) == qfalse) 
	{ 
		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
		return; 
	}

	base=G_Spawn();
	base->parent=ent;
	base->s.modelindex = G_ModelIndex("models/turrets/generator.md3");
	base->model = "models/turrets/generator.md3";
	base->s.modelindex2 = G_ModelIndex("models/turrets/generator.md3");

	G_SetOrigin(base,ent->r.currentOrigin);
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);

	base->health=400; // change this to make tougher or weaker.
	base->s.eType=ET_GENERAL;
	
	base->s.time2=9; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	base->takedamage=qtrue; // so they can be destroyed
	base->die=turret_explode; // so they actually explode when destroyed

	base->classname = "generator";
	base->s.team =  ent->client->sess.sessionTeam;	
		
	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
	base->s.pos.trType = TR_GRAVITY;
	
	// Correction to default numbers -Vincent
	VectorSet( base->r.mins, -16, -16, -16 );
	VectorSet( base->r.maxs, 16, 16, 16);

	trap_LinkEntity( base );

	BuildableSpawn( base ); // New spawning -Vincent
	if( base->s.eType == ET_GENERAL )
	{ // Clear it!
	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
	}
	else
	{ // Initalize it!
	base->nextthink = level.time + 9000;
	base->think = gen_prethink;
	}
}




/* 
====================================

   TIME DISPLACERS Now Called 
   IMMOBILIZERS

  // Need Some Models
  

==================================== 
*/

void TD_think(gentity_t *ent)
{

	gentity_t *target;
	gentity_t *attacker;

	target = g_entities;
	attacker = &g_entities[ENTITYNUM_WORLD];

 	ent->clipmask = CONTENTS_SOLID;
	ent->r.contents = CONTENTS_SOLID;

	// If the mc is gone blow up the time displacer... Meaning
	// you need an mc before you can build anything.
	// Otherwise you just sit there looking good.
	if (ent->s.team == TEAM_BLUE)
	{
		// If there is no MC or too many sheild generators blow it up.
		if (level.blueMC == 0 || level.blueTD> 2)  
		{	
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
		}
	}
	if (ent->s.team == TEAM_RED)
	{
		if (level.redMC == 0 || level.redTD > 2) 
		{ 
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, attacker, NULL, NULL, 20, 0, MOD_LAVA);
		}
	}

	
	ent->nextthink=level.time+10;
	ent->think = TD_think;

	if (!checktarget(ent,ent->enemy))
	{
		turret_findenemy(ent);
	}

	if(!ent->enemy) { 	return; }
	
	target = ent->enemy;


	if (target->s.eType == ET_BUILDABLE) { return; } // Can't immobilize other buildables - Mantis #0000048 Shafe

	if (ent->count<level.time)
	{	
		target->immobilized = qtrue;
	} 

}

/*
===========================
TD_prethink

The Time Displacer in 'being
built' state

===========================
*/

void td_prethink(gentity_t *ent)
{
	// Dont count them until they have been built
	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
	{
		level.blueTD++;
	}
	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
	{
		level.redTD++;
	}

		BroadCastSound("sound/items/protect.ogg");
		ent->s.time2=0;
		ent->think = TD_think;
		ent->nextthink=level.time+100;
}


/*
===========================
BuildDisplacer
===========================
*/

void BuildDisplacer( gentity_t *ent )
{
	gentity_t	*base;
	
	if (CanBuildHere(ent) == qfalse) 
	{ 
		trap_SendServerCommand( ent-g_entities, "cp \"Not Enough Room to Build Here.\"" );
		return; 
	}

	base=G_Spawn();
	base->parent=ent;
	base->s.modelindex = G_ModelIndex("models/turrets/immobilizer.md3");
	base->model = "models/turrets/immobilizer.md3";
	base->s.modelindex2 = G_ModelIndex("models/turrets/immobilizer.md3");

	G_SetOrigin(base,ent->r.currentOrigin);
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);

	if(g_instagib.integer = 0) {
		base->health=250; // change this to make tougher or weaker.
	} else {
		base->health=450; // change this to make tougher or weaker.
	}


	base->s.eType=ET_GENERAL;
	
	base->s.time2=9; 
	base->takedamage=qtrue; // so they can be destroyed
	base->die=turret_explode; // so they actually explode when destroyed

	base->classname = "timedisplacer";
	base->s.team =  ent->client->sess.sessionTeam;	
		
	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
		
	base->clipmask = CONTENTS_SOLID; // Start solid too -Vincent
	base->r.contents = CONTENTS_SOLID; // Start solid too -Vincent
	base->s.pos.trType = TR_GRAVITY;
	
	// Correction to default numbers -Vincent
	VectorSet( base->r.mins, -16, -16, -16 );
	VectorSet( base->r.maxs, 16, 16, 16);

	trap_LinkEntity( base );

	BuildableSpawn( base ); // New spawning -Vincent
	if( base->s.eType == ET_GENERAL )
	{ // Clear it!
	turret_explode( base, &g_entities[ENTITYNUM_WORLD], &g_entities[ENTITYNUM_WORLD], 200, MOD_LAVA );  
	}
	else
	{ // Initalize it!
	base->nextthink = level.time + 5000;
	base->think = td_prethink;
	}
}


