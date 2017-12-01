// 2017 Trepidation Licensed under the GPL2 - Team Trepidation / N5 Networks
//

#include "g_local.h"

extern void BroadCastSound(char *path);
extern char *GetRandomMap();
extern char *GetEasyMap();
extern void AnnounceBuildables();

level_locals_t	level;

typedef struct {
	vmCvar_t	*vmCvar;
	char		*cvarName;
	char		*defaultString;
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

//vmCvar_t	g_CTFGrapple; // Decided not to make this an option

// bk001129 - made static to avoid aliasing
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





// bk001129 - made static to avoid aliasing
static int gameCvarTableSize = sizeof( gameCvarTable ) / sizeof( gameCvarTable[0] );


void G_InitGame( int levelTime, int randomSeed, int restart );
void G_RunFrame( int levelTime );
void G_ShutdownGame( int restart );
void CheckExitRules( void );


/*
================
vmMain

This is the only way control passes into the module.
This must be the very first function compiled into the .q3vm file
================
*/
int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
	switch ( command ) {
	case GAME_INIT:
		G_InitGame( arg0, arg1, arg2 );
		return 0;
	case GAME_SHUTDOWN:
		G_ShutdownGame( arg0 );
		return 0;
	case GAME_CLIENT_CONNECT:
		return (int)ClientConnect( arg0, arg1, arg2 );
	case GAME_CLIENT_THINK:
		ClientThink( arg0 );
		return 0;
	case GAME_CLIENT_USERINFO_CHANGED:
		ClientUserinfoChanged( arg0 );
		return 0;
	case GAME_CLIENT_DISCONNECT:
		ClientDisconnect( arg0 );
		return 0;
	case GAME_CLIENT_BEGIN:
		ClientBegin( arg0 );
		return 0;
	case GAME_CLIENT_COMMAND:
		ClientCommand( arg0 );
		return 0;
	case GAME_RUN_FRAME:
		G_RunFrame( arg0 );
		return 0;
	case GAME_CONSOLE_COMMAND:
		return ConsoleCommand();
	case BOTAI_START_FRAME:
		return BotAIStartFrame( arg0 );
	}

	return -1;
}


void QDECL G_Printf( const char *fmt, ... ) {
	va_list		argptr;
	char		text[1024];

	va_start (argptr, fmt);
	vsprintf (text, fmt, argptr);
	va_end (argptr);

	trap_Printf( text );
}

void QDECL G_Error( const char *fmt, ... ) {
	va_list		argptr;
	char		text[1024];

	va_start (argptr, fmt);
	vsprintf (text, fmt, argptr);
	va_end (argptr);

	trap_Error( text );
}

/*
================
G_FindTeams

Chain together all entities with a matching team field.
Entity teams are used for item groups and multi-entity mover groups.

All but the first will have the FL_TEAMSLAVE flag set and teammaster field set
All but the last will have the teamchain field set to the next one
================
*/
void G_FindTeams( void ) {
	gentity_t	*e, *e2;
	int		i, j;
	int		c, c2;

	c = 0;
	c2 = 0;
	for ( i=1, e=g_entities+i ; i < level.num_entities ; i++,e++ ){
		if (!e->inuse)
			continue;
		if (!e->team)
			continue;
		if (e->flags & FL_TEAMSLAVE)
			continue;
		e->teammaster = e;
		c++;
		c2++;
		for (j=i+1, e2=e+1 ; j < level.num_entities ; j++,e2++)
		{
			if (!e2->inuse)
				continue;
			if (!e2->team)
				continue;
			if (e2->flags & FL_TEAMSLAVE)
				continue;
			if (!strcmp(e->team, e2->team))
			{
				c2++;
				e2->teamchain = e->teamchain;
				e->teamchain = e2;
				e2->teammaster = e;
				e2->flags |= FL_TEAMSLAVE;

				// make sure that targets only point at the master
				if ( e2->targetname ) {
					e->targetname = e2->targetname;
					e2->targetname = NULL;
				}
			}
		}
	}

	G_Printf ("%i teams with %i entities\n", c, c2);
}

void G_RemapTeamShaders() {
#ifdef MISSIONPACK
	char string[1024];
	float f = level.time * 0.001;
	Com_sprintf( string, sizeof(string), "team_icon/%s_red", g_redteam.string );
	AddRemap("textures/ctf2/redteam01", string, f); 
	AddRemap("textures/ctf2/redteam02", string, f); 
	Com_sprintf( string, sizeof(string), "team_icon/%s_blue", g_blueteam.string );
	AddRemap("textures/ctf2/blueteam01", string, f); 
	AddRemap("textures/ctf2/blueteam02", string, f); 
	trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
#endif
}

/*
===================
Trepidation - Shafe
CountTeamSurvivors
Used For Arsenal and Last Man Standing
===================
*/
int CountTeamSurvivors ( int team )
{
		int			tmpCnt;
		int			i;
		gclient_t	*cl;

			
			tmpCnt = 0;
			for ( i = 0; i < level.maxclients; i++ )
			{
				
				cl = &level.clients[i];

				if ( cl->pers.connected == CON_CONNECTED && cl->pers.Eliminated == qfalse && cl->sess.sessionTeam != TEAM_SPECTATOR && cl->sess.sessionTeam == team)
				{
					tmpCnt++;
				
				}
			}

return tmpCnt;
}

void UnzoomAll()
{
	int i;
int count;
count = 0;
	for ( i = 0 ; i < level.maxclients ; i++ ) 
	{
		if ( level.clients[i].pers.connected == CON_CONNECTED) 
		{
			
			trap_SendServerCommand(level.clients[i].ps.clientNum, "-gzoom");			
			level.clients[i].Zoomed = qfalse;

		}
	}

}

// Trepidation - Is there anyone aside from BOTs here?
/*
	===================
	Are There Live Players?
	True/False
	===================
*/

qboolean LivePlayersOnTeam (int team) 
{
int i;
int count;
count = 0;
	for ( i = 0 ; i < level.maxclients ; i++ ) 
	{
		if ( level.clients[i].pers.connected == CON_CONNECTED && level.clients[i].sess.sessionTeam == team) 
		{
			if (!(g_entities[i].r.svFlags & SVF_BOT)) 
			{
				count++;
			}

		}
	}
	
	if (count > 0)
	{
		return qtrue;
	}
	else
	{
		return qfalse;
	}

}

qboolean AreThereLivePlayers () 
{
int i;
int count;
count = 0;
	for ( i = 0 ; i < level.maxclients ; i++ ) 
	{
		if ( level.clients[i].pers.connected == CON_CONNECTED ) 
		{
			if (!(g_entities[i].r.svFlags & SVF_BOT)) 
			{
				count++;
			}
		}
	}
	
	if (count > 0)
	{
		return qtrue;
	}
	else
	{
		return qfalse;
	}

}


/*
===================
Trepidation - Shafe
CountSurvivors
Used For Arsenal and Last Man Standing
===================
*/
int CountSurvivors ( void )
{
		int			tmpCnt;
		int			i;
		gclient_t	*cl;

			tmpCnt = 0;
			for ( i = 0; i < level.maxclients; i++ )
			{
				cl = &level.clients[i];

				if ( cl->pers.connected == CON_CONNECTED && cl->pers.Eliminated == qfalse && cl->sess.sessionTeam != TEAM_SPECTATOR)
				{
					tmpCnt++;
				
				}
			}

return tmpCnt;
}


int CountEliminated ( void )
{
		int			tmpCnt;
		int			i;
		gclient_t	*cl;

			tmpCnt = 0;
			for ( i = 0; i < level.maxclients; i++ )
			{
				cl = &level.clients[i];

				if ( cl->pers.connected == CON_CONNECTED && cl->pers.Eliminated == qtrue && cl->sess.sessionTeam == TEAM_SPECTATOR)
				{
					tmpCnt++;
				
				}
			}

return tmpCnt;
}

/*
================
G_InitModRules

Shafe - Trep Set The Rules for Various Mods
================
*/
extern int altAmmoUsage[];
void G_InitModRules( void )
{

	// Arsenal Random Weapons
		if ((g_StartRandom.integer == 1) && (g_GameMode.integer == 1))
		{
			
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartGauntlet 0\n"); 
			// In random mode we should always keep the lfo rifle -- shafe (prevents that chance that no weapons are auto selected
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartMG 1\n"); 
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartSG 0\n"); 
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartGrenade 0\n"); 
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartSingCan 0\n"); 
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartFlame 0\n"); 
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartGauss 0\n");  
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartPlasma 0\n");
			trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartBFG 0\n");
			
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartGauntlet 1\n"); }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartMG 1\n"); }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartSG 1\n"); }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartGrenade 1\n"); }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartSingCan 1\n"); }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartFlame 1\n"); }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartGauss 1\n");  }
			if (irandom(0,1) > 0) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartPlasma 1\n");}
			// The Devestator Shows up less
			if (irandom(0,2) > 1) { trap_SendConsoleCommand( EXEC_APPEND, "seta g_StartBFG 1\n");}

		} 
	

	// We only allow team_ffa in trepidation gametype
	if (g_GameMode.integer == 3)
	{
		trap_SendConsoleCommand( EXEC_APPEND, "g_gametype 3\n" );
		g_gametype.integer = 3;
	}

	if ((g_GameMode.integer == 3) && (g_gametype.integer == 0 ))
	{
		if (trep_debug.integer) { G_Printf("Resetting gamemode to 0 %s\n", g_gametype.integer ); }
		trap_SendConsoleCommand( EXEC_APPEND, "g_GameMode 0\n" );
		g_GameMode.integer = 0;
	}


	// Dont Use up Ammo in Arsenal
	if (( g_GameMode.integer == 1 ) || (g_GameMode.integer == 2)) 
	{
		altAmmoUsage[WP_GAUNTLET] = 0;
		altAmmoUsage[WP_MACHINEGUN] = 0;
		altAmmoUsage[WP_SHOTGUN] = 0;
		altAmmoUsage[WP_GRENADE_LAUNCHER] = 0;
		altAmmoUsage[WP_ROCKET_LAUNCHER] = 0;
		altAmmoUsage[WP_LIGHTNING] = 0;
		altAmmoUsage[WP_RAILGUN] = 0;
		altAmmoUsage[WP_PLASMAGUN] = 0;
		altAmmoUsage[WP_BFG] = 0;	
		// Set some cvars

		//g_teamAutoJoin.integer = 0;
		g_doWarmup.integer = 1;
		//g_warmup.integer = 50;
		
		// We only allow ffa in arsenal
		if (g_GameMode.integer == 1)
		{
			g_gametype.integer = 0;
			trap_SendConsoleCommand( EXEC_APPEND, "g_gametype 0\n" );
		}

		


	}

	if ( g_instagib.integer != 0 )
	{//don't use up ammo in instagib mode
		altAmmoUsage[WP_RAILGUN] = 0;
	}
}
/*
=================
G_RegisterCvars
=================
*/
void G_RegisterCvars( void ) {
	int			i;
	cvarTable_t	*cv;
	qboolean remapped = qfalse;

	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
		trap_Cvar_Register( cv->vmCvar, cv->cvarName,
			cv->defaultString, cv->cvarFlags );
		if ( cv->vmCvar )
			cv->modificationCount = cv->vmCvar->modificationCount;

		if (cv->teamShader) {
			remapped = qtrue;
		}
	}

	if (remapped) {
		G_RemapTeamShaders();
	}

	// check some things
	if ( g_gametype.integer < 0 || g_gametype.integer >= GT_MAX_GAME_TYPE ) {
		G_Printf( "g_gametype %i is out of range, defaulting to 0\n", g_gametype.integer );
		trap_Cvar_Set( "g_gametype", "0" );
	}

	level.warmupModificationCount = g_warmup.modificationCount;
}

