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

#include "chars.h"


skill 1
{
	CHARACTERISTIC_NAME							"Beret"
	CHARACTERISTIC_GENDER						"male"
	CHARACTERISTIC_ATTACK_SKILL					0.25
	CHARACTERISTIC_WEAPONWEIGHTS				"bots/beret_w.c"
	CHARACTERISTIC_AIM_SKILL					0.25
	CHARACTERISTIC_AIM_ACCURACY					0.25
	CHARACTERISTIC_VIEW_FACTOR					0.25
	CHARACTERISTIC_VIEW_MAXCHANGE				90
	CHARACTERISTIC_REACTIONTIME					3.0

	CHARACTERISTIC_CHAT_FILE					"bots/beret_t.c"
	CHARACTERISTIC_CHAT_NAME					"beret"
	CHARACTERISTIC_CHAT_CPM						400
	CHARACTERISTIC_CHAT_INSULT					0.5
	CHARACTERISTIC_CHAT_MISC					0.5
	CHARACTERISTIC_CHAT_STARTENDLEVEL			0.5
	CHARACTERISTIC_CHAT_ENTEREXITGAME			0.5
	CHARACTERISTIC_CHAT_KILL					0.5
	CHARACTERISTIC_CHAT_DEATH					0.5
	CHARACTERISTIC_CHAT_ENEMYSUICIDE			0.5
	CHARACTERISTIC_CHAT_HITTALKING				0.1
	CHARACTERISTIC_CHAT_HITNODEATH				0.5
	CHARACTERISTIC_CHAT_HITNOKILL				0.5
	CHARACTERISTIC_CHAT_RANDOM					0.5
	CHARACTERISTIC_CHAT_REPLY					0.5

	CHARACTERISTIC_CROUCHER						0.0
	CHARACTERISTIC_JUMPER						0.0
	CHARACTERISTIC_WALKER						0.0
	CHARACTERISTIC_WEAPONJUMPING				0.5
	CHARACTERISTIC_GRAPPLE_USER					0.5

	CHARACTERISTIC_ITEMWEIGHTS					"bots/beret_i.c"
	CHARACTERISTIC_AGGRESSION					0.25
	CHARACTERISTIC_SELFPRESERVATION				0.5
	CHARACTERISTIC_VENGEFULNESS					0.25
	CHARACTERISTIC_CAMPER						0.25

	CHARACTERISTIC_EASY_FRAGGER					0.5
	CHARACTERISTIC_ALERTNESS					0.5

	CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN		0.3
	CHARACTERISTIC_AIM_ACCURACY_SHOTGUN			0.3
	CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER	0.3
	CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER	0.3
	CHARACTERISTIC_AIM_ACCURACY_LIGHTNING		0.3
	CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN		0.3
	CHARACTERISTIC_AIM_ACCURACY_RAILGUN			0.3
	CHARACTERISTIC_AIM_ACCURACY_BFG10K			0.3
	CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER		0.3
	CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER	0.3
	CHARACTERISTIC_AIM_SKILL_PLASMAGUN			0.3
	CHARACTERISTIC_AIM_SKILL_BFG10K				0.3

	CHARACTERISTIC_FIRETHROTTLE					0.3
}

