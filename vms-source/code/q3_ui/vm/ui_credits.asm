code
proc UI_CreditMenu_Key 0 8
file "../ui_credits.c"
line 27
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
;13:
;14:
;15:typedef struct {
;16:	menuframework_s	menu;
;17:} creditsmenu_t;
;18:
;19:static creditsmenu_t	s_credits;
;20:
;21:
;22:/*
;23:=================
;24:UI_CreditMenu_Key
;25:=================
;26:*/
;27:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 28
;28:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $69
line 29
;29:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $69
line 32
;30:	}
;31:
;32:	trap_Cmd_ExecuteText( EXEC_APPEND, "quit\n" );
CNSTI4 2
ARGI4
ADDRGP4 $71
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 33
;33:	return 0;
CNSTI4 0
RETI4
LABELV $68
endproc UI_CreditMenu_Key 0 8
proc UI_CreditMenu_Draw 4 20
line 42
;34:}
;35:
;36:
;37:/*
;38:===============
;39:UI_CreditMenu_Draw
;40:===============
;41:*/
;42:static void UI_CreditMenu_Draw( void ) {
line 45
;43:	int		y;
;44:
;45:	y = 12;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 46
;46:	UI_DrawProportionalString( 320, y, "The Trepidation Team is:", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $73
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 48
;47:
;48:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 49
;49:	UI_DrawProportionalString( 320, y, "Programming", UI_CENTER|UI_SMALLFONT, color_white );
CNSTI4 320
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $74
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 50
;50:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 51
;51:	UI_DrawProportionalString( 320, y, "Shafe, Xcytng'", UI_CENTER|UI_SMALLFONT, color_white );
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
line 53
;52:
;53:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 54
;54:	UI_DrawProportionalString( 320, y, "Mapping:", UI_CENTER|UI_SMALLFONT, color_white );
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
line 55
;55:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 56
;56:	UI_DrawProportionalString( 320, y, "SkareKrow, RRE Mike, Petee, Gigabyte123", UI_CENTER|UI_SMALLFONT, color_white );
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
line 57
;57:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 58
;58:	UI_DrawProportionalString( 320, y, " ", UI_CENTER|UI_SMALLFONT, color_white );
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
line 60
;59:
;60:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 61
;61:	UI_DrawProportionalString( 320, y, "Models", UI_CENTER|UI_SMALLFONT, color_white );
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
line 62
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
;63:	UI_DrawProportionalString( 320, y, "No One Yet", UI_CENTER|UI_SMALLFONT, color_white );
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
line 65
;64:
;65:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 66
;66:	UI_DrawProportionalString( 320, y, "Drink Of Choice", UI_CENTER|UI_SMALLFONT, color_white );
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
line 67
;67:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 68
;68:	UI_DrawProportionalString( 320, y, "Coffee, Beer, Dr Pepper?", UI_CENTER|UI_SMALLFONT, color_white );
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
line 70
;69:
;70:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 71
;71:	UI_DrawProportionalString( 320, y, "Special Thanks To", UI_CENTER|UI_SMALLFONT, color_white );
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
line 72
;72:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 73
;73:	UI_DrawProportionalString( 320, y, "The Open Arena Project", UI_CENTER|UI_SMALLFONT, color_white );
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
line 75
;74:
;75:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 76
;76:	UI_DrawProportionalString( 320, y, "Testing And Support", UI_CENTER|UI_SMALLFONT, color_white );
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
line 77
;77:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 78
;78:	UI_DrawProportionalString( 320, y, "Blue, Dredge, Prodie", UI_CENTER|UI_SMALLFONT, color_white );
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
line 80
;79:
;80:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 81
;81:	UI_DrawProportionalString( 320, y, "Favorite Colors", UI_CENTER|UI_SMALLFONT, color_white );
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
line 82
;82:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 83
;83:	UI_DrawProportionalString( 320, y, "Blue, Black, Grey?", UI_CENTER|UI_SMALLFONT, color_white );
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
line 85
;84:
;85:	y += 1.42 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1105594941
ADDF4
CVFI4 4
ASGNI4
line 86
;86:	UI_DrawProportionalString( 320, y, "Yet Another Line Of Credit", UI_CENTER|UI_SMALLFONT, color_white );
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
line 87
;87:	y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 88
;88:	UI_DrawProportionalString( 320, y, "Someone Who Cares", UI_CENTER|UI_SMALLFONT, color_white );
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
line 90
;89:
;90:	y += 1.35 * PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1104851763
ADDF4
CVFI4 4
ASGNI4
line 91
;91:	UI_DrawString( 320, y, "Trepidation     trepidation.soourceforge.net     trepidation@sourceforge.net", UI_CENTER|UI_SMALLFONT, color_red );
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
line 92
;92:	y += SMALLCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 93
;93:	UI_DrawString( 320, y, "Trepidation 2006 General Public License.", UI_CENTER|UI_SMALLFONT, color_red );
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
line 94
;94:}
LABELV $72
endproc UI_CreditMenu_Draw 4 20
export UI_CreditMenu
proc UI_CreditMenu 0 12
line 102
;95:
;96:
;97:/*
;98:===============
;99:UI_CreditMenu
;100:===============
;101:*/
;102:void UI_CreditMenu( void ) {
line 103
;103:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 105
;104:
;105:	s_credits.menu.draw = UI_CreditMenu_Draw;
ADDRGP4 s_credits+268
ADDRGP4 UI_CreditMenu_Draw
ASGNP4
line 106
;106:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+272
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 107
;107:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 108
;108:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 109
;109:}
LABELV $93
endproc UI_CreditMenu 0 12
bss
align 4
LABELV s_credits
skip 288
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
byte 1 64
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
LABELV $90
byte 1 83
byte 1 111
byte 1 109
byte 1 101
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 87
byte 1 104
byte 1 111
byte 1 32
byte 1 67
byte 1 97
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 89
byte 1 101
byte 1 116
byte 1 32
byte 1 65
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 79
byte 1 102
byte 1 32
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $88
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 44
byte 1 32
byte 1 66
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 44
byte 1 32
byte 1 71
byte 1 114
byte 1 101
byte 1 121
byte 1 63
byte 1 0
align 1
LABELV $87
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $86
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
byte 1 0
align 1
LABELV $85
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
LABELV $84
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
LABELV $83
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
LABELV $82
byte 1 67
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 101
byte 1 44
byte 1 32
byte 1 66
byte 1 101
byte 1 101
byte 1 114
byte 1 44
byte 1 32
byte 1 68
byte 1 114
byte 1 32
byte 1 80
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 63
byte 1 0
align 1
LABELV $81
byte 1 68
byte 1 114
byte 1 105
byte 1 110
byte 1 107
byte 1 32
byte 1 79
byte 1 102
byte 1 32
byte 1 67
byte 1 104
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 78
byte 1 111
byte 1 32
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 89
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $79
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 32
byte 1 0
align 1
LABELV $77
byte 1 83
byte 1 107
byte 1 97
byte 1 114
byte 1 101
byte 1 75
byte 1 114
byte 1 111
byte 1 119
byte 1 44
byte 1 32
byte 1 82
byte 1 82
byte 1 69
byte 1 32
byte 1 77
byte 1 105
byte 1 107
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 101
byte 1 116
byte 1 101
byte 1 101
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
LABELV $76
byte 1 77
byte 1 97
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $75
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
byte 1 116
byte 1 110
byte 1 103
byte 1 39
byte 1 0
align 1
LABELV $74
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
LABELV $73
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
LABELV $71
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
