// 2006-2023 Team Trepidation GPL2
//

#pragma once


typedef struct {
	vmCvar_t* vmCvar;
	char* cvarName;
	char* defaultString;
	int			cvarFlags;
	int			modificationCount;  // for tracking changes
	qboolean	trackChange;	    // track this variable, and announce if changed
	qboolean teamShader;        // track and if changed, update shader state
} cvarTable_t;

gentity_t		g_entities[MAX_GENTITIES];
gclient_t		g_clients[MAX_CLIENTS];

vmCvar_t	g_gametype;
vmCvar_t	g_dmflags;
vmCvar_t	g_fraglimit;
vmCvar_t	g_timelimit;
vmCvar_t	g_capturelimit;
vmCvar_t	g_friendlyFire;
vmCvar_t	g_password;
vmCvar_t	g_needpass;
vmCvar_t	g_maxclients;
vmCvar_t	g_maxGameClients;
vmCvar_t	g_dedicated;
vmCvar_t	g_speed;
vmCvar_t	g_gravity;
vmCvar_t	g_cheats;
vmCvar_t	g_knockback;
vmCvar_t	g_quadfactor;
vmCvar_t	g_forcerespawn;
vmCvar_t	g_inactivity;
vmCvar_t	g_debugMove;
vmCvar_t	g_debugDamage;
vmCvar_t	g_debugAlloc;
vmCvar_t	g_weaponRespawn;
vmCvar_t	g_weaponTeamRespawn;
vmCvar_t	g_motd;
vmCvar_t	g_synchronousClients;
vmCvar_t	g_warmup;
vmCvar_t	g_doWarmup;
vmCvar_t	g_restarted;
vmCvar_t	g_log;
vmCvar_t	g_logSync;
vmCvar_t	g_blood;
vmCvar_t	g_podiumDist;
vmCvar_t	g_podiumDrop;
vmCvar_t	g_allowVote;
vmCvar_t	g_teamAutoJoin;
vmCvar_t	g_teamForceBalance;
vmCvar_t	g_banIPs;
vmCvar_t	g_filterBan;
vmCvar_t	g_smoothClients;
vmCvar_t	pmove_fixed;
vmCvar_t	pmove_msec;
vmCvar_t	g_rankings;
vmCvar_t	g_listEntity;
#ifdef MISSIONPACK
vmCvar_t	g_obeliskHealth;
vmCvar_t	g_obeliskRegenPeriod;
vmCvar_t	g_obeliskRegenAmount;
vmCvar_t	g_obeliskRespawnDelay;
vmCvar_t	g_cubeTimeout;
vmCvar_t	g_redteam;
vmCvar_t	g_blueteam;
vmCvar_t	g_singlePlayer;
vmCvar_t	g_enableDust;
vmCvar_t	g_enableBreath;
vmCvar_t	g_proxMineTimeout;
#endif
//unlagged - server options
vmCvar_t	g_delagHitscan;
vmCvar_t	g_unlaggedVersion;
vmCvar_t	g_truePing;
vmCvar_t	g_lightningDamage;
vmCvar_t	sv_fps;
//unlagged - server options

//Shafe - Trep
// Mods
vmCvar_t	g_instagib;
vmCvar_t	g_enableMultijump;
vmCvar_t	g_maxMultijump;
vmCvar_t	g_GameMode;
vmCvar_t	g_BlueMC;
vmCvar_t	g_RedMC;

vmCvar_t	g_MultiJumps;

// Arsenal
vmCvar_t	g_StartGauntlet;
vmCvar_t	g_StartMG;
vmCvar_t	g_StartSG;
vmCvar_t	g_StartGrenade;
vmCvar_t	g_StartSingCan;
vmCvar_t	g_StartFlame;
vmCvar_t	g_StartGauss;
vmCvar_t	g_StartPlasma;
vmCvar_t	g_StartBFG;
vmCvar_t	g_StartRandom;


// Other Options
vmCvar_t	g_Turrets;
vmCvar_t	g_MaxTurrets;
vmCvar_t	g_GrappleMode;
vmCvar_t	g_PCTeamkills;

// This shit doesn't work
vmCvar_t	g_GaussJump;
vmCvar_t	g_GaussKnockBack;
vmCvar_t	g_GaussSelfDamage;
vmCvar_t	g_GaussRate;

vmCvar_t	g_ReverseCTF;


vmCvar_t    g_mapfile;
vmCvar_t    g_randommap;
vmCvar_t    g_easymap;
vmCvar_t    g_lastmap;
vmCvar_t    g_lastmap2;
vmCvar_t	g_AutoChangeMap;
vmCvar_t	g_RegenHealth;
vmCvar_t	g_RegenAmmo;
vmCvar_t    g_NumRounds;
vmCvar_t    g_CurrentRound;
vmCvar_t	g_allowGrapple;
vmCvar_t	g_allowDevastator;
vmCvar_t	g_suddendeath;
vmCvar_t         g_pointrebuild;

