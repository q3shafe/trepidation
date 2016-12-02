

chat "penny"
{
	#include "teamplay.h"

	type "game_enter"
	{
		"Hi There!";
		"Hey all!";
		"Hey All, Here we go again.";
		"Why don't you people just lay down and die, it'll save me the trouble.";
	}

	type "game_exit"
	{
		GOODBYE1;
		GOODBYE4;
		GOODBYE3;
	}

	type "level_start"
	{
		"Oh man, ", 4, " again?!?";
		"Alright, ", 4, " has always been good to me.";
	}

	type "level_end"
	{
		"Good Game!";
		"gg";
	}

	type "level_end_victory"
	{
		"Oh Yeah! Good Game.";
	}

	type "level_end_lose"
	{
		"Aww... crap!";
		"Good Game!";		
	}

	type "hit_talking"
	{
		DEATH_TALKING;
		
	}

	type "hit_nodeath"
	{
		TAUNT0;
		TAUNT1;
		TAUNT2;
	}

	type "hit_nokill"
	{
		HIT_NOKILL0;
		HIT_NOKILL1;
		HIT_NOKILL1;
	}

	type "death_telefrag"
	{
		DEATH_TELEFRAGGED0;
		DEATH_TELEFRAGGED0;
		DEATH_TELEFRAGGED0;
	}

	type "death_cratered"
	{
		DEATH_FALLING0;
		DEATH_FALLING0;
		DEATH_FALLING0;
	}

	type "death_lava"
	{
		"Well it was getting a bit nippy...";
		"mmm... toasty!";
	}

	type "death_slime"
	{
		"D'oh!";
	}

	type "death_drown"
	{
		"Who needs air?";
	}

	type "death_suicide"
	{
		DEATH_SUICIDE0;
		DEATH_SUICIDE1;
		DEATH_SUICIDE1;
	}

	type "death_gauntlet"
	{
		DEATH_GAUNTLET0;
		DEATH_GAUNTLET1;
		DEATH_GAUNTLET1;
	}

	type "death_rail"
	{
		DEATH_RAIL1;
		DEATH_RAIL1;
		DEATH_RAIL0;
		
	}

	type "death_bfg"
	{
		DEATH_BFG1;
		DEATH_BFG0;
		 
	}

	type "death_insult"
	{
		"What the... how cheap!";
		"Back in my day, frags weren't so cheap.";
	}

	type "death_praise"
	{
		 0, " is death incarnate.";
	}

	type "kill_rail"
	{
		KILL_RAIL0;
		KILL_RAIL1;
	}

	type "kill_gauntlet"
	{
		KILL_GAUNTLET0;
		KILL_GAUNTLET1;
		
	}

	type "kill_telefrag"
	{
		TELEFRAGGED0;
		TELEFRAGGED1;
	}

	type "kill_suicide"
	{
		TAUNT0;
		TAUNT1;
	}

	type "kill_insult"
	{
		"Pathetic.";
		"tsk";
		"My ", family_member, " could do better.";
	}

	type "kill_praise"
	{
		"Nice one, ", 0, ".";
		"Wow, ~you never saw that one coming, ", 0, ".";
	}

	type "random_insult"
	{
		 0, ", ~you suck!";
		 0, " needs to stop calling my mom.";
	}

	type "random_misc"
	{
		0, " gave my ~mom ", disease, ".";
		"Is it true that ", peeps, " is a bot?";
		
	}
}
