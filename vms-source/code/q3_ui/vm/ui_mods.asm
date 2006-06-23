code
proc UI_Mods_MenuEvent 8 8
file "../ui_mods.c"
line 51
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define ART_BACK0			"menu/art/back_0"
;6:#define ART_BACK1			"menu/art/back_1"	
;7:#define ART_FIGHT0			"menu/art/load_0"
;8:#define ART_FIGHT1			"menu/art/load_1"
;9:#define ART_FRAMEL			"menu/art/frame2_l"
;10:#define ART_FRAMER			"menu/art/frame1_r"
;11:
;12:#define MAX_MODS			64
;13:#define NAMEBUFSIZE			( MAX_MODS * 48 )
;14:#define GAMEBUFSIZE			( MAX_MODS * 16 )
;15:
;16:#define ID_BACK				10
;17:#define ID_GO				11
;18:#define ID_LIST				12
;19:
;20:
;21:typedef struct {
;22:	menuframework_s	menu;
;23:
;24:	menutext_s		banner;
;25:	menubitmap_s	framel;
;26:	menubitmap_s	framer;
;27:
;28:	menulist_s		list;
;29:
;30:	menubitmap_s	back;
;31:	menubitmap_s	go;
;32:
;33:	char			description[NAMEBUFSIZE];
;34:	char			fs_game[GAMEBUFSIZE];
;35:
;36:	char			*descriptionPtr;
;37:	char			*fs_gamePtr;
;38:
;39:	char			*descriptionList[MAX_MODS];
;40:	char			*fs_gameList[MAX_MODS];
;41:} mods_t;
;42:
;43:static mods_t	s_mods;
;44:
;45:
;46:/*
;47:===============
;48:UI_Mods_MenuEvent
;49:===============
;50:*/
;51:static void UI_Mods_MenuEvent( void *ptr, int event ) {
line 52
;52:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $71
line 53
;53:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 56
;54:	}
;55:
;56:	switch ( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $76
ADDRGP4 $73
JUMPV
LABELV $76
line 58
;57:	case ID_GO:
;58:		trap_Cvar_Set( "fs_game", s_mods.fs_gameList[s_mods.list.curvalue] );
ADDRGP4 $77
ARGP4
ADDRGP4 s_mods+536+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+5168
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 59
;59:		trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $81
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 60
;60:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 61
;61:		break;
ADDRGP4 $74
JUMPV
LABELV $82
line 64
;62:
;63:	case ID_BACK:
;64:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 65
;65:		break;
LABELV $73
LABELV $74
line 67
;66:	}
;67:}
LABELV $70
endproc UI_Mods_MenuEvent 8 8
proc UI_Mods_ParseInfos 20 12
line 75
;68:
;69:
;70:/*
;71:===============
;72:UI_Mods_ParseInfos
;73:===============
;74:*/
;75:static void UI_Mods_ParseInfos( char *modDir, char *modDesc ) {
line 76
;76:	s_mods.fs_gameList[s_mods.list.numitems] = s_mods.fs_gamePtr;
ADDRGP4 s_mods+536+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+5168
ADDP4
ADDRGP4 s_mods+4908
INDIRP4
ASGNP4
line 77
;77:	Q_strncpyz( s_mods.fs_gamePtr, modDir, 16 );
ADDRGP4 s_mods+4908
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 79
;78:
;79:	s_mods.descriptionList[s_mods.list.numitems] = s_mods.descriptionPtr;
ADDRGP4 s_mods+536+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+4912
ADDP4
ADDRGP4 s_mods+4904
INDIRP4
ASGNP4
line 80
;80:	Q_strncpyz( s_mods.descriptionPtr, modDesc, 48 );
ADDRGP4 s_mods+4904
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 48
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 82
;81:
;82:	s_mods.list.itemnames[s_mods.list.numitems] = s_mods.descriptionPtr;
ADDRGP4 s_mods+536+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_mods+536+76
INDIRP4
ADDP4
ADDRGP4 s_mods+4904
INDIRP4
ASGNP4
line 83
;83:	s_mods.descriptionPtr += strlen( s_mods.descriptionPtr ) + 1;
ADDRGP4 s_mods+4904
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRGP4 s_mods+4904
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 84
;84:	s_mods.fs_gamePtr += strlen( s_mods.fs_gamePtr ) + 1;
ADDRGP4 s_mods+4908
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRGP4 s_mods+4908
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRP4
INDIRP4
ADDP4
ASGNP4
line 85
;85:	s_mods.list.numitems++;
ADDRLP4 16
ADDRGP4 s_mods+536+68
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 86
;86:}
LABELV $83
endproc UI_Mods_ParseInfos 20 12
proc UI_Mods_LoadMods 2084 16
line 130
;87:
;88:
;89:#if 0 // bk001204 - unused
;90:/*
;91:===============
;92:UI_Mods_LoadModsFromFile
;93:===============
;94:*/
;95:static void UI_Mods_LoadModsFromFile( char *filename ) {
;96:	int				len;
;97:	fileHandle_t	f;
;98:	char			buf[1024];
;99:
;100:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
;101:	if ( !f ) {
;102:		trap_Print( va( S_COLOR_RED "file not found: %s\n", filename ) );
;103:		return;
;104:	}
;105:	if ( len >= sizeof(buf) ) {
;106:		trap_Print( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, sizeof(buf) ) );
;107:		trap_FS_FCloseFile( f );
;108:		return;
;109:	}
;110:
;111:	trap_FS_Read( buf, len, f );
;112:	buf[len] = 0;
;113:	trap_FS_FCloseFile( f );
;114:
;115:	len = strlen( filename );
;116:	if( !Q_stricmp(filename +  len - 4,".mod") ) {
;117:		filename[len-4] = '\0';
;118:	}
;119:
;120:	UI_Mods_ParseInfos( filename, buf );
;121:}
;122:#endif
;123:
;124:
;125:/*
;126:===============
;127:UI_Mods_LoadMods
;128:===============
;129:*/
;130:static void UI_Mods_LoadMods( void ) {
line 138
;131:	int		numdirs;
;132:	char	dirlist[2048];
;133:	char	*dirptr;
;134:  char  *descptr;
;135:	int		i;
;136:	int		dirlen;
;137:
;138:	s_mods.list.itemnames = (const char **)s_mods.descriptionList;
ADDRGP4 s_mods+536+76
ADDRGP4 s_mods+4912
ASGNP4
line 139
;139:	s_mods.descriptionPtr = s_mods.description;
ADDRGP4 s_mods+4904
ADDRGP4 s_mods+808
ASGNP4
line 140
;140:	s_mods.fs_gamePtr = s_mods.fs_game;
ADDRGP4 s_mods+4908
ADDRGP4 s_mods+3880
ASGNP4
line 143
;141:
;142:	// always start off with baseq3
;143:	s_mods.list.numitems = 1;
ADDRGP4 s_mods+536+68
CNSTI4 1
ASGNI4
line 144
;144:	s_mods.list.itemnames[0] = s_mods.descriptionList[0] = "Quake III Arena";
ADDRLP4 2068
ADDRGP4 $118
ASGNP4
ADDRGP4 s_mods+4912
ADDRLP4 2068
INDIRP4
ASGNP4
ADDRGP4 s_mods+536+76
INDIRP4
ADDRLP4 2068
INDIRP4
ASGNP4
line 145
;145:	s_mods.fs_gameList[0] = "";
ADDRGP4 s_mods+5168
ADDRGP4 $120
ASGNP4
line 147
;146:
;147:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $121
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2072
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2072
INDIRI4
ASGNI4
line 148
;148:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 149
;149:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $122
line 150
;150:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2076
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 151
;151:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 152
;152:  	UI_Mods_ParseInfos( dirptr, descptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_Mods_ParseInfos
CALLV
pop
line 153
;153:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2080
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 154
;154:	}
LABELV $123
line 149
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $125
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $122
line 156
;155:
;156:	trap_Print( va( "%i mods parsed\n", s_mods.list.numitems ) );
ADDRGP4 $126
ARGP4
ADDRGP4 s_mods+536+68
INDIRI4
ARGI4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 157
;157:	if (s_mods.list.numitems > MAX_MODS) {
ADDRGP4 s_mods+536+68
INDIRI4
CNSTI4 64
LEI4 $129
line 158
;158:		s_mods.list.numitems = MAX_MODS;
ADDRGP4 s_mods+536+68
CNSTI4 64
ASGNI4
line 159
;159:	}
LABELV $129
line 160
;160:}
LABELV $105
endproc UI_Mods_LoadMods 2084 16
proc UI_Mods_MenuInit 0 12
line 168
;161:
;162:
;163:/*
;164:===============
;165:UI_Mods_MenuInit
;166:===============
;167:*/
;168:static void UI_Mods_MenuInit( void ) {
line 169
;169:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 171
;170:
;171:	memset( &s_mods, 0 ,sizeof(mods_t) );
ADDRGP4 s_mods
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5424
ARGI4
ADDRGP4 memset
CALLP4
pop
line 172
;172:	s_mods.menu.wrapAround = qtrue;
ADDRGP4 s_mods+276
CNSTI4 1
ASGNI4
line 173
;173:	s_mods.menu.fullscreen = qtrue;
ADDRGP4 s_mods+280
CNSTI4 1
ASGNI4
line 175
;174:
;175:	s_mods.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 s_mods+288
CNSTI4 10
ASGNI4
line 176
;176:	s_mods.banner.generic.x			= 320;
ADDRGP4 s_mods+288+12
CNSTI4 320
ASGNI4
line 177
;177:	s_mods.banner.generic.y			= 16;
ADDRGP4 s_mods+288+16
CNSTI4 16
ASGNI4
line 178
;178:	s_mods.banner.string			= "MODS";
ADDRGP4 s_mods+288+60
ADDRGP4 $145
ASGNP4
line 179
;179:	s_mods.banner.color				= color_white;
ADDRGP4 s_mods+288+68
ADDRGP4 color_white
ASGNP4
line 180
;180:	s_mods.banner.style				= UI_CENTER;
ADDRGP4 s_mods+288+64
CNSTI4 1
ASGNI4
line 182
;181:
;182:	s_mods.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+360
CNSTI4 6
ASGNI4
line 183
;183:	s_mods.framel.generic.name		= ART_FRAMEL;
ADDRGP4 s_mods+360+4
ADDRGP4 $153
ASGNP4
line 184
;184:	s_mods.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mods+360+44
CNSTU4 16384
ASGNU4
line 185
;185:	s_mods.framel.generic.x			= 0;  
ADDRGP4 s_mods+360+12
CNSTI4 0
ASGNI4
line 186
;186:	s_mods.framel.generic.y			= 78;
ADDRGP4 s_mods+360+16
CNSTI4 78
ASGNI4
line 187
;187:	s_mods.framel.width				= 256;
ADDRGP4 s_mods+360+76
CNSTI4 256
ASGNI4
line 188
;188:	s_mods.framel.height			= 329;
ADDRGP4 s_mods+360+80
CNSTI4 329
ASGNI4
line 190
;189:
;190:	s_mods.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+448
CNSTI4 6
ASGNI4
line 191
;191:	s_mods.framer.generic.name		= ART_FRAMER;
ADDRGP4 s_mods+448+4
ADDRGP4 $167
ASGNP4
line 192
;192:	s_mods.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_mods+448+44
CNSTU4 16384
ASGNU4
line 193
;193:	s_mods.framer.generic.x			= 376;
ADDRGP4 s_mods+448+12
CNSTI4 376
ASGNI4
line 194
;194:	s_mods.framer.generic.y			= 76;
ADDRGP4 s_mods+448+16
CNSTI4 76
ASGNI4
line 195
;195:	s_mods.framer.width				= 256;
ADDRGP4 s_mods+448+76
CNSTI4 256
ASGNI4
line 196
;196:	s_mods.framer.height			= 334;
ADDRGP4 s_mods+448+80
CNSTI4 334
ASGNI4
line 198
;197:
;198:	s_mods.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_mods+632
CNSTI4 6
ASGNI4
line 199
;199:	s_mods.back.generic.name		= ART_BACK0;
ADDRGP4 s_mods+632+4
ADDRGP4 $181
ASGNP4
line 200
;200:	s_mods.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mods+632+44
CNSTU4 260
ASGNU4
line 201
;201:	s_mods.back.generic.id			= ID_BACK;
ADDRGP4 s_mods+632+8
CNSTI4 10
ASGNI4
line 202
;202:	s_mods.back.generic.callback	= UI_Mods_MenuEvent;
ADDRGP4 s_mods+632+48
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 203
;203:	s_mods.back.generic.x			= 0;
ADDRGP4 s_mods+632+12
CNSTI4 0
ASGNI4
line 204
;204:	s_mods.back.generic.y			= 480-64;
ADDRGP4 s_mods+632+16
CNSTI4 416
ASGNI4
line 205
;205:	s_mods.back.width				= 128;
ADDRGP4 s_mods+632+76
CNSTI4 128
ASGNI4
line 206
;206:	s_mods.back.height				= 64;
ADDRGP4 s_mods+632+80
CNSTI4 64
ASGNI4
line 207
;207:	s_mods.back.focuspic			= ART_BACK1;
ADDRGP4 s_mods+632+60
ADDRGP4 $198
ASGNP4
line 209
;208:
;209:	s_mods.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_mods+720
CNSTI4 6
ASGNI4
line 210
;210:	s_mods.go.generic.name			= ART_FIGHT0;
ADDRGP4 s_mods+720+4
ADDRGP4 $202
ASGNP4
line 211
;211:	s_mods.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_mods+720+44
CNSTU4 272
ASGNU4
line 212
;212:	s_mods.go.generic.id			= ID_GO;
ADDRGP4 s_mods+720+8
CNSTI4 11
ASGNI4
line 213
;213:	s_mods.go.generic.callback		= UI_Mods_MenuEvent;
ADDRGP4 s_mods+720+48
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 214
;214:	s_mods.go.generic.x				= 640;
ADDRGP4 s_mods+720+12
CNSTI4 640
ASGNI4
line 215
;215:	s_mods.go.generic.y				= 480-64;
ADDRGP4 s_mods+720+16
CNSTI4 416
ASGNI4
line 216
;216:	s_mods.go.width					= 128;
ADDRGP4 s_mods+720+76
CNSTI4 128
ASGNI4
line 217
;217:	s_mods.go.height				= 64;
ADDRGP4 s_mods+720+80
CNSTI4 64
ASGNI4
line 218
;218:	s_mods.go.focuspic				= ART_FIGHT1;
ADDRGP4 s_mods+720+60
ADDRGP4 $219
ASGNP4
line 221
;219:
;220:	// scan for mods
;221:	s_mods.list.generic.type		= MTYPE_SCROLLLIST;
ADDRGP4 s_mods+536
CNSTI4 8
ASGNI4
line 222
;222:	s_mods.list.generic.flags		= QMF_PULSEIFFOCUS|QMF_CENTER_JUSTIFY;
ADDRGP4 s_mods+536+44
CNSTU4 264
ASGNU4
line 223
;223:	s_mods.list.generic.callback	= UI_Mods_MenuEvent;
ADDRGP4 s_mods+536+48
ADDRGP4 UI_Mods_MenuEvent
ASGNP4
line 224
;224:	s_mods.list.generic.id			= ID_LIST;
ADDRGP4 s_mods+536+8
CNSTI4 12
ASGNI4
line 225
;225:	s_mods.list.generic.x			= 320;
ADDRGP4 s_mods+536+12
CNSTI4 320
ASGNI4
line 226
;226:	s_mods.list.generic.y			= 130;
ADDRGP4 s_mods+536+16
CNSTI4 130
ASGNI4
line 227
;227:	s_mods.list.width				= 48;
ADDRGP4 s_mods+536+80
CNSTI4 48
ASGNI4
line 228
;228:	s_mods.list.height				= 14;
ADDRGP4 s_mods+536+84
CNSTI4 14
ASGNI4
line 230
;229:
;230:	UI_Mods_LoadMods();
ADDRGP4 UI_Mods_LoadMods
CALLV
pop
line 232
;231:
;232:	Menu_AddItem( &s_mods.menu, &s_mods.banner );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 233
;233:	Menu_AddItem( &s_mods.menu, &s_mods.framel );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 234
;234:	Menu_AddItem( &s_mods.menu, &s_mods.framer );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 235
;235:	Menu_AddItem( &s_mods.menu, &s_mods.list );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 236
;236:	Menu_AddItem( &s_mods.menu, &s_mods.back );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 237
;237:	Menu_AddItem( &s_mods.menu, &s_mods.go );
ADDRGP4 s_mods
ARGP4
ADDRGP4 s_mods+720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 238
;238:}
LABELV $135
endproc UI_Mods_MenuInit 0 12
export UI_ModsMenu_Cache
proc UI_ModsMenu_Cache 0 4
line 245
;239:
;240:/*
;241:=================
;242:UI_Mods_Cache
;243:=================
;244:*/
;245:void UI_ModsMenu_Cache( void ) {
line 246
;246:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $181
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 247
;247:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $198
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 248
;248:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $202
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 249
;249:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $219
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 250
;250:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $153
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 251
;251:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $167
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 252
;252:}
LABELV $241
endproc UI_ModsMenu_Cache 0 4
export UI_ModsMenu
proc UI_ModsMenu 0 4
line 260
;253:
;254:
;255:/*
;256:===============
;257:UI_ModsMenu
;258:===============
;259:*/
;260:void UI_ModsMenu( void ) {
line 261
;261:	UI_Mods_MenuInit();
ADDRGP4 UI_Mods_MenuInit
CALLV
pop
line 262
;262:	UI_PushMenu( &s_mods.menu );
ADDRGP4 s_mods
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 263
;263:}
LABELV $242
endproc UI_ModsMenu 0 4
bss
align 4
LABELV s_mods
skip 5424
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
LABELV $219
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
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 49
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
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $198
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $167
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
LABELV $153
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
LABELV $145
byte 1 77
byte 1 79
byte 1 68
byte 1 83
byte 1 0
align 1
LABELV $126
byte 1 37
byte 1 105
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $121
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
LABELV $120
byte 1 0
align 1
LABELV $118
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
LABELV $81
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
LABELV $77
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