vmCvar_t	g_doReady; //freeze

vmCvar_t	trep_debug;


static cvarTable_t		gameCvarTable[] = {
	// don't override the cheat state set by the system
	{ &g_cheats, "sv_cheats", "", 0, 0, qfalse },

	// noset vars
	{ NULL, "gamename", GAMEVERSION , CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },
	{ NULL, "gamedate", __DATE__ , CVAR_ROM, 0, qfalse  },
	{ &g_restarted, "g_restarted", "0", CVAR_ROM, 0, qfalse  },
	{ NULL, "sv_mapname", "", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse  },

	// latched vars
	{ &g_gametype, "g_gametype", "3", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
	{ &g_GameMode, "g_GameMode", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse  },
	{ &g_maxclients, "sv_maxclients", "8", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },
	{ &g_maxGameClients, "g_maxGameClients", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },

	// change anytime vars
	{ &g_dmflags, "dmflags", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue  },
	{ &g_fraglimit, "fraglimit", "20", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
	{ &g_timelimit, "timelimit", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },
	{ &g_capturelimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue },

	{ &g_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO, 0, qfalse  },

	{ &g_friendlyFire, "g_friendlyFire", "0", CVAR_ARCHIVE, 0, qtrue  },

	{ &g_teamAutoJoin, "g_teamAutoJoin", "0", CVAR_ARCHIVE  },
	{ &g_teamForceBalance, "g_teamForceBalance", "0", CVAR_ARCHIVE  },

	{ &g_warmup, "g_warmup", "20", CVAR_ARCHIVE, 0, qtrue  },
	{ &g_doWarmup, "g_doWarmup", "0", 0, 0, qtrue  },
	{ &g_log, "g_log", "games.log", CVAR_ARCHIVE, 0, qfalse  },
	{ &g_logSync, "g_logSync", "0", CVAR_ARCHIVE, 0, qfalse  },

	{ &g_password, "g_password", "", CVAR_USERINFO, 0, qfalse  },

	{ &g_banIPs, "g_banIPs", "", CVAR_ARCHIVE, 0, qfalse  },
	{ &g_filterBan, "g_filterBan", "1", CVAR_ARCHIVE, 0, qfalse  },

	{ &g_needpass, "g_needpass", "0", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse },

	{ &g_dedicated, "dedicated", "0", 0, 0, qfalse  },

	{ &g_speed, "g_speed", "320", 0, 0, qtrue  },
	{ &g_gravity, "g_gravity", "800", 0, 0, qtrue  },
	{ &g_knockback, "g_knockback", "1000", 0, 0, qtrue  },
	{ &g_quadfactor, "g_quadfactor", "3", 0, 0, qtrue  },
	{ &g_weaponRespawn, "g_weaponrespawn", "5", 0, 0, qtrue  },
	{ &g_weaponTeamRespawn, "g_weaponTeamRespawn", "30", 0, 0, qtrue },
	{ &g_forcerespawn, "g_forcerespawn", "20", 0, 0, qtrue },
	{ &g_inactivity, "g_inactivity", "0", 0, 0, qtrue },
	{ &g_debugMove, "g_debugMove", "0", 0, 0, qfalse },
	{ &g_debugDamage, "g_debugDamage", "0", 0, 0, qfalse },
	{ &g_debugAlloc, "g_debugAlloc", "0", 0, 0, qfalse },
	{ &g_motd, "g_motd", "", 0, 0, qfalse },
	{ &g_blood, "com_blood", "1", 0, 0, qfalse },

	{ &g_podiumDist, "g_podiumDist", "80", 0, 0, qfalse },
	{ &g_podiumDrop, "g_podiumDrop", "70", 0, 0, qfalse },

	{ &g_allowVote, "g_allowVote", "1", CVAR_ARCHIVE, 0, qfalse },
	{ &g_listEntity, "g_listEntity", "0", 0, 0, qfalse },

#ifdef MISSIONPACK
	{ &g_obeliskHealth, "g_obeliskHealth", "2500", 0, 0, qfalse },
	{ &g_obeliskRegenPeriod, "g_obeliskRegenPeriod", "1", 0, 0, qfalse },
	{ &g_obeliskRegenAmount, "g_obeliskRegenAmount", "15", 0, 0, qfalse },
	{ &g_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO, 0, qfalse },

	{ &g_cubeTimeout, "g_cubeTimeout", "30", 0, 0, qfalse },
	{ &g_redteam, "g_redteam", "Stroggs", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue },
	{ &g_blueteam, "g_blueteam", "Pagans", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO , 0, qtrue, qtrue  },
	{ &g_singlePlayer, "ui_singlePlayerActive", "", 0, 0, qfalse, qfalse  },

	{ &g_enableDust, "g_enableDust", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
	{ &g_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO, 0, qtrue, qfalse },
	{ &g_proxMineTimeout, "g_proxMineTimeout", "20000", 0, 0, qfalse },
#endif
	{ &g_smoothClients, "g_smoothClients", "1", 0, 0, qfalse},
	{ &pmove_fixed, "pmove_fixed", "0", CVAR_SYSTEMINFO, 0, qfalse},
	{ &pmove_msec, "pmove_msec", "8", CVAR_SYSTEMINFO, 0, qfalse},

	//unlagged - server options
		{ &g_delagHitscan, "g_delagHitscan", "1", CVAR_ARCHIVE | CVAR_SERVERINFO, 0, qtrue },
		{ &g_unlaggedVersion, "g_unlaggedVersion", "2.0", CVAR_ROM | CVAR_SERVERINFO, 0, qfalse },
		{ &g_truePing, "g_truePing", "1", CVAR_ARCHIVE, 0, qtrue },
		{ &g_lightningDamage, "g_lightningDamage", "8", 0, 0, qtrue },
		// it's CVAR_SYSTEMINFO so the client's sv_fps will be automagically set to its value
		{ &sv_fps, "sv_fps", "20", CVAR_SYSTEMINFO | CVAR_ARCHIVE, 0, qfalse },
		//unlagged - server options

			{ &g_rankings, "g_rankings", "0", 0, 0, qfalse},
			// Shafe - Trep - Cvars
				// Mods
				{ &g_instagib, "g_instagib", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qtrue  },
				{ &g_enableMultijump, "g_enableMultijump", "1", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qtrue  },
				{ &g_maxMultijump, "g_maxMultijump", "4", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qtrue  },


				//{ &g_GameMode, "g_GameMode", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse  },	
				{ &g_BlueMC, "g_BlueMC", "0", CVAR_SERVERINFO | CVAR_USERINFO, 0, qfalse  },
				{ &g_RedMC, "g_RedMC", "0", CVAR_SERVERINFO | CVAR_USERINFO, 0, qfalse  },


				// New Stuff
				{ &g_Turrets, "g_Turrets", "1", CVAR_ARCHIVE, 0, qtrue },
				{ &g_MaxTurrets, "g_MaxTurrets", "5", CVAR_ARCHIVE, 0, qtrue },

				// Arsenal Stuff
				{ &g_StartGauntlet, "g_StartGauntlet", "1", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartMG, "g_StartMG", "0", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartSG, "g_StartSG", "0", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartGrenade, "g_StartGrenade", "1", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartSingCan, "g_StartSingCan", "1", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartFlame, "g_StartFlame", "0", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartGauss, "g_StartGauss", "1", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartPlasma, "g_StartPlasma", "0", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartBFG, "g_StartBFG", "0", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_StartRandom, "g_StartRandom", "0", CVAR_ARCHIVE, 0, qtrue  },

				{ &g_GrappleMode, "g_GrappleMode", "1", CVAR_ARCHIVE, 0, qtrue  },
				{ &g_PCTeamkills, "g_PCTeamkills", "1", CVAR_ARCHIVE, 0, qtrue  },

				{ &g_GaussJump, "g_GaussJump", "0", 0, 0, qtrue },
				{ &g_GaussKnockBack, "g_GaussKnockBack", "0", 0, 0, qtrue },
				{ &g_GaussSelfDamage, "g_GaussSelfDamage", "1", 0, 0, qtrue },
				{ &g_GaussRate, "g_GaussRate", "10", 0, 0, qtrue },

				{ &g_ReverseCTF, "g_ReverseCTF", "0", 0, 0, qtrue },

				{ &g_MultiJumps, "g_MultiJumps", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue },

				{ &g_randommap, "g_randommap", "0", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_lastmap, "g_lastmap", "0", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_lastmap2, "g_lastmap2", "0", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_mapfile, "g_mapfile", "map_rotation.cfg", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_easymap, "g_easymap", "0", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_suddendeath, "g_suddendeath", "1", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_pointrebuild, "g_pointrebuild", "1", CVAR_ARCHIVE | CVAR_ARCHIVE, 0, qfalse},
				{ &g_AutoChangeMap, "g_AutoChangeMap", "1", 0, 0, qfalse },
				{ &g_RegenHealth, "g_RegenHealth", "0", 0, 0, qtrue },
				{ &g_RegenAmmo, "g_RegenAmmo", "0", 0, 0, qtrue },
				{ &g_NumRounds, "g_NumRounds", "0", 0, 0, qtrue },
				{ &g_CurrentRound, "g_CurrentRound", "0", 0, 0, qtrue },
				{ &g_allowGrapple, "g_allowGrapple", "1", 0, 0, qtrue },
				{ &g_allowDevastator, "g_allowDevastator", "1", 0, 0, qtrue },
				{ &g_doReady, "g_doReady", "0", 0, 0, qfalse },

				// Debugging
				{ &trep_debug, "trep_debug", "0", CVAR_ARCHIVE, 0, qtrue }

};
