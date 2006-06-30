data
align 4
LABELV gametype_items
address $70
address $71
address $72
address $73
byte 4 0
align 4
LABELV gametype_remap
byte 4 0
byte 4 3
byte 4 1
byte 4 4
align 4
LABELV gametype_remap2
byte 4 0
byte 4 2
byte 4 0
byte 4 1
byte 4 3
code
proc GametypeBits 36 8
file "../ui_startserver.c"
line 98
;1:// Copyright (C) 1999-2000 Id Software, Inc.
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
;81:	0
;82:};
;83:
;84:static int gametype_remap[] = {GT_FFA, GT_TEAM, GT_TOURNAMENT, GT_CTF};
;85:static int gametype_remap2[] = {0, 2, 0, 1, 3};
;86:
;87:// use ui_servers2.c definition
;88:extern const char* punkbuster_items[];
;89:
;90:static void UI_ServerOptionsMenu( qboolean multiplayer );
;91:
;92:
;93:/*
;94:=================
;95:GametypeBits
;96:=================
;97:*/
;98:static int GametypeBits( char *string ) {
line 103
;99:	int		bits;
;100:	char	*p;
;101:	char	*token;
;102:
;103:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 104
;104:	p = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $76
JUMPV
LABELV $75
line 105
;105:	while( 1 ) {
line 106
;106:		token = COM_ParseExt( &p, qfalse );
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
line 107
;107:		if( token[0] == 0 ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $78
line 108
;108:			break;
ADDRGP4 $77
JUMPV
LABELV $78
line 111
;109:		}
;110:
;111:		if( Q_stricmp( token, "ffa" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $82
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $80
line 112
;112:			bits |= 1 << GT_FFA;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 113
;113:			continue;
ADDRGP4 $76
JUMPV
LABELV $80
line 116
;114:		}
;115:
;116:		if( Q_stricmp( token, "tourney" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $85
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $83
line 117
;117:			bits |= 1 << GT_TOURNAMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 118
;118:			continue;
ADDRGP4 $76
JUMPV
LABELV $83
line 121
;119:		}
;120:
;121:		if( Q_stricmp( token, "single" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $88
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $86
line 122
;122:			bits |= 1 << GT_SINGLE_PLAYER;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 123
;123:			continue;
ADDRGP4 $76
JUMPV
LABELV $86
line 126
;124:		}
;125:
;126:		if( Q_stricmp( token, "team" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $91
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $89
line 127
;127:			bits |= 1 << GT_TEAM;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 128
;128:			continue;
ADDRGP4 $76
JUMPV
LABELV $89
line 131
;129:		}
;130:
;131:		if( Q_stricmp( token, "ctf" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $92
line 132
;132:			bits |= 1 << GT_CTF;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 133
;133:			continue;
LABELV $92
line 135
;134:		}
;135:	}
LABELV $76
line 105
ADDRGP4 $75
JUMPV
LABELV $77
line 137
;136:
;137:	return bits;
ADDRLP4 4
INDIRI4
RETI4
LABELV $74
endproc GametypeBits 36 8
bss
align 1
LABELV $96
skip 256
code
proc StartServer_Update 28 16
line 146
;138:}
;139:
;140:
;141:/*
;142:=================
;143:StartServer_Update
;144:=================
;145:*/
;146:static void StartServer_Update( void ) {
line 151
;147:	int				i;
;148:	int				top;
;149:	static	char	picname[MAX_MAPSPERPAGE][64];
;150:
;151:	top = s_startserver.page*MAX_MAPSPERPAGE;
ADDRLP4 4
ADDRGP4 s_startserver+1948
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 153
;152:
;153:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $98
line 154
;154:	{
line 155
;155:		if (top+i >= s_startserver.nummaps)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_startserver+1944
INDIRI4
LTI4 $102
line 156
;156:			break;
ADDRGP4 $120
JUMPV
LABELV $102
line 158
;157:
;158:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", s_startserver.maplist[top+i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $96
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $105
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
line 160
;159:
;160:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
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
line 161
;161:		s_startserver.mappics[i].generic.name   = picname[i];
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
ADDRGP4 $96
ADDP4
ASGNP4
line 162
;162:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+68
ADDP4
CNSTI4 0
ASGNI4
line 165
;163:
;164:		// reset
;165:		s_startserver.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
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
line 166
;166:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_INACTIVE;
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
line 167
;167:	}
LABELV $99
line 153
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $98
line 169
;168:
;169:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $120
JUMPV
LABELV $117
line 170
;170:	{
line 171
;171:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
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
line 172
;172:		s_startserver.mappics[i].generic.name   = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+4
ADDP4
CNSTP4 0
ASGNP4
line 173
;173:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+68
ADDP4
CNSTI4 0
ASGNI4
line 176
;174:
;175:		// disable
;176:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
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
line 177
;177:		s_startserver.mapbuttons[i].generic.flags |= QMF_INACTIVE;
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
line 178
;178:	}
LABELV $118
line 169
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $120
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $117
line 182
;179:
;180:
;181:	// no servers to start
;182:	if( !s_startserver.nummaps ) {
ADDRGP4 s_startserver+1944
INDIRI4
CNSTI4 0
NEI4 $131
line 183
;183:		s_startserver.next.generic.flags |= QMF_INACTIVE;
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
line 186
;184:
;185:		// set the map name
;186:		strcpy( s_startserver.mapname.string, "NO MAPS FOUND" );
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 187
;187:	}
ADDRGP4 $132
JUMPV
LABELV $131
line 188
;188:	else {
line 190
;189:		// set the highlight
;190:		s_startserver.next.generic.flags &= ~QMF_INACTIVE;
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
line 191
;191:		i = s_startserver.currentmap - top;
ADDRLP4 0
ADDRGP4 s_startserver+1940
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 192
;192:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $142
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $142
line 193
;193:		{
line 194
;194:			s_startserver.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
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
line 195
;195:			s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
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
line 196
;196:		}
LABELV $142
line 199
;197:
;198:		// set the map name
;199:		strcpy( s_startserver.mapname.string, s_startserver.maplist[s_startserver.currentmap] );
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
line 200
;200:	}
LABELV $132
line 202
;201:	
;202:	Q_strupr( s_startserver.mapname.string );
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 203
;203:}
LABELV $95
endproc StartServer_Update 28 16
proc StartServer_MapEvent 0 0
line 211
;204:
;205:
;206:/*
;207:=================
;208:StartServer_MapEvent
;209:=================
;210:*/
;211:static void StartServer_MapEvent( void* ptr, int event ) {
line 212
;212:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $155
line 213
;213:		return;
ADDRGP4 $154
JUMPV
LABELV $155
line 216
;214:	}
;215:
;216:	s_startserver.currentmap = (s_startserver.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
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
line 217
;217:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 218
;218:}
LABELV $154
endproc StartServer_MapEvent 0 0
proc StartServer_GametypeEvent 48 12
line 226
;219:
;220:
;221:/*
;222:=================
;223:StartServer_GametypeEvent
;224:=================
;225:*/
;226:static void StartServer_GametypeEvent( void* ptr, int event ) {
line 233
;227:	int			i;
;228:	int			count;
;229:	int			gamebits;
;230:	int			matchbits;
;231:	const char	*info;
;232:
;233:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $160
line 234
;234:		return;
ADDRGP4 $159
JUMPV
LABELV $160
line 237
;235:	}
;236:
;237:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 238
;238:	s_startserver.nummaps = 0;
ADDRGP4 s_startserver+1944
CNSTI4 0
ASGNI4
line 239
;239:	matchbits = 1 << gametype_remap[s_startserver.gametype.curvalue];
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
line 240
;240:	if( gametype_remap[s_startserver.gametype.curvalue] == GT_FFA ) {
ADDRGP4 s_startserver+536+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CNSTI4 0
NEI4 $165
line 241
;241:		matchbits |= ( 1 << GT_SINGLE_PLAYER );
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 242
;242:	}
LABELV $165
line 243
;243:	for( i = 0; i < count; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $169
line 244
;244:		info = UI_GetArenaInfoByNumber( i );
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
line 246
;245:
;246:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $173
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
line 247
;247:		if( !( gamebits & matchbits ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
NEI4 $174
line 248
;248:			continue;
ADDRGP4 $170
JUMPV
LABELV $174
line 251
;249:		}
;250:
;251:		Q_strncpyz( s_startserver.maplist[s_startserver.nummaps], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $178
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
line 252
;252:		Q_strupr( s_startserver.maplist[s_startserver.nummaps] );
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
line 253
;253:		s_startserver.mapGamebits[s_startserver.nummaps] = gamebits;
ADDRGP4 s_startserver+1944
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+66472
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 254
;254:		s_startserver.nummaps++;
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
line 255
;255:	}
LABELV $170
line 243
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $172
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $169
line 256
;256:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
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
line 257
;257:	s_startserver.page = 0;
ADDRGP4 s_startserver+1948
CNSTI4 0
ASGNI4
line 258
;258:	s_startserver.currentmap = 0;
ADDRGP4 s_startserver+1940
CNSTI4 0
ASGNI4
line 260
;259:
;260:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 261
;261:}
LABELV $159
endproc StartServer_GametypeEvent 48 12
proc StartServer_MenuEvent 12 8
line 269
;262:
;263:
;264:/*
;265:=================
;266:StartServer_MenuEvent
;267:=================
;268:*/
;269:static void StartServer_MenuEvent( void* ptr, int event ) {
line 270
;270:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $189
line 271
;271:		return;
ADDRGP4 $188
JUMPV
LABELV $189
line 274
;272:	}
;273:
;274:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $191
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $191
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $211-60
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $211
address $194
address $199
address $210
address $205
code
LABELV $194
line 276
;275:	case ID_PREVPAGE:
;276:		if( s_startserver.page > 0 ) {
ADDRGP4 s_startserver+1948
INDIRI4
CNSTI4 0
LEI4 $192
line 277
;277:			s_startserver.page--;
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
line 278
;278:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 279
;279:		}
line 280
;280:		break;
ADDRGP4 $192
JUMPV
LABELV $199
line 283
;281:
;282:	case ID_NEXTPAGE:
;283:		if( s_startserver.page < s_startserver.maxpages - 1 ) {
ADDRGP4 s_startserver+1948
INDIRI4
ADDRGP4 s_startserver+1952
INDIRI4
CNSTI4 1
SUBI4
GEI4 $192
line 284
;284:			s_startserver.page++;
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
line 285
;285:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 286
;286:		}
line 287
;287:		break;
ADDRGP4 $192
JUMPV
LABELV $205
line 290
;288:
;289:	case ID_STARTSERVERNEXT:
;290:		trap_Cvar_SetValue( "g_gameType", gametype_remap[s_startserver.gametype.curvalue] );
ADDRGP4 $206
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
line 291
;291:		UI_ServerOptionsMenu( s_startserver.multiplayer );
ADDRGP4 s_startserver+1936
INDIRI4
ARGI4
ADDRGP4 UI_ServerOptionsMenu
CALLV
pop
line 292
;292:		break;
ADDRGP4 $192
JUMPV
LABELV $210
line 295
;293:
;294:	case ID_STARTSERVERBACK:
;295:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 296
;296:		break;
LABELV $191
LABELV $192
line 298
;297:	}
;298:}
LABELV $188
endproc StartServer_MenuEvent 12 8
proc StartServer_LevelshotDraw 48 20
line 306
;299:
;300:
;301:/*
;302:===============
;303:StartServer_LevelshotDraw
;304:===============
;305:*/
;306:static void StartServer_LevelshotDraw( void *self ) {
line 314
;307:	menubitmap_s	*b;
;308:	int				x;
;309:	int				y;
;310:	int				w;
;311:	int				h;
;312:	int				n;
;313:
;314:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 316
;315:
;316:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 317
;317:		return;
ADDRGP4 $213
JUMPV
LABELV $214
line 320
;318:	}
;319:
;320:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $216
line 321
;321:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
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
line 322
;322:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $218
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 323
;323:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
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
line 324
;324:		}
LABELV $218
line 325
;325:	}
LABELV $216
line 327
;326:
;327:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $220
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $220
line 328
;328:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
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
line 329
;329:	}
LABELV $220
line 331
;330:
;331:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 332
;332:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 333
;333:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 334
;334:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 335
;335:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $222
line 336
;336:		UI_DrawHandlePic( x, y, w, h, b->shader );
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
line 337
;337:	}
LABELV $222
line 339
;338:
;339:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 340
;340:	y = b->generic.y + b->height;
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
line 341
;341:	UI_FillRect( x, y, b->width, 28, colorBlack );
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
line 343
;342:
;343:	x += b->width / 2;
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
line 344
;344:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 345
;345:	n = s_startserver.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
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
line 346
;346:	UI_DrawString( x, y, s_startserver.maplist[n], UI_CENTER|UI_SMALLFONT, color_orange );
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
line 348
;347:
;348:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 349
;349:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 350
;350:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 351
;351:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 352
;352:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $226
line 353
;353:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
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
line 354
;354:	}
LABELV $226
line 355
;355:}
LABELV $213
endproc StartServer_LevelshotDraw 48 20
bss
align 1
LABELV $229
skip 64
code
proc StartServer_MenuInit 20 12
line 363
;356:
;357:
;358:/*
;359:=================
;360:StartServer_MenuInit
;361:=================
;362:*/
;363:static void StartServer_MenuInit( void ) {
line 370
;364:	int	i;
;365:	int	x;
;366:	int	y;
;367:	static char mapnamebuffer[64];
;368:
;369:	// zero set all our globals
;370:	memset( &s_startserver, 0 ,sizeof(startserver_t) );
ADDRGP4 s_startserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 67488
ARGI4
ADDRGP4 memset
CALLP4
pop
line 372
;371:
;372:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 374
;373:
;374:	s_startserver.menu.wrapAround = qtrue;
ADDRGP4 s_startserver+276
CNSTI4 1
ASGNI4
line 375
;375:	s_startserver.menu.fullscreen = qtrue;
ADDRGP4 s_startserver+280
CNSTI4 1
ASGNI4
line 377
;376:
;377:	s_startserver.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_startserver+288
CNSTI4 10
ASGNI4
line 378
;378:	s_startserver.banner.generic.x	   = 320;
ADDRGP4 s_startserver+288+12
CNSTI4 320
ASGNI4
line 379
;379:	s_startserver.banner.generic.y	   = 16;
ADDRGP4 s_startserver+288+16
CNSTI4 16
ASGNI4
line 380
;380:	s_startserver.banner.string        = "GAME SERVER";
ADDRGP4 s_startserver+288+60
ADDRGP4 $239
ASGNP4
line 381
;381:	s_startserver.banner.color         = color_white;
ADDRGP4 s_startserver+288+68
ADDRGP4 color_white
ASGNP4
line 382
;382:	s_startserver.banner.style         = UI_CENTER;
ADDRGP4 s_startserver+288+64
CNSTI4 1
ASGNI4
line 384
;383:
;384:	s_startserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+360
CNSTI4 6
ASGNI4
line 385
;385:	s_startserver.framel.generic.name  = GAMESERVER_FRAMEL;
ADDRGP4 s_startserver+360+4
ADDRGP4 $247
ASGNP4
line 386
;386:	s_startserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+360+44
CNSTU4 16384
ASGNU4
line 387
;387:	s_startserver.framel.generic.x	   = 0;  
ADDRGP4 s_startserver+360+12
CNSTI4 0
ASGNI4
line 388
;388:	s_startserver.framel.generic.y	   = 78;
ADDRGP4 s_startserver+360+16
CNSTI4 78
ASGNI4
line 389
;389:	s_startserver.framel.width  	   = 256;
ADDRGP4 s_startserver+360+76
CNSTI4 256
ASGNI4
line 390
;390:	s_startserver.framel.height  	   = 329;
ADDRGP4 s_startserver+360+80
CNSTI4 329
ASGNI4
line 392
;391:
;392:	s_startserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+448
CNSTI4 6
ASGNI4
line 393
;393:	s_startserver.framer.generic.name  = GAMESERVER_FRAMER;
ADDRGP4 s_startserver+448+4
ADDRGP4 $261
ASGNP4
line 394
;394:	s_startserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+448+44
CNSTU4 16384
ASGNU4
line 395
;395:	s_startserver.framer.generic.x	   = 376;
ADDRGP4 s_startserver+448+12
CNSTI4 376
ASGNI4
line 396
;396:	s_startserver.framer.generic.y	   = 76;
ADDRGP4 s_startserver+448+16
CNSTI4 76
ASGNI4
line 397
;397:	s_startserver.framer.width  	   = 256;
ADDRGP4 s_startserver+448+76
CNSTI4 256
ASGNI4
line 398
;398:	s_startserver.framer.height  	   = 334;
ADDRGP4 s_startserver+448+80
CNSTI4 334
ASGNI4
line 400
;399:
;400:	s_startserver.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_startserver+536
CNSTI4 3
ASGNI4
line 401
;401:	s_startserver.gametype.generic.name		= "Game Type:";
ADDRGP4 s_startserver+536+4
ADDRGP4 $275
ASGNP4
line 402
;402:	s_startserver.gametype.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+536+44
CNSTU4 258
ASGNU4
line 403
;403:	s_startserver.gametype.generic.callback	= StartServer_GametypeEvent;
ADDRGP4 s_startserver+536+48
ADDRGP4 StartServer_GametypeEvent
ASGNP4
line 404
;404:	s_startserver.gametype.generic.id		= ID_GAMETYPE;
ADDRGP4 s_startserver+536+8
CNSTI4 10
ASGNI4
line 405
;405:	s_startserver.gametype.generic.x		= 320 - 24;
ADDRGP4 s_startserver+536+12
CNSTI4 296
ASGNI4
line 406
;406:	s_startserver.gametype.generic.y		= 368;
ADDRGP4 s_startserver+536+16
CNSTI4 368
ASGNI4
line 407
;407:	s_startserver.gametype.itemnames		= gametype_items;
ADDRGP4 s_startserver+536+76
ADDRGP4 gametype_items
ASGNP4
line 409
;408:
;409:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $288
line 410
;410:	{
line 411
;411:		x =	(i % MAX_MAPCOLS) * (128+8) + 188;
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
line 412
;412:		y = (i / MAX_MAPROWS) * (128+8) + 96;
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
line 414
;413:
;414:		s_startserver.mappics[i].generic.type   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632
ADDP4
CNSTI4 6
ASGNI4
line 415
;415:		s_startserver.mappics[i].generic.flags  = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+44
ADDP4
CNSTU4 16388
ASGNU4
line 416
;416:		s_startserver.mappics[i].generic.x	    = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 417
;417:		s_startserver.mappics[i].generic.y	    = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 418
;418:		s_startserver.mappics[i].generic.id		= ID_PICTURES+i;
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
line 419
;419:		s_startserver.mappics[i].width  		= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+76
ADDP4
CNSTI4 128
ASGNI4
line 420
;420:		s_startserver.mappics[i].height  	    = 96;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+80
ADDP4
CNSTI4 96
ASGNI4
line 421
;421:		s_startserver.mappics[i].focuspic       = GAMESERVER_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+60
ADDP4
ADDRGP4 $307
ASGNP4
line 422
;422:		s_startserver.mappics[i].errorpic       = GAMESERVER_UNKNOWNMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+64
ADDP4
ADDRGP4 $310
ASGNP4
line 423
;423:		s_startserver.mappics[i].generic.ownerdraw = StartServer_LevelshotDraw;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+632+56
ADDP4
ADDRGP4 StartServer_LevelshotDraw
ASGNP4
line 425
;424:
;425:		s_startserver.mapbuttons[i].generic.type     = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984
ADDP4
CNSTI4 6
ASGNI4
line 426
;426:		s_startserver.mapbuttons[i].generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+44
ADDP4
CNSTU4 33028
ASGNU4
line 427
;427:		s_startserver.mapbuttons[i].generic.id       = ID_PICTURES+i;
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
line 428
;428:		s_startserver.mapbuttons[i].generic.callback = StartServer_MapEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+48
ADDP4
ADDRGP4 StartServer_MapEvent
ASGNP4
line 429
;429:		s_startserver.mapbuttons[i].generic.x	     = x - 30;
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
line 430
;430:		s_startserver.mapbuttons[i].generic.y	     = y - 32;
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
line 431
;431:		s_startserver.mapbuttons[i].width  		     = 256;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+76
ADDP4
CNSTI4 256
ASGNI4
line 432
;432:		s_startserver.mapbuttons[i].height  	     = 248;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+80
ADDP4
CNSTI4 248
ASGNI4
line 433
;433:		s_startserver.mapbuttons[i].generic.left     = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 434
;434:		s_startserver.mapbuttons[i].generic.top  	 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 435
;435:		s_startserver.mapbuttons[i].generic.right    = x + 128;
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
line 436
;436:		s_startserver.mapbuttons[i].generic.bottom   = y + 128;
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
line 437
;437:		s_startserver.mapbuttons[i].focuspic         = GAMESERVER_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+984+60
ADDP4
ADDRGP4 $338
ASGNP4
line 438
;438:	}
LABELV $289
line 409
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $288
line 440
;439:
;440:	s_startserver.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+1336
CNSTI4 6
ASGNI4
line 441
;441:	s_startserver.arrows.generic.name  = GAMESERVER_ARROWS;
ADDRGP4 s_startserver+1336+4
ADDRGP4 $342
ASGNP4
line 442
;442:	s_startserver.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+1336+44
CNSTU4 16384
ASGNU4
line 443
;443:	s_startserver.arrows.generic.x	   = 260;
ADDRGP4 s_startserver+1336+12
CNSTI4 260
ASGNI4
line 444
;444:	s_startserver.arrows.generic.y	   = 400;
ADDRGP4 s_startserver+1336+16
CNSTI4 400
ASGNI4
line 445
;445:	s_startserver.arrows.width  	   = 128;
ADDRGP4 s_startserver+1336+76
CNSTI4 128
ASGNI4
line 446
;446:	s_startserver.arrows.height  	   = 32;
ADDRGP4 s_startserver+1336+80
CNSTI4 32
ASGNI4
line 448
;447:
;448:	s_startserver.prevpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1424
CNSTI4 6
ASGNI4
line 449
;449:	s_startserver.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1424+44
CNSTU4 260
ASGNU4
line 450
;450:	s_startserver.prevpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1424+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 451
;451:	s_startserver.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 s_startserver+1424+8
CNSTI4 15
ASGNI4
line 452
;452:	s_startserver.prevpage.generic.x		= 260;
ADDRGP4 s_startserver+1424+12
CNSTI4 260
ASGNI4
line 453
;453:	s_startserver.prevpage.generic.y		= 400;
ADDRGP4 s_startserver+1424+16
CNSTI4 400
ASGNI4
line 454
;454:	s_startserver.prevpage.width  		    = 64;
ADDRGP4 s_startserver+1424+76
CNSTI4 64
ASGNI4
line 455
;455:	s_startserver.prevpage.height  		    = 32;
ADDRGP4 s_startserver+1424+80
CNSTI4 32
ASGNI4
line 456
;456:	s_startserver.prevpage.focuspic         = GAMESERVER_ARROWSL;
ADDRGP4 s_startserver+1424+60
ADDRGP4 $370
ASGNP4
line 458
;457:
;458:	s_startserver.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1512
CNSTI4 6
ASGNI4
line 459
;459:	s_startserver.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1512+44
CNSTU4 260
ASGNU4
line 460
;460:	s_startserver.nextpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1512+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 461
;461:	s_startserver.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 s_startserver+1512+8
CNSTI4 16
ASGNI4
line 462
;462:	s_startserver.nextpage.generic.x		= 321;
ADDRGP4 s_startserver+1512+12
CNSTI4 321
ASGNI4
line 463
;463:	s_startserver.nextpage.generic.y		= 400;
ADDRGP4 s_startserver+1512+16
CNSTI4 400
ASGNI4
line 464
;464:	s_startserver.nextpage.width  		    = 64;
ADDRGP4 s_startserver+1512+76
CNSTI4 64
ASGNI4
line 465
;465:	s_startserver.nextpage.height  		    = 32;
ADDRGP4 s_startserver+1512+80
CNSTI4 32
ASGNI4
line 466
;466:	s_startserver.nextpage.focuspic         = GAMESERVER_ARROWSR;
ADDRGP4 s_startserver+1512+60
ADDRGP4 $388
ASGNP4
line 468
;467:
;468:	s_startserver.mapname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_startserver+1776
CNSTI4 9
ASGNI4
line 469
;469:	s_startserver.mapname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_startserver+1776+44
CNSTU4 16392
ASGNU4
line 470
;470:	s_startserver.mapname.generic.x	    = 320;
ADDRGP4 s_startserver+1776+12
CNSTI4 320
ASGNI4
line 471
;471:	s_startserver.mapname.generic.y	    = 440;
ADDRGP4 s_startserver+1776+16
CNSTI4 440
ASGNI4
line 472
;472:	s_startserver.mapname.string        = mapnamebuffer;
ADDRGP4 s_startserver+1776+60
ADDRGP4 $229
ASGNP4
line 473
;473:	s_startserver.mapname.style         = UI_CENTER|UI_BIGFONT;
ADDRGP4 s_startserver+1776+64
CNSTI4 33
ASGNI4
line 474
;474:	s_startserver.mapname.color         = text_color_normal;
ADDRGP4 s_startserver+1776+68
ADDRGP4 text_color_normal
ASGNP4
line 476
;475:
;476:	s_startserver.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1600
CNSTI4 6
ASGNI4
line 477
;477:	s_startserver.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_startserver+1600+4
ADDRGP4 $405
ASGNP4
line 478
;478:	s_startserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1600+44
CNSTU4 260
ASGNU4
line 479
;479:	s_startserver.back.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1600+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 480
;480:	s_startserver.back.generic.id	    = ID_STARTSERVERBACK;
ADDRGP4 s_startserver+1600+8
CNSTI4 17
ASGNI4
line 481
;481:	s_startserver.back.generic.x		= 0;
ADDRGP4 s_startserver+1600+12
CNSTI4 0
ASGNI4
line 482
;482:	s_startserver.back.generic.y		= 480-64;
ADDRGP4 s_startserver+1600+16
CNSTI4 416
ASGNI4
line 483
;483:	s_startserver.back.width  		    = 128;
ADDRGP4 s_startserver+1600+76
CNSTI4 128
ASGNI4
line 484
;484:	s_startserver.back.height  		    = 64;
ADDRGP4 s_startserver+1600+80
CNSTI4 64
ASGNI4
line 485
;485:	s_startserver.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_startserver+1600+60
ADDRGP4 $422
ASGNP4
line 487
;486:
;487:	s_startserver.next.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1688
CNSTI4 6
ASGNI4
line 488
;488:	s_startserver.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_startserver+1688+4
ADDRGP4 $426
ASGNP4
line 489
;489:	s_startserver.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1688+44
CNSTU4 272
ASGNU4
line 490
;490:	s_startserver.next.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1688+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 491
;491:	s_startserver.next.generic.id	    = ID_STARTSERVERNEXT;
ADDRGP4 s_startserver+1688+8
CNSTI4 18
ASGNI4
line 492
;492:	s_startserver.next.generic.x		= 640;
ADDRGP4 s_startserver+1688+12
CNSTI4 640
ASGNI4
line 493
;493:	s_startserver.next.generic.y		= 480-64;
ADDRGP4 s_startserver+1688+16
CNSTI4 416
ASGNI4
line 494
;494:	s_startserver.next.width  		    = 128;
ADDRGP4 s_startserver+1688+76
CNSTI4 128
ASGNI4
line 495
;495:	s_startserver.next.height  		    = 64;
ADDRGP4 s_startserver+1688+80
CNSTI4 64
ASGNI4
line 496
;496:	s_startserver.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_startserver+1688+60
ADDRGP4 $443
ASGNP4
line 498
;497:
;498:	s_startserver.item_null.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_startserver+1848
CNSTI4 6
ASGNI4
line 499
;499:	s_startserver.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_startserver+1848+44
CNSTU4 1050628
ASGNU4
line 500
;500:	s_startserver.item_null.generic.x		= 0;
ADDRGP4 s_startserver+1848+12
CNSTI4 0
ASGNI4
line 501
;501:	s_startserver.item_null.generic.y		= 0;
ADDRGP4 s_startserver+1848+16
CNSTI4 0
ASGNI4
line 502
;502:	s_startserver.item_null.width			= 640;
ADDRGP4 s_startserver+1848+76
CNSTI4 640
ASGNI4
line 503
;503:	s_startserver.item_null.height			= 480;
ADDRGP4 s_startserver+1848+80
CNSTI4 480
ASGNI4
line 505
;504:
;505:	Menu_AddItem( &s_startserver.menu, &s_startserver.banner );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 506
;506:	Menu_AddItem( &s_startserver.menu, &s_startserver.framel );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 507
;507:	Menu_AddItem( &s_startserver.menu, &s_startserver.framer );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 509
;508:
;509:	Menu_AddItem( &s_startserver.menu, &s_startserver.gametype );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 510
;510:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $459
line 511
;511:	{
line 512
;512:		Menu_AddItem( &s_startserver.menu, &s_startserver.mappics[i] );
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
line 513
;513:		Menu_AddItem( &s_startserver.menu, &s_startserver.mapbuttons[i] );
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
line 514
;514:	}
LABELV $460
line 510
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $459
line 516
;515:
;516:	Menu_AddItem( &s_startserver.menu, &s_startserver.arrows );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 517
;517:	Menu_AddItem( &s_startserver.menu, &s_startserver.prevpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1424
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 518
;518:	Menu_AddItem( &s_startserver.menu, &s_startserver.nextpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1512
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 519
;519:	Menu_AddItem( &s_startserver.menu, &s_startserver.back );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1600
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 520
;520:	Menu_AddItem( &s_startserver.menu, &s_startserver.next );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 521
;521:	Menu_AddItem( &s_startserver.menu, &s_startserver.mapname );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 522
;522:	Menu_AddItem( &s_startserver.menu, &s_startserver.item_null );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1848
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 524
;523:
;524:	StartServer_GametypeEvent( NULL, QM_ACTIVATED );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_GametypeEvent
CALLV
pop
line 525
;525:}
LABELV $228
endproc StartServer_MenuInit 20 12
export StartServer_Cache
proc StartServer_Cache 104 16
line 534
;526:
;527:
;528:/*
;529:=================
;530:StartServer_Cache
;531:=================
;532:*/
;533:void StartServer_Cache( void )
;534:{
line 540
;535:	int				i;
;536:	const char		*info;
;537:	qboolean		precache;
;538:	char			picname[64];
;539:
;540:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );	
ADDRGP4 $405
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 541
;541:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );	
ADDRGP4 $422
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 542
;542:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT0 );	
ADDRGP4 $426
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 543
;543:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT1 );	
ADDRGP4 $443
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 544
;544:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMEL );	
ADDRGP4 $247
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 545
;545:	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMER );	
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 546
;546:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );	
ADDRGP4 $338
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 547
;547:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED );	
ADDRGP4 $307
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 548
;548:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $310
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 549
;549:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWS );
ADDRGP4 $342
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 550
;550:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSL );
ADDRGP4 $370
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 551
;551:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSR );
ADDRGP4 $388
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 553
;552:
;553:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $473
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
line 555
;554:
;555:	s_startserver.nummaps = UI_GetNumArenas();
ADDRLP4 80
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRGP4 s_startserver+1944
ADDRLP4 80
INDIRI4
ASGNI4
line 557
;556:
;557:	for( i = 0; i < s_startserver.nummaps; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $478
JUMPV
LABELV $475
line 558
;558:		info = UI_GetArenaInfoByNumber( i );
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
line 560
;559:
;560:		Q_strncpyz( s_startserver.maplist[i], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $178
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
line 561
;561:		Q_strupr( s_startserver.maplist[i] );
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
line 562
;562:		s_startserver.mapGamebits[i] = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $173
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
line 564
;563:
;564:		if( precache ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $483
line 565
;565:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", s_startserver.maplist[i] );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $105
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
line 566
;566:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 567
;567:		}
LABELV $483
line 568
;568:	}
LABELV $476
line 557
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $478
ADDRLP4 0
INDIRI4
ADDRGP4 s_startserver+1944
INDIRI4
LTI4 $475
line 570
;569:
;570:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
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
line 571
;571:}
LABELV $472
endproc StartServer_Cache 104 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 579
;572:
;573:
;574:/*
;575:=================
;576:UI_StartServerMenu
;577:=================
;578:*/
;579:void UI_StartServerMenu( qboolean multiplayer ) {
line 580
;580:	StartServer_MenuInit();
ADDRGP4 StartServer_MenuInit
CALLV
pop
line 581
;581:	s_startserver.multiplayer = multiplayer;
ADDRGP4 s_startserver+1936
ADDRFP4 0
INDIRI4
ASGNI4
line 582
;582:	UI_PushMenu( &s_startserver.menu );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 583
;583:}
LABELV $488
endproc UI_StartServerMenu 0 4
data
align 4
LABELV dedicated_list
address $491
address $492
address $493
byte 4 0
align 4
LABELV playerType_list
address $494
address $495
address $496
byte 4 0
align 4
LABELV playerTeam_list
address $497
address $498
byte 4 0
align 4
LABELV botSkill_list
address $499
address $500
address $501
address $502
address $503
byte 4 0
code
proc BotAlreadySelected 12 8
line 679
;584:
;585:
;586:
;587:/*
;588:=============================================================================
;589:
;590:SERVER OPTIONS MENU *****
;591:
;592:=============================================================================
;593:*/
;594:
;595:#define ID_PLAYER_TYPE			20
;596:#define ID_MAXCLIENTS			21
;597:#define ID_DEDICATED			22
;598:#define ID_GO					23
;599:#define ID_BACK					24
;600:
;601:#define PLAYER_SLOTS			12
;602:
;603:
;604:typedef struct {
;605:	menuframework_s		menu;
;606:
;607:	menutext_s			banner;
;608:
;609:	menubitmap_s		mappic;
;610:	menubitmap_s		picframe;
;611:
;612:	menulist_s			dedicated;
;613:	menufield_s			timelimit;
;614:	menufield_s			fraglimit;
;615:	menufield_s			flaglimit;
;616:	menuradiobutton_s	friendlyfire;
;617:	menufield_s			hostname;
;618:	menuradiobutton_s	pure;
;619:	menulist_s			botSkill;
;620:
;621:	menutext_s			player0;
;622:	menulist_s			playerType[PLAYER_SLOTS];
;623:	menutext_s			playerName[PLAYER_SLOTS];
;624:	menulist_s			playerTeam[PLAYER_SLOTS];
;625:
;626:	menubitmap_s		go;
;627:	menubitmap_s		next;
;628:	menubitmap_s		back;
;629:
;630:	qboolean			multiplayer;
;631:	int					gametype;
;632:	char				mapnamebuffer[32];
;633:	char				playerNameBuffers[PLAYER_SLOTS][16];
;634:
;635:	qboolean			newBot;
;636:	int					newBotIndex;
;637:	char				newBotName[16];
;638:	
;639:	menulist_s		punkbuster;
;640:} serveroptions_t;
;641:
;642:static serveroptions_t s_serveroptions;
;643:
;644:static const char *dedicated_list[] = {
;645:	"No",
;646:	"LAN",
;647:	"Internet",
;648:	0
;649:};
;650:
;651:static const char *playerType_list[] = {
;652:	"Open",
;653:	"Bot",
;654:	"----",
;655:	0
;656:};
;657:
;658:static const char *playerTeam_list[] = {
;659:	"Blue",
;660:	"Red",
;661:	0
;662:};
;663:
;664:static const char *botSkill_list[] = {
;665:	"I Can Win",
;666:	"Bring It On",
;667:	"Hurt Me Plenty",
;668:	"Hardcore",
;669:	"Nightmare!",
;670:	0
;671:};
;672:
;673:
;674:/*
;675:=================
;676:BotAlreadySelected
;677:=================
;678:*/
;679:static qboolean BotAlreadySelected( const char *checkName ) {
line 682
;680:	int		n;
;681:
;682:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $505
line 683
;683:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $509
line 684
;684:			continue;
ADDRGP4 $506
JUMPV
LABELV $509
line 686
;685:		}
;686:		if( (s_serveroptions.gametype >= GT_TEAM) &&
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $513
ADDRLP4 4
CNSTI4 96
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+64
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 s_serveroptions+5924
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+64
ADDP4
INDIRI4
EQI4 $513
line 687
;687:			(s_serveroptions.playerTeam[n].curvalue != s_serveroptions.playerTeam[s_serveroptions.newBotIndex].curvalue ) ) {
line 688
;688:			continue;
ADDRGP4 $506
JUMPV
LABELV $513
line 690
;689:		}
;690:		if( Q_stricmp( checkName, s_serveroptions.playerNameBuffers[n] ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $521
line 691
;691:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $504
JUMPV
LABELV $521
line 693
;692:		}
;693:	}
LABELV $506
line 682
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $505
line 695
;694:
;695:	return qfalse;
CNSTI4 0
RETI4
LABELV $504
endproc BotAlreadySelected 12 8
proc ServerOptions_Start 160 24
line 704
;696:}
;697:
;698:
;699:/*
;700:=================
;701:ServerOptions_Start
;702:=================
;703:*/
;704:static void ServerOptions_Start( void ) {
line 717
;705:	int		timelimit;
;706:	int		fraglimit;
;707:	int		maxclients;
;708:	int		dedicated;
;709:	int		friendlyfire;
;710:	int		flaglimit;
;711:	int		pure;
;712:	int		skill;
;713:	int		n;
;714:	char	buf[64];
;715:
;716:
;717:	timelimit	 = atoi( s_serveroptions.timelimit.field.buffer );
ADDRGP4 s_serveroptions+632+60+12
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 100
INDIRI4
ASGNI4
line 718
;718:	fraglimit	 = atoi( s_serveroptions.fraglimit.field.buffer );
ADDRGP4 s_serveroptions+964+60+12
ARGP4
ADDRLP4 104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 104
INDIRI4
ASGNI4
line 719
;719:	flaglimit	 = atoi( s_serveroptions.flaglimit.field.buffer );
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 108
INDIRI4
ASGNI4
line 720
;720:	dedicated	 = s_serveroptions.dedicated.curvalue;
ADDRLP4 84
ADDRGP4 s_serveroptions+536+64
INDIRI4
ASGNI4
line 721
;721:	friendlyfire = s_serveroptions.friendlyfire.curvalue;
ADDRLP4 92
ADDRGP4 s_serveroptions+1628+60
INDIRI4
ASGNI4
line 722
;722:	pure		 = s_serveroptions.pure.curvalue;
ADDRLP4 96
ADDRGP4 s_serveroptions+2024+60
INDIRI4
ASGNI4
line 723
;723:	skill		 = s_serveroptions.botSkill.curvalue + 1;
ADDRLP4 72
ADDRGP4 s_serveroptions+2088+64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 726
;724:
;725:	//set maxclients
;726:	for( n = 0, maxclients = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRLP4 112
INDIRI4
ASGNI4
ADDRLP4 68
ADDRLP4 112
INDIRI4
ASGNI4
ADDRGP4 $545
JUMPV
LABELV $542
line 727
;727:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $546
line 728
;728:			continue;
ADDRGP4 $543
JUMPV
LABELV $546
line 730
;729:		}
;730:		if( (s_serveroptions.playerType[n].curvalue == 1) && (s_serveroptions.playerNameBuffers[n][0] == 0) ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $550
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $550
line 731
;731:			continue;
ADDRGP4 $543
JUMPV
LABELV $550
line 733
;732:		}
;733:		maxclients++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 734
;734:	}
LABELV $543
line 726
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $545
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $542
line 736
;735:
;736:	switch( s_serveroptions.gametype ) {
ADDRLP4 116
ADDRGP4 s_serveroptions+5692
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
LTI4 $555
ADDRLP4 116
INDIRI4
CNSTI4 4
GTI4 $555
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $572
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $572
address $558
address $561
address $555
address $564
address $568
code
LABELV $558
LABELV $555
line 739
;737:	case GT_FFA:
;738:	default:
;739:		trap_Cvar_SetValue( "ui_ffa_fraglimit", fraglimit );
ADDRGP4 $559
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 740
;740:		trap_Cvar_SetValue( "ui_ffa_timelimit", timelimit );
ADDRGP4 $560
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 741
;741:		break;
ADDRGP4 $556
JUMPV
LABELV $561
line 744
;742:
;743:	case GT_TOURNAMENT:
;744:		trap_Cvar_SetValue( "ui_tourney_fraglimit", fraglimit );
ADDRGP4 $562
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 745
;745:		trap_Cvar_SetValue( "ui_tourney_timelimit", timelimit );
ADDRGP4 $563
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 746
;746:		break;
ADDRGP4 $556
JUMPV
LABELV $564
line 749
;747:
;748:	case GT_TEAM:
;749:		trap_Cvar_SetValue( "ui_team_fraglimit", fraglimit );
ADDRGP4 $565
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 750
;750:		trap_Cvar_SetValue( "ui_team_timelimit", timelimit );
ADDRGP4 $566
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 751
;751:		trap_Cvar_SetValue( "ui_team_friendlt", friendlyfire );
ADDRGP4 $567
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 752
;752:		break;
ADDRGP4 $556
JUMPV
LABELV $568
line 755
;753:
;754:	case GT_CTF:
;755:		trap_Cvar_SetValue( "ui_ctf_fraglimit", fraglimit );
ADDRGP4 $569
ARGP4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 756
;756:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $570
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 757
;757:		trap_Cvar_SetValue( "ui_ctf_friendlt", friendlyfire );
ADDRGP4 $571
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 758
;758:		break;
LABELV $556
line 761
;759:	}
;760:
;761:	trap_Cvar_SetValue( "sv_maxclients", Com_Clamp( 0, 12, maxclients ) );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 120
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $573
ARGP4
ADDRLP4 120
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 762
;762:	trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, dedicated ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 124
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $574
ARGP4
ADDRLP4 124
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 763
;763:	trap_Cvar_SetValue ("timelimit", Com_Clamp( 0, timelimit, timelimit ) );
CNSTF4 0
ARGF4
ADDRLP4 128
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 128
INDIRF4
ARGF4
ADDRLP4 128
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $575
ARGP4
ADDRLP4 132
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 764
;764:	trap_Cvar_SetValue ("fraglimit", Com_Clamp( 0, fraglimit, fraglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 136
ADDRLP4 80
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 136
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $576
ARGP4
ADDRLP4 140
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 765
;765:	trap_Cvar_SetValue ("capturelimit", Com_Clamp( 0, flaglimit, flaglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 144
ADDRLP4 88
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 144
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $577
ARGP4
ADDRLP4 148
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 766
;766:	trap_Cvar_SetValue( "g_friendlyfire", friendlyfire );
ADDRGP4 $578
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 767
;767:	trap_Cvar_SetValue( "sv_pure", pure );
ADDRGP4 $579
ARGP4
ADDRLP4 96
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 768
;768:	trap_Cvar_Set("sv_hostname", s_serveroptions.hostname.field.buffer );
ADDRGP4 $580
ARGP4
ADDRGP4 s_serveroptions+1692+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 770
;769:	
;770:	trap_Cvar_SetValue( "sv_punkbuster", s_serveroptions.punkbuster.curvalue );
ADDRGP4 $584
ARGP4
ADDRGP4 s_serveroptions+5944+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 773
;771:
;772:	// the wait commands will allow the dedicated to take effect
;773:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", s_startserver.maplist[s_startserver.currentmap] ) );
ADDRGP4 $587
ARGP4
CNSTI4 254
ADDRGP4 s_startserver+1940
INDIRI4
MULI4
ADDRGP4 s_startserver+1956
ADDP4
ARGP4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 776
;774:
;775:	// add bots
;776:	trap_Cmd_ExecuteText( EXEC_APPEND, "wait 3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $590
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 777
;777:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $591
line 778
;778:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $595
line 779
;779:			continue;
ADDRGP4 $592
JUMPV
LABELV $595
line 781
;780:		}
;781:		if( s_serveroptions.playerNameBuffers[n][0] == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $599
line 782
;782:			continue;
ADDRGP4 $592
JUMPV
LABELV $599
line 784
;783:		}
;784:		if( s_serveroptions.playerNameBuffers[n][0] == '-' ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $602
line 785
;785:			continue;
ADDRGP4 $592
JUMPV
LABELV $602
line 787
;786:		}
;787:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $605
line 788
;788:			Com_sprintf( buf, sizeof(buf), "addbot %s %i %s\n", s_serveroptions.playerNameBuffers[n], skill,
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $608
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+64
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
line 790
;789:				playerTeam_list[s_serveroptions.playerTeam[n].curvalue] );
;790:		}
ADDRGP4 $606
JUMPV
LABELV $605
line 791
;791:		else {
line 792
;792:			Com_sprintf( buf, sizeof(buf), "addbot %s %i\n", s_serveroptions.playerNameBuffers[n], skill );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $612
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 793
;793:		}
LABELV $606
line 794
;794:		trap_Cmd_ExecuteText( EXEC_APPEND, buf );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 795
;795:	}
LABELV $592
line 777
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $591
line 798
;796:
;797:	// set player's team
;798:	if( dedicated == 0 && s_serveroptions.gametype >= GT_TEAM ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $614
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $614
line 799
;799:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait 5; team %s\n", playerTeam_list[s_serveroptions.playerTeam[0].curvalue] ) );
ADDRGP4 $617
ARGP4
ADDRGP4 s_serveroptions+4272+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playerTeam_list
ADDP4
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 800
;800:	}
LABELV $614
line 801
;801:}
LABELV $524
endproc ServerOptions_Start 160 24
proc ServerOptions_InitPlayerItems 12 12
line 809
;802:
;803:
;804:/*
;805:=================
;806:ServerOptions_InitPlayerItems
;807:=================
;808:*/
;809:static void ServerOptions_InitPlayerItems( void ) {
line 814
;810:	int		n;
;811:	int		v;
;812:
;813:	// init types
;814:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5688
INDIRI4
CNSTI4 0
EQI4 $621
line 815
;815:		v = 0;	// open
ADDRLP4 4
CNSTI4 0
ASGNI4
line 816
;816:	}
ADDRGP4 $622
JUMPV
LABELV $621
line 817
;817:	else {
line 818
;818:		v = 1;	// bot
ADDRLP4 4
CNSTI4 1
ASGNI4
line 819
;819:	}
LABELV $622
line 821
;820:	
;821:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $624
line 822
;822:		s_serveroptions.playerType[n].curvalue = v;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 823
;823:	}
LABELV $625
line 821
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $624
line 825
;824:
;825:	if( s_serveroptions.multiplayer && (s_serveroptions.gametype < GT_TEAM) ) {
ADDRGP4 s_serveroptions+5688
INDIRI4
CNSTI4 0
EQI4 $630
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
GEI4 $630
line 826
;826:		for( n = 8; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $634
line 827
;827:			s_serveroptions.playerType[n].curvalue = 2;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
CNSTI4 2
ASGNI4
line 828
;828:		}
LABELV $635
line 826
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $634
line 829
;829:	}
LABELV $630
line 832
;830:
;831:	// if not a dedicated server, first slot is reserved for the human on the server
;832:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+536+64
INDIRI4
CNSTI4 0
NEI4 $640
line 834
;833:		// human
;834:		s_serveroptions.playerType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_serveroptions+2256+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 835
;835:		s_serveroptions.playerType[0].curvalue = 0;
ADDRGP4 s_serveroptions+2256+64
CNSTI4 0
ASGNI4
line 836
;836:		trap_Cvar_VariableStringBuffer( "name", s_serveroptions.playerNameBuffers[0], sizeof(s_serveroptions.playerNameBuffers[0]) );
ADDRGP4 $648
ARGP4
ADDRGP4 s_serveroptions+5728
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 837
;837:		Q_CleanStr( s_serveroptions.playerNameBuffers[0] );
ADDRGP4 s_serveroptions+5728
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 838
;838:	}
LABELV $640
line 841
;839:
;840:	// init teams
;841:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $652
line 842
;842:		for( n = 0; n < (PLAYER_SLOTS / 2); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $655
line 843
;843:			s_serveroptions.playerTeam[n].curvalue = 0;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+64
ADDP4
CNSTI4 0
ASGNI4
line 844
;844:		}
LABELV $656
line 842
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $655
line 845
;845:		for( ; n < PLAYER_SLOTS; n++ ) {
ADDRGP4 $664
JUMPV
LABELV $661
line 846
;846:			s_serveroptions.playerTeam[n].curvalue = 1;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+64
ADDP4
CNSTI4 1
ASGNI4
line 847
;847:		}
LABELV $662
line 845
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $664
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $661
line 848
;848:	}
ADDRGP4 $653
JUMPV
LABELV $652
line 849
;849:	else {
line 850
;850:		for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $667
line 851
;851:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+44
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
line 852
;852:		}
LABELV $668
line 850
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $667
line 853
;853:	}
LABELV $653
line 854
;854:}
LABELV $620
endproc ServerOptions_InitPlayerItems 12 12
proc ServerOptions_SetPlayerItems 12 0
line 862
;855:
;856:
;857:/*
;858:=================
;859:ServerOptions_SetPlayerItems
;860:=================
;861:*/
;862:static void ServerOptions_SetPlayerItems( void ) {
line 874
;863:	int		start;
;864:	int		n;
;865:
;866:	// types
;867://	for( n = 0; n < PLAYER_SLOTS; n++ ) {
;868://		if( (!s_serveroptions.multiplayer) && (n > 0) && (s_serveroptions.playerType[n].curvalue == 0) ) {
;869://			s_serveroptions.playerType[n].curvalue = 1;
;870://		}
;871://	}
;872:
;873:	// names
;874:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+536+64
INDIRI4
CNSTI4 0
NEI4 $674
line 875
;875:		s_serveroptions.player0.string = "Human";
ADDRGP4 s_serveroptions+2184+60
ADDRGP4 $680
ASGNP4
line 876
;876:		s_serveroptions.playerName[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 8
ADDRGP4 s_serveroptions+3408+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294963199
BANDU4
ASGNU4
line 878
;877:
;878:		start = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 879
;879:	}
ADDRGP4 $675
JUMPV
LABELV $674
line 880
;880:	else {
line 881
;881:		s_serveroptions.player0.string = "Open";
ADDRGP4 s_serveroptions+2184+60
ADDRGP4 $494
ASGNP4
line 882
;882:		start = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 883
;883:	}
LABELV $675
line 884
;884:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $688
JUMPV
LABELV $685
line 885
;885:		if( s_serveroptions.playerType[n].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $689
line 886
;886:			s_serveroptions.playerName[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+44
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
line 887
;887:		}
ADDRGP4 $690
JUMPV
LABELV $689
line 888
;888:		else {
line 889
;889:			s_serveroptions.playerName[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+44
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
line 890
;890:		}
LABELV $690
line 891
;891:	}
LABELV $686
line 884
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $688
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $685
line 894
;892:
;893:	// teams
;894:	if( s_serveroptions.gametype < GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
GEI4 $697
line 895
;895:		return;
ADDRGP4 $673
JUMPV
LABELV $697
line 897
;896:	}
;897:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $700
line 898
;898:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $704
line 899
;899:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+44
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
line 900
;900:		}
ADDRGP4 $705
JUMPV
LABELV $704
line 901
;901:		else {
line 902
;902:			s_serveroptions.playerTeam[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+44
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
line 903
;903:		}
LABELV $705
line 904
;904:	}
LABELV $701
line 897
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $703
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $700
line 905
;905:}
LABELV $673
endproc ServerOptions_SetPlayerItems 12 0
proc ServerOptions_Event 8 0
line 913
;906:
;907:
;908:/*
;909:=================
;910:ServerOptions_Event
;911:=================
;912:*/
;913:static void ServerOptions_Event( void* ptr, int event ) {
line 914
;914:	switch( ((menucommon_s*)ptr)->id ) {
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
LTI4 $713
ADDRLP4 0
INDIRI4
CNSTI4 24
GTI4 $713
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $729-72
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $729
address $723
address $713
address $716
address $719
address $719
address $720
address $726
code
LABELV $716
line 920
;915:	
;916:	//if( event != QM_ACTIVATED && event != QM_LOSTFOCUS) {
;917:	//	return;
;918:	//}
;919:	case ID_PLAYER_TYPE:
;920:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $717
line 921
;921:			break;
ADDRGP4 $714
JUMPV
LABELV $717
line 923
;922:		}
;923:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 924
;924:		break;
ADDRGP4 $714
JUMPV
LABELV $719
line 928
;925:
;926:	case ID_MAXCLIENTS:
;927:	case ID_DEDICATED:
;928:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 929
;929:		break;
ADDRGP4 $714
JUMPV
LABELV $720
line 931
;930:	case ID_GO:
;931:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $721
line 932
;932:			break;
ADDRGP4 $714
JUMPV
LABELV $721
line 934
;933:		}
;934:		ServerOptions_Start();
ADDRGP4 ServerOptions_Start
CALLV
pop
line 935
;935:		break;
ADDRGP4 $714
JUMPV
LABELV $723
line 938
;936:
;937:	case ID_STARTSERVERNEXT:
;938:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $714
line 939
;939:			break;
ADDRGP4 $714
JUMPV
line 941
;940:		}
;941:		break;
LABELV $726
line 943
;942:	case ID_BACK:
;943:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $727
line 944
;944:			break;
ADDRGP4 $714
JUMPV
LABELV $727
line 946
;945:		}
;946:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 947
;947:		break;
LABELV $713
LABELV $714
line 949
;948:	}
;949:}
LABELV $712
endproc ServerOptions_Event 8 0
proc ServerOptions_PlayerNameEvent 4 4
line 952
;950:
;951:
;952:static void ServerOptions_PlayerNameEvent( void* ptr, int event ) {
line 955
;953:	int		n;
;954:
;955:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $732
line 956
;956:		return;
ADDRGP4 $731
JUMPV
LABELV $732
line 958
;957:	}
;958:	n = ((menutext_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 959
;959:	s_serveroptions.newBotIndex = n;
ADDRGP4 s_serveroptions+5924
ADDRLP4 0
INDIRI4
ASGNI4
line 960
;960:	UI_BotSelectMenu( s_serveroptions.playerNameBuffers[n] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ARGP4
ADDRGP4 UI_BotSelectMenu
CALLV
pop
line 961
;961:}
LABELV $731
endproc ServerOptions_PlayerNameEvent 4 4
proc ServerOptions_StatusBar 4 20
line 969
;962:
;963:
;964:/*
;965:=================
;966:ServerOptions_StatusBar
;967:=================
;968:*/
;969:static void ServerOptions_StatusBar( void* ptr ) {
line 970
;970:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $737
JUMPV
LABELV $737
line 972
;971:	default:
;972:		UI_DrawString( 320, 440, "0 = NO LIMIT", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $740
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 973
;973:		break;
LABELV $738
line 975
;974:	}
;975:}
LABELV $736
endproc ServerOptions_StatusBar 4 20
proc ServerOptions_LevelshotDraw 20 20
line 983
;976:
;977:
;978:/*
;979:===============
;980:ServerOptions_LevelshotDraw
;981:===============
;982:*/
;983:static void ServerOptions_LevelshotDraw( void *self ) {
line 989
;984:	menubitmap_s	*b;
;985:	int				x;
;986:	int				y;
;987:
;988:	// strange place for this, but it works
;989:	if( s_serveroptions.newBot ) {
ADDRGP4 s_serveroptions+5920
INDIRI4
CNSTI4 0
EQI4 $742
line 990
;990:		Q_strncpyz( s_serveroptions.playerNameBuffers[s_serveroptions.newBotIndex], s_serveroptions.newBotName, 16 );
ADDRGP4 s_serveroptions+5924
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ARGP4
ADDRGP4 s_serveroptions+5928
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 991
;991:		s_serveroptions.newBot = qfalse;
ADDRGP4 s_serveroptions+5920
CNSTI4 0
ASGNI4
line 992
;992:	}
LABELV $742
line 994
;993:
;994:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 996
;995:
;996:	Bitmap_Draw( b );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 998
;997:
;998:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 999
;999:	y = b->generic.y + b->height;
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
line 1000
;1000:	UI_FillRect( x, y, b->width, 40, colorBlack );
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
line 1002
;1001:
;1002:	x += b->width / 2;
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
line 1003
;1003:	y += 4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 1004
;1004:	UI_DrawString( x, y, s_serveroptions.mapnamebuffer, UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+5696
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1006
;1005:
;1006:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1007
;1007:	UI_DrawString( x, y, gametype_items[gametype_remap2[s_serveroptions.gametype]], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRGP4 s_serveroptions+5692
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
line 1008
;1008:}
LABELV $741
endproc ServerOptions_LevelshotDraw 20 20
proc ServerOptions_InitBotNames 1072 12
line 1011
;1009:
;1010:
;1011:static void ServerOptions_InitBotNames( void ) {
line 1020
;1012:	int			count;
;1013:	int			n;
;1014:	const char	*arenaInfo;
;1015:	const char	*botInfo;
;1016:	char		*p;
;1017:	char		*bot;
;1018:	char		bots[MAX_INFO_STRING];
;1019:
;1020:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $752
line 1021
;1021:		Q_strncpyz( s_serveroptions.playerNameBuffers[1], "grunt", 16 );
ADDRGP4 s_serveroptions+5728+16
ARGP4
ADDRGP4 $757
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1022
;1022:		Q_strncpyz( s_serveroptions.playerNameBuffers[2], "major", 16 );
ADDRGP4 s_serveroptions+5728+32
ARGP4
ADDRGP4 $760
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1023
;1023:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
NEI4 $761
line 1024
;1024:			Q_strncpyz( s_serveroptions.playerNameBuffers[3], "visor", 16 );
ADDRGP4 s_serveroptions+5728+48
ARGP4
ADDRGP4 $766
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1025
;1025:		}
ADDRGP4 $762
JUMPV
LABELV $761
line 1026
;1026:		else {
line 1027
;1027:			s_serveroptions.playerType[3].curvalue = 2;
ADDRGP4 s_serveroptions+2256+288+64
CNSTI4 2
ASGNI4
line 1028
;1028:		}
LABELV $762
line 1029
;1029:		s_serveroptions.playerType[4].curvalue = 2;
ADDRGP4 s_serveroptions+2256+384+64
CNSTI4 2
ASGNI4
line 1030
;1030:		s_serveroptions.playerType[5].curvalue = 2;
ADDRGP4 s_serveroptions+2256+480+64
CNSTI4 2
ASGNI4
line 1032
;1031:
;1032:		Q_strncpyz( s_serveroptions.playerNameBuffers[6], "sarge", 16 );
ADDRGP4 s_serveroptions+5728+96
ARGP4
ADDRGP4 $778
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1033
;1033:		Q_strncpyz( s_serveroptions.playerNameBuffers[7], "grunt", 16 );
ADDRGP4 s_serveroptions+5728+112
ARGP4
ADDRGP4 $757
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1034
;1034:		Q_strncpyz( s_serveroptions.playerNameBuffers[8], "major", 16 );
ADDRGP4 s_serveroptions+5728+128
ARGP4
ADDRGP4 $760
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1035
;1035:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
NEI4 $783
line 1036
;1036:			Q_strncpyz( s_serveroptions.playerNameBuffers[9], "visor", 16 );
ADDRGP4 s_serveroptions+5728+144
ARGP4
ADDRGP4 $766
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1037
;1037:		}
ADDRGP4 $784
JUMPV
LABELV $783
line 1038
;1038:		else {
line 1039
;1039:			s_serveroptions.playerType[9].curvalue = 2;
ADDRGP4 s_serveroptions+2256+864+64
CNSTI4 2
ASGNI4
line 1040
;1040:		}
LABELV $784
line 1041
;1041:		s_serveroptions.playerType[10].curvalue = 2;
ADDRGP4 s_serveroptions+2256+960+64
CNSTI4 2
ASGNI4
line 1042
;1042:		s_serveroptions.playerType[11].curvalue = 2;
ADDRGP4 s_serveroptions+2256+1056+64
CNSTI4 2
ASGNI4
line 1044
;1043:
;1044:		return;
ADDRGP4 $751
JUMPV
LABELV $752
line 1047
;1045:	}
;1046:
;1047:	count = 1;	// skip the first slot, reserved for a human
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1050
;1048:
;1049:	// get info for this map
;1050:	arenaInfo = UI_GetArenaInfoByMap( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+5696
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1048
INDIRP4
ASGNP4
line 1053
;1051:
;1052:	// get the bot info - we'll seed with them if any are listed
;1053:	Q_strncpyz( bots, Info_ValueForKey( arenaInfo, "bots" ), sizeof(bots) );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $798
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
line 1054
;1054:	p = &bots[0];
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $800
JUMPV
line 1055
;1055:	while( *p && count < PLAYER_SLOTS ) {
LABELV $802
line 1057
;1056:		//skip spaces
;1057:		while( *p && *p == ' ' ) {
line 1058
;1058:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1059
;1059:		}
LABELV $803
line 1057
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $805
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $802
LABELV $805
line 1060
;1060:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $806
line 1061
;1061:			break;
ADDRGP4 $801
JUMPV
LABELV $806
line 1065
;1062:		}
;1063:
;1064:		// mark start of bot name
;1065:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $809
JUMPV
LABELV $808
line 1068
;1066:
;1067:		// skip until space of null
;1068:		while( *p && *p != ' ' ) {
line 1069
;1069:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1070
;1070:		}
LABELV $809
line 1068
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $811
ADDRLP4 1060
INDIRI4
CNSTI4 32
NEI4 $808
LABELV $811
line 1071
;1071:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $812
line 1072
;1072:			*p++ = 0;
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
line 1073
;1073:		}
LABELV $812
line 1075
;1074:
;1075:		botInfo = UI_GetBotInfoByName( bot );
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
line 1076
;1076:		bot = Info_ValueForKey( botInfo, "name" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $648
ARGP4
ADDRLP4 1068
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1068
INDIRP4
ASGNP4
line 1078
;1077:
;1078:		Q_strncpyz( s_serveroptions.playerNameBuffers[count], bot, sizeof(s_serveroptions.playerNameBuffers[count]) );
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
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
line 1079
;1079:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1080
;1080:	}
LABELV $800
line 1055
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $816
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $803
LABELV $816
LABELV $801
line 1083
;1081:
;1082:	// set the rest of the bot slots to "---"
;1083:	for( n = count; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $820
JUMPV
LABELV $817
line 1084
;1084:		strcpy( s_serveroptions.playerNameBuffers[n], "--------" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ARGP4
ADDRGP4 $822
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1085
;1085:	}
LABELV $818
line 1083
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $820
ADDRLP4 12
INDIRI4
CNSTI4 12
LTI4 $817
line 1088
;1086:
;1087:	// pad up to #8 as open slots
;1088:	for( ;count < 8; count++ ) {
ADDRGP4 $826
JUMPV
LABELV $823
line 1089
;1089:		s_serveroptions.playerType[count].curvalue = 0;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
CNSTI4 0
ASGNI4
line 1090
;1090:	}
LABELV $824
line 1088
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $826
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $823
line 1093
;1091:
;1092:	// close off the rest by default
;1093:	for( ;count < PLAYER_SLOTS; count++ ) {
ADDRGP4 $832
JUMPV
LABELV $829
line 1094
;1094:		if( s_serveroptions.playerType[count].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $833
line 1095
;1095:			s_serveroptions.playerType[count].curvalue = 2;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+64
ADDP4
CNSTI4 2
ASGNI4
line 1096
;1096:		}
LABELV $833
line 1097
;1097:	}
LABELV $830
line 1093
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $832
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $829
line 1098
;1098:}
LABELV $751
endproc ServerOptions_InitBotNames 1072 12
bss
align 1
LABELV $840
skip 64
code
proc ServerOptions_SetMenuItems 84 16
line 1106
;1099:
;1100:
;1101:/*
;1102:=================
;1103:ServerOptions_SetMenuItems
;1104:=================
;1105:*/
;1106:static void ServerOptions_SetMenuItems( void ) {
line 1109
;1107:	static char picname[64];
;1108:
;1109:	switch( s_serveroptions.gametype ) {
ADDRLP4 0
ADDRGP4 s_serveroptions+5692
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $841
ADDRLP4 0
INDIRI4
CNSTI4 4
GTI4 $841
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $880
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $880
address $844
address $852
address $841
address $859
address $869
code
LABELV $844
LABELV $841
line 1112
;1110:	case GT_FFA:
;1111:	default:
;1112:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_fraglimit" ) ) );
ADDRGP4 $559
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
ADDRGP4 $848
ARGP4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1113
;1113:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_timelimit" ) ) );
ADDRGP4 $560
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
ADDRGP4 $848
ARGP4
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1114
;1114:		break;
ADDRGP4 $842
JUMPV
LABELV $852
line 1117
;1115:
;1116:	case GT_TOURNAMENT:
;1117:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_fraglimit" ) ) );
ADDRGP4 $562
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
ADDRGP4 $848
ARGP4
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1118
;1118:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_timelimit" ) ) );
ADDRGP4 $563
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
ADDRGP4 $848
ARGP4
ADDRLP4 32
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1119
;1119:		break;
ADDRGP4 $842
JUMPV
LABELV $859
line 1122
;1120:
;1121:	case GT_TEAM:
;1122:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_fraglimit" ) ) );
ADDRGP4 $565
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
ADDRGP4 $848
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1123
;1123:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_timelimit" ) ) );
ADDRGP4 $566
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
ADDRGP4 $848
ARGP4
ADDRLP4 48
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1124
;1124:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_team_friendly" ) );
ADDRGP4 $868
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
ADDRGP4 s_serveroptions+1628+60
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 1125
;1125:		break;
ADDRGP4 $842
JUMPV
LABELV $869
line 1128
;1126:
;1127:	case GT_CTF:
;1128:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $873
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
ADDRGP4 $848
ARGP4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1129
;1129:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_timelimit" ) ) );
ADDRGP4 $570
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
ADDRGP4 $848
ARGP4
ADDRLP4 72
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1130
;1130:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_friendly" ) );
ADDRGP4 $879
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
ADDRGP4 s_serveroptions+1628+60
ADDRLP4 80
INDIRF4
CVFI4 4
ASGNI4
line 1131
;1131:		break;
LABELV $842
line 1134
;1132:	}
;1133:
;1134:	Q_strncpyz( s_serveroptions.hostname.field.buffer, UI_Cvar_VariableString( "sv_hostname" ), sizeof( s_serveroptions.hostname.field.buffer ) );
ADDRGP4 $580
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_serveroptions+1692+60+12
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1135
;1135:	s_serveroptions.pure.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_pure" ) );
ADDRGP4 $579
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
ADDRGP4 s_serveroptions+2024+60
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1138
;1136:
;1137:	// set the map pic 
;1138:	Com_sprintf( picname, 128, "levelshots/%s", s_startserver.maplist[s_startserver.currentmap] ); // Changed length from 64
ADDRGP4 $840
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $105
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
line 1139
;1139:	s_serveroptions.mappic.generic.name = picname;
ADDRGP4 s_serveroptions+360+4
ADDRGP4 $840
ASGNP4
line 1142
;1140:
;1141:	// set the map name - Why do we need to do this?
;1142:	strcpy( s_serveroptions.mapnamebuffer, s_startserver.mapname.string );
ADDRGP4 s_serveroptions+5696
ARGP4
ADDRGP4 s_startserver+1776+60
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1145
;1143:
;1144:	//Q_strupr( s_startserver.mapname.string ); // Shafe - Try this?
;1145:	Q_strupr( s_serveroptions.mapnamebuffer );  // Create Match Thing - Shafe
ADDRGP4 s_serveroptions+5696
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1148
;1146:
;1147:	// get the player selections initialized
;1148:	ServerOptions_InitPlayerItems();
ADDRGP4 ServerOptions_InitPlayerItems
CALLV
pop
line 1149
;1149:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1152
;1150:
;1151:	// seed bot names
;1152:	ServerOptions_InitBotNames();
ADDRGP4 ServerOptions_InitBotNames
CALLV
pop
line 1153
;1153:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1154
;1154:}
LABELV $839
endproc ServerOptions_SetMenuItems 84 16
proc PlayerName_Draw 48 20
line 1161
;1155:
;1156:/*
;1157:=================
;1158:PlayerName_Draw
;1159:=================
;1160:*/
;1161:static void PlayerName_Draw( void *item ) {
line 1168
;1162:	menutext_s	*s;
;1163:	float		*color;
;1164:	int			x, y;
;1165:	int			style;
;1166:	qboolean	focus;
;1167:
;1168:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1170
;1169:
;1170:	x = s->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1171
;1171:	y =	s->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1173
;1172:
;1173:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1174
;1174:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
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
NEI4 $899
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $900
JUMPV
LABELV $899
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $900
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1176
;1175:
;1176:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $901
line 1177
;1177:		color = text_color_disabled;
ADDRLP4 4
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $902
JUMPV
LABELV $901
line 1178
;1178:	else if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $903
line 1179
;1179:	{
line 1180
;1180:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1181
;1181:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1182
;1182:	}
ADDRGP4 $904
JUMPV
LABELV $903
line 1183
;1183:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $905
line 1184
;1184:	{
line 1185
;1185:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1186
;1186:		style |= UI_BLINK;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1187
;1187:	}
ADDRGP4 $906
JUMPV
LABELV $905
line 1189
;1188:	else
;1189:		color = text_color_normal;
ADDRLP4 4
ADDRGP4 text_color_normal
ASGNP4
LABELV $906
LABELV $904
LABELV $902
line 1191
;1190:
;1191:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $907
line 1192
;1192:	{
line 1194
;1193:		// draw cursor
;1194:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
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
line 1195
;1195:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
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
line 1196
;1196:	}
LABELV $907
line 1198
;1197:
;1198:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
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
line 1199
;1199:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->string, style|UI_LEFT, color );
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
line 1200
;1200:}
LABELV $897
endproc PlayerName_Draw 48 20
proc ServerOptions_MenuInit 52 12
line 1210
;1201:
;1202:
;1203:/*
;1204:=================
;1205:ServerOptions_MenuInit
;1206:=================
;1207:*/
;1208:#define OPTIONS_X	456
;1209:
;1210:static void ServerOptions_MenuInit( qboolean multiplayer ) {
line 1214
;1211:	int		y;
;1212:	int		n;
;1213:
;1214:	memset( &s_serveroptions, 0 ,sizeof(serveroptions_t) );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 6040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1215
;1215:	s_serveroptions.multiplayer = multiplayer;
ADDRGP4 s_serveroptions+5688
ADDRFP4 0
INDIRI4
ASGNI4
line 1216
;1216:	s_serveroptions.gametype = (int)Com_Clamp( 0, 5, trap_Cvar_VariableValue( "g_gameType" ) );
ADDRGP4 $206
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
ADDRGP4 s_serveroptions+5692
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1217
;1217:	s_serveroptions.punkbuster.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_punkbuster" ) );
ADDRGP4 $584
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
ADDRGP4 s_serveroptions+5944+64
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1219
;1218:
;1219:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1221
;1220:
;1221:	s_serveroptions.menu.wrapAround = qtrue;
ADDRGP4 s_serveroptions+276
CNSTI4 1
ASGNI4
line 1222
;1222:	s_serveroptions.menu.fullscreen = qtrue;
ADDRGP4 s_serveroptions+280
CNSTI4 1
ASGNI4
line 1224
;1223:
;1224:	s_serveroptions.banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 s_serveroptions+288
CNSTI4 10
ASGNI4
line 1225
;1225:	s_serveroptions.banner.generic.x			= 320;
ADDRGP4 s_serveroptions+288+12
CNSTI4 320
ASGNI4
line 1226
;1226:	s_serveroptions.banner.generic.y			= 16;
ADDRGP4 s_serveroptions+288+16
CNSTI4 16
ASGNI4
line 1227
;1227:	s_serveroptions.banner.string  				= "GAME SERVER";
ADDRGP4 s_serveroptions+288+60
ADDRGP4 $239
ASGNP4
line 1228
;1228:	s_serveroptions.banner.color  				= color_white;
ADDRGP4 s_serveroptions+288+68
ADDRGP4 color_white
ASGNP4
line 1229
;1229:	s_serveroptions.banner.style  				= UI_CENTER;
ADDRGP4 s_serveroptions+288+64
CNSTI4 1
ASGNI4
line 1231
;1230:
;1231:	s_serveroptions.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+360
CNSTI4 6
ASGNI4
line 1232
;1232:	s_serveroptions.mappic.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_serveroptions+360+44
CNSTU4 16388
ASGNU4
line 1233
;1233:	s_serveroptions.mappic.generic.x			= 352;
ADDRGP4 s_serveroptions+360+12
CNSTI4 352
ASGNI4
line 1234
;1234:	s_serveroptions.mappic.generic.y			= 80;
ADDRGP4 s_serveroptions+360+16
CNSTI4 80
ASGNI4
line 1235
;1235:	s_serveroptions.mappic.width				= 160;
ADDRGP4 s_serveroptions+360+76
CNSTI4 160
ASGNI4
line 1236
;1236:	s_serveroptions.mappic.height				= 120;
ADDRGP4 s_serveroptions+360+80
CNSTI4 120
ASGNI4
line 1237
;1237:	s_serveroptions.mappic.errorpic				= GAMESERVER_UNKNOWNMAP;
ADDRGP4 s_serveroptions+360+64
ADDRGP4 $310
ASGNP4
line 1238
;1238:	s_serveroptions.mappic.generic.ownerdraw	= ServerOptions_LevelshotDraw;
ADDRGP4 s_serveroptions+360+56
ADDRGP4 ServerOptions_LevelshotDraw
ASGNP4
line 1240
;1239:
;1240:	s_serveroptions.picframe.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+448
CNSTI4 6
ASGNI4
line 1241
;1241:	s_serveroptions.picframe.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_serveroptions+448+44
CNSTU4 16452
ASGNU4
line 1242
;1242:	s_serveroptions.picframe.generic.x			= 352 - 38;
ADDRGP4 s_serveroptions+448+12
CNSTI4 314
ASGNI4
line 1243
;1243:	s_serveroptions.picframe.generic.y			= 80 - 40;
ADDRGP4 s_serveroptions+448+16
CNSTI4 40
ASGNI4
line 1244
;1244:	s_serveroptions.picframe.width  			= 320;
ADDRGP4 s_serveroptions+448+76
CNSTI4 320
ASGNI4
line 1245
;1245:	s_serveroptions.picframe.height  			= 320;
ADDRGP4 s_serveroptions+448+80
CNSTI4 320
ASGNI4
line 1246
;1246:	s_serveroptions.picframe.focuspic			= GAMESERVER_SELECT;
ADDRGP4 s_serveroptions+448+60
ADDRGP4 $338
ASGNP4
line 1248
;1247:
;1248:	y = 272;
ADDRLP4 4
CNSTI4 272
ASGNI4
line 1249
;1249:	if( s_serveroptions.gametype != GT_CTF ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 4
EQI4 $955
line 1250
;1250:		s_serveroptions.fraglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+964
CNSTI4 4
ASGNI4
line 1251
;1251:		s_serveroptions.fraglimit.generic.name       = "Frag Limit:";
ADDRGP4 s_serveroptions+964+4
ADDRGP4 $961
ASGNP4
line 1252
;1252:		s_serveroptions.fraglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+964+44
CNSTU4 290
ASGNU4
line 1253
;1253:		s_serveroptions.fraglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+964+12
CNSTI4 456
ASGNI4
line 1254
;1254:		s_serveroptions.fraglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+964+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1255
;1255:		s_serveroptions.fraglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+964+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1256
;1256:		s_serveroptions.fraglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+964+60+8
CNSTI4 3
ASGNI4
line 1257
;1257:		s_serveroptions.fraglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+964+60+268
CNSTI4 3
ASGNI4
line 1258
;1258:	}
ADDRGP4 $956
JUMPV
LABELV $955
line 1259
;1259:	else {
line 1260
;1260:		s_serveroptions.flaglimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1296
CNSTI4 4
ASGNI4
line 1261
;1261:		s_serveroptions.flaglimit.generic.name       = "Capture Limit:";
ADDRGP4 s_serveroptions+1296+4
ADDRGP4 $979
ASGNP4
line 1262
;1262:		s_serveroptions.flaglimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1296+44
CNSTU4 290
ASGNU4
line 1263
;1263:		s_serveroptions.flaglimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+1296+12
CNSTI4 456
ASGNI4
line 1264
;1264:		s_serveroptions.flaglimit.generic.y	         = y;
ADDRGP4 s_serveroptions+1296+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1265
;1265:		s_serveroptions.flaglimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+1296+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1266
;1266:		s_serveroptions.flaglimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+1296+60+8
CNSTI4 3
ASGNI4
line 1267
;1267:		s_serveroptions.flaglimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+1296+60+268
CNSTI4 3
ASGNI4
line 1268
;1268:	}
LABELV $956
line 1270
;1269:
;1270:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1271
;1271:	s_serveroptions.timelimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+632
CNSTI4 4
ASGNI4
line 1272
;1272:	s_serveroptions.timelimit.generic.name       = "Time Limit:";
ADDRGP4 s_serveroptions+632+4
ADDRGP4 $997
ASGNP4
line 1273
;1273:	s_serveroptions.timelimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+632+44
CNSTU4 290
ASGNU4
line 1274
;1274:	s_serveroptions.timelimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+632+12
CNSTI4 456
ASGNI4
line 1275
;1275:	s_serveroptions.timelimit.generic.y	         = y;
ADDRGP4 s_serveroptions+632+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1276
;1276:	s_serveroptions.timelimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+632+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1277
;1277:	s_serveroptions.timelimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+632+60+8
CNSTI4 3
ASGNI4
line 1278
;1278:	s_serveroptions.timelimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+632+60+268
CNSTI4 3
ASGNI4
line 1280
;1279:
;1280:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $1012
line 1281
;1281:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1282
;1282:		s_serveroptions.friendlyfire.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1628
CNSTI4 5
ASGNI4
line 1283
;1283:		s_serveroptions.friendlyfire.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1628+44
CNSTU4 258
ASGNU4
line 1284
;1284:		s_serveroptions.friendlyfire.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1628+12
CNSTI4 456
ASGNI4
line 1285
;1285:		s_serveroptions.friendlyfire.generic.y	      = y;
ADDRGP4 s_serveroptions+1628+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1286
;1286:		s_serveroptions.friendlyfire.generic.name	  = "Friendly Fire:";
ADDRGP4 s_serveroptions+1628+4
ADDRGP4 $1024
ASGNP4
line 1287
;1287:	}
LABELV $1012
line 1289
;1288:
;1289:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1290
;1290:	s_serveroptions.pure.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2024
CNSTI4 5
ASGNI4
line 1291
;1291:	s_serveroptions.pure.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2024+44
CNSTU4 258
ASGNU4
line 1292
;1292:	s_serveroptions.pure.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2024+12
CNSTI4 456
ASGNI4
line 1293
;1293:	s_serveroptions.pure.generic.y				= y;
ADDRGP4 s_serveroptions+2024+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1294
;1294:	s_serveroptions.pure.generic.name			= "Pure Server:";
ADDRGP4 s_serveroptions+2024+4
ADDRGP4 $1034
ASGNP4
line 1296
;1295:
;1296:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5688
INDIRI4
CNSTI4 0
EQI4 $1035
line 1297
;1297:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1298
;1298:		s_serveroptions.dedicated.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+536
CNSTI4 3
ASGNI4
line 1299
;1299:		s_serveroptions.dedicated.generic.id		= ID_DEDICATED;
ADDRGP4 s_serveroptions+536+8
CNSTI4 22
ASGNI4
line 1300
;1300:		s_serveroptions.dedicated.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+536+44
CNSTU4 258
ASGNU4
line 1301
;1301:		s_serveroptions.dedicated.generic.callback	= ServerOptions_Event;
ADDRGP4 s_serveroptions+536+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1302
;1302:		s_serveroptions.dedicated.generic.x			= OPTIONS_X;
ADDRGP4 s_serveroptions+536+12
CNSTI4 456
ASGNI4
line 1303
;1303:		s_serveroptions.dedicated.generic.y			= y;
ADDRGP4 s_serveroptions+536+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1304
;1304:		s_serveroptions.dedicated.generic.name		= "Dedicated:";
ADDRGP4 s_serveroptions+536+4
ADDRGP4 $1051
ASGNP4
line 1305
;1305:		s_serveroptions.dedicated.itemnames			= dedicated_list;
ADDRGP4 s_serveroptions+536+76
ADDRGP4 dedicated_list
ASGNP4
line 1306
;1306:	}
LABELV $1035
line 1308
;1307:
;1308:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5688
INDIRI4
CNSTI4 0
EQI4 $1054
line 1309
;1309:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1310
;1310:		s_serveroptions.hostname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1692
CNSTI4 4
ASGNI4
line 1311
;1311:		s_serveroptions.hostname.generic.name       = "Hostname:";
ADDRGP4 s_serveroptions+1692+4
ADDRGP4 $1060
ASGNP4
line 1312
;1312:		s_serveroptions.hostname.generic.flags      = QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1692+44
CNSTU4 2
ASGNU4
line 1313
;1313:		s_serveroptions.hostname.generic.x          = OPTIONS_X;
ADDRGP4 s_serveroptions+1692+12
CNSTI4 456
ASGNI4
line 1314
;1314:		s_serveroptions.hostname.generic.y	        = y;
ADDRGP4 s_serveroptions+1692+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1315
;1315:		s_serveroptions.hostname.field.widthInChars = 18;
ADDRGP4 s_serveroptions+1692+60+8
CNSTI4 18
ASGNI4
line 1316
;1316:		s_serveroptions.hostname.field.maxchars     = 64;
ADDRGP4 s_serveroptions+1692+60+268
CNSTI4 64
ASGNI4
line 1317
;1317:	}
LABELV $1054
line 1319
;1318:
;1319:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1320
;1320:	s_serveroptions.punkbuster.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+5944
CNSTI4 3
ASGNI4
line 1321
;1321:	s_serveroptions.punkbuster.generic.name			= "Punkbuster:";
ADDRGP4 s_serveroptions+5944+4
ADDRGP4 $1076
ASGNP4
line 1322
;1322:	s_serveroptions.punkbuster.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+5944+44
CNSTU4 258
ASGNU4
line 1323
;1323:	s_serveroptions.punkbuster.generic.id			= 0;
ADDRGP4 s_serveroptions+5944+8
CNSTI4 0
ASGNI4
line 1324
;1324:	s_serveroptions.punkbuster.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+5944+12
CNSTI4 456
ASGNI4
line 1325
;1325:	s_serveroptions.punkbuster.generic.y				= y;
ADDRGP4 s_serveroptions+5944+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1326
;1326:	s_serveroptions.punkbuster.itemnames				= punkbuster_items;
ADDRGP4 s_serveroptions+5944+76
ADDRGP4 punkbuster_items
ASGNP4
line 1328
;1327:	
;1328:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1329
;1329:	s_serveroptions.botSkill.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+2088
CNSTI4 3
ASGNI4
line 1330
;1330:	s_serveroptions.botSkill.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2088+44
CNSTU4 258
ASGNU4
line 1331
;1331:	s_serveroptions.botSkill.generic.name			= "Bot Skill:  ";
ADDRGP4 s_serveroptions+2088+4
ADDRGP4 $1092
ASGNP4
line 1332
;1332:	s_serveroptions.botSkill.generic.x				= 32 + (strlen(s_serveroptions.botSkill.generic.name) + 2 ) * SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2088+4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_serveroptions+2088+12
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 16
ADDI4
CNSTI4 32
ADDI4
ASGNI4
line 1333
;1333:	s_serveroptions.botSkill.generic.y				= y;
ADDRGP4 s_serveroptions+2088+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1334
;1334:	s_serveroptions.botSkill.itemnames				= botSkill_list;
ADDRGP4 s_serveroptions+2088+76
ADDRGP4 botSkill_list
ASGNP4
line 1335
;1335:	s_serveroptions.botSkill.curvalue				= 1;
ADDRGP4 s_serveroptions+2088+64
CNSTI4 1
ASGNI4
line 1337
;1336:
;1337:	y += ( 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1338
;1338:	s_serveroptions.player0.generic.type			= MTYPE_TEXT;
ADDRGP4 s_serveroptions+2184
CNSTI4 7
ASGNI4
line 1339
;1339:	s_serveroptions.player0.generic.flags			= QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2184+44
CNSTU4 2
ASGNU4
line 1340
;1340:	s_serveroptions.player0.generic.x				= 32 + SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2184+12
CNSTI4 40
ASGNI4
line 1341
;1341:	s_serveroptions.player0.generic.y				= y;
ADDRGP4 s_serveroptions+2184+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1342
;1342:	s_serveroptions.player0.color					= color_orange;
ADDRGP4 s_serveroptions+2184+68
ADDRGP4 color_orange
ASGNP4
line 1343
;1343:	s_serveroptions.player0.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_serveroptions+2184+64
CNSTI4 16
ASGNI4
line 1345
;1344:
;1345:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1114
line 1346
;1346:		s_serveroptions.playerType[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256
ADDP4
CNSTI4 3
ASGNI4
line 1347
;1347:		s_serveroptions.playerType[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+44
ADDP4
CNSTU4 2
ASGNU4
line 1348
;1348:		s_serveroptions.playerType[n].generic.id		= ID_PLAYER_TYPE;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+8
ADDP4
CNSTI4 20
ASGNI4
line 1349
;1349:		s_serveroptions.playerType[n].generic.callback	= ServerOptions_Event;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+48
ADDP4
ADDRGP4 ServerOptions_Event
ASGNP4
line 1350
;1350:		s_serveroptions.playerType[n].generic.x			= 32;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+12
ADDP4
CNSTI4 32
ASGNI4
line 1351
;1351:		s_serveroptions.playerType[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1352
;1352:		s_serveroptions.playerType[n].itemnames			= playerType_list;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256+76
ADDP4
ADDRGP4 playerType_list
ASGNP4
line 1354
;1353:
;1354:		s_serveroptions.playerName[n].generic.type		= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408
ADDP4
CNSTI4 7
ASGNI4
line 1355
;1355:		s_serveroptions.playerName[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+44
ADDP4
CNSTU4 2
ASGNU4
line 1356
;1356:		s_serveroptions.playerName[n].generic.x			= 96;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+12
ADDP4
CNSTI4 96
ASGNI4
line 1357
;1357:		s_serveroptions.playerName[n].generic.y			= y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1358
;1358:		s_serveroptions.playerName[n].generic.callback	= ServerOptions_PlayerNameEvent;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+48
ADDP4
ADDRGP4 ServerOptions_PlayerNameEvent
ASGNP4
line 1359
;1359:		s_serveroptions.playerName[n].generic.id		= n;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1360
;1360:		s_serveroptions.playerName[n].generic.ownerdraw	= PlayerName_Draw;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+56
ADDP4
ADDRGP4 PlayerName_Draw
ASGNP4
line 1361
;1361:		s_serveroptions.playerName[n].color				= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1362
;1362:		s_serveroptions.playerName[n].style				= UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+64
ADDP4
CNSTI4 16
ASGNI4
line 1363
;1363:		s_serveroptions.playerName[n].string			= s_serveroptions.playerNameBuffers[n];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5728
ADDP4
ASGNP4
line 1364
;1364:		s_serveroptions.playerName[n].generic.top		= s_serveroptions.playerName[n].generic.y;
ADDRLP4 36
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 s_serveroptions+3408+24
ADDP4
ADDRLP4 36
INDIRI4
ADDRGP4 s_serveroptions+3408+16
ADDP4
INDIRI4
ASGNI4
line 1365
;1365:		s_serveroptions.playerName[n].generic.bottom	= s_serveroptions.playerName[n].generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 40
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 s_serveroptions+3408+32
ADDP4
ADDRLP4 40
INDIRI4
ADDRGP4 s_serveroptions+3408+16
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1366
;1366:		s_serveroptions.playerName[n].generic.left		= s_serveroptions.playerName[n].generic.x - SMALLCHAR_HEIGHT/ 2;
ADDRLP4 44
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 s_serveroptions+3408+20
ADDP4
ADDRLP4 44
INDIRI4
ADDRGP4 s_serveroptions+3408+12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1367
;1367:		s_serveroptions.playerName[n].generic.right		= s_serveroptions.playerName[n].generic.x + 16 * SMALLCHAR_WIDTH;
ADDRLP4 48
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 s_serveroptions+3408+28
ADDP4
ADDRLP4 48
INDIRI4
ADDRGP4 s_serveroptions+3408+12
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1369
;1368:
;1369:		s_serveroptions.playerTeam[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272
ADDP4
CNSTI4 3
ASGNI4
line 1370
;1370:		s_serveroptions.playerTeam[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+44
ADDP4
CNSTU4 2
ASGNU4
line 1371
;1371:		s_serveroptions.playerTeam[n].generic.x			= 240;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+12
ADDP4
CNSTI4 240
ASGNI4
line 1372
;1372:		s_serveroptions.playerTeam[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1373
;1373:		s_serveroptions.playerTeam[n].itemnames			= playerTeam_list;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272+76
ADDP4
ADDRGP4 playerTeam_list
ASGNP4
line 1375
;1374:
;1375:		y += ( SMALLCHAR_HEIGHT + 4 );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1376
;1376:	}
LABELV $1115
line 1345
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1114
line 1378
;1377:
;1378:	s_serveroptions.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5600
CNSTI4 6
ASGNI4
line 1379
;1379:	s_serveroptions.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_serveroptions+5600+4
ADDRGP4 $405
ASGNP4
line 1380
;1380:	s_serveroptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5600+44
CNSTU4 260
ASGNU4
line 1381
;1381:	s_serveroptions.back.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5600+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1382
;1382:	s_serveroptions.back.generic.id	      = ID_BACK;
ADDRGP4 s_serveroptions+5600+8
CNSTI4 24
ASGNI4
line 1383
;1383:	s_serveroptions.back.generic.x		  = 0;
ADDRGP4 s_serveroptions+5600+12
CNSTI4 0
ASGNI4
line 1384
;1384:	s_serveroptions.back.generic.y		  = 480-64;
ADDRGP4 s_serveroptions+5600+16
CNSTI4 416
ASGNI4
line 1385
;1385:	s_serveroptions.back.width  		  = 128;
ADDRGP4 s_serveroptions+5600+76
CNSTI4 128
ASGNI4
line 1386
;1386:	s_serveroptions.back.height  		  = 64;
ADDRGP4 s_serveroptions+5600+80
CNSTI4 64
ASGNI4
line 1387
;1387:	s_serveroptions.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_serveroptions+5600+60
ADDRGP4 $422
ASGNP4
line 1389
;1388:
;1389:	s_serveroptions.next.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5512
CNSTI4 6
ASGNI4
line 1390
;1390:	s_serveroptions.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_serveroptions+5512+4
ADDRGP4 $426
ASGNP4
line 1391
;1391:	s_serveroptions.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE|QMF_GRAYED|QMF_HIDDEN;
ADDRGP4 s_serveroptions+5512+44
CNSTU4 28944
ASGNU4
line 1392
;1392:	s_serveroptions.next.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5512+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1393
;1393:	s_serveroptions.next.generic.id	      = ID_STARTSERVERNEXT;
ADDRGP4 s_serveroptions+5512+8
CNSTI4 18
ASGNI4
line 1394
;1394:	s_serveroptions.next.generic.x		  = 640;
ADDRGP4 s_serveroptions+5512+12
CNSTI4 640
ASGNI4
line 1395
;1395:	s_serveroptions.next.generic.y		  = 480-64-72;
ADDRGP4 s_serveroptions+5512+16
CNSTI4 344
ASGNI4
line 1396
;1396:	s_serveroptions.next.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+5512+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1397
;1397:	s_serveroptions.next.width  		  = 128;
ADDRGP4 s_serveroptions+5512+76
CNSTI4 128
ASGNI4
line 1398
;1398:	s_serveroptions.next.height  		  = 64;
ADDRGP4 s_serveroptions+5512+80
CNSTI4 64
ASGNI4
line 1399
;1399:	s_serveroptions.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_serveroptions+5512+60
ADDRGP4 $443
ASGNP4
line 1401
;1400:
;1401:	s_serveroptions.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5424
CNSTI4 6
ASGNI4
line 1402
;1402:	s_serveroptions.go.generic.name     = GAMESERVER_FIGHT0;
ADDRGP4 s_serveroptions+5424+4
ADDRGP4 $1219
ASGNP4
line 1403
;1403:	s_serveroptions.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5424+44
CNSTU4 272
ASGNU4
line 1404
;1404:	s_serveroptions.go.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5424+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1405
;1405:	s_serveroptions.go.generic.id	    = ID_GO;
ADDRGP4 s_serveroptions+5424+8
CNSTI4 23
ASGNI4
line 1406
;1406:	s_serveroptions.go.generic.x		= 640;
ADDRGP4 s_serveroptions+5424+12
CNSTI4 640
ASGNI4
line 1407
;1407:	s_serveroptions.go.generic.y		= 480-64;
ADDRGP4 s_serveroptions+5424+16
CNSTI4 416
ASGNI4
line 1408
;1408:	s_serveroptions.go.width  		    = 128;
ADDRGP4 s_serveroptions+5424+76
CNSTI4 128
ASGNI4
line 1409
;1409:	s_serveroptions.go.height  		    = 64;
ADDRGP4 s_serveroptions+5424+80
CNSTI4 64
ASGNI4
line 1410
;1410:	s_serveroptions.go.focuspic         = GAMESERVER_FIGHT1;
ADDRGP4 s_serveroptions+5424+60
ADDRGP4 $1236
ASGNP4
line 1412
;1411:
;1412:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.banner );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1414
;1413:
;1414:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.mappic );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1415
;1415:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.picframe );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1417
;1416:
;1417:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.botSkill );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2088
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1418
;1418:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.player0 );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2184
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1419
;1419:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1242
line 1420
;1420:		if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1246
line 1421
;1421:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerType[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2256
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1422
;1422:		}
LABELV $1246
line 1423
;1423:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerName[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3408
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1424
;1424:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $1250
line 1425
;1425:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerTeam[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4272
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1426
;1426:		}
LABELV $1250
line 1427
;1427:	}
LABELV $1243
line 1419
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1242
line 1429
;1428:
;1429:	if( s_serveroptions.gametype != GT_CTF ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 4
EQI4 $1254
line 1430
;1430:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.fraglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+964
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1431
;1431:	}
ADDRGP4 $1255
JUMPV
LABELV $1254
line 1432
;1432:	else {
line 1433
;1433:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.flaglimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1434
;1434:	}
LABELV $1255
line 1435
;1435:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.timelimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1436
;1436:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5692
INDIRI4
CNSTI4 3
LTI4 $1260
line 1437
;1437:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.friendlyfire );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1628
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1438
;1438:	}
LABELV $1260
line 1439
;1439:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pure );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1440
;1440:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5688
INDIRI4
CNSTI4 0
EQI4 $1265
line 1441
;1441:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.dedicated );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1442
;1442:	}
LABELV $1265
line 1443
;1443:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5688
INDIRI4
CNSTI4 0
EQI4 $1269
line 1444
;1444:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.hostname );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1692
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1445
;1445:	}
LABELV $1269
line 1447
;1446:
;1447:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.back );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5600
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1448
;1448:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.next );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5512
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1449
;1449:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.go );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5424
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1453
;1450:
;1451:	//Menu_AddItem( &s_serveroptions.menu, (void*) &s_serveroptions.punkbuster );
;1452:	
;1453:	ServerOptions_SetMenuItems();
ADDRGP4 ServerOptions_SetMenuItems
CALLV
pop
line 1454
;1454:}
LABELV $909
endproc ServerOptions_MenuInit 52 12
export ServerOptions_Cache
proc ServerOptions_Cache 0 4
line 1461
;1455:
;1456:/*
;1457:=================
;1458:ServerOptions_Cache
;1459:=================
;1460:*/
;1461:void ServerOptions_Cache( void ) {
line 1462
;1462:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $405
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1463
;1463:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $422
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1464
;1464:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $1219
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1465
;1465:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $1236
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1466
;1466:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );
ADDRGP4 $338
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1467
;1467:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $310
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1468
;1468:}
LABELV $1276
endproc ServerOptions_Cache 0 4
proc UI_ServerOptionsMenu 0 4
line 1476
;1469:
;1470:
;1471:/*
;1472:=================
;1473:UI_ServerOptionsMenu
;1474:=================
;1475:*/
;1476:static void UI_ServerOptionsMenu( qboolean multiplayer ) {
line 1477
;1477:	ServerOptions_MenuInit( multiplayer );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ServerOptions_MenuInit
CALLV
pop
line 1478
;1478:	UI_PushMenu( &s_serveroptions.menu );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1479
;1479:}
LABELV $1277
endproc UI_ServerOptionsMenu 0 4
proc UI_BotSelectMenu_SortCompare 44 8
line 1540
;1480:
;1481:
;1482:
;1483:/*
;1484:=============================================================================
;1485:
;1486:BOT SELECT MENU *****
;1487:
;1488:=============================================================================
;1489:*/
;1490:
;1491:
;1492:#define BOTSELECT_BACK0			"menu/art/back_0"
;1493:#define BOTSELECT_BACK1			"menu/art/back_1"
;1494:#define BOTSELECT_ACCEPT0		"menu/art/accept_0"
;1495:#define BOTSELECT_ACCEPT1		"menu/art/accept_1"
;1496:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;1497:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;1498:#define BOTSELECT_ARROWS		"menu/art/gs_arrows_0"
;1499:#define BOTSELECT_ARROWSL		"menu/art/gs_arrows_l"
;1500:#define BOTSELECT_ARROWSR		"menu/art/gs_arrows_r"
;1501:
;1502:#define PLAYERGRID_COLS			4
;1503:#define PLAYERGRID_ROWS			4
;1504:#define MAX_MODELSPERPAGE		(PLAYERGRID_ROWS * PLAYERGRID_COLS)
;1505:
;1506:
;1507:typedef struct {
;1508:	menuframework_s	menu;
;1509:
;1510:	menutext_s		banner;
;1511:
;1512:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;1513:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;1514:	menutext_s		picnames[MAX_MODELSPERPAGE];
;1515:
;1516:	menubitmap_s	arrows;
;1517:	menubitmap_s	left;
;1518:	menubitmap_s	right;
;1519:
;1520:	menubitmap_s	go;
;1521:	menubitmap_s	back;
;1522:
;1523:	int				numBots;
;1524:	int				modelpage;
;1525:	int				numpages;
;1526:	int				selectedmodel;
;1527:	int				sortedBotNums[MAX_BOTS];
;1528:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;1529:	char			botnames[MAX_MODELSPERPAGE][16];
;1530:} botSelectInfo_t;
;1531:
;1532:static botSelectInfo_t	botSelectInfo;
;1533:
;1534:
;1535:/*
;1536:=================
;1537:UI_BotSelectMenu_SortCompare
;1538:=================
;1539:*/
;1540:static int QDECL UI_BotSelectMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 1545
;1541:	int			num1, num2;
;1542:	const char	*info1, *info2;
;1543:	const char	*name1, *name2;
;1544:
;1545:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1546
;1546:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1548
;1547:
;1548:	info1 = UI_GetBotInfoByNumber( num1 );
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
line 1549
;1549:	info2 = UI_GetBotInfoByNumber( num2 );
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
line 1551
;1550:
;1551:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $648
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1552
;1552:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $648
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 1554
;1553:
;1554:	return Q_stricmp( name1, name2 );
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
LABELV $1279
endproc UI_BotSelectMenu_SortCompare 44 8
proc UI_BotSelectMenu_BuildList 12 16
line 1563
;1555:}
;1556:
;1557:
;1558:/*
;1559:=================
;1560:UI_BotSelectMenu_BuildList
;1561:=================
;1562:*/
;1563:static void UI_BotSelectMenu_BuildList( void ) {
line 1566
;1564:	int		n;
;1565:
;1566:	botSelectInfo.modelpage = 0;
ADDRGP4 botSelectInfo+4772
CNSTI4 0
ASGNI4
line 1567
;1567:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+4768
ADDRLP4 4
INDIRI4
ASGNI4
line 1568
;1568:	botSelectInfo.numpages = botSelectInfo.numBots / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4776
ADDRGP4 botSelectInfo+4768
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1569
;1569:	if( botSelectInfo.numBots % MAX_MODELSPERPAGE ) {
ADDRGP4 botSelectInfo+4768
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $1285
line 1570
;1570:		botSelectInfo.numpages++;
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
line 1571
;1571:	}
LABELV $1285
line 1574
;1572:
;1573:	// initialize the array
;1574:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1292
JUMPV
LABELV $1289
line 1575
;1575:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1576
;1576:	}
LABELV $1290
line 1574
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1292
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1289
line 1579
;1577:
;1578:	// now sort it
;1579:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelectMenu_SortCompare );
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
line 1580
;1580:}
LABELV $1280
endproc UI_BotSelectMenu_BuildList 12 16
proc ServerPlayerIcon 80 20
line 1588
;1581:
;1582:
;1583:/*
;1584:=================
;1585:ServerPlayerIcon
;1586:=================
;1587:*/
;1588:static void ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 1592
;1589:	char	*skin;
;1590:	char	model[MAX_QPATH];
;1591:
;1592:	Q_strncpyz( model, modelAndSkin, sizeof(model));
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
line 1593
;1593:	skin = Q_strrchr( model, '/' );
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
line 1594
;1594:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1299
line 1595
;1595:		*skin++ = '\0';
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
line 1596
;1596:	}
ADDRGP4 $1300
JUMPV
LABELV $1299
line 1597
;1597:	else {
line 1598
;1598:		skin = "default";
ADDRLP4 0
ADDRGP4 $1301
ASGNP4
line 1599
;1599:	}
LABELV $1300
line 1601
;1600:
;1601:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1302
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1603
;1602:
;1603:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
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
NEI4 $1303
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1301
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1303
line 1604
;1604:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1305
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1605
;1605:	}
LABELV $1303
line 1606
;1606:}
LABELV $1298
endproc ServerPlayerIcon 80 20
proc UI_BotSelectMenu_UpdateGrid 36 12
line 1614
;1607:
;1608:
;1609:/*
;1610:=================
;1611:UI_BotSelectMenu_UpdateGrid
;1612:=================
;1613:*/
;1614:static void UI_BotSelectMenu_UpdateGrid( void ) {
line 1619
;1615:	const char	*info;
;1616:	int			i;
;1617:    int			j;
;1618:
;1619:	j = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1620
;1620:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1308
line 1621
;1621:		if( j < botSelectInfo.numBots ) { 
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
GEI4 $1312
line 1622
;1622:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
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
line 1623
;1623:			ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1316
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
line 1624
;1624:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), 16 );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $648
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
line 1625
;1625:			Q_CleanStr( botSelectInfo.botnames[i] );
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
line 1626
;1626: 			botSelectInfo.pics[i].generic.name = botSelectInfo.boticons[i];
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
line 1627
;1627:			if( BotAlreadySelected( botSelectInfo.botnames[i] ) ) {
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
EQI4 $1323
line 1628
;1628:				botSelectInfo.picnames[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 1629
;1629:			}
ADDRGP4 $1324
JUMPV
LABELV $1323
line 1630
;1630:			else {
line 1631
;1631:				botSelectInfo.picnames[i].color = color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1632
;1632:			}
LABELV $1324
line 1633
;1633:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
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
line 1634
;1634:		}
ADDRGP4 $1313
JUMPV
LABELV $1312
line 1635
;1635:		else {
line 1637
;1636:			// dead slot
;1637: 			botSelectInfo.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
CNSTP4 0
ASGNP4
line 1638
;1638:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
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
line 1639
;1639:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
CNSTI1 0
ASGNI1
line 1640
;1640:		}
LABELV $1313
line 1642
;1641:
;1642: 		botSelectInfo.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
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
line 1643
;1643: 		botSelectInfo.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+68
ADDP4
CNSTI4 0
ASGNI4
line 1644
;1644: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
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
line 1645
;1645:	}
LABELV $1309
line 1620
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
LTI4 $1308
line 1648
;1646:
;1647:	// set selected model
;1648:	i = botSelectInfo.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 botSelectInfo+4780
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 1649
;1649:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
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
line 1650
;1650:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
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
line 1652
;1651:
;1652:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
LEI4 $1348
line 1653
;1653:		if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 0
LEI4 $1351
line 1654
;1654:			botSelectInfo.left.generic.flags &= ~QMF_INACTIVE;
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
line 1655
;1655:		}
ADDRGP4 $1352
JUMPV
LABELV $1351
line 1656
;1656:		else {
line 1657
;1657:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
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
line 1658
;1658:		}
LABELV $1352
line 1660
;1659:
;1660:		if( botSelectInfo.modelpage < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1358
line 1661
;1661:			botSelectInfo.right.generic.flags &= ~QMF_INACTIVE;
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
line 1662
;1662:		}
ADDRGP4 $1349
JUMPV
LABELV $1358
line 1663
;1663:		else {
line 1664
;1664:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
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
line 1665
;1665:		}
line 1666
;1666:	}
ADDRGP4 $1349
JUMPV
LABELV $1348
line 1667
;1667:	else {
line 1669
;1668:		// hide left/right markers
;1669:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
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
line 1670
;1670:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
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
line 1671
;1671:	}
LABELV $1349
line 1672
;1672:}
LABELV $1306
endproc UI_BotSelectMenu_UpdateGrid 36 12
proc UI_BotSelectMenu_Default 28 8
line 1680
;1673:
;1674:
;1675:/*
;1676:=================
;1677:UI_BotSelectMenu_Default
;1678:=================
;1679:*/
;1680:static void UI_BotSelectMenu_Default( char *bot ) {
line 1686
;1681:	const char	*botInfo;
;1682:	const char	*test;
;1683:	int			n;
;1684:	int			i;
;1685:
;1686:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1374
JUMPV
LABELV $1371
line 1687
;1687:		botInfo = UI_GetBotInfoByNumber( n );
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
line 1688
;1688:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $648
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1689
;1689:		if( Q_stricmp( bot, test ) == 0 ) {
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
NEI4 $1376
line 1690
;1690:			break;
ADDRGP4 $1373
JUMPV
LABELV $1376
line 1692
;1691:		}
;1692:	}
LABELV $1372
line 1686
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1374
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1371
LABELV $1373
line 1693
;1693:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
NEI4 $1378
line 1694
;1694:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4780
CNSTI4 0
ASGNI4
line 1695
;1695:		return;
ADDRGP4 $1370
JUMPV
LABELV $1378
line 1698
;1696:	}
;1697:
;1698:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1385
JUMPV
LABELV $1382
line 1699
;1699:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1387
line 1700
;1700:			break;
ADDRGP4 $1384
JUMPV
LABELV $1387
line 1702
;1701:		}
;1702:	}
LABELV $1383
line 1698
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1385
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1382
LABELV $1384
line 1703
;1703:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
NEI4 $1390
line 1704
;1704:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4780
CNSTI4 0
ASGNI4
line 1705
;1705:		return;
ADDRGP4 $1370
JUMPV
LABELV $1390
line 1708
;1706:	}
;1707:
;1708:	botSelectInfo.selectedmodel = i;
ADDRGP4 botSelectInfo+4780
ADDRLP4 4
INDIRI4
ASGNI4
line 1709
;1709:}
LABELV $1370
endproc UI_BotSelectMenu_Default 28 8
proc UI_BotSelectMenu_LeftEvent 4 0
line 1717
;1710:
;1711:
;1712:/*
;1713:=================
;1714:UI_BotSelectMenu_LeftEvent
;1715:=================
;1716:*/
;1717:static void UI_BotSelectMenu_LeftEvent( void* ptr, int event ) {
line 1718
;1718:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1396
line 1719
;1719:		return;
ADDRGP4 $1395
JUMPV
LABELV $1396
line 1721
;1720:	}
;1721:	if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 0
LEI4 $1398
line 1722
;1722:		botSelectInfo.modelpage--;
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
line 1723
;1723:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1724
;1724:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1725
;1725:	}
LABELV $1398
line 1726
;1726:}
LABELV $1395
endproc UI_BotSelectMenu_LeftEvent 4 0
proc UI_BotSelectMenu_RightEvent 4 0
line 1734
;1727:
;1728:
;1729:/*
;1730:=================
;1731:UI_BotSelectMenu_RightEvent
;1732:=================
;1733:*/
;1734:static void UI_BotSelectMenu_RightEvent( void* ptr, int event ) {
line 1735
;1735:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1405
line 1736
;1736:		return;
ADDRGP4 $1404
JUMPV
LABELV $1405
line 1738
;1737:	}
;1738:	if( botSelectInfo.modelpage < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1407
line 1739
;1739:		botSelectInfo.modelpage++;
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
line 1740
;1740:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1741
;1741:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1742
;1742:	}
LABELV $1407
line 1743
;1743:}
LABELV $1404
endproc UI_BotSelectMenu_RightEvent 4 0
proc UI_BotSelectMenu_BotEvent 12 0
line 1751
;1744:
;1745:
;1746:/*
;1747:=================
;1748:UI_BotSelectMenu_BotEvent
;1749:=================
;1750:*/
;1751:static void UI_BotSelectMenu_BotEvent( void* ptr, int event ) {
line 1754
;1752:	int		i;
;1753:
;1754:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1415
line 1755
;1755:		return;
ADDRGP4 $1414
JUMPV
LABELV $1415
line 1758
;1756:	}
;1757:
;1758:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1417
line 1759
;1759: 		botSelectInfo.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
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
line 1760
;1760: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
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
line 1761
;1761:	}
LABELV $1418
line 1758
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1417
line 1764
;1762:
;1763:	// set selected
;1764:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1765
;1765:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
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
line 1766
;1766:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
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
line 1767
;1767:	botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE + i;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1768
;1768:}
LABELV $1414
endproc UI_BotSelectMenu_BotEvent 12 0
proc UI_BotSelectMenu_BackEvent 0 0
line 1776
;1769:
;1770:
;1771:/*
;1772:=================
;1773:UI_BotSelectMenu_BackEvent
;1774:=================
;1775:*/
;1776:static void UI_BotSelectMenu_BackEvent( void* ptr, int event ) {
line 1777
;1777:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1432
line 1778
;1778:		return;
ADDRGP4 $1431
JUMPV
LABELV $1432
line 1780
;1779:	}
;1780:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1781
;1781:}
LABELV $1431
endproc UI_BotSelectMenu_BackEvent 0 0
proc UI_BotSelectMenu_SelectEvent 4 12
line 1789
;1782:
;1783:
;1784:/*
;1785:=================
;1786:UI_BotSelectMenu_SelectEvent
;1787:=================
;1788:*/
;1789:static void UI_BotSelectMenu_SelectEvent( void* ptr, int event ) {
line 1790
;1790:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1435
line 1791
;1791:		return;
ADDRGP4 $1434
JUMPV
LABELV $1435
line 1793
;1792:	}
;1793:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1795
;1794:
;1795:	s_serveroptions.newBot = qtrue;
ADDRGP4 s_serveroptions+5920
CNSTI4 1
ASGNI4
line 1796
;1796:	Q_strncpyz( s_serveroptions.newBotName, botSelectInfo.botnames[botSelectInfo.selectedmodel % MAX_MODELSPERPAGE], 16 );
ADDRGP4 s_serveroptions+5928
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
line 1797
;1797:}
LABELV $1434
endproc UI_BotSelectMenu_SelectEvent 4 12
export UI_BotSelectMenu_Cache
proc UI_BotSelectMenu_Cache 0 4
line 1805
;1798:
;1799:
;1800:/*
;1801:=================
;1802:UI_BotSelectMenu_Cache
;1803:=================
;1804:*/
;1805:void UI_BotSelectMenu_Cache( void ) {
line 1806
;1806:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $405
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1807
;1807:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $422
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1808
;1808:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $1442
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1809
;1809:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $1443
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1810
;1810:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $1444
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1811
;1811:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $1445
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1812
;1812:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $342
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1813
;1813:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $370
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1814
;1814:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $388
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1815
;1815:}
LABELV $1441
endproc UI_BotSelectMenu_Cache 0 4
proc UI_BotSelectMenu_Init 36 12
line 1818
;1816:
;1817:
;1818:static void UI_BotSelectMenu_Init( char *bot ) {
line 1822
;1819:	int		i, j, k;
;1820:	int		x, y;
;1821:
;1822:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10160
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1823
;1823:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+276
CNSTI4 1
ASGNI4
line 1824
;1824:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+280
CNSTI4 1
ASGNI4
line 1826
;1825:
;1826:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1828
;1827:
;1828:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+288
CNSTI4 10
ASGNI4
line 1829
;1829:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+288+12
CNSTI4 320
ASGNI4
line 1830
;1830:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+288+16
CNSTI4 16
ASGNI4
line 1831
;1831:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+288+60
ADDRGP4 $1456
ASGNP4
line 1832
;1832:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+288+68
ADDRGP4 color_white
ASGNP4
line 1833
;1833:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+288+64
CNSTI4 1
ASGNI4
line 1835
;1834:
;1835:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 1836
;1836:	for( i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
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
ADDRGP4 $1464
JUMPV
LABELV $1461
line 1837
;1837:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 1838
;1838:		for( j = 0; j < PLAYERGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1465
line 1839
;1839:			botSelectInfo.pics[k].generic.type				= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360
ADDP4
CNSTI4 6
ASGNI4
line 1840
;1840:			botSelectInfo.pics[k].generic.flags				= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
CNSTU4 16388
ASGNU4
line 1841
;1841:			botSelectInfo.pics[k].generic.x					= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1842
;1842:			botSelectInfo.pics[k].generic.y					= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1843
;1843: 			botSelectInfo.pics[k].generic.name				= botSelectInfo.boticons[k];
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
line 1844
;1844:			botSelectInfo.pics[k].width						= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+76
ADDP4
CNSTI4 64
ASGNI4
line 1845
;1845:			botSelectInfo.pics[k].height					= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+80
ADDP4
CNSTI4 64
ASGNI4
line 1846
;1846:			botSelectInfo.pics[k].focuspic					= BOTSELECT_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+60
ADDP4
ADDRGP4 $1445
ASGNP4
line 1847
;1847:			botSelectInfo.pics[k].focuscolor				= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1849
;1848:
;1849:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768
ADDP4
CNSTI4 6
ASGNI4
line 1850
;1850:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
CNSTU4 33028
ASGNU4
line 1851
;1851:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelectMenu_BotEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+48
ADDP4
ADDRGP4 UI_BotSelectMenu_BotEvent
ASGNP4
line 1852
;1852:			botSelectInfo.picbuttons[k].generic.id			= k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1853
;1853:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
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
line 1854
;1854:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
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
line 1855
;1855:			botSelectInfo.picbuttons[k].generic.left		= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1856
;1856:			botSelectInfo.picbuttons[k].generic.top			= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1857
;1857:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
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
line 1858
;1858:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
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
line 1859
;1859:			botSelectInfo.picbuttons[k].width				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+76
ADDP4
CNSTI4 128
ASGNI4
line 1860
;1860:			botSelectInfo.picbuttons[k].height				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+80
ADDP4
CNSTI4 128
ASGNI4
line 1861
;1861:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+60
ADDP4
ADDRGP4 $1444
ASGNP4
line 1862
;1862:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1864
;1863:
;1864:			botSelectInfo.picnames[k].generic.type			= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176
ADDP4
CNSTI4 7
ASGNI4
line 1865
;1865:			botSelectInfo.picnames[k].generic.flags			= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+44
ADDP4
CNSTU4 2
ASGNU4
line 1866
;1866:			botSelectInfo.picnames[k].generic.x				= x + 32;
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
line 1867
;1867:			botSelectInfo.picnames[k].generic.y				= y + 64;
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
line 1868
;1868:			botSelectInfo.picnames[k].string				= botSelectInfo.botnames[k];
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
line 1869
;1869:			botSelectInfo.picnames[k].color					= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1870
;1870:			botSelectInfo.picnames[k].style					= UI_CENTER|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+64
ADDP4
CNSTI4 17
ASGNI4
line 1872
;1871:
;1872:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 1873
;1873:		}
LABELV $1466
line 1838
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
LTI4 $1465
line 1874
;1874:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 86
ADDI4
ASGNI4
line 1875
;1875:	}
LABELV $1462
line 1836
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1464
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1461
line 1877
;1876:
;1877:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4328
CNSTI4 6
ASGNI4
line 1878
;1878:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+4328+4
ADDRGP4 $342
ASGNP4
line 1879
;1879:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+4328+44
CNSTU4 16384
ASGNU4
line 1880
;1880:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+4328+12
CNSTI4 260
ASGNI4
line 1881
;1881:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+4328+16
CNSTI4 440
ASGNI4
line 1882
;1882:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+4328+76
CNSTI4 128
ASGNI4
line 1883
;1883:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+4328+80
CNSTI4 32
ASGNI4
line 1885
;1884:
;1885:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4416
CNSTI4 6
ASGNI4
line 1886
;1886:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4416+44
CNSTU4 260
ASGNU4
line 1887
;1887:	botSelectInfo.left.generic.callback		= UI_BotSelectMenu_LeftEvent;
ADDRGP4 botSelectInfo+4416+48
ADDRGP4 UI_BotSelectMenu_LeftEvent
ASGNP4
line 1888
;1888:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+4416+12
CNSTI4 260
ASGNI4
line 1889
;1889:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+4416+16
CNSTI4 440
ASGNI4
line 1890
;1890:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+4416+76
CNSTI4 64
ASGNI4
line 1891
;1891:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+4416+80
CNSTI4 32
ASGNI4
line 1892
;1892:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+4416+60
ADDRGP4 $370
ASGNP4
line 1894
;1893:
;1894:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4504
CNSTI4 6
ASGNI4
line 1895
;1895:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4504+44
CNSTU4 260
ASGNU4
line 1896
;1896:	botSelectInfo.right.generic.callback	= UI_BotSelectMenu_RightEvent;
ADDRGP4 botSelectInfo+4504+48
ADDRGP4 UI_BotSelectMenu_RightEvent
ASGNP4
line 1897
;1897:	botSelectInfo.right.generic.x			= 321;
ADDRGP4 botSelectInfo+4504+12
CNSTI4 321
ASGNI4
line 1898
;1898:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+4504+16
CNSTI4 440
ASGNI4
line 1899
;1899:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+4504+76
CNSTI4 64
ASGNI4
line 1900
;1900:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+4504+80
CNSTI4 32
ASGNI4
line 1901
;1901:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+4504+60
ADDRGP4 $388
ASGNP4
line 1903
;1902:
;1903:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4680
CNSTI4 6
ASGNI4
line 1904
;1904:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+4680+4
ADDRGP4 $405
ASGNP4
line 1905
;1905:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4680+44
CNSTU4 260
ASGNU4
line 1906
;1906:	botSelectInfo.back.generic.callback	= UI_BotSelectMenu_BackEvent;
ADDRGP4 botSelectInfo+4680+48
ADDRGP4 UI_BotSelectMenu_BackEvent
ASGNP4
line 1907
;1907:	botSelectInfo.back.generic.x		= 0;
ADDRGP4 botSelectInfo+4680+12
CNSTI4 0
ASGNI4
line 1908
;1908:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+4680+16
CNSTI4 416
ASGNI4
line 1909
;1909:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+4680+76
CNSTI4 128
ASGNI4
line 1910
;1910:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+4680+80
CNSTI4 64
ASGNI4
line 1911
;1911:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+4680+60
ADDRGP4 $422
ASGNP4
line 1913
;1912:
;1913:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4592
CNSTI4 6
ASGNI4
line 1914
;1914:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+4592+4
ADDRGP4 $1442
ASGNP4
line 1915
;1915:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4592+44
CNSTU4 272
ASGNU4
line 1916
;1916:	botSelectInfo.go.generic.callback	= UI_BotSelectMenu_SelectEvent;
ADDRGP4 botSelectInfo+4592+48
ADDRGP4 UI_BotSelectMenu_SelectEvent
ASGNP4
line 1917
;1917:	botSelectInfo.go.generic.x			= 640;
ADDRGP4 botSelectInfo+4592+12
CNSTI4 640
ASGNI4
line 1918
;1918:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+4592+16
CNSTI4 416
ASGNI4
line 1919
;1919:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+4592+76
CNSTI4 128
ASGNI4
line 1920
;1920:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+4592+80
CNSTI4 64
ASGNI4
line 1921
;1921:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+4592+60
ADDRGP4 $1443
ASGNP4
line 1923
;1922:
;1923:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1924
;1924:	for( i = 0; i < MAX_MODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1606
line 1925
;1925:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.pics[i] );
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
line 1926
;1926:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
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
line 1927
;1927:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picnames[i] );
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
line 1928
;1928:	}
LABELV $1607
line 1924
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $1606
line 1929
;1929:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4328
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1930
;1930:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1931
;1931:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1932
;1932:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1933
;1933:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1935
;1934:
;1935:	UI_BotSelectMenu_BuildList();
ADDRGP4 UI_BotSelectMenu_BuildList
CALLV
pop
line 1936
;1936:	UI_BotSelectMenu_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Default
CALLV
pop
line 1937
;1937:	botSelectInfo.modelpage = botSelectInfo.selectedmodel / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4772
ADDRGP4 botSelectInfo+4780
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1938
;1938:	UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1939
;1939:}
LABELV $1446
endproc UI_BotSelectMenu_Init 36 12
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 4
line 1947
;1940:
;1941:
;1942:/*
;1943:=================
;1944:UI_BotSelectMenu
;1945:=================
;1946:*/
;1947:void UI_BotSelectMenu( char *bot ) {
line 1948
;1948:	UI_BotSelectMenu_Init( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Init
CALLV
pop
line 1949
;1949:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1950
;1950:}
LABELV $1620
endproc UI_BotSelectMenu 0 4
bss
align 4
LABELV botSelectInfo
skip 10160
align 4
LABELV s_serveroptions
skip 6040
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
LABELV $1456
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
LABELV $1445
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
LABELV $1444
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
LABELV $1443
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
LABELV $1442
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
LABELV $1316
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1305
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
LABELV $1302
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
LABELV $1301
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1236
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
LABELV $1219
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
LABELV $1092
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
LABELV $1076
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
LABELV $1060
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
LABELV $1051
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
LABELV $1034
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
LABELV $1024
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
LABELV $997
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
LABELV $979
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
LABELV $961
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
LABELV $879
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
LABELV $873
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
LABELV $868
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
LABELV $848
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $822
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
LABELV $798
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $778
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $766
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $760
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $757
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $740
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
LABELV $680
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $648
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $617
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
LABELV $612
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
LABELV $608
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
LABELV $590
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $587
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
LABELV $584
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
LABELV $580
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
LABELV $579
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $578
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
LABELV $577
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
LABELV $576
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
LABELV $575
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
LABELV $574
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
LABELV $573
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
LABELV $571
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
LABELV $570
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
LABELV $569
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
LABELV $567
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
LABELV $566
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
LABELV $565
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
LABELV $563
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
LABELV $562
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
LABELV $560
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
LABELV $559
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
LABELV $503
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $502
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
LABELV $501
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
LABELV $500
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
LABELV $499
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
LABELV $498
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $497
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $496
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $495
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $494
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $493
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
LABELV $492
byte 1 76
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $491
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $473
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
LABELV $443
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
LABELV $426
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
LABELV $422
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
LABELV $405
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
LABELV $388
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
LABELV $370
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
LABELV $342
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
LABELV $338
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
LABELV $310
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
LABELV $307
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
LABELV $275
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
LABELV $247
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
LABELV $239
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
LABELV $206
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
LABELV $178
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $173
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $138
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
LABELV $105
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
LABELV $94
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $91
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $88
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $82
byte 1 102
byte 1 102
byte 1 97
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
