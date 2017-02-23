data
align 4
LABELV gametype_items
address $70
address $71
address $72
address $73
address $74
address $75
address $76
address $77
byte 4 0
align 4
LABELV gametype_remap
byte 4 0
byte 4 3
byte 4 1
byte 4 4
byte 4 4
byte 4 5
byte 4 6
align 4
LABELV gametype_remap2
byte 4 0
byte 4 2
byte 4 0
byte 4 1
byte 4 3
byte 4 3
byte 4 0
byte 4 0
code
proc GametypeBits 36 8
file "../ui_startserver.c"
line 102
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
;2://
;3:/*
;4:=============================================================================
;5:
;6:START SERVER MENU *****
;7:
;8:=============================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define GAMESERVER_BACK0		"menu/art/back_0"
;16:#define GAMESERVER_BACK1		"menu/art/back_1"
;17:#define GAMESERVER_NEXT0		"menu/art/next_0"
;18:#define GAMESERVER_NEXT1		"menu/art/next_1"
;19:#define GAMESERVER_FRAMEL		"menu/art/frame2_l"
;20:#define GAMESERVER_FRAMER		"menu/art/frame1_r"
;21:#define GAMESERVER_SELECT		"menu/art/maps_select"
;22:#define GAMESERVER_SELECTED		"menu/art/maps_selected"
;23:#define GAMESERVER_FIGHT0		"menu/art/fight_0"
;24:#define GAMESERVER_FIGHT1		"menu/art/fight_1"
;25:#define GAMESERVER_UNKNOWNMAP	"menu/art/unknownmap"
;26:#define GAMESERVER_ARROWS		"menu/art/gs_arrows_0"
;27:#define GAMESERVER_ARROWSL		"menu/art/gs_arrows_l"
;28:#define GAMESERVER_ARROWSR		"menu/art/gs_arrows_r"
;29:
;30:#define MAX_MAPROWS		2 // Shafe - Trep - was 2
;31:#define MAX_MAPCOLS		2
;32:#define MAX_MAPSPERPAGE	4 // Shafe - Trep -was 4
;33:
;34:#define	MAX_SERVERSTEXT	8192
;35:
;36:#define MAX_SERVERMAPS	254 // Shafe - Trep - was 64
;37:#define MAX_NAMELENGTH	254	// Shafe - Trep - was 16
;38:
;39:#define ID_GAMETYPE				10
;40:#define ID_PICTURES				11	// 12, 13, 14
;41:#define ID_PREVPAGE				15
;42:#define ID_NEXTPAGE				16
;43:#define ID_STARTSERVERBACK		17
;44:#define ID_STARTSERVERNEXT		18
;45:
;46:typedef struct {
;47:	menuframework_s	menu;
;48:
;49:	menutext_s		banner;
;50:	menubitmap_s	framel;
;51:	menubitmap_s	framer;
;52:
;53:	menulist_s		gametype;
;54:	menubitmap_s	mappics[MAX_MAPSPERPAGE];
;55:	menubitmap_s	mapbuttons[MAX_MAPSPERPAGE];
;56:	menubitmap_s	arrows;
;57:	menubitmap_s	prevpage;
;58:	menubitmap_s	nextpage;
;59:	menubitmap_s	back;
;60:	menubitmap_s	next;
;61:
;62:	menutext_s		mapname;
;63:	menubitmap_s	item_null;
;64:
;65:	qboolean		multiplayer;
;66:	int				currentmap;
;67:	int				nummaps;
;68:	int				page;
;69:	int				maxpages;
;70:	char			maplist[MAX_SERVERMAPS][MAX_NAMELENGTH];
;71:	int				mapGamebits[MAX_SERVERMAPS];
;72:} startserver_t;
;73:
;74:static startserver_t s_startserver;
;75:
;76:static const char *gametype_items[] = {
;77:	"Free For All",
;78:	"Team Deathmatch",
;79:	"Tournament",
;80:	"Capture the Flag",
;81:	"Trepidation",
;82:	"Arsenal",
;83:	"Survival",
;84:	"Freeze Tag",
;85:	0
;86:};
;87:
;88:static int gametype_remap[] = {GT_FFA, GT_TEAM, GT_TOURNAMENT, GT_CTF, 4, 5, 6};
;89:static int gametype_remap2[] = {0, 2, 0, 1, 3, 3, 0, 0};
;90:
;91:// use ui_servers2.c definition
;92:extern const char* punkbuster_items[];
;93:
;94:static void UI_ServerOptionsMenu( qboolean multiplayer );
;95:
;96:
;97:/*
;98:=================
;99:GametypeBits
;100:=================
;101:*/
;102:static int GametypeBits( char *string ) {
line 107
;103:	int		bits;
;104:	char	*p;
;105:	char	*token;
;106:
;107:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 108
;108:	p = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $80
JUMPV
LABELV $79
line 109
;109:	while( 1 ) {
line 110
;110:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 111
;111:		if( token[0] == 0 ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $82
line 112
;112:			break;
ADDRGP4 $81
JUMPV
LABELV $82
line 115
;113:		}
;114:
;115:		if( Q_stricmp( token, "ffa" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $86
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $84
line 116
;116:			bits |= 1 << GT_FFA;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 117
;117:			continue;
ADDRGP4 $80
JUMPV
LABELV $84
line 120
;118:		}
;119:
;120:		if( Q_stricmp( token, "tourney" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $89
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $87
line 121
;121:			bits |= 1 << GT_TOURNAMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 122
;122:			continue;
ADDRGP4 $80
JUMPV
LABELV $87
line 125
;123:		}
;124:
;125:		if( Q_stricmp( token, "single" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $92
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $90
line 126
;126:			bits |= 1 << GT_SINGLE_PLAYER;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 127
;127:			continue;
ADDRGP4 $80
JUMPV
LABELV $90
line 130
;128:		}
;129:
;130:		if( Q_stricmp( token, "team" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $93
line 131
;131:			bits |= 1 << GT_TEAM;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 132
;132:			continue;
ADDRGP4 $80
JUMPV
LABELV $93
line 135
;133:		}
;134:
;135:		if( Q_stricmp( token, "ctf" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $98
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $96
line 136
;136:			bits |= 1 << GT_CTF;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 137
;137:			continue;
LABELV $96
line 139
;138:		}
;139:	}
LABELV $80
line 109
ADDRGP4 $79
JUMPV
LABELV $81
line 141
;140:
;141:	return bits;
ADDRLP4 4
INDIRI4
RETI4
LABELV $78
endproc GametypeBits 36 8
bss
align 1
LABELV $100
skip 256
code
proc StartServer_Update 28 16
line 150
;142:}
;143:
;144:
;145:/*
;146:=================
;147:StartServer_Update
;148:=================
;149:*/
;150:static void StartServer_Update( void ) {
line 155
;151:	int				i;
;152:	int				top;
;153:	static	char	picname[MAX_MAPSPERPAGE][64];
;154:
;155:	top = s_startserver.page*MAX_MAPSPERPAGE;
ADDRLP4 4
ADDRGP4 s_startserver+1948
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 157
;156:
;157:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $102
line 158
;158:	{
line 159
;159:		if (top+i >= s_startserver.nummaps)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_startserver+1944
INDIRI4
LTI4 $106
line 160
;160:			break;
ADDRGP4 $124
JUMPV
LABELV $106
line 162
;161:
;162:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", s_startserver.maplist[top+i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $100
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $109
ARGP4
CNSTI4 254
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 164
;163:
;164:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 165
;165:		s_startserver.mappics[i].generic.name   = picname[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $100
ADDP4
ASGNP4
line 166
;166:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+68
ADDP4
CNSTI4 0
ASGNI4
line 169
;167:
;168:		// reset
;169:		s_startserver.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 170
;170:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 24
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 171
;171:	}
LABELV $103
line 157
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $102
line 173
;172:
;173:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $124
JUMPV
LABELV $121
line 174
;174:	{
line 175
;175:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 176
;176:		s_startserver.mappics[i].generic.name   = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+4
ADDP4
CNSTP4 0
ASGNP4
line 177
;177:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+68
ADDP4
CNSTI4 0
ASGNI4
line 180
;178:
;179:		// disable
;180:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 181
;181:		s_startserver.mapbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 182
;182:	}
LABELV $122
line 173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $124
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $121
line 186
;183:
;184:
;185:	// no servers to start
;186:	if( !s_startserver.nummaps ) {
ADDRGP4 s_startserver+1944
INDIRI4
CNSTI4 0
NEI4 $135
line 187
;187:		s_startserver.next.generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_startserver+1688+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 190
;188:
;189:		// set the map name
;190:		strcpy( s_startserver.mapname.string, "NO MAPS FOUND" );
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 191
;191:	}
ADDRGP4 $136
JUMPV
LABELV $135
line 192
;192:	else {
line 194
;193:		// set the highlight
;194:		s_startserver.next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_startserver+1688+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 195
;195:		i = s_startserver.currentmap - top;
ADDRLP4 0
ADDRGP4 s_startserver+1940
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 196
;196:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $146
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $146
line 197
;197:		{
line 198
;198:			s_startserver.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 199
;199:			s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 200
;200:		}
LABELV $146
line 203
;201:
;202:		// set the map name
;203:		strcpy( s_startserver.mapname.string, s_startserver.maplist[s_startserver.currentmap] );
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
CNSTI4 254
ADDRGP4 s_startserver+1940
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 204
;204:	}
LABELV $136
line 206
;205:	
;206:	Q_strupr( s_startserver.mapname.string );
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 207
;207:}
LABELV $99
endproc StartServer_Update 28 16
proc StartServer_MapEvent 0 0
line 215
;208:
;209:
;210:/*
;211:=================
;212:StartServer_MapEvent
;213:=================
;214:*/
;215:static void StartServer_MapEvent( void* ptr, int event ) {
line 216
;216:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $159
line 217
;217:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 220
;218:	}
;219:
;220:	s_startserver.currentmap = (s_startserver.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
ADDRGP4 s_startserver+1940
ADDRGP4 s_startserver+1948
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ADDI4
ASGNI4
line 221
;221:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 222
;222:}
LABELV $158
endproc StartServer_MapEvent 0 0
proc StartServer_GametypeEvent 48 12
line 230
;223:
;224:
;225:/*
;226:=================
;227:StartServer_GametypeEvent
;228:=================
;229:*/
;230:static void StartServer_GametypeEvent( void* ptr, int event ) {
line 237
;231:	int			i;
;232:	int			count;
;233:	int			gamebits;
;234:	int			matchbits;
;235:	const char	*info;
;236:
;237:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $164
line 238
;238:		return;
ADDRGP4 $163
JUMPV
LABELV $164
line 241
;239:	}
;240:
;241:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 242
;242:	s_startserver.nummaps = 0;
ADDRGP4 s_startserver+1944
CNSTI4 0
ASGNI4
line 243
;243:	matchbits = 1 << gametype_remap[s_startserver.gametype.curvalue];
ADDRLP4 12
CNSTI4 1
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
LSHI4
ASGNI4
line 244
;244:	if( gametype_remap[s_startserver.gametype.curvalue] == GT_FFA ) {
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CNSTI4 0
NEI4 $169
line 245
;245:		matchbits |= ( 1 << GT_SINGLE_PLAYER );
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 246
;246:	}
LABELV $169
line 250
;247:
;248:	
;249:	// Shafe - Read Arsenal, Survival, And Trepidation Gametypes as FFA
;250:	if(s_startserver.gametype.curvalue > (GT_CTF-1))
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 3
LEI4 $173
line 251
;251:	{
line 252
;252:		matchbits |= ( 1 << GT_FFA);
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 253
;253:	}
LABELV $173
line 256
;254:	/////////////////////////////////////////////////////////////
;255:
;256:	for( i = 0; i < count; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $180
JUMPV
LABELV $177
line 257
;257:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 259
;258:
;259:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 260
;260:		if( !( gamebits & matchbits ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
NEI4 $182
line 261
;261:			continue;
ADDRGP4 $178
JUMPV
LABELV $182
line 264
;262:		}
;263:
;264:		Q_strncpyz( s_startserver.maplist[s_startserver.nummaps], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
CNSTI4 254
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 s_startserver+1944
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 265
;265:		Q_strupr( s_startserver.maplist[s_startserver.nummaps] );
CNSTI4 254
ADDRGP4 s_startserver+1944
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 266
;266:		s_startserver.mapGamebits[s_startserver.nummaps] = gamebits;
ADDRGP4 s_startserver+1944
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+66472
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 267
;267:		s_startserver.nummaps++;
ADDRLP4 44
ADDRGP4 s_startserver+1944
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 268
;268:	}
LABELV $178
line 256
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $180
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $177
line 269
;269:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRGP4 s_startserver+1952
ADDRGP4 s_startserver+1944
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 24
INDIRI4
DIVI4
ASGNI4
line 270
;270:	s_startserver.page = 0;
ADDRGP4 s_startserver+1948
CNSTI4 0
ASGNI4
line 271
;271:	s_startserver.currentmap = 0;
ADDRGP4 s_startserver+1940
CNSTI4 0
ASGNI4
line 273
;272:
;273:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 274
;274:}
LABELV $163
endproc StartServer_GametypeEvent 48 12
proc StartServer_MenuEvent 12 8
line 282
;275:
;276:
;277:/*
;278:=================
;279:StartServer_MenuEvent
;280:=================
;281:*/
;282:static void StartServer_MenuEvent( void* ptr, int event ) {
line 283
;283:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $197
line 284
;284:		return;
ADDRGP4 $196
JUMPV
LABELV $197
line 287
;285:	}
;286:
;287:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $199
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $199
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $259-60
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $259
address $202
address $207
address $258
address $213
code
LABELV $202
line 289
;288:	case ID_PREVPAGE:
;289:		if( s_startserver.page > 0 ) {
ADDRGP4 s_startserver+1948
INDIRI4
CNSTI4 0
LEI4 $200
line 290
;290:			s_startserver.page--;
ADDRLP4 8
ADDRGP4 s_startserver+1948
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 291
;291:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 292
;292:		}
line 293
;293:		break;
ADDRGP4 $200
JUMPV
LABELV $207
line 296
;294:
;295:	case ID_NEXTPAGE:
;296:		if( s_startserver.page < s_startserver.maxpages - 1 ) {
ADDRGP4 s_startserver+1948
INDIRI4
ADDRGP4 s_startserver+1952
INDIRI4
CNSTI4 1
SUBI4
GEI4 $200
line 297
;297:			s_startserver.page++;
ADDRLP4 8
ADDRGP4 s_startserver+1948
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 298
;298:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 299
;299:		}
line 300
;300:		break;
ADDRGP4 $200
JUMPV
LABELV $213
line 305
;301:
;302:	case ID_STARTSERVERNEXT:
;303:		
;304:		// Fixes offline play problems - Shafe
;305:		trap_Cvar_SetValue( "bot_minplayers", 0 );
ADDRGP4 $214
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 306
;306:		trap_Cvar_SetValue( "g_GameMode", 0 );
ADDRGP4 $215
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 310
;307:
;308:
;309:
;310:		if (s_startserver.gametype.curvalue == 1)
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 1
NEI4 $216
line 311
;311:		{
line 312
;312:				trap_Cvar_SetValue( "g_gameType", 0 );
ADDRGP4 $220
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 313
;313:				trap_Cvar_SetValue( "g_gameMode", 0 );
ADDRGP4 $221
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 314
;314:				s_startserver.gametype.curvalue = 3;
ADDRGP4 s_startserver+536+64
CNSTI4 3
ASGNI4
line 315
;315:		}
LABELV $216
line 318
;316:		
;317:
;318:		if (s_startserver.gametype.curvalue > 3)
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 3
LEI4 $224
line 319
;319:		{
line 320
;320:			if (s_startserver.gametype.curvalue == 4) 
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 4
NEI4 $228
line 321
;321:			{
line 322
;322:				trap_Cvar_SetValue( "g_gameType", 3 );
ADDRGP4 $220
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 323
;323:				trap_Cvar_SetValue( "g_gameMode", 3 );
ADDRGP4 $221
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 324
;324:				s_startserver.gametype.curvalue = 3;
ADDRGP4 s_startserver+536+64
CNSTI4 3
ASGNI4
line 325
;325:			}
LABELV $228
line 327
;326:
;327:			if (s_startserver.gametype.curvalue == 5) 
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 5
NEI4 $234
line 328
;328:			{
line 329
;329:				trap_Cvar_SetValue( "g_gameType", 0 );
ADDRGP4 $220
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 330
;330:				trap_Cvar_SetValue( "g_gameMode", 1 );
ADDRGP4 $221
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 331
;331:				s_startserver.gametype.curvalue = 0;
ADDRGP4 s_startserver+536+64
CNSTI4 0
ASGNI4
line 332
;332:			}
LABELV $234
line 334
;333:
;334:			if (s_startserver.gametype.curvalue == 6) 
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 6
NEI4 $225
line 335
;335:			{
line 336
;336:				trap_Cvar_SetValue( "g_gameType", 0 );
ADDRGP4 $220
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 337
;337:				trap_Cvar_SetValue( "g_gameMode", 2 );
ADDRGP4 $221
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 343
;338:				
;339:				// Resets Weapons On Arsenal 
;340:				// This should actually end up on the menus
;341:				// so the player can select which weapons to play with
;342:				// We'll just turn them all on for this build. - Shafe
;343:				trap_Cvar_SetValue( "g_StartGauntlet", 1 );
ADDRGP4 $244
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 344
;344:				trap_Cvar_SetValue( "g_StartMG", 1 );
ADDRGP4 $245
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 345
;345:				trap_Cvar_SetValue( "g_StartSG", 1 );
ADDRGP4 $246
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 346
;346:				trap_Cvar_SetValue( "g_StartGrenade", 1 );
ADDRGP4 $247
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 347
;347:				trap_Cvar_SetValue( "g_StartSingCan", 1 );
ADDRGP4 $248
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 348
;348:				trap_Cvar_SetValue( "g_StartFlame", 1 );
ADDRGP4 $249
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 349
;349:				trap_Cvar_SetValue( "g_StartGauss", 1 );
ADDRGP4 $250
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 350
;350:				trap_Cvar_SetValue( "g_StartPlasma", 1 );
ADDRGP4 $251
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 351
;351:				trap_Cvar_SetValue( "g_StartBFG", 1 );
ADDRGP4 $252
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 353
;352:
;353:				s_startserver.gametype.curvalue = 0;
ADDRGP4 s_startserver+536+64
CNSTI4 0
ASGNI4
line 354
;354:			}
line 356
;355:
;356:		} 
ADDRGP4 $225
JUMPV
LABELV $224
line 358
;357:		else
;358:		{
line 359
;359:			trap_Cvar_SetValue( "g_gameType", gametype_remap[s_startserver.gametype.curvalue] );
ADDRGP4 $220
ARGP4
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 360
;360:		}
LABELV $225
line 362
;361:		
;362:		UI_ServerOptionsMenu( s_startserver.multiplayer );
ADDRGP4 s_startserver+1936
INDIRI4
ARGI4
ADDRGP4 UI_ServerOptionsMenu
CALLV
pop
line 363
;363:		break;
ADDRGP4 $200
JUMPV
LABELV $258
line 366
;364:
;365:	case ID_STARTSERVERBACK:
;366:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 367
;367:		break;
LABELV $199
LABELV $200
line 369
;368:	}
;369:}
LABELV $196
endproc StartServer_MenuEvent 12 8
proc StartServer_LevelshotDraw 48 20
line 377
;370:
;371:
;372:/*
;373:===============
;374:StartServer_LevelshotDraw
;375:===============
;376:*/
;377:static void StartServer_LevelshotDraw( void *self ) {
line 385
;378:	menubitmap_s	*b;
;379:	int				x;
;380:	int				y;
;381:	int				w;
;382:	int				h;
;383:	int				n;
;384:
;385:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 387
;386:
;387:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $262
line 388
;388:		return;
ADDRGP4 $261
JUMPV
LABELV $262
line 391
;389:	}
;390:
;391:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $264
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $264
line 392
;392:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 393
;393:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $266
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $266
line 394
;394:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 395
;395:		}
LABELV $266
line 396
;396:	}
LABELV $264
line 398
;397:
;398:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $268
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $268
line 399
;399:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 400
;400:	}
LABELV $268
line 402
;401:
;402:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 403
;403:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 404
;404:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 405
;405:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 406
;406:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 407
;407:		UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 408
;408:	}
LABELV $270
line 410
;409:
;410:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 411
;411:	y = b->generic.y + b->height;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 412
;412:	UI_FillRect( x, y, b->width, 28, colorBlack );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 414
;413:
;414:	x += b->width / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 415
;415:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 416
;416:	n = s_startserver.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
ADDRLP4 20
ADDRGP4 s_startserver+1948
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
CNSTI4 11
SUBI4
ASGNI4
line 417
;417:	UI_DrawString( x, y, s_startserver.maplist[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 254
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 419
;418:
;419:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 420
;420:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 421
;421:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 422
;422:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 423
;423:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $274
line 424
;424:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 425
;425:	}
LABELV $274
line 426
;426:}
LABELV $261
endproc StartServer_LevelshotDraw 48 20
bss
align 1
LABELV $277
skip 64
code
proc StartServer_MenuInit 20 12
line 434
;427:
;428:
;429:/*
;430:=================
;431:StartServer_MenuInit
;432:=================
;433:*/
;434:static void StartServer_MenuInit( void ) {
line 441
;435:	int	i;
;436:	int	x;
;437:	int	y;
;438:	static char mapnamebuffer[64];
;439:
;440:	// zero set all our globals
;441:	memset( &s_startserver, 0 ,sizeof(startserver_t) );
ADDRGP4 s_startserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 67488
ARGI4
ADDRGP4 memset
CALLP4
pop
line 443
;442:
;443:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 445
;444:
;445:	s_startserver.menu.wrapAround = qtrue;
ADDRGP4 s_startserver+276
CNSTI4 1
ASGNI4
line 446
;446:	s_startserver.menu.fullscreen = qtrue;
ADDRGP4 s_startserver+280
CNSTI4 1
ASGNI4
line 448
;447:
;448:	s_startserver.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_startserver+288
CNSTI4 10
ASGNI4
line 449
;449:	s_startserver.banner.generic.x	   = 320;
ADDRGP4 s_startserver+288+12
CNSTI4 320
ASGNI4
line 450
;450:	s_startserver.banner.generic.y	   = 16;
ADDRGP4 s_startserver+288+16
CNSTI4 16
ASGNI4
line 451
;451:	s_startserver.banner.string        = "TREPIDATION";
ADDRGP4 s_startserver+288+60
ADDRGP4 $287
ASGNP4
line 453
;452:
;453:	s_startserver.banner.color         = color_white;
ADDRGP4 s_startserver+288+68
ADDRGP4 color_white
ASGNP4
line 454
;454:	s_startserver.banner.style         = UI_CENTER;
ADDRGP4 s_startserver+288+64
CNSTI4 1
ASGNI4
line 456
;455:
;456:	s_startserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+360
CNSTI4 6
ASGNI4
line 457
;457:	s_startserver.framel.generic.name  = GAMESERVER_FRAMEL;
ADDRGP4 s_startserver+360+4
ADDRGP4 $295
ASGNP4
line 458
;458:	s_startserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+360+44
CNSTU4 16384
ASGNU4
line 459
;459:	s_startserver.framel.generic.x	   = 0;  
ADDRGP4 s_startserver+360+12
CNSTI4 0
ASGNI4
line 460
;460:	s_startserver.framel.generic.y	   = 78;
ADDRGP4 s_startserver+360+16
CNSTI4 78
ASGNI4
line 461
;461:	s_startserver.framel.width  	   = 256;
ADDRGP4 s_startserver+360+76
CNSTI4 256
ASGNI4
line 462
;462:	s_startserver.framel.height  	   = 329;
ADDRGP4 s_startserver+360+80
CNSTI4 329
ASGNI4
line 464
;463:
;464:	s_startserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+448
CNSTI4 6
ASGNI4
line 465
;465:	s_startserver.framer.generic.name  = GAMESERVER_FRAMER;
ADDRGP4 s_startserver+448+4
ADDRGP4 $309
ASGNP4
line 466
;466:	s_startserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+448+44
CNSTU4 16384
ASGNU4
line 467
;467:	s_startserver.framer.generic.x	   = 376;
ADDRGP4 s_startserver+448+12
CNSTI4 376
ASGNI4
line 468
;468:	s_startserver.framer.generic.y	   = 76;
ADDRGP4 s_startserver+448+16
CNSTI4 76
ASGNI4
line 469
;469:	s_startserver.framer.width  	   = 256;
ADDRGP4 s_startserver+448+76
CNSTI4 256
ASGNI4
line 470
;470:	s_startserver.framer.height  	   = 334;
ADDRGP4 s_startserver+448+80
CNSTI4 334
ASGNI4
line 472
;471:
;472:	s_startserver.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_startserver+536
CNSTI4 3
ASGNI4
line 473
;473:	s_startserver.gametype.generic.name		= "Game Type:";
ADDRGP4 s_startserver+536+4
ADDRGP4 $323
ASGNP4
line 474
;474:	s_startserver.gametype.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+536+44
CNSTU4 258
ASGNU4
line 475
;475:	s_startserver.gametype.generic.callback	= StartServer_GametypeEvent;
ADDRGP4 s_startserver+536+48
ADDRGP4 StartServer_GametypeEvent
ASGNP4
line 476
;476:	s_startserver.gametype.generic.id		= ID_GAMETYPE;
ADDRGP4 s_startserver+536+8
CNSTI4 10
ASGNI4
line 477
;477:	s_startserver.gametype.generic.x		= 320 - 24;
ADDRGP4 s_startserver+536+12
CNSTI4 296
ASGNI4
line 478
;478:	s_startserver.gametype.generic.y		= 368;
ADDRGP4 s_startserver+536+16
CNSTI4 368
ASGNI4
line 479
;479:	s_startserver.gametype.itemnames		= gametype_items;
ADDRGP4 s_startserver+536+76
ADDRGP4 gametype_items
ASGNP4
line 481
;480:
;481:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $336
line 482
;482:	{
line 483
;483:		x =	(i % MAX_MAPCOLS) * (128+8) + 188;
ADDRLP4 4
CNSTI4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
MODI4
MULI4
CNSTI4 188
ADDI4
ASGNI4
line 484
;484:		y = (i / MAX_MAPROWS) * (128+8) + 96;
ADDRLP4 8
CNSTI4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
MULI4
CNSTI4 96
ADDI4
ASGNI4
line 486
;485:
;486:		s_startserver.mappics[i].generic.type   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632
ADDP4
CNSTI4 6
ASGNI4
line 487
;487:		s_startserver.mappics[i].generic.flags  = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+44
ADDP4
CNSTU4 16388
ASGNU4
line 488
;488:		s_startserver.mappics[i].generic.x	    = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 489
;489:		s_startserver.mappics[i].generic.y	    = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 490
;490:		s_startserver.mappics[i].generic.id		= ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 491
;491:		s_startserver.mappics[i].width  		= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+76
ADDP4
CNSTI4 128
ASGNI4
line 492
;492:		s_startserver.mappics[i].height  	    = 96;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+80
ADDP4
CNSTI4 96
ASGNI4
line 493
;493:		s_startserver.mappics[i].focuspic       = GAMESERVER_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+60
ADDP4
ADDRGP4 $355
ASGNP4
line 494
;494:		s_startserver.mappics[i].errorpic       = GAMESERVER_UNKNOWNMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+64
ADDP4
ADDRGP4 $358
ASGNP4
line 495
;495:		s_startserver.mappics[i].generic.ownerdraw = StartServer_LevelshotDraw;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+56
ADDP4
ADDRGP4 StartServer_LevelshotDraw
ASGNP4
line 497
;496:
;497:		s_startserver.mapbuttons[i].generic.type     = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984
ADDP4
CNSTI4 6
ASGNI4
line 498
;498:		s_startserver.mapbuttons[i].generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
CNSTU4 33028
ASGNU4
line 499
;499:		s_startserver.mapbuttons[i].generic.id       = ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 500
;500:		s_startserver.mapbuttons[i].generic.callback = StartServer_MapEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+48
ADDP4
ADDRGP4 StartServer_MapEvent
ASGNP4
line 501
;501:		s_startserver.mapbuttons[i].generic.x	     = x - 30;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 30
SUBI4
ASGNI4
line 502
;502:		s_startserver.mapbuttons[i].generic.y	     = y - 32;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 503
;503:		s_startserver.mapbuttons[i].width  		     = 256;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+76
ADDP4
CNSTI4 256
ASGNI4
line 504
;504:		s_startserver.mapbuttons[i].height  	     = 248;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+80
ADDP4
CNSTI4 248
ASGNI4
line 505
;505:		s_startserver.mapbuttons[i].generic.left     = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 506
;506:		s_startserver.mapbuttons[i].generic.top  	 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 507
;507:		s_startserver.mapbuttons[i].generic.right    = x + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 508
;508:		s_startserver.mapbuttons[i].generic.bottom   = y + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 509
;509:		s_startserver.mapbuttons[i].focuspic         = GAMESERVER_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+60
ADDP4
ADDRGP4 $386
ASGNP4
line 510
;510:	}
LABELV $337
line 481
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $336
line 512
;511:
;512:	s_startserver.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+1336
CNSTI4 6
ASGNI4
line 513
;513:	s_startserver.arrows.generic.name  = GAMESERVER_ARROWS;
ADDRGP4 s_startserver+1336+4
ADDRGP4 $390
ASGNP4
line 514
;514:	s_startserver.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+1336+44
CNSTU4 16384
ASGNU4
line 515
;515:	s_startserver.arrows.generic.x	   = 260;
ADDRGP4 s_startserver+1336+12
CNSTI4 260
ASGNI4
line 516
;516:	s_startserver.arrows.generic.y	   = 400;
ADDRGP4 s_startserver+1336+16
CNSTI4 400
ASGNI4
line 517
;517:	s_startserver.arrows.width  	   = 128;
ADDRGP4 s_startserver+1336+76
CNSTI4 128
ASGNI4
line 518
;518:	s_startserver.arrows.height  	   = 32;
ADDRGP4 s_startserver+1336+80
CNSTI4 32
ASGNI4
line 520
;519:
;520:	s_startserver.prevpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1424
CNSTI4 6
ASGNI4
line 521
;521:	s_startserver.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1424+44
CNSTU4 260
ASGNU4
line 522
;522:	s_startserver.prevpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1424+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 523
;523:	s_startserver.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 s_startserver+1424+8
CNSTI4 15
ASGNI4
line 524
;524:	s_startserver.prevpage.generic.x		= 260;
ADDRGP4 s_startserver+1424+12
CNSTI4 260
ASGNI4
line 525
;525:	s_startserver.prevpage.generic.y		= 400;
ADDRGP4 s_startserver+1424+16
CNSTI4 400
ASGNI4
line 526
;526:	s_startserver.prevpage.width  		    = 64;
ADDRGP4 s_startserver+1424+76
CNSTI4 64
ASGNI4
line 527
;527:	s_startserver.prevpage.height  		    = 32;
ADDRGP4 s_startserver+1424+80
CNSTI4 32
ASGNI4
line 528
;528:	s_startserver.prevpage.focuspic         = GAMESERVER_ARROWSL;
ADDRGP4 s_startserver+1424+60
ADDRGP4 $418
ASGNP4
line 530
;529:
;530:	s_startserver.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1512
CNSTI4 6
ASGNI4
line 531
;531:	s_startserver.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1512+44
CNSTU4 260
ASGNU4
line 532
;532:	s_startserver.nextpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1512+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 533
;533:	s_startserver.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 s_startserver+1512+8
CNSTI4 16
ASGNI4
line 534
;534:	s_startserver.nextpage.generic.x		= 321;
ADDRGP4 s_startserver+1512+12
CNSTI4 321
ASGNI4
line 535
;535:	s_startserver.nextpage.generic.y		= 400;
ADDRGP4 s_startserver+1512+16
CNSTI4 400
ASGNI4
line 536
;536:	s_startserver.nextpage.width  		    = 64;
ADDRGP4 s_startserver+1512+76
CNSTI4 64
ASGNI4
line 537
;537:	s_startserver.nextpage.height  		    = 32;
ADDRGP4 s_startserver+1512+80
CNSTI4 32
ASGNI4
line 538
;538:	s_startserver.nextpage.focuspic         = GAMESERVER_ARROWSR;
ADDRGP4 s_startserver+1512+60
ADDRGP4 $436
ASGNP4
line 540
;539:
;540:	s_startserver.mapname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_startserver+1776
CNSTI4 9
ASGNI4
line 541
;541:	s_startserver.mapname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_startserver+1776+44
CNSTU4 16392
ASGNU4
line 542
;542:	s_startserver.mapname.generic.x	    = 320;
ADDRGP4 s_startserver+1776+12
CNSTI4 320
ASGNI4
line 543
;543:	s_startserver.mapname.generic.y	    = 440;
ADDRGP4 s_startserver+1776+16
CNSTI4 440
ASGNI4
line 544
;544:	s_startserver.mapname.string        = mapnamebuffer;
ADDRGP4 s_startserver+1776+60
ADDRGP4 $277
ASGNP4
line 545
;545:	s_startserver.mapname.style         = UI_CENTER|UI_BIGFONT;
ADDRGP4 s_startserver+1776+64
CNSTI4 33
ASGNI4
line 546
;546:	s_startserver.mapname.color         = text_color_normal;
ADDRGP4 s_startserver+1776+68
ADDRGP4 text_color_normal
ASGNP4
line 548
;547:
;548:	s_startserver.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1600
CNSTI4 6
ASGNI4
line 549
;549:	s_startserver.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_startserver+1600+4
ADDRGP4 $453
ASGNP4
line 550
;550:	s_startserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1600+44
CNSTU4 260
ASGNU4
line 551
;551:	s_startserver.back.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1600+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 552
;552:	s_startserver.back.generic.id	    = ID_STARTSERVERBACK;
ADDRGP4 s_startserver+1600+8
CNSTI4 17
ASGNI4
line 553
;553:	s_startserver.back.generic.x		= 0;
ADDRGP4 s_startserver+1600+12
CNSTI4 0
ASGNI4
line 554
;554:	s_startserver.back.generic.y		= 480-64;
ADDRGP4 s_startserver+1600+16
CNSTI4 416
ASGNI4
line 555
;555:	s_startserver.back.width  		    = 128;
ADDRGP4 s_startserver+1600+76
CNSTI4 128
ASGNI4
line 556
;556:	s_startserver.back.height  		    = 64;
ADDRGP4 s_startserver+1600+80
CNSTI4 64
ASGNI4
line 557
;557:	s_startserver.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_startserver+1600+60
ADDRGP4 $470
ASGNP4
line 559
;558:
;559:	s_startserver.next.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1688
CNSTI4 6
ASGNI4
line 560
;560:	s_startserver.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_startserver+1688+4
ADDRGP4 $474
ASGNP4
line 561
;561:	s_startserver.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1688+44
CNSTU4 272
ASGNU4
line 562
;562:	s_startserver.next.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1688+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 563
;563:	s_startserver.next.generic.id	    = ID_STARTSERVERNEXT;
ADDRGP4 s_startserver+1688+8
CNSTI4 18
ASGNI4
line 564
;564:	s_startserver.next.generic.x		= 640;
ADDRGP4 s_startserver+1688+12
CNSTI4 640
ASGNI4
line 565
;565:	s_startserver.next.generic.y		= 480-64;
ADDRGP4 s_startserver+1688+16
CNSTI4 416
ASGNI4
line 566
;566:	s_startserver.next.width  		    = 128;
ADDRGP4 s_startserver+1688+76
CNSTI4 128
ASGNI4
line 567
;567:	s_startserver.next.height  		    = 64;
ADDRGP4 s_startserver+1688+80
CNSTI4 64
ASGNI4
line 568
;568:	s_startserver.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_startserver+1688+60
ADDRGP4 $491
ASGNP4
line 570
;569:
;570:	s_startserver.item_null.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_startserver+1848
CNSTI4 6
ASGNI4
line 571
;571:	s_startserver.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_startserver+1848+44
CNSTU4 1050628
ASGNU4
line 572
;572:	s_startserver.item_null.generic.x		= 0;
ADDRGP4 s_startserver+1848+12
CNSTI4 0
ASGNI4
line 573
;573:	s_startserver.item_null.generic.y		= 0;
ADDRGP4 s_startserver+1848+16
CNSTI4 0
ASGNI4
line 574
;574:	s_startserver.item_null.width			= 640;
ADDRGP4 s_startserver+1848+76
CNSTI4 640
ASGNI4
line 575
;575:	s_startserver.item_null.height			= 480;
ADDRGP4 s_startserver+1848+80
CNSTI4 480
ASGNI4
line 577
;576:
;577:	Menu_AddItem( &s_startserver.menu, &s_startserver.banner );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 578
;578:	Menu_AddItem( &s_startserver.menu, &s_startserver.framel );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 579
;579:	Menu_AddItem( &s_startserver.menu, &s_startserver.framer );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 581
;580:
;581:	Menu_AddItem( &s_startserver.menu, &s_startserver.gametype );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 582
;582:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $507
line 583
;583:	{
line 584
;584:		Menu_AddItem( &s_startserver.menu, &s_startserver.mappics[i] );
ADDRGP4 s_startserver
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 585
;585:		Menu_AddItem( &s_startserver.menu, &s_startserver.mapbuttons[i] );
ADDRGP4 s_startserver
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 586
;586:	}
LABELV $508
line 582
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $507
line 588
;587:
;588:	Menu_AddItem( &s_startserver.menu, &s_startserver.arrows );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 589
;589:	Menu_AddItem( &s_startserver.menu, &s_startserver.prevpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1424
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 590
;590:	Menu_AddItem( &s_startserver.menu, &s_startserver.nextpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1512
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 591
;591:	Menu_AddItem( &s_startserver.menu, &s_startserver.back );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1600
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 592
;592:	Menu_AddItem( &s_startserver.menu, &s_startserver.next );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 593
;593:	Menu_AddItem( &s_startserver.menu, &s_startserver.mapname );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 594
;594:	Menu_AddItem( &s_startserver.menu, &s_startserver.item_null );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 596
;595:
;596:	StartServer_GametypeEvent( NULL, QM_ACTIVATED );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_GametypeEvent
CALLV
pop
line 597
;597:}
LABELV $276
endproc StartServer_MenuInit 20 12
export StartServer_Cache
proc StartServer_Cache 104 16
line 606
;598:
;599:
;600:/*
;601:=================
;602:StartServer_Cache
;603:=================
;604:*/
;605:void StartServer_Cache( void )
;606:{
line 612
;607:	int				i;
;608:	const char		*info;
;609:	qboolean		precache;
;610:	char			picname[64];
;611:
;612:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );	
ADDRGP4 $453
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 613
;613:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );	
ADDRGP4 $470
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 614
;614:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT0 );	
ADDRGP4 $474
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 615
;615:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT1 );	
ADDRGP4 $491
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 616
;616:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMEL );	
ADDRGP4 $295
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 617
;617:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMER );	
ADDRGP4 $309
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 618
;618:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );	
ADDRGP4 $386
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 619
;619:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED );	
ADDRGP4 $355
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 620
;620:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $358
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 621
;621:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWS );
ADDRGP4 $390
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 622
;622:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSL );
ADDRGP4 $418
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 623
;623:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSR );
ADDRGP4 $436
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 625
;624:
;625:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $521
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 627
;626:
;627:	s_startserver.nummaps = UI_GetNumArenas();
ADDRLP4 80
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRGP4 s_startserver+1944
ADDRLP4 80
INDIRI4
ASGNI4
line 629
;628:
;629:	for( i = 0; i < s_startserver.nummaps; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $526
JUMPV
LABELV $523
line 630
;630:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
ASGNP4
line 632
;631:
;632:		Q_strncpyz( s_startserver.maplist[i], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
ADDRLP4 88
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 92
CNSTI4 254
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 633
;633:		Q_strupr( s_startserver.maplist[i] );
CNSTI4 254
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 634
;634:		s_startserver.mapGamebits[i] = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 96
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+66472
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 636
;635:
;636:		if( precache ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $531
line 637
;637:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", s_startserver.maplist[i] );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $109
ARGP4
CNSTI4 254
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 638
;638:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 639
;639:		}
LABELV $531
line 640
;640:	}
LABELV $524
line 629
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $526
ADDRLP4 0
INDIRI4
ADDRGP4 s_startserver+1944
INDIRI4
LTI4 $523
line 642
;641:
;642:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRGP4 s_startserver+1952
ADDRGP4 s_startserver+1944
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 84
INDIRI4
DIVI4
ASGNI4
line 643
;643:}
LABELV $520
endproc StartServer_Cache 104 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 651
;644:
;645:
;646:/*
;647:=================
;648:UI_StartServerMenu
;649:=================
;650:*/
;651:void UI_StartServerMenu( qboolean multiplayer ) {
line 652
;652:	StartServer_MenuInit();
ADDRGP4 StartServer_MenuInit
CALLV
pop
line 653
;653:	s_startserver.multiplayer = multiplayer;
ADDRGP4 s_startserver+1936
ADDRFP4 0
INDIRI4
ASGNI4
line 654
;654:	UI_PushMenu( &s_startserver.menu );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 655
;655:}
LABELV $536
endproc UI_StartServerMenu 0 4
data
align 4
LABELV dedicated_list
address $539
address $540
address $541
byte 4 0
align 4
LABELV playerType_list
address $542
address $543
address $544
byte 4 0
align 4
LABELV playerTeam_list
address $545
address $546
byte 4 0
align 4
LABELV botSkill_list
address $547
address $548
address $549
address $550
address $551
byte 4 0
code
proc BotAlreadySelected 12 8
line 754
;656:
;657:
;658:
;659:/*
;660:=============================================================================
;661:
;662:SERVER OPTIONS MENU *****
;663:
;664:=============================================================================
;665:*/
;666:
;667:#define ID_PLAYER_TYPE			20
;668:#define ID_MAXCLIENTS			21
;669:#define ID_DEDICATED			22
;670:#define ID_GO					23
;671:#define ID_BACK					24
;672:
;673:#define PLAYER_SLOTS			12
;674:
;675:
;676:typedef struct {
;677:	menuframework_s		menu;
;678:
;679:	menutext_s			banner;
;680:
;681:	menubitmap_s		mappic;
;682:	menubitmap_s		picframe;
;683:
;684:	menulist_s			dedicated;
;685:	menufield_s			timelimit;
;686:	menufield_s			fraglimit;
;687:	menufield_s			flaglimit;
;688:	menuradiobutton_s	instagib;
;689:	menuradiobutton_s	friendlyfire;
;690:	menuradiobutton_s	grapple;
;691:	menufield_s			hostname;
;692:	menuradiobutton_s	pure;
;693:	menulist_s			botSkill;
;694:
;695:	menutext_s			player0;
;696:	menulist_s			playerType[PLAYER_SLOTS];
;697:	menutext_s			playerName[PLAYER_SLOTS];
;698:	menulist_s			playerTeam[PLAYER_SLOTS];
;699:
;700:	menubitmap_s		go;
;701:	menubitmap_s		next;
;702:	menubitmap_s		back;
;703:
;704:	qboolean			multiplayer;
;705:	int					gametype;
;706:	int					gamemode;
;707:	char				mapnamebuffer[32];
;708:	char				playerNameBuffers[PLAYER_SLOTS][16];
;709:
;710:	qboolean			newBot;
;711:	int					newBotIndex;
;712:	char				newBotName[16];
;713:	
;714:	menulist_s		punkbuster;
;715:} serveroptions_t;
;716:
;717:static serveroptions_t s_serveroptions;
;718:
;719:static const char *dedicated_list[] = {
;720:	"No",
;721:	"LAN",
;722:	"Internet",
;723:	0
;724:};
;725:
;726:static const char *playerType_list[] = {
;727:	"Open",
;728:	"Bot",
;729:	"----",
;730:	0
;731:};
;732:
;733:static const char *playerTeam_list[] = {
;734:	"Blue",
;735:	"Red",
;736:	0
;737:};
;738:
;739:static const char *botSkill_list[] = {
;740:	"Skill 1",
;741:	"Skill 2",
;742:	"Skill 3",
;743:	"Skill 4",
;744:	"Skill 5",
;745:	0
;746:};
;747:
;748:
;749:/*
;750:=================
;751:BotAlreadySelected
;752:=================
;753:*/
;754:static qboolean BotAlreadySelected( const char *checkName ) {
line 757
;755:	int		n;
;756:
;757:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $553
line 758
;758:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $557
line 759
;759:			continue;
ADDRGP4 $554
JUMPV
LABELV $557
line 761
;760:		}
;761:		if( (s_serveroptions.gametype >= GT_TEAM) &&
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $561
ADDRLP4 4
CNSTI4 96
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+64
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 s_serveroptions+6056
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+64
ADDP4
INDIRI4
EQI4 $561
line 762
;762:			(s_serveroptions.playerTeam[n].curvalue != s_serveroptions.playerTeam[s_serveroptions.newBotIndex].curvalue ) ) {
line 763
;763:			continue;
ADDRGP4 $554
JUMPV
LABELV $561
line 765
;764:		}
;765:		if( Q_stricmp( checkName, s_serveroptions.playerNameBuffers[n] ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $569
line 766
;766:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $552
JUMPV
LABELV $569
line 768
;767:		}
;768:	}
LABELV $554
line 757
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $553
line 770
;769:
;770:	return qfalse;
CNSTI4 0
RETI4
LABELV $552
endproc BotAlreadySelected 12 8
proc ServerOptions_Start 184 24
line 779
;771:}
;772:
;773:
;774:/*
;775:=================
;776:ServerOptions_Start
;777:=================
;778:*/
;779:static void ServerOptions_Start( void ) {
line 795
;780:	int		timelimit;
;781:	int		fraglimit;
;782:	int		maxclients;
;783:	int		dedicated;
;784:	int		friendlyfire;
;785:	int		flaglimit;
;786:	int		instagib;
;787:	int		grapple;
;788:	//	int		gamemode;
;789:	int		pure;
;790:	int		skill;
;791:	int		n;
;792:	char	buf[64];
;793:
;794:
;795:	timelimit	 = atoi( s_serveroptions.timelimit.field.buffer );
ADDRGP4 s_serveroptions+632+60+12
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 108
INDIRI4
ASGNI4
line 796
;796:	fraglimit	 = atoi( s_serveroptions.fraglimit.field.buffer );
ADDRGP4 s_serveroptions+964+60+12
ARGP4
ADDRLP4 112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 112
INDIRI4
ASGNI4
line 797
;797:	flaglimit	 = atoi( s_serveroptions.flaglimit.field.buffer );
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
ADDRLP4 116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 116
INDIRI4
ASGNI4
line 800
;798:	//gamemode	 = atoi( s_serveroptions.gamemode.field.buffer );
;799:		
;800:	dedicated	 = s_serveroptions.dedicated.curvalue;
ADDRLP4 84
ADDRGP4 s_serveroptions+536+64
INDIRI4
ASGNI4
line 801
;801:	friendlyfire = s_serveroptions.friendlyfire.curvalue;
ADDRLP4 100
ADDRGP4 s_serveroptions+1692+60
INDIRI4
ASGNI4
line 802
;802:	instagib = s_serveroptions.instagib.curvalue;
ADDRLP4 92
ADDRGP4 s_serveroptions+1628+60
INDIRI4
ASGNI4
line 803
;803:	grapple = s_serveroptions.grapple.curvalue;
ADDRLP4 96
ADDRGP4 s_serveroptions+1756+60
INDIRI4
ASGNI4
line 804
;804:	pure		 = s_serveroptions.pure.curvalue;
ADDRLP4 104
ADDRGP4 s_serveroptions+2152+60
INDIRI4
ASGNI4
line 805
;805:	skill		 = s_serveroptions.botSkill.curvalue + 1;
ADDRLP4 72
ADDRGP4 s_serveroptions+2216+64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 809
;806:	//gamemode	 = s_serveroptions.gamemode.curvalue;
;807:
;808:	//set maxclients
;809:	for( n = 0, maxclients = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 68
ADDRLP4 120
INDIRI4
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $594
line 810
;810:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $598
line 811
;811:			continue;
ADDRGP4 $595
JUMPV
LABELV $598
line 813
;812:		}
;813:		if( (s_serveroptions.playerType[n].curvalue == 1) && (s_serveroptions.playerNameBuffers[n][0] == 0) ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $602
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $602
line 814
;814:			continue;
ADDRGP4 $595
JUMPV
LABELV $602
line 816
;815:		}
;816:		maxclients++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 817
;817:	}
LABELV $595
line 809
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $597
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $594
line 820
;818:
;819:	
;820:	switch( s_serveroptions.gametype ) {
ADDRLP4 124
ADDRGP4 s_serveroptions+5820
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
LTI4 $607
ADDRLP4 124
INDIRI4
CNSTI4 4
GTI4 $607
ADDRLP4 124
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $624
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $624
address $610
address $613
address $607
address $616
address $620
code
LABELV $610
LABELV $607
line 823
;821:	case GT_FFA:
;822:	default:
;823:		trap_Cvar_SetValue( "ui_ffa_fraglimit", fraglimit );
ADDRGP4 $611
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 824
;824:		trap_Cvar_SetValue( "ui_ffa_timelimit", timelimit );
ADDRGP4 $612
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 825
;825:		break;
ADDRGP4 $608
JUMPV
LABELV $613
line 828
;826:
;827:	case GT_TOURNAMENT:
;828:		trap_Cvar_SetValue( "ui_tourney_fraglimit", fraglimit );
ADDRGP4 $614
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 829
;829:		trap_Cvar_SetValue( "ui_tourney_timelimit", timelimit );
ADDRGP4 $615
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 830
;830:		break;
ADDRGP4 $608
JUMPV
LABELV $616
line 833
;831:
;832:	case GT_TEAM:
;833:		trap_Cvar_SetValue( "ui_team_fraglimit", fraglimit );
ADDRGP4 $617
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 834
;834:		trap_Cvar_SetValue( "ui_team_timelimit", timelimit );
ADDRGP4 $618
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 835
;835:		trap_Cvar_SetValue( "ui_team_friendlt", friendlyfire );
ADDRGP4 $619
ARGP4
ADDRLP4 100
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 836
;836:		break;
ADDRGP4 $608
JUMPV
LABELV $620
line 839
;837:
;838:	case GT_CTF:
;839:		trap_Cvar_SetValue( "ui_ctf_fraglimit", fraglimit );
ADDRGP4 $621
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 840
;840:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $622
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 841
;841:		trap_Cvar_SetValue( "ui_ctf_friendlt", friendlyfire );
ADDRGP4 $623
ARGP4
ADDRLP4 100
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 842
;842:		break;
LABELV $608
line 845
;843:	}
;844:
;845:	if(s_serveroptions.gamemode == 3)
ADDRGP4 s_serveroptions+5824
INDIRI4
CNSTI4 3
NEI4 $625
line 846
;846:	{
line 847
;847:		trap_Cvar_SetValue( "ui_ctf_fraglimit", fraglimit );
ADDRGP4 $621
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 848
;848:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $622
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 849
;849:		trap_Cvar_SetValue( "ui_ctf_friendlt", friendlyfire );
ADDRGP4 $623
ARGP4
ADDRLP4 100
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 851
;850:
;851:	}
LABELV $625
line 853
;852:	
;853:	trap_Cvar_SetValue( "sv_maxclients", Com_Clamp( 0, 12, maxclients ) );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 128
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $628
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 854
;854:	trap_Cvar_SetValue( "g_Instagib", Com_Clamp( 0, instagib, instagib) );
CNSTF4 0
ARGF4
ADDRLP4 132
ADDRLP4 92
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $629
ARGP4
ADDRLP4 136
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 855
;855:	trap_Cvar_SetValue( "g_allowGrapple", Com_Clamp( 0, grapple, grapple) );
CNSTF4 0
ARGF4
ADDRLP4 140
ADDRLP4 96
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 144
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $630
ARGP4
ADDRLP4 144
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 856
;856:	trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, dedicated ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 148
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $631
ARGP4
ADDRLP4 148
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 857
;857:	trap_Cvar_SetValue ("timelimit", Com_Clamp( 0, timelimit, timelimit ) );
CNSTF4 0
ARGF4
ADDRLP4 152
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRLP4 152
INDIRF4
ARGF4
ADDRLP4 156
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $632
ARGP4
ADDRLP4 156
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 858
;858:	trap_Cvar_SetValue ("fraglimit", Com_Clamp( 0, fraglimit, fraglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 160
ADDRLP4 80
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 160
INDIRF4
ARGF4
ADDRLP4 160
INDIRF4
ARGF4
ADDRLP4 164
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $633
ARGP4
ADDRLP4 164
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 859
;859:	trap_Cvar_SetValue ("capturelimit", Com_Clamp( 0, flaglimit, flaglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 168
ADDRLP4 88
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 172
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $634
ARGP4
ADDRLP4 172
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 860
;860:	trap_Cvar_SetValue( "g_friendlyfire", friendlyfire );
ADDRGP4 $635
ARGP4
ADDRLP4 100
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 861
;861:	trap_Cvar_SetValue( "sv_pure", pure );
ADDRGP4 $636
ARGP4
ADDRLP4 104
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 862
;862:	trap_Cvar_Set("sv_hostname", s_serveroptions.hostname.field.buffer );
ADDRGP4 $637
ARGP4
ADDRGP4 s_serveroptions+1820+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 864
;863:	
;864:	trap_Cvar_SetValue( "sv_punkbuster", s_serveroptions.punkbuster.curvalue );
ADDRGP4 $641
ARGP4
ADDRGP4 s_serveroptions+6076+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 867
;865:
;866:	// the wait commands will allow the dedicated to take effect
;867:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", s_startserver.maplist[s_startserver.currentmap] ) );
ADDRGP4 $644
ARGP4
CNSTI4 254
ADDRGP4 s_startserver+1940
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRLP4 176
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 176
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 870
;868:
;869:	// add bots
;870:	trap_Cmd_ExecuteText( EXEC_APPEND, "wait 3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $647
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 871
;871:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $648
line 872
;872:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $652
line 873
;873:			continue;
ADDRGP4 $649
JUMPV
LABELV $652
line 875
;874:		}
;875:		if( s_serveroptions.playerNameBuffers[n][0] == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $656
line 876
;876:			continue;
ADDRGP4 $649
JUMPV
LABELV $656
line 878
;877:		}
;878:		if( s_serveroptions.playerNameBuffers[n][0] == '-' ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $659
line 879
;879:			continue;
ADDRGP4 $649
JUMPV
LABELV $659
line 881
;880:		}
;881:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $662
line 882
;882:			Com_sprintf( buf, sizeof(buf), "addbot %s %i %s\n", s_serveroptions.playerNameBuffers[n], skill,
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $665
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+64
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 884
;883:				playerTeam_list[s_serveroptions.playerTeam[n].curvalue] );
;884:		}
ADDRGP4 $663
JUMPV
LABELV $662
line 885
;885:		else {
line 886
;886:			Com_sprintf( buf, sizeof(buf), "addbot %s %i\n", s_serveroptions.playerNameBuffers[n], skill );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $669
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 887
;887:		}
LABELV $663
line 888
;888:		trap_Cmd_ExecuteText( EXEC_APPEND, buf );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 889
;889:	}
LABELV $649
line 871
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $648
line 892
;890:
;891:	// set player's team
;892:	if( dedicated == 0 && s_serveroptions.gametype >= GT_TEAM  ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $671
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $671
line 893
;893:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait 5; team %s\n", playerTeam_list[s_serveroptions.playerTeam[0].curvalue] ) );
ADDRGP4 $674
ARGP4
ADDRGP4 s_serveroptions+4400+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 180
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 894
;894:	}
LABELV $671
line 895
;895:}
LABELV $572
endproc ServerOptions_Start 184 24
proc ServerOptions_InitPlayerItems 12 12
line 903
;896:
;897:
;898:/*
;899:=================
;900:ServerOptions_InitPlayerItems
;901:=================
;902:*/
;903:static void ServerOptions_InitPlayerItems( void ) {
line 908
;904:	int		n;
;905:	int		v;
;906:
;907:	// init types
;908:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $678
line 909
;909:		v = 0;	// open
ADDRLP4 4
CNSTI4 0
ASGNI4
line 910
;910:	}
ADDRGP4 $679
JUMPV
LABELV $678
line 911
;911:	else {
line 912
;912:		v = 1;	// bot
ADDRLP4 4
CNSTI4 1
ASGNI4
line 913
;913:	}
LABELV $679
line 915
;914:	
;915:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $681
line 916
;916:		s_serveroptions.playerType[n].curvalue = v;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 917
;917:	}
LABELV $682
line 915
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $681
line 919
;918:
;919:	if( s_serveroptions.multiplayer && (s_serveroptions.gametype < GT_TEAM) ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $687
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
GEI4 $687
line 920
;920:		for( n = 8; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $691
line 921
;921:			s_serveroptions.playerType[n].curvalue = 2;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
CNSTI4 2
ASGNI4
line 922
;922:		}
LABELV $692
line 920
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $691
line 923
;923:	}
LABELV $687
line 926
;924:
;925:	// if not a dedicated server, first slot is reserved for the human on the server
;926:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+536+64
INDIRI4
CNSTI4 0
NEI4 $697
line 928
;927:		// human
;928:		s_serveroptions.playerType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_serveroptions+2384+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 929
;929:		s_serveroptions.playerType[0].curvalue = 0;
ADDRGP4 s_serveroptions+2384+64
CNSTI4 0
ASGNI4
line 930
;930:		trap_Cvar_VariableStringBuffer( "name", s_serveroptions.playerNameBuffers[0], sizeof(s_serveroptions.playerNameBuffers[0]) );
ADDRGP4 $705
ARGP4
ADDRGP4 s_serveroptions+5860
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 931
;931:		Q_CleanStr( s_serveroptions.playerNameBuffers[0] );
ADDRGP4 s_serveroptions+5860
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 932
;932:	}
LABELV $697
line 935
;933:
;934:	// init teams
;935:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $709
line 936
;936:		for( n = 0; n < (PLAYER_SLOTS / 2); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $712
line 937
;937:			s_serveroptions.playerTeam[n].curvalue = 0;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+64
ADDP4
CNSTI4 0
ASGNI4
line 938
;938:		}
LABELV $713
line 936
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $712
line 939
;939:		for( ; n < PLAYER_SLOTS; n++ ) {
ADDRGP4 $721
JUMPV
LABELV $718
line 940
;940:			s_serveroptions.playerTeam[n].curvalue = 1;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+64
ADDP4
CNSTI4 1
ASGNI4
line 941
;941:		}
LABELV $719
line 939
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $721
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $718
line 942
;942:	}
ADDRGP4 $710
JUMPV
LABELV $709
line 943
;943:	else {
line 944
;944:		for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $724
line 945
;945:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 946
;946:		}
LABELV $725
line 944
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $724
line 947
;947:	}
LABELV $710
line 948
;948:}
LABELV $677
endproc ServerOptions_InitPlayerItems 12 12
proc ServerOptions_SetPlayerItems 12 0
line 956
;949:
;950:
;951:/*
;952:=================
;953:ServerOptions_SetPlayerItems
;954:=================
;955:*/
;956:static void ServerOptions_SetPlayerItems( void ) {
line 968
;957:	int		start;
;958:	int		n;
;959:
;960:	// types
;961://	for( n = 0; n < PLAYER_SLOTS; n++ ) {
;962://		if( (!s_serveroptions.multiplayer) && (n > 0) && (s_serveroptions.playerType[n].curvalue == 0) ) {
;963://			s_serveroptions.playerType[n].curvalue = 1;
;964://		}
;965://	}
;966:
;967:	// names
;968:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+536+64
INDIRI4
CNSTI4 0
NEI4 $731
line 969
;969:		s_serveroptions.player0.string = "Human";
ADDRGP4 s_serveroptions+2312+60
ADDRGP4 $737
ASGNP4
line 970
;970:		s_serveroptions.playerName[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 8
ADDRGP4 s_serveroptions+3536+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294963199
BANDU4
ASGNU4
line 972
;971:
;972:		start = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 973
;973:	}
ADDRGP4 $732
JUMPV
LABELV $731
line 974
;974:	else {
line 975
;975:		s_serveroptions.player0.string = "Open";
ADDRGP4 s_serveroptions+2312+60
ADDRGP4 $542
ASGNP4
line 976
;976:		start = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 977
;977:	}
LABELV $732
line 978
;978:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $745
JUMPV
LABELV $742
line 979
;979:		if( s_serveroptions.playerType[n].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $746
line 980
;980:			s_serveroptions.playerName[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 981
;981:		}
ADDRGP4 $747
JUMPV
LABELV $746
line 982
;982:		else {
line 983
;983:			s_serveroptions.playerName[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 984
;984:		}
LABELV $747
line 985
;985:	}
LABELV $743
line 978
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $745
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $742
line 988
;986:
;987:	// teams
;988:	if( s_serveroptions.gametype < GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
GEI4 $754
line 989
;989:		return;
ADDRGP4 $730
JUMPV
LABELV $754
line 991
;990:	}
;991:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $760
JUMPV
LABELV $757
line 992
;992:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $761
line 993
;993:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 994
;994:		}
ADDRGP4 $762
JUMPV
LABELV $761
line 995
;995:		else {
line 996
;996:			s_serveroptions.playerTeam[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 997
;997:		}
LABELV $762
line 998
;998:	}
LABELV $758
line 991
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $760
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $757
line 999
;999:}
LABELV $730
endproc ServerOptions_SetPlayerItems 12 0
proc ServerOptions_Event 8 0
line 1007
;1000:
;1001:
;1002:/*
;1003:=================
;1004:ServerOptions_Event
;1005:=================
;1006:*/
;1007:static void ServerOptions_Event( void* ptr, int event ) {
line 1008
;1008:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $770
ADDRLP4 0
INDIRI4
CNSTI4 24
GTI4 $770
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $786-72
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $786
address $780
address $770
address $773
address $776
address $776
address $777
address $783
code
LABELV $773
line 1014
;1009:	
;1010:	//if( event != QM_ACTIVATED && event != QM_LOSTFOCUS) {
;1011:	//	return;
;1012:	//}
;1013:	case ID_PLAYER_TYPE:
;1014:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $774
line 1015
;1015:			break;
ADDRGP4 $771
JUMPV
LABELV $774
line 1017
;1016:		}
;1017:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1018
;1018:		break;
ADDRGP4 $771
JUMPV
LABELV $776
line 1022
;1019:
;1020:	case ID_MAXCLIENTS:
;1021:	case ID_DEDICATED:
;1022:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1023
;1023:		break;
ADDRGP4 $771
JUMPV
LABELV $777
line 1025
;1024:	case ID_GO:
;1025:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $778
line 1026
;1026:			break;
ADDRGP4 $771
JUMPV
LABELV $778
line 1028
;1027:		}
;1028:		ServerOptions_Start();
ADDRGP4 ServerOptions_Start
CALLV
pop
line 1029
;1029:		break;
ADDRGP4 $771
JUMPV
LABELV $780
line 1032
;1030:
;1031:	case ID_STARTSERVERNEXT:
;1032:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $771
line 1033
;1033:			break;
ADDRGP4 $771
JUMPV
line 1035
;1034:		}
;1035:		break;
LABELV $783
line 1037
;1036:	case ID_BACK:
;1037:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $784
line 1038
;1038:			break;
ADDRGP4 $771
JUMPV
LABELV $784
line 1040
;1039:		}
;1040:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1041
;1041:		break;
LABELV $770
LABELV $771
line 1043
;1042:	}
;1043:}
LABELV $769
endproc ServerOptions_Event 8 0
proc ServerOptions_PlayerNameEvent 4 4
line 1046
;1044:
;1045:
;1046:static void ServerOptions_PlayerNameEvent( void* ptr, int event ) {
line 1049
;1047:	int		n;
;1048:
;1049:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $789
line 1050
;1050:		return;
ADDRGP4 $788
JUMPV
LABELV $789
line 1052
;1051:	}
;1052:	n = ((menutext_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1053
;1053:	s_serveroptions.newBotIndex = n;
ADDRGP4 s_serveroptions+6056
ADDRLP4 0
INDIRI4
ASGNI4
line 1054
;1054:	UI_BotSelectMenu( s_serveroptions.playerNameBuffers[n] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRGP4 UI_BotSelectMenu
CALLV
pop
line 1055
;1055:}
LABELV $788
endproc ServerOptions_PlayerNameEvent 4 4
proc ServerOptions_StatusBar 4 20
line 1063
;1056:
;1057:
;1058:/*
;1059:=================
;1060:ServerOptions_StatusBar
;1061:=================
;1062:*/
;1063:static void ServerOptions_StatusBar( void* ptr ) {
line 1064
;1064:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $794
JUMPV
LABELV $794
line 1066
;1065:	default:
;1066:		UI_DrawString( 320, 440, "0 = NO LIMIT", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $797
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1067
;1067:		break;
LABELV $795
line 1069
;1068:	}
;1069:}
LABELV $793
endproc ServerOptions_StatusBar 4 20
proc ServerOptions_LevelshotDraw 20 20
line 1077
;1070:
;1071:
;1072:/*
;1073:===============
;1074:ServerOptions_LevelshotDraw
;1075:===============
;1076:*/
;1077:static void ServerOptions_LevelshotDraw( void *self ) {
line 1083
;1078:	menubitmap_s	*b;
;1079:	int				x;
;1080:	int				y;
;1081:
;1082:	// strange place for this, but it works
;1083:	if( s_serveroptions.newBot ) {
ADDRGP4 s_serveroptions+6052
INDIRI4
CNSTI4 0
EQI4 $799
line 1084
;1084:		Q_strncpyz( s_serveroptions.playerNameBuffers[s_serveroptions.newBotIndex], s_serveroptions.newBotName, 16 );
ADDRGP4 s_serveroptions+6056
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRGP4 s_serveroptions+6060
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1085
;1085:		s_serveroptions.newBot = qfalse;
ADDRGP4 s_serveroptions+6052
CNSTI4 0
ASGNI4
line 1086
;1086:	}
LABELV $799
line 1088
;1087:
;1088:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1090
;1089:
;1090:	Bitmap_Draw( b );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 1092
;1091:
;1092:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1093
;1093:	y = b->generic.y + b->height;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1094
;1094:	UI_FillRect( x, y, b->width, 40, colorBlack );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1096
;1095:
;1096:	x += b->width / 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 1097
;1097:	y += 4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 1098
;1098:	UI_DrawString( x, y, s_serveroptions.mapnamebuffer, UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+5828
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1100
;1099:
;1100:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1101
;1101:	UI_DrawString( x, y, gametype_items[gametype_remap2[s_serveroptions.gametype]], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRGP4 s_serveroptions+5820
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 gametype_remap2
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1102
;1102:}
LABELV $798
endproc ServerOptions_LevelshotDraw 20 20
proc ServerOptions_InitBotNames 1072 12
line 1105
;1103:
;1104:
;1105:static void ServerOptions_InitBotNames( void ) {
line 1114
;1106:	int			count;
;1107:	int			n;
;1108:	const char	*arenaInfo;
;1109:	const char	*botInfo;
;1110:	char		*p;
;1111:	char		*bot;
;1112:	char		bots[MAX_INFO_STRING];
;1113:
;1114:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $809
line 1115
;1115:		Q_strncpyz( s_serveroptions.playerNameBuffers[1], "tremulous", 16 );
ADDRGP4 s_serveroptions+5860+16
ARGP4
ADDRGP4 $814
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1116
;1116:		Q_strncpyz( s_serveroptions.playerNameBuffers[2], "tikes", 16 );
ADDRGP4 s_serveroptions+5860+32
ARGP4
ADDRGP4 $817
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1117
;1117:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
NEI4 $818
line 1118
;1118:			Q_strncpyz( s_serveroptions.playerNameBuffers[3], "tremulous", 16 );
ADDRGP4 s_serveroptions+5860+48
ARGP4
ADDRGP4 $814
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1119
;1119:		}
ADDRGP4 $819
JUMPV
LABELV $818
line 1120
;1120:		else {
line 1121
;1121:			s_serveroptions.playerType[3].curvalue = 2;
ADDRGP4 s_serveroptions+2384+288+64
CNSTI4 2
ASGNI4
line 1122
;1122:		}
LABELV $819
line 1123
;1123:		s_serveroptions.playerType[4].curvalue = 2;
ADDRGP4 s_serveroptions+2384+384+64
CNSTI4 2
ASGNI4
line 1124
;1124:		s_serveroptions.playerType[5].curvalue = 2;
ADDRGP4 s_serveroptions+2384+480+64
CNSTI4 2
ASGNI4
line 1126
;1125:
;1126:		Q_strncpyz( s_serveroptions.playerNameBuffers[6], "sarge", 16 );
ADDRGP4 s_serveroptions+5860+96
ARGP4
ADDRGP4 $834
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1127
;1127:		Q_strncpyz( s_serveroptions.playerNameBuffers[7], "tremulous", 16 );
ADDRGP4 s_serveroptions+5860+112
ARGP4
ADDRGP4 $814
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1128
;1128:		Q_strncpyz( s_serveroptions.playerNameBuffers[8], "major", 16 );
ADDRGP4 s_serveroptions+5860+128
ARGP4
ADDRGP4 $839
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1129
;1129:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
NEI4 $840
line 1130
;1130:			Q_strncpyz( s_serveroptions.playerNameBuffers[9], "yikes", 16 );
ADDRGP4 s_serveroptions+5860+144
ARGP4
ADDRGP4 $845
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1131
;1131:		}
ADDRGP4 $841
JUMPV
LABELV $840
line 1132
;1132:		else {
line 1133
;1133:			s_serveroptions.playerType[9].curvalue = 2;
ADDRGP4 s_serveroptions+2384+864+64
CNSTI4 2
ASGNI4
line 1134
;1134:		}
LABELV $841
line 1135
;1135:		s_serveroptions.playerType[10].curvalue = 2;
ADDRGP4 s_serveroptions+2384+960+64
CNSTI4 2
ASGNI4
line 1136
;1136:		s_serveroptions.playerType[11].curvalue = 2;
ADDRGP4 s_serveroptions+2384+1056+64
CNSTI4 2
ASGNI4
line 1138
;1137:
;1138:		return;
ADDRGP4 $808
JUMPV
LABELV $809
line 1141
;1139:	}
;1140:
;1141:	count = 1;	// skip the first slot, reserved for a human
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1144
;1142:
;1143:	// get info for this map
;1144:	arenaInfo = UI_GetArenaInfoByMap( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+5828
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1048
INDIRP4
ASGNP4
line 1147
;1145:
;1146:	// get the bot info - we'll seed with them if any are listed
;1147:	Q_strncpyz( bots, Info_ValueForKey( arenaInfo, "bots" ), sizeof(bots) );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $856
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1148
;1148:	p = &bots[0];
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $858
JUMPV
line 1149
;1149:	while( *p && count < PLAYER_SLOTS ) {
LABELV $860
line 1151
;1150:		//skip spaces
;1151:		while( *p && *p == ' ' ) {
line 1152
;1152:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1153
;1153:		}
LABELV $861
line 1151
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $863
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $860
LABELV $863
line 1154
;1154:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $864
line 1155
;1155:			break;
ADDRGP4 $859
JUMPV
LABELV $864
line 1159
;1156:		}
;1157:
;1158:		// mark start of bot name
;1159:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $867
JUMPV
LABELV $866
line 1162
;1160:
;1161:		// skip until space of null
;1162:		while( *p && *p != ' ' ) {
line 1163
;1163:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1164
;1164:		}
LABELV $867
line 1162
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $869
ADDRLP4 1060
INDIRI4
CNSTI4 32
NEI4 $866
LABELV $869
line 1165
;1165:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $870
line 1166
;1166:			*p++ = 0;
ADDRLP4 1064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1064
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI1 0
ASGNI1
line 1167
;1167:		}
LABELV $870
line 1169
;1168:
;1169:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1064
INDIRP4
ASGNP4
line 1170
;1170:		bot = Info_ValueForKey( botInfo, "name" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
ADDRLP4 1068
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1068
INDIRP4
ASGNP4
line 1172
;1171:
;1172:		Q_strncpyz( s_serveroptions.playerNameBuffers[count], bot, sizeof(s_serveroptions.playerNameBuffers[count]) );
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1173
;1173:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1174
;1174:	}
LABELV $858
line 1149
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $874
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $861
LABELV $874
LABELV $859
line 1177
;1175:
;1176:	// set the rest of the bot slots to "---"
;1177:	for( n = count; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $878
JUMPV
LABELV $875
line 1178
;1178:		strcpy( s_serveroptions.playerNameBuffers[n], "--------" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ARGP4
ADDRGP4 $880
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1179
;1179:	}
LABELV $876
line 1177
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $878
ADDRLP4 12
INDIRI4
CNSTI4 12
LTI4 $875
line 1182
;1180:
;1181:	// pad up to #8 as open slots
;1182:	for( ;count < 8; count++ ) {
ADDRGP4 $884
JUMPV
LABELV $881
line 1183
;1183:		s_serveroptions.playerType[count].curvalue = 0;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
CNSTI4 0
ASGNI4
line 1184
;1184:	}
LABELV $882
line 1182
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $884
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $881
line 1187
;1185:
;1186:	// close off the rest by default
;1187:	for( ;count < PLAYER_SLOTS; count++ ) {
ADDRGP4 $890
JUMPV
LABELV $887
line 1188
;1188:		if( s_serveroptions.playerType[count].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $891
line 1189
;1189:			s_serveroptions.playerType[count].curvalue = 2;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+64
ADDP4
CNSTI4 2
ASGNI4
line 1190
;1190:		}
LABELV $891
line 1191
;1191:	}
LABELV $888
line 1187
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $890
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $887
line 1192
;1192:}
LABELV $808
endproc ServerOptions_InitBotNames 1072 12
bss
align 1
LABELV $898
skip 64
code
proc ServerOptions_SetMenuItems 84 16
line 1200
;1193:
;1194:
;1195:/*
;1196:=================
;1197:ServerOptions_SetMenuItems
;1198:=================
;1199:*/
;1200:static void ServerOptions_SetMenuItems( void ) {
line 1203
;1201:	static char picname[64];
;1202:
;1203:	switch( s_serveroptions.gametype ) {
ADDRLP4 0
ADDRGP4 s_serveroptions+5820
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $899
ADDRLP4 0
INDIRI4
CNSTI4 4
GTI4 $899
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $938
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $938
address $902
address $910
address $899
address $917
address $927
code
LABELV $902
LABELV $899
line 1206
;1204:	case GT_FFA:
;1205:	default:
;1206:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_fraglimit" ) ) );
ADDRGP4 $611
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+964+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1207
;1207:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_timelimit" ) ) );
ADDRGP4 $612
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1208
;1208:		break;
ADDRGP4 $900
JUMPV
LABELV $910
line 1211
;1209:
;1210:	case GT_TOURNAMENT:
;1211:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_fraglimit" ) ) );
ADDRGP4 $614
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+964+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1212
;1212:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_timelimit" ) ) );
ADDRGP4 $615
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 32
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1213
;1213:		break;
ADDRGP4 $900
JUMPV
LABELV $917
line 1216
;1214:
;1215:	case GT_TEAM:
;1216:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_fraglimit" ) ) );
ADDRGP4 $617
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+964+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1217
;1217:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_timelimit" ) ) );
ADDRGP4 $618
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 48
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1218
;1218:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_team_friendly" ) );
ADDRGP4 $926
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1692+60
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 1219
;1219:		break;
ADDRGP4 $900
JUMPV
LABELV $927
line 1222
;1220:
;1221:	case GT_CTF:
;1222:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $931
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1223
;1223:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_timelimit" ) ) );
ADDRGP4 $622
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 72
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1224
;1224:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_friendly" ) );
ADDRGP4 $937
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1692+60
ADDRLP4 80
INDIRF4
CVFI4 4
ASGNI4
line 1225
;1225:		break;
LABELV $900
line 1228
;1226:	}
;1227:
;1228:	if(s_serveroptions.gamemode == 3)
ADDRGP4 s_serveroptions+5824
INDIRI4
CNSTI4 3
NEI4 $939
line 1229
;1229:	{
line 1230
;1230:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $931
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1231
;1231:	}
LABELV $939
line 1232
;1232:	if(s_serveroptions.gametype == 4)
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 4
NEI4 $945
line 1233
;1233:	{
line 1234
;1234:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $931
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $906
ARGP4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1235
;1235:	}
LABELV $945
line 1237
;1236:
;1237:	Q_strncpyz( s_serveroptions.hostname.field.buffer, UI_Cvar_VariableString( "sv_hostname" ), sizeof( s_serveroptions.hostname.field.buffer ) );
ADDRGP4 $637
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_serveroptions+1820+60+12
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1238
;1238:	s_serveroptions.pure.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_pure" ) );
ADDRGP4 $636
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2152+60
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1241
;1239:
;1240:	// set the map pic 
;1241:	Com_sprintf( picname, 128, "levelshots/%s", s_startserver.maplist[s_startserver.currentmap] ); // Changed length from 64
ADDRGP4 $898
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $109
ARGP4
CNSTI4 254
ADDRGP4 s_startserver+1940
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1242
;1242:	s_serveroptions.mappic.generic.name = picname;
ADDRGP4 s_serveroptions+360+4
ADDRGP4 $898
ASGNP4
line 1245
;1243:
;1244:	// set the map name - Why do we need to do this?
;1245:	strcpy( s_serveroptions.mapnamebuffer, s_startserver.mapname.string );
ADDRGP4 s_serveroptions+5828
ARGP4
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1248
;1246:
;1247:	//Q_strupr( s_startserver.mapname.string ); // Shafe - Try this?
;1248:	Q_strupr( s_serveroptions.mapnamebuffer );  // Create Match Thing - Shafe
ADDRGP4 s_serveroptions+5828
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1251
;1249:
;1250:	// get the player selections initialized
;1251:	ServerOptions_InitPlayerItems();
ADDRGP4 ServerOptions_InitPlayerItems
CALLV
pop
line 1252
;1252:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1255
;1253:
;1254:	// seed bot names
;1255:	ServerOptions_InitBotNames();
ADDRGP4 ServerOptions_InitBotNames
CALLV
pop
line 1256
;1256:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1257
;1257:}
LABELV $897
endproc ServerOptions_SetMenuItems 84 16
proc PlayerName_Draw 48 20
line 1264
;1258:
;1259:/*
;1260:=================
;1261:PlayerName_Draw
;1262:=================
;1263:*/
;1264:static void PlayerName_Draw( void *item ) {
line 1271
;1265:	menutext_s	*s;
;1266:	float		*color;
;1267:	int			x, y;
;1268:	int			style;
;1269:	qboolean	focus;
;1270:
;1271:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1273
;1272:
;1273:	x = s->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1274
;1274:	y =	s->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1276
;1275:
;1276:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1277
;1277:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $969
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $970
JUMPV
LABELV $969
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $970
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1279
;1278:
;1279:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $971
line 1280
;1280:		color = text_color_disabled;
ADDRLP4 4
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $972
JUMPV
LABELV $971
line 1281
;1281:	else if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $973
line 1282
;1282:	{
line 1283
;1283:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1284
;1284:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1285
;1285:	}
ADDRGP4 $974
JUMPV
LABELV $973
line 1286
;1286:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $975
line 1287
;1287:	{
line 1288
;1288:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1289
;1289:		style |= UI_BLINK;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1290
;1290:	}
ADDRGP4 $976
JUMPV
LABELV $975
line 1292
;1291:	else
;1292:		color = text_color_normal;
ADDRLP4 4
ADDRGP4 text_color_normal
ASGNP4
LABELV $976
LABELV $974
LABELV $972
line 1294
;1293:
;1294:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $977
line 1295
;1295:	{
line 1297
;1296:		// draw cursor
;1297:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1298
;1298:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 1299
;1299:	}
LABELV $977
line 1301
;1300:
;1301:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1302
;1302:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->string, style|UI_LEFT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1303
;1303:}
LABELV $967
endproc PlayerName_Draw 48 20
proc ServerOptions_MenuInit 64 12
line 1313
;1304:
;1305:
;1306:/*
;1307:=================
;1308:ServerOptions_MenuInit
;1309:=================
;1310:*/
;1311:#define OPTIONS_X	456
;1312:
;1313:static void ServerOptions_MenuInit( qboolean multiplayer ) {
line 1317
;1314:	int		y;
;1315:	int		n;
;1316:
;1317:	memset( &s_serveroptions, 0 ,sizeof(serveroptions_t) );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6172
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1318
;1318:	s_serveroptions.multiplayer = multiplayer;
ADDRGP4 s_serveroptions+5816
ADDRFP4 0
INDIRI4
ASGNI4
line 1319
;1319:	s_serveroptions.gametype = (int)Com_Clamp( 0, 5, trap_Cvar_VariableValue( "g_gameType" ) );
ADDRGP4 $220
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1084227584
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+5820
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1320
;1320:	s_serveroptions.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_punkbuster" ) );
ADDRGP4 $641
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+6076+64
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1322
;1321:
;1322:	s_serveroptions.gamemode = (int)Com_Clamp( 0, 5, trap_Cvar_VariableValue( "g_gameMode" ) );
ADDRGP4 $221
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1084227584
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+5824
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1324
;1323:
;1324:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1326
;1325:
;1326:	s_serveroptions.menu.wrapAround = qtrue;
ADDRGP4 s_serveroptions+276
CNSTI4 1
ASGNI4
line 1327
;1327:	s_serveroptions.menu.fullscreen = qtrue;
ADDRGP4 s_serveroptions+280
CNSTI4 1
ASGNI4
line 1329
;1328:
;1329:	s_serveroptions.banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 s_serveroptions+288
CNSTI4 10
ASGNI4
line 1330
;1330:	s_serveroptions.banner.generic.x			= 320;
ADDRGP4 s_serveroptions+288+12
CNSTI4 320
ASGNI4
line 1331
;1331:	s_serveroptions.banner.generic.y			= 16;
ADDRGP4 s_serveroptions+288+16
CNSTI4 16
ASGNI4
line 1332
;1332:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $992
line 1333
;1333:		s_serveroptions.banner.string        = "GAME SERVER";
ADDRGP4 s_serveroptions+288+60
ADDRGP4 $997
ASGNP4
line 1334
;1334:	} else {
ADDRGP4 $993
JUMPV
LABELV $992
line 1335
;1335:		s_serveroptions.banner.string        = "PLAY OFFLINE";
ADDRGP4 s_serveroptions+288+60
ADDRGP4 $1000
ASGNP4
line 1336
;1336:	}
LABELV $993
line 1338
;1337:	//s_serveroptions.banner.string  				= "GAME SERVER";
;1338:	s_serveroptions.banner.color  				= color_white;
ADDRGP4 s_serveroptions+288+68
ADDRGP4 color_white
ASGNP4
line 1339
;1339:	s_serveroptions.banner.style  				= UI_CENTER;
ADDRGP4 s_serveroptions+288+64
CNSTI4 1
ASGNI4
line 1341
;1340:
;1341:	s_serveroptions.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+360
CNSTI4 6
ASGNI4
line 1342
;1342:	s_serveroptions.mappic.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_serveroptions+360+44
CNSTU4 16388
ASGNU4
line 1343
;1343:	s_serveroptions.mappic.generic.x			= 352;
ADDRGP4 s_serveroptions+360+12
CNSTI4 352
ASGNI4
line 1344
;1344:	s_serveroptions.mappic.generic.y			= 80;
ADDRGP4 s_serveroptions+360+16
CNSTI4 80
ASGNI4
line 1345
;1345:	s_serveroptions.mappic.width				= 160;
ADDRGP4 s_serveroptions+360+76
CNSTI4 160
ASGNI4
line 1346
;1346:	s_serveroptions.mappic.height				= 120;
ADDRGP4 s_serveroptions+360+80
CNSTI4 120
ASGNI4
line 1347
;1347:	s_serveroptions.mappic.errorpic				= GAMESERVER_UNKNOWNMAP;
ADDRGP4 s_serveroptions+360+64
ADDRGP4 $358
ASGNP4
line 1348
;1348:	s_serveroptions.mappic.generic.ownerdraw	= ServerOptions_LevelshotDraw;
ADDRGP4 s_serveroptions+360+56
ADDRGP4 ServerOptions_LevelshotDraw
ASGNP4
line 1350
;1349:
;1350:	s_serveroptions.picframe.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+448
CNSTI4 6
ASGNI4
line 1351
;1351:	s_serveroptions.picframe.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_serveroptions+448+44
CNSTU4 16452
ASGNU4
line 1352
;1352:	s_serveroptions.picframe.generic.x			= 352 - 38;
ADDRGP4 s_serveroptions+448+12
CNSTI4 314
ASGNI4
line 1353
;1353:	s_serveroptions.picframe.generic.y			= 80 - 40;
ADDRGP4 s_serveroptions+448+16
CNSTI4 40
ASGNI4
line 1354
;1354:	s_serveroptions.picframe.width  			= 320;
ADDRGP4 s_serveroptions+448+76
CNSTI4 320
ASGNI4
line 1355
;1355:	s_serveroptions.picframe.height  			= 320;
ADDRGP4 s_serveroptions+448+80
CNSTI4 320
ASGNI4
line 1356
;1356:	s_serveroptions.picframe.focuspic			= GAMESERVER_SELECT;
ADDRGP4 s_serveroptions+448+60
ADDRGP4 $386
ASGNP4
line 1358
;1357:
;1358:	y = 272;
ADDRLP4 4
CNSTI4 272
ASGNI4
line 1359
;1359:	if( s_serveroptions.gametype != GT_CTF && s_serveroptions.gamemode != 3 && s_serveroptions.gametype != 4) {
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRGP4 s_serveroptions+5820
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1033
ADDRGP4 s_serveroptions+5824
INDIRI4
CNSTI4 3
EQI4 $1033
ADDRGP4 s_serveroptions+5820
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1033
line 1361
;1360:	//if( s_serveroptions.gametype != GT_CTF && s_serveroptions.gametype != 4) {
;1361:		s_serveroptions.fraglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+964
CNSTI4 4
ASGNI4
line 1362
;1362:		s_serveroptions.fraglimit.generic.name       = "Frag Limit:";
ADDRGP4 s_serveroptions+964+4
ADDRGP4 $1041
ASGNP4
line 1363
;1363:		s_serveroptions.fraglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+964+44
CNSTU4 290
ASGNU4
line 1364
;1364:		s_serveroptions.fraglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+964+12
CNSTI4 456
ASGNI4
line 1365
;1365:		s_serveroptions.fraglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+964+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1366
;1366:		s_serveroptions.fraglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+964+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1367
;1367:		s_serveroptions.fraglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+964+60+8
CNSTI4 3
ASGNI4
line 1368
;1368:		s_serveroptions.fraglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+964+60+268
CNSTI4 3
ASGNI4
line 1369
;1369:	}
ADDRGP4 $1034
JUMPV
LABELV $1033
line 1370
;1370:	else {
line 1371
;1371:		s_serveroptions.flaglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1296
CNSTI4 4
ASGNI4
line 1372
;1372:		s_serveroptions.flaglimit.generic.name       = "Capture Limit:";
ADDRGP4 s_serveroptions+1296+4
ADDRGP4 $1059
ASGNP4
line 1373
;1373:		s_serveroptions.flaglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1296+44
CNSTU4 290
ASGNU4
line 1374
;1374:		s_serveroptions.flaglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+1296+12
CNSTI4 456
ASGNI4
line 1375
;1375:		s_serveroptions.flaglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+1296+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1376
;1376:		s_serveroptions.flaglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+1296+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1377
;1377:		s_serveroptions.flaglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+1296+60+8
CNSTI4 3
ASGNI4
line 1378
;1378:		s_serveroptions.flaglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+1296+60+268
CNSTI4 3
ASGNI4
line 1379
;1379:	}
LABELV $1034
line 1381
;1380:
;1381:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1382
;1382:	s_serveroptions.timelimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+632
CNSTI4 4
ASGNI4
line 1383
;1383:	s_serveroptions.timelimit.generic.name       = "Time Limit:";
ADDRGP4 s_serveroptions+632+4
ADDRGP4 $1077
ASGNP4
line 1384
;1384:	s_serveroptions.timelimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+632+44
CNSTU4 290
ASGNU4
line 1385
;1385:	s_serveroptions.timelimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+632+12
CNSTI4 456
ASGNI4
line 1386
;1386:	s_serveroptions.timelimit.generic.y	         = y;
ADDRGP4 s_serveroptions+632+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1387
;1387:	s_serveroptions.timelimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+632+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1388
;1388:	s_serveroptions.timelimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+632+60+8
CNSTI4 3
ASGNI4
line 1389
;1389:	s_serveroptions.timelimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+632+60+268
CNSTI4 3
ASGNI4
line 1391
;1390:
;1391:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1392
;1392:	s_serveroptions.instagib.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1628
CNSTI4 5
ASGNI4
line 1393
;1393:	s_serveroptions.instagib.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1628+44
CNSTU4 258
ASGNU4
line 1394
;1394:	s_serveroptions.instagib.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1628+12
CNSTI4 456
ASGNI4
line 1395
;1395:	s_serveroptions.instagib.generic.y	      = y;
ADDRGP4 s_serveroptions+1628+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1396
;1396:	s_serveroptions.instagib.generic.name	  = "Instagib:";
ADDRGP4 s_serveroptions+1628+4
ADDRGP4 $1101
ASGNP4
line 1398
;1397:
;1398:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1399
;1399:	s_serveroptions.grapple.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1756
CNSTI4 5
ASGNI4
line 1400
;1400:	s_serveroptions.grapple.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1756+44
CNSTU4 258
ASGNU4
line 1401
;1401:	s_serveroptions.grapple.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1756+12
CNSTI4 456
ASGNI4
line 1402
;1402:	s_serveroptions.grapple.generic.y	      = y;
ADDRGP4 s_serveroptions+1756+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1403
;1403:	s_serveroptions.grapple.generic.name	  = "Grapple Hook:";
ADDRGP4 s_serveroptions+1756+4
ADDRGP4 $1111
ASGNP4
line 1405
;1404:
;1405:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $1112
line 1406
;1406:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1407
;1407:		s_serveroptions.friendlyfire.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1692
CNSTI4 5
ASGNI4
line 1408
;1408:		s_serveroptions.friendlyfire.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1692+44
CNSTU4 258
ASGNU4
line 1409
;1409:		s_serveroptions.friendlyfire.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1692+12
CNSTI4 456
ASGNI4
line 1410
;1410:		s_serveroptions.friendlyfire.generic.y	      = y;
ADDRGP4 s_serveroptions+1692+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1411
;1411:		s_serveroptions.friendlyfire.generic.name	  = "Friendly Fire:";
ADDRGP4 s_serveroptions+1692+4
ADDRGP4 $1124
ASGNP4
line 1412
;1412:	}
LABELV $1112
line 1414
;1413:
;1414:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1415
;1415:	s_serveroptions.pure.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2152
CNSTI4 5
ASGNI4
line 1416
;1416:	s_serveroptions.pure.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2152+44
CNSTU4 258
ASGNU4
line 1417
;1417:	s_serveroptions.pure.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2152+12
CNSTI4 456
ASGNI4
line 1418
;1418:	s_serveroptions.pure.generic.y				= y;
ADDRGP4 s_serveroptions+2152+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1419
;1419:	s_serveroptions.pure.generic.name			= "Pure Server:";
ADDRGP4 s_serveroptions+2152+4
ADDRGP4 $1134
ASGNP4
line 1421
;1420:
;1421:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $1135
line 1423
;1422:
;1423:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1424
;1424:		s_serveroptions.dedicated.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+536
CNSTI4 3
ASGNI4
line 1425
;1425:		s_serveroptions.dedicated.generic.id		= ID_DEDICATED;
ADDRGP4 s_serveroptions+536+8
CNSTI4 22
ASGNI4
line 1426
;1426:		s_serveroptions.dedicated.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+536+44
CNSTU4 258
ASGNU4
line 1427
;1427:		s_serveroptions.dedicated.generic.callback	= ServerOptions_Event;
ADDRGP4 s_serveroptions+536+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1428
;1428:		s_serveroptions.dedicated.generic.x			= OPTIONS_X;
ADDRGP4 s_serveroptions+536+12
CNSTI4 456
ASGNI4
line 1429
;1429:		s_serveroptions.dedicated.generic.y			= y;
ADDRGP4 s_serveroptions+536+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1430
;1430:		s_serveroptions.dedicated.generic.name		= "Dedicated:";
ADDRGP4 s_serveroptions+536+4
ADDRGP4 $1151
ASGNP4
line 1431
;1431:		s_serveroptions.dedicated.itemnames			= dedicated_list;
ADDRGP4 s_serveroptions+536+76
ADDRGP4 dedicated_list
ASGNP4
line 1432
;1432:	}
LABELV $1135
line 1434
;1433:
;1434:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $1154
line 1435
;1435:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1436
;1436:		s_serveroptions.hostname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1820
CNSTI4 4
ASGNI4
line 1437
;1437:		s_serveroptions.hostname.generic.name       = "Hostname:";
ADDRGP4 s_serveroptions+1820+4
ADDRGP4 $1160
ASGNP4
line 1438
;1438:		s_serveroptions.hostname.generic.flags      = QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1820+44
CNSTU4 2
ASGNU4
line 1439
;1439:		s_serveroptions.hostname.generic.x          = OPTIONS_X;
ADDRGP4 s_serveroptions+1820+12
CNSTI4 456
ASGNI4
line 1440
;1440:		s_serveroptions.hostname.generic.y	        = y;
ADDRGP4 s_serveroptions+1820+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1441
;1441:		s_serveroptions.hostname.field.widthInChars = 18;
ADDRGP4 s_serveroptions+1820+60+8
CNSTI4 18
ASGNI4
line 1442
;1442:		s_serveroptions.hostname.field.maxchars     = 64;
ADDRGP4 s_serveroptions+1820+60+268
CNSTI4 64
ASGNI4
line 1443
;1443:	}
LABELV $1154
line 1445
;1444:
;1445:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1446
;1446:	s_serveroptions.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+6076
CNSTI4 3
ASGNI4
line 1447
;1447:	s_serveroptions.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 s_serveroptions+6076+4
ADDRGP4 $1176
ASGNP4
line 1448
;1448:	s_serveroptions.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+6076+44
CNSTU4 258
ASGNU4
line 1449
;1449:	s_serveroptions.punkbuster.generic.id			= 0;
ADDRGP4 s_serveroptions+6076+8
CNSTI4 0
ASGNI4
line 1450
;1450:	s_serveroptions.punkbuster.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+6076+12
CNSTI4 456
ASGNI4
line 1451
;1451:	s_serveroptions.punkbuster.generic.y				= y;
ADDRGP4 s_serveroptions+6076+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1452
;1452:	s_serveroptions.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 s_serveroptions+6076+76
ADDRGP4 punkbuster_items
ASGNP4
line 1454
;1453:	
;1454:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1455
;1455:	s_serveroptions.botSkill.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2216
CNSTI4 3
ASGNI4
line 1456
;1456:	s_serveroptions.botSkill.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2216+44
CNSTU4 258
ASGNU4
line 1457
;1457:	s_serveroptions.botSkill.generic.name			= "Bot Skill:  ";
ADDRGP4 s_serveroptions+2216+4
ADDRGP4 $1192
ASGNP4
line 1458
;1458:	s_serveroptions.botSkill.generic.x				= 32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2216+4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_serveroptions+2216+12
ADDRLP4 36
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
ASGNI4
line 1459
;1459:	s_serveroptions.botSkill.generic.y				= y;
ADDRGP4 s_serveroptions+2216+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1460
;1460:	s_serveroptions.botSkill.itemnames				= botSkill_list;
ADDRGP4 s_serveroptions+2216+76
ADDRGP4 botSkill_list
ASGNP4
line 1461
;1461:	s_serveroptions.botSkill.curvalue				= 1;
ADDRGP4 s_serveroptions+2216+64
CNSTI4 1
ASGNI4
line 1463
;1462:
;1463:	y += ( 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1464
;1464:	s_serveroptions.player0.generic.type			= MTYPE_TEXT;
ADDRGP4 s_serveroptions+2312
CNSTI4 7
ASGNI4
line 1465
;1465:	s_serveroptions.player0.generic.flags			= QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2312+44
CNSTU4 2
ASGNU4
line 1466
;1466:	s_serveroptions.player0.generic.x				= 32 + SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2312+12
CNSTI4 40
ASGNI4
line 1467
;1467:	s_serveroptions.player0.generic.y				= y;
ADDRGP4 s_serveroptions+2312+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1468
;1468:	s_serveroptions.player0.color					= color_orange;
ADDRGP4 s_serveroptions+2312+68
ADDRGP4 color_orange
ASGNP4
line 1469
;1469:	s_serveroptions.player0.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_serveroptions+2312+64
CNSTI4 16
ASGNI4
line 1471
;1470:
;1471:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1214
line 1472
;1472:		s_serveroptions.playerType[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384
ADDP4
CNSTI4 3
ASGNI4
line 1473
;1473:		s_serveroptions.playerType[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+44
ADDP4
CNSTU4 2
ASGNU4
line 1474
;1474:		s_serveroptions.playerType[n].generic.id		= ID_PLAYER_TYPE;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+8
ADDP4
CNSTI4 20
ASGNI4
line 1475
;1475:		s_serveroptions.playerType[n].generic.callback	= ServerOptions_Event;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+48
ADDP4
ADDRGP4 ServerOptions_Event
ASGNP4
line 1476
;1476:		s_serveroptions.playerType[n].generic.x			= 32;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+12
ADDP4
CNSTI4 32
ASGNI4
line 1477
;1477:		s_serveroptions.playerType[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1478
;1478:		s_serveroptions.playerType[n].itemnames			= playerType_list;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384+76
ADDP4
ADDRGP4 playerType_list
ASGNP4
line 1480
;1479:
;1480:		s_serveroptions.playerName[n].generic.type		= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536
ADDP4
CNSTI4 7
ASGNI4
line 1481
;1481:		s_serveroptions.playerName[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+44
ADDP4
CNSTU4 2
ASGNU4
line 1482
;1482:		s_serveroptions.playerName[n].generic.x			= 96;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+12
ADDP4
CNSTI4 96
ASGNI4
line 1483
;1483:		s_serveroptions.playerName[n].generic.y			= y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1484
;1484:		s_serveroptions.playerName[n].generic.callback	= ServerOptions_PlayerNameEvent;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+48
ADDP4
ADDRGP4 ServerOptions_PlayerNameEvent
ASGNP4
line 1485
;1485:		s_serveroptions.playerName[n].generic.id		= n;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1486
;1486:		s_serveroptions.playerName[n].generic.ownerdraw	= PlayerName_Draw;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+56
ADDP4
ADDRGP4 PlayerName_Draw
ASGNP4
line 1487
;1487:		s_serveroptions.playerName[n].color				= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1488
;1488:		s_serveroptions.playerName[n].style				= UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+64
ADDP4
CNSTI4 16
ASGNI4
line 1489
;1489:		s_serveroptions.playerName[n].string			= s_serveroptions.playerNameBuffers[n];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5860
ADDP4
ASGNP4
line 1490
;1490:		s_serveroptions.playerName[n].generic.top		= s_serveroptions.playerName[n].generic.y;
ADDRLP4 48
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 s_serveroptions+3536+24
ADDP4
ADDRLP4 48
INDIRI4
ADDRGP4 s_serveroptions+3536+16
ADDP4
INDIRI4
ASGNI4
line 1491
;1491:		s_serveroptions.playerName[n].generic.bottom	= s_serveroptions.playerName[n].generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 52
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 52
INDIRI4
ADDRGP4 s_serveroptions+3536+32
ADDP4
ADDRLP4 52
INDIRI4
ADDRGP4 s_serveroptions+3536+16
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1492
;1492:		s_serveroptions.playerName[n].generic.left		= s_serveroptions.playerName[n].generic.x - SMALLCHAR_HEIGHT/ 2;
ADDRLP4 56
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 s_serveroptions+3536+20
ADDP4
ADDRLP4 56
INDIRI4
ADDRGP4 s_serveroptions+3536+12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1493
;1493:		s_serveroptions.playerName[n].generic.right		= s_serveroptions.playerName[n].generic.x + 16 * SMALLCHAR_WIDTH;
ADDRLP4 60
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 s_serveroptions+3536+28
ADDP4
ADDRLP4 60
INDIRI4
ADDRGP4 s_serveroptions+3536+12
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1495
;1494:
;1495:		s_serveroptions.playerTeam[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400
ADDP4
CNSTI4 3
ASGNI4
line 1496
;1496:		s_serveroptions.playerTeam[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+44
ADDP4
CNSTU4 2
ASGNU4
line 1497
;1497:		s_serveroptions.playerTeam[n].generic.x			= 240;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+12
ADDP4
CNSTI4 240
ASGNI4
line 1498
;1498:		s_serveroptions.playerTeam[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1499
;1499:		s_serveroptions.playerTeam[n].itemnames			= playerTeam_list;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400+76
ADDP4
ADDRGP4 playerTeam_list
ASGNP4
line 1501
;1500:
;1501:		y += ( SMALLCHAR_HEIGHT + 4 );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1502
;1502:	}
LABELV $1215
line 1471
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1214
line 1504
;1503:
;1504:	s_serveroptions.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5728
CNSTI4 6
ASGNI4
line 1505
;1505:	s_serveroptions.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_serveroptions+5728+4
ADDRGP4 $453
ASGNP4
line 1506
;1506:	s_serveroptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5728+44
CNSTU4 260
ASGNU4
line 1507
;1507:	s_serveroptions.back.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5728+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1508
;1508:	s_serveroptions.back.generic.id	      = ID_BACK;
ADDRGP4 s_serveroptions+5728+8
CNSTI4 24
ASGNI4
line 1509
;1509:	s_serveroptions.back.generic.x		  = 0;
ADDRGP4 s_serveroptions+5728+12
CNSTI4 0
ASGNI4
line 1510
;1510:	s_serveroptions.back.generic.y		  = 480-64;
ADDRGP4 s_serveroptions+5728+16
CNSTI4 416
ASGNI4
line 1511
;1511:	s_serveroptions.back.width  		  = 128;
ADDRGP4 s_serveroptions+5728+76
CNSTI4 128
ASGNI4
line 1512
;1512:	s_serveroptions.back.height  		  = 64;
ADDRGP4 s_serveroptions+5728+80
CNSTI4 64
ASGNI4
line 1513
;1513:	s_serveroptions.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_serveroptions+5728+60
ADDRGP4 $470
ASGNP4
line 1515
;1514:
;1515:	s_serveroptions.next.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5640
CNSTI4 6
ASGNI4
line 1516
;1516:	s_serveroptions.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_serveroptions+5640+4
ADDRGP4 $474
ASGNP4
line 1517
;1517:	s_serveroptions.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE|QMF_GRAYED|QMF_HIDDEN;
ADDRGP4 s_serveroptions+5640+44
CNSTU4 28944
ASGNU4
line 1518
;1518:	s_serveroptions.next.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5640+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1519
;1519:	s_serveroptions.next.generic.id	      = ID_STARTSERVERNEXT;
ADDRGP4 s_serveroptions+5640+8
CNSTI4 18
ASGNI4
line 1520
;1520:	s_serveroptions.next.generic.x		  = 640;
ADDRGP4 s_serveroptions+5640+12
CNSTI4 640
ASGNI4
line 1521
;1521:	s_serveroptions.next.generic.y		  = 480-64-72;
ADDRGP4 s_serveroptions+5640+16
CNSTI4 344
ASGNI4
line 1522
;1522:	s_serveroptions.next.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+5640+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1523
;1523:	s_serveroptions.next.width  		  = 128;
ADDRGP4 s_serveroptions+5640+76
CNSTI4 128
ASGNI4
line 1524
;1524:	s_serveroptions.next.height  		  = 64;
ADDRGP4 s_serveroptions+5640+80
CNSTI4 64
ASGNI4
line 1525
;1525:	s_serveroptions.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_serveroptions+5640+60
ADDRGP4 $491
ASGNP4
line 1527
;1526:
;1527:	s_serveroptions.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5552
CNSTI4 6
ASGNI4
line 1528
;1528:	s_serveroptions.go.generic.name     = GAMESERVER_FIGHT0;
ADDRGP4 s_serveroptions+5552+4
ADDRGP4 $1319
ASGNP4
line 1529
;1529:	s_serveroptions.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5552+44
CNSTU4 272
ASGNU4
line 1530
;1530:	s_serveroptions.go.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5552+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1531
;1531:	s_serveroptions.go.generic.id	    = ID_GO;
ADDRGP4 s_serveroptions+5552+8
CNSTI4 23
ASGNI4
line 1532
;1532:	s_serveroptions.go.generic.x		= 640;
ADDRGP4 s_serveroptions+5552+12
CNSTI4 640
ASGNI4
line 1533
;1533:	s_serveroptions.go.generic.y		= 480-64;
ADDRGP4 s_serveroptions+5552+16
CNSTI4 416
ASGNI4
line 1534
;1534:	s_serveroptions.go.width  		    = 128;
ADDRGP4 s_serveroptions+5552+76
CNSTI4 128
ASGNI4
line 1535
;1535:	s_serveroptions.go.height  		    = 64;
ADDRGP4 s_serveroptions+5552+80
CNSTI4 64
ASGNI4
line 1536
;1536:	s_serveroptions.go.focuspic         = GAMESERVER_FIGHT1;
ADDRGP4 s_serveroptions+5552+60
ADDRGP4 $1336
ASGNP4
line 1538
;1537:
;1538:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.banner );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1540
;1539:
;1540:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.mappic );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1541
;1541:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.picframe );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1543
;1542:
;1543:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.botSkill );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2216
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1544
;1544:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.player0 );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2312
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1545
;1545:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1342
line 1546
;1546:		if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1346
line 1547
;1547:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerType[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2384
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1548
;1548:		}
LABELV $1346
line 1549
;1549:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerName[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3536
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1550
;1550:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $1350
line 1551
;1551:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerTeam[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4400
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1552
;1552:		}
LABELV $1350
line 1553
;1553:	}
LABELV $1343
line 1545
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1342
line 1555
;1554:
;1555:	if( s_serveroptions.gametype != GT_CTF && s_serveroptions.gamemode != 3) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 4
EQI4 $1354
ADDRGP4 s_serveroptions+5824
INDIRI4
CNSTI4 3
EQI4 $1354
line 1556
;1556:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.fraglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1557
;1557:	}
ADDRGP4 $1355
JUMPV
LABELV $1354
line 1558
;1558:	else {
line 1559
;1559:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.flaglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1560
;1560:	}
LABELV $1355
line 1561
;1561:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.timelimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1562
;1562:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5820
INDIRI4
CNSTI4 3
LTI4 $1361
line 1563
;1563:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.friendlyfire );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1692
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1564
;1564:	}
LABELV $1361
line 1565
;1565:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.instagib);
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1628
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1566
;1566:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.grapple);
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1756
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1568
;1567:	
;1568:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $1367
line 1569
;1569:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pure );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2152
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1570
;1570:	}
LABELV $1367
line 1572
;1571:	
;1572:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $1371
line 1573
;1573:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.dedicated );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1574
;1574:	}
LABELV $1371
line 1575
;1575:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5816
INDIRI4
CNSTI4 0
EQI4 $1375
line 1576
;1576:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.hostname );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1820
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1577
;1577:	}
LABELV $1375
line 1579
;1578:
;1579:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.back );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1580
;1580:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.next );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1581
;1581:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.go );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1585
;1582:
;1583:	//Menu_AddItem( &s_serveroptions.menu, (void*) &s_serveroptions.punkbuster );
;1584:	
;1585:	ServerOptions_SetMenuItems();
ADDRGP4 ServerOptions_SetMenuItems
CALLV
pop
line 1586
;1586:}
LABELV $979
endproc ServerOptions_MenuInit 64 12
export ServerOptions_Cache
proc ServerOptions_Cache 0 4
line 1593
;1587:
;1588:/*
;1589:=================
;1590:ServerOptions_Cache
;1591:=================
;1592:*/
;1593:void ServerOptions_Cache( void ) {
line 1594
;1594:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $453
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1595
;1595:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $470
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1596
;1596:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $1319
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1597
;1597:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $1336
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1598
;1598:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );
ADDRGP4 $386
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1599
;1599:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $358
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1600
;1600:}
LABELV $1382
endproc ServerOptions_Cache 0 4
proc UI_ServerOptionsMenu 0 4
line 1608
;1601:
;1602:
;1603:/*
;1604:=================
;1605:UI_ServerOptionsMenu
;1606:=================
;1607:*/
;1608:static void UI_ServerOptionsMenu( qboolean multiplayer ) {
line 1609
;1609:	ServerOptions_MenuInit( multiplayer );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ServerOptions_MenuInit
CALLV
pop
line 1610
;1610:	UI_PushMenu( &s_serveroptions.menu );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1611
;1611:}
LABELV $1383
endproc UI_ServerOptionsMenu 0 4
proc UI_BotSelectMenu_SortCompare 44 8
line 1672
;1612:
;1613:
;1614:
;1615:/*
;1616:=============================================================================
;1617:
;1618:BOT SELECT MENU *****
;1619:
;1620:=============================================================================
;1621:*/
;1622:
;1623:
;1624:#define BOTSELECT_BACK0			"menu/art/back_0"
;1625:#define BOTSELECT_BACK1			"menu/art/back_1"
;1626:#define BOTSELECT_ACCEPT0		"menu/art/accept_0"
;1627:#define BOTSELECT_ACCEPT1		"menu/art/accept_1"
;1628:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;1629:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;1630:#define BOTSELECT_ARROWS		"menu/art/gs_arrows_0"
;1631:#define BOTSELECT_ARROWSL		"menu/art/gs_arrows_l"
;1632:#define BOTSELECT_ARROWSR		"menu/art/gs_arrows_r"
;1633:
;1634:#define PLAYERGRID_COLS			4
;1635:#define PLAYERGRID_ROWS			4
;1636:#define MAX_MODELSPERPAGE		(PLAYERGRID_ROWS * PLAYERGRID_COLS)
;1637:
;1638:
;1639:typedef struct {
;1640:	menuframework_s	menu;
;1641:
;1642:	menutext_s		banner;
;1643:
;1644:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;1645:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;1646:	menutext_s		picnames[MAX_MODELSPERPAGE];
;1647:
;1648:	menubitmap_s	arrows;
;1649:	menubitmap_s	left;
;1650:	menubitmap_s	right;
;1651:
;1652:	menubitmap_s	go;
;1653:	menubitmap_s	back;
;1654:
;1655:	int				numBots;
;1656:	int				modelpage;
;1657:	int				numpages;
;1658:	int				selectedmodel;
;1659:	int				sortedBotNums[MAX_BOTS];
;1660:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;1661:	char			botnames[MAX_MODELSPERPAGE][16];
;1662:} botSelectInfo_t;
;1663:
;1664:static botSelectInfo_t	botSelectInfo;
;1665:
;1666:
;1667:/*
;1668:=================
;1669:UI_BotSelectMenu_SortCompare
;1670:=================
;1671:*/
;1672:static int QDECL UI_BotSelectMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 1677
;1673:	int			num1, num2;
;1674:	const char	*info1, *info2;
;1675:	const char	*name1, *name2;
;1676:
;1677:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1678
;1678:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1680
;1679:
;1680:	info1 = UI_GetBotInfoByNumber( num1 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1681
;1681:	info2 = UI_GetBotInfoByNumber( num2 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 1683
;1682:
;1683:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1684
;1684:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 1686
;1685:
;1686:	return Q_stricmp( name1, name2 );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $1385
endproc UI_BotSelectMenu_SortCompare 44 8
proc UI_BotSelectMenu_BuildList 12 16
line 1695
;1687:}
;1688:
;1689:
;1690:/*
;1691:=================
;1692:UI_BotSelectMenu_BuildList
;1693:=================
;1694:*/
;1695:static void UI_BotSelectMenu_BuildList( void ) {
line 1698
;1696:	int		n;
;1697:
;1698:	botSelectInfo.modelpage = 0;
ADDRGP4 botSelectInfo+4772
CNSTI4 0
ASGNI4
line 1699
;1699:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+4768
ADDRLP4 4
INDIRI4
ASGNI4
line 1700
;1700:	botSelectInfo.numpages = botSelectInfo.numBots / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4776
ADDRGP4 botSelectInfo+4768
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1701
;1701:	if( botSelectInfo.numBots % MAX_MODELSPERPAGE ) {
ADDRGP4 botSelectInfo+4768
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $1391
line 1702
;1702:		botSelectInfo.numpages++;
ADDRLP4 8
ADDRGP4 botSelectInfo+4776
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1703
;1703:	}
LABELV $1391
line 1706
;1704:
;1705:	// initialize the array
;1706:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1398
JUMPV
LABELV $1395
line 1707
;1707:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1708
;1708:	}
LABELV $1396
line 1706
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1398
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1395
line 1711
;1709:
;1710:	// now sort it
;1711:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelectMenu_SortCompare );
ADDRGP4 botSelectInfo+4784
ARGP4
ADDRGP4 botSelectInfo+4768
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_BotSelectMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1712
;1712:}
LABELV $1386
endproc UI_BotSelectMenu_BuildList 12 16
proc ServerPlayerIcon 80 20
line 1720
;1713:
;1714:
;1715:/*
;1716:=================
;1717:ServerPlayerIcon
;1718:=================
;1719:*/
;1720:static void ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 1724
;1721:	char	*skin;
;1722:	char	model[MAX_QPATH];
;1723:
;1724:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1725
;1725:	skin = Q_strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 1726
;1726:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1405
line 1727
;1727:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 1728
;1728:	}
ADDRGP4 $1406
JUMPV
LABELV $1405
line 1729
;1729:	else {
line 1730
;1730:		skin = "default";
ADDRLP4 0
ADDRGP4 $1407
ASGNP4
line 1731
;1731:	}
LABELV $1406
line 1733
;1732:
;1733:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1408
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1735
;1734:
;1735:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1409
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1407
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1409
line 1736
;1736:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1411
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1737
;1737:	}
LABELV $1409
line 1738
;1738:}
LABELV $1404
endproc ServerPlayerIcon 80 20
proc UI_BotSelectMenu_UpdateGrid 36 12
line 1746
;1739:
;1740:
;1741:/*
;1742:=================
;1743:UI_BotSelectMenu_UpdateGrid
;1744:=================
;1745:*/
;1746:static void UI_BotSelectMenu_UpdateGrid( void ) {
line 1751
;1747:	const char	*info;
;1748:	int			i;
;1749:    int			j;
;1750:
;1751:	j = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1752
;1752:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1414
line 1753
;1753:		if( j < botSelectInfo.numBots ) { 
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
GEI4 $1418
line 1754
;1754:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 1755
;1755:			ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1422
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+8880
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 ServerPlayerIcon
CALLV
pop
line 1756
;1756:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), 16 );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
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
line 1757
;1757:			Q_CleanStr( botSelectInfo.botnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1758
;1758: 			botSelectInfo.pics[i].generic.name = botSelectInfo.boticons[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+8880
ADDP4
ASGNP4
line 1759
;1759:			if( BotAlreadySelected( botSelectInfo.botnames[i] ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BotAlreadySelected
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1429
line 1760
;1760:				botSelectInfo.picnames[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 1761
;1761:			}
ADDRGP4 $1430
JUMPV
LABELV $1429
line 1762
;1762:			else {
line 1763
;1763:				botSelectInfo.picnames[i].color = color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1764
;1764:			}
LABELV $1430
line 1765
;1765:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 32
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1766
;1766:		}
ADDRGP4 $1419
JUMPV
LABELV $1418
line 1767
;1767:		else {
line 1769
;1768:			// dead slot
;1769: 			botSelectInfo.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
CNSTP4 0
ASGNP4
line 1770
;1770:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1771
;1771:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
CNSTI1 0
ASGNI1
line 1772
;1772:		}
LABELV $1419
line 1774
;1773:
;1774: 		botSelectInfo.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1775
;1775: 		botSelectInfo.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+68
ADDP4
CNSTI4 0
ASGNI4
line 1776
;1776: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1777
;1777:	}
LABELV $1415
line 1752
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1414
line 1780
;1778:
;1779:	// set selected model
;1780:	i = botSelectInfo.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 botSelectInfo+4780
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 1781
;1781:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1782
;1782:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1784
;1783:
;1784:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
LEI4 $1454
line 1785
;1785:		if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 0
LEI4 $1457
line 1786
;1786:			botSelectInfo.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4416+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1787
;1787:		}
ADDRGP4 $1458
JUMPV
LABELV $1457
line 1788
;1788:		else {
line 1789
;1789:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4416+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1790
;1790:		}
LABELV $1458
line 1792
;1791:
;1792:		if( botSelectInfo.modelpage < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1464
line 1793
;1793:			botSelectInfo.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4504+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1794
;1794:		}
ADDRGP4 $1455
JUMPV
LABELV $1464
line 1795
;1795:		else {
line 1796
;1796:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4504+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1797
;1797:		}
line 1798
;1798:	}
ADDRGP4 $1455
JUMPV
LABELV $1454
line 1799
;1799:	else {
line 1801
;1800:		// hide left/right markers
;1801:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4416+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1802
;1802:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 botSelectInfo+4504+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1803
;1803:	}
LABELV $1455
line 1804
;1804:}
LABELV $1412
endproc UI_BotSelectMenu_UpdateGrid 36 12
proc UI_BotSelectMenu_Default 28 8
line 1812
;1805:
;1806:
;1807:/*
;1808:=================
;1809:UI_BotSelectMenu_Default
;1810:=================
;1811:*/
;1812:static void UI_BotSelectMenu_Default( char *bot ) {
line 1818
;1813:	const char	*botInfo;
;1814:	const char	*test;
;1815:	int			n;
;1816:	int			i;
;1817:
;1818:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1480
JUMPV
LABELV $1477
line 1819
;1819:		botInfo = UI_GetBotInfoByNumber( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1820
;1820:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $705
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1821
;1821:		if( Q_stricmp( bot, test ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1482
line 1822
;1822:			break;
ADDRGP4 $1479
JUMPV
LABELV $1482
line 1824
;1823:		}
;1824:	}
LABELV $1478
line 1818
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1480
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1477
LABELV $1479
line 1825
;1825:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
NEI4 $1484
line 1826
;1826:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4780
CNSTI4 0
ASGNI4
line 1827
;1827:		return;
ADDRGP4 $1476
JUMPV
LABELV $1484
line 1830
;1828:	}
;1829:
;1830:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1491
JUMPV
LABELV $1488
line 1831
;1831:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1493
line 1832
;1832:			break;
ADDRGP4 $1490
JUMPV
LABELV $1493
line 1834
;1833:		}
;1834:	}
LABELV $1489
line 1830
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1491
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1488
LABELV $1490
line 1835
;1835:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
NEI4 $1496
line 1836
;1836:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4780
CNSTI4 0
ASGNI4
line 1837
;1837:		return;
ADDRGP4 $1476
JUMPV
LABELV $1496
line 1840
;1838:	}
;1839:
;1840:	botSelectInfo.selectedmodel = i;
ADDRGP4 botSelectInfo+4780
ADDRLP4 4
INDIRI4
ASGNI4
line 1841
;1841:}
LABELV $1476
endproc UI_BotSelectMenu_Default 28 8
proc UI_BotSelectMenu_LeftEvent 4 0
line 1849
;1842:
;1843:
;1844:/*
;1845:=================
;1846:UI_BotSelectMenu_LeftEvent
;1847:=================
;1848:*/
;1849:static void UI_BotSelectMenu_LeftEvent( void* ptr, int event ) {
line 1850
;1850:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1502
line 1851
;1851:		return;
ADDRGP4 $1501
JUMPV
LABELV $1502
line 1853
;1852:	}
;1853:	if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 0
LEI4 $1504
line 1854
;1854:		botSelectInfo.modelpage--;
ADDRLP4 0
ADDRGP4 botSelectInfo+4772
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1855
;1855:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1856
;1856:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1857
;1857:	}
LABELV $1504
line 1858
;1858:}
LABELV $1501
endproc UI_BotSelectMenu_LeftEvent 4 0
proc UI_BotSelectMenu_RightEvent 4 0
line 1866
;1859:
;1860:
;1861:/*
;1862:=================
;1863:UI_BotSelectMenu_RightEvent
;1864:=================
;1865:*/
;1866:static void UI_BotSelectMenu_RightEvent( void* ptr, int event ) {
line 1867
;1867:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1511
line 1868
;1868:		return;
ADDRGP4 $1510
JUMPV
LABELV $1511
line 1870
;1869:	}
;1870:	if( botSelectInfo.modelpage < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1513
line 1871
;1871:		botSelectInfo.modelpage++;
ADDRLP4 0
ADDRGP4 botSelectInfo+4772
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1872
;1872:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1873
;1873:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1874
;1874:	}
LABELV $1513
line 1875
;1875:}
LABELV $1510
endproc UI_BotSelectMenu_RightEvent 4 0
proc UI_BotSelectMenu_BotEvent 12 0
line 1883
;1876:
;1877:
;1878:/*
;1879:=================
;1880:UI_BotSelectMenu_BotEvent
;1881:=================
;1882:*/
;1883:static void UI_BotSelectMenu_BotEvent( void* ptr, int event ) {
line 1886
;1884:	int		i;
;1885:
;1886:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1521
line 1887
;1887:		return;
ADDRGP4 $1520
JUMPV
LABELV $1521
line 1890
;1888:	}
;1889:
;1890:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1523
line 1891
;1891: 		botSelectInfo.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1892
;1892: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1893
;1893:	}
LABELV $1524
line 1890
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1523
line 1896
;1894:
;1895:	// set selected
;1896:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1897
;1897:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1898
;1898:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1899
;1899:	botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE + i;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1900
;1900:}
LABELV $1520
endproc UI_BotSelectMenu_BotEvent 12 0
proc UI_BotSelectMenu_BackEvent 0 0
line 1908
;1901:
;1902:
;1903:/*
;1904:=================
;1905:UI_BotSelectMenu_BackEvent
;1906:=================
;1907:*/
;1908:static void UI_BotSelectMenu_BackEvent( void* ptr, int event ) {
line 1909
;1909:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1538
line 1910
;1910:		return;
ADDRGP4 $1537
JUMPV
LABELV $1538
line 1912
;1911:	}
;1912:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1913
;1913:}
LABELV $1537
endproc UI_BotSelectMenu_BackEvent 0 0
proc UI_BotSelectMenu_SelectEvent 4 12
line 1921
;1914:
;1915:
;1916:/*
;1917:=================
;1918:UI_BotSelectMenu_SelectEvent
;1919:=================
;1920:*/
;1921:static void UI_BotSelectMenu_SelectEvent( void* ptr, int event ) {
line 1922
;1922:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1541
line 1923
;1923:		return;
ADDRGP4 $1540
JUMPV
LABELV $1541
line 1925
;1924:	}
;1925:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1927
;1926:
;1927:	s_serveroptions.newBot = qtrue;
ADDRGP4 s_serveroptions+6052
CNSTI4 1
ASGNI4
line 1928
;1928:	Q_strncpyz( s_serveroptions.newBotName, botSelectInfo.botnames[botSelectInfo.selectedmodel % MAX_MODELSPERPAGE], 16 );
ADDRGP4 s_serveroptions+6060
ARGP4
ADDRLP4 0
CNSTI4 16
ASGNI4
ADDRGP4 botSelectInfo+4780
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1929
;1929:}
LABELV $1540
endproc UI_BotSelectMenu_SelectEvent 4 12
export UI_BotSelectMenu_Cache
proc UI_BotSelectMenu_Cache 0 4
line 1937
;1930:
;1931:
;1932:/*
;1933:=================
;1934:UI_BotSelectMenu_Cache
;1935:=================
;1936:*/
;1937:void UI_BotSelectMenu_Cache( void ) {
line 1938
;1938:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $453
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1939
;1939:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $470
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1940
;1940:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $1548
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1941
;1941:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $1549
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1942
;1942:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $1550
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1943
;1943:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $1551
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1944
;1944:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $390
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1945
;1945:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $418
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1946
;1946:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $436
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1947
;1947:}
LABELV $1547
endproc UI_BotSelectMenu_Cache 0 4
proc UI_BotSelectMenu_Init 36 12
line 1950
;1948:
;1949:
;1950:static void UI_BotSelectMenu_Init( char *bot ) {
line 1954
;1951:	int		i, j, k;
;1952:	int		x, y;
;1953:
;1954:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10160
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1955
;1955:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+276
CNSTI4 1
ASGNI4
line 1956
;1956:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+280
CNSTI4 1
ASGNI4
line 1958
;1957:
;1958:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1960
;1959:
;1960:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+288
CNSTI4 10
ASGNI4
line 1961
;1961:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+288+12
CNSTI4 320
ASGNI4
line 1962
;1962:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+288+16
CNSTI4 16
ASGNI4
line 1963
;1963:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+288+60
ADDRGP4 $1562
ASGNP4
line 1964
;1964:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+288+68
ADDRGP4 color_white
ASGNP4
line 1965
;1965:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+288+64
CNSTI4 1
ASGNI4
line 1967
;1966:
;1967:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 1968
;1968:	for( i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $1570
JUMPV
LABELV $1567
line 1969
;1969:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 1970
;1970:		for( j = 0; j < PLAYERGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1571
line 1971
;1971:			botSelectInfo.pics[k].generic.type				= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360
ADDP4
CNSTI4 6
ASGNI4
line 1972
;1972:			botSelectInfo.pics[k].generic.flags				= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
CNSTU4 16388
ASGNU4
line 1973
;1973:			botSelectInfo.pics[k].generic.x					= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1974
;1974:			botSelectInfo.pics[k].generic.y					= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1975
;1975: 			botSelectInfo.pics[k].generic.name				= botSelectInfo.boticons[k];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+8880
ADDP4
ASGNP4
line 1976
;1976:			botSelectInfo.pics[k].width						= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+76
ADDP4
CNSTI4 64
ASGNI4
line 1977
;1977:			botSelectInfo.pics[k].height					= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+80
ADDP4
CNSTI4 64
ASGNI4
line 1978
;1978:			botSelectInfo.pics[k].focuspic					= BOTSELECT_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+60
ADDP4
ADDRGP4 $1551
ASGNP4
line 1979
;1979:			botSelectInfo.pics[k].focuscolor				= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1981
;1980:
;1981:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768
ADDP4
CNSTI4 6
ASGNI4
line 1982
;1982:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
CNSTU4 33028
ASGNU4
line 1983
;1983:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelectMenu_BotEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+48
ADDP4
ADDRGP4 UI_BotSelectMenu_BotEvent
ASGNP4
line 1984
;1984:			botSelectInfo.picbuttons[k].generic.id			= k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1985
;1985:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1986
;1986:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1987
;1987:			botSelectInfo.picbuttons[k].generic.left		= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1988
;1988:			botSelectInfo.picbuttons[k].generic.top			= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1989
;1989:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1990
;1990:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1991
;1991:			botSelectInfo.picbuttons[k].width				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+76
ADDP4
CNSTI4 128
ASGNI4
line 1992
;1992:			botSelectInfo.picbuttons[k].height				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+80
ADDP4
CNSTI4 128
ASGNI4
line 1993
;1993:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+60
ADDP4
ADDRGP4 $1550
ASGNP4
line 1994
;1994:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1996
;1995:
;1996:			botSelectInfo.picnames[k].generic.type			= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176
ADDP4
CNSTI4 7
ASGNI4
line 1997
;1997:			botSelectInfo.picnames[k].generic.flags			= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+44
ADDP4
CNSTU4 2
ASGNU4
line 1998
;1998:			botSelectInfo.picnames[k].generic.x				= x + 32;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1999
;1999:			botSelectInfo.picnames[k].generic.y				= y + 64;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 2000
;2000:			botSelectInfo.picnames[k].string				= botSelectInfo.botnames[k];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ASGNP4
line 2001
;2001:			botSelectInfo.picnames[k].color					= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 2002
;2002:			botSelectInfo.picnames[k].style					= UI_CENTER|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+64
ADDP4
CNSTI4 17
ASGNI4
line 2004
;2003:
;2004:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 2005
;2005:		}
LABELV $1572
line 1970
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $1571
line 2006
;2006:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 86
ADDI4
ASGNI4
line 2007
;2007:	}
LABELV $1568
line 1968
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1570
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1567
line 2009
;2008:
;2009:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4328
CNSTI4 6
ASGNI4
line 2010
;2010:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+4328+4
ADDRGP4 $390
ASGNP4
line 2011
;2011:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+4328+44
CNSTU4 16384
ASGNU4
line 2012
;2012:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+4328+12
CNSTI4 260
ASGNI4
line 2013
;2013:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+4328+16
CNSTI4 440
ASGNI4
line 2014
;2014:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+4328+76
CNSTI4 128
ASGNI4
line 2015
;2015:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+4328+80
CNSTI4 32
ASGNI4
line 2017
;2016:
;2017:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4416
CNSTI4 6
ASGNI4
line 2018
;2018:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4416+44
CNSTU4 260
ASGNU4
line 2019
;2019:	botSelectInfo.left.generic.callback		= UI_BotSelectMenu_LeftEvent;
ADDRGP4 botSelectInfo+4416+48
ADDRGP4 UI_BotSelectMenu_LeftEvent
ASGNP4
line 2020
;2020:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+4416+12
CNSTI4 260
ASGNI4
line 2021
;2021:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+4416+16
CNSTI4 440
ASGNI4
line 2022
;2022:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+4416+76
CNSTI4 64
ASGNI4
line 2023
;2023:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+4416+80
CNSTI4 32
ASGNI4
line 2024
;2024:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+4416+60
ADDRGP4 $418
ASGNP4
line 2026
;2025:
;2026:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4504
CNSTI4 6
ASGNI4
line 2027
;2027:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4504+44
CNSTU4 260
ASGNU4
line 2028
;2028:	botSelectInfo.right.generic.callback	= UI_BotSelectMenu_RightEvent;
ADDRGP4 botSelectInfo+4504+48
ADDRGP4 UI_BotSelectMenu_RightEvent
ASGNP4
line 2029
;2029:	botSelectInfo.right.generic.x			= 321;
ADDRGP4 botSelectInfo+4504+12
CNSTI4 321
ASGNI4
line 2030
;2030:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+4504+16
CNSTI4 440
ASGNI4
line 2031
;2031:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+4504+76
CNSTI4 64
ASGNI4
line 2032
;2032:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+4504+80
CNSTI4 32
ASGNI4
line 2033
;2033:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+4504+60
ADDRGP4 $436
ASGNP4
line 2035
;2034:
;2035:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4680
CNSTI4 6
ASGNI4
line 2036
;2036:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+4680+4
ADDRGP4 $453
ASGNP4
line 2037
;2037:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4680+44
CNSTU4 260
ASGNU4
line 2038
;2038:	botSelectInfo.back.generic.callback	= UI_BotSelectMenu_BackEvent;
ADDRGP4 botSelectInfo+4680+48
ADDRGP4 UI_BotSelectMenu_BackEvent
ASGNP4
line 2039
;2039:	botSelectInfo.back.generic.x		= 0;
ADDRGP4 botSelectInfo+4680+12
CNSTI4 0
ASGNI4
line 2040
;2040:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+4680+16
CNSTI4 416
ASGNI4
line 2041
;2041:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+4680+76
CNSTI4 128
ASGNI4
line 2042
;2042:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+4680+80
CNSTI4 64
ASGNI4
line 2043
;2043:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+4680+60
ADDRGP4 $470
ASGNP4
line 2045
;2044:
;2045:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4592
CNSTI4 6
ASGNI4
line 2046
;2046:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+4592+4
ADDRGP4 $1548
ASGNP4
line 2047
;2047:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4592+44
CNSTU4 272
ASGNU4
line 2048
;2048:	botSelectInfo.go.generic.callback	= UI_BotSelectMenu_SelectEvent;
ADDRGP4 botSelectInfo+4592+48
ADDRGP4 UI_BotSelectMenu_SelectEvent
ASGNP4
line 2049
;2049:	botSelectInfo.go.generic.x			= 640;
ADDRGP4 botSelectInfo+4592+12
CNSTI4 640
ASGNI4
line 2050
;2050:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+4592+16
CNSTI4 416
ASGNI4
line 2051
;2051:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+4592+76
CNSTI4 128
ASGNI4
line 2052
;2052:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+4592+80
CNSTI4 64
ASGNI4
line 2053
;2053:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+4592+60
ADDRGP4 $1549
ASGNP4
line 2055
;2054:
;2055:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2056
;2056:	for( i = 0; i < MAX_MODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1712
line 2057
;2057:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.pics[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2058
;2058:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2059
;2059:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picnames[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 72
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2060
;2060:	}
LABELV $1713
line 2056
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $1712
line 2061
;2061:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4328
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2062
;2062:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2063
;2063:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2064
;2064:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2065
;2065:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 2067
;2066:
;2067:	UI_BotSelectMenu_BuildList();
ADDRGP4 UI_BotSelectMenu_BuildList
CALLV
pop
line 2068
;2068:	UI_BotSelectMenu_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Default
CALLV
pop
line 2069
;2069:	botSelectInfo.modelpage = botSelectInfo.selectedmodel / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4772
ADDRGP4 botSelectInfo+4780
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 2070
;2070:	UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 2071
;2071:}
LABELV $1552
endproc UI_BotSelectMenu_Init 36 12
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 4
line 2079
;2072:
;2073:
;2074:/*
;2075:=================
;2076:UI_BotSelectMenu
;2077:=================
;2078:*/
;2079:void UI_BotSelectMenu( char *bot ) {
line 2080
;2080:	UI_BotSelectMenu_Init( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Init
CALLV
pop
line 2081
;2081:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 2082
;2082:}
LABELV $1726
endproc UI_BotSelectMenu 0 4
bss
align 4
LABELV botSelectInfo
skip 10160
align 4
LABELV s_serveroptions
skip 6172
import punkbuster_items
align 4
LABELV s_startserver
skip 67488
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
LABELV $1562
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $1551
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1550
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $1549
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1548
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1422
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1411
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
LABELV $1408
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $1407
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1336
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
LABELV $1319
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
LABELV $1192
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1176
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
LABELV $1160
byte 1 72
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1151
byte 1 68
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $1134
byte 1 80
byte 1 117
byte 1 114
byte 1 101
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
LABELV $1124
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $1111
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 72
byte 1 111
byte 1 111
byte 1 107
byte 1 58
byte 1 0
align 1
LABELV $1101
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 105
byte 1 98
byte 1 58
byte 1 0
align 1
LABELV $1077
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1059
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1041
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $1000
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $997
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $937
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
LABELV $931
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
LABELV $926
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
LABELV $906
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $880
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $856
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $845
byte 1 121
byte 1 105
byte 1 107
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $839
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $834
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $817
byte 1 116
byte 1 105
byte 1 107
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $814
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 117
byte 1 108
byte 1 111
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $797
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 78
byte 1 79
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $737
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $705
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $674
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $669
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
byte 1 10
byte 1 0
align 1
LABELV $665
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
LABELV $647
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $644
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
LABELV $641
byte 1 115
byte 1 118
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
LABELV $637
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
LABELV $636
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $635
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
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $634
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
LABELV $633
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
LABELV $632
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
LABELV $631
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
LABELV $630
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $629
byte 1 103
byte 1 95
byte 1 73
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 105
byte 1 98
byte 1 0
align 1
LABELV $628
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
LABELV $623
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
byte 1 116
byte 1 0
align 1
LABELV $622
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
LABELV $621
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
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
LABELV $619
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
byte 1 116
byte 1 0
align 1
LABELV $618
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
LABELV $617
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
LABELV $615
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
LABELV $614
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
LABELV $612
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
LABELV $611
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
LABELV $551
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 0
align 1
LABELV $550
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 52
byte 1 0
align 1
LABELV $549
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 51
byte 1 0
align 1
LABELV $548
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 50
byte 1 0
align 1
LABELV $547
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $546
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $545
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $544
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $543
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $542
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $541
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
LABELV $540
byte 1 76
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $539
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $521
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
LABELV $491
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
LABELV $474
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
LABELV $470
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
LABELV $453
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
LABELV $436
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $418
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $390
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $386
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
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $358
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
LABELV $355
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
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $323
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
LABELV $309
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
LABELV $295
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
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $287
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
byte 1 0
align 1
LABELV $252
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $251
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $250
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 71
byte 1 97
byte 1 117
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 70
byte 1 108
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $248
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 67
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $247
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $246
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 71
byte 1 0
align 1
LABELV $245
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 77
byte 1 71
byte 1 0
align 1
LABELV $244
byte 1 103
byte 1 95
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
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
LABELV $221
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $220
byte 1 103
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
LABELV $215
byte 1 103
byte 1 95
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $214
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $186
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $181
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 70
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $109
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
LABELV $98
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $92
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $89
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $86
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $77
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
LABELV $76
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
LABELV $75
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $74
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
LABELV $73
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
LABELV $72
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
LABELV $71
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
LABELV $70
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
