// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
//
/*
=======================================================================

MAIN MENU

=======================================================================
*/


#include "ui_local.h"



#define ID_SINGLEPLAYER			10
#define ID_MULTIPLAYER			11
#define ID_SETUP				12
#define ID_DEMOS				13
#define ID_CINEMATICS			14
#define ID_TEAMARENA		15
#define ID_MODS					16
#define ID_EXIT					17
#define ART_FRAMER				"menu/art/frame1_r"
#define ART_TREPLOGO			"menu/art/treplogo"

#define SINGLEPLAYER_MENU_VERTICAL_SPACING		34

#define ART_BACK0		"menu/art/back_2"
#define ART_BACK1		"menu/art/back_1"	
//#define ART_FRAMEL		"menu/art/frame2_l"
#define ART_FRAMEL		"menu/art/frame1_r"



#define MAIN_BANNER_MODEL				"models/mapobjects/banner/banner5.md3"
#define MAIN_MENU_VERTICAL_SPACING		34


typedef struct {
	menuframework_s	menu;

	menutext_s		singleplayer;
	menutext_s		multiplayer;
	menutext_s		setup;
	menutext_s		demos;
	menutext_s		cinematics;
	menutext_s		teamArena;
	menutext_s		mods;
	menutext_s		exit;
	menubitmap_s	framer;
	menubitmap_s	treplogo;

	qhandle_t		bannerModel;
} mainmenu_t;


static mainmenu_t s_main;

typedef struct {
	menuframework_s menu;	
	char errorMessage[4096];
} errorMessage_t;

static errorMessage_t s_errorMessage;

/*
=================
MainMenu_ExitAction
=================
*/
static void MainMenu_ExitAction( qboolean result ) {
	if( !result ) {
		return;
	}
	UI_PopMenu();
	UI_CreditMenu();
}



/*
=================
Main_MenuEvent
=================
*/
void Main_MenuEvent (void* ptr, int event) {
	if( event != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_SINGLEPLAYER:
		//UI_SPLevelMenu();
		//UI_OfflineMenu();

		UI_SinglePlayerMenu();
		//UI_StartServerMenu( qfalse );
		break;

	case ID_MULTIPLAYER:
		UI_ArenaServersMenu();
		break;

	case ID_SETUP:
		UI_SetupMenu();
		break;

	case ID_DEMOS:
		UI_DemosMenu();
		break;

	case ID_CINEMATICS:
		UI_CinematicsMenu();
		break;

	case ID_MODS:
		UI_ModsMenu();
		break;

	case ID_TEAMARENA:
		trap_Cvar_Set( "fs_game", "missionpack");
		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
		break;

	case ID_EXIT:
		UI_ConfirmMenu( "EXIT GAME?", (voidfunc_f)NULL, MainMenu_ExitAction );
		break;
	}
}


/*
===============
MainMenu_Cache
===============
*/
void MainMenu_Cache( void ) {
	s_main.bannerModel = trap_R_RegisterModel( MAIN_BANNER_MODEL );
}

sfxHandle_t ErrorMessage_Key(int key)
{
	trap_Cvar_Set( "com_errorMessage", "" );
	UI_MainMenu();
	return (menu_null_sound);
}

/*
===============
Main_MenuDraw
TTimo: this function is common to the main menu and errorMessage menu
===============
*/

