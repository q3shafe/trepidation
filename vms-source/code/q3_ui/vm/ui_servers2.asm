data
align 4
LABELV master_servers
address $69
address $70
address $71
address $72
address $73
byte 4 0
align 4
LABELV master_items
address $74
address $75
address $76
byte 4 0
align 4
LABELV servertype_items
address $77
address $78
address $79
address $80
address $81
address $82
address $83
address $84
address $85
address $86
byte 4 0
align 4
LABELV sortkey_items
address $87
address $88
address $89
address $90
address $91
byte 4 0
align 4
LABELV gamenames
address $92
address $93
address $94
address $95
address $96
address $82
address $83
address $84
address $85
address $86
address $97
address $98
address $99
address $100
address $101
byte 4 0
align 4
LABELV netnames
address $101
address $102
address $103
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
byte 1 112
byte 1 105
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 110
byte 1 53
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 111
byte 1 109
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
address $104
address $105
byte 4 0
export punkbuster_msg
align 4
LABELV punkbuster_msg
address $106
address $107
address $108
address $109
byte 4 0
code
proc ArenaServers_MaxPing 8 4
file "../ui_servers2.c"
line 302
;1:// 2016 Trepidation Licensed under the GPL2
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
;19:#define MAX_MAPNAMELENGTH		128		// Shafe - Trep - Was 16
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
;42:#define ART_PUNKBUSTER			"menu/art/pblogo"
;43:// Shafe - Trep Server Browser Headers
;44:#define ART_LBLNAME				"menu/art/lbl_name"
;45:#define ART_LBLMAP				"menu/art/lbl_map"
;46:#define	ART_LBLLPLAYERS			"menu/art/lbl_players"
;47:#define	ART_LBLTYPE				"menu/art/lbl_gtype"
;48:#define	ART_LBLNET				"menu/art/lbl_net"
;49:#define	ART_LBLPING				"menu/art/lbl_ping"
;50:#define	ART_LBLIG				"menu/art/lbl_instagib"
;51:
;52:
;53:#define ID_MASTER			10
;54:#define ID_GAMETYPE			11
;55:#define ID_SORTKEY			12
;56:#define ID_SHOW_FULL		13
;57:#define ID_SHOW_EMPTY		14
;58:#define ID_LIST				15
;59:#define ID_SCROLL_UP		16
;60:#define ID_SCROLL_DOWN		17
;61:#define ID_BACK				18
;62:#define ID_REFRESH			19
;63:#define ID_SPECIFY			20
;64:#define ID_CREATE			21
;65:#define ID_CONNECT			22
;66:#define ID_REMOVE			23
;67:#define ID_PUNKBUSTER		24
;68:#define ID_MSERVER			25
;69:
;70:
;71:#define GR_LOGO				30
;72:#define GR_LETTERS			31
;73:
;74://Set AS_GLOBAL as first -Vincent
;75:#define AS_GLOBAL			0
;76:#define AS_LOCAL			1
;77:#define AS_MPLAYER			2
;78:#define AS_FAVORITES		3
;79:
;80:#define SORT_HOST			0
;81:#define SORT_MAP			1
;82:#define SORT_CLIENTS		2
;83:#define SORT_GAME			3
;84:#define SORT_PING			4
;85:
;86:// Shafe - Trep Multi Master Support
;87:#define MASTER0				0
;88:#define MASTER1				1
;89:#define MASTER2				2
;90:#define MASTER3				3
;91:#define MASTER4				4
;92:// End Shafe
;93:
;94:
;95:#define GAMES_ALL			0
;96:#define GAMES_FFA			1
;97:#define GAMES_TEAMPLAY		2
;98:#define GAMES_TOURNEY		3
;99:#define GAMES_CTF			4
;100:#define GAMES_ARSENAL		5	// Shafe - Trep - New Gametype
;101:#define GAMES_LASTMAN		6	// Shafe - Trep - New Gametype
;102:#define GAMES_TREPIDATION	7	// Shafe - Trep - New Gametype
;103:#define GAMES_FREEZETAG		8	// Shafe - Trep - New Gametype
;104:#define GAMES_ONE4ALL		8	// Shafe - Trep - New Gametype
;105:
;106://Shafe - Trep - Mulimasters
;107:static const char *master_servers[] = {
;108:	"Primary",
;109:	"Alternate 1",
;110:	"Alternate 2",
;111:	"Alternate 3",
;112:	"Alternate 4 (Not Used)",
;113:	0
;114:};
;115:// End Shafe
;116:
;117:static const char *master_items[] = {
;118:	"Local",
;119:	"Internet",
;120:	"Favorites",
;121:	0
;122:};
;123:
;124:static const char *servertype_items[] = {
;125:	"All",
;126:	"Free For All",
;127:	"Team Deathmatch",
;128:	"Tournament",
;129:	"Capture the Flag",
;130:	"Arsenal",			// Shafe - Trep - New Gametype
;131:	"Survival",	// Shafe - Trep - New Gametype
;132:	"Trepidation",	// Shafe - Trep - New Gametype
;133:	"Freeze Tag",	// Shafe - Trep - New Gametype
;134:	"One4All",	// Shafe - Trep - New Gametype
;135:	0
;136:};
;137:
;138:static const char *sortkey_items[] = {
;139:	"Server Name",
;140:	"Map Name",
;141:	"Open Player Spots",
;142:	"Game Type",
;143:	"Ping Time",
;144:	0
;145:};
;146:
;147:static char* gamenames[] = {
;148:	"DM ",	// deathmatch
;149:	"1v1",	// tournament
;150:	"SP ",	// single player
;151:	"Team DM",	// team deathmatch
;152:	"CTF",	// capture the flag
;153:	"Arsenal",		// one flag ctf
;154:	"Survival",				// Overload
;155:	"Trepidation",			// Harvester
;156:	"Freeze Tag",			// Harvester
;157:	"One4All",
;158:	"Rocket Arena 3",	// Rocket Arena 3
;159:	"Q3F",						// Q3F
;160:	"Urban Terror",		// Urban Terror
;161:	"OSP",						// Orange Smoothie Productions
;162:	"???",			// unknown
;163:	0
;164:};
;165:
;166:static char* netnames[] = {
;167:	"???",
;168:	"UDP",
;169:	"IPX",
;170:	NULL
;171:};
;172:
;173:static char quake3worldMessage[] = "Visit trepidation.n5net.om - News, Community, Events, Files";
;174:
;175:
;176:const char* punkbuster_items[] = {
;177:	"Disabled",
;178:	"Enabled",
;179:	NULL
;180:};
;181:
;182:const char* punkbuster_msg[] = {
;183:	"PunkBuster will be",
;184:	"disabled the next time",
;185:	"Quake III Arena",
;186:	"is started.",
;187:	NULL
;188:};
;189:
;190:typedef struct {
;191:	char	adrstr[MAX_ADDRESSLENGTH];
;192:	int		start;
;193:} pinglist_t;
;194:
;195:typedef struct servernode_s {
;196:	char	adrstr[MAX_ADDRESSLENGTH];
;197:	char	hostname[MAX_HOSTNAMELENGTH+3];
;198:	char	mapname[MAX_MAPNAMELENGTH];
;199:	int		numclients;
;200:	int		maxclients;
;201:	int		pingtime;
;202:	int		gametype;
;203:	char	gamename[12];
;204:	int		nettype;
;205:	int		minPing;
;206:	int		maxPing;
;207:	/*
;208:	// Shafe - Not quite sure how I want to display the gametypes yet.. 
;209:	// I'm thinking that Instagib should replace the yes/no in pb field of browser
;210:	*/
;211:	int		g_instagib; 
;212:	int		g_gamemode;
;213:	qboolean bPB;
;214:
;215:} servernode_t; 
;216:
;217:typedef struct {
;218:	char			buff[MAX_LISTBOXWIDTH];
;219:	servernode_t*	servernode;
;220:} table_t;
;221:
;222:typedef struct {
;223:	menuframework_s		menu;
;224:
;225:	menutext_s			banner;
;226:
;227:	menulist_s			master;
;228:	menulist_s			mserver;
;229:	menulist_s			gametype;
;230:	menulist_s			sortkey;
;231:	menuradiobutton_s	showfull;
;232:	menuradiobutton_s	showempty;
;233:
;234:	menulist_s			list;
;235:	menubitmap_s		mappic;
;236:	menubitmap_s		arrows;
;237:	menubitmap_s		up;
;238:	menubitmap_s		down;
;239:	menutext_s			status;
;240:	menutext_s			statusbar;
;241:
;242:	menubitmap_s		remove;
;243:	menubitmap_s		back;
;244:	menubitmap_s		refresh;
;245:	menubitmap_s		specify;
;246:	menubitmap_s		create;
;247:	menubitmap_s		go;
;248:
;249:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;250:	table_t				table[MAX_LISTBOXITEMS];
;251:	char*				items[MAX_LISTBOXITEMS];
;252:	int					numqueriedservers;
;253:	int					*numservers;
;254:	servernode_t		*serverlist;	
;255:	int					currentping;
;256:	qboolean			refreshservers;
;257:	int					nextpingtime;
;258:	int					maxservers;
;259:	int					refreshtime;
;260:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;261:	int					numfavoriteaddresses;
;262:
;263:	menulist_s		punkbuster;
;264:	menubitmap_s	lblname;
;265:	menubitmap_s	lblmap;
;266:	menubitmap_s	lblplayers;
;267:	menubitmap_s	lblgtype;
;268:	menubitmap_s	lblnet;
;269:	menubitmap_s	lblping;
;270:	menubitmap_s	lblinstagib;
;271:	menubitmap_s	pblogo;
;272:
;273:} arenaservers_t;
;274:
;275:static arenaservers_t	g_arenaservers;
;276:
;277:
;278:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;279:static int				g_numglobalservers;
;280:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;281:static int				g_numlocalservers;
;282:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;283:static int				g_numfavoriteservers;
;284:static servernode_t		g_mplayerserverlist[MAX_GLOBALSERVERS];
;285:static int				g_nummplayerservers;
;286:static int				g_servertype;
;287:static int				g_gametype;
;288:static int				g_sortkey;
;289:static int				g_emptyservers;
;290:static int				g_fullservers;
;291:static int				g_masteruse; // Shafe - Trep - Multimaster
;292:static int				g_gamemode;
;293:static int				g_instagib;
;294:
;295:
;296:
;297:/*
;298:=================
;299:ArenaServers_MaxPing
;300:=================
;301:*/
;302:static int ArenaServers_MaxPing( void ) {
line 305
;303:	int		maxPing;
;304:
;305:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $114
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
line 306
;306:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $115
line 307
;307:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 308
;308:	}
LABELV $115
line 309
;309:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $113
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 318
;310:}
;311:
;312:
;313:/*
;314:=================
;315:ArenaServers_Compare
;316:=================
;317:*/
;318:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 324
;319:	float			f1;
;320:	float			f2;
;321:	servernode_t*	t1;
;322:	servernode_t*	t2;
;323:
;324:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 325
;325:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 327
;326:
;327:	switch( g_sortkey ) {
ADDRLP4 16
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $118
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $118
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $141
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $141
address $120
address $121
address $122
address $131
address $136
code
LABELV $120
line 329
;328:	case SORT_HOST:
;329:		return Q_stricmp( t1->hostname, t2->hostname );
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
ADDRGP4 $117
JUMPV
LABELV $121
line 332
;330:
;331:	case SORT_MAP:
;332:		return Q_stricmp( t1->mapname, t2->mapname );
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
ADDRGP4 $117
JUMPV
LABELV $122
line 335
;333:
;334:	case SORT_CLIENTS:
;335:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 336
;336:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $123
line 337
;337:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 338
;338:		}
LABELV $123
line 340
;339:
;340:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 40
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 341
;341:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $125
line 342
;342:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 343
;343:		}
LABELV $125
line 345
;344:
;345:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $127
line 346
;346:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $117
JUMPV
LABELV $127
line 348
;347:		}
;348:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $129
line 349
;349:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $117
JUMPV
LABELV $129
line 351
;350:		}
;351:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $117
JUMPV
LABELV $131
line 354
;352:
;353:	case SORT_GAME:
;354:		if( t1->gametype < t2->gametype ) {
ADDRLP4 44
CNSTI4 232
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
GEI4 $132
line 355
;355:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $117
JUMPV
LABELV $132
line 357
;356:		}
;357:		if( t1->gametype == t2->gametype ) {
ADDRLP4 48
CNSTI4 232
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
NEI4 $134
line 358
;358:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $117
JUMPV
LABELV $134
line 360
;359:		}
;360:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $117
JUMPV
LABELV $136
line 363
;361:
;362:	case SORT_PING:
;363:		if( t1->pingtime < t2->pingtime ) {
ADDRLP4 52
CNSTI4 228
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
GEI4 $137
line 364
;364:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $117
JUMPV
LABELV $137
line 366
;365:		}
;366:		if( t1->pingtime > t2->pingtime ) {
ADDRLP4 56
CNSTI4 228
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
LEI4 $139
line 367
;367:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $117
JUMPV
LABELV $139
line 369
;368:		}
;369:		return Q_stricmp( t1->hostname, t2->hostname );
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
ADDRGP4 $117
JUMPV
LABELV $118
line 372
;370:	}
;371:
;372:	return 0;
CNSTI4 0
RETI4
LABELV $117
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 8 8
line 381
;373:}
;374:
;375:
;376:/*
;377:=================
;378:ArenaServers_Go
;379:=================
;380:*/
;381:static void ArenaServers_Go( void ) {
line 384
;382:	servernode_t*	servernode;
;383:
;384:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168+68
ADDP4
INDIRP4
ASGNP4
line 385
;385:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $147
line 386
;386:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $149
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
line 387
;387:	}
LABELV $147
line 388
;388:}
LABELV $142
endproc ArenaServers_Go 8 8
bss
align 1
LABELV $151
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 396
;389:
;390:
;391:/*
;392:=================
;393:ArenaServers_UpdatePicture
;394:=================
;395:*/
;396:static void ArenaServers_UpdatePicture( void ) {
line 400
;397:	static char		picname[64];
;398:	servernode_t*	servernodeptr;
;399:
;400:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+872+68
INDIRI4
CNSTI4 0
NEI4 $152
line 401
;401:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+968+4
CNSTP4 0
ASGNP4
line 402
;402:	}
ADDRGP4 $153
JUMPV
LABELV $152
line 403
;403:	else {
line 404
;404:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168+68
ADDP4
INDIRP4
ASGNP4
line 405
;405:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $151
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $162
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 406
;406:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+968+4
ADDRGP4 $151
ASGNP4
line 408
;407:	
;408:	}
LABELV $153
line 411
;409:
;410:	// force shader update during draw
;411:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+968+68
CNSTI4 0
ASGNI4
line 412
;412:}
LABELV $150
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateMenu 72 48
line 420
;413:
;414:
;415:/*
;416:=================
;417:ArenaServers_UpdateMenu
;418:=================
;419:*/
;420:static void ArenaServers_UpdateMenu( void ) {
line 429
;421:	int				i;
;422:	int				j;
;423:	int				count;
;424:	char*			buff;
;425:	servernode_t*	servernodeptr;
;426:	table_t*		tableptr;
;427:	char			*pingColor;
;428:
;429:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
LEI4 $168
line 431
;430:		// servers found
;431:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $171
ADDRGP4 g_arenaservers+13908
INDIRI4
ADDRGP4 g_arenaservers+13896
INDIRI4
GTI4 $171
line 433
;432:			// show progress
;433:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Trepidation Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $178
ARGP4
ADDRGP4 g_arenaservers+13908
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+13896
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 434
;434:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $183
ASGNP4
line 435
;435:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ARGI4
CNSTI4 272
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 436
;436:		}
ADDRGP4 $169
JUMPV
LABELV $171
line 437
;437:		else {
line 439
;438:			// all servers pinged - enable controls
;439:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
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
line 440
;440:			g_arenaservers.mserver.generic.flags		&= ~QMF_GRAYED;
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
line 441
;441:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
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
line 442
;442:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 443
;443:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+808+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 444
;444:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+744+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 445
;445:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+872+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 446
;446:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1640+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 447
;447:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+1904+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 448
;448:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+14956+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 451
;449:
;450:			// update status bar
;451:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $208
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $206
LABELV $208
line 452
;452:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 quake3worldMessage
ASGNP4
line 453
;453:			}
ADDRGP4 $169
JUMPV
LABELV $206
line 454
;454:			else {
line 455
;455:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $213
ASGNP4
line 456
;456:			}
line 458
;457:
;458:		}
line 459
;459:	}
ADDRGP4 $169
JUMPV
LABELV $168
line 460
;460:	else {
line 462
;461:		// no servers found
;462:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $214
line 463
;463:			strcpy( g_arenaservers.status.string,"Scanning The Trepidation Universe." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $219
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 464
;464:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $183
ASGNP4
line 467
;465:
;466:			// disable controls during refresh
;467:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
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
line 468
;468:			g_arenaservers.mserver.generic.flags		|= QMF_GRAYED;
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
line 469
;469:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
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
line 470
;470:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 471
;471:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+808+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 472
;472:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+744+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 473
;473:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+872+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 474
;474:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1640+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 475
;475:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+1904+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 476
;476:			g_arenaservers.punkbuster.generic.flags |= QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+14956+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 477
;477:		}
ADDRGP4 $215
JUMPV
LABELV $214
line 478
;478:		else {
line 479
;479:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
GEI4 $242
line 480
;480:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $247
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 481
;481:			}
ADDRGP4 $243
JUMPV
LABELV $242
line 482
;482:			else {
line 483
;483:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 484
;484:			}
LABELV $243
line 487
;485:
;486:			// update status bar
;487:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 28
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $253
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $251
LABELV $253
line 488
;488:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 quake3worldMessage
ASGNP4
line 489
;489:			}
ADDRGP4 $252
JUMPV
LABELV $251
line 490
;490:			else {
line 491
;491:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $213
ASGNP4
line 492
;492:			}
LABELV $252
line 495
;493:
;494:			// end of refresh - set control state
;495:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
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
line 496
;496:			g_arenaservers.mserver.generic.flags		&= ~QMF_GRAYED;
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
line 497
;497:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
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
line 498
;498:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
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
line 499
;499:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+808+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 500
;500:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+744+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 501
;501:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+872+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 502
;502:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+1640+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 503
;503:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 64
ADDRGP4 g_arenaservers+1904+44
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 504
;504:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
ADDRLP4 68
ADDRGP4 g_arenaservers+14956+44
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 505
;505:		}
LABELV $215
line 508
;506:
;507:		// zero out list box
;508:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+872+68
CNSTI4 0
ASGNI4
line 509
;509:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+872+64
CNSTI4 0
ASGNI4
line 510
;510:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+872+72
CNSTI4 0
ASGNI4
line 513
;511:
;512:		// update picture
;513:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 514
;514:		return;
ADDRGP4 $167
JUMPV
LABELV $169
line 522
;515:	}
;516:	
;517:	
;518:	
;519:	
;520:
;521:	// build list box strings - apply culling filters
;522:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+13904
INDIRP4
ASGNP4
line 523
;523:	count         = *g_arenaservers.numservers;
ADDRLP4 24
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 524
;524:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
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
ADDRGP4 $289
JUMPV
LABELV $286
line 525
;525:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
CNSTI4 72
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 526
;526:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 527
;527:		buff = tableptr->buff;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
line 530
;528:
;529:		// can only cull valid results
;530:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $291
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $291
line 531
;531:			continue;
ADDRGP4 $287
JUMPV
LABELV $291
line 534
;532:		}
;533:
;534:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $293
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
NEI4 $293
line 535
;535:			continue;
ADDRGP4 $287
JUMPV
LABELV $293
line 538
;536:		}
;537:		
;538:		switch( g_gametype ) {
ADDRLP4 40
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $295
ADDRLP4 40
INDIRI4
CNSTI4 8
GTI4 $295
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $322
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $322
address $296
address $298
address $301
address $304
address $307
address $310
address $313
address $316
address $319
code
line 540
;539:		case GAMES_ALL:
;540:			break;
LABELV $298
line 543
;541:
;542:		case GAMES_FFA:	
;543:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 544
;544:				continue;
ADDRGP4 $287
JUMPV
line 546
;545:			}
;546:			break;
LABELV $301
line 549
;547:
;548:		case GAMES_TEAMPLAY:
;549:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 3
EQI4 $296
line 550
;550:				continue;
ADDRGP4 $287
JUMPV
line 552
;551:			}
;552:			break;
LABELV $304
line 555
;553:
;554:		case GAMES_TOURNEY:
;555:			if( servernodeptr->gametype != GT_TOURNAMENT ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
EQI4 $296
line 556
;556:				continue;
ADDRGP4 $287
JUMPV
line 558
;557:			}
;558:			break;
LABELV $307
line 561
;559:
;560:		case GAMES_CTF:
;561:			if( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
EQI4 $296
line 562
;562:				continue;
ADDRGP4 $287
JUMPV
line 564
;563:			}
;564:			break;
LABELV $310
line 567
;565:		case GAMES_ARSENAL:  // Shafe - Trep - Game type Freeze - Server Filter - This isnt a filter yet
;566:			 //strcmp(servernodeptr->gamename,"eternal") != 0
;567:			if(( servernodeptr->gametype != GT_FFA ) && (servernodeptr->g_gamemode == 1))  {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 1
NEI4 $296
line 568
;568:				continue;
ADDRGP4 $287
JUMPV
line 571
;569:				
;570:			}
;571:			break;
LABELV $313
line 573
;572:		case GAMES_LASTMAN: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet
;573:			if(( servernodeptr->gametype != GT_FFA ) && (servernodeptr->g_gamemode == 2))  {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 2
NEI4 $296
line 574
;574:				continue;
ADDRGP4 $287
JUMPV
line 576
;575:			}
;576:			break;
LABELV $316
line 578
;577:		case GAMES_TREPIDATION: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet			
;578:			if(( servernodeptr->gametype != GT_TEAM ) && (servernodeptr->g_gamemode == 3))  {
ADDRLP4 56
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $296
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $296
line 579
;579:				continue;
ADDRGP4 $287
JUMPV
line 581
;580:			}
;581:			break;
LABELV $319
line 584
;582:		
;583:		case GAMES_FREEZETAG: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet			
;584:			if(( servernodeptr->gametype != GT_TEAM ) && (servernodeptr->g_gamemode == 3))  {
ADDRLP4 64
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $296
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $296
line 585
;585:				continue;
ADDRGP4 $287
JUMPV
line 587
;586:			}
;587:			break;
LABELV $295
LABELV $296
line 591
;588:
;589:		}
;590:
;591:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
GEI4 $323
line 592
;592:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $325
ASGNP4
line 593
;593:		}
ADDRGP4 $324
JUMPV
LABELV $323
line 594
;594:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $326
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $326
line 595
;595:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $325
ASGNP4
line 596
;596:		}
ADDRGP4 $327
JUMPV
LABELV $326
line 597
;597:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 200
GEI4 $328
line 598
;598:			pingColor = S_COLOR_GREEN;
ADDRLP4 20
ADDRGP4 $330
ASGNP4
line 599
;599:		}
ADDRGP4 $329
JUMPV
LABELV $328
line 600
;600:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 400
GEI4 $331
line 601
;601:			pingColor = S_COLOR_YELLOW;
ADDRLP4 20
ADDRGP4 $333
ASGNP4
line 602
;602:		}
ADDRGP4 $332
JUMPV
LABELV $331
line 603
;603:		else {
line 604
;604:			pingColor = S_COLOR_RED;
ADDRLP4 20
ADDRGP4 $334
ASGNP4
line 605
;605:		}
LABELV $332
LABELV $329
LABELV $327
LABELV $324
line 607
;606:
;607:		if (servernodeptr->g_instagib == 1) 
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $335
line 608
;608:		{	
line 609
;609:			servernodeptr->bPB = qtrue; 
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 610
;610:		} else {
ADDRGP4 $336
JUMPV
LABELV $335
line 611
;611:			servernodeptr->bPB = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 0
ASGNI4
line 612
;612:		}
LABELV $336
line 615
;613:
;614:
;615:		if ( servernodeptr->g_gamemode == 1) 
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 1
NEI4 $337
line 616
;616:		{
line 617
;617:			Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $339
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
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
ADDRGP4 $340
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
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
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $344
ADDRLP4 56
ADDRGP4 $341
ASGNP4
ADDRGP4 $345
JUMPV
LABELV $344
ADDRLP4 56
ADDRGP4 $342
ASGNP4
LABELV $345
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 621
;618:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;619: 			servernodeptr->maxclients, "arsenal",
;620:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime, servernodeptr->bPB ? "Yes" : "No" );
;621:		} else
ADDRGP4 $338
JUMPV
LABELV $337
line 622
;622:		{
line 623
;623:			Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $339
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
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
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
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $347
ADDRLP4 56
ADDRGP4 $341
ASGNP4
ADDRGP4 $348
JUMPV
LABELV $347
ADDRLP4 56
ADDRGP4 $342
ASGNP4
LABELV $348
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 627
;624:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;625: 			servernodeptr->maxclients, servernodeptr->gamename,
;626:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime, servernodeptr->bPB ? "Yes" : "No" );
;627:		}
LABELV $338
line 629
;628:		
;629:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 630
;630:	}
LABELV $287
line 524
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
LABELV $289
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $286
line 632
;631:
;632:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+872+68
ADDRLP4 8
INDIRI4
ASGNI4
line 633
;633:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+872+64
CNSTI4 0
ASGNI4
line 634
;634:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+872+72
CNSTI4 0
ASGNI4
line 637
;635:
;636:	// update picture
;637:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 638
;638:}
LABELV $167
endproc ArenaServers_UpdateMenu 72 48
proc ArenaServers_Remove 24 12
line 647
;639:
;640:
;641:/*
;642:=================
;643:ArenaServers_Remove
;644:=================
;645:*/
;646:static void ArenaServers_Remove( void )
;647:{
line 652
;648:	int				i;
;649:	servernode_t*	servernodeptr;
;650:	table_t*		tableptr;
;651:
;652:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+872+68
INDIRI4
CNSTI4 0
NEI4 $356
line 653
;653:		return;
ADDRGP4 $355
JUMPV
LABELV $356
line 659
;654:
;655:	// remove selected item from display list
;656:	// items are in scattered order due to sort and cull
;657:	// perform delete on list box contents, resync all lists
;658:
;659:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 660
;660:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
line 663
;661:
;662:	// find address in master list
;663:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $366
JUMPV
LABELV $363
line 664
;664:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13928
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
NEI4 $368
line 665
;665:				break;
ADDRGP4 $365
JUMPV
LABELV $368
LABELV $364
line 663
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $366
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $363
LABELV $365
line 668
;666:
;667:	// delete address from master list
;668:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
CNSTI4 1
SUBI4
GTI4 $371
line 669
;669:	{
line 670
;670:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
CNSTI4 1
SUBI4
GEI4 $374
line 671
;671:		{
line 673
;672:			// shift items up
;673:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*sizeof(MAX_ADDRESSLENGTH));
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_arenaservers+13928
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_arenaservers+13928+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+14952
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
line 674
;674:		}
LABELV $374
line 675
;675:		g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+14952
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 676
;676:	}	
LABELV $371
line 679
;677:
;678:	// find address in server list
;679:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $382
line 680
;680:		if (&g_favoriteserverlist[i] == servernodeptr)
CNSTI4 272
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $386
line 681
;681:				break;
ADDRGP4 $384
JUMPV
LABELV $386
LABELV $383
line 679
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $385
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $382
LABELV $384
line 684
;682:
;683:	// delete address from server list
;684:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $388
line 685
;685:	{
line 686
;686:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $390
line 687
;687:		{
line 689
;688:			// shift items up
;689:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 20
CNSTI4 272
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
ADDRGP4 g_favoriteserverlist+272
ADDP4
ARGP4
CNSTU4 272
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
line 690
;690:		}
LABELV $390
line 691
;691:		g_numfavoriteservers--;
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
line 692
;692:	}	
LABELV $388
line 694
;693:
;694:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 695
;695:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 696
;696:}
LABELV $355
endproc ArenaServers_Remove 24 12
proc ArenaServers_Insert 104 12
line 705
;697:
;698:
;699:/*
;700:=================
;701:ArenaServers_Insert
;702:=================
;703:*/
;704:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;705:{
line 712
;706:	servernode_t*	servernodeptr;
;707:	char*			s;
;708:	int				i;
;709:	int				x;
;710:
;711:
;712:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 16
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $398
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $398
line 713
;713:	{
line 715
;714:		// slow global or local servers do not get entered
;715:		return;
ADDRGP4 $397
JUMPV
LABELV $398
line 718
;716:	}
;717:
;718:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+13920
INDIRI4
LTI4 $400
line 720
;719:		// list full;
;720:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 0
CNSTI4 272
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13904
INDIRP4
ADDP4
CNSTI4 -272
ADDP4
ASGNP4
line 721
;721:	} else {
ADDRGP4 $401
JUMPV
LABELV $400
line 723
;722:		// next slot
;723:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 0
CNSTI4 272
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13904
INDIRP4
ADDP4
ASGNP4
line 724
;724:		(*g_arenaservers.numservers)++;
ADDRLP4 20
ADDRGP4 g_arenaservers+13900
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 725
;725:	}
LABELV $401
line 727
;726:
;727:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
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
line 729
;728:
;729:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 730
;730:	Q_CleanStr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 731
;731:	Q_strupr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 733
;732:
;733:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $410
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 734
;734:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 735
;735:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 737
;736:
;737:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $411
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 738
;738:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $412
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
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 739
;739:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 740
;740:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $413
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
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 741
;741:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 52
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 742
;742:	servernodeptr->bPB = atoi( Info_ValueForKey( info, "g_instagib") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 743
;743:	servernodeptr->g_gamemode = atoi( Info_ValueForKey( info, "g_gamemode") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 744
;744:	servernodeptr->g_instagib = atoi( Info_ValueForKey( info, "g_instagib") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $415
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
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 762
;745:
;746:	/*
;747:	s = Info_ValueForKey( info, "nettype" );
;748:	for (i=0; ;i++)
;749:	{
;750:		if (!netnames[i])
;751:		{
;752:			servernodeptr->nettype = 0;
;753:			break;
;754:		}
;755:		else if (!Q_stricmp( netnames[i], s ))
;756:		{
;757:			servernodeptr->nettype = i;
;758:			break;
;759:		}
;760:	}
;761:	*/
;762:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRLP4 84
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 764
;763:
;764:	s = Info_ValueForKey( info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $418
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 92
INDIRP4
ASGNP4
line 765
;765:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $419
ARGP4
ADDRLP4 96
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 766
;766:	if( i < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $420
line 767
;767:		i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 768
;768:	}
ADDRGP4 $421
JUMPV
LABELV $420
line 769
;769:	else if( i > 11 ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
LEI4 $422
line 770
;770:		i = 12;
ADDRLP4 4
CNSTI4 12
ASGNI4
line 771
;771:	}
LABELV $422
LABELV $421
line 772
;772:	if( *s ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $424
line 773
;773:		servernodeptr->gametype = i;//-1;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 774
;774:		Q_strncpyz( servernodeptr->gamename, s, sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 236
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
line 775
;775:	}
ADDRGP4 $425
JUMPV
LABELV $424
line 776
;776:	else {
line 780
;777:		
;778:		//x = atoi( Info_ValueForKey( info, "g_GameMode") );  // Shafe
;779:		//x = servernodeptr->g_GameMode;
;780:		servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 788
;781:	
;782:		// Shafe New Gametypes
;783:		//if (x == 1)	{ i = 5; } 
;784:		//if (x == 2)	{ i = 6; }
;785:		//if (x == 3)	{ i = 7; }
;786:		// ////////////////
;787:
;788:		Q_strncpyz( servernodeptr->gamename, gamenames[i], sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 236
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
line 790
;789:		
;790:	}
LABELV $425
line 791
;791:}
LABELV $397
endproc ArenaServers_Insert 104 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 802
;792:
;793:
;794:/*
;795:=================
;796:ArenaServers_InsertFavorites
;797:
;798:Insert nonresponsive address book entries into display lists.
;799:=================
;800:*/
;801:void ArenaServers_InsertFavorites( void )
;802:{
line 808
;803:	int		i;
;804:	int		j;
;805:	char	info[MAX_INFO_STRING];
;806:
;807:	// resync existing results with new or deleted cvars
;808:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 809
;809:	Info_SetValueForKey( info, "hostname", "No Response" );
ADDRLP4 8
ARGP4
ADDRGP4 $409
ARGP4
ADDRGP4 $427
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 810
;810:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $428
line 811
;811:	{
line 813
;812:		// find favorite address in refresh list
;813:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 814
;814:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13928
ADDP4
ARGP4
CNSTI4 272
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
NEI4 $437
line 815
;815:				break;
ADDRGP4 $435
JUMPV
LABELV $437
LABELV $434
line 813
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $433
LABELV $435
line 817
;816:
;817:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $440
line 818
;818:		{
line 820
;819:			// not in list, add it
;820:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
ADDRLP4 1036
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13928
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
line 821
;821:		}
LABELV $440
line 822
;822:	}
LABELV $429
line 810
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $431
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $428
line 823
;823:}
LABELV $426
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 5472 12
line 834
;824:
;825:
;826:/*
;827:=================
;828:ArenaServers_LoadFavorites
;829:
;830:Load cvar address book entries into local lists.
;831:=================
;832:*/
;833:void ArenaServers_LoadFavorites( void )
;834:{
line 843
;835:	int				i;
;836:	int				j;
;837:	int				numtempitems;
;838:	char			emptyinfo[MAX_INFO_STRING];
;839:	char			adrstr[MAX_ADDRESSLENGTH];
;840:	servernode_t	templist[MAX_FAVORITESERVERS];
;841:	qboolean		found;
;842:
;843:	found        = qfalse;
ADDRLP4 4428
CNSTI4 0
ASGNI4
line 844
;844:	emptyinfo[0] = '\0';
ADDRLP4 4432
CNSTI1 0
ASGNI1
line 847
;845:
;846:	// copy the old
;847:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 4352
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 848
;848:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 851
;849:
;850:	// clear the current for sync
;851:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4352
ARGI4
ADDRGP4 memset
CALLP4
pop
line 852
;852:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 855
;853:
;854:	// resync existing results with new or deleted cvars
;855:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 4424
CNSTI4 0
ASGNI4
LABELV $444
line 856
;856:	{
line 857
;857:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $448
ARGP4
ADDRLP4 4424
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 5456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 5456
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 858
;858:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $449
line 859
;859:			continue;
ADDRGP4 $445
JUMPV
LABELV $449
line 863
;860:
;861:		// quick sanity check to avoid slow domain name resolving
;862:		// first character must be numeric
;863:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 5460
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 5460
INDIRI4
CNSTI4 48
LTI4 $453
ADDRLP4 5460
INDIRI4
CNSTI4 57
LEI4 $451
LABELV $453
line 864
;864:			continue;
ADDRGP4 $445
JUMPV
LABELV $451
line 869
;865:
;866:		// favorite server addresses must be maintained outside refresh list
;867:		// this mimics local and global netadr's stored in client
;868:		// these can be fetched to fill ping list
;869:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13928
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 872
;870:
;871:		// find this server in the old list
;872:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $458
JUMPV
LABELV $455
line 873
;873:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
CNSTI4 272
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 5464
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5464
INDIRI4
CNSTI4 0
NEI4 $459
line 874
;874:				break;
ADDRGP4 $457
JUMPV
LABELV $459
LABELV $456
line 872
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $458
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $455
LABELV $457
line 876
;875:
;876:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $461
line 877
;877:		{
line 879
;878:			// found server - add exisiting results
;879:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRLP4 5468
CNSTI4 272
ASGNI4
ADDRLP4 5468
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 5468
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 5468
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 880
;880:			found = qtrue;
ADDRLP4 4428
CNSTI4 1
ASGNI4
line 881
;881:		}
ADDRGP4 $462
JUMPV
LABELV $461
line 883
;882:		else
;883:		{
line 885
;884:			// add new server
;885:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
CNSTI4 272
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
line 886
;886:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 5468
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
CNSTI4 272
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist+228
ADDP4
ADDRLP4 5468
INDIRI4
ASGNI4
line 887
;887:		}
LABELV $462
line 889
;888:
;889:		g_numfavoriteservers++;
ADDRLP4 5468
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 5468
INDIRP4
ADDRLP4 5468
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 890
;890:	}
LABELV $445
line 855
ADDRLP4 4424
ADDRLP4 4424
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4424
INDIRI4
CNSTI4 16
LTI4 $444
line 892
;891:
;892:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+14952
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 894
;893:
;894:	if (!found)
ADDRLP4 4428
INDIRI4
CNSTI4 0
NEI4 $465
line 895
;895:	{
line 898
;896:		// no results were found, reset server list
;897:		// list will be automatically refreshed when selected
;898:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 899
;899:	}
LABELV $465
line 900
;900:}
LABELV $443
endproc ArenaServers_LoadFavorites 5472 12
proc ArenaServers_StopRefresh 0 16
line 909
;901:
;902:
;903:/*
;904:=================
;905:ArenaServers_StopRefresh
;906:=================
;907:*/
;908:static void ArenaServers_StopRefresh( void )
;909:{
line 910
;910:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
NEI4 $468
line 912
;911:		// not currently refreshing
;912:		return;
ADDRGP4 $467
JUMPV
LABELV $468
line 914
;913:
;914:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+13912
CNSTI4 0
ASGNI4
line 916
;915:
;916:	if (g_servertype == AS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $472
line 917
;917:	{
line 919
;918:		// nonresponsive favorites must be shown
;919:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 920
;920:	}
LABELV $472
line 923
;921:
;922:	// final tally
;923:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
LTI4 $474
line 924
;924:	{
line 925
;925:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 926
;926:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 927
;927:	}
LABELV $474
line 930
;928:	
;929:	// sort
;930:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ARGI4
CNSTI4 272
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 932
;931:
;932:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 933
;933:}
LABELV $467
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 942
;934:
;935:
;936:/*
;937:=================
;938:ArenaServers_DoRefresh
;939:=================
;940:*/
;941:static void ArenaServers_DoRefresh( void )
;942:{
line 950
;943:	int		i;
;944:	int		j;
;945:	int		time;
;946:	int		maxPing;
;947:	char	adrstr[MAX_ADDRESSLENGTH];
;948:	char	info[MAX_INFO_STRING];
;949:
;950:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13924
INDIRI4
GEI4 $484
line 951
;951:	{
line 952
;952:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $488
line 953
;953:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 1
NEI4 $490
line 954
;954:				if (!trap_LAN_GetServerCount(g_servertype)) {
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
NEI4 $492
line 955
;955:					return;
ADDRGP4 $483
JUMPV
LABELV $492
line 957
;956:				}
;957:			}
LABELV $490
line 958
;958:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
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
GEI4 $494
line 960
;959:			  // still waiting for response
;960:			  return;
ADDRGP4 $483
JUMPV
LABELV $494
line 962
;961:			}
;962:	  }
LABELV $488
line 963
;963:	}
LABELV $484
line 965
;964:
;965:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13916
INDIRI4
GEI4 $496
line 966
;966:	{
line 968
;967:		// wait for time trigger
;968:		return;
ADDRGP4 $483
JUMPV
LABELV $496
line 972
;969:	}
;970:
;971:	// trigger at 10Hz intervals
;972:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+13916
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 975
;973:
;974:	// process ping results
;975:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 976
;976:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $502
line 977
;977:	{
line 978
;978:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
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
line 979
;979:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $506
line 980
;980:		{
line 982
;981:			// ignore empty or pending pings
;982:			continue;
ADDRGP4 $503
JUMPV
LABELV $506
line 986
;983:		}
;984:
;985:		// find ping result in our local list
;986:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $508
line 987
;987:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
ADDRLP4 4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $512
line 988
;988:				break;
ADDRGP4 $510
JUMPV
LABELV $512
LABELV $509
line 986
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $508
LABELV $510
line 990
;989:
;990:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $515
line 991
;991:		{
line 993
;992:			// found it
;993:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $517
line 994
;994:			{
line 995
;995:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 996
;996:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $522
line 997
;997:				{
line 999
;998:					// still waiting
;999:					continue;
ADDRGP4 $503
JUMPV
LABELV $522
line 1001
;1000:				}
;1001:			}
LABELV $517
line 1003
;1002:
;1003:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $524
line 1004
;1004:			{
line 1006
;1005:				// stale it out
;1006:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 1007
;1007:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 1008
;1008:			}
ADDRGP4 $525
JUMPV
LABELV $524
line 1010
;1009:			else
;1010:			{
line 1011
;1011:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
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
line 1012
;1012:			}
LABELV $525
line 1015
;1013:
;1014:			// insert ping results
;1015:			ArenaServers_Insert( adrstr, info, time );
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
line 1018
;1016:
;1017:			// clear this query from internal list
;1018:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
CNSTI1 0
ASGNI1
line 1019
;1019:   		}
LABELV $515
line 1022
;1020:
;1021:		// clear this query from external list
;1022:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1023
;1023:	}
LABELV $503
line 976
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $502
line 1027
;1024:
;1025:	// get results of servers query
;1026:	// counts can increase as servers respond
;1027:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $527
line 1028
;1028:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 1029
;1029:	} else {
ADDRGP4 $528
JUMPV
LABELV $527
line 1030
;1030:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+13896
ADDRLP4 1108
INDIRI4
ASGNI4
line 1031
;1031:	}
LABELV $528
line 1038
;1032:
;1033://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;1034://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;1035:
;1036:	// send ping requests in reasonable bursts
;1037:	// iterate ping through all found servers
;1038:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $535
JUMPV
LABELV $532
line 1039
;1039:	{
line 1040
;1040:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $538
line 1041
;1041:		{
line 1043
;1042:			// ping queue is full
;1043:			break;
ADDRGP4 $534
JUMPV
LABELV $538
line 1047
;1044:		}
;1045:
;1046:		// find empty slot
;1047:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $540
line 1048
;1048:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $544
line 1049
;1049:				break;
ADDRGP4 $542
JUMPV
LABELV $544
LABELV $541
line 1047
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $540
LABELV $542
line 1051
;1050:
;1051:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $547
line 1053
;1052:			// no empty slots available yet - wait for timeout
;1053:			break;
ADDRGP4 $534
JUMPV
LABELV $547
line 1057
;1054:
;1055:		// get an address to ping
;1056:
;1057:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $549
line 1058
;1058:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+13908
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13928
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1059
;1059:		} else {
ADDRGP4 $550
JUMPV
LABELV $549
line 1060
;1060:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+13908
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 1061
;1061:		}
LABELV $550
line 1063
;1062:
;1063:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1064
;1064:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1066
;1065:
;1066:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $558
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
line 1069
;1067:		
;1068:		// advance to next server
;1069:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+13908
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1070
;1070:	}
LABELV $533
line 1038
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $535
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $560
ADDRGP4 g_arenaservers+13908
INDIRI4
ADDRGP4 g_arenaservers+13896
INDIRI4
LTI4 $532
LABELV $560
LABELV $534
line 1072
;1071:
;1072:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $561
line 1073
;1073:	{
line 1075
;1074:		// all pings completed
;1075:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1076
;1076:		return;
ADDRGP4 $483
JUMPV
LABELV $561
line 1080
;1077:	}
;1078:
;1079:	// update the user interface with ping status
;1080:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1081
;1081:}
LABELV $483
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 1090
;1082:
;1083:
;1084:/*
;1085:=================
;1086:ArenaServers_StartRefresh
;1087:=================
;1088:*/
;1089:static void ArenaServers_StartRefresh( void )
;1090:{
line 1094
;1091:	int		i;
;1092:	char	myargs[32], protocol[32];
;1093:
;1094:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 72
ADDRGP4 g_arenaservers+13920
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1096
;1095:
;1096:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $566
line 1097
;1097:	{
line 1098
;1098:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
CNSTI1 0
ASGNI1
line 1099
;1099:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1100
;1100:	}
LABELV $567
line 1096
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $566
line 1102
;1101:
;1102:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+13912
CNSTI4 1
ASGNI4
line 1103
;1103:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+13908
CNSTI4 0
ASGNI4
line 1104
;1104:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+13916
CNSTI4 0
ASGNI4
line 1105
;1105:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+13900
INDIRP4
CNSTI4 0
ASGNI4
line 1106
;1106:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+13896
CNSTI4 0
ASGNI4
line 1109
;1107:
;1108:	// allow max 5 seconds for responses
;1109:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+13924
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1112
;1110:
;1111:	// place menu in zeroed state
;1112:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1114
;1113:
;1114:	if( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 1
NEI4 $578
line 1115
;1115:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $580
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1116
;1116:		return;
ADDRGP4 $563
JUMPV
LABELV $578
line 1119
;1117:	}
;1118:
;1119:	if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $583
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $581
LABELV $583
line 1120
;1120:		if( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $584
line 1121
;1121:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1122
;1122:		}
ADDRGP4 $585
JUMPV
LABELV $584
line 1123
;1123:		else {
line 1124
;1124:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1125
;1125:		}
LABELV $585
line 1127
;1126:
;1127:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+552+64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $586
ADDRLP4 72
INDIRI4
CNSTI4 4
GTI4 $586
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $599
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $599
address $590
address $591
address $593
address $595
address $597
code
LABELV $586
LABELV $590
line 1130
;1128:		default:
;1129:		case GAMES_ALL:
;1130:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 1131
;1131:			break;
ADDRGP4 $587
JUMPV
LABELV $591
line 1134
;1132:
;1133:		case GAMES_FFA:
;1134:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $592
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1135
;1135:			break;
ADDRGP4 $587
JUMPV
LABELV $593
line 1138
;1136:
;1137:		case GAMES_TEAMPLAY:
;1138:			strcpy( myargs, " team" );
ADDRLP4 36
ARGP4
ADDRGP4 $594
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1139
;1139:			break;
ADDRGP4 $587
JUMPV
LABELV $595
line 1142
;1140:
;1141:		case GAMES_TOURNEY:
;1142:			strcpy( myargs, " tourney" );
ADDRLP4 36
ARGP4
ADDRGP4 $596
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1143
;1143:			break;
ADDRGP4 $587
JUMPV
LABELV $597
line 1146
;1144:
;1145:		case GAMES_CTF:
;1146:			strcpy( myargs, " ctf" );
ADDRLP4 36
ARGP4
ADDRGP4 $598
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1147
;1147:			break;
LABELV $587
line 1151
;1148:		}
;1149:
;1150:
;1151:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $600
line 1152
;1152:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $602
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1153
;1153:		}
LABELV $600
line 1155
;1154:
;1155:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $603
line 1156
;1156:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $605
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1157
;1157:		}
LABELV $603
line 1159
;1158:
;1159:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1160
;1160:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $606
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1165
;1161:		
;1162:
;1163:		// Shafe - Trep Here is where we ditch the whole AS_MPLAYER Thing and replace it with multimaster support
;1164:		// i will define which hardcoded master to use 0 is default or sv_master1
;1165:		i = ui_browserMasterNum.integer;
ADDRLP4 0
ADDRGP4 ui_browserMasterNum+12
INDIRI4
ASGNI4
line 1167
;1166:		// End Shafe
;1167:		Com_Printf("Sending to master number %d \n", i);
ADDRGP4 $608
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1168
;1168:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $609
line 1169
;1169:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", i, protocol, myargs ));
ADDRGP4 $611
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
line 1170
;1170:		}
ADDRGP4 $610
JUMPV
LABELV $609
line 1171
;1171:		else {
line 1172
;1172:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", i, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $613
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $612
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
line 1173
;1173:		}
LABELV $610
line 1174
;1174:	}
LABELV $581
line 1175
;1175:}
LABELV $563
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1184
;1176:
;1177:
;1178:/*
;1179:=================
;1180:ArenaServers_SaveChanges
;1181:=================
;1182:*/
;1183:void ArenaServers_SaveChanges( void )
;1184:{
line 1187
;1185:	int	i;
;1186:
;1187:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $618
JUMPV
LABELV $615
line 1188
;1188:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $448
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
ADDRGP4 g_arenaservers+13928
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $616
line 1187
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $618
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $615
line 1190
;1189:
;1190:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $624
JUMPV
LABELV $621
line 1191
;1191:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $448
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
ADDRGP4 $213
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $622
line 1190
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $624
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $621
line 1192
;1192:}
LABELV $614
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1200
;1193:
;1194:
;1195:/*
;1196:=================
;1197:ArenaServers_Sort
;1198:=================
;1199:*/
;1200:void ArenaServers_Sort( int type ) {
line 1201
;1201:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $626
line 1202
;1202:		return;
ADDRGP4 $625
JUMPV
LABELV $626
line 1205
;1203:	}
;1204:
;1205:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1206
;1206:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ARGI4
CNSTI4 272
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1207
;1207:}
LABELV $625
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 20 8
line 1216
;1208:
;1209:
;1210:/*
;1211:=================
;1212:ArenaServers_SetType
;1213:=================
;1214:*/
;1215:void ArenaServers_SetType( int type )
;1216:{
line 1217
;1217:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $631
line 1218
;1218:		return;
ADDRGP4 $630
JUMPV
LABELV $631
line 1220
;1219:
;1220:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1222
;1221:
;1222:	switch( type )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $633
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $633
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $659
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $659
address $635
address $641
address $653
address $647
code
line 1223
;1223:	{
LABELV $633
LABELV $635
line 1226
;1224:	default:
;1225:	case AS_GLOBAL: // AS_Global is now set as default -Vincent
;1226:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 g_arenaservers+1464+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1227
;1227:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_globalserverlist
ASGNP4
line 1228
;1228:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numglobalservers
ASGNP4
line 1229
;1229:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1230
;1230:		break;
ADDRGP4 $634
JUMPV
LABELV $641
line 1233
;1231:
;1232:	case AS_LOCAL:
;1233:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+1464+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1234
;1234:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_localserverlist
ASGNP4
line 1235
;1235:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numlocalservers
ASGNP4
line 1236
;1236:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1237
;1237:		break;
ADDRGP4 $634
JUMPV
LABELV $647
line 1240
;1238:
;1239:	case AS_FAVORITES:
;1240:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+1464+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1241
;1241:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1242
;1242:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1243
;1243:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 16
ASGNI4
line 1244
;1244:		break;
ADDRGP4 $634
JUMPV
LABELV $653
line 1247
;1245:
;1246:	case AS_MPLAYER:
;1247:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 g_arenaservers+1464+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1248
;1248:		g_arenaservers.serverlist = g_mplayerserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_mplayerserverlist
ASGNP4
line 1249
;1249:		g_arenaservers.numservers = &g_nummplayerservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_nummplayerservers
ASGNP4
line 1250
;1250:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1251
;1251:		break;
LABELV $634
line 1255
;1252:		
;1253:	}
;1254:
;1255:	if( !*g_arenaservers.numservers )
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $660
line 1256
;1256:	{
line 1257
;1257:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1258
;1258:	}
ADDRGP4 $661
JUMPV
LABELV $660
line 1260
;1259:	else 
;1260:	{
line 1262
;1261:		// avoid slow operation, use existing results
;1262:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 1263
;1263:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 1264
;1264:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1265
;1265:	}
LABELV $661
line 1266
;1266:	strcpy(g_arenaservers.status.string,"hit refresh to update");
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $669
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1267
;1267:}
LABELV $630
endproc ArenaServers_SetType 20 8
proc Punkbuster_ConfirmEnable 8 12
line 1274
;1268:
;1269:/*
;1270:=================
;1271:PunkBuster_Confirm
;1272:=================
;1273:*/
;1274:static void Punkbuster_ConfirmEnable( qboolean result ) {
line 1275
;1275:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $671
line 1276
;1276:	{		
line 1277
;1277:		trap_SetPbClStatus(1);
CNSTI4 1
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1278
;1278:	}
LABELV $671
line 1279
;1279:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $675
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
ADDRGP4 g_arenaservers+14956+64
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1280
;1280:}
LABELV $670
endproc Punkbuster_ConfirmEnable 8 12
proc Punkbuster_ConfirmDisable 8 12
line 1282
;1281:
;1282:static void Punkbuster_ConfirmDisable( qboolean result ) {
line 1283
;1283:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $677
line 1284
;1284:	{
line 1285
;1285:		trap_SetPbClStatus(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1286
;1286:		UI_Message( punkbuster_msg );
ADDRGP4 punkbuster_msg
ARGP4
ADDRGP4 UI_Message
CALLV
pop
line 1287
;1287:	}
LABELV $677
line 1288
;1288:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $675
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
ADDRGP4 g_arenaservers+14956+64
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1289
;1289:}
LABELV $676
endproc Punkbuster_ConfirmDisable 8 12
proc ArenaServers_Event 12 16
line 1296
;1290:
;1291:/*
;1292:=================
;1293:ArenaServers_Event
;1294:=================
;1295:*/
;1296:static void ArenaServers_Event( void* ptr, int event ) {
line 1300
;1297:	int		id;
;1298:	int value;
;1299:
;1300:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1302
;1301:
;1302:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $682
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $682
line 1303
;1303:		return;
ADDRGP4 $681
JUMPV
LABELV $682
line 1306
;1304:	}
;1305:
;1306:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $684
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $684
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $740-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $740
address $686
address $696
address $702
address $708
address $714
address $720
address $723
address $725
address $727
address $728
address $729
address $730
address $731
address $732
address $733
address $692
code
LABELV $686
line 1308
;1307:	case ID_MASTER:
;1308:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+360+64
INDIRI4
ASGNI4
line 1309
;1309:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $689
line 1310
;1310:		{
line 1311
;1311:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1312
;1312:		}
LABELV $689
line 1313
;1313:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $691
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1314
;1314:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1315
;1315:		break;
ADDRGP4 $685
JUMPV
LABELV $692
line 1318
;1316:
;1317:	case ID_MSERVER:  // Shafe
;1318:		trap_Cvar_SetValue( "ui_browserMasterNum", g_arenaservers.mserver.curvalue );	
ADDRGP4 $693
ARGP4
ADDRGP4 g_arenaservers+456+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1319
;1319:		break;
ADDRGP4 $685
JUMPV
LABELV $696
line 1322
;1320:		
;1321:	case ID_GAMETYPE:
;1322:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $697
ARGP4
ADDRGP4 g_arenaservers+552+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1323
;1323:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+552+64
INDIRI4
ASGNI4
line 1324
;1324:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1325
;1325:		break;
ADDRGP4 $685
JUMPV
LABELV $702
line 1328
;1326:
;1327:	case ID_SORTKEY:
;1328:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $703
ARGP4
ADDRGP4 g_arenaservers+648+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1329
;1329:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+648+64
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1330
;1330:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1331
;1331:		break;
ADDRGP4 $685
JUMPV
LABELV $708
line 1334
;1332:
;1333:	case ID_SHOW_FULL:
;1334:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $709
ARGP4
ADDRGP4 g_arenaservers+744+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1335
;1335:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+744+60
INDIRI4
ASGNI4
line 1336
;1336:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1337
;1337:		break;
ADDRGP4 $685
JUMPV
LABELV $714
line 1340
;1338:
;1339:	case ID_SHOW_EMPTY:
;1340:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $715
ARGP4
ADDRGP4 g_arenaservers+808+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1341
;1341:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+808+60
INDIRI4
ASGNI4
line 1342
;1342:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1343
;1343:		break;
ADDRGP4 $685
JUMPV
LABELV $720
line 1346
;1344:
;1345:	case ID_LIST:
;1346:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $685
line 1347
;1347:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1348
;1348:		}
line 1349
;1349:		break;
ADDRGP4 $685
JUMPV
LABELV $723
line 1352
;1350:
;1351:	case ID_SCROLL_UP:
;1352:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+872
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1353
;1353:		break;
ADDRGP4 $685
JUMPV
LABELV $725
line 1356
;1354:
;1355:	case ID_SCROLL_DOWN:
;1356:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+872
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1357
;1357:		break;
ADDRGP4 $685
JUMPV
LABELV $727
line 1360
;1358:
;1359:	case ID_BACK:
;1360:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1361
;1361:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1362
;1362:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1363
;1363:		break;
ADDRGP4 $685
JUMPV
LABELV $728
line 1366
;1364:
;1365:	case ID_REFRESH:
;1366:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1367
;1367:		break;
ADDRGP4 $685
JUMPV
LABELV $729
line 1370
;1368:
;1369:	case ID_SPECIFY:
;1370:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1371
;1371:		break;
ADDRGP4 $685
JUMPV
LABELV $730
line 1374
;1372:
;1373:	case ID_CREATE:
;1374:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1375
;1375:		break;
ADDRGP4 $685
JUMPV
LABELV $731
line 1378
;1376:
;1377:	case ID_CONNECT:
;1378:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1379
;1379:		break;
ADDRGP4 $685
JUMPV
LABELV $732
line 1382
;1380:
;1381:	case ID_REMOVE:
;1382:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1383
;1383:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1384
;1384:		break;
ADDRGP4 $685
JUMPV
LABELV $733
line 1387
;1385:	
;1386:	case ID_PUNKBUSTER:
;1387:		if (g_arenaservers.punkbuster.curvalue)			
ADDRGP4 g_arenaservers+14956+64
INDIRI4
CNSTI4 0
EQI4 $734
line 1388
;1388:		{
line 1389
;1389:			UI_ConfirmMenu_Style( "Enable Punkbuster?",  UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmEnable );
ADDRGP4 $738
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
line 1390
;1390:		}
ADDRGP4 $685
JUMPV
LABELV $734
line 1392
;1391:		else
;1392:		{
line 1393
;1393:			UI_ConfirmMenu_Style( "Disable Punkbuster?", UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmDisable );
ADDRGP4 $739
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
line 1394
;1394:		}
line 1395
;1395:		break;
LABELV $684
LABELV $685
line 1397
;1396:	}
;1397:}
LABELV $681
endproc ArenaServers_Event 12 16
proc ArenaServers_MenuDraw 0 4
line 1406
;1398:
;1399:
;1400:/*
;1401:=================
;1402:ArenaServers_MenuDraw
;1403:=================
;1404:*/
;1405:static void ArenaServers_MenuDraw( void )
;1406:{
line 1407
;1407:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $743
line 1408
;1408:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $743
line 1410
;1409:
;1410:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1411
;1411:}
LABELV $742
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1419
;1412:
;1413:
;1414:/*
;1415:=================
;1416:ArenaServers_MenuKey
;1417:=================
;1418:*/
;1419:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1420
;1420:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $747
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $747
line 1421
;1421:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1422
;1422:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $746
JUMPV
LABELV $747
line 1425
;1423:	}
;1424:
;1425:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $753
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $750
LABELV $753
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $750
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+872
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $750
line 1426
;1426:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1427
;1427:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1428
;1428:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1429
;1429:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $746
JUMPV
LABELV $750
line 1432
;1430:	}
;1431:
;1432:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $756
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $754
LABELV $756
line 1433
;1433:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1434
;1434:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1435
;1435:	}
LABELV $754
line 1438
;1436:
;1437:
;1438:	return Menu_DefaultKey( &g_arenaservers.menu, key );
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
LABELV $746
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $758
skip 64
code
proc ArenaServers_MenuInit 48 16
line 1447
;1439:}
;1440:
;1441:
;1442:/*
;1443:=================
;1444:ArenaServers_MenuInit
;1445:=================
;1446:*/
;1447:static void ArenaServers_MenuInit( void ) {
line 1455
;1448:	int			i;
;1449:	int			type;
;1450:	int			y;
;1451:	int			value;
;1452:	static char	statusbuffer[MAX_STATUSLENGTH];
;1453:
;1454:	// zero set all our globals
;1455:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15756
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1457
;1456:
;1457:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1459
;1458:
;1459:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1460
;1460:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1461
;1461:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1462
;1462:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1464
;1463:
;1464:	g_arenaservers.banner.generic.type  = MTYPE_TEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 7
ASGNI4
line 1465
;1465:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1466
;1466:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1467
;1467:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1468
;1468:	g_arenaservers.banner.string  		= "TREPIDATION SERVERS";
ADDRGP4 g_arenaservers+288+60
ADDRGP4 $772
ASGNP4
line 1469
;1469:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+288+64
CNSTI4 1
ASGNI4
line 1470
;1470:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+288+68
ADDRGP4 color_white
ASGNP4
line 1474
;1471:
;1472:
;1473:
;1474:	y = 50;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 1475
;1475:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+360
CNSTI4 3
ASGNI4
line 1476
;1476:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+360+4
ADDRGP4 $780
ASGNP4
line 1477
;1477:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+360+44
CNSTU4 262
ASGNU4
line 1478
;1478:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+360+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1479
;1479:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+360+8
CNSTI4 10
ASGNI4
line 1480
;1480:	g_arenaservers.master.generic.x				= 150;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+360+12
CNSTI4 150
ASGNI4
line 1481
;1481:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+360+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1482
;1482:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+360+76
ADDRGP4 master_items
ASGNP4
line 1485
;1483:
;1484:	// Shafe - Multi Masters
;1485:	y += SMALLCHAR_HEIGHT;	
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1486
;1486:	g_arenaservers.mserver.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+456
CNSTI4 3
ASGNI4
line 1487
;1487:	g_arenaservers.mserver.generic.name			= "Master Server:";
ADDRGP4 g_arenaservers+456+4
ADDRGP4 $796
ASGNP4
line 1488
;1488:	g_arenaservers.mserver.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+456+44
CNSTU4 262
ASGNU4
line 1489
;1489:	g_arenaservers.mserver.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1490
;1490:	g_arenaservers.mserver.generic.id			= ID_MSERVER;
ADDRGP4 g_arenaservers+456+8
CNSTI4 25
ASGNI4
line 1491
;1491:	g_arenaservers.mserver.generic.x				= 150;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+456+12
CNSTI4 150
ASGNI4
line 1492
;1492:	g_arenaservers.mserver.generic.y				= y;
ADDRGP4 g_arenaservers+456+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1493
;1493:	g_arenaservers.mserver.itemnames				= master_servers;
ADDRGP4 g_arenaservers+456+76
ADDRGP4 master_servers
ASGNP4
line 1495
;1494:
;1495:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1496
;1496:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+552
CNSTI4 3
ASGNI4
line 1497
;1497:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+552+4
ADDRGP4 $812
ASGNP4
line 1498
;1498:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+552+44
CNSTU4 258
ASGNU4
line 1499
;1499:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1500
;1500:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+552+8
CNSTI4 11
ASGNI4
line 1501
;1501:	g_arenaservers.gametype.generic.x			= 150;
ADDRGP4 g_arenaservers+552+12
CNSTI4 150
ASGNI4
line 1502
;1502:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+552+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1503
;1503:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+552+76
ADDRGP4 servertype_items
ASGNP4
line 1505
;1504:
;1505:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1506
;1506:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+648
CNSTI4 3
ASGNI4
line 1507
;1507:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+648+4
ADDRGP4 $828
ASGNP4
line 1508
;1508:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+648+44
CNSTU4 258
ASGNU4
line 1509
;1509:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+648+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1510
;1510:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+648+8
CNSTI4 12
ASGNI4
line 1511
;1511:	g_arenaservers.sortkey.generic.x			= 150;
ADDRGP4 g_arenaservers+648+12
CNSTI4 150
ASGNI4
line 1512
;1512:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+648+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1513
;1513:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+648+76
ADDRGP4 sortkey_items
ASGNP4
line 1515
;1514:
;1515:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1516
;1516:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+744
CNSTI4 5
ASGNI4
line 1517
;1517:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+744+4
ADDRGP4 $844
ASGNP4
line 1518
;1518:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+744+44
CNSTU4 258
ASGNU4
line 1519
;1519:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+744+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1520
;1520:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+744+8
CNSTI4 13
ASGNI4
line 1521
;1521:	g_arenaservers.showfull.generic.x			= 150;
ADDRGP4 g_arenaservers+744+12
CNSTI4 150
ASGNI4
line 1522
;1522:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+744+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1524
;1523:
;1524:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1525
;1525:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+808
CNSTI4 5
ASGNI4
line 1526
;1526:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+808+4
ADDRGP4 $858
ASGNP4
line 1527
;1527:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+808+44
CNSTU4 258
ASGNU4
line 1528
;1528:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+808+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1529
;1529:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+808+8
CNSTI4 14
ASGNI4
line 1530
;1530:	g_arenaservers.showempty.generic.x			= 150;
ADDRGP4 g_arenaservers+808+12
CNSTI4 150
ASGNI4
line 1531
;1531:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+808+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1533
;1532:
;1533:	y += 4 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1534
;1534:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+872
CNSTI4 8
ASGNI4
line 1535
;1535:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+872+44
CNSTU4 128
ASGNU4
line 1536
;1536:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+872+8
CNSTI4 15
ASGNI4
line 1537
;1537:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+872+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1538
;1538:	g_arenaservers.list.generic.x				= 10; //72;
ADDRGP4 g_arenaservers+872+12
CNSTI4 10
ASGNI4
line 1539
;1539:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+872+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1540
;1540:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+872+80
CNSTI4 68
ASGNI4
line 1541
;1541:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+872+84
CNSTI4 11
ASGNI4
line 1542
;1542:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+872+76
ADDRGP4 g_arenaservers+13384
ASGNP4
line 1543
;1543:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $887
line 1544
;1544:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+13384
ADDP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 1545
;1545:	}
LABELV $888
line 1543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $887
line 1547
;1546:
;1547:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+968
CNSTI4 6
ASGNI4
line 1548
;1548:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+968+44
CNSTU4 16388
ASGNU4
line 1549
;1549:	g_arenaservers.mappic.generic.x				= 325; //72;
ADDRGP4 g_arenaservers+968+12
CNSTI4 325
ASGNI4
line 1550
;1550:	g_arenaservers.mappic.generic.y				= 50;
ADDRGP4 g_arenaservers+968+16
CNSTI4 50
ASGNI4
line 1551
;1551:	g_arenaservers.mappic.width					= 170;
ADDRGP4 g_arenaservers+968+76
CNSTI4 170
ASGNI4
line 1552
;1552:	g_arenaservers.mappic.height				= 128;
ADDRGP4 g_arenaservers+968+80
CNSTI4 128
ASGNI4
line 1553
;1553:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+968+64
ADDRGP4 $906
ASGNP4
line 1555
;1554:
;1555:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1056
CNSTI4 6
ASGNI4
line 1556
;1556:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+1056+4
ADDRGP4 $910
ASGNP4
line 1557
;1557:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1056+44
CNSTU4 16388
ASGNU4
line 1558
;1558:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1056+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1559
;1559:	g_arenaservers.arrows.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1056+12
CNSTI4 560
ASGNI4
line 1560
;1560:	g_arenaservers.arrows.generic.y				= 240-64+16;
ADDRGP4 g_arenaservers+1056+16
CNSTI4 192
ASGNI4
line 1561
;1561:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+1056+76
CNSTI4 64
ASGNI4
line 1562
;1562:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+1056+80
CNSTI4 128
ASGNI4
line 1564
;1563:
;1564:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1144
CNSTI4 6
ASGNI4
line 1565
;1565:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1144+44
CNSTU4 2308
ASGNU4
line 1566
;1566:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+1144+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1567
;1567:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1144+8
CNSTI4 16
ASGNI4
line 1568
;1568:	g_arenaservers.up.generic.x					= 512+48;
ADDRGP4 g_arenaservers+1144+12
CNSTI4 560
ASGNI4
line 1569
;1569:	g_arenaservers.up.generic.y					= 240-64+16;
ADDRGP4 g_arenaservers+1144+16
CNSTI4 192
ASGNI4
line 1570
;1570:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+1144+76
CNSTI4 64
ASGNI4
line 1571
;1571:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+1144+80
CNSTI4 64
ASGNI4
line 1572
;1572:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1144+60
ADDRGP4 $940
ASGNP4
line 1574
;1573:
;1574:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1232
CNSTI4 6
ASGNI4
line 1575
;1575:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1232+44
CNSTU4 2308
ASGNU4
line 1576
;1576:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1232+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1577
;1577:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1232+8
CNSTI4 17
ASGNI4
line 1578
;1578:	g_arenaservers.down.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1232+12
CNSTI4 560
ASGNI4
line 1579
;1579:	g_arenaservers.down.generic.y				= 240+16;
ADDRGP4 g_arenaservers+1232+16
CNSTI4 256
ASGNI4
line 1580
;1580:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+1232+76
CNSTI4 64
ASGNI4
line 1581
;1581:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+1232+80
CNSTI4 64
ASGNI4
line 1582
;1582:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1232+60
ADDRGP4 $958
ASGNP4
line 1584
;1583:
;1584:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1585
;1585:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1320
CNSTI4 7
ASGNI4
line 1586
;1586:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1320+12
CNSTI4 320
ASGNI4
line 1587
;1587:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1320+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1588
;1588:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1320+60
ADDRGP4 $758
ASGNP4
line 1589
;1589:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1320+64
CNSTI4 17
ASGNI4
line 1590
;1590:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1320+68
ADDRGP4 menu_text_color
ASGNP4
line 1592
;1591:
;1592:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1593
;1593:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1392
CNSTI4 7
ASGNI4
line 1594
;1594:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1392+12
CNSTI4 320
ASGNI4
line 1595
;1595:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1392+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1596
;1596:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $213
ASGNP4
line 1597
;1597:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1392+64
CNSTI4 17
ASGNI4
line 1598
;1598:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1392+68
ADDRGP4 text_color_normal
ASGNP4
line 1600
;1599:
;1600:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1464
CNSTI4 6
ASGNI4
line 1601
;1601:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1464+4
ADDRGP4 $984
ASGNP4
line 1602
;1602:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1464+44
CNSTU4 260
ASGNU4
line 1603
;1603:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1464+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1604
;1604:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1464+8
CNSTI4 23
ASGNI4
line 1605
;1605:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1464+12
CNSTI4 450
ASGNI4
line 1606
;1606:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1464+16
CNSTI4 86
ASGNI4
line 1607
;1607:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1464+76
CNSTI4 96
ASGNI4
line 1608
;1608:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1464+80
CNSTI4 48
ASGNI4
line 1609
;1609:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1464+60
ADDRGP4 $1001
ASGNP4
line 1611
;1610:
;1611:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1552
CNSTI4 6
ASGNI4
line 1612
;1612:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1552+4
ADDRGP4 $1005
ASGNP4
line 1613
;1613:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1552+44
CNSTU4 260
ASGNU4
line 1614
;1614:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1615
;1615:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1552+8
CNSTI4 18
ASGNI4
line 1616
;1616:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1552+12
CNSTI4 0
ASGNI4
line 1617
;1617:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1552+16
CNSTI4 416
ASGNI4
line 1618
;1618:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1552+76
CNSTI4 128
ASGNI4
line 1619
;1619:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1552+80
CNSTI4 64
ASGNI4
line 1620
;1620:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $1022
ASGNP4
line 1622
;1621:
;1622:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1728
CNSTI4 6
ASGNI4
line 1623
;1623:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1728+4
ADDRGP4 $1026
ASGNP4
line 1624
;1624:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1728+44
CNSTU4 260
ASGNU4
line 1625
;1625:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1728+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1626
;1626:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1728+8
CNSTI4 20
ASGNI4
line 1627
;1627:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1728+12
CNSTI4 128
ASGNI4
line 1628
;1628:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1728+16
CNSTI4 416
ASGNI4
line 1629
;1629:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1728+76
CNSTI4 128
ASGNI4
line 1630
;1630:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1728+80
CNSTI4 64
ASGNI4
line 1631
;1631:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1728+60
ADDRGP4 $1043
ASGNP4
line 1633
;1632:
;1633:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1640
CNSTI4 6
ASGNI4
line 1634
;1634:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1640+4
ADDRGP4 $1047
ASGNP4
line 1635
;1635:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1640+44
CNSTU4 260
ASGNU4
line 1636
;1636:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1640+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1637
;1637:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1640+8
CNSTI4 19
ASGNI4
line 1638
;1638:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1640+12
CNSTI4 256
ASGNI4
line 1639
;1639:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1640+16
CNSTI4 416
ASGNI4
line 1640
;1640:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1640+76
CNSTI4 128
ASGNI4
line 1641
;1641:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1640+80
CNSTI4 64
ASGNI4
line 1642
;1642:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1640+60
ADDRGP4 $1064
ASGNP4
line 1644
;1643:
;1644:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1816
CNSTI4 6
ASGNI4
line 1645
;1645:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1816+4
ADDRGP4 $1068
ASGNP4
line 1646
;1646:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1816+44
CNSTU4 260
ASGNU4
line 1647
;1647:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1816+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1648
;1648:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1816+8
CNSTI4 21
ASGNI4
line 1649
;1649:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1816+12
CNSTI4 384
ASGNI4
line 1650
;1650:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1816+16
CNSTI4 416
ASGNI4
line 1651
;1651:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1816+76
CNSTI4 128
ASGNI4
line 1652
;1652:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1816+80
CNSTI4 64
ASGNI4
line 1653
;1653:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1816+60
ADDRGP4 $1085
ASGNP4
line 1655
;1654:
;1655:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1904
CNSTI4 6
ASGNI4
line 1656
;1656:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+1904+4
ADDRGP4 $1089
ASGNP4
line 1657
;1657:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1904+44
CNSTU4 272
ASGNU4
line 1658
;1658:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1904+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1659
;1659:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+1904+8
CNSTI4 22
ASGNI4
line 1660
;1660:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+1904+12
CNSTI4 640
ASGNI4
line 1661
;1661:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+1904+16
CNSTI4 416
ASGNI4
line 1662
;1662:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+1904+76
CNSTI4 128
ASGNI4
line 1663
;1663:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+1904+80
CNSTI4 64
ASGNI4
line 1664
;1664:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+1904+60
ADDRGP4 $1106
ASGNP4
line 1666
;1665:
;1666:	g_arenaservers.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+14956
CNSTI4 3
ASGNI4
line 1667
;1667:	g_arenaservers.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 g_arenaservers+14956+4
ADDRGP4 $1110
ASGNP4
line 1668
;1668:	g_arenaservers.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+14956+44
CNSTU4 258
ASGNU4
line 1669
;1669:	g_arenaservers.punkbuster.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+14956+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1670
;1670:	g_arenaservers.punkbuster.generic.id			= ID_PUNKBUSTER;
ADDRGP4 g_arenaservers+14956+8
CNSTI4 24
ASGNI4
line 1671
;1671:	g_arenaservers.punkbuster.generic.x				= 480+32;
ADDRGP4 g_arenaservers+14956+12
CNSTI4 512
ASGNI4
line 1672
;1672:	g_arenaservers.punkbuster.generic.y				= 144;
ADDRGP4 g_arenaservers+14956+16
CNSTI4 144
ASGNI4
line 1673
;1673:	g_arenaservers.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 g_arenaservers+14956+76
ADDRGP4 punkbuster_items
ASGNP4
line 1675
;1674:	
;1675:	g_arenaservers.pblogo.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+15668
CNSTI4 6
ASGNI4
line 1676
;1676:	g_arenaservers.pblogo.generic.name			= ART_PUNKBUSTER;
ADDRGP4 g_arenaservers+15668+4
ADDRGP4 $1126
ASGNP4
line 1677
;1677:	g_arenaservers.pblogo.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+15668+44
CNSTU4 16388
ASGNU4
line 1678
;1678:	g_arenaservers.pblogo.generic.x				= 526;
ADDRGP4 g_arenaservers+15668+12
CNSTI4 526
ASGNI4
line 1679
;1679:	g_arenaservers.pblogo.generic.y				= 176;
ADDRGP4 g_arenaservers+15668+16
CNSTI4 176
ASGNI4
line 1680
;1680:	g_arenaservers.pblogo.width					= 32;
ADDRGP4 g_arenaservers+15668+76
CNSTI4 32
ASGNI4
line 1681
;1681:	g_arenaservers.pblogo.height				= 16;
ADDRGP4 g_arenaservers+15668+80
CNSTI4 16
ASGNI4
line 1682
;1682:	g_arenaservers.pblogo.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+15668+64
ADDRGP4 $906
ASGNP4
line 1685
;1683:
;1684:	// Shafe
;1685:	g_arenaservers.lblname.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+15052
CNSTI4 6
ASGNI4
line 1686
;1686:	g_arenaservers.lblname.generic.name			= ART_LBLNAME;
ADDRGP4 g_arenaservers+15052+4
ADDRGP4 $1142
ASGNP4
line 1687
;1687:	g_arenaservers.lblname.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+15052+44
CNSTU4 16388
ASGNU4
line 1688
;1688:	g_arenaservers.lblname.generic.x			= 10;
ADDRGP4 g_arenaservers+15052+12
CNSTI4 10
ASGNI4
line 1689
;1689:	g_arenaservers.lblname.generic.y			= 176;
ADDRGP4 g_arenaservers+15052+16
CNSTI4 176
ASGNI4
line 1690
;1690:	g_arenaservers.lblname.width				= 800;
ADDRGP4 g_arenaservers+15052+76
CNSTI4 800
ASGNI4
line 1691
;1691:	g_arenaservers.lblname.height				= 16;
ADDRGP4 g_arenaservers+15052+80
CNSTI4 16
ASGNI4
line 1692
;1692:	g_arenaservers.lblname.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+15052+64
ADDRGP4 $906
ASGNP4
line 1697
;1693:
;1694:
;1695:	//g_arenaservers.master.curvalue = 2;
;1696:	
;1697:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1699
;1698:
;1699:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1700
;1700:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mserver ); // Shafe - Multimaster
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1701
;1701:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1702
;1702:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1703
;1703:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1704
;1704:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1706
;1705:
;1706:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1707
;1707:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1708
;1708:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1709
;1709:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1710
;1710:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1056
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1711
;1711:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1144
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1712
;1712:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1714
;1713:
;1714:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1715
;1715:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1716
;1716:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1717
;1717:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1718
;1718:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1816
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1719
;1719:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1726
;1720:
;1721://	Shafe - Trep - No Punkbuster Garbage
;1722://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.punkbuster );
;1723://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.pblogo );
;1724:	
;1725:	// Shafe - Trep Menu Headers
;1726:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.lblname);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+15052
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1728
;1727:
;1728:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1730
;1729:
;1730:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
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
line 1732
;1731:	// hack to get rid of MPlayer stuff
;1732:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1733
;1733:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1177
line 1734
;1734:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1177
line 1736
;1735:	
;1736:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+360+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1738
;1737:
;1738:	g_gametype = Com_Clamp( 0, 4, ui_browserGameType.integer );
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
line 1739
;1739:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+552+64
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1742
;1740:
;1741:	// Shafe - Multi Master 
;1742:	g_masteruse = Com_Clamp( 0, 4, ui_browserMasterNum.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserMasterNum+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_masteruse
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1743
;1743:	g_arenaservers.mserver.curvalue = g_masteruse;
ADDRGP4 g_arenaservers+456+64
ADDRGP4 g_masteruse
INDIRI4
ASGNI4
line 1747
;1744:
;1745:
;1746:
;1747:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1748
;1748:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+648+64
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1750
;1749:
;1750:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1751
;1751:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+744+60
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1753
;1752:
;1753:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 1754
;1754:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+808+60
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1756
;1755:	
;1756:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $675
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_arenaservers+14956+64
ADDRLP4 44
INDIRF4
CVFI4 4
ASGNI4
line 1759
;1757:
;1758:	// force to initial state and refresh
;1759:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1760
;1760:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1761
;1761:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1763
;1762:
;1763:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $606
ARGP4
ADDRGP4 $213
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1764
;1764:}
LABELV $757
endproc ArenaServers_MenuInit 48 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1772
;1765:
;1766:
;1767:/*
;1768:=================
;1769:ArenaServers_Cache
;1770:=================
;1771:*/
;1772:void ArenaServers_Cache( void ) {
line 1773
;1773:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $1005
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1774
;1774:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $1022
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1775
;1775:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1068
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1776
;1776:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1085
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1777
;1777:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $1026
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1778
;1778:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $1043
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1779
;1779:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $1047
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1780
;1780:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1064
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1781
;1781:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1089
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1782
;1782:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1106
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1783
;1783:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $910
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1784
;1784:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $940
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1785
;1785:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $958
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1786
;1786:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $906
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1787
;1787:	trap_R_RegisterShaderNoMip( ART_PUNKBUSTER );
ADDRGP4 $1126
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1788
;1788:}
LABELV $1198
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1796
;1789:
;1790:
;1791:/*
;1792:=================
;1793:UI_ArenaServersMenu
;1794:=================
;1795:*/
;1796:void UI_ArenaServersMenu( void ) {
line 1797
;1797:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1798
;1798:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1799
;1799:}						  
LABELV $1199
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_instagib
skip 4
align 4
LABELV g_gamemode
skip 4
align 4
LABELV g_masteruse
skip 4
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
skip 34816
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 4352
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 34816
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 34816
align 4
LABELV g_arenaservers
skip 15756
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
LABELV $1142
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 98
byte 1 108
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1126
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
LABELV $1110
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
LABELV $1106
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
LABELV $1089
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
LABELV $1085
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
LABELV $1068
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
LABELV $1064
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
LABELV $1047
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
LABELV $1043
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
LABELV $1026
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
LABELV $1022
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
LABELV $1005
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
LABELV $1001
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
LABELV $984
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
LABELV $958
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
LABELV $940
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
LABELV $910
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
LABELV $906
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
LABELV $858
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
LABELV $844
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
LABELV $828
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
LABELV $812
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
LABELV $796
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
byte 1 58
byte 1 0
align 1
LABELV $780
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
LABELV $772
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
LABELV $739
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
LABELV $738
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
LABELV $715
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
LABELV $709
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
LABELV $703
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
LABELV $697
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
LABELV $693
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
byte 1 78
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $691
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
LABELV $675
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
LABELV $669
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
LABELV $613
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
LABELV $612
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
LABELV $611
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
LABELV $608
byte 1 83
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $606
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
LABELV $605
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $602
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $598
byte 1 32
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $596
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
LABELV $594
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $592
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $580
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
LABELV $558
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
LABELV $448
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
LABELV $427
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
LABELV $419
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
LABELV $418
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $417
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $416
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 105
byte 1 98
byte 1 0
align 1
LABELV $414
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $413
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $412
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
LABELV $411
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $410
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $409
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
LABELV $342
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $341
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $340
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $339
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
LABELV $334
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $333
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $330
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $325
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $250
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
LABELV $247
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
LABELV $219
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
LABELV $213
byte 1 0
align 1
LABELV $183
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
LABELV $178
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
LABELV $162
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
LABELV $149
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
LABELV $114
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
LABELV $109
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
LABELV $108
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
LABELV $107
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
LABELV $106
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
LABELV $105
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $104
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
LABELV $103
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $102
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $101
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $100
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $99
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
LABELV $98
byte 1 81
byte 1 51
byte 1 70
byte 1 0
align 1
LABELV $97
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
LABELV $96
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $95
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $94
byte 1 83
byte 1 80
byte 1 32
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 118
byte 1 49
byte 1 0
align 1
LABELV $92
byte 1 68
byte 1 77
byte 1 32
byte 1 0
align 1
LABELV $91
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
LABELV $90
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
LABELV $89
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
LABELV $88
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
LABELV $87
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
LABELV $86
byte 1 79
byte 1 110
byte 1 101
byte 1 52
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $85
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
LABELV $84
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
byte 1 0
align 1
LABELV $83
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $82
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $81
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
LABELV $80
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
LABELV $79
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
LABELV $78
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
LABELV $77
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $76
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
LABELV $75
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
LABELV $74
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $73
byte 1 65
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 52
byte 1 32
byte 1 40
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $72
byte 1 65
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $71
byte 1 65
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $70
byte 1 65
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $69
byte 1 80
byte 1 114
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 121
byte 1 0
