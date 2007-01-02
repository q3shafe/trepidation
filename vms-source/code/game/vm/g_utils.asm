data
export remapCount
align 4
LABELV remapCount
byte 4 0
export AddRemap
code
proc AddRemap 8 8
file "../g_utils.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_utils.c -- misc utility functions for game module
;4:
;5:#include "g_local.h"
;6:
;7:typedef struct {
;8:  char oldShader[MAX_QPATH];
;9:  char newShader[MAX_QPATH];
;10:  float timeOffset;
;11:} shaderRemap_t;
;12:
;13:#define MAX_SHADER_REMAPS 128
;14:
;15:int remapCount = 0;
;16:shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];
;17:
;18:void AddRemap(const char *oldShader, const char *newShader, float timeOffset) {
line 21
;19:	int i;
;20:
;21:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $60
JUMPV
LABELV $57
line 22
;22:		if (Q_stricmp(oldShader, remappedShaders[i].oldShader) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $61
line 24
;23:			// found it, just update this one
;24:			strcpy(remappedShaders[i].newShader,newShader);
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 25
;25:			remappedShaders[i].timeOffset = timeOffset;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 26
;26:			return;
ADDRGP4 $56
JUMPV
LABELV $61
line 28
;27:		}
;28:	}
LABELV $58
line 21
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $60
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $57
line 29
;29:	if (remapCount < MAX_SHADER_REMAPS) {
ADDRGP4 remapCount
INDIRI4
CNSTI4 128
GEI4 $65
line 30
;30:		strcpy(remappedShaders[remapCount].newShader,newShader);
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 31
;31:		strcpy(remappedShaders[remapCount].oldShader,oldShader);
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 32
;32:		remappedShaders[remapCount].timeOffset = timeOffset;
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 33
;33:		remapCount++;
ADDRLP4 4
ADDRGP4 remapCount
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 34
;34:	}
LABELV $65
line 35
;35:}
LABELV $56
endproc AddRemap 8 8
bss
align 1
LABELV $70
skip 4096
export BuildShaderStateConfig
code
proc BuildShaderStateConfig 144 24
line 37
;36:
;37:const char *BuildShaderStateConfig() {
line 42
;38:	static char	buff[MAX_STRING_CHARS*4];
;39:	char out[(MAX_QPATH * 2) + 5];
;40:	int i;
;41:  
;42:	memset(buff, 0, MAX_STRING_CHARS);
ADDRGP4 $70
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 43
;43:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $71
line 44
;44:		Com_sprintf(out, (MAX_QPATH * 2) + 5, "%s=%s:%5.2f@", remappedShaders[i].oldShader, remappedShaders[i].newShader, remappedShaders[i].timeOffset);
ADDRLP4 4
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 $75
ARGP4
ADDRLP4 140
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+128
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 45
;45:		Q_strcat( buff, sizeof( buff ), out);
ADDRGP4 $70
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 46
;46:	}
LABELV $72
line 43
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $74
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $71
line 47
;47:	return buff;
ADDRGP4 $70
RETP4
LABELV $69
endproc BuildShaderStateConfig 144 24
export findradius
proc findradius 28 4
line 55
;48:}
;49:
;50:
;51:
;52:// Shafe - Trep - Find Radius
;53://
;54:gentity_t *findradius (gentity_t *from, vec3_t org, float rad)
;55:{
line 59
;56:	vec3_t	eorg;
;57:	int		j;
;58:
;59:	if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $79
line 60
;60:		from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $84
JUMPV
LABELV $79
line 62
;61:	else
;62:		from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
ASGNP4
line 64
;63:
;64:	for (; from < &g_entities[level.num_entities]; from++)
ADDRGP4 $84
JUMPV
LABELV $81
line 65
;65:	{
line 66
;66:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $86
line 67
;67:			continue;
ADDRGP4 $82
JUMPV
LABELV $86
line 68
;68:		for (j=0; j<3; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $88
line 69
;69:			eorg[j] = org[j] - (from->r.currentOrigin[j] + (from->r.mins[j] + from->r.maxs[j])*0.5);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 444
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 456
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
SUBF4
ASGNF4
LABELV $89
line 68
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $88
line 70
;70:		if (VectorLength(eorg) > rad)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $92
line 71
;71:			continue;
ADDRGP4 $82
JUMPV
LABELV $92
line 72
;72:		return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $78
JUMPV
LABELV $82
line 64
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
ASGNP4
LABELV $84
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 916
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $81
line 75
;73:	}
;74:
;75:	return NULL;
CNSTP4 0
RETP4
LABELV $78
endproc findradius 28 4
export visible
proc visible 68 28
line 80
;76:}
;77:
;78:// Shafe - Trep - Visible Function
;79://
;80:qboolean visible( gentity_t *ent1, gentity_t *ent2 ) {
line 83
;81:	trace_t         trace;
;82:
;83:	trap_Trace (&trace, ent1->s.pos.trBase, NULL, NULL, ent2->s.pos.trBase, ent1->s.number, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 24
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
INDIRI4
ARGI4
CNSTI4 100664321
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 85
;84:
;85:	if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 0+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $95
line 86
;86:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $94
JUMPV
LABELV $95
line 89
;87:	}
;88:
;89:	return qtrue;
CNSTI4 1
RETI4
LABELV $94
endproc visible 68 28
export G_FindConfigstringIndex
proc G_FindConfigstringIndex 1036 12
line 106
;90:}
;91:
;92:/*
;93:=========================================================================
;94:
;95:model / sound configstring indexes
;96:
;97:=========================================================================
;98:*/
;99:
;100:/*
;101:================
;102:G_FindConfigstringIndex
;103:
;104:================
;105:*/
;106:int G_FindConfigstringIndex( char *name, int start, int max, qboolean create ) {
line 110
;107:	int		i;
;108:	char	s[MAX_STRING_CHARS];
;109:
;110:	if ( !name || !name[0] ) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $101
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $99
LABELV $101
line 111
;111:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 114
;112:	}
;113:
;114:	for ( i=1 ; i<max ; i++ ) {
ADDRLP4 1024
CNSTI4 1
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 115
;115:		trap_GetConfigstring( start + i, s, sizeof( s ) );
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 116
;116:		if ( !s[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $106
line 117
;117:			break;
ADDRGP4 $104
JUMPV
LABELV $106
line 119
;118:		}
;119:		if ( !strcmp( s, name ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $108
line 120
;120:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $98
JUMPV
LABELV $108
line 122
;121:		}
;122:	}
LABELV $103
line 114
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $102
LABELV $104
line 124
;123:
;124:	if ( !create ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $110
line 125
;125:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $98
JUMPV
LABELV $110
line 128
;126:	}
;127:
;128:	if ( i == max ) {
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $112
line 129
;129:		G_Error( "G_FindConfigstringIndex: overflow" );
ADDRGP4 $114
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 130
;130:	}
LABELV $112
line 132
;131:
;132:	trap_SetConfigstring( start + i, name );
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 134
;133:
;134:	return i;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $98
endproc G_FindConfigstringIndex 1036 12
export G_ModelIndex
proc G_ModelIndex 4 16
line 138
;135:}
;136:
;137:
;138:int G_ModelIndex( char *name ) {
line 139
;139:	return G_FindConfigstringIndex (name, CS_MODELS, MAX_MODELS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $115
endproc G_ModelIndex 4 16
export G_SoundIndex
proc G_SoundIndex 4 16
line 142
;140:}
;141:
;142:int G_SoundIndex( char *name ) {
line 143
;143:	return G_FindConfigstringIndex (name, CS_SOUNDS, MAX_SOUNDS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 288
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $116
endproc G_SoundIndex 4 16
export G_TeamCommand
proc G_TeamCommand 8 8
line 156
;144:}
;145:
;146://=====================================================================
;147:
;148:
;149:/*
;150:================
;151:G_TeamCommand
;152:
;153:Broadcasts a command to only a specific team
;154:================
;155:*/
;156:void G_TeamCommand( team_t team, char *cmd ) {
line 159
;157:	int		i;
;158:
;159:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 160
;160:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 3456
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $123
line 161
;161:			if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 3456
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 2552
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $125
line 162
;162:				trap_SendServerCommand( i, va("%s", cmd ));
ADDRGP4 $127
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 163
;163:			}
LABELV $125
line 164
;164:		}
LABELV $123
line 165
;165:	}
LABELV $119
line 159
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $121
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $118
line 166
;166:}
LABELV $117
endproc G_TeamCommand 8 8
export G_Find
proc G_Find 8 8
line 182
;167:
;168:
;169:/*
;170:=============
;171:G_Find
;172:
;173:Searches all active entities for the next one that holds
;174:the matching string at fieldofs (use the FOFS() macro) in the structure.
;175:
;176:Searches beginning at the entity after from, or the beginning if NULL
;177:NULL will be returned if the end of the list is reached.
;178:
;179:=============
;180:*/
;181:gentity_t *G_Find (gentity_t *from, int fieldofs, const char *match)
;182:{
line 185
;183:	char	*s;
;184:
;185:	if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $129
line 186
;186:		from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $134
JUMPV
LABELV $129
line 188
;187:	else
;188:		from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
ASGNP4
line 190
;189:
;190:	for ( ; from < &g_entities[level.num_entities] ; from++)
ADDRGP4 $134
JUMPV
LABELV $131
line 191
;191:	{
line 192
;192:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $136
line 193
;193:			continue;
ADDRGP4 $132
JUMPV
LABELV $136
line 194
;194:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 195
;195:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $138
line 196
;196:			continue;
ADDRGP4 $132
JUMPV
LABELV $138
line 197
;197:		if (!Q_stricmp (s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $140
line 198
;198:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $128
JUMPV
LABELV $140
line 199
;199:	}
LABELV $132
line 190
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 916
ADDP4
ASGNP4
LABELV $134
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 916
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $131
line 201
;200:
;201:	return NULL;
CNSTP4 0
RETP4
LABELV $128
endproc G_Find 8 8
export G_PickTarget
proc G_PickTarget 144 12
line 215
;202:}
;203:
;204:
;205:/*
;206:=============
;207:G_PickTarget
;208:
;209:Selects a random entity from among the targets
;210:=============
;211:*/
;212:#define MAXCHOICES	32
;213:
;214:gentity_t *G_PickTarget (char *targetname)
;215:{
line 216
;216:	gentity_t	*ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 217
;217:	int		num_choices = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 220
;218:	gentity_t	*choice[MAXCHOICES];
;219:
;220:	if (!targetname)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $147
line 221
;221:	{
line 222
;222:		G_Printf("G_PickTarget called with NULL targetname\n");
ADDRGP4 $145
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 223
;223:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $142
JUMPV
LABELV $146
line 227
;224:	}
;225:
;226:	while(1)
;227:	{
line 228
;228:		ent = G_Find (ent, FOFS(targetname), targetname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 660
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 229
;229:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $149
line 230
;230:			break;
ADDRGP4 $148
JUMPV
LABELV $149
line 231
;231:		choice[num_choices++] = ent;
ADDRLP4 140
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 232
;232:		if (num_choices == MAXCHOICES)
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $151
line 233
;233:			break;
ADDRGP4 $148
JUMPV
LABELV $151
line 234
;234:	}
LABELV $147
line 226
ADDRGP4 $146
JUMPV
LABELV $148
line 236
;235:
;236:	if (!num_choices)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $153
line 237
;237:	{
line 238
;238:		G_Printf("G_PickTarget: target %s not found\n", targetname);
ADDRGP4 $155
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 239
;239:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $142
JUMPV
LABELV $153
line 242
;240:	}
;241:
;242:	return choice[rand() % num_choices];
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $142
endproc G_PickTarget 144 12
export G_UseTargets
proc G_UseTargets 24 12
line 257
;243:}
;244:
;245:
;246:/*
;247:==============================
;248:G_UseTargets
;249:
;250:"activator" should be set to the entity that initiated the firing.
;251:
;252:Search for (string)targetname in all entities that
;253:match (string)self.target and call their .use function
;254:
;255:==============================
;256:*/
;257:void G_UseTargets( gentity_t *ent, gentity_t *activator ) {
line 260
;258:	gentity_t		*t;
;259:	
;260:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 261
;261:		return;
ADDRGP4 $156
JUMPV
LABELV $157
line 264
;262:	}
;263:
;264:	if (ent->targetShaderName && ent->targetShaderNewName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $159
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $159
line 265
;265:		float f = level.time * 0.001;
ADDRLP4 12
CNSTF4 981668463
ADDRGP4 level+32
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 266
;266:		AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 672
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 267
;267:		trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 20
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 268
;268:	}
LABELV $159
line 270
;269:
;270:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $162
line 271
;271:		return;
ADDRGP4 $156
JUMPV
LABELV $162
line 274
;272:	}
;273:
;274:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $165
JUMPV
LABELV $164
line 275
;275:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 276
;276:		if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $167
line 277
;277:			G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $169
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 278
;278:		} else {
ADDRGP4 $168
JUMPV
LABELV $167
line 279
;279:			if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
line 280
;280:				t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRP4
CALLV
pop
line 281
;281:			}
LABELV $170
line 282
;282:		}
LABELV $168
line 283
;283:		if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $172
line 284
;284:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $174
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 285
;285:			return;
ADDRGP4 $156
JUMPV
LABELV $172
line 287
;286:		}
;287:	}
LABELV $165
line 275
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 660
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
line 288
;288:}
LABELV $156
endproc G_UseTargets 24 12
bss
align 4
LABELV $176
skip 4
align 4
LABELV $177
skip 96
export tv
code
proc tv 8 0
line 299
;289:
;290:
;291:/*
;292:=============
;293:TempVector
;294:
;295:This is just a convenience function
;296:for making temporary vectors for function calls
;297:=============
;298:*/
;299:float	*tv( float x, float y, float z ) {
line 306
;300:	static	int		index;
;301:	static	vec3_t	vecs[8];
;302:	float	*v;
;303:
;304:	// use an array so that multiple tempvectors won't collide
;305:	// for a while
;306:	v = vecs[index];
ADDRLP4 0
CNSTI4 12
ADDRGP4 $176
INDIRI4
MULI4
ADDRGP4 $177
ADDP4
ASGNP4
line 307
;307:	index = (index + 1)&7;
ADDRLP4 4
ADDRGP4 $176
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 309
;308:
;309:	v[0] = x;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRF4
ASGNF4
line 310
;310:	v[1] = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 311
;311:	v[2] = z;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 313
;312:
;313:	return v;
ADDRLP4 0
INDIRP4
RETP4
LABELV $175
endproc tv 8 0
bss
align 4
LABELV $179
skip 4
align 1
LABELV $180
skip 256
export vtos
code
proc vtos 12 24
line 325
;314:}
;315:
;316:
;317:/*
;318:=============
;319:VectorToString
;320:
;321:This is just a convenience function
;322:for printing vectors
;323:=============
;324:*/
;325:char	*vtos( const vec3_t v ) {
line 331
;326:	static	int		index;
;327:	static	char	str[8][32];
;328:	char	*s;
;329:
;330:	// use an array so that multiple vtos won't collide
;331:	s = str[index];
ADDRLP4 0
ADDRGP4 $179
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 $180
ADDP4
ASGNP4
line 332
;332:	index = (index + 1)&7;
ADDRLP4 4
ADDRGP4 $179
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 334
;333:
;334:	Com_sprintf (s, 32, "(%i %i %i)", (int)v[0], (int)v[1], (int)v[2]);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $181
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 336
;335:
;336:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $178
endproc vtos 12 24
data
align 4
LABELV $183
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV $184
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $185
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV $186
byte 4 0
byte 4 0
byte 4 3212836864
export G_SetMovedir
code
proc G_SetMovedir 16 16
line 350
;337:}
;338:
;339:
;340:/*
;341:===============
;342:G_SetMovedir
;343:
;344:The editor only specifies a single value for angles (yaw),
;345:but we have special constants to generate an up or down direction.
;346:Angles will be cleared, because it is being used to represent a direction
;347:instead of an orientation.
;348:===============
;349:*/
;350:void G_SetMovedir( vec3_t angles, vec3_t movedir ) {
line 356
;351:	static vec3_t VEC_UP		= {0, -1, 0};
;352:	static vec3_t MOVEDIR_UP	= {0, 0, 1};
;353:	static vec3_t VEC_DOWN		= {0, -2, 0};
;354:	static vec3_t MOVEDIR_DOWN	= {0, 0, -1};
;355:
;356:	if ( VectorCompare (angles, VEC_UP) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $187
line 357
;357:		VectorCopy (MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $184
INDIRB
ASGNB 12
line 358
;358:	} else if ( VectorCompare (angles, VEC_DOWN) ) {
ADDRGP4 $188
JUMPV
LABELV $187
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $185
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $189
line 359
;359:		VectorCopy (MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $186
INDIRB
ASGNB 12
line 360
;360:	} else {
ADDRGP4 $190
JUMPV
LABELV $189
line 361
;361:		AngleVectors (angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 362
;362:	}
LABELV $190
LABELV $188
line 363
;363:	VectorClear( angles );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 364
;364:}
LABELV $182
endproc G_SetMovedir 16 16
export vectoyaw
proc vectoyaw 20 8
line 367
;365:
;366:
;367:float vectoyaw( const vec3_t vec ) {
line 370
;368:	float	yaw;
;369:	
;370:	if (vec[YAW] == 0 && vec[PITCH] == 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $192
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $192
line 371
;371:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 372
;372:	} else {
ADDRGP4 $193
JUMPV
LABELV $192
line 373
;373:		if (vec[PITCH]) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $194
line 374
;374:			yaw = ( atan2( vec[YAW], vec[PITCH]) * 180 / M_PI );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 375
;375:		} else if (vec[YAW] > 0) {
ADDRGP4 $195
JUMPV
LABELV $194
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $196
line 376
;376:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 377
;377:		} else {
ADDRGP4 $197
JUMPV
LABELV $196
line 378
;378:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 379
;379:		}
LABELV $197
LABELV $195
line 380
;380:		if (yaw < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $198
line 381
;381:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 382
;382:		}
LABELV $198
line 383
;383:	}
LABELV $193
line 385
;384:
;385:	return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $191
endproc vectoyaw 20 8
export G_InitGentity
proc G_InitGentity 4 0
line 389
;386:}
;387:
;388:
;389:void G_InitGentity( gentity_t *e ) {
line 390
;390:	e->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 1
ASGNI4
line 391
;391:	e->classname = "noclass";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $201
ASGNP4
line 392
;392:	e->s.number = e - g_entities;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 916
DIVI4
ASGNI4
line 393
;393:	e->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1023
ASGNI4
line 394
;394:}
LABELV $200
endproc G_InitGentity 4 0
export G_Spawn
proc G_Spawn 16 20
line 411
;395:
;396:/*
;397:=================
;398:G_Spawn
;399:
;400:Either finds a free entity, or allocates a new one.
;401:
;402:  The slots from 0 to MAX_CLIENTS-1 are always reserved for clients, and will
;403:never be used by anything else.
;404:
;405:Try to avoid reusing an entity that was recently freed, because it
;406:can cause the client to think the entity morphed into something else
;407:instead of being removed and recreated, which can cause interpolated
;408:angles and bad trails.
;409:=================
;410:*/
;411:gentity_t *G_Spawn( void ) {
line 415
;412:	int			i, force;
;413:	gentity_t	*e;
;414:
;415:	e = NULL;	// shut up warning
ADDRLP4 0
CNSTP4 0
ASGNP4
line 416
;416:	i = 0;		// shut up warning
ADDRLP4 4
CNSTI4 0
ASGNI4
line 417
;417:	for ( force = 0 ; force < 2 ; force++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $203
line 420
;418:		// if we go through all entities and can't find one to free,
;419:		// override the normal minimum times before use
;420:		e = &g_entities[MAX_CLIENTS];
ADDRLP4 0
ADDRGP4 g_entities+58624
ASGNP4
line 421
;421:		for ( i = MAX_CLIENTS ; i<level.num_entities ; i++, e++) {
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $208
line 422
;422:			if ( e->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $213
line 423
;423:				continue;
ADDRGP4 $209
JUMPV
LABELV $213
line 428
;424:			}
;425:
;426:			// the first couple seconds of server time can involve a lot of
;427:			// freeing and allocating, so relax the replacement policy
;428:			if ( !force && e->freetime > level.startTime + 2000 && level.time - e->freetime < 1000 ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $215
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 level+40
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $215
ADDRGP4 level+32
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $215
line 429
;429:				continue;
ADDRGP4 $209
JUMPV
LABELV $215
line 433
;430:			}
;431:
;432:			// reuse this slot
;433:			G_InitGentity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 434
;434:			return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $202
JUMPV
LABELV $209
line 421
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 916
ADDP4
ASGNP4
LABELV $211
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $208
line 436
;435:		}
;436:		if ( i != MAX_GENTITIES ) {
ADDRLP4 4
INDIRI4
CNSTI4 1024
EQI4 $219
line 437
;437:			break;
ADDRGP4 $205
JUMPV
LABELV $219
line 439
;438:		}
;439:	}
LABELV $204
line 417
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $203
LABELV $205
line 440
;440:	if ( i == ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4
INDIRI4
CNSTI4 1022
NEI4 $221
line 441
;441:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $223
line 442
;442:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 916
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+532
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 443
;443:		}
LABELV $224
line 441
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $223
line 444
;444:		G_Error( "G_Spawn: no free entities" );
ADDRGP4 $229
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 445
;445:	}
LABELV $221
line 448
;446:	
;447:	// open up a new slot
;448:	level.num_entities++;
ADDRLP4 12
ADDRGP4 level+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 451
;449:
;450:	// let the server system know that there are more entities
;451:	trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 916
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 3456
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 454
;452:		&level.clients[0].ps, sizeof( level.clients[0] ) );
;453:
;454:	G_InitGentity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 455
;455:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $202
endproc G_Spawn 16 20
export G_EntitiesFree
proc G_EntitiesFree 8 0
line 463
;456:}
;457:
;458:/*
;459:=================
;460:G_EntitiesFree
;461:=================
;462:*/
;463:qboolean G_EntitiesFree( void ) {
line 467
;464:	int			i;
;465:	gentity_t	*e;
;466:
;467:	e = &g_entities[MAX_CLIENTS];
ADDRLP4 4
ADDRGP4 g_entities+58624
ASGNP4
line 468
;468:	for ( i = MAX_CLIENTS; i < level.num_entities; i++, e++) {
ADDRLP4 0
CNSTI4 64
ASGNI4
ADDRGP4 $238
JUMPV
LABELV $235
line 469
;469:		if ( e->inuse ) {
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $240
line 470
;470:			continue;
ADDRGP4 $236
JUMPV
LABELV $240
line 473
;471:		}
;472:		// slot available
;473:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $233
JUMPV
LABELV $236
line 468
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 916
ADDP4
ASGNP4
LABELV $238
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $235
line 475
;474:	}
;475:	return qfalse;
CNSTI4 0
RETI4
LABELV $233
endproc G_EntitiesFree 8 0
export G_FreeEntity
proc G_FreeEntity 0 12
line 486
;476:}
;477:
;478:
;479:/*
;480:=================
;481:G_FreeEntity
;482:
;483:Marks the entity as free
;484:=================
;485:*/
;486:void G_FreeEntity( gentity_t *ed ) {
line 487
;487:	trap_UnlinkEntity (ed);		// unlink from world
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 489
;488:
;489:	if ( ed->neverFree ) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $243
line 490
;490:		return;
ADDRGP4 $242
JUMPV
LABELV $243
line 493
;491:	}
;492:
;493:	memset (ed, 0, sizeof(*ed));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 916
ARGI4
ADDRGP4 memset
CALLP4
pop
line 494
;494:	ed->classname = "freed";
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $245
ASGNP4
line 495
;495:	ed->freetime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 496
;496:	ed->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
CNSTI4 0
ASGNI4
line 497
;497:}
LABELV $242
endproc G_FreeEntity 0 12
export G_TempEntity
proc G_TempEntity 32 8
line 508
;498:
;499:/*
;500:=================
;501:G_TempEntity
;502:
;503:Spawns an event entity that will be auto-removed
;504:The origin will be snapped to save net bandwidth, so care
;505:must be taken if the origin is right on a surface (snap towards start vector first)
;506:=================
;507:*/
;508:gentity_t *G_TempEntity( vec3_t origin, int event ) {
line 512
;509:	gentity_t		*e;
;510:	vec3_t		snapped;
;511:
;512:	e = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 513
;513:	e->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 14
ADDI4
ASGNI4
line 515
;514:
;515:	e->classname = "tempEntity";
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRGP4 $248
ASGNP4
line 516
;516:	e->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 517
;517:	e->freeAfterEvent = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 519
;518:
;519:	VectorCopy( origin, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 520
;520:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 tonextint
CALLF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28
INDIRF4
ASGNF4
line 521
;521:	G_SetOrigin( e, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 524
;522:
;523:	// find cluster for PVS
;524:	trap_LinkEntity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 526
;525:
;526:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $247
endproc G_TempEntity 32 8
export G_KillBox
proc G_KillBox 4168 32
line 547
;527:}
;528:
;529:
;530:
;531:/*
;532:==============================================================================
;533:
;534:Kill box
;535:
;536:==============================================================================
;537:*/
;538:
;539:/*
;540:=================
;541:G_KillBox
;542:
;543:Kills all entities that would touch the proposed new positioning
;544:of ent.  Ent should be unlinked before calling this!
;545:=================
;546:*/
;547:void G_KillBox (gentity_t *ent) {
line 553
;548:	int			i, num;
;549:	int			touch[MAX_GENTITIES];
;550:	gentity_t	*hit;
;551:	vec3_t		mins, maxs;
;552:
;553:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
ADDRLP4 4132
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108+8
ADDRLP4 4140
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4140
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
line 554
;554:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4148
ADDRLP4 4144
INDIRP4
CNSTI4 524
ADDP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 460
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120+8
ADDRLP4 4152
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4152
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDF4
ASGNF4
line 555
;555:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4156
INDIRI4
ASGNI4
line 557
;556:
;557:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $262
JUMPV
LABELV $259
line 558
;558:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 916
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 559
;559:		if ( !hit->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $263
line 560
;560:			continue;
ADDRGP4 $260
JUMPV
LABELV $263
line 564
;561:		}
;562:
;563:		// nail it
;564:		G_Damage ( hit, ent, ent, NULL, NULL,
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
CNSTP4 0
ASGNP4
ADDRLP4 4164
INDIRP4
ARGP4
ADDRLP4 4164
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 566
;565:			100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
;566:	}
LABELV $260
line 557
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $262
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $259
line 568
;567:
;568:}
LABELV $254
endproc G_KillBox 4168 32
export G_AddPredictableEvent
proc G_AddPredictableEvent 0 12
line 581
;569:
;570://==============================================================================
;571:
;572:/*
;573:===============
;574:G_AddPredictableEvent
;575:
;576:Use for non-pmove events that would also be predicted on the
;577:client side: jumppads and item pickups
;578:Adds an event+parm and twiddles the event counter
;579:===============
;580:*/
;581:void G_AddPredictableEvent( gentity_t *ent, int event, int eventParm ) {
line 582
;582:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $266
line 583
;583:		return;
ADDRGP4 $265
JUMPV
LABELV $266
line 585
;584:	}
;585:	BG_AddPredictableEventToPlayerstate( event, eventParm, &ent->client->ps );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 586
;586:}
LABELV $265
endproc G_AddPredictableEvent 0 12
export G_AddEvent
proc G_AddEvent 4 8
line 596
;587:
;588:
;589:/*
;590:===============
;591:G_AddEvent
;592:
;593:Adds an event+parm and twiddles the event counter
;594:===============
;595:*/
;596:void G_AddEvent( gentity_t *ent, int event, int eventParm ) {
line 599
;597:	int		bits;
;598:
;599:	if ( !event ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $269
line 600
;600:		G_Printf( "G_AddEvent: zero event added for entity %i\n", ent->s.number );
ADDRGP4 $271
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 601
;601:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 605
;602:	}
;603:
;604:	// clients need to add the event in playerState_t instead of entityState_t
;605:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $272
line 606
;606:		bits = ent->client->ps.externalEvent & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 607
;607:		bits = ( bits + EV_EVENT_BIT1 ) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 608
;608:		ent->client->ps.externalEvent = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 609
;609:		ent->client->ps.externalEventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 610
;610:		ent->client->ps.externalEventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 611
;611:	} else {
ADDRGP4 $273
JUMPV
LABELV $272
line 612
;612:		bits = ent->s.event & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 613
;613:		bits = ( bits + EV_EVENT_BIT1 ) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 614
;614:		ent->s.event = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 615
;615:		ent->s.eventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 616
;616:	}
LABELV $273
line 617
;617:	ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 618
;618:}
LABELV $268
endproc G_AddEvent 4 8
export G_Sound
proc G_Sound 8 8
line 626
;619:
;620:
;621:/*
;622:=============
;623:G_Sound
;624:=============
;625:*/
;626:void G_Sound( gentity_t *ent, int channel, int soundIndex ) {
line 629
;627:	gentity_t	*te;
;628:
;629:	te = G_TempEntity( ent->r.currentOrigin, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 630
;630:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 631
;631:}
LABELV $276
endproc G_Sound 8 8
export G_SetOrigin
proc G_SetOrigin 8 0
line 644
;632:
;633:
;634://==============================================================================
;635:
;636:
;637:/*
;638:================
;639:G_SetOrigin
;640:
;641:Sets the pos trajectory for a fixed position
;642:================
;643:*/
;644:void G_SetOrigin( gentity_t *ent, vec3_t origin ) {
line 645
;645:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 646
;646:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 647
;647:	ent->s.pos.trTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 648
;648:	ent->s.pos.trDuration = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 649
;649:	VectorClear( ent->s.pos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 651
;650:
;651:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 652
;652:}
LABELV $277
endproc G_SetOrigin 8 0
lit
align 4
LABELV $279
byte 4 0
byte 4 0
byte 4 1065353216
export DebugLine
code
proc DebugLine 116 12
line 662
;653:
;654:/*
;655:================
;656:DebugLine
;657:
;658:  debug polygons only work when running a local game
;659:  with r_debugSurface set to 2
;660:================
;661:*/
;662:int DebugLine(vec3_t start, vec3_t end, int color) {
line 663
;663:	vec3_t points[4], dir, cross, up = {0, 0, 1};
ADDRLP4 72
ADDRGP4 $279
INDIRB
ASGNB 12
line 666
;664:	float dot;
;665:
;666:	VectorCopy(start, points[0]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 667
;667:	VectorCopy(start, points[1]);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 669
;668:	//points[1][2] -= 2;
;669:	VectorCopy(end, points[2]);
ADDRLP4 0+24
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 671
;670:	//points[2][2] -= 2;
;671:	VectorCopy(end, points[3]);
ADDRLP4 0+36
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 674
;672:
;673:
;674:	VectorSubtract(end, start, dir);
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96
CNSTI4 4
ASGNI4
ADDRLP4 60+4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 8
ASGNI4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 675
;675:	VectorNormalize(dir);
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 676
;676:	dot = DotProduct(dir, up);
ADDRLP4 84
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
MULF4
ADDF4
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 677
;677:	if (dot > 0.99 || dot < -0.99) VectorSet(cross, 1, 0, 0);
ADDRLP4 84
INDIRF4
CNSTF4 1065185444
GTF4 $291
ADDRLP4 84
INDIRF4
CNSTF4 3212669092
GEF4 $289
LABELV $291
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 48+4
CNSTF4 0
ASGNF4
ADDRLP4 48+8
CNSTF4 0
ASGNF4
ADDRGP4 $290
JUMPV
LABELV $289
line 678
;678:	else CrossProduct(dir, up, cross);
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
LABELV $290
line 680
;679:
;680:	VectorNormalize(cross);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 682
;681:
;682:	VectorMA(points[0], 2, cross, points[0]);
ADDRLP4 108
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 683
;683:	VectorMA(points[1], -2, cross, points[1]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 684
;684:	VectorMA(points[2], -2, cross, points[2]);
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 685
;685:	VectorMA(points[3], 2, cross, points[3]);
ADDRLP4 0+36
ADDRLP4 0+36
INDIRF4
CNSTF4 1073741824
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+4
ADDRLP4 0+36+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+8
ADDRLP4 0+36+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 687
;686:
;687:	return trap_DebugPolygonCreate(color, 4, points);
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 112
ADDRGP4 trap_DebugPolygonCreate
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
RETI4
LABELV $278
endproc DebugLine 116 12
bss
export remappedShaders
align 4
LABELV remappedShaders
skip 16896
import CheckPlayerPostions
import G_SendCommandToClient
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
import trap_Cvar_VariableValue
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
import g_PCTeamkills
import g_GrappleMode
import g_Turrets
import g_StartBFG
import g_StartPlasma
import g_StartGauss
import g_StartFlame
import g_StartSingCan
import g_StartGrenade
import g_StartSG
import g_StartMG
import g_StartGauntlet
import g_MultiJumps
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
import G_TouchSolids
import G_TouchTriggers
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
LABELV $271
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $248
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $245
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $229
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $227
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $201
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $181
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $174
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $169
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $155
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
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
byte 1 10
byte 1 0
align 1
LABELV $145
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $127
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $75
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 58
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 64
byte 1 0
