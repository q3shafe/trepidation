data
align 4
LABELV MonthAbbrev
address $89
address $90
address $91
address $92
address $93
address $94
address $95
address $96
address $97
address $98
address $99
address $100
align 4
LABELV skillLevels
address $101
address $102
address $103
address $104
address $105
lit
align 4
LABELV numSkillLevels
byte 4 5
data
align 4
LABELV netSources
address $106
address $107
address $108
address $109
lit
align 4
LABELV numNetSources
byte 4 4
align 4
LABELV serverFilters
address $110
address $111
address $112
address $111
address $113
address $114
address $115
address $116
address $117
address $118
address $119
address $120
address $121
address $122
data
align 4
LABELV teamArenaGameTypes
address $123
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
lit
align 4
LABELV numTeamArenaGameTypes
byte 4 9
data
align 4
LABELV teamArenaGameNames
address $132
address $133
address $134
address $135
address $136
address $137
address $138
address $139
address $140
lit
align 4
LABELV numTeamArenaGameNames
byte 4 9
align 4
LABELV numServerFilters
byte 4 7
data
align 4
LABELV sortKeys
address $141
address $142
address $143
address $144
address $145
lit
align 4
LABELV numSortKeys
byte 4 5
data
align 4
LABELV netnames
address $146
address $147
address $148
byte 4 0
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
export vmMain
code
proc vmMain 12 8
file "../ui_main.c"
line 148
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
;7:
;8:=======================================================================
;9:*/
;10:
;11:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;12://#define PRE_RELEASE_TADEMO
;13:
;14:#include "ui_local.h"
;15:
;16:uiInfo_t uiInfo;
;17:
;18:static const char *MonthAbbrev[] = {
;19:	"Jan","Feb","Mar",
;20:	"Apr","May","Jun",
;21:	"Jul","Aug","Sep",
;22:	"Oct","Nov","Dec"
;23:};
;24:
;25:
;26:static const char *skillLevels[] = {
;27:  "I Can Win",
;28:  "Bring It On",
;29:  "Hurt Me Plenty",
;30:  "Hardcore",
;31:  "Nightmare"
;32:};
;33:
;34:static const int numSkillLevels = sizeof(skillLevels) / sizeof(const char*);
;35:
;36:
;37:static const char *netSources[] = {
;38:	"Local",
;39:	"Mplayer",
;40:	"Internet",
;41:	"Favorites"
;42:};
;43:static const int numNetSources = sizeof(netSources) / sizeof(const char*);
;44:
;45:static const serverFilter_t serverFilters[] = {
;46:	{"All", "" },
;47:	{"Quake 3 Arena", "" },
;48:	{"Team Arena", "missionpack" },
;49:	{"Rocket Arena", "arena" },
;50:	{"Alliance", "alliance20" },
;51:	{"Weapons Factory Arena", "wfa" },
;52:	{"OSP", "osp" },
;53:};
;54:
;55:static const char *teamArenaGameTypes[] = {
;56:	"FFA",
;57:	"TOURNAMENT",
;58:	"SP",
;59:	"TEAM DM",
;60:	"CTF",
;61:	"1FCTF",
;62:	"OVERLOAD",
;63:	"HARVESTER",
;64:	"TEAMTOURNAMENT"
;65:};
;66:
;67:static int const numTeamArenaGameTypes = sizeof(teamArenaGameTypes) / sizeof(const char*);
;68:
;69:
;70:static const char *teamArenaGameNames[] = {
;71:	"Free For All",
;72:	"Tournament",
;73:	"Single Player",
;74:	"Team Deathmatch",
;75:	"Capture the Flag",
;76:	"One Flag CTF",
;77:	"Overload",
;78:	"Harvester",
;79:	"Team Tournament",
;80:};
;81:
;82:static int const numTeamArenaGameNames = sizeof(teamArenaGameNames) / sizeof(const char*);
;83:
;84:
;85:static const int numServerFilters = sizeof(serverFilters) / sizeof(serverFilter_t);
;86:
;87:static const char *sortKeys[] = {
;88:	"Server Name",
;89:	"Map Name",
;90:	"Open Player Spots",
;91:	"Game Type",
;92:	"Ping Time"
;93:};
;94:static const int numSortKeys = sizeof(sortKeys) / sizeof(const char*);
;95:
;96:static char* netnames[] = {
;97:	"???",
;98:	"UDP",
;99:	"IPX",
;100:	NULL
;101:};
;102:
;103:#ifndef MISSIONPACK // bk001206
;104:static char quake3worldMessage[] = "Visit www.quake3world.com - News, Community, Events, Files";
;105:#endif
;106:
;107:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;108:static int uitogamecode[] = {4,6,2,3,1,5,7};
;109:
;110:
;111:static void UI_StartServerRefresh(qboolean full);
;112:static void UI_StopServerRefresh( void );
;113:static void UI_DoServerRefresh( void );
;114:static void UI_FeederSelection(float feederID, int index);
;115:static void UI_BuildServerDisplayList(qboolean force);
;116:static void UI_BuildServerStatus(qboolean force);
;117:static void UI_BuildFindPlayerList(qboolean force);
;118:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 );
;119:static int UI_MapCountByGameType(qboolean singlePlayer);
;120:static int UI_HeadCountByTeam( void );
;121:static void UI_ParseGameInfo(const char *teamFile);
;122:static void UI_ParseTeamInfo(const char *teamFile);
;123:static const char *UI_SelectedMap(int index, int *actual);
;124:static const char *UI_SelectedHead(int index, int *actual);
;125:static int UI_GetIndexFromSelection(int actual);
;126:
;127:int ProcessNewUI( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6 );
;128:
;129:/*
;130:================
;131:vmMain
;132:
;133:This is the only way control passes into the module.
;134:This must be the very first function compiled into the .qvm file
;135:================
;136:*/
;137:vmCvar_t  ui_new;
;138:vmCvar_t  ui_debug;
;139:vmCvar_t  ui_initialized;
;140:vmCvar_t  ui_teamArenaFirstRun;
;141:
;142:void _UI_Init( qboolean );
;143:void _UI_Shutdown( void );
;144:void _UI_KeyEvent( int key, qboolean down );
;145:void _UI_MouseEvent( int dx, int dy );
;146:void _UI_Refresh( int realtime );
;147:qboolean _UI_IsFullscreen( void );
;148:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 149
;149:  switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $150
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $163
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $163
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
address $161
address $162
code
LABELV $152
line 151
;150:	  case UI_GETAPIVERSION:
;151:		  return UI_API_VERSION;
CNSTI4 6
RETI4
ADDRGP4 $149
JUMPV
LABELV $153
line 154
;152:
;153:	  case UI_INIT:
;154:		  _UI_Init(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Init
CALLV
pop
line 155
;155:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $154
line 158
;156:
;157:	  case UI_SHUTDOWN:
;158:		  _UI_Shutdown();
ADDRGP4 _UI_Shutdown
CALLV
pop
line 159
;159:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $155
line 162
;160:
;161:	  case UI_KEY_EVENT:
;162:		  _UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_KeyEvent
CALLV
pop
line 163
;163:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $156
line 166
;164:
;165:	  case UI_MOUSE_EVENT:
;166:		  _UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_MouseEvent
CALLV
pop
line 167
;167:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $157
line 170
;168:
;169:	  case UI_REFRESH:
;170:		  _UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Refresh
CALLV
pop
line 171
;171:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $158
line 174
;172:
;173:	  case UI_IS_FULLSCREEN:
;174:		  return _UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 _UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $149
JUMPV
LABELV $159
line 177
;175:
;176:	  case UI_SET_ACTIVE_MENU:
;177:		  _UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 178
;178:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $160
line 181
;179:
;180:	  case UI_CONSOLE_COMMAND:
;181:		  return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $149
JUMPV
LABELV $161
line 184
;182:
;183:	  case UI_DRAW_CONNECT_SCREEN:
;184:		  UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 185
;185:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $162
line 187
;186:	  case UI_HASUNIQUECDKEY: // mod authors need to observe this  // Shafe - Trep - Done
;187:	    return qfalse; // bk010117 - change this to qfalse for mods!
CNSTI4 0
RETI4
ADDRGP4 $149
JUMPV
LABELV $150
line 191
;188:
;189:	}
;190:
;191:	return -1;
CNSTI4 -1
RETI4
LABELV $149
endproc vmMain 12 8
export AssetCache
proc AssetCache 84 8
line 196
;192:}
;193:
;194:
;195:
;196:void AssetCache() {
line 202
;197:	int n;
;198:	//if (Assets.textFont == NULL) {
;199:	//}
;200:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;201:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;202:	uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $167
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61660
ADDRLP4 4
INDIRI4
ASGNI4
line 203
;203:	uiInfo.uiDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $170
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61768
ADDRLP4 8
INDIRI4
ASGNI4
line 204
;204:	uiInfo.uiDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $173
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772
ADDRLP4 12
INDIRI4
ASGNI4
line 205
;205:	uiInfo.uiDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $177
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+4
ADDRLP4 16
INDIRI4
ASGNI4
line 206
;206:	uiInfo.uiDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $181
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+8
ADDRLP4 20
INDIRI4
ASGNI4
line 207
;207:	uiInfo.uiDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $185
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+12
ADDRLP4 24
INDIRI4
ASGNI4
line 208
;208:	uiInfo.uiDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $189
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+16
ADDRLP4 28
INDIRI4
ASGNI4
line 209
;209:	uiInfo.uiDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $193
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+20
ADDRLP4 32
INDIRI4
ASGNI4
line 210
;210:	uiInfo.uiDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $197
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+24
ADDRLP4 36
INDIRI4
ASGNI4
line 211
;211:	uiInfo.uiDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $200
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61680
ADDRLP4 40
INDIRI4
ASGNI4
line 212
;212:	uiInfo.uiDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $203
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61668
ADDRLP4 44
INDIRI4
ASGNI4
line 213
;213:	uiInfo.uiDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $206
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61664
ADDRLP4 48
INDIRI4
ASGNI4
line 214
;214:	uiInfo.uiDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $209
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61672
ADDRLP4 52
INDIRI4
ASGNI4
line 215
;215:	uiInfo.uiDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $212
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61676
ADDRLP4 56
INDIRI4
ASGNI4
line 216
;216:	uiInfo.uiDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $215
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61684
ADDRLP4 60
INDIRI4
ASGNI4
line 217
;217:	uiInfo.uiDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $218
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61700
ADDRLP4 64
INDIRI4
ASGNI4
line 218
;218:	uiInfo.uiDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $221
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61704
ADDRLP4 68
INDIRI4
ASGNI4
line 220
;219:
;220:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $222
line 221
;221:		uiInfo.uiDC.Assets.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $228
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+228+61800
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 222
;222:	}
LABELV $223
line 220
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $222
line 224
;223:
;224:	uiInfo.newHighScoreSound = trap_S_RegisterSound("sound/feedback/voc_newhighscore.wav", qfalse);
ADDRGP4 $230
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+119484
ADDRLP4 72
INDIRI4
ASGNI4
line 225
;225:}
LABELV $164
endproc AssetCache 84 8
export _UI_DrawSides
proc _UI_DrawSides 12 36
line 227
;226:
;227:void _UI_DrawSides(float x, float y, float w, float h, float size) {
line 228
;228:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 229
;229:	size *= uiInfo.uiDC.xscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+200
INDIRF4
MULF4
ASGNF4
line 230
;230:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 231
;231:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 232
;232:}
LABELV $231
endproc _UI_DrawSides 12 36
export _UI_DrawTopBottom
proc _UI_DrawTopBottom 12 36
line 234
;233:
;234:void _UI_DrawTopBottom(float x, float y, float w, float h, float size) {
line 235
;235:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 236
;236:	size *= uiInfo.uiDC.yscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+196
INDIRF4
MULF4
ASGNF4
line 237
;237:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 238
;238:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 239
;239:}
LABELV $235
endproc _UI_DrawTopBottom 12 36
export _UI_DrawRect
proc _UI_DrawRect 0 20
line 247
;240:/*
;241:================
;242:UI_DrawRect
;243:
;244:Coordinates are 640*480 virtual values
;245:=================
;246:*/
;247:void _UI_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 248
;248:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 250
;249:
;250:  _UI_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 _UI_DrawTopBottom
CALLV
pop
line 251
;251:  _UI_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 _UI_DrawSides
CALLV
pop
line 253
;252:
;253:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 254
;254:}
LABELV $239
endproc _UI_DrawRect 0 20
export Text_Width
proc Text_Width 48 4
line 256
;255:
;256:int Text_Width(const char *text, float scale, int limit) {
line 261
;257:  int count,len;
;258:	float out;
;259:	glyphInfo_t *glyph;
;260:	float useScale;
;261:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 262
;262:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+12
ASGNP4
line 263
;263:	if (scale <= ui_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $243
line 264
;264:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+20560
ASGNP4
line 265
;265:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $244
JUMPV
LABELV $243
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $248
line 266
;266:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+41108
ASGNP4
line 267
;267:	}
LABELV $248
LABELV $244
line 268
;268:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 269
;269:  out = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 270
;270:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $253
line 271
;271:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 272
;272:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $255
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $255
line 273
;273:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 274
;274:		}
LABELV $255
line 275
;275:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $258
JUMPV
LABELV $257
line 276
;276:		while (s && *s && count < len) {
line 277
;277:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $260
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $260
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $260
line 278
;278:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 279
;279:				continue;
ADDRGP4 $258
JUMPV
LABELV $260
line 280
;280:			} else {
line 281
;281:				glyph = &font->glyphs[(int)*s];
ADDRLP4 16
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ASGNP4
line 282
;282:				out += glyph->xSkip;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 283
;283:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 284
;284:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 285
;285:			}
line 286
;286:    }
LABELV $258
line 276
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $263
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $263
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $257
LABELV $263
line 287
;287:  }
LABELV $253
line 288
;288:  return out * useScale;
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $240
endproc Text_Width 48 4
export Text_Height
proc Text_Height 48 4
line 291
;289:}
;290:
;291:int Text_Height(const char *text, float scale, int limit) {
line 296
;292:  int len, count;
;293:	float max;
;294:	glyphInfo_t *glyph;
;295:	float useScale;
;296:	const char *s = text; // bk001206 - unsigned
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 297
;297:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+12
ASGNP4
line 298
;298:	if (scale <= ui_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $267
line 299
;299:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+20560
ASGNP4
line 300
;300:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $268
JUMPV
LABELV $267
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $272
line 301
;301:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+41108
ASGNP4
line 302
;302:	}
LABELV $272
LABELV $268
line 303
;303:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 304
;304:  max = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 305
;305:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $277
line 306
;306:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 307
;307:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $279
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $279
line 308
;308:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 309
;309:		}
LABELV $279
line 310
;310:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
line 311
;311:		while (s && *s && count < len) {
line 312
;312:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $284
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $284
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $284
line 313
;313:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 314
;314:				continue;
ADDRGP4 $282
JUMPV
LABELV $284
line 315
;315:			} else {
line 316
;316:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 12
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 317
;317:	      if (max < glyph->height) {
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
GEF4 $286
line 318
;318:		      max = glyph->height;
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 319
;319:			  }
LABELV $286
line 320
;320:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 321
;321:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 322
;322:			}
line 323
;323:    }
LABELV $282
line 311
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $289
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $281
LABELV $289
line 324
;324:  }
LABELV $277
line 325
;325:  return max * useScale;
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $264
endproc Text_Height 48 4
export Text_PaintChar
proc Text_PaintChar 8 36
line 328
;326:}
;327:
;328:void Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
line 330
;329:  float w, h;
;330:  w = width * scale;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 331
;331:  h = height * scale;
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 332
;332:  UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 333
;333:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRF4
ARGF4
ADDRFP4 32
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 334
;334:}
LABELV $290
endproc Text_PaintChar 8 36
export Text_Paint
proc Text_Paint 84 40
line 336
;335:
;336:void Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
line 341
;337:  int len, count;
;338:	vec4_t newColor;
;339:	glyphInfo_t *glyph;
;340:	float useScale;
;341:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+12
ASGNP4
line 342
;342:	if (scale <= ui_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $294
line 343
;343:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+20560
ASGNP4
line 344
;344:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $295
JUMPV
LABELV $294
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $299
line 345
;345:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+41108
ASGNP4
line 346
;346:	}
LABELV $299
LABELV $295
line 347
;347:	useScale = scale * font->glyphScale;
ADDRLP4 20
ADDRFP4 8
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 348
;348:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $304
line 349
;349:    const char *s = text; // bk001206 - unsigned
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 350
;350:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 351
;351:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 352
;352:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 353
;353:		if (limit > 0 && len > limit) {
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $306
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $306
line 354
;354:			len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 355
;355:		}
LABELV $306
line 356
;356:		count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $308
line 357
;357:		while (s && *s && count < len) {
line 358
;358:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 361
;359:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;360:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;361:			if ( Q_IsColorString( s ) ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
ADDRLP4 52
CNSTI4 94
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
NEI4 $311
ADDRLP4 56
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $311
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $311
line 362
;362:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 363
;363:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 364
;364:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 365
;365:				s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 366
;366:				continue;
ADDRGP4 $309
JUMPV
LABELV $311
line 367
;367:			} else {
line 368
;368:				float yadj = useScale * glyph->top;
ADDRLP4 60
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 369
;369:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
ADDRLP4 64
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $316
ADDRLP4 64
INDIRI4
CNSTI4 6
NEI4 $314
LABELV $316
line 370
;370:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $318
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $319
JUMPV
LABELV $318
ADDRLP4 72
CNSTI4 2
ASGNI4
LABELV $319
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 371
;371:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 372
;372:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 373
;373:					Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 76
ADDRLP4 68
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 382
;374:														glyph->imageWidth,
;375:														glyph->imageHeight,
;376:														useScale, 
;377:														glyph->s,
;378:														glyph->t,
;379:														glyph->s2,
;380:														glyph->t2,
;381:														glyph->glyph);
;382:					trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 383
;383:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 384
;384:				}
LABELV $314
line 385
;385:				Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 395
;386:													glyph->imageWidth,
;387:													glyph->imageHeight,
;388:													useScale, 
;389:													glyph->s,
;390:													glyph->t,
;391:													glyph->s2,
;392:													glyph->t2,
;393:													glyph->glyph);
;394:
;395:				x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
ADDRFP4 20
INDIRF4
ADDF4
ADDF4
ASGNF4
line 396
;396:				s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 397
;397:				count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 398
;398:			}
line 399
;399:    }
LABELV $309
line 357
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $324
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $324
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $308
LABELV $324
line 400
;400:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 401
;401:  }
LABELV $304
line 402
;402:}
LABELV $291
endproc Text_Paint 84 40
export Text_PaintWithCursor
proc Text_PaintWithCursor 88 40
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 404
;403:
;404:void Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
line 410
;405:  int len, count;
;406:	vec4_t newColor;
;407:	glyphInfo_t *glyph, *glyph2;
;408:	float yadj;
;409:	float useScale;
;410:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+12
ASGNP4
line 411
;411:	if (scale <= ui_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $328
line 412
;412:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+20560
ASGNP4
line 413
;413:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $329
JUMPV
LABELV $328
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $333
line 414
;414:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+41108
ASGNP4
line 415
;415:	}
LABELV $333
LABELV $329
line 416
;416:	useScale = scale * font->glyphScale;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 417
;417:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $338
line 418
;418:    const char *s = text; // bk001206 - unsigned
ADDRLP4 44
ADDRFP4 16
INDIRP4
ASGNP4
line 419
;419:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 420
;420:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 421
;421:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 48
INDIRI4
ASGNI4
line 422
;422:		if (limit > 0 && len > limit) {
ADDRLP4 52
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LEI4 $340
ADDRLP4 40
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $340
line 423
;423:			len = limit;
ADDRLP4 40
ADDRFP4 28
INDIRI4
ASGNI4
line 424
;424:		}
LABELV $340
line 425
;425:		count = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 426
;426:		glyph2 = &font->glyphs[ (int) cursor]; // bk001206 - possible signed char
ADDRLP4 8
CNSTI4 80
ADDRFP4 24
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $343
JUMPV
LABELV $342
line 427
;427:		while (s && *s && count < len) {
line 428
;428:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 431
;429:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;430:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;431:			if ( Q_IsColorString( s ) ) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 60
CNSTI4 94
ASGNI4
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $345
ADDRLP4 64
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $345
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $345
line 432
;432:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 12
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 433
;433:				newColor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 434
;434:				trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 435
;435:				s += 2;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 436
;436:				continue;
ADDRGP4 $343
JUMPV
LABELV $345
line 437
;437:			} else {
line 438
;438:				yadj = useScale * glyph->top;
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 439
;439:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
ADDRLP4 68
ADDRFP4 32
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 3
EQI4 $350
ADDRLP4 68
INDIRI4
CNSTI4 6
NEI4 $348
LABELV $350
line 440
;440:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 32
INDIRI4
CNSTI4 3
NEI4 $352
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $353
JUMPV
LABELV $352
ADDRLP4 76
CNSTI4 2
ASGNI4
LABELV $353
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 441
;441:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 12+12
INDIRF4
ASGNF4
line 442
;442:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 443
;443:					Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 80
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 452
;444:														glyph->imageWidth,
;445:														glyph->imageHeight,
;446:														useScale, 
;447:														glyph->s,
;448:														glyph->t,
;449:														glyph->s2,
;450:														glyph->t2,
;451:														glyph->glyph);
;452:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 453
;453:					trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 454
;454:				}
LABELV $348
line 455
;455:				Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 465
;456:													glyph->imageWidth,
;457:													glyph->imageHeight,
;458:													useScale, 
;459:													glyph->s,
;460:													glyph->t,
;461:													glyph->s2,
;462:													glyph->t2,
;463:													glyph->glyph);
;464:
;465:	      yadj = useScale * glyph2->top;
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 466
;466:		    if (count == cursorPos && !((uiInfo.uiDC.realTime/BLINK_DIVISOR) & 1)) {
ADDRLP4 28
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $357
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $357
line 467
;467:					Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 476
;468:														glyph2->imageWidth,
;469:														glyph2->imageHeight,
;470:														useScale, 
;471:														glyph2->s,
;472:														glyph2->t,
;473:														glyph2->s2,
;474:														glyph2->t2,
;475:														glyph2->glyph);
;476:				}
LABELV $357
line 478
;477:
;478:				x += (glyph->xSkip * useScale);
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 479
;479:				s++;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 480
;480:				count++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 481
;481:			}
line 482
;482:    }
LABELV $343
line 427
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $361
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $361
ADDRLP4 28
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $342
LABELV $361
line 484
;483:    // need to paint cursor at end of text
;484:    if (cursorPos == len && !((uiInfo.uiDC.realTime/BLINK_DIVISOR) & 1)) {
ADDRFP4 20
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $362
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $362
line 485
;485:        yadj = useScale * glyph2->top;
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 486
;486:        Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 496
;487:                          glyph2->imageWidth,
;488:                          glyph2->imageHeight,
;489:                          useScale, 
;490:                          glyph2->s,
;491:                          glyph2->t,
;492:                          glyph2->s2,
;493:                          glyph2->t2,
;494:                          glyph2->glyph);
;495:
;496:    }
LABELV $362
line 498
;497:
;498:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 499
;499:  }
LABELV $338
line 500
;500:}
LABELV $325
endproc Text_PaintWithCursor 88 40
proc Text_Paint_Limit 76 40
line 503
;501:
;502:
;503:static void Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit) {
line 507
;504:  int len, count;
;505:	vec4_t newColor;
;506:	glyphInfo_t *glyph;
;507:  if (text) {
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $366
line 508
;508:    const char *s = text; // bk001206 - unsigned
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
line 509
;509:		float max = *maxX;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 511
;510:		float useScale;
;511:		fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+12
ASGNP4
line 512
;512:		if (scale <= ui_smallFont.value) {
ADDRFP4 12
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $370
line 513
;513:			font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+20560
ASGNP4
line 514
;514:		} else if (scale > ui_bigFont.value) {
ADDRGP4 $371
JUMPV
LABELV $370
ADDRFP4 12
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LEF4 $375
line 515
;515:			font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+41108
ASGNP4
line 516
;516:		}
LABELV $375
LABELV $371
line 517
;517:		useScale = scale * font->glyphScale;
ADDRLP4 32
ADDRFP4 12
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 518
;518:		trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 519
;519:    len = strlen(text);					 
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 520
;520:		if (limit > 0 && len > limit) {
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $380
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $380
line 521
;521:			len = limit;
ADDRLP4 24
ADDRFP4 28
INDIRI4
ASGNI4
line 522
;522:		}
LABELV $380
line 523
;523:		count = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $383
JUMPV
LABELV $382
line 524
;524:		while (s && *s && count < len) {
line 525
;525:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 526
;526:			if ( Q_IsColorString( s ) ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
ADDRLP4 56
CNSTI4 94
ASGNI4
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $385
ADDRLP4 60
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $385
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $385
line 527
;527:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 528
;528:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 529
;529:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 530
;530:				s += 2;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 531
;531:				continue;
ADDRGP4 $383
JUMPV
LABELV $385
line 532
;532:			} else {
line 533
;533:	      float yadj = useScale * glyph->top;
ADDRLP4 64
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 534
;534:				if (Text_Width(s, useScale, 1) + x > max) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDF4
ADDRLP4 40
INDIRF4
LEF4 $388
line 535
;535:					*maxX = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 536
;536:					break;
ADDRGP4 $384
JUMPV
LABELV $388
line 538
;537:				}
;538:		    Text_PaintChar(x, y - yadj, 
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 547
;539:			                 glyph->imageWidth,
;540:				               glyph->imageHeight,
;541:				               useScale, 
;542:						           glyph->s,
;543:								       glyph->t,
;544:								       glyph->s2,
;545:									     glyph->t2,
;546:										   glyph->glyph);
;547:	      x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDF4
ADDF4
ASGNF4
line 548
;548:				*maxX = x;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ASGNF4
line 549
;549:				count++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 550
;550:				s++;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 551
;551:	    }
line 552
;552:		}
LABELV $383
line 524
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $391
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $391
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $382
LABELV $391
LABELV $384
line 553
;553:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 554
;554:  }
LABELV $366
line 556
;555:
;556:}
LABELV $365
endproc Text_Paint_Limit 76 40
export UI_ShowPostGame
proc UI_ShowPostGame 0 8
line 559
;557:
;558:
;559:void UI_ShowPostGame(qboolean newHigh) {
line 560
;560:	trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 561
;561:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $395
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 562
;562:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $396
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 563
;563:	uiInfo.soundHighScore = newHigh;
ADDRGP4 uiInfo+73436
ADDRFP4 0
INDIRI4
ASGNI4
line 564
;564:  _UI_SetActiveMenu(UIMENU_POSTGAME);
CNSTI4 6
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 565
;565:}
LABELV $392
endproc UI_ShowPostGame 0 8
export UI_DrawCenteredPic
proc UI_DrawCenteredPic 8 20
line 572
;566:/*
;567:=================
;568:_UI_Refresh
;569:=================
;570:*/
;571:
;572:void UI_DrawCenteredPic(qhandle_t image, int w, int h) {
line 574
;573:  int x, y;
;574:  x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 0
CNSTI4 640
ADDRFP4 4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 575
;575:  y = (SCREEN_HEIGHT - h) / 2;
ADDRLP4 4
CNSTI4 480
ADDRFP4 8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 576
;576:  UI_DrawHandlePic(x, y, w, h, image);
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 577
;577:}
LABELV $399
endproc UI_DrawCenteredPic 8 20
data
export frameCount
align 4
LABELV frameCount
byte 4 0
bss
align 4
LABELV $401
skip 4
align 4
LABELV $402
skip 16
export _UI_Refresh
code
proc _UI_Refresh 20 20
line 584
;578:
;579:int frameCount = 0;
;580:int startTime;
;581:
;582:#define	UI_FPS_FRAMES	4
;583:void _UI_Refresh( int realtime )
;584:{
line 592
;585:	static int index;
;586:	static int	previousTimes[UI_FPS_FRAMES];
;587:
;588:	//if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
;589:	//	return;
;590:	//}
;591:
;592:	uiInfo.uiDC.frameTime = realtime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+212
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
SUBI4
ASGNI4
line 593
;593:	uiInfo.uiDC.realTime = realtime;
ADDRGP4 uiInfo+208
ADDRFP4 0
INDIRI4
ASGNI4
line 595
;594:
;595:	previousTimes[index % UI_FPS_FRAMES] = uiInfo.uiDC.frameTime;
ADDRGP4 $401
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $402
ADDP4
ADDRGP4 uiInfo+212
INDIRI4
ASGNI4
line 596
;596:	index++;
ADDRLP4 0
ADDRGP4 $401
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 597
;597:	if ( index > UI_FPS_FRAMES ) {
ADDRGP4 $401
INDIRI4
CNSTI4 4
LEI4 $407
line 600
;598:		int i, total;
;599:		// average multiple frames together to smooth changes out a bit
;600:		total = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 601
;601:		for ( i = 0 ; i < UI_FPS_FRAMES ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $409
line 602
;602:			total += previousTimes[i];
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $402
ADDP4
INDIRI4
ADDI4
ASGNI4
line 603
;603:		}
LABELV $410
line 601
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $409
line 604
;604:		if ( !total ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $413
line 605
;605:			total = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 606
;606:		}
LABELV $413
line 607
;607:		uiInfo.uiDC.FPS = 1000 * UI_FPS_FRAMES / total;
ADDRGP4 uiInfo+73412
CNSTI4 4000
ADDRLP4 8
INDIRI4
DIVI4
CVIF4 4
ASGNF4
line 608
;608:	}
LABELV $407
line 612
;609:
;610:
;611:
;612:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 614
;613:
;614:	if (Menu_Count() > 0) {
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $416
line 616
;615:		// paint all the menus
;616:		Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 618
;617:		// refresh server browser list
;618:		UI_DoServerRefresh();
ADDRGP4 UI_DoServerRefresh
CALLV
pop
line 620
;619:		// refresh server status
;620:		UI_BuildServerStatus(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 622
;621:		// refresh find player list
;622:		UI_BuildFindPlayerList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 623
;623:	} 
LABELV $416
line 626
;624:	
;625:	// draw cursor
;626:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 627
;627:	if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $418
line 628
;628:		UI_DrawHandlePic( uiInfo.uiDC.cursorx-16, uiInfo.uiDC.cursory-16, 32, 32, uiInfo.uiDC.Assets.cursor);
ADDRLP4 12
CNSTI4 16
ASGNI4
ADDRGP4 uiInfo+216
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uiInfo+220
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTF4 1107296256
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uiInfo+228+61656
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 629
;629:	}
LABELV $418
line 632
;630:
;631:#ifndef NDEBUG
;632:	if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+224
INDIRI4
CNSTI4 0
EQI4 $424
line 633
;633:	{
line 637
;634:		// cursor coordinates
;635:		//FIXME
;636:		//UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
;637:	}
LABELV $424
line 640
;638:#endif
;639:
;640:}
LABELV $400
endproc _UI_Refresh 20 20
export _UI_Shutdown
proc _UI_Shutdown 0 0
line 647
;641:
;642:/*
;643:=================
;644:_UI_Shutdown
;645:=================
;646:*/
;647:void _UI_Shutdown( void ) {
line 648
;648:	trap_LAN_SaveCachedServers();
ADDRGP4 trap_LAN_SaveCachedServers
CALLV
pop
line 649
;649:}
LABELV $427
endproc _UI_Shutdown 0 0
data
export defaultMenu
align 4
LABELV defaultMenu
byte 4 0
bss
align 1
LABELV $429
skip 32768
export GetMenuBuffer
code
proc GetMenuBuffer 16 16
line 653
;650:
;651:char *defaultMenu = NULL;
;652:
;653:char *GetMenuBuffer(const char *filename) {
line 658
;654:	int	len;
;655:	fileHandle_t	f;
;656:	static char buf[MAX_MENUFILE];
;657:
;658:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 659
;659:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $430
line 660
;660:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $432
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 661
;661:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $428
JUMPV
LABELV $430
line 663
;662:	}
;663:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $433
line 664
;664:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
ADDRGP4 $435
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 665
;665:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 666
;666:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $428
JUMPV
LABELV $433
line 669
;667:	}
;668:
;669:	trap_FS_Read( buf, len, f );
ADDRGP4 $429
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 670
;670:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $429
ADDP4
CNSTI1 0
ASGNI1
line 671
;671:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 673
;672:	//COM_Compress(buf);
;673:  return buf;
ADDRGP4 $429
RETP4
LABELV $428
endproc GetMenuBuffer 16 16
export Asset_Parse
proc Asset_Parse 1124 12
line 677
;674:
;675:}
;676:
;677:qboolean Asset_Parse(int handle) {
line 681
;678:	pc_token_t token;
;679:	const char *tempStr;
;680:
;681:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $437
line 682
;682:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $437
line 683
;683:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $444
line 684
;684:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $443
line 687
;685:	}
;686:    
;687:	while ( 1 ) {
line 689
;688:
;689:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 691
;690:
;691:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $446
line 692
;692:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $446
line 694
;693:
;694:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $448
line 695
;695:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $436
JUMPV
LABELV $448
line 699
;696:		}
;697:
;698:		// font
;699:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $455
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $452
line 701
;700:			int pointSize;
;701:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1068
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $458
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
ADDRLP4 1072
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $456
LABELV $458
line 702
;702:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $456
line 704
;703:			}
;704:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.textFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+12
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 705
;705:			uiInfo.uiDC.Assets.fontRegistered = qtrue;
ADDRGP4 uiInfo+228+61764
CNSTI4 1
ASGNI4
line 706
;706:			continue;
ADDRGP4 $444
JUMPV
LABELV $452
line 709
;707:		}
;708:
;709:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $466
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $463
line 711
;710:			int pointSize;
;711:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1072
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $469
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
ADDRLP4 1076
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $467
LABELV $469
line 712
;712:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $467
line 714
;713:			}
;714:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.smallFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+20560
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 715
;715:			continue;
ADDRGP4 $444
JUMPV
LABELV $463
line 718
;716:		}
;717:
;718:		if (Q_stricmp(token.string, "bigFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $472
line 720
;719:			int pointSize;
;720:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $478
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
ADDRLP4 1080
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $476
LABELV $478
line 721
;721:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $476
line 723
;722:			}
;723:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.bigFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+41108
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 724
;724:			continue;
ADDRGP4 $444
JUMPV
LABELV $472
line 729
;725:		}
;726:
;727:
;728:		// gradientbar
;729:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $484
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $481
line 730
;730:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $485
line 731
;731:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $485
line 733
;732:			}
;733:			uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 734
;734:			continue;
ADDRGP4 $444
JUMPV
LABELV $481
line 738
;735:		}
;736:
;737:		// enterMenuSound
;738:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $489
line 739
;739:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1080
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $493
line 740
;740:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $493
line 742
;741:			}
;742:			uiInfo.uiDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 743
;743:			continue;
ADDRGP4 $444
JUMPV
LABELV $489
line 747
;744:		}
;745:
;746:		// exitMenuSound
;747:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $500
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $497
line 748
;748:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1084
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $501
line 749
;749:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $501
line 751
;750:			}
;751:			uiInfo.uiDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 752
;752:			continue;
ADDRGP4 $444
JUMPV
LABELV $497
line 756
;753:		}
;754:
;755:		// itemFocusSound
;756:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $508
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $505
line 757
;757:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1088
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $509
line 758
;758:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $509
line 760
;759:			}
;760:			uiInfo.uiDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 761
;761:			continue;
ADDRGP4 $444
JUMPV
LABELV $505
line 765
;762:		}
;763:
;764:		// menuBuzzSound
;765:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $513
line 766
;766:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $517
line 767
;767:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $517
line 769
;768:			}
;769:			uiInfo.uiDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 770
;770:			continue;
ADDRGP4 $444
JUMPV
LABELV $513
line 773
;771:		}
;772:
;773:		if (Q_stricmp(token.string, "cursor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $521
line 774
;774:			if (!PC_String_Parse(handle, &uiInfo.uiDC.Assets.cursorStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $525
line 775
;775:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $525
line 777
;776:			}
;777:			uiInfo.uiDC.Assets.cursor = trap_R_RegisterShaderNoMip( uiInfo.uiDC.Assets.cursorStr);
ADDRGP4 uiInfo+228+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 778
;778:			continue;
ADDRGP4 $444
JUMPV
LABELV $521
line 781
;779:		}
;780:
;781:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $533
line 782
;782:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $444
line 783
;783:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
line 785
;784:			}
;785:			continue;
LABELV $533
line 788
;786:		}
;787:
;788:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $541
line 789
;789:			if (!PC_Int_Parse(handle, &uiInfo.uiDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $444
line 790
;790:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
line 792
;791:			}
;792:			continue;
LABELV $541
line 795
;793:		}
;794:
;795:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $552
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $549
line 796
;796:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $444
line 797
;797:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
line 799
;798:			}
;799:			continue;
LABELV $549
line 802
;800:		}
;801:
;802:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $560
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $557
line 803
;803:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $444
line 804
;804:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
line 806
;805:			}
;806:			continue;
LABELV $557
line 809
;807:		}
;808:
;809:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $568
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $565
line 810
;810:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $444
line 811
;811:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
line 813
;812:			}
;813:			continue;
LABELV $565
line 816
;814:		}
;815:
;816:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $576
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $573
line 817
;817:			if (!PC_Color_Parse(handle, &uiInfo.uiDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $577
line 818
;818:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $436
JUMPV
LABELV $577
line 820
;819:			}
;820:			uiInfo.uiDC.Assets.shadowFadeClamp = uiInfo.uiDC.Assets.shadowColor[3];
ADDRGP4 uiInfo+228+61760
ADDRGP4 uiInfo+228+61744+12
INDIRF4
ASGNF4
line 821
;821:			continue;
LABELV $573
line 824
;822:		}
;823:
;824:	}
LABELV $444
line 687
ADDRGP4 $443
JUMPV
line 825
;825:	return qfalse;
CNSTI4 0
RETI4
LABELV $436
endproc Asset_Parse 1124 12
export Font_Report
proc Font_Report 8 12
line 828
;826:}
;827:
;828:void Font_Report() {
line 830
;829:  int i;
;830:  Com_Printf("Font Info\n");
ADDRGP4 $587
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 831
;831:  Com_Printf("=========\n");
ADDRGP4 $588
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 832
;832:  for ( i = 32; i < 96; i++) {
ADDRLP4 0
CNSTI4 32
ASGNI4
LABELV $589
line 833
;833:    Com_Printf("Glyph handle %i: %i\n", i, uiInfo.uiDC.Assets.textFont.glyphs[i].glyph);
ADDRGP4 $593
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 80
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+228+12+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 834
;834:  }
LABELV $590
line 832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 96
LTI4 $589
line 835
;835:}
LABELV $586
endproc Font_Report 8 12
export UI_Report
proc UI_Report 0 0
line 837
;836:
;837:void UI_Report() {
line 838
;838:  String_Report();
ADDRGP4 String_Report
CALLV
pop
line 841
;839:  //Font_Report();
;840:
;841:}
LABELV $597
endproc UI_Report 0 0
export UI_ParseMenu
proc UI_ParseMenu 1060 12
line 843
;842:
;843:void UI_ParseMenu(const char *menuFile) {
line 847
;844:	int handle;
;845:	pc_token_t token;
;846:
;847:	Com_Printf("Parsing menu file:%s\n", menuFile);
ADDRGP4 $599
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 849
;848:
;849:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 850
;850:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $603
line 851
;851:		return;
ADDRGP4 $598
JUMPV
LABELV $602
line 854
;852:	}
;853:
;854:	while ( 1 ) {
line 855
;855:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 856
;856:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $605
line 857
;857:			break;
ADDRGP4 $604
JUMPV
LABELV $605
line 870
;858:		}
;859:
;860:		//if ( Q_stricmp( token, "{" ) ) {
;861:		//	Com_Printf( "Missing { in menu file\n" );
;862:		//	break;
;863:		//}
;864:
;865:		//if ( menuCount == MAX_MENUS ) {
;866:		//	Com_Printf( "Too many menus!\n" );
;867:		//	break;
;868:		//}
;869:
;870:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $607
line 871
;871:			break;
ADDRGP4 $604
JUMPV
LABELV $607
line 874
;872:		}
;873:
;874:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $613
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $610
line 875
;875:			if (Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $604
line 876
;876:				continue;
ADDRGP4 $603
JUMPV
line 877
;877:			} else {
line 878
;878:				break;
LABELV $610
line 882
;879:			}
;880:		}
;881:
;882:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $619
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $616
line 884
;883:			// start a new menu
;884:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 885
;885:		}
LABELV $616
line 886
;886:	}
LABELV $603
line 854
ADDRGP4 $602
JUMPV
LABELV $604
line 887
;887:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 888
;888:}
LABELV $598
endproc UI_ParseMenu 1060 12
export Load_Menu
proc Load_Menu 1048 8
line 890
;889:
;890:qboolean Load_Menu(int handle) {
line 893
;891:	pc_token_t token;
;892:
;893:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $621
line 894
;894:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $620
JUMPV
LABELV $621
line 895
;895:	if (token.string[0] != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $627
line 896
;896:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $620
JUMPV
LABELV $626
line 899
;897:	}
;898:
;899:	while ( 1 ) {
line 901
;900:
;901:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $629
line 902
;902:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $620
JUMPV
LABELV $629
line 904
;903:    
;904:		if ( token.string[0] == 0 ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $631
line 905
;905:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $620
JUMPV
LABELV $631
line 908
;906:		}
;907:
;908:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $634
line 909
;909:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $620
JUMPV
LABELV $634
line 912
;910:		}
;911:
;912:		UI_ParseMenu(token.string); 
ADDRLP4 0+16
ARGP4
ADDRGP4 UI_ParseMenu
CALLV
pop
line 913
;913:	}
LABELV $627
line 899
ADDRGP4 $626
JUMPV
line 914
;914:	return qfalse;
CNSTI4 0
RETI4
LABELV $620
endproc Load_Menu 1048 8
export UI_LoadMenus
proc UI_LoadMenus 1068 8
line 917
;915:}
;916:
;917:void UI_LoadMenus(const char *menuFile, qboolean reset) {
line 922
;918:	pc_token_t token;
;919:	int handle;
;920:	int start;
;921:
;922:	start = trap_Milliseconds();
ADDRLP4 1048
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
line 924
;923:
;924:	handle = trap_PC_LoadSource( menuFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 925
;925:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $639
line 926
;926:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
ADDRGP4 $641
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 927
;927:		handle = trap_PC_LoadSource( "ui/menus.txt" );
ADDRGP4 $642
ARGP4
ADDRLP4 1060
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1060
INDIRI4
ASGNI4
line 928
;928:		if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $643
line 929
;929:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/menus.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $645
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 930
;930:		}
LABELV $643
line 931
;931:	}
LABELV $639
line 933
;932:
;933:	ui_new.integer = 1;
ADDRGP4 ui_new+12
CNSTI4 1
ASGNI4
line 935
;934:
;935:	if (reset) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $650
line 936
;936:		Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 937
;937:	}
ADDRGP4 $650
JUMPV
LABELV $649
line 939
;938:
;939:	while ( 1 ) {
line 940
;940:		if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $652
line 941
;941:			break;
ADDRGP4 $651
JUMPV
LABELV $652
line 942
;942:		if( token.string[0] == 0 || token.string[0] == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $658
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $654
LABELV $658
line 943
;943:			break;
ADDRGP4 $651
JUMPV
LABELV $654
line 946
;944:		}
;945:
;946:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $659
line 947
;947:			break;
ADDRGP4 $651
JUMPV
LABELV $659
line 950
;948:		}
;949:
;950:		if (Q_stricmp(token.string, "loadmenu") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $662
line 951
;951:			if (Load_Menu(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 Load_Menu
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $651
line 952
;952:				continue;
line 953
;953:			} else {
line 954
;954:				break;
LABELV $662
line 957
;955:			}
;956:		}
;957:	}
LABELV $650
line 939
ADDRGP4 $649
JUMPV
LABELV $651
line 959
;958:
;959:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
ADDRLP4 1056
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $668
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 961
;960:
;961:	trap_PC_FreeSource( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 962
;962:}
LABELV $638
endproc UI_LoadMenus 1068 8
export UI_Load
proc UI_Load 1052 8
line 964
;963:
;964:void UI_Load() {
line 966
;965:	char lastName[1024];
;966:  menuDef_t *menu = Menu_GetFocused();
ADDRLP4 1032
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
line 967
;967:	char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $670
ARGP4
ADDRLP4 1036
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 968
;968:	if (menu && menu->window.name) {
ADDRLP4 1044
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $671
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $671
line 969
;969:		strcpy(lastName, menu->window.name);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 970
;970:	}
LABELV $671
line 971
;971:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $675
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $673
LABELV $675
line 972
;972:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $642
ASGNP4
line 973
;973:	}
LABELV $673
line 975
;974:
;975:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 980
;976:
;977:#ifdef PRE_RELEASE_TADEMO
;978:	UI_ParseGameInfo("demogameinfo.txt");
;979:#else
;980:	UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $676
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 981
;981:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 984
;982:#endif
;983:
;984:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 985
;985:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 986
;986:	Menus_ActivateByName(lastName);
ADDRLP4 8
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 988
;987:
;988:}
LABELV $669
endproc UI_Load 1052 8
data
align 4
LABELV handicapValues
address $677
address $678
address $679
address $680
address $681
address $682
address $683
address $684
address $685
address $686
address $687
address $688
address $689
address $690
address $691
address $692
address $693
address $694
address $695
address $696
byte 4 0
code
proc UI_DrawHandicap 20 32
line 995
;989:
;990:static const char *handicapValues[] = {"None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5",NULL};
;991:#ifndef MISSIONPACK // bk001206
;992:static int numHandicaps = sizeof(handicapValues) / sizeof(const char*);
;993:#endif
;994:
;995:static void UI_DrawHandicap(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 998
;996:  int i, h;
;997:
;998:  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $698
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 999
;999:  i = 20 - h / 5;
ADDRLP4 0
CNSTI4 20
ADDRLP4 4
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1001
;1000:
;1001:  Text_Paint(rect->x, rect->y, scale, color, handicapValues[i], 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1002
;1002:}
LABELV $697
endproc UI_DrawHandicap 20 32
proc UI_DrawClanName 8 32
line 1004
;1003:
;1004:static void UI_DrawClanName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1005
;1005:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_teamName"), 0, 0, textStyle);
ADDRGP4 $700
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1006
;1006:}
LABELV $699
endproc UI_DrawClanName 8 32
proc UI_SetCapFragLimits 16 8
line 1009
;1007:
;1008:
;1009:static void UI_SetCapFragLimits(qboolean uiVars) {
line 1010
;1010:	int cap = 5;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1011
;1011:	int frag = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1012
;1012:	if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_OBELISK) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $702
line 1013
;1013:		cap = 4;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1014
;1014:	} else if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_HARVESTER) {
ADDRGP4 $703
JUMPV
LABELV $702
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $707
line 1015
;1015:		cap = 15;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1016
;1016:	}
LABELV $707
LABELV $703
line 1017
;1017:	if (uiVars) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $712
line 1018
;1018:		trap_Cvar_Set("ui_captureLimit", va("%d", cap));
ADDRGP4 $715
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $714
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1019
;1019:		trap_Cvar_Set("ui_fragLimit", va("%d", frag));
ADDRGP4 $715
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $716
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1020
;1020:	} else {
ADDRGP4 $713
JUMPV
LABELV $712
line 1021
;1021:		trap_Cvar_Set("capturelimit", va("%d", cap));
ADDRGP4 $715
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $717
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1022
;1022:		trap_Cvar_Set("fraglimit", va("%d", frag));
ADDRGP4 $715
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $718
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1023
;1023:	}
LABELV $713
line 1024
;1024:}
LABELV $701
endproc UI_SetCapFragLimits 16 8
proc UI_DrawGameType 4 32
line 1026
;1025:// ui_gameType assumes gametype 0 is -1 ALL and will not show
;1026:static void UI_DrawGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1027
;1027:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_gameType.integer].gameType, 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1028
;1028:}
LABELV $719
endproc UI_DrawGameType 4 32
proc UI_DrawNetGameType 4 32
line 1030
;1029:
;1030:static void UI_DrawNetGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1031
;1031:	if (ui_netGameType.integer < 0 || ui_netGameType.integer > uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $728
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
LEI4 $723
LABELV $728
line 1032
;1032:		trap_Cvar_Set("ui_netGameType", "0");
ADDRGP4 $729
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1033
;1033:		trap_Cvar_Set("ui_actualNetGameType", "0");
ADDRGP4 $730
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1034
;1034:	}
LABELV $723
line 1035
;1035:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_netGameType.integer].gameType , 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1036
;1036:}
LABELV $722
endproc UI_DrawNetGameType 4 32
proc UI_DrawJoinGameType 4 32
line 1038
;1037:
;1038:static void UI_DrawJoinGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1039
;1039:	if (ui_joinGameType.integer < 0 || ui_joinGameType.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
LTI4 $739
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78708
INDIRI4
LEI4 $734
LABELV $739
line 1040
;1040:		trap_Cvar_Set("ui_joinGameType", "0");
ADDRGP4 $740
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1041
;1041:	}
LABELV $734
line 1042
;1042:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.joinGameTypes[ui_joinGameType.integer].gameType , 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1043
;1043:}
LABELV $733
endproc UI_DrawJoinGameType 4 32
proc UI_TeamIndexFromName 12 8
line 1047
;1044:
;1045:
;1046:
;1047:static int UI_TeamIndexFromName(const char *name) {
line 1050
;1048:  int i;
;1049:
;1050:  if (name && *name) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $744
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $744
line 1051
;1051:    for (i = 0; i < uiInfo.teamCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $746
line 1052
;1052:      if (Q_stricmp(name, uiInfo.teamList[i].teamName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $751
line 1053
;1053:        return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $743
JUMPV
LABELV $751
line 1055
;1054:      }
;1055:    }
LABELV $747
line 1051
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $749
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $746
line 1056
;1056:  } 
LABELV $744
line 1058
;1057:
;1058:  return 0;
CNSTI4 0
RETI4
LABELV $743
endproc UI_TeamIndexFromName 12 8
proc UI_DrawClanLogo 48 20
line 1062
;1059:
;1060:}
;1061:
;1062:static void UI_DrawClanLogo(rectDef_t *rect, float scale, vec4_t color) {
line 1064
;1063:  int i;
;1064:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1065
;1065:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $755
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $755
line 1066
;1066:  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1068
;1067:
;1068:		if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $758
line 1069
;1069:      uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1070
;1070:      uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 24
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1071
;1071:      uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 36
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1072
;1072:		}
LABELV $758
line 1074
;1073:
;1074:  	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1075
;1075:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1076
;1076:  }
LABELV $755
line 1077
;1077:}
LABELV $754
endproc UI_DrawClanLogo 48 20
proc UI_DrawClanCinematic 32 24
line 1079
;1078:
;1079:static void UI_DrawClanCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1081
;1080:  int i;
;1081:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1082
;1082:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $779
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $779
line 1084
;1083:
;1084:		if (uiInfo.teamList[i].cinematic >= -2) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 -2
LTI4 $782
line 1085
;1085:			if (uiInfo.teamList[i].cinematic == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $786
line 1086
;1086:				uiInfo.teamList[i].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.teamList[i].imageName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 28
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+40
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1087
;1087:			}
LABELV $786
line 1088
;1088:			if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $795
line 1089
;1089:			  trap_CIN_RunCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1090
;1090:				trap_CIN_SetExtents(uiInfo.teamList[i].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1091
;1091:	 			trap_CIN_DrawCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1092
;1092:			} else {
ADDRGP4 $783
JUMPV
LABELV $795
line 1093
;1093:			  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1094
;1094:				UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1095
;1095:				trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1096
;1096:				uiInfo.teamList[i].cinematic = -2;
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -2
ASGNI4
line 1097
;1097:			}
line 1098
;1098:		} else {
ADDRGP4 $783
JUMPV
LABELV $782
line 1099
;1099:	  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1100
;1100:			UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1101
;1101:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1102
;1102:		}
LABELV $783
line 1103
;1103:	}
LABELV $779
line 1105
;1104:
;1105:}
LABELV $778
endproc UI_DrawClanCinematic 32 24
proc UI_DrawPreviewCinematic 16 24
line 1107
;1106:
;1107:static void UI_DrawPreviewCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1108
;1108:	if (uiInfo.previewMovie > -2) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 -2
LEI4 $812
line 1109
;1109:		uiInfo.previewMovie = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.movieList[uiInfo.movieIndex]), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRGP4 uiInfo+99256
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99260
ADDRLP4 8
INDIRI4
ASGNI4
line 1110
;1110:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 0
LTI4 $818
line 1111
;1111:		  trap_CIN_RunCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1112
;1112:			trap_CIN_SetExtents(uiInfo.previewMovie, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1113
;1113: 			trap_CIN_DrawCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1114
;1114:		} else {
ADDRGP4 $819
JUMPV
LABELV $818
line 1115
;1115:			uiInfo.previewMovie = -2;
ADDRGP4 uiInfo+99260
CNSTI4 -2
ASGNI4
line 1116
;1116:		}
LABELV $819
line 1117
;1117:	} 
LABELV $812
line 1119
;1118:
;1119:}
LABELV $811
endproc UI_DrawPreviewCinematic 16 24
proc UI_DrawSkill 16 32
line 1123
;1120:
;1121:
;1122:
;1123:static void UI_DrawSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1125
;1124:  int i;
;1125:	i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1126
;1126:  if (i < 1 || i > numSkillLevels) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $829
ADDRLP4 0
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $827
LABELV $829
line 1127
;1127:    i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1128
;1128:  }
LABELV $827
line 1129
;1129:  Text_Paint(rect->x, rect->y, scale, color, skillLevels[i-1],0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1130
;1130:}
LABELV $825
endproc UI_DrawSkill 16 32
proc UI_DrawTeamName 32 32
line 1133
;1131:
;1132:
;1133:static void UI_DrawTeamName(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int textStyle) {
line 1135
;1134:  int i;
;1135:  i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $835
ADDRLP4 4
ADDRGP4 $832
ASGNP4
ADDRGP4 $836
JUMPV
LABELV $835
ADDRLP4 4
ADDRGP4 $833
ASGNP4
LABELV $836
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1136
;1136:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $837
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $837
line 1137
;1137:    Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", (blue) ? "Blue" : "Red", uiInfo.teamList[i].teamName),0, 0, textStyle);
ADDRGP4 $840
ARGP4
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $845
ADDRLP4 20
ADDRGP4 $841
ASGNP4
ADDRGP4 $846
JUMPV
LABELV $845
ADDRLP4 20
ADDRGP4 $842
ASGNP4
LABELV $846
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1138
;1138:  }
LABELV $837
line 1139
;1139:}
LABELV $831
endproc UI_DrawTeamName 32 32
proc UI_DrawTeamMember 28 32
line 1141
;1140:
;1141:static void UI_DrawTeamMember(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int num, int textStyle) {
line 1145
;1142:	// 0 - None
;1143:	// 1 - Human
;1144:	// 2..NumCharacters - Bot
;1145:	int value = trap_Cvar_VariableValue(va(blue ? "ui_blueteam%i" : "ui_redteam%i", num));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $851
ADDRLP4 8
ADDRGP4 $848
ASGNP4
ADDRGP4 $852
JUMPV
LABELV $851
ADDRLP4 8
ADDRGP4 $849
ASGNP4
LABELV $852
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1147
;1146:	const char *text;
;1147:	if (value <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $853
line 1148
;1148:		text = "Closed";
ADDRLP4 4
ADDRGP4 $855
ASGNP4
line 1149
;1149:	} else if (value == 1) {
ADDRGP4 $854
JUMPV
LABELV $853
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $856
line 1150
;1150:		text = "Human";
ADDRLP4 4
ADDRGP4 $858
ASGNP4
line 1151
;1151:	} else {
ADDRGP4 $857
JUMPV
LABELV $856
line 1152
;1152:		value -= 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1154
;1153:
;1154:		if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $859
line 1155
;1155:			if (value >= uiInfo.characterCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $862
line 1156
;1156:				value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1157
;1157:			}
LABELV $862
line 1158
;1158:			text = uiInfo.characterList[value].name;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ASGNP4
line 1159
;1159:		} else {
ADDRGP4 $860
JUMPV
LABELV $859
line 1160
;1160:			if (value >= UI_GetNumBots()) {
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $866
line 1161
;1161:				value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1162
;1162:			}
LABELV $866
line 1163
;1163:			text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1164
;1164:		}
LABELV $860
line 1165
;1165:	}
LABELV $857
LABELV $854
line 1166
;1166:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1167
;1167:}
LABELV $847
endproc UI_DrawTeamMember 28 32
proc UI_DrawEffects 16 20
line 1169
;1168:
;1169:static void UI_DrawEffects(rectDef_t *rect, float scale, vec4_t color) {
line 1170
;1170:	UI_DrawHandlePic( rect->x, rect->y - 14, 128, 8, uiInfo.uiDC.Assets.fxBasePic );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
SUBF4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 uiInfo+228+61768
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1171
;1171:	UI_DrawHandlePic( rect->x + uiInfo.effectsColor * 16 + 8, rect->y - 16, 16, 12, uiInfo.uiDC.Assets.fxPic[uiInfo.effectsColor] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uiInfo+136904
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
CVIF4 4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 12
CNSTF4 1098907648
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+228+61772
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1172
;1172:}
LABELV $868
endproc UI_DrawEffects 16 20
proc UI_DrawMapPreview 20 20
line 1174
;1173:
;1174:static void UI_DrawMapPreview(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1175
;1175:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $879
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $880
JUMPV
LABELV $879
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $880
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1176
;1176:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $884
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $881
LABELV $884
line 1177
;1177:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $885
line 1178
;1178:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1179
;1179:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1180
;1180:		} else {
ADDRGP4 $886
JUMPV
LABELV $885
line 1181
;1181:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1182
;1182:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $890
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1183
;1183:		}
LABELV $886
line 1184
;1184:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1185
;1185:	}
LABELV $881
line 1187
;1186:
;1187:	if (uiInfo.mapList[map].levelShot == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $891
line 1188
;1188:		uiInfo.mapList[map].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[map].imageName);
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1189
;1189:	}
LABELV $891
line 1191
;1190:
;1191:	if (uiInfo.mapList[map].levelShot > 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
CNSTI4 0
LEI4 $899
line 1192
;1192:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.mapList[map].levelShot);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1193
;1193:	} else {
ADDRGP4 $900
JUMPV
LABELV $899
line 1194
;1194:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $905
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1195
;1195:	}
LABELV $900
line 1196
;1196:}						 
LABELV $875
endproc UI_DrawMapPreview 20 20
proc UI_DrawMapTimeToBeat 20 32
line 1199
;1197:
;1198:
;1199:static void UI_DrawMapTimeToBeat(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1201
;1200:	int minutes, seconds, time;
;1201:	if (ui_currentMap.integer < 0 || ui_currentMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentMap+12
INDIRI4
CNSTI4 0
LTI4 $912
ADDRGP4 ui_currentMap+12
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $907
LABELV $912
line 1202
;1202:		ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1203
;1203:		trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $890
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1204
;1204:	}
LABELV $907
line 1206
;1205:
;1206:	time = uiInfo.mapList[ui_currentMap.integer].timeToBeat[uiInfo.gameTypes[ui_gameType.integer].gtEnum];
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1208
;1207:
;1208:	minutes = time / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1209
;1209:	seconds = time % 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1211
;1210:
;1211:  Text_Paint(rect->x, rect->y, scale, color, va("%02i:%02i", minutes, seconds), 0, 0, textStyle);
ADDRGP4 $920
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1212
;1212:}
LABELV $906
endproc UI_DrawMapTimeToBeat 20 32
proc UI_DrawMapCinematic 28 24
line 1216
;1213:
;1214:
;1215:
;1216:static void UI_DrawMapCinematic(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1218
;1217:
;1218:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer; 
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $925
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $926
JUMPV
LABELV $925
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $926
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1219
;1219:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $930
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $927
LABELV $930
line 1220
;1220:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $931
line 1221
;1221:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1222
;1222:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1223
;1223:		} else {
ADDRGP4 $932
JUMPV
LABELV $931
line 1224
;1224:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1225
;1225:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $890
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1226
;1226:		}
LABELV $932
line 1227
;1227:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1228
;1228:	}
LABELV $927
line 1230
;1229:
;1230:	if (uiInfo.mapList[map].cinematic >= -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 -1
LTI4 $935
line 1231
;1231:		if (uiInfo.mapList[map].cinematic == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $939
line 1232
;1232:			uiInfo.mapList[map].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[map].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+24
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1233
;1233:		}
LABELV $939
line 1234
;1234:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $947
line 1235
;1235:		  trap_CIN_RunCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1236
;1236:		  trap_CIN_SetExtents(uiInfo.mapList[map].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1237
;1237: 			trap_CIN_DrawCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1238
;1238:		} else {
ADDRGP4 $936
JUMPV
LABELV $947
line 1239
;1239:			uiInfo.mapList[map].cinematic = -2;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -2
ASGNI4
line 1240
;1240:		}
line 1241
;1241:	} else {
ADDRGP4 $936
JUMPV
LABELV $935
line 1242
;1242:		UI_DrawMapPreview(rect, scale, color, net);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 1243
;1243:	}
LABELV $936
line 1244
;1244:}
LABELV $921
endproc UI_DrawMapCinematic 28 24
data
align 4
LABELV updateModel
byte 4 1
align 4
LABELV q3Model
byte 4 0
bss
align 4
LABELV $960
skip 1276
code
proc UI_DrawPlayerModel 616 28
line 1251
;1245:
;1246:
;1247:
;1248:static qboolean updateModel = qtrue;
;1249:static qboolean q3Model = qfalse;
;1250:
;1251:static void UI_DrawPlayerModel(rectDef_t *rect) {
line 1259
;1252:  static playerInfo_t info;
;1253:  char model[MAX_QPATH];
;1254:  char team[256];
;1255:	char head[256];
;1256:	vec3_t	viewangles;
;1257:	vec3_t	moveangles;
;1258:
;1259:	  if (trap_Cvar_VariableValue("ui_Q3Model")) {
ADDRGP4 $963
ARGP4
ADDRLP4 600
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 600
INDIRF4
CNSTF4 0
EQF4 $961
line 1260
;1260:	  strcpy(model, UI_Cvar_VariableString("model"));
ADDRGP4 $964
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1261
;1261:		strcpy(head, UI_Cvar_VariableString("headmodel"));
ADDRGP4 $965
ARGP4
ADDRLP4 608
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1262
;1262:		if (!q3Model) {
ADDRGP4 q3Model
INDIRI4
CNSTI4 0
NEI4 $966
line 1263
;1263:			q3Model = qtrue;
ADDRGP4 q3Model
CNSTI4 1
ASGNI4
line 1264
;1264:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1265
;1265:		}
LABELV $966
line 1266
;1266:		team[0] = '\0';
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1267
;1267:	} else {
ADDRGP4 $962
JUMPV
LABELV $961
line 1269
;1268:
;1269:		strcpy(team, UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1270
;1270:		strcpy(model, UI_Cvar_VariableString("team_model"));
ADDRGP4 $968
ARGP4
ADDRLP4 608
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1271
;1271:		strcpy(head, UI_Cvar_VariableString("team_headmodel"));
ADDRGP4 $969
ARGP4
ADDRLP4 612
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 612
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1272
;1272:		if (q3Model) {
ADDRGP4 q3Model
INDIRI4
CNSTI4 0
EQI4 $970
line 1273
;1273:			q3Model = qfalse;
ADDRGP4 q3Model
CNSTI4 0
ASGNI4
line 1274
;1274:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1275
;1275:		}
LABELV $970
line 1276
;1276:	}
LABELV $962
line 1277
;1277:  if (updateModel) {
ADDRGP4 updateModel
INDIRI4
CNSTI4 0
EQI4 $972
line 1278
;1278:  	memset( &info, 0, sizeof(playerInfo_t) );
ADDRGP4 $960
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1279
;1279:  	viewangles[YAW]   = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 1280
;1280:  	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1281
;1281:  	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1282
;1282:  	VectorClear( moveangles );
ADDRLP4 604
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 604
INDIRF4
ASGNF4
line 1283
;1283:    UI_PlayerInfo_SetModel( &info, model, head, team);
ADDRGP4 $960
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 1284
;1284:    UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 $960
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 1286
;1285://		UI_RegisterClientModelname( &info, model, head, team);
;1286:    updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 1287
;1287:  }
LABELV $972
line 1289
;1288:
;1289:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
ADDRLP4 604
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 604
INDIRP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $960
ARGP4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 1291
;1290:
;1291:}
LABELV $959
endproc UI_DrawPlayerModel 616 28
proc UI_DrawNetSource 8 32
line 1293
;1292:
;1293:static void UI_DrawNetSource(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1294
;1294:	if (ui_netSource.integer < 0 || ui_netSource.integer > numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $984
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LEI4 $980
LABELV $984
line 1295
;1295:		ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1296
;1296:	}
LABELV $980
line 1297
;1297:  Text_Paint(rect->x, rect->y, scale, color, va("Source: %s", netSources[ui_netSource.integer]), 0, 0, textStyle);
ADDRGP4 $986
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1298
;1298:}
LABELV $979
endproc UI_DrawNetSource 8 32
proc UI_DrawNetMapPreview 8 20
line 1300
;1299:
;1300:static void UI_DrawNetMapPreview(rectDef_t *rect, float scale, vec4_t color) {
line 1302
;1301:
;1302:	if (uiInfo.serverStatus.currentServerPreview > 0) {
ADDRGP4 uiInfo+99264+10428
INDIRI4
CNSTI4 0
LEI4 $989
line 1303
;1303:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.serverStatus.currentServerPreview);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+99264+10428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1304
;1304:	} else {
ADDRGP4 $990
JUMPV
LABELV $989
line 1305
;1305:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $905
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1306
;1306:	}
LABELV $990
line 1307
;1307:}
LABELV $988
endproc UI_DrawNetMapPreview 8 20
proc UI_DrawNetMapCinematic 4 20
line 1309
;1308:
;1309:static void UI_DrawNetMapCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1310
;1310:	if (ui_currentNetMap.integer < 0 || ui_currentNetMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $1001
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $996
LABELV $1001
line 1311
;1311:		ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1312
;1312:		trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1313
;1313:	}
LABELV $996
line 1315
;1314:
;1315:	if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99264+10432
INDIRI4
CNSTI4 0
LTI4 $1003
line 1316
;1316:	  trap_CIN_RunCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1317
;1317:	  trap_CIN_SetExtents(uiInfo.serverStatus.currentServerCinematic, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1318
;1318: 	  trap_CIN_DrawCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1319
;1319:	} else {
ADDRGP4 $1004
JUMPV
LABELV $1003
line 1320
;1320:		UI_DrawNetMapPreview(rect, scale, color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 1321
;1321:	}
LABELV $1004
line 1322
;1322:}
LABELV $995
endproc UI_DrawNetMapCinematic 4 20
proc UI_DrawNetFilter 8 32
line 1326
;1323:
;1324:
;1325:
;1326:static void UI_DrawNetFilter(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1327
;1327:	if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1018
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1014
LABELV $1018
line 1328
;1328:		ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1329
;1329:	}
LABELV $1014
line 1330
;1330:  Text_Paint(rect->x, rect->y, scale, color, va("Filter: %s", serverFilters[ui_serverFilterType.integer].description), 0, 0, textStyle);
ADDRGP4 $1020
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1331
;1331:}
LABELV $1013
endproc UI_DrawNetFilter 8 32
proc UI_DrawTier 20 32
line 1334
;1332:
;1333:
;1334:static void UI_DrawTier(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1336
;1335:  int i;
;1336:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1023
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1337
;1337:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1027
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1024
LABELV $1027
line 1338
;1338:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1339
;1339:  }
LABELV $1024
line 1340
;1340:  Text_Paint(rect->x, rect->y, scale, color, va("Tier: %s", uiInfo.tierList[i].tierName),0, 0, textStyle);
ADDRGP4 $1028
ARGP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1341
;1341:}
LABELV $1022
endproc UI_DrawTier 20 32
proc UI_DrawTierMap 28 20
line 1343
;1342:
;1343:static void UI_DrawTierMap(rectDef_t *rect, int index) {
line 1345
;1344:  int i;
;1345:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1023
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1346
;1346:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1034
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1031
LABELV $1034
line 1347
;1347:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1348
;1348:  }
LABELV $1031
line 1350
;1349:
;1350:	if (uiInfo.tierList[i].mapHandles[index] == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+28
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1035
line 1351
;1351:		uiInfo.tierList[i].mapHandles[index] = trap_R_RegisterShaderNoMip(va("levelshots/%s", uiInfo.tierList[i].maps[index]));
ADDRGP4 $1041
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+96032+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+96032+28
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1352
;1352:	}
LABELV $1035
line 1354
;1353:												 
;1354:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.tierList[i].mapHandles[index]);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+28
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1355
;1355:}
LABELV $1030
endproc UI_DrawTierMap 28 20
proc UI_EnglishMapName 8 8
line 1357
;1356:
;1357:static const char *UI_EnglishMapName(const char *map) {
line 1359
;1358:	int i;
;1359:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1050
JUMPV
LABELV $1047
line 1360
;1360:		if (Q_stricmp(map, uiInfo.mapList[i].mapLoadName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1052
line 1361
;1361:			return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
RETP4
ADDRGP4 $1046
JUMPV
LABELV $1052
line 1363
;1362:		}
;1363:	}
LABELV $1048
line 1359
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1050
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $1047
line 1364
;1364:	return "";
ADDRGP4 $111
RETP4
LABELV $1046
endproc UI_EnglishMapName 8 8
proc UI_DrawTierMapName 32 32
line 1367
;1365:}
;1366:
;1367:static void UI_DrawTierMapName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1369
;1368:  int i, j;
;1369:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1023
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1370
;1370:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1061
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1058
LABELV $1061
line 1371
;1371:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1372
;1372:  }
LABELV $1058
line 1373
;1373:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $890
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1374
;1374:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1064
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1062
LABELV $1064
line 1375
;1375:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1376
;1376:	}
LABELV $1062
line 1378
;1377:
;1378:  Text_Paint(rect->x, rect->y, scale, color, UI_EnglishMapName(uiInfo.tierList[i].maps[j]), 0, 0, textStyle);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_EnglishMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1379
;1379:}
LABELV $1057
endproc UI_DrawTierMapName 32 32
proc UI_DrawTierGameType 28 32
line 1381
;1380:
;1381:static void UI_DrawTierGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1383
;1382:  int i, j;
;1383:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1023
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1384
;1384:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1071
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1068
LABELV $1071
line 1385
;1385:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1386
;1386:  }
LABELV $1068
line 1387
;1387:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $890
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1388
;1388:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1074
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1072
LABELV $1074
line 1389
;1389:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1390
;1390:	}
LABELV $1072
line 1392
;1391:
;1392:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[uiInfo.tierList[i].gameTypes[j]].gameType , 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+16
ADDP4
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1393
;1393:}
LABELV $1067
endproc UI_DrawTierGameType 28 32
proc UI_AIFromName 8 8
line 1403
;1394:
;1395:
;1396:#ifndef MISSIONPACK // bk001206
;1397:static const char *UI_OpponentLeaderName() {
;1398:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;1399:	return uiInfo.teamList[i].teamMembers[0];
;1400:}
;1401:#endif
;1402:
;1403:static const char *UI_AIFromName(const char *name) {
line 1405
;1404:	int j;
;1405:	for (j = 0; j < uiInfo.aliasCount; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1082
JUMPV
LABELV $1079
line 1406
;1406:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1084
line 1407
;1407:			return uiInfo.aliasList[j].ai;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1078
JUMPV
LABELV $1084
line 1409
;1408:		}
;1409:	}
LABELV $1080
line 1405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1082
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $1079
line 1410
;1410:	return "James";
ADDRGP4 $1089
RETP4
LABELV $1078
endproc UI_AIFromName 8 8
data
align 4
LABELV updateOpponentModel
byte 4 1
bss
align 4
LABELV $1091
skip 1276
code
proc UI_DrawOpponent 420 28
line 1460
;1411:}
;1412:
;1413:#ifndef MISSIONPACK // bk001206
;1414:static const int UI_AIIndex(const char *name) {
;1415:	int j;
;1416:	for (j = 0; j < uiInfo.characterCount; j++) {
;1417:		if (Q_stricmp(name, uiInfo.characterList[j].name) == 0) {
;1418:			return j;
;1419:		}
;1420:	}
;1421:	return 0;
;1422:}
;1423:#endif
;1424:
;1425:#ifndef MISSIONPACK // bk001206
;1426:static const int UI_AIIndexFromName(const char *name) {
;1427:	int j;
;1428:	for (j = 0; j < uiInfo.aliasCount; j++) {
;1429:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
;1430:			return UI_AIIndex(uiInfo.aliasList[j].ai);
;1431:		}
;1432:	}
;1433:	return 0;
;1434:}
;1435:#endif
;1436:
;1437:
;1438:#ifndef MISSIONPACK // bk001206
;1439:static const char *UI_OpponentLeaderHead() {
;1440:	const char *leader = UI_OpponentLeaderName();
;1441:	return UI_AIFromName(leader);
;1442:}
;1443:#endif
;1444:
;1445:#ifndef MISSIONPACK // bk001206
;1446:static const char *UI_OpponentLeaderModel() {
;1447:	int i;
;1448:	const char *head = UI_OpponentLeaderHead();
;1449:	for (i = 0; i < uiInfo.characterCount; i++) {
;1450:		if (Q_stricmp(head, uiInfo.characterList[i].name) == 0) {
;1451:			return uiInfo.characterList[i].base;
;1452:		}
;1453:	}
;1454:	return "James";
;1455:}
;1456:#endif
;1457:
;1458:
;1459:static qboolean updateOpponentModel = qtrue;
;1460:static void UI_DrawOpponent(rectDef_t *rect) {
line 1468
;1461:  static playerInfo_t info2;
;1462:  char model[MAX_QPATH];
;1463:  char headmodel[MAX_QPATH];
;1464:  char team[256];
;1465:	vec3_t	viewangles;
;1466:	vec3_t	moveangles;
;1467:  
;1468:	if (updateOpponentModel) {
ADDRGP4 updateOpponentModel
INDIRI4
CNSTI4 0
EQI4 $1092
line 1470
;1469:		
;1470:		strcpy(model, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1094
ARGP4
ADDRLP4 408
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1471
;1471:	  strcpy(headmodel, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1094
ARGP4
ADDRLP4 412
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1472
;1472:		team[0] = '\0';
ADDRLP4 152
CNSTI1 0
ASGNI1
line 1474
;1473:
;1474:  	memset( &info2, 0, sizeof(playerInfo_t) );
ADDRGP4 $1091
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1475
;1475:  	viewangles[YAW]   = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 1476
;1476:  	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1477
;1477:  	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1478
;1478:  	VectorClear( moveangles );
ADDRLP4 416
CNSTF4 0
ASGNF4
ADDRLP4 140+8
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140
ADDRLP4 416
INDIRF4
ASGNF4
line 1479
;1479:    UI_PlayerInfo_SetModel( &info2, model, headmodel, "");
ADDRGP4 $1091
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 1480
;1480:    UI_PlayerInfo_SetInfo( &info2, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 $1091
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 1481
;1481:		UI_RegisterClientModelname( &info2, model, headmodel, team);
ADDRGP4 $1091
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 1482
;1482:    updateOpponentModel = qfalse;
ADDRGP4 updateOpponentModel
CNSTI4 0
ASGNI4
line 1483
;1483:  }
LABELV $1092
line 1485
;1484:
;1485:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info2, uiInfo.uiDC.realTime / 2);
ADDRLP4 408
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1091
ARGP4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 1487
;1486:
;1487:}
LABELV $1090
endproc UI_DrawOpponent 420 28
proc UI_NextOpponent 24 8
line 1489
;1488:
;1489:static void UI_NextOpponent() {
line 1490
;1490:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1491
;1491:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1492
;1492:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1493
;1493:	if (i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1102
line 1494
;1494:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1495
;1495:	}
LABELV $1102
line 1496
;1496:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1105
line 1497
;1497:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1498
;1498:		if ( i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1107
line 1499
;1499:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1500
;1500:		}
LABELV $1107
line 1501
;1501:	}
LABELV $1105
line 1502
;1502: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1101
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1503
;1503:}
LABELV $1100
endproc UI_NextOpponent 24 8
proc UI_PriorOpponent 24 8
line 1505
;1504:
;1505:static void UI_PriorOpponent() {
line 1506
;1506:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1507
;1507:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1508
;1508:	i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1509
;1509:	if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1112
line 1510
;1510:		i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1511
;1511:	}
LABELV $1112
line 1512
;1512:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1115
line 1513
;1513:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1514
;1514:		if ( i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1117
line 1515
;1515:			i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1516
;1516:		}
LABELV $1117
line 1517
;1517:	}
LABELV $1115
line 1518
;1518: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1101
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1519
;1519:}
LABELV $1111
endproc UI_PriorOpponent 24 8
proc UI_DrawPlayerLogo 44 20
line 1521
;1520:
;1521:static void	UI_DrawPlayerLogo(rectDef_t *rect, vec3_t color) {
line 1522
;1522:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1524
;1523:
;1524:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1122
line 1525
;1525:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1526
;1526:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1527
;1527:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1528
;1528:	}
LABELV $1122
line 1530
;1529:
;1530: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1531
;1531:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1532
;1532: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1533
;1533:}
LABELV $1121
endproc UI_DrawPlayerLogo 44 20
proc UI_DrawPlayerLogoMetal 44 20
line 1535
;1534:
;1535:static void	UI_DrawPlayerLogoMetal(rectDef_t *rect, vec3_t color) {
line 1536
;1536:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1537
;1537:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1141
line 1538
;1538:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1539
;1539:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1540
;1540:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1541
;1541:	}
LABELV $1141
line 1543
;1542:
;1543: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1544
;1544:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1545
;1545: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1546
;1546:}
LABELV $1140
endproc UI_DrawPlayerLogoMetal 44 20
proc UI_DrawPlayerLogoName 44 20
line 1548
;1547:
;1548:static void	UI_DrawPlayerLogoName(rectDef_t *rect, vec3_t color) {
line 1549
;1549:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1550
;1550:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1160
line 1551
;1551:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1552
;1552:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1553
;1553:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1554
;1554:	}
LABELV $1160
line 1556
;1555:
;1556: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1557
;1557:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1558
;1558: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1559
;1559:}
LABELV $1159
endproc UI_DrawPlayerLogoName 44 20
proc UI_DrawOpponentLogo 44 20
line 1561
;1560:
;1561:static void	UI_DrawOpponentLogo(rectDef_t *rect, vec3_t color) {
line 1562
;1562:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1563
;1563:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1179
line 1564
;1564:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1565
;1565:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1566
;1566:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1567
;1567:	}
LABELV $1179
line 1569
;1568:
;1569: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1570
;1570:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1571
;1571: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1572
;1572:}
LABELV $1178
endproc UI_DrawOpponentLogo 44 20
proc UI_DrawOpponentLogoMetal 44 20
line 1574
;1573:
;1574:static void	UI_DrawOpponentLogoMetal(rectDef_t *rect, vec3_t color) {
line 1575
;1575:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1576
;1576:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1198
line 1577
;1577:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1578
;1578:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1579
;1579:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1580
;1580:	}
LABELV $1198
line 1582
;1581:
;1582: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1583
;1583:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1584
;1584: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1585
;1585:}
LABELV $1197
endproc UI_DrawOpponentLogoMetal 44 20
proc UI_DrawOpponentLogoName 44 20
line 1587
;1586:
;1587:static void	UI_DrawOpponentLogoName(rectDef_t *rect, vec3_t color) {
line 1588
;1588:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1589
;1589:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1217
line 1590
;1590:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1591
;1591:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1592
;1592:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1593
;1593:	}
LABELV $1217
line 1595
;1594:
;1595: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1596
;1596:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1597
;1597: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1598
;1598:}
LABELV $1216
endproc UI_DrawOpponentLogoName 44 20
proc UI_DrawAllMapsSelection 16 32
line 1600
;1599:
;1600:static void UI_DrawAllMapsSelection(rectDef_t *rect, float scale, vec4_t color, int textStyle, qboolean net) {
line 1601
;1601:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1239
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1240
JUMPV
LABELV $1239
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1240
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1602
;1602:	if (map >= 0 && map < uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1241
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
GEI4 $1241
line 1603
;1603:	  Text_Paint(rect->x, rect->y, scale, color, uiInfo.mapList[map].mapName, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1604
;1604:	}
LABELV $1241
line 1605
;1605:}
LABELV $1235
endproc UI_DrawAllMapsSelection 16 32
proc UI_DrawOpponentName 8 32
line 1607
;1606:
;1607:static void UI_DrawOpponentName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1608
;1608:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_opponentName"), 0, 0, textStyle);
ADDRGP4 $1101
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1609
;1609:}
LABELV $1245
endproc UI_DrawOpponentName 8 32
proc UI_OwnerDrawWidth 112 12
line 1612
;1610:
;1611:
;1612:static int UI_OwnerDrawWidth(int ownerDraw, float scale) {
line 1615
;1613:	int i, h, value;
;1614:	const char *text;
;1615:	const char *s = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1617
;1616:
;1617:  switch (ownerDraw) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 200
LTI4 $1248
ADDRLP4 20
INDIRI4
CNSTI4 247
GTI4 $1318
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1319-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1319
address $1249
address $1248
address $1248
address $1250
address $1248
address $1251
address $1248
address $1254
address $1259
address $1264
address $1269
address $1269
address $1269
address $1269
address $1269
address $1279
address $1279
address $1279
address $1279
address $1279
address $1288
address $1248
address $1297
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1248
address $1315
code
LABELV $1318
ADDRFP4 0
INDIRI4
CNSTI4 250
EQI4 $1310
ADDRGP4 $1248
JUMPV
LABELV $1249
line 1619
;1618:    case UI_HANDICAP:
;1619:			  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $698
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1620
;1620:				i = 20 - h / 5;
ADDRLP4 4
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1621
;1621:				s = handicapValues[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ASGNP4
line 1622
;1622:      break;
ADDRGP4 $1248
JUMPV
LABELV $1250
line 1624
;1623:    case UI_CLANNAME:
;1624:				s = UI_Cvar_VariableString("ui_teamName");
ADDRGP4 $700
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 1625
;1625:      break;
ADDRGP4 $1248
JUMPV
LABELV $1251
line 1627
;1626:    case UI_GAMETYPE:
;1627:				s = uiInfo.gameTypes[ui_gameType.integer].gameType;
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ASGNP4
line 1628
;1628:      break;
ADDRGP4 $1248
JUMPV
LABELV $1254
line 1630
;1629:    case UI_SKILL:
;1630:				i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 1631
;1631:				if (i < 1 || i > numSkillLevels) {
ADDRLP4 40
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $1257
ADDRLP4 40
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1255
LABELV $1257
line 1632
;1632:					i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1633
;1633:				}
LABELV $1255
line 1634
;1634:			  s = skillLevels[i-1];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ASGNP4
line 1635
;1635:      break;
ADDRGP4 $1248
JUMPV
LABELV $1259
line 1637
;1636:    case UI_BLUETEAMNAME:
;1637:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_blueTeam"));
ADDRGP4 $832
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 1638
;1638:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 52
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $1248
ADDRLP4 52
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $1248
line 1639
;1639:			    s = va("%s: %s", "Blue", uiInfo.teamList[i].teamName);
ADDRGP4 $840
ARGP4
ADDRGP4 $841
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 1640
;1640:			  }
line 1641
;1641:      break;
ADDRGP4 $1248
JUMPV
LABELV $1264
line 1643
;1642:    case UI_REDTEAMNAME:
;1643:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_redTeam"));
ADDRGP4 $833
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 1644
;1644:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $1248
ADDRLP4 64
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $1248
line 1645
;1645:			    s = va("%s: %s", "Red", uiInfo.teamList[i].teamName);
ADDRGP4 $840
ARGP4
ADDRGP4 $842
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 1646
;1646:			  }
line 1647
;1647:      break;
ADDRGP4 $1248
JUMPV
LABELV $1269
line 1653
;1648:    case UI_BLUETEAM1:
;1649:		case UI_BLUETEAM2:
;1650:		case UI_BLUETEAM3:
;1651:		case UI_BLUETEAM4:
;1652:		case UI_BLUETEAM5:
;1653:			value = trap_Cvar_VariableValue(va("ui_blueteam%i", ownerDraw-UI_BLUETEAM1 + 1));
ADDRGP4 $848
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 1654
;1654:			if (value <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1270
line 1655
;1655:				text = "Closed";
ADDRLP4 12
ADDRGP4 $855
ASGNP4
line 1656
;1656:			} else if (value == 1) {
ADDRGP4 $1271
JUMPV
LABELV $1270
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1272
line 1657
;1657:				text = "Human";
ADDRLP4 12
ADDRGP4 $858
ASGNP4
line 1658
;1658:			} else {
ADDRGP4 $1273
JUMPV
LABELV $1272
line 1659
;1659:				value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1660
;1660:				if (value >= uiInfo.aliasCount) {
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $1274
line 1661
;1661:					value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1662
;1662:				}
LABELV $1274
line 1663
;1663:				text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ASGNP4
line 1664
;1664:			}
LABELV $1273
LABELV $1271
line 1665
;1665:			s = va("%i. %s", ownerDraw-UI_BLUETEAM1 + 1, text);
ADDRGP4 $1278
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 1666
;1666:      break;
ADDRGP4 $1248
JUMPV
LABELV $1279
line 1672
;1667:    case UI_REDTEAM1:
;1668:		case UI_REDTEAM2:
;1669:		case UI_REDTEAM3:
;1670:		case UI_REDTEAM4:
;1671:		case UI_REDTEAM5:
;1672:			value = trap_Cvar_VariableValue(va("ui_redteam%i", ownerDraw-UI_REDTEAM1 + 1));
ADDRGP4 $849
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 1673
;1673:			if (value <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1280
line 1674
;1674:				text = "Closed";
ADDRLP4 12
ADDRGP4 $855
ASGNP4
line 1675
;1675:			} else if (value == 1) {
ADDRGP4 $1281
JUMPV
LABELV $1280
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1282
line 1676
;1676:				text = "Human";
ADDRLP4 12
ADDRGP4 $858
ASGNP4
line 1677
;1677:			} else {
ADDRGP4 $1283
JUMPV
LABELV $1282
line 1678
;1678:				value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1679
;1679:				if (value >= uiInfo.aliasCount) {
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $1284
line 1680
;1680:					value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1681
;1681:				}
LABELV $1284
line 1682
;1682:				text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ASGNP4
line 1683
;1683:			}
LABELV $1283
LABELV $1281
line 1684
;1684:			s = va("%i. %s", ownerDraw-UI_REDTEAM1 + 1, text);
ADDRGP4 $1278
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 1685
;1685:      break;
ADDRGP4 $1248
JUMPV
LABELV $1288
line 1687
;1686:		case UI_NETSOURCE:
;1687:			if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1294
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+78708
INDIRI4
LEI4 $1289
LABELV $1294
line 1688
;1688:				ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1689
;1689:			}
LABELV $1289
line 1690
;1690:			s = va("Source: %s", netSources[ui_netSource.integer]);
ADDRGP4 $986
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
ASGNP4
line 1691
;1691:			break;
ADDRGP4 $1248
JUMPV
LABELV $1297
line 1693
;1692:		case UI_NETFILTER:
;1693:			if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1302
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1298
LABELV $1302
line 1694
;1694:				ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1695
;1695:			}
LABELV $1298
line 1696
;1696:			s = va("Filter: %s", serverFilters[ui_serverFilterType.integer].description );
ADDRGP4 $1020
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 1697
;1697:			break;
ADDRGP4 $1248
JUMPV
line 1699
;1698:		case UI_TIER:
;1699:			break;
line 1701
;1700:		case UI_TIER_MAPNAME:
;1701:			break;
line 1703
;1702:		case UI_TIER_GAMETYPE:
;1703:			break;
line 1705
;1704:		case UI_ALLMAPS_SELECTION:
;1705:			break;
line 1707
;1706:		case UI_OPPONENT_NAME:
;1707:			break;
LABELV $1310
line 1709
;1708:		case UI_KEYBINDSTATUS:
;1709:			if (Display_KeyBindPending()) {
ADDRLP4 100
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1311
line 1710
;1710:				s = "Waiting for new key... Press ESCAPE to cancel";
ADDRLP4 0
ADDRGP4 $1313
ASGNP4
line 1711
;1711:			} else {
ADDRGP4 $1248
JUMPV
LABELV $1311
line 1712
;1712:				s = "Press ENTER or CLICK to change, Press BACKSPACE to clear";
ADDRLP4 0
ADDRGP4 $1314
ASGNP4
line 1713
;1713:			}
line 1714
;1714:			break;
ADDRGP4 $1248
JUMPV
LABELV $1315
line 1716
;1715:		case UI_SERVERREFRESHDATE:
;1716:			s = UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer));
ADDRGP4 $1316
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 1717
;1717:			break;
line 1719
;1718:    default:
;1719:      break;
LABELV $1248
line 1722
;1720:  }
;1721:
;1722:	if (s) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1321
line 1723
;1723:		return Text_Width(s, scale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $1246
JUMPV
LABELV $1321
line 1725
;1724:	}
;1725:	return 0;
CNSTI4 0
RETI4
LABELV $1246
endproc UI_OwnerDrawWidth 112 12
proc UI_DrawBotName 24 32
line 1728
;1726:}
;1727:
;1728:static void UI_DrawBotName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1729
;1729:	int value = uiInfo.botIndex;
ADDRLP4 0
ADDRGP4 uiInfo+73444
INDIRI4
ASGNI4
line 1730
;1730:	int game = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1325
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1731
;1731:	const char *text = "";
ADDRLP4 4
ADDRGP4 $111
ASGNP4
line 1732
;1732:	if (game >= GT_TEAM) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $1326
line 1733
;1733:		if (value >= uiInfo.characterCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $1328
line 1734
;1734:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1735
;1735:		}
LABELV $1328
line 1736
;1736:		text = uiInfo.characterList[value].name;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ASGNP4
line 1737
;1737:	} else {
ADDRGP4 $1327
JUMPV
LABELV $1326
line 1738
;1738:		if (value >= UI_GetNumBots()) {
ADDRLP4 16
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1332
line 1739
;1739:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1740
;1740:		}
LABELV $1332
line 1741
;1741:		text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 1742
;1742:	}
LABELV $1327
line 1743
;1743:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1744
;1744:}
LABELV $1323
endproc UI_DrawBotName 24 32
proc UI_DrawBotSkill 4 32
line 1746
;1745:
;1746:static void UI_DrawBotSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1747
;1747:	if (uiInfo.skillIndex >= 0 && uiInfo.skillIndex < numSkillLevels) {
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 0
LTI4 $1335
ADDRGP4 uiInfo+96672
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
GEI4 $1335
line 1748
;1748:	  Text_Paint(rect->x, rect->y, scale, color, skillLevels[uiInfo.skillIndex], 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1749
;1749:	}
LABELV $1335
line 1750
;1750:}
LABELV $1334
endproc UI_DrawBotSkill 4 32
proc UI_DrawRedBlue 8 32
line 1752
;1751:
;1752:static void UI_DrawRedBlue(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1753
;1753:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.redBlue == 0) ? "Red" : "Blue", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+78840
INDIRI4
CNSTI4 0
NEI4 $1343
ADDRLP4 0
ADDRGP4 $842
ASGNP4
ADDRGP4 $1344
JUMPV
LABELV $1343
ADDRLP4 0
ADDRGP4 $841
ASGNP4
LABELV $1344
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1754
;1754:}
LABELV $1340
endproc UI_DrawRedBlue 8 32
proc UI_DrawCrosshair 8 20
line 1756
;1755:
;1756:static void UI_DrawCrosshair(rectDef_t *rect, float scale, vec4_t color) {
line 1757
;1757: 	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1758
;1758:	if (uiInfo.currentCrosshair < 0 || uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 0
LTI4 $1350
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 10
LTI4 $1346
LABELV $1350
line 1759
;1759:		uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+119476
CNSTI4 0
ASGNI4
line 1760
;1760:	}
LABELV $1346
line 1761
;1761:	UI_DrawHandlePic( rect->x, rect->y - rect->h, rect->w, rect->h, uiInfo.uiDC.Assets.crosshairShader[uiInfo.currentCrosshair]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+228+61800
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1762
;1762: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1763
;1763:}
LABELV $1345
endproc UI_DrawCrosshair 8 20
proc UI_BuildPlayerList 4176 12
line 1770
;1764:
;1765:/*
;1766:===============
;1767:UI_BuildPlayerList
;1768:===============
;1769:*/
;1770:static void UI_BuildPlayerList() {
line 1775
;1771:	uiClientState_t	cs;
;1772:	int		n, count, team, team2, playerTeamNumber;
;1773:	char	info[MAX_INFO_STRING];
;1774:
;1775:	trap_GetClientState( &cs );
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 1776
;1776:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1040+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1777
;1777:	uiInfo.playerNumber = cs.clientNum;
ADDRGP4 uiInfo+78864
ADDRLP4 1040+8
INDIRI4
ASGNI4
line 1778
;1778:	uiInfo.teamLeader = atoi(Info_ValueForKey(info, "tl"));
ADDRLP4 4
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiInfo+78868
ADDRLP4 4132
INDIRI4
ASGNI4
line 1779
;1779:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1361
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 4140
INDIRI4
ASGNI4
line 1780
;1780:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1781
;1781:	count = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $1362
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4148
INDIRI4
ASGNI4
line 1782
;1782:	uiInfo.playerCount = 0;
ADDRGP4 uiInfo+78844
CNSTI4 0
ASGNI4
line 1783
;1783:	uiInfo.myTeamCount = 0;
ADDRGP4 uiInfo+78848
CNSTI4 0
ASGNI4
line 1784
;1784:	playerTeamNumber = 0;
ADDRLP4 4124
CNSTI4 0
ASGNI4
line 1785
;1785:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1368
JUMPV
LABELV $1365
line 1786
;1786:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1788
;1787:
;1788:		if (info[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1369
line 1789
;1789:			Q_strncpyz( uiInfo.playerNames[uiInfo.playerCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1373
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78844
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1790
;1790:			Q_CleanStr( uiInfo.playerNames[uiInfo.playerCount] );
ADDRGP4 uiInfo+78844
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1791
;1791:			uiInfo.playerCount++;
ADDRLP4 4156
ADDRGP4 uiInfo+78844
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1792
;1792:			team2 = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1361
ARGP4
ADDRLP4 4160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4164
INDIRI4
ASGNI4
line 1793
;1793:			if (team2 == team) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1377
line 1794
;1794:				Q_strncpyz( uiInfo.teamNames[uiInfo.myTeamCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1373
ARGP4
ADDRLP4 4168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78848
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1795
;1795:				Q_CleanStr( uiInfo.teamNames[uiInfo.myTeamCount] );
ADDRGP4 uiInfo+78848
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1796
;1796:				uiInfo.teamClientNums[uiInfo.myTeamCount] = n;
ADDRGP4 uiInfo+78848
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1797
;1797:				if (uiInfo.playerNumber == n) {
ADDRGP4 uiInfo+78864
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1385
line 1798
;1798:					playerTeamNumber = uiInfo.myTeamCount;
ADDRLP4 4124
ADDRGP4 uiInfo+78848
INDIRI4
ASGNI4
line 1799
;1799:				}
LABELV $1385
line 1800
;1800:				uiInfo.myTeamCount++;
ADDRLP4 4172
ADDRGP4 uiInfo+78848
ASGNP4
ADDRLP4 4172
INDIRP4
ADDRLP4 4172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1801
;1801:			}
LABELV $1377
line 1802
;1802:		}
LABELV $1369
line 1803
;1803:	}
LABELV $1366
line 1785
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1368
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $1365
line 1805
;1804:
;1805:	if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
NEI4 $1390
line 1806
;1806:		trap_Cvar_Set("cg_selectedPlayer", va("%d", playerTeamNumber));
ADDRGP4 $715
ARGP4
ADDRLP4 4124
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1393
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1807
;1807:	}
LABELV $1390
line 1809
;1808:
;1809:	n = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1393
ARGP4
ADDRLP4 4152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4152
INDIRF4
CVFI4 4
ASGNI4
line 1810
;1810:	if (n < 0 || n > uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1397
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
LEI4 $1394
LABELV $1397
line 1811
;1811:		n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1812
;1812:	}
LABELV $1394
line 1813
;1813:	if (n < uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $1398
line 1814
;1814:		trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[n]);
ADDRGP4 $1401
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1815
;1815:	}
LABELV $1398
line 1816
;1816:}
LABELV $1355
endproc UI_BuildPlayerList 4176 12
proc UI_DrawSelectedPlayer 16 32
line 1819
;1817:
;1818:
;1819:static void UI_DrawSelectedPlayer(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1820
;1820:	if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78856
INDIRI4
LEI4 $1404
line 1821
;1821:		uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78856
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1822
;1822:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 1823
;1823:	}
LABELV $1404
line 1824
;1824:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.teamLeader) ? UI_Cvar_VariableString("cg_selectedPlayerName") : UI_Cvar_VariableString("name") , 0, 0, textStyle);
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
EQI4 $1413
ADDRGP4 $1401
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $1414
JUMPV
LABELV $1413
ADDRGP4 $1411
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $1414
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1825
;1825:}
LABELV $1403
endproc UI_DrawSelectedPlayer 16 32
proc UI_DrawServerRefreshDate 80 32
line 1827
;1826:
;1827:static void UI_DrawServerRefreshDate(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1828
;1828:	if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
EQI4 $1416
line 1830
;1829:		vec4_t lowLight, newColor;
;1830:		lowLight[0] = 0.8 * color[0]; 
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1831
;1831:		lowLight[1] = 0.8 * color[1]; 
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1832
;1832:		lowLight[2] = 0.8 * color[2]; 
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1833
;1833:		lowLight[3] = 0.8 * color[3]; 
ADDRLP4 0+12
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 1834
;1834:		LerpColor(color,lowLight,newColor,0.5+0.5*sin(uiInfo.uiDC.realTime / PULSE_DIVISOR));
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 1835
;1835:	  Text_Paint(rect->x, rect->y, scale, newColor, va("Getting info for %d servers (ESC to cancel)", trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 $1424
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1836
;1836:	} else {
ADDRGP4 $1417
JUMPV
LABELV $1416
line 1838
;1837:		char buff[64];
;1838:		Q_strncpyz(buff, UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer)), 64);
ADDRGP4 $1316
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1839
;1839:	  Text_Paint(rect->x, rect->y, scale, color, va("Refresh Time: %s", buff), 0, 0, textStyle);
ADDRGP4 $1427
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1840
;1840:	}
LABELV $1417
line 1841
;1841:}
LABELV $1415
endproc UI_DrawServerRefreshDate 80 32
proc UI_DrawServerMOTD 24 32
line 1843
;1842:
;1843:static void UI_DrawServerMOTD(rectDef_t *rect, float scale, vec4_t color) {
line 1844
;1844:	if (uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99264+10436
INDIRI4
CNSTI4 0
EQI4 $1429
line 1847
;1845:		float maxX;
;1846:	 
;1847:		if (uiInfo.serverStatus.motdWidth == -1) {
ADDRGP4 uiInfo+99264+10440
INDIRI4
CNSTI4 -1
NEI4 $1433
line 1848
;1848:			uiInfo.serverStatus.motdWidth = 0;
ADDRGP4 uiInfo+99264+10440
CNSTI4 0
ASGNI4
line 1849
;1849:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+99264+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1850
;1850:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1851
;1851:		}
LABELV $1433
line 1853
;1852:
;1853:		if (uiInfo.serverStatus.motdOffset > uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10436
INDIRI4
LEI4 $1443
line 1854
;1854:			uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+99264+10452
CNSTI4 0
ASGNI4
line 1855
;1855:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+99264+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1856
;1856:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1857
;1857:		}
LABELV $1443
line 1859
;1858:
;1859:		if (uiInfo.uiDC.realTime > uiInfo.serverStatus.motdTime) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+99264+10456
INDIRI4
LEI4 $1455
line 1860
;1860:			uiInfo.serverStatus.motdTime = uiInfo.uiDC.realTime + 10;
ADDRGP4 uiInfo+99264+10456
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1861
;1861:			if (uiInfo.serverStatus.motdPaintX <= rect->x + 2) {
ADDRGP4 uiInfo+99264+10444
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1463
line 1862
;1862:				if (uiInfo.serverStatus.motdOffset < uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10436
INDIRI4
GEI4 $1467
line 1863
;1863:					uiInfo.serverStatus.motdPaintX += Text_Width(&uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], scale, 1) - 1;
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10460
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 uiInfo+99264+10444
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 1864
;1864:					uiInfo.serverStatus.motdOffset++;
ADDRLP4 12
ADDRGP4 uiInfo+99264+10452
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1865
;1865:				} else {
ADDRGP4 $1464
JUMPV
LABELV $1467
line 1866
;1866:					uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+99264+10452
CNSTI4 0
ASGNI4
line 1867
;1867:					if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 0
LTI4 $1483
line 1868
;1868:						uiInfo.serverStatus.motdPaintX = uiInfo.serverStatus.motdPaintX2;
ADDRGP4 uiInfo+99264+10444
ADDRGP4 uiInfo+99264+10448
INDIRI4
ASGNI4
line 1869
;1869:					} else {
ADDRGP4 $1484
JUMPV
LABELV $1483
line 1870
;1870:						uiInfo.serverStatus.motdPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+99264+10444
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1871
;1871:					}
LABELV $1484
line 1872
;1872:					uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1873
;1873:				}
line 1874
;1874:			} else {
ADDRGP4 $1464
JUMPV
LABELV $1463
line 1876
;1875:				//serverStatus.motdPaintX--;
;1876:				uiInfo.serverStatus.motdPaintX -= 2;
ADDRLP4 4
ADDRGP4 uiInfo+99264+10444
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1877
;1877:				if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 0
LTI4 $1497
line 1879
;1878:					//serverStatus.motdPaintX2--;
;1879:					uiInfo.serverStatus.motdPaintX2 -= 2;
ADDRLP4 8
ADDRGP4 uiInfo+99264+10448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1880
;1880:				}
LABELV $1497
line 1881
;1881:			}
LABELV $1464
line 1882
;1882:		}
LABELV $1455
line 1884
;1883:
;1884:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1885
;1885:		Text_Paint_Limit(&maxX, uiInfo.serverStatus.motdPaintX, rect->y + rect->h - 3, scale, color, &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], 0, 0); 
ADDRLP4 0
ARGP4
ADDRGP4 uiInfo+99264+10444
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10460
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 1886
;1886:		if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 0
LTI4 $1509
line 1887
;1887:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1888
;1888:			Text_Paint_Limit(&maxX2, uiInfo.serverStatus.motdPaintX2, rect->y + rect->h - 3, scale, color, uiInfo.serverStatus.motd, 0, uiInfo.serverStatus.motdOffset); 
ADDRLP4 12
ARGP4
ADDRGP4 uiInfo+99264+10448
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+99264+10460
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 uiInfo+99264+10452
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 1889
;1889:		}
LABELV $1509
line 1890
;1890:		if (uiInfo.serverStatus.motdOffset && maxX > 0) {
ADDRGP4 uiInfo+99264+10452
INDIRI4
CNSTI4 0
EQI4 $1519
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1519
line 1892
;1891:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;1892:			if (uiInfo.serverStatus.motdPaintX2 == -1) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 -1
NEI4 $1520
line 1893
;1893:						uiInfo.serverStatus.motdPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+99264+10448
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1894
;1894:			}
line 1895
;1895:		} else {
ADDRGP4 $1520
JUMPV
LABELV $1519
line 1896
;1896:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1897
;1897:		}
LABELV $1520
line 1899
;1898:
;1899:	}
LABELV $1429
line 1900
;1900:}
LABELV $1428
endproc UI_DrawServerMOTD 24 32
proc UI_DrawKeyBindStatus 8 32
line 1902
;1901:
;1902:static void UI_DrawKeyBindStatus(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1904
;1903://	int ofs = 0; TTimo: unused
;1904:	if (Display_KeyBindPending()) {
ADDRLP4 0
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1532
line 1905
;1905:		Text_Paint(rect->x, rect->y, scale, color, "Waiting for new key... Press ESCAPE to cancel", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1313
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1906
;1906:	} else {
ADDRGP4 $1533
JUMPV
LABELV $1532
line 1907
;1907:		Text_Paint(rect->x, rect->y, scale, color, "Press ENTER or CLICK to change, Press BACKSPACE to clear", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1314
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1908
;1908:	}
LABELV $1533
line 1909
;1909:}
LABELV $1531
endproc UI_DrawKeyBindStatus 8 32
proc UI_DrawGLInfo 1336 32
line 1911
;1910:
;1911:static void UI_DrawGLInfo(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1917
;1912:	char * eptr;
;1913:	char buff[1024];
;1914:	const char *lines[64];
;1915:	int y, numLines, i;
;1916:
;1917:	Text_Paint(rect->x + 2, rect->y, scale, color, va("VENDOR: %s", uiInfo.uiDC.glconfig.vendor_string), 0, 30, textStyle);
ADDRGP4 $1535
ARGP4
ADDRGP4 uiInfo+62068+1024
ARGP4
ADDRLP4 1296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1918
;1918:	Text_Paint(rect->x + 2, rect->y + 15, scale, color, va("VERSION: %s: %s", uiInfo.uiDC.glconfig.version_string,uiInfo.uiDC.glconfig.renderer_string), 0, 30, textStyle);
ADDRGP4 $1538
ARGP4
ADDRGP4 uiInfo+62068+2048
ARGP4
ADDRGP4 uiInfo+62068
ARGP4
ADDRLP4 1304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1308
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1308
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1097859072
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1919
;1919:	Text_Paint(rect->x + 2, rect->y + 30, scale, color, va ("PIXELFORMAT: color(%d-bits) Z(%d-bits) stencil(%d-bits)", uiInfo.uiDC.glconfig.colorBits, uiInfo.uiDC.glconfig.depthBits, uiInfo.uiDC.glconfig.stencilBits), 0, 30, textStyle);
ADDRGP4 $1542
ARGP4
ADDRGP4 uiInfo+62068+11272
INDIRI4
ARGI4
ADDRGP4 uiInfo+62068+11276
INDIRI4
ARGI4
ADDRGP4 uiInfo+62068+11280
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1316
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1316
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1312
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1925
;1920:
;1921:	// build null terminated extension strings
;1922:  // TTimo: https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;1923:  // in TA this was not directly crashing, but displaying a nasty broken shader right in the middle
;1924:  // brought down the string size to 1024, there's not much that can be shown on the screen anyway
;1925:	Q_strncpyz(buff, uiInfo.uiDC.glconfig.extensions_string, 1024);
ADDRLP4 272
ARGP4
ADDRGP4 uiInfo+62068+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1926
;1926:	eptr = buff;
ADDRLP4 0
ADDRLP4 272
ASGNP4
line 1927
;1927:	y = rect->y + 45;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1110704128
ADDF4
CVFI4 4
ASGNI4
line 1928
;1928:	numLines = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1552
JUMPV
line 1930
;1929:	while ( y < rect->y + rect->h && *eptr )
;1930:	{
LABELV $1554
line 1932
;1931:		while ( *eptr && *eptr == ' ' )
;1932:			*eptr++ = '\0';
ADDRLP4 1320
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1320
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1555
line 1931
ADDRLP4 1324
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
EQI4 $1557
ADDRLP4 1324
INDIRI4
CNSTI4 32
EQI4 $1554
LABELV $1557
line 1935
;1933:
;1934:		// track start of valid string
;1935:		if (*eptr && *eptr != ' ') {
ADDRLP4 1328
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 0
EQI4 $1561
ADDRLP4 1328
INDIRI4
CNSTI4 32
EQI4 $1561
line 1936
;1936:			lines[numLines++] = eptr;
ADDRLP4 1332
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 1332
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1937
;1937:		}
ADDRGP4 $1561
JUMPV
LABELV $1560
line 1940
;1938:
;1939:		while ( *eptr && *eptr != ' ' )
;1940:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1561
line 1939
ADDRLP4 1332
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
EQI4 $1563
ADDRLP4 1332
INDIRI4
CNSTI4 32
NEI4 $1560
LABELV $1563
line 1941
;1941:	}
LABELV $1552
line 1929
ADDRLP4 1320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 1320
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1320
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $1564
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1555
LABELV $1564
line 1943
;1942:
;1943:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1566
JUMPV
LABELV $1565
line 1944
;1944:	while (i < numLines) {
line 1945
;1945:		Text_Paint(rect->x + 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1324
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 1324
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1946
;1946:		if (i < numLines) {
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1568
line 1947
;1947:			Text_Paint(rect->x + rect->w / 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRLP4 1332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1332
INDIRP4
INDIRF4
ADDRLP4 1332
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1328
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 1328
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1948
;1948:		}
LABELV $1568
line 1949
;1949:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1950
;1950:		if (y > rect->y + rect->h - 11) {
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 1328
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1328
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1093664768
SUBF4
LEF4 $1570
line 1951
;1951:			break;
ADDRGP4 $1567
JUMPV
LABELV $1570
line 1953
;1952:		}
;1953:	}
LABELV $1566
line 1944
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1565
LABELV $1567
line 1956
;1954:
;1955:
;1956:}
LABELV $1534
endproc UI_DrawGLInfo 1336 32
proc UI_OwnerDraw 24 24
line 1960
;1957:
;1958:// FIXME: table drive
;1959://
;1960:static void UI_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1963
;1961:	rectDef_t rect;
;1962:
;1963:  rect.x = x + text_x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 1964
;1964:  rect.y = y + text_y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ADDRFP4 20
INDIRF4
ADDF4
ASGNF4
line 1965
;1965:  rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 1966
;1966:  rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 1968
;1967:
;1968:  switch (ownerDraw) {
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 200
LTI4 $1577
ADDRLP4 16
INDIRI4
CNSTI4 256
GTI4 $1577
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1626-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1626
address $1578
address $1579
address $1580
address $1581
address $1582
address $1585
address $1588
address $1592
address $1593
address $1594
address $1595
address $1595
address $1595
address $1595
address $1595
address $1596
address $1596
address $1596
address $1596
address $1596
address $1597
address $1598
address $1600
address $1601
address $1602
address $1603
address $1604
address $1605
address $1606
address $1609
address $1607
address $1610
address $1608
address $1611
address $1612
address $1613
address $1614
address $1616
address $1577
address $1617
address $1618
address $1619
address $1620
address $1621
address $1590
address $1586
address $1599
address $1622
address $1623
address $1624
address $1625
address $1583
address $1589
address $1587
address $1584
address $1591
address $1615
code
LABELV $1578
line 1970
;1969:    case UI_HANDICAP:
;1970:      UI_DrawHandicap(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandicap
CALLV
pop
line 1971
;1971:      break;
ADDRGP4 $1577
JUMPV
LABELV $1579
line 1973
;1972:    case UI_EFFECTS:
;1973:      UI_DrawEffects(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawEffects
CALLV
pop
line 1974
;1974:      break;
ADDRGP4 $1577
JUMPV
LABELV $1580
line 1976
;1975:    case UI_PLAYERMODEL:
;1976:      UI_DrawPlayerModel(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawPlayerModel
CALLV
pop
line 1977
;1977:      break;
ADDRGP4 $1577
JUMPV
LABELV $1581
line 1979
;1978:    case UI_CLANNAME:
;1979:      UI_DrawClanName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawClanName
CALLV
pop
line 1980
;1980:      break;
ADDRGP4 $1577
JUMPV
LABELV $1582
line 1982
;1981:    case UI_CLANLOGO:
;1982:      UI_DrawClanLogo(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanLogo
CALLV
pop
line 1983
;1983:      break;
ADDRGP4 $1577
JUMPV
LABELV $1583
line 1985
;1984:    case UI_CLANCINEMATIC:
;1985:      UI_DrawClanCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanCinematic
CALLV
pop
line 1986
;1986:      break;
ADDRGP4 $1577
JUMPV
LABELV $1584
line 1988
;1987:    case UI_PREVIEWCINEMATIC:
;1988:      UI_DrawPreviewCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPreviewCinematic
CALLV
pop
line 1989
;1989:      break;
ADDRGP4 $1577
JUMPV
LABELV $1585
line 1991
;1990:    case UI_GAMETYPE:
;1991:      UI_DrawGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGameType
CALLV
pop
line 1992
;1992:      break;
ADDRGP4 $1577
JUMPV
LABELV $1586
line 1994
;1993:    case UI_NETGAMETYPE:
;1994:      UI_DrawNetGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetGameType
CALLV
pop
line 1995
;1995:      break;
ADDRGP4 $1577
JUMPV
LABELV $1587
line 1997
;1996:    case UI_JOINGAMETYPE:
;1997:	  UI_DrawJoinGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawJoinGameType
CALLV
pop
line 1998
;1998:	  break;
ADDRGP4 $1577
JUMPV
LABELV $1588
line 2000
;1999:    case UI_MAPPREVIEW:
;2000:      UI_DrawMapPreview(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 2001
;2001:      break;
ADDRGP4 $1577
JUMPV
LABELV $1589
line 2003
;2002:    case UI_MAP_TIMETOBEAT:
;2003:      UI_DrawMapTimeToBeat(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapTimeToBeat
CALLV
pop
line 2004
;2004:      break;
ADDRGP4 $1577
JUMPV
LABELV $1590
line 2006
;2005:    case UI_MAPCINEMATIC:
;2006:      UI_DrawMapCinematic(&rect, scale, color, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2007
;2007:      break;
ADDRGP4 $1577
JUMPV
LABELV $1591
line 2009
;2008:    case UI_STARTMAPCINEMATIC:
;2009:      UI_DrawMapCinematic(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2010
;2010:      break;
ADDRGP4 $1577
JUMPV
LABELV $1592
line 2012
;2011:    case UI_SKILL:
;2012:      UI_DrawSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkill
CALLV
pop
line 2013
;2013:      break;
ADDRGP4 $1577
JUMPV
LABELV $1593
line 2015
;2014:    case UI_BLUETEAMNAME:
;2015:      UI_DrawTeamName(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2016
;2016:      break;
ADDRGP4 $1577
JUMPV
LABELV $1594
line 2018
;2017:    case UI_REDTEAMNAME:
;2018:      UI_DrawTeamName(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2019
;2019:      break;
ADDRGP4 $1577
JUMPV
LABELV $1595
line 2025
;2020:    case UI_BLUETEAM1:
;2021:		case UI_BLUETEAM2:
;2022:		case UI_BLUETEAM3:
;2023:		case UI_BLUETEAM4:
;2024:		case UI_BLUETEAM5:
;2025:      UI_DrawTeamMember(&rect, scale, color, qtrue, ownerDraw - UI_BLUETEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 210
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2026
;2026:      break;
ADDRGP4 $1577
JUMPV
LABELV $1596
line 2032
;2027:    case UI_REDTEAM1:
;2028:		case UI_REDTEAM2:
;2029:		case UI_REDTEAM3:
;2030:		case UI_REDTEAM4:
;2031:		case UI_REDTEAM5:
;2032:      UI_DrawTeamMember(&rect, scale, color, qfalse, ownerDraw - UI_REDTEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2033
;2033:      break;
ADDRGP4 $1577
JUMPV
LABELV $1597
line 2035
;2034:		case UI_NETSOURCE:
;2035:      UI_DrawNetSource(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetSource
CALLV
pop
line 2036
;2036:			break;
ADDRGP4 $1577
JUMPV
LABELV $1598
line 2038
;2037:    case UI_NETMAPPREVIEW:
;2038:      UI_DrawNetMapPreview(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 2039
;2039:      break;
ADDRGP4 $1577
JUMPV
LABELV $1599
line 2041
;2040:    case UI_NETMAPCINEMATIC:
;2041:      UI_DrawNetMapCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapCinematic
CALLV
pop
line 2042
;2042:      break;
ADDRGP4 $1577
JUMPV
LABELV $1600
line 2044
;2043:		case UI_NETFILTER:
;2044:      UI_DrawNetFilter(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetFilter
CALLV
pop
line 2045
;2045:			break;
ADDRGP4 $1577
JUMPV
LABELV $1601
line 2047
;2046:		case UI_TIER:
;2047:			UI_DrawTier(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTier
CALLV
pop
line 2048
;2048:			break;
ADDRGP4 $1577
JUMPV
LABELV $1602
line 2050
;2049:		case UI_OPPONENTMODEL:
;2050:			UI_DrawOpponent(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawOpponent
CALLV
pop
line 2051
;2051:			break;
ADDRGP4 $1577
JUMPV
LABELV $1603
line 2053
;2052:		case UI_TIERMAP1:
;2053:			UI_DrawTierMap(&rect, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2054
;2054:			break;
ADDRGP4 $1577
JUMPV
LABELV $1604
line 2056
;2055:		case UI_TIERMAP2:
;2056:			UI_DrawTierMap(&rect, 1);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2057
;2057:			break;
ADDRGP4 $1577
JUMPV
LABELV $1605
line 2059
;2058:		case UI_TIERMAP3:
;2059:			UI_DrawTierMap(&rect, 2);
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2060
;2060:			break;
ADDRGP4 $1577
JUMPV
LABELV $1606
line 2062
;2061:		case UI_PLAYERLOGO:
;2062:			UI_DrawPlayerLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogo
CALLV
pop
line 2063
;2063:			break;
ADDRGP4 $1577
JUMPV
LABELV $1607
line 2065
;2064:		case UI_PLAYERLOGO_METAL:
;2065:			UI_DrawPlayerLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoMetal
CALLV
pop
line 2066
;2066:			break;
ADDRGP4 $1577
JUMPV
LABELV $1608
line 2068
;2067:		case UI_PLAYERLOGO_NAME:
;2068:			UI_DrawPlayerLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoName
CALLV
pop
line 2069
;2069:			break;
ADDRGP4 $1577
JUMPV
LABELV $1609
line 2071
;2070:		case UI_OPPONENTLOGO:
;2071:			UI_DrawOpponentLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogo
CALLV
pop
line 2072
;2072:			break;
ADDRGP4 $1577
JUMPV
LABELV $1610
line 2074
;2073:		case UI_OPPONENTLOGO_METAL:
;2074:			UI_DrawOpponentLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoMetal
CALLV
pop
line 2075
;2075:			break;
ADDRGP4 $1577
JUMPV
LABELV $1611
line 2077
;2076:		case UI_OPPONENTLOGO_NAME:
;2077:			UI_DrawOpponentLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoName
CALLV
pop
line 2078
;2078:			break;
ADDRGP4 $1577
JUMPV
LABELV $1612
line 2080
;2079:		case UI_TIER_MAPNAME:
;2080:			UI_DrawTierMapName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierMapName
CALLV
pop
line 2081
;2081:			break;
ADDRGP4 $1577
JUMPV
LABELV $1613
line 2083
;2082:		case UI_TIER_GAMETYPE:
;2083:			UI_DrawTierGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierGameType
CALLV
pop
line 2084
;2084:			break;
ADDRGP4 $1577
JUMPV
LABELV $1614
line 2086
;2085:		case UI_ALLMAPS_SELECTION:
;2086:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2087
;2087:			break;
ADDRGP4 $1577
JUMPV
LABELV $1615
line 2089
;2088:		case UI_MAPS_SELECTION:
;2089:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2090
;2090:			break;
ADDRGP4 $1577
JUMPV
LABELV $1616
line 2092
;2091:		case UI_OPPONENT_NAME:
;2092:			UI_DrawOpponentName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawOpponentName
CALLV
pop
line 2093
;2093:			break;
ADDRGP4 $1577
JUMPV
LABELV $1617
line 2095
;2094:		case UI_BOTNAME:
;2095:			UI_DrawBotName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotName
CALLV
pop
line 2096
;2096:			break;
ADDRGP4 $1577
JUMPV
LABELV $1618
line 2098
;2097:		case UI_BOTSKILL:
;2098:			UI_DrawBotSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotSkill
CALLV
pop
line 2099
;2099:			break;
ADDRGP4 $1577
JUMPV
LABELV $1619
line 2101
;2100:		case UI_REDBLUE:
;2101:			UI_DrawRedBlue(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawRedBlue
CALLV
pop
line 2102
;2102:			break;
ADDRGP4 $1577
JUMPV
LABELV $1620
line 2104
;2103:		case UI_CROSSHAIR:
;2104:			UI_DrawCrosshair(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawCrosshair
CALLV
pop
line 2105
;2105:			break;
ADDRGP4 $1577
JUMPV
LABELV $1621
line 2107
;2106:		case UI_SELECTEDPLAYER:
;2107:			UI_DrawSelectedPlayer(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSelectedPlayer
CALLV
pop
line 2108
;2108:			break;
ADDRGP4 $1577
JUMPV
LABELV $1622
line 2110
;2109:		case UI_SERVERREFRESHDATE:
;2110:			UI_DrawServerRefreshDate(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerRefreshDate
CALLV
pop
line 2111
;2111:			break;
ADDRGP4 $1577
JUMPV
LABELV $1623
line 2113
;2112:		case UI_SERVERMOTD:
;2113:			UI_DrawServerMOTD(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawServerMOTD
CALLV
pop
line 2114
;2114:			break;
ADDRGP4 $1577
JUMPV
LABELV $1624
line 2116
;2115:		case UI_GLINFO:
;2116:			UI_DrawGLInfo(&rect,scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGLInfo
CALLV
pop
line 2117
;2117:			break;
ADDRGP4 $1577
JUMPV
LABELV $1625
line 2119
;2118:		case UI_KEYBINDSTATUS:
;2119:			UI_DrawKeyBindStatus(&rect,scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawKeyBindStatus
CALLV
pop
line 2120
;2120:			break;
line 2122
;2121:    default:
;2122:      break;
LABELV $1577
line 2125
;2123:  }
;2124:
;2125:}
LABELV $1572
endproc UI_OwnerDraw 24 24
proc UI_OwnerDrawVisible 8 8
line 2127
;2126:
;2127:static qboolean UI_OwnerDrawVisible(int flags) {
line 2128
;2128:	qboolean vis = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1630
JUMPV
LABELV $1629
line 2130
;2129:
;2130:	while (flags) {
line 2132
;2131:
;2132:		if (flags & UI_SHOW_FFA) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1632
line 2133
;2133:			if (trap_Cvar_VariableValue("g_gametype") != GT_FFA) {
ADDRGP4 $1325
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $1634
line 2134
;2134:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2135
;2135:			}
LABELV $1634
line 2136
;2136:			flags &= ~UI_SHOW_FFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2137
;2137:		}
LABELV $1632
line 2139
;2138:
;2139:		if (flags & UI_SHOW_NOTFFA) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1636
line 2140
;2140:			if (trap_Cvar_VariableValue("g_gametype") == GT_FFA) {
ADDRGP4 $1325
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1638
line 2141
;2141:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2142
;2142:			}
LABELV $1638
line 2143
;2143:			flags &= ~UI_SHOW_NOTFFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2144
;2144:		}
LABELV $1636
line 2146
;2145:
;2146:		if (flags & UI_SHOW_LEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1640
line 2148
;2147:			// these need to show when this client can give orders to a player or a group
;2148:			if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
NEI4 $1642
line 2149
;2149:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2150
;2150:			} else {
ADDRGP4 $1643
JUMPV
LABELV $1642
line 2152
;2151:				// if showing yourself
;2152:				if (ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $1645
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ADDRGP4 uiInfo+78864
INDIRI4
NEI4 $1645
line 2153
;2153:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2154
;2154:				}
LABELV $1645
line 2155
;2155:			}
LABELV $1643
line 2156
;2156:			flags &= ~UI_SHOW_LEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2157
;2157:		} 
LABELV $1640
line 2158
;2158:		if (flags & UI_SHOW_NOTLEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1652
line 2160
;2159:			// these need to show when this client is assigning their own status or they are NOT the leader
;2160:			if (uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
EQI4 $1654
line 2162
;2161:				// if not showing yourself
;2162:				if (!(ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber)) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $1664
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ADDRGP4 uiInfo+78864
INDIRI4
EQI4 $1657
LABELV $1664
line 2163
;2163:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2164
;2164:				}
LABELV $1657
line 2166
;2165:				// these need to show when this client can give orders to a player or a group
;2166:			}
LABELV $1654
line 2167
;2167:			flags &= ~UI_SHOW_NOTLEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2168
;2168:		} 
LABELV $1652
line 2169
;2169:		if (flags & UI_SHOW_FAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1665
line 2171
;2170:			// this assumes you only put this type of display flag on something showing in the proper context
;2171:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $1667
line 2172
;2172:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2173
;2173:			}
LABELV $1667
line 2174
;2174:			flags &= ~UI_SHOW_FAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2175
;2175:		} 
LABELV $1665
line 2176
;2176:		if (flags & UI_SHOW_NOTFAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1670
line 2178
;2177:			// this assumes you only put this type of display flag on something showing in the proper context
;2178:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $1672
line 2179
;2179:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2180
;2180:			}
LABELV $1672
line 2181
;2181:			flags &= ~UI_SHOW_NOTFAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2182
;2182:		} 
LABELV $1670
line 2183
;2183:		if (flags & UI_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1675
line 2184
;2184:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum <= GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_gameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $1677
line 2185
;2185:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2186
;2186:			}
LABELV $1677
line 2187
;2187:			flags &= ~UI_SHOW_ANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2188
;2188:		} 
LABELV $1675
line 2189
;2189:		if (flags & UI_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1682
line 2190
;2190:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum > GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_gameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1684
line 2191
;2191:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2192
;2192:			}
LABELV $1684
line 2193
;2193:			flags &= ~UI_SHOW_ANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2194
;2194:		} 
LABELV $1682
line 2195
;2195:		if (flags & UI_SHOW_NETANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1689
line 2196
;2196:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum <= GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $1691
line 2197
;2197:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2198
;2198:			}
LABELV $1691
line 2199
;2199:			flags &= ~UI_SHOW_NETANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2200
;2200:		} 
LABELV $1689
line 2201
;2201:		if (flags & UI_SHOW_NETANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1696
line 2202
;2202:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum > GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1698
line 2203
;2203:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2204
;2204:			}
LABELV $1698
line 2205
;2205:			flags &= ~UI_SHOW_NETANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2206
;2206:		} 
LABELV $1696
line 2207
;2207:		if (flags & UI_SHOW_NEWHIGHSCORE) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1703
line 2208
;2208:			if (uiInfo.newHighScoreTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+73416
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
GEI4 $1705
line 2209
;2209:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2210
;2210:			} else {
ADDRGP4 $1706
JUMPV
LABELV $1705
line 2211
;2211:				if (uiInfo.soundHighScore) {
ADDRGP4 uiInfo+73436
INDIRI4
CNSTI4 0
EQI4 $1709
line 2212
;2212:					if (trap_Cvar_VariableValue("sv_killserver") == 0) {
ADDRGP4 $396
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1712
line 2214
;2213:						// wait on server to go down before playing sound
;2214:						trap_S_StartLocalSound(uiInfo.newHighScoreSound, CHAN_ANNOUNCER);
ADDRGP4 uiInfo+119484
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2215
;2215:						uiInfo.soundHighScore = qfalse;
ADDRGP4 uiInfo+73436
CNSTI4 0
ASGNI4
line 2216
;2216:					}
LABELV $1712
line 2217
;2217:				}
LABELV $1709
line 2218
;2218:			}
LABELV $1706
line 2219
;2219:			flags &= ~UI_SHOW_NEWHIGHSCORE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 2220
;2220:		} 
LABELV $1703
line 2221
;2221:		if (flags & UI_SHOW_NEWBESTTIME) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1716
line 2222
;2222:			if (uiInfo.newBestTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+73420
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
GEI4 $1718
line 2223
;2223:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2224
;2224:			}
LABELV $1718
line 2225
;2225:			flags &= ~UI_SHOW_NEWBESTTIME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2226
;2226:		} 
LABELV $1716
line 2227
;2227:		if (flags & UI_SHOW_DEMOAVAILABLE) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1722
line 2228
;2228:			if (!uiInfo.demoAvailable) {
ADDRGP4 uiInfo+73432
INDIRI4
CNSTI4 0
NEI4 $1724
line 2229
;2229:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2230
;2230:			}
LABELV $1724
line 2231
;2231:			flags &= ~UI_SHOW_DEMOAVAILABLE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 2232
;2232:		} else {
ADDRGP4 $1723
JUMPV
LABELV $1722
line 2233
;2233:			flags = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 2234
;2234:		}
LABELV $1723
line 2235
;2235:	}
LABELV $1630
line 2130
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1629
line 2236
;2236:  return vis;
ADDRLP4 0
INDIRI4
RETI4
LABELV $1628
endproc UI_OwnerDrawVisible 8 8
proc UI_Handicap_HandleKey 20 12
line 2239
;2237:}
;2238:
;2239:static qboolean UI_Handicap_HandleKey(int flags, float *special, int key) {
line 2240
;2240:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1732
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1732
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1732
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1728
LABELV $1732
line 2242
;2241:    int h;
;2242:    h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $698
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2243
;2243:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1733
line 2244
;2244:	    h -= 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 2245
;2245:		} else {
ADDRGP4 $1734
JUMPV
LABELV $1733
line 2246
;2246:	    h += 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2247
;2247:		}
LABELV $1734
line 2248
;2248:    if (h > 100) {
ADDRLP4 4
INDIRI4
CNSTI4 100
LEI4 $1735
line 2249
;2249:      h = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 2250
;2250:    } else if (h < 0) {
ADDRGP4 $1736
JUMPV
LABELV $1735
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1737
line 2251
;2251:			h = 100;
ADDRLP4 4
CNSTI4 100
ASGNI4
line 2252
;2252:		}
LABELV $1737
LABELV $1736
line 2253
;2253:  	trap_Cvar_Set( "handicap", va( "%i", h) );
ADDRGP4 $1739
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $698
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2254
;2254:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1727
JUMPV
LABELV $1728
line 2256
;2255:  }
;2256:  return qfalse;
CNSTI4 0
RETI4
LABELV $1727
endproc UI_Handicap_HandleKey 20 12
proc UI_Effects_HandleKey 8 8
line 2259
;2257:}
;2258:
;2259:static qboolean UI_Effects_HandleKey(int flags, float *special, int key) {
line 2260
;2260:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1745
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1745
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1745
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1741
LABELV $1745
line 2262
;2261:
;2262:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1746
line 2263
;2263:	    uiInfo.effectsColor--;
ADDRLP4 4
ADDRGP4 uiInfo+136904
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2264
;2264:		} else {
ADDRGP4 $1747
JUMPV
LABELV $1746
line 2265
;2265:	    uiInfo.effectsColor++;
ADDRLP4 4
ADDRGP4 uiInfo+136904
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2266
;2266:		}
LABELV $1747
line 2268
;2267:
;2268:    if( uiInfo.effectsColor > 6 ) {
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 6
LEI4 $1750
line 2269
;2269:	  	uiInfo.effectsColor = 0;
ADDRGP4 uiInfo+136904
CNSTI4 0
ASGNI4
line 2270
;2270:		} else if (uiInfo.effectsColor < 0) {
ADDRGP4 $1751
JUMPV
LABELV $1750
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 0
GEI4 $1754
line 2271
;2271:	  	uiInfo.effectsColor = 6;
ADDRGP4 uiInfo+136904
CNSTI4 6
ASGNI4
line 2272
;2272:		}
LABELV $1754
LABELV $1751
line 2274
;2273:
;2274:	  trap_Cvar_SetValue( "color1", uitogamecode[uiInfo.effectsColor] );
ADDRGP4 $1758
ARGP4
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 2275
;2275:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1740
JUMPV
LABELV $1741
line 2277
;2276:  }
;2277:  return qfalse;
CNSTI4 0
RETI4
LABELV $1740
endproc UI_Effects_HandleKey 8 8
proc UI_ClanName_HandleKey 16 8
line 2280
;2278:}
;2279:
;2280:static qboolean UI_ClanName_HandleKey(int flags, float *special, int key) {
line 2281
;2281:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1765
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1765
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1765
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1761
LABELV $1765
line 2283
;2282:    int i;
;2283:    i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 2284
;2284:		if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1766
line 2285
;2285:		  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 2286
;2286:			uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -1
ASGNI4
line 2287
;2287:		}
LABELV $1766
line 2288
;2288:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1774
line 2289
;2289:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2290
;2290:		} else {
ADDRGP4 $1775
JUMPV
LABELV $1774
line 2291
;2291:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2292
;2292:		}
LABELV $1775
line 2293
;2293:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1776
line 2294
;2294:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2295
;2295:    } else if (i < 0) {
ADDRGP4 $1777
JUMPV
LABELV $1776
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1779
line 2296
;2296:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2297
;2297:		}
LABELV $1779
LABELV $1777
line 2298
;2298:  	trap_Cvar_Set( "ui_teamName", uiInfo.teamList[i].teamName);
ADDRGP4 $700
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2299
;2299:	UI_HeadCountByTeam();
ADDRGP4 UI_HeadCountByTeam
CALLI4
pop
line 2300
;2300:	UI_FeederSelection(FEEDER_HEADS, 0);
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 2301
;2301:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 2302
;2302:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1760
JUMPV
LABELV $1761
line 2304
;2303:  }
;2304:  return qfalse;
CNSTI4 0
RETI4
LABELV $1760
endproc UI_ClanName_HandleKey 16 8
proc UI_GameType_HandleKey 20 16
line 2307
;2305:}
;2306:
;2307:static qboolean UI_GameType_HandleKey(int flags, float *special, int key, qboolean resetMap) {
line 2308
;2308:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1788
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1788
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1788
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1784
LABELV $1788
line 2309
;2309:		int oldCount = UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 2312
;2310:
;2311:		// hard coded mess here
;2312:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1789
line 2313
;2313:			ui_gameType.integer--;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2314
;2314:			if (ui_gameType.integer == 2) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $1792
line 2315
;2315:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 2316
;2316:			} else if (ui_gameType.integer < 2) {
ADDRGP4 $1790
JUMPV
LABELV $1792
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
GEI4 $1790
line 2317
;2317:				ui_gameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_gameType+12
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2318
;2318:			}
line 2319
;2319:		} else {
ADDRGP4 $1790
JUMPV
LABELV $1789
line 2320
;2320:			ui_gameType.integer++;
ADDRLP4 12
ADDRGP4 ui_gameType+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2321
;2321:			if (ui_gameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 ui_gameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
LTI4 $1802
line 2322
;2322:				ui_gameType.integer = 1;
ADDRGP4 ui_gameType+12
CNSTI4 1
ASGNI4
line 2323
;2323:			} else if (ui_gameType.integer == 2) {
ADDRGP4 $1803
JUMPV
LABELV $1802
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 2
NEI4 $1807
line 2324
;2324:				ui_gameType.integer = 3;
ADDRGP4 ui_gameType+12
CNSTI4 3
ASGNI4
line 2325
;2325:			}
LABELV $1807
LABELV $1803
line 2326
;2326:		}
LABELV $1790
line 2328
;2327:    
;2328:		if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_TOURNAMENT) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1811
line 2329
;2329:			trap_Cvar_Set("ui_Q3Model", "1");
ADDRGP4 $963
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2330
;2330:		} else {
ADDRGP4 $1812
JUMPV
LABELV $1811
line 2331
;2331:			trap_Cvar_Set("ui_Q3Model", "0");
ADDRGP4 $963
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2332
;2332:		}
LABELV $1812
line 2334
;2333:
;2334:		trap_Cvar_Set("ui_gameType", va("%d", ui_gameType.integer));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1816
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2335
;2335:		UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 2336
;2336:		UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 2337
;2337:		if (resetMap && oldCount != UI_MapCountByGameType(qtrue)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1824
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1824
line 2338
;2338:	  	trap_Cvar_Set( "ui_currentMap", "0");
ADDRGP4 $890
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2339
;2339:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2340
;2340:		}
LABELV $1824
line 2341
;2341:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1783
JUMPV
LABELV $1784
line 2343
;2342:  }
;2343:  return qfalse;
CNSTI4 0
RETI4
LABELV $1783
endproc UI_GameType_HandleKey 20 16
proc UI_NetGameType_HandleKey 12 16
line 2346
;2344:}
;2345:
;2346:static qboolean UI_NetGameType_HandleKey(int flags, float *special, int key) {
line 2347
;2347:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1831
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1831
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1831
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1827
LABELV $1831
line 2349
;2348:
;2349:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1832
line 2350
;2350:			ui_netGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2351
;2351:		} else {
ADDRGP4 $1833
JUMPV
LABELV $1832
line 2352
;2352:			ui_netGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2353
;2353:		}
LABELV $1833
line 2355
;2354:
;2355:    if (ui_netGameType.integer < 0) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
GEI4 $1836
line 2356
;2356:      ui_netGameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_netGameType+12
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2357
;2357:		} else if (ui_netGameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 $1837
JUMPV
LABELV $1836
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
LTI4 $1841
line 2358
;2358:      ui_netGameType.integer = 0;
ADDRGP4 ui_netGameType+12
CNSTI4 0
ASGNI4
line 2359
;2359:    } 
LABELV $1841
LABELV $1837
line 2361
;2360:
;2361:  	trap_Cvar_Set( "ui_netGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $729
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2362
;2362:  	trap_Cvar_Set( "ui_actualnetGameType", va("%d", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1847
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2363
;2363:  	trap_Cvar_Set( "ui_currentNetMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2364
;2364:		UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 2365
;2365:		Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2366
;2366:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1826
JUMPV
LABELV $1827
line 2368
;2367:  }
;2368:  return qfalse;
CNSTI4 0
RETI4
LABELV $1826
endproc UI_NetGameType_HandleKey 12 16
proc UI_JoinGameType_HandleKey 8 8
line 2371
;2369:}
;2370:
;2371:static qboolean UI_JoinGameType_HandleKey(int flags, float *special, int key) {
line 2372
;2372:	if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1856
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1856
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1856
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1852
LABELV $1856
line 2374
;2373:
;2374:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1857
line 2375
;2375:			ui_joinGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2376
;2376:		} else {
ADDRGP4 $1858
JUMPV
LABELV $1857
line 2377
;2377:			ui_joinGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2378
;2378:		}
LABELV $1858
line 2380
;2379:
;2380:		if (ui_joinGameType.integer < 0) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
GEI4 $1861
line 2381
;2381:			ui_joinGameType.integer = uiInfo.numJoinGameTypes - 1;
ADDRGP4 ui_joinGameType+12
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2382
;2382:		} else if (ui_joinGameType.integer >= uiInfo.numJoinGameTypes) {
ADDRGP4 $1862
JUMPV
LABELV $1861
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78708
INDIRI4
LTI4 $1866
line 2383
;2383:			ui_joinGameType.integer = 0;
ADDRGP4 ui_joinGameType+12
CNSTI4 0
ASGNI4
line 2384
;2384:		}
LABELV $1866
LABELV $1862
line 2386
;2385:
;2386:		trap_Cvar_Set( "ui_joinGameType", va("%d", ui_joinGameType.integer));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $740
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2387
;2387:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 2388
;2388:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1851
JUMPV
LABELV $1852
line 2390
;2389:	}
;2390:	return qfalse;
CNSTI4 0
RETI4
LABELV $1851
endproc UI_JoinGameType_HandleKey 8 8
proc UI_Skill_HandleKey 16 8
line 2395
;2391:}
;2392:
;2393:
;2394:
;2395:static qboolean UI_Skill_HandleKey(int flags, float *special, int key) {
line 2396
;2396:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1877
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1877
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1877
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1873
LABELV $1877
line 2397
;2397:  	int i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2399
;2398:
;2399:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1878
line 2400
;2400:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2401
;2401:		} else {
ADDRGP4 $1879
JUMPV
LABELV $1878
line 2402
;2402:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2403
;2403:		}
LABELV $1879
line 2405
;2404:
;2405:    if (i < 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $1880
line 2406
;2406:			i = numSkillLevels;
ADDRLP4 4
ADDRGP4 numSkillLevels
INDIRI4
ASGNI4
line 2407
;2407:		} else if (i > numSkillLevels) {
ADDRGP4 $1881
JUMPV
LABELV $1880
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1882
line 2408
;2408:      i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2409
;2409:    }
LABELV $1882
LABELV $1881
line 2411
;2410:
;2411:    trap_Cvar_Set("g_spSkill", va("%i", i));
ADDRGP4 $1739
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $826
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2412
;2412:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1872
JUMPV
LABELV $1873
line 2414
;2413:  }
;2414:  return qfalse;
CNSTI4 0
RETI4
LABELV $1872
endproc UI_Skill_HandleKey 16 8
proc UI_TeamName_HandleKey 24 8
line 2417
;2415:}
;2416:
;2417:static qboolean UI_TeamName_HandleKey(int flags, float *special, int key, qboolean blue) {
line 2418
;2418:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1889
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1889
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1889
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1885
LABELV $1889
line 2420
;2419:    int i;
;2420:    i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1891
ADDRLP4 8
ADDRGP4 $832
ASGNP4
ADDRGP4 $1892
JUMPV
LABELV $1891
ADDRLP4 8
ADDRGP4 $833
ASGNP4
LABELV $1892
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 2422
;2421:
;2422:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1893
line 2423
;2423:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2424
;2424:		} else {
ADDRGP4 $1894
JUMPV
LABELV $1893
line 2425
;2425:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2426
;2426:		}
LABELV $1894
line 2428
;2427:
;2428:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1895
line 2429
;2429:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2430
;2430:    } else if (i < 0) {
ADDRGP4 $1896
JUMPV
LABELV $1895
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1898
line 2431
;2431:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2432
;2432:		}
LABELV $1898
LABELV $1896
line 2434
;2433:
;2434:    trap_Cvar_Set( (blue) ? "ui_blueTeam" : "ui_redTeam", uiInfo.teamList[i].teamName);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1903
ADDRLP4 20
ADDRGP4 $832
ASGNP4
ADDRGP4 $1904
JUMPV
LABELV $1903
ADDRLP4 20
ADDRGP4 $833
ASGNP4
LABELV $1904
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2436
;2435:
;2436:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1884
JUMPV
LABELV $1885
line 2438
;2437:  }
;2438:  return qfalse;
CNSTI4 0
RETI4
LABELV $1884
endproc UI_TeamName_HandleKey 24 8
proc UI_TeamMember_HandleKey 32 8
line 2441
;2439:}
;2440:
;2441:static qboolean UI_TeamMember_HandleKey(int flags, float *special, int key, qboolean blue, int num) {
line 2442
;2442:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1910
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1910
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1910
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1906
LABELV $1910
line 2446
;2443:		// 0 - None
;2444:		// 1 - Human
;2445:		// 2..NumCharacters - Bot
;2446:		char *cvar = va(blue ? "ui_blueteam%i" : "ui_redteam%i", num);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1912
ADDRLP4 12
ADDRGP4 $848
ASGNP4
ADDRGP4 $1913
JUMPV
LABELV $1912
ADDRLP4 12
ADDRGP4 $849
ASGNP4
LABELV $1913
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2447
;2447:		int value = trap_Cvar_VariableValue(cvar);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 2449
;2448:
;2449:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1914
line 2450
;2450:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2451
;2451:		} else {
ADDRGP4 $1915
JUMPV
LABELV $1914
line 2452
;2452:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2453
;2453:		}
LABELV $1915
line 2455
;2454:
;2455:		if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $1916
line 2456
;2456:			if (value >= uiInfo.characterCount + 2) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1919
line 2457
;2457:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2458
;2458:			} else if (value < 0) {
ADDRGP4 $1917
JUMPV
LABELV $1919
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1917
line 2459
;2459:				value = uiInfo.characterCount + 2 - 1;
ADDRLP4 4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2460
;2460:			}
line 2461
;2461:		} else {
ADDRGP4 $1917
JUMPV
LABELV $1916
line 2462
;2462:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 24
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1925
line 2463
;2463:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2464
;2464:			} else if (value < 0) {
ADDRGP4 $1926
JUMPV
LABELV $1925
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1927
line 2465
;2465:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2466
;2466:			}
LABELV $1927
LABELV $1926
line 2467
;2467:		}
LABELV $1917
line 2469
;2468:
;2469:		trap_Cvar_Set(cvar, va("%i", value));
ADDRGP4 $1739
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2470
;2470:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1905
JUMPV
LABELV $1906
line 2472
;2471:  }
;2472:  return qfalse;
CNSTI4 0
RETI4
LABELV $1905
endproc UI_TeamMember_HandleKey 32 8
proc UI_NetSource_HandleKey 12 8
line 2475
;2473:}
;2474:
;2475:static qboolean UI_NetSource_HandleKey(int flags, float *special, int key) {
line 2476
;2476:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1934
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1934
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1934
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1930
LABELV $1934
line 2478
;2477:		
;2478:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1935
line 2479
;2479:			ui_netSource.integer--;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2480
;2480:			if (ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $1936
line 2481
;2481:				ui_netSource.integer--;
ADDRLP4 8
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2482
;2482:		} else {
ADDRGP4 $1936
JUMPV
LABELV $1935
line 2483
;2483:			ui_netSource.integer++;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2484
;2484:			if (ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $1943
line 2485
;2485:				ui_netSource.integer++;
ADDRLP4 8
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1943
line 2486
;2486:		}
LABELV $1936
line 2488
;2487:    
;2488:		if (ui_netSource.integer >= numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LTI4 $1947
line 2489
;2489:      ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2490
;2490:    } else if (ui_netSource.integer < 0) {
ADDRGP4 $1948
JUMPV
LABELV $1947
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
GEI4 $1951
line 2491
;2491:      ui_netSource.integer = numNetSources - 1;
ADDRGP4 ui_netSource+12
ADDRGP4 numNetSources
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2492
;2492:		}
LABELV $1951
LABELV $1948
line 2494
;2493:
;2494:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 2495
;2495:		if (ui_netSource.integer != AS_GLOBAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $1955
line 2496
;2496:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 2497
;2497:		}
LABELV $1955
line 2498
;2498:  	trap_Cvar_Set( "ui_netSource", va("%d", ui_netSource.integer));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1958
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2499
;2499:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1929
JUMPV
LABELV $1930
line 2501
;2500:  }
;2501:  return qfalse;
CNSTI4 0
RETI4
LABELV $1929
endproc UI_NetSource_HandleKey 12 8
proc UI_NetFilter_HandleKey 8 4
line 2504
;2502:}
;2503:
;2504:static qboolean UI_NetFilter_HandleKey(int flags, float *special, int key) {
line 2505
;2505:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1965
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1965
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1965
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1961
LABELV $1965
line 2507
;2506:
;2507:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1966
line 2508
;2508:			ui_serverFilterType.integer--;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2509
;2509:		} else {
ADDRGP4 $1967
JUMPV
LABELV $1966
line 2510
;2510:			ui_serverFilterType.integer++;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2511
;2511:		}
LABELV $1967
line 2513
;2512:
;2513:    if (ui_serverFilterType.integer >= numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LTI4 $1970
line 2514
;2514:      ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2515
;2515:    } else if (ui_serverFilterType.integer < 0) {
ADDRGP4 $1971
JUMPV
LABELV $1970
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
GEI4 $1974
line 2516
;2516:      ui_serverFilterType.integer = numServerFilters - 1;
ADDRGP4 ui_serverFilterType+12
ADDRGP4 numServerFilters
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2517
;2517:		}
LABELV $1974
LABELV $1971
line 2518
;2518:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 2519
;2519:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1960
JUMPV
LABELV $1961
line 2521
;2520:  }
;2521:  return qfalse;
CNSTI4 0
RETI4
LABELV $1960
endproc UI_NetFilter_HandleKey 8 4
proc UI_OpponentName_HandleKey 4 0
line 2524
;2522:}
;2523:
;2524:static qboolean UI_OpponentName_HandleKey(int flags, float *special, int key) {
line 2525
;2525:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1983
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1983
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1983
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1979
LABELV $1983
line 2526
;2526:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1984
line 2527
;2527:			UI_PriorOpponent();
ADDRGP4 UI_PriorOpponent
CALLV
pop
line 2528
;2528:		} else {
ADDRGP4 $1985
JUMPV
LABELV $1984
line 2529
;2529:			UI_NextOpponent();
ADDRGP4 UI_NextOpponent
CALLV
pop
line 2530
;2530:		}
LABELV $1985
line 2531
;2531:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1978
JUMPV
LABELV $1979
line 2533
;2532:  }
;2533:  return qfalse;
CNSTI4 0
RETI4
LABELV $1978
endproc UI_OpponentName_HandleKey 4 0
proc UI_BotName_HandleKey 24 4
line 2536
;2534:}
;2535:
;2536:static qboolean UI_BotName_HandleKey(int flags, float *special, int key) {
line 2537
;2537:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1991
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1991
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1991
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1987
LABELV $1991
line 2538
;2538:		int game = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1325
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2539
;2539:		int value = uiInfo.botIndex;
ADDRLP4 4
ADDRGP4 uiInfo+73444
INDIRI4
ASGNI4
line 2541
;2540:
;2541:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1993
line 2542
;2542:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2543
;2543:		} else {
ADDRGP4 $1994
JUMPV
LABELV $1993
line 2544
;2544:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2545
;2545:		}
LABELV $1994
line 2547
;2546:
;2547:		if (game >= GT_TEAM) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $1995
line 2548
;2548:			if (value >= uiInfo.characterCount + 2) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1997
line 2549
;2549:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2550
;2550:			} else if (value < 0) {
ADDRGP4 $1996
JUMPV
LABELV $1997
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1996
line 2551
;2551:				value = uiInfo.characterCount + 2 - 1;
ADDRLP4 4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2552
;2552:			}
line 2553
;2553:		} else {
ADDRGP4 $1996
JUMPV
LABELV $1995
line 2554
;2554:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 16
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2003
line 2555
;2555:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2556
;2556:			} else if (value < 0) {
ADDRGP4 $2004
JUMPV
LABELV $2003
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2005
line 2557
;2557:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2558
;2558:			}
LABELV $2005
LABELV $2004
line 2559
;2559:		}
LABELV $1996
line 2560
;2560:		uiInfo.botIndex = value;
ADDRGP4 uiInfo+73444
ADDRLP4 4
INDIRI4
ASGNI4
line 2561
;2561:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1986
JUMPV
LABELV $1987
line 2563
;2562:  }
;2563:  return qfalse;
CNSTI4 0
RETI4
LABELV $1986
endproc UI_BotName_HandleKey 24 4
proc UI_BotSkill_HandleKey 8 0
line 2566
;2564:}
;2565:
;2566:static qboolean UI_BotSkill_HandleKey(int flags, float *special, int key) {
line 2567
;2567:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2013
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2013
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2013
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2009
LABELV $2013
line 2568
;2568:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2014
line 2569
;2569:			uiInfo.skillIndex--;
ADDRLP4 4
ADDRGP4 uiInfo+96672
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2570
;2570:		} else {
ADDRGP4 $2015
JUMPV
LABELV $2014
line 2571
;2571:			uiInfo.skillIndex++;
ADDRLP4 4
ADDRGP4 uiInfo+96672
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2572
;2572:		}
LABELV $2015
line 2573
;2573:		if (uiInfo.skillIndex >= numSkillLevels) {
ADDRGP4 uiInfo+96672
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LTI4 $2018
line 2574
;2574:			uiInfo.skillIndex = 0;
ADDRGP4 uiInfo+96672
CNSTI4 0
ASGNI4
line 2575
;2575:		} else if (uiInfo.skillIndex < 0) {
ADDRGP4 $2019
JUMPV
LABELV $2018
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 0
GEI4 $2022
line 2576
;2576:			uiInfo.skillIndex = numSkillLevels-1;
ADDRGP4 uiInfo+96672
ADDRGP4 numSkillLevels
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2577
;2577:		}
LABELV $2022
LABELV $2019
line 2578
;2578:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2008
JUMPV
LABELV $2009
line 2580
;2579:  }
;2580:	return qfalse;
CNSTI4 0
RETI4
LABELV $2008
endproc UI_BotSkill_HandleKey 8 0
proc UI_RedBlue_HandleKey 8 0
line 2583
;2581:}
;2582:
;2583:static qboolean UI_RedBlue_HandleKey(int flags, float *special, int key) {
line 2584
;2584:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2031
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2031
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2031
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2027
LABELV $2031
line 2585
;2585:		uiInfo.redBlue ^= 1;
ADDRLP4 4
ADDRGP4 uiInfo+78840
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2586
;2586:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2026
JUMPV
LABELV $2027
line 2588
;2587:	}
;2588:	return qfalse;
CNSTI4 0
RETI4
LABELV $2026
endproc UI_RedBlue_HandleKey 8 0
proc UI_Crosshair_HandleKey 8 8
line 2591
;2589:}
;2590:
;2591:static qboolean UI_Crosshair_HandleKey(int flags, float *special, int key) {
line 2592
;2592:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2038
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2038
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2038
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2034
LABELV $2038
line 2593
;2593:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2039
line 2594
;2594:			uiInfo.currentCrosshair--;
ADDRLP4 4
ADDRGP4 uiInfo+119476
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2595
;2595:		} else {
ADDRGP4 $2040
JUMPV
LABELV $2039
line 2596
;2596:			uiInfo.currentCrosshair++;
ADDRLP4 4
ADDRGP4 uiInfo+119476
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2597
;2597:		}
LABELV $2040
line 2599
;2598:
;2599:		if (uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 10
LTI4 $2043
line 2600
;2600:			uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+119476
CNSTI4 0
ASGNI4
line 2601
;2601:		} else if (uiInfo.currentCrosshair < 0) {
ADDRGP4 $2044
JUMPV
LABELV $2043
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 0
GEI4 $2047
line 2602
;2602:			uiInfo.currentCrosshair = NUM_CROSSHAIRS - 1;
ADDRGP4 uiInfo+119476
CNSTI4 9
ASGNI4
line 2603
;2603:		}
LABELV $2047
LABELV $2044
line 2604
;2604:		trap_Cvar_Set("cg_drawCrosshair", va("%d", uiInfo.currentCrosshair)); 
ADDRGP4 $715
ARGP4
ADDRGP4 uiInfo+119476
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2051
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2605
;2605:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2033
JUMPV
LABELV $2034
line 2607
;2606:	}
;2607:	return qfalse;
CNSTI4 0
RETI4
LABELV $2033
endproc UI_Crosshair_HandleKey 8 8
proc UI_SelectedPlayer_HandleKey 16 8
line 2612
;2608:}
;2609:
;2610:
;2611:
;2612:static qboolean UI_SelectedPlayer_HandleKey(int flags, float *special, int key) {
line 2613
;2613:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2058
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2058
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2058
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2054
LABELV $2058
line 2616
;2614:		int selected;
;2615:
;2616:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 2617
;2617:		if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
NEI4 $2059
line 2618
;2618:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2053
JUMPV
LABELV $2059
line 2620
;2619:		}
;2620:		selected = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1393
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2622
;2621:		
;2622:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2062
line 2623
;2623:			selected--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2624
;2624:		} else {
ADDRGP4 $2063
JUMPV
LABELV $2062
line 2625
;2625:			selected++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2626
;2626:		}
LABELV $2063
line 2628
;2627:
;2628:		if (selected > uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
LEI4 $2064
line 2629
;2629:			selected = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2630
;2630:		} else if (selected < 0) {
ADDRGP4 $2065
JUMPV
LABELV $2064
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2067
line 2631
;2631:			selected = uiInfo.myTeamCount;
ADDRLP4 4
ADDRGP4 uiInfo+78848
INDIRI4
ASGNI4
line 2632
;2632:		}
LABELV $2067
LABELV $2065
line 2634
;2633:
;2634:		if (selected == uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
NEI4 $2070
line 2635
;2635:		 	trap_Cvar_Set( "cg_selectedPlayerName", "Everyone");
ADDRGP4 $1401
ARGP4
ADDRGP4 $2073
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2636
;2636:		} else {
ADDRGP4 $2071
JUMPV
LABELV $2070
line 2637
;2637:		 	trap_Cvar_Set( "cg_selectedPlayerName", uiInfo.teamNames[selected]);
ADDRGP4 $1401
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2638
;2638:		}
LABELV $2071
line 2639
;2639:	 	trap_Cvar_Set( "cg_selectedPlayer", va("%d", selected));
ADDRGP4 $715
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1393
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2640
;2640:	}
LABELV $2054
line 2641
;2641:	return qfalse;
CNSTI4 0
RETI4
LABELV $2053
endproc UI_SelectedPlayer_HandleKey 16 8
proc UI_OwnerDrawHandleKey 52 20
line 2645
;2642:}
;2643:
;2644:
;2645:static qboolean UI_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 2646
;2646:  switch (ownerDraw) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $2077
ADDRLP4 0
INDIRI4
CNSTI4 253
GTI4 $2077
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2097-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2097
address $2078
address $2079
address $2077
address $2080
address $2077
address $2081
address $2077
address $2084
address $2085
address $2086
address $2087
address $2087
address $2087
address $2087
address $2087
address $2088
address $2088
address $2088
address $2088
address $2088
address $2089
address $2077
address $2090
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2091
address $2077
address $2092
address $2093
address $2094
address $2095
address $2096
address $2077
address $2082
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2077
address $2083
code
LABELV $2078
line 2648
;2647:    case UI_HANDICAP:
;2648:      return UI_Handicap_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_Handicap_HandleKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2649
;2649:      break;
LABELV $2079
line 2651
;2650:    case UI_EFFECTS:
;2651:      return UI_Effects_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_Effects_HandleKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2652
;2652:      break;
LABELV $2080
line 2654
;2653:    case UI_CLANNAME:
;2654:      return UI_ClanName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_ClanName_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2655
;2655:      break;
LABELV $2081
line 2657
;2656:    case UI_GAMETYPE:
;2657:      return UI_GameType_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 UI_GameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2658
;2658:      break;
LABELV $2082
line 2660
;2659:    case UI_NETGAMETYPE:
;2660:      return UI_NetGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_NetGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2661
;2661:      break;
LABELV $2083
line 2663
;2662:    case UI_JOINGAMETYPE:
;2663:      return UI_JoinGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_JoinGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2664
;2664:      break;
LABELV $2084
line 2666
;2665:    case UI_SKILL:
;2666:      return UI_Skill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_Skill_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2667
;2667:      break;
LABELV $2085
line 2669
;2668:    case UI_BLUETEAMNAME:
;2669:      return UI_TeamName_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2670
;2670:      break;
LABELV $2086
line 2672
;2671:    case UI_REDTEAMNAME:
;2672:      return UI_TeamName_HandleKey(flags, special, key, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2673
;2673:      break;
LABELV $2087
line 2679
;2674:    case UI_BLUETEAM1:
;2675:		case UI_BLUETEAM2:
;2676:		case UI_BLUETEAM3:
;2677:		case UI_BLUETEAM4:
;2678:		case UI_BLUETEAM5:
;2679:      UI_TeamMember_HandleKey(flags, special, key, qtrue, ownerDraw - UI_BLUETEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 2680
;2680:      break;
ADDRGP4 $2077
JUMPV
LABELV $2088
line 2686
;2681:    case UI_REDTEAM1:
;2682:		case UI_REDTEAM2:
;2683:		case UI_REDTEAM3:
;2684:		case UI_REDTEAM4:
;2685:		case UI_REDTEAM5:
;2686:      UI_TeamMember_HandleKey(flags, special, key, qfalse, ownerDraw - UI_REDTEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 2687
;2687:      break;
ADDRGP4 $2077
JUMPV
LABELV $2089
line 2689
;2688:		case UI_NETSOURCE:
;2689:      UI_NetSource_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetSource_HandleKey
CALLI4
pop
line 2690
;2690:			break;
ADDRGP4 $2077
JUMPV
LABELV $2090
line 2692
;2691:		case UI_NETFILTER:
;2692:      UI_NetFilter_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetFilter_HandleKey
CALLI4
pop
line 2693
;2693:			break;
ADDRGP4 $2077
JUMPV
LABELV $2091
line 2695
;2694:		case UI_OPPONENT_NAME:
;2695:			UI_OpponentName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_OpponentName_HandleKey
CALLI4
pop
line 2696
;2696:			break;
ADDRGP4 $2077
JUMPV
LABELV $2092
line 2698
;2697:		case UI_BOTNAME:
;2698:			return UI_BotName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_BotName_HandleKey
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2699
;2699:			break;
LABELV $2093
line 2701
;2700:		case UI_BOTSKILL:
;2701:			return UI_BotSkill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UI_BotSkill_HandleKey
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
RETI4
ADDRGP4 $2075
JUMPV
line 2702
;2702:			break;
LABELV $2094
line 2704
;2703:		case UI_REDBLUE:
;2704:			UI_RedBlue_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_RedBlue_HandleKey
CALLI4
pop
line 2705
;2705:			break;
ADDRGP4 $2077
JUMPV
LABELV $2095
line 2707
;2706:		case UI_CROSSHAIR:
;2707:			UI_Crosshair_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_Crosshair_HandleKey
CALLI4
pop
line 2708
;2708:			break;
ADDRGP4 $2077
JUMPV
LABELV $2096
line 2710
;2709:		case UI_SELECTEDPLAYER:
;2710:			UI_SelectedPlayer_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_SelectedPlayer_HandleKey
CALLI4
pop
line 2711
;2711:			break;
line 2713
;2712:    default:
;2713:      break;
LABELV $2077
line 2716
;2714:  }
;2715:
;2716:  return qfalse;
CNSTI4 0
RETI4
LABELV $2075
endproc UI_OwnerDrawHandleKey 52 20
proc UI_GetValue 0 0
line 2720
;2717:}
;2718:
;2719:
;2720:static float UI_GetValue(int ownerDraw) {
line 2721
;2721:  return 0;
CNSTF4 0
RETF4
LABELV $2099
endproc UI_GetValue 0 0
proc UI_ServersQsortCompare 4 20
line 2729
;2722:}
;2723:
;2724:/*
;2725:=================
;2726:UI_ServersQsortCompare
;2727:=================
;2728:*/
;2729:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 ) {
line 2730
;2730:	return trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, *(int*)arg1, *(int*)arg2);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2100
endproc UI_ServersQsortCompare 4 20
export UI_ServersSort
proc UI_ServersSort 0 16
line 2739
;2731:}
;2732:
;2733:
;2734:/*
;2735:=================
;2736:UI_ServersSort
;2737:=================
;2738:*/
;2739:void UI_ServersSort(int column, qboolean force) {
line 2741
;2740:
;2741:	if ( !force ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2107
line 2742
;2742:		if ( uiInfo.serverStatus.sortKey == column ) {
ADDRGP4 uiInfo+99264+2200
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2109
line 2743
;2743:			return;
ADDRGP4 $2106
JUMPV
LABELV $2109
line 2745
;2744:		}
;2745:	}
LABELV $2107
line 2747
;2746:
;2747:	uiInfo.serverStatus.sortKey = column;
ADDRGP4 uiInfo+99264+2200
ADDRFP4 0
INDIRI4
ASGNI4
line 2748
;2748:	qsort( &uiInfo.serverStatus.displayServers[0], uiInfo.serverStatus.numDisplayServers, sizeof(int), UI_ServersQsortCompare);
ADDRGP4 uiInfo+99264+2220
ARGP4
ADDRGP4 uiInfo+99264+10412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_ServersQsortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 2749
;2749:}
LABELV $2106
endproc UI_ServersSort 0 16
proc UI_LoadMods 2092 16
line 2796
;2750:
;2751:/*
;2752:static void UI_StartSinglePlayer() {
;2753:	int i,j, k, skill;
;2754:	char buff[1024];
;2755:	i = trap_Cvar_VariableValue( "ui_currentTier" );
;2756:  if (i < 0 || i >= tierCount) {
;2757:    i = 0;
;2758:  }
;2759:	j = trap_Cvar_VariableValue("ui_currentMap");
;2760:	if (j < 0 || j > MAPS_PER_TIER) {
;2761:		j = 0;
;2762:	}
;2763:
;2764: 	trap_Cvar_SetValue( "singleplayer", 1 );
;2765: 	trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 7, tierList[i].gameTypes[j] ) );
;2766:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", tierList[i].maps[j] ) );
;2767:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;2768:
;2769:	if (j == MAPS_PER_TIER-1) {
;2770:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;2771:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[0]), skill, "", teamList[k].teamMembers[0]);
;2772:	} else {
;2773:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;2774:		for (i = 0; i < PLAYERS_PER_TEAM; i++) {
;2775:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Blue", teamList[k].teamMembers[i]);
;2776:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;2777:		}
;2778:
;2779:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
;2780:		for (i = 1; i < PLAYERS_PER_TEAM; i++) {
;2781:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Red", teamList[k].teamMembers[i]);
;2782:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;2783:		}
;2784:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
;2785:	}
;2786:	
;2787:
;2788:}
;2789:*/
;2790:
;2791:/*
;2792:===============
;2793:UI_LoadMods
;2794:===============
;2795:*/
;2796:static void UI_LoadMods() {
line 2804
;2797:	int		numdirs;
;2798:	char	dirlist[2048];
;2799:	char	*dirptr;
;2800:  char  *descptr;
;2801:	int		i;
;2802:	int		dirlen;
;2803:
;2804:	uiInfo.modCount = 0;
ADDRGP4 uiInfo+97188
CNSTI4 0
ASGNI4
line 2805
;2805:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $2121
ARGP4
ADDRGP4 $111
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 2806
;2806:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 2807
;2807:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2125
JUMPV
LABELV $2122
line 2808
;2808:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2809
;2809:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2810
;2810:		uiInfo.modList[uiInfo.modCount].modName = String_Alloc(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+97188
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676
ADDP4
ADDRLP4 2076
INDIRP4
ASGNP4
line 2811
;2811:		uiInfo.modList[uiInfo.modCount].modDescr = String_Alloc(descptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+97188
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676+4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 2812
;2812:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2813
;2813:		uiInfo.modCount++;
ADDRLP4 2088
ADDRGP4 uiInfo+97188
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2814
;2814:		if (uiInfo.modCount >= MAX_MODS) {
ADDRGP4 uiInfo+97188
INDIRI4
CNSTI4 64
LTI4 $2132
line 2815
;2815:			break;
ADDRGP4 $2124
JUMPV
LABELV $2132
line 2817
;2816:		}
;2817:	}
LABELV $2123
line 2807
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2125
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2122
LABELV $2124
line 2819
;2818:
;2819:}
LABELV $2119
endproc UI_LoadMods 2092 16
proc UI_LoadTeams 4120 16
line 2827
;2820:
;2821:
;2822:/*
;2823:===============
;2824:UI_LoadTeams
;2825:===============
;2826:*/
;2827:static void UI_LoadTeams() {
line 2832
;2828:	char	teamList[4096];
;2829:	char	*teamName;
;2830:	int		i, len, count;
;2831:
;2832:	count = trap_FS_GetFileList( "", "team", teamList, 4096 );
ADDRGP4 $111
ARGP4
ADDRGP4 $2136
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4112
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 4112
INDIRI4
ASGNI4
line 2834
;2833:
;2834:	if (count) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2137
line 2835
;2835:		teamName = teamList;
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 2836
;2836:		for ( i = 0; i < count; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2142
JUMPV
LABELV $2139
line 2837
;2837:			len = strlen( teamName );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4116
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4116
INDIRI4
ASGNI4
line 2838
;2838:			UI_ParseTeamInfo(teamName);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_ParseTeamInfo
CALLV
pop
line 2839
;2839:			teamName += len + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2840
;2840:		}
LABELV $2140
line 2836
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2142
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $2139
line 2841
;2841:	}
LABELV $2137
line 2843
;2842:
;2843:}
LABELV $2135
endproc UI_LoadTeams 4120 16
proc UI_LoadMovies 4124 16
line 2851
;2844:
;2845:
;2846:/*
;2847:===============
;2848:UI_LoadMovies
;2849:===============
;2850:*/
;2851:static void UI_LoadMovies() {
line 2856
;2852:	char	movielist[4096];
;2853:	char	*moviename;
;2854:	int		i, len;
;2855:
;2856:	uiInfo.movieCount = trap_FS_GetFileList( "video", "roq", movielist, 4096 );
ADDRGP4 $2145
ARGP4
ADDRGP4 $2146
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+99252
ADDRLP4 4108
INDIRI4
ASGNI4
line 2858
;2857:
;2858:	if (uiInfo.movieCount) {
ADDRGP4 uiInfo+99252
INDIRI4
CNSTI4 0
EQI4 $2147
line 2859
;2859:		if (uiInfo.movieCount > MAX_MOVIES) {
ADDRGP4 uiInfo+99252
INDIRI4
CNSTI4 256
LEI4 $2150
line 2860
;2860:			uiInfo.movieCount = MAX_MOVIES;
ADDRGP4 uiInfo+99252
CNSTI4 256
ASGNI4
line 2861
;2861:		}
LABELV $2150
line 2862
;2862:		moviename = movielist;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 2863
;2863:		for ( i = 0; i < uiInfo.movieCount; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2157
JUMPV
LABELV $2154
line 2864
;2864:			len = strlen( moviename );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ASGNI4
line 2865
;2865:			if (!Q_stricmp(moviename +  len - 4,".roq")) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $2161
ARGP4
ADDRLP4 4116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $2159
line 2866
;2866:				moviename[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 2867
;2867:			}
LABELV $2159
line 2868
;2868:			Q_strupr(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 2869
;2869:			uiInfo.movieList[i] = String_Alloc(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
ADDRLP4 4120
INDIRP4
ASGNP4
line 2870
;2870:			moviename += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2871
;2871:		}
LABELV $2155
line 2863
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2157
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+99252
INDIRI4
LTI4 $2154
line 2872
;2872:	}
LABELV $2147
line 2874
;2873:
;2874:}
LABELV $2143
endproc UI_LoadMovies 4124 16
proc UI_LoadDemos 4168 16
line 2883
;2875:
;2876:
;2877:
;2878:/*
;2879:===============
;2880:UI_LoadDemos
;2881:===============
;2882:*/
;2883:static void UI_LoadDemos() {
line 2889
;2884:	char	demolist[4096];
;2885:	char demoExt[32];
;2886:	char	*demoname;
;2887:	int		i, len;
;2888:
;2889:	Com_sprintf(demoExt, sizeof(demoExt), "dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2165
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2164
ARGP4
ADDRLP4 4140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2891
;2890:
;2891:	uiInfo.demoCount = trap_FS_GetFileList( "demos", demoExt, demolist, 4096 );
ADDRGP4 $2167
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4144
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+98220
ADDRLP4 4144
INDIRI4
ASGNI4
line 2893
;2892:
;2893:	Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2165
ARGP4
ADDRLP4 4148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2168
ARGP4
ADDRLP4 4148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2895
;2894:
;2895:	if (uiInfo.demoCount) {
ADDRGP4 uiInfo+98220
INDIRI4
CNSTI4 0
EQI4 $2169
line 2896
;2896:		if (uiInfo.demoCount > MAX_DEMOS) {
ADDRGP4 uiInfo+98220
INDIRI4
CNSTI4 256
LEI4 $2172
line 2897
;2897:			uiInfo.demoCount = MAX_DEMOS;
ADDRGP4 uiInfo+98220
CNSTI4 256
ASGNI4
line 2898
;2898:		}
LABELV $2172
line 2899
;2899:		demoname = demolist;
ADDRLP4 0
ADDRLP4 44
ASGNP4
line 2900
;2900:		for ( i = 0; i < uiInfo.demoCount; i++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $2179
JUMPV
LABELV $2176
line 2901
;2901:			len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 4152
INDIRI4
ASGNI4
line 2902
;2902:			if (!Q_stricmp(demoname +  len - strlen(demoExt), demoExt)) {
ADDRLP4 4
ARGP4
ADDRLP4 4156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4156
INDIRI4
SUBP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $2181
line 2903
;2903:				demoname[len-strlen(demoExt)] = '\0';
ADDRLP4 4
ARGP4
ADDRLP4 4164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 2904
;2904:			}
LABELV $2181
line 2905
;2905:			Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 2906
;2906:			uiInfo.demoList[i] = String_Alloc(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97196
ADDP4
ADDRLP4 4164
INDIRP4
ASGNP4
line 2907
;2907:			demoname += len + 1;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2908
;2908:		}
LABELV $2177
line 2900
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2179
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+98220
INDIRI4
LTI4 $2176
line 2909
;2909:	}
LABELV $2169
line 2911
;2910:
;2911:}
LABELV $2163
endproc UI_LoadDemos 4168 16
proc UI_SetNextMap 8 16
line 2914
;2912:
;2913:
;2914:static qboolean UI_SetNextMap(int actual, int index) {
line 2916
;2915:	int i;
;2916:	for (i = actual + 1; i < uiInfo.mapCount; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2188
JUMPV
LABELV $2185
line 2917
;2917:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2190
line 2918
;2918:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, index + 1, "skirmish");
CNSTP4 0
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRGP4 $2194
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2919
;2919:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2184
JUMPV
LABELV $2190
line 2921
;2920:		}
;2921:	}
LABELV $2186
line 2916
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2188
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $2185
line 2922
;2922:	return qfalse;
CNSTI4 0
RETI4
LABELV $2184
endproc UI_SetNextMap 8 16
proc UI_StartSkirmish 1160 32
line 2926
;2923:}
;2924:
;2925:
;2926:static void UI_StartSkirmish(qboolean next) {
line 2931
;2927:	int i, k, g, delay, temp;
;2928:	float skill;
;2929:	char buff[MAX_STRING_CHARS];
;2930:
;2931:	if (next) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2196
line 2933
;2932:		int actual;
;2933:		int index = trap_Cvar_VariableValue("ui_mapIndex");
ADDRGP4 $2198
ARGP4
ADDRLP4 1056
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1056
INDIRF4
CVFI4 4
ASGNI4
line 2934
;2934:	 	UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 2935
;2935:		UI_SelectedMap(index, &actual);
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 2936
;2936:		if (UI_SetNextMap(actual, index)) {
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 UI_SetNextMap
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $2199
line 2937
;2937:		} else {
ADDRGP4 $2200
JUMPV
LABELV $2199
line 2938
;2938:			UI_GameType_HandleKey(0, 0, K_MOUSE1, qfalse);
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 2939
;2939:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 2940
;2940:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2194
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2941
;2941:		}
LABELV $2200
line 2942
;2942:	}
LABELV $2196
line 2944
;2943:
;2944:	g = uiInfo.gameTypes[ui_gameType.integer].gtEnum;
ADDRLP4 1040
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ASGNI4
line 2945
;2945:	trap_Cvar_SetValue( "g_gametype", g );
ADDRGP4 $1325
ARGP4
ADDRLP4 1040
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 2946
;2946:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName) );
ADDRGP4 $2204
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2947
;2947:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1052
INDIRF4
ASGNF4
line 2948
;2948:	trap_Cvar_Set("ui_scoreMap", uiInfo.mapList[ui_currentMap.integer].mapName);
ADDRGP4 $2208
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2950
;2949:
;2950:	k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1060
INDIRI4
ASGNI4
line 2952
;2951:
;2952:	trap_Cvar_Set("ui_singlePlayerActive", "1");
ADDRGP4 $2211
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2955
;2953:
;2954:	// set up sp overrides, will be replaced on postgame
;2955:	temp = trap_Cvar_VariableValue( "capturelimit" );
ADDRGP4 $717
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 2956
;2956:	trap_Cvar_Set("ui_saveCaptureLimit", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2212
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2957
;2957:	temp = trap_Cvar_VariableValue( "fraglimit" );
ADDRGP4 $718
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1072
INDIRF4
CVFI4 4
ASGNI4
line 2958
;2958:	trap_Cvar_Set("ui_saveFragLimit", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2213
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2960
;2959:
;2960:	UI_SetCapFragLimits(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 2962
;2961:
;2962:	temp = trap_Cvar_VariableValue( "cg_drawTimer" );
ADDRGP4 $2214
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 2963
;2963:	trap_Cvar_Set("ui_drawTimer", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2215
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2964
;2964:	temp = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2216
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 2965
;2965:	trap_Cvar_Set("ui_doWarmup", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2217
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2966
;2966:	temp = trap_Cvar_VariableValue( "g_friendlyFire" );
ADDRGP4 $2218
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 2967
;2967:	trap_Cvar_Set("ui_friendlyFire", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2219
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2968
;2968:	temp = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $2220
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 2969
;2969:	trap_Cvar_Set("ui_maxClients", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2221
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2970
;2970:	temp = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $2222
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 2971
;2971:	trap_Cvar_Set("ui_Warmup", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2223
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2972
;2972:	temp = trap_Cvar_VariableValue( "sv_pure" );
ADDRGP4 $2224
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 2973
;2973:	trap_Cvar_Set("ui_pure", va("%i", temp));
ADDRGP4 $1739
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2225
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2975
;2974:
;2975:	trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2976
;2976:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $395
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2977
;2977:	trap_Cvar_Set("cg_drawTimer", "1");
ADDRGP4 $2214
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2978
;2978:	trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $2216
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2979
;2979:	trap_Cvar_Set("g_warmup", "15");
ADDRGP4 $2222
ARGP4
ADDRGP4 $694
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2980
;2980:	trap_Cvar_Set("sv_pure", "0");
ADDRGP4 $2224
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2981
;2981:	trap_Cvar_Set("g_friendlyFire", "0");
ADDRGP4 $2218
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2982
;2982:	trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 1128
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2226
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2983
;2983:	trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 1132
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2227
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2985
;2984:
;2985:	if (trap_Cvar_VariableValue("ui_recordSPDemo")) {
ADDRGP4 $2230
ARGP4
ADDRLP4 1136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1136
INDIRF4
CNSTF4 0
EQF4 $2228
line 2986
;2986:		Com_sprintf(buff, MAX_STRING_CHARS, "%s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, g);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2231
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2987
;2987:		trap_Cvar_Set("ui_recordSPDemoName", buff);
ADDRGP4 $2235
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2988
;2988:	}
LABELV $2228
line 2990
;2989:
;2990:	delay = 500;
ADDRLP4 1032
CNSTI4 500
ASGNI4
line 2992
;2991:
;2992:	if (g == GT_TOURNAMENT) {
ADDRLP4 1040
INDIRI4
CNSTI4 1
NEI4 $2236
line 2993
;2993:		trap_Cvar_Set("sv_maxClients", "2");
ADDRGP4 $2220
ARGP4
ADDRGP4 $2238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2994
;2994:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %f "", %i \n", uiInfo.mapList[ui_currentMap.integer].opponentName, skill, delay);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2239
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2995
;2995:		trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2996
;2996:	} else {
ADDRGP4 $2237
JUMPV
LABELV $2236
line 2997
;2997:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1036
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 2998
;2998:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $715
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2220
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2999
;2999:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2249
JUMPV
LABELV $2246
line 3000
;3000:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Blue", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2253
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2259
ADDRLP4 1144
ADDRGP4 $111
ASGNP4
ADDRGP4 $2260
JUMPV
LABELV $2259
ADDRLP4 1144
ADDRGP4 $841
ASGNP4
LABELV $2260
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3001
;3001:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3002
;3002:			delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3003
;3003:		}
LABELV $2247
line 2999
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2249
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
INDIRI4
LTI4 $2246
line 3004
;3004:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 1144
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1148
INDIRI4
ASGNI4
line 3005
;3005:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2264
JUMPV
LABELV $2261
line 3006
;3006:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Red", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2253
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2273
ADDRLP4 1152
ADDRGP4 $111
ASGNP4
ADDRGP4 $2274
JUMPV
LABELV $2273
ADDRLP4 1152
ADDRGP4 $842
ASGNP4
LABELV $2274
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3007
;3007:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3008
;3008:			delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3009
;3009:		}
LABELV $2262
line 3005
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2264
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2261
line 3010
;3010:	}
LABELV $2237
line 3011
;3011:	if (g >= GT_TEAM ) {
ADDRLP4 1040
INDIRI4
CNSTI4 3
LTI4 $2275
line 3012
;3012:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2277
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3013
;3013:	}
LABELV $2275
line 3014
;3014:}
LABELV $2195
endproc UI_StartSkirmish 1160 32
proc UI_Update 36 8
line 3016
;3015:
;3016:static void UI_Update(const char *name) {
line 3017
;3017:	int	val = trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 3019
;3018:
;3019: 	if (Q_stricmp(name, "ui_SetName") == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2281
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2279
line 3020
;3020:		trap_Cvar_Set( "name", UI_Cvar_VariableString("ui_Name"));
ADDRGP4 $2282
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $1411
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3021
;3021: 	} else if (Q_stricmp(name, "ui_setRate") == 0) {
ADDRGP4 $2280
JUMPV
LABELV $2279
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2285
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2283
line 3022
;3022:		float rate = trap_Cvar_VariableValue("rate");
ADDRGP4 $2286
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20
INDIRF4
ASGNF4
line 3023
;3023:		if (rate >= 5000) {
ADDRLP4 16
INDIRF4
CNSTF4 1167867904
LTF4 $2287
line 3024
;3024:			trap_Cvar_Set("cl_maxpackets", "30");
ADDRGP4 $2289
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3025
;3025:			trap_Cvar_Set("cl_packetdup", "1");
ADDRGP4 $2290
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3026
;3026:		} else if (rate >= 4000) {
ADDRGP4 $2284
JUMPV
LABELV $2287
ADDRLP4 16
INDIRF4
CNSTF4 1165623296
LTF4 $2291
line 3027
;3027:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2289
ARGP4
ADDRGP4 $694
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3028
;3028:			trap_Cvar_Set("cl_packetdup", "2");		// favor less prediction errors when there's packet loss
ADDRGP4 $2290
ARGP4
ADDRGP4 $2238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3029
;3029:		} else {
ADDRGP4 $2284
JUMPV
LABELV $2291
line 3030
;3030:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2289
ARGP4
ADDRGP4 $694
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3031
;3031:			trap_Cvar_Set("cl_packetdup", "1");		// favor lower bandwidth
ADDRGP4 $2290
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3032
;3032:		}
line 3033
;3033: 	} else if (Q_stricmp(name, "ui_GetName") == 0) {
ADDRGP4 $2284
JUMPV
LABELV $2283
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2295
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2293
line 3034
;3034:		trap_Cvar_Set( "ui_Name", UI_Cvar_VariableString("name"));
ADDRGP4 $1411
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2282
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3035
;3035: 	} else if (Q_stricmp(name, "r_colorbits") == 0) {
ADDRGP4 $2294
JUMPV
LABELV $2293
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2298
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2296
line 3036
;3036:		switch (val) {
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2304
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $2307
LABELV $2306
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2301
ADDRGP4 $2297
JUMPV
LABELV $2307
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $2305
ADDRGP4 $2297
JUMPV
LABELV $2301
line 3038
;3037:			case 0:
;3038:				trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $2302
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3039
;3039:				trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $2303
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3040
;3040:			break;
ADDRGP4 $2297
JUMPV
LABELV $2304
line 3042
;3041:			case 16:
;3042:				trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $2302
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3043
;3043:				trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $2303
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3044
;3044:			break;
ADDRGP4 $2297
JUMPV
LABELV $2305
line 3046
;3045:			case 32:
;3046:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $2302
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3047
;3047:			break;
line 3049
;3048:		}
;3049:	} else if (Q_stricmp(name, "r_lodbias") == 0) {
ADDRGP4 $2297
JUMPV
LABELV $2296
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2310
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2308
line 3050
;3050:		switch (val) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2313
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $2315
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $2316
ADDRGP4 $2309
JUMPV
LABELV $2313
line 3052
;3051:			case 0:
;3052:				trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $2314
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3053
;3053:			break;
ADDRGP4 $2309
JUMPV
LABELV $2315
line 3055
;3054:			case 1:
;3055:				trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $2314
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3056
;3056:			break;
ADDRGP4 $2309
JUMPV
LABELV $2316
line 3058
;3057:			case 2:
;3058:				trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $2314
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3059
;3059:			break;
line 3061
;3060:		}
;3061:	} else if (Q_stricmp(name, "ui_glCustom") == 0) {
ADDRGP4 $2309
JUMPV
LABELV $2308
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2319
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2317
line 3062
;3062:		switch (val) {
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $2318
ADDRLP4 32
INDIRI4
CNSTI4 3
GTI4 $2318
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2338
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2338
address $2322
address $2334
address $2335
address $2337
code
LABELV $2322
line 3064
;3063:			case 0:	// high quality
;3064:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2323
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3065
;3065:				trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $2314
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3066
;3066:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $2324
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3067
;3067:				trap_Cvar_SetValue( "r_lodbias", 0 );
ADDRGP4 $2310
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3068
;3068:				trap_Cvar_SetValue( "r_colorbits", 32 );
ADDRGP4 $2298
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3069
;3069:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $2302
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3070
;3070:				trap_Cvar_SetValue( "r_picmip", 0 );
ADDRGP4 $2325
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3071
;3071:				trap_Cvar_SetValue( "r_mode", 4 );
ADDRGP4 $2326
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3072
;3072:				trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $2327
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3073
;3073:				trap_Cvar_SetValue( "r_fastSky", 0 );
ADDRGP4 $2328
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3074
;3074:				trap_Cvar_SetValue( "r_inGameVideo", 1 );
ADDRGP4 $2329
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3075
;3075:				trap_Cvar_SetValue( "cg_shadows", 1 );
ADDRGP4 $2330
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3076
;3076:				trap_Cvar_SetValue( "cg_brassTime", 2500 );
ADDRGP4 $2331
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3077
;3077:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2332
ARGP4
ADDRGP4 $2333
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3078
;3078:			break;
ADDRGP4 $2318
JUMPV
LABELV $2334
line 3080
;3079:			case 1: // normal 
;3080:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2323
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3081
;3081:				trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $2314
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3082
;3082:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $2324
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3083
;3083:				trap_Cvar_SetValue( "r_lodbias", 0 );
ADDRGP4 $2310
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3084
;3084:				trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $2298
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3085
;3085:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $2302
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3086
;3086:				trap_Cvar_SetValue( "r_picmip", 1 );
ADDRGP4 $2325
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3087
;3087:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $2326
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3088
;3088:				trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $2327
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3089
;3089:				trap_Cvar_SetValue( "r_fastSky", 0 );
ADDRGP4 $2328
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3090
;3090:				trap_Cvar_SetValue( "r_inGameVideo", 1 );
ADDRGP4 $2329
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3091
;3091:				trap_Cvar_SetValue( "cg_brassTime", 2500 );
ADDRGP4 $2331
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3092
;3092:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2332
ARGP4
ADDRGP4 $2333
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3093
;3093:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $2330
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3094
;3094:			break;
ADDRGP4 $2318
JUMPV
LABELV $2335
line 3096
;3095:			case 2: // fast
;3096:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2323
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3097
;3097:				trap_Cvar_SetValue( "r_subdivisions", 8 );
ADDRGP4 $2314
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3098
;3098:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $2324
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3099
;3099:				trap_Cvar_SetValue( "r_lodbias", 1 );
ADDRGP4 $2310
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3100
;3100:				trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $2298
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3101
;3101:				trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $2302
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3102
;3102:				trap_Cvar_SetValue( "r_picmip", 1 );
ADDRGP4 $2325
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3103
;3103:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $2326
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3104
;3104:				trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $2327
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3105
;3105:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $2330
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3106
;3106:				trap_Cvar_SetValue( "r_fastSky", 1 );
ADDRGP4 $2328
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3107
;3107:				trap_Cvar_SetValue( "r_inGameVideo", 0 );
ADDRGP4 $2329
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3108
;3108:				trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $2331
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3109
;3109:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2332
ARGP4
ADDRGP4 $2336
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3110
;3110:			break;
ADDRGP4 $2318
JUMPV
LABELV $2337
line 3112
;3111:			case 3: // fastest
;3112:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2323
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3113
;3113:				trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $2314
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3114
;3114:				trap_Cvar_SetValue( "r_vertexlight", 1 );
ADDRGP4 $2324
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3115
;3115:				trap_Cvar_SetValue( "r_lodbias", 2 );
ADDRGP4 $2310
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3116
;3116:				trap_Cvar_SetValue( "r_colorbits", 16 );
ADDRGP4 $2298
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3117
;3117:				trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $2302
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3118
;3118:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $2326
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3119
;3119:				trap_Cvar_SetValue( "r_picmip", 2 );
ADDRGP4 $2325
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3120
;3120:				trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $2327
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3121
;3121:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $2330
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3122
;3122:				trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $2331
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3123
;3123:				trap_Cvar_SetValue( "r_fastSky", 1 );
ADDRGP4 $2328
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3124
;3124:				trap_Cvar_SetValue( "r_inGameVideo", 0 );
ADDRGP4 $2329
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3125
;3125:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2332
ARGP4
ADDRGP4 $2336
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3126
;3126:			break;
line 3128
;3127:		}
;3128:	} else if (Q_stricmp(name, "ui_mousePitch") == 0) {
ADDRGP4 $2318
JUMPV
LABELV $2317
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2341
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2339
line 3129
;3129:		if (val == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2342
line 3130
;3130:			trap_Cvar_SetValue( "m_pitch", 0.022f );
ADDRGP4 $2344
ARGP4
CNSTF4 1018444120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3131
;3131:		} else {
ADDRGP4 $2343
JUMPV
LABELV $2342
line 3132
;3132:			trap_Cvar_SetValue( "m_pitch", -0.022f );
ADDRGP4 $2344
ARGP4
CNSTF4 3165927768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3133
;3133:		}
LABELV $2343
line 3134
;3134:	}
LABELV $2339
LABELV $2318
LABELV $2309
LABELV $2297
LABELV $2294
LABELV $2284
LABELV $2280
line 3135
;3135:}
LABELV $2278
endproc UI_Update 36 8
proc UI_RunMenuScript 1304 24
line 3137
;3136:
;3137:static void UI_RunMenuScript(char **args) {
line 3141
;3138:	const char *name, *name2;
;3139:	char buff[1024];
;3140:
;3141:	if (String_Parse(args, &name)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1032
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $2346
line 3142
;3142:		if (Q_stricmp(name, "StartServer") == 0) {
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2350
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2348
line 3145
;3143:			int i, clients, oldclients;
;3144:			float skill;
;3145:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $395
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3146
;3146:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3147
;3147:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2211
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3148
;3148:			trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, ui_dedicated.integer ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 ui_dedicated+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1056
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $2351
ARGP4
ADDRLP4 1056
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3149
;3149:			trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 8, uiInfo.gameTypes[ui_netGameType.integer].gtEnum ) );
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $1325
ARGP4
ADDRLP4 1060
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3150
;3150:			trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 1064
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2226
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3151
;3151:			trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1101
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2227
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3152
;3152:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName ) );
ADDRGP4 $2204
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3153
;3153:			skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $826
ARGP4
ADDRLP4 1076
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1076
INDIRF4
ASGNF4
line 3155
;3154:			// set max clients based on spots
;3155:			oldclients = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $2220
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1052
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 3156
;3156:			clients = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 3157
;3157:			for (i = 0; i < PLAYERS_PER_TEAM; i++) {
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $2359
line 3158
;3158:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $848
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1084
ADDRLP4 1092
INDIRF4
CVFI4 4
ASGNI4
line 3159
;3159:				if (bot >= 0) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
LTI4 $2363
line 3160
;3160:					clients++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3161
;3161:				}
LABELV $2363
line 3162
;3162:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $849
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1084
ADDRLP4 1100
INDIRF4
CVFI4 4
ASGNI4
line 3163
;3163:				if (bot >= 0) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
LTI4 $2365
line 3164
;3164:					clients++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3165
;3165:				}
LABELV $2365
line 3166
;3166:			}
LABELV $2360
line 3157
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 5
LTI4 $2359
line 3167
;3167:			if (clients == 0) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2367
line 3168
;3168:				clients = 8;
ADDRLP4 1044
CNSTI4 8
ASGNI4
line 3169
;3169:			}
LABELV $2367
line 3171
;3170:			
;3171:			if (oldclients > clients) {
ADDRLP4 1052
INDIRI4
ADDRLP4 1044
INDIRI4
LEI4 $2369
line 3172
;3172:				clients = oldclients;
ADDRLP4 1044
ADDRLP4 1052
INDIRI4
ASGNI4
line 3173
;3173:			}
LABELV $2369
line 3175
;3174:
;3175:			trap_Cvar_Set("sv_maxClients", va("%d",clients));
ADDRGP4 $715
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2220
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3177
;3176:
;3177:			for (i = 0; i < PLAYERS_PER_TEAM; i++) {
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $2371
line 3178
;3178:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $848
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1088
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 3179
;3179:				if (bot > 1) {
ADDRLP4 1088
INDIRI4
CNSTI4 1
LEI4 $2375
line 3180
;3180:					if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $2377
line 3181
;3181:						Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", uiInfo.characterList[bot-2].name, skill, "Blue");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2380
ARGP4
CNSTI4 24
ADDRLP4 1088
INDIRI4
MULI4
ADDRGP4 uiInfo+73448-48
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 $841
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3182
;3182:					} else {
ADDRGP4 $2378
JUMPV
LABELV $2377
line 3183
;3183:						Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1088
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1100
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2383
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 3184
;3184:					}
LABELV $2378
line 3185
;3185:					trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3186
;3186:				}
LABELV $2375
line 3187
;3187:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $849
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1088
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 3188
;3188:				if (bot > 1) {
ADDRLP4 1088
INDIRI4
CNSTI4 1
LEI4 $2384
line 3189
;3189:					if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $2386
line 3190
;3190:						Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", uiInfo.characterList[bot-2].name, skill, "Red");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2380
ARGP4
CNSTI4 24
ADDRLP4 1088
INDIRI4
MULI4
ADDRGP4 uiInfo+73448-48
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 $842
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3191
;3191:					} else {
ADDRGP4 $2387
JUMPV
LABELV $2386
line 3192
;3192:						Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1088
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1108
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2383
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 3193
;3193:					}
LABELV $2387
line 3194
;3194:					trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3195
;3195:				}
LABELV $2384
line 3196
;3196:			}
LABELV $2372
line 3177
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 5
LTI4 $2371
line 3197
;3197:		} else if (Q_stricmp(name, "updateSPMenu") == 0) {
ADDRGP4 $2349
JUMPV
LABELV $2348
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2393
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2391
line 3198
;3198:			UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3199
;3199:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3200
;3200:			ui_mapIndex.integer = UI_GetIndexFromSelection(ui_currentMap.integer);
ADDRGP4 ui_currentMap+12
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_GetIndexFromSelection
CALLI4
ASGNI4
ADDRGP4 ui_mapIndex+12
ADDRLP4 1044
INDIRI4
ASGNI4
line 3201
;3201:			trap_Cvar_Set("ui_mapIndex", va("%d", ui_mapIndex.integer));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2198
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3202
;3202:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, ui_mapIndex.integer, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRGP4 $2194
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3203
;3203:			UI_GameType_HandleKey(0, 0, K_MOUSE1, qfalse);
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 3204
;3204:			UI_GameType_HandleKey(0, 0, K_MOUSE2, qfalse);
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 179
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 3205
;3205:		} else if (Q_stricmp(name, "resetDefaults") == 0) {
ADDRGP4 $2392
JUMPV
LABELV $2391
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2400
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2398
line 3206
;3206:			trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $2401
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3207
;3207:			trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $2402
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3208
;3208:			Controls_SetDefaults();
ADDRGP4 Controls_SetDefaults
CALLV
pop
line 3209
;3209:			trap_Cvar_Set("com_introPlayed", "1" );
ADDRGP4 $2403
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3210
;3210:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2404
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3211
;3211:		} else if (Q_stricmp(name, "getCDKey") == 0) {
ADDRGP4 $2399
JUMPV
LABELV $2398
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2407
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2405
line 3213
;3212:			char out[17];
;3213:			trap_GetCDKey(buff, 17);
ADDRLP4 0
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 3214
;3214:			trap_Cvar_Set("cdkey1", "");
ADDRGP4 $2408
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3215
;3215:			trap_Cvar_Set("cdkey2", "");
ADDRGP4 $2409
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3216
;3216:			trap_Cvar_Set("cdkey3", "");
ADDRGP4 $2410
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3217
;3217:			trap_Cvar_Set("cdkey4", "");
ADDRGP4 $2411
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3218
;3218:			if (strlen(buff) == CDKEY_LEN) {
ADDRLP4 0
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 16
NEI4 $2406
line 3219
;3219:				Q_strncpyz(out, buff, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3220
;3220:				trap_Cvar_Set("cdkey1", out);
ADDRGP4 $2408
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3221
;3221:				Q_strncpyz(out, buff + 4, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0+4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3222
;3222:				trap_Cvar_Set("cdkey2", out);
ADDRGP4 $2409
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3223
;3223:				Q_strncpyz(out, buff + 8, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0+8
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3224
;3224:				trap_Cvar_Set("cdkey3", out);
ADDRGP4 $2410
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3225
;3225:				Q_strncpyz(out, buff + 12, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3226
;3226:				trap_Cvar_Set("cdkey4", out);
ADDRGP4 $2411
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3227
;3227:			}
line 3229
;3228:
;3229:		} else if (Q_stricmp(name, "verifyCDKey") == 0) {
ADDRGP4 $2406
JUMPV
LABELV $2405
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2419
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2417
line 3230
;3230:			buff[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 3231
;3231:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey1")); 
ADDRGP4 $2408
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3232
;3232:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey2")); 
ADDRGP4 $2409
ARGP4
ADDRLP4 1060
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3233
;3233:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey3")); 
ADDRGP4 $2410
ARGP4
ADDRLP4 1064
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3234
;3234:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey4")); 
ADDRGP4 $2411
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3235
;3235:			trap_Cvar_Set("cdkey", buff);
ADDRGP4 $2420
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3236
;3236:			if (trap_VerifyCDKey(buff, UI_Cvar_VariableString("cdkeychecksum"))) {
ADDRGP4 $2423
ARGP4
ADDRLP4 1072
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $2421
line 3237
;3237:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key Appears to be valid.");
ADDRGP4 $2424
ARGP4
ADDRGP4 $2425
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3238
;3238:				trap_SetCDKey(buff);
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetCDKey
CALLV
pop
line 3239
;3239:			} else {
ADDRGP4 $2418
JUMPV
LABELV $2421
line 3240
;3240:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key does not appear to be valid.");
ADDRGP4 $2424
ARGP4
ADDRGP4 $2426
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3241
;3241:			}
line 3242
;3242:		} else if (Q_stricmp(name, "loadArenas") == 0) {
ADDRGP4 $2418
JUMPV
LABELV $2417
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2429
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2427
line 3243
;3243:			UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 3244
;3244:			UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3245
;3245:			Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, "createserver");
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2430
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3246
;3246:		} else if (Q_stricmp(name, "saveControls") == 0) {
ADDRGP4 $2428
JUMPV
LABELV $2427
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2433
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2431
line 3247
;3247:			Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 3248
;3248:		} else if (Q_stricmp(name, "loadControls") == 0) {
ADDRGP4 $2432
JUMPV
LABELV $2431
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2436
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2434
line 3249
;3249:			Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 3250
;3250:		} else if (Q_stricmp(name, "clearError") == 0) {
ADDRGP4 $2435
JUMPV
LABELV $2434
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2439
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $2437
line 3251
;3251:			trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2440
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3252
;3252:		} else if (Q_stricmp(name, "loadGameInfo") == 0) {
ADDRGP4 $2438
JUMPV
LABELV $2437
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2443
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $2441
line 3256
;3253:#ifdef PRE_RELEASE_TADEMO
;3254:			UI_ParseGameInfo("demogameinfo.txt");
;3255:#else
;3256:			UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $676
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 3258
;3257:#endif
;3258:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 3259
;3259:		} else if (Q_stricmp(name, "resetScores") == 0) {
ADDRGP4 $2442
JUMPV
LABELV $2441
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2452
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $2450
line 3260
;3260:			UI_ClearScores();
ADDRGP4 UI_ClearScores
CALLV
pop
line 3261
;3261:		} else if (Q_stricmp(name, "RefreshServers") == 0) {
ADDRGP4 $2451
JUMPV
LABELV $2450
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2455
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $2453
line 3262
;3262:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3263
;3263:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3264
;3264:		} else if (Q_stricmp(name, "RefreshFilter") == 0) {
ADDRGP4 $2454
JUMPV
LABELV $2453
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2458
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $2456
line 3265
;3265:			UI_StartServerRefresh(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3266
;3266:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3267
;3267:		} else if (Q_stricmp(name, "RunSPDemo") == 0) {
ADDRGP4 $2457
JUMPV
LABELV $2456
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2461
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $2459
line 3268
;3268:			if (uiInfo.demoAvailable) {
ADDRGP4 uiInfo+73432
INDIRI4
CNSTI4 0
EQI4 $2460
line 3269
;3269:			  trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s_%i\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum));
ADDRGP4 $2465
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3270
;3270:			}
line 3271
;3271:		} else if (Q_stricmp(name, "LoadDemos") == 0) {
ADDRGP4 $2460
JUMPV
LABELV $2459
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2474
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $2472
line 3272
;3272:			UI_LoadDemos();
ADDRGP4 UI_LoadDemos
CALLV
pop
line 3273
;3273:		} else if (Q_stricmp(name, "LoadMovies") == 0) {
ADDRGP4 $2473
JUMPV
LABELV $2472
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2477
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $2475
line 3274
;3274:			UI_LoadMovies();
ADDRGP4 UI_LoadMovies
CALLV
pop
line 3275
;3275:		} else if (Q_stricmp(name, "LoadMods") == 0) {
ADDRGP4 $2476
JUMPV
LABELV $2475
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2480
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $2478
line 3276
;3276:			UI_LoadMods();
ADDRGP4 UI_LoadMods
CALLV
pop
line 3277
;3277:		} else if (Q_stricmp(name, "playMovie") == 0) {
ADDRGP4 $2479
JUMPV
LABELV $2478
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2483
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $2481
line 3278
;3278:			if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 0
LTI4 $2484
line 3279
;3279:			  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 3280
;3280:			}
LABELV $2484
line 3281
;3281:			trap_Cmd_ExecuteText( EXEC_APPEND, va("cinematic %s.roq 2\n", uiInfo.movieList[uiInfo.movieIndex]));
ADDRGP4 $2488
ARGP4
ADDRGP4 uiInfo+99256
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3282
;3282:		} else if (Q_stricmp(name, "RunMod") == 0) {
ADDRGP4 $2482
JUMPV
LABELV $2481
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2493
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $2491
line 3283
;3283:			trap_Cvar_Set( "fs_game", uiInfo.modList[uiInfo.modIndex].modName);
ADDRGP4 $2494
ARGP4
ADDRGP4 uiInfo+97192
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3284
;3284:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2497
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3285
;3285:		} else if (Q_stricmp(name, "RunDemo") == 0) {
ADDRGP4 $2492
JUMPV
LABELV $2491
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2500
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2498
line 3286
;3286:			trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s\n", uiInfo.demoList[uiInfo.demoIndex]));
ADDRGP4 $2501
ARGP4
ADDRGP4 uiInfo+98224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97196
ADDP4
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3287
;3287:		} else if (Q_stricmp(name, "Quake3") == 0) {
ADDRGP4 $2499
JUMPV
LABELV $2498
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2506
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2504
line 3288
;3288:			trap_Cvar_Set( "fs_game", "");
ADDRGP4 $2494
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3289
;3289:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2497
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3290
;3290:		} else if (Q_stricmp(name, "closeJoin") == 0) {
ADDRGP4 $2505
JUMPV
LABELV $2504
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2509
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2507
line 3291
;3291:			if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
EQI4 $2510
line 3292
;3292:				UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 3293
;3293:				uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+99264+10420
CNSTI4 0
ASGNI4
line 3294
;3294:				uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+114144
CNSTI4 0
ASGNI4
line 3295
;3295:				uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 3296
;3296:				UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3297
;3297:			} else {
ADDRGP4 $2508
JUMPV
LABELV $2510
line 3298
;3298:				Menus_CloseByName("joinserver");
ADDRGP4 $2518
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 3299
;3299:				Menus_OpenByName("main");
ADDRGP4 $2519
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 3300
;3300:			}
line 3301
;3301:		} else if (Q_stricmp(name, "StopRefresh") == 0) {
ADDRGP4 $2508
JUMPV
LABELV $2507
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2522
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $2520
line 3302
;3302:			UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 3303
;3303:			uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+99264+10420
CNSTI4 0
ASGNI4
line 3304
;3304:			uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+114144
CNSTI4 0
ASGNI4
line 3305
;3305:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 3306
;3306:		} else if (Q_stricmp(name, "UpdateFilter") == 0) {
ADDRGP4 $2521
JUMPV
LABELV $2520
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2529
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $2527
line 3307
;3307:			if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $2530
line 3308
;3308:				UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3309
;3309:			}
LABELV $2530
line 3310
;3310:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3311
;3311:			UI_FeederSelection(FEEDER_SERVERS, 0);
CNSTF4 1073741824
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 3312
;3312:		} else if (Q_stricmp(name, "ServerStatus") == 0) {
ADDRGP4 $2528
JUMPV
LABELV $2527
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2535
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $2533
line 3313
;3313:			trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], uiInfo.serverStatusAddress, sizeof(uiInfo.serverStatusAddress));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 uiInfo+110748
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 3314
;3314:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 3315
;3315:		} else if (Q_stricmp(name, "FoundPlayerServerStatus") == 0) {
ADDRGP4 $2534
JUMPV
LABELV $2533
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2545
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $2543
line 3316
;3316:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+110748
ARGP4
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3317
;3317:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 3318
;3318:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3319
;3319:		} else if (Q_stricmp(name, "FindPlayer") == 0) {
ADDRGP4 $2544
JUMPV
LABELV $2543
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2552
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $2550
line 3320
;3320:			UI_BuildFindPlayerList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 3322
;3321:			// clear the displayed server status info
;3322:			uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+110812+3328
CNSTI4 0
ASGNI4
line 3323
;3323:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3324
;3324:		} else if (Q_stricmp(name, "JoinServer") == 0) {
ADDRGP4 $2551
JUMPV
LABELV $2550
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2557
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $2555
line 3325
;3325:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $395
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3326
;3326:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3327
;3327:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2211
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3328
;3328:			if (uiInfo.serverStatus.currentServer >= 0 && uiInfo.serverStatus.currentServer < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 0
LTI4 $2556
ADDRGP4 uiInfo+99264+2216
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GEI4 $2556
line 3329
;3329:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, 1024);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 3330
;3330:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", buff ) );
ADDRGP4 $2571
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1148
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3331
;3331:			}
line 3332
;3332:		} else if (Q_stricmp(name, "FoundPlayerJoinServer") == 0) {
ADDRGP4 $2556
JUMPV
LABELV $2555
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2574
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $2572
line 3333
;3333:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2211
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3334
;3334:			if (uiInfo.currentFoundPlayerServer >= 0 && uiInfo.currentFoundPlayerServer < uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 0
LTI4 $2573
ADDRGP4 uiInfo+119464
INDIRI4
ADDRGP4 uiInfo+119468
INDIRI4
GEI4 $2573
line 3335
;3335:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer] ) );
ADDRGP4 $2571
ARGP4
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416
ADDP4
ARGP4
ADDRLP4 1152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3336
;3336:			}
line 3337
;3337:		} else if (Q_stricmp(name, "Quit") == 0) {
ADDRGP4 $2573
JUMPV
LABELV $2572
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2584
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $2582
line 3338
;3338:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2211
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3339
;3339:			trap_Cmd_ExecuteText( EXEC_NOW, "quit");
CNSTI4 0
ARGI4
ADDRGP4 $2585
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3340
;3340:		} else if (Q_stricmp(name, "Controls") == 0) {
ADDRGP4 $2583
JUMPV
LABELV $2582
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2588
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2586
line 3341
;3341:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3342
;3342:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3343
;3343:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3344
;3344:			Menus_ActivateByName("setup_menu2");
ADDRGP4 $2590
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 3345
;3345:		} else if (Q_stricmp(name, "Leave") == 0) {
ADDRGP4 $2587
JUMPV
LABELV $2586
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2593
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $2591
line 3346
;3346:			trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2594
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3347
;3347:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3348
;3348:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3349
;3349:			Menus_ActivateByName("main");
ADDRGP4 $2519
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 3350
;3350:		} else if (Q_stricmp(name, "ServerSort") == 0) {
ADDRGP4 $2592
JUMPV
LABELV $2591
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2597
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $2595
line 3352
;3351:			int sortColumn;
;3352:			if (Int_Parse(args, &sortColumn)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 1172
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $2596
line 3354
;3353:				// if same column we're already sorting on then flip the direction
;3354:				if (sortColumn == uiInfo.serverStatus.sortKey) {
ADDRLP4 1168
INDIRI4
ADDRGP4 uiInfo+99264+2200
INDIRI4
NEI4 $2600
line 3355
;3355:					uiInfo.serverStatus.sortDir = !uiInfo.serverStatus.sortDir;
ADDRGP4 uiInfo+99264+2204
INDIRI4
CNSTI4 0
NEI4 $2609
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $2610
JUMPV
LABELV $2609
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $2610
ADDRGP4 uiInfo+99264+2204
ADDRLP4 1176
INDIRI4
ASGNI4
line 3356
;3356:				}
LABELV $2600
line 3358
;3357:				// make sure we sort again
;3358:				UI_ServersSort(sortColumn, qtrue);
ADDRLP4 1168
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_ServersSort
CALLV
pop
line 3359
;3359:			}
line 3360
;3360:		} else if (Q_stricmp(name, "nextSkirmish") == 0) {
ADDRGP4 $2596
JUMPV
LABELV $2595
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2613
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $2611
line 3361
;3361:			UI_StartSkirmish(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 3362
;3362:		} else if (Q_stricmp(name, "SkirmishStart") == 0) {
ADDRGP4 $2612
JUMPV
LABELV $2611
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2616
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $2614
line 3363
;3363:			UI_StartSkirmish(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 3364
;3364:		} else if (Q_stricmp(name, "closeingame") == 0) {
ADDRGP4 $2615
JUMPV
LABELV $2614
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2619
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $2617
line 3365
;3365:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1180
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3366
;3366:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3367
;3367:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3368
;3368:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3369
;3369:		} else if (Q_stricmp(name, "voteMap") == 0) {
ADDRGP4 $2618
JUMPV
LABELV $2617
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2622
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $2620
line 3370
;3370:			if (ui_currentNetMap.integer >=0 && ui_currentNetMap.integer < uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $2621
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
GEI4 $2621
line 3371
;3371:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s\n",uiInfo.mapList[ui_currentNetMap.integer].mapLoadName) );
ADDRGP4 $2628
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3372
;3372:			}
line 3373
;3373:		} else if (Q_stricmp(name, "voteKick") == 0) {
ADDRGP4 $2621
JUMPV
LABELV $2620
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2634
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $2632
line 3374
;3374:			if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount) {
ADDRGP4 uiInfo+78860
INDIRI4
CNSTI4 0
LTI4 $2633
ADDRGP4 uiInfo+78860
INDIRI4
ADDRGP4 uiInfo+78844
INDIRI4
GEI4 $2633
line 3375
;3375:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote kick %s\n",uiInfo.playerNames[uiInfo.playerIndex]) );
ADDRGP4 $2640
ARGP4
ADDRGP4 uiInfo+78860
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
ARGP4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3376
;3376:			}
line 3377
;3377:		} else if (Q_stricmp(name, "voteGame") == 0) {
ADDRGP4 $2633
JUMPV
LABELV $2632
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2645
ARGP4
ADDRLP4 1188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $2643
line 3378
;3378:			if (ui_netGameType.integer >= 0 && ui_netGameType.integer < uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $2644
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
GEI4 $2644
line 3379
;3379:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_gametype %i\n",uiInfo.gameTypes[ui_netGameType.integer].gtEnum) );
ADDRGP4 $2651
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3380
;3380:			}
line 3381
;3381:		} else if (Q_stricmp(name, "voteLeader") == 0) {
ADDRGP4 $2644
JUMPV
LABELV $2643
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2657
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $2655
line 3382
;3382:			if (uiInfo.teamIndex >= 0 && uiInfo.teamIndex < uiInfo.myTeamCount) {
ADDRGP4 uiInfo+78852
INDIRI4
CNSTI4 0
LTI4 $2656
ADDRGP4 uiInfo+78852
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $2656
line 3383
;3383:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callteamvote leader %s\n",uiInfo.teamNames[uiInfo.teamIndex]) );
ADDRGP4 $2663
ARGP4
ADDRGP4 uiInfo+78852
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3384
;3384:			}
line 3385
;3385:		} else if (Q_stricmp(name, "addBot") == 0) {
ADDRGP4 $2656
JUMPV
LABELV $2655
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2668
ARGP4
ADDRLP4 1196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $2666
line 3386
;3386:			if (trap_Cvar_VariableValue("g_gametype") >= GT_TEAM) {
ADDRGP4 $1325
ARGP4
ADDRLP4 1200
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1200
INDIRF4
CNSTF4 1077936128
LTF4 $2669
line 3387
;3387:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", uiInfo.characterList[uiInfo.botIndex].name, uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 $2671
ARGP4
CNSTI4 24
ADDRGP4 uiInfo+73444
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78840
INDIRI4
CNSTI4 0
NEI4 $2677
ADDRLP4 1204
ADDRGP4 $842
ASGNP4
ADDRGP4 $2678
JUMPV
LABELV $2677
ADDRLP4 1204
ADDRGP4 $841
ASGNP4
LABELV $2678
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1208
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3388
;3388:			} else {
ADDRGP4 $2667
JUMPV
LABELV $2669
line 3389
;3389:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 uiInfo+73444
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $2671
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78840
INDIRI4
CNSTI4 0
NEI4 $2683
ADDRLP4 1204
ADDRGP4 $842
ASGNP4
ADDRGP4 $2684
JUMPV
LABELV $2683
ADDRLP4 1204
ADDRGP4 $841
ASGNP4
LABELV $2684
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3390
;3390:			}
line 3391
;3391:		} else if (Q_stricmp(name, "addFavorite") == 0) {
ADDRGP4 $2667
JUMPV
LABELV $2666
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2687
ARGP4
ADDRLP4 1200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $2685
line 3392
;3392:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $2686
line 3397
;3393:				char name[MAX_NAME_LENGTH];
;3394:				char addr[MAX_NAME_LENGTH];
;3395:				int res;
;3396:
;3397:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 3398
;3398:				name[0] = addr[0] = '\0';
ADDRLP4 1272
CNSTI1 0
ASGNI1
ADDRLP4 1204
ADDRLP4 1272
INDIRI1
ASGNI1
ADDRLP4 1236
ADDRLP4 1272
INDIRI1
ASGNI1
line 3399
;3399:				Q_strncpyz(name, 	Info_ValueForKey(buff, "hostname"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2696
ARGP4
ADDRLP4 1276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1236
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3400
;3400:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2697
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1204
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3401
;3401:				if (strlen(name) > 0 && strlen(addr) > 0) {
ADDRLP4 1236
ARGP4
ADDRLP4 1284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
LEI4 $2686
ADDRLP4 1204
ARGP4
ADDRLP4 1288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
LEI4 $2686
line 3402
;3402:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1236
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 1292
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1268
ADDRLP4 1292
INDIRI4
ASGNI4
line 3403
;3403:					if (res == 0) {
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $2700
line 3405
;3404:						// server already in the list
;3405:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2702
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3406
;3406:					}
ADDRGP4 $2686
JUMPV
LABELV $2700
line 3407
;3407:					else if (res == -1) {
ADDRLP4 1268
INDIRI4
CNSTI4 -1
NEI4 $2703
line 3409
;3408:						// list full
;3409:						Com_Printf("Favorite list full\n");
ADDRGP4 $2705
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3410
;3410:					}
ADDRGP4 $2686
JUMPV
LABELV $2703
line 3411
;3411:					else {
line 3413
;3412:						// successfully added
;3413:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2706
ARGP4
ADDRLP4 1204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3414
;3414:					}
line 3415
;3415:				}
line 3416
;3416:			}
line 3417
;3417:		} else if (Q_stricmp(name, "deleteFavorite") == 0) {
ADDRGP4 $2686
JUMPV
LABELV $2685
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2709
ARGP4
ADDRLP4 1204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $2707
line 3418
;3418:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $2708
line 3420
;3419:				char addr[MAX_NAME_LENGTH];
;3420:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 3421
;3421:				addr[0] = '\0';
ADDRLP4 1208
CNSTI1 0
ASGNI1
line 3422
;3422:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2697
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1208
ARGP4
ADDRLP4 1240
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3423
;3423:				if (strlen(addr) > 0) {
ADDRLP4 1208
ARGP4
ADDRLP4 1244
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
LEI4 $2708
line 3424
;3424:					trap_LAN_RemoveServer(AS_FAVORITES, addr);
CNSTI4 3
ARGI4
ADDRLP4 1208
ARGP4
ADDRGP4 trap_LAN_RemoveServer
CALLV
pop
line 3425
;3425:				}
line 3426
;3426:			}
line 3427
;3427:		} else if (Q_stricmp(name, "createFavorite") == 0) {
ADDRGP4 $2708
JUMPV
LABELV $2707
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2722
ARGP4
ADDRLP4 1208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
NEI4 $2720
line 3428
;3428:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $2721
line 3433
;3429:				char name[MAX_NAME_LENGTH];
;3430:				char addr[MAX_NAME_LENGTH];
;3431:				int res;
;3432:
;3433:				name[0] = addr[0] = '\0';
ADDRLP4 1280
CNSTI1 0
ASGNI1
ADDRLP4 1212
ADDRLP4 1280
INDIRI1
ASGNI1
ADDRLP4 1244
ADDRLP4 1280
INDIRI1
ASGNI1
line 3434
;3434:				Q_strncpyz(name, 	UI_Cvar_VariableString("ui_favoriteName"), MAX_NAME_LENGTH);
ADDRGP4 $2726
ARGP4
ADDRLP4 1284
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1244
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3435
;3435:				Q_strncpyz(addr, 	UI_Cvar_VariableString("ui_favoriteAddress"), MAX_NAME_LENGTH);
ADDRGP4 $2727
ARGP4
ADDRLP4 1288
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1212
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3436
;3436:				if (strlen(name) > 0 && strlen(addr) > 0) {
ADDRLP4 1244
ARGP4
ADDRLP4 1292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
LEI4 $2721
ADDRLP4 1212
ARGP4
ADDRLP4 1296
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
LEI4 $2721
line 3437
;3437:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1244
ARGP4
ADDRLP4 1212
ARGP4
ADDRLP4 1300
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1276
ADDRLP4 1300
INDIRI4
ASGNI4
line 3438
;3438:					if (res == 0) {
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $2730
line 3440
;3439:						// server already in the list
;3440:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2702
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3441
;3441:					}
ADDRGP4 $2721
JUMPV
LABELV $2730
line 3442
;3442:					else if (res == -1) {
ADDRLP4 1276
INDIRI4
CNSTI4 -1
NEI4 $2732
line 3444
;3443:						// list full
;3444:						Com_Printf("Favorite list full\n");
ADDRGP4 $2705
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3445
;3445:					}
ADDRGP4 $2721
JUMPV
LABELV $2732
line 3446
;3446:					else {
line 3448
;3447:						// successfully added
;3448:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2706
ARGP4
ADDRLP4 1212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3449
;3449:					}
line 3450
;3450:				}
line 3451
;3451:			}
line 3452
;3452:		} else if (Q_stricmp(name, "orders") == 0) {
ADDRGP4 $2721
JUMPV
LABELV $2720
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2736
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $2734
line 3454
;3453:			const char *orders;
;3454:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1216
ARGP4
ADDRLP4 1220
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
EQI4 $2735
line 3455
;3455:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1393
ARGP4
ADDRLP4 1228
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1224
ADDRLP4 1228
INDIRF4
CVFI4 4
ASGNI4
line 3456
;3456:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1224
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $2739
line 3457
;3457:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3458
;3458:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3459
;3459:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2743
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3460
;3460:				} else {
ADDRGP4 $2740
JUMPV
LABELV $2739
line 3462
;3461:					int i;
;3462:					for (i = 0; i < uiInfo.myTeamCount; i++) {
ADDRLP4 1232
CNSTI4 0
ASGNI4
ADDRGP4 $2747
JUMPV
LABELV $2744
line 3463
;3463:						if (Q_stricmp(UI_Cvar_VariableString("name"), uiInfo.teamNames[i]) == 0) {
ADDRGP4 $1411
ARGP4
ADDRLP4 1236
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $2749
line 3464
;3464:							continue;
ADDRGP4 $2745
JUMPV
LABELV $2749
line 3466
;3465:						}
;3466:						strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3467
;3467:						trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamNames[i]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 1244
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1244
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3468
;3468:						trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2743
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3469
;3469:					}
LABELV $2745
line 3462
ADDRLP4 1232
ADDRLP4 1232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2747
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
LTI4 $2744
line 3470
;3470:				}
LABELV $2740
line 3471
;3471:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1232
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3472
;3472:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3473
;3473:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3474
;3474:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3475
;3475:			}
line 3476
;3476:		} else if (Q_stricmp(name, "voiceOrdersTeam") == 0) {
ADDRGP4 $2735
JUMPV
LABELV $2734
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2755
ARGP4
ADDRLP4 1216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
NEI4 $2753
line 3478
;3477:			const char *orders;
;3478:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 1224
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
EQI4 $2754
line 3479
;3479:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1393
ARGP4
ADDRLP4 1232
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1228
ADDRLP4 1232
INDIRF4
CVFI4 4
ASGNI4
line 3480
;3480:				if (selectedPlayer == uiInfo.myTeamCount) {
ADDRLP4 1228
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
NEI4 $2758
line 3481
;3481:					trap_Cmd_ExecuteText( EXEC_APPEND, orders );
CNSTI4 2
ARGI4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3482
;3482:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2743
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3483
;3483:				}
LABELV $2758
line 3484
;3484:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1236
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3485
;3485:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3486
;3486:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3487
;3487:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3488
;3488:			}
line 3489
;3489:		} else if (Q_stricmp(name, "voiceOrders") == 0) {
ADDRGP4 $2754
JUMPV
LABELV $2753
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2763
ARGP4
ADDRLP4 1220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $2761
line 3491
;3490:			const char *orders;
;3491:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1228
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $2762
line 3492
;3492:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1393
ARGP4
ADDRLP4 1236
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1232
ADDRLP4 1236
INDIRF4
CVFI4 4
ASGNI4
line 3493
;3493:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $2766
line 3494
;3494:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3495
;3495:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3496
;3496:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2743
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3497
;3497:				}
LABELV $2766
line 3498
;3498:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1240
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3499
;3499:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3500
;3500:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3501
;3501:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3502
;3502:			}
line 3503
;3503:		} else if (Q_stricmp(name, "glCustom") == 0) {
ADDRGP4 $2762
JUMPV
LABELV $2761
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2772
ARGP4
ADDRLP4 1224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $2770
line 3504
;3504:			trap_Cvar_Set("ui_glCustom", "4");
ADDRGP4 $2319
ARGP4
ADDRGP4 $2773
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3505
;3505:		} else if (Q_stricmp(name, "update") == 0) {
ADDRGP4 $2771
JUMPV
LABELV $2770
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2776
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $2774
line 3506
;3506:			if (String_Parse(args, &name2)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1232
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $2775
line 3507
;3507:				UI_Update(name2);
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 UI_Update
CALLV
pop
line 3508
;3508:			}
line 3509
;3509:		} else if (Q_stricmp(name, "setPbClStatus") == 0) {
ADDRGP4 $2775
JUMPV
LABELV $2774
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2781
ARGP4
ADDRLP4 1232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $2779
line 3511
;3510:			int stat;
;3511:			if ( Int_Parse( args, &stat ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1236
ARGP4
ADDRLP4 1240
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
EQI4 $2780
line 3512
;3512:				trap_SetPbClStatus( stat );
ADDRLP4 1236
INDIRI4
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 3513
;3513:		}
ADDRGP4 $2780
JUMPV
LABELV $2779
line 3514
;3514:		else {
line 3515
;3515:			Com_Printf("unknown UI script %s\n", name);
ADDRGP4 $2784
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3516
;3516:		}
LABELV $2780
LABELV $2775
LABELV $2771
LABELV $2762
LABELV $2754
LABELV $2735
LABELV $2721
LABELV $2708
LABELV $2686
LABELV $2667
LABELV $2656
LABELV $2644
LABELV $2633
LABELV $2621
LABELV $2618
LABELV $2615
LABELV $2612
LABELV $2596
LABELV $2592
LABELV $2587
LABELV $2583
LABELV $2573
LABELV $2556
LABELV $2551
LABELV $2544
LABELV $2534
LABELV $2528
LABELV $2521
LABELV $2508
LABELV $2505
LABELV $2499
LABELV $2492
LABELV $2482
LABELV $2479
LABELV $2476
LABELV $2473
LABELV $2460
LABELV $2457
LABELV $2454
LABELV $2451
LABELV $2442
LABELV $2438
LABELV $2435
LABELV $2432
LABELV $2428
LABELV $2418
LABELV $2406
LABELV $2399
LABELV $2392
LABELV $2349
line 3517
;3517:	}
LABELV $2346
line 3518
;3518:}
LABELV $2345
endproc UI_RunMenuScript 1304 24
proc UI_GetTeamColor 0 0
line 3520
;3519:
;3520:static void UI_GetTeamColor(vec4_t *color) {
line 3521
;3521:}
LABELV $2785
endproc UI_GetTeamColor 0 0
proc UI_MapCountByGameType 16 0
line 3528
;3522:
;3523:/*
;3524:==================
;3525:UI_MapCountByGameType
;3526:==================
;3527:*/
;3528:static int UI_MapCountByGameType(qboolean singlePlayer) {
line 3530
;3529:	int i, c, game;
;3530:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3531
;3531:	game = singlePlayer ? uiInfo.gameTypes[ui_gameType.integer].gtEnum : uiInfo.gameTypes[ui_netGameType.integer].gtEnum;
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2794
ADDRLP4 12
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2795
JUMPV
LABELV $2794
ADDRLP4 12
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ASGNI4
LABELV $2795
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3532
;3532:	if (game == GT_SINGLE_PLAYER) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $2796
line 3533
;3533:		game++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3534
;3534:	} 
LABELV $2796
line 3535
;3535:	if (game == GT_TEAM) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $2798
line 3536
;3536:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3537
;3537:	}
LABELV $2798
line 3539
;3538:
;3539:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2803
JUMPV
LABELV $2800
line 3540
;3540:		uiInfo.mapList[i].active = qfalse;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
CNSTI4 0
ASGNI4
line 3541
;3541:		if ( uiInfo.mapList[i].typeBits & (1 << game)) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2807
line 3542
;3542:			if (singlePlayer) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2811
line 3543
;3543:				if (!(uiInfo.mapList[i].typeBits & (1 << GT_SINGLE_PLAYER))) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $2813
line 3544
;3544:					continue;
ADDRGP4 $2801
JUMPV
LABELV $2813
line 3546
;3545:				}
;3546:			}
LABELV $2811
line 3547
;3547:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3548
;3548:			uiInfo.mapList[i].active = qtrue;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
CNSTI4 1
ASGNI4
line 3549
;3549:		}
LABELV $2807
line 3550
;3550:	}
LABELV $2801
line 3539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2803
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $2800
line 3551
;3551:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $2786
endproc UI_MapCountByGameType 16 0
export UI_hasSkinForBase
proc UI_hasSkinForBase 1032 20
line 3554
;3552:}
;3553:
;3554:qboolean UI_hasSkinForBase(const char *base, const char *team) {
line 3557
;3555:	char	test[1024];
;3556:	
;3557:	Com_sprintf( test, sizeof( test ), "models/players/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2820
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3559
;3558:
;3559:	if (trap_FS_FOpenFile(test, 0, FS_READ)) {
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1024
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $2821
line 3560
;3560:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2819
JUMPV
LABELV $2821
line 3562
;3561:	}
;3562:	Com_sprintf( test, sizeof( test ), "models/players/characters/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2823
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3564
;3563:
;3564:	if (trap_FS_FOpenFile(test, 0, FS_READ)) {
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1028
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $2824
line 3565
;3565:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2819
JUMPV
LABELV $2824
line 3567
;3566:	}
;3567:	return qfalse;
CNSTI4 0
RETI4
LABELV $2819
endproc UI_hasSkinForBase 1032 20
data
align 4
LABELV $2827
byte 4 0
code
proc UI_HeadCountByTeam 40 8
line 3575
;3568:}
;3569:
;3570:/*
;3571:==================
;3572:UI_MapCountByTeam
;3573:==================
;3574:*/
;3575:static int UI_HeadCountByTeam() {
line 3579
;3576:	static int init = 0;
;3577:	int i, j, k, c, tIndex;
;3578:	
;3579:	c = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 3580
;3580:	if (!init) {
ADDRGP4 $2827
INDIRI4
CNSTI4 0
NEI4 $2828
line 3581
;3581:		for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2833
JUMPV
LABELV $2830
line 3582
;3582:			uiInfo.characterList[i].reference = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+20
ADDP4
CNSTI4 0
ASGNI4
line 3583
;3583:			for (j = 0; j < uiInfo.teamCount; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2840
JUMPV
LABELV $2837
line 3584
;3584:			  if (UI_hasSkinForBase(uiInfo.characterList[i].base, uiInfo.teamList[j].teamName)) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_hasSkinForBase
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $2842
line 3585
;3585:					uiInfo.characterList[i].reference |= (1<<j);
ADDRLP4 24
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
BORI4
ASGNI4
line 3586
;3586:			  }
LABELV $2842
line 3587
;3587:			}
LABELV $2838
line 3583
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2840
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $2837
line 3588
;3588:		}
LABELV $2831
line 3581
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2833
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $2830
line 3589
;3589:		init = 1;
ADDRGP4 $2827
CNSTI4 1
ASGNI4
line 3590
;3590:	}
LABELV $2828
line 3592
;3591:
;3592:	tIndex = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3595
;3593:
;3594:	// do names
;3595:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2852
JUMPV
LABELV $2849
line 3596
;3596:		uiInfo.characterList[i].active = qfalse;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
CNSTI4 0
ASGNI4
line 3597
;3597:		for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2856
line 3598
;3598:			if (uiInfo.teamList[tIndex].teamMembers[j] != NULL) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2860
line 3599
;3599:				if (uiInfo.characterList[i].reference&(1<<tIndex)) {// && Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.characterList[i].name)==0) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2864
line 3600
;3600:					uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
CNSTI4 1
ASGNI4
line 3601
;3601:					c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3602
;3602:					break;
ADDRGP4 $2858
JUMPV
LABELV $2864
line 3604
;3603:				}
;3604:			}
LABELV $2860
line 3605
;3605:		}
LABELV $2857
line 3597
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $2856
LABELV $2858
line 3606
;3606:	}
LABELV $2850
line 3595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2852
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $2849
line 3609
;3607:
;3608:	// and then aliases
;3609:	for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2870
line 3610
;3610:		for(k = 0; k < uiInfo.aliasCount; k++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2877
JUMPV
LABELV $2874
line 3611
;3611:			if (uiInfo.aliasList[k].name != NULL) {
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2879
line 3612
;3612:				if (Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.aliasList[k].name)==0) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2882
line 3613
;3613:					for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2890
JUMPV
LABELV $2887
line 3614
;3614:						if (uiInfo.characterList[i].headImage != -1 && uiInfo.characterList[i].reference&(1<<tIndex) && Q_stricmp(uiInfo.aliasList[k].ai, uiInfo.characterList[i].name)==0) {
ADDRLP4 32
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73448+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2892
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73448+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2892
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2892
line 3615
;3615:							if (uiInfo.characterList[i].active == qfalse) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2889
line 3616
;3616:								uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
CNSTI4 1
ASGNI4
line 3617
;3617:								c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3618
;3618:							}
line 3619
;3619:							break;
ADDRGP4 $2889
JUMPV
LABELV $2892
line 3621
;3620:						}
;3621:					}
LABELV $2888
line 3613
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2890
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $2887
LABELV $2889
line 3622
;3622:				}
LABELV $2882
line 3623
;3623:			}
LABELV $2879
line 3624
;3624:		}
LABELV $2875
line 3610
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2877
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $2874
line 3625
;3625:	}
LABELV $2871
line 3609
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $2870
line 3626
;3626:	return c;
ADDRLP4 16
INDIRI4
RETI4
LABELV $2826
endproc UI_HeadCountByTeam 40 8
proc UI_InsertServerIntoDisplayList 16 0
line 3634
;3627:}
;3628:
;3629:/*
;3630:==================
;3631:UI_InsertServerIntoDisplayList
;3632:==================
;3633:*/
;3634:static void UI_InsertServerIntoDisplayList(int num, int position) {
line 3637
;3635:	int i;
;3636:
;3637:	if (position < 0 || position > uiInfo.serverStatus.numDisplayServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $2912
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
LEI4 $2908
LABELV $2912
line 3638
;3638:		return;
ADDRGP4 $2907
JUMPV
LABELV $2908
line 3641
;3639:	}
;3640:	//
;3641:	uiInfo.serverStatus.numDisplayServers++;
ADDRLP4 8
ADDRGP4 uiInfo+99264+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3642
;3642:	for (i = uiInfo.serverStatus.numDisplayServers; i > position; i--) {
ADDRLP4 0
ADDRGP4 uiInfo+99264+10412
INDIRI4
ASGNI4
ADDRGP4 $2918
JUMPV
LABELV $2915
line 3643
;3643:		uiInfo.serverStatus.displayServers[i] = uiInfo.serverStatus.displayServers[i-1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220-4
ADDP4
INDIRI4
ASGNI4
line 3644
;3644:	}
LABELV $2916
line 3642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2918
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $2915
line 3645
;3645:	uiInfo.serverStatus.displayServers[position] = num;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 3646
;3646:}
LABELV $2907
endproc UI_InsertServerIntoDisplayList 16 0
proc UI_RemoveServerFromDisplayList 16 0
line 3653
;3647:
;3648:/*
;3649:==================
;3650:UI_RemoveServerFromDisplayList
;3651:==================
;3652:*/
;3653:static void UI_RemoveServerFromDisplayList(int num) {
line 3656
;3654:	int i, j;
;3655:
;3656:	for (i = 0; i < uiInfo.serverStatus.numDisplayServers; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2932
JUMPV
LABELV $2929
line 3657
;3657:		if (uiInfo.serverStatus.displayServers[i] == num) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2935
line 3658
;3658:			uiInfo.serverStatus.numDisplayServers--;
ADDRLP4 8
ADDRGP4 uiInfo+99264+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3659
;3659:			for (j = i; j < uiInfo.serverStatus.numDisplayServers; j++) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $2944
JUMPV
LABELV $2941
line 3660
;3660:				uiInfo.serverStatus.displayServers[j] = uiInfo.serverStatus.displayServers[j+1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220+4
ADDP4
INDIRI4
ASGNI4
line 3661
;3661:			}
LABELV $2942
line 3659
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2944
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
LTI4 $2941
line 3662
;3662:			return;
ADDRGP4 $2928
JUMPV
LABELV $2935
line 3664
;3663:		}
;3664:	}
LABELV $2930
line 3656
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2932
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
LTI4 $2929
line 3665
;3665:}
LABELV $2928
endproc UI_RemoveServerFromDisplayList 16 0
proc UI_BinaryServerInsertion 20 20
line 3672
;3666:
;3667:/*
;3668:==================
;3669:UI_BinaryServerInsertion
;3670:==================
;3671:*/
;3672:static void UI_BinaryServerInsertion(int num) {
line 3676
;3673:	int mid, offset, res, len;
;3674:
;3675:	// use binary search to insert server
;3676:	len = uiInfo.serverStatus.numDisplayServers;
ADDRLP4 12
ADDRGP4 uiInfo+99264+10412
INDIRI4
ASGNI4
line 3677
;3677:	mid = len;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 3678
;3678:	offset = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3679
;3679:	res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2956
JUMPV
LABELV $2955
line 3680
;3680:	while(mid > 0) {
line 3681
;3681:		mid = len >> 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 3683
;3682:		//
;3683:		res = trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3686
;3684:					uiInfo.serverStatus.sortDir, num, uiInfo.serverStatus.displayServers[offset+mid]);
;3685:		// if equal
;3686:		if (res == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2965
line 3687
;3687:			UI_InsertServerIntoDisplayList(num, offset+mid);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 3688
;3688:			return;
ADDRGP4 $2952
JUMPV
LABELV $2965
line 3691
;3689:		}
;3690:		// if larger
;3691:		else if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2967
line 3692
;3692:			offset += mid;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 3693
;3693:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 3694
;3694:		}
ADDRGP4 $2968
JUMPV
LABELV $2967
line 3696
;3695:		// if smaller
;3696:		else {
line 3697
;3697:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 3698
;3698:		}
LABELV $2968
line 3699
;3699:	}
LABELV $2956
line 3680
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $2955
line 3700
;3700:	if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2969
line 3701
;3701:		offset++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3702
;3702:	}
LABELV $2969
line 3703
;3703:	UI_InsertServerIntoDisplayList(num, offset);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 3704
;3704:}
LABELV $2952
endproc UI_BinaryServerInsertion 20 20
bss
align 4
LABELV $2972
skip 4
code
proc UI_BuildServerDisplayList 1100 16
line 3711
;3705:
;3706:/*
;3707:==================
;3708:UI_BuildServerDisplayList
;3709:==================
;3710:*/
;3711:static void UI_BuildServerDisplayList(qboolean force) {
line 3717
;3712:	int i, count, clients, maxClients, ping, game, len, visible;
;3713:	char info[MAX_STRING_CHARS];
;3714://	qboolean startRefresh = qtrue; TTimo: unused
;3715:	static int numinvisible;
;3716:
;3717:	if (!(force || uiInfo.uiDC.realTime > uiInfo.serverStatus.nextDisplayRefresh)) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $2973
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+99264+10420
INDIRI4
GTI4 $2973
line 3718
;3718:		return;
ADDRGP4 $2971
JUMPV
LABELV $2973
line 3721
;3719:	}
;3720:	// if we shouldn't reset
;3721:	if ( force == 2 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $2978
line 3722
;3722:		force = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 3723
;3723:	}
LABELV $2978
line 3726
;3724:
;3725:	// do motd updates here too
;3726:	trap_Cvar_VariableStringBuffer( "cl_motdString", uiInfo.serverStatus.motd, sizeof(uiInfo.serverStatus.motd) );
ADDRGP4 $2980
ARGP4
ADDRGP4 uiInfo+99264+10460
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3727
;3727:	len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+99264+10460
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
line 3728
;3728:	if (len == 0) {
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2987
line 3729
;3729:		strcpy(uiInfo.serverStatus.motd, "Welcome to Team Arena!");
ADDRGP4 uiInfo+99264+10460
ARGP4
ADDRGP4 $2991
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3730
;3730:		len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+99264+10460
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1060
INDIRI4
ASGNI4
line 3731
;3731:	} 
LABELV $2987
line 3732
;3732:	if (len != uiInfo.serverStatus.motdLen) {
ADDRLP4 1052
INDIRI4
ADDRGP4 uiInfo+99264+10436
INDIRI4
EQI4 $2994
line 3733
;3733:		uiInfo.serverStatus.motdLen = len;
ADDRGP4 uiInfo+99264+10436
ADDRLP4 1052
INDIRI4
ASGNI4
line 3734
;3734:		uiInfo.serverStatus.motdWidth = -1;
ADDRGP4 uiInfo+99264+10440
CNSTI4 -1
ASGNI4
line 3735
;3735:	} 
LABELV $2994
line 3737
;3736:
;3737:	if (force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3002
line 3738
;3738:		numinvisible = 0;
ADDRGP4 $2972
CNSTI4 0
ASGNI4
line 3740
;3739:		// clear number of displayed servers
;3740:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99264+10412
CNSTI4 0
ASGNI4
line 3741
;3741:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99264+10416
CNSTI4 0
ASGNI4
line 3743
;3742:		// set list box index to zero
;3743:		Menu_SetFeederSelection(NULL, FEEDER_SERVERS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3745
;3744:		// mark all servers as visible so we store ping updates for them
;3745:		trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3746
;3746:	}
LABELV $3002
line 3749
;3747:
;3748:	// get the server count (comes from the master)
;3749:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1060
INDIRI4
ASGNI4
line 3750
;3750:	if (count == -1 || (ui_netSource.integer == AS_LOCAL && count == 0) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
EQI4 $3013
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 ui_netSource+12
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3010
ADDRLP4 1036
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $3010
LABELV $3013
line 3752
;3751:		// still waiting on a response from the master
;3752:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99264+10412
CNSTI4 0
ASGNI4
line 3753
;3753:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99264+10416
CNSTI4 0
ASGNI4
line 3754
;3754:		uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+99264+10420
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3755
;3755:		return;
ADDRGP4 $2971
JUMPV
LABELV $3010
line 3758
;3756:	}
;3757:
;3758:	visible = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3759
;3759:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3024
JUMPV
LABELV $3021
line 3761
;3760:		// if we already got info for this server
;3761:		if (!trap_LAN_ServerIsVisible(ui_netSource.integer, i)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 trap_LAN_ServerIsVisible
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $3025
line 3762
;3762:			continue;
ADDRGP4 $3022
JUMPV
LABELV $3025
line 3764
;3763:		}
;3764:		visible = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 3766
;3765:		// get the ping for this server
;3766:		ping = trap_LAN_GetServerPing(ui_netSource.integer, i);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 trap_LAN_GetServerPing
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1076
INDIRI4
ASGNI4
line 3767
;3767:		if (ping > 0 || ui_netSource.integer == AS_FAVORITES) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $3032
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3029
LABELV $3032
line 3769
;3768:
;3769:			trap_LAN_GetServerInfo(ui_netSource.integer, i, info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 3771
;3770:
;3771:			clients = atoi(Info_ValueForKey(info, "clients"));
ADDRLP4 8
ARGP4
ADDRGP4 $3034
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1084
INDIRI4
ASGNI4
line 3772
;3772:			uiInfo.serverStatus.numPlayersOnServers += clients;
ADDRLP4 1088
ADDRGP4 uiInfo+99264+10416
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 3774
;3773:
;3774:			if (ui_browserShowEmpty.integer == 0) {
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CNSTI4 0
NEI4 $3037
line 3775
;3775:				if (clients == 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $3040
line 3776
;3776:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3777
;3777:					continue;
ADDRGP4 $3022
JUMPV
LABELV $3040
line 3779
;3778:				}
;3779:			}
LABELV $3037
line 3781
;3780:
;3781:			if (ui_browserShowFull.integer == 0) {
ADDRGP4 ui_browserShowFull+12
INDIRI4
CNSTI4 0
NEI4 $3043
line 3782
;3782:				maxClients = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 8
ARGP4
ADDRGP4 $1362
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1096
INDIRI4
ASGNI4
line 3783
;3783:				if (clients == maxClients) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $3046
line 3784
;3784:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3785
;3785:					continue;
ADDRGP4 $3022
JUMPV
LABELV $3046
line 3787
;3786:				}
;3787:			}
LABELV $3043
line 3789
;3788:
;3789:			if (uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum != -1) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3049
line 3790
;3790:				game = atoi(Info_ValueForKey(info, "gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $3054
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1096
INDIRI4
ASGNI4
line 3791
;3791:				if (game != uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum) {
ADDRLP4 1048
INDIRI4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712+4
ADDP4
INDIRI4
EQI4 $3055
line 3792
;3792:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3793
;3793:					continue;
ADDRGP4 $3022
JUMPV
LABELV $3055
line 3795
;3794:				}
;3795:			}
LABELV $3049
line 3797
;3796:				
;3797:			if (ui_serverFilterType.integer > 0) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LEI4 $3061
line 3798
;3798:				if (Q_stricmp(Info_ValueForKey(info, "game"), serverFilters[ui_serverFilterType.integer].basedir) != 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $3066
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $3064
line 3799
;3799:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3800
;3800:					continue;
ADDRGP4 $3022
JUMPV
LABELV $3064
line 3802
;3801:				}
;3802:			}
LABELV $3061
line 3804
;3803:			// make sure we never add a favorite server twice
;3804:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3070
line 3805
;3805:				UI_RemoveServerFromDisplayList(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveServerFromDisplayList
CALLV
pop
line 3806
;3806:			}
LABELV $3070
line 3808
;3807:			// insert the server into the list
;3808:			UI_BinaryServerInsertion(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BinaryServerInsertion
CALLV
pop
line 3810
;3809:			// done with this server
;3810:			if (ping > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $3073
line 3811
;3811:				trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3812
;3812:				numinvisible++;
ADDRLP4 1092
ADDRGP4 $2972
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3813
;3813:			}
LABELV $3073
line 3814
;3814:		}
LABELV $3029
line 3815
;3815:	}
LABELV $3022
line 3759
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3024
ADDRLP4 0
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $3021
line 3817
;3816:
;3817:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 3820
;3818:
;3819:	// if there were no servers visible for ping updates
;3820:	if (!visible) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3079
line 3823
;3821://		UI_StopServerRefresh();
;3822://		uiInfo.serverStatus.nextDisplayRefresh = 0;
;3823:	}
LABELV $3079
line 3824
;3824:}
LABELV $2971
endproc UI_BuildServerDisplayList 1100 16
data
export serverStatusCvars
align 4
LABELV serverStatusCvars
address $3082
address $3083
address $3084
address $111
address $3085
address $3086
address $1325
address $3087
address $3088
address $3089
address $3090
address $111
address $2165
address $111
address $3091
address $111
address $718
address $111
byte 4 0
byte 4 0
code
proc UI_SortServerStatusInfo 56 8
line 3849
;3825:
;3826:typedef struct
;3827:{
;3828:	char *name, *altName;
;3829:} serverStatusCvar_t;
;3830:
;3831:serverStatusCvar_t serverStatusCvars[] = {
;3832:	{"sv_hostname", "Name"},
;3833:	{"Address", ""},
;3834:	{"gamename", "Game name"},
;3835:	{"g_gametype", "Game type"},
;3836:	{"mapname", "Map"},
;3837:	{"version", ""},
;3838:	{"protocol", ""},
;3839:	{"timelimit", ""},
;3840:	{"fraglimit", ""},
;3841:	{NULL, NULL}
;3842:};
;3843:
;3844:/*
;3845:==================
;3846:UI_SortServerStatusInfo
;3847:==================
;3848:*/
;3849:static void UI_SortServerStatusInfo( serverStatusInfo_t *info ) {
line 3856
;3850:	int i, j, index;
;3851:	char *tmp1, *tmp2;
;3852:
;3853:	// FIXME: if "gamename" == "baseq3" or "missionpack" then
;3854:	// replace the gametype number by FFA, CTF etc.
;3855:	//
;3856:	index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3857
;3857:	for (i = 0; serverStatusCvars[i].name; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3096
JUMPV
LABELV $3093
line 3858
;3858:		for (j = 0; j < info->numLines; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3100
JUMPV
LABELV $3097
line 3859
;3859:			if ( !info->lines[j][1] || info->lines[j][1][0] ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3103
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3101
LABELV $3103
line 3860
;3860:				continue;
ADDRGP4 $3098
JUMPV
LABELV $3101
line 3862
;3861:			}
;3862:			if ( !Q_stricmp(serverStatusCvars[i].name, info->lines[j][0]) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3104
line 3864
;3863:				// swap lines
;3864:				tmp1 = info->lines[index][0];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ASGNP4
line 3865
;3865:				tmp2 = info->lines[index][3];
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 3866
;3866:				info->lines[index][0] = info->lines[j][0];
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 3867
;3867:				info->lines[index][3] = info->lines[j][3];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 3868
;3868:				info->lines[j][0] = tmp1;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 3869
;3869:				info->lines[j][3] = tmp2;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 3871
;3870:				//
;3871:				if ( strlen(serverStatusCvars[i].altName) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $3106
line 3872
;3872:					info->lines[index][0] = serverStatusCvars[i].altName;
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ASGNP4
line 3873
;3873:				}
LABELV $3106
line 3874
;3874:				index++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3875
;3875:			}
LABELV $3104
line 3876
;3876:		}
LABELV $3098
line 3858
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3100
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
LTI4 $3097
line 3877
;3877:	}
LABELV $3094
line 3857
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3096
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3093
line 3878
;3878:}
LABELV $3092
endproc UI_SortServerStatusInfo 56 8
proc UI_GetServerStatusInfo 168 16
line 3885
;3879:
;3880:/*
;3881:==================
;3882:UI_GetServerStatusInfo
;3883:==================
;3884:*/
;3885:static int UI_GetServerStatusInfo( const char *serverAddress, serverStatusInfo_t *info ) {
line 3889
;3886:	char *p, *score, *ping, *name;
;3887:	int i, len;
;3888:
;3889:	if (!info) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3111
line 3890
;3890:		trap_LAN_ServerStatus( serverAddress, NULL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 3891
;3891:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3110
JUMPV
LABELV $3111
line 3893
;3892:	}
;3893:	memset(info, 0, sizeof(*info));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3332
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3894
;3894:	if ( trap_LAN_ServerStatus( serverAddress, info->text, sizeof(info->text)) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 trap_LAN_ServerStatus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3113
line 3895
;3895:		Q_strncpyz(info->address, serverAddress, sizeof(info->address));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3896
;3896:		p = info->text;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ASGNP4
line 3897
;3897:		info->numLines = 0;
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
CNSTI4 0
ASGNI4
line 3898
;3898:		info->lines[info->numLines][0] = "Address";
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3084
ASGNP4
line 3899
;3899:		info->lines[info->numLines][1] = "";
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRGP4 $111
ASGNP4
line 3900
;3900:		info->lines[info->numLines][2] = "";
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $111
ASGNP4
line 3901
;3901:		info->lines[info->numLines][3] = info->address;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 3902
;3902:		info->numLines++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $3116
JUMPV
LABELV $3115
line 3904
;3903:		// get the cvars
;3904:		while (p && *p) {
line 3905
;3905:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 52
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 3906
;3906:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3118
ADDRGP4 $3117
JUMPV
LABELV $3118
line 3907
;3907:			*p++ = '\0';
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 0
ASGNI1
line 3908
;3908:			if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3120
line 3909
;3909:				break;
ADDRGP4 $3117
JUMPV
LABELV $3120
line 3910
;3910:			info->lines[info->numLines][0] = p;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3911
;3911:			info->lines[info->numLines][1] = "";
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRGP4 $111
ASGNP4
line 3912
;3912:			info->lines[info->numLines][2] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $111
ASGNP4
line 3913
;3913:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 3914
;3914:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3122
ADDRGP4 $3117
JUMPV
LABELV $3122
line 3915
;3915:			*p++ = '\0';
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI1 0
ASGNI1
line 3916
;3916:			info->lines[info->numLines][3] = p;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3918
;3917:
;3918:			info->numLines++;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3919
;3919:			if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3124
line 3920
;3920:				break;
ADDRGP4 $3117
JUMPV
LABELV $3124
line 3921
;3921:		}
LABELV $3116
line 3904
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3126
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3115
LABELV $3126
LABELV $3117
line 3923
;3922:		// get the player list
;3923:		if (info->numLines < MAX_SERVERSTATUS_LINES-3) {
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 125
GEI4 $3127
line 3925
;3924:			// empty line
;3925:			info->lines[info->numLines][0] = "";
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $111
ASGNP4
line 3926
;3926:			info->lines[info->numLines][1] = "";
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRGP4 $111
ASGNP4
line 3927
;3927:			info->lines[info->numLines][2] = "";
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $111
ASGNP4
line 3928
;3928:			info->lines[info->numLines][3] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $111
ASGNP4
line 3929
;3929:			info->numLines++;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3931
;3930:			// header
;3931:			info->lines[info->numLines][0] = "num";
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3129
ASGNP4
line 3932
;3932:			info->lines[info->numLines][1] = "score";
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRGP4 $3130
ASGNP4
line 3933
;3933:			info->lines[info->numLines][2] = "ping";
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $3131
ASGNP4
line 3934
;3934:			info->lines[info->numLines][3] = "name";
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $1411
ASGNP4
line 3935
;3935:			info->numLines++;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3937
;3936:			// parse players
;3937:			i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3938
;3938:			len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3133
JUMPV
LABELV $3132
line 3939
;3939:			while (p && *p) {
line 3940
;3940:				if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3135
line 3941
;3941:					*p++ = '\0';
ADDRLP4 104
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 104
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI1 0
ASGNI1
LABELV $3135
line 3942
;3942:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3137
line 3943
;3943:					break;
ADDRGP4 $3134
JUMPV
LABELV $3137
line 3944
;3944:				score = p;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 3945
;3945:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 3946
;3946:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3139
line 3947
;3947:					break;
ADDRGP4 $3134
JUMPV
LABELV $3139
line 3948
;3948:				*p++ = '\0';
ADDRLP4 112
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI1 0
ASGNI1
line 3949
;3949:				ping = p;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 3950
;3950:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 116
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 3951
;3951:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3141
line 3952
;3952:					break;
ADDRGP4 $3134
JUMPV
LABELV $3141
line 3953
;3953:				*p++ = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 3954
;3954:				name = p;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 3955
;3955:				Com_sprintf(&info->pings[len], sizeof(info->pings)-len, "%d", i);
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
CNSTU4 192
ADDRLP4 4
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $715
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3956
;3956:				info->lines[info->numLines][0] = &info->pings[len];
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 128
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ASGNP4
line 3957
;3957:				len += strlen(&info->pings[len]) + 1;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 3958
;3958:				info->lines[info->numLines][1] = score;
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 3959
;3959:				info->lines[info->numLines][2] = ping;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 3960
;3960:				info->lines[info->numLines][3] = name;
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3961
;3961:				info->numLines++;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3962
;3962:				if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3143
line 3963
;3963:					break;
ADDRGP4 $3134
JUMPV
LABELV $3143
line 3964
;3964:				p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
line 3965
;3965:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3145
line 3966
;3966:					break;
ADDRGP4 $3134
JUMPV
LABELV $3145
line 3967
;3967:				*p++ = '\0';
ADDRLP4 164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI1 0
ASGNI1
line 3969
;3968:				//
;3969:				i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3970
;3970:			}
LABELV $3133
line 3939
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3147
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3132
LABELV $3147
LABELV $3134
line 3971
;3971:		}
LABELV $3127
line 3972
;3972:		UI_SortServerStatusInfo( info );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_SortServerStatusInfo
CALLV
pop
line 3973
;3973:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3110
JUMPV
LABELV $3113
line 3975
;3974:	}
;3975:	return qfalse;
CNSTI4 0
RETI4
LABELV $3110
endproc UI_GetServerStatusInfo 168 16
proc stristr 12 4
line 3983
;3976:}
;3977:
;3978:/*
;3979:==================
;3980:stristr
;3981:==================
;3982:*/
;3983:static char *stristr(char *str, char *charset) {
ADDRGP4 $3150
JUMPV
LABELV $3149
line 3986
;3984:	int i;
;3985:
;3986:	while(*str) {
line 3987
;3987:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3155
JUMPV
LABELV $3152
line 3988
;3988:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $3156
ADDRGP4 $3154
JUMPV
LABELV $3156
line 3989
;3989:		}
LABELV $3153
line 3987
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3155
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $3158
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $3152
LABELV $3158
LABELV $3154
line 3990
;3990:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3159
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $3148
JUMPV
LABELV $3159
line 3991
;3991:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3992
;3992:	}
LABELV $3150
line 3986
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3149
line 3993
;3993:	return NULL;
CNSTP4 0
RETP4
LABELV $3148
endproc stristr 12 4
bss
align 4
LABELV $3162
skip 4
align 4
LABELV $3163
skip 4
code
proc UI_BuildFindPlayerList 4424 24
line 4001
;3994:}
;3995:
;3996:/*
;3997:==================
;3998:UI_BuildFindPlayerList
;3999:==================
;4000:*/
;4001:static void UI_BuildFindPlayerList(qboolean force) {
line 4008
;4002:	static int numFound, numTimeOuts;
;4003:	int i, j, resend;
;4004:	serverStatusInfo_t info;
;4005:	char name[MAX_NAME_LENGTH+2];
;4006:	char infoString[MAX_STRING_CHARS];
;4007:
;4008:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3164
line 4009
;4009:		if (!uiInfo.nextFindPlayerRefresh || uiInfo.nextFindPlayerRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+119472
INDIRI4
CNSTI4 0
EQI4 $3171
ADDRGP4 uiInfo+119472
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
LEI4 $3165
LABELV $3171
line 4010
;4010:			return;
ADDRGP4 $3161
JUMPV
line 4012
;4011:		}
;4012:	}
LABELV $3164
line 4013
;4013:	else {
line 4014
;4014:		memset(&uiInfo.pendingServerStatus, 0, sizeof(uiInfo.pendingServerStatus));
ADDRGP4 uiInfo+114148
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4015
;4015:		uiInfo.numFoundPlayerServers = 0;
ADDRGP4 uiInfo+119468
CNSTI4 0
ASGNI4
line 4016
;4016:		uiInfo.currentFoundPlayerServer = 0;
ADDRGP4 uiInfo+119464
CNSTI4 0
ASGNI4
line 4017
;4017:		trap_Cvar_VariableStringBuffer( "ui_findPlayer", uiInfo.findPlayerName, sizeof(uiInfo.findPlayerName));
ADDRGP4 $3176
ARGP4
ADDRGP4 uiInfo+116392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4018
;4018:		Q_CleanStr(uiInfo.findPlayerName);
ADDRGP4 uiInfo+116392
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 4020
;4019:		// should have a string of some length
;4020:		if (!strlen(uiInfo.findPlayerName)) {
ADDRGP4 uiInfo+116392
ARGP4
ADDRLP4 4404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
NEI4 $3180
line 4021
;4021:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 4022
;4022:			return;
ADDRGP4 $3161
JUMPV
LABELV $3180
line 4025
;4023:		}
;4024:		// set resend time
;4025:		resend = ui_serverStatusTimeOut.integer / 2 - 10;
ADDRLP4 4400
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 10
SUBI4
ASGNI4
line 4026
;4026:		if (resend < 50) {
ADDRLP4 4400
INDIRI4
CNSTI4 50
GEI4 $3185
line 4027
;4027:			resend = 50;
ADDRLP4 4400
CNSTI4 50
ASGNI4
line 4028
;4028:		}
LABELV $3185
line 4029
;4029:		trap_Cvar_Set("cl_serverStatusResendTime", va("%d", resend));
ADDRGP4 $715
ARGP4
ADDRLP4 4400
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3187
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4031
;4030:		// reset all server status requests
;4031:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 4033
;4032:		//
;4033:		uiInfo.numFoundPlayerServers = 1;
ADDRGP4 uiInfo+119468
CNSTI4 1
ASGNI4
line 4034
;4034:		Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3195
ARGP4
ADDRGP4 uiInfo+114148
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4037
;4035:						sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;4036:							"searching %d...", uiInfo.pendingServerStatus.num);
;4037:		numFound = 0;
ADDRGP4 $3162
CNSTI4 0
ASGNI4
line 4038
;4038:		numTimeOuts++;
ADDRLP4 4412
ADDRGP4 $3163
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4039
;4039:	}
LABELV $3165
line 4040
;4040:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3197
line 4042
;4041:		// if this pending server is valid
;4042:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3201
line 4044
;4043:			// try to get the server status for this server
;4044:			if (UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, &info ) ) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4404
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
EQI4 $3206
line 4046
;4045:				//
;4046:				numFound++;
ADDRLP4 4408
ADDRGP4 $3162
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4048
;4047:				// parse through the server status lines
;4048:				for (j = 0; j < info.numLines; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3213
JUMPV
LABELV $3210
line 4050
;4049:					// should have ping info
;4050:					if ( !info.lines[j][2] || !info.lines[j][2][0] ) {
ADDRLP4 4412
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3221
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3215
LABELV $3221
line 4051
;4051:						continue;
ADDRGP4 $3211
JUMPV
LABELV $3215
line 4054
;4052:					}
;4053:					// clean string first
;4054:					Q_strncpyz(name, info.lines[j][3], sizeof(name));
ADDRLP4 3340
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 8+64+12
ADDP4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4055
;4055:					Q_CleanStr(name);
ADDRLP4 3340
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 4057
;4056:					// if the player name is a substring
;4057:					if (stristr(name, uiInfo.findPlayerName)) {
ADDRLP4 3340
ARGP4
ADDRGP4 uiInfo+116392
ARGP4
ADDRLP4 4416
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 4416
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3224
line 4059
;4058:						// add to found server list if we have space (always leave space for a line with the number found)
;4059:						if (uiInfo.numFoundPlayerServers < MAX_FOUNDPLAYER_SERVERS-1) {
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 15
GEI4 $3227
line 4061
;4060:							//
;4061:							Q_strncpyz(uiInfo.foundPlayerServerAddresses[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4064
;4062:										uiInfo.pendingServerStatus.server[i].adrstr,
;4063:											sizeof(uiInfo.foundPlayerServerAddresses[0]));
;4064:							Q_strncpyz(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4067
;4065:										uiInfo.pendingServerStatus.server[i].name,
;4066:											sizeof(uiInfo.foundPlayerServerNames[0]));
;4067:							uiInfo.numFoundPlayerServers++;
ADDRLP4 4420
ADDRGP4 uiInfo+119468
ASGNP4
ADDRLP4 4420
INDIRP4
ADDRLP4 4420
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4068
;4068:						}
ADDRGP4 $3228
JUMPV
LABELV $3227
line 4069
;4069:						else {
line 4071
;4070:							// can't add any more so we're done
;4071:							uiInfo.pendingServerStatus.num = uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+114148
ADDRGP4 uiInfo+99264+10412
INDIRI4
ASGNI4
line 4072
;4072:						}
LABELV $3228
line 4073
;4073:					}
LABELV $3224
line 4074
;4074:				}
LABELV $3211
line 4048
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3213
ADDRLP4 4
INDIRI4
ADDRLP4 8+3328
INDIRI4
LTI4 $3210
line 4075
;4075:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3253
ARGP4
ADDRGP4 uiInfo+114148
INDIRI4
ARGI4
ADDRGP4 $3162
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4079
;4076:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;4077:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;4078:				// retrieved the server status so reuse this spot
;4079:				uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
CNSTI4 0
ASGNI4
line 4080
;4080:			}
LABELV $3206
line 4081
;4081:		}
LABELV $3201
line 4083
;4082:		// if empty pending slot or timed out
;4083:		if (!uiInfo.pendingServerStatus.server[i].valid ||
ADDRLP4 4404
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3268
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+114148+4+128
ADDP4
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
SUBI4
GEI4 $3258
LABELV $3268
line 4084
;4084:			uiInfo.pendingServerStatus.server[i].startTime < uiInfo.uiDC.realTime - ui_serverStatusTimeOut.integer) {
line 4085
;4085:			if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3269
line 4086
;4086:				numTimeOuts++;
ADDRLP4 4408
ADDRGP4 $3163
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4087
;4087:			}
LABELV $3269
line 4089
;4088:			// reset server status request for this address
;4089:			UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, NULL );
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 4091
;4090:			// reuse pending slot
;4091:			uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
CNSTI4 0
ASGNI4
line 4093
;4092:			// if we didn't try to get the status of all servers in the main browser yet
;4093:			if (uiInfo.pendingServerStatus.num < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+114148
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GEI4 $3279
line 4094
;4094:				uiInfo.pendingServerStatus.server[i].startTime = uiInfo.uiDC.realTime;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+128
ADDP4
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 4095
;4095:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+114148
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4097
;4096:							uiInfo.pendingServerStatus.server[i].adrstr, sizeof(uiInfo.pendingServerStatus.server[i].adrstr));
;4097:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num], infoString, sizeof(infoString));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+114148
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 3374
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4098
;4098:				Q_strncpyz(uiInfo.pendingServerStatus.server[i].name, Info_ValueForKey(infoString, "hostname"), sizeof(uiInfo.pendingServerStatus.server[0].name));
ADDRLP4 3374
ARGP4
ADDRGP4 $2696
ARGP4
ADDRLP4 4408
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+64
ADDP4
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4099
;4099:				uiInfo.pendingServerStatus.server[i].valid = qtrue;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
CNSTI4 1
ASGNI4
line 4100
;4100:				uiInfo.pendingServerStatus.num++;
ADDRLP4 4412
ADDRGP4 uiInfo+114148
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4101
;4101:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3253
ARGP4
ADDRGP4 uiInfo+114148
INDIRI4
ARGI4
ADDRGP4 $3162
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4104
;4102:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;4103:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;4104:			}
LABELV $3279
line 4105
;4105:		}
LABELV $3258
line 4106
;4106:	}
LABELV $3198
line 4040
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3197
line 4107
;4107:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3317
line 4108
;4108:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3321
line 4109
;4109:			break;
ADDRGP4 $3319
JUMPV
LABELV $3321
line 4111
;4110:		}
;4111:	}
LABELV $3318
line 4107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3317
LABELV $3319
line 4113
;4112:	// if still trying to retrieve server status info
;4113:	if (i < MAX_SERVERSTATUSREQUESTS) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $3326
line 4114
;4114:		uiInfo.nextFindPlayerRefresh = uiInfo.uiDC.realTime + 25;
ADDRGP4 uiInfo+119472
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 4115
;4115:	}
ADDRGP4 $3327
JUMPV
LABELV $3326
line 4116
;4116:	else {
line 4118
;4117:		// add a line that shows the number of servers found
;4118:		if (!uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 0
NEI4 $3330
line 4119
;4119:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]), "no servers found");
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3337
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4120
;4120:		}
ADDRGP4 $3331
JUMPV
LABELV $3330
line 4121
;4121:		else {
line 4122
;4122:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]),
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3342
ARGP4
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 2
NEI4 $3348
ADDRLP4 4404
ADDRGP4 $111
ASGNP4
ADDRGP4 $3349
JUMPV
LABELV $3348
ADDRLP4 4404
ADDRGP4 $3345
ASGNP4
LABELV $3349
ADDRLP4 4404
INDIRP4
ARGP4
ADDRGP4 uiInfo+116392
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4125
;4123:						"%d server%s found with player %s", uiInfo.numFoundPlayerServers-1,
;4124:						uiInfo.numFoundPlayerServers == 2 ? "":"s", uiInfo.findPlayerName);
;4125:		}
LABELV $3331
line 4126
;4126:		uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 4128
;4127:		// show the server status info for the selected server
;4128:		UI_FeederSelection(FEEDER_FINDPLAYER, uiInfo.currentFoundPlayerServer);
CNSTF4 1096810496
ARGF4
ADDRGP4 uiInfo+119464
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 4129
;4129:	}
LABELV $3327
line 4130
;4130:}
LABELV $3161
endproc UI_BuildFindPlayerList 4424 24
proc UI_BuildServerStatus 8 16
line 4137
;4131:
;4132:/*
;4133:==================
;4134:UI_BuildServerStatus
;4135:==================
;4136:*/
;4137:static void UI_BuildServerStatus(qboolean force) {
line 4139
;4138:
;4139:	if (uiInfo.nextFindPlayerRefresh) {
ADDRGP4 uiInfo+119472
INDIRI4
CNSTI4 0
EQI4 $3353
line 4140
;4140:		return;
ADDRGP4 $3352
JUMPV
LABELV $3353
line 4142
;4141:	}
;4142:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3356
line 4143
;4143:		if (!uiInfo.nextServerStatusRefresh || uiInfo.nextServerStatusRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+114144
INDIRI4
CNSTI4 0
EQI4 $3363
ADDRGP4 uiInfo+114144
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
LEI4 $3357
LABELV $3363
line 4144
;4144:			return;
ADDRGP4 $3352
JUMPV
line 4146
;4145:		}
;4146:	}
LABELV $3356
line 4147
;4147:	else {
line 4148
;4148:		Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4149
;4149:		uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+110812+3328
CNSTI4 0
ASGNI4
line 4151
;4150:		// reset all server status requests
;4151:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 4152
;4152:	}
LABELV $3357
line 4153
;4153:	if (uiInfo.serverStatus.currentServer < 0 || uiInfo.serverStatus.currentServer > uiInfo.serverStatus.numDisplayServers || uiInfo.serverStatus.numDisplayServers == 0) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $3377
ADDRGP4 uiInfo+99264+2216
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GTI4 $3377
ADDRGP4 uiInfo+99264+10412
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $3366
LABELV $3377
line 4154
;4154:		return;
ADDRGP4 $3352
JUMPV
LABELV $3366
line 4156
;4155:	}
;4156:	if (UI_GetServerStatusInfo( uiInfo.serverStatusAddress, &uiInfo.serverStatusInfo ) ) {
ADDRGP4 uiInfo+110748
ARGP4
ADDRGP4 uiInfo+110812
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $3378
line 4157
;4157:		uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+114144
CNSTI4 0
ASGNI4
line 4158
;4158:		UI_GetServerStatusInfo( uiInfo.serverStatusAddress, NULL );
ADDRGP4 uiInfo+110748
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 4159
;4159:	}
ADDRGP4 $3379
JUMPV
LABELV $3378
line 4160
;4160:	else {
line 4161
;4161:		uiInfo.nextServerStatusRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+114144
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4162
;4162:	}
LABELV $3379
line 4163
;4163:}
LABELV $3352
endproc UI_BuildServerStatus 8 16
proc UI_FeederCount 12 4
line 4170
;4164:
;4165:/*
;4166:==================
;4167:UI_FeederCount
;4168:==================
;4169:*/
;4170:static int UI_FeederCount(float feederID) {
line 4171
;4171:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3387
line 4172
;4172:		return UI_HeadCountByTeam();
ADDRLP4 0
ADDRGP4 UI_HeadCountByTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3387
line 4173
;4173:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3389
line 4174
;4174:		return uiInfo.q3HeadCount;
ADDRGP4 uiInfo+119488
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3389
line 4175
;4175:	} else if (feederID == FEEDER_CINEMATICS) {
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3392
line 4176
;4176:		return uiInfo.movieCount;
ADDRGP4 uiInfo+99252
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3392
line 4177
;4177:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3397
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3395
LABELV $3397
line 4178
;4178:		return UI_MapCountByGameType(feederID == FEEDER_MAPS ? qtrue : qfalse);
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3399
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $3400
JUMPV
LABELV $3399
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $3400
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3395
line 4179
;4179:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3401
line 4180
;4180:		return uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+99264+10412
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3401
line 4181
;4181:	} else if (feederID == FEEDER_SERVERSTATUS) {
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3405
line 4182
;4182:		return uiInfo.serverStatusInfo.numLines;
ADDRGP4 uiInfo+110812+3328
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3405
line 4183
;4183:	} else if (feederID == FEEDER_FINDPLAYER) {
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3409
line 4184
;4184:		return uiInfo.numFoundPlayerServers;
ADDRGP4 uiInfo+119468
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3409
line 4185
;4185:	} else if (feederID == FEEDER_PLAYER_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3412
line 4186
;4186:		if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78856
INDIRI4
LEI4 $3414
line 4187
;4187:			uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78856
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 4188
;4188:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 4189
;4189:		}
LABELV $3414
line 4190
;4190:		return uiInfo.playerCount;
ADDRGP4 uiInfo+78844
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3412
line 4191
;4191:	} else if (feederID == FEEDER_TEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3421
line 4192
;4192:		if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78856
INDIRI4
LEI4 $3423
line 4193
;4193:			uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78856
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 4194
;4194:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 4195
;4195:		}
LABELV $3423
line 4196
;4196:		return uiInfo.myTeamCount;
ADDRGP4 uiInfo+78848
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3421
line 4197
;4197:	} else if (feederID == FEEDER_MODS) {
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3430
line 4198
;4198:		return uiInfo.modCount;
ADDRGP4 uiInfo+97188
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3430
line 4199
;4199:	} else if (feederID == FEEDER_DEMOS) {
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3433
line 4200
;4200:		return uiInfo.demoCount;
ADDRGP4 uiInfo+98220
INDIRI4
RETI4
ADDRGP4 $3386
JUMPV
LABELV $3433
line 4202
;4201:	}
;4202:	return 0;
CNSTI4 0
RETI4
LABELV $3386
endproc UI_FeederCount 12 4
proc UI_SelectedMap 8 0
line 4205
;4203:}
;4204:
;4205:static const char *UI_SelectedMap(int index, int *actual) {
line 4207
;4206:	int i, c;
;4207:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4208
;4208:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4209
;4209:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3440
JUMPV
LABELV $3437
line 4210
;4210:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3442
line 4211
;4211:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3446
line 4212
;4212:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4213
;4213:				return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
RETP4
ADDRGP4 $3436
JUMPV
LABELV $3446
line 4214
;4214:			} else {
line 4215
;4215:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4216
;4216:			}
line 4217
;4217:		}
LABELV $3442
line 4218
;4218:	}
LABELV $3438
line 4209
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3440
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $3437
line 4219
;4219:	return "";
ADDRGP4 $111
RETP4
LABELV $3436
endproc UI_SelectedMap 8 0
proc UI_SelectedHead 8 0
line 4222
;4220:}
;4221:
;4222:static const char *UI_SelectedHead(int index, int *actual) {
line 4224
;4223:	int i, c;
;4224:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4225
;4225:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4226
;4226:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3453
JUMPV
LABELV $3450
line 4227
;4227:		if (uiInfo.characterList[i].active) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3455
line 4228
;4228:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3459
line 4229
;4229:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4230
;4230:				return uiInfo.characterList[i].name;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
RETP4
ADDRGP4 $3449
JUMPV
LABELV $3459
line 4231
;4231:			} else {
line 4232
;4232:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4233
;4233:			}
line 4234
;4234:		}
LABELV $3455
line 4235
;4235:	}
LABELV $3451
line 4226
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3453
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $3450
line 4236
;4236:	return "";
ADDRGP4 $111
RETP4
LABELV $3449
endproc UI_SelectedHead 8 0
proc UI_GetIndexFromSelection 8 0
line 4239
;4237:}
;4238:
;4239:static int UI_GetIndexFromSelection(int actual) {
line 4241
;4240:	int i, c;
;4241:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4242
;4242:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3466
JUMPV
LABELV $3463
line 4243
;4243:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3468
line 4244
;4244:			if (i == actual) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3472
line 4245
;4245:				return c;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $3462
JUMPV
LABELV $3472
line 4247
;4246:			}
;4247:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4248
;4248:		}
LABELV $3468
line 4249
;4249:	}
LABELV $3464
line 4242
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3466
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $3463
line 4250
;4250:  return 0;
CNSTI4 0
RETI4
LABELV $3462
endproc UI_GetIndexFromSelection 8 0
proc UI_UpdatePendingPings 0 4
line 4253
;4251:}
;4252:
;4253:static void UI_UpdatePendingPings() { 
line 4254
;4254:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 4255
;4255:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+99264+2212
CNSTI4 1
ASGNI4
line 4256
;4256:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 4258
;4257:
;4258:}
LABELV $3474
endproc UI_UpdatePendingPings 0 4
bss
align 1
LABELV $3482
skip 1024
align 1
LABELV $3483
skip 1024
align 1
LABELV $3484
skip 32
data
align 4
LABELV $3485
byte 4 -1
align 4
LABELV $3486
byte 4 0
code
proc UI_FeederItemText 64 20
line 4260
;4259:
;4260:static const char *UI_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
line 4266
;4261:	static char info[MAX_STRING_CHARS];
;4262:	static char hostname[1024];
;4263:	static char clientBuff[32];
;4264:	static int lastColumn = -1;
;4265:	static int lastTime = 0;
;4266:	*handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 4267
;4267:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3487
line 4269
;4268:		int actual;
;4269:		return UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 UI_SelectedHead
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3487
line 4270
;4270:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3489
line 4271
;4271:		if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3490
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
GEI4 $3490
line 4272
;4272:			return uiInfo.q3HeadNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
RETP4
ADDRGP4 $3481
JUMPV
line 4274
;4273:		}
;4274:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
LABELV $3489
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3497
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3495
LABELV $3497
line 4276
;4275:		int actual;
;4276:		return UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3495
line 4277
;4277:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3498
line 4278
;4278:		if (index >= 0 && index < uiInfo.serverStatus.numDisplayServers) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3499
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GEI4 $3499
line 4280
;4279:			int ping, game, punkbuster;
;4280:			if (lastColumn != column || lastTime > uiInfo.uiDC.realTime + 5000) {
ADDRGP4 $3485
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $3507
ADDRGP4 $3486
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 5000
ADDI4
LEI4 $3504
LABELV $3507
line 4281
;4281:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3482
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4282
;4282:				lastColumn = column;
ADDRGP4 $3485
ADDRFP4 8
INDIRI4
ASGNI4
line 4283
;4283:				lastTime = uiInfo.uiDC.realTime;
ADDRGP4 $3486
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 4284
;4284:			}
LABELV $3504
line 4285
;4285:			ping = atoi(Info_ValueForKey(info, "ping"));
ADDRGP4 $3482
ARGP4
ADDRGP4 $3131
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 4286
;4286:			if (ping == -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $3512
line 4289
;4287:				// if we ever see a ping that is out of date, do a server refresh
;4288:				// UI_UpdatePendingPings();
;4289:			}
LABELV $3512
line 4290
;4290:			switch (column) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $3499
ADDRLP4 28
INDIRI4
CNSTI4 5
GTI4 $3499
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3542
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3542
address $3516
address $3525
address $3526
address $3528
address $3532
address $3536
code
LABELV $3516
line 4292
;4291:				case SORT_HOST : 
;4292:					if (ping <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $3517
line 4293
;4293:						return Info_ValueForKey(info, "addr");
ADDRGP4 $3482
ARGP4
ADDRGP4 $2697
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3517
line 4294
;4294:					} else {
line 4295
;4295:						if ( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $3519
line 4296
;4296:							Com_sprintf( hostname, sizeof(hostname), "%s [%s]",
ADDRGP4 $3482
ARGP4
ADDRGP4 $2696
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3482
ARGP4
ADDRGP4 $3523
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $3483
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3522
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4299
;4297:											Info_ValueForKey(info, "hostname"),
;4298:											netnames[atoi(Info_ValueForKey(info, "nettype"))] );
;4299:							return hostname;
ADDRGP4 $3483
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3519
line 4301
;4300:						}
;4301:						else {
line 4302
;4302:							Com_sprintf( hostname, sizeof(hostname), "%s", Info_ValueForKey(info, "hostname"));
ADDRGP4 $3482
ARGP4
ADDRGP4 $2696
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3483
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3524
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4303
;4303:							return hostname;
ADDRGP4 $3483
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3525
line 4306
;4304:						}
;4305:					}
;4306:				case SORT_MAP : return Info_ValueForKey(info, "mapname");
ADDRGP4 $3482
ARGP4
ADDRGP4 $3088
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3526
line 4308
;4307:				case SORT_CLIENTS : 
;4308:					Com_sprintf( clientBuff, sizeof(clientBuff), "%s (%s)", Info_ValueForKey(info, "clients"), Info_ValueForKey(info, "sv_maxclients"));
ADDRGP4 $3482
ARGP4
ADDRGP4 $3034
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3482
ARGP4
ADDRGP4 $1362
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3484
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $3527
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4309
;4309:					return clientBuff;
ADDRGP4 $3484
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3528
line 4311
;4310:				case SORT_GAME : 
;4311:					game = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $3482
ARGP4
ADDRGP4 $3054
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 4312
;4312:					if (game >= 0 && game < numTeamArenaGameTypes) {
ADDRLP4 52
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $3529
ADDRLP4 52
INDIRI4
ADDRGP4 numTeamArenaGameTypes
INDIRI4
GEI4 $3529
line 4313
;4313:						return teamArenaGameTypes[game];
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamArenaGameTypes
ADDP4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3529
line 4314
;4314:					} else {
line 4315
;4315:						return "Unknown";
ADDRGP4 $3531
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3532
line 4318
;4316:					}
;4317:				case SORT_PING : 
;4318:					if (ping <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $3533
line 4319
;4319:						return "...";
ADDRGP4 $3535
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3533
line 4320
;4320:					} else {
line 4321
;4321:						return Info_ValueForKey(info, "ping");
ADDRGP4 $3482
ARGP4
ADDRGP4 $3131
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3536
line 4324
;4322:					}
;4323:				case SORT_PUNKBUSTER:
;4324:					punkbuster = atoi(Info_ValueForKey(info, "punkbuster"));
ADDRGP4 $3482
ARGP4
ADDRGP4 $3537
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 60
INDIRI4
ASGNI4
line 4325
;4325:					if ( punkbuster ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $3538
line 4326
;4326:						return "Yes";
ADDRGP4 $3540
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3538
line 4327
;4327:					} else {
line 4328
;4328:						return "No";
ADDRGP4 $3541
RETP4
ADDRGP4 $3481
JUMPV
line 4331
;4329:					}
;4330:			}
;4331:		}
line 4332
;4332:	} else if (feederID == FEEDER_SERVERSTATUS) {
LABELV $3498
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3543
line 4333
;4333:		if ( index >= 0 && index < uiInfo.serverStatusInfo.numLines ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3544
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+110812+3328
INDIRI4
GEI4 $3544
line 4334
;4334:			if ( column >= 0 && column < 4 ) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3544
ADDRLP4 8
INDIRI4
CNSTI4 4
GEI4 $3544
line 4335
;4335:				return uiInfo.serverStatusInfo.lines[index][column];
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+110812+64
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
line 4337
;4336:			}
;4337:		}
line 4338
;4338:	} else if (feederID == FEEDER_FINDPLAYER) {
LABELV $3543
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3553
line 4339
;4339:		if ( index >= 0 && index < uiInfo.numFoundPlayerServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3554
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+119468
INDIRI4
GEI4 $3554
line 4341
;4340:			//return uiInfo.foundPlayerServerAddresses[index];
;4341:			return uiInfo.foundPlayerServerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440
ADDP4
RETP4
ADDRGP4 $3481
JUMPV
line 4343
;4342:		}
;4343:	} else if (feederID == FEEDER_PLAYER_LIST) {
LABELV $3553
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3559
line 4344
;4344:		if (index >= 0 && index < uiInfo.playerCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3560
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78844
INDIRI4
GEI4 $3560
line 4345
;4345:			return uiInfo.playerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
RETP4
ADDRGP4 $3481
JUMPV
line 4347
;4346:		}
;4347:	} else if (feederID == FEEDER_TEAM_LIST) {
LABELV $3559
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3565
line 4348
;4348:		if (index >= 0 && index < uiInfo.myTeamCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3566
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $3566
line 4349
;4349:			return uiInfo.teamNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
RETP4
ADDRGP4 $3481
JUMPV
line 4351
;4350:		}
;4351:	} else if (feederID == FEEDER_MODS) {
LABELV $3565
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3571
line 4352
;4352:		if (index >= 0 && index < uiInfo.modCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3572
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+97188
INDIRI4
GEI4 $3572
line 4353
;4353:			if (uiInfo.modList[index].modDescr && *uiInfo.modList[index].modDescr) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96676+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3576
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96676+4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3576
line 4354
;4354:				return uiInfo.modList[index].modDescr;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3576
line 4355
;4355:			} else {
line 4356
;4356:				return uiInfo.modList[index].modName;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676
ADDP4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
line 4359
;4357:			}
;4358:		}
;4359:	} else if (feederID == FEEDER_CINEMATICS) {
LABELV $3571
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3585
line 4360
;4360:		if (index >= 0 && index < uiInfo.movieCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3586
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99252
INDIRI4
GEI4 $3586
line 4361
;4361:			return uiInfo.movieList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
line 4363
;4362:		}
;4363:	} else if (feederID == FEEDER_DEMOS) {
LABELV $3585
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3591
line 4364
;4364:		if (index >= 0 && index < uiInfo.demoCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3593
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+98220
INDIRI4
GEI4 $3593
line 4365
;4365:			return uiInfo.demoList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97196
ADDP4
INDIRP4
RETP4
ADDRGP4 $3481
JUMPV
LABELV $3593
line 4367
;4366:		}
;4367:	}
LABELV $3591
LABELV $3586
LABELV $3572
LABELV $3566
LABELV $3560
LABELV $3554
LABELV $3544
LABELV $3499
LABELV $3490
line 4368
;4368:	return "";
ADDRGP4 $111
RETP4
LABELV $3481
endproc UI_FeederItemText 64 20
proc UI_FeederItemImage 20 8
line 4372
;4369:}
;4370:
;4371:
;4372:static qhandle_t UI_FeederItemImage(float feederID, int index) {
line 4373
;4373:  if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3598
line 4375
;4374:	int actual;
;4375:	UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 4376
;4376:	index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 4377
;4377:	if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3599
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
GEI4 $3599
line 4378
;4378:		if (uiInfo.characterList[index].headImage == -1) {
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $3603
line 4379
;4379:			uiInfo.characterList[index].headImage = trap_R_RegisterShaderNoMip(uiInfo.characterList[index].imageName);
ADDRLP4 8
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+73448+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+73448+8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 4380
;4380:		}
LABELV $3603
line 4381
;4381:		return uiInfo.characterList[index].headImage;
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+8
ADDP4
INDIRI4
RETI4
ADDRGP4 $3597
JUMPV
line 4383
;4382:	}
;4383:  } else if (feederID == FEEDER_Q3HEADS) {
LABELV $3598
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3613
line 4384
;4384:    if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3614
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
GEI4 $3614
line 4385
;4385:      return uiInfo.q3HeadIcons[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+135876
ADDP4
INDIRI4
RETI4
ADDRGP4 $3597
JUMPV
line 4387
;4386:    }
;4387:	} else if (feederID == FEEDER_ALLMAPS || feederID == FEEDER_MAPS) {
LABELV $3613
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
EQF4 $3621
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3619
LABELV $3621
line 4389
;4388:		int actual;
;4389:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 4390
;4390:		index = actual;
ADDRFP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 4391
;4391:		if (index >= 0 && index < uiInfo.mapCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3622
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
GEI4 $3622
line 4392
;4392:			if (uiInfo.mapList[index].levelShot == -1) {
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $3625
line 4393
;4393:				uiInfo.mapList[index].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[index].imageName);
ADDRLP4 12
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 4394
;4394:			}
LABELV $3625
line 4395
;4395:			return uiInfo.mapList[index].levelShot;
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
RETI4
ADDRGP4 $3597
JUMPV
LABELV $3622
line 4397
;4396:		}
;4397:	}
LABELV $3619
LABELV $3614
LABELV $3599
line 4398
;4398:  return 0;
CNSTI4 0
RETI4
LABELV $3597
endproc UI_FeederItemImage 20 8
bss
align 1
LABELV $3636
skip 1024
code
proc UI_FeederSelection 40 24
line 4401
;4399:}
;4400:
;4401:static void UI_FeederSelection(float feederID, int index) {
line 4403
;4402:	static char info[MAX_STRING_CHARS];
;4403:  if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3637
line 4405
;4404:	int actual;
;4405:	UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 4406
;4406:	index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 4407
;4407:    if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3638
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
GEI4 $3638
line 4408
;4408:		trap_Cvar_Set( "team_model", va("%s", uiInfo.characterList[index].base));
ADDRGP4 $3524
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $968
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4409
;4409:		trap_Cvar_Set( "team_headmodel", va("*%s", uiInfo.characterList[index].name)); 
ADDRGP4 $3644
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $969
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4410
;4410:		updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 4411
;4411:    }
line 4412
;4412:  } else if (feederID == FEEDER_Q3HEADS) {
ADDRGP4 $3638
JUMPV
LABELV $3637
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3646
line 4413
;4413:    if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3647
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
GEI4 $3647
line 4414
;4414:      trap_Cvar_Set( "model", uiInfo.q3HeadNames[index]);
ADDRGP4 $964
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4415
;4415:      trap_Cvar_Set( "headmodel", uiInfo.q3HeadNames[index]);
ADDRGP4 $965
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4416
;4416:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 4417
;4417:		}
line 4418
;4418:  } else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
ADDRGP4 $3647
JUMPV
LABELV $3646
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3655
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3653
LABELV $3655
line 4420
;4419:		int actual, map;
;4420:		map = (feederID == FEEDER_ALLMAPS) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3659
ADDRLP4 12
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $3660
JUMPV
LABELV $3659
ADDRLP4 12
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $3660
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 4421
;4421:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $3661
line 4422
;4422:		  trap_CIN_StopCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4423
;4423:		  uiInfo.mapList[map].cinematic = -1;
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -1
ASGNI4
line 4424
;4424:		}
LABELV $3661
line 4425
;4425:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 4426
;4426:		trap_Cvar_Set("ui_mapIndex", va("%d", index));
ADDRGP4 $715
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2198
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4427
;4427:		ui_mapIndex.integer = index;
ADDRGP4 ui_mapIndex+12
ADDRFP4 4
INDIRI4
ASGNI4
line 4429
;4428:
;4429:		if (feederID == FEEDER_MAPS) {
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3670
line 4430
;4430:			ui_currentMap.integer = actual;
ADDRGP4 ui_currentMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 4431
;4431:			trap_Cvar_Set("ui_currentMap", va("%d", actual));
ADDRGP4 $715
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $890
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4432
;4432:	  	uiInfo.mapList[ui_currentMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 4433
;4433:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 4434
;4434:			trap_Cvar_Set("ui_opponentModel", uiInfo.mapList[ui_currentMap.integer].opponentName);
ADDRGP4 $1094
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+12
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4435
;4435:			updateOpponentModel = qtrue;
ADDRGP4 updateOpponentModel
CNSTI4 1
ASGNI4
line 4436
;4436:		} else {
ADDRGP4 $3654
JUMPV
LABELV $3670
line 4437
;4437:			ui_currentNetMap.integer = actual;
ADDRGP4 ui_currentNetMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 4438
;4438:			trap_Cvar_Set("ui_currentNetMap", va("%d", actual));
ADDRGP4 $715
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $888
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4439
;4439:	  	uiInfo.mapList[ui_currentNetMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 4440
;4440:		}
line 4442
;4441:
;4442:  } else if (feederID == FEEDER_SERVERS) {
ADDRGP4 $3654
JUMPV
LABELV $3653
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3695
line 4443
;4443:		const char *mapName = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 4444
;4444:		uiInfo.serverStatus.currentServer = index;
ADDRGP4 uiInfo+99264+2216
ADDRFP4 4
INDIRI4
ASGNI4
line 4445
;4445:		trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3636
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4446
;4446:		uiInfo.serverStatus.currentServerPreview = trap_R_RegisterShaderNoMip(va("levelshots/%s", Info_ValueForKey(info, "mapname")));
ADDRGP4 $3636
ARGP4
ADDRGP4 $3088
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $1041
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+99264+10428
ADDRLP4 16
INDIRI4
ASGNI4
line 4447
;4447:		if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99264+10432
INDIRI4
CNSTI4 0
LTI4 $3704
line 4448
;4448:		  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4449
;4449:			uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99264+10432
CNSTI4 -1
ASGNI4
line 4450
;4450:		}
LABELV $3704
line 4451
;4451:		mapName = Info_ValueForKey(info, "mapname");
ADDRGP4 $3636
ARGP4
ADDRGP4 $3088
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 4452
;4452:		if (mapName && *mapName) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3696
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3696
line 4453
;4453:			uiInfo.serverStatus.currentServerCinematic = trap_CIN_PlayCinematic(va("%s.roq", mapName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $792
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99264+10432
ADDRLP4 36
INDIRI4
ASGNI4
line 4454
;4454:		}
line 4455
;4455:  } else if (feederID == FEEDER_SERVERSTATUS) {
ADDRGP4 $3696
JUMPV
LABELV $3695
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3716
line 4457
;4456:		//
;4457:  } else if (feederID == FEEDER_FINDPLAYER) {
ADDRGP4 $3717
JUMPV
LABELV $3716
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3718
line 4458
;4458:	  uiInfo.currentFoundPlayerServer = index;
ADDRGP4 uiInfo+119464
ADDRFP4 4
INDIRI4
ASGNI4
line 4460
;4459:	  //
;4460:	  if ( index < uiInfo.numFoundPlayerServers-1) {
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 1
SUBI4
GEI4 $3719
line 4462
;4461:			// build a new server status for this server
;4462:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+110748
ARGP4
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4463
;4463:			Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4464
;4464:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4465
;4465:	  }
line 4466
;4466:  } else if (feederID == FEEDER_PLAYER_LIST) {
ADDRGP4 $3719
JUMPV
LABELV $3718
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3728
line 4467
;4467:		uiInfo.playerIndex = index;
ADDRGP4 uiInfo+78860
ADDRFP4 4
INDIRI4
ASGNI4
line 4468
;4468:  } else if (feederID == FEEDER_TEAM_LIST) {
ADDRGP4 $3729
JUMPV
LABELV $3728
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3731
line 4469
;4469:		uiInfo.teamIndex = index;
ADDRGP4 uiInfo+78852
ADDRFP4 4
INDIRI4
ASGNI4
line 4470
;4470:  } else if (feederID == FEEDER_MODS) {
ADDRGP4 $3732
JUMPV
LABELV $3731
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3734
line 4471
;4471:		uiInfo.modIndex = index;
ADDRGP4 uiInfo+97192
ADDRFP4 4
INDIRI4
ASGNI4
line 4472
;4472:  } else if (feederID == FEEDER_CINEMATICS) {
ADDRGP4 $3735
JUMPV
LABELV $3734
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3737
line 4473
;4473:		uiInfo.movieIndex = index;
ADDRGP4 uiInfo+99256
ADDRFP4 4
INDIRI4
ASGNI4
line 4474
;4474:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 0
LTI4 $3740
line 4475
;4475:		  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4476
;4476:		}
LABELV $3740
line 4477
;4477:		uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99260
CNSTI4 -1
ASGNI4
line 4478
;4478:  } else if (feederID == FEEDER_DEMOS) {
ADDRGP4 $3738
JUMPV
LABELV $3737
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3745
line 4479
;4479:		uiInfo.demoIndex = index;
ADDRGP4 uiInfo+98224
ADDRFP4 4
INDIRI4
ASGNI4
line 4480
;4480:	}
LABELV $3745
LABELV $3738
LABELV $3735
LABELV $3732
LABELV $3729
LABELV $3719
LABELV $3717
LABELV $3696
LABELV $3654
LABELV $3647
LABELV $3638
line 4481
;4481:}
LABELV $3635
endproc UI_FeederSelection 40 24
proc Team_Parse 72 12
line 4483
;4482:
;4483:static qboolean Team_Parse(char **p) {
line 4488
;4484:  char *token;
;4485:  const char *tempStr;
;4486:	int i;
;4487:
;4488:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 4490
;4489:
;4490:  if (token[0] != '{') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3752
line 4491
;4491:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3748
JUMPV
LABELV $3751
line 4494
;4492:  }
;4493:
;4494:  while ( 1 ) {
line 4496
;4495:
;4496:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 4498
;4497:    
;4498:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $3754
line 4499
;4499:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3748
JUMPV
LABELV $3754
line 4502
;4500:    }
;4501:
;4502:    if ( !token || token[0] == 0 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3758
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3756
LABELV $3758
line 4503
;4503:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3748
JUMPV
LABELV $3756
line 4506
;4504:    }
;4505:
;4506:    if (token[0] == '{') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3759
line 4508
;4507:      // seven tokens per line, team name and icon, and 5 team member names
;4508:      if (!String_Parse(p, &uiInfo.teamList[uiInfo.teamCount].teamName) || !String_Parse(p, &tempStr)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $3765
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $3761
LABELV $3765
line 4509
;4509:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3748
JUMPV
LABELV $3761
line 4513
;4510:      }
;4511:    
;4512:
;4513:			uiInfo.teamList[uiInfo.teamCount].imageName = tempStr;
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 4514
;4514:	    uiInfo.teamList[uiInfo.teamCount].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[uiInfo.teamCount].imageName);
ADDRLP4 36
CNSTI4 44
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 4515
;4515:		  uiInfo.teamList[uiInfo.teamCount].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[uiInfo.teamCount].imageName));
ADDRGP4 $768
ARGP4
ADDRLP4 44
CNSTI4 44
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 4516
;4516:			uiInfo.teamList[uiInfo.teamCount].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[uiInfo.teamCount].imageName));
ADDRGP4 $773
ARGP4
ADDRLP4 56
CNSTI4 44
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 4518
;4517:
;4518:			uiInfo.teamList[uiInfo.teamCount].cinematic = -1;
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -1
ASGNI4
line 4520
;4519:
;4520:			for (i = 0; i < TEAM_MEMBERS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3790
line 4521
;4521:				uiInfo.teamList[uiInfo.teamCount].teamMembers[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
CNSTP4 0
ASGNP4
line 4522
;4522:				if (!String_Parse(p, &uiInfo.teamList[uiInfo.teamCount].teamMembers[i])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $3797
line 4523
;4523:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3748
JUMPV
LABELV $3797
line 4525
;4524:				}
;4525:			}
LABELV $3791
line 4520
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $3790
line 4527
;4526:
;4527:      Com_Printf("Loaded team %s with team icon %s.\n", uiInfo.teamList[uiInfo.teamCount].teamName, tempStr);
ADDRGP4 $3802
ARGP4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4528
;4528:      if (uiInfo.teamCount < MAX_TEAMS) {
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 64
GEI4 $3805
line 4529
;4529:        uiInfo.teamCount++;
ADDRLP4 68
ADDRGP4 uiInfo+75756
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4530
;4530:      } else {
ADDRGP4 $3806
JUMPV
LABELV $3805
line 4531
;4531:        Com_Printf("Too many teams, last team replaced!\n");
ADDRGP4 $3809
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4532
;4532:      }
LABELV $3806
line 4533
;4533:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 68
INDIRP4
ASGNP4
line 4534
;4534:      if (token[0] != '}') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3810
line 4535
;4535:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3748
JUMPV
LABELV $3810
line 4537
;4536:      }
;4537:    }
LABELV $3759
line 4538
;4538:  }
LABELV $3752
line 4494
ADDRGP4 $3751
JUMPV
line 4540
;4539:
;4540:  return qfalse;
CNSTI4 0
RETI4
LABELV $3748
endproc Team_Parse 72 12
proc Character_Parse 68 12
line 4543
;4541:}
;4542:
;4543:static qboolean Character_Parse(char **p) {
line 4547
;4544:  char *token;
;4545:  const char *tempStr;
;4546:
;4547:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4549
;4548:
;4549:  if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3816
line 4550
;4550:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3812
JUMPV
LABELV $3815
line 4554
;4551:  }
;4552:
;4553:
;4554:  while ( 1 ) {
line 4555
;4555:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 4557
;4556:
;4557:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $3818
line 4558
;4558:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3812
JUMPV
LABELV $3818
line 4561
;4559:    }
;4560:
;4561:    if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3822
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3820
LABELV $3822
line 4562
;4562:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3812
JUMPV
LABELV $3820
line 4565
;4563:    }
;4564:
;4565:    if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3823
line 4567
;4566:      // two tokens per line, character name and sex
;4567:      if (!String_Parse(p, &uiInfo.characterList[uiInfo.characterCount].name) || !String_Parse(p, &tempStr)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3829
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3825
LABELV $3829
line 4568
;4568:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3812
JUMPV
LABELV $3825
line 4571
;4569:      }
;4570:    
;4571:      uiInfo.characterList[uiInfo.characterCount].headImage = -1;
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+8
ADDP4
CNSTI4 -1
ASGNI4
line 4572
;4572:			uiInfo.characterList[uiInfo.characterCount].imageName = String_Alloc(va("models/players/heads/%s/icon_default.tga", uiInfo.characterList[uiInfo.characterCount].name));
ADDRGP4 $3836
ARGP4
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+4
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 4574
;4573:
;4574:	  if (tempStr && (!Q_stricmp(tempStr, "female"))) {
ADDRLP4 44
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3839
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $3841
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $3839
line 4575
;4575:        uiInfo.characterList[uiInfo.characterCount].base = String_Alloc(va("Janet"));
ADDRGP4 $3845
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 4576
;4576:      } else if (tempStr && (!Q_stricmp(tempStr, "male"))) {
ADDRGP4 $3840
JUMPV
LABELV $3839
ADDRLP4 52
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3846
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $3848
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $3846
line 4577
;4577:        uiInfo.characterList[uiInfo.characterCount].base = String_Alloc(va("James"));
ADDRGP4 $1089
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
ADDRLP4 64
INDIRP4
ASGNP4
line 4578
;4578:	  } else {
ADDRGP4 $3847
JUMPV
LABELV $3846
line 4579
;4579:        uiInfo.characterList[uiInfo.characterCount].base = String_Alloc(va("%s",tempStr));
ADDRGP4 $3524
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
ADDRLP4 64
INDIRP4
ASGNP4
line 4580
;4580:	  }
LABELV $3847
LABELV $3840
line 4582
;4581:
;4582:      Com_Printf("Loaded %s character %s.\n", uiInfo.characterList[uiInfo.characterCount].base, uiInfo.characterList[uiInfo.characterCount].name);
ADDRGP4 $3855
ARGP4
ADDRLP4 60
CNSTI4 24
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4583
;4583:      if (uiInfo.characterCount < MAX_HEADS) {
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 64
GEI4 $3861
line 4584
;4584:        uiInfo.characterCount++;
ADDRLP4 64
ADDRGP4 uiInfo+73440
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4585
;4585:      } else {
ADDRGP4 $3862
JUMPV
LABELV $3861
line 4586
;4586:        Com_Printf("Too many characters, last character replaced!\n");
ADDRGP4 $3865
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4587
;4587:      }
LABELV $3862
line 4589
;4588:     
;4589:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 4590
;4590:      if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3866
line 4591
;4591:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3812
JUMPV
LABELV $3866
line 4593
;4592:      }
;4593:    }
LABELV $3823
line 4594
;4594:  }
LABELV $3816
line 4554
ADDRGP4 $3815
JUMPV
line 4596
;4595:
;4596:  return qfalse;
CNSTI4 0
RETI4
LABELV $3812
endproc Character_Parse 68 12
proc Alias_Parse 40 12
line 4600
;4597:}
;4598:
;4599:
;4600:static qboolean Alias_Parse(char **p) {
line 4603
;4601:  char *token;
;4602:
;4603:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4605
;4604:
;4605:  if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3872
line 4606
;4606:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3868
JUMPV
LABELV $3871
line 4609
;4607:  }
;4608:
;4609:  while ( 1 ) {
line 4610
;4610:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4612
;4611:
;4612:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3874
line 4613
;4613:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3868
JUMPV
LABELV $3874
line 4616
;4614:    }
;4615:
;4616:    if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3878
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3876
LABELV $3878
line 4617
;4617:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3868
JUMPV
LABELV $3876
line 4620
;4618:    }
;4619:
;4620:    if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3879
line 4622
;4621:      // three tokens per line, character name, bot alias, and preferred action a - all purpose, d - defense, o - offense
;4622:      if (!String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].name) || !String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].ai) || !String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].action)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3892
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3892
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+8
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3881
LABELV $3892
line 4623
;4623:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3868
JUMPV
LABELV $3881
line 4626
;4624:      }
;4625:    
;4626:      Com_Printf("Loaded character alias %s using character ai %s.\n", uiInfo.aliasList[uiInfo.aliasCount].name, uiInfo.aliasList[uiInfo.aliasCount].ai);
ADDRGP4 $3893
ARGP4
ADDRLP4 32
CNSTI4 12
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4627
;4627:      if (uiInfo.aliasCount < MAX_ALIASES) {
ADDRGP4 uiInfo+74984
INDIRI4
CNSTI4 64
GEI4 $3899
line 4628
;4628:        uiInfo.aliasCount++;
ADDRLP4 36
ADDRGP4 uiInfo+74984
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4629
;4629:      } else {
ADDRGP4 $3900
JUMPV
LABELV $3899
line 4630
;4630:        Com_Printf("Too many aliases, last alias replaced!\n");
ADDRGP4 $3903
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4631
;4631:      }
LABELV $3900
line 4633
;4632:     
;4633:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 4634
;4634:      if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3904
line 4635
;4635:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3868
JUMPV
LABELV $3904
line 4637
;4636:      }
;4637:    }
LABELV $3879
line 4638
;4638:  }
LABELV $3872
line 4609
ADDRGP4 $3871
JUMPV
line 4640
;4639:
;4640:  return qfalse;
CNSTI4 0
RETI4
LABELV $3868
endproc Alias_Parse 40 12
proc UI_ParseTeamInfo 44 8
line 4649
;4641:}
;4642:
;4643:
;4644:
;4645:// mode 
;4646:// 0 - high level parsing
;4647:// 1 - team parsing
;4648:// 2 - character parsing
;4649:static void UI_ParseTeamInfo(const char *teamFile) {
line 4652
;4650:	char	*token;
;4651:  char *p;
;4652:  char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 4655
;4653:  //static int mode = 0; TTimo: unused
;4654:
;4655:  buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 4656
;4656:  if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3907
line 4657
;4657:    return;
ADDRGP4 $3906
JUMPV
LABELV $3907
line 4660
;4658:  }
;4659:
;4660:  p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $3910
JUMPV
LABELV $3909
line 4662
;4661:
;4662:	while ( 1 ) {
line 4663
;4663:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 4664
;4664:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3915
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3915
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $3912
LABELV $3915
line 4665
;4665:			break;
ADDRGP4 $3911
JUMPV
LABELV $3912
line 4668
;4666:		}
;4667:
;4668:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3916
line 4669
;4669:      break;
ADDRGP4 $3911
JUMPV
LABELV $3916
line 4672
;4670:    }
;4671:
;4672:    if (Q_stricmp(token, "teams") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3920
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $3918
line 4674
;4673:
;4674:      if (Team_Parse(&p)) {
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 Team_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $3911
line 4675
;4675:        continue;
ADDRGP4 $3910
JUMPV
line 4676
;4676:      } else {
line 4677
;4677:        break;
LABELV $3918
line 4681
;4678:      }
;4679:    }
;4680:
;4681:    if (Q_stricmp(token, "characters") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3925
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $3923
line 4682
;4682:      Character_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 Character_Parse
CALLI4
pop
line 4683
;4683:    }
LABELV $3923
line 4685
;4684:
;4685:    if (Q_stricmp(token, "aliases") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3928
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $3926
line 4686
;4686:      Alias_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 Alias_Parse
CALLI4
pop
line 4687
;4687:    }
LABELV $3926
line 4689
;4688:
;4689:  }
LABELV $3910
line 4662
ADDRGP4 $3909
JUMPV
LABELV $3911
line 4691
;4690:
;4691:}
LABELV $3906
endproc UI_ParseTeamInfo 44 8
proc GameType_Parse 28 8
line 4694
;4692:
;4693:
;4694:static qboolean GameType_Parse(char **p, qboolean join) {
line 4697
;4695:	char *token;
;4696:
;4697:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4699
;4698:
;4699:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3930
line 4700
;4700:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3929
JUMPV
LABELV $3930
line 4703
;4701:	}
;4702:
;4703:	if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $3932
line 4704
;4704:		uiInfo.numJoinGameTypes = 0;
ADDRGP4 uiInfo+78708
CNSTI4 0
ASGNI4
line 4705
;4705:	} else {
ADDRGP4 $3937
JUMPV
LABELV $3932
line 4706
;4706:		uiInfo.numGameTypes = 0;
ADDRGP4 uiInfo+78576
CNSTI4 0
ASGNI4
line 4707
;4707:	}
ADDRGP4 $3937
JUMPV
LABELV $3936
line 4709
;4708:
;4709:	while ( 1 ) {
line 4710
;4710:		token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4712
;4711:
;4712:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3939
line 4713
;4713:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3929
JUMPV
LABELV $3939
line 4716
;4714:		}
;4715:
;4716:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3943
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3941
LABELV $3943
line 4717
;4717:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3929
JUMPV
LABELV $3941
line 4720
;4718:		}
;4719:
;4720:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3944
line 4722
;4721:			// two tokens per line, character name and sex
;4722:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $3946
line 4723
;4723:				if (!String_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gameType) || !Int_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3955
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $3947
LABELV $3955
line 4724
;4724:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3929
JUMPV
line 4726
;4725:				}
;4726:			} else {
LABELV $3946
line 4727
;4727:				if (!String_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gameType) || !Int_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3963
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $3956
LABELV $3963
line 4728
;4728:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3929
JUMPV
LABELV $3956
line 4730
;4729:				}
;4730:			}
LABELV $3947
line 4732
;4731:    
;4732:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $3964
line 4733
;4733:				if (uiInfo.numJoinGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 16
GEI4 $3966
line 4734
;4734:					uiInfo.numJoinGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+78708
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4735
;4735:				} else {
ADDRGP4 $3965
JUMPV
LABELV $3966
line 4736
;4736:					Com_Printf("Too many net game types, last one replace!\n");
ADDRGP4 $3970
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4737
;4737:				}		
line 4738
;4738:			} else {
ADDRGP4 $3965
JUMPV
LABELV $3964
line 4739
;4739:				if (uiInfo.numGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 16
GEI4 $3971
line 4740
;4740:					uiInfo.numGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+78576
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4741
;4741:				} else {
ADDRGP4 $3972
JUMPV
LABELV $3971
line 4742
;4742:					Com_Printf("Too many game types, last one replace!\n");
ADDRGP4 $3975
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4743
;4743:				}		
LABELV $3972
line 4744
;4744:			}
LABELV $3965
line 4746
;4745:     
;4746:			token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 4747
;4747:			if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3976
line 4748
;4748:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3929
JUMPV
LABELV $3976
line 4750
;4749:			}
;4750:		}
LABELV $3944
line 4751
;4751:	}
LABELV $3937
line 4709
ADDRGP4 $3936
JUMPV
line 4752
;4752:	return qfalse;
CNSTI4 0
RETI4
LABELV $3929
endproc GameType_Parse 28 8
proc MapList_Parse 52 8
line 4755
;4753:}
;4754:
;4755:static qboolean MapList_Parse(char **p) {
line 4758
;4756:	char *token;
;4757:
;4758:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4760
;4759:
;4760:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3979
line 4761
;4761:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3978
JUMPV
LABELV $3979
line 4764
;4762:	}
;4763:
;4764:	uiInfo.mapCount = 0;
ADDRGP4 uiInfo+83224
CNSTI4 0
ASGNI4
ADDRGP4 $3983
JUMPV
LABELV $3982
line 4766
;4765:
;4766:	while ( 1 ) {
line 4767
;4767:		token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4769
;4768:
;4769:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3985
line 4770
;4770:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3978
JUMPV
LABELV $3985
line 4773
;4771:		}
;4772:
;4773:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3989
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3987
LABELV $3989
line 4774
;4774:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3978
JUMPV
LABELV $3987
line 4777
;4775:		}
;4776:
;4777:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3990
line 4778
;4778:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapName) || !String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapLoadName) 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $4003
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4003
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3992
LABELV $4003
line 4779
;4779:				||!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].teamMembers) ) {
line 4780
;4780:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3978
JUMPV
LABELV $3992
line 4783
;4781:			}
;4782:
;4783:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].opponentName)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+12
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4004
line 4784
;4784:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3978
JUMPV
LABELV $4004
line 4787
;4785:			}
;4786:
;4787:			uiInfo.mapList[uiInfo.mapCount].typeBits = 0;
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $4013
JUMPV
LABELV $4012
line 4789
;4788:
;4789:			while (1) {
line 4790
;4790:				token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 4791
;4791:				if (token[0] >= '0' && token[0] <= '9') {
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $4014
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $4014
line 4792
;4792:					uiInfo.mapList[uiInfo.mapCount].typeBits |= (1 << (token[0] - 0x030));
ADDRLP4 44
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 4793
;4793:					if (!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].timeToBeat[token[0] - 0x30])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 2
LSHI4
CNSTI4 192
SUBI4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+28
ADDP4
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $4016
line 4794
;4794:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3978
JUMPV
line 4796
;4795:					}
;4796:				} else {
line 4797
;4797:					break;
LABELV $4016
line 4799
;4798:				} 
;4799:			}
LABELV $4013
line 4789
ADDRGP4 $4012
JUMPV
LABELV $4014
line 4806
;4800:
;4801:			//mapList[mapCount].imageName = String_Alloc(va("levelshots/%s", mapList[mapCount].mapLoadName));
;4802:			//if (uiInfo.mapCount == 0) {
;4803:			  // only load the first cinematic, selection loads the others
;4804:  			//  uiInfo.mapList[uiInfo.mapCount].cinematic = trap_CIN_PlayCinematic(va("%s.roq",uiInfo.mapList[uiInfo.mapCount].mapLoadName), qfalse, qfalse, qtrue, 0, 0, 0, 0);
;4805:			//}
;4806:  		uiInfo.mapList[uiInfo.mapCount].cinematic = -1;
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -1
ASGNI4
line 4807
;4807:			uiInfo.mapList[uiInfo.mapCount].levelShot = trap_R_RegisterShaderNoMip(va("levelshots/%s_small", uiInfo.mapList[uiInfo.mapCount].mapLoadName));
ADDRGP4 $4031
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 4809
;4808:
;4809:			if (uiInfo.mapCount < MAX_MAPS) {
ADDRGP4 uiInfo+83224
INDIRI4
CNSTI4 128
GEI4 $4035
line 4810
;4810:				uiInfo.mapCount++;
ADDRLP4 48
ADDRGP4 uiInfo+83224
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4811
;4811:			} else {
ADDRGP4 $4036
JUMPV
LABELV $4035
line 4812
;4812:				Com_Printf("Too many maps, last one replaced!\n");
ADDRGP4 $4039
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4813
;4813:			}
LABELV $4036
line 4814
;4814:		}
LABELV $3990
line 4815
;4815:	}
LABELV $3983
line 4766
ADDRGP4 $3982
JUMPV
line 4816
;4816:	return qfalse;
CNSTI4 0
RETI4
LABELV $3978
endproc MapList_Parse 52 8
proc UI_ParseGameInfo 44 8
line 4819
;4817:}
;4818:
;4819:static void UI_ParseGameInfo(const char *teamFile) {
line 4822
;4820:	char	*token;
;4821:	char *p;
;4822:	char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 4825
;4823:	//int mode = 0; TTimo: unused
;4824:
;4825:	buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 4826
;4826:	if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4041
line 4827
;4827:		return;
ADDRGP4 $4040
JUMPV
LABELV $4041
line 4830
;4828:	}
;4829:
;4830:	p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $4044
JUMPV
LABELV $4043
line 4832
;4831:
;4832:	while ( 1 ) {
line 4833
;4833:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 4834
;4834:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4049
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4049
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $4046
LABELV $4049
line 4835
;4835:			break;
ADDRGP4 $4045
JUMPV
LABELV $4046
line 4838
;4836:		}
;4837:
;4838:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $451
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4050
line 4839
;4839:			break;
ADDRGP4 $4045
JUMPV
LABELV $4050
line 4842
;4840:		}
;4841:
;4842:		if (Q_stricmp(token, "gametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4054
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4052
line 4844
;4843:
;4844:			if (GameType_Parse(&p, qfalse)) {
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $4045
line 4845
;4845:				continue;
ADDRGP4 $4044
JUMPV
line 4846
;4846:			} else {
line 4847
;4847:				break;
LABELV $4052
line 4851
;4848:			}
;4849:		}
;4850:
;4851:		if (Q_stricmp(token, "joingametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4059
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $4057
line 4853
;4852:
;4853:			if (GameType_Parse(&p, qtrue)) {
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4045
line 4854
;4854:				continue;
ADDRGP4 $4044
JUMPV
line 4855
;4855:			} else {
line 4856
;4856:				break;
LABELV $4057
line 4860
;4857:			}
;4858:		}
;4859:
;4860:		if (Q_stricmp(token, "maps") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4064
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $4062
line 4862
;4861:			// start a new menu
;4862:			MapList_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 MapList_Parse
CALLI4
pop
line 4863
;4863:		}
LABELV $4062
line 4865
;4864:
;4865:	}
LABELV $4044
line 4832
ADDRGP4 $4043
JUMPV
LABELV $4045
line 4866
;4866:}
LABELV $4040
endproc UI_ParseGameInfo 44 8
proc UI_Pause 4 8
line 4868
;4867:
;4868:static void UI_Pause(qboolean b) {
line 4869
;4869:	if (b) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4066
line 4871
;4870:		// pause the game and set the ui keycatcher
;4871:	  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4872
;4872:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4873
;4873:	} else {
ADDRGP4 $4067
JUMPV
LABELV $4066
line 4875
;4874:		// unpause the game and clear the ui keycatcher
;4875:		trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4876
;4876:		trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4877
;4877:		trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4878
;4878:	}
LABELV $4067
line 4879
;4879:}
LABELV $4065
endproc UI_Pause 4 8
proc UI_PlayCinematic 4 24
line 4888
;4880:
;4881:#ifndef MISSIONPACK // bk001206
;4882:static int UI_OwnerDraw_Width(int ownerDraw) {
;4883:  // bk001205 - LCC missing return value
;4884:  return 0;
;4885:}
;4886:#endif
;4887:
;4888:static int UI_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 4889
;4889:  return trap_CIN_PlayCinematic(name, x, y, w, h, (CIN_loop | CIN_silent));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4068
endproc UI_PlayCinematic 4 24
proc UI_StopCinematic 20 4
line 4892
;4890:}
;4891:
;4892:static void UI_StopCinematic(int handle) {
line 4893
;4893:	if (handle >= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
LTI4 $4070
line 4894
;4894:	  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4895
;4895:	} else {
ADDRGP4 $4071
JUMPV
LABELV $4070
line 4896
;4896:		handle = abs(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 4897
;4897:		if (handle == UI_MAPCINEMATIC) {
ADDRFP4 0
INDIRI4
CNSTI4 244
NEI4 $4072
line 4898
;4898:			if (uiInfo.mapList[ui_currentMap.integer].cinematic >= 0) {
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4073
line 4899
;4899:			  trap_CIN_StopCinematic(uiInfo.mapList[ui_currentMap.integer].cinematic);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4900
;4900:			  uiInfo.mapList[ui_currentMap.integer].cinematic = -1;
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -1
ASGNI4
line 4901
;4901:			}
line 4902
;4902:		} else if (handle == UI_NETMAPCINEMATIC) {
ADDRGP4 $4073
JUMPV
LABELV $4072
ADDRFP4 0
INDIRI4
CNSTI4 246
NEI4 $4085
line 4903
;4903:			if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99264+10432
INDIRI4
CNSTI4 0
LTI4 $4086
line 4904
;4904:			  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4905
;4905:				uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99264+10432
CNSTI4 -1
ASGNI4
line 4906
;4906:			}
line 4907
;4907:		} else if (handle == UI_CLANCINEMATIC) {
ADDRGP4 $4086
JUMPV
LABELV $4085
ADDRFP4 0
INDIRI4
CNSTI4 251
NEI4 $4095
line 4908
;4908:		  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $700
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 4909
;4909:		  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $4097
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $4097
line 4910
;4910:				if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4100
line 4911
;4911:				  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4912
;4912:					uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -1
ASGNI4
line 4913
;4913:				}
LABELV $4100
line 4914
;4914:			}
LABELV $4097
line 4915
;4915:		}
LABELV $4095
LABELV $4086
LABELV $4073
line 4916
;4916:	}
LABELV $4071
line 4917
;4917:}
LABELV $4069
endproc UI_StopCinematic 20 4
proc UI_DrawCinematic 0 20
line 4919
;4918:
;4919:static void UI_DrawCinematic(int handle, float x, float y, float w, float h) {
line 4920
;4920:	trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 4921
;4921:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 4922
;4922:}
LABELV $4108
endproc UI_DrawCinematic 0 20
proc UI_RunCinematicFrame 0 4
line 4924
;4923:
;4924:static void UI_RunCinematicFrame(int handle) {
line 4925
;4925:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 4926
;4926:}
LABELV $4109
endproc UI_RunCinematicFrame 0 4
proc UI_BuildQ3Model_List 4520 20
line 4936
;4927:
;4928:
;4929:
;4930:/*
;4931:=================
;4932:PlayerModel_BuildList
;4933:=================
;4934:*/
;4935:static void UI_BuildQ3Model_List( void )
;4936:{
line 4950
;4937:	int		numdirs;
;4938:	int		numfiles;
;4939:	char	dirlist[2048];
;4940:	char	filelist[2048];
;4941:	char	skinname[64];
;4942:	char	scratch[256];
;4943:	char*	dirptr;
;4944:	char*	fileptr;
;4945:	int		i;
;4946:	int		j, k, dirty;
;4947:	int		dirlen;
;4948:	int		filelen;
;4949:
;4950:	uiInfo.q3HeadCount = 0;
ADDRGP4 uiInfo+119488
CNSTI4 0
ASGNI4
line 4953
;4951:
;4952:	// iterate directory of all player models
;4953:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $4112
ARGP4
ADDRGP4 $4113
ARGP4
ADDRLP4 2408
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4456
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2404
ADDRLP4 4456
INDIRI4
ASGNI4
line 4954
;4954:	dirptr  = dirlist;
ADDRLP4 340
ADDRLP4 2408
ASGNP4
line 4955
;4955:	for (i=0; i<numdirs && uiInfo.q3HeadCount < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRGP4 $4117
JUMPV
LABELV $4114
line 4956
;4956:	{
line 4957
;4957:		dirlen = strlen(dirptr);
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 4460
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 348
ADDRLP4 4460
INDIRI4
ASGNI4
line 4959
;4958:		
;4959:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $4119
ADDRLP4 348
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 340
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4119
ADDRLP4 348
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 340
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $4119
line 4961
;4960:
;4961:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $4123
ARGP4
ADDRLP4 4468
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4468
INDIRI4
CNSTI4 0
EQI4 $4125
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $4124
ARGP4
ADDRLP4 4472
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4472
INDIRI4
CNSTI4 0
NEI4 $4121
LABELV $4125
line 4962
;4962:			continue;
ADDRGP4 $4115
JUMPV
LABELV $4121
line 4965
;4963:			
;4964:		// iterate all skin files in directory
;4965:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $4126
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 4476
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4476
INDIRP4
ARGP4
ADDRGP4 $4127
ARGP4
ADDRLP4 356
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4480
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 4480
INDIRI4
ASGNI4
line 4966
;4966:		fileptr  = filelist;
ADDRLP4 328
ADDRLP4 356
ASGNP4
line 4967
;4967:		for (j=0; j<numfiles && uiInfo.q3HeadCount < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRGP4 $4131
JUMPV
LABELV $4128
line 4968
;4968:		{
line 4969
;4969:			filelen = strlen(fileptr);
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 4484
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 4484
INDIRI4
ASGNI4
line 4971
;4970:
;4971:			COM_StripExtension(fileptr,skinname);
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 4974
;4972:
;4973:			// look for icon_????
;4974:			if (Q_stricmpn(skinname, "icon_", 5) == 0 && !(Q_stricmp(skinname,"icon_blue") == 0 || Q_stricmp(skinname,"icon_red") == 0))
ADDRLP4 260
ARGP4
ADDRGP4 $4135
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4488
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4488
INDIRI4
CNSTI4 0
NEI4 $4133
ADDRLP4 260
ARGP4
ADDRGP4 $4136
ARGP4
ADDRLP4 4492
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4492
INDIRI4
CNSTI4 0
EQI4 $4133
ADDRLP4 260
ARGP4
ADDRGP4 $4137
ARGP4
ADDRLP4 4496
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4496
INDIRI4
CNSTI4 0
EQI4 $4133
line 4975
;4975:			{
line 4976
;4976:				if (Q_stricmp(skinname, "icon_default") == 0) {
ADDRLP4 260
ARGP4
ADDRGP4 $4140
ARGP4
ADDRLP4 4500
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4500
INDIRI4
CNSTI4 0
NEI4 $4138
line 4977
;4977:					Com_sprintf( scratch, sizeof(scratch), dirptr);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4978
;4978:				} else {
ADDRGP4 $4139
JUMPV
LABELV $4138
line 4979
;4979:					Com_sprintf( scratch, sizeof(scratch), "%s/%s",dirptr, skinname + 5);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4141
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 260+5
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4980
;4980:				}
LABELV $4139
line 4981
;4981:				dirty = 0;
ADDRLP4 324
CNSTI4 0
ASGNI4
line 4982
;4982:				for(k=0;k<uiInfo.q3HeadCount;k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4146
JUMPV
LABELV $4143
line 4983
;4983:					if (!Q_stricmp(scratch, uiInfo.q3HeadNames[uiInfo.q3HeadCount])) {
ADDRLP4 4
ARGP4
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
ADDRLP4 4504
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4504
INDIRI4
CNSTI4 0
NEI4 $4148
line 4984
;4984:						dirty = 1;
ADDRLP4 324
CNSTI4 1
ASGNI4
line 4985
;4985:						break;
ADDRGP4 $4145
JUMPV
LABELV $4148
line 4987
;4986:					}
;4987:				}
LABELV $4144
line 4982
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4146
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
LTI4 $4143
LABELV $4145
line 4988
;4988:				if (!dirty) {
ADDRLP4 324
INDIRI4
CNSTI4 0
NEI4 $4152
line 4989
;4989:					Com_sprintf( uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]), scratch);
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4990
;4990:					uiInfo.q3HeadIcons[uiInfo.q3HeadCount++] = trap_R_RegisterShaderNoMip(va("models/players/%s/%s",dirptr,skinname));
ADDRLP4 4508
ADDRGP4 uiInfo+119488
ASGNP4
ADDRLP4 4504
ADDRLP4 4508
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4508
INDIRP4
ADDRLP4 4504
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $4160
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 4512
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4512
INDIRP4
ARGP4
ADDRLP4 4516
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4504
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+135876
ADDP4
ADDRLP4 4516
INDIRI4
ASGNI4
line 4991
;4991:				}
LABELV $4152
line 4992
;4992:			}
LABELV $4133
line 4994
;4993:
;4994:		}
LABELV $4129
line 4967
ADDRLP4 4484
CNSTI4 1
ASGNI4
ADDRLP4 332
ADDRLP4 332
INDIRI4
ADDRLP4 4484
INDIRI4
ADDI4
ASGNI4
ADDRLP4 328
ADDRLP4 336
INDIRI4
ADDRLP4 4484
INDIRI4
ADDI4
ADDRLP4 328
INDIRP4
ADDP4
ASGNP4
LABELV $4131
ADDRLP4 332
INDIRI4
ADDRLP4 344
INDIRI4
GEI4 $4161
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 256
LTI4 $4128
LABELV $4161
line 4995
;4995:	}	
LABELV $4115
line 4955
ADDRLP4 4460
CNSTI4 1
ASGNI4
ADDRLP4 352
ADDRLP4 352
INDIRI4
ADDRLP4 4460
INDIRI4
ADDI4
ASGNI4
ADDRLP4 340
ADDRLP4 348
INDIRI4
ADDRLP4 4460
INDIRI4
ADDI4
ADDRLP4 340
INDIRP4
ADDP4
ASGNP4
LABELV $4117
ADDRLP4 352
INDIRI4
ADDRLP4 2404
INDIRI4
GEI4 $4162
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 256
LTI4 $4114
LABELV $4162
line 4997
;4996:
;4997:}
LABELV $4110
endproc UI_BuildQ3Model_List 4520 20
export _UI_Init
proc _UI_Init 52 16
line 5006
;4998:
;4999:
;5000:
;5001:/*
;5002:=================
;5003:UI_Init
;5004:=================
;5005:*/
;5006:void _UI_Init( qboolean inGameLoad ) {
line 5012
;5007:	const char *menuSet;
;5008:	int start;
;5009:
;5010:	//uiInfo.inGameLoad = inGameLoad;
;5011:
;5012:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 5013
;5013:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 5016
;5014:
;5015:	// cache redundant calulations
;5016:	trap_GetGlconfig( &uiInfo.uiDC.glconfig );
ADDRGP4 uiInfo+62068
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 5019
;5017:
;5018:	// for 640x480 virtualized screen
;5019:	uiInfo.uiDC.yscale = uiInfo.uiDC.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uiInfo+196
CNSTF4 990414985
ADDRGP4 uiInfo+62068+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 5020
;5020:	uiInfo.uiDC.xscale = uiInfo.uiDC.glconfig.vidWidth * (1.0/640.0);
ADDRGP4 uiInfo+200
CNSTF4 986500301
ADDRGP4 uiInfo+62068+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 5021
;5021:	if ( uiInfo.uiDC.glconfig.vidWidth * 480 > uiInfo.uiDC.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uiInfo+62068+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uiInfo+62068+11308
INDIRI4
MULI4
LEI4 $4171
line 5023
;5022:		// wide screen
;5023:		uiInfo.uiDC.bias = 0.5 * ( uiInfo.uiDC.glconfig.vidWidth - ( uiInfo.uiDC.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uiInfo+204
CNSTF4 1056964608
ADDRGP4 uiInfo+62068+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uiInfo+62068+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 5024
;5024:	}
ADDRGP4 $4172
JUMPV
LABELV $4171
line 5025
;5025:	else {
line 5027
;5026:		// no wide screen
;5027:		uiInfo.uiDC.bias = 0;
ADDRGP4 uiInfo+204
CNSTF4 0
ASGNF4
line 5028
;5028:	}
LABELV $4172
line 5032
;5029:
;5030:
;5031:  //UI_Load();
;5032:	uiInfo.uiDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 uiInfo
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 5033
;5033:	uiInfo.uiDC.setColor = &UI_SetColor;
ADDRGP4 uiInfo+4
ADDRGP4 UI_SetColor
ASGNP4
line 5034
;5034:	uiInfo.uiDC.drawHandlePic = &UI_DrawHandlePic;
ADDRGP4 uiInfo+8
ADDRGP4 UI_DrawHandlePic
ASGNP4
line 5035
;5035:	uiInfo.uiDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 uiInfo+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 5036
;5036:	uiInfo.uiDC.drawText = &Text_Paint;
ADDRGP4 uiInfo+16
ADDRGP4 Text_Paint
ASGNP4
line 5037
;5037:	uiInfo.uiDC.textWidth = &Text_Width;
ADDRGP4 uiInfo+20
ADDRGP4 Text_Width
ASGNP4
line 5038
;5038:	uiInfo.uiDC.textHeight = &Text_Height;
ADDRGP4 uiInfo+24
ADDRGP4 Text_Height
ASGNP4
line 5039
;5039:	uiInfo.uiDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 uiInfo+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 5040
;5040:	uiInfo.uiDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 uiInfo+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 5041
;5041:	uiInfo.uiDC.fillRect = &UI_FillRect;
ADDRGP4 uiInfo+36
ADDRGP4 UI_FillRect
ASGNP4
line 5042
;5042:	uiInfo.uiDC.drawRect = &_UI_DrawRect;
ADDRGP4 uiInfo+40
ADDRGP4 _UI_DrawRect
ASGNP4
line 5043
;5043:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 5044
;5044:	uiInfo.uiDC.drawTopBottom = &_UI_DrawTopBottom;
ADDRGP4 uiInfo+48
ADDRGP4 _UI_DrawTopBottom
ASGNP4
line 5045
;5045:	uiInfo.uiDC.clearScene = &trap_R_ClearScene;
ADDRGP4 uiInfo+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 5046
;5046:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 5047
;5047:	uiInfo.uiDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 uiInfo+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 5048
;5048:	uiInfo.uiDC.renderScene = &trap_R_RenderScene;
ADDRGP4 uiInfo+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 5049
;5049:	uiInfo.uiDC.registerFont = &trap_R_RegisterFont;
ADDRGP4 uiInfo+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 5050
;5050:	uiInfo.uiDC.ownerDrawItem = &UI_OwnerDraw;
ADDRGP4 uiInfo+68
ADDRGP4 UI_OwnerDraw
ASGNP4
line 5051
;5051:	uiInfo.uiDC.getValue = &UI_GetValue;
ADDRGP4 uiInfo+72
ADDRGP4 UI_GetValue
ASGNP4
line 5052
;5052:	uiInfo.uiDC.ownerDrawVisible = &UI_OwnerDrawVisible;
ADDRGP4 uiInfo+76
ADDRGP4 UI_OwnerDrawVisible
ASGNP4
line 5053
;5053:	uiInfo.uiDC.runScript = &UI_RunMenuScript;
ADDRGP4 uiInfo+80
ADDRGP4 UI_RunMenuScript
ASGNP4
line 5054
;5054:	uiInfo.uiDC.getTeamColor = &UI_GetTeamColor;
ADDRGP4 uiInfo+84
ADDRGP4 UI_GetTeamColor
ASGNP4
line 5055
;5055:	uiInfo.uiDC.setCVar = trap_Cvar_Set;
ADDRGP4 uiInfo+96
ADDRGP4 trap_Cvar_Set
ASGNP4
line 5056
;5056:	uiInfo.uiDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 uiInfo+88
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 5057
;5057:	uiInfo.uiDC.getCVarValue = trap_Cvar_VariableValue;
ADDRGP4 uiInfo+92
ADDRGP4 trap_Cvar_VariableValue
ASGNP4
line 5058
;5058:	uiInfo.uiDC.drawTextWithCursor = &Text_PaintWithCursor;
ADDRGP4 uiInfo+100
ADDRGP4 Text_PaintWithCursor
ASGNP4
line 5059
;5059:	uiInfo.uiDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
ADDRGP4 uiInfo+104
ADDRGP4 trap_Key_SetOverstrikeMode
ASGNP4
line 5060
;5060:	uiInfo.uiDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
ADDRGP4 uiInfo+108
ADDRGP4 trap_Key_GetOverstrikeMode
ASGNP4
line 5061
;5061:	uiInfo.uiDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 uiInfo+112
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 5062
;5062:	uiInfo.uiDC.ownerDrawHandleKey = &UI_OwnerDrawHandleKey;
ADDRGP4 uiInfo+116
ADDRGP4 UI_OwnerDrawHandleKey
ASGNP4
line 5063
;5063:	uiInfo.uiDC.feederCount = &UI_FeederCount;
ADDRGP4 uiInfo+120
ADDRGP4 UI_FeederCount
ASGNP4
line 5064
;5064:	uiInfo.uiDC.feederItemImage = &UI_FeederItemImage;
ADDRGP4 uiInfo+128
ADDRGP4 UI_FeederItemImage
ASGNP4
line 5065
;5065:	uiInfo.uiDC.feederItemText = &UI_FeederItemText;
ADDRGP4 uiInfo+124
ADDRGP4 UI_FeederItemText
ASGNP4
line 5066
;5066:	uiInfo.uiDC.feederSelection = &UI_FeederSelection;
ADDRGP4 uiInfo+132
ADDRGP4 UI_FeederSelection
ASGNP4
line 5067
;5067:	uiInfo.uiDC.setBinding = &trap_Key_SetBinding;
ADDRGP4 uiInfo+144
ADDRGP4 trap_Key_SetBinding
ASGNP4
line 5068
;5068:	uiInfo.uiDC.getBindingBuf = &trap_Key_GetBindingBuf;
ADDRGP4 uiInfo+140
ADDRGP4 trap_Key_GetBindingBuf
ASGNP4
line 5069
;5069:	uiInfo.uiDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
ADDRGP4 uiInfo+136
ADDRGP4 trap_Key_KeynumToStringBuf
ASGNP4
line 5070
;5070:	uiInfo.uiDC.executeText = &trap_Cmd_ExecuteText;
ADDRGP4 uiInfo+148
ADDRGP4 trap_Cmd_ExecuteText
ASGNP4
line 5071
;5071:	uiInfo.uiDC.Error = &Com_Error; 
ADDRGP4 uiInfo+152
ADDRGP4 Com_Error
ASGNP4
line 5072
;5072:	uiInfo.uiDC.Print = &Com_Printf; 
ADDRGP4 uiInfo+156
ADDRGP4 Com_Printf
ASGNP4
line 5073
;5073:	uiInfo.uiDC.Pause = &UI_Pause;
ADDRGP4 uiInfo+160
ADDRGP4 UI_Pause
ASGNP4
line 5074
;5074:	uiInfo.uiDC.ownerDrawWidth = &UI_OwnerDrawWidth;
ADDRGP4 uiInfo+164
ADDRGP4 UI_OwnerDrawWidth
ASGNP4
line 5075
;5075:	uiInfo.uiDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 uiInfo+168
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 5076
;5076:	uiInfo.uiDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 uiInfo+172
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 5077
;5077:	uiInfo.uiDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 uiInfo+176
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 5078
;5078:	uiInfo.uiDC.playCinematic = &UI_PlayCinematic;
ADDRGP4 uiInfo+180
ADDRGP4 UI_PlayCinematic
ASGNP4
line 5079
;5079:	uiInfo.uiDC.stopCinematic = &UI_StopCinematic;
ADDRGP4 uiInfo+184
ADDRGP4 UI_StopCinematic
ASGNP4
line 5080
;5080:	uiInfo.uiDC.drawCinematic = &UI_DrawCinematic;
ADDRGP4 uiInfo+188
ADDRGP4 UI_DrawCinematic
ASGNP4
line 5081
;5081:	uiInfo.uiDC.runCinematicFrame = &UI_RunCinematicFrame;
ADDRGP4 uiInfo+192
ADDRGP4 UI_RunCinematicFrame
ASGNP4
line 5083
;5082:
;5083:	Init_Display(&uiInfo.uiDC);
ADDRGP4 uiInfo
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 5085
;5084:
;5085:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 5087
;5086:  
;5087:	uiInfo.uiDC.cursor	= trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $4233
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73408
ADDRLP4 8
INDIRI4
ASGNI4
line 5088
;5088:	uiInfo.uiDC.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $4235
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73400
ADDRLP4 12
INDIRI4
ASGNI4
line 5090
;5089:
;5090:	AssetCache();
ADDRGP4 AssetCache
CALLV
pop
line 5092
;5091:
;5092:	start = trap_Milliseconds();
ADDRLP4 16
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 5094
;5093:
;5094:  uiInfo.teamCount = 0;
ADDRGP4 uiInfo+75756
CNSTI4 0
ASGNI4
line 5095
;5095:  uiInfo.characterCount = 0;
ADDRGP4 uiInfo+73440
CNSTI4 0
ASGNI4
line 5096
;5096:  uiInfo.aliasCount = 0;
ADDRGP4 uiInfo+74984
CNSTI4 0
ASGNI4
line 5102
;5097:
;5098:#ifdef PRE_RELEASE_TADEMO
;5099:	UI_ParseTeamInfo("demoteaminfo.txt");
;5100:	UI_ParseGameInfo("demogameinfo.txt");
;5101:#else
;5102:	UI_ParseTeamInfo("teaminfo.txt");
ADDRGP4 $4239
ARGP4
ADDRGP4 UI_ParseTeamInfo
CALLV
pop
line 5103
;5103:	UI_LoadTeams();
ADDRGP4 UI_LoadTeams
CALLV
pop
line 5104
;5104:	UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $676
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 5107
;5105:#endif
;5106:
;5107:	menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $670
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 5108
;5108:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4242
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4240
LABELV $4242
line 5109
;5109:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $642
ASGNP4
line 5110
;5110:	}
LABELV $4240
line 5118
;5111:
;5112:#if 0
;5113:	if (uiInfo.inGameLoad) {
;5114:		UI_LoadMenus("ui/ingame.txt", qtrue);
;5115:	} else { // bk010222: left this: UI_LoadMenus(menuSet, qtrue);
;5116:	}
;5117:#else 
;5118:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 5119
;5119:	UI_LoadMenus("ui/ingame.txt", qfalse);
ADDRGP4 $4243
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 5122
;5120:#endif
;5121:	
;5122:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5124
;5123:
;5124:	trap_LAN_LoadCachedServers();
ADDRGP4 trap_LAN_LoadCachedServers
CALLV
pop
line 5125
;5125:	UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 5127
;5126:
;5127:	UI_BuildQ3Model_List();
ADDRGP4 UI_BuildQ3Model_List
CALLV
pop
line 5128
;5128:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 5131
;5129:
;5130:	// sets defaults for ui temp cvars
;5131:	uiInfo.effectsColor = gamecodetoui[(int)trap_Cvar_VariableValue("color1")-1];
ADDRGP4 $1758
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+136904
ADDRLP4 28
INDIRF4
CVFI4 4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui-4
ADDP4
INDIRI4
ASGNI4
line 5132
;5132:	uiInfo.currentCrosshair = (int)trap_Cvar_VariableValue("cg_drawCrosshair");
ADDRGP4 $2051
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+119476
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 5133
;5133:	trap_Cvar_Set("ui_mousePitch", (trap_Cvar_VariableValue("m_pitch") >= 0) ? "0" : "1");
ADDRGP4 $2344
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
LTF4 $4254
ADDRLP4 36
ADDRGP4 $394
ASGNP4
ADDRGP4 $4255
JUMPV
LABELV $4254
ADDRLP4 36
ADDRGP4 $397
ASGNP4
LABELV $4255
ADDRGP4 $2341
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5135
;5134:
;5135:	uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99264+10432
CNSTI4 -1
ASGNI4
line 5136
;5136:	uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99260
CNSTI4 -1
ASGNI4
line 5138
;5137:
;5138:	if (trap_Cvar_VariableValue("ui_TeamArenaFirstRun") == 0) {
ADDRGP4 $4261
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
NEF4 $4259
line 5139
;5139:		trap_Cvar_Set("s_volume", "0.8");
ADDRGP4 $4262
ARGP4
ADDRGP4 $4263
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5140
;5140:		trap_Cvar_Set("s_musicvolume", "0.5");
ADDRGP4 $4264
ARGP4
ADDRGP4 $4265
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5141
;5141:		trap_Cvar_Set("ui_TeamArenaFirstRun", "1");
ADDRGP4 $4261
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5142
;5142:	}
LABELV $4259
line 5144
;5143:
;5144:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $4266
ARGP4
ADDRGP4 $111
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5146
;5145:
;5146:	trap_Cvar_Set("ui_actualNetGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $715
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $730
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5147
;5147:}
LABELV $4163
endproc _UI_Init 52 16
export _UI_KeyEvent
proc _UI_KeyEvent 16 12
line 5155
;5148:
;5149:
;5150:/*
;5151:=================
;5152:UI_KeyEvent
;5153:=================
;5154:*/
;5155:void _UI_KeyEvent( int key, qboolean down ) {
line 5157
;5156:
;5157:  if (Menu_Count() > 0) {
ADDRLP4 0
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4269
line 5158
;5158:    menuDef_t *menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 5159
;5159:		if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4271
line 5160
;5160:			if (key == K_ESCAPE && down && !Menus_AnyFullScreenVisible()) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $4273
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4273
ADDRLP4 12
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4273
line 5161
;5161:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5162
;5162:			} else {
ADDRGP4 $4272
JUMPV
LABELV $4273
line 5163
;5163:				Menu_HandleKey(menu, key, down );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 5164
;5164:			}
line 5165
;5165:		} else {
ADDRGP4 $4272
JUMPV
LABELV $4271
line 5166
;5166:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 12
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5167
;5167:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5168
;5168:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5169
;5169:		}
LABELV $4272
line 5170
;5170:  }
LABELV $4269
line 5175
;5171:
;5172:  //if ((s > 0) && (s != menu_null_sound)) {
;5173:	//  trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
;5174:  //}
;5175:}
LABELV $4268
endproc _UI_KeyEvent 16 12
export _UI_MouseEvent
proc _UI_MouseEvent 12 12
line 5183
;5176:
;5177:/*
;5178:=================
;5179:UI_MouseEvent
;5180:=================
;5181:*/
;5182:void _UI_MouseEvent( int dx, int dy )
;5183:{
line 5185
;5184:	// update mouse screen position
;5185:	uiInfo.uiDC.cursorx += dx;
ADDRLP4 0
ADDRGP4 uiInfo+216
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 5186
;5186:	if (uiInfo.uiDC.cursorx < 0)
ADDRGP4 uiInfo+216
INDIRI4
CNSTI4 0
GEI4 $4277
line 5187
;5187:		uiInfo.uiDC.cursorx = 0;
ADDRGP4 uiInfo+216
CNSTI4 0
ASGNI4
ADDRGP4 $4278
JUMPV
LABELV $4277
line 5188
;5188:	else if (uiInfo.uiDC.cursorx > SCREEN_WIDTH)
ADDRGP4 uiInfo+216
INDIRI4
CNSTI4 640
LEI4 $4281
line 5189
;5189:		uiInfo.uiDC.cursorx = SCREEN_WIDTH;
ADDRGP4 uiInfo+216
CNSTI4 640
ASGNI4
LABELV $4281
LABELV $4278
line 5191
;5190:
;5191:	uiInfo.uiDC.cursory += dy;
ADDRLP4 4
ADDRGP4 uiInfo+220
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 5192
;5192:	if (uiInfo.uiDC.cursory < 0)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 0
GEI4 $4286
line 5193
;5193:		uiInfo.uiDC.cursory = 0;
ADDRGP4 uiInfo+220
CNSTI4 0
ASGNI4
ADDRGP4 $4287
JUMPV
LABELV $4286
line 5194
;5194:	else if (uiInfo.uiDC.cursory > SCREEN_HEIGHT)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 480
LEI4 $4290
line 5195
;5195:		uiInfo.uiDC.cursory = SCREEN_HEIGHT;
ADDRGP4 uiInfo+220
CNSTI4 480
ASGNI4
LABELV $4290
LABELV $4287
line 5197
;5196:
;5197:  if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $4294
line 5200
;5198:    //menuDef_t *menu = Menu_GetFocused();
;5199:    //Menu_HandleMouseMove(menu, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
;5200:		Display_MouseMove(NULL, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
CNSTP4 0
ARGP4
ADDRGP4 uiInfo+216
INDIRI4
ARGI4
ADDRGP4 uiInfo+220
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 5201
;5201:  }
LABELV $4294
line 5203
;5202:
;5203:}
LABELV $4275
endproc _UI_MouseEvent 12 12
export UI_LoadNonIngame
proc UI_LoadNonIngame 12 8
line 5205
;5204:
;5205:void UI_LoadNonIngame() {
line 5206
;5206:	const char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $670
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 5207
;5207:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4301
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4299
LABELV $4301
line 5208
;5208:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $642
ASGNP4
line 5209
;5209:	}
LABELV $4299
line 5210
;5210:	UI_LoadMenus(menuSet, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 5211
;5211:	uiInfo.inGameLoad = qfalse;
ADDRGP4 uiInfo+136908
CNSTI4 0
ASGNI4
line 5212
;5212:}
LABELV $4298
endproc UI_LoadNonIngame 12 8
export _UI_SetActiveMenu
proc _UI_SetActiveMenu 292 12
line 5214
;5213:
;5214:void _UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 5219
;5215:	char buf[256];
;5216:
;5217:	// this should be the ONLY way the menu system is brought up
;5218:	// enusure minumum menu data is cached
;5219:  if (Menu_Count() > 0) {
ADDRLP4 256
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
LEI4 $4304
line 5221
;5220:		vec3_t v;
;5221:		v[0] = v[1] = v[2] = 0;
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 260+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 5222
;5222:	  switch ( menu ) {
ADDRLP4 276
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
LTI4 $4308
ADDRLP4 276
INDIRI4
CNSTI4 6
GTI4 $4308
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4332
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4332
address $4311
address $4312
address $4330
address $4303
address $4303
address $4322
address $4325
code
LABELV $4311
line 5224
;5223:	  case UIMENU_NONE:
;5224:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 284
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5225
;5225:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5226
;5226:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5227
;5227:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5229
;5228:
;5229:		  return;
ADDRGP4 $4303
JUMPV
LABELV $4312
line 5232
;5230:	  case UIMENU_MAIN:
;5231:			//trap_Cvar_Set( "sv_killserver", "1" );
;5232:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5235
;5233:			//trap_S_StartLocalSound( trap_S_RegisterSound("sound/misc/menu_background.wav", qfalse) , CHAN_LOCAL_SOUND );
;5234:			//trap_S_StartBackgroundTrack("sound/misc/menu_background.wav", NULL);
;5235:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+136908
INDIRI4
CNSTI4 0
EQI4 $4313
line 5236
;5236:				UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 5237
;5237:			}
LABELV $4313
line 5238
;5238:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5239
;5239:			Menus_ActivateByName("main");
ADDRGP4 $2519
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5240
;5240:			trap_Cvar_VariableStringBuffer("com_errorMessage", buf, sizeof(buf));
ADDRGP4 $2440
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5241
;5241:			if (strlen(buf)) {
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $4303
line 5242
;5242:				if (!ui_singlePlayerActive.integer) {
ADDRGP4 ui_singlePlayerActive+12
INDIRI4
CNSTI4 0
NEI4 $4318
line 5243
;5243:					Menus_ActivateByName("error_popmenu");
ADDRGP4 $4321
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5244
;5244:				} else {
ADDRGP4 $4303
JUMPV
LABELV $4318
line 5245
;5245:					trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2440
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5246
;5246:				}
line 5247
;5247:			}
line 5248
;5248:		  return;
ADDRGP4 $4303
JUMPV
LABELV $4322
line 5250
;5249:	  case UIMENU_TEAM:
;5250:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5251
;5251:      Menus_ActivateByName("team");
ADDRGP4 $2136
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5252
;5252:		  return;
ADDRGP4 $4303
JUMPV
line 5258
;5253:	  case UIMENU_NEED_CD:
;5254:			// no cd check in TA
;5255:			//trap_Key_SetCatcher( KEYCATCH_UI );
;5256:      //Menus_ActivateByName("needcd");
;5257:		  //UI_ConfirmMenu( "Insert the CD", NULL, NeedCDAction );
;5258:		  return;
line 5264
;5259:	  case UIMENU_BAD_CD_KEY:
;5260:			// no cd check in TA
;5261:			//trap_Key_SetCatcher( KEYCATCH_UI );
;5262:      //Menus_ActivateByName("badcd");
;5263:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;5264:		  return;
LABELV $4325
line 5267
;5265:	  case UIMENU_POSTGAME:
;5266:			//trap_Cvar_Set( "sv_killserver", "1" );
;5267:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5268
;5268:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+136908
INDIRI4
CNSTI4 0
EQI4 $4326
line 5269
;5269:				UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 5270
;5270:			}
LABELV $4326
line 5271
;5271:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5272
;5272:			Menus_ActivateByName("endofgame");
ADDRGP4 $4329
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5274
;5273:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;5274:		  return;
ADDRGP4 $4303
JUMPV
LABELV $4330
line 5276
;5275:	  case UIMENU_INGAME:
;5276:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2589
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5277
;5277:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5278
;5278:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5279
;5279:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5280
;5280:			Menus_ActivateByName("ingame");
ADDRGP4 $4331
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5281
;5281:		  return;
LABELV $4308
line 5283
;5282:	  }
;5283:  }
LABELV $4304
line 5284
;5284:}
LABELV $4303
endproc _UI_SetActiveMenu 292 12
export _UI_IsFullscreen
proc _UI_IsFullscreen 4 0
line 5286
;5285:
;5286:qboolean _UI_IsFullscreen( void ) {
line 5287
;5287:	return Menus_AnyFullScreenVisible();
ADDRLP4 0
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4333
endproc _UI_IsFullscreen 4 0
proc UI_ReadableSize 16 16
line 5296
;5288:}
;5289:
;5290:
;5291:
;5292:static connstate_t	lastConnState;
;5293:static char			lastLoadingText[MAX_INFO_VALUE];
;5294:
;5295:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;5296:{
line 5297
;5297:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $4335
line 5298
;5298:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $715
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5299
;5299:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4337
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5301
;5300:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;5301:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $4336
JUMPV
LABELV $4335
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $4338
line 5302
;5302:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $715
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5303
;5303:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4340
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5305
;5304:			(value % (1024*1024))*100 / (1024*1024) );
;5305:	} else if (value > 1024 ) { // kilos
ADDRGP4 $4339
JUMPV
LABELV $4338
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $4341
line 5306
;5306:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4343
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5307
;5307:	} else { // bytes
ADDRGP4 $4342
JUMPV
LABELV $4341
line 5308
;5308:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4344
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5309
;5309:	}
LABELV $4342
LABELV $4339
LABELV $4336
line 5310
;5310:}
LABELV $4334
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 5313
;5311:
;5312:// Assumes time is in msec
;5313:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 5314
;5314:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 5316
;5315:
;5316:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $4346
line 5317
;5317:		Com_sprintf( buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4348
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5318
;5318:	} else if (time > 60) { // mins
ADDRGP4 $4347
JUMPV
LABELV $4346
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $4349
line 5319
;5319:		Com_sprintf( buf, bufsize, "%d min %d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4351
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5320
;5320:	} else  { // secs
ADDRGP4 $4350
JUMPV
LABELV $4349
line 5321
;5321:		Com_sprintf( buf, bufsize, "%d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4352
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5322
;5322:	}
LABELV $4350
LABELV $4347
line 5323
;5323:}
LABELV $4345
endproc UI_PrintTime 8 20
export Text_PaintCenter
proc Text_PaintCenter 8 32
line 5325
;5324:
;5325:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust) {
line 5326
;5326:	int len = Text_Width(text, scale, 0);
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 5327
;5327:	Text_Paint(x - len / 2, y, scale, color, text, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 5328
;5328:}
LABELV $4353
endproc Text_PaintCenter 8 32
export Text_PaintCenter_AutoWrapped
proc Text_PaintCenter_AutoWrapped 1056 24
line 5330
;5329:
;5330:void Text_PaintCenter_AutoWrapped(float x, float y, float xmax, float ystep, float scale, vec4_t color, const char *str, float adjust) {
line 5336
;5331:	int width;
;5332:	char *s1,*s2,*s3;
;5333:	char c_bcp;
;5334:	char buf[1024];
;5335:
;5336:	if (!str || str[0]=='\0')
ADDRLP4 1044
ADDRFP4 24
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4357
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4355
LABELV $4357
line 5337
;5337:		return;
ADDRGP4 $4354
JUMPV
LABELV $4355
line 5339
;5338:
;5339:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 20
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5340
;5340:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRLP4 4
ADDRLP4 20
ASGNP4
ADDRLP4 12
ADDRLP4 20
ASGNP4
ADDRGP4 $4359
JUMPV
LABELV $4358
line 5342
;5341:
;5342:	while (1) {
LABELV $4361
line 5343
;5343:		do {
line 5344
;5344:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5345
;5345:		} while (*s3!=' ' && *s3!='\0');
LABELV $4362
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 32
EQI4 $4364
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $4361
LABELV $4364
line 5346
;5346:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 5347
;5347:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 5348
;5348:		width = Text_Width(s1, scale, 0);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1052
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1052
INDIRI4
ASGNI4
line 5349
;5349:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 5350
;5350:		if (width > xmax) {
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRFP4 8
INDIRF4
LEF4 $4365
line 5351
;5351:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $4367
line 5352
;5352:			{
line 5354
;5353:				// fuck, don't have a clean cut, we'll overflow
;5354:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5355
;5355:			}
LABELV $4367
line 5356
;5356:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 5357
;5357:			Text_PaintCenter(x, y, scale, color, s1, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5358
;5358:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 5359
;5359:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4369
line 5360
;5360:      {
line 5365
;5361:				// that was the last word
;5362:        // we could start a new loop, but that wouldn't be much use
;5363:        // even if the word is too long, we would overflow it (see above)
;5364:        // so just print it now if needed
;5365:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5366
;5366:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4360
line 5367
;5367:          Text_PaintCenter(x, y, scale, color, s2, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5368
;5368:        break;
ADDRGP4 $4360
JUMPV
LABELV $4369
line 5370
;5369:      }
;5370:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5371
;5371:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 5372
;5372:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 5373
;5373:		}
ADDRGP4 $4366
JUMPV
LABELV $4365
line 5375
;5374:		else
;5375:		{
line 5376
;5376:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5377
;5377:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4373
line 5378
;5378:			{
line 5379
;5379:				Text_PaintCenter(x, y, scale, color, s1, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5380
;5380:				break;
ADDRGP4 $4360
JUMPV
LABELV $4373
line 5382
;5381:			}
;5382:		}
LABELV $4366
line 5383
;5383:	}
LABELV $4359
line 5342
ADDRGP4 $4358
JUMPV
LABELV $4360
line 5384
;5384:}
LABELV $4354
endproc Text_PaintCenter_AutoWrapped 1056 24
data
align 1
LABELV $4376
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $4377
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $4378
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 312 24
line 5386
;5385:
;5386:static void UI_DisplayDownloadInfo( const char *downloadName, float centerPoint, float yStart, float scale ) {
line 5397
;5387:	static char dlText[]	= "Downloading:";
;5388:	static char etaText[]	= "Estimated time left:";
;5389:	static char xferText[]	= "Transfer rate:";
;5390:
;5391:	int downloadSize, downloadCount, downloadTime;
;5392:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;5393:	int xferRate;
;5394:	int leftWidth;
;5395:	const char *s;
;5396:
;5397:	downloadSize = trap_Cvar_VariableValue( "cl_downloadSize" );
ADDRGP4 $4379
ARGP4
ADDRLP4 280
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 280
INDIRF4
CVFI4 4
ASGNI4
line 5398
;5398:	downloadCount = trap_Cvar_VariableValue( "cl_downloadCount" );
ADDRGP4 $4380
ARGP4
ADDRLP4 284
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 284
INDIRF4
CVFI4 4
ASGNI4
line 5399
;5399:	downloadTime = trap_Cvar_VariableValue( "cl_downloadTime" );
ADDRGP4 $4381
ARGP4
ADDRLP4 288
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 140
ADDRLP4 288
INDIRF4
CVFI4 4
ASGNI4
line 5401
;5400:
;5401:	leftWidth = 320;
ADDRLP4 8
CNSTI4 320
ASGNI4
line 5403
;5402:
;5403:	UI_SetColor(colorWhite);
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 5404
;5404:	Text_PaintCenter(centerPoint, yStart + 112, scale, colorWhite, dlText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1121976320
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4376
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5405
;5405:	Text_PaintCenter(centerPoint, yStart + 192, scale, colorWhite, etaText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1128267776
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4377
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5406
;5406:	Text_PaintCenter(centerPoint, yStart + 248, scale, colorWhite, xferText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1131937792
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4378
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5408
;5407:
;5408:	if (downloadSize > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4382
line 5409
;5409:		s = va( "%s (%d%%)", downloadName, downloadCount * 100 / downloadSize );
ADDRGP4 $4384
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
DIVI4
ARGI4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 292
INDIRP4
ASGNP4
line 5410
;5410:	} else {
ADDRGP4 $4383
JUMPV
LABELV $4382
line 5411
;5411:		s = downloadName;
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
line 5412
;5412:	}
LABELV $4383
line 5414
;5413:
;5414:	Text_PaintCenter(centerPoint, yStart+136, scale, colorWhite, s, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1124597760
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5416
;5415:
;5416:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 12
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 5417
;5417:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 5419
;5418:
;5419:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 4
INDIRI4
CNSTI4 4096
LTI4 $4387
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $4385
LABELV $4387
line 5420
;5420:		Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4388
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5421
;5421:		Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $4389
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 292
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5422
;5422:	} else {
ADDRGP4 $4386
JUMPV
LABELV $4385
line 5423
;5423:		if ((uiInfo.uiDC.realTime - downloadTime) / 1000) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $4390
line 5424
;5424:			xferRate = downloadCount / ((uiInfo.uiDC.realTime - downloadTime) / 1000);
ADDRLP4 144
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 5425
;5425:		} else {
ADDRGP4 $4391
JUMPV
LABELV $4390
line 5426
;5426:			xferRate = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 5427
;5427:		}
LABELV $4391
line 5428
;5428:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 152
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 5431
;5429:
;5430:		// Extrapolate estimated completion time
;5431:		if (downloadSize && xferRate) {
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $4394
ADDRLP4 144
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $4394
line 5432
;5432:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 296
ADDRLP4 0
INDIRI4
ADDRLP4 144
INDIRI4
DIVI4
ASGNI4
line 5435
;5433:
;5434:			// We do it in K (/1024) because we'd overflow around 4MB
;5435:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, 
ADDRLP4 216
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 300
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 304
CNSTI4 1024
ASGNI4
CNSTI4 1000
ADDRLP4 300
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
ADDRLP4 300
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 5438
;5436:				(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;5437:
;5438:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, dlTimeBuf, 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 216
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5439
;5439:			Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $4389
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 308
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5440
;5440:		} else {
ADDRGP4 $4395
JUMPV
LABELV $4394
line 5441
;5441:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4388
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5442
;5442:			if (downloadSize) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4396
line 5443
;5443:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $4389
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5444
;5444:			} else {
ADDRGP4 $4397
JUMPV
LABELV $4396
line 5445
;5445:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s copied)", dlSizeBuf), 0);
ADDRGP4 $4398
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5446
;5446:			}
LABELV $4397
line 5447
;5447:		}
LABELV $4395
line 5449
;5448:
;5449:		if (xferRate) {
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $4399
line 5450
;5450:			Text_PaintCenter(leftWidth, yStart+272, scale, colorWhite, va("%s/Sec", xferRateBuf), 0);
ADDRGP4 $4401
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1132986368
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5451
;5451:		}
LABELV $4399
line 5452
;5452:	}
LABELV $4386
line 5453
;5453:}
LABELV $4375
endproc UI_DisplayDownloadInfo 312 24
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5440 32
line 5463
;5454:
;5455:/*
;5456:========================
;5457:UI_DrawConnectScreen
;5458:
;5459:This will also be overlaid on the cgame info screen during loading
;5460:to prevent it from blinking away too rapidly on local or lan games.
;5461:========================
;5462:*/
;5463:void UI_DrawConnectScreen( qboolean overlay ) {
line 5470
;5464:	char			*s;
;5465:	uiClientState_t	cstate;
;5466:	char			info[MAX_INFO_VALUE];
;5467:	char text[256];
;5468:	float centerPoint, yStart, scale;
;5469:	
;5470:	menuDef_t *menu = Menus_FindByName("Connect");
ADDRGP4 $4403
ARGP4
ADDRLP4 4384
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4384
INDIRP4
ASGNP4
line 5473
;5471:
;5472:
;5473:	if ( !overlay && menu ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4404
ADDRLP4 4120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4404
line 5474
;5474:		Menu_Paint(menu, qtrue);
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 5475
;5475:	}
LABELV $4404
line 5477
;5476:
;5477:	if (!overlay) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4406
line 5478
;5478:		centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 5479
;5479:		yStart = 130;
ADDRLP4 3092
CNSTF4 1124204544
ASGNF4
line 5480
;5480:		scale = 0.5f;
ADDRLP4 3088
CNSTF4 1056964608
ASGNF4
line 5481
;5481:	} else {
ADDRGP4 $4407
JUMPV
LABELV $4406
line 5482
;5482:		centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 5483
;5483:		yStart = 32;
ADDRLP4 3092
CNSTF4 1107296256
ASGNF4
line 5484
;5484:		scale = 0.6f;
ADDRLP4 3088
CNSTF4 1058642330
ASGNF4
line 5485
;5485:		return;
ADDRGP4 $4402
JUMPV
LABELV $4407
line 5489
;5486:	}
;5487:
;5488:	// see what information we should display
;5489:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 5491
;5490:
;5491:	info[0] = '\0';
ADDRLP4 3096
CNSTI1 0
ASGNI1
line 5492
;5492:	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
CNSTI4 0
ARGI4
ADDRLP4 3096
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4388
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4388
INDIRI4
CNSTI4 0
EQI4 $4408
line 5493
;5493:		Text_PaintCenter(centerPoint, yStart, scale, colorWhite, va( "Loading %s", Info_ValueForKey( info, "mapname" )), 0);
ADDRLP4 3096
ARGP4
ADDRGP4 $3088
ARGP4
ADDRLP4 4392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $4410
ARGP4
ADDRLP4 4392
INDIRP4
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5494
;5494:	}
LABELV $4408
line 5496
;5495:
;5496:	if (!Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4414
ARGP4
ADDRLP4 4392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4392
INDIRI4
CNSTI4 0
NEI4 $4411
line 5497
;5497:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite, va("Starting up..."), ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRGP4 $4415
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5498
;5498:	} else {
ADDRGP4 $4412
JUMPV
LABELV $4411
line 5499
;5499:		strcpy(text, va("Connecting to %s", cstate.servername));
ADDRGP4 $4416
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4124
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5500
;5500:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite,text , ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4124
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5501
;5501:	}
LABELV $4412
line 5504
;5502:
;5503:	// display global MOTD at bottom
;5504:	Text_PaintCenter(centerPoint, 600, scale, colorWhite, Info_ValueForKey( cstate.updateInfoString, "motd" ), 0);
ADDRLP4 0+1036
ARGP4
ADDRGP4 $4419
ARGP4
ADDRLP4 4396
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
CNSTF4 1142292480
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5506
;5505:	// print any server info (server full, bad version, etc)
;5506:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $4420
line 5507
;5507:		Text_PaintCenter_AutoWrapped(centerPoint, yStart + 176, 630, 20, scale, colorWhite, cstate.messageString, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1127219200
ADDF4
ARGF4
CNSTF4 1142784000
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0+2060
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter_AutoWrapped
CALLV
pop
line 5508
;5508:	}
LABELV $4420
line 5510
;5509:
;5510:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $4423
line 5511
;5511:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 5512
;5512:	}
LABELV $4423
line 5513
;5513:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 5515
;5514:
;5515:	switch ( cstate.connState ) {
ADDRLP4 4400
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4400
INDIRI4
CNSTI4 3
LTI4 $4402
ADDRLP4 4400
INDIRI4
CNSTI4 7
GTI4 $4402
ADDRLP4 4400
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4441-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4441
address $4428
address $4431
address $4434
address $4402
address $4402
code
LABELV $4428
line 5517
;5516:	case CA_CONNECTING:
;5517:		s = va("Awaiting connection...%i", cstate.connectPacketCount);
ADDRGP4 $4429
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4408
INDIRP4
ASGNP4
line 5518
;5518:		break;
ADDRGP4 $4426
JUMPV
LABELV $4431
line 5520
;5519:	case CA_CHALLENGING:
;5520:		s = va("Awaiting challenge...%i", cstate.connectPacketCount);
ADDRGP4 $4432
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4412
INDIRP4
ASGNP4
line 5521
;5521:		break;
ADDRGP4 $4426
JUMPV
LABELV $4434
line 5522
;5522:	case CA_CONNECTED: {
line 5525
;5523:		char downloadName[MAX_INFO_VALUE];
;5524:
;5525:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $4435
ARGP4
ADDRLP4 4416
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5526
;5526:			if (*downloadName) {
ADDRLP4 4416
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4436
line 5527
;5527:				UI_DisplayDownloadInfo( downloadName, centerPoint, yStart, scale );
ADDRLP4 4416
ARGP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 5528
;5528:				return;
ADDRGP4 $4402
JUMPV
LABELV $4436
line 5530
;5529:			}
;5530:		}
line 5531
;5531:		s = "Awaiting gamestate...";
ADDRLP4 4380
ADDRGP4 $4438
ASGNP4
line 5532
;5532:		break;
line 5534
;5533:	case CA_LOADING:
;5534:		return;
line 5536
;5535:	case CA_PRIMED:
;5536:		return;
line 5538
;5537:	default:
;5538:		return;
LABELV $4426
line 5542
;5539:	}
;5540:
;5541:
;5542:	if (Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4414
ARGP4
ADDRLP4 4408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4408
INDIRI4
CNSTI4 0
EQI4 $4443
line 5543
;5543:		Text_PaintCenter(centerPoint, yStart + 80, scale, colorWhite, s, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1117782016
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4380
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5544
;5544:	}
LABELV $4443
line 5547
;5545:
;5546:	// password required / connection rejected information goes here
;5547:}
LABELV $4402
endproc UI_DrawConnectScreen 5440 32
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $4447
address $693
byte 4 1
address ui_ffa_timelimit
address $4448
address $394
byte 4 1
address ui_tourney_fraglimit
address $4449
address $394
byte 4 1
address ui_tourney_timelimit
address $4450
address $694
byte 4 1
address ui_team_fraglimit
address $4451
address $394
byte 4 1
address ui_team_timelimit
address $4452
address $693
byte 4 1
address ui_team_friendly
address $4453
address $397
byte 4 1
address ui_ctf_capturelimit
address $4454
address $4455
byte 4 1
address ui_ctf_timelimit
address $4456
address $691
byte 4 1
address ui_ctf_friendly
address $4457
address $394
byte 4 1
address ui_arenasFile
address $4458
address $111
byte 4 80
address ui_botsFile
address $4459
address $111
byte 4 80
address ui_spScores1
address $4460
address $111
byte 4 65
address ui_spScores2
address $4461
address $111
byte 4 65
address ui_spScores3
address $4462
address $111
byte 4 65
address ui_spScores4
address $4463
address $111
byte 4 65
address ui_spScores5
address $4464
address $111
byte 4 65
address ui_spAwards
address $4465
address $111
byte 4 65
address ui_spVideos
address $4466
address $111
byte 4 65
address ui_spSkill
address $826
address $2238
byte 4 1
address ui_spSelection
address $4467
address $111
byte 4 64
address ui_browserMaster
address $4468
address $394
byte 4 1
address ui_browserGameType
address $4469
address $394
byte 4 1
address ui_browserSortKey
address $4470
address $2773
byte 4 1
address ui_browserShowFull
address $4471
address $397
byte 4 1
address ui_browserShowEmpty
address $4472
address $397
byte 4 1
address ui_brassTime
address $2331
address $4473
byte 4 1
address ui_drawCrosshair
address $2051
address $2773
byte 4 1
address ui_drawCrosshairNames
address $4474
address $397
byte 4 1
address ui_marks
address $4475
address $397
byte 4 1
address ui_server1
address $4476
address $111
byte 4 1
address ui_server2
address $4477
address $111
byte 4 1
address ui_server3
address $4478
address $111
byte 4 1
address ui_server4
address $4479
address $111
byte 4 1
address ui_server5
address $4480
address $111
byte 4 1
address ui_server6
address $4481
address $111
byte 4 1
address ui_server7
address $4482
address $111
byte 4 1
address ui_server8
address $4483
address $111
byte 4 1
address ui_server9
address $4484
address $111
byte 4 1
address ui_server10
address $4485
address $111
byte 4 1
address ui_server11
address $4486
address $111
byte 4 1
address ui_server12
address $4487
address $111
byte 4 1
address ui_server13
address $4488
address $111
byte 4 1
address ui_server14
address $4489
address $111
byte 4 1
address ui_server15
address $4490
address $111
byte 4 1
address ui_server16
address $4491
address $111
byte 4 1
address ui_cdkeychecked
address $4492
address $394
byte 4 64
address ui_new
address $4493
address $394
byte 4 256
address ui_debug
address $4494
address $394
byte 4 256
address ui_initialized
address $4495
address $394
byte 4 256
address ui_teamName
address $700
address $4496
byte 4 1
address ui_opponentName
address $1101
address $4497
byte 4 1
address ui_redteam
address $4498
address $4496
byte 4 1
address ui_blueteam
address $4499
address $4497
byte 4 1
address ui_dedicated
address $4500
address $394
byte 4 1
address ui_gameType
address $4501
address $4502
byte 4 1
address ui_joinGameType
address $4503
address $394
byte 4 1
address ui_netGameType
address $4504
address $4502
byte 4 1
address ui_actualNetGameType
address $4505
address $4502
byte 4 1
address ui_redteam1
address $4506
address $394
byte 4 1
address ui_redteam2
address $4507
address $394
byte 4 1
address ui_redteam3
address $4508
address $394
byte 4 1
address ui_redteam4
address $4509
address $394
byte 4 1
address ui_redteam5
address $4510
address $394
byte 4 1
address ui_blueteam1
address $4511
address $394
byte 4 1
address ui_blueteam2
address $4512
address $394
byte 4 1
address ui_blueteam3
address $4513
address $394
byte 4 1
address ui_blueteam4
address $4514
address $394
byte 4 1
address ui_blueteam5
address $4515
address $394
byte 4 1
address ui_netSource
address $1958
address $394
byte 4 1
address ui_menuFiles
address $670
address $642
byte 4 1
address ui_currentTier
address $1023
address $394
byte 4 1
address ui_currentMap
address $890
address $394
byte 4 1
address ui_currentNetMap
address $888
address $394
byte 4 1
address ui_mapIndex
address $2198
address $394
byte 4 1
address ui_currentOpponent
address $4516
address $394
byte 4 1
address ui_selectedPlayer
address $1393
address $394
byte 4 1
address ui_selectedPlayerName
address $1401
address $111
byte 4 1
address ui_lastServerRefresh_0
address $4517
address $111
byte 4 1
address ui_lastServerRefresh_1
address $4518
address $111
byte 4 1
address ui_lastServerRefresh_2
address $4519
address $111
byte 4 1
address ui_lastServerRefresh_3
address $4520
address $111
byte 4 1
address ui_singlePlayerActive
address $2211
address $394
byte 4 0
address ui_scoreAccuracy
address $4521
address $394
byte 4 1
address ui_scoreImpressives
address $4522
address $394
byte 4 1
address ui_scoreExcellents
address $4523
address $394
byte 4 1
address ui_scoreCaptures
address $4524
address $394
byte 4 1
address ui_scoreDefends
address $4525
address $394
byte 4 1
address ui_scoreAssists
address $4526
address $394
byte 4 1
address ui_scoreGauntlets
address $4527
address $394
byte 4 1
address ui_scoreScore
address $4528
address $394
byte 4 1
address ui_scorePerfect
address $4529
address $394
byte 4 1
address ui_scoreTeam
address $4530
address $4531
byte 4 1
address ui_scoreBase
address $4532
address $394
byte 4 1
address ui_scoreTime
address $4533
address $4534
byte 4 1
address ui_scoreTimeBonus
address $4535
address $394
byte 4 1
address ui_scoreSkillBonus
address $4536
address $394
byte 4 1
address ui_scoreShutoutBonus
address $4537
address $394
byte 4 1
address ui_fragLimit
address $716
address $695
byte 4 0
address ui_captureLimit
address $714
address $696
byte 4 0
address ui_smallFont
address $4538
address $4539
byte 4 1
address ui_bigFont
address $4540
address $4541
byte 4 1
address ui_findPlayer
address $3176
address $4542
byte 4 1
address ui_Q3Model
address $4543
address $394
byte 4 1
address ui_hudFiles
address $4544
address $4545
byte 4 1
address ui_recordSPDemo
address $2230
address $394
byte 4 1
address ui_teamArenaFirstRun
address $4546
address $394
byte 4 1
address ui_realWarmUp
address $2222
address $693
byte 4 1
address ui_realCaptureLimit
address $717
address $4455
byte 4 1029
address ui_serverStatusTimeOut
address $4547
address $4548
byte 4 1
align 4
LABELV cvarTableSize
byte 4 110
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 5815
;5548:
;5549:
;5550:/*
;5551:================
;5552:cvars
;5553:================
;5554:*/
;5555:
;5556:typedef struct {
;5557:	vmCvar_t	*vmCvar;
;5558:	char		*cvarName;
;5559:	char		*defaultString;
;5560:	int			cvarFlags;
;5561:} cvarTable_t;
;5562:
;5563:vmCvar_t	ui_ffa_fraglimit;
;5564:vmCvar_t	ui_ffa_timelimit;
;5565:
;5566:vmCvar_t	ui_tourney_fraglimit;
;5567:vmCvar_t	ui_tourney_timelimit;
;5568:
;5569:vmCvar_t	ui_team_fraglimit;
;5570:vmCvar_t	ui_team_timelimit;
;5571:vmCvar_t	ui_team_friendly;
;5572:
;5573:vmCvar_t	ui_ctf_capturelimit;
;5574:vmCvar_t	ui_ctf_timelimit;
;5575:vmCvar_t	ui_ctf_friendly;
;5576:
;5577:vmCvar_t	ui_arenasFile;
;5578:vmCvar_t	ui_botsFile;
;5579:vmCvar_t	ui_spScores1;
;5580:vmCvar_t	ui_spScores2;
;5581:vmCvar_t	ui_spScores3;
;5582:vmCvar_t	ui_spScores4;
;5583:vmCvar_t	ui_spScores5;
;5584:vmCvar_t	ui_spAwards;
;5585:vmCvar_t	ui_spVideos;
;5586:vmCvar_t	ui_spSkill;
;5587:
;5588:vmCvar_t	ui_spSelection;
;5589:
;5590:vmCvar_t	ui_browserMaster;
;5591:vmCvar_t	ui_browserGameType;
;5592:vmCvar_t	ui_browserSortKey;
;5593:vmCvar_t	ui_browserShowFull;
;5594:vmCvar_t	ui_browserShowEmpty;
;5595:vmCvar_t	ui_browserMasterNum;
;5596:
;5597:vmCvar_t	ui_brassTime;
;5598:vmCvar_t	ui_drawCrosshair;
;5599:vmCvar_t	ui_drawCrosshairNames;
;5600:vmCvar_t	ui_marks;
;5601:
;5602:vmCvar_t	ui_server1;
;5603:vmCvar_t	ui_server2;
;5604:vmCvar_t	ui_server3;
;5605:vmCvar_t	ui_server4;
;5606:vmCvar_t	ui_server5;
;5607:vmCvar_t	ui_server6;
;5608:vmCvar_t	ui_server7;
;5609:vmCvar_t	ui_server8;
;5610:vmCvar_t	ui_server9;
;5611:vmCvar_t	ui_server10;
;5612:vmCvar_t	ui_server11;
;5613:vmCvar_t	ui_server12;
;5614:vmCvar_t	ui_server13;
;5615:vmCvar_t	ui_server14;
;5616:vmCvar_t	ui_server15;
;5617:vmCvar_t	ui_server16;
;5618:
;5619:vmCvar_t	ui_cdkeychecked;
;5620:
;5621:vmCvar_t	ui_redteam;
;5622:vmCvar_t	ui_redteam1;
;5623:vmCvar_t	ui_redteam2;
;5624:vmCvar_t	ui_redteam3;
;5625:vmCvar_t	ui_redteam4;
;5626:vmCvar_t	ui_redteam5;
;5627:vmCvar_t	ui_blueteam;
;5628:vmCvar_t	ui_blueteam1;
;5629:vmCvar_t	ui_blueteam2;
;5630:vmCvar_t	ui_blueteam3;
;5631:vmCvar_t	ui_blueteam4;
;5632:vmCvar_t	ui_blueteam5;
;5633:vmCvar_t	ui_teamName;
;5634:vmCvar_t	ui_dedicated;
;5635:vmCvar_t	ui_gameType;
;5636:vmCvar_t	ui_netGameType;
;5637:vmCvar_t	ui_actualNetGameType;
;5638:vmCvar_t	ui_joinGameType;
;5639:vmCvar_t	ui_netSource;
;5640:vmCvar_t	ui_serverFilterType;
;5641:vmCvar_t	ui_opponentName;
;5642:vmCvar_t	ui_menuFiles;
;5643:vmCvar_t	ui_currentTier;
;5644:vmCvar_t	ui_currentMap;
;5645:vmCvar_t	ui_currentNetMap;
;5646:vmCvar_t	ui_mapIndex;
;5647:vmCvar_t	ui_currentOpponent;
;5648:vmCvar_t	ui_selectedPlayer;
;5649:vmCvar_t	ui_selectedPlayerName;
;5650:vmCvar_t	ui_lastServerRefresh_0;
;5651:vmCvar_t	ui_lastServerRefresh_1;
;5652:vmCvar_t	ui_lastServerRefresh_2;
;5653:vmCvar_t	ui_lastServerRefresh_3;
;5654:vmCvar_t	ui_singlePlayerActive;
;5655:vmCvar_t	ui_scoreAccuracy;
;5656:vmCvar_t	ui_scoreImpressives;
;5657:vmCvar_t	ui_scoreExcellents;
;5658:vmCvar_t	ui_scoreCaptures;
;5659:vmCvar_t	ui_scoreDefends;
;5660:vmCvar_t	ui_scoreAssists;
;5661:vmCvar_t	ui_scoreGauntlets;
;5662:vmCvar_t	ui_scoreScore;
;5663:vmCvar_t	ui_scorePerfect;
;5664:vmCvar_t	ui_scoreTeam;
;5665:vmCvar_t	ui_scoreBase;
;5666:vmCvar_t	ui_scoreTimeBonus;
;5667:vmCvar_t	ui_scoreSkillBonus;
;5668:vmCvar_t	ui_scoreShutoutBonus;
;5669:vmCvar_t	ui_scoreTime;
;5670:vmCvar_t	ui_captureLimit;
;5671:vmCvar_t	ui_fragLimit;
;5672:vmCvar_t	ui_smallFont;
;5673:vmCvar_t	ui_bigFont;
;5674:vmCvar_t	ui_findPlayer;
;5675:vmCvar_t	ui_Q3Model;
;5676:vmCvar_t	ui_hudFiles;
;5677:vmCvar_t	ui_recordSPDemo;
;5678:vmCvar_t	ui_realCaptureLimit;
;5679:vmCvar_t	ui_realWarmUp;
;5680:vmCvar_t	ui_serverStatusTimeOut;
;5681:
;5682:
;5683:// bk001129 - made static to avoid aliasing
;5684:static cvarTable_t		cvarTable[] = {
;5685:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;5686:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;5687:
;5688:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;5689:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;5690:
;5691:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;5692:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;5693:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;5694:
;5695:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;5696:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;5697:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;5698:
;5699:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;5700:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;5701:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;5702:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;5703:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;5704:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;5705:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;5706:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;5707:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;5708:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE },
;5709:
;5710:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;5711:
;5712:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;5713:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;5714:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;5715:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;5716:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;5717:
;5718:	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;5719:	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;5720:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;5721:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;5722:
;5723:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;5724:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;5725:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;5726:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;5727:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;5728:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;5729:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;5730:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;5731:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;5732:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;5733:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;5734:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;5735:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;5736:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;5737:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;5738:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;5739:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;5740:	{ &ui_new, "ui_new", "0", CVAR_TEMP },
;5741:	{ &ui_debug, "ui_debug", "0", CVAR_TEMP },
;5742:	{ &ui_initialized, "ui_initialized", "0", CVAR_TEMP },
;5743:	{ &ui_teamName, "ui_teamName", "Pagans", CVAR_ARCHIVE },
;5744:	{ &ui_opponentName, "ui_opponentName", "Stroggs", CVAR_ARCHIVE },
;5745:	{ &ui_redteam, "ui_redteam", "Pagans", CVAR_ARCHIVE },
;5746:	{ &ui_blueteam, "ui_blueteam", "Stroggs", CVAR_ARCHIVE },
;5747:	{ &ui_dedicated, "ui_dedicated", "0", CVAR_ARCHIVE },
;5748:	{ &ui_gameType, "ui_gametype", "3", CVAR_ARCHIVE },
;5749:	{ &ui_joinGameType, "ui_joinGametype", "0", CVAR_ARCHIVE },
;5750:	{ &ui_netGameType, "ui_netGametype", "3", CVAR_ARCHIVE },
;5751:	{ &ui_actualNetGameType, "ui_actualNetGametype", "3", CVAR_ARCHIVE },
;5752:	{ &ui_redteam1, "ui_redteam1", "0", CVAR_ARCHIVE },
;5753:	{ &ui_redteam2, "ui_redteam2", "0", CVAR_ARCHIVE },
;5754:	{ &ui_redteam3, "ui_redteam3", "0", CVAR_ARCHIVE },
;5755:	{ &ui_redteam4, "ui_redteam4", "0", CVAR_ARCHIVE },
;5756:	{ &ui_redteam5, "ui_redteam5", "0", CVAR_ARCHIVE },
;5757:	{ &ui_blueteam1, "ui_blueteam1", "0", CVAR_ARCHIVE },
;5758:	{ &ui_blueteam2, "ui_blueteam2", "0", CVAR_ARCHIVE },
;5759:	{ &ui_blueteam3, "ui_blueteam3", "0", CVAR_ARCHIVE },
;5760:	{ &ui_blueteam4, "ui_blueteam4", "0", CVAR_ARCHIVE },
;5761:	{ &ui_blueteam5, "ui_blueteam5", "0", CVAR_ARCHIVE },
;5762:	{ &ui_netSource, "ui_netSource", "0", CVAR_ARCHIVE },
;5763:	{ &ui_menuFiles, "ui_menuFiles", "ui/menus.txt", CVAR_ARCHIVE },
;5764:	{ &ui_currentTier, "ui_currentTier", "0", CVAR_ARCHIVE },
;5765:	{ &ui_currentMap, "ui_currentMap", "0", CVAR_ARCHIVE },
;5766:	{ &ui_currentNetMap, "ui_currentNetMap", "0", CVAR_ARCHIVE },
;5767:	{ &ui_mapIndex, "ui_mapIndex", "0", CVAR_ARCHIVE },
;5768:	{ &ui_currentOpponent, "ui_currentOpponent", "0", CVAR_ARCHIVE },
;5769:	{ &ui_selectedPlayer, "cg_selectedPlayer", "0", CVAR_ARCHIVE},
;5770:	{ &ui_selectedPlayerName, "cg_selectedPlayerName", "", CVAR_ARCHIVE},
;5771:	{ &ui_lastServerRefresh_0, "ui_lastServerRefresh_0", "", CVAR_ARCHIVE},
;5772:	{ &ui_lastServerRefresh_1, "ui_lastServerRefresh_1", "", CVAR_ARCHIVE},
;5773:	{ &ui_lastServerRefresh_2, "ui_lastServerRefresh_2", "", CVAR_ARCHIVE},
;5774:	{ &ui_lastServerRefresh_3, "ui_lastServerRefresh_3", "", CVAR_ARCHIVE},
;5775:	{ &ui_singlePlayerActive, "ui_singlePlayerActive", "0", 0},
;5776:	{ &ui_scoreAccuracy, "ui_scoreAccuracy", "0", CVAR_ARCHIVE},
;5777:	{ &ui_scoreImpressives, "ui_scoreImpressives", "0", CVAR_ARCHIVE},
;5778:	{ &ui_scoreExcellents, "ui_scoreExcellents", "0", CVAR_ARCHIVE},
;5779:	{ &ui_scoreCaptures, "ui_scoreCaptures", "0", CVAR_ARCHIVE},
;5780:	{ &ui_scoreDefends, "ui_scoreDefends", "0", CVAR_ARCHIVE},
;5781:	{ &ui_scoreAssists, "ui_scoreAssists", "0", CVAR_ARCHIVE},
;5782:	{ &ui_scoreGauntlets, "ui_scoreGauntlets", "0",CVAR_ARCHIVE},
;5783:	{ &ui_scoreScore, "ui_scoreScore", "0", CVAR_ARCHIVE},
;5784:	{ &ui_scorePerfect, "ui_scorePerfect", "0", CVAR_ARCHIVE},
;5785:	{ &ui_scoreTeam, "ui_scoreTeam", "0 to 0", CVAR_ARCHIVE},
;5786:	{ &ui_scoreBase, "ui_scoreBase", "0", CVAR_ARCHIVE},
;5787:	{ &ui_scoreTime, "ui_scoreTime", "00:00", CVAR_ARCHIVE},
;5788:	{ &ui_scoreTimeBonus, "ui_scoreTimeBonus", "0", CVAR_ARCHIVE},
;5789:	{ &ui_scoreSkillBonus, "ui_scoreSkillBonus", "0", CVAR_ARCHIVE},
;5790:	{ &ui_scoreShutoutBonus, "ui_scoreShutoutBonus", "0", CVAR_ARCHIVE},
;5791:	{ &ui_fragLimit, "ui_fragLimit", "10", 0},
;5792:	{ &ui_captureLimit, "ui_captureLimit", "5", 0},
;5793:	{ &ui_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;5794:	{ &ui_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;5795:	{ &ui_findPlayer, "ui_findPlayer", "Sarge", CVAR_ARCHIVE},
;5796:	{ &ui_Q3Model, "ui_q3model", "0", CVAR_ARCHIVE},
;5797:	{ &ui_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;5798:	{ &ui_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;5799:	{ &ui_teamArenaFirstRun, "ui_teamArenaFirstRun", "0", CVAR_ARCHIVE},
;5800:	{ &ui_realWarmUp, "g_warmup", "20", CVAR_ARCHIVE},
;5801:	{ &ui_realCaptureLimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART},
;5802:	{ &ui_serverStatusTimeOut, "ui_serverStatusTimeOut", "7000", CVAR_ARCHIVE},
;5803:
;5804:};
;5805:
;5806:// bk001129 - made static to avoid aliasing
;5807:static int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;5808:
;5809:
;5810:/*
;5811:=================
;5812:UI_RegisterCvars
;5813:=================
;5814:*/
;5815:void UI_RegisterCvars( void ) {
line 5819
;5816:	int			i;
;5817:	cvarTable_t	*cv;
;5818:
;5819:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4553
JUMPV
LABELV $4550
line 5820
;5820:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5821
;5821:	}
LABELV $4551
line 5819
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4553
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4550
line 5822
;5822:}
LABELV $4549
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 5829
;5823:
;5824:/*
;5825:=================
;5826:UI_UpdateCvars
;5827:=================
;5828:*/
;5829:void UI_UpdateCvars( void ) {
line 5833
;5830:	int			i;
;5831:	cvarTable_t	*cv;
;5832:
;5833:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4558
JUMPV
LABELV $4555
line 5834
;5834:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5835
;5835:	}
LABELV $4556
line 5833
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4558
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4555
line 5836
;5836:}
LABELV $4554
endproc UI_UpdateCvars 8 4
proc UI_StopServerRefresh 12 12
line 5845
;5837:
;5838:
;5839:/*
;5840:=================
;5841:ArenaServers_StopRefresh
;5842:=================
;5843:*/
;5844:static void UI_StopServerRefresh( void )
;5845:{
line 5848
;5846:	int count;
;5847:
;5848:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
NEI4 $4560
line 5850
;5849:		// not currently refreshing
;5850:		return;
ADDRGP4 $4559
JUMPV
LABELV $4560
line 5852
;5851:	}
;5852:	uiInfo.serverStatus.refreshActive = qfalse;
ADDRGP4 uiInfo+99264+2212
CNSTI4 0
ASGNI4
line 5853
;5853:	Com_Printf("%d servers listed in browser with %d players.\n",
ADDRGP4 $4566
ARGP4
ADDRGP4 uiInfo+99264+10412
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+10416
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 5856
;5854:					uiInfo.serverStatus.numDisplayServers,
;5855:					uiInfo.serverStatus.numPlayersOnServers);
;5856:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 5857
;5857:	if (count - uiInfo.serverStatus.numDisplayServers > 0) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
SUBI4
CNSTI4 0
LEI4 $4572
line 5858
;5858:		Com_Printf("%d servers not listed due to packet loss or pings higher than %d\n",
ADDRGP4 $4579
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4576
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 5861
;5859:						count - uiInfo.serverStatus.numDisplayServers,
;5860:						(int) trap_Cvar_VariableValue("cl_maxPing"));
;5861:	}
LABELV $4572
line 5863
;5862:
;5863:}
LABELV $4559
endproc UI_StopServerRefresh 12 12
proc UI_DoServerRefresh 8 4
line 5888
;5864:
;5865:/*
;5866:=================
;5867:ArenaServers_MaxPing
;5868:=================
;5869:*/
;5870:#ifndef MISSIONPACK // bk001206
;5871:static int ArenaServers_MaxPing( void ) {
;5872:	int		maxPing;
;5873:
;5874:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
;5875:	if( maxPing < 100 ) {
;5876:		maxPing = 100;
;5877:	}
;5878:	return maxPing;
;5879:}
;5880:#endif
;5881:
;5882:/*
;5883:=================
;5884:UI_DoServerRefresh
;5885:=================
;5886:*/
;5887:static void UI_DoServerRefresh( void )
;5888:{
line 5889
;5889:	qboolean wait = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5891
;5890:
;5891:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
NEI4 $4581
line 5892
;5892:		return;
ADDRGP4 $4580
JUMPV
LABELV $4581
line 5894
;5893:	}
;5894:	if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $4585
line 5895
;5895:		if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4588
line 5896
;5896:			if (!trap_LAN_GetServerCount(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $4589
line 5897
;5897:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 5898
;5898:			}
line 5899
;5899:		} else {
ADDRGP4 $4589
JUMPV
LABELV $4588
line 5900
;5900:			if (trap_LAN_GetServerCount(ui_netSource.integer) < 0) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $4594
line 5901
;5901:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 5902
;5902:			}
LABELV $4594
line 5903
;5903:		}
LABELV $4589
line 5904
;5904:	}
LABELV $4585
line 5906
;5905:
;5906:	if (uiInfo.uiDC.realTime < uiInfo.serverStatus.refreshtime) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+99264+2192
INDIRI4
GEI4 $4597
line 5907
;5907:		if (wait) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4602
line 5908
;5908:			return;
ADDRGP4 $4580
JUMPV
LABELV $4602
line 5910
;5909:		}
;5910:	}
LABELV $4597
line 5913
;5911:
;5912:	// if still trying to retrieve pings
;5913:	if (trap_LAN_UpdateVisiblePings(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_UpdateVisiblePings
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4604
line 5914
;5914:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5915
;5915:	} else if (!wait) {
ADDRGP4 $4605
JUMPV
LABELV $4604
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $4610
line 5917
;5916:		// get the last servers in the list
;5917:		UI_BuildServerDisplayList(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5919
;5918:		// stop the refresh
;5919:		UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 5920
;5920:	}
LABELV $4610
LABELV $4605
line 5922
;5921:	//
;5922:	UI_BuildServerDisplayList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5923
;5923:}
LABELV $4580
endproc UI_DoServerRefresh 8 4
proc UI_StartServerRefresh 68 24
line 5931
;5924:
;5925:/*
;5926:=================
;5927:UI_StartServerRefresh
;5928:=================
;5929:*/
;5930:static void UI_StartServerRefresh(qboolean full)
;5931:{
line 5936
;5932:	int		i;
;5933:	char	*ptr;
;5934:
;5935:	qtime_t q;
;5936:	trap_RealTime(&q);
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 5937
;5937: 	trap_Cvar_Set( va("ui_lastServerRefresh_%i", ui_netSource.integer), va("%s-%i, %i at %i:%i", MonthAbbrev[q.tm_mon],q.tm_mday, 1900+q.tm_year,q.tm_hour,q.tm_min));
ADDRGP4 $1316
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4614
ARGP4
ADDRLP4 0+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MonthAbbrev
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5939
;5938:
;5939:	if (!full) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4620
line 5940
;5940:		UI_UpdatePendingPings();
ADDRGP4 UI_UpdatePendingPings
CALLV
pop
line 5941
;5941:		return;
ADDRGP4 $4612
JUMPV
LABELV $4620
line 5944
;5942:	}
;5943:
;5944:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+99264+2212
CNSTI4 1
ASGNI4
line 5945
;5945:	uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+10420
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5947
;5946:	// clear number of displayed servers
;5947:	uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99264+10412
CNSTI4 0
ASGNI4
line 5948
;5948:	uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99264+10416
CNSTI4 0
ASGNI4
line 5950
;5949:	// mark all servers as visible so we store ping updates for them
;5950:	trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5952
;5951:	// reset all the pings
;5952:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 5954
;5953:	//
;5954:	if( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4633
line 5955
;5955:		trap_Cmd_ExecuteText( EXEC_NOW, "localservers\n" );
CNSTI4 0
ARGI4
ADDRGP4 $4636
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5956
;5956:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5957
;5957:		return;
ADDRGP4 $4612
JUMPV
LABELV $4633
line 5960
;5958:	}
;5959:
;5960:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 5000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 5961
;5961:	if( ui_netSource.integer == AS_GLOBAL || ui_netSource.integer == AS_MPLAYER ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $4647
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $4643
LABELV $4647
line 5964
;5962:		
;5963:		// Shafe Trep Here is where to define the master server to use i should be 0-5
;5964:		if( ui_netSource.integer == AS_GLOBAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $4648
line 5965
;5965:			i = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 5966
;5966:		}
ADDRGP4 $4649
JUMPV
LABELV $4648
line 5967
;5967:		else {
line 5968
;5968:			i = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 5969
;5969:		}
LABELV $4649
line 5972
;5970:
;5971:
;5972:		ptr = UI_Cvar_VariableString("debug_protocol");
ADDRGP4 $4266
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 52
INDIRP4
ASGNP4
line 5973
;5973:		if (strlen(ptr)) {
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $4651
line 5974
;5974:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %s full empty\n", i, ptr));
ADDRGP4 $4653
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5975
;5975:		}
ADDRGP4 $4652
JUMPV
LABELV $4651
line 5976
;5976:		else {
line 5977
;5977:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %d full empty\n", i, (int)trap_Cvar_VariableValue( "protocol" ) ) );
ADDRGP4 $2165
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4654
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5978
;5978:		}
LABELV $4652
line 5979
;5979:	}
LABELV $4643
line 5980
;5980:}
LABELV $4612
endproc UI_StartServerRefresh 68 24
bss
export ui_realWarmUp
align 4
LABELV ui_realWarmUp
skip 272
export ui_realCaptureLimit
align 4
LABELV ui_realCaptureLimit
skip 272
export ui_recordSPDemo
align 4
LABELV ui_recordSPDemo
skip 272
export ui_hudFiles
align 4
LABELV ui_hudFiles
skip 272
export ui_Q3Model
align 4
LABELV ui_Q3Model
skip 272
export ui_findPlayer
align 4
LABELV ui_findPlayer
skip 272
export ui_scoreCaptures
align 4
LABELV ui_scoreCaptures
skip 272
export ui_teamName
align 4
LABELV ui_teamName
skip 272
export ui_blueteam5
align 4
LABELV ui_blueteam5
skip 272
export ui_blueteam4
align 4
LABELV ui_blueteam4
skip 272
export ui_blueteam3
align 4
LABELV ui_blueteam3
skip 272
export ui_blueteam2
align 4
LABELV ui_blueteam2
skip 272
export ui_blueteam1
align 4
LABELV ui_blueteam1
skip 272
export ui_blueteam
align 4
LABELV ui_blueteam
skip 272
export ui_redteam5
align 4
LABELV ui_redteam5
skip 272
export ui_redteam4
align 4
LABELV ui_redteam4
skip 272
export ui_redteam3
align 4
LABELV ui_redteam3
skip 272
export ui_redteam2
align 4
LABELV ui_redteam2
skip 272
export ui_redteam1
align 4
LABELV ui_redteam1
skip 272
export ui_redteam
align 4
LABELV ui_redteam
skip 272
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
export startTime
align 4
LABELV startTime
skip 4
export ui_teamArenaFirstRun
align 4
LABELV ui_teamArenaFirstRun
skip 272
export ui_initialized
align 4
LABELV ui_initialized
skip 272
export ui_debug
align 4
LABELV ui_debug
skip 272
export ui_new
align 4
LABELV ui_new
skip 272
import ProcessNewUI
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
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
import UI_GetBotNameByNumber
import UI_LoadBots
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
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
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
import trap_R_ModelBounds
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
import UI_LoadBestScores
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
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
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
export uiInfo
align 4
LABELV uiInfo
skip 136912
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
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_AdjustTimeByGame
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
export ui_serverStatusTimeOut
align 4
LABELV ui_serverStatusTimeOut
skip 272
export ui_bigFont
align 4
LABELV ui_bigFont
skip 272
export ui_smallFont
align 4
LABELV ui_smallFont
skip 272
export ui_scoreTime
align 4
LABELV ui_scoreTime
skip 272
export ui_scoreShutoutBonus
align 4
LABELV ui_scoreShutoutBonus
skip 272
export ui_scoreSkillBonus
align 4
LABELV ui_scoreSkillBonus
skip 272
export ui_scoreTimeBonus
align 4
LABELV ui_scoreTimeBonus
skip 272
export ui_scoreBase
align 4
LABELV ui_scoreBase
skip 272
export ui_scoreTeam
align 4
LABELV ui_scoreTeam
skip 272
export ui_scorePerfect
align 4
LABELV ui_scorePerfect
skip 272
export ui_scoreScore
align 4
LABELV ui_scoreScore
skip 272
export ui_scoreGauntlets
align 4
LABELV ui_scoreGauntlets
skip 272
export ui_scoreAssists
align 4
LABELV ui_scoreAssists
skip 272
export ui_scoreDefends
align 4
LABELV ui_scoreDefends
skip 272
export ui_scoreExcellents
align 4
LABELV ui_scoreExcellents
skip 272
export ui_scoreImpressives
align 4
LABELV ui_scoreImpressives
skip 272
export ui_scoreAccuracy
align 4
LABELV ui_scoreAccuracy
skip 272
export ui_singlePlayerActive
align 4
LABELV ui_singlePlayerActive
skip 272
export ui_lastServerRefresh_3
align 4
LABELV ui_lastServerRefresh_3
skip 272
export ui_lastServerRefresh_2
align 4
LABELV ui_lastServerRefresh_2
skip 272
export ui_lastServerRefresh_1
align 4
LABELV ui_lastServerRefresh_1
skip 272
export ui_lastServerRefresh_0
align 4
LABELV ui_lastServerRefresh_0
skip 272
export ui_selectedPlayerName
align 4
LABELV ui_selectedPlayerName
skip 272
export ui_selectedPlayer
align 4
LABELV ui_selectedPlayer
skip 272
export ui_currentOpponent
align 4
LABELV ui_currentOpponent
skip 272
export ui_mapIndex
align 4
LABELV ui_mapIndex
skip 272
export ui_currentNetMap
align 4
LABELV ui_currentNetMap
skip 272
export ui_currentMap
align 4
LABELV ui_currentMap
skip 272
export ui_currentTier
align 4
LABELV ui_currentTier
skip 272
export ui_menuFiles
align 4
LABELV ui_menuFiles
skip 272
export ui_opponentName
align 4
LABELV ui_opponentName
skip 272
export ui_dedicated
align 4
LABELV ui_dedicated
skip 272
export ui_serverFilterType
align 4
LABELV ui_serverFilterType
skip 272
export ui_netSource
align 4
LABELV ui_netSource
skip 272
export ui_joinGameType
align 4
LABELV ui_joinGameType
skip 272
export ui_actualNetGameType
align 4
LABELV ui_actualNetGameType
skip 272
export ui_netGameType
align 4
LABELV ui_netGameType
skip 272
export ui_gameType
align 4
LABELV ui_gameType
skip 272
export ui_fragLimit
align 4
LABELV ui_fragLimit
skip 272
export ui_captureLimit
align 4
LABELV ui_captureLimit
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserMasterNum
align 4
LABELV ui_browserMasterNum
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
LABELV $4654
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $4653
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $4636
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $4614
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4579
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $4576
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $4566
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $4548
byte 1 55
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4547
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 79
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $4546
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $4545
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4544
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4543
byte 1 117
byte 1 105
byte 1 95
byte 1 113
byte 1 51
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $4542
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $4541
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $4540
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4539
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $4538
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4537
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 111
byte 1 117
byte 1 116
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4536
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4535
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4534
byte 1 48
byte 1 48
byte 1 58
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4533
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4532
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $4531
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $4530
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4529
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $4528
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $4527
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4526
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4525
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $4524
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4523
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4522
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4521
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $4520
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $4519
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $4518
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $4517
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $4516
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 79
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4515
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $4514
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $4513
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $4512
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $4511
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $4510
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $4509
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $4508
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $4507
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $4506
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $4505
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4504
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4503
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4502
byte 1 51
byte 1 0
align 1
LABELV $4501
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4500
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4499
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4498
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4497
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $4496
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $4495
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4494
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $4493
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $4492
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4491
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $4490
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $4489
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $4488
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $4487
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $4486
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $4485
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $4484
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $4483
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $4482
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $4481
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $4480
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $4479
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $4478
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $4477
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $4476
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $4475
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $4474
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4473
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4472
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $4471
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $4470
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $4469
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4468
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $4467
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $4466
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $4465
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $4464
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $4463
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $4462
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $4461
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $4460
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $4459
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $4458
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $4457
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $4456
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4455
byte 1 56
byte 1 0
align 1
LABELV $4454
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4453
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $4452
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4451
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4450
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4449
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4448
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4447
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4438
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4435
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4432
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4429
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4419
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $4416
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4415
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 117
byte 1 112
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4414
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $4410
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4403
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $4401
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4398
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $4389
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $4388
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $4384
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $4381
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4380
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4379
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $4352
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4351
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4348
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $4344
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4343
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $4340
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $4337
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $4331
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4329
byte 1 101
byte 1 110
byte 1 100
byte 1 111
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4321
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 95
byte 1 112
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $4266
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $4265
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $4264
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4263
byte 1 48
byte 1 46
byte 1 56
byte 1 0
align 1
LABELV $4262
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4261
byte 1 117
byte 1 105
byte 1 95
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $4243
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4239
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4235
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $4233
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $4160
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4141
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4140
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $4137
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4136
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $4135
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $4127
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $4126
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4124
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4123
byte 1 46
byte 1 0
align 1
LABELV $4113
byte 1 47
byte 1 0
align 1
LABELV $4112
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $4064
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $4059
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4054
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4039
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4031
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $3975
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3970
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3928
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3925
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3920
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $3903
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3893
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3865
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3855
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3848
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3845
byte 1 74
byte 1 97
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $3841
byte 1 102
byte 1 101
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3836
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $3809
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3802
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3644
byte 1 42
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3541
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $3540
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3537
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3535
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3531
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $3527
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $3524
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3523
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3522
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $3345
byte 1 115
byte 1 0
align 1
LABELV $3342
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3337
byte 1 110
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $3253
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 47
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3195
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3187
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3176
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3131
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3130
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $3129
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $3091
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3090
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $3089
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $3088
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3087
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3086
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3085
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3084
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $3083
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3082
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3066
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3054
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3034
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2991
byte 1 87
byte 1 101
byte 1 108
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 33
byte 1 0
align 1
LABELV $2980
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $2823
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2820
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2784
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2781
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 98
byte 1 67
byte 1 108
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2776
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2773
byte 1 52
byte 1 0
align 1
LABELV $2772
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $2763
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2755
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2743
byte 1 10
byte 1 0
align 1
LABELV $2736
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2727
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2726
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2722
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2709
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2706
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2705
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $2702
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2697
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $2696
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2687
byte 1 97
byte 1 100
byte 1 100
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2671
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2668
byte 1 97
byte 1 100
byte 1 100
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $2663
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2657
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2651
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $2645
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2640
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2634
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2628
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2622
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2619
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2616
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $2613
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2597
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $2594
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2593
byte 1 76
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2590
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $2589
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2588
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2585
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2584
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2574
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2571
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2557
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2552
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2545
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2535
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2529
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2522
byte 1 83
byte 1 116
byte 1 111
byte 1 112
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2519
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2518
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2509
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2506
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $2501
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2500
byte 1 82
byte 1 117
byte 1 110
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2497
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $2494
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2493
byte 1 82
byte 1 117
byte 1 110
byte 1 77
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $2488
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 32
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $2483
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $2480
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2477
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2474
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2465
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $2461
byte 1 82
byte 1 117
byte 1 110
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2458
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2455
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2452
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2443
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $2440
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2439
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2436
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2433
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2430
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2429
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $2426
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $2425
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 65
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $2424
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $2423
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $2420
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $2419
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 67
byte 1 68
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $2411
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 52
byte 1 0
align 1
LABELV $2410
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 51
byte 1 0
align 1
LABELV $2409
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 50
byte 1 0
align 1
LABELV $2408
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 49
byte 1 0
align 1
LABELV $2407
byte 1 103
byte 1 101
byte 1 116
byte 1 67
byte 1 68
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $2404
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2403
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2402
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2401
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2400
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2393
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 83
byte 1 80
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2383
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $2380
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2351
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2350
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2344
byte 1 109
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2341
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 80
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2336
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $2333
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $2332
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2331
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2330
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $2329
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2328
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $2327
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2326
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2325
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2324
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2323
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2319
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $2314
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2310
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 98
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $2303
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2302
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2298
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2295
byte 1 117
byte 1 105
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2290
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 100
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2289
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2286
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2285
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 116
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2282
byte 1 117
byte 1 105
byte 1 95
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2281
byte 1 117
byte 1 105
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2277
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 53
byte 1 59
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2253
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2239
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $2238
byte 1 50
byte 1 0
align 1
LABELV $2235
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2231
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2230
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2227
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2226
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2225
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2224
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2223
byte 1 117
byte 1 105
byte 1 95
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2222
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2221
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2220
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2219
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2218
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2217
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2216
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2215
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2214
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2213
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2212
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2211
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2208
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2204
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2198
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2194
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2168
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2167
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2165
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $2164
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2161
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2146
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2145
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2136
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2121
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2073
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $2051
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $1958
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1847
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1816
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1758
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $1739
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1542
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $1538
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1535
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1427
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1424
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 41
byte 1 0
align 1
LABELV $1411
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1401
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1393
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1373
byte 1 110
byte 1 0
align 1
LABELV $1362
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1361
byte 1 116
byte 1 0
align 1
LABELV $1360
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $1325
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1316
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1314
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 78
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 67
byte 1 76
byte 1 73
byte 1 67
byte 1 75
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1313
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 65
byte 1 80
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1278
byte 1 37
byte 1 105
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1101
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1094
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1089
byte 1 74
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1041
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1028
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1023
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1020
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $986
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $969
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $968
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $965
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $964
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $963
byte 1 117
byte 1 105
byte 1 95
byte 1 81
byte 1 51
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $920
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $905
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $890
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $888
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 101
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $858
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $855
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $849
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $848
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $842
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $841
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $840
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $833
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $832
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $826
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $792
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $773
byte 1 37
byte 1 115
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $768
byte 1 37
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $740
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $730
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $729
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $718
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $717
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $716
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $715
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $714
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $700
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $698
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $696
byte 1 53
byte 1 0
align 1
LABELV $695
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $694
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $693
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $692
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $691
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $690
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $689
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $688
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $687
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $686
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $685
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $684
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $683
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $682
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $681
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $680
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $679
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $678
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $677
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $676
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $670
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $668
byte 1 85
byte 1 73
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $665
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $645
byte 1 94
byte 1 49
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 117
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $642
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $641
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $619
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $613
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $599
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $593
byte 1 71
byte 1 108
byte 1 121
byte 1 112
byte 1 104
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $588
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $587
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $576
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $568
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $560
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $552
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $544
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $536
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $524
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $516
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 66
byte 1 117
byte 1 122
byte 1 122
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $508
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $500
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $492
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $484
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $475
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $466
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $455
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $451
byte 1 125
byte 1 0
align 1
LABELV $442
byte 1 123
byte 1 0
align 1
LABELV $435
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $432
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $397
byte 1 49
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $395
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $394
byte 1 48
byte 1 0
align 1
LABELV $393
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $230
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $228
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $221
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $218
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $215
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 98
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $212
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $209
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $206
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 117
byte 1 112
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $203
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 100
byte 1 119
byte 1 110
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $200
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $197
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $193
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
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $189
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
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $185
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
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $181
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
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $177
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
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $173
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
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $170
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $167
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $148
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $147
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $146
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $145
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $144
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $142
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $139
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $138
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $137
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $136
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $135
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $134
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $133
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $132
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $131
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 84
byte 1 79
byte 1 85
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $130
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $129
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $128
byte 1 49
byte 1 70
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $126
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $125
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $124
byte 1 84
byte 1 79
byte 1 85
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $123
byte 1 70
byte 1 70
byte 1 65
byte 1 0
align 1
LABELV $122
byte 1 111
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $121
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $120
byte 1 119
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $119
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 70
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $118
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $117
byte 1 65
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $115
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $113
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $112
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $111
byte 1 0
align 1
LABELV $110
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $109
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $108
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 77
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $106
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $105
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $102
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $101
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $100
byte 1 68
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $99
byte 1 78
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $98
byte 1 79
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $97
byte 1 83
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $96
byte 1 65
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $95
byte 1 74
byte 1 117
byte 1 108
byte 1 0
align 1
LABELV $94
byte 1 74
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $93
byte 1 77
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $92
byte 1 65
byte 1 112
byte 1 114
byte 1 0
align 1
LABELV $91
byte 1 77
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $90
byte 1 70
byte 1 101
byte 1 98
byte 1 0
align 1
LABELV $89
byte 1 74
byte 1 97
byte 1 110
byte 1 0
