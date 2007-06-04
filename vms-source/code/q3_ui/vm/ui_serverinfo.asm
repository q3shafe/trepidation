data
align 4
LABELV serverinfo_artlist
address $69
address $70
address $71
address $72
byte 4 0
export Favorites_Add
code
proc Favorites_Add 276 12
file "../ui_serverinfo.c"
line 45
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define SERVERINFO_FRAMEL	"menu/art/frame2_l"
;6:#define SERVERINFO_FRAMER	"menu/art/frame1_r"
;7:#define SERVERINFO_BACK0	"menu/art/back_0"
;8:#define SERVERINFO_BACK1	"menu/art/back_1"
;9:
;10:static char* serverinfo_artlist[] =
;11:{
;12:	SERVERINFO_FRAMEL,	
;13:	SERVERINFO_FRAMER,
;14:	SERVERINFO_BACK0,
;15:	SERVERINFO_BACK1,
;16:	NULL
;17:};
;18:
;19:#define ID_ADD	 100
;20:#define ID_BACK	 101
;21:
;22:typedef struct
;23:{
;24:	menuframework_s	menu;
;25:	menutext_s		banner;
;26:	menubitmap_s	framel;
;27:	menubitmap_s	framer;
;28:	menubitmap_s	back;
;29:	menutext_s		add;
;30:	char			info[MAX_INFO_STRING];
;31:	int				numlines;
;32:} serverinfo_t;
;33:
;34:static serverinfo_t	s_serverinfo;
;35:
;36:
;37:/*
;38:=================
;39:Favorites_Add
;40:
;41:Add current server to favorites
;42:=================
;43:*/
;44:void Favorites_Add( void )
;45:{
line 51
;46:	char	adrstr[128];
;47:	char	serverbuff[128];
;48:	int		i;
;49:	int		best;
;50:
;51:	trap_Cvar_VariableStringBuffer( "cl_currentServerAddress", serverbuff, sizeof(serverbuff) );
ADDRGP4 $75
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 52
;52:	if (!serverbuff[0])
ADDRLP4 136
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $76
line 53
;53:		return;
ADDRGP4 $74
JUMPV
LABELV $76
line 55
;54:
;55:	best = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 56
;56:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $78
line 57
;57:	{
line 58
;58:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, sizeof(adrstr) );
ADDRGP4 $82
ARGP4
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 59
;59:		if (!Q_stricmp(serverbuff,adrstr))
ADDRLP4 136
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $83
line 60
;60:		{
line 62
;61:			// already in list
;62:			return;
ADDRGP4 $74
JUMPV
LABELV $83
line 66
;63:		}
;64:		
;65:		// use first empty or non-numeric available slot
;66:		if ((adrstr[0]  < '0' || adrstr[0] > '9' ) && !best)
ADDRLP4 272
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 48
LTI4 $87
ADDRLP4 272
INDIRI4
CNSTI4 57
LEI4 $85
LABELV $87
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $85
line 67
;67:			best = i+1;
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
line 68
;68:	}
LABELV $79
line 56
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 16
LTI4 $78
line 70
;69:
;70:	if (best)
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $88
line 71
;71:		trap_Cvar_Set( va("server%d",best), serverbuff);
ADDRGP4 $82
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $88
line 72
;72:}
LABELV $74
endproc Favorites_Add 276 12
proc ServerInfo_Event 8 0
line 81
;73:
;74:
;75:/*
;76:=================
;77:ServerInfo_Event
;78:=================
;79:*/
;80:static void ServerInfo_Event( void* ptr, int event )
;81:{
line 82
;82:	switch (((menucommon_s*)ptr)->id)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $94
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $97
ADDRGP4 $91
JUMPV
line 83
;83:	{
LABELV $94
line 85
;84:		case ID_ADD:
;85:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $95
line 86
;86:				break;
ADDRGP4 $92
JUMPV
LABELV $95
line 88
;87:		
;88:			Favorites_Add();
ADDRGP4 Favorites_Add
CALLV
pop
line 89
;89:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 90
;90:			break;
ADDRGP4 $92
JUMPV
LABELV $97
line 93
;91:
;92:		case ID_BACK:
;93:			if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $98
line 94
;94:				break;
ADDRGP4 $92
JUMPV
LABELV $98
line 96
;95:
;96:			UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 97
;97:			break;
LABELV $91
LABELV $92
line 99
;98:	}
;99:}
LABELV $90
endproc ServerInfo_Event 8 0
proc ServerInfo_MenuDraw 2056 20
line 107
;100:
;101:/*
;102:=================
;103:ServerInfo_MenuDraw
;104:=================
;105:*/
;106:static void ServerInfo_MenuDraw( void )
;107:{
line 113
;108:	const char		*s;
;109:	char			key[MAX_INFO_KEY];
;110:	char			value[MAX_INFO_VALUE];
;111:	int				y;
;112:
;113:	y = SCREEN_HEIGHT/2 - s_serverinfo.numlines*(SMALLCHAR_HEIGHT)/2 - 20;
ADDRLP4 1024
CNSTI4 240
ADDRGP4 s_serverinfo+1720
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
CNSTI4 20
SUBI4
ASGNI4
line 114
;114:	s = s_serverinfo.info;
ADDRLP4 1028
ADDRGP4 s_serverinfo+696
ASGNP4
ADDRGP4 $104
JUMPV
LABELV $103
line 115
;115:	while ( s ) {
line 116
;116:		Info_NextPair( &s, key, value );
ADDRLP4 1028
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 117
;117:		if ( !key[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $106
line 118
;118:			break;
ADDRGP4 $105
JUMPV
LABELV $106
line 121
;119:		}
;120:
;121:		Q_strcat( key, MAX_INFO_KEY, ":" ); 
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $108
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 123
;122:
;123:		UI_DrawString(SCREEN_WIDTH*0.50 - 8,y,key,UI_RIGHT|UI_SMALLFONT,color_red);
CNSTI4 312
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 124
;124:		UI_DrawString(SCREEN_WIDTH*0.50 + 8,y,value,UI_LEFT|UI_SMALLFONT,text_color_normal);
CNSTI4 328
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 126
;125:
;126:		y += SMALLCHAR_HEIGHT;
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 127
;127:	}
LABELV $104
line 115
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
LABELV $105
line 129
;128:
;129:	Menu_Draw( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 130
;130:}
LABELV $100
endproc ServerInfo_MenuDraw 2056 20
proc ServerInfo_MenuKey 4 8
line 138
;131:
;132:/*
;133:=================
;134:ServerInfo_MenuKey
;135:=================
;136:*/
;137:static sfxHandle_t ServerInfo_MenuKey( int key )
;138:{
line 139
;139:	return ( Menu_DefaultKey( &s_serverinfo.menu, key ) );
ADDRGP4 s_serverinfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $109
endproc ServerInfo_MenuKey 4 8
export ServerInfo_Cache
proc ServerInfo_Cache 4 4
line 148
;140:}
;141:
;142:/*
;143:=================
;144:ServerInfo_Cache
;145:=================
;146:*/
;147:void ServerInfo_Cache( void )
;148:{
line 152
;149:	int	i;
;150:
;151:	// touch all our pics
;152:	for (i=0; ;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $111
line 153
;153:	{
line 154
;154:		if (!serverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 155
;155:			break;
ADDRGP4 $113
JUMPV
LABELV $115
line 156
;156:		trap_R_RegisterShaderNoMip(serverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 157
;157:	}
LABELV $112
line 152
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $113
line 158
;158:}
LABELV $110
endproc ServerInfo_Cache 4 4
export UI_ServerInfoMenu
proc UI_ServerInfoMenu 2060 12
line 166
;159:
;160:/*
;161:=================
;162:UI_ServerInfoMenu
;163:=================
;164:*/
;165:void UI_ServerInfoMenu( void )
;166:{
line 172
;167:	const char		*s;
;168:	char			key[MAX_INFO_KEY];
;169:	char			value[MAX_INFO_VALUE];
;170:
;171:	// zero set all our globals
;172:	memset( &s_serverinfo, 0 ,sizeof(serverinfo_t) );
ADDRGP4 s_serverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1724
ARGI4
ADDRGP4 memset
CALLP4
pop
line 174
;173:
;174:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 176
;175:
;176:	s_serverinfo.menu.draw       = ServerInfo_MenuDraw;
ADDRGP4 s_serverinfo+268
ADDRGP4 ServerInfo_MenuDraw
ASGNP4
line 177
;177:	s_serverinfo.menu.key        = ServerInfo_MenuKey;
ADDRGP4 s_serverinfo+272
ADDRGP4 ServerInfo_MenuKey
ASGNP4
line 178
;178:	s_serverinfo.menu.wrapAround = qtrue;
ADDRGP4 s_serverinfo+276
CNSTI4 1
ASGNI4
line 179
;179:	s_serverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_serverinfo+280
CNSTI4 1
ASGNI4
line 181
;180:
;181:	s_serverinfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_serverinfo+288
CNSTI4 10
ASGNI4
line 182
;182:	s_serverinfo.banner.generic.x	  = 320;
ADDRGP4 s_serverinfo+288+12
CNSTI4 320
ASGNI4
line 183
;183:	s_serverinfo.banner.generic.y	  = 16;
ADDRGP4 s_serverinfo+288+16
CNSTI4 16
ASGNI4
line 184
;184:	s_serverinfo.banner.string		  = "SERVER INFO";
ADDRGP4 s_serverinfo+288+60
ADDRGP4 $129
ASGNP4
line 185
;185:	s_serverinfo.banner.color	      = color_white;
ADDRGP4 s_serverinfo+288+68
ADDRGP4 color_white
ASGNP4
line 186
;186:	s_serverinfo.banner.style	      = UI_CENTER;
ADDRGP4 s_serverinfo+288+64
CNSTI4 1
ASGNI4
line 188
;187:
;188:	s_serverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+360
CNSTI4 6
ASGNI4
line 189
;189:	s_serverinfo.framel.generic.name  = SERVERINFO_FRAMEL;
ADDRGP4 s_serverinfo+360+4
ADDRGP4 $69
ASGNP4
line 190
;190:	s_serverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+360+44
CNSTU4 16384
ASGNU4
line 191
;191:	s_serverinfo.framel.generic.x	  = 0;  
ADDRGP4 s_serverinfo+360+12
CNSTI4 0
ASGNI4
line 192
;192:	s_serverinfo.framel.generic.y	  = 78;
ADDRGP4 s_serverinfo+360+16
CNSTI4 78
ASGNI4
line 193
;193:	s_serverinfo.framel.width  	      = 256;
ADDRGP4 s_serverinfo+360+76
CNSTI4 256
ASGNI4
line 194
;194:	s_serverinfo.framel.height  	  = 329;
ADDRGP4 s_serverinfo+360+80
CNSTI4 329
ASGNI4
line 196
;195:
;196:	s_serverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+448
CNSTI4 6
ASGNI4
line 197
;197:	s_serverinfo.framer.generic.name  = SERVERINFO_FRAMER;
ADDRGP4 s_serverinfo+448+4
ADDRGP4 $70
ASGNP4
line 198
;198:	s_serverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+448+44
CNSTU4 16384
ASGNU4
line 199
;199:	s_serverinfo.framer.generic.x	  = 376;
ADDRGP4 s_serverinfo+448+12
CNSTI4 376
ASGNI4
line 200
;200:	s_serverinfo.framer.generic.y	  = 76;
ADDRGP4 s_serverinfo+448+16
CNSTI4 76
ASGNI4
line 201
;201:	s_serverinfo.framer.width  	      = 256;
ADDRGP4 s_serverinfo+448+76
CNSTI4 256
ASGNI4
line 202
;202:	s_serverinfo.framer.height  	  = 334;
ADDRGP4 s_serverinfo+448+80
CNSTI4 334
ASGNI4
line 204
;203:
;204:	s_serverinfo.add.generic.type	  = MTYPE_PTEXT;
ADDRGP4 s_serverinfo+624
CNSTI4 9
ASGNI4
line 205
;205:	s_serverinfo.add.generic.flags    = QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+624+44
CNSTU4 264
ASGNU4
line 206
;206:	s_serverinfo.add.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+624+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 207
;207:	s_serverinfo.add.generic.id	      = ID_ADD;
ADDRGP4 s_serverinfo+624+8
CNSTI4 100
ASGNI4
line 208
;208:	s_serverinfo.add.generic.x		  = 320;
ADDRGP4 s_serverinfo+624+12
CNSTI4 320
ASGNI4
line 209
;209:	s_serverinfo.add.generic.y		  = 371;
ADDRGP4 s_serverinfo+624+16
CNSTI4 371
ASGNI4
line 210
;210:	s_serverinfo.add.string  		  = "ADD TO FAVORITES";
ADDRGP4 s_serverinfo+624+60
ADDRGP4 $173
ASGNP4
line 211
;211:	s_serverinfo.add.style  		  = UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_serverinfo+624+64
CNSTI4 17
ASGNI4
line 212
;212:	s_serverinfo.add.color			  =	color_red;
ADDRGP4 s_serverinfo+624+68
ADDRGP4 color_red
ASGNP4
line 213
;213:	if( trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $180
ARGP4
ADDRLP4 2052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 2052
INDIRF4
CNSTF4 0
EQF4 $178
line 214
;214:		s_serverinfo.add.generic.flags |= QMF_GRAYED;
ADDRLP4 2056
ADDRGP4 s_serverinfo+624+44
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 215
;215:	}
LABELV $178
line 217
;216:
;217:	s_serverinfo.back.generic.type	   = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+536
CNSTI4 6
ASGNI4
line 218
;218:	s_serverinfo.back.generic.name     = SERVERINFO_BACK0;
ADDRGP4 s_serverinfo+536+4
ADDRGP4 $71
ASGNP4
line 219
;219:	s_serverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+536+44
CNSTU4 260
ASGNU4
line 220
;220:	s_serverinfo.back.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+536+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 221
;221:	s_serverinfo.back.generic.id	   = ID_BACK;
ADDRGP4 s_serverinfo+536+8
CNSTI4 101
ASGNI4
line 222
;222:	s_serverinfo.back.generic.x		   = 0;
ADDRGP4 s_serverinfo+536+12
CNSTI4 0
ASGNI4
line 223
;223:	s_serverinfo.back.generic.y		   = 480-64;
ADDRGP4 s_serverinfo+536+16
CNSTI4 416
ASGNI4
line 224
;224:	s_serverinfo.back.width  		   = 128;
ADDRGP4 s_serverinfo+536+76
CNSTI4 128
ASGNI4
line 225
;225:	s_serverinfo.back.height  		   = 64;
ADDRGP4 s_serverinfo+536+80
CNSTI4 64
ASGNI4
line 226
;226:	s_serverinfo.back.focuspic         = SERVERINFO_BACK1;
ADDRGP4 s_serverinfo+536+60
ADDRGP4 $72
ASGNP4
line 228
;227:
;228:	trap_GetConfigString( CS_SERVERINFO, s_serverinfo.info, MAX_INFO_STRING );
CNSTI4 0
ARGI4
ADDRGP4 s_serverinfo+696
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 230
;229:
;230:	s_serverinfo.numlines = 0;
ADDRGP4 s_serverinfo+1720
CNSTI4 0
ASGNI4
line 231
;231:	s = s_serverinfo.info;
ADDRLP4 0
ADDRGP4 s_serverinfo+696
ASGNP4
ADDRGP4 $206
JUMPV
LABELV $205
line 232
;232:	while ( s ) {
line 233
;233:		Info_NextPair( &s, key, value );
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Info_NextPair
CALLV
pop
line 234
;234:		if ( !key[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $208
line 235
;235:			break;
ADDRGP4 $207
JUMPV
LABELV $208
line 237
;236:		}
;237:		s_serverinfo.numlines++;
ADDRLP4 2056
ADDRGP4 s_serverinfo+1720
ASGNP4
ADDRLP4 2056
INDIRP4
ADDRLP4 2056
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 238
;238:	}
LABELV $206
line 232
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $205
LABELV $207
line 240
;239:
;240:	if (s_serverinfo.numlines > 16)
ADDRGP4 s_serverinfo+1720
INDIRI4
CNSTI4 16
LEI4 $211
line 241
;241:		s_serverinfo.numlines = 16;
ADDRGP4 s_serverinfo+1720
CNSTI4 16
ASGNI4
LABELV $211
line 243
;242:
;243:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.banner );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 244
;244:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framel );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 245
;245:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.framer );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 246
;246:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.add );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 247
;247:	Menu_AddItem( &s_serverinfo.menu, (void*) &s_serverinfo.back );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 249
;248:
;249:	UI_PushMenu( &s_serverinfo.menu );
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 250
;250:}
LABELV $117
endproc UI_ServerInfoMenu 2060 12
bss
align 4
LABELV s_serverinfo
skip 1724
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
LABELV $180
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $173
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 70
byte 1 65
byte 1 86
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $129
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $108
byte 1 58
byte 1 0
align 1
LABELV $82
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
LABELV $75
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $72
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
LABELV $71
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
LABELV $70
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
LABELV $69
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
