export CG_DrawScanner
code
proc CG_DrawScanner 104 20
file "../cg_scanner.c"
line 12
;1:#include "cg_local.h"
;2:
;3:#define kSCANNER_UNIT 24
;4:#define kSCANNER_RANGE 100
;5:    
;6:/*
;7:=================
;8:CG_DrawScanner
;9:=================
;10:*/
;11:void CG_DrawScanner( void ) 
;12:{
line 23
;13:        int x,y;
;14:        int w,h;
;15:        int sx,sy;
;16:        vec3_t v, norm, dp;
;17:        float len;
;18:        float height;
;19:        playerpos_t *player;
;20:        centity_t *scanner;
;21:
;22:		// Dont draw anything in these game types
;23:		if ((cgs.g_GameMode == 1) || (cgs.g_GameMode == 2)) 
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 1
EQI4 $77
ADDRGP4 cgs+155536
INDIRI4
CNSTI4 2
NEI4 $73
LABELV $77
line 24
;24:		{
line 25
;25:			return;
ADDRGP4 $72
JUMPV
LABELV $73
line 29
;26:		}
;27:
;28:        //dont draw anything if the scanner is off
;29:        if(cg.scanner == 0)
ADDRGP4 cg+157964
INDIRI4
CNSTI4 0
NEI4 $78
line 30
;30:            return;
ADDRGP4 $72
JUMPV
LABELV $78
line 33
;31:
;32:
;33:        w = 100; //width of scanner on screen
ADDRLP4 36
CNSTI4 100
ASGNI4
line 34
;34:        h = w; //height of scanner on screen
ADDRLP4 72
ADDRLP4 36
INDIRI4
ASGNI4
line 35
;35:        x = 5; //(SCREEN_WIDTH - w) - 48; //offset from left of screen
ADDRLP4 64
CNSTI4 5
ASGNI4
line 36
;36:        y = 35; //(SCREEN_HEIGHT - h) - 400; //offset from top of scren
ADDRLP4 68
CNSTI4 35
ASGNI4
line 40
;37:
;38:
;39:        //draw the scanner
;40:        CG_DrawPic( x, y, w, h, cgs.media.scannerShader);
ADDRLP4 64
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 72
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+154388+1116
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 43
;41:
;42:        //get info about the scanner positon
;43:        scanner = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 28
CNSTI4 740
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 46
;44:
;45:        //check the stored player positions
;46:        player = cg_playerOrigins;
ADDRLP4 12
ADDRGP4 cg_playerOrigins
ASGNP4
ADDRGP4 $85
JUMPV
LABELV $84
line 48
;47:        while(player->valid != kENTRY_EOL)
;48:        {
line 50
;49:            //get a vector from the scanner position to the current player
;50:            VectorSubtract (scanner->lerpOrigin, player->pos, v);
ADDRLP4 0
ADDRLP4 28
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 28
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
SUBF4
ASGNF4
line 53
;51:
;52:            //store the height component
;53:            height = v[2];
ADDRLP4 52
ADDRLP4 0+8
INDIRF4
ASGNF4
line 56
;54:
;55:            //remove the height component from the vector
;56:            v[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 59
;57:
;58:            //calc the distance to the player and scale it to the scanner scale
;59:            len = VectorLength( v ) / kSCANNER_UNIT;
ADDRLP4 0
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 84
INDIRF4
CNSTF4 1103101952
DIVF4
ASGNF4
line 62
;60:
;61:            //is the player within range?
;62:            if(len < kSCANNER_RANGE)
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $91
line 63
;63:            {
line 65
;64:                //create a vector pointing stright down
;65:                norm[0] = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 66
;66:                norm[1] = 0;
ADDRLP4 40+4
CNSTF4 0
ASGNF4
line 67
;67:                norm[2] = -1;
ADDRLP4 40+8
CNSTF4 3212836864
ASGNF4
line 70
;68:
;69:                //normalise the vector to the player
;70:                VectorNormalize( v );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 73
;71:
;72:                //rotate the player about the scanners view angle
;73:                RotatePointAroundVector( dp, norm, v, scanner->lerpAngles[1]);
ADDRLP4 16
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 732
ADDP4
INDIRF4
ARGF4
ADDRGP4 RotatePointAroundVector
CALLV
pop
line 76
;74:
;75:                //scale to fit current size of scanner
;76:                VectorScale(dp,len*(w/2)/kSCANNER_RANGE,dp);
ADDRLP4 88
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
MULF4
ASGNF4
line 79
;77:
;78:                // calc screen (x,y) (-4 = half dot width, so we can centre the graphic)
;79:                sx = (x + (w/2) + dp[1]) - 4;
ADDRLP4 56
ADDRLP4 64
INDIRI4
ADDRLP4 36
INDIRI4
CNSTI4 2
DIVI4
ADDI4
CVIF4 4
ADDRLP4 16+4
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
CVFI4 4
ASGNI4
line 80
;80:                sy = (y + (h/2) + dp[0]) - 4;
ADDRLP4 60
ADDRLP4 68
INDIRI4
ADDRLP4 72
INDIRI4
CNSTI4 2
DIVI4
ADDI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
CVFI4 4
ASGNI4
line 83
;81:
;82:                //draw the dot
;83:                if (height < -32) //player is above scanner
ADDRLP4 52
INDIRF4
CNSTF4 3254779904
GEF4 $100
line 84
;84:                    CG_DrawPic( sx, sy, 8, 8, cgs.media.scannerBlipUpShader);
ADDRLP4 56
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 92
CNSTF4 1090519040
ASGNF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRGP4 cgs+154388+1124
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
ADDRGP4 $101
JUMPV
LABELV $100
line 85
;85:                else if (height > 32) //player is below scanner
ADDRLP4 52
INDIRF4
CNSTF4 1107296256
LEF4 $104
line 86
;86:                    CG_DrawPic( sx, sy, 8, 8, cgs.media.scannerBlipDownShader);
ADDRLP4 56
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 96
CNSTF4 1090519040
ASGNF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRLP4 96
INDIRF4
ARGF4
ADDRGP4 cgs+154388+1128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
ADDRGP4 $105
JUMPV
LABELV $104
line 88
;87:                else
;88:                    CG_DrawPic( sx, sy, 8, 8, cgs.media.scannerBlipShader);
ADDRLP4 56
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 60
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 100
CNSTF4 1090519040
ASGNF4
ADDRLP4 100
INDIRF4
ARGF4
ADDRLP4 100
INDIRF4
ARGF4
ADDRGP4 cgs+154388+1120
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
LABELV $105
LABELV $101
line 89
;89:            }
LABELV $91
line 92
;90:            
;91:            //move on to next entry in the array
;92:            player++;
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 93
;93:        }
LABELV $85
line 47
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $84
line 95
;94:   
;95:}
LABELV $72
endproc CG_DrawScanner 104 20
import CG_ScannerOff_f
import CG_ScannerOn_f
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_PlayerSprites
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayerHeadshot
import CG_BreakGlass
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_ShotgunTrail
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon2
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ResetZoom
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_AddBoundingBox
import CG_PredictWeaponEffects
import cg_playerOrigins
import cg_CurrentRound
import cg_RedMC
import cg_BlueMC
import cg_GameMode
import cg_plOut
import cg_latentCmds
import cg_latentSnaps
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_drawBBox
import cg_debugDelag
import cg_delag
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
import BG_FindItemForAmmo
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
