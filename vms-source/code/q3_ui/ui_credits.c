// Copyright (C) 1999-2000 Id Software, Inc.
//
/*
=======================================================================

CREDITS

=======================================================================
*/


#include "ui_local.h"
#define ART_FRAMER				"menu/art/moons"


typedef struct {
	menuframework_s	menu;
	menubitmap_s	framer;
} creditsmenu_t;

static creditsmenu_t	s_credits;


/*
=================
UI_CreditMenu_Key
=================
*/
static sfxHandle_t UI_CreditMenu_Key( int key ) {
	if( key & K_CHAR_FLAG ) {
		return 0;
	}

	trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
	return 0;
}




/*
===============
UI_CreditMenu_Draw
===============
*/
static void UI_CreditMenu_Draw( void ) {
	int		y;

	Menu_Draw( &s_credits.menu );

	y = 12;
	UI_DrawProportionalString( 320, y, "The Trepidation Team is:", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Programming", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Shafe, XcyTng", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Mapping And Art:", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Scott Hanke, RRE Mike, Petee, Gigabyte123", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Ryan McNeill", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Models", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Petee, DrAkOn", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Sound Engineer:", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Dave Cunningham", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Special Thanks To", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "The Open Arena Project", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Testing And Support", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Blue, Dredge, Prodie, Unknown", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Favorite Foods", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Pizza and M & M's", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "Website", UI_CENTER|UI_SMALLFONT, color_white );
	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawProportionalString( 320, y, "trepidation.sourceforge.net", UI_CENTER|UI_SMALLFONT, color_white );

	y += 1.35 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
	UI_DrawString( 320, y, "Trepidation     trepidation.soourceforge.net     trepidation@sourceforge.net", UI_CENTER|UI_SMALLFONT, color_red );
	y += SMALLCHAR_HEIGHT;
	UI_DrawString( 320, y, "Trepidation 2006 General Public License.", UI_CENTER|UI_SMALLFONT, color_red );
}


/*
===============
UI_CreditMenu
===============
*/
void UI_CreditMenu( void ) {
	memset( &s_credits, 0 ,sizeof(s_credits) );

	s_credits.menu.draw = UI_CreditMenu_Draw;
	s_credits.menu.key = UI_CreditMenu_Key;
	s_credits.menu.fullscreen = qtrue;


	trap_R_RegisterShaderNoMip( ART_FRAMER );
	

	s_credits.menu.draw = UI_CreditMenu_Draw;
	s_credits.menu.fullscreen = qtrue;
	s_credits.menu.wrapAround = qtrue;
	s_credits.menu.showlogo = qfalse; // Shafe - Trep - Temporarily qfalse

	s_credits.framer.generic.type		= MTYPE_BITMAP;
	s_credits.framer.generic.name		= ART_FRAMER;
	s_credits.framer.generic.flags		= QMF_INACTIVE;
	s_credits.framer.generic.x			= 0;  
	s_credits.framer.generic.y			= 0;
	s_credits.framer.width				= 800;
	s_credits.framer.height			= 600;

	Menu_AddItem( &s_credits.menu, ( void * ) &s_credits.framer );

	trap_Key_SetCatcher( KEYCATCH_UI );
	uis.menusp = 0;
	UI_PushMenu ( &s_credits.menu );
}
