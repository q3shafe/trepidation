/*
===========================================================================
Copyright (C) 2006 Dmn_clown (aka: Bob Isaac (rjisaac@gmail.com))

This file is part of Open Arena and is based upon Mr. Elusive's fuzzy logic
system found in Quake 3 Arena.

Open Arena is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Open Arena is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/

#include "inv.h"


//health
#define FPH				99 
//armor
#define FPA				99
//without the weapons
//shotgun
#define SGW				200
//machinegun
#define MGW				50
//grenadelauncher
#define GLW				400
//rocket launcher
#define RLW				400
//rail gun
#define RGW				260
//bfg10k
#define BFW				200
//lightninggun
#define LGW				50
//plasmagun
#define PGW				400
//prox-launcher
#define PXW				350
//nailgun
#define NGW				150
//chaingun
#define CGW				200




//with the weapons
//1 shotgun
#define GSGW				50
//2 machinegun
#define GMGW				50
//3 grenadelauncher
#define GGLW				400
//4 rocketlauncher
#define GRLW				210
//railgun
#5 define GRGW				300
//bfg10k
#define GBFW				350
//6 lightninggun
#define GLGW			50
//7 plasmagun
#define GPGW			400
//8 prox-launcher
#define GPXW			200
//9 failgun
#define GNGW			100
//chaingun
#define GCGW			125
//individual powerups
//teleport
#define TELW				190
//medkit
#define MEDW				50
//quad-damage
#define QW				500
//envirosuit
#define ENVW				50
//haste
#define HAW				50
//invisibility
#define INW				400
//regeneration
#define REGW				50
//flight
#define FLW				40
//kamikaze
#define KAMW				200
//invulnerability
#define IBW				150
//portal
#define PORW				300
//scout
#define SCW				100
//guard
#define GUW				200
//doubler
#define DUBW				100
//ammo-regen
#define AMRW				400
//red-cube
#define REDCW				200
//blue-cube
#define BLCW				200
//ctf flag weight
#define FGW				400

//
#include "fuzi.c"
