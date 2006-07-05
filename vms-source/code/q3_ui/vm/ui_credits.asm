code
proc UI_CreditMenu_Key 0 8
file "../ui_credits.c"
line 29
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CREDITS
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:#define ART_FRAMER				"menu/art/moons"
;14:
;15:
;16:typedef struct {
;17:	menuframework_s	menu;
;18:	menubitmap_s	framer;
;19:} creditsmenu_t;
;20:
;21:static creditsmenu_t	s_credits;
;22:
;23:
;24:/*
;25:=================
;26:UI_CreditMenu_Key
;27:=================
;28:*/
;29:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 30
;30:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $71
line 31
;31:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $70
JUMPV
LABELV $71
line 34
;32:	}
;33:
;34:	trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 35
;35:	return 0;
CNSTI4 0
RETI4
LABELV $70
endproc UI_CreditMenu_Key 0 8
proc UI_CreditMenu_Draw 4 20
line 46
;36:}
;37:
;38:
;39:
;40:
;41:/*
;42:===============
;43:UI_CreditMenu_Draw
;44:===============
;45:*/
;46:static void UI_CreditMenu_Draw( void ) {
line 49
;47:	int		y;
;48:
;49:	Menu_Draw( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 51
;50:
;51:	y = 12;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 52
;52:	UI_DrawProportionalString( 320, y, "The Trepidation Team is:", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $75
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 54
;53:
;54:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 55
;55:	UI_DrawProportionalString( 320, y, "Programming", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $76
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 56
;56:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 57
;57:	UI_DrawProportionalString( 320, y, "Shafe, XcyTng", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $77
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 59
;58:
;59:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 60
;60:	UI_DrawProportionalString( 320, y, "Mapping And Art:", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $78
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 62
;61:	
;62:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 63
;63:	UI_DrawProportionalString( 320, y, "Scott Hanke, Ryan McNeill, Petee", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $79
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 65
;64:	
;65:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 66
;66:	UI_DrawProportionalString( 320, y, "Gigon, Gigabyte123", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $80
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 68
;67:
;68:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 69
;69:	UI_DrawProportionalString( 320, y, "Models", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $81
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 70
;70:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 71
;71:	UI_DrawProportionalString( 320, y, "Petee, DrAkOn, Gigon", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $82
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 73
;72:
;73:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 74
;74:	UI_DrawProportionalString( 320, y, "Sound Engineer:", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $83
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 75
;75:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 76
;76:	UI_DrawProportionalString( 320, y, "Dave Cunningham", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $84
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 78
;77:
;78:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 79
;79:	UI_DrawProportionalString( 320, y, "Special Thanks To", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $85
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 80
;80:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 81
;81:	UI_DrawProportionalString( 320, y, "The Open Arena Project", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $86
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 83
;82:
;83:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 84
;84:	UI_DrawProportionalString( 320, y, "Testing And Support", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $87
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 85
;85:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 86
;86:	UI_DrawProportionalString( 320, y, "Blue, Dredge, Prodie, Unknown", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $88
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 94
;87:
;88:	/*
;89:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
;90:	UI_DrawProportionalString( 320, y, "Favorite Foods", UI_CENTER|UI_SMALLFONT, color_white );
;91:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
;92:	UI_DrawProportionalString( 320, y, "Pizza and M & M's", UI_CENTER|UI_SMALLFONT, color_white );
;93:	*/
;94:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 95
;95:	UI_DrawProportionalString( 320, y, "Website", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $89
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 96
;96:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 97
;97:	UI_DrawProportionalString( 320, y, "trepidation.sourceforge.net", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $90
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 99
;98:
;99:	y += 1.35 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1104851763
ADDF4
CVFI4 4
ASGNI4
line 100
;100:	UI_DrawString( 320, y, "Trepidation     trepidation.soourceforge.net     Support Open Source!", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $91
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 101
;101:	y += SMALLCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 102
;102:	UI_DrawString( 320, y, "Trepidation 2006 General Public License.", UI_CENTER|UI_SMALLFONT, color_red );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $92
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 103
;103:}
LABELV $74
endproc UI_CreditMenu_Draw 4 20
export UI_CreditMenu
proc UI_CreditMenu 0 12
line 111
;104:
;105:
;106:/*
;107:===============
;108:UI_CreditMenu
;109:===============
;110:*/
;111:void UI_CreditMenu( void ) {
line 112
;112:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 114
;113:
;114:	s_credits.menu.draw = UI_CreditMenu_Draw;
ADDRGP4 s_credits+268
ADDRGP4 UI_CreditMenu_Draw
ASGNP4
line 115
;115:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+272
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 116
;116:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 119
;117:
;118:
;119:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $97
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 122
;120:	
;121:
;122:	s_credits.menu.draw = UI_CreditMenu_Draw;
ADDRGP4 s_credits+268
ADDRGP4 UI_CreditMenu_Draw
ASGNP4
line 123
;123:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 124
;124:	s_credits.menu.wrapAround = qtrue;
ADDRGP4 s_credits+276
CNSTI4 1
ASGNI4
line 125
;125:	s_credits.menu.showlogo = qfalse; // Shafe - Trep - Temporarily qfalse
ADDRGP4 s_credits+284
CNSTI4 0
ASGNI4
line 127
;126:
;127:	s_credits.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_credits+288
CNSTI4 6
ASGNI4
line 128
;128:	s_credits.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_credits+288+4
ADDRGP4 $97
ASGNP4
line 129
;129:	s_credits.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_credits+288+44
CNSTU4 16384
ASGNU4
line 130
;130:	s_credits.framer.generic.x			= 0;  
ADDRGP4 s_credits+288+12
CNSTI4 0
ASGNI4
line 131
;131:	s_credits.framer.generic.y			= 0;
ADDRGP4 s_credits+288+16
CNSTI4 0
ASGNI4
line 132
;132:	s_credits.framer.width				= 800;
ADDRGP4 s_credits+288+76
CNSTI4 800
ASGNI4
line 133
;133:	s_credits.framer.height			= 600;
ADDRGP4 s_credits+288+80
CNSTI4 600
ASGNI4
line 135
;134:
;135:	Menu_AddItem( &s_credits.menu, ( void * ) &s_credits.framer );
ADDRGP4 s_credits
ARGP4
ADDRGP4 s_credits+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 137
;136:
;137:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 138
;138:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 139
;139:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 140
;140:}
LABELV $93
endproc UI_CreditMenu 0 12
bss
align 4
LABELV s_credits
skip 376
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicMenu
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserMasterNum
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import Max_Ammo
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import SnapVectorTowards
import tonextint
import init_tonextint
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $97
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 111
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $92
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 54
byte 1 32
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 108
byte 1 32
byte 1 80
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 76
byte 1 105
byte 1 99
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $91
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 116
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 115
byte 1 111
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $90
byte 1 116
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 115
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 101
byte 1 46
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $89
byte 1 87
byte 1 101
byte 1 98
byte 1 115
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 44
byte 1 32
byte 1 68
byte 1 114
byte 1 101
byte 1 100
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 101
byte 1 44
byte 1 32
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $87
byte 1 84
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 65
byte 1 110
byte 1 100
byte 1 32
byte 1 83
byte 1 117
byte 1 112
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $86
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $85
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 0
align 1
LABELV $84
byte 1 68
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 67
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 104
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $83
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 69
byte 1 110
byte 1 103
byte 1 105
byte 1 110
byte 1 101
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $82
byte 1 80
byte 1 101
byte 1 116
byte 1 101
byte 1 101
byte 1 44
byte 1 32
byte 1 68
byte 1 114
byte 1 65
byte 1 107
byte 1 79
byte 1 110
byte 1 44
byte 1 32
byte 1 71
byte 1 105
byte 1 103
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $81
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $80
byte 1 71
byte 1 105
byte 1 103
byte 1 111
byte 1 110
byte 1 44
byte 1 32
byte 1 71
byte 1 105
byte 1 103
byte 1 97
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 49
byte 1 50
byte 1 51
byte 1 0
align 1
LABELV $79
byte 1 83
byte 1 99
byte 1 111
byte 1 116
byte 1 116
byte 1 32
byte 1 72
byte 1 97
byte 1 110
byte 1 107
byte 1 101
byte 1 44
byte 1 32
byte 1 82
byte 1 121
byte 1 97
byte 1 110
byte 1 32
byte 1 77
byte 1 99
byte 1 78
byte 1 101
byte 1 105
byte 1 108
byte 1 108
byte 1 44
byte 1 32
byte 1 80
byte 1 101
byte 1 116
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $78
byte 1 77
byte 1 97
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 65
byte 1 110
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $77
byte 1 83
byte 1 104
byte 1 97
byte 1 102
byte 1 101
byte 1 44
byte 1 32
byte 1 88
byte 1 99
byte 1 121
byte 1 84
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $76
byte 1 80
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $75
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 84
byte 1 114
byte 1 101
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $73
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
