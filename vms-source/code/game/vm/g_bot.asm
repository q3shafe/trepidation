export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "../g_bot.c"
line 35
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_bot.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:static int		g_numBots;
;9:static char		*g_botInfos[MAX_BOTS];
;10:
;11:
;12:int				g_numArenas;
;13:static char		*g_arenaInfos[MAX_ARENAS];
;14:
;15:
;16:#define BOT_BEGIN_DELAY_BASE		2000
;17:#define BOT_BEGIN_DELAY_INCREMENT	1500
;18:
;19:#define BOT_SPAWN_QUEUE_DEPTH	16
;20:
;21:typedef struct {
;22:	int		clientNum;
;23:	int		spawnTime;
;24:} botSpawnQueue_t;
;25:
;26://static int			botBeginDelay = 0;  // bk001206 - unused, init
;27:static botSpawnQueue_t	botSpawnQueue[BOT_SPAWN_QUEUE_DEPTH];
;28:
;29:vmCvar_t bot_minplayers;
;30:
;31:extern gentity_t	*podium1;
;32:extern gentity_t	*podium2;
;33:extern gentity_t	*podium3;
;34:
;35:float trap_Cvar_VariableValue( const char *var_name ) {
line 38
;36:	char buf[128];
;37:
;38:	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 39
;39:	return atof(buf);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $56
endproc trap_Cvar_VariableValue 132 12
export G_ParseInfos
proc G_ParseInfos 2084 12
line 49
;40:}
;41:
;42:
;43:
;44:/*
;45:===============
;46:G_ParseInfos
;47:===============
;48:*/
;49:int G_ParseInfos( char *buf, int max, char *infos[] ) {
line 55
;50:	char	*token;
;51:	int		count;
;52:	char	key[MAX_TOKEN_CHARS];
;53:	char	info[MAX_INFO_STRING];
;54:
;55:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $58
line 57
;56:
;57:	while ( 1 ) {
line 58
;58:		token = COM_Parse( &buf );
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 59
;59:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $61
line 60
;60:			break;
ADDRGP4 $60
JUMPV
LABELV $61
line 62
;61:		}
;62:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $65
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $63
line 63
;63:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $66
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 64
;64:			break;
ADDRGP4 $60
JUMPV
LABELV $63
line 67
;65:		}
;66:
;67:		if ( count == max ) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $67
line 68
;68:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $69
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 69
;69:			break;
ADDRGP4 $60
JUMPV
LABELV $67
line 72
;70:		}
;71:
;72:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $71
JUMPV
LABELV $70
line 73
;73:		while ( 1 ) {
line 74
;74:			token = COM_ParseExt( &buf, qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 75
;75:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $73
line 76
;76:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $75
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 77
;77:				break;
ADDRGP4 $72
JUMPV
LABELV $73
line 79
;78:			}
;79:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $78
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $76
line 80
;80:				break;
ADDRGP4 $72
JUMPV
LABELV $76
line 82
;81:			}
;82:			Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 84
;83:
;84:			token = COM_ParseExt( &buf, qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 85
;85:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $79
line 86
;86:				strcpy( token, "<NULL>" );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 87
;87:			}
LABELV $79
line 88
;88:			Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 89
;89:		}
LABELV $71
line 73
ADDRGP4 $70
JUMPV
LABELV $72
line 91
;90:		//NOTE: extra space for arena number
;91:		infos[count] = G_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $82
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $83
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2080
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 92
;92:		if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $84
line 93
;93:			strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 94
;94:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 95
;95:		}
LABELV $84
line 96
;96:	}
LABELV $59
line 57
ADDRGP4 $58
JUMPV
LABELV $60
line 97
;97:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $57
endproc G_ParseInfos 2084 12
proc G_LoadArenasFromFile 8216 16
line 105
;98:}
;99:
;100:/*
;101:===============
;102:G_LoadArenasFromFile
;103:===============
;104:*/
;105:static void G_LoadArenasFromFile( char *filename ) {
line 110
;106:	int				len;
;107:	fileHandle_t	f;
;108:	char			buf[MAX_ARENAS_TEXT];
;109:
;110:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 111
;111:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $87
line 112
;112:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $89
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 113
;113:		return;
ADDRGP4 $86
JUMPV
LABELV $87
line 115
;114:	}
;115:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $90
line 116
;116:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $92
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 117
;117:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 118
;118:		return;
ADDRGP4 $86
JUMPV
LABELV $90
line 121
;119:	}
;120:
;121:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 122
;122:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 123
;123:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 125
;124:
;125:	g_numArenas += G_ParseInfos( buf, MAX_ARENAS - g_numArenas, &g_arenaInfos[g_numArenas] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 126
;126:}
LABELV $86
endproc G_LoadArenasFromFile 8216 16
proc G_LoadArenas 1460 16
line 133
;127:
;128:/*
;129:===============
;130:G_LoadArenas
;131:===============
;132:*/
;133:static void G_LoadArenas( void ) {
line 142
;134:	int			numdirs;
;135:	vmCvar_t	arenasFile;
;136:	char		filename[128];
;137:	char		dirlist[1024];
;138:	char*		dirptr;
;139:	int			i, n;
;140:	int			dirlen;
;141:
;142:	g_numArenas = 0;
ADDRGP4 g_numArenas
CNSTI4 0
ASGNI4
line 144
;143:
;144:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 148
ARGP4
ADDRGP4 $94
ARGP4
ADDRGP4 $95
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 145
;145:	if( *arenasFile.string ) {
ADDRLP4 148+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $96
line 146
;146:		G_LoadArenasFromFile(arenasFile.string);
ADDRLP4 148+16
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 147
;147:	}
ADDRGP4 $97
JUMPV
LABELV $96
line 148
;148:	else {
line 149
;149:		G_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $100
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 150
;150:	}
LABELV $97
line 153
;151:
;152:	// get all arenas from .arena files
;153:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, 1024 );
ADDRGP4 $101
ARGP4
ADDRGP4 $102
ARGP4
ADDRLP4 420
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 1444
INDIRI4
ASGNI4
line 154
;154:	dirptr  = dirlist;
ADDRLP4 4
ADDRLP4 420
ASGNP4
line 155
;155:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $103
line 156
;156:		dirlen = strlen(dirptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1448
INDIRI4
ASGNI4
line 157
;157:		strcpy(filename, "scripts/");
ADDRLP4 8
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 158
;158:		strcat(filename, dirptr);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 159
;159:		G_LoadArenasFromFile(filename);
ADDRLP4 8
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 160
;160:	}
LABELV $104
line 155
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 136
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $106
ADDRLP4 136
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $103
line 161
;161:	trap_Printf( va( "%i arenas parsed\n", g_numArenas ) );
ADDRGP4 $108
ARGP4
ADDRGP4 g_numArenas
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 163
;162:	
;163:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $109
line 164
;164:		Info_SetValueForKey( g_arenaInfos[n], "num", va( "%i", n ) );
ADDRGP4 $114
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1456
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $113
ARGP4
ADDRLP4 1456
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 165
;165:	}
LABELV $110
line 163
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $112
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $109
line 166
;166:}
LABELV $93
endproc G_LoadArenas 1460 16
export G_GetArenaInfoByMap
proc G_GetArenaInfoByMap 12 8
line 174
;167:
;168:
;169:/*
;170:===============
;171:G_GetArenaInfoByNumber
;172:===============
;173:*/
;174:const char *G_GetArenaInfoByMap( const char *map ) {
line 177
;175:	int			n;
;176:
;177:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $116
line 178
;178:		if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $122
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $120
line 179
;179:			return g_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $115
JUMPV
LABELV $120
line 181
;180:		}
;181:	}
LABELV $117
line 177
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $119
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $116
line 183
;182:
;183:	return NULL;
CNSTP4 0
RETP4
LABELV $115
endproc G_GetArenaInfoByMap 12 8
proc PlayerIntroSound 80 12
line 192
;184:}
;185:
;186:
;187:/*
;188:=================
;189:PlayerIntroSound
;190:=================
;191:*/
;192:static void PlayerIntroSound( const char *modelAndSkin ) {
line 196
;193:	char	model[MAX_QPATH];
;194:	char	*skin;
;195:
;196:	Q_strncpyz( model, modelAndSkin, sizeof(model) );
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
line 197
;197:	skin = Q_strrchr( model, '/' );
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
line 198
;198:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 199
;199:		*skin++ = '\0';
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
line 200
;200:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 201
;201:	else {
line 202
;202:		skin = model;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 203
;203:	}
LABELV $125
line 205
;204:
;205:	if( Q_stricmp( skin, "default" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $126
line 206
;206:		skin = model;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 207
;207:	}
LABELV $126
line 209
;208:
;209:	trap_SendConsoleCommand( EXEC_APPEND, va( "play sound/player/announce/%s.wav\n", skin ) );
ADDRGP4 $129
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 210
;210:}
LABELV $123
endproc PlayerIntroSound 80 12
export G_AddRandomBot
proc G_AddRandomBot 80 20
line 217
;211:
;212:/*
;213:===============
;214:G_AddRandomBot
;215:===============
;216:*/
;217:void G_AddRandomBot( int team ) {
line 223
;218:	int		i, n, num;
;219:	float	skill;
;220:	char	*value, netname[36], *teamstr;
;221:	gclient_t	*cl;
;222:
;223:	num = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 224
;224:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 225
;225:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
ASGNP4
line 227
;226:		//
;227:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $136
line 228
;228:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 229
;229:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $141
line 230
;230:				continue;
ADDRGP4 $137
JUMPV
LABELV $141
line 232
;231:			}
;232:			if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 836
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $143
line 233
;233:				continue;
ADDRGP4 $137
JUMPV
LABELV $143
line 235
;234:			}
;235:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 68
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $147
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $147
line 236
;236:				continue;
ADDRGP4 $137
JUMPV
LABELV $147
line 238
;237:			}
;238:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $149
line 239
;239:				break;
ADDRGP4 $138
JUMPV
LABELV $149
line 241
;240:			}
;241:		}
LABELV $137
line 227
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $139
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $136
LABELV $138
line 242
;242:		if (i >= g_maxclients.integer) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $151
line 243
;243:			num++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 244
;244:		}
LABELV $151
line 245
;245:	}
LABELV $132
line 224
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $131
line 246
;246:	num = random() * num;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 247
;247:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $154
line 248
;248:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 68
INDIRP4
ASGNP4
line 250
;249:		//
;250:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $161
JUMPV
LABELV $158
line 251
;251:			cl = level.clients + i;
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 252
;252:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $163
line 253
;253:				continue;
ADDRGP4 $159
JUMPV
LABELV $163
line 255
;254:			}
;255:			if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 836
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $165
line 256
;256:				continue;
ADDRGP4 $159
JUMPV
LABELV $165
line 258
;257:			}
;258:			if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 72
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $169
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $169
line 259
;259:				continue;
ADDRGP4 $159
JUMPV
LABELV $169
line 261
;260:			}
;261:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $171
line 262
;262:				break;
ADDRGP4 $160
JUMPV
LABELV $171
line 264
;263:			}
;264:		}
LABELV $159
line 250
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $161
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $158
LABELV $160
line 265
;265:		if (i >= g_maxclients.integer) {
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $173
line 266
;266:			num--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 267
;267:			if (num <= 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $176
line 268
;268:				skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $178
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ASGNF4
line 269
;269:				if (team == TEAM_RED) teamstr = "red";
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $179
ADDRLP4 60
ADDRGP4 $181
ASGNP4
ADDRGP4 $180
JUMPV
LABELV $179
line 270
;270:				else if (team == TEAM_BLUE) teamstr = "blue";
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $182
ADDRLP4 60
ADDRGP4 $184
ASGNP4
ADDRGP4 $183
JUMPV
LABELV $182
line 271
;271:				else teamstr = "";
ADDRLP4 60
ADDRGP4 $95
ASGNP4
LABELV $183
LABELV $180
line 272
;272:				strncpy(netname, value, sizeof(netname)-1);
ADDRLP4 20
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 35
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 273
;273:				netname[sizeof(netname)-1] = '\0';
ADDRLP4 20+35
CNSTI1 0
ASGNI1
line 274
;274:				Q_CleanStr(netname);
ADDRLP4 20
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 275
;275:				trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f %s %i\n", netname, skill, teamstr, 0) );
ADDRGP4 $186
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 276
;276:				return;
ADDRGP4 $130
JUMPV
LABELV $176
line 278
;277:			}
;278:		}
LABELV $173
line 279
;279:	}
LABELV $155
line 247
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $157
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $154
line 280
;280:}
LABELV $130
endproc G_AddRandomBot 80 20
export G_RemoveRandomBot
proc G_RemoveRandomBot 52 8
line 287
;281:
;282:/*
;283:===============
;284:G_RemoveRandomBot
;285:===============
;286:*/
;287:int G_RemoveRandomBot( int team ) {
line 292
;288:	int i;
;289:	char netname[36];
;290:	gclient_t	*cl;
;291:
;292:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $191
JUMPV
LABELV $188
line 293
;293:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 294
;294:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $193
line 295
;295:			continue;
ADDRGP4 $189
JUMPV
LABELV $193
line 297
;296:		}
;297:		if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 836
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $195
line 298
;298:			continue;
ADDRGP4 $189
JUMPV
LABELV $195
line 300
;299:		}
;300:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 44
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $199
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $199
line 301
;301:			continue;
ADDRGP4 $189
JUMPV
LABELV $199
line 303
;302:		}
;303:		strcpy(netname, cl->pers.netname);
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 304
;304:		Q_CleanStr(netname);
ADDRLP4 8
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 305
;305:		trap_SendConsoleCommand( EXEC_INSERT, va("kick %s\n", netname) );
ADDRGP4 $201
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 306
;306:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $187
JUMPV
LABELV $189
line 292
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $191
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $188
line 308
;307:	}
;308:	return qfalse;
CNSTI4 0
RETI4
LABELV $187
endproc G_RemoveRandomBot 52 8
export G_CountHumanPlayers
proc G_CountHumanPlayers 16 0
line 316
;309:}
;310:
;311:/*
;312:===============
;313:G_CountHumanPlayers
;314:===============
;315:*/
;316:int G_CountHumanPlayers( int team ) {
line 320
;317:	int i, num;
;318:	gclient_t	*cl;
;319:
;320:	num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 321
;321:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 322
;322:		cl = level.clients + i;
ADDRLP4 0
CNSTI4 3392
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 323
;323:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $208
line 324
;324:			continue;
ADDRGP4 $204
JUMPV
LABELV $208
line 326
;325:		}
;326:		if ( g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT ) {
CNSTI4 836
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $210
line 327
;327:			continue;
ADDRGP4 $204
JUMPV
LABELV $210
line 329
;328:		}
;329:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $214
ADDRLP4 0
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $214
line 330
;330:			continue;
ADDRGP4 $204
JUMPV
LABELV $214
line 332
;331:		}
;332:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;333:	}
LABELV $204
line 321
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $203
line 334
;334:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $202
endproc G_CountHumanPlayers 16 0
export G_CountBotPlayers
proc G_CountBotPlayers 20 0
line 342
;335:}
;336:
;337:/*
;338:===============
;339:G_CountBotPlayers
;340:===============
;341:*/
;342:int G_CountBotPlayers( int team ) {
line 346
;343:	int i, n, num;
;344:	gclient_t	*cl;
;345:
;346:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 347
;347:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $217
line 348
;348:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 3392
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 349
;349:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $222
line 350
;350:			continue;
ADDRGP4 $218
JUMPV
LABELV $222
line 352
;351:		}
;352:		if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 836
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $224
line 353
;353:			continue;
ADDRGP4 $218
JUMPV
LABELV $224
line 355
;354:		}
;355:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $228
ADDRLP4 4
INDIRP4
CNSTI4 2492
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $228
line 356
;356:			continue;
ADDRGP4 $218
JUMPV
LABELV $228
line 358
;357:		}
;358:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 359
;359:	}
LABELV $218
line 347
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $220
ADDRLP4 8
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $217
line 360
;360:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $230
line 361
;361:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $234
line 362
;362:			continue;
ADDRGP4 $231
JUMPV
LABELV $234
line 364
;363:		}
;364:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $237
line 365
;365:			continue;
ADDRGP4 $231
JUMPV
LABELV $237
line 367
;366:		}
;367:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 368
;368:	}
LABELV $231
line 360
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $230
line 369
;369:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $216
endproc G_CountBotPlayers 20 0
bss
align 4
LABELV $242
skip 4
export G_CheckMinimumPlayers
code
proc G_CheckMinimumPlayers 44 4
line 377
;370:}
;371:
;372:/*
;373:===============
;374:G_CheckMinimumPlayers
;375:===============
;376:*/
;377:void G_CheckMinimumPlayers( void ) {
line 382
;378:	int minplayers;
;379:	int humanplayers, botplayers;
;380:	static int checkminimumplayers_time;
;381:
;382:	if (level.intermissiontime) return;
ADDRGP4 level+9132
INDIRI4
CNSTI4 0
EQI4 $243
ADDRGP4 $241
JUMPV
LABELV $243
line 384
;383:	//only check once each 10 seconds
;384:	if (checkminimumplayers_time > level.time - 10000) {
ADDRGP4 $242
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $246
line 385
;385:		return;
ADDRGP4 $241
JUMPV
LABELV $246
line 387
;386:	}
;387:	checkminimumplayers_time = level.time;
ADDRGP4 $242
ADDRGP4 level+32
INDIRI4
ASGNI4
line 388
;388:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 389
;389:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 390
;390:	if (minplayers <= 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $251
ADDRGP4 $241
JUMPV
LABELV $251
line 393
;391:
;392:	// Arsenal 
;393:	if ((g_GameMode.integer == 1) && (level.firstStrike = qtrue)) 
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $253
ADDRGP4 level+9228
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $253
line 394
;394:	{
line 395
;395:		return; 
ADDRGP4 $241
JUMPV
LABELV $253
line 398
;396:	}
;397:	// LMS?
;398:	if ((g_GameMode.integer == 2) && (level.firstStrike = qtrue)) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $257
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 level+9228
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $257
line 399
;399:	{
line 400
;400:		return; 
ADDRGP4 $241
JUMPV
LABELV $257
line 404
;401:	}
;402:	///////////////////////
;403:
;404:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $261
line 405
;405:		if (minplayers >= g_maxclients.integer / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
LTI4 $264
line 406
;406:			minplayers = (g_maxclients.integer / 2) -1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 407
;407:		}
LABELV $264
line 409
;408:
;409:		humanplayers = G_CountHumanPlayers( TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 410
;410:		botplayers = G_CountBotPlayers(	TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 412
;411:		//
;412:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $268
line 413
;413:			G_AddRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 414
;414:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $269
JUMPV
LABELV $268
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $270
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $270
line 415
;415:			G_RemoveRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 416
;416:		}
LABELV $270
LABELV $269
line 418
;417:		//
;418:		humanplayers = G_CountHumanPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 32
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 32
INDIRI4
ASGNI4
line 419
;419:		botplayers = G_CountBotPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 36
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 421
;420:		//
;421:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $272
line 422
;422:			G_AddRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 423
;423:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $262
JUMPV
LABELV $272
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $262
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $262
line 424
;424:			G_RemoveRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 425
;425:		}
line 426
;426:	}
ADDRGP4 $262
JUMPV
LABELV $261
line 427
;427:	else if (g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $276
line 428
;428:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $279
line 429
;429:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 430
;430:		}
LABELV $279
line 431
;431:		humanplayers = G_CountHumanPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 20
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 432
;432:		botplayers = G_CountBotPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 24
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 434
;433:		//
;434:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $283
line 435
;435:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 436
;436:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $277
JUMPV
LABELV $283
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $277
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $277
line 438
;437:			// try to remove spectators first
;438:			if (!G_RemoveRandomBot( TEAM_SPECTATOR )) {
CNSTI4 3
ARGI4
ADDRLP4 32
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $277
line 440
;439:				// just remove the bot that is playing
;440:				G_RemoveRandomBot( -1 );
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 441
;441:			}
line 442
;442:		}
line 443
;443:	}
ADDRGP4 $277
JUMPV
LABELV $276
line 444
;444:	else if (g_gametype.integer == GT_FFA) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $289
line 445
;445:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $292
line 446
;446:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 447
;447:		}
LABELV $292
line 448
;448:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 449
;449:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 451
;450:		//
;451:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $296
line 452
;452:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 453
;453:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $297
JUMPV
LABELV $296
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $298
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $298
line 454
;454:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 455
;455:		}
LABELV $298
LABELV $297
line 456
;456:	}
LABELV $289
LABELV $277
LABELV $262
line 457
;457:}
LABELV $241
endproc G_CheckMinimumPlayers 44 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 1032 12
line 464
;458:
;459:/*
;460:===============
;461:G_CheckBotSpawn
;462:===============
;463:*/
;464:void G_CheckBotSpawn( void ) {
line 468
;465:	int		n;
;466:	char	userinfo[MAX_INFO_VALUE];
;467:
;468:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 470
;469:
;470:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $301
line 471
;471:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $305
line 472
;472:			continue;
ADDRGP4 $302
JUMPV
LABELV $305
line 474
;473:		}
;474:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $308
line 475
;475:			continue;
ADDRGP4 $302
JUMPV
LABELV $308
line 477
;476:		}
;477:		ClientBegin( botSpawnQueue[n].clientNum );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 478
;478:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 480
;479:
;480:		if( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $313
line 481
;481:			trap_GetUserinfo( botSpawnQueue[n].clientNum, userinfo, sizeof(userinfo) );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 482
;482:			PlayerIntroSound( Info_ValueForKey (userinfo, "model") );
ADDRLP4 4
ARGP4
ADDRGP4 $316
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 PlayerIntroSound
CALLV
pop
line 483
;483:		}
LABELV $313
line 484
;484:	}
LABELV $302
line 470
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $301
line 485
;485:}
LABELV $300
endproc G_CheckBotSpawn 1032 12
proc AddBotToSpawnQueue 4 4
line 493
;486:
;487:
;488:/*
;489:===============
;490:AddBotToSpawnQueue
;491:===============
;492:*/
;493:static void AddBotToSpawnQueue( int clientNum, int delay ) {
line 496
;494:	int		n;
;495:
;496:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $318
line 497
;497:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $322
line 498
;498:			botSpawnQueue[n].spawnTime = level.time + delay;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 499
;499:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 500
;500:			return;
ADDRGP4 $317
JUMPV
LABELV $322
line 502
;501:		}
;502:	}
LABELV $319
line 496
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $318
line 504
;503:
;504:	G_Printf( S_COLOR_YELLOW "Unable to delay spawn\n" );
ADDRGP4 $327
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 505
;505:	ClientBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 506
;506:}
LABELV $317
endproc AddBotToSpawnQueue 4 4
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 517
;507:
;508:
;509:/*
;510:===============
;511:G_RemoveQueuedBotBegin
;512:
;513:Called on client disconnect to make sure the delayed spawn
;514:doesn't happen on a freed index
;515:===============
;516:*/
;517:void G_RemoveQueuedBotBegin( int clientNum ) {
line 520
;518:	int		n;
;519:
;520:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $329
line 521
;521:		if( botSpawnQueue[n].clientNum == clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $333
line 522
;522:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 523
;523:			return;
ADDRGP4 $328
JUMPV
LABELV $333
line 525
;524:		}
;525:	}
LABELV $330
line 520
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $329
line 526
;526:}
LABELV $328
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 1336 12
line 534
;527:
;528:
;529:/*
;530:===============
;531:G_BotConnect
;532:===============
;533:*/
;534:qboolean G_BotConnect( int clientNum, qboolean restart ) {
line 538
;535:	bot_settings_t	settings;
;536:	char			userinfo[MAX_INFO_STRING];
;537:
;538:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 540
;539:
;540:	Q_strncpyz( settings.characterfile, Info_ValueForKey( userinfo, "characterfile" ), sizeof(settings.characterfile) );
ADDRLP4 292
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 541
;541:	settings.skill = atof( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 292
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0+144
ADDRLP4 1324
INDIRF4
ASGNF4
line 542
;542:	Q_strncpyz( settings.team, Info_ValueForKey( userinfo, "team" ), sizeof(settings.team) );
ADDRLP4 292
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 1328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+148
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 544
;543:
;544:	if (!BotAISetupClient( clientNum, &settings, restart )) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 BotAISetupClient
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
NEI4 $343
line 545
;545:		trap_DropClient( clientNum, "BotAISetupClient failed" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $345
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 546
;546:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $336
JUMPV
LABELV $343
line 549
;547:	}
;548:
;549:	return qtrue;
CNSTI4 1
RETI4
LABELV $336
endproc G_BotConnect 1336 12
proc G_AddBot 1136 12
line 558
;550:}
;551:
;552:
;553:/*
;554:===============
;555:G_AddBot
;556:===============
;557:*/
;558:static void G_AddBot( const char *name, float skill, const char *team, int delay, char *altname) {
line 570
;559:	int				clientNum;
;560:	char			*botinfo;
;561:	gentity_t		*bot;
;562:	char			*key;
;563:	char			*s;
;564:	char			*botname;
;565:	char			*model;
;566:	char			*headmodel;
;567:	char			userinfo[MAX_INFO_STRING];
;568:
;569:	// get the botinfo from bots.txt
;570:	botinfo = G_GetBotInfoByName( name );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 G_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 571
;571:	if ( !botinfo ) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 572
;572:		G_Printf( S_COLOR_RED "Error: Bot '%s' not defined\n", name );
ADDRGP4 $349
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 573
;573:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 577
;574:	}
;575:
;576:	// create the bot's userinfo
;577:	userinfo[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 579
;578:
;579:	botname = Info_ValueForKey( botinfo, "funname" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1060
INDIRP4
ASGNP4
line 580
;580:	if( !botname[0] ) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $351
line 581
;581:		botname = Info_ValueForKey( botinfo, "name" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1064
INDIRP4
ASGNP4
line 582
;582:	}
LABELV $351
line 584
;583:	// check for an alternative name
;584:	if (altname && altname[0]) {
ADDRLP4 1064
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
ADDRLP4 1064
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $353
line 585
;585:		botname = altname;
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
line 586
;586:	}
LABELV $353
line 587
;587:	Info_SetValueForKey( userinfo, "name", botname );
ADDRLP4 4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 588
;588:	Info_SetValueForKey( userinfo, "rate", "25000" );
ADDRLP4 4
ARGP4
ADDRGP4 $355
ARGP4
ADDRGP4 $356
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 589
;589:	Info_SetValueForKey( userinfo, "snaps", "20" );
ADDRLP4 4
ARGP4
ADDRGP4 $357
ARGP4
ADDRGP4 $358
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 590
;590:	Info_SetValueForKey( userinfo, "skill", va("%1.2f", skill) );
ADDRGP4 $359
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 592
;591:
;592:	if ( skill >= 1 && skill < 2 ) {
ADDRLP4 1072
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1072
INDIRF4
CNSTF4 1065353216
LTF4 $360
ADDRLP4 1072
INDIRF4
CNSTF4 1073741824
GEF4 $360
line 593
;593:		Info_SetValueForKey( userinfo, "handicap", "50" );
ADDRLP4 4
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 594
;594:	}
ADDRGP4 $361
JUMPV
LABELV $360
line 595
;595:	else if ( skill >= 2 && skill < 3 ) {
ADDRLP4 1076
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1076
INDIRF4
CNSTF4 1073741824
LTF4 $364
ADDRLP4 1076
INDIRF4
CNSTF4 1077936128
GEF4 $364
line 596
;596:		Info_SetValueForKey( userinfo, "handicap", "70" );
ADDRLP4 4
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 597
;597:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 598
;598:	else if ( skill >= 3 && skill < 4 ) {
ADDRLP4 1080
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1080
INDIRF4
CNSTF4 1077936128
LTF4 $367
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
GEF4 $367
line 599
;599:		Info_SetValueForKey( userinfo, "handicap", "90" );
ADDRLP4 4
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 $369
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 600
;600:	}
LABELV $367
LABELV $365
LABELV $361
line 602
;601:
;602:	key = "model";
ADDRLP4 0
ADDRGP4 $316
ASGNP4
line 603
;603:	model = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1084
INDIRP4
ASGNP4
line 604
;604:	if ( !*model ) {
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $370
line 605
;605:		model = "visor/default";
ADDRLP4 1040
ADDRGP4 $372
ASGNP4
line 606
;606:	}
LABELV $370
line 607
;607:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 608
;608:	key = "team_model";
ADDRLP4 0
ADDRGP4 $373
ASGNP4
line 609
;609:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 611
;610:
;611:	key = "headmodel";
ADDRLP4 0
ADDRGP4 $374
ASGNP4
line 612
;612:	headmodel = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1088
INDIRP4
ASGNP4
line 613
;613:	if ( !*headmodel ) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 614
;614:		headmodel = model;
ADDRLP4 1044
ADDRLP4 1040
INDIRP4
ASGNP4
line 615
;615:	}
LABELV $375
line 616
;616:	Info_SetValueForKey( userinfo, key, headmodel );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 617
;617:	key = "team_headmodel";
ADDRLP4 0
ADDRGP4 $377
ASGNP4
line 618
;618:	Info_SetValueForKey( userinfo, key, headmodel );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 620
;619:
;620:	key = "gender";
ADDRLP4 0
ADDRGP4 $378
ASGNP4
line 621
;621:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1092
INDIRP4
ASGNP4
line 622
;622:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $379
line 623
;623:		s = "male";
ADDRLP4 1028
ADDRGP4 $381
ASGNP4
line 624
;624:	}
LABELV $379
line 625
;625:	Info_SetValueForKey( userinfo, "sex", s );
ADDRLP4 4
ARGP4
ADDRGP4 $382
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 627
;626:
;627:	key = "color1";
ADDRLP4 0
ADDRGP4 $383
ASGNP4
line 628
;628:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1096
INDIRP4
ASGNP4
line 629
;629:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $384
line 630
;630:		s = "4";
ADDRLP4 1028
ADDRGP4 $386
ASGNP4
line 631
;631:	}
LABELV $384
line 632
;632:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 634
;633:
;634:	key = "color2";
ADDRLP4 0
ADDRGP4 $387
ASGNP4
line 635
;635:	s = Info_ValueForKey( botinfo, key );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1100
INDIRP4
ASGNP4
line 636
;636:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $388
line 637
;637:		s = "5";
ADDRLP4 1028
ADDRGP4 $390
ASGNP4
line 638
;638:	}
LABELV $388
line 639
;639:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 641
;640:
;641:	s = Info_ValueForKey(botinfo, "aifile");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
ADDRLP4 1104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1104
INDIRP4
ASGNP4
line 642
;642:	if (!*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $392
line 643
;643:		trap_Printf( S_COLOR_RED "Error: bot has no aifile specified\n" );
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 644
;644:		return;
ADDRGP4 $346
JUMPV
LABELV $392
line 648
;645:	}
;646:
;647:	// have the server allocate a client slot
;648:	clientNum = trap_BotAllocateClient();
ADDRLP4 1108
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1108
INDIRI4
ASGNI4
line 649
;649:	if ( clientNum == -1 ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $395
line 650
;650:		G_Printf( S_COLOR_RED "Unable to add bot.  All player slots are in use.\n" );
ADDRGP4 $397
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 651
;651:		G_Printf( S_COLOR_RED "Start server with more 'open' slots (or check setting of sv_maxclients cvar).\n" );
ADDRGP4 $398
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 652
;652:		return;
ADDRGP4 $346
JUMPV
LABELV $395
line 656
;653:	}
;654:
;655:	// initialize the bot settings
;656:	if( !team || !*team ) {
ADDRLP4 1112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $401
ADDRLP4 1112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $399
LABELV $401
line 657
;657:		if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $402
line 658
;658:			if( PickTeam(clientNum) == TEAM_RED) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 1
NEI4 $405
line 659
;659:				team = "red";
ADDRFP4 8
ADDRGP4 $181
ASGNP4
line 660
;660:			}
ADDRGP4 $403
JUMPV
LABELV $405
line 661
;661:			else {
line 662
;662:				team = "blue";
ADDRFP4 8
ADDRGP4 $184
ASGNP4
line 663
;663:			}
line 664
;664:		}
ADDRGP4 $403
JUMPV
LABELV $402
line 665
;665:		else {
line 666
;666:			team = "red";
ADDRFP4 8
ADDRGP4 $181
ASGNP4
line 667
;667:		}
LABELV $403
line 668
;668:	}
LABELV $399
line 669
;669:	Info_SetValueForKey( userinfo, "characterfile", Info_ValueForKey( botinfo, "aifile" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 670
;670:	Info_SetValueForKey( userinfo, "skill", va( "%5.2f", skill ) );
ADDRGP4 $407
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1120
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 671
;671:	Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 4
ARGP4
ADDRGP4 $341
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 673
;672:
;673:	bot = &g_entities[ clientNum ];
ADDRLP4 1052
CNSTI4 836
ADDRLP4 1036
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 674
;674:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1124
ADDRLP4 1052
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ADDRLP4 1124
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 675
;675:	bot->inuse = qtrue;
ADDRLP4 1052
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 678
;676:
;677:	// register the userinfo
;678:	trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 681
;679:
;680:	// have it connect to the game as a normal client
;681:	if ( ClientConnect( clientNum, qtrue, qtrue ) ) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1128
CNSTI4 1
ASGNI4
ADDRLP4 1128
INDIRI4
ARGI4
ADDRLP4 1128
INDIRI4
ARGI4
ADDRLP4 1132
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $408
line 682
;682:		return;
ADDRGP4 $346
JUMPV
LABELV $408
line 685
;683:	}
;684:
;685:	if( delay == 0 ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $410
line 686
;686:		ClientBegin( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 687
;687:		return;
ADDRGP4 $346
JUMPV
LABELV $410
line 690
;688:	}
;689:
;690:	AddBotToSpawnQueue( clientNum, delay );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 691
;691:}
LABELV $346
endproc G_AddBot 1136 12
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 4112 20
line 699
;692:
;693:
;694:/*
;695:===============
;696:Svcmd_AddBot_f
;697:===============
;698:*/
;699:void Svcmd_AddBot_f( void ) {
line 708
;700:	float			skill;
;701:	int				delay;
;702:	char			name[MAX_TOKEN_CHARS];
;703:	char			altname[MAX_TOKEN_CHARS];
;704:	char			string[MAX_TOKEN_CHARS];
;705:	char			team[MAX_TOKEN_CHARS];
;706:
;707:	// are bots enabled?
;708:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $415
ARGP4
ADDRLP4 4104
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $413
line 709
;709:		return;
ADDRGP4 $412
JUMPV
LABELV $413
line 713
;710:	}
;711:
;712:	// name
;713:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 714
;714:	if ( !name[0] ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $416
line 715
;715:		trap_Printf( "Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n" );
ADDRGP4 $418
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 716
;716:		return;
ADDRGP4 $412
JUMPV
LABELV $416
line 720
;717:	}
;718:
;719:	// skill
;720:	trap_Argv( 2, string, sizeof( string ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 721
;721:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $419
line 722
;722:		skill = 4;
ADDRLP4 4096
CNSTF4 1082130432
ASGNF4
line 723
;723:	}
ADDRGP4 $420
JUMPV
LABELV $419
line 724
;724:	else {
line 725
;725:		skill = atof( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4096
ADDRLP4 4108
INDIRF4
ASGNF4
line 726
;726:	}
LABELV $420
line 729
;727:
;728:	// team
;729:	trap_Argv( 3, team, sizeof( team ) );
CNSTI4 3
ARGI4
ADDRLP4 3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 732
;730:
;731:	// delay
;732:	trap_Argv( 4, string, sizeof( string ) );
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 733
;733:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $421
line 734
;734:		delay = 0;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 735
;735:	}
ADDRGP4 $422
JUMPV
LABELV $421
line 736
;736:	else {
line 737
;737:		delay = atoi( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4108
INDIRI4
ASGNI4
line 738
;738:	}
LABELV $422
line 741
;739:
;740:	// alternative name
;741:	trap_Argv( 5, altname, sizeof( altname ) );
CNSTI4 5
ARGI4
ADDRLP4 2048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 743
;742:
;743:	G_AddBot( name, skill, team, delay, altname );
ADDRLP4 1024
ARGP4
ADDRLP4 4096
INDIRF4
ARGF4
ADDRLP4 3072
ARGP4
ADDRLP4 4100
INDIRI4
ARGI4
ADDRLP4 2048
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 747
;744:
;745:	// if this was issued during gameplay and we are playing locally,
;746:	// go ahead and load the bot's media immediately
;747:	if ( level.time - level.startTime > 1000 &&
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $423
ADDRGP4 $427
ARGP4
ADDRLP4 4108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4108
INDIRI4
CNSTI4 0
EQI4 $423
line 748
;748:		trap_Cvar_VariableIntegerValue( "cl_running" ) ) {
line 749
;749:		trap_SendServerCommand( -1, "loaddefered\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $428
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 750
;750:	}
LABELV $423
line 751
;751:}
LABELV $412
endproc Svcmd_AddBot_f 4112 20
export Svcmd_BotList_f
proc Svcmd_BotList_f 4120 20
line 758
;752:
;753:/*
;754:===============
;755:Svcmd_BotList_f
;756:===============
;757:*/
;758:void Svcmd_BotList_f( void ) {
line 765
;759:	int i;
;760:	char name[MAX_TOKEN_CHARS];
;761:	char funname[MAX_TOKEN_CHARS];
;762:	char model[MAX_TOKEN_CHARS];
;763:	char aifile[MAX_TOKEN_CHARS];
;764:
;765:	trap_Printf("^1name             model            aifile              funname\n");
ADDRGP4 $430
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 766
;766:	for (i = 0; i < g_numBots; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $434
JUMPV
LABELV $431
line 767
;767:		strcpy(name, Info_ValueForKey( g_botInfos[i], "name" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 4100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 4100
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 768
;768:		if ( !*name ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $435
line 769
;769:			strcpy(name, "UnnamedPlayer");
ADDRLP4 4
ARGP4
ADDRGP4 $437
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 770
;770:		}
LABELV $435
line 771
;771:		strcpy(funname, Info_ValueForKey( g_botInfos[i], "funname" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 4104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 4104
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 772
;772:		if ( !*funname ) {
ADDRLP4 1028
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $438
line 773
;773:			strcpy(funname, "");
ADDRLP4 1028
ARGP4
ADDRGP4 $95
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 774
;774:		}
LABELV $438
line 775
;775:		strcpy(model, Info_ValueForKey( g_botInfos[i], "model" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $316
ARGP4
ADDRLP4 4108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2052
ARGP4
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 776
;776:		if ( !*model ) {
ADDRLP4 2052
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $440
line 777
;777:			strcpy(model, "visor/default");
ADDRLP4 2052
ARGP4
ADDRGP4 $372
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 778
;778:		}
LABELV $440
line 779
;779:		strcpy(aifile, Info_ValueForKey( g_botInfos[i], "aifile"));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3076
ARGP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 780
;780:		if (!*aifile ) {
ADDRLP4 3076
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $442
line 781
;781:			strcpy(aifile, "bots/default_c.c");
ADDRLP4 3076
ARGP4
ADDRGP4 $444
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 782
;782:		}
LABELV $442
line 783
;783:		trap_Printf(va("%-16s %-16s %-20s %-20s\n", name, model, aifile, funname));
ADDRGP4 $445
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2052
ARGP4
ADDRLP4 3076
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 4116
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 784
;784:	}
LABELV $432
line 766
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $434
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $431
line 785
;785:}
LABELV $429
endproc Svcmd_BotList_f 4120 20
proc G_SpawnBots 1056 16
line 793
;786:
;787:
;788:/*
;789:===============
;790:G_SpawnBots
;791:===============
;792:*/
;793:static void G_SpawnBots( char *botList, int baseDelay ) {
line 800
;794:	char		*bot;
;795:	char		*p;
;796:	float		skill;
;797:	int			delay;
;798:	char		bots[MAX_INFO_VALUE];
;799:
;800:	podium1 = NULL;
ADDRGP4 podium1
CNSTP4 0
ASGNP4
line 801
;801:	podium2 = NULL;
ADDRGP4 podium2
CNSTP4 0
ASGNP4
line 802
;802:	podium3 = NULL;
ADDRGP4 podium3
CNSTP4 0
ASGNP4
line 804
;803:
;804:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $178
ARGP4
ADDRLP4 1040
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 1040
INDIRF4
ASGNF4
line 805
;805:	if( skill < 1 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $447
line 806
;806:		trap_Cvar_Set( "g_spSkill", "1" );
ADDRGP4 $178
ARGP4
ADDRGP4 $449
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 807
;807:		skill = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 808
;808:	}
ADDRGP4 $448
JUMPV
LABELV $447
line 809
;809:	else if ( skill > 5 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
LEF4 $450
line 810
;810:		trap_Cvar_Set( "g_spSkill", "5" );
ADDRGP4 $178
ARGP4
ADDRGP4 $390
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 811
;811:		skill = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
line 812
;812:	}
LABELV $450
LABELV $448
line 814
;813:
;814:	Q_strncpyz( bots, botList, sizeof(bots) );
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 815
;815:	p = &bots[0];
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 816
;816:	delay = baseDelay;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $453
JUMPV
line 817
;817:	while( *p ) {
LABELV $455
line 819
;818:		//skip spaces
;819:		while( *p && *p == ' ' ) {
line 820
;820:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 821
;821:		}
LABELV $456
line 819
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $458
ADDRLP4 1044
INDIRI4
CNSTI4 32
EQI4 $455
LABELV $458
line 822
;822:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $459
line 823
;823:			break;
ADDRGP4 $454
JUMPV
LABELV $459
line 827
;824:		}
;825:
;826:		// mark start of bot name
;827:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $462
JUMPV
LABELV $461
line 830
;828:
;829:		// skip until space of null
;830:		while( *p && *p != ' ' ) {
line 831
;831:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 832
;832:		}
LABELV $462
line 830
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $464
ADDRLP4 1048
INDIRI4
CNSTI4 32
NEI4 $461
LABELV $464
line 833
;833:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $465
line 834
;834:			*p++ = 0;
ADDRLP4 1052
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1052
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI1 0
ASGNI1
line 835
;835:		}
LABELV $465
line 839
;836:
;837:		// we must add the bot this way, calling G_AddBot directly at this stage
;838:		// does "Bad Things"
;839:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay) );
ADDRGP4 $467
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 841
;840:
;841:		delay += BOT_BEGIN_DELAY_INCREMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 842
;842:	}
LABELV $453
line 817
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $456
LABELV $454
line 843
;843:}
LABELV $446
endproc G_SpawnBots 1056 16
proc G_LoadBotsFromFile 8216 16
line 851
;844:
;845:
;846:/*
;847:===============
;848:G_LoadBotsFromFile
;849:===============
;850:*/
;851:static void G_LoadBotsFromFile( char *filename ) {
line 856
;852:	int				len;
;853:	fileHandle_t	f;
;854:	char			buf[MAX_BOTS_TEXT];
;855:
;856:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 857
;857:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $469
line 858
;858:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $89
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 859
;859:		return;
ADDRGP4 $468
JUMPV
LABELV $469
line 861
;860:	}
;861:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $471
line 862
;862:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $92
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 863
;863:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 864
;864:		return;
ADDRGP4 $468
JUMPV
LABELV $471
line 867
;865:	}
;866:
;867:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 868
;868:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 869
;869:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 871
;870:
;871:	g_numBots += G_ParseInfos( buf, MAX_BOTS - g_numBots, &g_botInfos[g_numBots] );
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 872
;872:}
LABELV $468
endproc G_LoadBotsFromFile 8216 16
proc G_LoadBots 1456 16
line 879
;873:
;874:/*
;875:===============
;876:G_LoadBots
;877:===============
;878:*/
;879:static void G_LoadBots( void ) {
line 888
;880:	vmCvar_t	botsFile;
;881:	int			numdirs;
;882:	char		filename[128];
;883:	char		dirlist[1024];
;884:	char*		dirptr;
;885:	int			i;
;886:	int			dirlen;
;887:
;888:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $415
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $474
line 889
;889:		return;
ADDRGP4 $473
JUMPV
LABELV $474
line 892
;890:	}
;891:
;892:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 894
;893:
;894:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $476
ARGP4
ADDRGP4 $95
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 895
;895:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $477
line 896
;896:		G_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 897
;897:	}
ADDRGP4 $478
JUMPV
LABELV $477
line 898
;898:	else {
line 899
;899:		G_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $481
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 900
;900:	}
LABELV $478
line 903
;901:
;902:	// get all bots from .bot files
;903:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $101
ARGP4
ADDRGP4 $482
ARGP4
ADDRLP4 416
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1444
INDIRI4
ASGNI4
line 904
;904:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 416
ASGNP4
line 905
;905:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $486
JUMPV
LABELV $483
line 906
;906:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1448
INDIRI4
ASGNI4
line 907
;907:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 908
;908:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 909
;909:		G_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 910
;910:	}
LABELV $484
line 905
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $486
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $483
line 911
;911:	trap_Printf( va( "%i bots parsed\n", g_numBots ) );
ADDRGP4 $487
ARGP4
ADDRGP4 g_numBots
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 912
;912:}
LABELV $473
endproc G_LoadBots 1456 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 921
;913:
;914:
;915:
;916:/*
;917:===============
;918:G_GetBotInfoByNumber
;919:===============
;920:*/
;921:char *G_GetBotInfoByNumber( int num ) {
line 922
;922:	if( num < 0 || num >= g_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $491
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $489
LABELV $491
line 923
;923:		trap_Printf( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $492
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 924
;924:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $488
JUMPV
LABELV $489
line 926
;925:	}
;926:	return g_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
LABELV $488
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 16 8
line 935
;927:}
;928:
;929:
;930:/*
;931:===============
;932:G_GetBotInfoByName
;933:===============
;934:*/
;935:char *G_GetBotInfoByName( const char *name ) {
line 939
;936:	int		n;
;937:	char	*value;
;938:
;939:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $497
JUMPV
LABELV $494
line 940
;940:		value = Info_ValueForKey( g_botInfos[n], "name" );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $135
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 941
;941:		if ( !Q_stricmp( value, name ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $498
line 942
;942:			return g_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $493
JUMPV
LABELV $498
line 944
;943:		}
;944:	}
LABELV $495
line 939
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $497
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $494
line 946
;945:
;946:	return NULL;
CNSTP4 0
RETP4
LABELV $493
endproc G_GetBotInfoByName 16 8
export G_InitBots
proc G_InitBots 1148 16
line 954
;947:}
;948:
;949:/*
;950:===============
;951:G_InitBots
;952:===============
;953:*/
;954:void G_InitBots( qboolean restart ) {
line 963
;955:	int			fragLimit;
;956:	int			timeLimit;
;957:	const char	*arenainfo;
;958:	char		*strValue;
;959:	int			basedelay;
;960:	char		map[MAX_QPATH];
;961:	char		serverinfo[MAX_INFO_STRING];
;962:
;963:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 964
;964:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 966
;965:
;966:	trap_Cvar_Register( &bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO );
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $501
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 968
;967:
;968:	if( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $503
line 969
;969:		trap_GetServerinfo( serverinfo, sizeof(serverinfo) );
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 970
;970:		Q_strncpyz( map, Info_ValueForKey( serverinfo, "mapname" ), sizeof(map) );
ADDRLP4 80
ARGP4
ADDRGP4 $506
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
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 971
;971:		arenainfo = G_GetArenaInfoByMap( map );
ADDRLP4 16
ARGP4
ADDRLP4 1112
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1112
INDIRP4
ASGNP4
line 972
;972:		if ( !arenainfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $507
line 973
;973:			return;
ADDRGP4 $500
JUMPV
LABELV $507
line 976
;974:		}
;975:
;976:		strValue = Info_ValueForKey( arenainfo, "fraglimit" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $509
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1116
INDIRP4
ASGNP4
line 977
;977:		fragLimit = atoi( strValue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1120
INDIRI4
ASGNI4
line 978
;978:		if ( fragLimit ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $510
line 979
;979:			trap_Cvar_Set( "fraglimit", strValue );
ADDRGP4 $509
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 980
;980:		}
ADDRGP4 $511
JUMPV
LABELV $510
line 981
;981:		else {
line 982
;982:			trap_Cvar_Set( "fraglimit", "0" );
ADDRGP4 $509
ARGP4
ADDRGP4 $502
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 983
;983:		}
LABELV $511
line 985
;984:
;985:		strValue = Info_ValueForKey( arenainfo, "timelimit" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $512
ARGP4
ADDRLP4 1124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1124
INDIRP4
ASGNP4
line 986
;986:		timeLimit = atoi( strValue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1128
INDIRI4
ASGNI4
line 987
;987:		if ( timeLimit ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $513
line 988
;988:			trap_Cvar_Set( "timelimit", strValue );
ADDRGP4 $512
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 989
;989:		}
ADDRGP4 $514
JUMPV
LABELV $513
line 990
;990:		else {
line 991
;991:			trap_Cvar_Set( "timelimit", "0" );
ADDRGP4 $512
ARGP4
ADDRGP4 $502
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 992
;992:		}
LABELV $514
line 994
;993:
;994:		if ( !fragLimit && !timeLimit ) {
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $515
ADDRLP4 12
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $515
line 995
;995:			trap_Cvar_Set( "fraglimit", "10" );
ADDRGP4 $509
ARGP4
ADDRGP4 $517
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 996
;996:			trap_Cvar_Set( "timelimit", "0" );
ADDRGP4 $512
ARGP4
ADDRGP4 $502
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 997
;997:		}
LABELV $515
line 999
;998:
;999:		basedelay = BOT_BEGIN_DELAY_BASE;
ADDRLP4 1104
CNSTI4 2000
ASGNI4
line 1000
;1000:		strValue = Info_ValueForKey( arenainfo, "special" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $518
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1136
INDIRP4
ASGNP4
line 1001
;1001:		if( Q_stricmp( strValue, "training" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $521
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $519
line 1002
;1002:			basedelay += 10000;
ADDRLP4 1104
ADDRLP4 1104
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1003
;1003:		}
LABELV $519
line 1005
;1004:
;1005:		if( !restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $522
line 1006
;1006:			G_SpawnBots( Info_ValueForKey( arenainfo, "bots" ), basedelay );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRGP4 G_SpawnBots
CALLV
pop
line 1007
;1007:		}
LABELV $522
line 1008
;1008:	}
LABELV $503
line 1009
;1009:}
LABELV $500
endproc G_InitBots 1148 16
import podium3
import podium2
import podium1
bss
export bot_minplayers
align 4
LABELV bot_minplayers
skip 272
align 4
LABELV botSpawnQueue
skip 128
align 4
LABELV g_arenaInfos
skip 4096
export g_numArenas
align 4
LABELV g_numArenas
skip 4
align 4
LABELV g_botInfos
skip 4096
align 4
LABELV g_numBots
skip 4
import CheckPlayerPostions
import G_SendCommandToClient
import visible
import findradius
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJump
import g_GameMode
import g_instagib
import sv_fps
import g_lightningDamage
import g_truePing
import g_unlaggedVersion
import g_delagHitscan
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_DropFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_pdgrenade
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import G_ExplodeMissile
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $524
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $521
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $518
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $517
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $512
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
LABELV $509
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
LABELV $506
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $502
byte 1 48
byte 1 0
align 1
LABELV $501
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
LABELV $492
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $487
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
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
LABELV $482
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $481
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $476
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $467
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
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $449
byte 1 49
byte 1 0
align 1
LABELV $445
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $444
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 95
byte 1 99
byte 1 46
byte 1 99
byte 1 0
align 1
LABELV $437
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $430
byte 1 94
byte 1 49
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $428
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $427
byte 1 99
byte 1 108
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
LABELV $418
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 60
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 45
byte 1 53
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 93
byte 1 32
byte 1 91
byte 1 97
byte 1 108
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $415
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $407
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $398
byte 1 94
byte 1 49
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 39
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 39
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 102
byte 1 32
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
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $397
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $394
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $391
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $390
byte 1 53
byte 1 0
align 1
LABELV $387
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $386
byte 1 52
byte 1 0
align 1
LABELV $383
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $382
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $381
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $378
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $377
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $374
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $373
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $372
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $369
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $366
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $363
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $362
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $359
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $358
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $357
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $356
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $355
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $350
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $349
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $345
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $341
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $339
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $337
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $327
byte 1 94
byte 1 51
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $316
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $201
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $186
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
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $184
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $181
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $178
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $135
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $129
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $122
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $113
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $108
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
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
LABELV $107
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $102
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $101
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 0
align 1
LABELV $94
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $89
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $83
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $82
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $81
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $78
byte 1 125
byte 1 0
align 1
LABELV $75
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $69
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $66
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $65
byte 1 123
byte 1 0
