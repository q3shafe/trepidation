// 2016 Trepidation Licensed under the GPL2
//
/*
=======================================================================

VOIP OPTIONS MENU

=======================================================================
*/

#include "ui_local.h"


#define ART_FRAMEL			"menu/art/frame2_l"
#define ART_FRAMER			"menu/art/frame1_r"
#define ART_BACK0			"menu/art/back_0"
#define ART_BACK1			"menu/art/back_1"

#define ID_GRAPHICS			10
#define ID_DISPLAY			11
#define ID_SOUND			12
#define ID_NETWORK			13
#define ID_EFFECTSVOLUME	14
#define ID_MUSICVOLUME		15
#define ID_QUALITY			16
#define ID_ENABLEVOIP		17  
#define ID_BACK				18
#define ID_VOIP				19

static const char *xquality_items[] = {
	"Low", "High", 0
};

typedef struct {
	menuframework_s		menu;

	menutext_s			banner;
	menubitmap_s		framel;
	menubitmap_s		framer;

	menutext_s			graphics;
	menutext_s			display;
	menutext_s			sound;
	menutext_s			network;
	menutext_s			voip;

	menuradiobutton_s	enablevoip;
	menuslider_s		sfxvolume;
	menuslider_s		musicvolume;
	menulist_s			quality;
	

	menubitmap_s		back;
} voipOptionsInfo_t;

static voipOptionsInfo_t	voipOptionsInfo;


/*
=================
UI_Vpo[OptionsMenu_Event
=================
*/
static void UI_VoipOptionsMenu_Event( void* ptr, int event ) {
	if( event != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_GRAPHICS:
		UI_PopMenu();
		UI_GraphicsOptionsMenu();
		break;

	case ID_DISPLAY:
		UI_PopMenu();
		UI_DisplayOptionsMenu();
		break;

	case ID_SOUND:
		break;

	case ID_NETWORK:
		UI_PopMenu();
		UI_NetworkOptionsMenu();
		break;

	case ID_VOIP:
		UI_PopMenu();
		UI_VoipOptionsMenu();
		break;

	case ID_EFFECTSVOLUME:
		trap_Cvar_SetValue( "s_volume", voipOptionsInfo.sfxvolume.curvalue / 10 );
		break;

	case ID_MUSICVOLUME:
		trap_Cvar_SetValue( "s_musicvolume", voipOptionsInfo.musicvolume.curvalue / 10 );
		break;

	case ID_QUALITY:
		if( voipOptionsInfo.quality.curvalue ) {
			trap_Cvar_SetValue( "s_khz", 22 );
			trap_Cvar_SetValue( "s_compression", 0 );
		}
		else {
			trap_Cvar_SetValue( "s_khz", 11 );
			trap_Cvar_SetValue( "s_compression", 1 );
		}
		UI_ForceMenuOff();
		trap_Cmd_ExecuteText( EXEC_APPEND, "snd_restart\n" );
		break;

	case ID_ENABLEVOIP:
		if( voipOptionsInfo.enablevoip.curvalue ) {
			trap_Cmd_ExecuteText( EXEC_NOW, "cl_voip 1\n" );
		}
		else {
			trap_Cmd_ExecuteText( EXEC_NOW, "cl_voip 0\n" );
		}
		voipOptionsInfo.enablevoip.curvalue = (int)trap_Cvar_VariableValue( "cl_voip" );
		break;

	case ID_BACK:
		UI_PopMenu();
		break;
	}
}