static void Main_MenuDraw( void ) {
	refdef_t		refdef;
	refEntity_t		ent;
	vec3_t			origin;
	vec3_t			angles;
	float			adjust;
	float			x, y, w, h;
	vec4_t			color = {0.5, 0, 0, 1};

	// setup the refdef

	memset( &refdef, 0, sizeof( refdef ) );

	refdef.rdflags = RDF_NOWORLDMODEL;

	AxisClear( refdef.viewaxis );

	x = 0;
	y = 0;
	w = 640;
	h = 120;
	UI_AdjustFrom640( &x, &y, &w, &h );
	refdef.x = x;
	refdef.y = y;
	refdef.width = w;
	refdef.height = h;

	adjust = 0; // JDC: Kenneth asked me to stop this 1.0 * sin( (float)uis.realtime / 1000 );
	refdef.fov_x = 60 + adjust;
	refdef.fov_y = 19.6875 + adjust;

	refdef.time = uis.realtime;

	origin[0] = 300;
	origin[1] = 0;
	origin[2] = -32;

	trap_R_ClearScene();

	// add the model

	memset( &ent, 0, sizeof(ent) );

	adjust = 5.0 * sin( (float)uis.realtime / 5000 );
	VectorSet( angles, 0, 180 + adjust, 0 );
	AnglesToAxis( angles, ent.axis );
	ent.hModel = s_main.bannerModel;
	VectorCopy( origin, ent.origin );
	VectorCopy( origin, ent.lightingOrigin );
	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
	VectorCopy( ent.origin, ent.oldorigin );

	trap_R_AddRefEntityToScene( &ent );

	trap_R_RenderScene( &refdef );
	
	if (strlen(s_errorMessage.errorMessage))
	{
		UI_DrawProportionalString_AutoWrapped( 320, 192, 600, 20, s_errorMessage.errorMessage, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
	}
	else
	{
		// standard menu drawing
		Menu_Draw( &s_main.menu );		
	}

	if (uis.demoversion) {
		UI_DrawProportionalString( 320, 372, "DEMO      FOR MATURE AUDIENCES      DEMO", UI_CENTER|UI_SMALLFONT, color );
		UI_DrawString( 320, 400, "Tredpidation (c)2016, Team Trepidation", UI_CENTER|UI_SMALLFONT, color );
	} else {
		UI_DrawString( 320, 450, "Tredpidation (c)2016, Team Trepidation", UI_CENTER|UI_SMALLFONT, color );
	}
}


/*
===============
UI_TeamArenaExists
===============
*/
static qboolean UI_TeamArenaExists( void ) {
	int		numdirs;
	char	dirlist[2048];
	char	*dirptr;
  char  *descptr;
	int		i;
	int		dirlen;

	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
	dirptr  = dirlist;
	for( i = 0; i < numdirs; i++ ) {
		dirlen = strlen( dirptr ) + 1;
    descptr = dirptr + dirlen;
		if (Q_stricmp(dirptr, "missionpack") == 0) {
			return qtrue;
		}
    dirptr += dirlen + strlen(descptr) + 1;
	}
	return qfalse;
}


/*
===============
UI_MainMenu

The main menu only comes up when not in a game,
so make sure that the attract loop server is down
and that local cinematics are killed
===============
*/
void UI_MainMenu( void ) {
	int		y;
	qboolean teamArena = qfalse;
	int		style = UI_CENTER | UI_DROPSHADOW;

	trap_Cvar_Set( "sv_killserver", "1" );

	if( !uis.demoversion && !ui_cdkeychecked.integer ) {
		char	key[17];

		trap_GetCDKey( key, sizeof(key) );
		if( trap_VerifyCDKey( key, NULL ) == qfalse ) {
			//UI_CDKeyMenu();
			//return;
		}
	}
	
	memset( &s_main, 0 ,sizeof(mainmenu_t) );
	memset( &s_errorMessage, 0 ,sizeof(errorMessage_t) );

	// com_errorMessage would need that too
	MainMenu_Cache();
	
	trap_Cvar_VariableStringBuffer( "com_errorMessage", s_errorMessage.errorMessage, sizeof(s_errorMessage.errorMessage) );
	if (strlen(s_errorMessage.errorMessage))
	{	
		s_errorMessage.menu.draw = Main_MenuDraw;
		s_errorMessage.menu.key = ErrorMessage_Key;
		s_errorMessage.menu.fullscreen = qtrue;
		s_errorMessage.menu.wrapAround = qtrue;
		s_errorMessage.menu.showlogo = qfalse;	// Shafe - Trep - Temporarily qfalse

		trap_Key_SetCatcher( KEYCATCH_UI );
		uis.menusp = 0;
		UI_PushMenu ( &s_errorMessage.menu );
		
		return;
	}


	trap_R_RegisterShaderNoMip( ART_FRAMER );
	trap_R_RegisterShaderNoMip( ART_TREPLOGO );

	s_main.menu.draw = Main_MenuDraw;
	s_main.menu.fullscreen = qtrue;
	s_main.menu.wrapAround = qtrue;
	s_main.menu.showlogo = qfalse; // Shafe - Trep - Temporarily qfalse

	s_main.framer.generic.type		= MTYPE_BITMAP;
	s_main.framer.generic.name		= ART_FRAMER;
	s_main.framer.generic.flags		= QMF_INACTIVE;
	s_main.framer.generic.x			= 0;  
	s_main.framer.generic.y			= 0;
	s_main.framer.width				= 800;
	s_main.framer.height			= 600;


	s_main.treplogo.generic.type		= MTYPE_BITMAP;
	s_main.treplogo.generic.name		= ART_TREPLOGO;
	s_main.treplogo.generic.flags		= QMF_INACTIVE;
	s_main.treplogo.generic.x			= 0;  
	s_main.treplogo.generic.y			= 1;
	s_main.treplogo.width				= 225;
	s_main.treplogo.height			= 100;


	y = 134;
	s_main.multiplayer.generic.type			= MTYPE_PTEXT;
	s_main.multiplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.multiplayer.generic.x			= 320;
	s_main.multiplayer.generic.y			= y;
	s_main.multiplayer.generic.id			= ID_MULTIPLAYER;
	s_main.multiplayer.generic.callback		= Main_MenuEvent; 
	s_main.multiplayer.string				= "PLAY TREPIDATION ONLINE"; // Shafe - Trep - Minor Text Change
	s_main.multiplayer.color				= color_red;
	s_main.multiplayer.style				= style;


	y += MAIN_MENU_VERTICAL_SPACING;
	s_main.singleplayer.generic.type		= MTYPE_PTEXT;
	s_main.singleplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.singleplayer.generic.x			= 320;
	s_main.singleplayer.generic.y			= y;
	s_main.singleplayer.generic.id			= ID_SINGLEPLAYER;
	s_main.singleplayer.generic.callback	= Main_MenuEvent; 
	s_main.singleplayer.string				= "SINGLE PLAYER";
	s_main.singleplayer.color				= color_red;
	s_main.singleplayer.style				= style;
	
	
	y += MAIN_MENU_VERTICAL_SPACING;
	s_main.setup.generic.type				= MTYPE_PTEXT;
	s_main.setup.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.setup.generic.x					= 320;
	s_main.setup.generic.y					= y;
	s_main.setup.generic.id					= ID_SETUP;
	s_main.setup.generic.callback			= Main_MenuEvent; 
	s_main.setup.string						= "SETUP";
	s_main.setup.color						= color_red;
	s_main.setup.style						= style;

	
	y += MAIN_MENU_VERTICAL_SPACING;
	s_main.demos.generic.type				= MTYPE_PTEXT;
	s_main.demos.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.demos.generic.x					= 320;
	s_main.demos.generic.y					= y;
	s_main.demos.generic.id					= ID_DEMOS;
	s_main.demos.generic.callback			= Main_MenuEvent; 
	s_main.demos.string						= "DEMOS";
	s_main.demos.color						= color_red;
	s_main.demos.style						= style;

	//y += MAIN_MENU_VERTICAL_SPACING;
	s_main.cinematics.generic.type			= MTYPE_PTEXT;
	s_main.cinematics.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.cinematics.generic.x				= 320;
	s_main.cinematics.generic.y				= y;
	s_main.cinematics.generic.id			= ID_CINEMATICS;
	s_main.cinematics.generic.callback		= Main_MenuEvent; 
	s_main.cinematics.string				= "CINEMATICS";
	s_main.cinematics.color					= color_red;
	s_main.cinematics.style					= style;
	

	if (UI_TeamArenaExists()) {
		teamArena = qtrue;
		y += MAIN_MENU_VERTICAL_SPACING;
		s_main.teamArena.generic.type			= MTYPE_PTEXT;
		s_main.teamArena.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
		s_main.teamArena.generic.x				= 320;
		s_main.teamArena.generic.y				= y;
		s_main.teamArena.generic.id				= ID_TEAMARENA;
		s_main.teamArena.generic.callback		= Main_MenuEvent; 
		s_main.teamArena.string					= "TEAM ARENA";
		s_main.teamArena.color					= color_red;
		s_main.teamArena.style					= style;
	}

	//y += MAIN_MENU_VERTICAL_SPACING;
	s_main.mods.generic.type			= MTYPE_PTEXT;
	s_main.mods.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.mods.generic.x				= 320;
	s_main.mods.generic.y				= y;
	s_main.mods.generic.id				= ID_MODS;
	s_main.mods.generic.callback		= Main_MenuEvent; 
	s_main.mods.string					= "MODS";
	s_main.mods.color					= color_red;
	s_main.mods.style					= style;

	y += MAIN_MENU_VERTICAL_SPACING;
	s_main.exit.generic.type				= MTYPE_PTEXT;
	s_main.exit.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_main.exit.generic.x					= 320;
	s_main.exit.generic.y					= y;
	s_main.exit.generic.id					= ID_EXIT;
	s_main.exit.generic.callback			= Main_MenuEvent; 
	s_main.exit.string						= "EXIT";
	s_main.exit.color						= color_red;
	s_main.exit.style						= style;

	Menu_AddItem( &s_main.menu, ( void * ) &s_main.framer );
	Menu_AddItem( &s_main.menu, ( void * ) &s_main.treplogo );
	
	Menu_AddItem( &s_main.menu,	&s_main.multiplayer );
	Menu_AddItem( &s_main.menu,	&s_main.singleplayer );
	Menu_AddItem( &s_main.menu,	&s_main.setup );
	Menu_AddItem( &s_main.menu,	&s_main.demos );
	//Menu_AddItem( &s_main.menu,	&s_main.cinematics );
	if (teamArena) {
		Menu_AddItem( &s_main.menu,	&s_main.teamArena );
	}
	//Menu_AddItem( &s_main.menu,	&s_main.mods );
	Menu_AddItem( &s_main.menu,	&s_main.exit ); 
	

	trap_Key_SetCatcher( KEYCATCH_UI );
	uis.menusp = 0;
	trap_Cmd_ExecuteText( EXEC_APPEND, "music sound/music/credits\n" );
	UI_PushMenu ( &s_main.menu );
		
}



//
//
//


#define ID_CREATEMATCH			20
#define ID_ALPHA				21
#define ID_FREEFORALL			22
#define ID_CTF					23
#define ID_ARSENAL				24
#define ID_SURVIVAL				25
#define ID_TREPIDATION			26
#define ID_FREEZETAG			27
#define ID_ONE4ALL				28
#define ID_BACK					29


typedef struct {
	menuframework_s	menu;

	menutext_s		banner;
	menubitmap_s	framel;
	menubitmap_s	framer;
	menutext_s		creatematch;
	menutext_s		alpha;
	menutext_s		freeforall;
	menutext_s		ctf;
	menutext_s		arsenal;
	menutext_s		survival;
	menutext_s		trepidation;
	menutext_s		freezetag;
	menubitmap_s	back;
} singleplayerMenuInfo_t;

static singleplayerMenuInfo_t	singleplayerMenuInfo;



/*
=================
RUN FFA CFG SP
=================
*/
static void Setup_RunFFA( qboolean result ) {
	
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/ffa.cfg\n");
}
/*
=================
RUN CTF CFG SP
=================
*/
static void Setup_RunCTF( qboolean result ) {
	
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/ctf.cfg\n");
}

/*
=================
RUN ARSENAL CFG SP
=================
*/
static void Setup_RunArsenal( qboolean result ) {
	
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/arsenal.cfg\n");
}

/*
=================
RUN SURVIVAL CFG SP
=================
*/
static void Setup_RunSurvival( qboolean result ) {
	
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/survival.cfg\n");
}

/*
=================
RUN TREPIDATION CFG SP
=================
*/
static void Setup_RunTrepidation( qboolean result ) {

	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/trepidation.cfg\n");
}



/*
=================
RUN FREEZE CFG SP
=================
*/
static void Setup_RunFreeze( qboolean result ) {
	
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec singleplayer/freezetag.cfg\n");
}





/*
===============
UI_SinglePlayerMenu_Event
===============
*/
static void UI_SinglePlayerMenu_Event( void *ptr, int event ) {
	if( event != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_CREATEMATCH:
		UI_StartServerMenu( qfalse );
		break;

	case ID_ALPHA:
		UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "CAMPAIGN NOT AVAILABLE (COMING SOON)", UI_CENTER|UI_SMALLFONT, color_yellow );
		break;

	case ID_FREEFORALL:
		Setup_RunFFA(0);
		break;

	case ID_CTF:
		Setup_RunCTF(0);
		break;

	case ID_ARSENAL:
		Setup_RunArsenal(0);
		break;

	case ID_SURVIVAL:
		Setup_RunSurvival(0);
		break;

	case ID_TREPIDATION:
		Setup_RunTrepidation(0);
		break;

	case ID_FREEZETAG:
		Setup_RunFreeze(0);
		break;

	case ID_BACK:
		UI_PopMenu();
		break;
	}
}