/*
=================
G_UpdateCvars
=================
*/
void G_UpdateCvars( void ) {
	int			i;
	cvarTable_t	*cv;
	qboolean remapped = qfalse;

	for ( i = 0, cv = gameCvarTable ; i < gameCvarTableSize ; i++, cv++ ) {
		if ( cv->vmCvar ) {
			trap_Cvar_Update( cv->vmCvar );

			if ( cv->modificationCount != cv->vmCvar->modificationCount ) {
				cv->modificationCount = cv->vmCvar->modificationCount;

				if ( cv->trackChange ) {
					trap_SendServerCommand( -1, va("print \"Server: %s changed to %s\n\"", 
						cv->cvarName, cv->vmCvar->string ) );
				}

				if (cv->teamShader) {
					remapped = qtrue;
				}
			}
		}
	}

	if (remapped) {
		G_RemapTeamShaders();
	}
}



/*
============
G_ShowTopStats

============
*/
void G_ShowTopStats( void ) {

int		tt;	
int		td;	
int		ttd;	
int		tc;	
int		ttc;	
int		ttt;	
int		tks;
int		tds;
int		tknd;
int		i;
gentity_t	*ent = NULL;
gentity_t	*topdeath = NULL;
gentity_t	*topcaps = NULL;
gentity_t	*topkillspree = NULL;
gentity_t	*topdeathspree = NULL;
gentity_t	*topkillsnodie = NULL;


	tt=0;
	td=0;
	ttt=0;
	ttd=0;
	tc=0;
	ttc=0;
	tds=0;
	tks=0;
	tknd=0;

	for ( i = 0 ; i < level.maxclients ; i++ ) 
	{
	
		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
			continue;
		}

		ent = &g_entities[i];
		
		if (ent->InstaCaps > tt) 
		{	
			tt = ent->InstaCaps; 
			topcaps = ent;
		}
		if (ent->InstaDeaths > td) 
		{ 
			td = ent->InstaDeaths; 
			topdeath = ent;
		
		}

		// This used to be captures now it's chat frags 
		if (ent->InstaChatFrags > tc) 
		{ 
			tc = ent->InstaChatFrags; 
			topcaps = ent;
		
		}


		// Top death Spree
		if (ent->InstaMostDeathSpree > tds) 
		{ 
			tds = ent->InstaMostDeathSpree;
			topdeathspree = ent;
		
		}

		// Top Killing Spree
		if (ent->InstaMostKillSpree > tks) 
		{ 
			tks = ent->InstaMostKillSpree; 
			topkillspree = ent;
		
		}

		// Most Kills Without Dying
		
		// First Make Sure That They Wern't on a better spree when the map ended...
		// If they are force the value over so their best run is registered

		if (ent->InstaKillsInRowTemp > ent->InstaKillsInRow) 
		{
				ent->InstaKillsInRow = ent->InstaKillsInRowTemp;
		}

		// No figure out who had the best run
		if (ent->InstaKillsInRow > tknd)
		{ 
			tknd = ent->InstaKillsInRow; 
			topkillsnodie = ent;
		
		}

	}
		
		trap_SendServerCommand( -1, va("print \"^9----^3**^9--- ^2RANKINGS ^9---^3**^9---\n\""));
		if (tknd>0) 
		{
			trap_SendServerCommand( -1, va("print \"^9Most Kills w/o Dying..: ^3%s ^9%i\n\"", topkillsnodie->client->pers.netname, tknd));
		}
		
		
		if (tt>0) 
		{
			trap_SendServerCommand( -1, va("print \"^9Most Captures.........: ^3%s ^9%i\n\"", topcaps->client->pers.netname, tt));
		}

		if (td>0)
		{
			trap_SendServerCommand( -1, va("print \"^9Most Deaths...........: ^3%s ^9%i\n\"", topdeath->client->pers.netname, td));
		}

		if (tks>0)
		{
			trap_SendServerCommand( -1, va("print \"^9Most Killing Sprees...: ^3%s ^9%i\n\"", topkillspree->client->pers.netname, tks));
		}
		
		if (tds>0)	
		{
			trap_SendServerCommand( -1, va("print \"^9Most Dying Sprees.....: ^3%s ^9%i\n\"", topdeathspree->client->pers.netname, tds));
		}
		
		if (tc>0)
		{
			trap_SendServerCommand( -1, va("print \"^9Most ChatFrags........: ^3%s ^9%i\n\"", topcaps->client->pers.netname, tc));
		}
	
}



/*
============
G_InitGame

============
*/
void G_InitGame( int levelTime, int randomSeed, int restart ) {
	int					i;

	G_Printf ("------- Game Initialization -------\n");
	G_Printf ("gamename: %s\n", GAMEVERSION);
	G_Printf ("gamedate: %s\n", __DATE__);

	srand( randomSeed );

	G_RegisterCvars();

	G_ProcessIPBans();

	G_InitMemory();

	// set some level globals
	memset( &level, 0, sizeof( level ) );
	level.time = levelTime;
	level.startTime = levelTime;
	level.blueScoreTime = levelTime;
	level.redScoreTime = levelTime;
	level.blueNeedMC = 1;
	level.redNeedMC= 1;
	level.redBuilding = 0;
	level.blueBuilding = 0;
	level.firstStrike = qfalse; // Shafe - Trep
	//level.lastClient = -1;
	
		

	if ((g_gametype.integer == 0) && (g_GameMode.integer == 3))
	{
		g_GameMode.integer = 0;
	}


	level.snd_fry = G_SoundIndex("sound/player/fry.wav");	// FIXME standing in lava / slime

	if ( g_gametype.integer != GT_SINGLE_PLAYER && g_log.string[0] ) {
		if ( g_logSync.integer ) {
			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND_SYNC );
		} else {
			trap_FS_FOpenFile( g_log.string, &level.logFile, FS_APPEND );
		}
		if ( !level.logFile ) {
			G_Printf( "WARNING: Couldn't open logfile: %s\n", g_log.string );
		} else {
			char	serverinfo[MAX_INFO_STRING];

			trap_GetServerinfo( serverinfo, sizeof( serverinfo ) );

			G_LogPrintf("------------------------------------------------------------\n" );
			G_LogPrintf("InitGame: %s\n", serverinfo );
		}
	} else {
		G_Printf( "Not logging to disk.\n" );
	}

	G_InitWorldSession();

	// initialize all entities for this game
	memset( g_entities, 0, MAX_GENTITIES * sizeof(g_entities[0]) );
	level.gentities = g_entities;

	// initialize all clients for this game
	level.maxclients = g_maxclients.integer;
	memset( g_clients, 0, MAX_CLIENTS * sizeof(g_clients[0]) );
	level.clients = g_clients;

	// set client fields on player ents
	for ( i=0 ; i<level.maxclients ; i++ ) {
		g_entities[i].client = level.clients + i;
	}

	// always leave room for the max number of clients,
	// even if they aren't all used, so numbers inside that
	// range are NEVER anything but clients
	level.num_entities = MAX_CLIENTS;

	// let the server system know where the entites are
	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
		&level.clients[0].ps, sizeof( level.clients[0] ) );

	// reserve some spots for dead player bodies
	InitBodyQue();

	ClearRegisteredItems();

	// parse the key/value pairs and spawn gentities
	G_SpawnEntitiesFromString();

	// general initialization
	G_FindTeams();

	// make sure we have flags for CTF, etc
	if( g_gametype.integer >= GT_TEAM ) {
		G_CheckTeamItems();
	}

	SaveRegisteredItems();

	G_Printf ("-----------------------------------\n");

	if( g_gametype.integer == GT_SINGLE_PLAYER || trap_Cvar_VariableIntegerValue( "com_buildScript" ) ) {
		G_ModelIndex( SP_PODIUM_MODEL );
		G_SoundIndex( "sound/player/gurp1.wav" );
		G_SoundIndex( "sound/player/gurp2.wav" );
	}

		// Shafe - podium
		G_ModelIndex( SP_PODIUM_MODEL );
		G_SoundIndex( "sound/player/gurp1.wav" );
		G_SoundIndex( "sound/player/gurp2.wav" );

	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
		BotAISetup( restart );
		BotAILoadMap( restart );
		G_InitBots( restart );
	}

	G_RemapTeamShaders();

	// Shafe - Trep
	G_InitModRules();

	level.firstStrike = qfalse;

}



/*
=================
G_ShutdownGame
=================
*/
void G_ShutdownGame( int restart ) {
	G_Printf ("==== ShutdownGame ====\n");

	if ( level.logFile ) {
		G_LogPrintf("ShutdownGame:\n" );
		G_LogPrintf("------------------------------------------------------------\n" );
		trap_FS_FCloseFile( level.logFile );
	}

	level.firstStrike = qfalse;
	// write all the client session data so we can get it back
	G_WriteSessionData();

	if ( trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
		BotAIShutdown( restart );
	}
}



//===================================================================

#ifndef GAME_HARD_LINKED
// this is only here so the functions in q_shared.c and bg_*.c can link

void QDECL Com_Error ( int level, const char *error, ... ) {
	va_list		argptr;
	char		text[1024];

	va_start (argptr, error);
	vsprintf (text, error, argptr);
	va_end (argptr);

	G_Error( "%s", text);
}

void QDECL Com_Printf( const char *msg, ... ) {
	va_list		argptr;
	char		text[1024];

	va_start (argptr, msg);
	vsprintf (text, msg, argptr);
	va_end (argptr);

	G_Printf ("%s", text);
}

#endif

/*
========================================================================

PLAYER COUNTING / SCORE SORTING

========================================================================
*/

/*
=============
AddTournamentPlayer

If there are less than two tournament players, put a
spectator in the game and restart
=============
*/
void AddTournamentPlayer( void ) {
	int			i;
	gclient_t	*client;
	gclient_t	*nextInLine;

	if ( level.numNonSpectatorClients >= 2 ) {
		return;
	}

	// never change during intermission
	if ( level.intermissiontime ) {
		return;
	}

	nextInLine = NULL;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		client = &level.clients[i];
		if ( client->pers.connected != CON_CONNECTED ) {
			continue;
		}
		if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
			continue;
		}
		// never select the dedicated follow or scoreboard clients
		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD || 
			client->sess.spectatorClient < 0  ) {
			continue;
		}

		if ( !nextInLine || client->sess.spectatorTime < nextInLine->sess.spectatorTime ) {
			nextInLine = client;
		}
	}

	if ( !nextInLine ) {
		return;
	}

	level.warmupTime = -1;
	level.firstStrike = qfalse;
	// set them to free-for-all team
	SetTeam( &g_entities[ nextInLine - level.clients ], "f" );
}

