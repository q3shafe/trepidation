data
export ui_medalNames
align 4
LABELV ui_medalNames
address $70
address $71
address $72
address $73
address $74
address $75
export ui_medalPicNames
align 4
LABELV ui_medalPicNames
address $76
address $77
address $78
address $79
address $80
address $81
export ui_medalSounds
align 4
LABELV ui_medalSounds
address $82
address $83
address $84
address $85
address $86
address $87
code
proc UI_SPPostgameMenu_AgainEvent 0 8
file "../ui_sppostgame.c"
line 85
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER POSTGAME MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define MAX_SCOREBOARD_CLIENTS		8
;14:
;15:#define AWARD_PRESENTATION_TIME		2000
;16:
;17:#define ART_MENU0		"menu/art/menu_0"
;18:#define ART_MENU1		"menu/art/menu_1"
;19:#define ART_REPLAY0		"menu/art/replay_0"
;20:#define ART_REPLAY1		"menu/art/replay_1"
;21:#define ART_NEXT0		"menu/art/next_0"
;22:#define ART_NEXT1		"menu/art/next_1"
;23:
;24:#define ID_AGAIN		10
;25:#define ID_NEXT			11
;26:#define ID_MENU			12
;27:
;28:typedef struct {
;29:	menuframework_s	menu;
;30:	menubitmap_s	item_again;
;31:	menubitmap_s	item_next;
;32:	menubitmap_s	item_menu;
;33:
;34:	int				phase;
;35:	int				ignoreKeysTime;
;36:	int				starttime;
;37:	int				scoreboardtime;
;38:	int				serverId;
;39:
;40:	int				clientNums[MAX_SCOREBOARD_CLIENTS];
;41:	int				ranks[MAX_SCOREBOARD_CLIENTS];
;42:	int				scores[MAX_SCOREBOARD_CLIENTS];
;43:
;44:	char			placeNames[3][64];
;45:
;46:	int				level;
;47:	int				numClients;
;48:	int				won;
;49:	int				numAwards;
;50:	int				awardsEarned[6];
;51:	int				awardsLevels[6];
;52:	qboolean		playedSound[6];
;53:	int				lastTier;
;54:	sfxHandle_t		winnerSound;
;55:} postgameMenuInfo_t;
;56:
;57:static postgameMenuInfo_t	postgameMenuInfo;
;58:static char					arenainfo[MAX_INFO_VALUE];
;59:
;60:char	*ui_medalNames[] = {"Accuracy", "Impressive", "Excellent", "Gauntlet", "Frags", "Perfect"};
;61:char	*ui_medalPicNames[] = {
;62:	"menu/medals/medal_accuracy",
;63:	"menu/medals/medal_impressive",
;64:	"menu/medals/medal_excellent",
;65:	"menu/medals/medal_gauntlet",
;66:	"menu/medals/medal_frags",
;67:	"menu/medals/medal_victory"
;68:};
;69:char	*ui_medalSounds[] = {
;70:	"sound/feedback/accuracy.wav",
;71:	"sound/feedback/impressive_a.wav",
;72:	"sound/feedback/excellent_a.wav",
;73:	"sound/feedback/gauntlet.wav",
;74:	"sound/feedback/frags.wav",
;75:	"sound/feedback/perfect.wav"
;76:};
;77:
;78:
;79:/*
;80:=================
;81:UI_SPPostgameMenu_AgainEvent
;82:=================
;83:*/
;84:static void UI_SPPostgameMenu_AgainEvent( void* ptr, int event )
;85:{
line 86
;86:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $89
line 87
;87:		return;
ADDRGP4 $88
JUMPV
LABELV $89
line 89
;88:	}
;89:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 90
;90:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $91
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 91
;91:}
LABELV $88
endproc UI_SPPostgameMenu_AgainEvent 0 8
proc UI_SPPostgameMenu_NextEvent 36 4
line 99
;92:
;93:
;94:/*
;95:=================
;96:UI_SPPostgameMenu_NextEvent
;97:=================
;98:*/
;99:static void UI_SPPostgameMenu_NextEvent( void* ptr, int event ) {
line 106
;100:	int			currentSet;
;101:	int			levelSet;
;102:	int			level;
;103:	int			currentLevel;
;104:	const char	*arenaInfo;
;105:
;106:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $93
line 107
;107:		return;
ADDRGP4 $92
JUMPV
LABELV $93
line 109
;108:	}
;109:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 112
;110:
;111:	// handle specially if we just won the training map
;112:	if( postgameMenuInfo.won == 0 ) {
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 0
NEI4 $95
line 113
;113:		level = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 114
;114:	}
ADDRGP4 $96
JUMPV
LABELV $95
line 115
;115:	else {
line 116
;116:		level = postgameMenuInfo.level + 1;
ADDRLP4 4
ADDRGP4 postgameMenuInfo+860
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 117
;117:	}
LABELV $96
line 118
;118:	levelSet = level / ARENAS_PER_TIER;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 120
;119:
;120:	currentLevel = UI_GetCurrentGame();
ADDRLP4 20
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 121
;121:	if( currentLevel == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $99
line 122
;122:		currentLevel = postgameMenuInfo.level;
ADDRLP4 0
ADDRGP4 postgameMenuInfo+860
INDIRI4
ASGNI4
line 123
;123:	}
LABELV $99
line 124
;124:	currentSet = currentLevel / ARENAS_PER_TIER;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 126
;125:
;126:	if( levelSet > currentSet || levelSet == UI_GetNumSPTiers() ) {
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $104
ADDRLP4 28
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $102
LABELV $104
line 127
;127:		level = currentLevel;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 128
;128:	}
LABELV $102
line 130
;129:
;130:	arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
ASGNP4
line 131
;131:	if ( !arenaInfo ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $105
line 132
;132:		return;
ADDRGP4 $92
JUMPV
LABELV $105
line 135
;133:	}
;134:
;135:	UI_SPArena_Start( arenaInfo );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_SPArena_Start
CALLV
pop
line 136
;136:}
LABELV $92
endproc UI_SPPostgameMenu_NextEvent 36 4
proc UI_SPPostgameMenu_MenuEvent 0 8
line 145
;137:
;138:
;139:/*
;140:=================
;141:UI_SPPostgameMenu_MenuEvent
;142:=================
;143:*/
;144:static void UI_SPPostgameMenu_MenuEvent( void* ptr, int event )
;145:{
line 146
;146:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $108
line 147
;147:		return;
ADDRGP4 $107
JUMPV
LABELV $108
line 149
;148:	}
;149:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 150
;150:	trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; levelselect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 151
;151:}
LABELV $107
endproc UI_SPPostgameMenu_MenuEvent 0 8
proc UI_SPPostgameMenu_MenuKey 8 8
line 159
;152:
;153:
;154:/*
;155:=================
;156:UI_SPPostgameMenu_MenuKey
;157:=================
;158:*/
;159:static sfxHandle_t UI_SPPostgameMenu_MenuKey( int key ) {
line 160
;160:	if ( uis.realtime < postgameMenuInfo.ignoreKeysTime ) {
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+556
INDIRI4
GEI4 $112
line 161
;161:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $112
line 164
;162:	}
;163:
;164:	if( postgameMenuInfo.phase == 1 ) {
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 1
NEI4 $116
line 165
;165:		trap_Cmd_ExecuteText( EXEC_APPEND, "abort_podium\n" );
CNSTI4 2
ARGI4
ADDRGP4 $119
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 166
;166:		postgameMenuInfo.phase = 2;
ADDRGP4 postgameMenuInfo+552
CNSTI4 2
ASGNI4
line 167
;167:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 168
;168:		postgameMenuInfo.ignoreKeysTime	= uis.realtime + 250;
ADDRGP4 postgameMenuInfo+556
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 169
;169:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $116
line 172
;170:	}
;171:
;172:	if( postgameMenuInfo.phase == 2 ) {
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 2
NEI4 $125
line 173
;173:		postgameMenuInfo.phase = 3;
ADDRGP4 postgameMenuInfo+552
CNSTI4 3
ASGNI4
line 174
;174:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 175
;175:		postgameMenuInfo.ignoreKeysTime	= uis.realtime + 250;
ADDRGP4 postgameMenuInfo+556
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 176
;176:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $125
line 179
;177:	}
;178:
;179:	if( key == K_ESCAPE || key == K_MOUSE2 ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
EQI4 $135
ADDRLP4 0
INDIRI4
CNSTI4 179
NEI4 $133
LABELV $135
line 180
;180:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $133
line 183
;181:	}
;182:
;183:	return Menu_DefaultKey( &postgameMenuInfo.menu, key );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $111
endproc UI_SPPostgameMenu_MenuKey 8 8
data
align 4
LABELV medalLocations
byte 4 144
byte 4 448
byte 4 88
byte 4 504
byte 4 32
byte 4 560
code
proc UI_SPPostgameMenu_DrawAwardsMedals 40 20
line 189
;184:}
;185:
;186:
;187:static int medalLocations[6] = {144, 448, 88, 504, 32, 560};
;188:
;189:static void UI_SPPostgameMenu_DrawAwardsMedals( int max ) {
line 196
;190:	int		n;
;191:	int		medal;
;192:	int		amount;
;193:	int		x, y;
;194:	char	buf[16];
;195:
;196:	for( n = 0; n < max; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $137
line 197
;197:		x = medalLocations[n];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 medalLocations
ADDP4
INDIRI4
ASGNI4
line 198
;198:		y = 64;
ADDRLP4 12
CNSTI4 64
ASGNI4
line 199
;199:		medal = postgameMenuInfo.awardsEarned[n];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
INDIRI4
ASGNI4
line 200
;200:		amount = postgameMenuInfo.awardsLevels[n];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
INDIRI4
ASGNI4
line 202
;201:
;202:		UI_DrawNamedPic( x, y, 48, 48, ui_medalPicNames[medal] );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
CNSTF4 1111490560
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 204
;203:
;204:		if( medal == AWARD_ACCURACY ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $143
line 205
;205:			Com_sprintf( buf, sizeof(buf), "%i%%", amount );
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $145
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 206
;206:		}
ADDRGP4 $144
JUMPV
LABELV $143
line 207
;207:		else {
line 208
;208:			if( amount == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $146
line 209
;209:				continue;
ADDRGP4 $138
JUMPV
LABELV $146
line 211
;210:			}
;211:			Com_sprintf( buf, sizeof(buf), "%i", amount );
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $148
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 212
;212:		}
LABELV $144
line 214
;213:
;214:		UI_DrawString( x + 24, y + 52, buf, UI_CENTER, color_yellow );
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 52
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 215
;215:	}
LABELV $138
line 196
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $140
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $137
line 216
;216:}
LABELV $136
endproc UI_SPPostgameMenu_DrawAwardsMedals 40 20
proc UI_SPPostgameMenu_DrawAwardsPresentation 40 20
line 219
;217:
;218:
;219:static void UI_SPPostgameMenu_DrawAwardsPresentation( int timer ) {
line 224
;220:	int		awardNum;
;221:	int		atimer;
;222:	vec4_t	color;
;223:
;224:	awardNum = timer / AWARD_PRESENTATION_TIME;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2000
DIVI4
ASGNI4
line 225
;225:	atimer = timer % AWARD_PRESENTATION_TIME;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CNSTI4 2000
MODI4
ASGNI4
line 227
;226:
;227:	color[0] = color[1] = color[2] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 228
;228:	color[3] = (float)( AWARD_PRESENTATION_TIME - atimer ) / (float)AWARD_PRESENTATION_TIME;
ADDRLP4 4+12
CNSTI4 2000
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1157234688
DIVF4
ASGNF4
line 229
;229:	UI_DrawProportionalString( 320, 64, ui_medalNames[postgameMenuInfo.awardsEarned[awardNum]], UI_CENTER, color );
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LSHI4
ADDRGP4 ui_medalNames
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 231
;230:
;231:	UI_SPPostgameMenu_DrawAwardsMedals( awardNum + 1 );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 233
;232:
;233:	if( !postgameMenuInfo.playedSound[awardNum] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+924
ADDP4
INDIRI4
CNSTI4 0
NEI4 $154
line 234
;234:		postgameMenuInfo.playedSound[awardNum] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+924
ADDP4
CNSTI4 1
ASGNI4
line 235
;235:		trap_S_StartLocalSound( trap_S_RegisterSound( ui_medalSounds[postgameMenuInfo.awardsEarned[awardNum]], qfalse ), CHAN_ANNOUNCER );
ADDRLP4 32
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 236
;236:	}
LABELV $154
line 237
;237:}
LABELV $149
endproc UI_SPPostgameMenu_DrawAwardsPresentation 40 20
proc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
line 245
;238:
;239:
;240:/*
;241:=================
;242:UI_SPPostgameMenu_MenuDrawScoreLine
;243:=================
;244:*/
;245:static void UI_SPPostgameMenu_MenuDrawScoreLine( int n, int y ) {
line 250
;246:	int		rank;
;247:	char	name[64];
;248:	char	info[MAX_INFO_STRING];
;249:
;250:	if( n > (postgameMenuInfo.numClients + 1) ) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 1
ADDI4
LEI4 $160
line 251
;251:		n -= (postgameMenuInfo.numClients + 2);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 252
;252:	}
LABELV $160
line 254
;253:
;254:	if( n >= postgameMenuInfo.numClients ) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
LTI4 $164
line 255
;255:		return;
ADDRGP4 $159
JUMPV
LABELV $164
line 258
;256:	}
;257:
;258:	rank = postgameMenuInfo.ranks[n];
ADDRLP4 64
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+604
ADDP4
INDIRI4
ASGNI4
line 259
;259:	if( rank & RANK_TIED_FLAG ) {
ADDRLP4 64
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $168
line 260
;260:		UI_DrawString( 640 - 31 * SMALLCHAR_WIDTH, y, "(tie)", UI_LEFT|UI_SMALLFONT, color_white );
CNSTI4 392
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $170
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 261
;261:		rank &= ~RANK_TIED_FLAG;
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 262
;262:	}
LABELV $168
line 263
;263:	trap_GetConfigString( CS_PLAYERS + postgameMenuInfo.clientNums[n], info, MAX_INFO_STRING );
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 264
;264:	Q_strncpyz( name, Info_ValueForKey( info, "n" ), sizeof(name) );
ADDRLP4 68
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 265
;265:	Q_CleanStr( name );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 267
;266:
;267:	UI_DrawString( 640 - 25 * SMALLCHAR_WIDTH, y, va( "#%i: %-16s %2i", rank + 1, name, postgameMenuInfo.scores[n] ), UI_LEFT|UI_SMALLFONT, color_white );
ADDRGP4 $173
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+636
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 440
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 268
;268:}
LABELV $159
endproc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
proc UI_SPPostgameMenu_MenuDraw 1060 20
line 276
;269:
;270:
;271:/*
;272:=================
;273:UI_SPPostgameMenu_MenuDraw
;274:=================
;275:*/
;276:static void UI_SPPostgameMenu_MenuDraw( void ) {
line 282
;277:	int		timer;
;278:	int		serverId;
;279:	int		n;
;280:	char	info[MAX_INFO_STRING];
;281:
;282:	trap_GetConfigString( CS_SYSTEMINFO, info, sizeof(info) );
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 283
;283:	serverId = atoi( Info_ValueForKey( info, "sv_serverid" ) );
ADDRLP4 8
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
line 284
;284:	if( serverId != postgameMenuInfo.serverId ) {
ADDRLP4 1032
INDIRI4
ADDRGP4 postgameMenuInfo+568
INDIRI4
EQI4 $177
line 285
;285:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 286
;286:		return;
ADDRGP4 $175
JUMPV
LABELV $177
line 290
;287:	}
;288:
;289:	// phase 1
;290:	if ( postgameMenuInfo.numClients > 2 ) {
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 2
LEI4 $180
line 291
;291:		UI_DrawProportionalString( 510, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[2], UI_CENTER, color_white );
CNSTI4 510
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+668+128
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 292
;292:	}
LABELV $180
line 293
;293:	UI_DrawProportionalString( 130, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[1], UI_CENTER, color_white );
CNSTI4 130
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+668+64
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 294
;294:	UI_DrawProportionalString( 320, 480 - 64 - 2 * PROP_HEIGHT, postgameMenuInfo.placeNames[0], UI_CENTER, color_white );
CNSTI4 320
ARGI4
CNSTI4 362
ARGI4
ADDRGP4 postgameMenuInfo+668
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 296
;295:
;296:	if( postgameMenuInfo.phase == 1 ) {
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 1
NEI4 $188
line 297
;297:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+560
INDIRI4
SUBI4
ASGNI4
line 299
;298:
;299:		if( timer >= 1000 && postgameMenuInfo.winnerSound ) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
LTI4 $193
ADDRGP4 postgameMenuInfo+952
INDIRI4
CNSTI4 0
EQI4 $193
line 300
;300:			trap_S_StartLocalSound( postgameMenuInfo.winnerSound, CHAN_ANNOUNCER );
ADDRGP4 postgameMenuInfo+952
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 301
;301:			postgameMenuInfo.winnerSound = 0;
ADDRGP4 postgameMenuInfo+952
CNSTI4 0
ASGNI4
line 302
;302:		}
LABELV $193
line 304
;303:
;304:		if( timer < 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $198
line 305
;305:			return;
ADDRGP4 $175
JUMPV
LABELV $198
line 307
;306:		}
;307:		postgameMenuInfo.phase = 2;
ADDRGP4 postgameMenuInfo+552
CNSTI4 2
ASGNI4
line 308
;308:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 309
;309:	}
LABELV $188
line 312
;310:
;311:	// phase 2
;312:	if( postgameMenuInfo.phase == 2 ) {
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 2
NEI4 $203
line 313
;313:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+560
INDIRI4
SUBI4
ASGNI4
line 314
;314:		if( timer >= ( postgameMenuInfo.numAwards * AWARD_PRESENTATION_TIME ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 2000
ADDRGP4 postgameMenuInfo+872
INDIRI4
MULI4
LTI4 $208
line 316
;315:
;316:			if( timer < 5000 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $211
line 317
;317:				return;
ADDRGP4 $175
JUMPV
LABELV $211
line 320
;318:			}
;319:
;320:			postgameMenuInfo.phase = 3;
ADDRGP4 postgameMenuInfo+552
CNSTI4 3
ASGNI4
line 321
;321:			postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 322
;322:		}
ADDRGP4 $209
JUMPV
LABELV $208
line 323
;323:		else {
line 324
;324:			UI_SPPostgameMenu_DrawAwardsPresentation( timer );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsPresentation
CALLV
pop
line 325
;325:		}
LABELV $209
line 326
;326:	}
LABELV $203
line 329
;327:
;328:	// phase 3
;329:	if( postgameMenuInfo.phase == 3 ) {
ADDRGP4 postgameMenuInfo+552
INDIRI4
CNSTI4 3
NEI4 $216
line 330
;330:		if( uis.demoversion ) {
ADDRGP4 uis+11440
INDIRI4
CNSTI4 0
EQI4 $219
line 331
;331:			if( postgameMenuInfo.won == 1 && UI_ShowTierVideo( 8 )) {
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 1
NEI4 $220
CNSTI4 8
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $220
line 332
;332:				trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $225
ARGP4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 333
;333:				trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic demoEnd.RoQ\n" );
CNSTI4 2
ARGI4
ADDRGP4 $227
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 334
;334:				return;
ADDRGP4 $175
JUMPV
line 336
;335:			}
;336:		}
LABELV $219
line 337
;337:		else if( postgameMenuInfo.won > -1 && UI_ShowTierVideo( postgameMenuInfo.won + 1 )) {
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 -1
LEI4 $228
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $228
line 338
;338:			if( postgameMenuInfo.won == postgameMenuInfo.lastTier ) {
ADDRGP4 postgameMenuInfo+868
INDIRI4
ADDRGP4 postgameMenuInfo+948
INDIRI4
NEI4 $232
line 339
;339:				trap_Cvar_Set( "nextmap", "" );
ADDRGP4 $225
ARGP4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 340
;340:				trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic end.RoQ\n" );
CNSTI4 2
ARGI4
ADDRGP4 $236
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 341
;341:				return;
ADDRGP4 $175
JUMPV
LABELV $232
line 344
;342:			}
;343:
;344:			trap_Cvar_SetValue( "ui_spSelection", postgameMenuInfo.won * ARENAS_PER_TIER );
ADDRGP4 $237
ARGP4
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 2
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 345
;345:			trap_Cvar_Set( "nextmap", "levelselect" );
ADDRGP4 $225
ARGP4
ADDRGP4 $239
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 346
;346:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "disconnect; cinematic tier%i.RoQ\n", postgameMenuInfo.won + 1 ) );
ADDRGP4 $240
ARGP4
ADDRGP4 postgameMenuInfo+868
INDIRI4
CNSTI4 1
ADDI4
ARGI4
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
line 347
;347:			return;
ADDRGP4 $175
JUMPV
LABELV $228
LABELV $220
line 350
;348:		}
;349:
;350:		postgameMenuInfo.item_again.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1048
ADDRGP4 postgameMenuInfo+288+44
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 351
;351:		postgameMenuInfo.item_next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1052
ADDRGP4 postgameMenuInfo+376+44
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 352
;352:		postgameMenuInfo.item_menu.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1056
ADDRGP4 postgameMenuInfo+464+44
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 354
;353:
;354:		UI_SPPostgameMenu_DrawAwardsMedals( postgameMenuInfo.numAwards );
ADDRGP4 postgameMenuInfo+872
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 356
;355:
;356:		Menu_Draw( &postgameMenuInfo.menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 357
;357:	}
LABELV $216
line 360
;358:
;359:	// draw the scoreboard
;360:	if( !trap_Cvar_VariableValue( "ui_spScoreboard" ) ) {
ADDRGP4 $251
ARGP4
ADDRLP4 1044
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
INDIRF4
CNSTF4 0
NEF4 $249
line 361
;361:		return;
ADDRGP4 $175
JUMPV
LABELV $249
line 364
;362:	}
;363:
;364:	timer = uis.realtime - postgameMenuInfo.scoreboardtime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+564
INDIRI4
SUBI4
ASGNI4
line 365
;365:	if( postgameMenuInfo.numClients <= 3 ) {
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 3
GTI4 $254
line 366
;366:		n = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 367
;367:	}
ADDRGP4 $255
JUMPV
LABELV $254
line 368
;368:	else {
line 369
;369:		n = timer / 1500 % (postgameMenuInfo.numClients + 2);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1500
DIVI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 2
ADDI4
MODI4
ASGNI4
line 370
;370:	}
LABELV $255
line 371
;371:	UI_SPPostgameMenu_MenuDrawScoreLine( n, 0 );
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 372
;372:	UI_SPPostgameMenu_MenuDrawScoreLine( n + 1, 0 + SMALLCHAR_HEIGHT );
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 373
;373:	UI_SPPostgameMenu_MenuDrawScoreLine( n + 2, 0 + 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 374
;374:}
LABELV $175
endproc UI_SPPostgameMenu_MenuDraw 1060 20
export UI_SPPostgameMenu_Cache
proc UI_SPPostgameMenu_Cache 12 8
line 382
;375:
;376:
;377:/*
;378:=================
;379:UI_SPPostgameMenu_Cache
;380:=================
;381:*/
;382:void UI_SPPostgameMenu_Cache( void ) {
line 386
;383:	int			n;
;384:	qboolean	buildscript;
;385:
;386:	buildscript = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $259
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
line 388
;387:
;388:	trap_R_RegisterShaderNoMip( ART_MENU0 );
ADDRGP4 $260
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 389
;389:	trap_R_RegisterShaderNoMip( ART_MENU1 );
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 390
;390:	trap_R_RegisterShaderNoMip( ART_REPLAY0 );
ADDRGP4 $262
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 391
;391:	trap_R_RegisterShaderNoMip( ART_REPLAY1 );
ADDRGP4 $263
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 392
;392:	trap_R_RegisterShaderNoMip( ART_NEXT0 );
ADDRGP4 $264
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 393
;393:	trap_R_RegisterShaderNoMip( ART_NEXT1 );
ADDRGP4 $265
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 394
;394:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $266
line 395
;395:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 396
;396:		trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 397
;397:	}
LABELV $267
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $266
line 399
;398:
;399:	if( buildscript ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $270
line 400
;400:		trap_S_RegisterSound( "music/loss.wav", qfalse );
ADDRGP4 $272
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 401
;401:		trap_S_RegisterSound( "music/win.wav", qfalse );
ADDRGP4 $273
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 402
;402:		trap_S_RegisterSound( "sound/player/announce/youwin.wav", qfalse );
ADDRGP4 $274
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 403
;403:	}
LABELV $270
line 404
;404:}
LABELV $258
endproc UI_SPPostgameMenu_Cache 12 8
proc UI_SPPostgameMenu_Init 0 8
line 412
;405:
;406:
;407:/*
;408:=================
;409:UI_SPPostgameMenu_Init
;410:=================
;411:*/
;412:static void UI_SPPostgameMenu_Init( void ) {
line 413
;413:	postgameMenuInfo.menu.wrapAround	= qtrue;
ADDRGP4 postgameMenuInfo+276
CNSTI4 1
ASGNI4
line 414
;414:	postgameMenuInfo.menu.key			= UI_SPPostgameMenu_MenuKey;
ADDRGP4 postgameMenuInfo+272
ADDRGP4 UI_SPPostgameMenu_MenuKey
ASGNP4
line 415
;415:	postgameMenuInfo.menu.draw			= UI_SPPostgameMenu_MenuDraw;
ADDRGP4 postgameMenuInfo+268
ADDRGP4 UI_SPPostgameMenu_MenuDraw
ASGNP4
line 416
;416:	postgameMenuInfo.ignoreKeysTime		= uis.realtime + 1500;
ADDRGP4 postgameMenuInfo+556
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 418
;417:
;418:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 420
;419:
;420:	postgameMenuInfo.item_menu.generic.type			= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+464
CNSTI4 6
ASGNI4
line 421
;421:	postgameMenuInfo.item_menu.generic.name			= ART_MENU0;
ADDRGP4 postgameMenuInfo+464+4
ADDRGP4 $260
ASGNP4
line 422
;422:	postgameMenuInfo.item_menu.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+464+44
CNSTU4 16644
ASGNU4
line 423
;423:	postgameMenuInfo.item_menu.generic.x			= 0;
ADDRGP4 postgameMenuInfo+464+12
CNSTI4 0
ASGNI4
line 424
;424:	postgameMenuInfo.item_menu.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+464+16
CNSTI4 416
ASGNI4
line 425
;425:	postgameMenuInfo.item_menu.generic.callback		= UI_SPPostgameMenu_MenuEvent;
ADDRGP4 postgameMenuInfo+464+48
ADDRGP4 UI_SPPostgameMenu_MenuEvent
ASGNP4
line 426
;426:	postgameMenuInfo.item_menu.generic.id			= ID_MENU;
ADDRGP4 postgameMenuInfo+464+8
CNSTI4 12
ASGNI4
line 427
;427:	postgameMenuInfo.item_menu.width				= 128;
ADDRGP4 postgameMenuInfo+464+76
CNSTI4 128
ASGNI4
line 428
;428:	postgameMenuInfo.item_menu.height				= 64;
ADDRGP4 postgameMenuInfo+464+80
CNSTI4 64
ASGNI4
line 429
;429:	postgameMenuInfo.item_menu.focuspic				= ART_MENU1;
ADDRGP4 postgameMenuInfo+464+60
ADDRGP4 $261
ASGNP4
line 431
;430:
;431:	postgameMenuInfo.item_again.generic.type		= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+288
CNSTI4 6
ASGNI4
line 432
;432:	postgameMenuInfo.item_again.generic.name		= ART_REPLAY0;
ADDRGP4 postgameMenuInfo+288+4
ADDRGP4 $262
ASGNP4
line 433
;433:	postgameMenuInfo.item_again.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+288+44
CNSTU4 16648
ASGNU4
line 434
;434:	postgameMenuInfo.item_again.generic.x			= 320;
ADDRGP4 postgameMenuInfo+288+12
CNSTI4 320
ASGNI4
line 435
;435:	postgameMenuInfo.item_again.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+288+16
CNSTI4 416
ASGNI4
line 436
;436:	postgameMenuInfo.item_again.generic.callback	= UI_SPPostgameMenu_AgainEvent;
ADDRGP4 postgameMenuInfo+288+48
ADDRGP4 UI_SPPostgameMenu_AgainEvent
ASGNP4
line 437
;437:	postgameMenuInfo.item_again.generic.id			= ID_AGAIN;
ADDRGP4 postgameMenuInfo+288+8
CNSTI4 10
ASGNI4
line 438
;438:	postgameMenuInfo.item_again.width				= 128;
ADDRGP4 postgameMenuInfo+288+76
CNSTI4 128
ASGNI4
line 439
;439:	postgameMenuInfo.item_again.height				= 64;
ADDRGP4 postgameMenuInfo+288+80
CNSTI4 64
ASGNI4
line 440
;440:	postgameMenuInfo.item_again.focuspic			= ART_REPLAY1;
ADDRGP4 postgameMenuInfo+288+60
ADDRGP4 $263
ASGNP4
line 442
;441:
;442:	postgameMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+376
CNSTI4 6
ASGNI4
line 443
;443:	postgameMenuInfo.item_next.generic.name			= ART_NEXT0;
ADDRGP4 postgameMenuInfo+376+4
ADDRGP4 $264
ASGNP4
line 444
;444:	postgameMenuInfo.item_next.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+376+44
CNSTU4 16656
ASGNU4
line 445
;445:	postgameMenuInfo.item_next.generic.x			= 640;
ADDRGP4 postgameMenuInfo+376+12
CNSTI4 640
ASGNI4
line 446
;446:	postgameMenuInfo.item_next.generic.y			= 480-64;
ADDRGP4 postgameMenuInfo+376+16
CNSTI4 416
ASGNI4
line 447
;447:	postgameMenuInfo.item_next.generic.callback		= UI_SPPostgameMenu_NextEvent;
ADDRGP4 postgameMenuInfo+376+48
ADDRGP4 UI_SPPostgameMenu_NextEvent
ASGNP4
line 448
;448:	postgameMenuInfo.item_next.generic.id			= ID_NEXT;
ADDRGP4 postgameMenuInfo+376+8
CNSTI4 11
ASGNI4
line 449
;449:	postgameMenuInfo.item_next.width				= 128;
ADDRGP4 postgameMenuInfo+376+76
CNSTI4 128
ASGNI4
line 450
;450:	postgameMenuInfo.item_next.height				= 64;
ADDRGP4 postgameMenuInfo+376+80
CNSTI4 64
ASGNI4
line 451
;451:	postgameMenuInfo.item_next.focuspic				= ART_NEXT1;
ADDRGP4 postgameMenuInfo+376+60
ADDRGP4 $265
ASGNP4
line 453
;452:
;453:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 454
;454:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_again );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 455
;455:	Menu_AddItem( &postgameMenuInfo.menu, ( void * )&postgameMenuInfo.item_next );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 456
;456:}
LABELV $275
endproc UI_SPPostgameMenu_Init 0 8
proc Prepname 1104 12
line 459
;457:
;458:
;459:static void Prepname( int index ) {
line 464
;460:	int		len;
;461:	char	name[64];
;462:	char	info[MAX_INFO_STRING];
;463:
;464:	trap_GetConfigString( CS_PLAYERS + postgameMenuInfo.clientNums[index], info, MAX_INFO_STRING );
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 465
;465:	Q_strncpyz( name, Info_ValueForKey( info, "n" ), sizeof(name) );
ADDRLP4 68
ARGP4
ADDRGP4 $172
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 466
;466:	Q_CleanStr( name );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 467
;467:	len = strlen( name );
ADDRLP4 4
ARGP4
ADDRLP4 1096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1096
INDIRI4
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $343
line 469
;468:
;469:	while( len && UI_ProportionalStringWidth( name ) > 256 ) {
line 470
;470:		len--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 471
;471:		name[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 472
;472:	}
LABELV $344
line 469
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 256
GTI4 $343
LABELV $346
line 474
;473:
;474:	Q_strncpyz( postgameMenuInfo.placeNames[index], name, sizeof(postgameMenuInfo.placeNames[index]) );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 postgameMenuInfo+668
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 475
;475:}
LABELV $341
endproc Prepname 1104 12
export UI_SPPostgameMenu_f
proc UI_SPPostgameMenu_f 1244 12
line 483
;476:
;477:
;478:/*
;479:=================
;480:UI_SPPostgameMenu_f
;481:=================
;482:*/
;483:void UI_SPPostgameMenu_f( void ) {
line 493
;484:	int			playerGameRank;
;485:	int			playerClientNum;
;486:	int			n;
;487:	int			oldFrags, newFrags;
;488:	const char	*arena;
;489:	int			awardValues[6];
;490:	char		map[MAX_QPATH];
;491:	char		info[MAX_INFO_STRING];
;492:
;493:	memset( &postgameMenuInfo, 0, sizeof(postgameMenuInfo) );
ADDRGP4 postgameMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 956
ARGI4
ADDRGP4 memset
CALLP4
pop
line 495
;494:
;495:	trap_GetConfigString( CS_SYSTEMINFO, info, sizeof(info) );
CNSTI4 1
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 496
;496:	postgameMenuInfo.serverId = atoi( Info_ValueForKey( info, "sv_serverid" ) );
ADDRLP4 36
ARGP4
ADDRGP4 $176
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+568
ADDRLP4 1140
INDIRI4
ASGNI4
line 498
;497:
;498:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 499
;499:	Q_strncpyz( map, Info_ValueForKey( info, "mapname" ), sizeof(map) );
ADDRLP4 36
ARGP4
ADDRGP4 $351
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 500
;500:	arena = UI_GetArenaInfoByMap( map );
ADDRLP4 1064
ARGP4
ADDRLP4 1148
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1060
ADDRLP4 1148
INDIRP4
ASGNP4
line 501
;501:	if ( !arena ) {
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $352
line 502
;502:		return;
ADDRGP4 $349
JUMPV
LABELV $352
line 504
;503:	}
;504:	Q_strncpyz( arenainfo, arena, sizeof(arenainfo) );
ADDRGP4 arenainfo
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 506
;505:
;506:	postgameMenuInfo.level = atoi( Info_ValueForKey( arenainfo, "num" ) );
ADDRGP4 arenainfo
ARGP4
ADDRGP4 $355
ARGP4
ADDRLP4 1152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+860
ADDRLP4 1156
INDIRI4
ASGNI4
line 508
;507:
;508:	postgameMenuInfo.numClients = atoi( UI_Argv( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+864
ADDRLP4 1164
INDIRI4
ASGNI4
line 509
;509:	playerClientNum = atoi( UI_Argv( 2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 1172
INDIRI4
ASGNI4
line 510
;510:	playerGameRank = 8;		// in case they ended game as a spectator
ADDRLP4 32
CNSTI4 8
ASGNI4
line 512
;511:
;512:	if( postgameMenuInfo.numClients > MAX_SCOREBOARD_CLIENTS ) {
ADDRGP4 postgameMenuInfo+864
INDIRI4
CNSTI4 8
LEI4 $357
line 513
;513:		postgameMenuInfo.numClients = MAX_SCOREBOARD_CLIENTS;
ADDRGP4 postgameMenuInfo+864
CNSTI4 8
ASGNI4
line 514
;514:	}
LABELV $357
line 516
;515:
;516:	for( n = 0; n < postgameMenuInfo.numClients; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $364
JUMPV
LABELV $361
line 517
;517:		postgameMenuInfo.clientNums[n] = atoi( UI_Argv( 8 + n * 3 + 1 ) );
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1180
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 518
;518:		postgameMenuInfo.ranks[n] = atoi( UI_Argv( 8 + n * 3 + 2 ) );
ADDRLP4 1192
CNSTI4 2
ASGNI4
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1192
INDIRI4
ADDI4
ARGI4
ADDRLP4 1196
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1192
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+604
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 519
;519:		postgameMenuInfo.scores[n] = atoi( UI_Argv( 8 + n * 3 + 3 ) );
ADDRLP4 1204
CNSTI4 3
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 8
ADDI4
ADDRLP4 1204
INDIRI4
ADDI4
ARGI4
ADDRLP4 1212
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1216
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+636
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 521
;520:
;521:		if( postgameMenuInfo.clientNums[n] == playerClientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+572
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $369
line 522
;522:			playerGameRank = (postgameMenuInfo.ranks[n] & ~RANK_TIED_FLAG) + 1;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+604
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 1
ADDI4
ASGNI4
line 523
;523:		}
LABELV $369
line 524
;524:	}
LABELV $362
line 516
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $364
ADDRLP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+864
INDIRI4
LTI4 $361
line 526
;525:
;526:	UI_SetBestScore( postgameMenuInfo.level, playerGameRank );
ADDRGP4 postgameMenuInfo+860
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 UI_SetBestScore
CALLV
pop
line 529
;527:
;528:	// process award stats and prepare presentation data
;529:	awardValues[AWARD_ACCURACY] = atoi( UI_Argv( 3 ) );
CNSTI4 3
ARGI4
ADDRLP4 1176
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1180
INDIRI4
ASGNI4
line 530
;530:	awardValues[AWARD_IMPRESSIVE] = atoi( UI_Argv( 4 ) );
CNSTI4 4
ARGI4
ADDRLP4 1184
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 1188
INDIRI4
ASGNI4
line 531
;531:	awardValues[AWARD_EXCELLENT] = atoi( UI_Argv( 5 ) );
CNSTI4 5
ARGI4
ADDRLP4 1192
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 1196
INDIRI4
ASGNI4
line 532
;532:	awardValues[AWARD_GAUNTLET] = atoi( UI_Argv( 6 ) );
CNSTI4 6
ARGI4
ADDRLP4 1200
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 1204
INDIRI4
ASGNI4
line 533
;533:	awardValues[AWARD_FRAGS] = atoi( UI_Argv( 7 ) );
CNSTI4 7
ARGI4
ADDRLP4 1208
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+16
ADDRLP4 1212
INDIRI4
ASGNI4
line 534
;534:	awardValues[AWARD_PERFECT] = atoi( UI_Argv( 8 ) );
CNSTI4 8
ARGI4
ADDRLP4 1216
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+20
ADDRLP4 1220
INDIRI4
ASGNI4
line 536
;535:
;536:	postgameMenuInfo.numAwards = 0;
ADDRGP4 postgameMenuInfo+872
CNSTI4 0
ASGNI4
line 538
;537:
;538:	if( awardValues[AWARD_ACCURACY] >= 50 ) {
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $380
line 539
;539:		UI_LogAwardData( AWARD_ACCURACY, 1 );
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 540
;540:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_ACCURACY;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 0
ASGNI4
line 541
;541:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_ACCURACY];
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 542
;542:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 543
;543:	}
LABELV $380
line 545
;544:
;545:	if( awardValues[AWARD_IMPRESSIVE] ) {
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $387
line 546
;546:		UI_LogAwardData( AWARD_IMPRESSIVE, awardValues[AWARD_IMPRESSIVE] );
CNSTI4 1
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 547
;547:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_IMPRESSIVE;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 1
ASGNI4
line 548
;548:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_IMPRESSIVE];
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 549
;549:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 550
;550:	}
LABELV $387
line 552
;551:
;552:	if( awardValues[AWARD_EXCELLENT] ) {
ADDRLP4 4+8
INDIRI4
CNSTI4 0
EQI4 $397
line 553
;553:		UI_LogAwardData( AWARD_EXCELLENT, awardValues[AWARD_EXCELLENT] );
CNSTI4 2
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 554
;554:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_EXCELLENT;
ADDRLP4 1224
CNSTI4 2
ASGNI4
ADDRGP4 postgameMenuInfo+872
INDIRI4
ADDRLP4 1224
INDIRI4
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 555
;555:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_EXCELLENT];
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4+8
INDIRI4
ASGNI4
line 556
;556:		postgameMenuInfo.numAwards++;
ADDRLP4 1228
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 557
;557:	}
LABELV $397
line 559
;558:
;559:	if( awardValues[AWARD_GAUNTLET] ) {
ADDRLP4 4+12
INDIRI4
CNSTI4 0
EQI4 $407
line 560
;560:		UI_LogAwardData( AWARD_GAUNTLET, awardValues[AWARD_GAUNTLET] );
CNSTI4 3
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 561
;561:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_GAUNTLET;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 3
ASGNI4
line 562
;562:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_GAUNTLET];
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
ADDRLP4 4+12
INDIRI4
ASGNI4
line 563
;563:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 564
;564:	}
LABELV $407
line 566
;565:
;566:	oldFrags = UI_GetAwardLevel( AWARD_FRAGS ) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1224
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1132
ADDRLP4 1224
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 567
;567:	UI_LogAwardData( AWARD_FRAGS, awardValues[AWARD_FRAGS] );
CNSTI4 4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 568
;568:	newFrags = UI_GetAwardLevel( AWARD_FRAGS ) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1228
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1128
ADDRLP4 1228
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 569
;569:	if( newFrags > oldFrags ) {
ADDRLP4 1128
INDIRI4
ADDRLP4 1132
INDIRI4
LEI4 $418
line 570
;570:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_FRAGS;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 4
ASGNI4
line 571
;571:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = newFrags * 100;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
CNSTI4 100
ADDRLP4 1128
INDIRI4
MULI4
ASGNI4
line 572
;572:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 573
;573:	}
LABELV $418
line 575
;574:
;575:	if( awardValues[AWARD_PERFECT] ) {
ADDRLP4 4+20
INDIRI4
CNSTI4 0
EQI4 $425
line 576
;576:		UI_LogAwardData( AWARD_PERFECT, 1 );
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 577
;577:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_PERFECT;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+876
ADDP4
CNSTI4 5
ASGNI4
line 578
;578:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = 1;
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+900
ADDP4
CNSTI4 1
ASGNI4
line 579
;579:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+872
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 580
;580:	}
LABELV $425
line 582
;581:
;582:	if ( playerGameRank == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $433
line 583
;583:		postgameMenuInfo.won = UI_TierCompleted( postgameMenuInfo.level );
ADDRGP4 postgameMenuInfo+860
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 UI_TierCompleted
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+868
ADDRLP4 1232
INDIRI4
ASGNI4
line 584
;584:	}
ADDRGP4 $434
JUMPV
LABELV $433
line 585
;585:	else {
line 586
;586:		postgameMenuInfo.won = -1;
ADDRGP4 postgameMenuInfo+868
CNSTI4 -1
ASGNI4
line 587
;587:	}
LABELV $434
line 589
;588:
;589:	postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+560
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 590
;590:	postgameMenuInfo.scoreboardtime = uis.realtime;
ADDRGP4 postgameMenuInfo+564
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 592
;591:
;592:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 593
;593:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 595
;594:
;595:	UI_SPPostgameMenu_Init();
ADDRGP4 UI_SPPostgameMenu_Init
CALLV
pop
line 596
;596:	UI_PushMenu( &postgameMenuInfo.menu );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 598
;597:
;598:	if ( playerGameRank == 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $443
line 599
;599:		Menu_SetCursorToItem( &postgameMenuInfo.menu, &postgameMenuInfo.item_next );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+376
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 600
;600:	}
ADDRGP4 $444
JUMPV
LABELV $443
line 601
;601:	else {
line 602
;602:		Menu_SetCursorToItem( &postgameMenuInfo.menu, &postgameMenuInfo.item_again );
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+288
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 603
;603:	}
LABELV $444
line 605
;604:
;605:	Prepname( 0 );
CNSTI4 0
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 606
;606:	Prepname( 1 );
CNSTI4 1
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 607
;607:	Prepname( 2 );
CNSTI4 2
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 609
;608:
;609:	if ( playerGameRank != 1 ) {
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $447
line 610
;610:		postgameMenuInfo.winnerSound = trap_S_RegisterSound( va( "sound/player/announce/%s_wins.wav", postgameMenuInfo.placeNames[0] ), qfalse );
ADDRGP4 $450
ARGP4
ADDRGP4 postgameMenuInfo+668
ARGP4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1236
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+952
ADDRLP4 1236
INDIRI4
ASGNI4
line 611
;611:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/loss\n" );
CNSTI4 2
ARGI4
ADDRGP4 $452
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 612
;612:	}
ADDRGP4 $448
JUMPV
LABELV $447
line 613
;613:	else {
line 614
;614:		postgameMenuInfo.winnerSound = trap_S_RegisterSound( "sound/player/announce/youwin.wav", qfalse );
ADDRGP4 $274
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1232
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+952
ADDRLP4 1232
INDIRI4
ASGNI4
line 615
;615:		trap_Cmd_ExecuteText( EXEC_APPEND, "music music/win\n" );
CNSTI4 2
ARGI4
ADDRGP4 $454
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 616
;616:	}
LABELV $448
line 618
;617:
;618:	postgameMenuInfo.phase = 1;
ADDRGP4 postgameMenuInfo+552
CNSTI4 1
ASGNI4
line 620
;619:
;620:	postgameMenuInfo.lastTier = UI_GetNumSPTiers();
ADDRLP4 1232
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+948
ADDRLP4 1232
INDIRI4
ASGNI4
line 621
;621:	if ( UI_GetSpecialArenaInfo( "final" ) ) {
ADDRGP4 $459
ARGP4
ADDRLP4 1236
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $457
line 622
;622:		postgameMenuInfo.lastTier++;
ADDRLP4 1240
ADDRGP4 postgameMenuInfo+948
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 623
;623:	}
LABELV $457
line 624
;624:}
LABELV $349
endproc UI_SPPostgameMenu_f 1244 12
bss
align 1
LABELV arenainfo
skip 1024
align 4
LABELV postgameMenuInfo
skip 956
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
LABELV $459
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $454
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $452
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $450
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $355
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $351
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $274
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $273
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $272
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $265
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $264
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $263
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $262
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $261
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
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $260
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
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $259
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $251
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $240
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
byte 1 59
byte 1 32
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
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $239
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $237
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
LABELV $236
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
byte 1 59
byte 1 32
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
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $227
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
byte 1 59
byte 1 32
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
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 69
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $226
byte 1 0
align 1
LABELV $225
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $176
byte 1 115
byte 1 118
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $173
byte 1 35
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $172
byte 1 110
byte 1 0
align 1
LABELV $170
byte 1 40
byte 1 116
byte 1 105
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $148
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $145
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $119
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $110
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
byte 1 59
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $91
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $87
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
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $86
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
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $85
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
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $84
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
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
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
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
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
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $80
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $79
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $78
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $75
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $74
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $73
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $72
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $71
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
byte 1 0
align 1
LABELV $70
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