/*
===============
UI_SoundOptionsMenu_Init
===============
*/
static void UI_VoipOptionsMenu_Init( void ) {
	int				y;

	memset( &voipOptionsInfo, 0, sizeof(voipOptionsInfo) );

	UI_VoipOptionsMenu_Cache();
	voipOptionsInfo.menu.wrapAround = qtrue;
	voipOptionsInfo.menu.fullscreen = qtrue;

	voipOptionsInfo.banner.generic.type		= MTYPE_BTEXT;
	voipOptionsInfo.banner.generic.flags		= QMF_CENTER_JUSTIFY;
	voipOptionsInfo.banner.generic.x			= 320;
	voipOptionsInfo.banner.generic.y			= 16;
	voipOptionsInfo.banner.string				= "SYSTEM SETUP";
	voipOptionsInfo.banner.color				= color_white;
	voipOptionsInfo.banner.style				= UI_CENTER;

	voipOptionsInfo.framel.generic.type		= MTYPE_BITMAP;
	voipOptionsInfo.framel.generic.name		= ART_FRAMEL;
	voipOptionsInfo.framel.generic.flags		= QMF_INACTIVE;
	voipOptionsInfo.framel.generic.x			= 0;  
	voipOptionsInfo.framel.generic.y			= 78;
	voipOptionsInfo.framel.width				= 256;
	voipOptionsInfo.framel.height				= 329;

	voipOptionsInfo.framer.generic.type		= MTYPE_BITMAP;
	voipOptionsInfo.framer.generic.name		= ART_FRAMER;
	voipOptionsInfo.framer.generic.flags		= QMF_INACTIVE;
	voipOptionsInfo.framer.generic.x			= 376;
	voipOptionsInfo.framer.generic.y			= 76;
	voipOptionsInfo.framer.width				= 256;
	voipOptionsInfo.framer.height				= 334;

	voipOptionsInfo.graphics.generic.type		= MTYPE_PTEXT;
	voipOptionsInfo.graphics.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	voipOptionsInfo.graphics.generic.id		= ID_GRAPHICS;
	voipOptionsInfo.graphics.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.graphics.generic.x			= 216;
	voipOptionsInfo.graphics.generic.y			= 240 - 2 * PROP_HEIGHT;
	voipOptionsInfo.graphics.string			= "GRAPHICS";
	voipOptionsInfo.graphics.style				= UI_RIGHT;
	voipOptionsInfo.graphics.color				= color_red;

	voipOptionsInfo.display.generic.type		= MTYPE_PTEXT;
	voipOptionsInfo.display.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	voipOptionsInfo.display.generic.id			= ID_DISPLAY;
	voipOptionsInfo.display.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.display.generic.x			= 216;
	voipOptionsInfo.display.generic.y			= 240 - PROP_HEIGHT;
	voipOptionsInfo.display.string				= "DISPLAY";
	voipOptionsInfo.display.style				= UI_RIGHT;
	voipOptionsInfo.display.color				= color_red;

	voipOptionsInfo.sound.generic.type			= MTYPE_PTEXT;
	voipOptionsInfo.sound.generic.flags		= QMF_RIGHT_JUSTIFY;
	voipOptionsInfo.sound.generic.id			= ID_SOUND;
	voipOptionsInfo.sound.generic.callback		= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.sound.generic.x			= 216;
	voipOptionsInfo.sound.generic.y			= 240;
	voipOptionsInfo.sound.string				= "SOUND";
	voipOptionsInfo.sound.style				= UI_RIGHT;
	voipOptionsInfo.sound.color				= color_red;

	voipOptionsInfo.network.generic.type		= MTYPE_PTEXT;
	voipOptionsInfo.network.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	voipOptionsInfo.network.generic.id			= ID_NETWORK;
	voipOptionsInfo.network.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.network.generic.x			= 216;
	voipOptionsInfo.network.generic.y			= 240 + PROP_HEIGHT;
	voipOptionsInfo.network.string				= "NETWORK";
	voipOptionsInfo.network.style				= UI_RIGHT;
	voipOptionsInfo.network.color				= color_red;

	voipOptionsInfo.voip.generic.type		= MTYPE_PTEXT;
	voipOptionsInfo.voip.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	voipOptionsInfo.voip.generic.id			= ID_VOIP;
	voipOptionsInfo.voip.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.voip.generic.x			= 216;
	voipOptionsInfo.voip.generic.y			= 240 + PROP_HEIGHT+ PROP_HEIGHT;
	voipOptionsInfo.voip.string				= "VOICE";
	voipOptionsInfo.voip.style				= UI_RIGHT;
	voipOptionsInfo.voip.color				= color_red;

	voipOptionsInfo.voip.generic.type		= MTYPE_PTEXT;
	voipOptionsInfo.voip.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
	voipOptionsInfo.voip.generic.id			= ID_VOIP;
	voipOptionsInfo.voip.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.voip.generic.x			= 216;
	voipOptionsInfo.voip.generic.y			= 240 + PROP_HEIGHT;
	voipOptionsInfo.voip.string				= "VOICE";
	voipOptionsInfo.voip.style				= UI_RIGHT;
	voipOptionsInfo.voip.color				= color_red;

	y = 240 - 1.5 * (BIGCHAR_HEIGHT + 2);
	
	voipOptionsInfo.enablevoip.generic.type			= MTYPE_RADIOBUTTON;
	voipOptionsInfo.enablevoip.generic.name			= "ENABLE VOICE/VOIP:";
	voipOptionsInfo.enablevoip.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	voipOptionsInfo.enablevoip.generic.callback		= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.enablevoip.generic.id				= ID_ENABLEVOIP;
	voipOptionsInfo.enablevoip.generic.x				= 400;
	voipOptionsInfo.enablevoip.generic.y				= y;
	
	
	y += BIGCHAR_HEIGHT+2;
	voipOptionsInfo.sfxvolume.generic.type		= MTYPE_SLIDER;
	voipOptionsInfo.sfxvolume.generic.name		= "Effects Volume:";
	voipOptionsInfo.sfxvolume.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	voipOptionsInfo.sfxvolume.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.sfxvolume.generic.id		= ID_EFFECTSVOLUME;
	voipOptionsInfo.sfxvolume.generic.x		= 400;
	voipOptionsInfo.sfxvolume.generic.y		= y;
	voipOptionsInfo.sfxvolume.minvalue			= 0;
	voipOptionsInfo.sfxvolume.maxvalue			= 10;

	y += BIGCHAR_HEIGHT+2;
	voipOptionsInfo.musicvolume.generic.type		= MTYPE_SLIDER;
	voipOptionsInfo.musicvolume.generic.name		= "Music Volume:";
	voipOptionsInfo.musicvolume.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	voipOptionsInfo.musicvolume.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.musicvolume.generic.id			= ID_MUSICVOLUME;
	voipOptionsInfo.musicvolume.generic.x			= 400;
	voipOptionsInfo.musicvolume.generic.y			= y;
	voipOptionsInfo.musicvolume.minvalue			= 0;
	voipOptionsInfo.musicvolume.maxvalue			= 10;

	y += BIGCHAR_HEIGHT+2;
	voipOptionsInfo.quality.generic.type		= MTYPE_SPINCONTROL;
	voipOptionsInfo.quality.generic.name		= "Sound Quality:";
	voipOptionsInfo.quality.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	voipOptionsInfo.quality.generic.callback	= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.quality.generic.id			= ID_QUALITY;
	voipOptionsInfo.quality.generic.x			= 400;
	voipOptionsInfo.quality.generic.y			= y;
	voipOptionsInfo.quality.itemnames			= xquality_items;

	

	voipOptionsInfo.back.generic.type			= MTYPE_BITMAP;
	voipOptionsInfo.back.generic.name			= ART_BACK0;
	voipOptionsInfo.back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	voipOptionsInfo.back.generic.callback		= UI_VoipOptionsMenu_Event;
	voipOptionsInfo.back.generic.id			= ID_BACK;
	voipOptionsInfo.back.generic.x				= 0;
	voipOptionsInfo.back.generic.y				= 480-64;
	voipOptionsInfo.back.width					= 128;
	voipOptionsInfo.back.height				= 64;
	voipOptionsInfo.back.focuspic				= ART_BACK1;

	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.banner );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.framel );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.framer );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.graphics );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.display );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.sound );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.network );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.voip );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.sfxvolume );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.musicvolume );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.quality );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.enablevoip );
	Menu_AddItem( &voipOptionsInfo.menu, ( void * ) &voipOptionsInfo.back );

	voipOptionsInfo.sfxvolume.curvalue = trap_Cvar_VariableValue( "s_volume" ) * 10;
	voipOptionsInfo.musicvolume.curvalue = trap_Cvar_VariableValue( "s_musicvolume" ) * 10;
	voipOptionsInfo.quality.curvalue = !trap_Cvar_VariableValue( "s_compression" );
	voipOptionsInfo.enablevoip.curvalue = (int)trap_Cvar_VariableValue( "cl_voip" );
}


/*
===============
UI_SoundOptionsMenu_Cache
===============
*/
void UI_VoipOptionsMenu_Cache( void ) {
	trap_R_RegisterShaderNoMip( ART_FRAMEL );
	trap_R_RegisterShaderNoMip( ART_FRAMER );
	trap_R_RegisterShaderNoMip( ART_BACK0 );
	trap_R_RegisterShaderNoMip( ART_BACK1 );
}


/*
===============
UI_SoundOptionsMenu
===============
*/
void UI_VoipOptionsMenu( void ) {
	UI_VoipOptionsMenu_Init();
	UI_PushMenu( &voipOptionsInfo.menu );
	Menu_SetCursorToItem( &voipOptionsInfo.menu, &voipOptionsInfo.sound );
}
