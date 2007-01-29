// Copyright (C) 1999-2000 Id Software, Inc.
//
/*
=======================================================================

INGAME MENU

=======================================================================
*/


#include "ui_local.h"


#define INGAME_FRAME					"menu/art/xaddbotframe"
//#define INGAME_FRAME					"menu/art/cut_frame"
#define INGAME_MENU_VERTICAL_SPACING	28

#define ID_TEAM					10
#define ID_ADDBOTS				11
#define ID_REMOVEBOTS			12
#define ID_SETUP				13
#define ID_SERVERINFO			14
#define ID_LEAVEARENA			15
#define ID_RESTART				16
#define ID_QUIT					17
#define ID_RESUME				18
#define ID_TEAMORDERS			19
#define ID_CALLVOTE				20
#define ID_CLASS				21



typedef struct {
	menuframework_s	menu;

	menubitmap_s	frame;
	menutext_s		team;
	menutext_s		setup;
	menutext_s		server;
	menutext_s		leave;
	menutext_s		restart;
	menutext_s		addbots;
	menutext_s		removebots;
	menutext_s		teamorders;
	menutext_s		quit;
	menutext_s		resume;
	menutext_s		callvote;
	menutext_s		pickclass;
} ingamemenu_t;

static ingamemenu_t	s_ingame;




// Shafe - Dynamic Menu SYstem
/*
===========================

INGAME DYNAMIC COMMAND MENU

===========================
*/


#define MAX_DYNAMICDEPTH	6
#define MAX_MENUSTRING		16

#define MENUSPACE_X			4
#define MENUSPACE_Y			1


typedef void (*createHandler)(void);
typedef void (*eventHandler)(int index);


typedef struct {
	char text[MAX_MENUSTRING];
	int index;
	int id;
	createHandler createSubMenu;
	eventHandler runEvent;
} dynamicitem_t;


typedef struct {
	menuframework_s menu;

	menutext_s item[MAX_MENUITEMS];
	dynamicitem_t data[MAX_MENUITEMS];

	int start[MAX_DYNAMICDEPTH];
	int end[MAX_DYNAMICDEPTH];// indicates to (last item + 1)
	int active[MAX_DYNAMICDEPTH];
	int gametype;
	int depth;
	int gamemode;
} dynamicmenu_t;

static dynamicmenu_t s_dynamic;


/*
=================
InGame_RestartAction
=================
*/
static void InGame_RestartAction( qboolean result ) {
	if( !result ) {
		return;
	}

	UI_PopMenu();
	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
}


/*
=================
InGame_QuitAction
=================
*/
static void InGame_QuitAction( qboolean result ) {
	if( !result ) {
		return;
	}
	UI_PopMenu();
	UI_CreditMenu();
}


/*
=================
InGame_Event
=================
*/
void InGame_Event( void *ptr, int notification ) {
	if( notification != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_TEAM:
		UI_TeamMainMenu();
		break;

	case ID_SETUP:
		UI_SetupMenu();
		break;

	case ID_LEAVEARENA:
		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
		break;

	case ID_RESTART:
		UI_ConfirmMenu( "RESTART ARENA?", (voidfunc_f)NULL, InGame_RestartAction );
		break;

	case ID_QUIT:
		UI_ConfirmMenu( "EXIT GAME?",  (voidfunc_f)NULL, InGame_QuitAction );
		break;

	case ID_SERVERINFO:
		UI_ServerInfoMenu();
		break;

	case ID_ADDBOTS:
		UI_AddBotsMenu();
		break;

	case ID_REMOVEBOTS:
		UI_RemoveBotsMenu();
		break;

	case ID_CALLVOTE:
		//UI_RemoveBotsMenu();
		break;

	case ID_CLASS:
		//UI_RemoveBotsMenu();
		break;

	case ID_TEAMORDERS:
		UI_TeamOrdersMenu();
		break;

	case ID_RESUME:
		UI_PopMenu();
		break;
	}
}


