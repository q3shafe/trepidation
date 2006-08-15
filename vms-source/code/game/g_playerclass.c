// Trepidation
// Player Classes

// g_playerclass.c

#include "g_local.h"


int			g_numClasses;
static char		*g_classInfos[MAX_ARENAS];

/*
float trap_Cvar_VariableValue( const char *var_name ) {
	char buf[128];

	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
	return atof(buf);
}

*/

/*
===============
G_ParseClassInfos
===============
*/
int G_ParseClassInfos( char *buf, int max, char *infos[] ) {
	char	*token;
	int		count;
	char	key[MAX_TOKEN_CHARS];
	char	info[MAX_INFO_STRING];

	count = 0;

	while ( 1 ) {
		token = COM_Parse( &buf );
		if ( !token[0] ) {
			break;
		}
		if ( strcmp( token, "{" ) ) {
			Com_Printf( "Missing { in info file\n" );
			break;
		}

		if ( count == max ) {
			Com_Printf( "Max infos exceeded\n" );
			break;
		}

		info[0] = '\0';
		while ( 1 ) {
			token = COM_ParseExt( &buf, qtrue );
			if ( !token[0] ) {
				Com_Printf( "Unexpected end of info file\n" );
				break;
			}
			if ( !strcmp( token, "}" ) ) {
				break;
			}
			Q_strncpyz( key, token, sizeof( key ) );

			token = COM_ParseExt( &buf, qfalse );
			if ( !token[0] ) {
				strcpy( token, "<NULL>" );
			}
			Info_SetValueForKey( info, key, token );
		}
		//NOTE: extra space for class number
		infos[count] = G_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
		if (infos[count]) {
			strcpy(infos[count], info);
			count++;
		}
	}
	return count;
}

/*
===============
G_LoadClassesFromFile
===============
*/
static void G_LoadClassesFromFile( char *filename ) {
	int				len;
	fileHandle_t	f;
	char			buf[MAX_CLASSES_TEXT];

	len = trap_FS_FOpenFile( filename, &f, FS_READ );
	if ( !f ) {
		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
		return;
	}
	if ( len >= MAX_ARENAS_TEXT ) {
		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_CLASSES_TEXT ) );
		trap_FS_FCloseFile( f );
		return;
	}

	trap_FS_Read( buf, len, f );
	buf[len] = 0;
	trap_FS_FCloseFile( f );

	g_numClasses += G_ParseClassInfos( buf, MAX_CLASSES - g_numClasses, &g_classInfos[g_numClasses] );
}

/*
===============
G_LoadClasses
===============
*/
static void G_LoadClasses( void ) {
	int			numdirs;
	vmCvar_t	classesFile;
	char		filename[128];
	char		dirlist[1024];
	char*		dirptr;
	int			i, n;
	int			dirlen;

	g_numClasses = 0;

	trap_Cvar_Register( &classesFile, "g_classesFile", "", CVAR_INIT|CVAR_ROM );
	if( *classesFile.string ) {
		G_LoadClassesFromFile(classesFile.string);
	}
	else {
		G_LoadClassesFromFile("scripts/classes.pc");
	}

	// get all arenas from .arena files
	numdirs = trap_FS_GetFileList("scripts", ".pc", dirlist, 1024 );
	dirptr  = dirlist;
	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
		dirlen = strlen(dirptr);
		strcpy(filename, "scripts/");
		strcat(filename, dirptr);
		G_LoadClassesFromFile(filename);
	}
	trap_Printf( va( "%i player classes parsed\n", g_numClasses ) );
	
	for( n = 0; n < g_numClasses; n++ ) {
		Info_SetValueForKey( g_classInfos[n], "num", va( "%i", n ) );
	}
}

