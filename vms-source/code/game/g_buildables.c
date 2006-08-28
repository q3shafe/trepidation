//
// Trepidation Buildable Objects 
// (C)2006 Trepidation
// General Public License
//
// Most of the build rules are checked before any of the stuff in here is executed. 



#include "g_local.h"


/*

 This turret stuff is a real mess.. It Really needs cleaned up.. it's too late for me to worry about it now.


*/

/* 
====================================

   TURRET CONTROL

==================================== 
*/
#define RANGE 500

#define HARC 90
#define DARC 10
#define UARC 45




/*
===========================
turret_explode
We use this to blow up lots of
stuff.. So it's at top
===========================
*/
void turret_explode(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod){

	vec3_t dir; // needed by the event being adde

	dir[0] = dir[1] = 0;
	dir[2] = 1;

	// Take item away from master level stats
	
	if (self->parent->client->sess.sessionTeam == TEAM_BLUE)
	{
		if (self->classname == "generator") { level.blueGen--; }
		if (self->classname == "turret") { level.blueTurrets--; }		
		if (self->classname == "mc") { level.blueMC--; }		
	}
	if (self->parent->client->sess.sessionTeam == TEAM_RED)
	{
		if (self->classname == "generator") { level.redGen--; }
		if (self->classname == "turret") { level.redTurrets--; }
		if (self->classname == "mc") { level.redMC--; }		

	}
	
	

	if (self->chain) {
		G_FreeEntity(self->chain); // get rid of the gun. // the gun just vanishes
	}
	
self->s.weapon=WP_ROCKET_LAUNCHER; // to tell it what kind of explosion to use
G_AddEvent( self, EV_MISSILE_MISS, DirToByte( dir ) ); // to tell it to spawn an explosion here
self->freeAfterEvent = qtrue; // so the base goes away after the explosion

}


/*
===========================
checktarget
===========================
*/
qboolean checktarget(gentity_t *firer,gentity_t *target){

	vec3_t		distance;//,forward;
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
	return qfalse;
if (OnSameTeam(firer->parent, target)) // is the target one of us?
	return qfalse;

if (target->health<0) // is the target still alive?
	return qfalse;

VectorSubtract(target->r.currentOrigin,firer->r.currentOrigin,distance);
if (VectorLength(distance)>RANGE) // is the target within range?
	return qfalse;

trap_Trace (&trace, firer->s.pos.trBase, NULL, NULL, target->s.pos.trBase, firer->s.number, MASK_SHOT );
if ( trace.contents & CONTENTS_SOLID ) // can we see the target?
	return qfalse;
/*
The last two checks are done last as they require more processing power than the others.
this order is just better from a proccesing load perspective
*/

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

	fire_plasma( ent->activator, ent->r.currentOrigin, ent->turloc );

	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
	ent->count=level.time+200;

	// decloaks a cloaked turret when firing.
	if (ent->s.time2==2)
	{
		ent->s.time2=3;
		ent->chain->s.time2=3;
	}
}