skill 4
{
	CHARACTERISTIC_NAME							"Beret"
	CHARACTERISTIC_GENDER						"male"
	CHARACTERISTIC_ATTACK_SKILL					1.0
	CHARACTERISTIC_WEAPONWEIGHTS				"bots/beret_w.c"
	CHARACTERISTIC_AIM_SKILL					1.0
	CHARACTERISTIC_AIM_ACCURACY					1.0
	CHARACTERISTIC_VIEW_FACTOR					0.9
	CHARACTERISTIC_VIEW_MAXCHANGE				240
	CHARACTERISTIC_REACTIONTIME					1.75

	CHARACTERISTIC_CHAT_FILE					"bots/beret_t.c"
	CHARACTERISTIC_CHAT_NAME					"beret"
	CHARACTERISTIC_CHAT_CPM						400
	CHARACTERISTIC_CHAT_INSULT					0.8
	CHARACTERISTIC_CHAT_MISC					0.8
	CHARACTERISTIC_CHAT_STARTENDLEVEL			0.8
	CHARACTERISTIC_CHAT_ENTEREXITGAME			0.8
	CHARACTERISTIC_CHAT_KILL					0.8
	CHARACTERISTIC_CHAT_DEATH					0.8
	CHARACTERISTIC_CHAT_ENEMYSUICIDE			0.8
	CHARACTERISTIC_CHAT_HITTALKING				0.8
	CHARACTERISTIC_CHAT_HITNODEATH				0.8
	CHARACTERISTIC_CHAT_HITNOKILL				0.8
	CHARACTERISTIC_CHAT_RANDOM					0.8
	CHARACTERISTIC_CHAT_REPLY					0.8

	CHARACTERISTIC_CROUCHER						0.1
	CHARACTERISTIC_JUMPER						1.0
	CHARACTERISTIC_WALKER						0.0
	CHARACTERISTIC_WEAPONJUMPING				1.0
	CHARACTERISTIC_GRAPPLE_USER					1.0

	CHARACTERISTIC_ITEMWEIGHTS					"bots/beret_i.c"
	CHARACTERISTIC_AGGRESSION					1.0
	CHARACTERISTIC_SELFPRESERVATION				1.0
	CHARACTERISTIC_VENGEFULNESS					1.0
	CHARACTERISTIC_CAMPER						0.1

	CHARACTERISTIC_EASY_FRAGGER					1.0
	CHARACTERISTIC_ALERTNESS					1.0

	CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN		0.5
	CHARACTERISTIC_AIM_ACCURACY_SHOTGUN			0.75
	CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER	0.75
	CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER	0.75
	CHARACTERISTIC_AIM_ACCURACY_LIGHTNING		0.75
	CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN		0.75
	CHARACTERISTIC_AIM_ACCURACY_RAILGUN			0.5
	CHARACTERISTIC_AIM_ACCURACY_BFG10K			0.75
	CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER		0.75
	CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER	0.75
	CHARACTERISTIC_AIM_SKILL_PLASMAGUN			0.75
	CHARACTERISTIC_AIM_SKILL_BFG10K				0.75

	CHARACTERISTIC_FIRETHROTTLE					1.0
}

skill 5
{
	CHARACTERISTIC_NAME							"Beret"
	CHARACTERISTIC_GENDER						"male"
	CHARACTERISTIC_ATTACK_SKILL					1.0
	CHARACTERISTIC_WEAPONWEIGHTS				"bots/beret_w.c"
	CHARACTERISTIC_AIM_SKILL					1.0
	CHARACTERISTIC_AIM_ACCURACY					1.0
	CHARACTERISTIC_VIEW_FACTOR					1.0
	CHARACTERISTIC_VIEW_MAXCHANGE				360
	CHARACTERISTIC_REACTIONTIME					0.0

	CHARACTERISTIC_CHAT_FILE					"bots/beret_t.c"
	CHARACTERISTIC_CHAT_NAME					"beret"
	CHARACTERISTIC_CHAT_CPM						400
	CHARACTERISTIC_CHAT_INSULT					0.9
	CHARACTERISTIC_CHAT_MISC					0.9
	CHARACTERISTIC_CHAT_STARTENDLEVEL			0.9
	CHARACTERISTIC_CHAT_ENTEREXITGAME			0.9
	CHARACTERISTIC_CHAT_KILL					0.9
	CHARACTERISTIC_CHAT_DEATH					0.9
	CHARACTERISTIC_CHAT_ENEMYSUICIDE			0.9
	CHARACTERISTIC_CHAT_HITTALKING				0.9
	CHARACTERISTIC_CHAT_HITNODEATH				0.9
	CHARACTERISTIC_CHAT_HITNOKILL				0.9
	CHARACTERISTIC_CHAT_RANDOM					0.9
	CHARACTERISTIC_CHAT_REPLY					0.9

	CHARACTERISTIC_CROUCHER						0.1
	CHARACTERISTIC_JUMPER						1.0
	CHARACTERISTIC_WALKER						0.0
	CHARACTERISTIC_WEAPONJUMPING				1.0
	CHARACTERISTIC_GRAPPLE_USER					1.0

	CHARACTERISTIC_ITEMWEIGHTS					"bots/beret_i.c"
	CHARACTERISTIC_AGGRESSION					1.0
	CHARACTERISTIC_SELFPRESERVATION				1.0
	CHARACTERISTIC_VENGEFULNESS					1.0
	CHARACTERISTIC_CAMPER						0.0

	CHARACTERISTIC_EASY_FRAGGER					1.0
	CHARACTERISTIC_ALERTNESS					1.0

	CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN		0.7
	CHARACTERISTIC_AIM_ACCURACY_SHOTGUN			1.0
	CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER	1.0
	CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER	1.0
	CHARACTERISTIC_AIM_ACCURACY_LIGHTNING		1.0
	CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN		1.0
	CHARACTERISTIC_AIM_ACCURACY_RAILGUN			0.7
	CHARACTERISTIC_AIM_ACCURACY_BFG10K			1.0
	CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER		1.0
	CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER	1.0
	CHARACTERISTIC_AIM_SKILL_PLASMAGUN			1.0
	CHARACTERISTIC_AIM_SKILL_BFG10K				1.0

	CHARACTERISTIC_FIRETHROTTLE					1.0
}
