code
proc Options_Event 8 0
file "../ui_options.c"
line 47
;1:/*
;2:=======================================================================
;3:
;4:SYSTEM CONFIGURATION MENU
;5:
;6:=======================================================================
;7:*/
;8:
;9:#include "ui_local.h"
;10:
;11://#define ART_FRAMEL			"menu/art/frame2_l"
;12:#define ART_FRAMEL			"menu/art/popespace1"
;13:#define ART_FRAMER			"menu/art/frame1_r"
;14:#define ART_BACK0			"menu/art/back_0"
;15:#define ART_BACK1			"menu/art/back_1"
;16:
;17:#define ID_GRAPHICS			10
;18:#define ID_DISPLAY			11
;19:#define ID_SOUND			12
;20:#define ID_NETWORK			13
;21:#define ID_BACK				14
;22:
;23:#define VERTICAL_SPACING	34
;24:
;25:typedef struct {
;26:	menuframework_s	menu;
;27:
;28:	menutext_s		banner;
;29:	menubitmap_s	framel;
;30:	menubitmap_s	framer;
;31:
;32:	menutext_s		graphics;
;33:	menutext_s		display;
;34:	menutext_s		sound;
;35:	menutext_s		network;
;36:	menubitmap_s	back;
;37:} optionsmenu_t;
;38:
;39:static optionsmenu_t	s_options;
;40:
;41:
;42:/*
;43:=================
;44:Options_Event
;45:=================
;46:*/
;47:static void Options_Event( void* ptr, int event ) {
line 48
;48:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $71
line 49
;49:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 52
;50:	}
;51:
;52:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $81-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $81
address $76
address $77
address $78
address $79
address $80
code
LABELV $76
line 54
;53:	case ID_GRAPHICS:
;54:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 55
;55:		break;
ADDRGP4 $74
JUMPV
LABELV $77
line 58
;56:
;57:	case ID_DISPLAY:
;58:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 59
;59:		break;
ADDRGP4 $74
JUMPV
LABELV $78
line 62
;60:
;61:	case ID_SOUND:
;62:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 63
;63:		break;
ADDRGP4 $74
JUMPV
LABELV $79
line 66
;64:
;65:	case ID_NETWORK:
;66:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 67
;67:		break;
ADDRGP4 $74
JUMPV
LABELV $80
line 70
;68:
;69:	case ID_BACK:
;70:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 71
;71:		break;
LABELV $73
LABELV $74
line 73
;72:	}
;73:}
LABELV $70
endproc Options_Event 8 0
export SystemConfig_Cache
proc SystemConfig_Cache 0 4
line 81
;74:
;75:
;76:/*
;77:===============
;78:SystemConfig_Cache
;79:===============
;80:*/
;81:void SystemConfig_Cache( void ) {
line 82
;82:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $84
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 83
;83:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $85
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 84
;84:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $86
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 85
;85:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $87
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 86
;86:}
LABELV $83
endproc SystemConfig_Cache 0 4
export Options_MenuInit
proc Options_MenuInit 3088 12
line 93
;87:
;88:/*
;89:===============
;90:Options_MenuInit
;91:===============
;92:*/
;93:void Options_MenuInit( void ) {
line 97
;94:	int				y;
;95:	uiClientState_t	cstate;
;96:
;97:	memset( &s_options, 0, sizeof(optionsmenu_t) );
ADDRGP4 s_options
ARGP4
CNSTI4 0
ARGI4
CNSTI4 912
ARGI4
ADDRGP4 memset
CALLP4
pop
line 99
;98:
;99:	SystemConfig_Cache();
ADDRGP4 SystemConfig_Cache
CALLV
pop
line 100
;100:	s_options.menu.wrapAround = qtrue;
ADDRGP4 s_options+276
CNSTI4 1
ASGNI4
line 102
;101:
;102:	trap_GetClientState( &cstate );
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 103
;103:	if ( cstate.connState >= CA_CONNECTED ) {
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $90
line 104
;104:		s_options.menu.fullscreen = qfalse;
ADDRGP4 s_options+280
CNSTI4 0
ASGNI4
line 105
;105:	}
ADDRGP4 $91
JUMPV
LABELV $90
line 106
;106:	else {
line 107
;107:		s_options.menu.fullscreen = qtrue;
ADDRGP4 s_options+280
CNSTI4 1
ASGNI4
line 108
;108:	}
LABELV $91
line 110
;109:
;110:	s_options.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 s_options+288
CNSTI4 10
ASGNI4
line 111
;111:	s_options.banner.generic.flags	= QMF_CENTER_JUSTIFY;
ADDRGP4 s_options+288+44
CNSTU4 8
ASGNU4
line 112
;112:	s_options.banner.generic.x		= 320;
ADDRGP4 s_options+288+12
CNSTI4 320
ASGNI4
line 113
;113:	s_options.banner.generic.y		= 16;
ADDRGP4 s_options+288+16
CNSTI4 16
ASGNI4
line 114
;114:	s_options.banner.string		    = "SYSTEM SETUP";
ADDRGP4 s_options+288+60
ADDRGP4 $103
ASGNP4
line 115
;115:	s_options.banner.color			= color_white;
ADDRGP4 s_options+288+68
ADDRGP4 color_white
ASGNP4
line 116
;116:	s_options.banner.style			= UI_CENTER;
ADDRGP4 s_options+288+64
CNSTI4 1
ASGNI4
line 118
;117:
;118:	s_options.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_options+360
CNSTI4 6
ASGNI4
line 119
;119:	s_options.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_options+360+4
ADDRGP4 $84
ASGNP4
line 120
;120:	s_options.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_options+360+44
CNSTU4 16384
ASGNU4
line 121
;121:	s_options.framel.generic.x	   = 1;  
ADDRGP4 s_options+360+12
CNSTI4 1
ASGNI4
line 122
;122:	s_options.framel.generic.y	   = 1;
ADDRGP4 s_options+360+16
CNSTI4 1
ASGNI4
line 123
;123:	s_options.framel.width  	   = 1024;
ADDRGP4 s_options+360+76
CNSTI4 1024
ASGNI4
line 124
;124:	s_options.framel.height  	   = 768;
ADDRGP4 s_options+360+80
CNSTI4 768
ASGNI4
line 126
;125:
;126:	s_options.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_options+448
CNSTI4 6
ASGNI4
line 127
;127:	s_options.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_options+448+4
ADDRGP4 $85
ASGNP4
line 128
;128:	s_options.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_options+448+44
CNSTU4 16384
ASGNU4
line 129
;129:	s_options.framer.generic.x	   = 376;
ADDRGP4 s_options+448+12
CNSTI4 376
ASGNI4
line 130
;130:	s_options.framer.generic.y	   = 76;
ADDRGP4 s_options+448+16
CNSTI4 76
ASGNI4
line 131
;131:	s_options.framer.width  	   = 256;
ADDRGP4 s_options+448+76
CNSTI4 256
ASGNI4
line 132
;132:	s_options.framer.height  	   = 334;
ADDRGP4 s_options+448+80
CNSTI4 334
ASGNI4
line 134
;133:
;134:	y = 168;
ADDRLP4 0
CNSTI4 168
ASGNI4
line 135
;135:	s_options.graphics.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+536
CNSTI4 9
ASGNI4
line 136
;136:	s_options.graphics.generic.flags	= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+536+44
CNSTU4 264
ASGNU4
line 137
;137:	s_options.graphics.generic.callback	= Options_Event;
ADDRGP4 s_options+536+48
ADDRGP4 Options_Event
ASGNP4
line 138
;138:	s_options.graphics.generic.id		= ID_GRAPHICS;
ADDRGP4 s_options+536+8
CNSTI4 10
ASGNI4
line 139
;139:	s_options.graphics.generic.x		= 320;
ADDRGP4 s_options+536+12
CNSTI4 320
ASGNI4
line 140
;140:	s_options.graphics.generic.y		= y;
ADDRGP4 s_options+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 141
;141:	s_options.graphics.string			= "GRAPHICS";
ADDRGP4 s_options+536+60
ADDRGP4 $147
ASGNP4
line 142
;142:	s_options.graphics.color			= color_red;
ADDRGP4 s_options+536+68
ADDRGP4 color_red
ASGNP4
line 143
;143:	s_options.graphics.style			= UI_CENTER;
ADDRGP4 s_options+536+64
CNSTI4 1
ASGNI4
line 145
;144:
;145:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 146
;146:	s_options.display.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+608
CNSTI4 9
ASGNI4
line 147
;147:	s_options.display.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+608+44
CNSTU4 264
ASGNU4
line 148
;148:	s_options.display.generic.callback	= Options_Event;
ADDRGP4 s_options+608+48
ADDRGP4 Options_Event
ASGNP4
line 149
;149:	s_options.display.generic.id		= ID_DISPLAY;
ADDRGP4 s_options+608+8
CNSTI4 11
ASGNI4
line 150
;150:	s_options.display.generic.x			= 320;
ADDRGP4 s_options+608+12
CNSTI4 320
ASGNI4
line 151
;151:	s_options.display.generic.y			= y;
ADDRGP4 s_options+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 152
;152:	s_options.display.string			= "DISPLAY";
ADDRGP4 s_options+608+60
ADDRGP4 $165
ASGNP4
line 153
;153:	s_options.display.color				= color_red;
ADDRGP4 s_options+608+68
ADDRGP4 color_red
ASGNP4
line 154
;154:	s_options.display.style				= UI_CENTER;
ADDRGP4 s_options+608+64
CNSTI4 1
ASGNI4
line 156
;155:
;156:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 157
;157:	s_options.sound.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+680
CNSTI4 9
ASGNI4
line 158
;158:	s_options.sound.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+680+44
CNSTU4 264
ASGNU4
line 159
;159:	s_options.sound.generic.callback	= Options_Event;
ADDRGP4 s_options+680+48
ADDRGP4 Options_Event
ASGNP4
line 160
;160:	s_options.sound.generic.id			= ID_SOUND;
ADDRGP4 s_options+680+8
CNSTI4 12
ASGNI4
line 161
;161:	s_options.sound.generic.x			= 320;
ADDRGP4 s_options+680+12
CNSTI4 320
ASGNI4
line 162
;162:	s_options.sound.generic.y			= y;
ADDRGP4 s_options+680+16
ADDRLP4 0
INDIRI4
ASGNI4
line 163
;163:	s_options.sound.string				= "SOUND";
ADDRGP4 s_options+680+60
ADDRGP4 $183
ASGNP4
line 164
;164:	s_options.sound.color				= color_red;
ADDRGP4 s_options+680+68
ADDRGP4 color_red
ASGNP4
line 165
;165:	s_options.sound.style				= UI_CENTER;
ADDRGP4 s_options+680+64
CNSTI4 1
ASGNI4
line 167
;166:
;167:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 168
;168:	s_options.network.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_options+752
CNSTI4 9
ASGNI4
line 169
;169:	s_options.network.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+752+44
CNSTU4 264
ASGNU4
line 170
;170:	s_options.network.generic.callback	= Options_Event;
ADDRGP4 s_options+752+48
ADDRGP4 Options_Event
ASGNP4
line 171
;171:	s_options.network.generic.id		= ID_NETWORK;
ADDRGP4 s_options+752+8
CNSTI4 13
ASGNI4
line 172
;172:	s_options.network.generic.x			= 320;
ADDRGP4 s_options+752+12
CNSTI4 320
ASGNI4
line 173
;173:	s_options.network.generic.y			= y;
ADDRGP4 s_options+752+16
ADDRLP4 0
INDIRI4
ASGNI4
line 174
;174:	s_options.network.string			= "NETWORK";
ADDRGP4 s_options+752+60
ADDRGP4 $201
ASGNP4
line 175
;175:	s_options.network.color				= color_red;
ADDRGP4 s_options+752+68
ADDRGP4 color_red
ASGNP4
line 176
;176:	s_options.network.style				= UI_CENTER;
ADDRGP4 s_options+752+64
CNSTI4 1
ASGNI4
line 178
;177:
;178:	s_options.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_options+824
CNSTI4 6
ASGNI4
line 179
;179:	s_options.back.generic.name     = ART_BACK0;
ADDRGP4 s_options+824+4
ADDRGP4 $86
ASGNP4
line 180
;180:	s_options.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_options+824+44
CNSTU4 260
ASGNU4
line 181
;181:	s_options.back.generic.callback = Options_Event;
ADDRGP4 s_options+824+48
ADDRGP4 Options_Event
ASGNP4
line 182
;182:	s_options.back.generic.id	    = ID_BACK;
ADDRGP4 s_options+824+8
CNSTI4 14
ASGNI4
line 183
;183:	s_options.back.generic.x		= 0;
ADDRGP4 s_options+824+12
CNSTI4 0
ASGNI4
line 184
;184:	s_options.back.generic.y		= 480-64;
ADDRGP4 s_options+824+16
CNSTI4 416
ASGNI4
line 185
;185:	s_options.back.width  		    = 128;
ADDRGP4 s_options+824+76
CNSTI4 128
ASGNI4
line 186
;186:	s_options.back.height  		    = 64;
ADDRGP4 s_options+824+80
CNSTI4 64
ASGNI4
line 187
;187:	s_options.back.focuspic         = ART_BACK1;
ADDRGP4 s_options+824+60
ADDRGP4 $87
ASGNP4
line 189
;188:
;189:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.framel );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 191
;190:	
;191:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.banner );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 194
;192:	//Menu_AddItem( &s_options.menu, ( void * ) &s_options.framer );
;193:	
;194:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.graphics );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 195
;195:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.display );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 196
;196:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.sound );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 197
;197:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.network );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+752
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 198
;198:	Menu_AddItem( &s_options.menu, ( void * ) &s_options.back );
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 199
;199:}
LABELV $88
endproc Options_MenuInit 3088 12
export UI_SystemConfigMenu
proc UI_SystemConfigMenu 0 4
line 207
;200:
;201:
;202:/*
;203:===============
;204:UI_SystemConfigMenu
;205:===============
;206:*/
;207:void UI_SystemConfigMenu( void ) {
line 208
;208:	Options_MenuInit();
ADDRGP4 Options_MenuInit
CALLV
pop
line 209
;209:	UI_PushMenu ( &s_options.menu );
ADDRGP4 s_options
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 210
;210:}
LABELV $232
endproc UI_SystemConfigMenu 0 4
bss
align 4
LABELV s_options
skip 912
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
import UI_DynamicCommandMenu_f
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
import UI_OfflineMenu
import UI_OfflineMenu_Cache
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicCommandMenu
import UI_DynamicMenu
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
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
import irandom
import flrandom
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
LABELV $201
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $183
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $165
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $147
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $103
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $87
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $86
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $85
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $84
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 111
byte 1 112
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 49
byte 1 0
