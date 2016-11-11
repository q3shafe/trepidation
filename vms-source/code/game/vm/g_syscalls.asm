data
align 4
LABELV syscall
byte 4 4294967295
export dllEntry
code
proc dllEntry 0 0
file "../g_syscalls.c"
line 14
;1:// 2016 Trepidation Licensed under the GPL2
;2://
;3:#include "g_local.h"
;4:
;5:// this file is only included when building a dll
;6:// g_syscalls.asm is included instead when building a qvm
;7:#ifdef Q3_VM
;8:#error "Do not use in VM build"
;9:#endif
;10:
;11:static int (QDECL *syscall)( int arg, ... ) = (int (QDECL *)( int, ...))-1;
;12:
;13:
;14:void dllEntry( int (QDECL *syscallptr)( int arg,... ) ) {
line 15
;15:	syscall = syscallptr;
ADDRGP4 syscall
ADDRFP4 0
INDIRP4
ASGNP4
line 16
;16:}
LABELV $55
endproc dllEntry 0 0
export PASSFLOAT
proc PASSFLOAT 4 0
line 18
;17:
;18:int PASSFLOAT( float x ) {
line 20
;19:	float	floatTemp;
;20:	floatTemp = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 21
;21:	return *(int *)&floatTemp;
ADDRLP4 0
INDIRI4
RETI4
LABELV $56
endproc PASSFLOAT 4 0
export trap_Printf
proc trap_Printf 0 8
line 24
;22:}
;23:
;24:void	trap_Printf( const char *fmt ) {
line 25
;25:	syscall( G_PRINT, fmt );
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 26
;26:}
LABELV $57
endproc trap_Printf 0 8
export trap_Error
proc trap_Error 0 8
line 28
;27:
;28:void	trap_Error( const char *fmt ) {
line 29
;29:	syscall( G_ERROR, fmt );
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 30
;30:}
LABELV $58
endproc trap_Error 0 8
export trap_Milliseconds
proc trap_Milliseconds 4 4
line 32
;31:
;32:int		trap_Milliseconds( void ) {
line 33
;33:	return syscall( G_MILLISECONDS ); 
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $59
endproc trap_Milliseconds 4 4
export trap_Argc
proc trap_Argc 4 4
line 35
;34:}
;35:int		trap_Argc( void ) {
line 36
;36:	return syscall( G_ARGC );
CNSTI4 8
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $60
endproc trap_Argc 4 4
export trap_Argv
proc trap_Argv 0 16
line 39
;37:}
;38:
;39:void	trap_Argv( int n, char *buffer, int bufferLength ) {
line 40
;40:	syscall( G_ARGV, n, buffer, bufferLength );
CNSTI4 9
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 41
;41:}
LABELV $61
endproc trap_Argv 0 16
export trap_FS_FOpenFile
proc trap_FS_FOpenFile 4 16
line 43
;42:
;43:int		trap_FS_FOpenFile( const char *qpath, fileHandle_t *f, fsMode_t mode ) {
line 44
;44:	return syscall( G_FS_FOPEN_FILE, qpath, f, mode );
CNSTI4 10
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $62
endproc trap_FS_FOpenFile 4 16
export trap_FS_Read
proc trap_FS_Read 0 16
line 47
;45:}
;46:
;47:void	trap_FS_Read( void *buffer, int len, fileHandle_t f ) {
line 48
;48:	syscall( G_FS_READ, buffer, len, f );
CNSTI4 11
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 49
;49:}
LABELV $63
endproc trap_FS_Read 0 16
export trap_FS_Write
proc trap_FS_Write 0 16
line 51
;50:
;51:void	trap_FS_Write( const void *buffer, int len, fileHandle_t f ) {
line 52
;52:	syscall( G_FS_WRITE, buffer, len, f );
CNSTI4 12
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 53
;53:}
LABELV $64
endproc trap_FS_Write 0 16
export trap_FS_FCloseFile
proc trap_FS_FCloseFile 0 8
line 55
;54:
;55:void	trap_FS_FCloseFile( fileHandle_t f ) {
line 56
;56:	syscall( G_FS_FCLOSE_FILE, f );
CNSTI4 13
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 57
;57:}
LABELV $65
endproc trap_FS_FCloseFile 0 8
export trap_FS_GetFileList
proc trap_FS_GetFileList 4 20
line 59
;58:
;59:int trap_FS_GetFileList(  const char *path, const char *extension, char *listbuf, int bufsize ) {
line 60
;60:	return syscall( G_FS_GETFILELIST, path, extension, listbuf, bufsize );
CNSTI4 38
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $66
endproc trap_FS_GetFileList 4 20
export trap_FS_Seek
proc trap_FS_Seek 4 16
line 63
;61:}
;62:
;63:int trap_FS_Seek( fileHandle_t f, long offset, int origin ) {
line 64
;64:	return syscall( G_FS_SEEK, f, offset, origin );
CNSTI4 45
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $67
endproc trap_FS_Seek 4 16
export trap_SendConsoleCommand
proc trap_SendConsoleCommand 0 12
line 67
;65:}
;66:
;67:void	trap_SendConsoleCommand( int exec_when, const char *text ) {
line 68
;68:	syscall( G_SEND_CONSOLE_COMMAND, exec_when, text );
CNSTI4 14
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 69
;69:}
LABELV $68
endproc trap_SendConsoleCommand 0 12
export trap_Cvar_Register
proc trap_Cvar_Register 0 20
line 71
;70:
;71:void	trap_Cvar_Register( vmCvar_t *cvar, const char *var_name, const char *value, int flags ) {
line 72
;72:	syscall( G_CVAR_REGISTER, cvar, var_name, value, flags );
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 73
;73:}
LABELV $69
endproc trap_Cvar_Register 0 20
export trap_Cvar_Update
proc trap_Cvar_Update 0 8
line 75
;74:
;75:void	trap_Cvar_Update( vmCvar_t *cvar ) {
line 76
;76:	syscall( G_CVAR_UPDATE, cvar );
CNSTI4 4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 77
;77:}
LABELV $70
endproc trap_Cvar_Update 0 8
export trap_Cvar_Set
proc trap_Cvar_Set 0 12
line 79
;78:
;79:void trap_Cvar_Set( const char *var_name, const char *value ) {
line 80
;80:	syscall( G_CVAR_SET, var_name, value );
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 81
;81:}
LABELV $71
endproc trap_Cvar_Set 0 12
export trap_Cvar_VariableIntegerValue
proc trap_Cvar_VariableIntegerValue 4 8
line 83
;82:
;83:int trap_Cvar_VariableIntegerValue( const char *var_name ) {
line 84
;84:	return syscall( G_CVAR_VARIABLE_INTEGER_VALUE, var_name );
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $72
endproc trap_Cvar_VariableIntegerValue 4 8
export trap_Cvar_VariableStringBuffer
proc trap_Cvar_VariableStringBuffer 0 16
line 87
;85:}
;86:
;87:void trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize ) {
line 88
;88:	syscall( G_CVAR_VARIABLE_STRING_BUFFER, var_name, buffer, bufsize );
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 89
;89:}
LABELV $73
endproc trap_Cvar_VariableStringBuffer 0 16
export trap_LocateGameData
proc trap_LocateGameData 0 24
line 93
;90:
;91:
;92:void trap_LocateGameData( gentity_t *gEnts, int numGEntities, int sizeofGEntity_t,
;93:						 playerState_t *clients, int sizeofGClient ) {
line 94
;94:	syscall( G_LOCATE_GAME_DATA, gEnts, numGEntities, sizeofGEntity_t, clients, sizeofGClient );
CNSTI4 15
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 95
;95:}
LABELV $74
endproc trap_LocateGameData 0 24
export trap_DropClient
proc trap_DropClient 0 12
line 97
;96:
;97:void trap_DropClient( int clientNum, const char *reason ) {
line 98
;98:	syscall( G_DROP_CLIENT, clientNum, reason );
CNSTI4 16
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 99
;99:}
LABELV $75
endproc trap_DropClient 0 12
export trap_SendServerCommand
proc trap_SendServerCommand 4 12
line 101
;100:
;101:void trap_SendServerCommand( int clientNum, const char *text ) {
line 104
;102:		// Shafe - commands over 1022 chars will crash the 
;103:        // client upon receipt, so ignore them 
;104:        if( strlen( text ) > 1022 ) { 
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1022
LEI4 $77
line 105
;105:                G_LogPrintf( "trap_SendServerCommand( %d, ... ) length exceeds 1022.\n", clientNum ); 
ADDRGP4 $79
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 106
;106:                G_LogPrintf( "text [%s]\n", text ); 
ADDRGP4 $80
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 107
;107:                return; 
ADDRGP4 $76
JUMPV
LABELV $77
line 109
;108:        } 
;109:        syscall( G_SEND_SERVER_COMMAND, clientNum, text );
CNSTI4 17
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 110
;110:}
LABELV $76
endproc trap_SendServerCommand 4 12
export trap_SetConfigstring
proc trap_SetConfigstring 0 12
line 112
;111:
;112:void trap_SetConfigstring( int num, const char *string ) {
line 113
;113:	syscall( G_SET_CONFIGSTRING, num, string );
CNSTI4 18
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 114
;114:}
LABELV $81
endproc trap_SetConfigstring 0 12
export trap_GetConfigstring
proc trap_GetConfigstring 0 16
line 116
;115:
;116:void trap_GetConfigstring( int num, char *buffer, int bufferSize ) {
line 117
;117:	syscall( G_GET_CONFIGSTRING, num, buffer, bufferSize );
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 118
;118:}
LABELV $82
endproc trap_GetConfigstring 0 16
export trap_GetUserinfo
proc trap_GetUserinfo 0 16
line 120
;119:
;120:void trap_GetUserinfo( int num, char *buffer, int bufferSize ) {
line 121
;121:	syscall( G_GET_USERINFO, num, buffer, bufferSize );
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 122
;122:}
LABELV $83
endproc trap_GetUserinfo 0 16
export trap_SetUserinfo
proc trap_SetUserinfo 0 12
line 124
;123:
;124:void trap_SetUserinfo( int num, const char *buffer ) {
line 125
;125:	syscall( G_SET_USERINFO, num, buffer );
CNSTI4 21
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 126
;126:}
LABELV $84
endproc trap_SetUserinfo 0 12
export trap_GetServerinfo
proc trap_GetServerinfo 0 12
line 128
;127:
;128:void trap_GetServerinfo( char *buffer, int bufferSize ) {
line 129
;129:	syscall( G_GET_SERVERINFO, buffer, bufferSize );
CNSTI4 22
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 130
;130:}
LABELV $85
endproc trap_GetServerinfo 0 12
export trap_SetBrushModel
proc trap_SetBrushModel 0 12
line 132
;131:
;132:void trap_SetBrushModel( gentity_t *ent, const char *name ) {
line 133
;133:	syscall( G_SET_BRUSH_MODEL, ent, name );
CNSTI4 23
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 134
;134:}
LABELV $86
endproc trap_SetBrushModel 0 12
export trap_Trace
proc trap_Trace 0 32
line 136
;135:
;136:void trap_Trace( trace_t *results, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int passEntityNum, int contentmask ) {
line 137
;137:	syscall( G_TRACE, results, start, mins, maxs, end, passEntityNum, contentmask );
CNSTI4 24
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 138
;138:}
LABELV $87
endproc trap_Trace 0 32
export trap_TraceCapsule
proc trap_TraceCapsule 0 32
line 140
;139:
;140:void trap_TraceCapsule( trace_t *results, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int passEntityNum, int contentmask ) {
line 141
;141:	syscall( G_TRACECAPSULE, results, start, mins, maxs, end, passEntityNum, contentmask );
CNSTI4 43
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 142
;142:}
LABELV $88
endproc trap_TraceCapsule 0 32
export trap_PointContents
proc trap_PointContents 4 12
line 144
;143:
;144:int trap_PointContents( const vec3_t point, int passEntityNum ) {
line 145
;145:	return syscall( G_POINT_CONTENTS, point, passEntityNum );
CNSTI4 25
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $89
endproc trap_PointContents 4 12
export trap_InPVS
proc trap_InPVS 4 12
line 149
;146:}
;147:
;148:
;149:qboolean trap_InPVS( const vec3_t p1, const vec3_t p2 ) {
line 150
;150:	return syscall( G_IN_PVS, p1, p2 );
CNSTI4 26
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $90
endproc trap_InPVS 4 12
export trap_InPVSIgnorePortals
proc trap_InPVSIgnorePortals 4 12
line 153
;151:}
;152:
;153:qboolean trap_InPVSIgnorePortals( const vec3_t p1, const vec3_t p2 ) {
line 154
;154:	return syscall( G_IN_PVS_IGNORE_PORTALS, p1, p2 );
CNSTI4 27
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $91
endproc trap_InPVSIgnorePortals 4 12
export trap_AdjustAreaPortalState
proc trap_AdjustAreaPortalState 0 12
line 157
;155:}
;156:
;157:void trap_AdjustAreaPortalState( gentity_t *ent, qboolean open ) {
line 158
;158:	syscall( G_ADJUST_AREA_PORTAL_STATE, ent, open );
CNSTI4 28
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 159
;159:}
LABELV $92
endproc trap_AdjustAreaPortalState 0 12
export trap_AreasConnected
proc trap_AreasConnected 4 12
line 161
;160:
;161:qboolean trap_AreasConnected( int area1, int area2 ) {
line 162
;162:	return syscall( G_AREAS_CONNECTED, area1, area2 );
CNSTI4 29
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $93
endproc trap_AreasConnected 4 12
export trap_LinkEntity
proc trap_LinkEntity 0 8
line 165
;163:}
;164:
;165:void trap_LinkEntity( gentity_t *ent ) {
line 166
;166:	syscall( G_LINKENTITY, ent );
CNSTI4 30
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 167
;167:}
LABELV $94
endproc trap_LinkEntity 0 8
export trap_UnlinkEntity
proc trap_UnlinkEntity 0 8
line 169
;168:
;169:void trap_UnlinkEntity( gentity_t *ent ) {
line 170
;170:	syscall( G_UNLINKENTITY, ent );
CNSTI4 31
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 171
;171:}
LABELV $95
endproc trap_UnlinkEntity 0 8
export trap_EntitiesInBox
proc trap_EntitiesInBox 4 20
line 173
;172:
;173:int trap_EntitiesInBox( const vec3_t mins, const vec3_t maxs, int *list, int maxcount ) {
line 174
;174:	return syscall( G_ENTITIES_IN_BOX, mins, maxs, list, maxcount );
CNSTI4 32
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $96
endproc trap_EntitiesInBox 4 20
export trap_EntityContact
proc trap_EntityContact 4 16
line 177
;175:}
;176:
;177:qboolean trap_EntityContact( const vec3_t mins, const vec3_t maxs, const gentity_t *ent ) {
line 178
;178:	return syscall( G_ENTITY_CONTACT, mins, maxs, ent );
CNSTI4 33
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $97
endproc trap_EntityContact 4 16
export trap_EntityContactCapsule
proc trap_EntityContactCapsule 4 16
line 181
;179:}
;180:
;181:qboolean trap_EntityContactCapsule( const vec3_t mins, const vec3_t maxs, const gentity_t *ent ) {
line 182
;182:	return syscall( G_ENTITY_CONTACTCAPSULE, mins, maxs, ent );
CNSTI4 44
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $98
endproc trap_EntityContactCapsule 4 16
export trap_BotAllocateClient
proc trap_BotAllocateClient 4 4
line 185
;183:}
;184:
;185:int trap_BotAllocateClient( void ) {
line 186
;186:	return syscall( G_BOT_ALLOCATE_CLIENT );
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $99
endproc trap_BotAllocateClient 4 4
export trap_BotFreeClient
proc trap_BotFreeClient 0 8
line 189
;187:}
;188:
;189:void trap_BotFreeClient( int clientNum ) {
line 190
;190:	syscall( G_BOT_FREE_CLIENT, clientNum );
CNSTI4 35
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 191
;191:}
LABELV $100
endproc trap_BotFreeClient 0 8
export trap_GetUsercmd
proc trap_GetUsercmd 0 12
line 193
;192:
;193:void trap_GetUsercmd( int clientNum, usercmd_t *cmd ) {
line 194
;194:	syscall( G_GET_USERCMD, clientNum, cmd );
CNSTI4 36
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 195
;195:}
LABELV $101
endproc trap_GetUsercmd 0 12
export trap_GetEntityToken
proc trap_GetEntityToken 4 12
line 197
;196:
;197:qboolean trap_GetEntityToken( char *buffer, int bufferSize ) {
line 198
;198:	return syscall( G_GET_ENTITY_TOKEN, buffer, bufferSize );
CNSTI4 37
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $102
endproc trap_GetEntityToken 4 12
export trap_DebugPolygonCreate
proc trap_DebugPolygonCreate 4 16
line 201
;199:}
;200:
;201:int trap_DebugPolygonCreate(int color, int numPoints, vec3_t *points) {
line 202
;202:	return syscall( G_DEBUG_POLYGON_CREATE, color, numPoints, points );
CNSTI4 39
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $103
endproc trap_DebugPolygonCreate 4 16
export trap_DebugPolygonDelete
proc trap_DebugPolygonDelete 0 8
line 205
;203:}
;204:
;205:void trap_DebugPolygonDelete(int id) {
line 206
;206:	syscall( G_DEBUG_POLYGON_DELETE, id );
CNSTI4 40
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 207
;207:}
LABELV $104
endproc trap_DebugPolygonDelete 0 8
export trap_RealTime
proc trap_RealTime 4 8
line 209
;208:
;209:int trap_RealTime( qtime_t *qtime ) {
line 210
;210:	return syscall( G_REAL_TIME, qtime );
CNSTI4 41
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $105
endproc trap_RealTime 4 8
export trap_SnapVector
proc trap_SnapVector 0 8
line 213
;211:}
;212:
;213:void trap_SnapVector( float *v ) {
line 214
;214:	syscall( G_SNAPVECTOR, v );
CNSTI4 42
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 215
;215:	return;
LABELV $106
endproc trap_SnapVector 0 8
export trap_BotLibSetup
proc trap_BotLibSetup 4 4
line 219
;216:}
;217:
;218:// BotLib traps start here
;219:int trap_BotLibSetup( void ) {
line 220
;220:	return syscall( BOTLIB_SETUP );
CNSTI4 200
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $107
endproc trap_BotLibSetup 4 4
export trap_BotLibShutdown
proc trap_BotLibShutdown 4 4
line 223
;221:}
;222:
;223:int trap_BotLibShutdown( void ) {
line 224
;224:	return syscall( BOTLIB_SHUTDOWN );
CNSTI4 201
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $108
endproc trap_BotLibShutdown 4 4
export trap_BotLibVarSet
proc trap_BotLibVarSet 4 12
line 227
;225:}
;226:
;227:int trap_BotLibVarSet(char *var_name, char *value) {
line 228
;228:	return syscall( BOTLIB_LIBVAR_SET, var_name, value );
CNSTI4 202
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $109
endproc trap_BotLibVarSet 4 12
export trap_BotLibVarGet
proc trap_BotLibVarGet 4 16
line 231
;229:}
;230:
;231:int trap_BotLibVarGet(char *var_name, char *value, int size) {
line 232
;232:	return syscall( BOTLIB_LIBVAR_GET, var_name, value, size );
CNSTI4 203
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $110
endproc trap_BotLibVarGet 4 16
export trap_BotLibDefine
proc trap_BotLibDefine 4 8
line 235
;233:}
;234:
;235:int trap_BotLibDefine(char *string) {
line 236
;236:	return syscall( BOTLIB_PC_ADD_GLOBAL_DEFINE, string );
CNSTI4 204
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $111
endproc trap_BotLibDefine 4 8
export trap_BotLibStartFrame
proc trap_BotLibStartFrame 8 8
line 239
;237:}
;238:
;239:int trap_BotLibStartFrame(float time) {
line 240
;240:	return syscall( BOTLIB_START_FRAME, PASSFLOAT( time ) );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 205
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $112
endproc trap_BotLibStartFrame 8 8
export trap_BotLibLoadMap
proc trap_BotLibLoadMap 4 8
line 243
;241:}
;242:
;243:int trap_BotLibLoadMap(const char *mapname) {
line 244
;244:	return syscall( BOTLIB_LOAD_MAP, mapname );
CNSTI4 206
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $113
endproc trap_BotLibLoadMap 4 8
export trap_BotLibUpdateEntity
proc trap_BotLibUpdateEntity 4 12
line 247
;245:}
;246:
;247:int trap_BotLibUpdateEntity(int ent, void /* struct bot_updateentity_s */ *bue) {
line 248
;248:	return syscall( BOTLIB_UPDATENTITY, ent, bue );
CNSTI4 207
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $114
endproc trap_BotLibUpdateEntity 4 12
export trap_BotLibTest
proc trap_BotLibTest 4 20
line 251
;249:}
;250:
;251:int trap_BotLibTest(int parm0, char *parm1, vec3_t parm2, vec3_t parm3) {
line 252
;252:	return syscall( BOTLIB_TEST, parm0, parm1, parm2, parm3 );
CNSTI4 208
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $115
endproc trap_BotLibTest 4 20
export trap_BotGetSnapshotEntity
proc trap_BotGetSnapshotEntity 4 12
line 255
;253:}
;254:
;255:int trap_BotGetSnapshotEntity( int clientNum, int sequence ) {
line 256
;256:	return syscall( BOTLIB_GET_SNAPSHOT_ENTITY, clientNum, sequence );
CNSTI4 209
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $116
endproc trap_BotGetSnapshotEntity 4 12
export trap_BotGetServerCommand
proc trap_BotGetServerCommand 4 16
line 259
;257:}
;258:
;259:int trap_BotGetServerCommand(int clientNum, char *message, int size) {
line 260
;260:	return syscall( BOTLIB_GET_CONSOLE_MESSAGE, clientNum, message, size );
CNSTI4 210
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $117
endproc trap_BotGetServerCommand 4 16
export trap_BotUserCommand
proc trap_BotUserCommand 0 12
line 263
;261:}
;262:
;263:void trap_BotUserCommand(int clientNum, usercmd_t *ucmd) {
line 264
;264:	syscall( BOTLIB_USER_COMMAND, clientNum, ucmd );
CNSTI4 211
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 265
;265:}
LABELV $118
endproc trap_BotUserCommand 0 12
export trap_AAS_EntityInfo
proc trap_AAS_EntityInfo 0 12
line 267
;266:
;267:void trap_AAS_EntityInfo(int entnum, void /* struct aas_entityinfo_s */ *info) {
line 268
;268:	syscall( BOTLIB_AAS_ENTITY_INFO, entnum, info );
CNSTI4 303
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 269
;269:}
LABELV $119
endproc trap_AAS_EntityInfo 0 12
export trap_AAS_Initialized
proc trap_AAS_Initialized 4 4
line 271
;270:
;271:int trap_AAS_Initialized(void) {
line 272
;272:	return syscall( BOTLIB_AAS_INITIALIZED );
CNSTI4 304
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $120
endproc trap_AAS_Initialized 4 4
export trap_AAS_AreaLadder
proc trap_AAS_AreaLadder 4 8
line 276
;273:}
;274:
;275:int trap_AAS_AreaLadder(int areanum) 
;276:{ //AreaLadder add -Vincent
line 277
;277:	return syscall( BOTLIB_AAS_AREA_LADDER, areanum );
CNSTI4 212
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $121
endproc trap_AAS_AreaLadder 4 8
export trap_AAS_PresenceTypeBoundingBox
proc trap_AAS_PresenceTypeBoundingBox 0 16
line 280
;278:}
;279:
;280:void trap_AAS_PresenceTypeBoundingBox(int presencetype, vec3_t mins, vec3_t maxs) {
line 281
;281:	syscall( BOTLIB_AAS_PRESENCE_TYPE_BOUNDING_BOX, presencetype, mins, maxs );
CNSTI4 305
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 282
;282:}
LABELV $122
endproc trap_AAS_PresenceTypeBoundingBox 0 16
export trap_AAS_Time
proc trap_AAS_Time 8 4
line 284
;283:
;284:float trap_AAS_Time(void) {
line 286
;285:	int temp;
;286:	temp = syscall( BOTLIB_AAS_TIME );
CNSTI4 306
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 287
;287:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $123
endproc trap_AAS_Time 8 4
export trap_AAS_PointAreaNum
proc trap_AAS_PointAreaNum 4 8
line 290
;288:}
;289:
;290:int trap_AAS_PointAreaNum(vec3_t point) {
line 291
;291:	return syscall( BOTLIB_AAS_POINT_AREA_NUM, point );
CNSTI4 307
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $124
endproc trap_AAS_PointAreaNum 4 8
export trap_AAS_PointReachabilityAreaIndex
proc trap_AAS_PointReachabilityAreaIndex 4 8
line 294
;292:}
;293:
;294:int trap_AAS_PointReachabilityAreaIndex(vec3_t point) {
line 295
;295:	return syscall( BOTLIB_AAS_POINT_REACHABILITY_AREA_INDEX, point );
CNSTI4 577
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $125
endproc trap_AAS_PointReachabilityAreaIndex 4 8
export trap_AAS_TraceAreas
proc trap_AAS_TraceAreas 4 24
line 298
;296:}
;297:
;298:int trap_AAS_TraceAreas(vec3_t start, vec3_t end, int *areas, vec3_t *points, int maxareas) {
line 299
;299:	return syscall( BOTLIB_AAS_TRACE_AREAS, start, end, areas, points, maxareas );
CNSTI4 308
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $126
endproc trap_AAS_TraceAreas 4 24
export trap_AAS_BBoxAreas
proc trap_AAS_BBoxAreas 4 20
line 302
;300:}
;301:
;302:int trap_AAS_BBoxAreas(vec3_t absmins, vec3_t absmaxs, int *areas, int maxareas) {
line 303
;303:	return syscall( BOTLIB_AAS_BBOX_AREAS, absmins, absmaxs, areas, maxareas );
CNSTI4 301
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $127
endproc trap_AAS_BBoxAreas 4 20
export trap_AAS_AreaInfo
proc trap_AAS_AreaInfo 4 12
line 306
;304:}
;305:
;306:int trap_AAS_AreaInfo( int areanum, void /* struct aas_areainfo_s */ *info ) {
line 307
;307:	return syscall( BOTLIB_AAS_AREA_INFO, areanum, info );
CNSTI4 302
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $128
endproc trap_AAS_AreaInfo 4 12
export trap_AAS_PointContents
proc trap_AAS_PointContents 4 8
line 310
;308:}
;309:
;310:int trap_AAS_PointContents(vec3_t point) {
line 311
;311:	return syscall( BOTLIB_AAS_POINT_CONTENTS, point );
CNSTI4 309
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $129
endproc trap_AAS_PointContents 4 8
export trap_AAS_NextBSPEntity
proc trap_AAS_NextBSPEntity 4 8
line 314
;312:}
;313:
;314:int trap_AAS_NextBSPEntity(int ent) {
line 315
;315:	return syscall( BOTLIB_AAS_NEXT_BSP_ENTITY, ent );
CNSTI4 310
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $130
endproc trap_AAS_NextBSPEntity 4 8
export trap_AAS_ValueForBSPEpairKey
proc trap_AAS_ValueForBSPEpairKey 4 20
line 318
;316:}
;317:
;318:int trap_AAS_ValueForBSPEpairKey(int ent, char *key, char *value, int size) {
line 319
;319:	return syscall( BOTLIB_AAS_VALUE_FOR_BSP_EPAIR_KEY, ent, key, value, size );
CNSTI4 311
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $131
endproc trap_AAS_ValueForBSPEpairKey 4 20
export trap_AAS_VectorForBSPEpairKey
proc trap_AAS_VectorForBSPEpairKey 4 16
line 322
;320:}
;321:
;322:int trap_AAS_VectorForBSPEpairKey(int ent, char *key, vec3_t v) {
line 323
;323:	return syscall( BOTLIB_AAS_VECTOR_FOR_BSP_EPAIR_KEY, ent, key, v );
CNSTI4 312
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $132
endproc trap_AAS_VectorForBSPEpairKey 4 16
export trap_AAS_FloatForBSPEpairKey
proc trap_AAS_FloatForBSPEpairKey 4 16
line 326
;324:}
;325:
;326:int trap_AAS_FloatForBSPEpairKey(int ent, char *key, float *value) {
line 327
;327:	return syscall( BOTLIB_AAS_FLOAT_FOR_BSP_EPAIR_KEY, ent, key, value );
CNSTI4 313
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $133
endproc trap_AAS_FloatForBSPEpairKey 4 16
export trap_AAS_IntForBSPEpairKey
proc trap_AAS_IntForBSPEpairKey 4 16
line 330
;328:}
;329:
;330:int trap_AAS_IntForBSPEpairKey(int ent, char *key, int *value) {
line 331
;331:	return syscall( BOTLIB_AAS_INT_FOR_BSP_EPAIR_KEY, ent, key, value );
CNSTI4 314
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $134
endproc trap_AAS_IntForBSPEpairKey 4 16
export trap_AAS_AreaReachability
proc trap_AAS_AreaReachability 4 8
line 334
;332:}
;333:
;334:int trap_AAS_AreaReachability(int areanum) {
line 335
;335:	return syscall( BOTLIB_AAS_AREA_REACHABILITY, areanum );
CNSTI4 315
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $135
endproc trap_AAS_AreaReachability 4 8
export trap_AAS_AreaTravelTimeToGoalArea
proc trap_AAS_AreaTravelTimeToGoalArea 4 20
line 338
;336:}
;337:
;338:int trap_AAS_AreaTravelTimeToGoalArea(int areanum, vec3_t origin, int goalareanum, int travelflags) {
line 339
;339:	return syscall( BOTLIB_AAS_AREA_TRAVEL_TIME_TO_GOAL_AREA, areanum, origin, goalareanum, travelflags );
CNSTI4 316
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $136
endproc trap_AAS_AreaTravelTimeToGoalArea 4 20
export trap_AAS_EnableRoutingArea
proc trap_AAS_EnableRoutingArea 4 12
line 342
;340:}
;341:
;342:int trap_AAS_EnableRoutingArea( int areanum, int enable ) {
line 343
;343:	return syscall( BOTLIB_AAS_ENABLE_ROUTING_AREA, areanum, enable );
CNSTI4 300
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $137
endproc trap_AAS_EnableRoutingArea 4 12
export trap_AAS_PredictRoute
proc trap_AAS_PredictRoute 4 48
line 348
;344:}
;345:
;346:int trap_AAS_PredictRoute(void /*struct aas_predictroute_s*/ *route, int areanum, vec3_t origin,
;347:							int goalareanum, int travelflags, int maxareas, int maxtime,
;348:							int stopevent, int stopcontents, int stoptfl, int stopareanum) {
line 349
;349:	return syscall( BOTLIB_AAS_PREDICT_ROUTE, route, areanum, origin, goalareanum, travelflags, maxareas, maxtime, stopevent, stopcontents, stoptfl, stopareanum );
CNSTI4 576
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRFP4 36
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $138
endproc trap_AAS_PredictRoute 4 48
export trap_AAS_AlternativeRouteGoals
proc trap_AAS_AlternativeRouteGoals 4 36
line 354
;350:}
;351:
;352:int trap_AAS_AlternativeRouteGoals(vec3_t start, int startareanum, vec3_t goal, int goalareanum, int travelflags,
;353:										void /*struct aas_altroutegoal_s*/ *altroutegoals, int maxaltroutegoals,
;354:										int type) {
line 355
;355:	return syscall( BOTLIB_AAS_ALTERNATIVE_ROUTE_GOAL, start, startareanum, goal, goalareanum, travelflags, altroutegoals, maxaltroutegoals, type );
CNSTI4 575
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $139
endproc trap_AAS_AlternativeRouteGoals 4 36
export trap_AAS_Swimming
proc trap_AAS_Swimming 4 8
line 358
;356:}
;357:
;358:int trap_AAS_Swimming(vec3_t origin) {
line 359
;359:	return syscall( BOTLIB_AAS_SWIMMING, origin );
CNSTI4 317
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $140
endproc trap_AAS_Swimming 4 8
export trap_AAS_PredictClientMovement
proc trap_AAS_PredictClientMovement 8 56
line 362
;360:}
;361:
;362:int trap_AAS_PredictClientMovement(void /* struct aas_clientmove_s */ *move, int entnum, vec3_t origin, int presencetype, int onground, vec3_t velocity, vec3_t cmdmove, int cmdframes, int maxframes, float frametime, int stopevent, int stopareanum, int visualize) {
line 363
;363:	return syscall( BOTLIB_AAS_PREDICT_CLIENT_MOVEMENT, move, entnum, origin, presencetype, onground, velocity, cmdmove, cmdframes, maxframes, PASSFLOAT(frametime), stopevent, stopareanum, visualize );
ADDRFP4 36
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 318
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRI4
ARGI4
ADDRFP4 32
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 40
INDIRI4
ARGI4
ADDRFP4 44
INDIRI4
ARGI4
ADDRFP4 48
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $141
endproc trap_AAS_PredictClientMovement 8 56
export trap_EA_Say
proc trap_EA_Say 0 12
line 366
;364:}
;365:
;366:void trap_EA_Say(int client, char *str) {
line 367
;367:	syscall( BOTLIB_EA_SAY, client, str );
CNSTI4 400
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 368
;368:}
LABELV $142
endproc trap_EA_Say 0 12
export trap_EA_SayTeam
proc trap_EA_SayTeam 0 12
line 370
;369:
;370:void trap_EA_SayTeam(int client, char *str) {
line 371
;371:	syscall( BOTLIB_EA_SAY_TEAM, client, str );
CNSTI4 401
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 372
;372:}
LABELV $143
endproc trap_EA_SayTeam 0 12
export trap_EA_Command
proc trap_EA_Command 0 12
line 374
;373:
;374:void trap_EA_Command(int client, char *command) {
line 375
;375:	syscall( BOTLIB_EA_COMMAND, client, command );
CNSTI4 402
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 376
;376:}
LABELV $144
endproc trap_EA_Command 0 12
export trap_EA_Action
proc trap_EA_Action 0 12
line 378
;377:
;378:void trap_EA_Action(int client, int action) {
line 379
;379:	syscall( BOTLIB_EA_ACTION, client, action );
CNSTI4 403
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 380
;380:}
LABELV $145
endproc trap_EA_Action 0 12
export trap_EA_Gesture
proc trap_EA_Gesture 0 8
line 382
;381:
;382:void trap_EA_Gesture(int client) {
line 383
;383:	syscall( BOTLIB_EA_GESTURE, client );
CNSTI4 404
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 384
;384:}
LABELV $146
endproc trap_EA_Gesture 0 8
export trap_EA_Talk
proc trap_EA_Talk 0 8
line 386
;385:
;386:void trap_EA_Talk(int client) {
line 387
;387:	syscall( BOTLIB_EA_TALK, client );
CNSTI4 405
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 388
;388:}
LABELV $147
endproc trap_EA_Talk 0 8
export trap_EA_Attack
proc trap_EA_Attack 0 8
line 390
;389:
;390:void trap_EA_Attack(int client) {
line 391
;391:	syscall( BOTLIB_EA_ATTACK, client );
CNSTI4 406
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 392
;392:}
LABELV $148
endproc trap_EA_Attack 0 8
export trap_EA_Use
proc trap_EA_Use 0 8
line 394
;393:
;394:void trap_EA_Use(int client) {
line 395
;395:	syscall( BOTLIB_EA_USE, client );
CNSTI4 407
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 396
;396:}
LABELV $149
endproc trap_EA_Use 0 8
export trap_EA_Respawn
proc trap_EA_Respawn 0 8
line 398
;397:
;398:void trap_EA_Respawn(int client) {
line 399
;399:	syscall( BOTLIB_EA_RESPAWN, client );
CNSTI4 408
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 400
;400:}
LABELV $150
endproc trap_EA_Respawn 0 8
export trap_EA_Crouch
proc trap_EA_Crouch 0 8
line 402
;401:
;402:void trap_EA_Crouch(int client) {
line 403
;403:	syscall( BOTLIB_EA_CROUCH, client );
CNSTI4 409
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 404
;404:}
LABELV $151
endproc trap_EA_Crouch 0 8
export trap_EA_MoveUp
proc trap_EA_MoveUp 0 8
line 406
;405:
;406:void trap_EA_MoveUp(int client) {
line 407
;407:	syscall( BOTLIB_EA_MOVE_UP, client );
CNSTI4 410
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 408
;408:}
LABELV $152
endproc trap_EA_MoveUp 0 8
export trap_EA_MoveDown
proc trap_EA_MoveDown 0 8
line 410
;409:
;410:void trap_EA_MoveDown(int client) {
line 411
;411:	syscall( BOTLIB_EA_MOVE_DOWN, client );
CNSTI4 411
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 412
;412:}
LABELV $153
endproc trap_EA_MoveDown 0 8
export trap_EA_MoveForward
proc trap_EA_MoveForward 0 8
line 414
;413:
;414:void trap_EA_MoveForward(int client) {
line 415
;415:	syscall( BOTLIB_EA_MOVE_FORWARD, client );
CNSTI4 412
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 416
;416:}
LABELV $154
endproc trap_EA_MoveForward 0 8
export trap_EA_MoveBack
proc trap_EA_MoveBack 0 8
line 418
;417:
;418:void trap_EA_MoveBack(int client) {
line 419
;419:	syscall( BOTLIB_EA_MOVE_BACK, client );
CNSTI4 413
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 420
;420:}
LABELV $155
endproc trap_EA_MoveBack 0 8
export trap_EA_MoveLeft
proc trap_EA_MoveLeft 0 8
line 422
;421:
;422:void trap_EA_MoveLeft(int client) {
line 423
;423:	syscall( BOTLIB_EA_MOVE_LEFT, client );
CNSTI4 414
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 424
;424:}
LABELV $156
endproc trap_EA_MoveLeft 0 8
export trap_EA_MoveRight
proc trap_EA_MoveRight 0 8
line 426
;425:
;426:void trap_EA_MoveRight(int client) {
line 427
;427:	syscall( BOTLIB_EA_MOVE_RIGHT, client );
CNSTI4 415
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 428
;428:}
LABELV $157
endproc trap_EA_MoveRight 0 8
export trap_EA_SelectWeapon
proc trap_EA_SelectWeapon 0 12
line 430
;429:
;430:void trap_EA_SelectWeapon(int client, int weapon) {
line 431
;431:	if (g_instagib.integer == 1) { weapon = WP_RAILGUN; }  // Shafe - Instagib
ADDRGP4 g_instagib+12
INDIRI4
CNSTI4 1
NEI4 $159
ADDRFP4 4
CNSTI4 7
ASGNI4
LABELV $159
line 432
;432:		syscall( BOTLIB_EA_SELECT_WEAPON, client, weapon );
CNSTI4 416
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 434
;433:
;434:}
LABELV $158
endproc trap_EA_SelectWeapon 0 12
export trap_EA_Jump
proc trap_EA_Jump 0 8
line 436
;435:
;436:void trap_EA_Jump(int client) {
line 437
;437:	syscall( BOTLIB_EA_JUMP, client );
CNSTI4 417
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 438
;438:}
LABELV $162
endproc trap_EA_Jump 0 8
export trap_EA_DelayedJump
proc trap_EA_DelayedJump 0 8
line 440
;439:
;440:void trap_EA_DelayedJump(int client) {
line 441
;441:	syscall( BOTLIB_EA_DELAYED_JUMP, client );
CNSTI4 418
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 442
;442:}
LABELV $163
endproc trap_EA_DelayedJump 0 8
export trap_EA_Move
proc trap_EA_Move 4 16
line 444
;443:
;444:void trap_EA_Move(int client, vec3_t dir, float speed) {
line 445
;445:	syscall( BOTLIB_EA_MOVE, client, dir, PASSFLOAT(speed) );
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 419
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 446
;446:}
LABELV $164
endproc trap_EA_Move 4 16
export trap_EA_View
proc trap_EA_View 0 12
line 448
;447:
;448:void trap_EA_View(int client, vec3_t viewangles) {
line 449
;449:	syscall( BOTLIB_EA_VIEW, client, viewangles );
CNSTI4 420
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 450
;450:}
LABELV $165
endproc trap_EA_View 0 12
export trap_EA_EndRegular
proc trap_EA_EndRegular 4 12
line 452
;451:
;452:void trap_EA_EndRegular(int client, float thinktime) {
line 453
;453:	syscall( BOTLIB_EA_END_REGULAR, client, PASSFLOAT(thinktime) );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 421
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 454
;454:}
LABELV $166
endproc trap_EA_EndRegular 4 12
export trap_EA_GetInput
proc trap_EA_GetInput 4 16
line 456
;455:
;456:void trap_EA_GetInput(int client, float thinktime, void /* struct bot_input_s */ *input) {
line 457
;457:	syscall( BOTLIB_EA_GET_INPUT, client, PASSFLOAT(thinktime), input );
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 422
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 458
;458:}
LABELV $167
endproc trap_EA_GetInput 4 16
export trap_EA_ResetInput
proc trap_EA_ResetInput 0 8
line 460
;459:
;460:void trap_EA_ResetInput(int client) {
line 461
;461:	syscall( BOTLIB_EA_RESET_INPUT, client );
CNSTI4 423
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 462
;462:}
LABELV $168
endproc trap_EA_ResetInput 0 8
export trap_BotLoadCharacter
proc trap_BotLoadCharacter 8 12
line 464
;463:
;464:int trap_BotLoadCharacter(char *charfile, float skill) {
line 465
;465:	return syscall( BOTLIB_AI_LOAD_CHARACTER, charfile, PASSFLOAT(skill));
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 500
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $169
endproc trap_BotLoadCharacter 8 12
export trap_BotFreeCharacter
proc trap_BotFreeCharacter 0 8
line 468
;466:}
;467:
;468:void trap_BotFreeCharacter(int character) {
line 469
;469:	syscall( BOTLIB_AI_FREE_CHARACTER, character );
CNSTI4 501
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 470
;470:}
LABELV $170
endproc trap_BotFreeCharacter 0 8
export trap_Characteristic_Float
proc trap_Characteristic_Float 8 12
line 472
;471:
;472:float trap_Characteristic_Float(int character, int index) {
line 474
;473:	int temp;
;474:	temp = syscall( BOTLIB_AI_CHARACTERISTIC_FLOAT, character, index );
CNSTI4 502
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 475
;475:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $171
endproc trap_Characteristic_Float 8 12
export trap_Characteristic_BFloat
proc trap_Characteristic_BFloat 16 20
line 478
;476:}
;477:
;478:float trap_Characteristic_BFloat(int character, int index, float min, float max) {
line 480
;479:	int temp;
;480:	temp = syscall( BOTLIB_AI_CHARACTERISTIC_BFLOAT, character, index, PASSFLOAT(min), PASSFLOAT(max) );
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 503
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 481
;481:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $172
endproc trap_Characteristic_BFloat 16 20
export trap_Characteristic_Integer
proc trap_Characteristic_Integer 4 12
line 484
;482:}
;483:
;484:int trap_Characteristic_Integer(int character, int index) {
line 485
;485:	return syscall( BOTLIB_AI_CHARACTERISTIC_INTEGER, character, index );
CNSTI4 504
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $173
endproc trap_Characteristic_Integer 4 12
export trap_Characteristic_BInteger
proc trap_Characteristic_BInteger 4 20
line 488
;486:}
;487:
;488:int trap_Characteristic_BInteger(int character, int index, int min, int max) {
line 489
;489:	return syscall( BOTLIB_AI_CHARACTERISTIC_BINTEGER, character, index, min, max );
CNSTI4 505
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $174
endproc trap_Characteristic_BInteger 4 20
export trap_Characteristic_String
proc trap_Characteristic_String 0 20
line 492
;490:}
;491:
;492:void trap_Characteristic_String(int character, int index, char *buf, int size) {
line 493
;493:	syscall( BOTLIB_AI_CHARACTERISTIC_STRING, character, index, buf, size );
CNSTI4 506
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 494
;494:}
LABELV $175
endproc trap_Characteristic_String 0 20
export trap_BotAllocChatState
proc trap_BotAllocChatState 4 4
line 496
;495:
;496:int trap_BotAllocChatState(void) {
line 497
;497:	return syscall( BOTLIB_AI_ALLOC_CHAT_STATE );
CNSTI4 507
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $176
endproc trap_BotAllocChatState 4 4
export trap_BotFreeChatState
proc trap_BotFreeChatState 0 8
line 500
;498:}
;499:
;500:void trap_BotFreeChatState(int handle) {
line 501
;501:	syscall( BOTLIB_AI_FREE_CHAT_STATE, handle );
CNSTI4 508
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 502
;502:}
LABELV $177
endproc trap_BotFreeChatState 0 8
export trap_BotQueueConsoleMessage
proc trap_BotQueueConsoleMessage 0 16
line 504
;503:
;504:void trap_BotQueueConsoleMessage(int chatstate, int type, char *message) {
line 505
;505:	syscall( BOTLIB_AI_QUEUE_CONSOLE_MESSAGE, chatstate, type, message );
CNSTI4 509
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 506
;506:}
LABELV $178
endproc trap_BotQueueConsoleMessage 0 16
export trap_BotRemoveConsoleMessage
proc trap_BotRemoveConsoleMessage 0 12
line 508
;507:
;508:void trap_BotRemoveConsoleMessage(int chatstate, int handle) {
line 509
;509:	syscall( BOTLIB_AI_REMOVE_CONSOLE_MESSAGE, chatstate, handle );
CNSTI4 510
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 510
;510:}
LABELV $179
endproc trap_BotRemoveConsoleMessage 0 12
export trap_BotNextConsoleMessage
proc trap_BotNextConsoleMessage 4 12
line 512
;511:
;512:int trap_BotNextConsoleMessage(int chatstate, void /* struct bot_consolemessage_s */ *cm) {
line 513
;513:	return syscall( BOTLIB_AI_NEXT_CONSOLE_MESSAGE, chatstate, cm );
CNSTI4 511
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $180
endproc trap_BotNextConsoleMessage 4 12
export trap_BotNumConsoleMessages
proc trap_BotNumConsoleMessages 4 8
line 516
;514:}
;515:
;516:int trap_BotNumConsoleMessages(int chatstate) {
line 517
;517:	return syscall( BOTLIB_AI_NUM_CONSOLE_MESSAGE, chatstate );
CNSTI4 512
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $181
endproc trap_BotNumConsoleMessages 4 8
export trap_BotInitialChat
proc trap_BotInitialChat 0 48
line 520
;518:}
;519:
;520:void trap_BotInitialChat(int chatstate, char *type, int mcontext, char *var0, char *var1, char *var2, char *var3, char *var4, char *var5, char *var6, char *var7 ) {
line 521
;521:	syscall( BOTLIB_AI_INITIAL_CHAT, chatstate, type, mcontext, var0, var1, var2, var3, var4, var5, var6, var7 );
CNSTI4 513
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRP4
ARGP4
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 522
;522:}
LABELV $182
endproc trap_BotInitialChat 0 48
export trap_BotNumInitialChats
proc trap_BotNumInitialChats 4 12
line 524
;523:
;524:int	trap_BotNumInitialChats(int chatstate, char *type) {
line 525
;525:	return syscall( BOTLIB_AI_NUM_INITIAL_CHATS, chatstate, type );
CNSTI4 569
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $183
endproc trap_BotNumInitialChats 4 12
export trap_BotReplyChat
proc trap_BotReplyChat 4 52
line 528
;526:}
;527:
;528:int trap_BotReplyChat(int chatstate, char *message, int mcontext, int vcontext, char *var0, char *var1, char *var2, char *var3, char *var4, char *var5, char *var6, char *var7 ) {
line 529
;529:	return syscall( BOTLIB_AI_REPLY_CHAT, chatstate, message, mcontext, vcontext, var0, var1, var2, var3, var4, var5, var6, var7 );
CNSTI4 514
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 36
INDIRP4
ARGP4
ADDRFP4 40
INDIRP4
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $184
endproc trap_BotReplyChat 4 52
export trap_BotChatLength
proc trap_BotChatLength 4 8
line 532
;530:}
;531:
;532:int trap_BotChatLength(int chatstate) {
line 533
;533:	return syscall( BOTLIB_AI_CHAT_LENGTH, chatstate );
CNSTI4 515
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $185
endproc trap_BotChatLength 4 8
export trap_BotEnterChat
proc trap_BotEnterChat 0 16
line 536
;534:}
;535:
;536:void trap_BotEnterChat(int chatstate, int client, int sendto) {
line 537
;537:	syscall( BOTLIB_AI_ENTER_CHAT, chatstate, client, sendto );
CNSTI4 516
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 538
;538:}
LABELV $186
endproc trap_BotEnterChat 0 16
export trap_BotGetChatMessage
proc trap_BotGetChatMessage 0 16
line 540
;539:
;540:void trap_BotGetChatMessage(int chatstate, char *buf, int size) {
line 541
;541:	syscall( BOTLIB_AI_GET_CHAT_MESSAGE, chatstate, buf, size);
CNSTI4 570
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 542
;542:}
LABELV $187
endproc trap_BotGetChatMessage 0 16
export trap_StringContains
proc trap_StringContains 4 16
line 544
;543:
;544:int trap_StringContains(char *str1, char *str2, int casesensitive) {
line 545
;545:	return syscall( BOTLIB_AI_STRING_CONTAINS, str1, str2, casesensitive );
CNSTI4 517
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $188
endproc trap_StringContains 4 16
export trap_BotFindMatch
proc trap_BotFindMatch 4 16
line 548
;546:}
;547:
;548:int trap_BotFindMatch(char *str, void /* struct bot_match_s */ *match, unsigned long int context) {
line 549
;549:	return syscall( BOTLIB_AI_FIND_MATCH, str, match, context );
CNSTI4 518
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRU4
ARGU4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $189
endproc trap_BotFindMatch 4 16
export trap_BotMatchVariable
proc trap_BotMatchVariable 0 20
line 552
;550:}
;551:
;552:void trap_BotMatchVariable(void /* struct bot_match_s */ *match, int variable, char *buf, int size) {
line 553
;553:	syscall( BOTLIB_AI_MATCH_VARIABLE, match, variable, buf, size );
CNSTI4 519
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 554
;554:}
LABELV $190
endproc trap_BotMatchVariable 0 20
export trap_UnifyWhiteSpaces
proc trap_UnifyWhiteSpaces 0 8
line 556
;555:
;556:void trap_UnifyWhiteSpaces(char *string) {
line 557
;557:	syscall( BOTLIB_AI_UNIFY_WHITE_SPACES, string );
CNSTI4 520
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 558
;558:}
LABELV $191
endproc trap_UnifyWhiteSpaces 0 8
export trap_BotReplaceSynonyms
proc trap_BotReplaceSynonyms 0 12
line 560
;559:
;560:void trap_BotReplaceSynonyms(char *string, unsigned long int context) {
line 561
;561:	syscall( BOTLIB_AI_REPLACE_SYNONYMS, string, context );
CNSTI4 521
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRU4
ARGU4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 562
;562:}
LABELV $192
endproc trap_BotReplaceSynonyms 0 12
export trap_BotLoadChatFile
proc trap_BotLoadChatFile 4 16
line 564
;563:
;564:int trap_BotLoadChatFile(int chatstate, char *chatfile, char *chatname) {
line 565
;565:	return syscall( BOTLIB_AI_LOAD_CHAT_FILE, chatstate, chatfile, chatname );
CNSTI4 522
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $193
endproc trap_BotLoadChatFile 4 16
export trap_BotSetChatGender
proc trap_BotSetChatGender 0 12
line 568
;566:}
;567:
;568:void trap_BotSetChatGender(int chatstate, int gender) {
line 569
;569:	syscall( BOTLIB_AI_SET_CHAT_GENDER, chatstate, gender );
CNSTI4 523
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 570
;570:}
LABELV $194
endproc trap_BotSetChatGender 0 12
export trap_BotSetChatName
proc trap_BotSetChatName 0 16
line 572
;571:
;572:void trap_BotSetChatName(int chatstate, char *name, int client) {
line 573
;573:	syscall( BOTLIB_AI_SET_CHAT_NAME, chatstate, name, client );
CNSTI4 524
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 574
;574:}
LABELV $195
endproc trap_BotSetChatName 0 16
export trap_BotResetGoalState
proc trap_BotResetGoalState 0 8
line 576
;575:
;576:void trap_BotResetGoalState(int goalstate) {
line 577
;577:	syscall( BOTLIB_AI_RESET_GOAL_STATE, goalstate );
CNSTI4 525
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 578
;578:}
LABELV $196
endproc trap_BotResetGoalState 0 8
export trap_BotResetAvoidGoals
proc trap_BotResetAvoidGoals 0 8
line 580
;579:
;580:void trap_BotResetAvoidGoals(int goalstate) {
line 581
;581:	syscall( BOTLIB_AI_RESET_AVOID_GOALS, goalstate );
CNSTI4 526
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 582
;582:}
LABELV $197
endproc trap_BotResetAvoidGoals 0 8
export trap_BotRemoveFromAvoidGoals
proc trap_BotRemoveFromAvoidGoals 0 12
line 584
;583:
;584:void trap_BotRemoveFromAvoidGoals(int goalstate, int number) {
line 585
;585:	syscall( BOTLIB_AI_REMOVE_FROM_AVOID_GOALS, goalstate, number);
CNSTI4 571
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 586
;586:}
LABELV $198
endproc trap_BotRemoveFromAvoidGoals 0 12
export trap_BotPushGoal
proc trap_BotPushGoal 0 12
line 588
;587:
;588:void trap_BotPushGoal(int goalstate, void /* struct bot_goal_s */ *goal) {
line 589
;589:	syscall( BOTLIB_AI_PUSH_GOAL, goalstate, goal );
CNSTI4 527
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 590
;590:}
LABELV $199
endproc trap_BotPushGoal 0 12
export trap_BotPopGoal
proc trap_BotPopGoal 0 8
line 592
;591:
;592:void trap_BotPopGoal(int goalstate) {
line 593
;593:	syscall( BOTLIB_AI_POP_GOAL, goalstate );
CNSTI4 528
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 594
;594:}
LABELV $200
endproc trap_BotPopGoal 0 8
export trap_BotEmptyGoalStack
proc trap_BotEmptyGoalStack 0 8
line 596
;595:
;596:void trap_BotEmptyGoalStack(int goalstate) {
line 597
;597:	syscall( BOTLIB_AI_EMPTY_GOAL_STACK, goalstate );
CNSTI4 529
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 598
;598:}
LABELV $201
endproc trap_BotEmptyGoalStack 0 8
export trap_BotDumpAvoidGoals
proc trap_BotDumpAvoidGoals 0 8
line 600
;599:
;600:void trap_BotDumpAvoidGoals(int goalstate) {
line 601
;601:	syscall( BOTLIB_AI_DUMP_AVOID_GOALS, goalstate );
CNSTI4 530
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 602
;602:}
LABELV $202
endproc trap_BotDumpAvoidGoals 0 8
export trap_BotDumpGoalStack
proc trap_BotDumpGoalStack 0 8
line 604
;603:
;604:void trap_BotDumpGoalStack(int goalstate) {
line 605
;605:	syscall( BOTLIB_AI_DUMP_GOAL_STACK, goalstate );
CNSTI4 531
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 606
;606:}
LABELV $203
endproc trap_BotDumpGoalStack 0 8
export trap_BotGoalName
proc trap_BotGoalName 0 16
line 608
;607:
;608:void trap_BotGoalName(int number, char *name, int size) {
line 609
;609:	syscall( BOTLIB_AI_GOAL_NAME, number, name, size );
CNSTI4 532
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 610
;610:}
LABELV $204
endproc trap_BotGoalName 0 16
export trap_BotGetTopGoal
proc trap_BotGetTopGoal 4 12
line 612
;611:
;612:int trap_BotGetTopGoal(int goalstate, void /* struct bot_goal_s */ *goal) {
line 613
;613:	return syscall( BOTLIB_AI_GET_TOP_GOAL, goalstate, goal );
CNSTI4 533
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $205
endproc trap_BotGetTopGoal 4 12
export trap_BotGetSecondGoal
proc trap_BotGetSecondGoal 4 12
line 616
;614:}
;615:
;616:int trap_BotGetSecondGoal(int goalstate, void /* struct bot_goal_s */ *goal) {
line 617
;617:	return syscall( BOTLIB_AI_GET_SECOND_GOAL, goalstate, goal );
CNSTI4 534
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $206
endproc trap_BotGetSecondGoal 4 12
export trap_BotChooseLTGItem
proc trap_BotChooseLTGItem 4 20
line 620
;618:}
;619:
;620:int trap_BotChooseLTGItem(int goalstate, vec3_t origin, int *inventory, int travelflags) {
line 621
;621:	return syscall( BOTLIB_AI_CHOOSE_LTG_ITEM, goalstate, origin, inventory, travelflags );
CNSTI4 535
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $207
endproc trap_BotChooseLTGItem 4 20
export trap_BotChooseNBGItem
proc trap_BotChooseNBGItem 8 28
line 624
;622:}
;623:
;624:int trap_BotChooseNBGItem(int goalstate, vec3_t origin, int *inventory, int travelflags, void /* struct bot_goal_s */ *ltg, float maxtime) {
line 625
;625:	return syscall( BOTLIB_AI_CHOOSE_NBG_ITEM, goalstate, origin, inventory, travelflags, ltg, PASSFLOAT(maxtime) );
ADDRFP4 20
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 536
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $208
endproc trap_BotChooseNBGItem 8 28
export trap_BotTouchingGoal
proc trap_BotTouchingGoal 4 12
line 628
;626:}
;627:
;628:int trap_BotTouchingGoal(vec3_t origin, void /* struct bot_goal_s */ *goal) {
line 629
;629:	return syscall( BOTLIB_AI_TOUCHING_GOAL, origin, goal );
CNSTI4 537
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $209
endproc trap_BotTouchingGoal 4 12
export trap_BotItemGoalInVisButNotVisible
proc trap_BotItemGoalInVisButNotVisible 4 20
line 632
;630:}
;631:
;632:int trap_BotItemGoalInVisButNotVisible(int viewer, vec3_t eye, vec3_t viewangles, void /* struct bot_goal_s */ *goal) {
line 633
;633:	return syscall( BOTLIB_AI_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE, viewer, eye, viewangles, goal );
CNSTI4 538
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $210
endproc trap_BotItemGoalInVisButNotVisible 4 20
export trap_BotGetLevelItemGoal
proc trap_BotGetLevelItemGoal 4 16
line 636
;634:}
;635:
;636:int trap_BotGetLevelItemGoal(int index, char *classname, void /* struct bot_goal_s */ *goal) {
line 637
;637:	return syscall( BOTLIB_AI_GET_LEVEL_ITEM_GOAL, index, classname, goal );
CNSTI4 539
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $211
endproc trap_BotGetLevelItemGoal 4 16
export trap_BotGetNextCampSpotGoal
proc trap_BotGetNextCampSpotGoal 4 12
line 640
;638:}
;639:
;640:int trap_BotGetNextCampSpotGoal(int num, void /* struct bot_goal_s */ *goal) {
line 641
;641:	return syscall( BOTLIB_AI_GET_NEXT_CAMP_SPOT_GOAL, num, goal );
CNSTI4 567
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $212
endproc trap_BotGetNextCampSpotGoal 4 12
export trap_BotGetMapLocationGoal
proc trap_BotGetMapLocationGoal 4 12
line 644
;642:}
;643:
;644:int trap_BotGetMapLocationGoal(char *name, void /* struct bot_goal_s */ *goal) {
line 645
;645:	return syscall( BOTLIB_AI_GET_MAP_LOCATION_GOAL, name, goal );
CNSTI4 568
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $213
endproc trap_BotGetMapLocationGoal 4 12
export trap_BotAvoidGoalTime
proc trap_BotAvoidGoalTime 8 12
line 648
;646:}
;647:
;648:float trap_BotAvoidGoalTime(int goalstate, int number) {
line 650
;649:	int temp;
;650:	temp = syscall( BOTLIB_AI_AVOID_GOAL_TIME, goalstate, number );
CNSTI4 540
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 651
;651:	return (*(float*)&temp);
ADDRLP4 0
INDIRF4
RETF4
LABELV $214
endproc trap_BotAvoidGoalTime 8 12
export trap_BotSetAvoidGoalTime
proc trap_BotSetAvoidGoalTime 4 16
line 654
;652:}
;653:
;654:void trap_BotSetAvoidGoalTime(int goalstate, int number, float avoidtime) {
line 655
;655:	syscall( BOTLIB_AI_SET_AVOID_GOAL_TIME, goalstate, number, PASSFLOAT(avoidtime));
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 573
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 656
;656:}
LABELV $215
endproc trap_BotSetAvoidGoalTime 4 16
export trap_BotInitLevelItems
proc trap_BotInitLevelItems 0 4
line 658
;657:
;658:void trap_BotInitLevelItems(void) {
line 659
;659:	syscall( BOTLIB_AI_INIT_LEVEL_ITEMS );
CNSTI4 541
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 660
;660:}
LABELV $216
endproc trap_BotInitLevelItems 0 4
export trap_BotUpdateEntityItems
proc trap_BotUpdateEntityItems 0 4
line 662
;661:
;662:void trap_BotUpdateEntityItems(void) {
line 663
;663:	syscall( BOTLIB_AI_UPDATE_ENTITY_ITEMS );
CNSTI4 542
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 664
;664:}
LABELV $217
endproc trap_BotUpdateEntityItems 0 4
export trap_BotLoadItemWeights
proc trap_BotLoadItemWeights 4 12
line 666
;665:
;666:int trap_BotLoadItemWeights(int goalstate, char *filename) {
line 667
;667:	return syscall( BOTLIB_AI_LOAD_ITEM_WEIGHTS, goalstate, filename );
CNSTI4 543
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $218
endproc trap_BotLoadItemWeights 4 12
export trap_BotFreeItemWeights
proc trap_BotFreeItemWeights 0 8
line 670
;668:}
;669:
;670:void trap_BotFreeItemWeights(int goalstate) {
line 671
;671:	syscall( BOTLIB_AI_FREE_ITEM_WEIGHTS, goalstate );
CNSTI4 544
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 672
;672:}
LABELV $219
endproc trap_BotFreeItemWeights 0 8
export trap_BotInterbreedGoalFuzzyLogic
proc trap_BotInterbreedGoalFuzzyLogic 0 16
line 674
;673:
;674:void trap_BotInterbreedGoalFuzzyLogic(int parent1, int parent2, int child) {
line 675
;675:	syscall( BOTLIB_AI_INTERBREED_GOAL_FUZZY_LOGIC, parent1, parent2, child );
CNSTI4 565
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 676
;676:}
LABELV $220
endproc trap_BotInterbreedGoalFuzzyLogic 0 16
export trap_BotSaveGoalFuzzyLogic
proc trap_BotSaveGoalFuzzyLogic 0 12
line 678
;677:
;678:void trap_BotSaveGoalFuzzyLogic(int goalstate, char *filename) {
line 679
;679:	syscall( BOTLIB_AI_SAVE_GOAL_FUZZY_LOGIC, goalstate, filename );
CNSTI4 545
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 680
;680:}
LABELV $221
endproc trap_BotSaveGoalFuzzyLogic 0 12
export trap_BotMutateGoalFuzzyLogic
proc trap_BotMutateGoalFuzzyLogic 0 12
line 682
;681:
;682:void trap_BotMutateGoalFuzzyLogic(int goalstate, float range) {
line 683
;683:	syscall( BOTLIB_AI_MUTATE_GOAL_FUZZY_LOGIC, goalstate, range );
CNSTI4 566
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 684
;684:}
LABELV $222
endproc trap_BotMutateGoalFuzzyLogic 0 12
export trap_BotAllocGoalState
proc trap_BotAllocGoalState 4 8
line 686
;685:
;686:int trap_BotAllocGoalState(int state) {
line 687
;687:	return syscall( BOTLIB_AI_ALLOC_GOAL_STATE, state );
CNSTI4 546
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $223
endproc trap_BotAllocGoalState 4 8
export trap_BotFreeGoalState
proc trap_BotFreeGoalState 0 8
line 690
;688:}
;689:
;690:void trap_BotFreeGoalState(int handle) {
line 691
;691:	syscall( BOTLIB_AI_FREE_GOAL_STATE, handle );
CNSTI4 547
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 692
;692:}
LABELV $224
endproc trap_BotFreeGoalState 0 8
export trap_BotResetMoveState
proc trap_BotResetMoveState 0 8
line 694
;693:
;694:void trap_BotResetMoveState(int movestate) {
line 695
;695:	syscall( BOTLIB_AI_RESET_MOVE_STATE, movestate );
CNSTI4 548
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 696
;696:}
LABELV $225
endproc trap_BotResetMoveState 0 8
export trap_BotAddAvoidSpot
proc trap_BotAddAvoidSpot 4 20
line 698
;697:
;698:void trap_BotAddAvoidSpot(int movestate, vec3_t origin, float radius, int type) {
line 699
;699:	syscall( BOTLIB_AI_ADD_AVOID_SPOT, movestate, origin, PASSFLOAT(radius), type);
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 574
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 700
;700:}
LABELV $226
endproc trap_BotAddAvoidSpot 4 20
export trap_BotMoveToGoal
proc trap_BotMoveToGoal 0 20
line 702
;701:
;702:void trap_BotMoveToGoal(void /* struct bot_moveresult_s */ *result, int movestate, void /* struct bot_goal_s */ *goal, int travelflags) {
line 703
;703:	syscall( BOTLIB_AI_MOVE_TO_GOAL, result, movestate, goal, travelflags );
CNSTI4 549
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 704
;704:}
LABELV $227
endproc trap_BotMoveToGoal 0 20
export trap_BotMoveInDirection
proc trap_BotMoveInDirection 8 20
line 706
;705:
;706:int trap_BotMoveInDirection(int movestate, vec3_t dir, float speed, int type) {
line 707
;707:	return syscall( BOTLIB_AI_MOVE_IN_DIRECTION, movestate, dir, PASSFLOAT(speed), type );
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 550
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $228
endproc trap_BotMoveInDirection 8 20
export trap_BotResetAvoidReach
proc trap_BotResetAvoidReach 0 8
line 710
;708:}
;709:
;710:void trap_BotResetAvoidReach(int movestate) {
line 711
;711:	syscall( BOTLIB_AI_RESET_AVOID_REACH, movestate );
CNSTI4 551
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 712
;712:}
LABELV $229
endproc trap_BotResetAvoidReach 0 8
export trap_BotResetLastAvoidReach
proc trap_BotResetLastAvoidReach 0 8
line 714
;713:
;714:void trap_BotResetLastAvoidReach(int movestate) {
line 715
;715:	syscall( BOTLIB_AI_RESET_LAST_AVOID_REACH,movestate  );
CNSTI4 552
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 716
;716:}
LABELV $230
endproc trap_BotResetLastAvoidReach 0 8
export trap_BotReachabilityArea
proc trap_BotReachabilityArea 4 12
line 718
;717:
;718:int trap_BotReachabilityArea(vec3_t origin, int testground) {
line 719
;719:	return syscall( BOTLIB_AI_REACHABILITY_AREA, origin, testground );
CNSTI4 553
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $231
endproc trap_BotReachabilityArea 4 12
export trap_BotMovementViewTarget
proc trap_BotMovementViewTarget 8 24
line 722
;720:}
;721:
;722:int trap_BotMovementViewTarget(int movestate, void /* struct bot_goal_s */ *goal, int travelflags, float lookahead, vec3_t target) {
line 723
;723:	return syscall( BOTLIB_AI_MOVEMENT_VIEW_TARGET, movestate, goal, travelflags, PASSFLOAT(lookahead), target );
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 PASSFLOAT
CALLI4
ASGNI4
CNSTI4 554
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $232
endproc trap_BotMovementViewTarget 8 24
export trap_BotPredictVisiblePosition
proc trap_BotPredictVisiblePosition 4 24
line 726
;724:}
;725:
;726:int trap_BotPredictVisiblePosition(vec3_t origin, int areanum, void /* struct bot_goal_s */ *goal, int travelflags, vec3_t target) {
line 727
;727:	return syscall( BOTLIB_AI_PREDICT_VISIBLE_POSITION, origin, areanum, goal, travelflags, target );
CNSTI4 572
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $233
endproc trap_BotPredictVisiblePosition 4 24
export trap_BotAllocMoveState
proc trap_BotAllocMoveState 4 4
line 730
;728:}
;729:
;730:int trap_BotAllocMoveState(void) {
line 731
;731:	return syscall( BOTLIB_AI_ALLOC_MOVE_STATE );
CNSTI4 555
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $234
endproc trap_BotAllocMoveState 4 4
export trap_BotFreeMoveState
proc trap_BotFreeMoveState 0 8
line 734
;732:}
;733:
;734:void trap_BotFreeMoveState(int handle) {
line 735
;735:	syscall( BOTLIB_AI_FREE_MOVE_STATE, handle );
CNSTI4 556
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 736
;736:}
LABELV $235
endproc trap_BotFreeMoveState 0 8
export trap_BotInitMoveState
proc trap_BotInitMoveState 0 12
line 738
;737:
;738:void trap_BotInitMoveState(int handle, void /* struct bot_initmove_s */ *initmove) {
line 739
;739:	syscall( BOTLIB_AI_INIT_MOVE_STATE, handle, initmove );
CNSTI4 557
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 740
;740:}
LABELV $236
endproc trap_BotInitMoveState 0 12
export trap_BotChooseBestFightWeapon
proc trap_BotChooseBestFightWeapon 4 12
line 742
;741:
;742:int trap_BotChooseBestFightWeapon(int weaponstate, int *inventory) {
line 743
;743:	return syscall( BOTLIB_AI_CHOOSE_BEST_FIGHT_WEAPON, weaponstate, inventory );
CNSTI4 558
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $237
endproc trap_BotChooseBestFightWeapon 4 12
export trap_BotGetWeaponInfo
proc trap_BotGetWeaponInfo 0 16
line 746
;744:}
;745:
;746:void trap_BotGetWeaponInfo(int weaponstate, int weapon, void /* struct weaponinfo_s */ *weaponinfo) {
line 747
;747:	syscall( BOTLIB_AI_GET_WEAPON_INFO, weaponstate, weapon, weaponinfo );
CNSTI4 559
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 748
;748:}
LABELV $238
endproc trap_BotGetWeaponInfo 0 16
export trap_BotLoadWeaponWeights
proc trap_BotLoadWeaponWeights 4 12
line 750
;749:
;750:int trap_BotLoadWeaponWeights(int weaponstate, char *filename) {
line 751
;751:	return syscall( BOTLIB_AI_LOAD_WEAPON_WEIGHTS, weaponstate, filename );
CNSTI4 560
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $239
endproc trap_BotLoadWeaponWeights 4 12
export trap_BotAllocWeaponState
proc trap_BotAllocWeaponState 4 4
line 754
;752:}
;753:
;754:int trap_BotAllocWeaponState(void) {
line 755
;755:	return syscall( BOTLIB_AI_ALLOC_WEAPON_STATE );
CNSTI4 561
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $240
endproc trap_BotAllocWeaponState 4 4
export trap_BotFreeWeaponState
proc trap_BotFreeWeaponState 0 8
line 758
;756:}
;757:
;758:void trap_BotFreeWeaponState(int weaponstate) {
line 759
;759:	syscall( BOTLIB_AI_FREE_WEAPON_STATE, weaponstate );
CNSTI4 562
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 760
;760:}
LABELV $241
endproc trap_BotFreeWeaponState 0 8
export trap_BotResetWeaponState
proc trap_BotResetWeaponState 0 8
line 762
;761:
;762:void trap_BotResetWeaponState(int weaponstate) {
line 763
;763:	syscall( BOTLIB_AI_RESET_WEAPON_STATE, weaponstate );
CNSTI4 563
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 syscall
INDIRP4
CALLI4
pop
line 764
;764:}
LABELV $242
endproc trap_BotResetWeaponState 0 8
export trap_GeneticParentsAndChildSelection
proc trap_GeneticParentsAndChildSelection 4 24
line 766
;765:
;766:int trap_GeneticParentsAndChildSelection(int numranks, float *ranks, int *parent1, int *parent2, int *child) {
line 767
;767:	return syscall( BOTLIB_AI_GENETIC_PARENTS_AND_CHILD_SELECTION, numranks, ranks, parent1, parent2, child );
CNSTI4 564
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $243
endproc trap_GeneticParentsAndChildSelection 4 24
export trap_PC_LoadSource
proc trap_PC_LoadSource 4 8
line 770
;768:}
;769:
;770:int trap_PC_LoadSource( const char *filename ) {
line 771
;771:	return syscall( BOTLIB_PC_LOAD_SOURCE, filename );
CNSTI4 578
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $244
endproc trap_PC_LoadSource 4 8
export trap_PC_FreeSource
proc trap_PC_FreeSource 4 8
line 774
;772:}
;773:
;774:int trap_PC_FreeSource( int handle ) {
line 775
;775:	return syscall( BOTLIB_PC_FREE_SOURCE, handle );
CNSTI4 579
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $245
endproc trap_PC_FreeSource 4 8
export trap_PC_ReadToken
proc trap_PC_ReadToken 4 12
line 778
;776:}
;777:
;778:int trap_PC_ReadToken( int handle, pc_token_t *pc_token ) {
line 779
;779:	return syscall( BOTLIB_PC_READ_TOKEN, handle, pc_token );
CNSTI4 580
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $246
endproc trap_PC_ReadToken 4 12
export trap_PC_SourceFileAndLine
proc trap_PC_SourceFileAndLine 4 16
line 782
;780:}
;781:
;782:int trap_PC_SourceFileAndLine( int handle, char *filename, int *line ) {
line 783
;783:	return syscall( BOTLIB_PC_SOURCE_FILE_AND_LINE, handle, filename, line );
CNSTI4 581
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 syscall
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $247
endproc trap_PC_SourceFileAndLine 4 16
import CheckPlayerPostions
import G_SendCommandToClient
import visible
import findradius
import trap_Cvar_VariableValue
import trap_Args
import trep_debug
import g_RegenAmmo
import g_RegenHealth
import g_AutoChangeMap
import g_lastmap2
import g_lastmap
import g_randommap
import g_mapfile
import g_ReverseCTF
import g_GuassRate
import g_GuassSelfDamage
import g_GuassKnockBack
import g_GuassJump
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
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
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
LABELV $80
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $79
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 83
byte 1 101
byte 1 110
byte 1 100
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 40
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 41
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 49
byte 1 48
byte 1 50
byte 1 50
byte 1 46
byte 1 10
byte 1 0