/*
=======================
RemoveTournamentLoser

Make the loser a spectator at the back of the line
=======================
*/
void RemoveTournamentLoser( void ) {
	int			clientNum;

	if ( level.numNonSpectatorClients != 2 ) {
		return;
	}

	clientNum = level.sortedClients[1];

	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
		return;
	}

	// make them a spectator
	SetTeam( &g_entities[ clientNum ], "s" );
}

/*
=======================
RemoveTournamentWinner
=======================
*/
void RemoveTournamentWinner( void ) {
	int			clientNum;

	if ( level.numNonSpectatorClients != 2 ) {
		return;
	}

	clientNum = level.sortedClients[0];

	if ( level.clients[ clientNum ].pers.connected != CON_CONNECTED ) {
		return;
	}

	// make them a spectator
	SetTeam( &g_entities[ clientNum ], "s" );
}

/*
=======================
AdjustTournamentScores
=======================
*/
void AdjustTournamentScores( void ) {
	int			clientNum;

	clientNum = level.sortedClients[0];
	if ( level.clients[ clientNum ].sess.sessionTeam != TEAM_SPECTATOR ) {
		level.clients[ clientNum ].sess.wins++;
		ClientUserinfoChanged( clientNum );
	}

	clientNum = level.sortedClients[1];
	if ( level.clients[ clientNum ].sess.sessionTeam != TEAM_SPECTATOR ) {
		level.clients[ clientNum ].sess.losses++;
		ClientUserinfoChanged( clientNum );
	}

}

/*
=============
SortRanks

=============
*/
int QDECL SortRanks( const void *a, const void *b ) {
	gclient_t	*ca, *cb;

	ca = &level.clients[*(int *)a];
	cb = &level.clients[*(int *)b];

	// sort special clients last
	if ( ca->sess.spectatorState == SPECTATOR_SCOREBOARD || ca->sess.spectatorClient < 0 ) {
		return 1;
	}
	if ( cb->sess.spectatorState == SPECTATOR_SCOREBOARD || cb->sess.spectatorClient < 0  ) {
		return -1;
	}

	// then connecting clients
	if ( ca->pers.connected == CON_CONNECTING ) {
		return 1;
	}
	if ( cb->pers.connected == CON_CONNECTING ) {
		return -1;
	}


	// then spectators
	if ( ca->sess.sessionTeam == TEAM_SPECTATOR && cb->sess.sessionTeam == TEAM_SPECTATOR ) {
		if ( ca->sess.spectatorTime < cb->sess.spectatorTime ) {
			return -1;
		}
		if ( ca->sess.spectatorTime > cb->sess.spectatorTime ) {
			return 1;
		}
		return 0;
	}
	if ( ca->sess.sessionTeam == TEAM_SPECTATOR ) {
		return 1;
	}
	if ( cb->sess.sessionTeam == TEAM_SPECTATOR ) {
		return -1;
	}

	// then sort by score
	if ( ca->ps.persistant[PERS_SCORE]
		> cb->ps.persistant[PERS_SCORE] ) {
		return -1;
	}
	if ( ca->ps.persistant[PERS_SCORE]
		< cb->ps.persistant[PERS_SCORE] ) {
		return 1;
	}
	return 0;
}

/*
============
CalculateRanks

Recalculates the score ranks of all players
This will be called on every client connect, begin, disconnect, death,
and team change.
============
*/
void CalculateRanks( void ) {
	int		i;
	int		rank;
	int		score;
	int		newScore;
	gclient_t	*cl;

	level.follow1 = -1;
	level.follow2 = -1;
	level.numConnectedClients = 0;
	level.numNonSpectatorClients = 0;
	level.numPlayingClients = 0;
	level.numVotingClients = 0;		// don't count bots
	for ( i = 0; i < TEAM_NUM_TEAMS; i++ ) {
		level.numteamVotingClients[i] = 0;
	}
	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].pers.connected != CON_DISCONNECTED ) {
			level.sortedClients[level.numConnectedClients] = i;
			level.numConnectedClients++;			

			if ( level.clients[i].sess.sessionTeam != TEAM_SPECTATOR ) {			
					level.numNonSpectatorClients++;			
			
				// decide if this should be auto-followed
				if ( level.clients[i].pers.connected == CON_CONNECTED ) {
					level.numPlayingClients++;
					if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
						level.numVotingClients++;
						if ( level.clients[i].sess.sessionTeam == TEAM_RED )
							level.numteamVotingClients[0]++;
						else if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
							level.numteamVotingClients[1]++;
					}
					if ( level.follow1 == -1 ) {
						level.follow1 = i;
					} else if ( level.follow2 == -1 ) {
						level.follow2 = i;
					}
				}
			}
		}
	}

	qsort( level.sortedClients, level.numConnectedClients, 
		sizeof(level.sortedClients[0]), SortRanks );

	// set the rank value for all clients that are connected and not spectators
	if ( g_gametype.integer >= GT_TEAM ) {
		// in team games, rank is just the order of the teams, 0=red, 1=blue, 2=tied
		for ( i = 0;  i < level.numNonSpectatorClients; i++ ) 
		{ // Only spectators get a score -Vincent
			cl = &level.clients[ level.sortedClients[i] ];
			if ( level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE] ) {
				cl->ps.persistant[PERS_RANK] = 2;
			} else if ( level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE] ) {
				cl->ps.persistant[PERS_RANK] = 0;
			} else {
				cl->ps.persistant[PERS_RANK] = 1;
			}
		}
	} else {	
		rank = -1;
		score = 0;
		for ( i = 0;  i < level.numNonSpectatorClients; i++ ) 
		{ // Only spectators get a score -Vincent
			cl = &level.clients[ level.sortedClients[i] ];
			newScore = cl->ps.persistant[PERS_SCORE];

			if ( i == 0 || newScore != score ) {
				rank = i;
				// assume we aren't tied until the next client is checked
				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank;
			} else {
				// we are tied with the previous client
				level.clients[ level.sortedClients[i-1] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
			}
			score = newScore;
			if ( g_gametype.integer == GT_SINGLE_PLAYER && level.numNonSpectatorClients == 1 ) {
				level.clients[ level.sortedClients[i] ].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
			}
		}
	}

	// set the CS_SCORES1/2 configstrings, which will be visible to everyone
	
	if ( g_gametype.integer >= GT_TEAM ) {
		trap_SetConfigstring( CS_SCORES1, va("%i", level.teamScores[TEAM_RED] ) );
		trap_SetConfigstring( CS_SCORES2, va("%i", level.teamScores[TEAM_BLUE] ) );
	} else {

		
		if ( level.numNonSpectatorClients == 0 ) // Don't count spectators -Vincent
		{
			trap_SetConfigstring( CS_SCORES1, va("%i", SCORE_NOT_PRESENT) );
			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
		} 
		else if 
		
			( level.numNonSpectatorClients == 1 ) // Don't count spectators -Vincent
		{
			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
			trap_SetConfigstring( CS_SCORES2, va("%i", SCORE_NOT_PRESENT) );
		} 
		else 
		{
		
			trap_SetConfigstring( CS_SCORES1, va("%i", level.clients[ level.sortedClients[0] ].ps.persistant[PERS_SCORE] ) );
			trap_SetConfigstring( CS_SCORES2, va("%i", level.clients[ level.sortedClients[1] ].ps.persistant[PERS_SCORE] ) );
	
		}
		
	}


	// see if it is time to end the level
	CheckExitRules();

	// if we are at the intermission, send the new info to everyone
	if ( level.intermissiontime ) {
		SendScoreboardMessageToAllClients();
	}
}


/*
========================================================================

MAP CHANGING

========================================================================
*/

/*
========================
SendScoreboardMessageToAllClients

Do this at BeginIntermission time and whenever ranks are recalculated
due to enters/exits/forced team changes
========================
*/
void SendScoreboardMessageToAllClients( void ) {
	int		i;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[ i ].pers.connected == CON_CONNECTED ) {
			DeathmatchScoreboardMessage( g_entities + i );
		}
	}
}

/*
========================
MoveClientToIntermission

When the intermission starts, this will be called for all players.
If a new client connects, this will be called after the spawn function.
========================
*/
void MoveClientToIntermission( gentity_t *ent ) {
	// take out of follow mode if needed
	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
		StopFollowing( ent );
	}


	// move to the spot
	VectorCopy( level.intermission_origin, ent->s.origin );
	VectorCopy( level.intermission_origin, ent->client->ps.origin );
	VectorCopy (level.intermission_angle, ent->client->ps.viewangles);
	ent->client->ps.pm_type = PM_INTERMISSION;

	// clean up powerup info
	memset( ent->client->ps.powerups, 0, sizeof(ent->client->ps.powerups) );

	ent->client->ps.eFlags = 0;
	ent->s.eFlags = 0;
	ent->s.eType = ET_GENERAL;
	ent->s.modelindex = 0;
	ent->s.loopSound = 0;
	ent->s.event = 0;
	ent->r.contents = 0;
}

/*
==================
FindIntermissionPoint

This is also used for spectator spawns
==================
*/
void FindIntermissionPoint( void ) {
	gentity_t	*ent, *target;
	vec3_t		dir;

	// find the intermission spot
	ent = G_Find (NULL, FOFS(classname), "info_player_intermission");
	if ( !ent ) {	// the map creator forgot to put in an intermission point...
		SelectSpawnPoint ( vec3_origin, level.intermission_origin, level.intermission_angle );
	} else {
		VectorCopy (ent->s.origin, level.intermission_origin);
		VectorCopy (ent->s.angles, level.intermission_angle);
		// if it has a target, look towards it
		if ( ent->target ) {
			target = G_PickTarget( ent->target );
			if ( target ) {
				VectorSubtract( target->s.origin, level.intermission_origin, dir );
				vectoangles( dir, level.intermission_angle );
			}
		}
	}

}

/*
==================
BeginIntermission
==================
*/
void BeginIntermission( void ) {
	int			i;
	gentity_t	*client;

	if ( level.intermissiontime ) {
		return;		// already active
	}

	// if in tournement mode, change the wins / losses
	if ( g_gametype.integer == GT_TOURNAMENT ) {
		AdjustTournamentScores();
	}

	level.intermissiontime = level.time;
	FindIntermissionPoint();

#ifdef MISSIONPACK
	if (g_singlePlayer.integer) {
		trap_Cvar_Set("ui_singlePlayerActive", "0");
		UpdateTournamentInfo();
	}
#else
	// if single player game
	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
		UpdateTournamentInfo();
		SpawnModelsOnVictoryPads();
	}
	// Shafe - Podium
	if (g_gametype.integer != GT_CTF || g_gametype.integer != GT_TEAM || g_gametype.integer != GT_SINGLE_PLAYER)
	{
	//UpdateTournamentInfo(); // SHAFEFIXME
	
	char *s;
	
	//trap_SendConsoleCommand( EXEC_APPEND, "s_musicvolume 1.0\n" );
	G_SpawnString( "music", "sound/music/intermission.ogg", &s );
	trap_SetConfigstring( CS_MUSIC, s );
	
	SpawnModelsOnVictoryPads();
					
	}