/*
=================
InGame_MenuInit
=================
*/
void InGame_MenuInit( void ) {
	int		y;
	uiClientState_t	cs;
	char	info[MAX_INFO_STRING];
	int		team;

	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );

	InGame_Cache();

	s_ingame.menu.wrapAround = qtrue;
	s_ingame.menu.fullscreen = qfalse;

	
	s_ingame.frame.generic.type			= MTYPE_BITMAP;
	s_ingame.frame.generic.flags		= QMF_INACTIVE;
	s_ingame.frame.generic.name			= INGAME_FRAME;
	s_ingame.frame.generic.x			= 320-233;//142;
	s_ingame.frame.generic.y			= 240-166;//118;
	s_ingame.frame.width				= 466;//359;
	s_ingame.frame.height				= 332;//256;
	
	//y = 96;
	y = 88;
	s_ingame.team.generic.type			= MTYPE_PTEXT;
	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.team.generic.x				= 320;
	s_ingame.team.generic.y				= y;
	s_ingame.team.generic.id			= ID_TEAM;
	s_ingame.team.generic.callback		= InGame_Event; 
	s_ingame.team.string				= "JOIN GAME";
	s_ingame.team.color					= color_red;
	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;

	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.addbots.generic.x			= 320;
	s_ingame.addbots.generic.y			= y;
	s_ingame.addbots.generic.id			= ID_ADDBOTS;
	s_ingame.addbots.generic.callback	= InGame_Event; 
	s_ingame.addbots.string				= "ADD BOTS";
	s_ingame.addbots.color				= color_red;
	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
		if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
			s_ingame.addbots.generic.flags |= QMF_GRAYED;
		}
	

	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.removebots.generic.x			= 320;
	s_ingame.removebots.generic.y			= y;
	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
	s_ingame.removebots.generic.callback	= InGame_Event; 
	s_ingame.removebots.string				= "REMOVE BOTS";
	s_ingame.removebots.color				= color_red;
	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
		s_ingame.removebots.generic.flags |= QMF_GRAYED;
		}
	}

	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.teamorders.generic.x			= 320;
	s_ingame.teamorders.generic.y			= y;
	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
	s_ingame.teamorders.generic.callback	= InGame_Event; 
	s_ingame.teamorders.string				= "TEAM ORDERS";
	s_ingame.teamorders.color				= color_red;
	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) ) {
		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
	}
	else {
		trap_GetClientState( &cs );
		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
		team = atoi( Info_ValueForKey( info, "t" ) );
		if( team == TEAM_SPECTATOR ) {
			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
		}
	}


	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.callvote.generic.type			= MTYPE_PTEXT;
	s_ingame.callvote.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.callvote.generic.x			= 320;
	s_ingame.callvote.generic.y			= y;
	s_ingame.callvote.generic.id			= ID_CALLVOTE;
	s_ingame.callvote.generic.callback		= InGame_Event; 
	s_ingame.callvote.string				= "CALL VOTE";
	s_ingame.callvote.color				= color_red;
	s_ingame.callvote.style				= UI_CENTER|UI_SMALLFONT;

	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.pickclass.generic.type			= MTYPE_PTEXT;
	s_ingame.pickclass.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.pickclass.generic.x			= 320;
	s_ingame.pickclass.generic.y			= y;
	s_ingame.pickclass.generic.id			= ID_CLASS;
	s_ingame.pickclass.generic.callback		= InGame_Event; 
	s_ingame.pickclass.string				= "CHOOSE CLASS";
	s_ingame.pickclass.color				= color_red;
	s_ingame.pickclass.style				= UI_CENTER|UI_SMALLFONT;


	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.setup.generic.type			= MTYPE_PTEXT;
	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.setup.generic.x			= 320;
	s_ingame.setup.generic.y			= y;
	s_ingame.setup.generic.id			= ID_SETUP;
	s_ingame.setup.generic.callback		= InGame_Event; 
	s_ingame.setup.string				= "SETUP";
	s_ingame.setup.color				= color_red;
	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;

	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.server.generic.type		= MTYPE_PTEXT;
	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.server.generic.x			= 320;
	s_ingame.server.generic.y			= y;
	s_ingame.server.generic.id			= ID_SERVERINFO;
	s_ingame.server.generic.callback	= InGame_Event; 
	s_ingame.server.string				= "SERVER INFO";
	s_ingame.server.color				= color_red;
	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;

	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.restart.generic.type		= MTYPE_PTEXT;
	s_ingame.restart.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.restart.generic.x			= 320;
	s_ingame.restart.generic.y			= y;
	s_ingame.restart.generic.id			= ID_RESTART;
	s_ingame.restart.generic.callback	= InGame_Event; 
	s_ingame.restart.string				= "RESTART MAP"; // Shafe - Trep Minor Text Change
	s_ingame.restart.color				= color_red;
	s_ingame.restart.style				= UI_CENTER|UI_SMALLFONT;
	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
		s_ingame.restart.generic.flags |= QMF_GRAYED;
		}
	}
	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.resume.generic.type			= MTYPE_PTEXT;
	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.resume.generic.x				= 320;
	s_ingame.resume.generic.y				= y;
	s_ingame.resume.generic.id				= ID_RESUME;
	s_ingame.resume.generic.callback		= InGame_Event; 
	s_ingame.resume.string					= "RESUME GAME";
	s_ingame.resume.color					= color_red;
	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;

	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.leave.generic.type			= MTYPE_PTEXT;
	s_ingame.leave.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.leave.generic.x			= 320;
	s_ingame.leave.generic.y			= y;
	s_ingame.leave.generic.id			= ID_LEAVEARENA;
	s_ingame.leave.generic.callback		= InGame_Event; 
	s_ingame.leave.string				= "MAIN MENU"; // Shafe - Trep Minor Text Change
	s_ingame.leave.color				= color_red;
	s_ingame.leave.style				= UI_CENTER|UI_SMALLFONT;

	y += INGAME_MENU_VERTICAL_SPACING;
	s_ingame.quit.generic.type			= MTYPE_PTEXT;
	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
	s_ingame.quit.generic.x				= 320;
	s_ingame.quit.generic.y				= y;
	s_ingame.quit.generic.id			= ID_QUIT;
	s_ingame.quit.generic.callback		= InGame_Event; 
	s_ingame.quit.string				= "EXIT TREPIDATION"; // Shafe - Trep - Minor Text Change
	s_ingame.quit.color					= color_red;
	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;

	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
	Menu_AddItem( &s_ingame.menu, &s_ingame.team );

	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
		Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
		Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
	}
	
	Menu_AddItem( &s_ingame.menu, &s_ingame.callvote );
	Menu_AddItem( &s_ingame.menu, &s_ingame.pickclass );
	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
	Menu_AddItem( &s_ingame.menu, &s_ingame.server );

	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
		Menu_AddItem( &s_ingame.menu, &s_ingame.restart );
	}
	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
	Menu_AddItem( &s_ingame.menu, &s_ingame.leave );
	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
}


