export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "../g_bot.c"
line 35
;1:// 2016 Trepidation Licensed under the GPL2 - Team Trepidation
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
CNSTI4 3492
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
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
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
CNSTI4 2564
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
CNSTI4 3492
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
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
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
CNSTI4 2564
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
CNSTI4 3492
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
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
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
CNSTI4 2564
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
CNSTI4 3492
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
CNSTI4 924
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
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
CNSTI4 2564
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
line 333
;331:		}
;332:
;333:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 334
;334:	}
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
line 335
;335:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $202
endproc G_CountHumanPlayers 16 0
export G_CountBotPlayers
proc G_CountBotPlayers 20 0
line 343
;336:}
;337:
;338:/*
;339:===============
;340:G_CountBotPlayers
;341:===============
;342:*/
;343:int G_CountBotPlayers( int team ) {
line 347
;344:	int i, n, num;
;345:	gclient_t	*cl;
;346:
;347:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 348
;348:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $217
line 349
;349:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 3492
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 350
;350:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $222
line 351
;351:			continue;
ADDRGP4 $218
JUMPV
LABELV $222
line 353
;352:		}
;353:		if ( !(g_entities[cl->ps.clientNum].r.svFlags & SVF_BOT) ) {
CNSTI4 924
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+212+220
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $224
line 354
;354:			continue;
ADDRGP4 $218
JUMPV
LABELV $224
line 357
;355:		}
;356:		
;357:		if ( team >= 0 && cl->sess.sessionTeam != team ) {
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
CNSTI4 2564
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $228
line 358
;358:			continue;
ADDRGP4 $218
JUMPV
LABELV $228
line 361
;359:		}
;360:
;361:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 362
;362:	}
LABELV $218
line 348
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
line 363
;363:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $230
line 364
;364:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $234
line 365
;365:			continue;
ADDRGP4 $231
JUMPV
LABELV $234
line 367
;366:		}
;367:		if ( botSpawnQueue[n].spawnTime > level.time ) {
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
line 368
;368:			continue;
ADDRGP4 $231
JUMPV
LABELV $237
line 370
;369:		}
;370:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 371
;371:	}
LABELV $231
line 363
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
line 372
;372:	return num;
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
proc G_CheckMinimumPlayers 40 4
line 380
;373:}
;374:
;375:/*
;376:===============
;377:G_CheckMinimumPlayers
;378:===============
;379:*/
;380:void G_CheckMinimumPlayers( void ) {
line 385
;381:	int minplayers;
;382:	int humanplayers, botplayers;
;383:	static int checkminimumplayers_time;
;384:
;385:	if (level.intermissiontime) return;
ADDRGP4 level+9140
INDIRI4
CNSTI4 0
EQI4 $243
ADDRGP4 $241
JUMPV
LABELV $243
line 387
;386:	//only check once each 10 seconds
;387:	if (checkminimumplayers_time > level.time - 10000) {
ADDRGP4 $242
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $246
line 388
;388:		return;
ADDRGP4 $241
JUMPV
LABELV $246
line 390
;389:	}
;390:	checkminimumplayers_time = level.time;
ADDRGP4 $242
ADDRGP4 level+32
INDIRI4
ASGNI4
line 391
;391:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 392
;392:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 393
;393:	if (minplayers <= 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $251
ADDRGP4 $241
JUMPV
LABELV $251
line 396
;394:
;395:	// Arsenal 
;396:	if ((g_GameMode.integer == 1) && (level.firstStrike == qtrue)) 
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 g_GameMode+12
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $253
ADDRGP4 level+9236
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $253
line 397
;397:	{
line 398
;398:		return; 
ADDRGP4 $241
JUMPV
LABELV $253
line 401
;399:	}
;400:	// LMS?
;401:	if ((g_GameMode.integer == 2) && (level.firstStrike == qtrue)) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 2
NEI4 $257
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $257
line 402
;402:	{
line 403
;403:		return; 
ADDRGP4 $241
JUMPV
LABELV $257
line 407
;404:	}
;405:
;406:	// Freeze
;407:	if ((g_GameMode.integer == 5) && (level.firstStrike == qtrue)) 
ADDRGP4 g_GameMode+12
INDIRI4
CNSTI4 5
NEI4 $261
ADDRGP4 level+9236
INDIRI4
CNSTI4 1
NEI4 $261
line 408
;408:	{
line 409
;409:		return; 
ADDRGP4 $241
JUMPV
LABELV $261
line 415
;410:	}
;411:
;412:
;413:	///////////////////////
;414:
;415:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $265
line 416
;416:		if (minplayers >= g_maxclients.integer / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
LTI4 $268
line 417
;417:			minplayers = (g_maxclients.integer / 2) -1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 418
;418:		}
LABELV $268
line 420
;419:
;420:		humanplayers = G_CountHumanPlayers( TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 421
;421:		botplayers = G_CountBotPlayers(	TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 423
;422:		//
;423:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $272
line 424
;424:			G_AddRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 425
;425:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $273
JUMPV
LABELV $272
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $274
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $274
line 426
;426:			G_RemoveRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 427
;427:		}
LABELV $274
LABELV $273
line 429
;428:		//
;429:		humanplayers = G_CountHumanPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 430
;430:		botplayers = G_CountBotPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 32
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 432
;431:		//
;432:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $276
line 433
;433:			G_AddRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 434
;434:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $266
JUMPV
LABELV $276
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $266
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $266
line 435
;435:			G_RemoveRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 436
;436:		}
line 437
;437:	}
ADDRGP4 $266
JUMPV
LABELV $265
line 438
;438:	else if (g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $280
line 439
;439:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $283
line 440
;440:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 441
;441:		}
LABELV $283
line 442
;442:		humanplayers = G_CountHumanPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 443
;443:		botplayers = G_CountBotPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 20
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 445
;444:		//
;445:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $287
line 446
;446:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 447
;447:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $281
JUMPV
LABELV $287
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $281
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $281
line 449
;448:			// try to remove spectators first
;449:			if (!G_RemoveRandomBot( TEAM_SPECTATOR )) {
CNSTI4 3
ARGI4
ADDRLP4 28
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $281
line 451
;450:				// just remove the bot that is playing
;451:				G_RemoveRandomBot( -1 );
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 452
;452:			}
line 453
;453:		}
line 454
;454:	}
ADDRGP4 $281
JUMPV
LABELV $280
line 455
;455:	else if (g_gametype.integer == GT_FFA) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $293
line 458
;456:
;457:
;458:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $296
line 459
;459:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 460
;460:		}
LABELV $296
line 462
;461:		
;462:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 463
;463:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 465
;464:		// count spectator bots on arsenal and survival - shafe trep
;465:		botplayers = botplayers + G_CountBotPlayers( TEAM_SPECTATOR );
CNSTI4 3
ARGI4
ADDRLP4 24
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 468
;466:
;467:		//
;468:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $300
line 469
;469:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 470
;470:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $301
JUMPV
LABELV $300
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $302
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $302
line 471
;471:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 472
;472:		}
LABELV $302
LABELV $301
line 473
;473:	}
LABELV $293
LABELV $281
LABELV $266
line 475
;474:
;475:}
LABELV $241
endproc G_CheckMinimumPlayers 40 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 1032 12
line 482
;476:
;477:/*
;478:===============
;479:G_CheckBotSpawn
;480:===============
;481:*/
;482:void G_CheckBotSpawn( void ) {
line 486
;483:	int		n;
;484:	char	userinfo[MAX_INFO_VALUE];
;485:
;486:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 488
;487:
;488:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $305
line 489
;489:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $309
line 490
;490:			continue;
ADDRGP4 $306
JUMPV
LABELV $309
line 492
;491:		}
;492:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $312
line 493
;493:			continue;
ADDRGP4 $306
JUMPV
LABELV $312
line 495
;494:		}
;495:		ClientBegin( botSpawnQueue[n].clientNum );
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
line 496
;496:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 498
;497:
;498:		if( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $317
line 499
;499:			trap_GetUserinfo( botSpawnQueue[n].clientNum, userinfo, sizeof(userinfo) );
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
line 500
;500:			PlayerIntroSound( Info_ValueForKey (userinfo, "model") );
ADDRLP4 4
ARGP4
ADDRGP4 $320
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
line 501
;501:		}
LABELV $317
line 502
;502:	}
LABELV $306
line 488
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $305
line 503
;503:}
LABELV $304
endproc G_CheckBotSpawn 1032 12
proc AddBotToSpawnQueue 4 4
line 511
;504:
;505:
;506:/*
;507:===============
;508:AddBotToSpawnQueue
;509:===============
;510:*/
;511:static void AddBotToSpawnQueue( int clientNum, int delay ) {
line 514
;512:	int		n;
;513:
;514:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $322
line 515
;515:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
line 516
;516:			botSpawnQueue[n].spawnTime = level.time + delay;
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
line 517
;517:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 518
;518:			return;
ADDRGP4 $321
JUMPV
LABELV $326
line 520
;519:		}
;520:	}
LABELV $323
line 514
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $322
line 522
;521:
;522:	G_Printf( S_COLOR_YELLOW "Unable to delay spawn\n" );
ADDRGP4 $331
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 523
;523:	ClientBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 524
;524:}
LABELV $321
endproc AddBotToSpawnQueue 4 4
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 536
;525:
;526:
;527:/*
;528:===============
;529:G_RemoveQueuedBotBegin
;530:
;531:Called on client disconnect to make sure the delayed spawn
;532:doesn't happen on a freed index
;533:===============
;534:*/
;535:// Recursion Bug Here???  where the fuck is this bug
;536:void G_RemoveQueuedBotBegin( int clientNum ) {
line 539
;537:	int		n;
;538:
;539:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $333
line 540
;540:		if( botSpawnQueue[n].clientNum == clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $337
line 541
;541:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 542
;542:			return;
ADDRGP4 $332
JUMPV
LABELV $337
line 544
;543:		}
;544:	}
LABELV $334
line 539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $333
line 545
;545:}
LABELV $332
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 1336 12
line 553
;546:
;547:
;548:/*
;549:===============
;550:G_BotConnect
;551:===============
;552:*/
;553:qboolean G_BotConnect( int clientNum, qboolean restart ) {
line 557
;554:	bot_settings_t	settings;
;555:	char			userinfo[MAX_INFO_STRING];
;556:
;557:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
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
line 559
;558:
;559:	Q_strncpyz( settings.characterfile, Info_ValueForKey( userinfo, "characterfile" ), sizeof(settings.characterfile) );
ADDRLP4 292
ARGP4
ADDRGP4 $341
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
line 560
;560:	settings.skill = atof( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 292
ARGP4
ADDRGP4 $343
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
line 561
;561:	Q_strncpyz( settings.team, Info_ValueForKey( userinfo, "team" ), sizeof(settings.team) );
ADDRLP4 292
ARGP4
ADDRGP4 $345
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
line 563
;562:
;563:	if (!BotAISetupClient( clientNum, &settings, restart )) {
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
NEI4 $347
line 564
;564:		trap_DropClient( clientNum, "BotAISetupClient failed" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $349
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 565
;565:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $340
JUMPV
LABELV $347
line 568
;566:	}
;567:
;568:	return qtrue;
CNSTI4 1
RETI4
LABELV $340
endproc G_BotConnect 1336 12
proc G_AddBot 1136 12
line 577
;569:}
;570:
;571:
;572:/*
;573:===============
;574:G_AddBot
;575:===============
;576:*/
;577:static void G_AddBot( const char *name, float skill, const char *team, int delay, char *altname) {
line 589
;578:	int				clientNum;
;579:	char			*botinfo;
;580:	gentity_t		*bot;
;581:	char			*key;
;582:	char			*s;
;583:	char			*botname;
;584:	char			*model;
;585:	char			*headmodel;
;586:	char			userinfo[MAX_INFO_STRING];
;587:
;588:	// get the botinfo from bots.txt
;589:	botinfo = G_GetBotInfoByName( name );
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
line 590
;590:	if ( !botinfo ) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
line 591
;591:		G_Printf( S_COLOR_RED "Error: Bot '%s' not defined\n", name );
ADDRGP4 $353
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 592
;592:		return;
ADDRGP4 $350
JUMPV
LABELV $351
line 596
;593:	}
;594:
;595:	// create the bot's userinfo
;596:	userinfo[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 598
;597:
;598:	botname = Info_ValueForKey( botinfo, "funname" );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1060
INDIRP4
ASGNP4
line 599
;599:	if( !botname[0] ) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $355
line 600
;600:		botname = Info_ValueForKey( botinfo, "name" );
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
line 601
;601:	}
LABELV $355
line 603
;602:	// check for an alternative name
;603:	if (altname && altname[0]) {
ADDRLP4 1064
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $357
ADDRLP4 1064
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $357
line 604
;604:		botname = altname;
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
line 605
;605:	}
LABELV $357
line 606
;606:	Info_SetValueForKey( userinfo, "name", botname );
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
line 607
;607:	Info_SetValueForKey( userinfo, "rate", "25000" );
ADDRLP4 4
ARGP4
ADDRGP4 $359
ARGP4
ADDRGP4 $360
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 608
;608:	Info_SetValueForKey( userinfo, "snaps", "20" );
ADDRLP4 4
ARGP4
ADDRGP4 $361
ARGP4
ADDRGP4 $362
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 609
;609:	Info_SetValueForKey( userinfo, "skill", va("%1.2f", skill) );
ADDRGP4 $363
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
ADDRGP4 $343
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 611
;610:
;611:	if ( skill >= 1 && skill < 2 ) {
ADDRLP4 1072
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1072
INDIRF4
CNSTF4 1065353216
LTF4 $364
ADDRLP4 1072
INDIRF4
CNSTF4 1073741824
GEF4 $364
line 612
;612:		Info_SetValueForKey( userinfo, "handicap", "50" );
ADDRLP4 4
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $367
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 613
;613:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 614
;614:	else if ( skill >= 2 && skill < 3 ) {
ADDRLP4 1076
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1076
INDIRF4
CNSTF4 1073741824
LTF4 $368
ADDRLP4 1076
INDIRF4
CNSTF4 1077936128
GEF4 $368
line 615
;615:		Info_SetValueForKey( userinfo, "handicap", "70" );
ADDRLP4 4
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 616
;616:	}
ADDRGP4 $369
JUMPV
LABELV $368
line 617
;617:	else if ( skill >= 3 && skill < 4 ) {
ADDRLP4 1080
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1080
INDIRF4
CNSTF4 1077936128
LTF4 $371
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
GEF4 $371
line 618
;618:		Info_SetValueForKey( userinfo, "handicap", "90" );
ADDRLP4 4
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 $373
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 619
;619:	}
LABELV $371
LABELV $369
LABELV $365
line 621
;620:
;621:	key = "model";
ADDRLP4 0
ADDRGP4 $320
ASGNP4
line 622
;622:	model = Info_ValueForKey( botinfo, key );
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
line 623
;623:	if ( !*model ) {
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $374
line 624
;624:		model = "visor/default";
ADDRLP4 1040
ADDRGP4 $376
ASGNP4
line 625
;625:	}
LABELV $374
line 626
;626:	Info_SetValueForKey( userinfo, key, model );
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
line 627
;627:	key = "team_model";
ADDRLP4 0
ADDRGP4 $377
ASGNP4
line 628
;628:	Info_SetValueForKey( userinfo, key, model );
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
line 630
;629:
;630:	key = "headmodel";
ADDRLP4 0
ADDRGP4 $378
ASGNP4
line 631
;631:	headmodel = Info_ValueForKey( botinfo, key );
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
line 632
;632:	if ( !*headmodel ) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $379
line 633
;633:		headmodel = model;
ADDRLP4 1044
ADDRLP4 1040
INDIRP4
ASGNP4
line 634
;634:	}
LABELV $379
line 635
;635:	Info_SetValueForKey( userinfo, key, headmodel );
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
line 636
;636:	key = "team_headmodel";
ADDRLP4 0
ADDRGP4 $381
ASGNP4
line 637
;637:	Info_SetValueForKey( userinfo, key, headmodel );
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
line 639
;638:
;639:	key = "gender";
ADDRLP4 0
ADDRGP4 $382
ASGNP4
line 640
;640:	s = Info_ValueForKey( botinfo, key );
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
line 641
;641:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $383
line 642
;642:		s = "male";
ADDRLP4 1028
ADDRGP4 $385
ASGNP4
line 643
;643:	}
LABELV $383
line 644
;644:	Info_SetValueForKey( userinfo, "sex", s );
ADDRLP4 4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 646
;645:
;646:	key = "color1";
ADDRLP4 0
ADDRGP4 $387
ASGNP4
line 647
;647:	s = Info_ValueForKey( botinfo, key );
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
line 648
;648:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $388
line 649
;649:		s = "4";
ADDRLP4 1028
ADDRGP4 $390
ASGNP4
line 650
;650:	}
LABELV $388
line 651
;651:	Info_SetValueForKey( userinfo, key, s );
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
line 653
;652:
;653:	key = "color2";
ADDRLP4 0
ADDRGP4 $391
ASGNP4
line 654
;654:	s = Info_ValueForKey( botinfo, key );
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
line 655
;655:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $392
line 656
;656:		s = "5";
ADDRLP4 1028
ADDRGP4 $394
ASGNP4
line 657
;657:	}
LABELV $392
line 658
;658:	Info_SetValueForKey( userinfo, key, s );
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
line 660
;659:
;660:	s = Info_ValueForKey(botinfo, "aifile");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 1104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1104
INDIRP4
ASGNP4
line 661
;661:	if (!*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $396
line 662
;662:		trap_Printf( S_COLOR_RED "Error: bot has no aifile specified\n" );
ADDRGP4 $398
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 663
;663:		return;
ADDRGP4 $350
JUMPV
LABELV $396
line 667
;664:	}
;665:
;666:	// have the server allocate a client slot
;667:	clientNum = trap_BotAllocateClient();
ADDRLP4 1108
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1108
INDIRI4
ASGNI4
line 668
;668:	if ( clientNum == -1 ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $399
line 669
;669:		G_Printf( S_COLOR_RED "Unable to add bot.  All player slots are in use.\n" );
ADDRGP4 $401
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 670
;670:		G_Printf( S_COLOR_RED "Start server with more 'open' slots (or check setting of sv_maxclients cvar).\n" );
ADDRGP4 $402
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 671
;671:		return;
ADDRGP4 $350
JUMPV
LABELV $399
line 675
;672:	}
;673:
;674:	// initialize the bot settings
;675:	if( !team || !*team ) {
ADDRLP4 1112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $405
ADDRLP4 1112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $403
LABELV $405
line 676
;676:		if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $406
line 677
;677:			if( PickTeam(clientNum) == TEAM_RED) {
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
NEI4 $409
line 678
;678:				team = "red";
ADDRFP4 8
ADDRGP4 $181
ASGNP4
line 679
;679:			}
ADDRGP4 $407
JUMPV
LABELV $409
line 680
;680:			else {
line 681
;681:				team = "blue";
ADDRFP4 8
ADDRGP4 $184
ASGNP4
line 682
;682:			}
line 683
;683:		}
ADDRGP4 $407
JUMPV
LABELV $406
line 684
;684:		else {
line 685
;685:			team = "red";
ADDRFP4 8
ADDRGP4 $181
ASGNP4
line 686
;686:		}
LABELV $407
line 687
;687:	}
LABELV $403
line 688
;688:	Info_SetValueForKey( userinfo, "characterfile", Info_ValueForKey( botinfo, "aifile" ) );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 689
;689:	Info_SetValueForKey( userinfo, "skill", va( "%5.2f", skill ) );
ADDRGP4 $411
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
ADDRGP4 $343
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 690
;690:	Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 4
ARGP4
ADDRGP4 $345
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 692
;691:
;692:	bot = &g_entities[ clientNum ];
ADDRLP4 1052
CNSTI4 924
ADDRLP4 1036
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 693
;693:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1124
ADDRLP4 1052
INDIRP4
CNSTI4 432
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
line 694
;694:	bot->inuse = qtrue;
ADDRLP4 1052
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 697
;695:
;696:	// register the userinfo
;697:	trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 700
;698:
;699:	// have it connect to the game as a normal client
;700:	if ( ClientConnect( clientNum, qtrue, qtrue ) ) {
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
EQU4 $412
line 701
;701:		return;
ADDRGP4 $350
JUMPV
LABELV $412
line 704
;702:	}
;703:
;704:	if( delay == 0 ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $414
line 705
;705:		ClientBegin( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 706
;706:		return;
ADDRGP4 $350
JUMPV
LABELV $414
line 709
;707:	}
;708:
;709:	AddBotToSpawnQueue( clientNum, delay );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 710
;710:}
LABELV $350
endproc G_AddBot 1136 12
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 4112 20
line 718
;711:
;712:
;713:/*
;714:===============
;715:Svcmd_AddBot_f
;716:===============
;717:*/
;718:void Svcmd_AddBot_f( void ) {
line 727
;719:	float			skill;
;720:	int				delay;
;721:	char			name[MAX_TOKEN_CHARS];
;722:	char			altname[MAX_TOKEN_CHARS];
;723:	char			string[MAX_TOKEN_CHARS];
;724:	char			team[MAX_TOKEN_CHARS];
;725:
;726:	// are bots enabled?
;727:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $419
ARGP4
ADDRLP4 4104
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $417
line 728
;728:		return;
ADDRGP4 $416
JUMPV
LABELV $417
line 732
;729:	}
;730:
;731:	// name
;732:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 733
;733:	if ( !name[0] ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $420
line 734
;734:		trap_Printf( "Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n" );
ADDRGP4 $422
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 735
;735:		return;
ADDRGP4 $416
JUMPV
LABELV $420
line 739
;736:	}
;737:
;738:	// skill
;739:	trap_Argv( 2, string, sizeof( string ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 740
;740:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $423
line 741
;741:		skill = 4;
ADDRLP4 4096
CNSTF4 1082130432
ASGNF4
line 742
;742:	}
ADDRGP4 $424
JUMPV
LABELV $423
line 743
;743:	else {
line 744
;744:		skill = atof( string );
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
line 745
;745:	}
LABELV $424
line 748
;746:
;747:	// team
;748:	trap_Argv( 3, team, sizeof( team ) );
CNSTI4 3
ARGI4
ADDRLP4 3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 751
;749:
;750:	// delay
;751:	trap_Argv( 4, string, sizeof( string ) );
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 752
;752:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $425
line 753
;753:		delay = 0;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 754
;754:	}
ADDRGP4 $426
JUMPV
LABELV $425
line 755
;755:	else {
line 756
;756:		delay = atoi( string );
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
line 757
;757:	}
LABELV $426
line 760
;758:
;759:	// alternative name
;760:	trap_Argv( 5, altname, sizeof( altname ) );
CNSTI4 5
ARGI4
ADDRLP4 2048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 762
;761:
;762:	G_AddBot( name, skill, team, delay, altname );
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
line 766
;763:
;764:	// if this was issued during gameplay and we are playing locally,
;765:	// go ahead and load the bot's media immediately
;766:	if ( level.time - level.startTime > 1000 &&
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $427
ADDRGP4 $431
ARGP4
ADDRLP4 4108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4108
INDIRI4
CNSTI4 0
EQI4 $427
line 767
;767:		trap_Cvar_VariableIntegerValue( "cl_running" ) ) {
line 768
;768:		trap_SendServerCommand( -1, "loaddefered\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $432
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 769
;769:	}
LABELV $427
line 770
;770:}
LABELV $416
endproc Svcmd_AddBot_f 4112 20
export Svcmd_BotList_f
proc Svcmd_BotList_f 4120 20
line 777
;771:
;772:/*
;773:===============
;774:Svcmd_BotList_f
;775:===============
;776:*/
;777:void Svcmd_BotList_f( void ) {
line 784
;778:	int i;
;779:	char name[MAX_TOKEN_CHARS];
;780:	char funname[MAX_TOKEN_CHARS];
;781:	char model[MAX_TOKEN_CHARS];
;782:	char aifile[MAX_TOKEN_CHARS];
;783:
;784:	trap_Printf("^1name             model            aifile              funname\n");
ADDRGP4 $434
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 785
;785:	for (i = 0; i < g_numBots; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $438
JUMPV
LABELV $435
line 786
;786:		strcpy(name, Info_ValueForKey( g_botInfos[i], "name" ));
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
line 787
;787:		if ( !*name ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $439
line 788
;788:			strcpy(name, "UnnamedPlayer");
ADDRLP4 4
ARGP4
ADDRGP4 $441
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 789
;789:		}
LABELV $439
line 790
;790:		strcpy(funname, Info_ValueForKey( g_botInfos[i], "funname" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $354
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
line 791
;791:		if ( !*funname ) {
ADDRLP4 1028
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $442
line 792
;792:			strcpy(funname, "");
ADDRLP4 1028
ARGP4
ADDRGP4 $95
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 793
;793:		}
LABELV $442
line 794
;794:		strcpy(model, Info_ValueForKey( g_botInfos[i], "model" ));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $320
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
line 795
;795:		if ( !*model ) {
ADDRLP4 2052
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $444
line 796
;796:			strcpy(model, "visor/default");
ADDRLP4 2052
ARGP4
ADDRGP4 $376
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 797
;797:		}
LABELV $444
line 798
;798:		strcpy(aifile, Info_ValueForKey( g_botInfos[i], "aifile"));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $395
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
line 799
;799:		if (!*aifile ) {
ADDRLP4 3076
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $446
line 800
;800:			strcpy(aifile, "bots/default_c.c");
ADDRLP4 3076
ARGP4
ADDRGP4 $448
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 801
;801:		}
LABELV $446
line 802
;802:		trap_Printf(va("%-16s %-16s %-20s %-20s\n", name, model, aifile, funname));
ADDRGP4 $449
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
line 803
;803:	}
LABELV $436
line 785
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $438
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $435
line 804
;804:}
LABELV $433
endproc Svcmd_BotList_f 4120 20
proc G_SpawnBots 1056 16
line 812
;805:
;806:
;807:/*
;808:===============
;809:G_SpawnBots
;810:===============
;811:*/
;812:static void G_SpawnBots( char *botList, int baseDelay ) {
line 819
;813:	char		*bot;
;814:	char		*p;
;815:	float		skill;
;816:	int			delay;
;817:	char		bots[MAX_INFO_VALUE];
;818:
;819:	podium1 = NULL;
ADDRGP4 podium1
CNSTP4 0
ASGNP4
line 820
;820:	podium2 = NULL;
ADDRGP4 podium2
CNSTP4 0
ASGNP4
line 821
;821:	podium3 = NULL;
ADDRGP4 podium3
CNSTP4 0
ASGNP4
line 823
;822:
;823:	skill = trap_Cvar_VariableValue( "g_spSkill" );
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
line 824
;824:	if( skill < 1 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $451
line 825
;825:		trap_Cvar_Set( "g_spSkill", "1" );
ADDRGP4 $178
ARGP4
ADDRGP4 $453
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 826
;826:		skill = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 827
;827:	}
ADDRGP4 $452
JUMPV
LABELV $451
line 828
;828:	else if ( skill > 5 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
LEF4 $454
line 829
;829:		trap_Cvar_Set( "g_spSkill", "5" );
ADDRGP4 $178
ARGP4
ADDRGP4 $394
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 830
;830:		skill = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
line 831
;831:	}
LABELV $454
LABELV $452
line 833
;832:
;833:	Q_strncpyz( bots, botList, sizeof(bots) );
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
line 834
;834:	p = &bots[0];
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 835
;835:	delay = baseDelay;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $457
JUMPV
line 836
;836:	while( *p ) {
LABELV $459
line 838
;837:		//skip spaces
;838:		while( *p && *p == ' ' ) {
line 839
;839:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 840
;840:		}
LABELV $460
line 838
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $462
ADDRLP4 1044
INDIRI4
CNSTI4 32
EQI4 $459
LABELV $462
line 841
;841:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $463
line 842
;842:			break;
ADDRGP4 $458
JUMPV
LABELV $463
line 846
;843:		}
;844:
;845:		// mark start of bot name
;846:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $466
JUMPV
LABELV $465
line 849
;847:
;848:		// skip until space of null
;849:		while( *p && *p != ' ' ) {
line 850
;850:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 851
;851:		}
LABELV $466
line 849
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $468
ADDRLP4 1048
INDIRI4
CNSTI4 32
NEI4 $465
LABELV $468
line 852
;852:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $469
line 853
;853:			*p++ = 0;
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
line 854
;854:		}
LABELV $469
line 858
;855:
;856:		// we must add the bot this way, calling G_AddBot directly at this stage
;857:		// does "Bad Things"
;858:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay) );
ADDRGP4 $471
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
line 860
;859:
;860:		delay += BOT_BEGIN_DELAY_INCREMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 861
;861:	}
LABELV $457
line 836
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $460
LABELV $458
line 862
;862:}
LABELV $450
endproc G_SpawnBots 1056 16
proc G_LoadBotsFromFile 8216 16
line 870
;863:
;864:
;865:/*
;866:===============
;867:G_LoadBotsFromFile
;868:===============
;869:*/
;870:static void G_LoadBotsFromFile( char *filename ) {
line 875
;871:	int				len;
;872:	fileHandle_t	f;
;873:	char			buf[MAX_BOTS_TEXT];
;874:
;875:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
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
line 876
;876:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $473
line 877
;877:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
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
line 878
;878:		return;
ADDRGP4 $472
JUMPV
LABELV $473
line 880
;879:	}
;880:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $475
line 881
;881:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
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
line 882
;882:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 883
;883:		return;
ADDRGP4 $472
JUMPV
LABELV $475
line 886
;884:	}
;885:
;886:	trap_FS_Read( buf, len, f );
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
line 887
;887:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 888
;888:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 890
;889:
;890:	g_numBots += G_ParseInfos( buf, MAX_BOTS - g_numBots, &g_botInfos[g_numBots] );
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
line 891
;891:}
LABELV $472
endproc G_LoadBotsFromFile 8216 16
proc G_LoadBots 1456 16
line 898
;892:
;893:/*
;894:===============
;895:G_LoadBots
;896:===============
;897:*/
;898:static void G_LoadBots( void ) {
line 907
;899:	vmCvar_t	botsFile;
;900:	int			numdirs;
;901:	char		filename[128];
;902:	char		dirlist[1024];
;903:	char*		dirptr;
;904:	int			i;
;905:	int			dirlen;
;906:
;907:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $419
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $478
line 908
;908:		return;
ADDRGP4 $477
JUMPV
LABELV $478
line 911
;909:	}
;910:
;911:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 913
;912:
;913:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 $95
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 914
;914:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $481
line 915
;915:		G_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 916
;916:	}
ADDRGP4 $482
JUMPV
LABELV $481
line 917
;917:	else {
line 918
;918:		G_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $485
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 919
;919:	}
LABELV $482
line 922
;920:
;921:	// get all bots from .bot files
;922:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $101
ARGP4
ADDRGP4 $486
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
line 923
;923:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 416
ASGNP4
line 924
;924:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $490
JUMPV
LABELV $487
line 925
;925:		dirlen = strlen(dirptr);
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
line 926
;926:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $107
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 927
;927:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 928
;928:		G_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 929
;929:	}
LABELV $488
line 924
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
LABELV $490
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $487
line 930
;930:	trap_Printf( va( "%i bots parsed\n", g_numBots ) );
ADDRGP4 $491
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
line 931
;931:}
LABELV $477
endproc G_LoadBots 1456 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 940
;932:
;933:
;934:
;935:/*
;936:===============
;937:G_GetBotInfoByNumber
;938:===============
;939:*/
;940:char *G_GetBotInfoByNumber( int num ) {
line 941
;941:	if( num < 0 || num >= g_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $495
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $493
LABELV $495
line 942
;942:		trap_Printf( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $496
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
line 943
;943:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $492
JUMPV
LABELV $493
line 945
;944:	}
;945:	return g_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
LABELV $492
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 16 8
line 954
;946:}
;947:
;948:
;949:/*
;950:===============
;951:G_GetBotInfoByName
;952:===============
;953:*/
;954:char *G_GetBotInfoByName( const char *name ) {
line 958
;955:	int		n;
;956:	char	*value;
;957:
;958:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $501
JUMPV
LABELV $498
line 959
;959:		value = Info_ValueForKey( g_botInfos[n], "name" );
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
line 960
;960:		if ( !Q_stricmp( value, name ) ) {
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
NEI4 $502
line 961
;961:			return g_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $497
JUMPV
LABELV $502
line 963
;962:		}
;963:	}
LABELV $499
line 958
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $501
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $498
line 965
;964:
;965:	return NULL;
CNSTP4 0
RETP4
LABELV $497
endproc G_GetBotInfoByName 16 8
export G_InitBots
proc G_InitBots 1148 16
line 973
;966:}
;967:
;968:/*
;969:===============
;970:G_InitBots
;971:===============
;972:*/
;973:void G_InitBots( qboolean restart ) {
line 982
;974:	int			fragLimit;
;975:	int			timeLimit;
;976:	const char	*arenainfo;
;977:	char		*strValue;
;978:	int			basedelay;
;979:	char		map[MAX_QPATH];
;980:	char		serverinfo[MAX_INFO_STRING];
;981:
;982:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 983
;983:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 985
;984:
;985:	trap_Cvar_Register( &bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO );
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $505
ARGP4
ADDRGP4 $506
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 987
;986:
;987:	if( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $507
line 988
;988:		trap_GetServerinfo( serverinfo, sizeof(serverinfo) );
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 989
;989:		Q_strncpyz( map, Info_ValueForKey( serverinfo, "mapname" ), sizeof(map) );
ADDRLP4 80
ARGP4
ADDRGP4 $510
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
line 990
;990:		arenainfo = G_GetArenaInfoByMap( map );
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
line 991
;991:		if ( !arenainfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $511
line 992
;992:			return;
ADDRGP4 $504
JUMPV
LABELV $511
line 995
;993:		}
;994:
;995:		strValue = Info_ValueForKey( arenainfo, "fraglimit" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $513
ARGP4
ADDRLP4 1116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1116
INDIRP4
ASGNP4
line 996
;996:		fragLimit = atoi( strValue );
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
line 997
;997:		if ( fragLimit ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $514
line 998
;998:			trap_Cvar_Set( "fraglimit", strValue );
ADDRGP4 $513
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 999
;999:		}
ADDRGP4 $515
JUMPV
LABELV $514
line 1000
;1000:		else {
line 1001
;1001:			trap_Cvar_Set( "fraglimit", "0" );
ADDRGP4 $513
ARGP4
ADDRGP4 $506
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1002
;1002:		}
LABELV $515
line 1004
;1003:
;1004:		strValue = Info_ValueForKey( arenainfo, "timelimit" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 1124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1124
INDIRP4
ASGNP4
line 1005
;1005:		timeLimit = atoi( strValue );
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
line 1006
;1006:		if ( timeLimit ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $517
line 1007
;1007:			trap_Cvar_Set( "timelimit", strValue );
ADDRGP4 $516
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1008
;1008:		}
ADDRGP4 $518
JUMPV
LABELV $517
line 1009
;1009:		else {
line 1010
;1010:			trap_Cvar_Set( "timelimit", "0" );
ADDRGP4 $516
ARGP4
ADDRGP4 $506
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1011
;1011:		}
LABELV $518
line 1013
;1012:
;1013:		if ( !fragLimit && !timeLimit ) {
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $519
ADDRLP4 12
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $519
line 1014
;1014:			trap_Cvar_Set( "fraglimit", "10" );
ADDRGP4 $513
ARGP4
ADDRGP4 $521
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1015
;1015:			trap_Cvar_Set( "timelimit", "0" );
ADDRGP4 $516
ARGP4
ADDRGP4 $506
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1016
;1016:		}
LABELV $519
line 1018
;1017:
;1018:		basedelay = BOT_BEGIN_DELAY_BASE;
ADDRLP4 1104
CNSTI4 2000
ASGNI4
line 1019
;1019:		strValue = Info_ValueForKey( arenainfo, "special" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1136
INDIRP4
ASGNP4
line 1020
;1020:		if( Q_stricmp( strValue, "training" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $525
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $523
line 1021
;1021:			basedelay += 10000;
ADDRLP4 1104
ADDRLP4 1104
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1022
;1022:		}
LABELV $523
line 1024
;1023:
;1024:		if( !restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $526
line 1025
;1025:			G_SpawnBots( Info_ValueForKey( arenainfo, "bots" ), basedelay );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $528
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
line 1026
;1026:		}
LABELV $526
line 1027
;1027:	}
LABELV $507
line 1028
;1028:}
LABELV $504
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
import trap_AAS_AreaLadder
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
import trep_debug
import g_allowDevastator
import g_allowGrapple
import g_CurrentRound
import g_NumRounds
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_easymap
import g_mapfile
import g_ReverseCTF
import g_GaussRate
import g_GaussSelfDamage
import g_GaussKnockBack
import g_GaussJump
import g_PCTeamkills
import g_GrappleMode
import g_MaxTurrets
import g_Turrets
import g_StartRandom
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_RedMC
import g_BlueMC
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
import Team_Point
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
import fire_flamer
import FireWeapon2
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import PlaceMC
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
import BalanceTeams
import TeamCount
import BuildDisplacer
import BuildMC
import BuildGenerator
import BuildTurret
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
import G_BreakGlass
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_mg
import fire_turret
import fire_alt_gata
import fire_grapple
import fire_bfg
import fire_rocket
import fire_flame
import fire_alt_rocket
import fire_altgrenade
import fire_bomb
import fire_pdgrenade
import fire_grenade
import fire_plasma2
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
import G_ExplodeBomb
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
LABELV $528
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $525
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
LABELV $522
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $521
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $516
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
LABELV $513
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
LABELV $510
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $506
byte 1 48
byte 1 0
align 1
LABELV $505
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
LABELV $496
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
LABELV $491
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
LABELV $486
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $485
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
LABELV $480
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
LABELV $471
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
LABELV $453
byte 1 49
byte 1 0
align 1
LABELV $449
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
LABELV $448
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
LABELV $441
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
LABELV $434
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
LABELV $432
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
LABELV $431
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
LABELV $422
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
LABELV $419
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
LABELV $411
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $402
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
LABELV $401
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
LABELV $398
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
LABELV $395
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $394
byte 1 53
byte 1 0
align 1
LABELV $391
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $390
byte 1 52
byte 1 0
align 1
LABELV $387
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $386
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $385
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $382
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $381
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
LABELV $378
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
LABELV $377
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
LABELV $376
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
LABELV $373
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $370
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $367
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $366
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
LABELV $363
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $362
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $361
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $360
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $359
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $354
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $353
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
LABELV $349
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
LABELV $345
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $343
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $341
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
LABELV $331
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
LABELV $320
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