#endif

	// move all clients to the intermission point
	for (i=0 ; i< level.maxclients ; i++) {
		client = g_entities + i;
		if (g_GameMode.integer == 2) // Survival Scoring fix
		{			
			//if((g_CurrentRound.integer >= g_NumRounds.integer-1) && (level.redScoreLatched == qtrue))
			if(g_CurrentRound.integer >= g_NumRounds.integer-1) 
			{
				SetTeam( client, "f" );
				client->client->ps.persistant[PERS_SCORE] = client->client->sess.wins;
			}	
			DeathmatchScoreboardMessage(client);
		}
	}
		CalculateRanks();
	for (i=0 ; i< level.maxclients ; i++) {
		client = g_entities + i;
		if (!client->inuse)
			continue;
		// respawn if dead
		if (client->health <= 0) {
			respawn(client);
		}
		MoveClientToIntermission( client );
	}

	// send the current scoring to all clients
	SendScoreboardMessageToAllClients();

}


/*
=============
ExitLevel

When the intermission has been exited, the server is either killed
or moved to a new level based on the "nextmap" cvar 

=============
*/

void ExitLevel (void) {
	int		i;
	gclient_t *cl;
	qboolean	donextlevel;


	//bot interbreeding
	BotInterbreedEndMatch();

	// if we are running a tournement map, kick the loser to spectator status,
	// which will automatically grab the next spectator and restart
	if ( g_gametype.integer == GT_TOURNAMENT  ) {
		if ( !level.restarted ) {
			RemoveTournamentLoser();
			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
			level.restarted = qtrue;
			level.changemap = NULL;
			level.intermissiontime = 0;
			
		}
		return;	
	}
	donextlevel = qtrue;

	// Dont do any of this if we have already shown the final scoreboard

	if (level.redScoreLatched != qtrue)
	{

		// Have we already done enough rounds for survival?  No, Play the map again
		if((g_GameMode.integer == 2) && (g_NumRounds.integer > 0))
		{

			if(g_CurrentRound.integer < (g_NumRounds.integer-1))
			{
				int cr;
				cr = g_CurrentRound.integer;
				cr++; 

				/* Lets do this in check exit rules
				for (i=0 ; i< g_maxclients.integer ; i++) {

					cl = level.clients + i;
					if ( cl->pers.connected != CON_CONNECTED ) 
					{
						continue;
					}
					level.clients[i].sess.wins += level.clients[i].pers.TrueScore;
				}
				*/


				trap_SendConsoleCommand( EXEC_APPEND, va("g_CurrentRound %i\n", cr ) );
				trap_SendConsoleCommand( EXEC_APPEND, "map_restart\n" );
				donextlevel = qfalse;

	
				
				return;
			}

		} 



		// We are done doing the rounds, time to move on.
		if((g_GameMode.integer == 2) && (g_NumRounds.integer > 0))
		{
			if(g_CurrentRound.integer >= (g_NumRounds.integer-1))
			{
				int cr;
				cr = 0;
				trap_SendConsoleCommand( EXEC_APPEND, va("g_CurrentRound %i\n", cr ) );
				donextlevel = qtrue;

				// Add players final scores
				for (i=0 ; i< g_maxclients.integer ; i++) 
				{

					cl = level.clients + i;
					if ( cl->pers.connected != CON_CONNECTED ) 
					{
						continue;
					} 
					
					level.clients[i].pers.TrueScore = level.clients[i].sess.wins; 
					level.clients[i].sess.wins +=level.clients[i].pers.TrueScore;									
					level.clients[i].sess.sessionTeam = TEAM_FREE;
					//SetTeam(&g_entities[i], "r");
					
					
					//trap_SendServerCommand( -1, va("print \"^7 Debug %s Match %i true %i \n\"", cl->pers.netname, level.clients[i].sess.wins , level.clients[i].pers.TrueScore ) );
					
				
				}
				
				SendScoreboardMessageToAllClients();
				level.blueScoreLatched = qtrue;
				
				// Now do the final intermission with some sort of bang	
				BroadCastSound("sound/weapons/bfg/devhit.wav"); // Play some sort of cool sound.
				
				level.redScoreLatched = qtrue;		
				level.intermissiontime = 0;
				level.readyToExit = qfalse;
				LogExit( "Fraglimit hit." );		
				return;
			}
		}
	} else {
		level.redScoreLatched = qfalse;
	}

	// Moving on to normal crap for map rotations or random rotations
	
	if(donextlevel)
	{
				
		if(g_randommap.integer == 1) 
		{
			char newmap;		
			//char appendstring;
			newmap = *GetRandomMap();				

		} else if(g_easymap.integer == 1)
		{
			char *newmap;
			newmap = GetEasyMap();

		} else {
			trap_SendConsoleCommand( EXEC_APPEND, "vstr nextmap\n" );

		}
	}
		
	
	level.changemap = NULL;
	level.intermissiontime = 0;

	// Github bug #55- Shafe - reset rounds
	g_CurrentRound.integer = 0;
	trap_SendConsoleCommand( EXEC_APPEND, va("g_CurrentRound %i\n", 0 ) );
	
	// reset all the scores so we don't enter the intermission again
	level.teamScores[TEAM_RED] = 0;
	level.teamScores[TEAM_BLUE] = 0;
	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
		cl = level.clients + i;
		if ( cl->pers.connected != CON_CONNECTED ) {
			continue;
		}
		cl->ps.persistant[PERS_SCORE] = 0;
		cl->pers.TrueScore = 0;
		cl->sess.wins = 0;
		//cl->sess.MatchScore = 0;
		//level.clients[i].pers.MatchScore = 0; // Clear it out so it doesn't carry to the next map.

	}
	level.blueScoreLatched = 0;
	// we need to do this here before chaning to CON_CONNECTING
	G_WriteSessionData();

	// change all client states to connecting, so the early players into the
	// next level will know the others aren't done reconnecting
	for (i=0 ; i< g_maxclients.integer ; i++) {
		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
			level.clients[i].pers.connected = CON_CONNECTING;
		}
	}

}

/*
=================
G_LogPrintf

Print to the logfile with a time stamp if it is open
=================
*/
void QDECL G_LogPrintf( const char *fmt, ... ) {
	va_list		argptr;
	char		string[1024];
	int			min, tens, sec;

	sec = level.time / 1000;

	min = sec / 60;
	sec -= min * 60;
	tens = sec / 10;
	sec -= tens * 10;

	Com_sprintf( string, sizeof(string), "%3i:%i%i ", min, tens, sec );

	va_start( argptr, fmt );
	vsprintf( string +7 , fmt,argptr );
	va_end( argptr );

	if ( g_dedicated.integer ) {
		G_Printf( "%s", string + 7 );
	}

	if ( !level.logFile ) {
		return;
	}

	trap_FS_Write( string, strlen( string ), level.logFile );
}

/*
================
LogExit

Append information about this game to the log file
================
*/
void LogExit( const char *string ) {
	int				i, numSorted;
	gclient_t		*cl;
	gentity_t		*pr;
#ifdef MISSIONPACK // bk001205
	qboolean won = qtrue;
#endif
	G_LogPrintf( "Exit: %s\n", string );

	level.intermissionQueued = level.time;

	// this will keep the clients from playing any voice sounds
	// that will get cut off when the queued intermission starts
	trap_SetConfigstring( CS_INTERMISSION, "1" );

	// Shafe - This doesnt work
	// Lets give spectators back their score for arsenal & lms
	for ( i = 0; i < level.maxclients; i++ )
	{
		cl = &level.clients[i];
		//survivor = &level.clients[i];
		if (cl->pers.connected == CON_CONNECTED)
		{	
			cl->ps.persistant[PERS_SCORE] = cl->pers.TrueScore;
		}

	}
	i=0;
	/* trep remove me
	for (i=0 ; i< level.maxclients ; i++) {
		pr = g_entities + i;	
		if (g_GameMode.integer == 2)
		{
			SetTeam( pr, "f" );
		}
	}
	*/
	
	// don't send more than 32 scores (FIXME?)
	numSorted = level.numConnectedClients;
	if ( numSorted > 32 ) {
		numSorted = 32;
	}

	if ( g_gametype.integer >= GT_TEAM ) {
		G_LogPrintf( "red:%i  blue:%i\n",
			level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE] );
	}

	for (i=0 ; i < numSorted ; i++) {
		int		ping;

		cl = &level.clients[level.sortedClients[i]];

		if (g_GameMode.integer == 0) 
		{

			if ( cl->sess.sessionTeam == TEAM_SPECTATOR ) {
				continue;
			}
		}


		if ( cl->pers.connected == CON_CONNECTING ) {
			continue;
		}

		ping = cl->ps.ping < 999 ? cl->ps.ping : 999;

		G_LogPrintf( "score: %i  ping: %i  client: %i %s\n", cl->ps.persistant[PERS_SCORE], ping, level.sortedClients[i],	cl->pers.netname );
#ifdef MISSIONPACK
		if (g_singlePlayer.integer && g_gametype.integer == GT_TOURNAMENT) {
			if (g_entities[cl - level.clients].r.svFlags & SVF_BOT && cl->ps.persistant[PERS_RANK] == 0) {
				won = qfalse;
			}
		}
#endif

	}

#ifdef MISSIONPACK
	if (g_singlePlayer.integer) {
		if (g_gametype.integer >= GT_CTF) {
			won = level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE];
		}
		trap_SendConsoleCommand( EXEC_APPEND, (won) ? "spWin\n" : "spLose\n" );
	}
#endif


}