/*
=================
InGame_Cache
=================
*/
void InGame_Cache( void ) {
	trap_R_RegisterShaderNoMip( INGAME_FRAME );
}


/*
=================
UI_InGameMenu
=================
*/
void UI_InGameMenu( void ) {
	// force as top level menu
	uis.menusp = 0;  

	// set menu cursor to a nice location
	uis.cursorx = 275;
	uis.cursory = 80;

	InGame_MenuInit();
	UI_PushMenu( &s_ingame.menu );
}




// Shafe - Trep --- Menu System
// EVERYTHING BELOW IS ADDED BY SHAFE.. INGAME DYNAMIC MENUS  /////////////////////////////////////
// Heh.. Cut and Paste didnt preserve whitespace... bleh.. 
// Fix that later

//




/*
=================
DynamicMenu_InitSubMenu
=================
*/
static qboolean DynamicMenu_SubMenuInit( void)
{
int pos;

if (s_dynamic.depth == MAX_DYNAMICDEPTH)
return qfalse;

if (s_dynamic.depth == 0)
pos = 0;
else
pos = s_dynamic.end[s_dynamic.depth - 1];

if (pos == MAX_MENUITEMS)
return qfalse;

s_dynamic.depth++;
s_dynamic.active[s_dynamic.depth - 1] = -1;
s_dynamic.start[s_dynamic.depth - 1] = pos;
s_dynamic.end[s_dynamic.depth - 1] = pos;

return qtrue;
}


