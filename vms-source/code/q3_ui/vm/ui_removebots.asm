code
proc UI_RemoveBotsMenu_SetBotNames 1032 12
file "../ui_removebots.c"
line 67
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:/*
;4:=======================================================================
;5:
;6:REMOVE BOTS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define ART_BACKGROUND		"menu/art/addbotframe"
;16:#define ART_BACK0			"menu/art/back_0"
;17:#define ART_BACK1			"menu/art/back_1"	
;18:#define ART_DELETE0			"menu/art/delete_0"
;19:#define ART_DELETE1			"menu/art/delete_1"
;20:#define ART_ARROWS			"menu/art/arrows_vert_0"
;21:#define ART_ARROWUP			"menu/art/arrows_vert_top"
;22:#define ART_ARROWDOWN		"menu/art/arrows_vert_bot"
;23:
;24:#define ID_UP				10
;25:#define ID_DOWN				11
;26:#define ID_DELETE			12
;27:#define ID_BACK				13
;28:#define ID_BOTNAME0			20
;29:#define ID_BOTNAME1			21
;30:#define ID_BOTNAME2			22
;31:#define ID_BOTNAME3			23
;32:#define ID_BOTNAME4			24
;33:#define ID_BOTNAME5			25
;34:#define ID_BOTNAME6			26
;35:
;36:
;37:typedef struct {
;38:	menuframework_s	menu;
;39:
;40:	menutext_s		banner;
;41:	menubitmap_s	background;
;42:
;43:	menubitmap_s	arrows;
;44:	menubitmap_s	up;
;45:	menubitmap_s	down;
;46:
;47:	menutext_s		bots[7];
;48:
;49:	menubitmap_s	delete;
;50:	menubitmap_s	back;
;51:
;52:	int				numBots;
;53:	int				baseBotNum;
;54:	int				selectedBotNum;
;55:	char			botnames[7][32];
;56:	int				botClientNums[MAX_BOTS];
;57:} removeBotsMenuInfo_t;
;58:
;59:static removeBotsMenuInfo_t	removeBotsMenuInfo;
;60:
;61:
;62:/*
;63:=================
;64:UI_RemoveBotsMenu_SetBotNames
;65:=================
;66:*/
;67:static void UI_RemoveBotsMenu_SetBotNames( void ) {
line 71
;68:	int		n;
;69:	char	info[MAX_INFO_STRING];
;70:
;71:	for ( n = 0; (n < 7) && (removeBotsMenuInfo.baseBotNum + n < removeBotsMenuInfo.numBots); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $71
line 72
;72:		trap_GetConfigString( CS_PLAYERS + removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + n], info, MAX_INFO_STRING );
ADDRGP4 removeBotsMenuInfo+1396
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+1628
ADDP4
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
line 73
;73:		Q_strncpyz( removeBotsMenuInfo.botnames[n], Info_ValueForKey( info, "n" ), sizeof(removeBotsMenuInfo.botnames[n]) );
ADDRLP4 4
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+1404
ADDP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 74
;74:		Q_CleanStr( removeBotsMenuInfo.botnames[n] );
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+1404
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 75
;75:	}
LABELV $72
line 71
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $74
ADDRLP4 0
INDIRI4
CNSTI4 7
GEI4 $83
ADDRGP4 removeBotsMenuInfo+1396
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 removeBotsMenuInfo+1392
INDIRI4
LTI4 $71
LABELV $83
line 77
;76:
;77:}
LABELV $70
endproc UI_RemoveBotsMenu_SetBotNames 1032 12
proc UI_RemoveBotsMenu_DeleteEvent 4 8
line 85
;78:
;79:
;80:/*
;81:=================
;82:UI_RemoveBotsMenu_DeleteEvent
;83:=================
;84:*/
;85:static void UI_RemoveBotsMenu_DeleteEvent( void* ptr, int event ) {
line 86
;86:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $85
line 87
;87:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 90
;88:	}
;89:
;90:	trap_Cmd_ExecuteText( EXEC_APPEND, va("clientkick %i\n", removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + removeBotsMenuInfo.selectedBotNum]) );
ADDRGP4 $87
ARGP4
ADDRGP4 removeBotsMenuInfo+1396
INDIRI4
ADDRGP4 removeBotsMenuInfo+1400
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+1628
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 91
;91:}
LABELV $84
endproc UI_RemoveBotsMenu_DeleteEvent 4 8
proc UI_RemoveBotsMenu_BotEvent 0 0
line 99
;92:
;93:
;94:/*
;95:=================
;96:UI_RemoveBotsMenu_BotEvent
;97:=================
;98:*/
;99:static void UI_RemoveBotsMenu_BotEvent( void* ptr, int event ) {
line 100
;100:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
line 101
;101:		return;
ADDRGP4 $91
JUMPV
LABELV $92
line 104
;102:	}
;103:
;104:	removeBotsMenuInfo.bots[removeBotsMenuInfo.selectedBotNum].color = color_orange;
CNSTI4 72
ADDRGP4 removeBotsMenuInfo+1400
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 105
;105:	removeBotsMenuInfo.selectedBotNum = ((menucommon_s*)ptr)->id - ID_BOTNAME0;
ADDRGP4 removeBotsMenuInfo+1400
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
SUBI4
ASGNI4
line 106
;106:	removeBotsMenuInfo.bots[removeBotsMenuInfo.selectedBotNum].color = color_white;
CNSTI4 72
ADDRGP4 removeBotsMenuInfo+1400
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+68
ADDP4
ADDRGP4 color_white
ASGNP4
line 107
;107:}
LABELV $91
endproc UI_RemoveBotsMenu_BotEvent 0 0
proc UI_RemoveBotsMenu_BackEvent 0 0
line 115
;108:
;109:
;110:/*
;111:=================
;112:UI_RemoveAddBotsMenu_BackEvent
;113:=================
;114:*/
;115:static void UI_RemoveBotsMenu_BackEvent( void* ptr, int event ) {
line 116
;116:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $102
line 117
;117:		return;
ADDRGP4 $101
JUMPV
LABELV $102
line 119
;118:	}
;119:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 120
;120:}
LABELV $101
endproc UI_RemoveBotsMenu_BackEvent 0 0
proc UI_RemoveBotsMenu_UpEvent 4 0
line 128
;121:
;122:
;123:/*
;124:=================
;125:UI_RemoveBotsMenu_UpEvent
;126:=================
;127:*/
;128:static void UI_RemoveBotsMenu_UpEvent( void* ptr, int event ) {
line 129
;129:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $105
line 130
;130:		return;
ADDRGP4 $104
JUMPV
LABELV $105
line 133
;131:	}
;132:
;133:	if( removeBotsMenuInfo.baseBotNum > 0 ) {
ADDRGP4 removeBotsMenuInfo+1396
INDIRI4
CNSTI4 0
LEI4 $107
line 134
;134:		removeBotsMenuInfo.baseBotNum--;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+1396
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 135
;135:		UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 136
;136:	}
LABELV $107
line 137
;137:}
LABELV $104
endproc UI_RemoveBotsMenu_UpEvent 4 0
proc UI_RemoveBotsMenu_DownEvent 4 0
line 145
;138:
;139:
;140:/*
;141:=================
;142:UI_RemoveBotsMenu_DownEvent
;143:=================
;144:*/
;145:static void UI_RemoveBotsMenu_DownEvent( void* ptr, int event ) {
line 146
;146:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $112
line 147
;147:		return;
ADDRGP4 $111
JUMPV
LABELV $112
line 150
;148:	}
;149:
;150:	if( removeBotsMenuInfo.baseBotNum + 7 < removeBotsMenuInfo.numBots ) {
ADDRGP4 removeBotsMenuInfo+1396
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 removeBotsMenuInfo+1392
INDIRI4
GEI4 $114
line 151
;151:		removeBotsMenuInfo.baseBotNum++;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+1396
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 152
;152:		UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 153
;153:	}
LABELV $114
line 154
;154:}
LABELV $111
endproc UI_RemoveBotsMenu_DownEvent 4 0
proc UI_RemoveBotsMenu_GetBots 1056 12
line 162
;155:
;156:
;157:/*
;158:=================
;159:UI_RemoveBotsMenu_GetBots
;160:=================
;161:*/
;162:static void UI_RemoveBotsMenu_GetBots( void ) {
line 168
;163:	int		numPlayers;
;164:	int		isBot;
;165:	int		n;
;166:	char	info[MAX_INFO_STRING];
;167:
;168:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 169
;169:	numPlayers = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $120
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
line 170
;170:	removeBotsMenuInfo.numBots = 0;
ADDRGP4 removeBotsMenuInfo+1392
CNSTI4 0
ASGNI4
line 172
;171:
;172:	for( n = 0; n < numPlayers; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $122
line 173
;173:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
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
line 175
;174:
;175:		isBot = atoi( Info_ValueForKey( info, "skill" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1048
INDIRI4
ASGNI4
line 176
;176:		if( !isBot ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $127
line 177
;177:			continue;
ADDRGP4 $123
JUMPV
LABELV $127
line 180
;178:		}
;179:
;180:		removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.numBots] = n;
ADDRGP4 removeBotsMenuInfo+1392
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+1628
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 181
;181:		removeBotsMenuInfo.numBots++;
ADDRLP4 1052
ADDRGP4 removeBotsMenuInfo+1392
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 182
;182:	}
LABELV $123
line 172
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $125
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
LTI4 $122
line 183
;183:}
LABELV $119
endproc UI_RemoveBotsMenu_GetBots 1056 12
export UI_RemoveBots_Cache
proc UI_RemoveBots_Cache 0 4
line 191
;184:
;185:
;186:/*
;187:=================
;188:UI_RemoveBots_Cache
;189:=================
;190:*/
;191:void UI_RemoveBots_Cache( void ) {
line 192
;192:	trap_R_RegisterShaderNoMip( ART_BACKGROUND );
ADDRGP4 $133
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 193
;193:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 194
;194:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $135
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 195
;195:	trap_R_RegisterShaderNoMip( ART_DELETE0 );
ADDRGP4 $136
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 196
;196:	trap_R_RegisterShaderNoMip( ART_DELETE1 );
ADDRGP4 $137
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 197
;197:}
LABELV $132
endproc UI_RemoveBots_Cache 0 4
proc UI_RemoveBotsMenu_Init 24 12
line 205
;198:
;199:
;200:/*
;201:=================
;202:UI_RemoveBotsMenu_Init
;203:=================
;204:*/
;205:static void UI_RemoveBotsMenu_Init( void ) {
line 210
;206:	int		n;
;207:	int		count;
;208:	int		y;
;209:
;210:	memset( &removeBotsMenuInfo, 0 ,sizeof(removeBotsMenuInfo) );
ADDRGP4 removeBotsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5724
ARGI4
ADDRGP4 memset
CALLP4
pop
line 211
;211:	removeBotsMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 removeBotsMenuInfo+280
CNSTI4 0
ASGNI4
line 212
;212:	removeBotsMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 removeBotsMenuInfo+276
CNSTI4 1
ASGNI4
line 214
;213:
;214:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 216
;215:
;216:	UI_RemoveBotsMenu_GetBots();
ADDRGP4 UI_RemoveBotsMenu_GetBots
CALLV
pop
line 217
;217:	UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 218
;218:	count = removeBotsMenuInfo.numBots < 7 ? removeBotsMenuInfo.numBots : 7;
ADDRGP4 removeBotsMenuInfo+1392
INDIRI4
CNSTI4 7
GEI4 $144
ADDRLP4 12
ADDRGP4 removeBotsMenuInfo+1392
INDIRI4
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $144
ADDRLP4 12
CNSTI4 7
ASGNI4
LABELV $145
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 220
;219:
;220:	removeBotsMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 removeBotsMenuInfo+288
CNSTI4 10
ASGNI4
line 221
;221:	removeBotsMenuInfo.banner.generic.x			= 320;
ADDRGP4 removeBotsMenuInfo+288+12
CNSTI4 320
ASGNI4
line 222
;222:	removeBotsMenuInfo.banner.generic.y			= 16;
ADDRGP4 removeBotsMenuInfo+288+16
CNSTI4 16
ASGNI4
line 223
;223:	removeBotsMenuInfo.banner.string			= "REMOVE BOTS";
ADDRGP4 removeBotsMenuInfo+288+60
ADDRGP4 $153
ASGNP4
line 224
;224:	removeBotsMenuInfo.banner.color				= color_white;
ADDRGP4 removeBotsMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 225
;225:	removeBotsMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 removeBotsMenuInfo+288+64
CNSTI4 1
ASGNI4
line 227
;226:
;227:	removeBotsMenuInfo.background.generic.type	= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+360
CNSTI4 6
ASGNI4
line 228
;228:	removeBotsMenuInfo.background.generic.name	= ART_BACKGROUND;
ADDRGP4 removeBotsMenuInfo+360+4
ADDRGP4 $133
ASGNP4
line 229
;229:	removeBotsMenuInfo.background.generic.flags	= QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 230
;230:	removeBotsMenuInfo.background.generic.x		= 320-233;
ADDRGP4 removeBotsMenuInfo+360+12
CNSTI4 87
ASGNI4
line 231
;231:	removeBotsMenuInfo.background.generic.y		= 240-166;
ADDRGP4 removeBotsMenuInfo+360+16
CNSTI4 74
ASGNI4
line 232
;232:	removeBotsMenuInfo.background.width			= 466;
ADDRGP4 removeBotsMenuInfo+360+76
CNSTI4 466
ASGNI4
line 233
;233:	removeBotsMenuInfo.background.height		= 332;
ADDRGP4 removeBotsMenuInfo+360+80
CNSTI4 332
ASGNI4
line 235
;234:
;235:	removeBotsMenuInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+448
CNSTI4 6
ASGNI4
line 236
;236:	removeBotsMenuInfo.arrows.generic.name		= ART_ARROWS;
ADDRGP4 removeBotsMenuInfo+448+4
ADDRGP4 $174
ASGNP4
line 237
;237:	removeBotsMenuInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 238
;238:	removeBotsMenuInfo.arrows.generic.x			= 200;
ADDRGP4 removeBotsMenuInfo+448+12
CNSTI4 200
ASGNI4
line 239
;239:	removeBotsMenuInfo.arrows.generic.y			= 128;
ADDRGP4 removeBotsMenuInfo+448+16
CNSTI4 128
ASGNI4
line 240
;240:	removeBotsMenuInfo.arrows.width				= 64;
ADDRGP4 removeBotsMenuInfo+448+76
CNSTI4 64
ASGNI4
line 241
;241:	removeBotsMenuInfo.arrows.height			= 128;
ADDRGP4 removeBotsMenuInfo+448+80
CNSTI4 128
ASGNI4
line 243
;242:
;243:	removeBotsMenuInfo.up.generic.type			= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+536
CNSTI4 6
ASGNI4
line 244
;244:	removeBotsMenuInfo.up.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+536+44
CNSTU4 260
ASGNU4
line 245
;245:	removeBotsMenuInfo.up.generic.x				= 200;
ADDRGP4 removeBotsMenuInfo+536+12
CNSTI4 200
ASGNI4
line 246
;246:	removeBotsMenuInfo.up.generic.y				= 128;
ADDRGP4 removeBotsMenuInfo+536+16
CNSTI4 128
ASGNI4
line 247
;247:	removeBotsMenuInfo.up.generic.id			= ID_UP;
ADDRGP4 removeBotsMenuInfo+536+8
CNSTI4 10
ASGNI4
line 248
;248:	removeBotsMenuInfo.up.generic.callback		= UI_RemoveBotsMenu_UpEvent;
ADDRGP4 removeBotsMenuInfo+536+48
ADDRGP4 UI_RemoveBotsMenu_UpEvent
ASGNP4
line 249
;249:	removeBotsMenuInfo.up.width					= 64;
ADDRGP4 removeBotsMenuInfo+536+76
CNSTI4 64
ASGNI4
line 250
;250:	removeBotsMenuInfo.up.height				= 64;
ADDRGP4 removeBotsMenuInfo+536+80
CNSTI4 64
ASGNI4
line 251
;251:	removeBotsMenuInfo.up.focuspic				= ART_ARROWUP;
ADDRGP4 removeBotsMenuInfo+536+60
ADDRGP4 $202
ASGNP4
line 253
;252:
;253:	removeBotsMenuInfo.down.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+624
CNSTI4 6
ASGNI4
line 254
;254:	removeBotsMenuInfo.down.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+624+44
CNSTU4 260
ASGNU4
line 255
;255:	removeBotsMenuInfo.down.generic.x			= 200;
ADDRGP4 removeBotsMenuInfo+624+12
CNSTI4 200
ASGNI4
line 256
;256:	removeBotsMenuInfo.down.generic.y			= 128+64;
ADDRGP4 removeBotsMenuInfo+624+16
CNSTI4 192
ASGNI4
line 257
;257:	removeBotsMenuInfo.down.generic.id			= ID_DOWN;
ADDRGP4 removeBotsMenuInfo+624+8
CNSTI4 11
ASGNI4
line 258
;258:	removeBotsMenuInfo.down.generic.callback	= UI_RemoveBotsMenu_DownEvent;
ADDRGP4 removeBotsMenuInfo+624+48
ADDRGP4 UI_RemoveBotsMenu_DownEvent
ASGNP4
line 259
;259:	removeBotsMenuInfo.down.width				= 64;
ADDRGP4 removeBotsMenuInfo+624+76
CNSTI4 64
ASGNI4
line 260
;260:	removeBotsMenuInfo.down.height				= 64;
ADDRGP4 removeBotsMenuInfo+624+80
CNSTI4 64
ASGNI4
line 261
;261:	removeBotsMenuInfo.down.focuspic			= ART_ARROWDOWN;
ADDRGP4 removeBotsMenuInfo+624+60
ADDRGP4 $220
ASGNP4
line 263
;262:
;263:	for( n = 0, y = 120; n < count; n++, y += 20 ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 120
ASGNI4
ADDRGP4 $224
JUMPV
LABELV $221
line 264
;264:		removeBotsMenuInfo.bots[n].generic.type		= MTYPE_PTEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712
ADDP4
CNSTI4 9
ASGNI4
line 265
;265:		removeBotsMenuInfo.bots[n].generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+44
ADDP4
CNSTU4 260
ASGNU4
line 266
;266:		removeBotsMenuInfo.bots[n].generic.id		= ID_BOTNAME0 + n;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 267
;267:		removeBotsMenuInfo.bots[n].generic.x		= 320 - 56;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+12
ADDP4
CNSTI4 264
ASGNI4
line 268
;268:		removeBotsMenuInfo.bots[n].generic.y		= y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 269
;269:		removeBotsMenuInfo.bots[n].generic.callback	= UI_RemoveBotsMenu_BotEvent;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+48
ADDP4
ADDRGP4 UI_RemoveBotsMenu_BotEvent
ASGNP4
line 270
;270:		removeBotsMenuInfo.bots[n].string			= removeBotsMenuInfo.botnames[n];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+1404
ADDP4
ASGNP4
line 271
;271:		removeBotsMenuInfo.bots[n].color			= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 272
;272:		removeBotsMenuInfo.bots[n].style			= UI_LEFT|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712+64
ADDP4
CNSTI4 16
ASGNI4
line 273
;273:	}
LABELV $222
line 263
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $224
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $221
line 275
;274:
;275:	removeBotsMenuInfo.delete.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1216
CNSTI4 6
ASGNI4
line 276
;276:	removeBotsMenuInfo.delete.generic.name		= ART_DELETE0;
ADDRGP4 removeBotsMenuInfo+1216+4
ADDRGP4 $136
ASGNP4
line 277
;277:	removeBotsMenuInfo.delete.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+1216+44
CNSTU4 260
ASGNU4
line 278
;278:	removeBotsMenuInfo.delete.generic.id		= ID_DELETE;
ADDRGP4 removeBotsMenuInfo+1216+8
CNSTI4 12
ASGNI4
line 279
;279:	removeBotsMenuInfo.delete.generic.callback	= UI_RemoveBotsMenu_DeleteEvent;
ADDRGP4 removeBotsMenuInfo+1216+48
ADDRGP4 UI_RemoveBotsMenu_DeleteEvent
ASGNP4
line 280
;280:	removeBotsMenuInfo.delete.generic.x			= 320+128-128;
ADDRGP4 removeBotsMenuInfo+1216+12
CNSTI4 320
ASGNI4
line 281
;281:	removeBotsMenuInfo.delete.generic.y			= 256+128-64;
ADDRGP4 removeBotsMenuInfo+1216+16
CNSTI4 320
ASGNI4
line 282
;282:	removeBotsMenuInfo.delete.width  			= 128;
ADDRGP4 removeBotsMenuInfo+1216+76
CNSTI4 128
ASGNI4
line 283
;283:	removeBotsMenuInfo.delete.height  			= 64;
ADDRGP4 removeBotsMenuInfo+1216+80
CNSTI4 64
ASGNI4
line 284
;284:	removeBotsMenuInfo.delete.focuspic			= ART_DELETE1;
ADDRGP4 removeBotsMenuInfo+1216+60
ADDRGP4 $137
ASGNP4
line 286
;285:
;286:	removeBotsMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1304
CNSTI4 6
ASGNI4
line 287
;287:	removeBotsMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 removeBotsMenuInfo+1304+4
ADDRGP4 $134
ASGNP4
line 288
;288:	removeBotsMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+1304+44
CNSTU4 260
ASGNU4
line 289
;289:	removeBotsMenuInfo.back.generic.id			= ID_BACK;
ADDRGP4 removeBotsMenuInfo+1304+8
CNSTI4 13
ASGNI4
line 290
;290:	removeBotsMenuInfo.back.generic.callback	= UI_RemoveBotsMenu_BackEvent;
ADDRGP4 removeBotsMenuInfo+1304+48
ADDRGP4 UI_RemoveBotsMenu_BackEvent
ASGNP4
line 291
;291:	removeBotsMenuInfo.back.generic.x			= 320-128;
ADDRGP4 removeBotsMenuInfo+1304+12
CNSTI4 192
ASGNI4
line 292
;292:	removeBotsMenuInfo.back.generic.y			= 256+128-64;
ADDRGP4 removeBotsMenuInfo+1304+16
CNSTI4 320
ASGNI4
line 293
;293:	removeBotsMenuInfo.back.width				= 128;
ADDRGP4 removeBotsMenuInfo+1304+76
CNSTI4 128
ASGNI4
line 294
;294:	removeBotsMenuInfo.back.height				= 64;
ADDRGP4 removeBotsMenuInfo+1304+80
CNSTI4 64
ASGNI4
line 295
;295:	removeBotsMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 removeBotsMenuInfo+1304+60
ADDRGP4 $135
ASGNP4
line 297
;296:
;297:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.background );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 298
;298:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.banner );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 299
;299:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.arrows );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 300
;300:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.up );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 301
;301:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.down );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 302
;302:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 303
;303:		Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.bots[n] );
ADDRGP4 removeBotsMenuInfo
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 removeBotsMenuInfo+712
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 304
;304:	}
LABELV $287
line 302
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $286
line 305
;305:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.delete );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1216
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 306
;306:	Menu_AddItem( &removeBotsMenuInfo.menu, &removeBotsMenuInfo.back );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1304
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 308
;307:
;308:	removeBotsMenuInfo.baseBotNum = 0;
ADDRGP4 removeBotsMenuInfo+1396
CNSTI4 0
ASGNI4
line 309
;309:	removeBotsMenuInfo.selectedBotNum = 0;
ADDRGP4 removeBotsMenuInfo+1400
CNSTI4 0
ASGNI4
line 310
;310:	removeBotsMenuInfo.bots[0].color = color_white;
ADDRGP4 removeBotsMenuInfo+712+68
ADDRGP4 color_white
ASGNP4
line 311
;311:}
LABELV $138
endproc UI_RemoveBotsMenu_Init 24 12
export UI_RemoveBotsMenu
proc UI_RemoveBotsMenu 0 4
line 319
;312:
;313:
;314:/*
;315:=================
;316:UI_RemoveBotsMenu
;317:=================
;318:*/
;319:void UI_RemoveBotsMenu( void ) {
line 320
;320:	UI_RemoveBotsMenu_Init();
ADDRGP4 UI_RemoveBotsMenu_Init
CALLV
pop
line 321
;321:	UI_PushMenu( &removeBotsMenuInfo.menu );
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 322
;322:}
LABELV $297
endproc UI_RemoveBotsMenu 0 4
bss
align 4
LABELV removeBotsMenuInfo
skip 5724
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
import UI_VoipOptionsMenu
import UI_VoipOptionsMenu_Cache
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
lit
align 1
LABELV $220
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $202
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $174
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $153
byte 1 82
byte 1 69
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $137
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $135
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
LABELV $134
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
LABELV $133
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $120
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
LABELV $87
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $80
byte 1 110
byte 1 0