/*
=================
CheckIntermissionExit

The level will stay at the intermission for a minimum of 5 seconds
If all players wish to continue, the level will then exit.
If one or more players have not acknowledged the continue, the game will
wait 10 seconds before going on.
=================
*/
void CheckIntermissionExit( void ) {
	int			ready, notReady;
	int			i;
	gclient_t	*cl;
	int			readyMask;

	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
	//	return;
	}


	// Trepidation - If There Are No Live Players Then 
	// Skip The Scoreboard and go on to the next map.
	//
	// This keeps the server from sitting on an a scoreboard for
	// an unpopular map for too long.
	//
	// This is goofy.. Lets do something aside from this

	if (g_AutoChangeMap.integer == 1)
	{
		//level.readyToExit = qtrue;
	//	if ( level.time > level.exitTime + 40000 ) {
	//	ExitLevel();
	//	return;
	//	}
	}

	// see which players are ready
	ready = 0;
	notReady = 0;
	readyMask = 0;
	for (i=0 ; i< g_maxclients.integer ; i++) {
		cl = level.clients + i;
		if ( cl->pers.connected != CON_CONNECTED ) {
			continue;
		}
		if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
			if (g_AutoChangeMap.integer == 1)	
			{	ready++;
				if ( i < 16 ) {
					readyMask |= 1 << i;
				}
			}
			//continue;
		}

		if ( cl->readyToExit ) {
			ready++;
			if ( i < 16 ) {
				readyMask |= 1 << i;
			}
		} else {
			notReady++;
		}
	}

	// copy the readyMask to each player's stats so
	// it can be displayed on the scoreboard
	for (i=0 ; i< g_maxclients.integer ; i++) {
		cl = level.clients + i;
		if ( cl->pers.connected != CON_CONNECTED ) {
			continue;
		}
		cl->ps.stats[STAT_CLIENTS_READY] = readyMask;
	}

	// never exit in less than five seconds
	if ( level.time < level.intermissiontime + 5000 ) {
		return;
	}

	// if nobody wants to go, clear timer
	if ( !ready ) {
		level.readyToExit = qfalse;
		return;
	}

	// if everyone wants to go, go now
	if ( !notReady ) {
		ExitLevel();
		return;
	}

	// the first person to ready starts the ten second timeout
	if ( !level.readyToExit ) {
		level.readyToExit = qtrue;
		level.exitTime = level.time;
	}

	// if we have waited ten seconds since at least one player
	// wanted to exit, go ahead
	if ( level.time < level.exitTime + 10000 ) {
		return;
	}

	ExitLevel();
}


/*
=============
ScoreIsTied
=============
*/
qboolean ScoreIsTied( void ) {
	int		a, b;

	if ( level.numNonSpectatorClients < 2 ) {
		return qfalse;
	}
	
	if ( g_gametype.integer >= GT_TEAM ) {
		return level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE];
	}

	a = level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE];
	b = level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE];

	return a == b;
}


/*
=================
CheckExitRules

There will be a delay between the time the exit is qualified for
and the time everyone is moved to the intermission spot, so you
can see the last frag.
=================
*/