/*
=================
DynamicMenu_AddItem
=================
*/
static qboolean DynamicMenu_AddItem( const char* string, 
int id, createHandler crh, eventHandler evh)
{
int index, depth;

depth = s_dynamic.depth - 1;
index = s_dynamic.end[depth];

if (index == MAX_MENUITEMS)
return qfalse;

// can't have submenu and event attached to menu item
if (crh && evh)
return qfalse;

if (!string || !string[0])
string = "[no text]";

s_dynamic.data[index].index = index;
s_dynamic.data[index].id = id;
s_dynamic.data[index].createSubMenu = crh;
s_dynamic.data[index].runEvent = evh;
Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);

s_dynamic.end[depth]++;

return qtrue;
}


/*
=================
DynamicMenu_FinishInitSubMenu
=================
*/
static void DynamicMenu_FinishSubMenuInit( void )
{
	int depth;
	int width, maxwidth;
	int height, lineheight;
	int posx, posy;
	int i, count, start, active;
	float scale;
	menutext_s*	ptr;
	qboolean	submenu;


depth = s_dynamic.depth - 1;

// find the widest item
submenu = qfalse;
maxwidth = 0;
start = s_dynamic.start[depth];
count = s_dynamic.end[depth] - start;
for ( i = 0; i < count; i++)
{
width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
if (width > maxwidth)
maxwidth = width;

if (s_dynamic.data[i + start].createSubMenu)
submenu = qtrue;
}

scale = UI_ProportionalSizeScale(UI_SMALLFONT);
if (submenu)
{
// space and submenu pointer
maxwidth += UI_ProportionalStringWidth(" \r");
}

maxwidth *= scale;

// determine the position of the menu
lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
height = count * lineheight;

if (depth == 0)
{
posy = 240 - height/2;
posx = 0;
}
else
{
active = s_dynamic.active[depth - 1];
posx = s_dynamic.item[active].generic.right;
posy = s_dynamic.item[active].generic.top;

if (posy + height > 480 - 64)
posy = 480 - 64 - height;
}

for (i = 0; i < count; i++)
{
ptr = &s_dynamic.item[start + i];

ptr->generic.x = posx + MENUSPACE_X;
ptr->generic.y = posy + i*lineheight + MENUSPACE_Y;

ptr->generic.left = posx;
ptr->generic.right = posx + maxwidth + 2*MENUSPACE_X;
ptr->generic.top = posy + i*lineheight;
ptr->generic.bottom = posy + (i+1)*lineheight - 1;

ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
}
}

 
/*
=================
DynamicMenu_OnActiveList
=================
*/
static qboolean DynamicMenu_OnActiveList( int index )
{
int depth;
int i;

depth = s_dynamic.depth;

for ( i = 0; i < depth ; i++)
if (s_dynamic.active[i] == index)
return qtrue;

return qfalse;
}




/*
=================
DynamicMenu_MenuItemDraw
=================
*/
static void DynamicMenu_MenuItemDraw( void* self )
{
int	x;
int	y;

int	w,h;
float *color;
int	style;
menutext_s*	t;
vec4_t	back_color;

t = (menutext_s*)self;


// draw the background;
x = t->generic.left;
y = t->generic.top;
w = t->generic.right - x;
h = t->generic.bottom - y;

back_color[0] = 1.0;
back_color[1] = 1.0;
back_color[2] = 1.0;
if (DynamicMenu_OnActiveList(t->generic.id))
{
		back_color[3] = 0.33f;
	}
	else
	{
		back_color[3] = 0.1f;
	}

UI_FillRect(x, y, w, h, back_color);

// draw the text
x = t->generic.x;
y = t->generic.y;

if (t->generic.flags & QMF_GRAYED)
color = text_color_disabled;
else
color = t->color;

style = t->style;
if( t->generic.flags & QMF_PULSEIFFOCUS ) {
if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
style |= UI_PULSE;
}
else {
style |= UI_INVERSE;
}
}

UI_DrawProportionalString( x, y, t->string, style, color );

// draw the cursor for submenu if needed
x = t->generic.left + w;
if (s_dynamic.data[ t->generic.id ].createSubMenu)
{
UI_DrawChar( x, y, 13, style|UI_RIGHT, color);
}
}




/*
=================
DynamicMenu_MenuDraw
=================
*/
static void DynamicMenu_MenuDraw( void )
{
//UI_DrawString(0, 0, va("depth:%i", s_dynamic.depth), 
//UI_SMALLFONT, color_white);
//UI_DrawString(0, 32, va("active: %i %i %i", 
//s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ),
//UI_SMALLFONT, color_white);

Menu_Draw(&s_dynamic.menu);
}



