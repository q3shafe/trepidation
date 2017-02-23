// Copyright (C) 2011 Team Trepidation
//
/*
=======================================================================

OFFLINE PLAY MENU

=======================================================================
*/


#include "ui_local.h"


#define OFFLINE_MENU_VERTICAL_SPACING		34

#define ART_BACK0		"menu/art/back_2"
#define ART_BACK1		"menu/art/back_1"	
//#define ART_FRAMEL		"menu/art/frame2_l"
#define ART_FRAMEL		"menu/art/frame1_r"
#define ART_FRAMER		"menu/art/xxxxframe1_r"

#define ID_TUTORIALS			10
#define ID_TREPIDATION			11
#define ID_FFA					12
#define ID_CTF					13
#define ID_ARSENAL				14
#define ID_SURVIVAL				15
#define ID_FREEZETAG			16
#define ID_SAVE					17
#define ID_DEFAULTS				18
#define ID_BACK					19


typedef struct {
	menuframework_s	menu;

	menutext_s		banner;
	menubitmap_s	framel;
	menubitmap_s	framer;
	menutext_s		tutorials;
	menutext_s		trepidation;
	menutext_s		ffa;
	menutext_s		ctf;
	menutext_s		arsenal;
	menutext_s		survival;
	menutext_s		freezetag;
	//	menutext_s		load;
//	menutext_s		save;
	menutext_s		defaults;
	menubitmap_s	back;
} offlineMenuInfo_t;

static offlineMenuInfo_t	offlineMenuInfo;


/*
=================
Offline_ResetDefaults_Action
=================
*/
static void Offline_ResetDefaults_Action( qboolean result ) {
	if( !result ) {
		return;
	}
	trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
	trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
	trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
}


/*
=================
Offline_ResetDefaults_Draw
=================
*/
static void Offline_ResetDefaults_Draw( void ) {
	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset *ALL*", UI_CENTER|UI_SMALLFONT, color_yellow );
	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "options to their default values.", UI_CENTER|UI_SMALLFONT, color_yellow );
}


/*
===============
UI_OfflineMenu_Event
===============
*/
static void UI_OfflineMenu_Event( void *ptr, int event ) {
	if( event != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_TUTORIALS:
		UI_PlayerSettingsMenu();
		break;

	case ID_TREPIDATION:
		UI_ControlsMenu();
		break;

	case ID_FFA:
		UI_GraphicsOptionsMenu();
		break;

	case ID_CTF:
		UI_PreferencesMenu();
		break;

	case ID_ARSENAL:
		UI_CDKeyMenu();
		break;

	case ID_SURVIVAL:
		UI_CDKeyMenu();
		break;

	case ID_FREEZETAG:
		UI_CDKeyMenu();
		break;


//	case ID_LOAD:
//		UI_LoadConfigMenu();
//		break;

//	case ID_SAVE:
//		UI_SaveConfigMenu();
//		break;

	case ID_DEFAULTS:
		UI_ConfirmMenu( "SET TO DEFAULTS?", Offline_ResetDefaults_Draw, Offline_ResetDefaults_Action );
		break;

	case ID_BACK:
		UI_PopMenu();
		break;
	}
}


