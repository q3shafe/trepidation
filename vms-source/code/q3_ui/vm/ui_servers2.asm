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
byte 4 0
align 4
LABELV sortkey_items
address $84
address $85
address $86
address $87
address $88
byte 4 0
align 4
LABELV gamenames
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
line 283
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
;74:#define AS_LOCAL			0
;75:#define AS_MPLAYER			1
;76:#define AS_GLOBAL			2
;77:#define AS_FAVORITES		3
;78:
;79:#define SORT_HOST			0
;80:#define SORT_MAP			1
;81:#define SORT_CLIENTS		2
;82:#define SORT_GAME			3
;83:#define SORT_PING			4
;84:
;85:// Shafe - Trep Multi Master Support
;86:#define MASTER0				0
;87:#define MASTER1				1
;88:#define MASTER2				2
;89:#define MASTER3				3
;90:#define MASTER4				4
;91:// End Shyafe
;92:
;93:
;94:#define GAMES_ALL			0
;95:#define GAMES_FFA			1
;96:#define GAMES_TEAMPLAY		2
;97:#define GAMES_TOURNEY		3
;98:#define GAMES_CTF			4
;99:#define GAMES_FREEZE		5	// Shafe - Trep - New Gametype
;100:#define GAMES_LASTMAN		6	// Shafe - Trep - New Gametype
;101:
;102://Shafe - Trep - Mulimasters
;103:static const char *master_servers[] = {
;104:	"Primary (master.tnlsoft.com",
;105:	"master.tnltotalsolutions.com",
;106:	"master2.tnlsoft.com",
;107:	"master2.tnltotalsolutions.com",
;108:	"Shafe's Since He's On The Same Lan",
;109:	0
;110:};
;111:// End Shafe
;112:
;113:static const char *master_items[] = {
;114:	"Local",
;115:	"Internet",
;116:	"Favorites",
;117:	0
;118:};
;119:
;120:static const char *servertype_items[] = {
;121:	"All",
;122:	"Free For All",
;123:	"Team Deathmatch",
;124:	"Tournament",
;125:	"Capture the Flag",
;126:	"Freeze Tag",			// Shafe - Trep - New Gametype
;127:	"Last Man Standing",	// Shafe - Trep - New Gametype
;128:	0
;129:};
;130:
;131:static const char *sortkey_items[] = {
;132:	"Server Name",
;133:	"Map Name",
;134:	"Open Player Spots",
;135:	"Game Type",
;136:	"Ping Time",
;137:	0
;138:};
;139:
;140:static char* gamenames[] = {
;141:	"DM ",	// deathmatch
;142:	"1v1",	// tournament
;143:	"SP ",	// single player
;144:	"Team DM",	// team deathmatch
;145:	"CTF",	// capture the flag
;146:	"One Flag CTF",		// one flag ctf
;147:	"OverLoad",				// Overload
;148:	"Harvester",			// Harvester
;149:	"Rocket Arena 3",	// Rocket Arena 3
;150:	"Q3F",						// Q3F
;151:	"Urban Terror",		// Urban Terror
;152:	"OSP",						// Orange Smoothie Productions
;153:	"???",			// unknown
;154:	0
;155:};
;156:
;157:static char* netnames[] = {
;158:	"???",
;159:	"UDP",
;160:	"IPX",
;161:	NULL
;162:};
;163:
;164:static char quake3worldMessage[] = "Visit treipidation.sourceforge.net - News, Community, Events, Files";
;165:
;166:const char* punkbuster_items[] = {
;167:	"Disabled",
;168:	"Enabled",
;169:	NULL
;170:};
;171:
;172:const char* punkbuster_msg[] = {
;173:	"PunkBuster will be",
;174:	"disabled the next time",
;175:	"Quake III Arena",
;176:	"is started.",
;177:	NULL
;178:};
;179:
;180:typedef struct {
;181:	char	adrstr[MAX_ADDRESSLENGTH];
;182:	int		start;
;183:} pinglist_t;
;184:
;185:typedef struct servernode_s {
;186:	char	adrstr[MAX_ADDRESSLENGTH];
;187:	char	hostname[MAX_HOSTNAMELENGTH+3];
;188:	char	mapname[MAX_MAPNAMELENGTH];
;189:	int		numclients;
;190:	int		maxclients;
;191:	int		pingtime;
;192:	int		gametype;
;193:	char	gamename[12];
;194:	int		nettype;
;195:	int		minPing;
;196:	int		maxPing;
;197:	qboolean bPB;
;198:
;199:} servernode_t; 
;200:
;201:typedef struct {
;202:	char			buff[MAX_LISTBOXWIDTH];
;203:	servernode_t*	servernode;
;204:} table_t;
;205:
;206:typedef struct {
;207:	menuframework_s		menu;
;208:
;209:	menutext_s			banner;
;210:
;211:	menulist_s			master;
;212:	menulist_s			mserver;
;213:	menulist_s			gametype;
;214:	menulist_s			sortkey;
;215:	menuradiobutton_s	showfull;
;216:	menuradiobutton_s	showempty;
;217:
;218:	menulist_s			list;
;219:	menubitmap_s		mappic;
;220:	menubitmap_s		arrows;
;221:	menubitmap_s		up;
;222:	menubitmap_s		down;
;223:	menutext_s			status;
;224:	menutext_s			statusbar;
;225:
;226:	menubitmap_s		remove;
;227:	menubitmap_s		back;
;228:	menubitmap_s		refresh;
;229:	menubitmap_s		specify;
;230:	menubitmap_s		create;
;231:	menubitmap_s		go;
;232:
;233:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;234:	table_t				table[MAX_LISTBOXITEMS];
;235:	char*				items[MAX_LISTBOXITEMS];
;236:	int					numqueriedservers;
;237:	int					*numservers;
;238:	servernode_t		*serverlist;	
;239:	int					currentping;
;240:	qboolean			refreshservers;
;241:	int					nextpingtime;
;242:	int					maxservers;
;243:	int					refreshtime;
;244:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;245:	int					numfavoriteaddresses;
;246:
;247:	menulist_s		punkbuster;
;248:	menubitmap_s	lblname;
;249:	menubitmap_s	lblmap;
;250:	menubitmap_s	lblplayers;
;251:	menubitmap_s	lblgtype;
;252:	menubitmap_s	lblnet;
;253:	menubitmap_s	lblping;
;254:	menubitmap_s	lblinstagib;
;255:	menubitmap_s	pblogo;
;256:
;257:} arenaservers_t;
;258:
;259:static arenaservers_t	g_arenaservers;
;260:
;261:
;262:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;263:static int				g_numglobalservers;
;264:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;265:static int				g_numlocalservers;
;266:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;267:static int				g_numfavoriteservers;
;268:static servernode_t		g_mplayerserverlist[MAX_GLOBALSERVERS];
;269:static int				g_nummplayerservers;
;270:static int				g_servertype;
;271:static int				g_gametype;
;272:static int				g_sortkey;
;273:static int				g_emptyservers;
;274:static int				g_fullservers;
;275:static int				g_masteruse; // Shafe - Trep - Multimaster
;276:
;277:
;278:/*
;279:=================
;280:ArenaServers_MaxPing
;281:=================
;282:*/
;283:static int ArenaServers_MaxPing( void ) {
line 286
;284:	int		maxPing;
;285:
;286:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
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
line 287
;287:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $115
line 288
;288:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 289
;289:	}
LABELV $115
line 290
;290:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $113
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 299
;291:}
;292:
;293:
;294:/*
;295:=================
;296:ArenaServers_Compare
;297:=================
;298:*/
;299:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 305
;300:	float			f1;
;301:	float			f2;
;302:	servernode_t*	t1;
;303:	servernode_t*	t2;
;304:
;305:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 306
;306:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 308
;307:
;308:	switch( g_sortkey ) {
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
line 310
;309:	case SORT_HOST:
;310:		return Q_stricmp( t1->hostname, t2->hostname );
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
line 313
;311:
;312:	case SORT_MAP:
;313:		return Q_stricmp( t1->mapname, t2->mapname );
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
line 316
;314:
;315:	case SORT_CLIENTS:
;316:		f1 = t1->maxclients - t1->numclients;
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
line 317
;317:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $123
line 318
;318:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 319
;319:		}
LABELV $123
line 321
;320:
;321:		f2 = t2->maxclients - t2->numclients;
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
line 322
;322:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $125
line 323
;323:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 324
;324:		}
LABELV $125
line 326
;325:
;326:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $127
line 327
;327:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $117
JUMPV
LABELV $127
line 329
;328:		}
;329:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $129
line 330
;330:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $117
JUMPV
LABELV $129
line 332
;331:		}
;332:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $117
JUMPV
LABELV $131
line 335
;333:
;334:	case SORT_GAME:
;335:		if( t1->gametype < t2->gametype ) {
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
line 336
;336:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $117
JUMPV
LABELV $132
line 338
;337:		}
;338:		if( t1->gametype == t2->gametype ) {
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
line 339
;339:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $117
JUMPV
LABELV $134
line 341
;340:		}
;341:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $117
JUMPV
LABELV $136
line 344
;342:
;343:	case SORT_PING:
;344:		if( t1->pingtime < t2->pingtime ) {
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
line 345
;345:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $117
JUMPV
LABELV $137
line 347
;346:		}
;347:		if( t1->pingtime > t2->pingtime ) {
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
line 348
;348:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $117
JUMPV
LABELV $139
line 350
;349:		}
;350:		return Q_stricmp( t1->hostname, t2->hostname );
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
line 353
;351:	}
;352:
;353:	return 0;
CNSTI4 0
RETI4
LABELV $117
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 8 8
line 362
;354:}
;355:
;356:
;357:/*
;358:=================
;359:ArenaServers_Go
;360:=================
;361:*/
;362:static void ArenaServers_Go( void ) {
line 365
;363:	servernode_t*	servernode;
;364:
;365:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168+68
ADDP4
INDIRP4
ASGNP4
line 366
;366:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $147
line 367
;367:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
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
line 368
;368:	}
LABELV $147
line 369
;369:}
LABELV $142
endproc ArenaServers_Go 8 8
bss
align 1
LABELV $151
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 377
;370:
;371:
;372:/*
;373:=================
;374:ArenaServers_UpdatePicture
;375:=================
;376:*/
;377:static void ArenaServers_UpdatePicture( void ) {
line 381
;378:	static char		picname[64];
;379:	servernode_t*	servernodeptr;
;380:
;381:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+872+68
INDIRI4
CNSTI4 0
NEI4 $152
line 382
;382:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+968+4
CNSTP4 0
ASGNP4
line 383
;383:	}
ADDRGP4 $153
JUMPV
LABELV $152
line 384
;384:	else {
line 385
;385:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168+68
ADDP4
INDIRP4
ASGNP4
line 386
;386:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
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
line 387
;387:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+968+4
ADDRGP4 $151
ASGNP4
line 389
;388:	
;389:	}
LABELV $153
line 392
;390:
;391:	// force shader update during draw
;392:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+968+68
CNSTI4 0
ASGNI4
line 393
;393:}
LABELV $150
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateMenu 72 48
line 401
;394:
;395:
;396:/*
;397:=================
;398:ArenaServers_UpdateMenu
;399:=================
;400:*/
;401:static void ArenaServers_UpdateMenu( void ) {
line 410
;402:	int				i;
;403:	int				j;
;404:	int				count;
;405:	char*			buff;
;406:	servernode_t*	servernodeptr;
;407:	table_t*		tableptr;
;408:	char			*pingColor;
;409:
;410:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
LEI4 $168
line 412
;411:		// servers found
;412:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $171
ADDRGP4 g_arenaservers+13908
INDIRI4
ADDRGP4 g_arenaservers+13896
INDIRI4
GTI4 $171
line 414
;413:			// show progress
;414:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Trepidation Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
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
line 415
;415:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $183
ASGNP4
line 416
;416:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ARGI4
CNSTI4 264
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 417
;417:		}
ADDRGP4 $169
JUMPV
LABELV $171
line 418
;418:		else {
line 420
;419:			// all servers pinged - enable controls
;420:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
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
line 421
;421:			g_arenaservers.mserver.generic.flags		&= ~QMF_GRAYED;
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
line 422
;422:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
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
line 423
;423:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
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
line 424
;424:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
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
line 425
;425:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
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
line 426
;426:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
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
line 427
;427:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
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
line 428
;428:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
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
line 429
;429:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
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
line 432
;430:
;431:			// update status bar
;432:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $208
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $206
LABELV $208
line 433
;433:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 quake3worldMessage
ASGNP4
line 434
;434:			}
ADDRGP4 $169
JUMPV
LABELV $206
line 435
;435:			else {
line 436
;436:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $213
ASGNP4
line 437
;437:			}
line 439
;438:
;439:		}
line 440
;440:	}
ADDRGP4 $169
JUMPV
LABELV $168
line 441
;441:	else {
line 443
;442:		// no servers found
;443:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $214
line 444
;444:			strcpy( g_arenaservers.status.string,"Scanning The Trepidation Universe." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $219
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 445
;445:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $183
ASGNP4
line 448
;446:
;447:			// disable controls during refresh
;448:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
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
line 449
;449:			g_arenaservers.mserver.generic.flags		|= QMF_GRAYED;
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
line 450
;450:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
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
line 451
;451:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
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
line 452
;452:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
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
line 453
;453:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
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
line 454
;454:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
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
line 455
;455:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
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
line 456
;456:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
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
line 457
;457:			g_arenaservers.punkbuster.generic.flags |= QMF_GRAYED;
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
line 458
;458:		}
ADDRGP4 $215
JUMPV
LABELV $214
line 459
;459:		else {
line 460
;460:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
GEI4 $242
line 461
;461:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $247
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 462
;462:			}
ADDRGP4 $243
JUMPV
LABELV $242
line 463
;463:			else {
line 464
;464:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $250
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 465
;465:			}
LABELV $243
line 468
;466:
;467:			// update status bar
;468:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 28
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $253
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $251
LABELV $253
line 469
;469:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 quake3worldMessage
ASGNP4
line 470
;470:			}
ADDRGP4 $252
JUMPV
LABELV $251
line 471
;471:			else {
line 472
;472:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $213
ASGNP4
line 473
;473:			}
LABELV $252
line 476
;474:
;475:			// end of refresh - set control state
;476:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
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
line 477
;477:			g_arenaservers.mserver.generic.flags		&= ~QMF_GRAYED;
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
line 478
;478:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
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
line 479
;479:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
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
line 480
;480:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
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
line 481
;481:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
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
line 482
;482:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
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
line 483
;483:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
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
line 484
;484:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
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
line 485
;485:			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
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
line 486
;486:		}
LABELV $215
line 489
;487:
;488:		// zero out list box
;489:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+872+68
CNSTI4 0
ASGNI4
line 490
;490:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+872+64
CNSTI4 0
ASGNI4
line 491
;491:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+872+72
CNSTI4 0
ASGNI4
line 494
;492:
;493:		// update picture
;494:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 495
;495:		return;
ADDRGP4 $167
JUMPV
LABELV $169
line 500
;496:	}
;497:	
;498:
;499:	// build list box strings - apply culling filters
;500:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+13904
INDIRP4
ASGNP4
line 501
;501:	count         = *g_arenaservers.numservers;
ADDRLP4 24
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 502
;502:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
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
line 503
;503:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
CNSTI4 72
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 504
;504:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 505
;505:		buff = tableptr->buff;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
line 508
;506:
;507:		// can only cull valid results
;508:		if( !g_emptyservers && !servernodeptr->numclients ) {
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
line 509
;509:			continue;
ADDRGP4 $287
JUMPV
LABELV $291
line 512
;510:		}
;511:
;512:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
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
line 513
;513:			continue;
ADDRGP4 $287
JUMPV
LABELV $293
line 516
;514:		}
;515:
;516:		switch( g_gametype ) {
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
CNSTI4 6
GTI4 $295
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $316
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $316
address $296
address $298
address $301
address $304
address $307
address $310
address $313
code
line 518
;517:		case GAMES_ALL:
;518:			break;
LABELV $298
line 521
;519:
;520:		case GAMES_FFA:
;521:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 522
;522:				continue;
ADDRGP4 $287
JUMPV
line 524
;523:			}
;524:			break;
LABELV $301
line 527
;525:
;526:		case GAMES_TEAMPLAY:
;527:			if( servernodeptr->gametype != GT_TEAM ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 3
EQI4 $296
line 528
;528:				continue;
ADDRGP4 $287
JUMPV
line 530
;529:			}
;530:			break;
LABELV $304
line 533
;531:
;532:		case GAMES_TOURNEY:
;533:			if( servernodeptr->gametype != GT_TOURNAMENT ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
EQI4 $296
line 534
;534:				continue;
ADDRGP4 $287
JUMPV
line 536
;535:			}
;536:			break;
LABELV $307
line 539
;537:
;538:		case GAMES_CTF:
;539:			if( servernodeptr->gametype != GT_CTF ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
EQI4 $296
line 540
;540:				continue;
ADDRGP4 $287
JUMPV
line 542
;541:			}
;542:			break;
LABELV $310
line 544
;543:		case GAMES_FREEZE:  // Shafe - Trep - Game type Freeze - Server Filter - This isnt a filter yet
;544:			if( servernodeptr->gametype != GT_FREEZE ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 8
EQI4 $296
line 545
;545:					continue;
ADDRGP4 $287
JUMPV
line 547
;546:			}
;547:			break;
LABELV $313
line 549
;548:		case GAMES_LASTMAN: // Shafe - Trep - Game type Last Man Standing Server Filter - This isnt a filter yet
;549:			if( servernodeptr->gametype != GT_LASTMAN ) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 9
EQI4 $296
line 550
;550:				continue;
ADDRGP4 $287
JUMPV
line 552
;551:			}
;552:			break;
LABELV $295
LABELV $296
line 555
;553:		}
;554:
;555:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
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
GEI4 $317
line 556
;556:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $319
ASGNP4
line 557
;557:		}
ADDRGP4 $318
JUMPV
LABELV $317
line 558
;558:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
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
EQI4 $320
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $320
line 559
;559:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $319
ASGNP4
line 560
;560:		}
ADDRGP4 $321
JUMPV
LABELV $320
line 561
;561:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 200
GEI4 $322
line 562
;562:			pingColor = S_COLOR_GREEN;
ADDRLP4 20
ADDRGP4 $324
ASGNP4
line 563
;563:		}
ADDRGP4 $323
JUMPV
LABELV $322
line 564
;564:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 400
GEI4 $325
line 565
;565:			pingColor = S_COLOR_YELLOW;
ADDRLP4 20
ADDRGP4 $327
ASGNP4
line 566
;566:		}
ADDRGP4 $326
JUMPV
LABELV $325
line 567
;567:		else {
line 568
;568:			pingColor = S_COLOR_RED;
ADDRLP4 20
ADDRGP4 $328
ASGNP4
line 569
;569:		}
LABELV $326
LABELV $323
LABELV $321
LABELV $318
line 571
;570:
;571:		Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $329
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
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $333
ADDRLP4 56
ADDRGP4 $330
ASGNP4
ADDRGP4 $334
JUMPV
LABELV $333
ADDRLP4 56
ADDRGP4 $331
ASGNP4
LABELV $334
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 575
;572:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;573: 			servernodeptr->maxclients, servernodeptr->gamename,
;574:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime, servernodeptr->bPB ? "Yes" : "No" );
;575:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 576
;576:	}
LABELV $287
line 502
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
LABELV $289
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $286
line 578
;577:
;578:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+872+68
ADDRLP4 8
INDIRI4
ASGNI4
line 579
;579:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+872+64
CNSTI4 0
ASGNI4
line 580
;580:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+872+72
CNSTI4 0
ASGNI4
line 583
;581:
;582:	// update picture
;583:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 584
;584:}
LABELV $167
endproc ArenaServers_UpdateMenu 72 48
proc ArenaServers_Remove 24 12
line 593
;585:
;586:
;587:/*
;588:=================
;589:ArenaServers_Remove
;590:=================
;591:*/
;592:static void ArenaServers_Remove( void )
;593:{
line 598
;594:	int				i;
;595:	servernode_t*	servernodeptr;
;596:	table_t*		tableptr;
;597:
;598:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+872+68
INDIRI4
CNSTI4 0
NEI4 $342
line 599
;599:		return;
ADDRGP4 $341
JUMPV
LABELV $342
line 605
;600:
;601:	// remove selected item from display list
;602:	// items are in scattered order due to sort and cull
;603:	// perform delete on list box contents, resync all lists
;604:
;605:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 72
ADDRGP4 g_arenaservers+872+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4168
ADDP4
ASGNP4
line 606
;606:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
line 609
;607:
;608:	// find address in master list
;609:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $352
JUMPV
LABELV $349
line 610
;610:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
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
NEI4 $354
line 611
;611:				break;
ADDRGP4 $351
JUMPV
LABELV $354
LABELV $350
line 609
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $352
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $349
LABELV $351
line 614
;612:
;613:	// delete address from master list
;614:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
CNSTI4 1
SUBI4
GTI4 $357
line 615
;615:	{
line 616
;616:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
CNSTI4 1
SUBI4
GEI4 $360
line 617
;617:		{
line 619
;618:			// shift items up
;619:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*sizeof(MAX_ADDRESSLENGTH));
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
line 620
;620:		}
LABELV $360
line 621
;621:		g_arenaservers.numfavoriteaddresses--;
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
line 622
;622:	}	
LABELV $357
line 625
;623:
;624:	// find address in server list
;625:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $371
JUMPV
LABELV $368
line 626
;626:		if (&g_favoriteserverlist[i] == servernodeptr)
CNSTI4 264
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $372
line 627
;627:				break;
ADDRGP4 $370
JUMPV
LABELV $372
LABELV $369
line 625
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $371
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $368
LABELV $370
line 630
;628:
;629:	// delete address from server list
;630:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $374
line 631
;631:	{
line 632
;632:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $376
line 633
;633:		{
line 635
;634:			// shift items up
;635:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 20
CNSTI4 264
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
ADDRGP4 g_favoriteserverlist+264
ADDP4
ARGP4
CNSTU4 264
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
line 636
;636:		}
LABELV $376
line 637
;637:		g_numfavoriteservers--;
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
line 638
;638:	}	
LABELV $374
line 640
;639:
;640:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 641
;641:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 642
;642:}
LABELV $341
endproc ArenaServers_Remove 24 12
proc ArenaServers_Insert 84 12
line 651
;643:
;644:
;645:/*
;646:=================
;647:ArenaServers_Insert
;648:=================
;649:*/
;650:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;651:{
line 657
;652:	servernode_t*	servernodeptr;
;653:	char*			s;
;654:	int				i;
;655:
;656:
;657:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 12
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $384
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $384
line 658
;658:	{
line 660
;659:		// slow global or local servers do not get entered
;660:		return;
ADDRGP4 $383
JUMPV
LABELV $384
line 663
;661:	}
;662:
;663:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+13920
INDIRI4
LTI4 $386
line 665
;664:		// list full;
;665:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 0
CNSTI4 264
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13904
INDIRP4
ADDP4
CNSTI4 -264
ADDP4
ASGNP4
line 666
;666:	} else {
ADDRGP4 $387
JUMPV
LABELV $386
line 668
;667:		// next slot
;668:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 0
CNSTI4 264
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13904
INDIRP4
ADDP4
ASGNP4
line 669
;669:		(*g_arenaservers.numservers)++;
ADDRLP4 16
ADDRGP4 g_arenaservers+13900
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
line 670
;670:	}
LABELV $387
line 672
;671:
;672:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
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
line 674
;673:
;674:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $395
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
line 675
;675:	Q_CleanStr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 676
;676:	Q_strupr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 678
;677:
;678:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $396
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
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 679
;679:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 680
;680:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 682
;681:
;682:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $397
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
CNSTI4 220
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 683
;683:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $398
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
CNSTI4 224
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 684
;684:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 685
;685:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $399
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
CNSTI4 252
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 686
;686:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $400
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
CNSTI4 256
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 687
;687:	servernodeptr->bPB = atoi( Info_ValueForKey( info, "punkbuster") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $401
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
CNSTI4 260
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 705
;688:
;689:	/*
;690:	s = Info_ValueForKey( info, "nettype" );
;691:	for (i=0; ;i++)
;692:	{
;693:		if (!netnames[i])
;694:		{
;695:			servernodeptr->nettype = 0;
;696:			break;
;697:		}
;698:		else if (!Q_stricmp( netnames[i], s ))
;699:		{
;700:			servernodeptr->nettype = i;
;701:			break;
;702:		}
;703:	}
;704:	*/
;705:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $402
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
CNSTI4 248
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 707
;706:
;707:	s = Info_ValueForKey( info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 72
INDIRP4
ASGNP4
line 708
;708:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $404
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
line 709
;709:	if( i < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $405
line 710
;710:		i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 711
;711:	}
ADDRGP4 $406
JUMPV
LABELV $405
line 712
;712:	else if( i > 11 ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
LEI4 $407
line 713
;713:		i = 12;
ADDRLP4 4
CNSTI4 12
ASGNI4
line 714
;714:	}
LABELV $407
LABELV $406
line 715
;715:	if( *s ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $409
line 716
;716:		servernodeptr->gametype = i;//-1;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 717
;717:		Q_strncpyz( servernodeptr->gamename, s, sizeof(servernodeptr->gamename) );
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
line 718
;718:	}
ADDRGP4 $410
JUMPV
LABELV $409
line 719
;719:	else {
line 720
;720:		servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 721
;721:		Q_strncpyz( servernodeptr->gamename, gamenames[i], sizeof(servernodeptr->gamename) );
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
line 722
;722:	}
LABELV $410
line 723
;723:}
LABELV $383
endproc ArenaServers_Insert 84 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 734
;724:
;725:
;726:/*
;727:=================
;728:ArenaServers_InsertFavorites
;729:
;730:Insert nonresponsive address book entries into display lists.
;731:=================
;732:*/
;733:void ArenaServers_InsertFavorites( void )
;734:{
line 740
;735:	int		i;
;736:	int		j;
;737:	char	info[MAX_INFO_STRING];
;738:
;739:	// resync existing results with new or deleted cvars
;740:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 741
;741:	Info_SetValueForKey( info, "hostname", "No Response" );
ADDRLP4 8
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 $412
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 742
;742:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $413
line 743
;743:	{
line 745
;744:		// find favorite address in refresh list
;745:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $418
line 746
;746:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13928
ADDP4
ARGP4
CNSTI4 264
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
NEI4 $422
line 747
;747:				break;
ADDRGP4 $420
JUMPV
LABELV $422
LABELV $419
line 745
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $421
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $418
LABELV $420
line 749
;748:
;749:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $425
line 750
;750:		{
line 752
;751:			// not in list, add it
;752:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
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
line 753
;753:		}
LABELV $425
line 754
;754:	}
LABELV $414
line 742
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $416
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $413
line 755
;755:}
LABELV $411
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 5344 12
line 766
;756:
;757:
;758:/*
;759:=================
;760:ArenaServers_LoadFavorites
;761:
;762:Load cvar address book entries into local lists.
;763:=================
;764:*/
;765:void ArenaServers_LoadFavorites( void )
;766:{
line 775
;767:	int				i;
;768:	int				j;
;769:	int				numtempitems;
;770:	char			emptyinfo[MAX_INFO_STRING];
;771:	char			adrstr[MAX_ADDRESSLENGTH];
;772:	servernode_t	templist[MAX_FAVORITESERVERS];
;773:	qboolean		found;
;774:
;775:	found        = qfalse;
ADDRLP4 4300
CNSTI4 0
ASGNI4
line 776
;776:	emptyinfo[0] = '\0';
ADDRLP4 4304
CNSTI1 0
ASGNI1
line 779
;777:
;778:	// copy the old
;779:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 4224
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 780
;780:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 783
;781:
;782:	// clear the current for sync
;783:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4224
ARGI4
ADDRGP4 memset
CALLP4
pop
line 784
;784:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 787
;785:
;786:	// resync existing results with new or deleted cvars
;787:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 4296
CNSTI4 0
ASGNI4
LABELV $429
line 788
;788:	{
line 789
;789:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $433
ARGP4
ADDRLP4 4296
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 5328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 5328
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 790
;790:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $434
line 791
;791:			continue;
ADDRGP4 $430
JUMPV
LABELV $434
line 795
;792:
;793:		// quick sanity check to avoid slow domain name resolving
;794:		// first character must be numeric
;795:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 5332
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 5332
INDIRI4
CNSTI4 48
LTI4 $438
ADDRLP4 5332
INDIRI4
CNSTI4 57
LEI4 $436
LABELV $438
line 796
;796:			continue;
ADDRGP4 $430
JUMPV
LABELV $436
line 801
;797:
;798:		// favorite server addresses must be maintained outside refresh list
;799:		// this mimics local and global netadr's stored in client
;800:		// these can be fetched to fill ping list
;801:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
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
line 804
;802:
;803:		// find this server in the old list
;804:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $443
JUMPV
LABELV $440
line 805
;805:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
CNSTI4 264
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 5336
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 5336
INDIRI4
CNSTI4 0
NEI4 $444
line 806
;806:				break;
ADDRGP4 $442
JUMPV
LABELV $444
LABELV $441
line 804
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $443
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $440
LABELV $442
line 808
;807:
;808:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $446
line 809
;809:		{
line 811
;810:			// found server - add exisiting results
;811:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRLP4 5340
CNSTI4 264
ASGNI4
ADDRLP4 5340
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 5340
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 5340
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 812
;812:			found = qtrue;
ADDRLP4 4300
CNSTI4 1
ASGNI4
line 813
;813:		}
ADDRGP4 $447
JUMPV
LABELV $446
line 815
;814:		else
;815:		{
line 817
;816:			// add new server
;817:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
CNSTI4 264
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
line 818
;818:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 5340
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
CNSTI4 264
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist+228
ADDP4
ADDRLP4 5340
INDIRI4
ASGNI4
line 819
;819:		}
LABELV $447
line 821
;820:
;821:		g_numfavoriteservers++;
ADDRLP4 5340
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 5340
INDIRP4
ADDRLP4 5340
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 822
;822:	}
LABELV $430
line 787
ADDRLP4 4296
ADDRLP4 4296
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4296
INDIRI4
CNSTI4 16
LTI4 $429
line 824
;823:
;824:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+14952
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 826
;825:
;826:	if (!found)
ADDRLP4 4300
INDIRI4
CNSTI4 0
NEI4 $450
line 827
;827:	{
line 830
;828:		// no results were found, reset server list
;829:		// list will be automatically refreshed when selected
;830:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 831
;831:	}
LABELV $450
line 832
;832:}
LABELV $428
endproc ArenaServers_LoadFavorites 5344 12
proc ArenaServers_StopRefresh 0 16
line 841
;833:
;834:
;835:/*
;836:=================
;837:ArenaServers_StopRefresh
;838:=================
;839:*/
;840:static void ArenaServers_StopRefresh( void )
;841:{
line 842
;842:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
NEI4 $453
line 844
;843:		// not currently refreshing
;844:		return;
ADDRGP4 $452
JUMPV
LABELV $453
line 846
;845:
;846:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+13912
CNSTI4 0
ASGNI4
line 848
;847:
;848:	if (g_servertype == AS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $457
line 849
;849:	{
line 851
;850:		// nonresponsive favorites must be shown
;851:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 852
;852:	}
LABELV $457
line 855
;853:
;854:	// final tally
;855:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+13896
INDIRI4
CNSTI4 0
LTI4 $459
line 856
;856:	{
line 857
;857:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 858
;858:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 859
;859:	}
LABELV $459
line 862
;860:	
;861:	// sort
;862:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ARGI4
CNSTI4 264
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 864
;863:
;864:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 865
;865:}
LABELV $452
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 874
;866:
;867:
;868:/*
;869:=================
;870:ArenaServers_DoRefresh
;871:=================
;872:*/
;873:static void ArenaServers_DoRefresh( void )
;874:{
line 882
;875:	int		i;
;876:	int		j;
;877:	int		time;
;878:	int		maxPing;
;879:	char	adrstr[MAX_ADDRESSLENGTH];
;880:	char	info[MAX_INFO_STRING];
;881:
;882:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13924
INDIRI4
GEI4 $469
line 883
;883:	{
line 884
;884:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $473
line 885
;885:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $475
line 886
;886:				if (!trap_LAN_GetServerCount(g_servertype)) {
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
NEI4 $477
line 887
;887:					return;
ADDRGP4 $468
JUMPV
LABELV $477
line 889
;888:				}
;889:			}
LABELV $475
line 890
;890:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
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
GEI4 $479
line 892
;891:			  // still waiting for response
;892:			  return;
ADDRGP4 $468
JUMPV
LABELV $479
line 894
;893:			}
;894:	  }
LABELV $473
line 895
;895:	}
LABELV $469
line 897
;896:
;897:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13916
INDIRI4
GEI4 $481
line 898
;898:	{
line 900
;899:		// wait for time trigger
;900:		return;
ADDRGP4 $468
JUMPV
LABELV $481
line 904
;901:	}
;902:
;903:	// trigger at 10Hz intervals
;904:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+13916
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 907
;905:
;906:	// process ping results
;907:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 908
;908:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $487
line 909
;909:	{
line 910
;910:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
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
line 911
;911:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $491
line 912
;912:		{
line 914
;913:			// ignore empty or pending pings
;914:			continue;
ADDRGP4 $488
JUMPV
LABELV $491
line 918
;915:		}
;916:
;917:		// find ping result in our local list
;918:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $493
line 919
;919:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
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
NEI4 $497
line 920
;920:				break;
ADDRGP4 $495
JUMPV
LABELV $497
LABELV $494
line 918
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $493
LABELV $495
line 922
;921:
;922:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $500
line 923
;923:		{
line 925
;924:			// found it
;925:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $502
line 926
;926:			{
line 927
;927:				time = uis.realtime - g_arenaservers.pinglist[j].start;
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
line 928
;928:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $507
line 929
;929:				{
line 931
;930:					// still waiting
;931:					continue;
ADDRGP4 $488
JUMPV
LABELV $507
line 933
;932:				}
;933:			}
LABELV $502
line 935
;934:
;935:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $509
line 936
;936:			{
line 938
;937:				// stale it out
;938:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 939
;939:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 940
;940:			}
ADDRGP4 $510
JUMPV
LABELV $509
line 942
;941:			else
;942:			{
line 943
;943:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
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
line 944
;944:			}
LABELV $510
line 947
;945:
;946:			// insert ping results
;947:			ArenaServers_Insert( adrstr, info, time );
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
line 950
;948:
;949:			// clear this query from internal list
;950:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
CNSTI1 0
ASGNI1
line 951
;951:   		}
LABELV $500
line 954
;952:
;953:		// clear this query from external list
;954:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 955
;955:	}
LABELV $488
line 908
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $487
line 959
;956:
;957:	// get results of servers query
;958:	// counts can increase as servers respond
;959:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $512
line 960
;960:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+14952
INDIRI4
ASGNI4
line 961
;961:	} else {
ADDRGP4 $513
JUMPV
LABELV $512
line 962
;962:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
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
line 963
;963:	}
LABELV $513
line 970
;964:
;965://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;966://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;967:
;968:	// send ping requests in reasonable bursts
;969:	// iterate ping through all found servers
;970:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $520
JUMPV
LABELV $517
line 971
;971:	{
line 972
;972:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $523
line 973
;973:		{
line 975
;974:			// ping queue is full
;975:			break;
ADDRGP4 $519
JUMPV
LABELV $523
line 979
;976:		}
;977:
;978:		// find empty slot
;979:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $525
line 980
;980:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $529
line 981
;981:				break;
ADDRGP4 $527
JUMPV
LABELV $529
LABELV $526
line 979
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $525
LABELV $527
line 983
;982:
;983:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $532
line 985
;984:			// no empty slots available yet - wait for timeout
;985:			break;
ADDRGP4 $519
JUMPV
LABELV $532
line 989
;986:
;987:		// get an address to ping
;988:
;989:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $534
line 990
;990:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
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
line 991
;991:		} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 992
;992:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
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
line 993
;993:		}
LABELV $535
line 995
;994:
;995:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
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
line 996
;996:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 998
;997:
;998:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $543
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
line 1001
;999:		
;1000:		// advance to next server
;1001:		g_arenaservers.currentping++;
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
line 1002
;1002:	}
LABELV $518
line 970
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $520
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $545
ADDRGP4 g_arenaservers+13908
INDIRI4
ADDRGP4 g_arenaservers+13896
INDIRI4
LTI4 $517
LABELV $545
LABELV $519
line 1004
;1003:
;1004:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $546
line 1005
;1005:	{
line 1007
;1006:		// all pings completed
;1007:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1008
;1008:		return;
ADDRGP4 $468
JUMPV
LABELV $546
line 1012
;1009:	}
;1010:
;1011:	// update the user interface with ping status
;1012:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1013
;1013:}
LABELV $468
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 1022
;1014:
;1015:
;1016:/*
;1017:=================
;1018:ArenaServers_StartRefresh
;1019:=================
;1020:*/
;1021:static void ArenaServers_StartRefresh( void )
;1022:{
line 1026
;1023:	int		i;
;1024:	char	myargs[32], protocol[32];
;1025:
;1026:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
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
line 1028
;1027:
;1028:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $551
line 1029
;1029:	{
line 1030
;1030:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1992
ADDP4
CNSTI1 0
ASGNI1
line 1031
;1031:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 1032
;1032:	}
LABELV $552
line 1028
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $551
line 1034
;1033:
;1034:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+13912
CNSTI4 1
ASGNI4
line 1035
;1035:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+13908
CNSTI4 0
ASGNI4
line 1036
;1036:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+13916
CNSTI4 0
ASGNI4
line 1037
;1037:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+13900
INDIRP4
CNSTI4 0
ASGNI4
line 1038
;1038:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+13896
CNSTI4 0
ASGNI4
line 1041
;1039:
;1040:	// allow max 5 seconds for responses
;1041:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+13924
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1044
;1042:
;1043:	// place menu in zeroed state
;1044:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1046
;1045:
;1046:	if( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $563
line 1047
;1047:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $565
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1048
;1048:		return;
ADDRGP4 $548
JUMPV
LABELV $563
line 1051
;1049:	}
;1050:
;1051:	if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $568
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $566
LABELV $568
line 1052
;1052:		if( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $569
line 1053
;1053:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1054
;1054:		}
ADDRGP4 $570
JUMPV
LABELV $569
line 1055
;1055:		else {
line 1056
;1056:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1057
;1057:		}
LABELV $570
line 1059
;1058:
;1059:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+552+64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $571
ADDRLP4 72
INDIRI4
CNSTI4 4
GTI4 $571
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $584
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $584
address $575
address $576
address $578
address $580
address $582
code
LABELV $571
LABELV $575
line 1062
;1060:		default:
;1061:		case GAMES_ALL:
;1062:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 1063
;1063:			break;
ADDRGP4 $572
JUMPV
LABELV $576
line 1066
;1064:
;1065:		case GAMES_FFA:
;1066:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $577
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1067
;1067:			break;
ADDRGP4 $572
JUMPV
LABELV $578
line 1070
;1068:
;1069:		case GAMES_TEAMPLAY:
;1070:			strcpy( myargs, " team" );
ADDRLP4 36
ARGP4
ADDRGP4 $579
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1071
;1071:			break;
ADDRGP4 $572
JUMPV
LABELV $580
line 1074
;1072:
;1073:		case GAMES_TOURNEY:
;1074:			strcpy( myargs, " tourney" );
ADDRLP4 36
ARGP4
ADDRGP4 $581
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1075
;1075:			break;
ADDRGP4 $572
JUMPV
LABELV $582
line 1078
;1076:
;1077:		case GAMES_CTF:
;1078:			strcpy( myargs, " ctf" );
ADDRLP4 36
ARGP4
ADDRGP4 $583
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1079
;1079:			break;
LABELV $572
line 1083
;1080:		}
;1081:
;1082:
;1083:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $585
line 1084
;1084:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $587
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1085
;1085:		}
LABELV $585
line 1087
;1086:
;1087:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $588
line 1088
;1088:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $590
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1089
;1089:		}
LABELV $588
line 1091
;1090:
;1091:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1092
;1092:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $591
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1097
;1093:		
;1094:
;1095:		// Shafe - Trep Here is where we ditch the whole AS_MPLAYER Thing and replace it with multimaster support
;1096:		// i will define which hardcoded master to use 0 is default or sv_master1
;1097:		i = ui_browserMasterNum.integer;
ADDRLP4 0
ADDRGP4 ui_browserMasterNum+12
INDIRI4
ASGNI4
line 1099
;1098:		// End Shafe
;1099:		Com_Printf("Sending to master number %d \n", i);
ADDRGP4 $593
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1100
;1100:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $594
line 1101
;1101:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", i, protocol, myargs ));
ADDRGP4 $596
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
line 1102
;1102:		}
ADDRGP4 $595
JUMPV
LABELV $594
line 1103
;1103:		else {
line 1104
;1104:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", i, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $598
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $597
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
line 1105
;1105:		}
LABELV $595
line 1106
;1106:	}
LABELV $566
line 1107
;1107:}
LABELV $548
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1116
;1108:
;1109:
;1110:/*
;1111:=================
;1112:ArenaServers_SaveChanges
;1113:=================
;1114:*/
;1115:void ArenaServers_SaveChanges( void )
;1116:{
line 1119
;1117:	int	i;
;1118:
;1119:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $603
JUMPV
LABELV $600
line 1120
;1120:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $433
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
LABELV $601
line 1119
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $603
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14952
INDIRI4
LTI4 $600
line 1122
;1121:
;1122:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $609
JUMPV
LABELV $606
line 1123
;1123:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $433
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
LABELV $607
line 1122
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $609
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $606
line 1124
;1124:}
LABELV $599
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1132
;1125:
;1126:
;1127:/*
;1128:=================
;1129:ArenaServers_Sort
;1130:=================
;1131:*/
;1132:void ArenaServers_Sort( int type ) {
line 1133
;1133:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $611
line 1134
;1134:		return;
ADDRGP4 $610
JUMPV
LABELV $611
line 1137
;1135:	}
;1136:
;1137:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1138
;1138:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13904
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ARGI4
CNSTI4 264
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1139
;1139:}
LABELV $610
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 20 8
line 1148
;1140:
;1141:
;1142:/*
;1143:=================
;1144:ArenaServers_SetType
;1145:=================
;1146:*/
;1147:void ArenaServers_SetType( int type )
;1148:{
line 1149
;1149:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $616
line 1150
;1150:		return;
ADDRGP4 $615
JUMPV
LABELV $616
line 1152
;1151:
;1152:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1154
;1153:
;1154:	switch( type ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $618
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $618
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $644
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $644
address $620
address $638
address $626
address $632
code
LABELV $618
LABELV $620
line 1157
;1155:	default:
;1156:	case AS_LOCAL:
;1157:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
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
line 1158
;1158:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_localserverlist
ASGNP4
line 1159
;1159:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numlocalservers
ASGNP4
line 1160
;1160:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1161
;1161:		break;
ADDRGP4 $619
JUMPV
LABELV $626
line 1164
;1162:
;1163:	case AS_GLOBAL:
;1164:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
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
line 1165
;1165:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_globalserverlist
ASGNP4
line 1166
;1166:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numglobalservers
ASGNP4
line 1167
;1167:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1168
;1168:		break;
ADDRGP4 $619
JUMPV
LABELV $632
line 1171
;1169:
;1170:	case AS_FAVORITES:
;1171:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
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
line 1172
;1172:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1173
;1173:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1174
;1174:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 16
ASGNI4
line 1175
;1175:		break;
ADDRGP4 $619
JUMPV
LABELV $638
line 1178
;1176:
;1177:	case AS_MPLAYER:
;1178:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
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
line 1179
;1179:		g_arenaservers.serverlist = g_mplayerserverlist;
ADDRGP4 g_arenaservers+13904
ADDRGP4 g_mplayerserverlist
ASGNP4
line 1180
;1180:		g_arenaservers.numservers = &g_nummplayerservers;
ADDRGP4 g_arenaservers+13900
ADDRGP4 g_nummplayerservers
ASGNP4
line 1181
;1181:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13920
CNSTI4 128
ASGNI4
line 1182
;1182:		break;
LABELV $619
line 1186
;1183:		
;1184:	}
;1185:
;1186:	if( !*g_arenaservers.numservers ) {
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $645
line 1187
;1187:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1188
;1188:	}
ADDRGP4 $646
JUMPV
LABELV $645
line 1189
;1189:	else {
line 1191
;1190:		// avoid slow operation, use existing results
;1191:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13908
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 1192
;1192:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13896
ADDRGP4 g_arenaservers+13900
INDIRP4
INDIRI4
ASGNI4
line 1193
;1193:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1194
;1194:	}
LABELV $646
line 1195
;1195:	strcpy(g_arenaservers.status.string,"hit refresh to update");
ADDRGP4 g_arenaservers+1320+60
INDIRP4
ARGP4
ADDRGP4 $654
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1196
;1196:}
LABELV $615
endproc ArenaServers_SetType 20 8
proc Punkbuster_ConfirmEnable 8 12
line 1203
;1197:
;1198:/*
;1199:=================
;1200:PunkBuster_Confirm
;1201:=================
;1202:*/
;1203:static void Punkbuster_ConfirmEnable( qboolean result ) {
line 1204
;1204:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $656
line 1205
;1205:	{		
line 1206
;1206:		trap_SetPbClStatus(1);
CNSTI4 1
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1207
;1207:	}
LABELV $656
line 1208
;1208:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $660
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
line 1209
;1209:}
LABELV $655
endproc Punkbuster_ConfirmEnable 8 12
proc Punkbuster_ConfirmDisable 8 12
line 1211
;1210:
;1211:static void Punkbuster_ConfirmDisable( qboolean result ) {
line 1212
;1212:	if (result)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $662
line 1213
;1213:	{
line 1214
;1214:		trap_SetPbClStatus(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 1215
;1215:		UI_Message( punkbuster_msg );
ADDRGP4 punkbuster_msg
ARGP4
ADDRGP4 UI_Message
CALLV
pop
line 1216
;1216:	}
LABELV $662
line 1217
;1217:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $660
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
line 1218
;1218:}
LABELV $661
endproc Punkbuster_ConfirmDisable 8 12
proc ArenaServers_Event 12 16
line 1225
;1219:
;1220:/*
;1221:=================
;1222:ArenaServers_Event
;1223:=================
;1224:*/
;1225:static void ArenaServers_Event( void* ptr, int event ) {
line 1229
;1226:	int		id;
;1227:	int value;
;1228:
;1229:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1231
;1230:
;1231:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $667
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $667
line 1232
;1232:		return;
ADDRGP4 $666
JUMPV
LABELV $667
line 1235
;1233:	}
;1234:
;1235:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $669
ADDRLP4 0
INDIRI4
CNSTI4 25
GTI4 $669
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $725-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $725
address $671
address $681
address $687
address $693
address $699
address $705
address $708
address $710
address $712
address $713
address $714
address $715
address $716
address $717
address $718
address $677
code
LABELV $671
line 1237
;1236:	case ID_MASTER:
;1237:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+360+64
INDIRI4
ASGNI4
line 1238
;1238:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $674
line 1239
;1239:		{
line 1240
;1240:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1241
;1241:		}
LABELV $674
line 1242
;1242:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $676
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1243
;1243:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1244
;1244:		break;
ADDRGP4 $670
JUMPV
LABELV $677
line 1247
;1245:
;1246:	case ID_MSERVER:  // Shafe
;1247:		trap_Cvar_SetValue( "ui_browserMasterNum", g_arenaservers.mserver.curvalue );	
ADDRGP4 $678
ARGP4
ADDRGP4 g_arenaservers+456+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1248
;1248:		break;
ADDRGP4 $670
JUMPV
LABELV $681
line 1251
;1249:		
;1250:	case ID_GAMETYPE:
;1251:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $682
ARGP4
ADDRGP4 g_arenaservers+552+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1252
;1252:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+552+64
INDIRI4
ASGNI4
line 1253
;1253:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1254
;1254:		break;
ADDRGP4 $670
JUMPV
LABELV $687
line 1257
;1255:
;1256:	case ID_SORTKEY:
;1257:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $688
ARGP4
ADDRGP4 g_arenaservers+648+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1258
;1258:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+648+64
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1259
;1259:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1260
;1260:		break;
ADDRGP4 $670
JUMPV
LABELV $693
line 1263
;1261:
;1262:	case ID_SHOW_FULL:
;1263:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $694
ARGP4
ADDRGP4 g_arenaservers+744+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1264
;1264:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+744+60
INDIRI4
ASGNI4
line 1265
;1265:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1266
;1266:		break;
ADDRGP4 $670
JUMPV
LABELV $699
line 1269
;1267:
;1268:	case ID_SHOW_EMPTY:
;1269:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $700
ARGP4
ADDRGP4 g_arenaservers+808+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1270
;1270:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+808+60
INDIRI4
ASGNI4
line 1271
;1271:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1272
;1272:		break;
ADDRGP4 $670
JUMPV
LABELV $705
line 1275
;1273:
;1274:	case ID_LIST:
;1275:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $670
line 1276
;1276:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1277
;1277:		}
line 1278
;1278:		break;
ADDRGP4 $670
JUMPV
LABELV $708
line 1281
;1279:
;1280:	case ID_SCROLL_UP:
;1281:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+872
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1282
;1282:		break;
ADDRGP4 $670
JUMPV
LABELV $710
line 1285
;1283:
;1284:	case ID_SCROLL_DOWN:
;1285:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+872
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1286
;1286:		break;
ADDRGP4 $670
JUMPV
LABELV $712
line 1289
;1287:
;1288:	case ID_BACK:
;1289:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1290
;1290:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1291
;1291:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1292
;1292:		break;
ADDRGP4 $670
JUMPV
LABELV $713
line 1295
;1293:
;1294:	case ID_REFRESH:
;1295:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1296
;1296:		break;
ADDRGP4 $670
JUMPV
LABELV $714
line 1299
;1297:
;1298:	case ID_SPECIFY:
;1299:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1300
;1300:		break;
ADDRGP4 $670
JUMPV
LABELV $715
line 1303
;1301:
;1302:	case ID_CREATE:
;1303:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1304
;1304:		break;
ADDRGP4 $670
JUMPV
LABELV $716
line 1307
;1305:
;1306:	case ID_CONNECT:
;1307:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1308
;1308:		break;
ADDRGP4 $670
JUMPV
LABELV $717
line 1311
;1309:
;1310:	case ID_REMOVE:
;1311:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1312
;1312:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1313
;1313:		break;
ADDRGP4 $670
JUMPV
LABELV $718
line 1316
;1314:	
;1315:	case ID_PUNKBUSTER:
;1316:		if (g_arenaservers.punkbuster.curvalue)			
ADDRGP4 g_arenaservers+14956+64
INDIRI4
CNSTI4 0
EQI4 $719
line 1317
;1317:		{
line 1318
;1318:			UI_ConfirmMenu_Style( "Enable Punkbuster?",  UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmEnable );
ADDRGP4 $723
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
line 1319
;1319:		}
ADDRGP4 $670
JUMPV
LABELV $719
line 1321
;1320:		else
;1321:		{
line 1322
;1322:			UI_ConfirmMenu_Style( "Disable Punkbuster?", UI_CENTER|UI_INVERSE|UI_SMALLFONT, (voidfunc_f)NULL, Punkbuster_ConfirmDisable );
ADDRGP4 $724
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
line 1323
;1323:		}
line 1324
;1324:		break;
LABELV $669
LABELV $670
line 1326
;1325:	}
;1326:}
LABELV $666
endproc ArenaServers_Event 12 16
proc ArenaServers_MenuDraw 0 4
line 1335
;1327:
;1328:
;1329:/*
;1330:=================
;1331:ArenaServers_MenuDraw
;1332:=================
;1333:*/
;1334:static void ArenaServers_MenuDraw( void )
;1335:{
line 1336
;1336:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $728
line 1337
;1337:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $728
line 1339
;1338:
;1339:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1340
;1340:}
LABELV $727
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1348
;1341:
;1342:
;1343:/*
;1344:=================
;1345:ArenaServers_MenuKey
;1346:=================
;1347:*/
;1348:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1349
;1349:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $732
ADDRGP4 g_arenaservers+13912
INDIRI4
CNSTI4 0
EQI4 $732
line 1350
;1350:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1351
;1351:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $731
JUMPV
LABELV $732
line 1354
;1352:	}
;1353:
;1354:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $738
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $735
LABELV $738
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $735
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
NEU4 $735
line 1355
;1355:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1356
;1356:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1357
;1357:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1358
;1358:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $731
JUMPV
LABELV $735
line 1361
;1359:	}
;1360:
;1361:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $741
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $739
LABELV $741
line 1362
;1362:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1363
;1363:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1364
;1364:	}
LABELV $739
line 1367
;1365:
;1366:
;1367:	return Menu_DefaultKey( &g_arenaservers.menu, key );
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
LABELV $731
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $743
skip 64
code
proc ArenaServers_MenuInit 48 16
line 1376
;1368:}
;1369:
;1370:
;1371:/*
;1372:=================
;1373:ArenaServers_MenuInit
;1374:=================
;1375:*/
;1376:static void ArenaServers_MenuInit( void ) {
line 1384
;1377:	int			i;
;1378:	int			type;
;1379:	int			y;
;1380:	int			value;
;1381:	static char	statusbuffer[MAX_STATUSLENGTH];
;1382:
;1383:	// zero set all our globals
;1384:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15756
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1386
;1385:
;1386:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1388
;1387:
;1388:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1389
;1389:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1390
;1390:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1391
;1391:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1393
;1392:
;1393:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 10
ASGNI4
line 1394
;1394:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1395
;1395:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1396
;1396:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1397
;1397:	g_arenaservers.banner.string  		= "TREPIDATION SERVERS";
ADDRGP4 g_arenaservers+288+60
ADDRGP4 $757
ASGNP4
line 1398
;1398:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+288+64
CNSTI4 1
ASGNI4
line 1399
;1399:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+288+68
ADDRGP4 color_white
ASGNP4
line 1403
;1400:
;1401:
;1402:
;1403:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1404
;1404:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+360
CNSTI4 3
ASGNI4
line 1405
;1405:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+360+4
ADDRGP4 $765
ASGNP4
line 1406
;1406:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+360+44
CNSTU4 262
ASGNU4
line 1407
;1407:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+360+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1408
;1408:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+360+8
CNSTI4 10
ASGNI4
line 1409
;1409:	g_arenaservers.master.generic.x				= 275;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+360+12
CNSTI4 275
ASGNI4
line 1410
;1410:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+360+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1411
;1411:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+360+76
ADDRGP4 master_items
ASGNP4
line 1414
;1412:
;1413:	// Shafe - Multi Masters
;1414:	y += SMALLCHAR_HEIGHT;	
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1415
;1415:	g_arenaservers.mserver.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+456
CNSTI4 3
ASGNI4
line 1416
;1416:	g_arenaservers.mserver.generic.name			= "Master Server:";
ADDRGP4 g_arenaservers+456+4
ADDRGP4 $781
ASGNP4
line 1417
;1417:	g_arenaservers.mserver.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_LEFT_JUSTIFY;
ADDRGP4 g_arenaservers+456+44
CNSTU4 262
ASGNU4
line 1418
;1418:	g_arenaservers.mserver.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1419
;1419:	g_arenaservers.mserver.generic.id			= ID_MSERVER;
ADDRGP4 g_arenaservers+456+8
CNSTI4 25
ASGNI4
line 1420
;1420:	g_arenaservers.mserver.generic.x				= 275;  // 320 -- Bleh Shafe
ADDRGP4 g_arenaservers+456+12
CNSTI4 275
ASGNI4
line 1421
;1421:	g_arenaservers.mserver.generic.y				= y;
ADDRGP4 g_arenaservers+456+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1422
;1422:	g_arenaservers.mserver.itemnames				= master_servers;
ADDRGP4 g_arenaservers+456+76
ADDRGP4 master_servers
ASGNP4
line 1424
;1423:
;1424:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1425
;1425:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+552
CNSTI4 3
ASGNI4
line 1426
;1426:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+552+4
ADDRGP4 $797
ASGNP4
line 1427
;1427:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+552+44
CNSTU4 258
ASGNU4
line 1428
;1428:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1429
;1429:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+552+8
CNSTI4 11
ASGNI4
line 1430
;1430:	g_arenaservers.gametype.generic.x			= 275;
ADDRGP4 g_arenaservers+552+12
CNSTI4 275
ASGNI4
line 1431
;1431:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+552+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1432
;1432:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+552+76
ADDRGP4 servertype_items
ASGNP4
line 1434
;1433:
;1434:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1435
;1435:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+648
CNSTI4 3
ASGNI4
line 1436
;1436:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+648+4
ADDRGP4 $813
ASGNP4
line 1437
;1437:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+648+44
CNSTU4 258
ASGNU4
line 1438
;1438:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+648+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1439
;1439:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+648+8
CNSTI4 12
ASGNI4
line 1440
;1440:	g_arenaservers.sortkey.generic.x			= 275;
ADDRGP4 g_arenaservers+648+12
CNSTI4 275
ASGNI4
line 1441
;1441:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+648+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1442
;1442:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+648+76
ADDRGP4 sortkey_items
ASGNP4
line 1444
;1443:
;1444:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1445
;1445:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+744
CNSTI4 5
ASGNI4
line 1446
;1446:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+744+4
ADDRGP4 $829
ASGNP4
line 1447
;1447:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+744+44
CNSTU4 258
ASGNU4
line 1448
;1448:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+744+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1449
;1449:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+744+8
CNSTI4 13
ASGNI4
line 1450
;1450:	g_arenaservers.showfull.generic.x			= 275;
ADDRGP4 g_arenaservers+744+12
CNSTI4 275
ASGNI4
line 1451
;1451:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+744+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1453
;1452:
;1453:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1454
;1454:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+808
CNSTI4 5
ASGNI4
line 1455
;1455:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+808+4
ADDRGP4 $843
ASGNP4
line 1456
;1456:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+808+44
CNSTU4 258
ASGNU4
line 1457
;1457:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+808+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1458
;1458:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+808+8
CNSTI4 14
ASGNI4
line 1459
;1459:	g_arenaservers.showempty.generic.x			= 275;
ADDRGP4 g_arenaservers+808+12
CNSTI4 275
ASGNI4
line 1460
;1460:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+808+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1462
;1461:
;1462:	y += 3 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 48
ADDI4
ASGNI4
line 1463
;1463:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+872
CNSTI4 8
ASGNI4
line 1464
;1464:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+872+44
CNSTU4 128
ASGNU4
line 1465
;1465:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+872+8
CNSTI4 15
ASGNI4
line 1466
;1466:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+872+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1467
;1467:	g_arenaservers.list.generic.x				= 10; //72;
ADDRGP4 g_arenaservers+872+12
CNSTI4 10
ASGNI4
line 1468
;1468:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+872+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1469
;1469:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+872+80
CNSTI4 68
ASGNI4
line 1470
;1470:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+872+84
CNSTI4 11
ASGNI4
line 1471
;1471:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+872+76
ADDRGP4 g_arenaservers+13384
ASGNP4
line 1472
;1472:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $872
line 1473
;1473:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
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
line 1474
;1474:	}
LABELV $873
line 1472
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $872
line 1476
;1475:
;1476:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+968
CNSTI4 6
ASGNI4
line 1477
;1477:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+968+44
CNSTU4 16388
ASGNU4
line 1478
;1478:	g_arenaservers.mappic.generic.x				= 10; //72;
ADDRGP4 g_arenaservers+968+12
CNSTI4 10
ASGNI4
line 1479
;1479:	g_arenaservers.mappic.generic.y				= 80;
ADDRGP4 g_arenaservers+968+16
CNSTI4 80
ASGNI4
line 1480
;1480:	g_arenaservers.mappic.width					= 128;
ADDRGP4 g_arenaservers+968+76
CNSTI4 128
ASGNI4
line 1481
;1481:	g_arenaservers.mappic.height				= 96;
ADDRGP4 g_arenaservers+968+80
CNSTI4 96
ASGNI4
line 1482
;1482:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+968+64
ADDRGP4 $891
ASGNP4
line 1484
;1483:
;1484:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1056
CNSTI4 6
ASGNI4
line 1485
;1485:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+1056+4
ADDRGP4 $895
ASGNP4
line 1486
;1486:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+1056+44
CNSTU4 16388
ASGNU4
line 1487
;1487:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1056+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1488
;1488:	g_arenaservers.arrows.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1056+12
CNSTI4 560
ASGNI4
line 1489
;1489:	g_arenaservers.arrows.generic.y				= 240-64+16;
ADDRGP4 g_arenaservers+1056+16
CNSTI4 192
ASGNI4
line 1490
;1490:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+1056+76
CNSTI4 64
ASGNI4
line 1491
;1491:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+1056+80
CNSTI4 128
ASGNI4
line 1493
;1492:
;1493:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1144
CNSTI4 6
ASGNI4
line 1494
;1494:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1144+44
CNSTU4 2308
ASGNU4
line 1495
;1495:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+1144+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1496
;1496:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1144+8
CNSTI4 16
ASGNI4
line 1497
;1497:	g_arenaservers.up.generic.x					= 512+48;
ADDRGP4 g_arenaservers+1144+12
CNSTI4 560
ASGNI4
line 1498
;1498:	g_arenaservers.up.generic.y					= 240-64+16;
ADDRGP4 g_arenaservers+1144+16
CNSTI4 192
ASGNI4
line 1499
;1499:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+1144+76
CNSTI4 64
ASGNI4
line 1500
;1500:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+1144+80
CNSTI4 64
ASGNI4
line 1501
;1501:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1144+60
ADDRGP4 $925
ASGNP4
line 1503
;1502:
;1503:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1232
CNSTI4 6
ASGNI4
line 1504
;1504:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1232+44
CNSTU4 2308
ASGNU4
line 1505
;1505:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1232+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1506
;1506:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1232+8
CNSTI4 17
ASGNI4
line 1507
;1507:	g_arenaservers.down.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1232+12
CNSTI4 560
ASGNI4
line 1508
;1508:	g_arenaservers.down.generic.y				= 240+16;
ADDRGP4 g_arenaservers+1232+16
CNSTI4 256
ASGNI4
line 1509
;1509:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+1232+76
CNSTI4 64
ASGNI4
line 1510
;1510:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+1232+80
CNSTI4 64
ASGNI4
line 1511
;1511:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1232+60
ADDRGP4 $943
ASGNP4
line 1513
;1512:
;1513:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1514
;1514:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1320
CNSTI4 7
ASGNI4
line 1515
;1515:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1320+12
CNSTI4 320
ASGNI4
line 1516
;1516:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1320+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1517
;1517:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1320+60
ADDRGP4 $743
ASGNP4
line 1518
;1518:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1320+64
CNSTI4 17
ASGNI4
line 1519
;1519:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1320+68
ADDRGP4 menu_text_color
ASGNP4
line 1521
;1520:
;1521:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1522
;1522:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1392
CNSTI4 7
ASGNI4
line 1523
;1523:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1392+12
CNSTI4 320
ASGNI4
line 1524
;1524:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1392+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1525
;1525:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1392+60
ADDRGP4 $213
ASGNP4
line 1526
;1526:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1392+64
CNSTI4 17
ASGNI4
line 1527
;1527:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1392+68
ADDRGP4 text_color_normal
ASGNP4
line 1529
;1528:
;1529:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1464
CNSTI4 6
ASGNI4
line 1530
;1530:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1464+4
ADDRGP4 $969
ASGNP4
line 1531
;1531:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1464+44
CNSTU4 260
ASGNU4
line 1532
;1532:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1464+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1533
;1533:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1464+8
CNSTI4 23
ASGNI4
line 1534
;1534:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1464+12
CNSTI4 450
ASGNI4
line 1535
;1535:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1464+16
CNSTI4 86
ASGNI4
line 1536
;1536:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1464+76
CNSTI4 96
ASGNI4
line 1537
;1537:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1464+80
CNSTI4 48
ASGNI4
line 1538
;1538:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1464+60
ADDRGP4 $986
ASGNP4
line 1540
;1539:
;1540:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1552
CNSTI4 6
ASGNI4
line 1541
;1541:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1552+4
ADDRGP4 $990
ASGNP4
line 1542
;1542:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1552+44
CNSTU4 260
ASGNU4
line 1543
;1543:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1544
;1544:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1552+8
CNSTI4 18
ASGNI4
line 1545
;1545:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1552+12
CNSTI4 0
ASGNI4
line 1546
;1546:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1552+16
CNSTI4 416
ASGNI4
line 1547
;1547:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1552+76
CNSTI4 128
ASGNI4
line 1548
;1548:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1552+80
CNSTI4 64
ASGNI4
line 1549
;1549:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1552+60
ADDRGP4 $1007
ASGNP4
line 1551
;1550:
;1551:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1728
CNSTI4 6
ASGNI4
line 1552
;1552:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1728+4
ADDRGP4 $1011
ASGNP4
line 1553
;1553:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1728+44
CNSTU4 260
ASGNU4
line 1554
;1554:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1728+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1555
;1555:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1728+8
CNSTI4 20
ASGNI4
line 1556
;1556:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1728+12
CNSTI4 128
ASGNI4
line 1557
;1557:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1728+16
CNSTI4 416
ASGNI4
line 1558
;1558:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1728+76
CNSTI4 128
ASGNI4
line 1559
;1559:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1728+80
CNSTI4 64
ASGNI4
line 1560
;1560:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1728+60
ADDRGP4 $1028
ASGNP4
line 1562
;1561:
;1562:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1640
CNSTI4 6
ASGNI4
line 1563
;1563:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1640+4
ADDRGP4 $1032
ASGNP4
line 1564
;1564:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1640+44
CNSTU4 260
ASGNU4
line 1565
;1565:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1640+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1566
;1566:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1640+8
CNSTI4 19
ASGNI4
line 1567
;1567:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1640+12
CNSTI4 256
ASGNI4
line 1568
;1568:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1640+16
CNSTI4 416
ASGNI4
line 1569
;1569:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1640+76
CNSTI4 128
ASGNI4
line 1570
;1570:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1640+80
CNSTI4 64
ASGNI4
line 1571
;1571:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1640+60
ADDRGP4 $1049
ASGNP4
line 1573
;1572:
;1573:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1816
CNSTI4 6
ASGNI4
line 1574
;1574:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1816+4
ADDRGP4 $1053
ASGNP4
line 1575
;1575:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1816+44
CNSTU4 260
ASGNU4
line 1576
;1576:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1816+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1577
;1577:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1816+8
CNSTI4 21
ASGNI4
line 1578
;1578:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1816+12
CNSTI4 384
ASGNI4
line 1579
;1579:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1816+16
CNSTI4 416
ASGNI4
line 1580
;1580:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1816+76
CNSTI4 128
ASGNI4
line 1581
;1581:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1816+80
CNSTI4 64
ASGNI4
line 1582
;1582:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1816+60
ADDRGP4 $1070
ASGNP4
line 1584
;1583:
;1584:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1904
CNSTI4 6
ASGNI4
line 1585
;1585:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+1904+4
ADDRGP4 $1074
ASGNP4
line 1586
;1586:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1904+44
CNSTU4 272
ASGNU4
line 1587
;1587:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1904+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1588
;1588:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+1904+8
CNSTI4 22
ASGNI4
line 1589
;1589:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+1904+12
CNSTI4 640
ASGNI4
line 1590
;1590:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+1904+16
CNSTI4 416
ASGNI4
line 1591
;1591:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+1904+76
CNSTI4 128
ASGNI4
line 1592
;1592:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+1904+80
CNSTI4 64
ASGNI4
line 1593
;1593:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+1904+60
ADDRGP4 $1091
ASGNP4
line 1595
;1594:
;1595:	g_arenaservers.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+14956
CNSTI4 3
ASGNI4
line 1596
;1596:	g_arenaservers.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 g_arenaservers+14956+4
ADDRGP4 $1095
ASGNP4
line 1597
;1597:	g_arenaservers.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+14956+44
CNSTU4 258
ASGNU4
line 1598
;1598:	g_arenaservers.punkbuster.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+14956+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1599
;1599:	g_arenaservers.punkbuster.generic.id			= ID_PUNKBUSTER;
ADDRGP4 g_arenaservers+14956+8
CNSTI4 24
ASGNI4
line 1600
;1600:	g_arenaservers.punkbuster.generic.x				= 480+32;
ADDRGP4 g_arenaservers+14956+12
CNSTI4 512
ASGNI4
line 1601
;1601:	g_arenaservers.punkbuster.generic.y				= 144;
ADDRGP4 g_arenaservers+14956+16
CNSTI4 144
ASGNI4
line 1602
;1602:	g_arenaservers.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 g_arenaservers+14956+76
ADDRGP4 punkbuster_items
ASGNP4
line 1604
;1603:	
;1604:	g_arenaservers.pblogo.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+15668
CNSTI4 6
ASGNI4
line 1605
;1605:	g_arenaservers.pblogo.generic.name			= ART_PUNKBUSTER;
ADDRGP4 g_arenaservers+15668+4
ADDRGP4 $1111
ASGNP4
line 1606
;1606:	g_arenaservers.pblogo.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+15668+44
CNSTU4 16388
ASGNU4
line 1607
;1607:	g_arenaservers.pblogo.generic.x				= 526;
ADDRGP4 g_arenaservers+15668+12
CNSTI4 526
ASGNI4
line 1608
;1608:	g_arenaservers.pblogo.generic.y				= 176;
ADDRGP4 g_arenaservers+15668+16
CNSTI4 176
ASGNI4
line 1609
;1609:	g_arenaservers.pblogo.width					= 32;
ADDRGP4 g_arenaservers+15668+76
CNSTI4 32
ASGNI4
line 1610
;1610:	g_arenaservers.pblogo.height				= 16;
ADDRGP4 g_arenaservers+15668+80
CNSTI4 16
ASGNI4
line 1611
;1611:	g_arenaservers.pblogo.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+15668+64
ADDRGP4 $891
ASGNP4
line 1614
;1612:
;1613:	// Shafe
;1614:	g_arenaservers.lblname.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+15052
CNSTI4 6
ASGNI4
line 1615
;1615:	g_arenaservers.lblname.generic.name			= ART_LBLNAME;
ADDRGP4 g_arenaservers+15052+4
ADDRGP4 $1127
ASGNP4
line 1616
;1616:	g_arenaservers.lblname.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+15052+44
CNSTU4 16388
ASGNU4
line 1617
;1617:	g_arenaservers.lblname.generic.x			= 10;
ADDRGP4 g_arenaservers+15052+12
CNSTI4 10
ASGNI4
line 1618
;1618:	g_arenaservers.lblname.generic.y			= 176;
ADDRGP4 g_arenaservers+15052+16
CNSTI4 176
ASGNI4
line 1619
;1619:	g_arenaservers.lblname.width				= 800;
ADDRGP4 g_arenaservers+15052+76
CNSTI4 800
ASGNI4
line 1620
;1620:	g_arenaservers.lblname.height				= 16;
ADDRGP4 g_arenaservers+15052+80
CNSTI4 16
ASGNI4
line 1621
;1621:	g_arenaservers.lblname.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+15052+64
ADDRGP4 $891
ASGNP4
line 1625
;1622:
;1623:
;1624:	
;1625:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1627
;1626:
;1627:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1628
;1628:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mserver ); // Shafe - Multimaster
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1629
;1629:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1630
;1630:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1631
;1631:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1632
;1632:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1634
;1633:
;1634:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+968
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1635
;1635:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1636
;1636:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1637
;1637:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1392
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1638
;1638:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1056
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1639
;1639:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1144
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1640
;1640:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1642
;1641:
;1642:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1464
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1643
;1643:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1644
;1644:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1645
;1645:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1646
;1646:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1816
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1647
;1647:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1654
;1648:
;1649://	Shafe - Trep - No Punkbuster Garbage
;1650://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.punkbuster );
;1651://	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.pblogo );
;1652:	
;1653:	// Shafe - Trep Menu Headers
;1654:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.lblname);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+15052
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1656
;1655:
;1656:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1658
;1657:
;1658:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
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
line 1660
;1659:	// hack to get rid of MPlayer stuff
;1660:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1661
;1661:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1162
line 1662
;1662:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1162
line 1664
;1663:	
;1664:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+360+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1666
;1665:
;1666:	g_gametype = Com_Clamp( 0, 4, ui_browserGameType.integer );
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
line 1667
;1667:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+552+64
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1670
;1668:
;1669:	// Shafe - Multi Master 
;1670:	g_masteruse = Com_Clamp( 0, 4, ui_browserMasterNum.integer );
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
line 1671
;1671:	g_arenaservers.mserver.curvalue = g_masteruse;
ADDRGP4 g_arenaservers+456+64
ADDRGP4 g_masteruse
INDIRI4
ASGNI4
line 1675
;1672:
;1673:
;1674:
;1675:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
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
line 1676
;1676:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+648+64
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1678
;1677:
;1678:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
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
line 1679
;1679:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+744+60
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1681
;1680:
;1681:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
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
line 1682
;1682:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+808+60
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1684
;1683:	
;1684:	g_arenaservers.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "cl_punkbuster" ) );
ADDRGP4 $660
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
line 1687
;1685:
;1686:	// force to initial state and refresh
;1687:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1688
;1688:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1689
;1689:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1691
;1690:
;1691:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $591
ARGP4
ADDRGP4 $213
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1692
;1692:}
LABELV $742
endproc ArenaServers_MenuInit 48 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1700
;1693:
;1694:
;1695:/*
;1696:=================
;1697:ArenaServers_Cache
;1698:=================
;1699:*/
;1700:void ArenaServers_Cache( void ) {
line 1701
;1701:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $990
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1702
;1702:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $1007
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1703
;1703:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $1053
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1704
;1704:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $1070
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1705
;1705:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $1011
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1706
;1706:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $1028
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1707
;1707:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $1032
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1708
;1708:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $1049
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1709
;1709:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $1074
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1710
;1710:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $1091
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1711
;1711:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $895
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1712
;1712:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $925
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1713
;1713:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $943
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1714
;1714:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $891
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1715
;1715:	trap_R_RegisterShaderNoMip( ART_PUNKBUSTER );
ADDRGP4 $1111
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1716
;1716:}
LABELV $1183
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1724
;1717:
;1718:
;1719:/*
;1720:=================
;1721:UI_ArenaServersMenu
;1722:=================
;1723:*/
;1724:void UI_ArenaServersMenu( void ) {
line 1725
;1725:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1726
;1726:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1727
;1727:}						  
LABELV $1184
endproc UI_ArenaServersMenu 0 4
bss
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
skip 33792
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 4224
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 33792
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 33792
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
LABELV $1127
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
LABELV $1111
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
LABELV $1095
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
LABELV $1091
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
LABELV $1074
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
LABELV $1070
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
LABELV $1053
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
LABELV $1049
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
LABELV $1032
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
LABELV $1028
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
LABELV $1011
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
LABELV $1007
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
LABELV $990
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
LABELV $986
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
LABELV $969
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
LABELV $943
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
LABELV $925
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
LABELV $895
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
LABELV $891
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
LABELV $843
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
LABELV $829
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
LABELV $813
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
LABELV $797
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
LABELV $781
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
LABELV $765
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
LABELV $757
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
LABELV $724
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
LABELV $723
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
LABELV $700
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
LABELV $694
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
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $682
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
LABELV $678
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
LABELV $676
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
LABELV $660
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
LABELV $654
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
LABELV $598
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
LABELV $597
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
LABELV $596
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
LABELV $593
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
LABELV $591
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
LABELV $590
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $587
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $583
byte 1 32
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $581
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
LABELV $579
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $577
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $565
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
LABELV $543
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
LABELV $433
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
LABELV $412
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
LABELV $404
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
LABELV $403
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $402
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $401
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
LABELV $400
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $399
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $398
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
LABELV $397
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $396
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $395
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
LABELV $331
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $330
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $329
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
LABELV $328
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $327
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $324
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $319
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
LABELV $95
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
LABELV $94
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
LABELV $93
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $92
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $91
byte 1 83
byte 1 80
byte 1 32
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 118
byte 1 49
byte 1 0
align 1
LABELV $89
byte 1 68
byte 1 77
byte 1 32
byte 1 0
align 1
LABELV $88
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
LABELV $87
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
LABELV $86
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
LABELV $85
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
LABELV $84
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
LABELV $83
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
LABELV $82
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
byte 1 83
byte 1 104
byte 1 97
byte 1 102
byte 1 101
byte 1 39
byte 1 115
byte 1 32
byte 1 83
byte 1 105
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 72
byte 1 101
byte 1 39
byte 1 115
byte 1 32
byte 1 79
byte 1 110
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 83
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $72
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 110
byte 1 108
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $71
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 110
byte 1 108
byte 1 115
byte 1 111
byte 1 102
byte 1 116
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $70
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 110
byte 1 108
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 46
byte 1 99
byte 1 111
byte 1 109
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
byte 1 32
byte 1 40
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 110
byte 1 108
byte 1 115
byte 1 111
byte 1 102
byte 1 116
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 0