/*
=================
DynamicMenu_IndexDepth
=================
*/
static int DynamicMenu_IndexDepth( int pos )
{
int i;
int maxdepth, depth;

maxdepth = s_dynamic.depth;
depth = 0;
for (i = 0; i < maxdepth; i++)
{
if (pos < s_dynamic.end[i])
{
depth = i + 1;
break;
}
}

return depth;
}



/*
=================
DynamicMenu_SetFocus
=================
*/
static void DynamicMenu_SetFocus( int pos )
{
int i;
int depth, newdepth;

depth = s_dynamic.depth;
newdepth = DynamicMenu_IndexDepth(pos);

if (newdepth == 0)
{
Com_Printf("SetFocus: index %i outside menu\n", pos);
return;
}

s_dynamic.active[ newdepth - 1 ] = pos;
s_dynamic.depth = newdepth;

// hide any previous submenus
if (newdepth < depth)
{
for (i = s_dynamic.start[ newdepth ]; 
i < s_dynamic.end[depth - 1]; i++)
{
s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
}
}

s_dynamic.active[newdepth - 1] = pos;

// show this sub-menu (if needed)
if (s_dynamic.data[pos].createSubMenu)
s_dynamic.data[pos].createSubMenu();
}


/*
=================
DynamicMenu_ClearFocus
=================
*/
static void DynamicMenu_ClearFocus( int pos )
{
}



/*
=================
DynamicMenu_ActivateControl
=================
*/
static void DynamicMenu_ActivateControl( int pos )
{
//int i;
int depth;

depth = DynamicMenu_IndexDepth(pos);

if (depth == 0)
{
Com_Printf("ActivateControl: index %i outside menu\n", pos);
return;
}

// not at the deepest level, can't be a command
if (depth < s_dynamic.depth)
return;

if (s_dynamic.data[pos].runEvent)
s_dynamic.data[pos].runEvent(pos);
else
Com_Printf("ActivateControl: index %i has no event\n", pos);
}




/*
=================
DynamicMenu_MenuEvent
=================
*/
static void DynamicMenu_MenuEvent( void* self, int event )
{
menutext_s* t;

t = (menutext_s*)self;

switch (event)
{
case QM_GOTFOCUS:
DynamicMenu_SetFocus(t->generic.id);
break;
case QM_LOSTFOCUS:
DynamicMenu_ClearFocus(t->generic.id);
break;
case QM_ACTIVATED:
DynamicMenu_ActivateControl(t->generic.id);
break;
}
}


/*
=================
Build
=================
*/
static void DM_BuildItem( int xitem ) {
	UI_PopMenu();
	
	// Basic Turret
	if (xitem == 0) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret\n" );
	}

	// Shielded Turret
	if (xitem == 1) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret2\n" );
	}

	// Cloaked Turret
	if (xitem == 2) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnturret3\n" );
	}

	// Immobilizer
	if (xitem == 3) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "spawntd\n" );
	}

	// Generator
	if (xitem == 4) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "spawngen\n" );
	}

	// Master Controller
	if (xitem == 5) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "spawnmc\n" );
	}

}


/*
=================
DynamicMenu_Close
=================
*/
static void DynamicMenu_Close( void )
{
UI_PopMenu();
}
 


/*
=================
DM_Close_Event
=================
*/
static void DM_Close_Event( int index )
{
UI_PopMenu();
}


// Shafe - Trep - Here is where the first Dynamic Menu Starts

/*
=================
// My first Test menu
DynamicMenu_VoteMenu
=================
*/
static void DynamicMenu_VoteMenu( void )
{
	DynamicMenu_SubMenuInit();
	// The Menu Items

	DynamicMenu_AddItem("Kick", 0 , NULL, DM_Close_Event);
	DynamicMenu_AddItem("Next Map", 0 , NULL, DM_Close_Event);
	DynamicMenu_AddItem("Restart Map", 0 , NULL, DM_Close_Event);
	DynamicMenu_AddItem("Balance Teams", 0 , NULL, DM_Close_Event);
	DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
	DynamicMenu_FinishSubMenuInit();
}