void CheckExitRules( void ) {
 	int			i;
	gclient_t	*cl;
	// Arsenal Trepidation Stuff
	gentity_t	*self;
	gentity_t	*buildables;
	gitem_t	*quad = BG_FindItemForPowerup( PW_QUAD );
	gitem_t	*flight = BG_FindItemForPowerup( PW_FLIGHT );
	gitem_t	*battles = BG_FindItemForPowerup( PW_BATTLESUIT );
	gitem_t	*regen = BG_FindItemForPowerup( PW_REGEN );
	char *s;
	int			rn;
	int	cts;


	// if at the intermission, wait for all non-bots to
	// signal ready, then go to next level
	if ( level.intermissiontime ) {
		CheckIntermissionExit ();
		return;
	}
	
	if (g_NumRounds.integer > 0)
	{
		//trap_SendServerCommand( -1, va("cp \"Round %i of %i.\n\"", g_CurrentRound.integer, g_NumRounds.integer));
	}


	if ( level.intermissionQueued ) {
#ifdef MISSIONPACK
		int time = (g_singlePlayer.integer) ? SP_INTERMISSION_DELAY_TIME : INTERMISSION_DELAY_TIME;
		if ( level.time - level.intermissionQueued >= time ) {
			level.intermissionQueued = 0;
			BeginIntermission();
		}
#else
		if ( level.time - level.intermissionQueued >= INTERMISSION_DELAY_TIME ) {
			level.intermissionQueued = 0;
			BeginIntermission();
		}
#endif
		return;
	}
	

	
	// Freeze frozen
	if (g_GameMode.integer == 5)
	{
		if (((level.time-level.startTime) > 10000) && (level.firstStrike == qtrue))
		{
			gclient_t		*survivor = NULL;		
			int				redCnt;			
			int				blueCnt;			
			int		p;
			// Are there any people on either team not frozen?
			redCnt = 0;
			redCnt = CountTeamSurvivors(TEAM_RED);
			blueCnt = CountTeamSurvivors(TEAM_BLUE);
			//trap_SendServerCommand( -1, va("print \"^7Blue Live Players %i \n\"", blueCnt ) );
			//trap_SendServerCommand( -1, va("print \"^7Red Live Players %i \n\"", redCnt ) );

			if(redCnt == 0) { // Red Team Wins Round
				
				
				trap_SendServerCommand( -1, va("cp \"^7Red Team Scores\n\"") );
				trap_SendServerCommand( -1, va( "print \"Red team scores\n\"") );
				level.teamScores[ TEAM_RED ]++; 
				BroadCastSound("sound/teamplay/voc_red_scores.ogg");
				for ( i = 0; i < level.maxclients; i++ )
					{
						char *t;		
						cl = &level.clients[i];
						self = &g_entities[i];
						cl->sess.sessionTeam =  cl->pers.TrueTeam;
						//survivor = &level.clients[i];
						cl->pers.Frozen = qfalse;
						cl->pers.Eliminated = qfalse;
						// Now what?
						
					}
				return;
			}
			
			if(blueCnt == 0) { // Blue Team Wins Round
				trap_SendServerCommand( -1, va("cp \"^7Blue Team Scores\n\"") );
				trap_SendServerCommand( -1, va( "print \"Blue team scores\n\"") );
				level.teamScores[ TEAM_BLUE ]++;		
				BroadCastSound("sound/teamplay/voc_blue_scores.ogg");
				for ( i = 0; i < level.maxclients; i++ )
					{
						
						cl = &level.clients[i];
						self = &g_entities[i];
						//survivor = &level.clients[i];
						cl->sess.sessionTeam  =  cl->pers.TrueTeam;
						cl->pers.Frozen = qfalse;
						cl->pers.Eliminated = qfalse;
						// Now what?
						
						
					}
				return;

			}

			if ( g_timelimit.integer && !level.warmupTime ) {
				if ( level.time - level.startTime >= g_timelimit.integer*60000 ) {
					trap_SendServerCommand( -1, "print \"Timelimit hit.\n\"");
					LogExit( "Timelimit hit." );
					G_ShowTopStats();
					return;
				}
			}


		}
	}

		
	// This works.. but scoring doesnt.. automatically places the thing as soon as you destroy it.
	if (g_GameMode.integer == 3)
	{


		if ((level.time-level.redScoreTime) < 5000) { return; }
		if ((level.time-level.blueScoreTime) < 5000) { return; }
		

		// If both teams have an mc it's time to rumble
		// Do we have a score?
		if ((level.redScoreLatched == 1) && ((level.time-level.redScoreTime) > 5000))
		{
			level.redScoreLatched = 0;
			level.redScoreTime = level.time;

			trap_SendServerCommand( -1, va("cp \"^7Red Team Scores\n\"") );
			trap_SendServerCommand( -1, va( "print \"Red team scores\n\"") );
			level.teamScores[ TEAM_RED ]++; 
			//CalculateRanks(); // This is causing crashes
			BroadCastSound("sound/teamplay/voc_red_scores.ogg");

			// Clear immobilized
			for ( i = 0; i < level.maxclients; i++ )
			{
				//g_entities[cl - level.clients].immobilized = qfalse;
				self->immobilized = qfalse;
			}

			// Clear mc from other team --- Hrrrmmm
			while ((buildables = G_Find (buildables, FOFS(classname), "mc")) != NULL)
			{
				
			}
			AnnounceBuildables();
			//return;
		}

		if ((level.blueScoreLatched == 1) && ((level.time-level.blueScoreTime) > 5000))
		{
			//Team_Point(TEAM_BLUE);
			level.blueScoreLatched = 0;
			level.blueScoreTime = level.time;

			trap_SendServerCommand( -1, va("cp \"^7Blue Team Scores\n\"") );
			trap_SendServerCommand( -1, va( "print \"Blue team scores\n\"") );
			level.teamScores[ TEAM_BLUE ]++;
			//CalculateRanks();  // This is causing crashes
			BroadCastSound("sound/teamplay/voc_blue_scores.ogg");
			// clear the other team power core
			
			// Clear immobilized
			for ( i = 0; i < level.maxclients; i++ )
			{
				self->immobilized = qfalse;
			}
			
			// Clear mc from other team -- Hrrmmm
			while ((buildables = G_Find (buildables, FOFS(classname), "mc")) != NULL)
			{
				
			}
			AnnounceBuildables();
			//return;
		}
		

		// 
		// Addme: Dont allow while waiting for players -- Also put in the notifications
		if ( level.numNonSpectatorClients < 2 ) {
			return;
		}

		// If there are no live players, only bots, don't wait out the whole 55 seconds
		if(!LivePlayersOnTeam(TEAM_BLUE) && !level.warmupTime) {
			rn = irandom(5000,25000);
			if ((level.time-level.redScoreTime) > rn) 
			{
				if ((level.blueMC == 0) && (level.blueNeedMC == 1))
				{
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Bot Placing BLUE Power Core.\n\"" ); }
					level.blueNeedMC = 0;
					PlaceMC(TEAM_BLUE);
					return;
				}
			}
		}
		if(!LivePlayersOnTeam(TEAM_RED) && !level.warmupTime) {
			rn = irandom(5000,25000);
			if ((level.time-level.blueScoreTime) > rn) 
			{
				if ((level.redMC == 0) && (level.redNeedMC == 1))
				{
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Bot Placing RED Power Core.\n\"" ); }
					level.redNeedMC = 0;
					PlaceMC(TEAM_RED);
					return;
				}
			}
		}


		// If no one places the power core, place one for them after 55 seconds.
		if ((level.time-level.redScoreTime) > 35000) 
		{

			 if ((level.blueMC == 0) && (level.blueNeedMC == 1))
				{
					trap_SendServerCommand( -1, "print \"Automatically Placing Blue Power Core.\n\"" );
					level.blueNeedMC = 0;
					PlaceMC(TEAM_BLUE);
					return;
				}
		}
		
		if ((level.time-level.blueScoreTime) > 35000) 
		{
		
				if ((level.redMC == 0) && (level.redNeedMC == 1))
				{
					trap_SendServerCommand( -1, "print \"Automatically Placing Red Power Core.\n\"" );
					level.redNeedMC = 0;
					PlaceMC(TEAM_RED);
					return;
				}
		}

		// This should never happen but it does...
		// It's a fluke... Force build of the MC and no one scores.
		if ((level.redMC <= 0) && (level.redNeedMC == 0)) { level.redNeedMC= 1; }
		if ((level.blueMC <= 0) && (level.blueNeedMC == 0)) { level.blueNeedMC= 1; }
		if (level.blueTD < 0) { level.blueTD = 0; }
		if (level.redTD < 0) { level.redTD = 0; }

	
		
		// If we have an MC, lets lay down at a later time power generators
		rn = irandom(10000,25000); // randomize the timing a bit 10-25 seconds
		if ((level.time-level.blueScoreTime) > 15000) 
		{
		
			if ((level.redGen < 2) && (level.redNeedMC == 0) && ((level.time-level.redBuilding) >rn))
				{
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing A Generator.\n\"" ); }
					level.redBuilding = level.time;
					PlaceGen(TEAM_RED);

					
				} 
		}
		rn = irandom(10000,25000); // randomize the timing a bit 10-25 seconds
		if ((level.time-level.redScoreTime) > 15000) 
		{
		
			if ((level.blueGen < 2) && (level.blueNeedMC == 0) && ((level.time-level.blueBuilding) > rn))
				{
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Blue bot placing a generator.\n\"" ); }
					level.blueBuilding = level.time;
					PlaceGen(TEAM_BLUE);
					
				} 
		}

		/*
		// Bots building Immobilizers 
		*/
		rn = irandom(1,1); // 1 and 3 chance of building a immobilizer
		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];

		if ((cts > 2) && (level.redTD < 3)&& (level.time-level.redBuilding > 30000)) // check the rules, check the randomization and time
		{
			//trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing Immobilizer.\n\"" );
			if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing Immobilizer.\n\"" ); }
			level.redBuilding = level.time;
			PlaceImmobile(TEAM_RED);		
		}
		rn = irandom(1,2); // 1 and 3 chance of building a immobilizer
		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];

		if ((cts > 2) && (level.blueTD < 3) && (level.time-level.blueBuilding > 30000)) // check the rules, check the randomization and time
		{
			//trap_SendServerCommand( -1, "print \"DEBUG: Blue Bot Placing Immobilizer.\n\"" );
			if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Blue Bot Placing Immobilizer.\n\"" ); }
			level.blueBuilding = level.time;
			PlaceImmobile(TEAM_BLUE);		
		}
		//////// end immobilizer
		


		// We have mc and a at least power generator, lets check proximity to mc and have 
		// the closest bot lay down a turret
		rn = irandom(10000,35000); // randomize the timing a bit 10-25 seconds
		if ((level.time-level.blueScoreTime) > 115000) 
		{
		
			if ((level.redTurrets < 5) && (level.redGen > 0) && (level.redNeedMC == 0) && ((level.time-level.redBuilding) > rn))
				{
					//trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing A Turret.\n\"" );
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing A Turret.\n\"" ); }
					level.redBuilding = level.time;
					PlaceTurret(TEAM_RED);

					
				} 
		}
		rn = irandom(10000,35000); // randomize the timing a bit 10-25 seconds
		if ((level.time-level.redScoreTime) > 115000) 
		{
		
			// are immobilizers available?
			
			if ((level.blueTurrets < 5) && (level.blueGen > 0) && (level.blueNeedMC == 0) && ((level.time-level.blueBuilding) > rn))
				{
					//trap_SendServerCommand( -1, "print \"DEBUG: Blue bot placing a Turret.\n\"" ); 
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Blue bot placing a Turret.\n\"" ); }
					level.blueBuilding = level.time;
					PlaceTurret(TEAM_BLUE);
					
				} 
		}



	}



	// Single Player Game, only blue gets a power core
	if ( g_GameMode.integer == 999)
	{
		
	
		if ((level.time-level.redScoreTime) < 5000) { return; }
		if ((level.time-level.blueScoreTime) < 5000) { return; }
		

		// If both teams have an mc it's time to rumble
		// Do we have a score?
		if ((level.redScoreLatched == 1) && ((level.time-level.redScoreTime) > 5000))
		{
			level.redScoreLatched = 0;
			level.redScoreTime = level.time;

			trap_SendServerCommand( -1, va("cp \"^7Red Team Scores\n\"") );
			trap_SendServerCommand( -1, va( "print \"Red team scores\n\"") );
			level.teamScores[ TEAM_RED ]++; 
			//CalculateRanks(); // This is causing crashes
			BroadCastSound("sound/teamplay/voc_red_scores.ogg");
			


			//return;
		}


		if ((level.time-level.redScoreTime) > 15000) 
		{
		
				if ((level.blueMC == 0) && (level.blueNeedMC == 1))
				{
					if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Automatically Placing Blue Power Core.\n\"" ); }
					level.blueNeedMC = 0;
					PlaceMC(TEAM_BLUE);
					return;
				}
		}

		// This should never happen but it does...
		// It's a fluke... Force build of the MC and no one scores.
		if ((level.redMC <= 0) && (level.redNeedMC == 0)) { level.redNeedMC= 1; }
		if ((level.blueMC <= 0) && (level.blueNeedMC == 0)) { level.blueNeedMC= 1; }
	}



	// CTF Bots can place turrets
	if ((g_gametype.integer == GT_CTF) && (g_Turrets.integer == 1))
	{
		rn = irandom(10000,65000); // randomize the timing a bit 10-25 seconds
		if ((level.redTurrets < g_MaxTurrets.integer) && (level.time-level.redBuilding > rn))
		{
			if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing A Turret.\n\"" ); }
			level.redBuilding = level.time;
			PlaceTurret(TEAM_RED);
			
		} 
		
		rn = irandom(10000,65000); // randomize the timing a bit 10-25 seconds
		if ((level.blueTurrets < g_MaxTurrets.integer) && (level.time-level.blueBuilding > rn))
		{
				if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Blue bot placing a Turret.\n\"" ); }
				
				level.blueBuilding = level.time;
				PlaceTurret(TEAM_BLUE);
				
		} 



		
		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];

		if (((level.time-level.blueScoreTime) > 115000)  && (cts > 2) && (level.redTD < 3)&& (level.time-level.redBuilding > 15000)) // check the rules, check the randomization and time
		{
			trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing Immobilizer.\n\"" );
			if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Red Bot Placing Immobilizer.\n\"" ); }
			level.redBuilding = level.time;
			PlaceImmobile(TEAM_RED);	

		}
		rn = irandom(1,2); // 1 and 3 chance of building a immobilizer
		cts = level.teamScores[ TEAM_RED ] + level.teamScores[ TEAM_BLUE ];

		if (((level.time-level.redScoreTime) > 115000) && (cts > 2) && (level.blueTD < 3) && (level.time-level.blueBuilding > 15000)) // check the rules, check the randomization and time
		{
			trap_SendServerCommand( -1, "print \"DEBUG: Blue Bot Placing Immobilizer.\n\"" );
			if (trep_debug.integer) { trap_SendServerCommand( -1, "print \"DEBUG: Blue Bot Placing Immobilizer.\n\"" ); }
			level.blueBuilding = level.time;
			PlaceImmobile(TEAM_BLUE);	

		}




	}
	


	// Freeze frozen
	if ( g_GameMode.integer == 5 && g_capturelimit.integer ) {

		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Red hit the point limit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}
		
		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Blue hit the point limit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}
		
	}


	// Alpha campaign stuff
	if ( g_GameMode.integer == 999 && g_capturelimit.integer ) {

		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Red hit the point limit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}
		/*
		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Blue hit the point limit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}
		*/
	}

	// check for sudden death
	if (g_suddendeath.integer == 1) { 
		if ( ScoreIsTied() ) {
			// always wait for sudden death
			return;
		}
	}

	if ( g_GameMode.integer == 3 && g_capturelimit.integer ) {

		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Red hit the point limit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}

		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Blue hit the point limit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}
	}
	// End Trep GT
	
	if ( g_timelimit.integer && !level.warmupTime ) {
		if ( level.time - level.startTime >= g_timelimit.integer*60000 ) {
			trap_SendServerCommand( -1, "print \"Timelimit hit.\n\"");
			LogExit( "Timelimit hit." );
			G_ShowTopStats();
			return;
		}
	}



	// Arsenal And Last Man Standing
	// We dont do a showdown or find a winner for at least 10 seconds into the game.
	if (( g_GameMode.integer == 1) || (g_GameMode.integer == 2))
	{
		if (((level.time-level.startTime) > 5000) && (level.firstStrike == qtrue))
		{
			gclient_t		*survivor = NULL;		
			int				tmpCnt;
			
			
			// Dont end it just because there is only one person on the server
			if (level.warmupTime) { return; }
			

			tmpCnt = 0;
			tmpCnt = CountSurvivors();
			

			// Bug 0000104
			// If there are no survivors.. like if the last 2 players disconnect at the same time.
			if ( tmpCnt == 0 ) 
			{
				if ( level.warmupTime != -1 ) 
				{
					level.warmupTime = -1;
					trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
					level.firstStrike = qfalse;
					G_LogPrintf( "Warmup:\n" );
				}
				return;
			}

				
	


			// Three People - Start The Music  // Maybe do this on 2 instead
			if (tmpCnt == 3)
			{
				//trap_SendConsoleCommand( EXEC_APPEND, "s_musicvolume 5.0\n" );
				
				// There is a bug in the engine, let's work around that bug somewhere
				G_SpawnString( "music", "sound/music/battle.ogg", &s );
				trap_SetConfigstring( CS_MUSIC, s );

			}

				// Two People - Showdown
				if (tmpCnt == 2)
				{

					// This is our funky workaround - this is tempory -- shafe
					G_SpawnString( "music", "sound/music/battle.ogg", &s );
					trap_SetConfigstring( CS_MUSIC, s );

					if (!level.StopItemRespawn) 
					{
						
						// Dont do this on warmup or before everyone spawns
						if ((!level.warmupTime) && (level.time > level.startTime+5000)) 
						{
							level.StopItemRespawn = qtrue;
							trap_SendServerCommand( -1, va("cp \"^9Showdown!\n\"") );
						
							// Give The Last 2 People Some Powerups
							for ( i = 0; i < level.maxclients; i++ )
							{
								cl = &level.clients[i];
								self = &g_entities[i];
								if ( cl->pers.connected == CON_CONNECTED && cl->pers.Eliminated == qfalse && cl->sess.sessionTeam != TEAM_SPECTATOR)
								{	
									cl->ps.speed=+60;
									cl->ps.powerups[quad->giTag] = level.time - ( level.time % 1000 );
									cl->ps.powerups[quad->giTag] += 25 * 1000;
									G_AddEvent( self, EV_ITEM_PICKUP, (quad-bg_itemlist) );

									// Don't give bots flight, they kinda suck ass with it - shafe
									if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
										cl->ps.powerups[flight->giTag] = level.time - ( level.time % 1000 );
										cl->ps.powerups[flight->giTag] += 15 * 1000;
										G_AddEvent( self, EV_ITEM_PICKUP, (flight-bg_itemlist) );
									}
									
									cl->ps.powerups[battles->giTag] = level.time - ( level.time % 1000 );
									cl->ps.powerups[battles->giTag] += 10 * 1000;
									G_AddEvent( self, EV_ITEM_PICKUP, (battles-bg_itemlist) );
									
									cl->ps.powerups[regen->giTag] = level.time - ( level.time % 1000 );
									cl->ps.powerups[regen->giTag] += 20 * 1000;
									G_AddEvent( self, EV_ITEM_PICKUP, (regen-bg_itemlist) );
									
									
									

								}
							}
							///////////////////////////////////
						}

					}
				}  
				else
				{
					// Just in case
					if (level.StopItemRespawn)
					{
						level.StopItemRespawn = qfalse;
					}

				}


				// Down to 1 player find the survivor
				/* This code has morphed to utter shit */
				
				if (tmpCnt == 1)
				{
					int		p;
					for ( i = 0; i < level.maxclients; i++ )
					{
						cl = &level.clients[i];
						//survivor = &level.clients[i];
						if ( cl->pers.connected == CON_CONNECTED && cl->pers.Eliminated == qfalse && cl->sess.sessionTeam != TEAM_SPECTATOR)
						{	
							survivor = cl;	
							p = i;
							break;
						}

					}

											
					// If We Get To Here We should have a survivor	
					// if Not Lets Use The Person Who Made The Last Kill
					if (survivor == NULL) {
						survivor = level.lastClient;
					}
		
						BroadCastSound("sound/misc/laff01.ogg");
						trap_SendServerCommand( -1, va("cp \"%.15s" S_COLOR_WHITE " Is The Survivor!\n\"", survivor->pers.netname) );

						if (g_GameMode.integer == 2)
						{
						
							trap_SendServerCommand( -1, va("print \"^7 ::::::::::::: %s WINS ROUND %i OF %i :::::::::::::\n\"", survivor->pers.netname, (g_CurrentRound.integer+1), g_NumRounds.integer ) );
							//trap_SendServerCommand( -1, "print \"::: ^9WINNER BONUSES :::\n\"");	
							survivor->ps.persistant[PERS_SCORE]+=35;
							
							//survivor->pers.TrueScore+=survivor->ps.persistant[PERS_SCORE]; // we do this in exitlevel
							trap_SendServerCommand( -1, "print \"^9Survivor Bonus: ^3+35\n\"");	
					
						}


				if (g_GameMode.integer == 1)
				{
						trap_SendServerCommand( -1, "print \"::: ^9WINNER BONUSES :::\n\"");	
						survivor->ps.persistant[PERS_SCORE]+=20;
						trap_SendServerCommand( -1, "print \"^9Survivor Bonus: ^3+20\n\"");	
						if (survivor->pers.h_bfg) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=1; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Devastator: ^3+1\n\"");	
						}
						
						if (survivor->pers.h_plasma) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=2; 
							trap_SendServerCommand( -1, "print \"^Arsenal Contents: Gata Gun: ^3+2\n\"");	
						}
						
						if (survivor->pers.h_gauss) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=3; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: M42 Gauss Rifle: ^3+3\n\"");	
						}
						
						if (survivor->pers.h_flame) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=4; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Flame Thrower: ^3+4\n\"");	
						}
						if (survivor->pers.h_singcan) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=8; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Singularity Cannon: ^3+8\n\"");	
						}
						
						if (survivor->pers.h_gauntlet) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=10; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Gauntlet: ^3+10\n\"");	
						}

						if (survivor->pers.h_grenade) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=9; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Grenade Launcher: ^3+9\n\"");	
						}

						if (survivor->pers.h_sg) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=5; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: Shotgun: ^3+5\n\"");	
						}

						if (survivor->pers.h_mg) 
						{ 
							survivor->ps.persistant[PERS_SCORE]+=6; 
							trap_SendServerCommand( -1, "print \"^9Arsenal Contents: LFO Rifle: ^3+6\n\"");	
						}
				}
				
				survivor->pers.TrueScore = survivor->ps.persistant[PERS_SCORE];

					
				
					for ( i = 0; i < level.maxclients; i++ )
					{
						//cl = &level.clients[i];
						cl = level.clients + i;
						//survivor = &level.clients[i];
						if ( cl->pers.connected == CON_CONNECTED)
						{												
						
							level.clients[i].sess.wins += level.clients[i].pers.TrueScore;				
							
							//level.clients[i].pers.TrueScore += level.clients[i].ps.persistant[PERS_SCORE];

							//trap_SendServerCommand( -1, va("print \"^7 %s Sesss.match %i persistant %i \n\"", cl->pers.netname, cl->sess.wins, cl->pers.TrueScore ) );
						}

					}
				
				LogExit( "Fraglimit hit." );

				return;
					//}
			} 
			/* else
			{
				trap_SendServerCommand( -1, "print \"No Survivors!.\n\"");
				G_Printf( S_COLOR_GREEN "DEBUG: No Survivors This Is A Problem! %i \n", tmpCnt);
				trap_SendServerCommand( -1, "print \"DEBUG: This is a problem!!.\n\"");
				//survivor->ps.persistant[PERS_SCORE] =+ 100;
				LogExit( "Fraglimit hit." );
				return;
			}
			*/
				

		}
		}


	// End Arsenal

	if (g_GameMode.integer < 1)
	{
		if ( level.numNonSpectatorClients < 2 ) {
			return;
		}
	}

	
	if (( g_GameMode.integer != 999 ) || ( g_GameMode.integer != 5 ))
	{
		if ( g_gametype.integer < GT_CTF && g_fraglimit.integer ) {
			if ( level.teamScores[TEAM_RED] >= g_fraglimit.integer ) {
				trap_SendServerCommand( -1, "print \"Red hit the fraglimit.\n\"" );
				LogExit( "Fraglimit hit." );
				G_ShowTopStats();
				return;
			}

			if ( level.teamScores[TEAM_BLUE] >= g_fraglimit.integer ) {
				trap_SendServerCommand( -1, "print \"Blue hit the fraglimit.\n\"" );
				LogExit( "Fraglimit hit." );
				G_ShowTopStats();
				return;
			}
	
			for( i=0 ; i< g_maxclients.integer ; i++ ) 
			{
				cl = level.clients + i;
				if( cl->pers.connected != CON_CONNECTED )
					continue;
				
				if( cl->ps.persistant[PERS_SCORE] >= g_fraglimit.integer ) 
				{
					LogExit( "Fraglimit hit." );
					trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " hit the fraglimit.\n\"",
						cl->pers.netname ) );
					G_ShowTopStats();
					return;
				}
			}
		}
	} // End single player exclusion.
	
	if ( g_gametype.integer >= GT_CTF && g_capturelimit.integer ) {

		if ( level.teamScores[TEAM_RED] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Red hit the capturelimit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}

		if ( level.teamScores[TEAM_BLUE] >= g_capturelimit.integer ) {
			trap_SendServerCommand( -1, "print \"Blue hit the capturelimit.\n\"" );
			LogExit( "Capturelimit hit." );
			G_ShowTopStats();
			return;
		}
	}

}