/*
===============
UI_OfflineMenu_Init
===============
*/
static void UI_OfflineMenu_Init( void ) {
	int				y;
	int		style = UI_CENTER | UI_DROPSHADOW;

	UI_OfflineMenu_Cache();

	memset( &offlineMenuInfo, 0, sizeof(offlineMenuInfo) );
	offlineMenuInfo.menu.wrapAround = qtrue;
	offlineMenuInfo.menu.fullscreen = qtrue;

	offlineMenuInfo.banner.generic.type				= MTYPE_BTEXT;
	offlineMenuInfo.banner.generic.x					= 320;
	offlineMenuInfo.banner.generic.y					= 16;
	offlineMenuInfo.banner.string						= "PLAY OFFLINE";
	offlineMenuInfo.banner.color						= color_white;
	offlineMenuInfo.banner.style						= UI_CENTER;

	offlineMenuInfo.framel.generic.type				= MTYPE_BITMAP;
	offlineMenuInfo.framel.generic.name				= ART_FRAMEL;
	offlineMenuInfo.framel.generic.flags				= QMF_INACTIVE;
	offlineMenuInfo.framel.generic.x					= 0;  
	offlineMenuInfo.framel.generic.y					= 0;
	offlineMenuInfo.framel.width  					= 800;
	offlineMenuInfo.framel.height  					= 600;

	offlineMenuInfo.framer.generic.type				= MTYPE_BITMAP;
	offlineMenuInfo.framer.generic.name				= ART_FRAMER;
	offlineMenuInfo.framer.generic.flags				= QMF_INACTIVE;
	offlineMenuInfo.framer.generic.x					= 376;
	offlineMenuInfo.framer.generic.y					= 76;
	offlineMenuInfo.framer.width  					= 256;
	offlineMenuInfo.framer.height  					= 334;

	y = 134;
	offlineMenuInfo.tutorials.generic.type			= MTYPE_PTEXT;
	offlineMenuInfo.tutorials.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.tutorials.generic.x				= 320;
	offlineMenuInfo.tutorials.generic.y				= y;
	offlineMenuInfo.tutorials.generic.id			= ID_TUTORIALS;
	offlineMenuInfo.tutorials.generic.callback		= UI_OfflineMenu_Event; 
	offlineMenuInfo.tutorials.string				= "TUTORIALS";
	offlineMenuInfo.tutorials.color					= color_red;
	offlineMenuInfo.tutorials.style					= style;

	y += OFFLINE_MENU_VERTICAL_SPACING;
	offlineMenuInfo.trepidation.generic.type		= MTYPE_PTEXT;
	offlineMenuInfo.trepidation.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.trepidation.generic.x			= 320;
	offlineMenuInfo.trepidation.generic.y			= y;
	offlineMenuInfo.trepidation.generic.id			= ID_TREPIDATION;
	offlineMenuInfo.trepidation.generic.callback	= UI_OfflineMenu_Event; 
	offlineMenuInfo.trepidation.string				= "TREPIDATION";
	offlineMenuInfo.trepidation.color				= color_red;
	offlineMenuInfo.trepidation.style				= style;

	y += OFFLINE_MENU_VERTICAL_SPACING;
	offlineMenuInfo.ffa.generic.type			= MTYPE_PTEXT;
	offlineMenuInfo.ffa.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.ffa.generic.x				= 320;
	offlineMenuInfo.ffa.generic.y				= y;
	offlineMenuInfo.ffa.generic.id			= ID_FFA;
	offlineMenuInfo.ffa.generic.callback		= UI_OfflineMenu_Event; 
	offlineMenuInfo.ffa.string				= "FREE FOR ALL";
	offlineMenuInfo.ffa.color					= color_red;
	offlineMenuInfo.ffa.style					= style;

	y += OFFLINE_MENU_VERTICAL_SPACING;
	offlineMenuInfo.ctf.generic.type					= MTYPE_PTEXT;
	offlineMenuInfo.ctf.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.ctf.generic.x					= 320;
	offlineMenuInfo.ctf.generic.y					= y;
	offlineMenuInfo.ctf.generic.id					= ID_CTF;
	offlineMenuInfo.ctf.generic.callback				= UI_OfflineMenu_Event; 
	offlineMenuInfo.ctf.string						= "CAPTURE THE FLAG";
	offlineMenuInfo.ctf.color						= color_red;
	offlineMenuInfo.ctf.style						= style;

	y += OFFLINE_MENU_VERTICAL_SPACING;
	offlineMenuInfo.arsenal.generic.type				= MTYPE_PTEXT;
	offlineMenuInfo.arsenal.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.arsenal.generic.x					= 320;
	offlineMenuInfo.arsenal.generic.y					= y;
	offlineMenuInfo.arsenal.generic.id					= ID_ARSENAL;
	offlineMenuInfo.arsenal.generic.callback			= UI_OfflineMenu_Event; 
	offlineMenuInfo.arsenal.string						= "ARSENAL";
	offlineMenuInfo.arsenal.color						= color_red;
	offlineMenuInfo.arsenal.style						= UI_CENTER;

	y += OFFLINE_MENU_VERTICAL_SPACING;
	offlineMenuInfo.survival.generic.type				= MTYPE_PTEXT;
	offlineMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.survival.generic.x					= 320;
	offlineMenuInfo.survival.generic.y					= y;
	offlineMenuInfo.survival.generic.id					= ID_SURVIVAL;
	offlineMenuInfo.survival.generic.callback			= UI_OfflineMenu_Event; 
	offlineMenuInfo.survival.string						= "SURVIVAL";
	offlineMenuInfo.survival.color						= color_red;
	offlineMenuInfo.survival.style						= UI_CENTER;

	y += OFFLINE_MENU_VERTICAL_SPACING;
	offlineMenuInfo.survival.generic.type				= MTYPE_PTEXT;
	offlineMenuInfo.survival.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.survival.generic.x					= 320;
	offlineMenuInfo.survival.generic.y					= y;
	offlineMenuInfo.survival.generic.id					= ID_FREEZETAG;
	offlineMenuInfo.survival.generic.callback			= UI_OfflineMenu_Event; 
	offlineMenuInfo.survival.string						= "SURVIVAL";
	offlineMenuInfo.survival.color						= color_red;
	offlineMenuInfo.survival.style						= UI_CENTER;

	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
#if 0
		y += OFFLINE_MENU_VERTICAL_SPACING;
		offlineMenuInfo.load.generic.type					= MTYPE_PTEXT;
		offlineMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
		offlineMenuInfo.load.generic.x					= 320;
		offlineMenuInfo.load.generic.y					= y;
		offlineMenuInfo.load.generic.id					= ID_LOAD;
		offlineMenuInfo.load.generic.callback				= UI_OfflineMenu_Event; 
		offlineMenuInfo.load.string						= "LOAD";
		offlineMenuInfo.load.color						= color_red;
		offlineMenuInfo.load.style						= UI_CENTER;

		y += OFFLINE_MENU_VERTICAL_SPACING;
		offlineMenuInfo.save.generic.type					= MTYPE_PTEXT;
		offlineMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
		offlineMenuInfo.save.generic.x					= 320;
		offlineMenuInfo.save.generic.y					= y;
		offlineMenuInfo.save.generic.id					= ID_SAVE;
		offlineMenuInfo.save.generic.callback				= UI_OfflineMenu_Event; 
		offlineMenuInfo.save.string						= "SAVE";
		offlineMenuInfo.save.color						= color_red;
		offlineMenuInfo.save.style						= UI_CENTER;
#endif

		y += OFFLINE_MENU_VERTICAL_SPACING;
		offlineMenuInfo.defaults.generic.type				= MTYPE_PTEXT;
		offlineMenuInfo.defaults.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
		offlineMenuInfo.defaults.generic.x				= 320;
		offlineMenuInfo.defaults.generic.y				= y;
		offlineMenuInfo.defaults.generic.id				= ID_DEFAULTS;
		offlineMenuInfo.defaults.generic.callback			= UI_OfflineMenu_Event; 
		offlineMenuInfo.defaults.string					= "DEFAULTS";
		offlineMenuInfo.defaults.color					= color_red;
		offlineMenuInfo.defaults.style					= style;
	}

	offlineMenuInfo.back.generic.type					= MTYPE_BITMAP;
	offlineMenuInfo.back.generic.name					= ART_BACK0;
	offlineMenuInfo.back.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	offlineMenuInfo.back.generic.id					= ID_BACK;
	offlineMenuInfo.back.generic.callback				= UI_OfflineMenu_Event;
	offlineMenuInfo.back.generic.x					= 0;
	offlineMenuInfo.back.generic.y					= 480-64;
	offlineMenuInfo.back.width						= 128;
	offlineMenuInfo.back.height						= 64;
	offlineMenuInfo.back.focuspic						= ART_BACK1;

	
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.framel );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.framer );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.banner );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.tutorials );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.trepidation );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.ffa );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.ctf );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.arsenal );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.survival );
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.freezetag);
//	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.cdkey );
//	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.load );
//	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.save );
	if( !trap_Cvar_VariableValue( "cl_paused" ) ) {
		Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.defaults );
	}
	Menu_AddItem( &offlineMenuInfo.menu, &offlineMenuInfo.back );
}


/*
=================
UI_OfflineMenu_Cache
=================
*/
void UI_OfflineMenu_Cache( void ) {
	trap_R_RegisterShaderNoMip( ART_BACK0 );
	trap_R_RegisterShaderNoMip( ART_BACK1 );
	trap_R_RegisterShaderNoMip( ART_FRAMEL );
	trap_R_RegisterShaderNoMip( ART_FRAMER );
}


/*
===============
UI_OfflineMenu
===============
*/
void UI_OfflineMenu( void ) {
	UI_OfflineMenu_Init();
	UI_PushMenu( &offlineMenuInfo.menu );
}