/*
===========================
Base_Think
===========================
*/
void Base_think(gentity_t *ent){

	// If the mc is gone blow up the turret... Meaning
	// you need an mc before you can build turrets.
	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
	{
		if (level.blueMC == 0) 
		{	
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, NULL, NULL, NULL, 20, 0, MOD_LAVA);
		}
	}
	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
	{
		if (level.redMC == 0) 
		{ 
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, NULL, NULL, NULL, 20, 0, MOD_LAVA);
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
void createturretgun(gentity_t *ent){
	gentity_t *turret; 	// The object to hold the turrets details.
	int			num;
	int			touch[MAX_GENTITIES];


	// code to check there is noone within the base before making it solid
	vec3_t		mins, maxs;

	VectorAdd( ent->r.currentOrigin, ent->r.mins, mins );
	VectorAdd( ent->r.currentOrigin, ent->r.maxs, maxs );
	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
	if (num>1)
	{
		ent->nextthink=level.time+1000;
		return;
	}

	ent->nextthink=level.time+100; // sets up the thinking for the cloaking or regeneration/
	ent->think=Base_think; // handles cloaking or regeneration
	ent->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
	ent->r.contents = CONTENTS_SOLID;
	turret=G_Spawn();
	turret->parent=ent->parent;
	turret->chain=ent;
	ent->chain=turret;
	turret->s.eType=ET_TURRET;
	
	turret->s.time2=ent->s.time2;
	turret->eventTime=200;
	turret->s.number = turret - g_entities;
	turret->s.weapon=WP_PLASMAGUN;;
	turret->classname="turretgun";	
	turret->s.modelindex = G_ModelIndex("models/turrets/gun1.md3");
	turret->model = "models/turrets/gun1.md3";
	turret->s.modelindex2 = G_ModelIndex("models/turrets/gun1.md3");
	turret->think=turret_think;
	turret->nextthink=level.time+100;
	G_SetOrigin( turret, ent->r.currentOrigin );
	VectorCopy(ent->s.apos.trBase,turret->s.apos.trBase);
	VectorCopy(turret->s.apos.trBase,turret->centerpoint);
	trap_LinkEntity (turret);
}

/*
===========================
turret_retaliate
===========================
*/
void turret_retaliate(gentity_t *self, gentity_t *attacker, int damage){
// set the guns enemy to the person that shot it. (does not override targeting rules)
if (self->chain)
	self->chain->enemy=attacker;

// this is here to casue the turret to unshield when its taken a certain amount of damage. (enough to reduce health to below 100)
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
void BuildTurret( gentity_t *ent , int type ){

	// We need to check the turret type and select the appropriate model


	gentity_t	*base;
//	vec3_t 		forward,up;

	base=G_Spawn();
	base->parent=ent;
	
	
	base->r.contents = CONTENTS_FOG;
	
	if (type == 0)
	{
		base->s.modelindex = G_ModelIndex("models/turrets/base.md3");
		base->model = "models/turrets/base.md3";
		base->s.modelindex2 = G_ModelIndex("models/turrets/base.md3");
	}else
	{
		base->s.modelindex = G_ModelIndex("models/turrets/base2.md3");
		base->model = "models/turrets/base2.md3";
		base->s.modelindex2 = G_ModelIndex("models/turrets/base2.md3");
	}
	G_SetOrigin(base,ent->r.currentOrigin);
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
	base->think=createturretgun;
	
	if (type==0)
	{
		base->health=150; // change this to make the turrets tougher or weaker.
	} else
	{
		base->health=300; // change this to make the turrets tougher or weaker.
	}
	
	base->s.eType=ET_TURRET;

	base->classname = "turret";

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
	base->takedamage=qtrue; // so they can be destoryed
	base->die=turret_explode; // so they actually explode when destroyed
	base->pain=turret_retaliate; // if they are damaged they switch target to the person attacking (if its a valid target)
	base->nextthink=level.time+5000;
	VectorSet( base->r.mins, -15, -15, -20 );
	VectorSet( base->r.maxs, 35, 15, -5); 
	trap_LinkEntity (base);

}


/* 
====================================

   MASTER CONTROLLER

==================================== 
*/


/*
===========================
MC_think

 Master Controller Think.
 This controls the shielding 
 as well.
===========================
*/
void MC_think(gentity_t *ent){

	int shieldMultiplier;

	shieldMultiplier = 1;

	ent->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
	ent->r.contents = CONTENTS_SOLID;

	// Determine The Sheilding By Counting Shield Generators
	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
	{
		// If there's at least one shield generator and the MC's health is above 450 it'll be shielded
		//if (level.blueGen != 0) { ent->s.time2=1; } else { ent->s.time2=0; }
		shieldMultiplier = level.blueGen;

	}
	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
	{
		//if (level.redGen != 0) { ent->s.time2=1; } else { ent->s.time2=0; }
		shieldMultiplier = level.redGen;

	}

	shieldMultiplier++;

	if (shieldMultiplier > 1) { ent->s.time2 = 1; } else { ent->s.time2 = 0; }

	 // 9 is being built -- 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	
	// It's shielded but health is too low.. 
	// This turns shielding off and regeneration stops.
	if (ent->s.time2==1)
	{
		if (ent->health<450)
		{
			ent->s.time2=0;
		}
	}
	
	if ((ent->s.time2==1) && (shieldMultiplier > 1)) 
	{
		if (ent->health < (2000 * shieldMultiplier) ) 
		{
			ent->health+=1;
			ent->nextthink=level.time+100;
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
void MC_prethink(gentity_t *ent){

		ent->s.time2=1;
		ent->think = MC_think;
		ent->nextthink=level.time+100;
}


/*
===========================
BuildMC
===========================
*/
void BuildMC( gentity_t *ent ){

	gentity_t	*base;
//	vec3_t 		forward,up;


	if (ent->client->sess.sessionTeam == TEAM_BLUE)
	{
		level.blueMC++;
	}
	if (ent->client->sess.sessionTeam == TEAM_RED)
	{
		level.redMC++;
	}


	base=G_Spawn();
	base->parent=ent;
	
	base->s.modelindex = G_ModelIndex("models/turrets/mc.md3");
	base->model = "models/turrets/mc.md3";
	base->s.modelindex2 = G_ModelIndex("models/turrets/mc.md3");
	G_SetOrigin(base,ent->r.currentOrigin);
	
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
	base->think=MC_prethink;
	base->health=1300; // change this to make the turrets tougher or weaker.
	base->s.eType=ET_TURRET;
	base->s.time2=9; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	base->takedamage=qtrue; // so they can be destoryed
	base->die=turret_explode; // so they actually explode when destroyed
	//base->pain=turret_retaliate; // if they are damaged they switch target to the person attacking (if its a valid target)
	base->nextthink=level.time+3000;  // MC Need not take long to build
	base->classname = "mc";

	VectorSet( base->r.mins, -15, -15, -20 );
	VectorSet( base->r.maxs, 35, 15, 15); // Was -5



	trap_LinkEntity (base);
}




/* 
====================================

   SHIELD GENERATORS

==================================== 
*/

void GEN_think(gentity_t *ent){

 	ent->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
	ent->r.contents = CONTENTS_SOLID;

	// If the mc is gone blow up the generator... Meaning
	// you need an mc before you can build generators.
	// Otherwise you just sit there looking good.
	if (ent->parent->client->sess.sessionTeam == TEAM_BLUE)
	{
		if (level.blueMC == 0) 
		{	
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, NULL, NULL, NULL, 20, 0, MOD_LAVA);
		}
	}
	if (ent->parent->client->sess.sessionTeam == TEAM_RED)
	{
		if (level.redMC == 0) 
		{ 
			ent->health = 1; 
			ent->s.time2 = 0;
			G_Damage (ent, NULL, NULL, NULL, NULL, 20, 0, MOD_LAVA);
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
void gen_prethink(gentity_t *ent){

		ent->s.time2=0;
		ent->think = GEN_think;
		ent->nextthink=level.time+100;
}


/*
===========================
BuildGenerator
===========================
*/

void BuildGenerator( gentity_t *ent ){

	gentity_t	*base;

	if (ent->client->sess.sessionTeam == TEAM_BLUE)
	{
		level.blueGen++;
	}
	if (ent->client->sess.sessionTeam == TEAM_RED)
	{
		level.redGen++;
	}


	base=G_Spawn();
	base->parent=ent;
	base->s.modelindex = G_ModelIndex("models/turrets/generator.md3");
	base->model = "models/turrets/generator.md3";
	base->s.modelindex2 = G_ModelIndex("models/turrets/generator.md3");
	G_SetOrigin(base,ent->r.currentOrigin);
	VectorSet(base->s.apos.trBase,0,ent->s.apos.trBase[1],0);
	base->think=gen_prethink;
	base->health=400; // change this to make tougher or weaker.
	base->s.eType=ET_TURRET;

	base->s.time2=9; // 0 is a normal turret, 1 is a shielded turret, 2 is a cloaked turret, 3 is a cloaked turret thats firing (to let it know to recloak).
	base->takedamage=qtrue; // so they can be destoryed
	base->die=turret_explode; // so they actually explode when destroyed
	//base->pain=turret_retaliate; // if they are damaged they switch target to the person attacking (if its a valid target)
	
	base->classname = "generator";
	
		
	base->nextthink=level.time+8000;
	VectorSet( base->r.mins, -15, -15, -20 );
	VectorSet( base->r.maxs, 35, 15, 0);
	trap_LinkEntity (base);

}