/*
===============
UI_SinglePlayerMenu_Init
===============
*/
static void UI_SinglePlayerMenu_Init( void ) {
	int				y;
	int		style = UI_CENTER | UI_DROPSHADOW;
	
	
	UI_SinglePlayerMenu_Cache();

	memset( &singleplayerMenuInfo, 0, sizeof(singleplayerMenuInfo) );
	singleplayerMenuInfo.menu.wrapAround = qtrue;
	singleplayerMenuInfo.menu.fullscreen = qtrue;

	singleplayerMenuInfo.banner.generic.type				= MTYPE_BTEXT;
	singleplayerMenuInfo.banner.generic.x					= 320;
	singleplayerMenuInfo.banner.generic.y					= 16;
	singleplayerMenuInfo.banner.string						= "SINGLE PLAYER";
	singleplayerMenuInfo.banner.color						= color_white;
	singleplayerMenuInfo.banner.style						= UI_CENTER;


	singleplayerMenuInfo.framel.generic.type				= MTYPE_BITMAP;
	singleplayerMenuInfo.framel.generic.name				= ART_FRAMEL;
	singleplayerMenuInfo.framel.generic.flags				= QMF_INACTIVE;
	singleplayerMenuInfo.framel.generic.x					= 0;  
	singleplayerMenuInfo.framel.generic.y					= 0;
	singleplayerMenuInfo.framel.width  					= 800;
	singleplayerMenuInfo.framel.height  					= 600;

	singleplayerMenuInfo.framer.generic.type				= MTYPE_BITMAP;
	singleplayerMenuInfo.framer.generic.name				= ART_FRAMER;
	singleplayerMenuInfo.framer.generic.flags				= QMF_INACTIVE;
	singleplayerMenuInfo.framer.generic.x					= 0;
	singleplayerMenuInfo.framer.generic.y					= 0;
	singleplayerMenuInfo.framer.width  					= 800;
	singleplayerMenuInfo.framer.height  					= 600;

	y = 134;
	singleplayerMenuInfo.creatematch.generic.type			= MTYPE_PTEXT;
	singleplayerMenuInfo.creatematch.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.creatematch.generic.x				= 320;
	singleplayerMenuInfo.creatematch.generic.y				= y;
	singleplayerMenuInfo.creatematch.generic.id				= ID_CREATEMATCH;
	singleplayerMenuInfo.creatematch.generic.callback		= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.creatematch.string				= "CREATE MATCH";
	singleplayerMenuInfo.creatematch.color					= color_red;
	singleplayerMenuInfo.creatematch.style					= style;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.alpha.generic.type				= MTYPE_PTEXT;
	singleplayerMenuInfo.alpha.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.alpha.generic.x					= 320;
	singleplayerMenuInfo.alpha.generic.y					= y;
	singleplayerMenuInfo.alpha.generic.id					= ID_ALPHA;
	singleplayerMenuInfo.alpha.generic.callback			= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.alpha.string						= "ALPHA CAMPAIGN";
	singleplayerMenuInfo.alpha.color						= color_dim;
	singleplayerMenuInfo.alpha.style						= UI_CENTER;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.freeforall.generic.type		= MTYPE_PTEXT;
	singleplayerMenuInfo.freeforall.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.freeforall.generic.x			= 320;
	singleplayerMenuInfo.freeforall.generic.y			= y;
	singleplayerMenuInfo.freeforall.generic.id			= ID_FREEFORALL;
	singleplayerMenuInfo.freeforall.generic.callback		= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.freeforall.string				= "FREE FOR ALL";
	singleplayerMenuInfo.freeforall.color				= color_red;
	singleplayerMenuInfo.freeforall.style				= style;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.ctf.generic.type			= MTYPE_PTEXT;
	singleplayerMenuInfo.ctf.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.ctf.generic.x				= 320;
	singleplayerMenuInfo.ctf.generic.y				= y;
	singleplayerMenuInfo.ctf.generic.id				= ID_CTF;
	singleplayerMenuInfo.ctf.generic.callback		= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.ctf.string				= "CAPTURE THE FLAG";
	singleplayerMenuInfo.ctf.color					= color_red;
	singleplayerMenuInfo.ctf.style					= style;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.arsenal.generic.type					= MTYPE_PTEXT;
	singleplayerMenuInfo.arsenal.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.arsenal.generic.x					= 320;
	singleplayerMenuInfo.arsenal.generic.y					= y;
	singleplayerMenuInfo.arsenal.generic.id					= ID_ARSENAL;
	singleplayerMenuInfo.arsenal.generic.callback				= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.arsenal.string						= "ARSENAL";
	singleplayerMenuInfo.arsenal.color						= color_red;
	singleplayerMenuInfo.arsenal.style						= style;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.survival.generic.type				= MTYPE_PTEXT;
	singleplayerMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.survival.generic.x					= 320;
	singleplayerMenuInfo.survival.generic.y					= y;
	singleplayerMenuInfo.survival.generic.id					= ID_SURVIVAL;
	singleplayerMenuInfo.survival.generic.callback			= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.survival.string						= "SURVIVAL";
	singleplayerMenuInfo.survival.color						= color_red;
	singleplayerMenuInfo.survival.style						= style;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.trepidation.generic.type				= MTYPE_PTEXT;
	singleplayerMenuInfo.trepidation.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.trepidation.generic.x					= 320;
	singleplayerMenuInfo.trepidation.generic.y					= y;
	singleplayerMenuInfo.trepidation.generic.id					= ID_TREPIDATION;
	singleplayerMenuInfo.trepidation.generic.callback			= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.trepidation.string						= "TREPIDATION";
	singleplayerMenuInfo.trepidation.color						= color_red;
	singleplayerMenuInfo.trepidation.style						= style;

	y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
	singleplayerMenuInfo.freezetag.generic.type				= MTYPE_PTEXT;
	singleplayerMenuInfo.freezetag.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.freezetag.generic.x					= 320;
	singleplayerMenuInfo.freezetag.generic.y					= y;
	singleplayerMenuInfo.freezetag.generic.id					= ID_FREEZETAG;
	singleplayerMenuInfo.freezetag.generic.callback			= UI_SinglePlayerMenu_Event; 
	singleplayerMenuInfo.freezetag.string						= "FREEZE TAG";
	singleplayerMenuInfo.freezetag.color						= color_dim;
	singleplayerMenuInfo.freezetag.style						= style;


	

	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
#if 0
		y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
		singleplayerMenuInfo.load.generic.type					= MTYPE_PTEXT;
		singleplayerMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
		singleplayerMenuInfo.load.generic.x					= 320;
		singleplayerMenuInfo.load.generic.y					= y;
		singleplayerMenuInfo.load.generic.id					= ID_LOAD;
		singleplayerMenuInfo.load.generic.callback				= UI_SinglePlayerMenu_Event; 
		singleplayerMenuInfo.load.string						= "LOAD";
		singleplayerMenuInfo.load.color						= color_red;
		singleplayerMenuInfo.load.style						= UI_CENTER;

		y += SINGLEPLAYER_MENU_VERTICAL_SPACING;
		singleplayerMenuInfo.save.generic.type					= MTYPE_PTEXT;
		singleplayerMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
		singleplayerMenuInfo.save.generic.x					= 320;
		singleplayerMenuInfo.save.generic.y					= y;
		singleplayerMenuInfo.save.generic.id					= ID_SAVE;
		singleplayerMenuInfo.save.generic.callback				= UI_SinglePlayerMenu_Event; 
		singleplayerMenuInfo.save.string						= "SAVE";
		singleplayerMenuInfo.save.color						= color_red;
		singleplayerMenuInfo.save.style						= UI_CENTER;
#endif

	}

	singleplayerMenuInfo.back.generic.type					= MTYPE_BITMAP;
	singleplayerMenuInfo.back.generic.name					= ART_BACK0;
	singleplayerMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	singleplayerMenuInfo.back.generic.id					= ID_BACK;
	singleplayerMenuInfo.back.generic.callback				= UI_SinglePlayerMenu_Event;
	singleplayerMenuInfo.back.generic.x					= 0;
	singleplayerMenuInfo.back.generic.y					= 480-64;
	singleplayerMenuInfo.back.width						= 128;
	singleplayerMenuInfo.back.height						= 64;
	singleplayerMenuInfo.back.focuspic						= ART_BACK1;

	
	//Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.framel );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.framer );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.banner );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.creatematch );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.alpha );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.freeforall );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.ctf );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.arsenal );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.survival );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.trepidation );
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.freezetag );
	
	Menu_AddItem( &singleplayerMenuInfo.menu, &singleplayerMenuInfo.back );
}


/*
=================
UI_SinglePlayerMenu_Cache
=================
*/
void UI_SinglePlayerMenu_Cache( void ) {
	trap_R_RegisterShaderNoMip( ART_BACK0 );
	trap_R_RegisterShaderNoMip( ART_BACK1 );
	trap_R_RegisterShaderNoMip( ART_FRAMEL );
	trap_R_RegisterShaderNoMip( ART_FRAMER );
}


/*
===============
UI_SinglePlayerMenu
===============
*/
void UI_SinglePlayerMenu( void ) {
	UI_SinglePlayerMenu_Init();
	UI_PushMenu( &singleplayerMenuInfo.menu );
}



