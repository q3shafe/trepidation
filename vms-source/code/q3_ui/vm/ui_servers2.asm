data
align 4
LABELV master_items
address $67
address $68
address $69
byte 4 0
align 4
LABELV servertype_items
address $70
address $71
address $72
address $73
address $74
address $75
address $76
byte 4 0
align 4
LABELV sortkey_items
address $77
address $78
address $79
address $80
address $81
byte 4 0
align 4
LABELV gamenames
address $82
address $83
address $84
address $85
address $86
address $87
address $88
address $89
address $90
address $91
address $92
address $93
address $94
byte 4 0
align 4
LABELV netnames
address $94
address $95
address $96
byte 4 0
align 1
LABELV quake3worldMessage
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 114
byte 1 101
byte 1 105
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
byte 1 32
byte 1 45
byte 1 32
byte 1 78
byte 1 101
byte 1 119
byte 1 115
byte 1 44
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 121
byte 1 44
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
export punkbuster_items
align 4
LABELV punkbuster_items
address $97
address $98
byte 4 0
export punkbuster_msg
align 4
LABELV punkbuster_msg
address $99
address $100
address $101
address $102
byte 4 0
code
proc ArenaServers_MaxPing 8 4
file "../ui_servers2.c"
line 242
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MULTIPLAYER MENU (SERVER BROWSER)
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define MAX_GLOBALSERVERS		128
;16:#define MAX_PINGREQUESTS		32
;17:#define MAX_ADDRESSLENGTH		64
;18:#define MAX_HOSTNAMELENGTH		22
;19:#define MAX_MAPNAMELENGTH		16
;20:#define MAX_LISTBOXITEMS		128
;21:#define MAX_LOCALSERVERS		128
;22:#define MAX_STATUSLENGTH		64
;23:#define MAX_LEAGUELENGTH		28
;24:#define MAX_LISTBOXWIDTH		68
;25:
;26:#define ART_BACK0				"menu/art/back_0"
;27:#define ART_BACK1				"menu/art/back_1"
;28:#define ART_CREATE0				"menu/art/create_0"
;29:#define ART_CREATE1				"menu/art/create_1"
;30:#define ART_SPECIFY0			"menu/art/specify_0"
;31:#define ART_SPECIFY1			"menu/art/specify_1"
;32:#define ART_REFRESH0			"menu/art/refresh_0"
;33:#define ART_REFRESH1			"menu/art/refresh_1"
;34:#define ART_CONNECT0			"menu/art/fight_0"
;35:#define ART_CONNECT1			"menu/art/fight_1"
;36:#define ART_ARROWS0				"menu/art/arrows_vert_0"
;37:#define ART_ARROWS_UP			"menu/art/arrows_vert_top"
;38:#define ART_ARROWS_DOWN			"menu/art/arrows_vert_bot"
;39:#define ART_UNKNOWNMAP			"menu/art/unknownmap"
;40:#define ART_REMOVE0				"menu/art/delete_0"
;41:#define ART_REMOVE1				"menu/art/delete_1"
;42:#define ART_PUNKBUSTER		"menu/art/pblogo"
;43:
;44:#define ID_MASTER			10
;45:#define ID_GAMETYPE			11
;46:#define ID_SORTKEY			12
;47:#define ID_SHOW_FULL		13
;48:#define ID_SHOW_EMPTY		14
;49:#define ID_LIST				15
;50:#define ID_SCROLL_UP		16
;51:#define ID_SCROLL_DOWN		17
;52:#define ID_BACK				18
;53:#define ID_REFRESH			19
;54:#define ID_SPECIFY			20
;55:#define ID_CREATE			21
;56:#define ID_CONNECT			22
;57:#define ID_REMOVE			23
;58:#define ID_PUNKBUSTER 24
;59:
;60:#define GR_LOGO				30
;61:#define GR_LETTERS			31
;62:
;63:#define AS_LOCAL			0
;64:#define AS_MPLAYER			1
;65:#define AS_GLOBAL			2
;66:#define AS_FAVORITES		3
;67:
;68:#define SORT_HOST			0
;69:#define SORT_MAP			1
;70:#define SORT_CLIENTS		2
;71:#define SORT_GAME			3
;72:#define SORT_PING			4
;73:
;74:#define GAMES_ALL			0
;75:#define GAMES_FFA			1
;76:#define GAMES_TEAMPLAY		2
;77:#define GAMES_TOURNEY		3
;78:#define GAMES_CTF			4
;79:#define GAMES_FREEZE		5	// Shafe - Trep - New Gametype
;80:#define GAMES_LASTMAN		6	// Shafe - Trep - New Gametype
;81:
;82:static const char *master_items[] = {
;83:	"Local",
;84:	"Internet",
;85:	"Favorites",
;86:	0
;87:};
;88:
;89:static const char *servertype_items[] = {
;90:	"All",
;91:	"Free For All",
;92:	"Team Deathmatch",
;93:	"Tournament",
;94:	"Capture the Flag",
;95:	"Freeze Tag",			// Shafe - Trep - New Gametype
;96:	"Last Man Standing",	// Shafe - Trep - New Gametype
;97:	0
;98:};
;99:
;100:static const char *sortkey_items[] = {
;101:	"Server Name",
;102:	"Map Name",
;103:	"Open Player Spots",
;104:	"Game Type",
;105:	"Ping Time",
;106:	0
;107:};
;108:
;109:static char* gamenames[] = {
;110:	"DM ",	// deathmatch
;111:	"1v1",	// tournament
;112:	"SP ",	// single player
;113:	"Team DM",	// team deathmatch
;114:	"CTF",	// capture the flag
;115:	"One Flag CTF",		// one flag ctf
;116:	"OverLoad",				// Overload
;117:	"Harvester",			// Harvester
;118:	"Rocket Arena 3",	// Rocket Arena 3
;119:	"Q3F",						// Q3F
;120:	"Urban Terror",		// Urban Terror
;121:	"OSP",						// Orange Smoothie Productions
;122:	"???",			// unknown
;123:	0
;124:};
;125:
;126:static char* netnames[] = {
;127:	"???",
;128:	"UDP",
;129:	"IPX",
;130:	NULL
;131:};
;132:
;133:static char quake3worldMessage[] = "Visit treipidation.sourceforge.net - News, Community, Events, Files";
;134:
;135:const char* punkbuster_items[] = {
;136:	"Disabled",
;137:	"Enabled",
;138:	NULL
;139:};
;140:
;141:const char* punkbuster_msg[] = {
;142:	"PunkBuster will be",
;143:	"disabled the next time",
;144:	"Quake III Arena",
;145:	"is started.",
;146:	NULL
;147:};
;148:
;149:typedef struct {
;150:	char	adrstr[MAX_ADDRESSLENGTH];
;151:	int		start;
;152:} pinglist_t;
;153:
;154:typedef struct servernode_s {
;155:	char	adrstr[MAX_ADDRESSLENGTH];
;156:	char	hostname[MAX_HOSTNAMELENGTH+3];
;157:	char	mapname[MAX_MAPNAMELENGTH];
;158:	int		numclients;
;159:	int		maxclients;
;160:	int		pingtime;
;161:	int		gametype;
;162:	char	gamename[12];
;163:	int		nettype;
;164:	int		minPing;
;165:	int		maxPing;
;166:	qboolean bPB;
;167:
;168:} servernode_t; 
;169:
;170:typedef struct {
;171:	char			buff[MAX_LISTBOXWIDTH];
;172:	servernode_t*	servernode;
;173:} table_t;
;174:
;175:typedef struct {
;176:	menuframework_s		menu;
;177:
;178:	menutext_s			banner;
;179:
;180:	menulist_s			master;
;181:	menulist_s			gametype;
;182:	menulist_s			sortkey;
;183:	menuradiobutton_s	showfull;
;184:	menuradiobutton_s	showempty;
;185:
;186:	menulist_s			list;
;187:	menubitmap_s		mappic;
;188:	menubitmap_s		arrows;
;189:	menubitmap_s		up;
;190:	menubitmap_s		down;
;191:	menutext_s			status;
;192:	menutext_s			statusbar;
;193:
;194:	menubitmap_s		remove;
;195:	menubitmap_s		back;
;196:	menubitmap_s		refresh;
;197:	menubitmap_s		specify;
;198:	menubitmap_s		create;
;199:	menubitmap_s		go;
;200:
;201:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;202:	table_t				table[MAX_LISTBOXITEMS];
;203:	char*				items[MAX_LISTBOXITEMS];
;204:	int					numqueriedservers;
;205:	int					*numservers;
;206:	servernode_t		*serverlist;	
;207:	int					currentping;
;208:	qboolean			refreshservers;
;209:	int					nextpingtime;
;210:	int					maxservers;
;211:	int					refreshtime;
;212:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;213:	int					numfavoriteaddresses;
;214:
;215:	menulist_s		punkbuster;
;216:	menubitmap_s	pblogo;
;217:} arenaservers_t;
;218:
;219:static arenaservers_t	g_arenaservers;
;220:
;221:
;222:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;223:static int				g_numglobalservers;
;224:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;225:static int				g_numlocalservers;
;226:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;227:static int				g_numfavoriteservers;
;228:static servernode_t		g_mplayerserverlist[MAX_GLOBALSERVERS];
;229:static int				g_nummplayerservers;
;230:static int				g_servertype;
;231:static int				g_gametype;
;232:static int				g_sortkey;
;233:static int				g_emptyservers;
;234:static int				g_fullservers;
;235:
;236:
;237:/*
;238:=================
;239:ArenaServers_MaxPing
;240:=================
;241:*/
;242:static int ArenaServers_MaxPing( void ) {
line 245
;243:	int		maxPing;
;244:
;245:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $107
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
line 246
;246:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $108
line 247
;247:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 248
;248:	}
LABELV $108
line 249
;249:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $106
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 258
;250:}
;251:
;252:
;253:/*
;254:=================
;255:ArenaServers_Compare
;256:=================
;257:*/
;258:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 264
;259:	float			f1;
;260:	float			f2;
;261:	servernode_t*	t1;
;262:	servernode_t*	t2;
;263:
;264:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 265
;265:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 267
;266:
;267:	switch( g_sortkey ) {
ADDRLP4 16
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $111
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $111
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $134
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $134
address $113
address $114
address $115
address $124
address $129
code
LABELV $113
line 269
;268:	case SORT_HOST:
;269:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $114
line 272
;270:
;271:	case SORT_MAP:
;272:		return Q_stricmp( t1->mapname, t2->mapname );
ADDRLP4 28
CNSTI4 89
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $115
line 275
;273:
;274:	case SORT_CLIENTS:
;275:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 276
;276:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $116
line 277
;277:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 278
;278:		}
LABELV $116
line 280
;279:
;280:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 40
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 281
;281:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $118
line 282
;282:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 283
;283:		}
LABELV $118
line 285
;284:
;285:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $120
line 286
;286:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $110
JUMPV
LABELV $120
line 288
;287:		}
;288:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $122
line 289
;289:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $122
line 291
;290:		}
;291:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $110
JUMPV
LABELV $124
line 294
;292:
;293:	case SORT_GAME:
;294:		if( t1->gametype < t2->gametype ) {
ADDRLP4 44
CNSTI4 120
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
GEI4 $125
line 295
;295:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $110
JUMPV
LABELV $125
line 297
;296:		}
;297:		if( t1->gametype == t2->gametype ) {
ADDRLP4 48
CNSTI4 120
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $127
line 298
;298:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $127
line 300
;299:		}
;300:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $110
JUMPV
LABELV $129
line 303
;301:
;302:	case SORT_PING:
;303:		if( t1->pingtime < t2->pingtime ) {
ADDRLP4 52
CNSTI4 116
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
GEI4 $130
line 304
;304:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $110
JUMPV
LABELV $130
line 306
;305:		}
;306:		if( t1->pingtime > t2->pingtime ) {
ADDRLP4 56
CNSTI4 116
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
LEI4 $132
line 307
;307:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $110
JUMPV
LABELV $132
line 309
;308:		}
;309:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 60
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $110
JUMPV
LABELV $111
line 312
;310:	}
;311:
;312:	return 0;
CNSTI4 0
RETI4
LABELV $110
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 8 8
line 321
;313:}
;314:
;315:
;316:/*
;317:=================
;318:ArenaServers_Go
;319:=================
;320:*/
;321:static void ArenaServers_Go( void ) {
line 324
;322:	servernode_t*	servernode;
;323:
;324:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+776+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072+68
ADDP4
INDIRP4
ASGNP4
line 325
;325:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
line 326
;326:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $142
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 327
;327:	}
LABELV $140
line 328
;328:}
LABELV $135
endproc ArenaServers_Go 8 8
bss
align 1
LABELV $144
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 336
;329:
;330:
;331:/*
;332:=================
;333:ArenaServers_UpdatePicture
;334:=================
;335:*/
;336:static void ArenaServers_UpdatePicture( void ) {
line 340
;337:	static char		picname[64];
;338:	servernode_t*	servernodeptr;
;339:
;340:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+776+68
INDIRI4
CNSTI4 0
NEI4 $145
line 341
;341:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+872+4
CNSTP4 0
ASGNP4
line 342
;342:	}
ADDRGP4 $146
JUMPV
LABELV $145
line 343
;343:	else {
line 344
;344:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+776+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072+68
ADDP4
INDIRP4
ASGNP4
line 345
;345:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $144
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $155
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 346
;346:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+872+4
ADDRGP4 $144
ASGNP4
line 348
;347:	
;348:	}
LABELV $146
line 351
;349:
;350:	// force shader update during draw
;351:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+872+68
CNSTI4 0
ASGNI4
line 352
;352:}
LABELV $143
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateMenu 68 48
line 360
;353:
;354:
;355:/*
;356:=================
;357:ArenaServers_UpdateMenu
;358:=================
;359:*/
;360:static void ArenaServers_UpdateMenu( void ) {
line 369
;361:	int				i;
;362:	int				j;
;363:	int				count;
;364:	char*			buff;
;365:	servernode_t*	servernodeptr;
;366:	table_t*		tableptr;
;367:	char			*pingColor;
;368:
;369:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+13800
INDIRI4
CNSTI4 0
LEI4 $161
line 371
;370:		// servers found
;371:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $164
ADDRGP4 g_arenaservers+13812
INDIRI4
ADDRGP4 g_arenaservers+13800
INDIRI4
GTI4 $164
line 373
;372:			// show progress
;373:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Trepidation Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $171
ARGP4
ADDRGP4 g_arenaservers+13812
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+13800
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 374
;374:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $176
ASGNP4
line 375
;375:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 376
;376:		}
ADDRGP4 $162
JUMPV
LABELV $164
line 377
;377:		else {
line 379
;378:			// all servers pinged - enable controls
;379:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+360+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 380
;380:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+456+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 381
;381:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+552+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 382
;382:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+712+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 383
;383:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 384
;384:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 385
;385:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1544+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 386
;386:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1808+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 387
;387:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+14860+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 390
;388:
;389:			// update status bar
;390:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 64
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $199
ADDRLP4 64
INDIRI4
CNSTI4 1
NEI4 $197
LABELV $199
line 391
;391:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 quake3worldMessage
ASGNP4
line 392
;392:			}
ADDRGP4 $162
JUMPV
LABELV $197
line 393
;393:			else {
line 394
;394:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $204
ASGNP4
line 395
;395:			}
line 397
;396:
;397:		}
line 398
;398:	}
ADDRGP4 $162
JUMPV
LABELV $161
line 399
;399:	else {
line 401
;400:		// no servers found
;401:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $205
line 402
;402:			strcpy( g_arenaservers.status.string,"Scanning The Trepidation Universe." );
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $210
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 403
;403:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $176
ASGNP4
line 406
;404:
;405:			// disable controls during refresh
;406:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+360+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 407
;407:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+456+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 408
;408:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+552+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 409
;409:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+712+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 410
;410:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 411
;411:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 412
;412:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1544+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 413
;413:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1808+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 414
;414:			g_arenaservers.punkbuster.generic.flags |= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+14860+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 415
;415:		}
ADDRGP4 $206
JUMPV
LABELV $205
line 416
;416:		else {
line 417
;417:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+13800
INDIRI4
CNSTI4 0
GEI4 $231
line 418
;418:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $236
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 419
;419:			}
ADDRGP4 $232
JUMPV
LABELV $231
line 420
;420:			else {
line 421
;421:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $239
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 422
;422:			}
LABELV $232
line 425
;423:
;424:			// update status bar
;425:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 28
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $242
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $240
LABELV $242
line 426
;426:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 quake3worldMessage
ASGNP4
line 427
;427:			}
ADDRGP4 $241
JUMPV
LABELV $240
line 428
;428:			else {
line 429
;429:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $204
ASGNP4
line 430
;430:			}
LABELV $241
line 433
;431:
;432:			// end of refresh - set control state
;433:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+360+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 434
;434:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+456+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 435
;435:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+552+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 436
;436:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+712+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 437
;437:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 438
;438:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 439
;439:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1544+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 440
;440:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+1808+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 441
;441:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+14860+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 442
;442:		}
LABELV $206
line 445
;443:
;444:		// zero out list box
;445:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+776+68
CNSTI4 0
ASGNI4
line 446
;446:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+776+64
CNSTI4 0
ASGNI4
line 447
;447:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+776+72
CNSTI4 0
ASGNI4
line 450
;448:
;449:		// update picture
;450:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 451
;451:		return;
ADDRGP4 $160
JUMPV
LABELV $162
line 455
;452:	}
;453:
;454:	// build list box strings - apply culling filters
;455:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+13808
INDIRP4
ASGNP4
line 456
;456:	count         = *g_arenaservers.numservers;
ADDRLP4 24
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 457
;457:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 458
;458:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
CNSTI4 72
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072
ADDP4
ASGNP4
line 459
;459:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 460
;460:		buff = tableptr->buff;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
line 463
;461:
;462:		// can only cull valid results
;463:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $278
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $278
line 464
;464:			continue;
ADDRGP4 $274
JUMPV
LABELV $278
line 467
;465:		}
;466:
;467:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $280
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
NEI4 $280
line 468
;468:			continue;
ADDRGP4 $274
JUMPV
LABELV $280
line 471
;469:		}
;470:
;471:		switch( g_gametype ) {
ADDRLP4 40
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $282
ADDRLP4 40
INDIRI4
CNSTI4 6
GTI4 $282
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $303
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $303
address $283
address $285
address $288
address $291
address $294
address $297
address $300
code
line 473
;472:		case GAMES_ALL:
;473:			break;
LABELV $285
line 476
;474:
;475:		case GAMES_FFA:
;476:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
line 477
;477:				continue;
ADDRGP4 $274
JUMPV
line 479
;478:			}
;479:			break;
LABELV $288
line 482
;480:
;481:		case GAMES_TEAMPLAY:
;482:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 3
EQI4 $283
line 483
;483:				continue;
ADDRGP4 $274
JUMPV
line 485
;484:			}
;485:			break;
LABELV $291
line 488
;486:
;487:		case GAMES_TOURNEY:
;488:			if( servernodeptr->gametype != GT_TOURNAMENT ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 1
EQI4 $283
line 489
;489:				continue;
ADDRGP4 $274
JUMPV
line 491
;490:			}
;491:			break;
LABELV $294
line 494
;492:
;493:		case GAMES_CTF:
;494:			if( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 4
EQI4 $283
line 495
;495:				continue;
ADDRGP4 $274
JUMPV
line 497
;496:			}
;497:			break;
LABELV $297
line 499
;498:		case GAMES_FREEZE:  // Shafe - Trep - Game type Freeze - Server Filter - This isnt a filter yet
;499:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 3
EQI4 $283
line 500
;500:					continue;
ADDRGP4 $274
JUMPV
line 502
;501:			}
;502:			break;
LABELV $300
line 504
;503:		case GAMES_LASTMAN: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet
;504:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
line 505
;505:				continue;
ADDRGP4 $274
JUMPV
line 507
;506:			}
;507:			break;
LABELV $282
LABELV $283
line 510
;508:		}
;509:
;510:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
GEI4 $304
line 511
;511:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $306
ASGNP4
line 512
;512:		}
ADDRGP4 $305
JUMPV
LABELV $304
line 513
;513:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $307
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $307
line 514
;514:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $306
ASGNP4
line 515
;515:		}
ADDRGP4 $308
JUMPV
LABELV $307
line 516
;516:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 200
GEI4 $309
line 517
;517:			pingColor = S_COLOR_GREEN;
ADDRLP4 20
ADDRGP4 $311
ASGNP4
line 518
;518:		}
ADDRGP4 $310
JUMPV
LABELV $309
line 519
;519:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 400
GEI4 $312
line 520
;520:			pingColor = S_COLOR_YELLOW;
ADDRLP4 20
ADDRGP4 $314
ASGNP4
line 521
;521:		}
ADDRGP4 $313
JUMPV
LABELV $312
line 522
;522:		else {
line 523
;523:			pingColor = S_COLOR_RED;
ADDRLP4 20
ADDRGP4 $315
ASGNP4
line 524
;524:		}
LABELV $313
LABELV $310
LABELV $308
LABELV $305
line 526
;525:
;526:		Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $316
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
EQI4 $320
ADDRLP4 56
ADDRGP4 $317
ASGNP4
ADDRGP4 $321
JUMPV
LABELV $320
ADDRLP4 56
ADDRGP4 $318
ASGNP4
LABELV $321
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 530
;527:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;528: 			servernodeptr->maxclients, servernodeptr->gamename,
;529:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime, servernodeptr->bPB ? "Yes" : "No" );
;530:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 531
;531:	}
LABELV $274
line 457
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
LABELV $276
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $273
line 533
;532:
;533:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+776+68
ADDRLP4 8
INDIRI4
ASGNI4
line 534
;534:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+776+64
CNSTI4 0
ASGNI4
line 535
;535:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+776+72
CNSTI4 0
ASGNI4
line 538
;536:
;537:	// update picture
;538:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 539
;539:}
LABELV $160
endproc ArenaServers_UpdateMenu 68 48
proc ArenaServers_Remove 24 12
line 548
;540:
;541:
;542:/*
;543:=================
;544:ArenaServers_Remove
;545:=================
;546:*/
;547:static void ArenaServers_Remove( void )
;548:{
line 553
;549:	int				i;
;550:	servernode_t*	servernodeptr;
;551:	table_t*		tableptr;
;552:
;553:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+776+68
INDIRI4
CNSTI4 0
NEI4 $329
line 554
;554:		return;
ADDRGP4 $328
JUMPV
LABELV $329
line 560
;555:
;556:	// remove selected item from display list
;557:	// items are in scattered order due to sort and cull
;558:	// perform delete on list box contents, resync all lists
;559:
;560:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 72
ADDRGP4 g_arenaservers+776+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072
ADDP4
ASGNP4
line 561
;561:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
line 564
;562:
;563:	// find address in master list
;564:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $336
line 565
;565:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $341
line 566
;566:				break;
ADDRGP4 $338
JUMPV
LABELV $341
LABELV $337
line 564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $339
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
LTI4 $336
LABELV $338
line 569
;567:
;568:	// delete address from master list
;569:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
CNSTI4 1
SUBI4
GTI4 $344
line 570
;570:	{
line 571
;571:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
CNSTI4 1
SUBI4
GEI4 $347
line 572
;572:		{
line 574
;573:			// shift items up
;574:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*sizeof(MAX_ADDRESSLENGTH));
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_arenaservers+13832+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+14856
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 575
;575:		}
LABELV $347
line 576
;576:		g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+14856
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 577
;577:	}	
LABELV $344
line 580
;578:
;579:	// find address in server list
;580:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 581
;581:		if (&g_favoriteserverlist[i] == servernodeptr)
CNSTI4 152
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $359
line 582
;582:				break;
ADDRGP4 $357
JUMPV
LABELV $359
LABELV $356
line 580
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $355
LABELV $357
line 585
;583:
;584:	// delete address from server list
;585:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $361
line 586
;586:	{
line 587
;587:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $363
line 588
;588:		{
line 590
;589:			// shift items up
;590:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 20
CNSTI4 152
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_favoriteserverlist+152
ADDP4
ARGP4
CNSTU4 152
ADDRGP4 g_numfavoriteservers
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 591
;591:		}
LABELV $363
line 592
;592:		g_numfavoriteservers--;
ADDRLP4 16
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 593
;593:	}	
LABELV $361
line 595
;594:
;595:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+14856
INDIRI4
ASGNI4
line 596
;596:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13812
ADDRGP4 g_arenaservers+14856
INDIRI4
ASGNI4
line 597
;597:}
LABELV $328
endproc ArenaServers_Remove 24 12
proc ArenaServers_Insert 84 12
line 606
;598:
;599:
;600:/*
;601:=================
;602:ArenaServers_Insert
;603:=================
;604:*/
;605:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;606:{
line 612
;607:	servernode_t*	servernodeptr;
;608:	char*			s;
;609:	int				i;
;610:
;611:
;612:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 12
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $371
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $371
line 613
;613:	{
line 615
;614:		// slow global or local servers do not get entered
;615:		return;
ADDRGP4 $370
JUMPV
LABELV $371
line 618
;616:	}
;617:
;618:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+13824
INDIRI4
LTI4 $373
line 620
;619:		// list full;
;620:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 0
CNSTI4 152
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13808
INDIRP4
ADDP4
CNSTI4 -152
ADDP4
ASGNP4
line 621
;621:	} else {
ADDRGP4 $374
JUMPV
LABELV $373
line 623
;622:		// next slot
;623:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 0
CNSTI4 152
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13808
INDIRP4
ADDP4
ASGNP4
line 624
;624:		(*g_arenaservers.numservers)++;
ADDRLP4 16
ADDRGP4 g_arenaservers+13804
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 625
;625:	}
LABELV $374
line 627
;626:
;627:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
ADDRLP4 0
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
line 629
;628:
;629:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 630
;630:	Q_CleanStr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 631
;631:	Q_strupr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 633
;632:
;633:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 634
;634:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 635
;635:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 637
;636:
;637:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $384
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 638
;638:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $385
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 639
;639:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 640
;640:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 641
;641:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 642
;642:	servernodeptr->bPB = atoi( Info_ValueForKey( info, "punkbuster") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $388
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
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 660
;643:
;644:	/*
;645:	s = Info_ValueForKey( info, "nettype" );
;646:	for (i=0; ;i++)
;647:	{
;648:		if (!netnames[i])
;649:		{
;650:			servernodeptr->nettype = 0;
;651:			break;
;652:		}
;653:		else if (!Q_stricmp( netnames[i], s ))
;654:		{
;655:			servernodeptr->nettype = i;
;656:			break;
;657:		}
;658:	}
;659:	*/
;660:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 662
;661:
;662:	s = Info_ValueForKey( info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 72
INDIRP4
ASGNP4
line 663
;663:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 664
;664:	if( i < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $392
line 665
;665:		i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 666
;666:	}
ADDRGP4 $393
JUMPV
LABELV $392
line 667
;667:	else if( i > 11 ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
LEI4 $394
line 668
;668:		i = 12;
ADDRLP4 4
CNSTI4 12
ASGNI4
line 669
;669:	}
LABELV $394
LABELV $393
line 670
;670:	if( *s ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $396
line 671
;671:		servernodeptr->gametype = i;//-1;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 672
;672:		Q_strncpyz( servernodeptr->gamename, s, sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 673
;673:	}
ADDRGP4 $397
JUMPV
LABELV $396
line 674
;674:	else {
line 675
;675:		servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 676
;676:		Q_strncpyz( servernodeptr->gamename, gamenames[i], sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamenames
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 677
;677:	}
LABELV $397
line 678
;678:}
LABELV $370
endproc ArenaServers_Insert 84 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 689
;679:
;680:
;681:/*
;682:=================
;683:ArenaServers_InsertFavorites
;684:
;685:Insert nonresponsive address book entries into display lists.
;686:=================
;687:*/
;688:void ArenaServers_InsertFavorites( void )
;689:{
line 695
;690:	int		i;
;691:	int		j;
;692:	char	info[MAX_INFO_STRING];
;693:
;694:	// resync existing results with new or deleted cvars
;695:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 696
;696:	Info_SetValueForKey( info, "hostname", "No Response" );
ADDRLP4 8
ARGP4
ADDRGP4 $382
ARGP4
ADDRGP4 $399
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 697
;697:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $400
line 698
;698:	{
line 700
;699:		// find favorite address in refresh list
;700:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 701
;701:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
CNSTI4 152
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $409
line 702
;702:				break;
ADDRGP4 $407
JUMPV
LABELV $409
LABELV $406
line 700
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $405
LABELV $407
line 704
;703:
;704:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $412
line 705
;705:		{
line 707
;706:			// not in list, add it
;707:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
ADDRLP4 1036
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 708
;708:		}
LABELV $412
line 709
;709:	}
LABELV $401
line 697
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $403
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
LTI4 $400
line 710
;710:}
LABELV $398
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 3552 12
line 721
;711:
;712:
;713:/*
;714:=================
;715:ArenaServers_LoadFavorites
;716:
;717:Load cvar address book entries into local lists.
;718:=================
;719:*/
;720:void ArenaServers_LoadFavorites( void )
;721:{
line 730
;722:	int				i;
;723:	int				j;
;724:	int				numtempitems;
;725:	char			emptyinfo[MAX_INFO_STRING];
;726:	char			adrstr[MAX_ADDRESSLENGTH];
;727:	servernode_t	templist[MAX_FAVORITESERVERS];
;728:	qboolean		found;
;729:
;730:	found        = qfalse;
ADDRLP4 2508
CNSTI4 0
ASGNI4
line 731
;731:	emptyinfo[0] = '\0';
ADDRLP4 2512
CNSTI1 0
ASGNI1
line 734
;732:
;733:	// copy the old
;734:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 2432
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 735
;735:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 738
;736:
;737:	// clear the current for sync
;738:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2432
ARGI4
ADDRGP4 memset
CALLP4
pop
line 739
;739:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 742
;740:
;741:	// resync existing results with new or deleted cvars
;742:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 2504
CNSTI4 0
ASGNI4
LABELV $416
line 743
;743:	{
line 744
;744:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $420
ARGP4
ADDRLP4 2504
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 3536
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3536
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 745
;745:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $421
line 746
;746:			continue;
ADDRGP4 $417
JUMPV
LABELV $421
line 750
;747:
;748:		// quick sanity check to avoid slow domain name resolving
;749:		// first character must be numeric
;750:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 3540
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3540
INDIRI4
CNSTI4 48
LTI4 $425
ADDRLP4 3540
INDIRI4
CNSTI4 57
LEI4 $423
LABELV $425
line 751
;751:			continue;
ADDRGP4 $417
JUMPV
LABELV $423
line 756
;752:
;753:		// favorite server addresses must be maintained outside refresh list
;754:		// this mimics local and global netadr's stored in client
;755:		// these can be fetched to fill ping list
;756:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 759
;757:
;758:		// find this server in the old list
;759:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $427
line 760
;760:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
CNSTI4 152
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3544
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3544
INDIRI4
CNSTI4 0
NEI4 $431
line 761
;761:				break;
ADDRGP4 $429
JUMPV
LABELV $431
LABELV $428
line 759
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $430
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $427
LABELV $429
line 763
;762:
;763:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $433
line 764
;764:		{
line 766
;765:			// found server - add exisiting results
;766:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRLP4 3548
CNSTI4 152
ASGNI4
ADDRLP4 3548
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 3548
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 3548
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 767
;767:			found = qtrue;
ADDRLP4 2508
CNSTI4 1
ASGNI4
line 768
;768:		}
ADDRGP4 $434
JUMPV
LABELV $433
line 770
;769:		else
;770:		{
line 772
;771:			// add new server
;772:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
CNSTI4 152
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 773
;773:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 3548
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
CNSTI4 152
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist+116
ADDP4
ADDRLP4 3548
INDIRI4
ASGNI4
line 774
;774:		}
LABELV $434
line 776
;775:
;776:		g_numfavoriteservers++;
ADDRLP4 3548
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 3548
INDIRP4
ADDRLP4 3548
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 777
;777:	}
LABELV $417
line 742
ADDRLP4 2504
ADDRLP4 2504
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2504
INDIRI4
CNSTI4 16
LTI4 $416
line 779
;778:
;779:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+14856
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 781
;780:
;781:	if (!found)
ADDRLP4 2508
INDIRI4
CNSTI4 0
NEI4 $437
line 782
;782:	{
line 785
;783:		// no results were found, reset server list
;784:		// list will be automatically refreshed when selected
;785:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 786
;786:	}
LABELV $437
line 787
;787:}
LABELV $415
endproc ArenaServers_LoadFavorites 3552 12
proc ArenaServers_StopRefresh 0 16
line 796
;788:
;789:
;790:/*
;791:=================
;792:ArenaServers_StopRefresh
;793:=================
;794:*/
;795:static void ArenaServers_StopRefresh( void )
;796:{
line 797
;797:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
NEI4 $440
line 799
;798:		// not currently refreshing
;799:		return;
ADDRGP4 $439
JUMPV
LABELV $440
line 801
;800:
;801:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+13816
CNSTI4 0
ASGNI4
line 803
;802:
;803:	if (g_servertype == AS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $444
line 804
;804:	{
line 806
;805:		// nonresponsive favorites must be shown
;806:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 807
;807:	}
LABELV $444
line 810
;808:
;809:	// final tally
;810:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+13800
INDIRI4
CNSTI4 0
LTI4 $446
line 811
;811:	{
line 812
;812:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13812
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 813
;813:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 814
;814:	}
LABELV $446
line 817
;815:	
;816:	// sort
;817:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 819
;818:
;819:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 820
;820:}
LABELV $439
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 829
;821:
;822:
;823:/*
;824:=================
;825:ArenaServers_DoRefresh
;826:=================
;827:*/
;828:static void ArenaServers_DoRefresh( void )
;829:{
line 837
;830:	int		i;
;831:	int		j;
;832:	int		time;
;833:	int		maxPing;
;834:	char	adrstr[MAX_ADDRESSLENGTH];
;835:	char	info[MAX_INFO_STRING];
;836:
;837:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13828
INDIRI4
GEI4 $456
line 838
;838:	{
line 839
;839:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $460
line 840
;840:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $462
line 841
;841:				if (!trap_LAN_GetServerCount(g_servertype)) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $464
line 842
;842:					return;
ADDRGP4 $455
JUMPV
LABELV $464
line 844
;843:				}
;844:			}
LABELV $462
line 845
;845:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
GEI4 $466
line 847
;846:			  // still waiting for response
;847:			  return;
ADDRGP4 $455
JUMPV
LABELV $466
line 849
;848:			}
;849:	  }
LABELV $460
line 850
;850:	}
LABELV $456
line 852
;851:
;852:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13820
INDIRI4
GEI4 $468
line 853
;853:	{
line 855
;854:		// wait for time trigger
;855:		return;
ADDRGP4 $455
JUMPV
LABELV $468
line 859
;856:	}
;857:
;858:	// trigger at 10Hz intervals
;859:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+13820
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 862
;860:
;861:	// process ping results
;862:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 863
;863:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $474
line 864
;864:	{
line 865
;865:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 trap_LAN_GetPing
CALLV
pop
line 866
;866:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $478
line 867
;867:		{
line 869
;868:			// ignore empty or pending pings
;869:			continue;
ADDRGP4 $475
JUMPV
LABELV $478
line 873
;870:		}
;871:
;872:		// find ping result in our local list
;873:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $480
line 874
;874:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
ADDRLP4 4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $484
line 875
;875:				break;
ADDRGP4 $482
JUMPV
LABELV $484
LABELV $481
line 873
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $480
LABELV $482
line 877
;876:
;877:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $487
line 878
;878:		{
line 880
;879:			// found it
;880:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $489
line 881
;881:			{
line 882
;882:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 883
;883:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $494
line 884
;884:				{
line 886
;885:					// still waiting
;886:					continue;
ADDRGP4 $475
JUMPV
LABELV $494
line 888
;887:				}
;888:			}
LABELV $489
line 890
;889:
;890:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $496
line 891
;891:			{
line 893
;892:				// stale it out
;893:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 894
;894:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 895
;895:			}
ADDRGP4 $497
JUMPV
LABELV $496
line 897
;896:			else
;897:			{
line 898
;898:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetPingInfo
CALLV
pop
line 899
;899:			}
LABELV $497
line 902
;900:
;901:			// insert ping results
;902:			ArenaServers_Insert( adrstr, info, time );
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 905
;903:
;904:			// clear this query from internal list
;905:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
CNSTI1 0
ASGNI1
line 906
;906:   		}
LABELV $487
line 909
;907:
;908:		// clear this query from external list
;909:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 910
;910:	}
LABELV $475
line 863
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $474
line 914
;911:
;912:	// get results of servers query
;913:	// counts can increase as servers respond
;914:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $499
line 915
;915:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+14856
INDIRI4
ASGNI4
line 916
;916:	} else {
ADDRGP4 $500
JUMPV
LABELV $499
line 917
;917:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+13800
ADDRLP4 1108
INDIRI4
ASGNI4
line 918
;918:	}
LABELV $500
line 925
;919:
;920://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;921://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;922:
;923:	// send ping requests in reasonable bursts
;924:	// iterate ping through all found servers
;925:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $507
JUMPV
LABELV $504
line 926
;926:	{
line 927
;927:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $510
line 928
;928:		{
line 930
;929:			// ping queue is full
;930:			break;
ADDRGP4 $506
JUMPV
LABELV $510
line 934
;931:		}
;932:
;933:		// find empty slot
;934:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $512
line 935
;935:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $516
line 936
;936:				break;
ADDRGP4 $514
JUMPV
LABELV $516
LABELV $513
line 934
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $512
LABELV $514
line 938
;937:
;938:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $519
line 940
;939:			// no empty slots available yet - wait for timeout
;940:			break;
ADDRGP4 $506
JUMPV
LABELV $519
line 944
;941:
;942:		// get an address to ping
;943:
;944:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $521
line 945
;945:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+13812
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 946
;946:		} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 947
;947:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+13812
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 948
;948:		}
LABELV $522
line 950
;949:
;950:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 951
;951:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 953
;952:
;953:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $530
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 956
;954:		
;955:		// advance to next server
;956:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+13812
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 957
;957:	}
LABELV $505
line 925
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $507
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $532
ADDRGP4 g_arenaservers+13812
INDIRI4
ADDRGP4 g_arenaservers+13800
INDIRI4
LTI4 $504
LABELV $532
LABELV $506
line 959
;958:
;959:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $533
line 960
;960:	{
line 962
;961:		// all pings completed
;962:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 963
;963:		return;
ADDRGP4 $455
JUMPV
LABELV $533
line 967
;964:	}
;965:
;966:	// update the user interface with ping status
;967:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 968
;968:}
LABELV $455
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 977
;969:
;970:
;971:/*
;972:=================
;973:ArenaServers_StartRefresh
;974:=================
;975:*/
;976:static void ArenaServers_StartRefresh( void )
;977:{
line 981
;978:	int		i;
;979:	char	myargs[32], protocol[32];
;980:
;981:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 72
ADDRGP4 g_arenaservers+13824
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 983
;982:
;983:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $538
line 984
;984:	{
line 985
;985:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
CNSTI1 0
ASGNI1
line 986
;986:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 987
;987:	}
LABELV $539
line 983
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $538
line 989
;988:
;989:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+13816
CNSTI4 1
ASGNI4
line 990
;990:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+13812
CNSTI4 0
ASGNI4
line 991
;991:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+13820
CNSTI4 0
ASGNI4
line 992
;992:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+13804
INDIRP4
CNSTI4 0
ASGNI4
line 993
;993:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+13800
CNSTI4 0
ASGNI4
line 996
;994:
;995:	// allow max 5 seconds for responses
;996:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+13828
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 999
;997:
;998:	// place menu in zeroed state
;999:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1001
;1000:
;1001:	if( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $550
line 1002
;1002:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $552
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1003
;1003:		return;
ADDRGP4 $535
JUMPV
LABELV $550
line 1006
;1004:	}
;1005:
;1006:	if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $555
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $553
LABELV $555
line 1007
;1007:		if( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $556
line 1008
;1008:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1009
;1009:		}
ADDRGP4 $557
JUMPV
LABELV $556
line 1010
;1010:		else {
line 1011
;1011:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1012
;1012:		}
LABELV $557
line 1014
;1013:
;1014:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+456+64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $558
ADDRLP4 72
INDIRI4
CNSTI4 4
GTI4 $558
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $571
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $571
address $562
address $563
address $565
address $567
address $569
code
LABELV $558
LABELV $562
line 1017
;1015:		default:
;1016:		case GAMES_ALL:
;1017:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 1018
;1018:			break;
ADDRGP4 $559
JUMPV
LABELV $563
line 1021
;1019:
;1020:		case GAMES_FFA:
;1021:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $564
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1022
;1022:			break;
ADDRGP4 $559
JUMPV
LABELV $565
line 1025
;1023:
;1024:		case GAMES_TEAMPLAY:
;1025:			strcpy( myargs, " team" );
ADDRLP4 36
ARGP4
ADDRGP4 $566
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1026
;1026:			break;
ADDRGP4 $559
JUMPV
LABELV $567
line 1029
;1027:
;1028:		case GAMES_TOURNEY:
;1029:			strcpy( myargs, " tourney" );
ADDRLP4 36
ARGP4
ADDRGP4 $568
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1030
;1030:			break;
ADDRGP4 $559
JUMPV
LABELV $569
line 1033
;1031:
;1032:		case GAMES_CTF:
;1033:			strcpy( myargs, " ctf" );
ADDRLP4 36
ARGP4
ADDRGP4 $570
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1034
;1034:			break;
LABELV $559
line 1038
;1035:		}
;1036:
;1037:
;1038:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $572
line 1039
;1039:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $574
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1040
;1040:		}
LABELV $572
line 1042
;1041:
;1042:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $575
line 1043
;1043:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $577
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1044
;1044:		}
LABELV $575
line 1046
;1045:
;1046:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1047
;1047:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $578
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1048
;1048:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $579
line 1049
;1049:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", i, protocol, myargs ));
ADDRGP4 $581
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1050
;1050:		}
ADDRGP4 $580
JUMPV
LABELV $579
line 1051
;1051:		else {
line 1052
;1052:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", i, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $583
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $582
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1053
;1053:		}
LABELV $580
line 1054
;1054:	}
LABELV $553
line 1055
;1055:}
LABELV $535
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1064
;1056:
;1057:
;1058:/*
;1059:=================
;1060:ArenaServers_SaveChanges
;1061:=================
;1062:*/
;1063:void ArenaServers_SaveChanges( void )
;1064:{
line 1067
;1065:	int	i;
;1066:
;1067:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $585
line 1068
;1068:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $420
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $586
line 1067
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $588
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
LTI4 $585
line 1070
;1069:
;1070:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $594
JUMPV
LABELV $591
line 1071
;1071:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $420
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $592
line 1070
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $594
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $591
line 1072
;1072:}
LABELV $584
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1080
;1073:
;1074:
;1075:/*
;1076:=================
;1077:ArenaServers_Sort
;1078:=================
;1079:*/
;1080:void ArenaServers_Sort( int type ) {
line 1081
;1081:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $596
line 1082
;1082:		return;
ADDRGP4 $595
JUMPV
LABELV $596
line 1085
;1083:	}
;1084:
;1085:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1086
;1086:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1087
;1087:}
LABELV $595
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 20 8
line 1096
;1088:
;1089:
;1090:/*
;1091:=================
;1092:ArenaServers_SetType
;1093:=================
;1094:*/
;1095:void ArenaServers_SetType( int type )
;1096:{
line 1097
;1097:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $601
line 1098
;1098:		return;
ADDRGP4 $600
JUMPV
LABELV $601
line 1100
;1099:
;1100:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1102
;1101:
;1102:	switch( type ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $603
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $603
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $629
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $629
address $605
address $623
address $611
address $617
code
LABELV $603
LABELV $605
line 1105
;1103:	default:
;1104:	case AS_LOCAL:
;1105:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1106
;1106:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_localserverlist
ASGNP4
line 1107
;1107:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_numlocalservers
ASGNP4
line 1108
;1108:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 128
ASGNI4
line 1109
;1109:		break;
ADDRGP4 $604
JUMPV
LABELV $611
line 1112
;1110:
;1111:	case AS_GLOBAL:
;1112:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1113
;1113:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_globalserverlist
ASGNP4
line 1114
;1114:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_numglobalservers
ASGNP4
line 1115
;1115:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 128
ASGNI4
line 1116
;1116:		break;
ADDRGP4 $604
JUMPV
LABELV $617
line 1119
;1117:
;1118:	case AS_FAVORITES:
;1119:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1120
;1120:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1121
;1121:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1122
;1122:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 16
ASGNI4
line 1123
;1123:		break;
ADDRGP4 $604
JUMPV
LABELV $623
line 1126
;1124:
;1125:	case AS_MPLAYER:
;1126:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1127
;1127:		g_arenaservers.serverlist = g_mplayerserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_mplayerserverlist
ASGNP4
line 1128
;1128:		g_arenaservers.numservers = &g_nummplayerservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_nummplayerservers
ASGNP4
line 1129
;1129:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 128
ASGNI4
line 1130
;1130:		break;
LABELV $604
line 1134
;1131:		
;1132:	}
;1133:
;1134:	if( !*g_arenaservers.numservers ) {
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $630
line 1135
;1135:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1136
;1136:	}
ADDRGP4 $631
JUMPV
LABELV $630
line 1137
;1137:	else {
line 1139
;1138:		// avoid slow operation, use existing results
;1139:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13812
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 1140
;1140:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 1141
;1141:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1142
;1142:	}
LABELV $631
line 1143
;1143:	strcpy(g_arenaservers.status.string,"hit refresh to update");
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $639
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1144
;1144:}
LABELV $600
endproc ArenaServers_SetType 20 8
proc Punkbuster_ConfirmEnable 8 12
line 1151
;1145:
;1146:/*
;1147:=================
;1148:PunkBuster_Confirm
;1149:=================
;1150:*/
;1151:static void Punkbuster_ConfirmEnable( qboolean result ) {
line 1152
;1152:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $641
line 1153
;1153:	{		
line 1154
;1154:		trap_SetPbClStatus(1);
CNSTI4 1
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1155
;1155:	}
LABELV $641
line 1156
;1156:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $645
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+14860+64
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1157
;1157:}
LABELV $640
endproc Punkbuster_ConfirmEnable 8 12
proc Punkbuster_ConfirmDisable 8 12
line 1159
;1158:
;1159:static void Punkbuster_ConfirmDisable( qboolean result ) {
line 1160
;1160:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $647
line 1161
;1161:	{
line 1162
;1162:		trap_SetPbClStatus(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1163
;1163:		UI_Message( punkbuster_msg );
ADDRGP4 punkbuster_msg
ARGP4
ADDRGP4 UI_Message
CALLV
pop
line 1164
;1164:	}
LABELV $647
line 1165
;1165:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $645
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+14860+64
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1166
;1166:}
LABELV $646
endproc Punkbuster_ConfirmDisable 8 12
proc ArenaServers_Event 12 16
line 1173
;1167:
;1168:/*
;1169:=================
;1170:ArenaServers_Event
;1171:=================
;1172:*/
;1173:static void ArenaServers_Event( void* ptr, int event ) {
line 1177
;1174:	int		id;
;1175:	int value;
;1176:
;1177:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1179
;1178:
;1179:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $652
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $652
line 1180
;1180:		return;
ADDRGP4 $651
JUMPV
LABELV $652
line 1183
;1181:	}
;1182:
;1183:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $654
ADDRLP4 0
INDIRI4
CNSTI4 24
GTI4 $654
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $706-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $706
address $656
address $662
address $668
address $674
address $680
address $686
address $689
address $691
address $693
address $694
address $695
address $696
address $697
address $698
address $699
code
LABELV $656
line 1185
;1184:	case ID_MASTER:
;1185:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+360+64
INDIRI4
ASGNI4
line 1186
;1186:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $659
line 1187
;1187:		{
line 1188
;1188:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1189
;1189:		}
LABELV $659
line 1190
;1190:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $661
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1191
;1191:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1192
;1192:		break;
ADDRGP4 $655
JUMPV
LABELV $662
line 1195
;1193:
;1194:	case ID_GAMETYPE:
;1195:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $663
ARGP4
ADDRGP4 g_arenaservers+456+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1196
;1196:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+456+64
INDIRI4
ASGNI4
line 1197
;1197:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1198
;1198:		break;
ADDRGP4 $655
JUMPV
LABELV $668
line 1201
;1199:
;1200:	case ID_SORTKEY:
;1201:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $669
ARGP4
ADDRGP4 g_arenaservers+552+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1202
;1202:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+552+64
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1203
;1203:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1204
;1204:		break;
ADDRGP4 $655
JUMPV
LABELV $674
line 1207
;1205:
;1206:	case ID_SHOW_FULL:
;1207:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $675
ARGP4
ADDRGP4 g_arenaservers+648+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1208
;1208:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+648+60
INDIRI4
ASGNI4
line 1209
;1209:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1210
;1210:		break;
ADDRGP4 $655
JUMPV
LABELV $680
line 1213
;1211:
;1212:	case ID_SHOW_EMPTY:
;1213:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $681
ARGP4
ADDRGP4 g_arenaservers+712+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1214
;1214:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+712+60
INDIRI4
ASGNI4
line 1215
;1215:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1216
;1216:		break;
ADDRGP4 $655
JUMPV
LABELV $686
line 1219
;1217:
;1218:	case ID_LIST:
;1219:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $655
line 1220
;1220:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1221
;1221:		}
line 1222
;1222:		break;
ADDRGP4 $655
JUMPV
LABELV $689
line 1225
;1223:
;1224:	case ID_SCROLL_UP:
;1225:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+776
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1226
;1226:		break;
ADDRGP4 $655
JUMPV
LABELV $691
line 1229
;1227:
;1228:	case ID_SCROLL_DOWN:
;1229:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+776
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1230
;1230:		break;
ADDRGP4 $655
JUMPV
LABELV $693
line 1233
;1231:
;1232:	case ID_BACK:
;1233:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1234
;1234:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1235
;1235:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1236
;1236:		break;
ADDRGP4 $655
JUMPV
LABELV $694
line 1239
;1237:
;1238:	case ID_REFRESH:
;1239:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1240
;1240:		break;
ADDRGP4 $655
JUMPV
LABELV $695
line 1243
;1241:
;1242:	case ID_SPECIFY:
;1243:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1244
;1244:		break;
ADDRGP4 $655
JUMPV
LABELV $696
line 1247
;1245:
;1246:	case ID_CREATE:
;1247:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1248
;1248:		break;
ADDRGP4 $655
JUMPV
LABELV $697
line 1251
;1249:
;1250:	case ID_CONNECT:
;1251:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1252
;1252:		break;
ADDRGP4 $655
JUMPV
LABELV $698
line 1255
;1253:
;1254:	case ID_REMOVE:
;1255:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1256
;1256:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1257
;1257:		break;
ADDRGP4 $655
JUMPV
LABELV $699
line 1260
;1258:	
;1259:	case ID_PUNKBUSTER:
;1260:		if (g_arenaservers.punkbuster.curvalue)			
ADDRGP4 g_arenaservers+14860+64
INDIRI4
CNSTI4 0
EQI4 $700
line 1261
;1261:		{
line 1262
;1262:			UI_ConfirmMenu_Style( "Enable Punkbuster?",  UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmEnable );
ADDRGP4 $704
ARGP4
CNSTI4 8209
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Punkbuster_ConfirmEnable
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 1263
;1263:		}
ADDRGP4 $655
JUMPV
LABELV $700
line 1265
;1264:		else
;1265:		{
line 1266
;1266:			UI_ConfirmMenu_Style( "Disable Punkbuster?", UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmDisable );
ADDRGP4 $705
ARGP4
CNSTI4 8209
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Punkbuster_ConfirmDisable
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 1267
;1267:		}
line 1268
;1268:		break;
LABELV $654
LABELV $655
line 1270
;1269:	}
;1270:}
LABELV $651
endproc ArenaServers_Event 12 16
proc ArenaServers_MenuDraw 0 4
line 1279
;1271:
;1272:
;1273:/*
;1274:=================
;1275:ArenaServers_MenuDraw
;1276:=================
;1277:*/
;1278:static void ArenaServers_MenuDraw( void )
;1279:{
line 1280
;1280:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $709
line 1281
;1281:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $709
line 1283
;1282:
;1283:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1284
;1284:}
LABELV $708
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1292
;1285:
;1286:
;1287:/*
;1288:=================
;1289:ArenaServers_MenuKey
;1290:=================
;1291:*/
;1292:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1293
;1293:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $713
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $713
line 1294
;1294:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1295
;1295:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $712
JUMPV
LABELV $713
line 1298
;1296:	}
;1297:
;1298:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $719
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $716
LABELV $719
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $716
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+776
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $716
line 1299
;1299:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1300
;1300:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1301
;1301:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1302
;1302:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $712
JUMPV
LABELV $716
line 1305
;1303:	}
;1304:
;1305:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $722
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $720
LABELV $722
line 1306
;1306:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1307
;1307:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1308
;1308:	}
LABELV $720
line 1311
;1309:
;1310:
;1311:	return Menu_DefaultKey( &g_arenaservers.menu, key );
ADDRGP4 g_arenaservers
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $712
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $724
skip 64
code
proc ArenaServers_MenuInit 44 16
line 1320
;1312:}
;1313:
;1314:
;1315:/*
;1316:=================
;1317:ArenaServers_MenuInit
;1318:=================
;1319:*/
;1320:static void ArenaServers_MenuInit( void ) {
line 1328
;1321:	int			i;
;1322:	int			type;
;1323:	int			y;
;1324:	int			value;
;1325:	static char	statusbuffer[MAX_STATUSLENGTH];
;1326:
;1327:	// zero set all our globals
;1328:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15044
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1330
;1329:
;1330:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1332
;1331:
;1332:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1333
;1333:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1334
;1334:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1335
;1335:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1337
;1336:
;1337:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 10
ASGNI4
line 1338
;1338:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1339
;1339:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1340
;1340:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1341
;1341:	g_arenaservers.banner.string  		= "TREPIDATION SERVERS";
ADDRGP4 g_arenaservers+288+60
ADDRGP4 $738
ASGNP4
line 1342
;1342:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+288+64
CNSTI4 1
ASGNI4
line 1343
;1343:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+288+68
ADDRGP4 color_white
ASGNP4
line 1345
;1344:
;1345:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1346
;1346:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+360
CNSTI4 3
ASGNI4
line 1347
;1347:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+360+4
ADDRGP4 $746
ASGNP4
line 1348
;1348:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+360+44
CNSTU4 262
ASGNU4
line 1349
;1349:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+360+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1350
;1350:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+360+8
CNSTI4 10
ASGNI4
line 1351
;1351:	g_arenaservers.master.generic.x				= 275;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+360+12
CNSTI4 275
ASGNI4
line 1352
;1352:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+360+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1353
;1353:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+360+76
ADDRGP4 master_items
ASGNP4
line 1355
;1354:
;1355:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1356
;1356:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+456
CNSTI4 3
ASGNI4
line 1357
;1357:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+456+4
ADDRGP4 $762
ASGNP4
line 1358
;1358:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+456+44
CNSTU4 258
ASGNU4
line 1359
;1359:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1360
;1360:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+456+8
CNSTI4 11
ASGNI4
line 1361
;1361:	g_arenaservers.gametype.generic.x			= 275;
ADDRGP4 g_arenaservers+456+12
CNSTI4 275
ASGNI4
line 1362
;1362:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+456+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1363
;1363:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+456+76
ADDRGP4 servertype_items
ASGNP4
line 1365
;1364:
;1365:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1366
;1366:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+552
CNSTI4 3
ASGNI4
line 1367
;1367:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+552+4
ADDRGP4 $778
ASGNP4
line 1368
;1368:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+552+44
CNSTU4 258
ASGNU4
line 1369
;1369:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1370
;1370:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+552+8
CNSTI4 12
ASGNI4
line 1371
;1371:	g_arenaservers.sortkey.generic.x			= 275;
ADDRGP4 g_arenaservers+552+12
CNSTI4 275
ASGNI4
line 1372
;1372:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+552+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1373
;1373:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+552+76
ADDRGP4 sortkey_items
ASGNP4
line 1375
;1374:
;1375:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1376
;1376:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+648
CNSTI4 5
ASGNI4
line 1377
;1377:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+648+4
ADDRGP4 $794
ASGNP4
line 1378
;1378:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+648+44
CNSTU4 258
ASGNU4
line 1379
;1379:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+648+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1380
;1380:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+648+8
CNSTI4 13
ASGNI4
line 1381
;1381:	g_arenaservers.showfull.generic.x			= 275;
ADDRGP4 g_arenaservers+648+12
CNSTI4 275
ASGNI4
line 1382
;1382:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+648+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1384
;1383:
;1384:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1385
;1385:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+712
CNSTI4 5
ASGNI4
line 1386
;1386:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+712+4
ADDRGP4 $808
ASGNP4
line 1387
;1387:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+712+44
CNSTU4 258
ASGNU4
line 1388
;1388:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+712+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1389
;1389:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+712+8
CNSTI4 14
ASGNI4
line 1390
;1390:	g_arenaservers.showempty.generic.x			= 275;
ADDRGP4 g_arenaservers+712+12
CNSTI4 275
ASGNI4
line 1391
;1391:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+712+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1393
;1392:
;1393:	y += 3 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 48
ADDI4
ASGNI4
line 1394
;1394:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+776
CNSTI4 8
ASGNI4
line 1395
;1395:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+776+44
CNSTU4 128
ASGNU4
line 1396
;1396:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+776+8
CNSTI4 15
ASGNI4
line 1397
;1397:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+776+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1398
;1398:	g_arenaservers.list.generic.x				= 10; //72;
ADDRGP4 g_arenaservers+776+12
CNSTI4 10
ASGNI4
line 1399
;1399:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+776+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1400
;1400:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+776+80
CNSTI4 68
ASGNI4
line 1401
;1401:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+776+84
CNSTI4 11
ASGNI4
line 1402
;1402:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+776+76
ADDRGP4 g_arenaservers+13288
ASGNP4
line 1403
;1403:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $837
line 1404
;1404:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+13288
ADDP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072
ADDP4
ASGNP4
line 1405
;1405:	}
LABELV $838
line 1403
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $837
line 1407
;1406:
;1407:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+872
CNSTI4 6
ASGNI4
line 1408
;1408:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+872+44
CNSTU4 16388
ASGNU4
line 1409
;1409:	g_arenaservers.mappic.generic.x				= 10; //72;
ADDRGP4 g_arenaservers+872+12
CNSTI4 10
ASGNI4
line 1410
;1410:	g_arenaservers.mappic.generic.y				= 80;
ADDRGP4 g_arenaservers+872+16
CNSTI4 80
ASGNI4
line 1411
;1411:	g_arenaservers.mappic.width					= 128;
ADDRGP4 g_arenaservers+872+76
CNSTI4 128
ASGNI4
line 1412
;1412:	g_arenaservers.mappic.height				= 96;
ADDRGP4 g_arenaservers+872+80
CNSTI4 96
ASGNI4
line 1413
;1413:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+872+64
ADDRGP4 $856
ASGNP4
line 1415
;1414:
;1415:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+960
CNSTI4 6
ASGNI4
line 1416
;1416:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+960+4
ADDRGP4 $860
ASGNP4
line 1417
;1417:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+960+44
CNSTU4 16388
ASGNU4
line 1418
;1418:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+960+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1419
;1419:	g_arenaservers.arrows.generic.x				= 512+48;
ADDRGP4 g_arenaservers+960+12
CNSTI4 560
ASGNI4
line 1420
;1420:	g_arenaservers.arrows.generic.y				= 240-64+16;
ADDRGP4 g_arenaservers+960+16
CNSTI4 192
ASGNI4
line 1421
;1421:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+960+76
CNSTI4 64
ASGNI4
line 1422
;1422:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+960+80
CNSTI4 128
ASGNI4
line 1424
;1423:
;1424:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1048
CNSTI4 6
ASGNI4
line 1425
;1425:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1048+44
CNSTU4 2308
ASGNU4
line 1426
;1426:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+1048+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1427
;1427:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1048+8
CNSTI4 16
ASGNI4
line 1428
;1428:	g_arenaservers.up.generic.x					= 512+48;
ADDRGP4 g_arenaservers+1048+12
CNSTI4 560
ASGNI4
line 1429
;1429:	g_arenaservers.up.generic.y					= 240-64+16;
ADDRGP4 g_arenaservers+1048+16
CNSTI4 192
ASGNI4
line 1430
;1430:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+1048+76
CNSTI4 64
ASGNI4
line 1431
;1431:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+1048+80
CNSTI4 64
ASGNI4
line 1432
;1432:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1048+60
ADDRGP4 $890
ASGNP4
line 1434
;1433:
;1434:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1136
CNSTI4 6
ASGNI4
line 1435
;1435:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1136+44
CNSTU4 2308
ASGNU4
line 1436
;1436:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1136+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1437
;1437:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1136+8
CNSTI4 17
ASGNI4
line 1438
;1438:	g_arenaservers.down.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1136+12
CNSTI4 560
ASGNI4
line 1439
;1439:	g_arenaservers.down.generic.y				= 240+16;
ADDRGP4 g_arenaservers+1136+16
CNSTI4 256
ASGNI4
line 1440
;1440:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+1136+76
CNSTI4 64
ASGNI4
line 1441
;1441:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+1136+80
CNSTI4 64
ASGNI4
line 1442
;1442:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1136+60
ADDRGP4 $908
ASGNP4
line 1444
;1443:
;1444:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1445
;1445:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1224
CNSTI4 7
ASGNI4
line 1446
;1446:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1224+12
CNSTI4 320
ASGNI4
line 1447
;1447:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1224+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1448
;1448:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1224+60
ADDRGP4 $724
ASGNP4
line 1449
;1449:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1224+64
CNSTI4 17
ASGNI4
line 1450
;1450:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1224+68
ADDRGP4 menu_text_color
ASGNP4
line 1452
;1451:
;1452:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1453
;1453:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1296
CNSTI4 7
ASGNI4
line 1454
;1454:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1296+12
CNSTI4 320
ASGNI4
line 1455
;1455:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1296+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1456
;1456:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $204
ASGNP4
line 1457
;1457:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1296+64
CNSTI4 17
ASGNI4
line 1458
;1458:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1296+68
ADDRGP4 text_color_normal
ASGNP4
line 1460
;1459:
;1460:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1368
CNSTI4 6
ASGNI4
line 1461
;1461:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1368+4
ADDRGP4 $934
ASGNP4
line 1462
;1462:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1368+44
CNSTU4 260
ASGNU4
line 1463
;1463:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1368+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1464
;1464:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1368+8
CNSTI4 23
ASGNI4
line 1465
;1465:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1368+12
CNSTI4 450
ASGNI4
line 1466
;1466:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1368+16
CNSTI4 86
ASGNI4
line 1467
;1467:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1368+76
CNSTI4 96
ASGNI4
line 1468
;1468:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1368+80
CNSTI4 48
ASGNI4
line 1469
;1469:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1368+60
ADDRGP4 $951
ASGNP4
line 1471
;1470:
;1471:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1456
CNSTI4 6
ASGNI4
line 1472
;1472:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1456+4
ADDRGP4 $955
ASGNP4
line 1473
;1473:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1456+44
CNSTU4 260
ASGNU4
line 1474
;1474:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1475
;1475:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1456+8
CNSTI4 18
ASGNI4
line 1476
;1476:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1456+12
CNSTI4 0
ASGNI4
line 1477
;1477:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1456+16
CNSTI4 416
ASGNI4
line 1478
;1478:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1456+76
CNSTI4 128
ASGNI4
line 1479
;1479:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1456+80
CNSTI4 64
ASGNI4
line 1480
;1480:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1456+60
ADDRGP4 $972
ASGNP4
line 1482
;1481:
;1482:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1632
CNSTI4 6
ASGNI4
line 1483
;1483:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1632+4
ADDRGP4 $976
ASGNP4
line 1484
;1484:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1632+44
CNSTU4 260
ASGNU4
line 1485
;1485:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1632+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1486
;1486:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1632+8
CNSTI4 20
ASGNI4
line 1487
;1487:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1632+12
CNSTI4 128
ASGNI4
line 1488
;1488:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1632+16
CNSTI4 416
ASGNI4
line 1489
;1489:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1632+76
CNSTI4 128
ASGNI4
line 1490
;1490:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1632+80
CNSTI4 64
ASGNI4
line 1491
;1491:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1632+60
ADDRGP4 $993
ASGNP4
line 1493
;1492:
;1493:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1544
CNSTI4 6
ASGNI4
line 1494
;1494:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1544+4
ADDRGP4 $997
ASGNP4
line 1495
;1495:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1544+44
CNSTU4 260
ASGNU4
line 1496
;1496:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1544+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1497
;1497:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1544+8
CNSTI4 19
ASGNI4
line 1498
;1498:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1544+12
CNSTI4 256
ASGNI4
line 1499
;1499:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1544+16
CNSTI4 416
ASGNI4
line 1500
;1500:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1544+76
CNSTI4 128
ASGNI4
line 1501
;1501:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1544+80
CNSTI4 64
ASGNI4
line 1502
;1502:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1544+60
ADDRGP4 $1014
ASGNP4
line 1504
;1503:
;1504:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1720
CNSTI4 6
ASGNI4
line 1505
;1505:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1720+4
ADDRGP4 $1018
ASGNP4
line 1506
;1506:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1720+44
CNSTU4 260
ASGNU4
line 1507
;1507:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1720+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1508
;1508:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1720+8
CNSTI4 21
ASGNI4
line 1509
;1509:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1720+12
CNSTI4 384
ASGNI4
line 1510
;1510:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1720+16
CNSTI4 416
ASGNI4
line 1511
;1511:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1720+76
CNSTI4 128
ASGNI4
line 1512
;1512:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1720+80
CNSTI4 64
ASGNI4
line 1513
;1513:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1720+60
ADDRGP4 $1035
ASGNP4
line 1515
;1514:
;1515:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1808
CNSTI4 6
ASGNI4
line 1516
;1516:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+1808+4
ADDRGP4 $1039
ASGNP4
line 1517
;1517:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1808+44
CNSTU4 272
ASGNU4
line 1518
;1518:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1808+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1519
;1519:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+1808+8
CNSTI4 22
ASGNI4
line 1520
;1520:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+1808+12
CNSTI4 640
ASGNI4
line 1521
;1521:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+1808+16
CNSTI4 416
ASGNI4
line 1522
;1522:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+1808+76
CNSTI4 128
ASGNI4
line 1523
;1523:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+1808+80
CNSTI4 64
ASGNI4
line 1524
;1524:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+1808+60
ADDRGP4 $1056
ASGNP4
line 1526
;1525:
;1526:	g_arenaservers.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+14860
CNSTI4 3
ASGNI4
line 1527
;1527:	g_arenaservers.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 g_arenaservers+14860+4
ADDRGP4 $1060
ASGNP4
line 1528
;1528:	g_arenaservers.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+14860+44
CNSTU4 258
ASGNU4
line 1529
;1529:	g_arenaservers.punkbuster.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+14860+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1530
;1530:	g_arenaservers.punkbuster.generic.id			= ID_PUNKBUSTER;
ADDRGP4 g_arenaservers+14860+8
CNSTI4 24
ASGNI4
line 1531
;1531:	g_arenaservers.punkbuster.generic.x				= 480+32;
ADDRGP4 g_arenaservers+14860+12
CNSTI4 512
ASGNI4
line 1532
;1532:	g_arenaservers.punkbuster.generic.y				= 144;
ADDRGP4 g_arenaservers+14860+16
CNSTI4 144
ASGNI4
line 1533
;1533:	g_arenaservers.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 g_arenaservers+14860+76
ADDRGP4 punkbuster_items
ASGNP4
line 1535
;1534:	
;1535:	g_arenaservers.pblogo.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+14956
CNSTI4 6
ASGNI4
line 1536
;1536:	g_arenaservers.pblogo.generic.name			= ART_PUNKBUSTER;
ADDRGP4 g_arenaservers+14956+4
ADDRGP4 $1076
ASGNP4
line 1537
;1537:	g_arenaservers.pblogo.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+14956+44
CNSTU4 16388
ASGNU4
line 1538
;1538:	g_arenaservers.pblogo.generic.x				= 526;
ADDRGP4 g_arenaservers+14956+12
CNSTI4 526
ASGNI4
line 1539
;1539:	g_arenaservers.pblogo.generic.y				= 176;
ADDRGP4 g_arenaservers+14956+16
CNSTI4 176
ASGNI4
line 1540
;1540:	g_arenaservers.pblogo.width					= 32;
ADDRGP4 g_arenaservers+14956+76
CNSTI4 32
ASGNI4
line 1541
;1541:	g_arenaservers.pblogo.height				= 16;
ADDRGP4 g_arenaservers+14956+80
CNSTI4 16
ASGNI4
line 1542
;1542:	g_arenaservers.pblogo.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+14956+64
ADDRGP4 $856
ASGNP4
line 1544
;1543:	
;1544:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1546
;1545:
;1546:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1547
;1547:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1548
;1548:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1549
;1549:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1550
;1550:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1552
;1551:
;1552:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1553
;1553:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1554
;1554:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1224
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1555
;1555:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1556
;1556:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1557
;1557:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1048
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1558
;1558:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1136
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1560
;1559:
;1560:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1368
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1561
;1561:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1562
;1562:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1563
;1563:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1564
;1564:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1565
;1565:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1571
;1566:
;1567://	Shafe - Trep - No Punkbuster Garbage
;1568://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.punkbuster );
;1569://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.pblogo );
;1570:	
;1571:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1573
;1572:
;1573:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRGP4 ui_browserMaster+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_servertype
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1575
;1574:	// hack to get rid of MPlayer stuff
;1575:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1576
;1576:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1109
line 1577
;1577:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1109
line 1578
;1578:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+360+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1580
;1579:
;1580:	g_gametype = Com_Clamp( 0, 4, ui_browserGameType.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserGameType+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_gametype
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1581
;1581:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+456+64
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1583
;1582:
;1583:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1584
;1584:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+552+64
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1586
;1585:
;1586:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1587
;1587:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+648+60
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1589
;1588:
;1589:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1590
;1590:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+712+60
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1592
;1591:	
;1592:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $645
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+14860+64
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 1595
;1593:
;1594:	// force to initial state and refresh
;1595:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1596
;1596:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1597
;1597:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1599
;1598:
;1599:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $578
ARGP4
ADDRGP4 $204
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1600
;1600:}
LABELV $723
endproc ArenaServers_MenuInit 44 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1608
;1601:
;1602:
;1603:/*
;1604:=================
;1605:ArenaServers_Cache
;1606:=================
;1607:*/
;1608:void ArenaServers_Cache( void ) {
line 1609
;1609:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $955
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1610
;1610:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $972
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1611
;1611:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1018
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1612
;1612:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1035
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1613
;1613:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $976
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1614
;1614:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $993
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1615
;1615:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $997
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1616
;1616:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1014
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1617
;1617:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1039
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1618
;1618:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1056
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1619
;1619:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $860
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1620
;1620:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $890
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1621
;1621:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $908
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1622
;1622:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $856
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1623
;1623:	trap_R_RegisterShaderNoMip( ART_PUNKBUSTER );
ADDRGP4 $1076
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1624
;1624:}
LABELV $1127
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1632
;1625:
;1626:
;1627:/*
;1628:=================
;1629:UI_ArenaServersMenu
;1630:=================
;1631:*/
;1632:void UI_ArenaServersMenu( void ) {
line 1633
;1633:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1634
;1634:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1635
;1635:}						  
LABELV $1128
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_fullservers
skip 4
align 4
LABELV g_emptyservers
skip 4
align 4
LABELV g_sortkey
skip 4
align 4
LABELV g_gametype
skip 4
align 4
LABELV g_servertype
skip 4
align 4
LABELV g_nummplayerservers
skip 4
align 4
LABELV g_mplayerserverlist
skip 19456
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 2432
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 19456
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 19456
align 4
LABELV g_arenaservers
skip 15044
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
LABELV $1076
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
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
align 1
LABELV $1060
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $1056
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1039
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1035
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1018
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1014
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $997
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $993
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $976
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $972
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
LABELV $955
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
LABELV $951
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
LABELV $934
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
LABELV $908
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
LABELV $890
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
LABELV $860
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
LABELV $856
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
LABELV $808
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $794
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $778
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $762
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $746
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $738
byte 1 84
byte 1 82
byte 1 69
byte 1 80
byte 1 73
byte 1 68
byte 1 65
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $705
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 63
byte 1 0
align 1
LABELV $704
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 63
byte 1 0
align 1
LABELV $681
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
LABELV $675
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
LABELV $669
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
LABELV $663
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
LABELV $661
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
LABELV $645
byte 1 99
byte 1 108
byte 1 95
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
LABELV $639
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $583
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
LABELV $582
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $581
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $578
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
LABELV $577
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $574
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $570
byte 1 32
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $568
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $566
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $564
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $552
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
LABELV $530
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $420
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $399
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $391
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
LABELV $390
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $389
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $388
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
LABELV $387
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $386
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $385
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
LABELV $384
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $383
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $382
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
LABELV $318
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $317
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $316
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 46
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 46
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 100
byte 1 47
byte 1 37
byte 1 50
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 56
byte 1 46
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 51
byte 1 100
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $315
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $314
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $311
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $306
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $239
byte 1 78
byte 1 111
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $236
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $210
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
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
byte 1 85
byte 1 110
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $204
byte 1 0
align 1
LABELV $176
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $171
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
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
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $155
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
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $142
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
LABELV $107
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
LABELV $102
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $101
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 73
byte 1 73
byte 1 73
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $100
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $99
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 66
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $98
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $97
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $96
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $95
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $94
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $93
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $92
byte 1 85
byte 1 114
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 84
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $91
byte 1 81
byte 1 51
byte 1 70
byte 1 0
align 1
LABELV $90
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
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $89
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
LABELV $88
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $87
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
LABELV $86
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $85
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $84
byte 1 83
byte 1 80
byte 1 32
byte 1 0
align 1
LABELV $83
byte 1 49
byte 1 118
byte 1 49
byte 1 0
align 1
LABELV $82
byte 1 68
byte 1 77
byte 1 32
byte 1 0
align 1
LABELV $81
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
LABELV $80
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
LABELV $79
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
LABELV $78
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
LABELV $77
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
LABELV $76
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $75
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 122
byte 1 101
byte 1 32
byte 1 84
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $74
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
LABELV $73
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
LABELV $72
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
LABELV $71
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
LABELV $70
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $69
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
LABELV $68
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
LABELV $67
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
