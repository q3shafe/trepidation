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
byte 4 0
align 4
LABELV sortkey_items
address $85
address $86
address $87
address $88
address $89
byte 4 0
align 4
LABELV gamenames
address $90
address $91
address $92
address $93
address $94
address $82
address $83
address $84
address $95
address $96
address $97
address $98
address $99
byte 4 0
align 4
LABELV netnames
address $99
address $100
address $101
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
byte 1 117
byte 1 55
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
address $102
address $103
byte 4 0
export punkbuster_msg
align 4
LABELV punkbuster_msg
address $104
address $105
address $106
address $107
byte 4 0
code
proc ArenaServers_MaxPing 8 4
file "../ui_servers2.c"
line 296
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
;103:
;104://Shafe - Trep - Mulimasters
;105:static const char *master_servers[] = {
;106:	"Primary",
;107:	"Alternate 1",
;108:	"Alternate 2",
;109:	"Alternate 3",
;110:	"Alternate 4 (Not Used)",
;111:	0
;112:};
;113:// End Shafe
;114:
;115:static const char *master_items[] = {
;116:	"Local",
;117:	"Internet",
;118:	"Favorites",
;119:	0
;120:};
;121:
;122:static const char *servertype_items[] = {
;123:	"All",
;124:	"Free For All",
;125:	"Team Deathmatch",
;126:	"Tournament",
;127:	"Capture the Flag",
;128:	"Arsenal",			// Shafe - Trep - New Gametype
;129:	"Survival",	// Shafe - Trep - New Gametype
;130:	"Trepidation",	// Shafe - Trep - New Gametype
;131:	0
;132:};
;133:
;134:static const char *sortkey_items[] = {
;135:	"Server Name",
;136:	"Map Name",
;137:	"Open Player Spots",
;138:	"Game Type",
;139:	"Ping Time",
;140:	0
;141:};
;142:
;143:static char* gamenames[] = {
;144:	"DM ",	// deathmatch
;145:	"1v1",	// tournament
;146:	"SP ",	// single player
;147:	"Team DM",	// team deathmatch
;148:	"CTF",	// capture the flag
;149:	"Arsenal",		// one flag ctf
;150:	"Survival",				// Overload
;151:	"Trepidation",			// Harvester
;152:	"Rocket Arena 3",	// Rocket Arena 3
;153:	"Q3F",						// Q3F
;154:	"Urban Terror",		// Urban Terror
;155:	"OSP",						// Orange Smoothie Productions
;156:	"???",			// unknown
;157:	0
;158:};
;159:
;160:static char* netnames[] = {
;161:	"???",
;162:	"UDP",
;163:	"IPX",
;164:	NULL
;165:};
;166:
;167:static char quake3worldMessage[] = "Visit trepidation.u7net.om - News, Community, Events, Files";
;168:
;169:
;170:const char* punkbuster_items[] = {
;171:	"Disabled",
;172:	"Enabled",
;173:	NULL
;174:};
;175:
;176:const char* punkbuster_msg[] = {
;177:	"PunkBuster will be",
;178:	"disabled the next time",
;179:	"Quake III Arena",
;180:	"is started.",
;181:	NULL
;182:};
;183:
;184:typedef struct {
;185:	char	adrstr[MAX_ADDRESSLENGTH];
;186:	int		start;
;187:} pinglist_t;
;188:
;189:typedef struct servernode_s {
;190:	char	adrstr[MAX_ADDRESSLENGTH];
;191:	char	hostname[MAX_HOSTNAMELENGTH+3];
;192:	char	mapname[MAX_MAPNAMELENGTH];
;193:	int		numclients;
;194:	int		maxclients;
;195:	int		pingtime;
;196:	int		gametype;
;197:	char	gamename[12];
;198:	int		nettype;
;199:	int		minPing;
;200:	int		maxPing;
;201:	/*
;202:	// Shafe - Not quite sure how I want to display the gametypes yet.. 
;203:	// I'm thinking that Instagib should replace the yes/no in pb field of browser
;204:	*/
;205:	int		g_instagib; 
;206:	int		g_gamemode;
;207:	qboolean bPB;
;208:
;209:} servernode_t; 
;210:
;211:typedef struct {
;212:	char			buff[MAX_LISTBOXWIDTH];
;213:	servernode_t*	servernode;
;214:} table_t;
;215:
;216:typedef struct {
;217:	menuframework_s		menu;
;218:
;219:	menutext_s			banner;
;220:
;221:	menulist_s			master;
;222:	menulist_s			mserver;
;223:	menulist_s			gametype;
;224:	menulist_s			sortkey;
;225:	menuradiobutton_s	showfull;
;226:	menuradiobutton_s	showempty;
;227:
;228:	menulist_s			list;
;229:	menubitmap_s		mappic;
;230:	menubitmap_s		arrows;
;231:	menubitmap_s		up;
;232:	menubitmap_s		down;
;233:	menutext_s			status;
;234:	menutext_s			statusbar;
;235:
;236:	menubitmap_s		remove;
;237:	menubitmap_s		back;
;238:	menubitmap_s		refresh;
;239:	menubitmap_s		specify;
;240:	menubitmap_s		create;
;241:	menubitmap_s		go;
;242:
;243:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;244:	table_t				table[MAX_LISTBOXITEMS];
;245:	char*				items[MAX_LISTBOXITEMS];
;246:	int					numqueriedservers;
;247:	int					*numservers;
;248:	servernode_t		*serverlist;	
;249:	int					currentping;
;250:	qboolean			refreshservers;
;251:	int					nextpingtime;
;252:	int					maxservers;
;253:	int					refreshtime;
;254:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;255:	int					numfavoriteaddresses;
;256:
;257:	menulist_s		punkbuster;
;258:	menubitmap_s	lblname;
;259:	menubitmap_s	lblmap;
;260:	menubitmap_s	lblplayers;
;261:	menubitmap_s	lblgtype;
;262:	menubitmap_s	lblnet;
;263:	menubitmap_s	lblping;
;264:	menubitmap_s	lblinstagib;
;265:	menubitmap_s	pblogo;
;266:
;267:} arenaservers_t;
;268:
;269:static arenaservers_t	g_arenaservers;
;270:
;271:
;272:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;273:static int				g_numglobalservers;
;274:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;275:static int				g_numlocalservers;
;276:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;277:static int				g_numfavoriteservers;
;278:static servernode_t		g_mplayerserverlist[MAX_GLOBALSERVERS];
;279:static int				g_nummplayerservers;
;280:static int				g_servertype;
;281:static int				g_gametype;
;282:static int				g_sortkey;
;283:static int				g_emptyservers;
;284:static int				g_fullservers;
;285:static int				g_masteruse; // Shafe - Trep - Multimaster
;286:static int				g_gamemode;
;287:static int				g_instagib;
;288:
;289:
;290:
;291:/*
;292:=================
;293:ArenaServers_MaxPing
;294:=================
;295:*/
;296:static int ArenaServers_MaxPing( void ) {
line 299
;297:	int		maxPing;
;298:
;299:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $112
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
line 300
;300:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $113
line 301
;301:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 302
;302:	}
LABELV $113
line 303
;303:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $111
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 312
;304:}
;305:
;306:
;307:/*
;308:=================
;309:ArenaServers_Compare
;310:=================
;311:*/
;312:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 318
;313:	float			f1;
;314:	float			f2;
;315:	servernode_t*	t1;
;316:	servernode_t*	t2;
;317:
;318:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 319
;319:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 321
;320:
;321:	switch( g_sortkey ) {
ADDRLP4 16
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $116
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $116
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $139
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $139
address $118
address $119
address $120
address $129
address $134
code
LABELV $118
line 323
;322:	case SORT_HOST:
;323:		return Q_stricmp( t1->hostname, t2->hostname );
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
ADDRGP4 $115
JUMPV
LABELV $119
line 326
;324:
;325:	case SORT_MAP:
;326:		return Q_stricmp( t1->mapname, t2->mapname );
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
ADDRGP4 $115
JUMPV
LABELV $120
line 329
;327:
;328:	case SORT_CLIENTS:
;329:		f1 = t1->maxclients - t1->numclients;
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
line 330
;330:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $121
line 331
;331:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 332
;332:		}
LABELV $121
line 334
;333:
;334:		f2 = t2->maxclients - t2->numclients;
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
line 335
;335:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $123
line 336
;336:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 337
;337:		}
LABELV $123
line 339
;338:
;339:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $125
line 340
;340:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $115
JUMPV
LABELV $125
line 342
;341:		}
;342:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $127
line 343
;343:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $127
line 345
;344:		}
;345:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $129
line 348
;346:
;347:	case SORT_GAME:
;348:		if( t1->gametype < t2->gametype ) {
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
GEI4 $130
line 349
;349:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $130
line 351
;350:		}
;351:		if( t1->gametype == t2->gametype ) {
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
NEI4 $132
line 352
;352:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $115
JUMPV
LABELV $132
line 354
;353:		}
;354:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $115
JUMPV
LABELV $134
line 357
;355:
;356:	case SORT_PING:
;357:		if( t1->pingtime < t2->pingtime ) {
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
GEI4 $135
line 358
;358:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $135
line 360
;359:		}
;360:		if( t1->pingtime > t2->pingtime ) {
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
LEI4 $137
line 361
;361:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $115
JUMPV
LABELV $137
line 363
;362:		}
;363:		return Q_stricmp( t1->hostname, t2->hostname );
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
ADDRGP4 $115
JUMPV
LABELV $116
line 366
;364:	}
;365:
;366:	return 0;
CNSTI4 0
RETI4
LABELV $115
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 8 8
line 375
;367:}
;368:
;369:
;370:/*
;371:=================
;372:ArenaServers_Go
;373:=================
;374:*/
;375:static void ArenaServers_Go( void ) {
line 378
;376:	servernode_t*	servernode;
;377:
;378:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168+68
ADDP4
INDIRP4
ASGNP4
line 379
;379:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $145
line 380
;380:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $147
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
line 381
;381:	}
LABELV $145
line 382
;382:}
LABELV $140
endproc ArenaServers_Go 8 8
bss
align 1
LABELV $149
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 390
;383:
;384:
;385:/*
;386:=================
;387:ArenaServers_UpdatePicture
;388:=================
;389:*/
;390:static void ArenaServers_UpdatePicture( void ) {
line 394
;391:	static char		picname[64];
;392:	servernode_t*	servernodeptr;
;393:
;394:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+872+68
INDIRI4
CNSTI4 0
NEI4 $150
line 395
;395:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+968+4
CNSTP4 0
ASGNP4
line 396
;396:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 397
;397:	else {
line 398
;398:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168+68
ADDP4
INDIRP4
ASGNP4
line 399
;399:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $149
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $160
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 400
;400:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+968+4
ADDRGP4 $149
ASGNP4
line 402
;401:	
;402:	}
LABELV $151
line 405
;403:
;404:	// force shader update during draw
;405:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+968+68
CNSTI4 0
ASGNI4
line 406
;406:}
LABELV $148
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateMenu 72 48
line 414
;407:
;408:
;409:/*
;410:=================
;411:ArenaServers_UpdateMenu
;412:=================
;413:*/
;414:static void ArenaServers_UpdateMenu( void ) {
line 423
;415:	int				i;
;416:	int				j;
;417:	int				count;
;418:	char*			buff;
;419:	servernode_t*	servernodeptr;
;420:	table_t*		tableptr;
;421:	char			*pingColor;
;422:
;423:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
LEI4 $166
line 425
;424:		// servers found
;425:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $169
ADDRGP4 g_arenaservers+13908
INDIRI4
ADDRGP4 g_arenaservers+13896
INDIRI4
GTI4 $169
line 427
;426:			// show progress
;427:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Trepidation Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $176
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
line 428
;428:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $181
ASGNP4
line 429
;429:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
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
line 430
;430:		}
ADDRGP4 $167
JUMPV
LABELV $169
line 431
;431:		else {
line 433
;432:			// all servers pinged - enable controls
;433:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
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
line 434
;434:			g_arenaservers.mserver.generic.flags		&= ~QMF_GRAYED;
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
line 435
;435:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
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
line 436
;436:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
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
line 437
;437:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
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
line 438
;438:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
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
line 439
;439:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
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
line 440
;440:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
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
line 441
;441:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
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
line 442
;442:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
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
line 445
;443:
;444:			// update status bar
;445:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $206
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $204
LABELV $206
line 446
;446:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 quake3worldMessage
ASGNP4
line 447
;447:			}
ADDRGP4 $167
JUMPV
LABELV $204
line 448
;448:			else {
line 449
;449:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $211
ASGNP4
line 450
;450:			}
line 452
;451:
;452:		}
line 453
;453:	}
ADDRGP4 $167
JUMPV
LABELV $166
line 454
;454:	else {
line 456
;455:		// no servers found
;456:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $212
line 457
;457:			strcpy( g_arenaservers.status.string,"Scanning The Trepidation Universe." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 458
;458:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $181
ASGNP4
line 461
;459:
;460:			// disable controls during refresh
;461:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
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
line 462
;462:			g_arenaservers.mserver.generic.flags		|= QMF_GRAYED;
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
line 463
;463:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
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
line 464
;464:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
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
line 465
;465:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
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
line 466
;466:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
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
line 467
;467:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
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
line 468
;468:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
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
line 469
;469:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
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
line 470
;470:			g_arenaservers.punkbuster.generic.flags |= QMF_GRAYED;
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
line 471
;471:		}
ADDRGP4 $213
JUMPV
LABELV $212
line 472
;472:		else {
line 473
;473:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
GEI4 $240
line 474
;474:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $245
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 475
;475:			}
ADDRGP4 $241
JUMPV
LABELV $240
line 476
;476:			else {
line 477
;477:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 478
;478:			}
LABELV $241
line 481
;479:
;480:			// update status bar
;481:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 28
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $251
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $249
LABELV $251
line 482
;482:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 quake3worldMessage
ASGNP4
line 483
;483:			}
ADDRGP4 $250
JUMPV
LABELV $249
line 484
;484:			else {
line 485
;485:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $211
ASGNP4
line 486
;486:			}
LABELV $250
line 489
;487:
;488:			// end of refresh - set control state
;489:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
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
line 490
;490:			g_arenaservers.mserver.generic.flags		&= ~QMF_GRAYED;
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
line 491
;491:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
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
line 492
;492:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
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
line 493
;493:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
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
line 494
;494:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
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
line 495
;495:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
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
line 496
;496:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
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
line 497
;497:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
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
line 498
;498:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
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
line 499
;499:		}
LABELV $213
line 502
;500:
;501:		// zero out list box
;502:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+872+68
CNSTI4 0
ASGNI4
line 503
;503:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+872+64
CNSTI4 0
ASGNI4
line 504
;504:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+872+72
CNSTI4 0
ASGNI4
line 507
;505:
;506:		// update picture
;507:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 508
;508:		return;
ADDRGP4 $165
JUMPV
LABELV $167
line 516
;509:	}
;510:	
;511:	
;512:	
;513:	
;514:
;515:	// build list box strings - apply culling filters
;516:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+13904
INDIRP4
ASGNP4
line 517
;517:	count         = *g_arenaservers.numservers;
ADDRLP4 24
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 518
;518:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
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
ADDRGP4 $287
JUMPV
LABELV $284
line 519
;519:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
CNSTI4 72
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 520
;520:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 521
;521:		buff = tableptr->buff;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
line 524
;522:
;523:		// can only cull valid results
;524:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $289
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $289
line 525
;525:			continue;
ADDRGP4 $285
JUMPV
LABELV $289
line 528
;526:		}
;527:
;528:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $291
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
NEI4 $291
line 529
;529:			continue;
ADDRGP4 $285
JUMPV
LABELV $291
line 532
;530:		}
;531:		
;532:		switch( g_gametype ) {
ADDRLP4 40
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $293
ADDRLP4 40
INDIRI4
CNSTI4 7
GTI4 $293
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $317
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $317
address $294
address $296
address $299
address $302
address $305
address $308
address $311
address $314
code
line 534
;533:		case GAMES_ALL:
;534:			break;
LABELV $296
line 537
;535:
;536:		case GAMES_FFA:	
;537:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $294
line 538
;538:				continue;
ADDRGP4 $285
JUMPV
line 540
;539:			}
;540:			break;
LABELV $299
line 543
;541:
;542:		case GAMES_TEAMPLAY:
;543:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 3
EQI4 $294
line 544
;544:				continue;
ADDRGP4 $285
JUMPV
line 546
;545:			}
;546:			break;
LABELV $302
line 549
;547:
;548:		case GAMES_TOURNEY:
;549:			if( servernodeptr->gametype != GT_TOURNAMENT ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
EQI4 $294
line 550
;550:				continue;
ADDRGP4 $285
JUMPV
line 552
;551:			}
;552:			break;
LABELV $305
line 555
;553:
;554:		case GAMES_CTF:
;555:			if( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
EQI4 $294
line 556
;556:				continue;
ADDRGP4 $285
JUMPV
line 558
;557:			}
;558:			break;
LABELV $308
line 561
;559:		case GAMES_ARSENAL:  // Shafe - Trep - Game type Freeze - Server Filter - This isnt a filter yet
;560:			 //strcmp(servernodeptr->gamename,"eternal") != 0
;561:			if(( servernodeptr->gametype != GT_FFA ) && (servernodeptr->g_gamemode == 1))  {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $294
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 1
NEI4 $294
line 562
;562:				continue;
ADDRGP4 $285
JUMPV
line 565
;563:				
;564:			}
;565:			break;
LABELV $311
line 567
;566:		case GAMES_LASTMAN: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet
;567:			if(( servernodeptr->gametype != GT_FFA ) && (servernodeptr->g_gamemode == 2))  {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $294
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 2
NEI4 $294
line 568
;568:				continue;
ADDRGP4 $285
JUMPV
line 570
;569:			}
;570:			break;
LABELV $314
line 572
;571:		case GAMES_TREPIDATION: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet			
;572:			if(( servernodeptr->gametype != GT_TEAM ) && (servernodeptr->g_gamemode == 3))  {
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
EQI4 $294
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $294
line 573
;573:				continue;
ADDRGP4 $285
JUMPV
line 575
;574:			}
;575:			break;
LABELV $293
LABELV $294
line 578
;576:		}
;577:
;578:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
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
GEI4 $318
line 579
;579:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $320
ASGNP4
line 580
;580:		}
ADDRGP4 $319
JUMPV
LABELV $318
line 581
;581:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
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
EQI4 $321
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $321
line 582
;582:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $320
ASGNP4
line 583
;583:		}
ADDRGP4 $322
JUMPV
LABELV $321
line 584
;584:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 200
GEI4 $323
line 585
;585:			pingColor = S_COLOR_GREEN;
ADDRLP4 20
ADDRGP4 $325
ASGNP4
line 586
;586:		}
ADDRGP4 $324
JUMPV
LABELV $323
line 587
;587:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 400
GEI4 $326
line 588
;588:			pingColor = S_COLOR_YELLOW;
ADDRLP4 20
ADDRGP4 $328
ASGNP4
line 589
;589:		}
ADDRGP4 $327
JUMPV
LABELV $326
line 590
;590:		else {
line 591
;591:			pingColor = S_COLOR_RED;
ADDRLP4 20
ADDRGP4 $329
ASGNP4
line 592
;592:		}
LABELV $327
LABELV $324
LABELV $322
LABELV $319
line 594
;593:
;594:		if (servernodeptr->g_instagib == 1) 
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $330
line 595
;595:		{	
line 596
;596:			servernodeptr->bPB = qtrue; 
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 597
;597:		} else {
ADDRGP4 $331
JUMPV
LABELV $330
line 598
;598:			servernodeptr->bPB = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 0
ASGNI4
line 599
;599:		}
LABELV $331
line 602
;600:
;601:
;602:		if ( servernodeptr->g_gamemode == 1) 
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 1
NEI4 $332
line 603
;603:		{
line 604
;604:			Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $334
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
ADDRGP4 $335
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
EQI4 $339
ADDRLP4 56
ADDRGP4 $336
ASGNP4
ADDRGP4 $340
JUMPV
LABELV $339
ADDRLP4 56
ADDRGP4 $337
ASGNP4
LABELV $340
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 608
;605:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;606: 			servernodeptr->maxclients, "arsenal",
;607:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime, servernodeptr->bPB ? "Yes" : "No" );
;608:		} else
ADDRGP4 $333
JUMPV
LABELV $332
line 609
;609:		{
line 610
;610:			Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $334
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
EQI4 $342
ADDRLP4 56
ADDRGP4 $336
ASGNP4
ADDRGP4 $343
JUMPV
LABELV $342
ADDRLP4 56
ADDRGP4 $337
ASGNP4
LABELV $343
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 614
;611:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;612: 			servernodeptr->maxclients, servernodeptr->gamename,
;613:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime, servernodeptr->bPB ? "Yes" : "No" );
;614:		}
LABELV $333
line 616
;615:		
;616:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 617
;617:	}
LABELV $285
line 518
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
LABELV $287
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $284
line 619
;618:
;619:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+872+68
ADDRLP4 8
INDIRI4
ASGNI4
line 620
;620:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+872+64
CNSTI4 0
ASGNI4
line 621
;621:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+872+72
CNSTI4 0
ASGNI4
line 624
;622:
;623:	// update picture
;624:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 625
;625:}
LABELV $165
endproc ArenaServers_UpdateMenu 72 48
proc ArenaServers_Remove 24 12
line 634
;626:
;627:
;628:/*
;629:=================
;630:ArenaServers_Remove
;631:=================
;632:*/
;633:static void ArenaServers_Remove( void )
;634:{
line 639
;635:	int				i;
;636:	servernode_t*	servernodeptr;
;637:	table_t*		tableptr;
;638:
;639:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+872+68
INDIRI4
CNSTI4 0
NEI4 $351
line 640
;640:		return;
ADDRGP4 $350
JUMPV
LABELV $351
line 646
;641:
;642:	// remove selected item from display list
;643:	// items are in scattered order due to sort and cull
;644:	// perform delete on list box contents, resync all lists
;645:
;646:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 647
;647:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
line 650
;648:
;649:	// find address in master list
;650:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $361
JUMPV
LABELV $358
line 651
;651:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
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
NEI4 $363
line 652
;652:				break;
ADDRGP4 $360
JUMPV
LABELV $363
LABELV $359
line 650
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $361
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $358
LABELV $360
line 655
;653:
;654:	// delete address from master list
;655:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
CNSTI4 1
SUBI4
GTI4 $366
line 656
;656:	{
line 657
;657:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
CNSTI4 1
SUBI4
GEI4 $369
line 658
;658:		{
line 660
;659:			// shift items up
;660:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*sizeof(MAX_ADDRESSLENGTH));
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
line 661
;661:		}
LABELV $369
line 662
;662:		g_arenaservers.numfavoriteaddresses--;
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
line 663
;663:	}	
LABELV $366
line 666
;664:
;665:	// find address in server list
;666:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $380
JUMPV
LABELV $377
line 667
;667:		if (&g_favoriteserverlist[i] == servernodeptr)
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
NEU4 $381
line 668
;668:				break;
ADDRGP4 $379
JUMPV
LABELV $381
LABELV $378
line 666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $380
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $377
LABELV $379
line 671
;669:
;670:	// delete address from server list
;671:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $383
line 672
;672:	{
line 673
;673:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $385
line 674
;674:		{
line 676
;675:			// shift items up
;676:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
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
line 677
;677:		}
LABELV $385
line 678
;678:		g_numfavoriteservers--;
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
line 679
;679:	}	
LABELV $383
line 681
;680:
;681:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 682
;682:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 683
;683:}
LABELV $350
endproc ArenaServers_Remove 24 12
proc ArenaServers_Insert 104 12
line 692
;684:
;685:
;686:/*
;687:=================
;688:ArenaServers_Insert
;689:=================
;690:*/
;691:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;692:{
line 699
;693:	servernode_t*	servernodeptr;
;694:	char*			s;
;695:	int				i;
;696:	int				x;
;697:
;698:
;699:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 16
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $393
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $393
line 700
;700:	{
line 702
;701:		// slow global or local servers do not get entered
;702:		return;
ADDRGP4 $392
JUMPV
LABELV $393
line 705
;703:	}
;704:
;705:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+13920
INDIRI4
LTI4 $395
line 707
;706:		// list full;
;707:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
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
line 708
;708:	} else {
ADDRGP4 $396
JUMPV
LABELV $395
line 710
;709:		// next slot
;710:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
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
line 711
;711:		(*g_arenaservers.numservers)++;
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
line 712
;712:	}
LABELV $396
line 714
;713:
;714:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
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
line 716
;715:
;716:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $404
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
line 717
;717:	Q_CleanStr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 718
;718:	Q_strupr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 720
;719:
;720:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $405
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
line 721
;721:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 722
;722:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 724
;723:
;724:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $406
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
line 725
;725:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $407
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
line 726
;726:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 727
;727:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $408
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
line 728
;728:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $409
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
line 729
;729:	servernodeptr->bPB = atoi( Info_ValueForKey( info, "g_instagib") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $410
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
line 730
;730:	servernodeptr->g_gamemode = atoi( Info_ValueForKey( info, "g_gamemode") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $411
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
line 731
;731:	servernodeptr->g_instagib = atoi( Info_ValueForKey( info, "g_instagib") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $410
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
line 749
;732:
;733:	/*
;734:	s = Info_ValueForKey( info, "nettype" );
;735:	for (i=0; ;i++)
;736:	{
;737:		if (!netnames[i])
;738:		{
;739:			servernodeptr->nettype = 0;
;740:			break;
;741:		}
;742:		else if (!Q_stricmp( netnames[i], s ))
;743:		{
;744:			servernodeptr->nettype = i;
;745:			break;
;746:		}
;747:	}
;748:	*/
;749:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $412
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
line 751
;750:
;751:	s = Info_ValueForKey( info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $413
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 92
INDIRP4
ASGNP4
line 752
;752:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $414
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
line 753
;753:	if( i < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $415
line 754
;754:		i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 755
;755:	}
ADDRGP4 $416
JUMPV
LABELV $415
line 756
;756:	else if( i > 11 ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
LEI4 $417
line 757
;757:		i = 12;
ADDRLP4 4
CNSTI4 12
ASGNI4
line 758
;758:	}
LABELV $417
LABELV $416
line 759
;759:	if( *s ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $419
line 760
;760:		servernodeptr->gametype = i;//-1;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 761
;761:		Q_strncpyz( servernodeptr->gamename, s, sizeof(servernodeptr->gamename) );
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
line 762
;762:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 763
;763:	else {
line 767
;764:		
;765:		//x = atoi( Info_ValueForKey( info, "g_GameMode") );  // Shafe
;766:		//x = servernodeptr->g_GameMode;
;767:		servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 775
;768:	
;769:		// Shafe New Gametypes
;770:		//if (x == 1)	{ i = 5; } 
;771:		//if (x == 2)	{ i = 6; }
;772:		//if (x == 3)	{ i = 7; }
;773:		// ////////////////
;774:
;775:		Q_strncpyz( servernodeptr->gamename, gamenames[i], sizeof(servernodeptr->gamename) );
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
line 777
;776:		
;777:	}
LABELV $420
line 778
;778:}
LABELV $392
endproc ArenaServers_Insert 104 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 789
;779:
;780:
;781:/*
;782:=================
;783:ArenaServers_InsertFavorites
;784:
;785:Insert nonresponsive address book entries into display lists.
;786:=================
;787:*/
;788:void ArenaServers_InsertFavorites( void )
;789:{
line 795
;790:	int		i;
;791:	int		j;
;792:	char	info[MAX_INFO_STRING];
;793:
;794:	// resync existing results with new or deleted cvars
;795:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 796
;796:	Info_SetValueForKey( info, "hostname", "No Response" );
ADDRLP4 8
ARGP4
ADDRGP4 $404
ARGP4
ADDRGP4 $422
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 797
;797:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 798
;798:	{
line 800
;799:		// find favorite address in refresh list
;800:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $428
line 801
;801:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
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
NEI4 $432
line 802
;802:				break;
ADDRGP4 $430
JUMPV
LABELV $432
LABELV $429
line 800
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $431
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $428
LABELV $430
line 804
;803:
;804:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $435
line 805
;805:		{
line 807
;806:			// not in list, add it
;807:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
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
line 808
;808:		}
LABELV $435
line 809
;809:	}
LABELV $424
line 797
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $423
line 810
;810:}
LABELV $421
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 5472 12
line 821
;811:
;812:
;813:/*
;814:=================
;815:ArenaServers_LoadFavorites
;816:
;817:Load cvar address book entries into local lists.
;818:=================
;819:*/
;820:void ArenaServers_LoadFavorites( void )
;821:{
line 830
;822:	int				i;
;823:	int				j;
;824:	int				numtempitems;
;825:	char			emptyinfo[MAX_INFO_STRING];
;826:	char			adrstr[MAX_ADDRESSLENGTH];
;827:	servernode_t	templist[MAX_FAVORITESERVERS];
;828:	qboolean		found;
;829:
;830:	found        = qfalse;
ADDRLP4 4428
CNSTI4 0
ASGNI4
line 831
;831:	emptyinfo[0] = '\0';
ADDRLP4 4432
CNSTI1 0
ASGNI1
line 834
;832:
;833:	// copy the old
;834:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 4352
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 835
;835:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 838
;836:
;837:	// clear the current for sync
;838:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4352
ARGI4
ADDRGP4 memset
CALLP4
pop
line 839
;839:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 842
;840:
;841:	// resync existing results with new or deleted cvars
;842:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 4424
CNSTI4 0
ASGNI4
LABELV $439
line 843
;843:	{
line 844
;844:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $443
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
line 845
;845:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $444
line 846
;846:			continue;
ADDRGP4 $440
JUMPV
LABELV $444
line 850
;847:
;848:		// quick sanity check to avoid slow domain name resolving
;849:		// first character must be numeric
;850:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 5460
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 5460
INDIRI4
CNSTI4 48
LTI4 $448
ADDRLP4 5460
INDIRI4
CNSTI4 57
LEI4 $446
LABELV $448
line 851
;851:			continue;
ADDRGP4 $440
JUMPV
LABELV $446
line 856
;852:
;853:		// favorite server addresses must be maintained outside refresh list
;854:		// this mimics local and global netadr's stored in client
;855:		// these can be fetched to fill ping list
;856:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
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
line 859
;857:
;858:		// find this server in the old list
;859:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $453
JUMPV
LABELV $450
line 860
;860:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
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
NEI4 $454
line 861
;861:				break;
ADDRGP4 $452
JUMPV
LABELV $454
LABELV $451
line 859
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $453
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $450
LABELV $452
line 863
;862:
;863:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $456
line 864
;864:		{
line 866
;865:			// found server - add exisiting results
;866:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
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
line 867
;867:			found = qtrue;
ADDRLP4 4428
CNSTI4 1
ASGNI4
line 868
;868:		}
ADDRGP4 $457
JUMPV
LABELV $456
line 870
;869:		else
;870:		{
line 872
;871:			// add new server
;872:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
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
line 873
;873:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
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
line 874
;874:		}
LABELV $457
line 876
;875:
;876:		g_numfavoriteservers++;
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
line 877
;877:	}
LABELV $440
line 842
ADDRLP4 4424
ADDRLP4 4424
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4424
INDIRI4
CNSTI4 16
LTI4 $439
line 879
;878:
;879:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+14952
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 881
;880:
;881:	if (!found)
ADDRLP4 4428
INDIRI4
CNSTI4 0
NEI4 $460
line 882
;882:	{
line 885
;883:		// no results were found, reset server list
;884:		// list will be automatically refreshed when selected
;885:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 886
;886:	}
LABELV $460
line 887
;887:}
LABELV $438
endproc ArenaServers_LoadFavorites 5472 12
proc ArenaServers_StopRefresh 0 16
line 896
;888:
;889:
;890:/*
;891:=================
;892:ArenaServers_StopRefresh
;893:=================
;894:*/
;895:static void ArenaServers_StopRefresh( void )
;896:{
line 897
;897:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
NEI4 $463
line 899
;898:		// not currently refreshing
;899:		return;
ADDRGP4 $462
JUMPV
LABELV $463
line 901
;900:
;901:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+13912
CNSTI4 0
ASGNI4
line 903
;902:
;903:	if (g_servertype == AS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $467
line 904
;904:	{
line 906
;905:		// nonresponsive favorites must be shown
;906:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 907
;907:	}
LABELV $467
line 910
;908:
;909:	// final tally
;910:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
LTI4 $469
line 911
;911:	{
line 912
;912:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 913
;913:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 914
;914:	}
LABELV $469
line 917
;915:	
;916:	// sort
;917:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
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
line 919
;918:
;919:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 920
;920:}
LABELV $462
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 929
;921:
;922:
;923:/*
;924:=================
;925:ArenaServers_DoRefresh
;926:=================
;927:*/
;928:static void ArenaServers_DoRefresh( void )
;929:{
line 937
;930:	int		i;
;931:	int		j;
;932:	int		time;
;933:	int		maxPing;
;934:	char	adrstr[MAX_ADDRESSLENGTH];
;935:	char	info[MAX_INFO_STRING];
;936:
;937:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13924
INDIRI4
GEI4 $479
line 938
;938:	{
line 939
;939:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $483
line 940
;940:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 1
NEI4 $485
line 941
;941:				if (!trap_LAN_GetServerCount(g_servertype)) {
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
NEI4 $487
line 942
;942:					return;
ADDRGP4 $478
JUMPV
LABELV $487
line 944
;943:				}
;944:			}
LABELV $485
line 945
;945:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
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
GEI4 $489
line 947
;946:			  // still waiting for response
;947:			  return;
ADDRGP4 $478
JUMPV
LABELV $489
line 949
;948:			}
;949:	  }
LABELV $483
line 950
;950:	}
LABELV $479
line 952
;951:
;952:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13916
INDIRI4
GEI4 $491
line 953
;953:	{
line 955
;954:		// wait for time trigger
;955:		return;
ADDRGP4 $478
JUMPV
LABELV $491
line 959
;956:	}
;957:
;958:	// trigger at 10Hz intervals
;959:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+13916
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 962
;960:
;961:	// process ping results
;962:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 963
;963:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $497
line 964
;964:	{
line 965
;965:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
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
line 966
;966:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $501
line 967
;967:		{
line 969
;968:			// ignore empty or pending pings
;969:			continue;
ADDRGP4 $498
JUMPV
LABELV $501
line 973
;970:		}
;971:
;972:		// find ping result in our local list
;973:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $503
line 974
;974:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
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
NEI4 $507
line 975
;975:				break;
ADDRGP4 $505
JUMPV
LABELV $507
LABELV $504
line 973
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $503
LABELV $505
line 977
;976:
;977:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $510
line 978
;978:		{
line 980
;979:			// found it
;980:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $512
line 981
;981:			{
line 982
;982:				time = uis.realtime - g_arenaservers.pinglist[j].start;
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
line 983
;983:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $517
line 984
;984:				{
line 986
;985:					// still waiting
;986:					continue;
ADDRGP4 $498
JUMPV
LABELV $517
line 988
;987:				}
;988:			}
LABELV $512
line 990
;989:
;990:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $519
line 991
;991:			{
line 993
;992:				// stale it out
;993:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 994
;994:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 995
;995:			}
ADDRGP4 $520
JUMPV
LABELV $519
line 997
;996:			else
;997:			{
line 998
;998:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
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
line 999
;999:			}
LABELV $520
line 1002
;1000:
;1001:			// insert ping results
;1002:			ArenaServers_Insert( adrstr, info, time );
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
line 1005
;1003:
;1004:			// clear this query from internal list
;1005:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
CNSTI1 0
ASGNI1
line 1006
;1006:   		}
LABELV $510
line 1009
;1007:
;1008:		// clear this query from external list
;1009:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1010
;1010:	}
LABELV $498
line 963
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $497
line 1014
;1011:
;1012:	// get results of servers query
;1013:	// counts can increase as servers respond
;1014:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $522
line 1015
;1015:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 1016
;1016:	} else {
ADDRGP4 $523
JUMPV
LABELV $522
line 1017
;1017:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
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
line 1018
;1018:	}
LABELV $523
line 1025
;1019:
;1020://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;1021://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;1022:
;1023:	// send ping requests in reasonable bursts
;1024:	// iterate ping through all found servers
;1025:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $530
JUMPV
LABELV $527
line 1026
;1026:	{
line 1027
;1027:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $533
line 1028
;1028:		{
line 1030
;1029:			// ping queue is full
;1030:			break;
ADDRGP4 $529
JUMPV
LABELV $533
line 1034
;1031:		}
;1032:
;1033:		// find empty slot
;1034:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $535
line 1035
;1035:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $539
line 1036
;1036:				break;
ADDRGP4 $537
JUMPV
LABELV $539
LABELV $536
line 1034
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $535
LABELV $537
line 1038
;1037:
;1038:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $542
line 1040
;1039:			// no empty slots available yet - wait for timeout
;1040:			break;
ADDRGP4 $529
JUMPV
LABELV $542
line 1044
;1041:
;1042:		// get an address to ping
;1043:
;1044:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $544
line 1045
;1045:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
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
line 1046
;1046:		} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1047
;1047:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
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
line 1048
;1048:		}
LABELV $545
line 1050
;1049:
;1050:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
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
line 1051
;1051:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 1053
;1052:
;1053:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $553
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
line 1056
;1054:		
;1055:		// advance to next server
;1056:		g_arenaservers.currentping++;
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
line 1057
;1057:	}
LABELV $528
line 1025
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $530
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $555
ADDRGP4 g_arenaservers+13908
INDIRI4
ADDRGP4 g_arenaservers+13896
INDIRI4
LTI4 $527
LABELV $555
LABELV $529
line 1059
;1058:
;1059:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $556
line 1060
;1060:	{
line 1062
;1061:		// all pings completed
;1062:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1063
;1063:		return;
ADDRGP4 $478
JUMPV
LABELV $556
line 1067
;1064:	}
;1065:
;1066:	// update the user interface with ping status
;1067:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1068
;1068:}
LABELV $478
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 1077
;1069:
;1070:
;1071:/*
;1072:=================
;1073:ArenaServers_StartRefresh
;1074:=================
;1075:*/
;1076:static void ArenaServers_StartRefresh( void )
;1077:{
line 1081
;1078:	int		i;
;1079:	char	myargs[32], protocol[32];
;1080:
;1081:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
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
line 1083
;1082:
;1083:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $561
line 1084
;1084:	{
line 1085
;1085:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
CNSTI1 0
ASGNI1
line 1086
;1086:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1087
;1087:	}
LABELV $562
line 1083
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $561
line 1089
;1088:
;1089:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+13912
CNSTI4 1
ASGNI4
line 1090
;1090:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+13908
CNSTI4 0
ASGNI4
line 1091
;1091:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+13916
CNSTI4 0
ASGNI4
line 1092
;1092:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+13900
INDIRP4
CNSTI4 0
ASGNI4
line 1093
;1093:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+13896
CNSTI4 0
ASGNI4
line 1096
;1094:
;1095:	// allow max 5 seconds for responses
;1096:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+13924
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1099
;1097:
;1098:	// place menu in zeroed state
;1099:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1101
;1100:
;1101:	if( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 1
NEI4 $573
line 1102
;1102:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $575
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1103
;1103:		return;
ADDRGP4 $558
JUMPV
LABELV $573
line 1106
;1104:	}
;1105:
;1106:	if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $578
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $576
LABELV $578
line 1107
;1107:		if( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $579
line 1108
;1108:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1109
;1109:		}
ADDRGP4 $580
JUMPV
LABELV $579
line 1110
;1110:		else {
line 1111
;1111:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1112
;1112:		}
LABELV $580
line 1114
;1113:
;1114:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+552+64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $581
ADDRLP4 72
INDIRI4
CNSTI4 4
GTI4 $581
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $594
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $594
address $585
address $586
address $588
address $590
address $592
code
LABELV $581
LABELV $585
line 1117
;1115:		default:
;1116:		case GAMES_ALL:
;1117:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 1118
;1118:			break;
ADDRGP4 $582
JUMPV
LABELV $586
line 1121
;1119:
;1120:		case GAMES_FFA:
;1121:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $587
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1122
;1122:			break;
ADDRGP4 $582
JUMPV
LABELV $588
line 1125
;1123:
;1124:		case GAMES_TEAMPLAY:
;1125:			strcpy( myargs, " team" );
ADDRLP4 36
ARGP4
ADDRGP4 $589
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1126
;1126:			break;
ADDRGP4 $582
JUMPV
LABELV $590
line 1129
;1127:
;1128:		case GAMES_TOURNEY:
;1129:			strcpy( myargs, " tourney" );
ADDRLP4 36
ARGP4
ADDRGP4 $591
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1130
;1130:			break;
ADDRGP4 $582
JUMPV
LABELV $592
line 1133
;1131:
;1132:		case GAMES_CTF:
;1133:			strcpy( myargs, " ctf" );
ADDRLP4 36
ARGP4
ADDRGP4 $593
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1134
;1134:			break;
LABELV $582
line 1138
;1135:		}
;1136:
;1137:
;1138:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $595
line 1139
;1139:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $597
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1140
;1140:		}
LABELV $595
line 1142
;1141:
;1142:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $598
line 1143
;1143:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $600
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1144
;1144:		}
LABELV $598
line 1146
;1145:
;1146:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1147
;1147:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $601
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1152
;1148:		
;1149:
;1150:		// Shafe - Trep Here is where we ditch the whole AS_MPLAYER Thing and replace it with multimaster support
;1151:		// i will define which hardcoded master to use 0 is default or sv_master1
;1152:		i = ui_browserMasterNum.integer;
ADDRLP4 0
ADDRGP4 ui_browserMasterNum+12
INDIRI4
ASGNI4
line 1154
;1153:		// End Shafe
;1154:		Com_Printf("Sending to master number %d \n", i);
ADDRGP4 $603
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1155
;1155:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $604
line 1156
;1156:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", i, protocol, myargs ));
ADDRGP4 $606
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
line 1157
;1157:		}
ADDRGP4 $605
JUMPV
LABELV $604
line 1158
;1158:		else {
line 1159
;1159:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", i, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $608
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $607
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
line 1160
;1160:		}
LABELV $605
line 1161
;1161:	}
LABELV $576
line 1162
;1162:}
LABELV $558
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1171
;1163:
;1164:
;1165:/*
;1166:=================
;1167:ArenaServers_SaveChanges
;1168:=================
;1169:*/
;1170:void ArenaServers_SaveChanges( void )
;1171:{
line 1174
;1172:	int	i;
;1173:
;1174:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $613
JUMPV
LABELV $610
line 1175
;1175:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $443
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
LABELV $611
line 1174
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $613
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $610
line 1177
;1176:
;1177:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $619
JUMPV
LABELV $616
line 1178
;1178:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $443
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
ADDRGP4 $211
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $617
line 1177
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $619
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $616
line 1179
;1179:}
LABELV $609
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1187
;1180:
;1181:
;1182:/*
;1183:=================
;1184:ArenaServers_Sort
;1185:=================
;1186:*/
;1187:void ArenaServers_Sort( int type ) {
line 1188
;1188:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $621
line 1189
;1189:		return;
ADDRGP4 $620
JUMPV
LABELV $621
line 1192
;1190:	}
;1191:
;1192:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1193
;1193:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
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
line 1194
;1194:}
LABELV $620
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 20 8
line 1203
;1195:
;1196:
;1197:/*
;1198:=================
;1199:ArenaServers_SetType
;1200:=================
;1201:*/
;1202:void ArenaServers_SetType( int type )
;1203:{
line 1204
;1204:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $626
line 1205
;1205:		return;
ADDRGP4 $625
JUMPV
LABELV $626
line 1207
;1206:
;1207:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1209
;1208:
;1209:	switch( type )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $628
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $628
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $654
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $654
address $630
address $636
address $648
address $642
code
line 1210
;1210:	{
LABELV $628
LABELV $630
line 1213
;1211:	default:
;1212:	case AS_GLOBAL: // AS_Global is now set as default -Vincent
;1213:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
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
line 1214
;1214:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_globalserverlist
ASGNP4
line 1215
;1215:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numglobalservers
ASGNP4
line 1216
;1216:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1217
;1217:		break;
ADDRGP4 $629
JUMPV
LABELV $636
line 1220
;1218:
;1219:	case AS_LOCAL:
;1220:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
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
line 1221
;1221:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_localserverlist
ASGNP4
line 1222
;1222:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numlocalservers
ASGNP4
line 1223
;1223:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1224
;1224:		break;
ADDRGP4 $629
JUMPV
LABELV $642
line 1227
;1225:
;1226:	case AS_FAVORITES:
;1227:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
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
line 1228
;1228:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1229
;1229:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1230
;1230:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 16
ASGNI4
line 1231
;1231:		break;
ADDRGP4 $629
JUMPV
LABELV $648
line 1234
;1232:
;1233:	case AS_MPLAYER:
;1234:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
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
line 1235
;1235:		g_arenaservers.serverlist = g_mplayerserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_mplayerserverlist
ASGNP4
line 1236
;1236:		g_arenaservers.numservers = &g_nummplayerservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_nummplayerservers
ASGNP4
line 1237
;1237:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1238
;1238:		break;
LABELV $629
line 1242
;1239:		
;1240:	}
;1241:
;1242:	if( !*g_arenaservers.numservers )
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $655
line 1243
;1243:	{
line 1244
;1244:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1245
;1245:	}
ADDRGP4 $656
JUMPV
LABELV $655
line 1247
;1246:	else 
;1247:	{
line 1249
;1248:		// avoid slow operation, use existing results
;1249:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 1250
;1250:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 1251
;1251:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1252
;1252:	}
LABELV $656
line 1253
;1253:	strcpy(g_arenaservers.status.string,"hit refresh to update");
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $664
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1254
;1254:}
LABELV $625
endproc ArenaServers_SetType 20 8
proc Punkbuster_ConfirmEnable 8 12
line 1261
;1255:
;1256:/*
;1257:=================
;1258:PunkBuster_Confirm
;1259:=================
;1260:*/
;1261:static void Punkbuster_ConfirmEnable( qboolean result ) {
line 1262
;1262:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $666
line 1263
;1263:	{		
line 1264
;1264:		trap_SetPbClStatus(1);
CNSTI4 1
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1265
;1265:	}
LABELV $666
line 1266
;1266:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $670
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
line 1267
;1267:}
LABELV $665
endproc Punkbuster_ConfirmEnable 8 12
proc Punkbuster_ConfirmDisable 8 12
line 1269
;1268:
;1269:static void Punkbuster_ConfirmDisable( qboolean result ) {
line 1270
;1270:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $672
line 1271
;1271:	{
line 1272
;1272:		trap_SetPbClStatus(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1273
;1273:		UI_Message( punkbuster_msg );
ADDRGP4 punkbuster_msg
ARGP4
ADDRGP4 UI_Message
CALLV
pop
line 1274
;1274:	}
LABELV $672
line 1275
;1275:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $670
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
line 1276
;1276:}
LABELV $671
endproc Punkbuster_ConfirmDisable 8 12
proc ArenaServers_Event 12 16
line 1283
;1277:
;1278:/*
;1279:=================
;1280:ArenaServers_Event
;1281:=================
;1282:*/
;1283:static void ArenaServers_Event( void* ptr, int event ) {
line 1287
;1284:	int		id;
;1285:	int value;
;1286:
;1287:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1289
;1288:
;1289:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $677
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $677
line 1290
;1290:		return;
ADDRGP4 $676
JUMPV
LABELV $677
line 1293
;1291:	}
;1292:
;1293:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $679
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $679
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $735-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $735
address $681
address $691
address $697
address $703
address $709
address $715
address $718
address $720
address $722
address $723
address $724
address $725
address $726
address $727
address $728
address $687
code
LABELV $681
line 1295
;1294:	case ID_MASTER:
;1295:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+360+64
INDIRI4
ASGNI4
line 1296
;1296:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $684
line 1297
;1297:		{
line 1298
;1298:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1299
;1299:		}
LABELV $684
line 1300
;1300:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $686
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1301
;1301:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1302
;1302:		break;
ADDRGP4 $680
JUMPV
LABELV $687
line 1305
;1303:
;1304:	case ID_MSERVER:  // Shafe
;1305:		trap_Cvar_SetValue( "ui_browserMasterNum", g_arenaservers.mserver.curvalue );	
ADDRGP4 $688
ARGP4
ADDRGP4 g_arenaservers+456+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1306
;1306:		break;
ADDRGP4 $680
JUMPV
LABELV $691
line 1309
;1307:		
;1308:	case ID_GAMETYPE:
;1309:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $692
ARGP4
ADDRGP4 g_arenaservers+552+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1310
;1310:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+552+64
INDIRI4
ASGNI4
line 1311
;1311:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1312
;1312:		break;
ADDRGP4 $680
JUMPV
LABELV $697
line 1315
;1313:
;1314:	case ID_SORTKEY:
;1315:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $698
ARGP4
ADDRGP4 g_arenaservers+648+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1316
;1316:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+648+64
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1317
;1317:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1318
;1318:		break;
ADDRGP4 $680
JUMPV
LABELV $703
line 1321
;1319:
;1320:	case ID_SHOW_FULL:
;1321:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $704
ARGP4
ADDRGP4 g_arenaservers+744+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1322
;1322:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+744+60
INDIRI4
ASGNI4
line 1323
;1323:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1324
;1324:		break;
ADDRGP4 $680
JUMPV
LABELV $709
line 1327
;1325:
;1326:	case ID_SHOW_EMPTY:
;1327:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $710
ARGP4
ADDRGP4 g_arenaservers+808+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1328
;1328:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+808+60
INDIRI4
ASGNI4
line 1329
;1329:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1330
;1330:		break;
ADDRGP4 $680
JUMPV
LABELV $715
line 1333
;1331:
;1332:	case ID_LIST:
;1333:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $680
line 1334
;1334:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1335
;1335:		}
line 1336
;1336:		break;
ADDRGP4 $680
JUMPV
LABELV $718
line 1339
;1337:
;1338:	case ID_SCROLL_UP:
;1339:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+872
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1340
;1340:		break;
ADDRGP4 $680
JUMPV
LABELV $720
line 1343
;1341:
;1342:	case ID_SCROLL_DOWN:
;1343:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+872
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1344
;1344:		break;
ADDRGP4 $680
JUMPV
LABELV $722
line 1347
;1345:
;1346:	case ID_BACK:
;1347:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1348
;1348:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1349
;1349:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1350
;1350:		break;
ADDRGP4 $680
JUMPV
LABELV $723
line 1353
;1351:
;1352:	case ID_REFRESH:
;1353:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1354
;1354:		break;
ADDRGP4 $680
JUMPV
LABELV $724
line 1357
;1355:
;1356:	case ID_SPECIFY:
;1357:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1358
;1358:		break;
ADDRGP4 $680
JUMPV
LABELV $725
line 1361
;1359:
;1360:	case ID_CREATE:
;1361:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1362
;1362:		break;
ADDRGP4 $680
JUMPV
LABELV $726
line 1365
;1363:
;1364:	case ID_CONNECT:
;1365:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1366
;1366:		break;
ADDRGP4 $680
JUMPV
LABELV $727
line 1369
;1367:
;1368:	case ID_REMOVE:
;1369:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1370
;1370:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1371
;1371:		break;
ADDRGP4 $680
JUMPV
LABELV $728
line 1374
;1372:	
;1373:	case ID_PUNKBUSTER:
;1374:		if (g_arenaservers.punkbuster.curvalue)			
ADDRGP4 g_arenaservers+14956+64
INDIRI4
CNSTI4 0
EQI4 $729
line 1375
;1375:		{
line 1376
;1376:			UI_ConfirmMenu_Style( "Enable Punkbuster?",  UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmEnable );
ADDRGP4 $733
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
line 1377
;1377:		}
ADDRGP4 $680
JUMPV
LABELV $729
line 1379
;1378:		else
;1379:		{
line 1380
;1380:			UI_ConfirmMenu_Style( "Disable Punkbuster?", UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmDisable );
ADDRGP4 $734
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
line 1381
;1381:		}
line 1382
;1382:		break;
LABELV $679
LABELV $680
line 1384
;1383:	}
;1384:}
LABELV $676
endproc ArenaServers_Event 12 16
proc ArenaServers_MenuDraw 0 4
line 1393
;1385:
;1386:
;1387:/*
;1388:=================
;1389:ArenaServers_MenuDraw
;1390:=================
;1391:*/
;1392:static void ArenaServers_MenuDraw( void )
;1393:{
line 1394
;1394:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $738
line 1395
;1395:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $738
line 1397
;1396:
;1397:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1398
;1398:}
LABELV $737
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1406
;1399:
;1400:
;1401:/*
;1402:=================
;1403:ArenaServers_MenuKey
;1404:=================
;1405:*/
;1406:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1407
;1407:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $742
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $742
line 1408
;1408:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1409
;1409:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $741
JUMPV
LABELV $742
line 1412
;1410:	}
;1411:
;1412:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $748
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $745
LABELV $748
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $745
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
NEU4 $745
line 1413
;1413:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1414
;1414:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1415
;1415:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1416
;1416:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $741
JUMPV
LABELV $745
line 1419
;1417:	}
;1418:
;1419:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $751
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $749
LABELV $751
line 1420
;1420:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1421
;1421:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1422
;1422:	}
LABELV $749
line 1425
;1423:
;1424:
;1425:	return Menu_DefaultKey( &g_arenaservers.menu, key );
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
LABELV $741
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $753
skip 64
code
proc ArenaServers_MenuInit 48 16
line 1434
;1426:}
;1427:
;1428:
;1429:/*
;1430:=================
;1431:ArenaServers_MenuInit
;1432:=================
;1433:*/
;1434:static void ArenaServers_MenuInit( void ) {
line 1442
;1435:	int			i;
;1436:	int			type;
;1437:	int			y;
;1438:	int			value;
;1439:	static char	statusbuffer[MAX_STATUSLENGTH];
;1440:
;1441:	// zero set all our globals
;1442:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15756
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1444
;1443:
;1444:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1446
;1445:
;1446:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1447
;1447:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1448
;1448:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1449
;1449:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1451
;1450:
;1451:	g_arenaservers.banner.generic.type  = MTYPE_TEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 7
ASGNI4
line 1452
;1452:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1453
;1453:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1454
;1454:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1455
;1455:	g_arenaservers.banner.string  		= "TREPIDATION SERVERS";
ADDRGP4 g_arenaservers+288+60
ADDRGP4 $767
ASGNP4
line 1456
;1456:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+288+64
CNSTI4 1
ASGNI4
line 1457
;1457:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+288+68
ADDRGP4 color_white
ASGNP4
line 1461
;1458:
;1459:
;1460:
;1461:	y = 50;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 1462
;1462:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+360
CNSTI4 3
ASGNI4
line 1463
;1463:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+360+4
ADDRGP4 $775
ASGNP4
line 1464
;1464:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+360+44
CNSTU4 262
ASGNU4
line 1465
;1465:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+360+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1466
;1466:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+360+8
CNSTI4 10
ASGNI4
line 1467
;1467:	g_arenaservers.master.generic.x				= 150;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+360+12
CNSTI4 150
ASGNI4
line 1468
;1468:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+360+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1469
;1469:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+360+76
ADDRGP4 master_items
ASGNP4
line 1472
;1470:
;1471:	// Shafe - Multi Masters
;1472:	y += SMALLCHAR_HEIGHT;	
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1473
;1473:	g_arenaservers.mserver.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+456
CNSTI4 3
ASGNI4
line 1474
;1474:	g_arenaservers.mserver.generic.name			= "Master Server:";
ADDRGP4 g_arenaservers+456+4
ADDRGP4 $791
ASGNP4
line 1475
;1475:	g_arenaservers.mserver.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+456+44
CNSTU4 262
ASGNU4
line 1476
;1476:	g_arenaservers.mserver.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1477
;1477:	g_arenaservers.mserver.generic.id			= ID_MSERVER;
ADDRGP4 g_arenaservers+456+8
CNSTI4 25
ASGNI4
line 1478
;1478:	g_arenaservers.mserver.generic.x				= 150;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+456+12
CNSTI4 150
ASGNI4
line 1479
;1479:	g_arenaservers.mserver.generic.y				= y;
ADDRGP4 g_arenaservers+456+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1480
;1480:	g_arenaservers.mserver.itemnames				= master_servers;
ADDRGP4 g_arenaservers+456+76
ADDRGP4 master_servers
ASGNP4
line 1482
;1481:
;1482:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1483
;1483:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+552
CNSTI4 3
ASGNI4
line 1484
;1484:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+552+4
ADDRGP4 $807
ASGNP4
line 1485
;1485:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+552+44
CNSTU4 258
ASGNU4
line 1486
;1486:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1487
;1487:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+552+8
CNSTI4 11
ASGNI4
line 1488
;1488:	g_arenaservers.gametype.generic.x			= 150;
ADDRGP4 g_arenaservers+552+12
CNSTI4 150
ASGNI4
line 1489
;1489:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+552+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1490
;1490:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+552+76
ADDRGP4 servertype_items
ASGNP4
line 1492
;1491:
;1492:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1493
;1493:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+648
CNSTI4 3
ASGNI4
line 1494
;1494:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+648+4
ADDRGP4 $823
ASGNP4
line 1495
;1495:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+648+44
CNSTU4 258
ASGNU4
line 1496
;1496:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+648+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1497
;1497:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+648+8
CNSTI4 12
ASGNI4
line 1498
;1498:	g_arenaservers.sortkey.generic.x			= 150;
ADDRGP4 g_arenaservers+648+12
CNSTI4 150
ASGNI4
line 1499
;1499:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+648+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1500
;1500:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+648+76
ADDRGP4 sortkey_items
ASGNP4
line 1502
;1501:
;1502:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1503
;1503:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+744
CNSTI4 5
ASGNI4
line 1504
;1504:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+744+4
ADDRGP4 $839
ASGNP4
line 1505
;1505:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+744+44
CNSTU4 258
ASGNU4
line 1506
;1506:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+744+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1507
;1507:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+744+8
CNSTI4 13
ASGNI4
line 1508
;1508:	g_arenaservers.showfull.generic.x			= 150;
ADDRGP4 g_arenaservers+744+12
CNSTI4 150
ASGNI4
line 1509
;1509:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+744+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1511
;1510:
;1511:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1512
;1512:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+808
CNSTI4 5
ASGNI4
line 1513
;1513:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+808+4
ADDRGP4 $853
ASGNP4
line 1514
;1514:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+808+44
CNSTU4 258
ASGNU4
line 1515
;1515:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+808+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1516
;1516:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+808+8
CNSTI4 14
ASGNI4
line 1517
;1517:	g_arenaservers.showempty.generic.x			= 150;
ADDRGP4 g_arenaservers+808+12
CNSTI4 150
ASGNI4
line 1518
;1518:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+808+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1520
;1519:
;1520:	y += 4 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1521
;1521:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+872
CNSTI4 8
ASGNI4
line 1522
;1522:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+872+44
CNSTU4 128
ASGNU4
line 1523
;1523:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+872+8
CNSTI4 15
ASGNI4
line 1524
;1524:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+872+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1525
;1525:	g_arenaservers.list.generic.x				= 10; //72;
ADDRGP4 g_arenaservers+872+12
CNSTI4 10
ASGNI4
line 1526
;1526:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+872+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1527
;1527:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+872+80
CNSTI4 68
ASGNI4
line 1528
;1528:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+872+84
CNSTI4 11
ASGNI4
line 1529
;1529:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+872+76
ADDRGP4 g_arenaservers+13384
ASGNP4
line 1530
;1530:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $882
line 1531
;1531:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
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
line 1532
;1532:	}
LABELV $883
line 1530
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $882
line 1534
;1533:
;1534:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+968
CNSTI4 6
ASGNI4
line 1535
;1535:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+968+44
CNSTU4 16388
ASGNU4
line 1536
;1536:	g_arenaservers.mappic.generic.x				= 325; //72;
ADDRGP4 g_arenaservers+968+12
CNSTI4 325
ASGNI4
line 1537
;1537:	g_arenaservers.mappic.generic.y				= 50;
ADDRGP4 g_arenaservers+968+16
CNSTI4 50
ASGNI4
line 1538
;1538:	g_arenaservers.mappic.width					= 170;
ADDRGP4 g_arenaservers+968+76
CNSTI4 170
ASGNI4
line 1539
;1539:	g_arenaservers.mappic.height				= 128;
ADDRGP4 g_arenaservers+968+80
CNSTI4 128
ASGNI4
line 1540
;1540:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+968+64
ADDRGP4 $901
ASGNP4
line 1542
;1541:
;1542:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1056
CNSTI4 6
ASGNI4
line 1543
;1543:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+1056+4
ADDRGP4 $905
ASGNP4
line 1544
;1544:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1056+44
CNSTU4 16388
ASGNU4
line 1545
;1545:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1056+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1546
;1546:	g_arenaservers.arrows.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1056+12
CNSTI4 560
ASGNI4
line 1547
;1547:	g_arenaservers.arrows.generic.y				= 240-64+16;
ADDRGP4 g_arenaservers+1056+16
CNSTI4 192
ASGNI4
line 1548
;1548:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+1056+76
CNSTI4 64
ASGNI4
line 1549
;1549:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+1056+80
CNSTI4 128
ASGNI4
line 1551
;1550:
;1551:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1144
CNSTI4 6
ASGNI4
line 1552
;1552:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1144+44
CNSTU4 2308
ASGNU4
line 1553
;1553:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+1144+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1554
;1554:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1144+8
CNSTI4 16
ASGNI4
line 1555
;1555:	g_arenaservers.up.generic.x					= 512+48;
ADDRGP4 g_arenaservers+1144+12
CNSTI4 560
ASGNI4
line 1556
;1556:	g_arenaservers.up.generic.y					= 240-64+16;
ADDRGP4 g_arenaservers+1144+16
CNSTI4 192
ASGNI4
line 1557
;1557:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+1144+76
CNSTI4 64
ASGNI4
line 1558
;1558:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+1144+80
CNSTI4 64
ASGNI4
line 1559
;1559:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1144+60
ADDRGP4 $935
ASGNP4
line 1561
;1560:
;1561:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1232
CNSTI4 6
ASGNI4
line 1562
;1562:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1232+44
CNSTU4 2308
ASGNU4
line 1563
;1563:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1232+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1564
;1564:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1232+8
CNSTI4 17
ASGNI4
line 1565
;1565:	g_arenaservers.down.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1232+12
CNSTI4 560
ASGNI4
line 1566
;1566:	g_arenaservers.down.generic.y				= 240+16;
ADDRGP4 g_arenaservers+1232+16
CNSTI4 256
ASGNI4
line 1567
;1567:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+1232+76
CNSTI4 64
ASGNI4
line 1568
;1568:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+1232+80
CNSTI4 64
ASGNI4
line 1569
;1569:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1232+60
ADDRGP4 $953
ASGNP4
line 1571
;1570:
;1571:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1572
;1572:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1320
CNSTI4 7
ASGNI4
line 1573
;1573:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1320+12
CNSTI4 320
ASGNI4
line 1574
;1574:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1320+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1575
;1575:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1320+60
ADDRGP4 $753
ASGNP4
line 1576
;1576:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1320+64
CNSTI4 17
ASGNI4
line 1577
;1577:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1320+68
ADDRGP4 menu_text_color
ASGNP4
line 1579
;1578:
;1579:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1580
;1580:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1392
CNSTI4 7
ASGNI4
line 1581
;1581:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1392+12
CNSTI4 320
ASGNI4
line 1582
;1582:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1392+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1583
;1583:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $211
ASGNP4
line 1584
;1584:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1392+64
CNSTI4 17
ASGNI4
line 1585
;1585:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1392+68
ADDRGP4 text_color_normal
ASGNP4
line 1587
;1586:
;1587:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1464
CNSTI4 6
ASGNI4
line 1588
;1588:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1464+4
ADDRGP4 $979
ASGNP4
line 1589
;1589:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1464+44
CNSTU4 260
ASGNU4
line 1590
;1590:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1464+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1591
;1591:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1464+8
CNSTI4 23
ASGNI4
line 1592
;1592:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1464+12
CNSTI4 450
ASGNI4
line 1593
;1593:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1464+16
CNSTI4 86
ASGNI4
line 1594
;1594:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1464+76
CNSTI4 96
ASGNI4
line 1595
;1595:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1464+80
CNSTI4 48
ASGNI4
line 1596
;1596:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1464+60
ADDRGP4 $996
ASGNP4
line 1598
;1597:
;1598:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1552
CNSTI4 6
ASGNI4
line 1599
;1599:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1552+4
ADDRGP4 $1000
ASGNP4
line 1600
;1600:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1552+44
CNSTU4 260
ASGNU4
line 1601
;1601:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1602
;1602:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1552+8
CNSTI4 18
ASGNI4
line 1603
;1603:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1552+12
CNSTI4 0
ASGNI4
line 1604
;1604:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1552+16
CNSTI4 416
ASGNI4
line 1605
;1605:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1552+76
CNSTI4 128
ASGNI4
line 1606
;1606:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1552+80
CNSTI4 64
ASGNI4
line 1607
;1607:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $1017
ASGNP4
line 1609
;1608:
;1609:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1728
CNSTI4 6
ASGNI4
line 1610
;1610:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1728+4
ADDRGP4 $1021
ASGNP4
line 1611
;1611:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1728+44
CNSTU4 260
ASGNU4
line 1612
;1612:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1728+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1613
;1613:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1728+8
CNSTI4 20
ASGNI4
line 1614
;1614:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1728+12
CNSTI4 128
ASGNI4
line 1615
;1615:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1728+16
CNSTI4 416
ASGNI4
line 1616
;1616:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1728+76
CNSTI4 128
ASGNI4
line 1617
;1617:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1728+80
CNSTI4 64
ASGNI4
line 1618
;1618:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1728+60
ADDRGP4 $1038
ASGNP4
line 1620
;1619:
;1620:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1640
CNSTI4 6
ASGNI4
line 1621
;1621:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1640+4
ADDRGP4 $1042
ASGNP4
line 1622
;1622:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1640+44
CNSTU4 260
ASGNU4
line 1623
;1623:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1640+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1624
;1624:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1640+8
CNSTI4 19
ASGNI4
line 1625
;1625:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1640+12
CNSTI4 256
ASGNI4
line 1626
;1626:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1640+16
CNSTI4 416
ASGNI4
line 1627
;1627:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1640+76
CNSTI4 128
ASGNI4
line 1628
;1628:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1640+80
CNSTI4 64
ASGNI4
line 1629
;1629:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1640+60
ADDRGP4 $1059
ASGNP4
line 1631
;1630:
;1631:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1816
CNSTI4 6
ASGNI4
line 1632
;1632:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1816+4
ADDRGP4 $1063
ASGNP4
line 1633
;1633:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1816+44
CNSTU4 260
ASGNU4
line 1634
;1634:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1816+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1635
;1635:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1816+8
CNSTI4 21
ASGNI4
line 1636
;1636:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1816+12
CNSTI4 384
ASGNI4
line 1637
;1637:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1816+16
CNSTI4 416
ASGNI4
line 1638
;1638:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1816+76
CNSTI4 128
ASGNI4
line 1639
;1639:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1816+80
CNSTI4 64
ASGNI4
line 1640
;1640:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1816+60
ADDRGP4 $1080
ASGNP4
line 1642
;1641:
;1642:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1904
CNSTI4 6
ASGNI4
line 1643
;1643:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+1904+4
ADDRGP4 $1084
ASGNP4
line 1644
;1644:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1904+44
CNSTU4 272
ASGNU4
line 1645
;1645:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1904+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1646
;1646:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+1904+8
CNSTI4 22
ASGNI4
line 1647
;1647:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+1904+12
CNSTI4 640
ASGNI4
line 1648
;1648:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+1904+16
CNSTI4 416
ASGNI4
line 1649
;1649:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+1904+76
CNSTI4 128
ASGNI4
line 1650
;1650:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+1904+80
CNSTI4 64
ASGNI4
line 1651
;1651:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+1904+60
ADDRGP4 $1101
ASGNP4
line 1653
;1652:
;1653:	g_arenaservers.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+14956
CNSTI4 3
ASGNI4
line 1654
;1654:	g_arenaservers.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 g_arenaservers+14956+4
ADDRGP4 $1105
ASGNP4
line 1655
;1655:	g_arenaservers.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+14956+44
CNSTU4 258
ASGNU4
line 1656
;1656:	g_arenaservers.punkbuster.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+14956+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1657
;1657:	g_arenaservers.punkbuster.generic.id			= ID_PUNKBUSTER;
ADDRGP4 g_arenaservers+14956+8
CNSTI4 24
ASGNI4
line 1658
;1658:	g_arenaservers.punkbuster.generic.x				= 480+32;
ADDRGP4 g_arenaservers+14956+12
CNSTI4 512
ASGNI4
line 1659
;1659:	g_arenaservers.punkbuster.generic.y				= 144;
ADDRGP4 g_arenaservers+14956+16
CNSTI4 144
ASGNI4
line 1660
;1660:	g_arenaservers.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 g_arenaservers+14956+76
ADDRGP4 punkbuster_items
ASGNP4
line 1662
;1661:	
;1662:	g_arenaservers.pblogo.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+15668
CNSTI4 6
ASGNI4
line 1663
;1663:	g_arenaservers.pblogo.generic.name			= ART_PUNKBUSTER;
ADDRGP4 g_arenaservers+15668+4
ADDRGP4 $1121
ASGNP4
line 1664
;1664:	g_arenaservers.pblogo.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+15668+44
CNSTU4 16388
ASGNU4
line 1665
;1665:	g_arenaservers.pblogo.generic.x				= 526;
ADDRGP4 g_arenaservers+15668+12
CNSTI4 526
ASGNI4
line 1666
;1666:	g_arenaservers.pblogo.generic.y				= 176;
ADDRGP4 g_arenaservers+15668+16
CNSTI4 176
ASGNI4
line 1667
;1667:	g_arenaservers.pblogo.width					= 32;
ADDRGP4 g_arenaservers+15668+76
CNSTI4 32
ASGNI4
line 1668
;1668:	g_arenaservers.pblogo.height				= 16;
ADDRGP4 g_arenaservers+15668+80
CNSTI4 16
ASGNI4
line 1669
;1669:	g_arenaservers.pblogo.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+15668+64
ADDRGP4 $901
ASGNP4
line 1672
;1670:
;1671:	// Shafe
;1672:	g_arenaservers.lblname.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+15052
CNSTI4 6
ASGNI4
line 1673
;1673:	g_arenaservers.lblname.generic.name			= ART_LBLNAME;
ADDRGP4 g_arenaservers+15052+4
ADDRGP4 $1137
ASGNP4
line 1674
;1674:	g_arenaservers.lblname.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+15052+44
CNSTU4 16388
ASGNU4
line 1675
;1675:	g_arenaservers.lblname.generic.x			= 10;
ADDRGP4 g_arenaservers+15052+12
CNSTI4 10
ASGNI4
line 1676
;1676:	g_arenaservers.lblname.generic.y			= 176;
ADDRGP4 g_arenaservers+15052+16
CNSTI4 176
ASGNI4
line 1677
;1677:	g_arenaservers.lblname.width				= 800;
ADDRGP4 g_arenaservers+15052+76
CNSTI4 800
ASGNI4
line 1678
;1678:	g_arenaservers.lblname.height				= 16;
ADDRGP4 g_arenaservers+15052+80
CNSTI4 16
ASGNI4
line 1679
;1679:	g_arenaservers.lblname.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+15052+64
ADDRGP4 $901
ASGNP4
line 1684
;1680:
;1681:
;1682:	//g_arenaservers.master.curvalue = 2;
;1683:	
;1684:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1686
;1685:
;1686:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1687
;1687:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mserver ); // Shafe - Multimaster
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1688
;1688:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1689
;1689:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1690
;1690:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1691
;1691:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1693
;1692:
;1693:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1694
;1694:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1695
;1695:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1696
;1696:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1697
;1697:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1056
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1698
;1698:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1144
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1699
;1699:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1701
;1700:
;1701:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1702
;1702:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1703
;1703:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1704
;1704:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1705
;1705:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1816
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1706
;1706:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1713
;1707:
;1708://	Shafe - Trep - No Punkbuster Garbage
;1709://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.punkbuster );
;1710://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.pblogo );
;1711:	
;1712:	// Shafe - Trep Menu Headers
;1713:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.lblname);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+15052
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1715
;1714:
;1715:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1717
;1716:
;1717:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
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
line 1719
;1718:	// hack to get rid of MPlayer stuff
;1719:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1720
;1720:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1172
line 1721
;1721:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1172
line 1723
;1722:	
;1723:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+360+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1725
;1724:
;1725:	g_gametype = Com_Clamp( 0, 4, ui_browserGameType.integer );
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
line 1726
;1726:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+552+64
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1729
;1727:
;1728:	// Shafe - Multi Master 
;1729:	g_masteruse = Com_Clamp( 0, 4, ui_browserMasterNum.integer );
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
line 1730
;1730:	g_arenaservers.mserver.curvalue = g_masteruse;
ADDRGP4 g_arenaservers+456+64
ADDRGP4 g_masteruse
INDIRI4
ASGNI4
line 1734
;1731:
;1732:
;1733:
;1734:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
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
line 1735
;1735:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+648+64
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1737
;1736:
;1737:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
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
line 1738
;1738:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+744+60
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1740
;1739:
;1740:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
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
line 1741
;1741:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+808+60
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1743
;1742:	
;1743:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $670
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
line 1746
;1744:
;1745:	// force to initial state and refresh
;1746:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1747
;1747:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1748
;1748:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1750
;1749:
;1750:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $601
ARGP4
ADDRGP4 $211
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1751
;1751:}
LABELV $752
endproc ArenaServers_MenuInit 48 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1759
;1752:
;1753:
;1754:/*
;1755:=================
;1756:ArenaServers_Cache
;1757:=================
;1758:*/
;1759:void ArenaServers_Cache( void ) {
line 1760
;1760:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $1000
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1761
;1761:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $1017
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1762
;1762:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1063
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1763
;1763:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1080
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1764
;1764:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $1021
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1765
;1765:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $1038
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1766
;1766:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $1042
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1767
;1767:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1059
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1768
;1768:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1084
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1769
;1769:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1101
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1770
;1770:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $905
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1771
;1771:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $935
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1772
;1772:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $953
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1773
;1773:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $901
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1774
;1774:	trap_R_RegisterShaderNoMip( ART_PUNKBUSTER );
ADDRGP4 $1121
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1775
;1775:}
LABELV $1193
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1783
;1776:
;1777:
;1778:/*
;1779:=================
;1780:UI_ArenaServersMenu
;1781:=================
;1782:*/
;1783:void UI_ArenaServersMenu( void ) {
line 1784
;1784:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1785
;1785:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1786
;1786:}						  
LABELV $1194
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
LABELV $1137
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
LABELV $1121
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
LABELV $1105
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
LABELV $1101
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
LABELV $1084
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
LABELV $1080
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
LABELV $1063
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
LABELV $1059
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
LABELV $1042
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
LABELV $1038
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
LABELV $1021
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
LABELV $1017
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
LABELV $1000
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
LABELV $996
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
LABELV $979
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
LABELV $953
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
LABELV $935
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
LABELV $901
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
LABELV $853
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
LABELV $839
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
LABELV $823
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
LABELV $807
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
LABELV $791
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
LABELV $775
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
LABELV $767
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
LABELV $734
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
LABELV $733
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
LABELV $710
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
LABELV $704
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
LABELV $698
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
LABELV $692
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
LABELV $688
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
LABELV $686
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
LABELV $670
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
LABELV $664
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
LABELV $608
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
LABELV $607
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
LABELV $606
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
LABELV $603
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
LABELV $601
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
LABELV $600
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $597
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $593
byte 1 32
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $591
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
LABELV $589
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $587
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $575
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
LABELV $553
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
LABELV $443
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
LABELV $422
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
LABELV $414
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
LABELV $413
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $412
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $411
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
LABELV $410
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
LABELV $409
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $408
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $407
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
LABELV $406
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $404
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
LABELV $337
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $336
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $335
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $334
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
LABELV $329
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $328
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $325
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $320
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $248
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
LABELV $245
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
LABELV $217
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
LABELV $211
byte 1 0
align 1
LABELV $181
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
LABELV $176
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
LABELV $160
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
LABELV $147
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
LABELV $112
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
LABELV $107
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
LABELV $106
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
LABELV $105
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
LABELV $104
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
LABELV $103
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $102
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
LABELV $101
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $100
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $99
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $98
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $97
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
LABELV $96
byte 1 81
byte 1 51
byte 1 70
byte 1 0
align 1
LABELV $95
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
LABELV $94
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $93
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $92
byte 1 83
byte 1 80
byte 1 32
byte 1 0
align 1
LABELV $91
byte 1 49
byte 1 118
byte 1 49
byte 1 0
align 1
LABELV $90
byte 1 68
byte 1 77
byte 1 32
byte 1 0
align 1
LABELV $89
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
LABELV $88
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
LABELV $87
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
LABELV $86
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
LABELV $85
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