// Shafe - Trep - Top Level Menu Last
/*
=================
DynamicMenu_InitPrimaryMenu
=================
*/
static void DynamicMenu_InitPrimaryMenu( void )
{
DynamicMenu_SubMenuInit();

DynamicMenu_AddItem("Call Vote", 0, DynamicMenu_VoteMenu, NULL);
DynamicMenu_AddItem("Buy Equipment", 0 , NULL, DM_Close_Event);
DynamicMenu_AddItem("Crap!", 0, NULL, DM_Close_Event);
DynamicMenu_AddItem("Shit And Stuff!", 0, NULL, DM_Close_Event);
DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);

DynamicMenu_FinishSubMenuInit();
}



static void DynamicMenu_BuildMenu( void )
{
	DynamicMenu_SubMenuInit();

	//int	cts;
	//cts = cgs.scores1 + cgs.scores2;
	
	//s_dynamic.gamemode = (int)trap_Cvar_VariableValue("g_GameMode");
	
	
		/* Rules just for reference from g_cmds
		if ((cts < 3) && (type == 1)) { iserror = 3; }  
		if ((cts < 6) && (type == 2)) { iserror = 3; }  

		*/

	
	
	DynamicMenu_AddItem("Turret", 0, NULL, DM_BuildItem);

	DynamicMenu_AddItem("Sheilded Turret", 0 , NULL, DM_BuildItem);
	DynamicMenu_AddItem("Cloaked Turret", 0, NULL, DM_BuildItem);
	DynamicMenu_AddItem("Immobilizer", 0, NULL, DM_BuildItem);
//	if( cgs.g_GameMode == 3) 
//	{
		DynamicMenu_AddItem("Generator", 0, NULL, DM_BuildItem);
		DynamicMenu_AddItem("Power Core", 0, NULL, DM_BuildItem);
//	}
	
	//DynamicMenu_AddItem("Close", 0, NULL, DM_Close_Event);

	DynamicMenu_FinishSubMenuInit();
}


/*
=================
DynamicMenu_MenuInit
=================
*/
static void DynamicMenu_MenuInit( void )
{
int i;

s_dynamic.menu.draw = DynamicMenu_MenuDraw;
s_dynamic.menu.fullscreen = qfalse;
s_dynamic.menu.wrapAround = qfalse;

for (i = 0; i < MAX_MENUITEMS; i++)
{
s_dynamic.item[i].generic.type = MTYPE_PTEXT;
s_dynamic.item[i].generic.flags = QMF_INACTIVE
|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
s_dynamic.item[i].generic.id = i;
s_dynamic.item[i].string = s_dynamic.data[i].text;
s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
s_dynamic.item[i].color = color_red;

Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
}

// start up the menu system
s_dynamic.depth = 0;

//Uncomment the next line if adding part II as well
//DynamicMenu_InitMapItems();

//DynamicMenu_InitPrimaryMenu();
DynamicMenu_BuildMenu();
}






/*
=================
UI_DynamicMenuCache
=================
*/
void UI_DynamicMenuCache( void )
{
}




/*
=================
UI_DynamicMenu
=================
*/
void UI_DynamicMenu( void )
{
	uiClientState_t	cs;
	char			info[MAX_INFO_STRING];
	int				playerTeam;

trap_GetClientState( &cs );
trap_GetConfigString( CS_PLAYERS 
+ cs.clientNum, info, MAX_INFO_STRING );
playerTeam = atoi(Info_ValueForKey(info, "t"));

//Uncomment the next two code lines if adding part II 
//as well, or specs can't use the menu either
//if (playerTeam == TEAM_SPECTATOR)
//return;

memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));

s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");

//Uncomment the next three lines if adding part II as well
//if (s_dynamic.gametype != GT_TEAM && 
//s_dynamic.gametype != GT_CTF)
//return;

UI_DynamicMenuCache();

// force as top level menu
uis.menusp = 0;

// set menu cursor to a nice location
uis.cursorx = 50;
uis.cursory = 240;

DynamicMenu_MenuInit();

UI_PushMenu( &s_dynamic.menu );
}



/*
=================
UI_DynamicCommandMenu_f
=================
*/
void UI_DynamicCommandMenu_f( void )
{
UI_DynamicMenu();
}

