export cgrandom
code
proc cgrandom 8 0
file "../cg_info.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_info.c -- display information while data is being loading
;4:
;5:#include "cg_local.h"
;6:
;7:#define MAX_LOADING_PLAYER_ICONS	16
;8:#define MAX_LOADING_ITEM_ICONS		26
;9:
;10:static int			loadingPlayerIconCount;
;11:static int			loadingItemIconCount;
;12:static qhandle_t	loadingPlayerIcons[MAX_LOADING_PLAYER_ICONS];
;13:static qhandle_t	loadingItemIcons[MAX_LOADING_ITEM_ICONS];
;14:
;15:// Quick Dirty Hacky Thingy
;16:int cgrandom(int min, int max)
;17:{
line 18
;18:	max++; //so it can round down
ADDRFP4 4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 19
;19:	return ((rand() * (max - min)) >> 15) + min;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
MULI4
CNSTI4 15
RSHI4
ADDRLP4 4
INDIRI4
ADDI4
RETI4
LABELV $72
endproc cgrandom 8 0
proc CG_DrawLoadingIcons 44 20
line 27
;20:}
;21:
;22:/*
;23:===================
;24:CG_DrawLoadingIcons
;25:===================
;26:*/
;27:static void CG_DrawLoadingIcons( void ) {
line 34
;28:	int		n;
;29:	int		i;
;30:	int		x, y;
;31:	qhandle_t	progress;
;32:	qhandle_t	progress2;
;33:
;34:	progress = trap_R_RegisterShaderNoMip( "menu/art/probar.tga" );
ADDRGP4 $74
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 35
;35:	progress2 = trap_R_RegisterShaderNoMip( "menu/art/probar2.tga" );
ADDRGP4 $75
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 37
;36:
;37:	for( n = 0; n < loadingPlayerIconCount; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $79
JUMPV
LABELV $76
line 38
;38:		x = 32 + (n * 32) + 15; // * 78;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
CNSTI4 32
ADDI4
CNSTI4 15
ADDI4
ASGNI4
line 39
;39:		y = 390-40;
ADDRLP4 8
CNSTI4 350
ASGNI4
line 40
;40:		CG_DrawPic( x, y, 32, 32, loadingPlayerIcons[n] );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTF4 1107296256
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 41
;41:	}
LABELV $77
line 37
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $79
ADDRLP4 0
INDIRI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
LTI4 $76
line 43
;42:
;43:	for( n = 0; n < loadingItemIconCount; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
line 44
;44:		i = n;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 45
;45:		y = 430-40;
ADDRLP4 8
CNSTI4 390
ASGNI4
line 46
;46:		if( n >= 24 ) {
ADDRLP4 0
INDIRI4
CNSTI4 24
LTI4 $84
line 47
;47:			y += 40;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 48
;48:		}
LABELV $84
line 49
;49:		x = 29 + (i * 29); //% 13 * 48;
ADDRLP4 32
CNSTI4 29
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ADDRLP4 32
INDIRI4
ADDI4
ASGNI4
line 51
;50:		//CG_DrawPic( x, y, 16, 16, loadingItemIcons[n] );
;51:		if (i > 18)
ADDRLP4 12
INDIRI4
CNSTI4 18
LEI4 $86
line 52
;52:		{
line 53
;53:			x = 29 + ((i -19)* 29);
ADDRLP4 36
CNSTI4 29
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
CNSTI4 551
SUBI4
ADDRLP4 36
INDIRI4
ADDI4
ASGNI4
line 54
;54:			CG_DrawPic( x, y, 32, 32, progress2 );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
CNSTF4 1107296256
ASGNF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 55
;55:		}
ADDRGP4 $87
JUMPV
LABELV $86
line 57
;56:		else
;57:		{
line 58
;58:			CG_DrawPic( x, y, 32, 32, progress );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
CNSTF4 1107296256
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 59
;59:		}
LABELV $87
line 60
;60:	}
LABELV $81
line 43
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 0
INDIRI4
ADDRGP4 loadingItemIconCount
INDIRI4
LTI4 $80
line 61
;61:}
LABELV $73
endproc CG_DrawLoadingIcons 44 20
export CG_LoadingString
proc CG_LoadingString 0 12
line 70
;62:
;63:
;64:/*
;65:======================
;66:CG_LoadingString
;67:
;68:======================
;69:*/
;70:void CG_LoadingString( const char *s ) {
line 71
;71:	Q_strncpyz( cg.infoScreenText, s, sizeof( cg.infoScreenText ) );
ADDRGP4 cg+109448
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 73
;72:
;73:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 74
;74:}
LABELV $88
endproc CG_LoadingString 0 12
export CG_LoadingItem
proc CG_LoadingItem 16 4
line 81
;75:
;76:/*
;77:===================
;78:CG_LoadingItem
;79:===================
;80:*/
;81:void CG_LoadingItem( int itemNum ) {
line 84
;82:	gitem_t		*item;
;83:
;84:	item = &bg_itemlist[itemNum];
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 86
;85:	
;86:	if ( item->icon && loadingItemIconCount < MAX_LOADING_ITEM_ICONS ) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $92
ADDRGP4 loadingItemIconCount
INDIRI4
CNSTI4 26
GEI4 $92
line 87
;87:		loadingItemIcons[loadingItemIconCount++] = trap_R_RegisterShaderNoMip( item->icon );
ADDRLP4 8
ADDRGP4 loadingItemIconCount
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingItemIcons
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 88
;88:	}
LABELV $92
line 90
;89:
;90:	CG_LoadingString( item->pickup_name );
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 91
;91:}
LABELV $91
endproc CG_LoadingItem 16 4
export CG_LoadingClient
proc CG_LoadingClient 220 20
line 98
;92:
;93:/*
;94:===================
;95:CG_LoadingClient
;96:===================
;97:*/
;98:void CG_LoadingClient( int clientNum ) {
line 105
;99:	const char		*info;
;100:	char			*skin;
;101:	char			personality[MAX_QPATH];
;102:	char			model[MAX_QPATH];
;103:	char			iconName[MAX_QPATH];
;104:
;105:	info = CG_ConfigString( CS_PLAYERS + clientNum );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 200
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 200
INDIRP4
ASGNP4
line 107
;106:
;107:	if ( loadingPlayerIconCount < MAX_LOADING_PLAYER_ICONS ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 16
GEI4 $95
line 108
;108:		Q_strncpyz( model, Info_ValueForKey( info, "model" ), sizeof( model ) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 109
;109:		skin = Q_strrchr( model, '/' );
ADDRLP4 72
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 208
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 208
INDIRP4
ASGNP4
line 110
;110:		if ( skin ) {
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $98
line 111
;111:			*skin++ = '\0';
ADDRLP4 212
ADDRLP4 68
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 212
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI1 0
ASGNI1
line 112
;112:		} else {
ADDRGP4 $99
JUMPV
LABELV $98
line 113
;113:			skin = "default";
ADDRLP4 68
ADDRGP4 $100
ASGNP4
line 114
;114:		}
LABELV $99
line 116
;115:
;116:		Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $101
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 118
;117:		
;118:		loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 212
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 212
INDIRI4
ASGNI4
line 119
;119:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $102
line 120
;120:			Com_sprintf( iconName, MAX_QPATH, "models/players/characters/%s/icon_%s.tga", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $104
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 121
;121:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 122
;122:		}
LABELV $102
line 124
;123:		// EF models 
;124:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $105
line 125
;125:			Com_sprintf( iconName, MAX_QPATH, "models/players2/%s/icon_%s.jpg", model, skin );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $107
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 126
;126:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 127
;127:		}
LABELV $105
line 129
;128:
;129:		if ( !loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
NEI4 $108
line 130
;130:			Com_sprintf( iconName, MAX_QPATH, "models/players/%s/icon_%s.tga", DEFAULT_MODEL, "default" );
ADDRLP4 136
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $101
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 $100
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 131
;131:			loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 136
ARGP4
ADDRLP4 216
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
ADDRLP4 216
INDIRI4
ASGNI4
line 132
;132:		}
LABELV $108
line 133
;133:		if ( loadingPlayerIcons[loadingPlayerIconCount] ) {
ADDRGP4 loadingPlayerIconCount
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 loadingPlayerIcons
ADDP4
INDIRI4
CNSTI4 0
EQI4 $111
line 134
;134:			loadingPlayerIconCount++;
ADDRLP4 216
ADDRGP4 loadingPlayerIconCount
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 135
;135:		}
LABELV $111
line 136
;136:	}
LABELV $95
line 138
;137:
;138:	Q_strncpyz( personality, Info_ValueForKey( info, "n" ), sizeof(personality) );
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 139
;139:	Q_CleanStr( personality );
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 141
;140:
;141:	if( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 2
NEI4 $114
line 142
;142:		trap_S_RegisterSound( va( "sound/player/announce/%s.wav", personality ), qtrue );
ADDRGP4 $117
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 208
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 208
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 143
;143:	}
LABELV $114
line 145
;144:
;145:	CG_LoadingString( personality );
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 146
;146:}
LABELV $94
endproc CG_LoadingClient 220 20
export CG_DrawInformation
proc CG_DrawInformation 1144 36
line 156
;147:
;148:
;149:/*
;150:====================
;151:CG_DrawInformation
;152:
;153:Draw all the status / pacifier stuff during level loading
;154:====================
;155:*/
;156:void CG_DrawInformation( void ) {
line 169
;157:	const char	*s;
;158:	const char	*info;
;159:	const char	*sysInfo;
;160:	int			y;
;161:	int			value;
;162:	qhandle_t	levelshot;
;163:	qhandle_t	background;
;164:	qhandle_t	nullbar;
;165:	qhandle_t	detail;
;166:	char		buf[1024];
;167:	int			xr;
;168:
;169:	info = CG_ConfigString( CS_SERVERINFO );
CNSTI4 0
ARGI4
ADDRLP4 1064
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 1064
INDIRP4
ASGNP4
line 170
;170:	sysInfo = CG_ConfigString( CS_SYSTEMINFO );
CNSTI4 1
ARGI4
ADDRLP4 1068
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1068
INDIRP4
ASGNP4
line 172
;171:
;172:	s = Info_ValueForKey( info, "mapname" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $119
ARGP4
ADDRLP4 1072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1072
INDIRP4
ASGNP4
line 174
;173:	
;174:	levelshot = trap_R_RegisterShaderNoMip( va( "levelshots/%s.tga", s ) );
ADDRGP4 $120
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1080
INDIRI4
ASGNI4
line 175
;175:	background = trap_R_RegisterShaderNoMip( "menu/art/popepurplespace.tga" );
ADDRGP4 $121
ARGP4
ADDRLP4 1084
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1084
INDIRI4
ASGNI4
line 180
;176:	//background = trap_R_RegisterShaderNoMip( "menu/art/popespace1.tga" );
;177:	
;178:	
;179:	
;180:	nullbar = trap_R_RegisterShaderNoMip( "menu/art/nullbar.tga" );
ADDRGP4 $122
ARGP4
ADDRLP4 1088
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1088
INDIRI4
ASGNI4
line 182
;181:
;182:	if ( !levelshot ) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $123
line 183
;183:		levelshot = trap_R_RegisterShaderNoMip( "menu/art/unknownmap" );
ADDRGP4 $125
ARGP4
ADDRLP4 1092
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1092
INDIRI4
ASGNI4
line 184
;184:	}
LABELV $123
line 187
;185:	
;186:	
;187:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 189
;188:	// Draw The Background
;189:	CG_DrawPic( 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, background );
ADDRLP4 1092
CNSTF4 0
ASGNF4
ADDRLP4 1092
INDIRF4
ARGF4
ADDRLP4 1092
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 191
;190:	
;191:	CG_DrawPic( 70, 100, 200,150, levelshot );
CNSTF4 1116471296
ARGF4
CNSTF4 1120403456
ARGF4
CNSTF4 1128792064
ARGF4
CNSTF4 1125515264
ARGF4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 194
;192:
;193:	// blend a detail texture over it
;194:	detail = trap_R_RegisterShader( "levelShotDetail" );
ADDRGP4 $126
ARGP4
ADDRLP4 1096
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 1056
ADDRLP4 1096
INDIRI4
ASGNI4
line 195
;195:	trap_R_DrawStretchPic( 0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 2.5, 2, detail );
ADDRLP4 1100
CNSTF4 0
ASGNF4
ADDRLP4 1100
INDIRF4
ARGF4
ADDRLP4 1100
INDIRF4
ARGF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1100
INDIRF4
ARGF4
ADDRLP4 1100
INDIRF4
ARGF4
CNSTF4 1075838976
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 198
;196:
;197:	// Blank Status Bar - Will be filled by probar as items are loaded
;198:	CG_DrawPic( 29, 430-40, 32*17, 32, nullbar );
CNSTF4 1105723392
ARGF4
CNSTF4 1136852992
ARGF4
CNSTF4 1141374976
ARGF4
CNSTF4 1107296256
ARGF4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 201
;199:	
;200:	// draw the icons of things as they are loaded
;201:	CG_DrawLoadingIcons();
ADDRGP4 CG_DrawLoadingIcons
CALLV
pop
line 205
;202:
;203:	// the first 150 rows are reserved for the client connection
;204:	// screen to write into
;205:	if ( cg.infoScreenText[0] ) {
ADDRGP4 cg+109448
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $131
line 206
;206:		UI_DrawProportionalString( 320, 350-32, va("Loading... %s", cg.infoScreenText),
ADDRGP4 $134
ARGP4
ADDRGP4 cg+109448
ARGP4
ADDRLP4 1104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 318
ARGI4
ADDRLP4 1104
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 208
;207:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;208:	} else {
ADDRGP4 $132
JUMPV
LABELV $131
line 209
;209:		UI_DrawProportionalString( 320, 350-32, "Awaiting snapshot...",
CNSTI4 320
ARGI4
CNSTI4 318
ARGI4
ADDRGP4 $136
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 211
;210:			UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;211:	}
LABELV $132
line 219
;212:
;213:	
;214:	
;215:	
;216:
;217:	// draw info string information
;218:
;219:	y = 110-40;
ADDRLP4 4
CNSTI4 70
ASGNI4
line 222
;220:
;221:	// don't print server lines if playing a local game
;222:	trap_Cvar_VariableStringBuffer( "sv_running", buf, sizeof( buf ) );
ADDRGP4 $137
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 223
;223:	if ( !atoi( buf ) ) {
ADDRLP4 16
ARGP4
ADDRLP4 1104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $138
line 225
;224:		// server hostname
;225:		Q_strncpyz(buf, Info_ValueForKey( info, "sv_hostname" ), 1024);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 226
;226:		Q_CleanStr(buf);
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 227
;227:		UI_DrawProportionalString( 320, y, buf,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 2081
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 232
;228:			UI_CENTER|UI_BIGFONT|UI_DROPSHADOW, colorWhite );
;229:		//y += PROP_HEIGHT;
;230:
;231:		// pure server
;232:		s = Info_ValueForKey( sysInfo, "sv_pure" );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $141
ARGP4
ADDRLP4 1112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1112
INDIRP4
ASGNP4
line 233
;233:		if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $142
line 234
;234:			UI_DrawProportionalString( 320, y, "Pure Server",
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $144
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 236
;235:				UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;236:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 237
;237:		}
LABELV $142
line 241
;238:
;239:
;240:		// server-specific message of the day
;241:		s = CG_ConfigString( CS_MOTD );
CNSTI4 4
ARGI4
ADDRLP4 1116
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1116
INDIRP4
ASGNP4
line 242
;242:		if ( s[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $145
line 243
;243:			UI_DrawProportionalString( 320, 285, s,
CNSTI4 320
ARGI4
CNSTI4 285
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 245
;244:				UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;245:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 246
;246:		}
LABELV $145
line 250
;247:
;248:		// some extra space after hostname and motd
;249:		//y += 10;
;250:	}
LABELV $138
line 252
;251:
;252:	y = 110;
ADDRLP4 4
CNSTI4 110
ASGNI4
line 254
;253:	// map-specific message (long map name)
;254:	s = CG_ConfigString( CS_MESSAGE );
CNSTI4 3
ARGI4
ADDRLP4 1108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1108
INDIRP4
ASGNP4
line 255
;255:	if ( s[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $147
line 256
;256:		UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 258
;257:			UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;258:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 259
;259:	}
LABELV $147
line 262
;260:
;261:	// cheats warning
;262:	s = Info_ValueForKey( sysInfo, "sv_cheats" );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 1112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1112
INDIRP4
ASGNP4
line 263
;263:	if ( s[0] == '1' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $150
line 264
;264:		UI_DrawProportionalString( 320, y, "CHEATS ARE ENABLED",
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $152
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 266
;265:			UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;266:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 267
;267:	}
LABELV $150
line 270
;268:
;269:	// game type
;270:	switch ( cgs.gametype ) {
ADDRLP4 1116
ADDRGP4 cgs+31456
INDIRI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
LTI4 $153
ADDRLP4 1116
INDIRI4
CNSTI4 4
GTI4 $153
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $183
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $183
address $157
address $172
address $170
address $174
address $180
code
LABELV $157
line 272
;271:	case GT_FFA:
;272:		if (cgs.g_GameMode == 0) 
ADDRGP4 cgs+154956
INDIRI4
CNSTI4 0
NEI4 $158
line 273
;273:		{
line 274
;274:			s = "Free For All";
ADDRLP4 0
ADDRGP4 $161
ASGNP4
line 275
;275:		}
LABELV $158
line 276
;276:		if (cgs.g_GameMode == 1) 
ADDRGP4 cgs+154956
INDIRI4
CNSTI4 1
NEI4 $162
line 277
;277:		{
line 278
;278:			s = "Arsenal";
ADDRLP4 0
ADDRGP4 $165
ASGNP4
line 279
;279:		}
LABELV $162
line 280
;280:		if (cgs.g_GameMode == 2) 
ADDRGP4 cgs+154956
INDIRI4
CNSTI4 2
NEI4 $154
line 281
;281:		{
line 282
;282:			s = "Survival";
ADDRLP4 0
ADDRGP4 $169
ASGNP4
line 283
;283:		}
line 284
;284:		break;
ADDRGP4 $154
JUMPV
LABELV $170
line 286
;285:	case GT_SINGLE_PLAYER:
;286:		s = "Single Player";
ADDRLP4 0
ADDRGP4 $171
ASGNP4
line 287
;287:		break;
ADDRGP4 $154
JUMPV
LABELV $172
line 289
;288:	case GT_TOURNAMENT:
;289:		s = "Tournament";
ADDRLP4 0
ADDRGP4 $173
ASGNP4
line 290
;290:		break;
ADDRGP4 $154
JUMPV
LABELV $174
line 292
;291:	case GT_TEAM:
;292:		if (cgs.g_GameMode == 2) 
ADDRGP4 cgs+154956
INDIRI4
CNSTI4 2
NEI4 $175
line 293
;293:		{
line 294
;294:			s = "Team Survival";
ADDRLP4 0
ADDRGP4 $178
ASGNP4
line 295
;295:		} else {
ADDRGP4 $154
JUMPV
LABELV $175
line 296
;296:			s = "Team Deathmatch";
ADDRLP4 0
ADDRGP4 $179
ASGNP4
line 297
;297:		}
line 298
;298:		break;
ADDRGP4 $154
JUMPV
LABELV $180
line 300
;299:	case GT_CTF:
;300:		s = "Capture The Flag";
ADDRLP4 0
ADDRGP4 $181
ASGNP4
line 301
;301:		break;
ADDRGP4 $154
JUMPV
LABELV $153
line 314
;302:#ifdef MISSIONPACK
;303:	case GT_1FCTF:
;304:		s = "One Flag CTF";
;305:		break;
;306:	case GT_OBELISK:
;307:		s = "Overload";
;308:		break;
;309:	case GT_HARVESTER:
;310:		s = "Harvester";
;311:		break;
;312:#endif
;313:	default:
;314:		s = "Unknown Gametype";
ADDRLP4 0
ADDRGP4 $182
ASGNP4
line 315
;315:		break;
LABELV $154
line 317
;316:	}
;317:	UI_DrawProportionalString( 320, y, s,
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 319
;318:		UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;319:	y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 321
;320:		
;321:	value = atoi( Info_ValueForKey( info, "timelimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 1124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1128
INDIRI4
ASGNI4
line 322
;322:	if ( value ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $185
line 323
;323:		UI_DrawProportionalString( 320, y, va( "timelimit %i", value ),
ADDRGP4 $187
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 325
;324:			UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;325:		y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 326
;326:	}
LABELV $185
line 328
;327:
;328:	if (cgs.gametype < GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
GEI4 $188
line 329
;329:		value = atoi( Info_ValueForKey( info, "fraglimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1136
INDIRI4
ASGNI4
line 330
;330:		if ( value ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $192
line 331
;331:			UI_DrawProportionalString( 320, y, va( "fraglimit %i", value ),
ADDRGP4 $194
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 333
;332:				UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;333:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 334
;334:		}
LABELV $192
line 335
;335:	}
LABELV $188
line 337
;336:
;337:	if (cgs.gametype >= GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
LTI4 $195
line 338
;338:		value = atoi( Info_ValueForKey( info, "capturelimit" ) );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 1132
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1136
INDIRI4
ASGNI4
line 339
;339:		if ( value ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $199
line 340
;340:			UI_DrawProportionalString( 320, y, va( "capturelimit %i", value ),
ADDRGP4 $201
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 2064
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 342
;341:				UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW, colorWhite );
;342:			y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 343
;343:		}
LABELV $199
line 344
;344:	}
LABELV $195
line 345
;345:}
LABELV $118
endproc CG_DrawInformation 1144 36
bss
align 4
LABELV loadingItemIcons
skip 104
align 4
LABELV loadingPlayerIcons
skip 64
align 4
LABELV loadingItemIconCount
skip 4
align 4
LABELV loadingPlayerIconCount
skip 4
import CG_DrawScanner
import CG_ScannerOff_f
import CG_ScannerOn_f
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_TransitionEntity
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayerHeadshot
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon2
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import CG_Cvar_ClampInt
import CG_AddBoundingBox
import CG_PredictWeaponEffects
import cg_playerOrigins
import cg_plOut
import cg_latentCmds
import cg_latentSnaps
import cl_timeNudge
import cg_optimizePrediction
import cg_projectileNudge
import sv_fps
import cg_cmdTimeNudge
import cg_drawBBox
import cg_debugDelag
import cg_delag
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $201
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
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $198
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
LABELV $194
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $191
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
LABELV $187
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $184
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
LABELV $182
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $181
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $179
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
LABELV $178
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
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
LABELV $173
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
LABELV $171
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $169
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
LABELV $165
byte 1 65
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $161
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
LABELV $152
byte 1 67
byte 1 72
byte 1 69
byte 1 65
byte 1 84
byte 1 83
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 32
byte 1 69
byte 1 78
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $144
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
byte 1 0
align 1
LABELV $141
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $140
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
LABELV $137
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
LABELV $136
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $134
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $125
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
LABELV $122
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
byte 1 117
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $121
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
byte 1 111
byte 1 112
byte 1 101
byte 1 112
byte 1 117
byte 1 114
byte 1 112
byte 1 108
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $120
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
LABELV $119
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $117
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
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $113
byte 1 110
byte 1 0
align 1
LABELV $110
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $107
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
byte 1 50
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
byte 1 106
byte 1 112
byte 1 103
byte 1 0
align 1
LABELV $104
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
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
LABELV $101
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
LABELV $100
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $97
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $75
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
byte 1 114
byte 1 111
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $74
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
byte 1 114
byte 1 111
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