/*
========================================================================

FUNCTIONS CALLED EVERY FRAME

========================================================================
*/


/*
=============
CheckTournament

Once a frame, check for changes in tournement player state
=============
*/
void CheckTournament( void ) {
	int i;	
	
	// check because we run 3 game frames before calling Connect and/or ClientBegin
	// for clients on a map_restart
	if ( level.numNonSpectatorClients == 0 ) {
		return;
	}

	if ( g_gametype.integer == GT_TOURNAMENT ) {

		// pull in a spectator if needed
		if ( level.numNonSpectatorClients < 2 ) {
			AddTournamentPlayer();
		}

		// if we don't have two players, go back to "waiting for players"
		if ( level.numNonSpectatorClients != 2 ) {
			if ( level.warmupTime != -1 ) {
				level.warmupTime = -1;
				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
				level.firstStrike = qfalse;
				G_LogPrintf( "Warmup:\n" );
			}
			return;
		}

		if ( level.warmupTime == 0 ) {
			return;
		}

		// if the warmup is changed at the console, restart it
		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
			level.warmupModificationCount = g_warmup.modificationCount;
			level.warmupTime = -1;
			level.firstStrike = qfalse;
		}

		// if all players have arrived, start the countdown
		if ( level.warmupTime < 0 ) {
			if ( level.numNonSpectatorClients == 2 ) {
				// fudge by -1 to account for extra delays
				level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
			}
			return;
		}

		// if the warmup time has counted down, restart
		if ( level.time > level.warmupTime ) {
			level.warmupTime += 10000;
			level.firstStrike = qfalse;
			trap_Cvar_Set( "g_restarted", "1" );
			// Unzoom all clients
			UnzoomAll();


			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
			level.restarted = qtrue;		

			return;
		}
	} else if ( g_gametype.integer != GT_SINGLE_PLAYER && level.warmupTime != 0 ) {
		int		counts[TEAM_NUM_TEAMS];
		qboolean	notEnough = qfalse;

		if ( g_gametype.integer > GT_TEAM ) {
			counts[TEAM_BLUE] = TeamCount( -1, TEAM_BLUE );
			counts[TEAM_RED] = TeamCount( -1, TEAM_RED );

			if (counts[TEAM_RED] < 1 || counts[TEAM_BLUE] < 1) {
				notEnough = qtrue;
			}
		} else if ( level.numNonSpectatorClients < 2 ) {
			notEnough = qtrue;
		}

		if ( notEnough ) {
			if ( level.warmupTime != -1 ) {
				level.warmupTime = -1;
				level.firstStrike = qfalse;
				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
				G_LogPrintf( "Warmup:\n" );
			}
			return; // still waiting for team members
		}

		if ( level.warmupTime == 0 ) {
			return;
		}

		// if the warmup is changed at the console, restart it
		if ( g_warmup.modificationCount != level.warmupModificationCount ) {
			level.warmupModificationCount = g_warmup.modificationCount;
			level.warmupTime = -1;
			level.firstStrike = qfalse;
		}

		// if all players have arrived, start the countdown
		if ( level.warmupTime < 0 ) {
			
			if(g_CurrentRound.integer > 0) {
				// Shorter warmup for all rounds after the first one
				level.warmupTime = level.time + 9 * 1000; // 10 seconds with the fudge :)
				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
				return;

			} else {
				// fudge by -1 to account for extra delays
				level.warmupTime = level.time + ( g_warmup.integer - 1 ) * 1000;
				trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
				return;
			}
		}

		// if the warmup time has counted down, restart
		if ( level.time > level.warmupTime ) {
			level.warmupTime += 10000;
			trap_Cvar_Set( "g_restarted", "1" );
			level.firstStrike = qfalse;
			trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
			level.restarted = qtrue;
			UnzoomAll();

			return;
		}
	}
}


/*
==================
CheckVote
==================
*/
void CheckVote( void ) {
	if ( level.voteExecuteTime && level.voteExecuteTime < level.time ) {
		level.voteExecuteTime = 0;
		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
	}
	if ( !level.voteTime ) {
		return;
	}
	if ( level.time - level.voteTime >= VOTE_TIME ) {
		trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
	} else {
		if ( level.voteYes > level.numVotingClients/2 ) {
			// execute the command, then remove the vote
			trap_SendServerCommand( -1, "print \"Vote passed.\n\"" );
			level.voteExecuteTime = level.time + 3000;
		} else if ( level.voteNo >= level.numVotingClients/2 ) {
			// same behavior as a timeout
			trap_SendServerCommand( -1, "print \"Vote failed.\n\"" );
		} else {
			// still waiting for a majority
			return;
		}
	}
	level.voteTime = 0;
	trap_SetConfigstring( CS_VOTE_TIME, "" );

}

/*
==================
PrintTeam
==================
*/
void PrintTeam(int team, char *message) {
	int i;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if (level.clients[i].sess.sessionTeam != team)
			continue;
		trap_SendServerCommand( i, message );
	}
}

/*
==================
SetLeader
==================
*/
void SetLeader(int team, int client) {
	int i;

	if ( level.clients[client].pers.connected == CON_DISCONNECTED ) {
		PrintTeam(team, va("print \"%s is not connected\n\"", level.clients[client].pers.netname) );
		return;
	}
	if (level.clients[client].sess.sessionTeam != team) {
		PrintTeam(team, va("print \"%s is not on the team anymore\n\"", level.clients[client].pers.netname) );
		return;
	}
	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if (level.clients[i].sess.sessionTeam != team)
			continue;
		if (level.clients[i].sess.teamLeader) {
			level.clients[i].sess.teamLeader = qfalse;
			ClientUserinfoChanged(i);
		}
	}
	level.clients[client].sess.teamLeader = qtrue;
	ClientUserinfoChanged( client );
	PrintTeam(team, va("print \"%s is the new team leader\n\"", level.clients[client].pers.netname) );
}

/*
==================
CheckTeamLeader
==================
*/
void CheckTeamLeader( int team ) {
	int i;

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if (level.clients[i].sess.sessionTeam != team)
			continue;
		if (level.clients[i].sess.teamLeader)
			break;
	}
	if (i >= level.maxclients) {
		for ( i = 0 ; i < level.maxclients ; i++ ) {
			if (level.clients[i].sess.sessionTeam != team)
				continue;
			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
				level.clients[i].sess.teamLeader = qtrue;
				break;
			}
		}
		for ( i = 0 ; i < level.maxclients ; i++ ) {
			if (level.clients[i].sess.sessionTeam != team)
				continue;
			level.clients[i].sess.teamLeader = qtrue;
			break;
		}
	}
}

/*
==================
CheckTeamVote
==================
*/
void CheckTeamVote( int team ) {
	int cs_offset;

	if ( team == TEAM_RED )
		cs_offset = 0;
	else if ( team == TEAM_BLUE )
		cs_offset = 1;
	else
		return;

	if ( !level.teamVoteTime[cs_offset] ) {
		return;
	}
	if ( level.time - level.teamVoteTime[cs_offset] >= VOTE_TIME ) {
		trap_SendServerCommand( -1, "print \"Team vote failed.\n\"" );
	} else {
		if ( level.teamVoteYes[cs_offset] > level.numteamVotingClients[cs_offset]/2 ) {
			// execute the command, then remove the vote
			trap_SendServerCommand( -1, "print \"Team vote passed.\n\"" );
			//
			if ( !Q_strncmp( "leader", level.teamVoteString[cs_offset], 6) ) {
				//set the team leader
				SetLeader(team, atoi(level.teamVoteString[cs_offset] + 7));
			}
			else {
				trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.teamVoteString[cs_offset] ) );
			}
		} else if ( level.teamVoteNo[cs_offset] >= level.numteamVotingClients[cs_offset]/2 ) {
			// same behavior as a timeout
			trap_SendServerCommand( -1, "print \"Team vote failed.\n\"" );
		} else {
			// still waiting for a majority
			return;
		}
	}
	level.teamVoteTime[cs_offset] = 0;
	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, "" );

}


/*
==================
CheckCvars
==================
*/
void CheckCvars( void ) {
	static int lastMod = -1;

	if ( g_password.modificationCount != lastMod ) {
		lastMod = g_password.modificationCount;
		if ( *g_password.string && Q_stricmp( g_password.string, "none" ) ) {
			trap_Cvar_Set( "g_needpass", "1" );
		} else {
			trap_Cvar_Set( "g_needpass", "0" );
		}
	}
}

/*
=============
G_RunThink

Runs thinking code for this frame if necessary
=============
*/
void G_RunThink (gentity_t *ent) {
	float	thinktime;

	thinktime = ent->nextthink;
	if (thinktime <= 0) {
		return;
	}
	if (thinktime > level.time) {
		return;
	}
	
	ent->nextthink = 0;
	if (!ent->think) {
		G_Error ( "NULL ent->think");
	}
	ent->think (ent);
}

/*
================
G_RunFrame

Advances the non-player objects in the world
================
*/
void G_RunFrame( int levelTime ) {
	int			i;
	gentity_t	*ent;
	int			msec;
int start, end;

	// if we are waiting for the level to restart, do nothing
	if ( level.restarted ) {
		return;
	}

	level.framenum++;
	level.previousTime = level.time;
	level.time = levelTime;
	msec = level.time - level.previousTime;

	// get any cvar changes
	G_UpdateCvars();

	//
	// go through all allocated objects
	//
	start = trap_Milliseconds();
	ent = &g_entities[0];
	for (i=0 ; i<level.num_entities ; i++, ent++) {
		if ( !ent->inuse ) {
			continue;
		}

		// clear events that are too old
		if ( level.time - ent->eventTime > EVENT_VALID_MSEC ) {
			if ( ent->s.event ) {
				ent->s.event = 0;	// &= EV_EVENT_BITS;
				if ( ent->client ) {
					ent->client->ps.externalEvent = 0;
					// predicted events should never be set to zero
					//ent->client->ps.events[0] = 0;
					//ent->client->ps.events[1] = 0;
				}
			}
			if ( ent->freeAfterEvent ) {
				// tempEntities or dropped items completely go away after their event
				G_FreeEntity( ent );
				continue;
			} else if ( ent->unlinkAfterEvent ) {
				// items that will respawn will hide themselves after their pickup event
				ent->unlinkAfterEvent = qfalse;
				trap_UnlinkEntity( ent );
			}
		}

		// temporary entities don't think
		if ( ent->freeAfterEvent ) {
			continue;
		}

		if ( !ent->r.linked && ent->neverFree ) {
			continue;
		}

//unlagged - backward reconciliation #2
		// we'll run missiles separately to save CPU in backward reconciliation
/*
		if ( ent->s.eType == ET_MISSILE ) {
			G_RunMissile( ent );
			continue;
		}
*/
//unlagged - backward reconciliation #2

		if ( ent->s.eType == ET_ITEM || ent->physicsObject ) {
			G_RunItem( ent );
			continue;
		}

		if ( ent->s.eType == ET_MOVER ) {
			G_RunMover( ent );
			continue;
		}

		if ( i < MAX_CLIENTS ) {
			G_RunClient( ent );
			continue;
		}

		G_RunThink( ent );
	}

//unlagged - backward reconciliation #2
	// NOW run the missiles, with all players backward-reconciled
	// to the positions they were in exactly 50ms ago, at the end
	// of the last server frame
	G_TimeShiftAllClients( level.previousTime, NULL );

	ent = &g_entities[0];
	for (i=0 ; i<level.num_entities ; i++, ent++) {
		if ( !ent->inuse ) {
			continue;
		}

		// temporary entities don't think
		if ( ent->freeAfterEvent ) {
			continue;
		}

		if ( ent->s.eType == ET_MISSILE ) {
			G_RunMissile( ent );
		}


	}

	G_UnTimeShiftAllClients( NULL );
//unlagged - backward reconciliation #2

end = trap_Milliseconds();

start = trap_Milliseconds();
	// perform final fixups on the players
	ent = &g_entities[0];
	for (i=0 ; i < level.maxclients ; i++, ent++ ) {
		if ( ent->inuse ) {
			ClientEndFrame( ent );
		}
	}
end = trap_Milliseconds();

	// see if it is time to do a tournement restart
	CheckTournament();

	// Shafe - Trep - Radar Functions
	CheckPlayerPostions();

	// see if it is time to end the level
	CheckExitRules();

	// update to team status?
	CheckTeamStatus();

	// cancel vote if timed out
	CheckVote();

	// check team votes
	CheckTeamVote( TEAM_RED );
	CheckTeamVote( TEAM_BLUE );

	// for tracking changes
	CheckCvars();

	if (g_listEntity.integer) {
		for (i = 0; i < MAX_GENTITIES; i++) {
			G_Printf("%4i: %s\n", i, g_entities[i].classname);
		}
		trap_Cvar_Set("g_listEntity", "0");
	}

//unlagged - backward reconciliation #4
	// record the time at the end of this frame - it should be about
	// the time the next frame begins - when the server starts
	// accepting commands from connected clients
	level.frameStartTime = trap_Milliseconds();
//unlagged - backward reconciliation #4
}

// Shafe - Trep - Radar
playerpos_t		g_playerOrigins[MAX_CLIENTS]; //global storage for player positions

void CheckPlayerPostions(void)
{
        int i, valid_count = 0;
        gentity_t *ent;  // *loc, *ent; loc - unreferenced shafe - trep
        char cmd[16*MAX_CLIENTS + MAX_CLIENTS]; // make sure our command string is
                                              // large enough for all the data

        // do we need to update the positions yet?
		if (!level.lastPlayerLocationTime) { level.lastPlayerLocationTime = 25000; }

        if (level.time - level.lastPlayerLocationTime > PLAYER_LOCATION_UPDATE_TIME) 
        {
            //store the current time so we know when to update next
            level.lastPlayerLocationTime = level.time;

            //for each possible client
            valid_count = 0;

            for (i = 0; i < MAX_CLIENTS; i++) 
            {
                //get a pointer to the entity
                ent = g_entities + i;

                //see if we have a valid entry
                if (!ent->inuse)
                {
                    //mark as an invalid entry
                    g_playerOrigins[i].valid = kENTRY_INVALID;
                }

                if(!ent->client)
                {
                    g_playerOrigins[i].valid = kENTRY_INVALID;
                }
                else if(ent->health <= 0)
                {
                     g_playerOrigins[i].valid = kENTRY_INVALID;
                }
                else
                {
                    //get and store the client position
                    VectorCopy( ent->client->ps.origin, g_playerOrigins[i].pos);

                    //mark as valid entry
                    g_playerOrigins[i].valid = kENTRY_VALID;

                    //increase the valid counter
                    valid_count++;
                }
             } 
          }

        
	if (valid_count != 0) 
	{ 
		
		
		//build the command string to send
		
        Com_sprintf(cmd, sizeof(cmd), "playerpos %i ", valid_count);
        for(i=0; i<MAX_CLIENTS; i++)
        {
            //if weve got a valid entry then add the position to the command string
            if(g_playerOrigins[i].valid == kENTRY_VALID)
            {
                strcat(cmd, va(" %f,", g_playerOrigins[i].pos[0]));
                strcat(cmd, va("%f,", g_playerOrigins[i].pos[1]));
                strcat(cmd, va("%f", g_playerOrigins[i].pos[2]));
            }
        }
    
       
	
		for (i = 0; i < MAX_CLIENTS; i++) 
        {
			//get a pointer to the entity
			ent = g_entities + i;

			if ( !ent )
			{// Maybe this will fix it? -Vincent
			continue;
			}

			if ( ent->client->pers.connected == CON_CONNECTED && ent->client->pers.Eliminated == qfalse && ent->client->sess.sessionTeam != TEAM_SPECTATOR)
			{
				// Still Issues with this .. :( -- Shafe
				G_SendCommandToClient(ent, cmd); 
				//PrintMsg( NULL, "%s" S_COLOR_WHITE " -- CMD\n", cmd );
		
			}
				
		}  
		
	}
}
// Shafe - Trep - End Radar


